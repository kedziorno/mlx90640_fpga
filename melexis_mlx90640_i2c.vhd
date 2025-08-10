----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:35 08/09/2025
-- Design Name: 
-- Module Name:    melexis_mlx90640_i2c - rtl
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created, fork from my_i2c module (10:40:17 08/03/2025)
-- Revision 0.02 - Reimplement to melexis_mlx90640_i2c module, R&W ok with long period idle
-- Revision 0.03 - melexis_mlx90640_i2c module, with 3 modes and ready flags
--
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.global_package.all;

entity melexis_mlx90640_i2c is
generic (
  c_board_clock : integer := c_clock_board_frequency;
  c_bus_clock : integer := c_clock_i2c_frequency
);
port (
  i_clock : in std_logic;
  i_reset : in std_logic;
  i_slave_address : in std_logic_vector (c_i2c_address_bits - 1 downto 0);
  i_mode0 : in std_logic; -- W(A)/4b(A)
  i_mode1 : in std_logic; -- W(A)/2b(A),ST,R(A)/2b(NA)
  i_mode2 : in std_logic; -- W(A)/2b(A),ST,R(A)/2*N(NA)
  o_mode2_ready : out std_logic;
  o_mode2_ready_all : out std_logic;
  i_memory_address : in std_logic_vector (0 to 15);
  i_memory_data : in std_logic_vector (0 to 15);
  o_bytes_to_recv : out std_logic_vector (0 to 15);
  i_enable : in std_logic;
  o_busy : out std_logic;
  io_sda : inout std_logic;
  io_scl : inout std_logic
);
end entity melexis_mlx90640_i2c;

architecture rtl of melexis_mlx90640_i2c is
  type state is (
  idle,
-- i2c start
  start,
  sda_start,
-- mode0
  mode0_write_slave_address,
  mode0_write_slave_address_lastbit,
  mode0_write_slave_write,
  mode0_write_slave_ack,
  mode0_write_data1,
  mode0_write_data_lastbit1,
  mode0_write_data_ack1,
  mode0_write_data2,
  mode0_write_data_lastbit2,
  mode0_write_data_ack2,
  mode0_write_data3,
  mode0_write_data_lastbit3,
  mode0_write_data_ack3,
  mode0_write_data4,
  mode0_write_data_lastbit4,
  mode0_write_data_ack4,
-- mode1
  mode1_write_slave_address,
  mode1_write_slave_address_lastbit,
  mode1_write_slave_write,
  mode1_write_slave_ack,
  mode1_write_data1,
  mode1_write_data_lastbit1,
  mode1_write_data_ack1,
  mode1_write_data2,
  mode1_write_data_lastbit2,
  mode1_write_data_ack2,
  mode1_write_data_ack2_empty,
  mode1_read_start,
  mode1_read_sda_start,
  mode1_read_slave_address,
  mode1_read_slave_address_lastbit,
  mode1_read_slave_read,
  mode1_read_slave_ack,
  mode1_read_data1,
  mode1_read_data_lastbit1,
  mode1_read_data_ack,
  mode1_read_data2,
  mode1_read_data_lastbit2,
  mode1_read_data_nak,
  mode1_read_data_nak_empty,
-- mode2
state1,
  mode2_write_slave_address,
  mode2_write_slave_address_lastbit,
  mode2_write_slave_write,
  mode2_write_slave_ack,
  mode2_write_data1,
  mode2_write_data_lastbit1,
  mode2_write_data_ack1,
  mode2_write_data2,
  mode2_write_data_lastbit2,
  mode2_write_data_ack2,
  mode2_write_data_ack2_empty,
  mode2_read_start,
  mode2_read_sda_start,
  mode2_read_slave_address,
  mode2_read_slave_address_lastbit,
  mode2_read_slave_read,
  mode2_read_slave_ack,
  mode2_read_data1,
  mode2_read_data_lastbit1,
  mode2_read_data_ack1,
  mode2_read_data2,
  mode2_read_data_lastbit2,
  mode2_read_data_ack2,
  mode2_read_data_nak,
-- i2c stop
  sda_stop,
  stop
  );
  type clock_mode is (c0,c1,c2,c3);
  constant c_i2c_counter_max : integer := (c_board_clock / c_bus_clock / 4) / 4;
  signal c_state : state;
  signal c_cmode : clock_mode;
  signal slave_index_ctr : integer range c_i2c_address_bits - 1 downto 0;
  signal data_index_ctr, data_index_ctr1 : integer range 0 to c_i2c_data_bits - 1;
  signal bytes_to_recv_i : std_logic_vector (0 to 15);
  signal clock : std_logic;
  signal temp_sda : std_logic;
  signal temp_sck : std_logic;
  constant c_mode2_read_data_index : integer := 832;
  signal mode2_read_data_index_ctr : integer range 0 to c_mode2_read_data_index - 1;
begin
  o_bytes_to_recv <= bytes_to_recv_i;
  io_sda <= '0' when temp_sda = '0' else 'Z' when c_state = idle else temp_sda;
  io_scl <= 'Z' when (c_state = idle or c_state = start) else temp_sck;

  p_i2c_send_sequence_fsm : process (clock, i_reset) is
  begin
    if (i_reset = '1') then
      c_state <= idle;
      data_index_ctr <= 0;
      slave_index_ctr <= c_i2c_address_bits - 1;
      bytes_to_recv_i <= (others => '0');
      mode2_read_data_index_ctr <= 0;
      temp_sda <= 'Z';
      temp_sck <= 'Z';
      o_mode2_ready <= '0';
      o_mode2_ready_all <= '0';
    elsif (rising_edge (clock)) then
      case c_state is
        when idle =>
          temp_sda <= 'Z';
          temp_sck <= 'Z';
          if (c_cmode = c3) then -- XXX start from c0 clock state in next cycle
            c_state <= start;
            o_busy <= '1';
            data_index_ctr <= 0;
            slave_index_ctr <= c_i2c_address_bits - 1;
            bytes_to_recv_i <= (others => '0');
          end if;
        when start =>
          c_state <= sda_start;
          temp_sda <= 'Z';
        when sda_start =>
          if (i_mode0 = '1') then
            c_state <= mode0_write_slave_address;
          end if;
          if (i_mode1 = '1') then
            c_state <= mode1_write_slave_address;
          end if;
          if (i_mode2 = '1') then
            c_state <= mode2_write_slave_address;
          end if;
          temp_sda <= '0';
          slave_index_ctr <= c_i2c_address_bits - 1;
-- XXX mode0
        when mode0_write_slave_address =>
          if (slave_index_ctr = 0) then
            c_state <= mode0_write_slave_address_lastbit;
          else
            if (c_cmode = c3) then
              slave_index_ctr <= slave_index_ctr - 1;
              if (i_slave_address (slave_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode0_write_slave_address_lastbit =>
          if (c_cmode = c3) then
            c_state <= mode0_write_slave_write;
            if (i_slave_address (0) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode0_write_slave_write =>
          if (c_cmode = c3) then
            c_state <= mode0_write_slave_ack;
            temp_sda <= '0';
          end if;
        when mode0_write_slave_ack =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data1;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
        when mode0_write_data1 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode0_write_data_lastbit1;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_address (data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode0_write_data_lastbit1 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data_ack1;
            if (i_memory_address (7) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode0_write_data_ack1 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data2;
            data_index_ctr <= 0;
            temp_sda <= '0';
          end if;
        when mode0_write_data2 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode0_write_data_lastbit2;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_address (8 + data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode0_write_data_lastbit2 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data_ack2;
            if (i_memory_address (15) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode0_write_data_ack2 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data3;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
        when mode0_write_data3 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode0_write_data_lastbit3;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_data (data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode0_write_data_lastbit3 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data_ack3;
            if (i_memory_data (7) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode0_write_data_ack3 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data4;
            temp_sda <= '0';
          end if;
        when mode0_write_data4 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode0_write_data_lastbit4;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_data (8 + data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode0_write_data_lastbit4 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data_ack4;
            if (i_memory_data (15) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode0_write_data_ack4 =>
          if (c_cmode = c3) then
            c_state <= sda_stop;
            temp_sda <= '0';
          end if;
-- XXX mode1
        when mode1_write_slave_address =>
          if (slave_index_ctr = 0) then
            c_state <= mode1_write_slave_address_lastbit;
          else
            if (c_cmode = c3) then
              slave_index_ctr <= slave_index_ctr - 1;
              if (i_slave_address (slave_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode1_write_slave_address_lastbit =>
          if (c_cmode = c3) then
            c_state <= mode1_write_slave_write;
            if (i_slave_address (0) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode1_write_slave_write =>
          if (c_cmode = c3) then
            c_state <= mode1_write_slave_ack;
            temp_sda <= '0';
          end if;
        when mode1_write_slave_ack =>
          if (c_cmode = c3) then
            c_state <= mode1_write_data1;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
        when mode1_write_data1 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode1_write_data_lastbit1;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_address (data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode1_write_data_lastbit1 =>
          if (c_cmode = c3) then
            c_state <= mode1_write_data_ack1;
            if (i_memory_address (7) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode1_write_data_ack1 =>
          if (c_cmode = c3) then
            c_state <= mode1_write_data2;
            data_index_ctr <= 0;
            temp_sda <= '0';
          end if;
        when mode1_write_data2 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode1_write_data_lastbit2;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_address (8 + data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode1_write_data_lastbit2 =>
          if (c_cmode = c3) then
            c_state <= mode1_write_data_ack2;
            if (i_memory_address (15) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode1_write_data_ack2 =>
          if (c_cmode = c3) then
            c_state <= mode1_write_data_ack2_empty;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
        when mode1_write_data_ack2_empty =>
          if (c_cmode = c3) then
            c_state <= mode1_read_start;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
        when mode1_read_start =>
          c_state <= mode1_read_sda_start;
          temp_sda <= 'Z';
          slave_index_ctr <= c_i2c_address_bits - 1;
        when mode1_read_sda_start =>
          c_state <= mode1_read_slave_address;
          temp_sda <= '0';
        when mode1_read_slave_address =>
          if (slave_index_ctr = 0) then
            c_state <= mode1_read_slave_address_lastbit;
          else
            if (c_cmode = c3) then
              slave_index_ctr <= slave_index_ctr - 1;
              if (i_slave_address (slave_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode1_read_slave_address_lastbit =>
          if (c_cmode = c3) then
            c_state <= mode1_read_slave_read;
            if (i_slave_address (0) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode1_read_slave_read =>
          if (c_cmode = c3) then
            c_state <= mode1_read_slave_ack;
            temp_sda <= 'Z';
          end if;
        when mode1_read_slave_ack =>
          if (c_cmode = c3) then
            c_state <= mode1_read_data1;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
        when mode1_read_data1 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode1_read_data_lastbit1;
            bytes_to_recv_i (data_index_ctr1) <= io_sda;
            data_index_ctr <= 0;
          else
            if (c_cmode = c0) then
              bytes_to_recv_i (data_index_ctr1) <= io_sda;
            end if;
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              data_index_ctr1 <= data_index_ctr;
              temp_sda <= 'Z';
            end if;
          end if;
        when mode1_read_data_lastbit1 =>
          if (c_cmode = c3) then
            c_state <= mode1_read_data_ack;
          end if;
        when mode1_read_data_ack =>
          if (c_cmode = c0) then
            bytes_to_recv_i (data_index_ctr1 + 1) <= io_sda;
          end if;
          if (c_cmode = c3) then
            c_state <= mode1_read_data2;
            temp_sda <= '0';
          end if;
        when mode1_read_data2 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode1_read_data_lastbit2;
            bytes_to_recv_i (8 + data_index_ctr1) <= io_sda;
            data_index_ctr <= 0;
          else
            if (c_cmode = c0) then
              bytes_to_recv_i (8 + data_index_ctr1) <= io_sda;
            end if;
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              data_index_ctr1 <= data_index_ctr;
              temp_sda <= 'Z';
            end if;
          end if;
        when mode1_read_data_lastbit2 =>
          if (c_cmode = c3) then
            c_state <= mode1_read_data_nak;
          end if;
        when mode1_read_data_nak =>
          if (c_cmode = c0) then
            bytes_to_recv_i (8 + data_index_ctr1 + 1) <= io_sda;
          end if;
          if (c_cmode = c3) then
            c_state <= mode1_read_data_nak_empty;
            temp_sda <= 'Z';
          end if;
        when mode1_read_data_nak_empty =>
          if (c_cmode = c3) then
            c_state <= stop;
            temp_sda <= 'Z'; -- 'X';
          end if;
-- XXX mode2 i2c slave address write
        when mode2_write_slave_address =>
          if (slave_index_ctr = 0) then
            c_state <= mode2_write_slave_address_lastbit;
          else
            if (c_cmode = c3) then
              slave_index_ctr <= slave_index_ctr - 1;
              if (i_slave_address (slave_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode2_write_slave_address_lastbit =>
          if (c_cmode = c3) then
            c_state <= mode2_write_slave_write;
            if (i_slave_address (0) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode2_write_slave_write =>
          if (c_cmode = c3) then
            c_state <= mode2_write_slave_ack;
            temp_sda <= '0';
          end if;
        when mode2_write_slave_ack =>
          if (c_cmode = c3) then
            c_state <= mode2_write_data1;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
-- XXX mode2 i2c write data 2b
        when mode2_write_data1 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode2_write_data_lastbit1;
          else
            if (c_cmode = c3) then
              if (i_memory_address (data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
              data_index_ctr <= data_index_ctr + 1;
            end if;
          end if;
        when mode2_write_data_lastbit1 =>
          if (c_cmode = c3) then
            c_state <= mode2_write_data_ack1;
            if (i_memory_address (7) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode2_write_data_ack1 =>
          if (c_cmode = c3) then
            c_state <= mode2_write_data2;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
        when mode2_write_data2 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode2_write_data_lastbit2;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_address (8 + data_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode2_write_data_lastbit2 =>
          if (c_cmode = c3) then
            c_state <= mode2_write_data_ack2;
            if (i_memory_address (15) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode2_write_data_ack2 =>
          if (c_cmode = c3) then
            c_state <= mode2_write_data_ack2_empty;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
        when mode2_write_data_ack2_empty => -- XXX empty
          if (c_cmode = c3) then
            c_state <= mode2_read_start;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
-- XXX mode2 i2c start
        when mode2_read_start =>
--          if (c_cmode = c3) then
          c_state <= mode2_read_sda_start;
          temp_sda <= 'Z';
          slave_index_ctr <= c_i2c_address_bits - 1;
--          end if;
        when mode2_read_sda_start =>
--          if (c_cmode = c3) then
          c_state <= mode2_read_slave_address;
          temp_sda <= '0';
--          end if;
-- XXX mode2 i2c slave address read
        when mode2_read_slave_address =>
            if (c_cmode = c3) then
          if (slave_index_ctr = 0) then
            c_state <= mode2_read_slave_read; --mode2_read_slave_address_lastbit;
--            c_state <= mode2_read_slave_address_lastbit;
          else
              slave_index_ctr <= slave_index_ctr - 1;
              if (i_slave_address (slave_index_ctr) = '1') then
                temp_sda <= 'Z';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode2_read_slave_address_lastbit =>
          if (c_cmode = c3) then
            c_state <= mode2_read_slave_read;
            if (i_slave_address (0) = '1') then
              temp_sda <= 'Z';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode2_read_slave_read =>
          if (c_cmode = c3) then
            c_state <= mode2_read_slave_ack;
            temp_sda <= 'Z';
          end if;
        when mode2_read_slave_ack =>
          if (c_cmode = c3) then
--            c_state <= state1;
            c_state <= mode2_read_data1;
            temp_sda <= '0';
--            temp_sda <= 'Z'; -- ok 1st AA read
--            data_index_ctr <= 1;
            data_index_ctr <= 0;
          end if;
        when state1 =>
            if (c_cmode = c3) then
              c_state <= mode2_read_data1;
--              data_index_ctr <= data_index_ctr + 1;
              temp_sda <= 'Z';
            end if;
-- XXX mode2 i2c slave data read 1 - N
        when mode2_read_data1 =>
          if (c_cmode = c0) then
            o_mode2_ready <= '0';
            bytes_to_recv_i (data_index_ctr) <= io_sda;
          end if;
          if (c_cmode = c3) then
--            bytes_to_recv_i (data_index_ctr) <= io_sda;
            temp_sda <= 'Z';
            if (data_index_ctr = c_i2c_data_bits - 1) then
--              c_state <= mode2_read_data_lastbit1;
              c_state <= mode2_read_data_ack1;
              data_index_ctr <= 0;
            else
                        data_index_ctr <= data_index_ctr + 1;
            o_mode2_ready <= '0';

            end if;
          end if;
        when mode2_read_data_lastbit1 =>
          if (c_cmode = c3) then
            c_state <= mode2_read_data_ack1;
--            bytes_to_recv_i (7) <= io_sda;
            temp_sda <= '0';
          end if;
        when mode2_read_data_ack1 =>
          if (c_cmode = c3) then
            c_state <= mode2_read_data2;
--            temp_sda <= 'Z'; -- XXX ok read ffff, aa55, 55aa ...
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
-- XXX mode2 i2c slave data read 2 - N
        when mode2_read_data2 =>
--          if (c_cmode = c0) then
--            o_mode2_ready <= '0';
--            bytes_to_recv_i (8 + data_index_ctr) <= io_sda;
--            temp_sda <= 'Z';
--          end if;
          if (c_cmode = c3) then
                      temp_sda <= 'Z';

            bytes_to_recv_i (8 + data_index_ctr) <= io_sda;
            
            if (data_index_ctr = c_i2c_data_bits - 1) then
--              c_state <= mode2_read_data_lastbit2;
              c_state <= mode2_read_data_ack2;
                          data_index_ctr <= 0;

              else
            data_index_ctr <= data_index_ctr + 1;
                          o_mode2_ready <= '0';
            temp_sda <= 'Z';

            end if;
          end if;
        when mode2_read_data_lastbit2 =>
--          if (c_cmode = c0) then
--            c_state <= mode2_read_data_ack2;
--            bytes_to_recv_i (15) <= io_sda;
--            data_index_ctr <= 0;
--          end if;
        when mode2_read_data_ack2 =>
              
          if (c_cmode = c0) then
--            bytes_to_recv_i (8 + data_index_ctr1) <= io_sda;
          end if;
          if (c_cmode = c3) then
            if (mode2_read_data_index_ctr = c_mode2_read_data_index - 1) then
              c_state <= mode2_read_data_nak;
              mode2_read_data_index_ctr <= 0;
              o_mode2_ready_all <= '1';
            else
              c_state <= mode2_read_data1;
--              c_state <= state1;
              mode2_read_data_index_ctr <= mode2_read_data_index_ctr + 1;
              o_mode2_ready <= '1';
              data_index_ctr <= 0;
              temp_sda <= '0';
            end if;
          end if;
-- XXX mode2 i2c slave data read - end
        when mode2_read_data_nak =>
          if (c_cmode = c0) then
--            bytes_to_recv_i (8 + data_index_ctr1) <= io_sda;
            o_mode2_ready_all <= '0';
          end if;
          if (c_cmode = c3) then
            c_state <= stop;
            temp_sda <= 'Z';
          end if;
        when sda_stop =>
          if (c_cmode = c3) then
            c_state <= stop;
            temp_sda <= '0';
          end if;
        when stop =>
          if (c_cmode = c1) then
            c_state <= idle;
            temp_sda <= 'Z';
            o_busy <= '0';
          end if;
      end case;
    end if;
  end process p_i2c_send_sequence_fsm;

  p_i2c_clock_ctr : process (i_clock, i_reset) is
    variable count : integer range 0 to (c_i2c_counter_max * 4) - 1;
  begin
    if (i_reset = '1') then
      clock <= '0';
      count := 0;
    elsif (rising_edge (i_clock)) then
      if (count = (c_i2c_counter_max * 4) - 1) then
        clock <= '1';
--        clock <= not clock;
        count := 0;
      else
        clock <= '0';
        count := count + 1;
      end if;
    end if;
  end process p_i2c_clock_ctr;

  p_i2c_clock_generator_fsm : process (clock, i_reset) is
    type states is (a, b);
    variable state : states;
  begin
    if (i_reset = '1') then
      c_cmode <= c0;
    elsif (rising_edge (clock)) then
      case (state) is
        when a =>
          if (i_enable = '1') then
            state := b;
          end if;
        when b =>
          if (i_enable = '0') then
            state := a;
            c_cmode <= c0;
          else
            case c_cmode is
              when c0 =>
                c_cmode <= c1;
              when c1 =>
                c_cmode <= c2;
              when c2 =>
                c_cmode <= c3;
              when c3 =>
                c_cmode <= c0;
            end case;
          end if;
      end case;
    end if;
  end process p_i2c_clock_generator_fsm;

  p_i2c_scl_generator_com : process (c_cmode) is
  begin
    if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
      temp_sck <= '0';
    end if;
    if ((c_cmode = c1 or c_cmode = c2) and c_cmode /= c0 and c_cmode /= c3) then
      temp_sck <= 'Z';
    end if;
  end process p_i2c_scl_generator_com;

end architecture rtl;
