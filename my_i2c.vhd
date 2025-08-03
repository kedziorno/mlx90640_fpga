----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:31 08/21/2020 
-- Design Name: 
-- Module Name:    my_i2c - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.global_package.all;

entity my_i2c is
generic (
c_board_clock : integer := c_clock_board_frequency;
c_bus_clock : integer := c_clock_i2c_frequency
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_slave_address : in std_logic_vector (c_i2c_address_bits - 1 downto 0);
i_memory_address : in std_logic_vector (0 to 15);
i_memory_data : in std_logic_vector (0 to 15);
o_bytes_to_recv : out std_logic_vector (0 to 15);
i_rw : in std_logic;
i_enable : in std_logic;
o_busy : out std_logic;
io_sda : inout std_logic;
io_scl : inout std_logic
);
end entity my_i2c;

architecture rtl of my_i2c is
	constant c_i2c_counter_max : integer := (c_board_clock / c_bus_clock) / 4;

	signal clock : std_logic;
	signal temp_sda : std_logic;
	signal temp_sck : std_logic;

	type state is (idle,
  sda_start,
  start,
  slave_address,
  slave_address_lastbit,
  slave_rw,
  slave_ack,
  get_instruction,
  rw,
  read_data1,
  read_ack1,
  read_data2,
  read_ack2,
  write_data1,
  write_data_lastbit1,
  write_data_ack1,
  write_data2,
  write_data_lastbit2,
  write_data_ack2,
  write_data3,
  write_data_lastbit3,
  write_data_ack3,
  write_data4,
  write_data_lastbit4,
  write_data_ack4,
  stop,
  sda_stop);
	signal c_state,n_state : state;

	type clock_mode is (c0,c1,c2,c3);
	signal c_cmode, n_cmode : clock_mode;

	constant c_sda_width_max : integer := 2;
	signal slave_index_ctr : integer range c_i2c_address_bits - 1 downto 0;
	signal data_index_ctr : integer range 0 to c_i2c_data_bits - 1;
	signal sda_width_ctr : integer range c_sda_width_max - 1 downto 0;

  signal bytes_to_recv : std_logic_vector (0 to 15);

begin

  o_bytes_to_recv <= bytes_to_recv;

	p_i2c_clock : process (i_clock, i_reset) is
		variable count : integer range 0 to (c_i2c_counter_max * 4) - 1;
	begin
		if (i_reset = '1') then
			clock <= '0';
			count := 0;
		elsif (rising_edge (i_clock)) then
			if (count = (c_i2c_counter_max * 4) - 1) then
				clock <= '1';
				count := 0;
			else
				clock <= '0';
				count := count + 1;
			end if;
		end if;
	end process p_i2c_clock;

  p_i2c_clock_generator_fsm : process (clock, i_reset) is
  begin
    if (i_reset = '1') then
        n_cmode <= c0;
        c_cmode <= c0;
    elsif (rising_edge (clock)) then
        c_cmode <= n_cmode;
        case c_cmode is
          when c0 =>
            n_cmode <= c1;
          when c1 =>
            n_cmode <= c2;
          when c2 =>
            n_cmode <= c3;
          when c3 =>
            n_cmode <= c0;
      end case;
    end if;
  end process p_i2c_clock_generator_fsm;

	p_i2c_send_sequence_fsm : process (clock, i_reset) is
    variable i : integer range 0 to 7;
	begin
		if (i_reset = '1') then
      i := 0;
			n_state <= idle;
			o_busy <= '0';
			data_index_ctr <= 0;
			slave_index_ctr <= c_i2c_address_bits - 1;
			sda_width_ctr <= c_sda_width_max - 1;
			temp_sda <= 'Z';
			temp_sck <= '1';
      bytes_to_recv <= (others => '0');
		elsif (rising_edge(clock)) then
			c_state <= n_state;
			case c_state is
				when idle =>
					if (i_enable = '1') then
						n_state <= sda_start;
					else
						n_state <= idle;
					end if;
          data_index_ctr <= 0;
          slave_index_ctr <= c_i2c_address_bits - 1;
          sda_width_ctr <= c_sda_width_max - 1;
          temp_sda <= 'Z';
				when sda_start =>
					temp_sck <= '1';
					temp_sda <= 'Z';
					n_state <= start;
					o_busy <= '1';
				when start =>
					temp_sda <= '0';
					n_state <= slave_address;

				when slave_address =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c2 and slave_index_ctr = c_i2c_address_bits - 1) then
						temp_sda <= '0';
					end if;
					if (slave_index_ctr = 0) then
						n_state <= slave_address_lastbit;
						sda_width_ctr <= c_sda_width_max - 1;
					else
						if (c_cmode = c0) then
              if (i_slave_address (slave_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
							if (sda_width_ctr = 0) then
								slave_index_ctr <= slave_index_ctr - 1;
								sda_width_ctr <= c_sda_width_max - 1;
								n_state <= slave_address;
							else
								sda_width_ctr <= sda_width_ctr - 1;
								n_state <= slave_address;
							end if;
						end if;
					end if;
				when slave_address_lastbit =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_slave_address (0) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= slave_rw;
						else
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= slave_address_lastbit;
						end if;
					end if;
				when slave_rw =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
						temp_sda <= '0';
						if (sda_width_ctr = 0) then
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= slave_ack;
						else
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= slave_rw;
						end if;
					end if;
				when slave_ack =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_rw = '0') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= rw;
              data_index_ctr <= 0;
						else
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= slave_ack;
						end if;
					end if;

				when get_instruction =>
					if (i_enable = '1') then
						n_state <= write_data1;
						o_busy <= '0';
					else
						n_state <= stop;
					end if;

        when rw =>
          if (i_rw = '0') then
            n_state <= read_data1;
            i := 0;
          else
            n_state <= write_data1;
          end if;

        when read_data1 =>
					o_busy <= '1';
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
              if (sda_width_ctr = 0) then
								sda_width_ctr <= c_sda_width_max - 1;
								n_state <= read_data1;
                if (i = 7) then
                  n_state <= read_ack1;
                  i := 0;
                else
                  i := i + 1;
                  if (clock = '1') then
                    bytes_to_recv (i) <= io_sda;
                  end if;
                end if;
							else
								sda_width_ctr <= sda_width_ctr - 1;
								n_state <= read_data1;
							end if;
          end if;
        when read_ack1 =>
					o_busy <= '1';
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
						temp_sda <= '0';
						if (sda_width_ctr = 0) then
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= read_data2;
              data_index_ctr <= 0;
						else
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= read_ack1;
						end if;
          end if;

        when read_data2 =>
					o_busy <= '1';
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (sda_width_ctr = 0) then
              sda_width_ctr <= c_sda_width_max - 1;
              n_state <= read_data2;
              if (i = 7) then
                n_state <= read_ack2;
                i := 0;
              else
                i := i + 1;
                if (clock = '1') then
                  bytes_to_recv (8 + i) <= io_sda;
                end if;
              end if;
            else
              sda_width_ctr <= sda_width_ctr - 1;
              n_state <= read_data2;
            end if;
          end if;
        when read_ack2 =>
					o_busy <= '1';
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            temp_sda <= '0';
						if (sda_width_ctr = 0) then
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= sda_stop;
              data_index_ctr <= 0;
						else
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= read_ack2;
						end if;

          end if;

				when write_data1 =>
					o_busy <= '1';
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (data_index_ctr = c_i2c_data_bits - 1) then
						sda_width_ctr <= c_sda_width_max - 1;
						n_state <= write_data_lastbit1;
            sda_width_ctr <= c_sda_width_max - 1;
					else
						if (c_cmode = c0) then
              if (i_memory_address (data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
              if (sda_width_ctr = 0) then
								data_index_ctr <= data_index_ctr + 1;
								sda_width_ctr <= c_sda_width_max - 1;
								n_state <= write_data1;
							else
								sda_width_ctr <= sda_width_ctr - 1;
								n_state <= write_data1;
							end if;
						end if;
					end if;
				when write_data_lastbit1 =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_memory_address (7) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= write_data_lastbit1;
						else
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= write_data_ack1;
              data_index_ctr <= 0;
						end if;
					end if;
				when write_data_ack1 =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_rw = '0') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= write_data2;
							data_index_ctr <= 0;
						else
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= write_data_ack1;
						end if;
					end if;

				when write_data2 =>
					o_busy <= '1';
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (data_index_ctr = c_i2c_data_bits - 1) then
						sda_width_ctr <= c_sda_width_max - 1;
						n_state <= write_data_lastbit2;
            data_index_ctr <= 0;
					else
						if (c_cmode = c0) then
              if (i_memory_address (8 + data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
							if (sda_width_ctr = 0) then
								data_index_ctr <= data_index_ctr + 1;
								sda_width_ctr <= c_sda_width_max - 1;
								n_state <= write_data2;
							else
								sda_width_ctr <= sda_width_ctr - 1;
								n_state <= write_data2;
							end if;
						end if;
					end if;
				when write_data_lastbit2 =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_memory_address (15) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= write_data_lastbit2;
						else
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= write_data_ack2;
						end if;
					end if;
				when write_data_ack2 =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_rw = '0') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= write_data3;
							data_index_ctr <= 0;
						else
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= write_data_ack2;
						end if;
					end if;

        when write_data3 =>
					o_busy <= '1';
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (data_index_ctr = c_i2c_data_bits - 1) then
						sda_width_ctr <= c_sda_width_max - 1;
						n_state <= write_data_lastbit3;
            data_index_ctr <= 0;
					else
						if (c_cmode = c0) then
              if (i_memory_data (data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
							if (sda_width_ctr = 0) then
								data_index_ctr <= data_index_ctr + 1;
								sda_width_ctr <= c_sda_width_max - 1;
								n_state <= write_data3;
							else
								sda_width_ctr <= sda_width_ctr - 1;
								n_state <= write_data3;
							end if;
						end if;
					end if;
				when write_data_lastbit3 =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_memory_data (7) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= write_data_lastbit3;
						else
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= write_data_ack3;
						end if;
					end if;
				when write_data_ack3 =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_rw = '0') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= write_data4;
							data_index_ctr <= 0;
						else
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= write_data_ack3;
						end if;
					end if;

        when write_data4 =>
					o_busy <= '1';
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (data_index_ctr = c_i2c_data_bits - 1) then
						sda_width_ctr <= c_sda_width_max - 1;
						n_state <= write_data_lastbit4;
            data_index_ctr <= 0;
					else
						if (c_cmode = c0) then
              if (i_memory_data (8 + data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
							if (sda_width_ctr = 0) then
								data_index_ctr <= data_index_ctr + 1;
								sda_width_ctr <= c_sda_width_max - 1;
								n_state <= write_data4;
							else
								sda_width_ctr <= sda_width_ctr - 1;
								n_state <= write_data4;
							end if;
						end if;
					end if;
				when write_data_lastbit4 =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_memory_data (15) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= write_data_lastbit4;
						else
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= write_data_ack4;
						end if;
					end if;
				when write_data_ack4 =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_rw = '0') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= get_instruction;
							data_index_ctr <= 0;
						else
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= write_data_ack4;
						end if;
					end if;

				when stop =>
					if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
						temp_sck <= '0';
					end if;
					if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
						temp_sck <= '1';
					end if;
					if (c_cmode = c0) then
            if (i_rw = '0') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
						if (sda_width_ctr = 0) then
							sda_width_ctr <= c_sda_width_max - 1;
							n_state <= sda_stop;
						else
							sda_width_ctr <= sda_width_ctr - 1;
							n_state <= stop;
						end if;
					end if;
				when sda_stop =>
					temp_sck <= '1';
					temp_sda <= 'Z';
					data_index_ctr <= 0;
					slave_index_ctr <= c_i2c_address_bits - 1;
					sda_width_ctr <= c_sda_width_max - 1;
					o_busy <= '0';
					n_state <= idle;
			end case;
		end if;
	end process p_i2c_send_sequence_fsm;

	io_sda <= 'Z' when (c_state = read_data1 or c_state = read_data2) else temp_sda;
	io_scl <= 'Z' when temp_sck = '1' else '0' when temp_sck = '0';

end architecture rtl;
