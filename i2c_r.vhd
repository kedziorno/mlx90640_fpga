----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:55 12/06/2022 
-- Design Name: 
-- Module Name:    i2c_r - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.p_package1_constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- MLX90641 16x12 IR array
-- REVISION 3 - DECEMBER 9, 2019
-- 3901090641
-- page11 10.2.1.4. I2C command format

entity i2c_r is
generic (
	constant g_board_frequency : natural := GLOBAL_BOARD_FREQUENCY;
	constant g_i2c_frequency : natural := GLOBAL_I2C_FREQUENCY;
	constant zero : natural := 0
);
port (
	i_clock : in std_logic;
	i_reset : in std_logic;
	i_sda : in std_logic;
	i_scl : in std_logic;
	o_i2c_address : out std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
	o_i2c_address_rw : out std_logic;
	o_i2c_address_ack : out std_logic;
	o_i2c_data : out std_logic_vector(I2C_DATA_BITS - 1 downto 0);
	o_i2c_data_ack : out std_logic;
	o_done_data : out std_logic;
	o_done_address : out std_logic;
	o_sta : out std_logic;
	o_sto : out std_logic;
	o_counter_enable : out std_logic
);
end entity i2c_r;

architecture Behavioral of i2c_r is
	signal psda1,pscl1 : std_logic;
	signal sta_condition,sto_condition : std_logic;
	signal scl_ping : std_logic;
	signal s_sda_data_index : natural range 0 to I2C_BITS_LENGTH - 1;
	signal s_sda_data_register : std_logic_vector(I2C_BITS_LENGTH - 1 downto 0);
	signal done_data : std_logic;
	signal done_address : std_logic;
	type states is (a,b);
	signal s_state_p4_c,s_state_p4_n : states;
	signal counter_enable,counter_enable_internal : std_logic;
	signal s_state_p6_c,s_state_p6_n : states;
	signal s_sda_data_first_flag,s_sda_data_first_flag_internal : std_logic;
begin

o_sta <= sta_condition;
o_sto <= sto_condition;
o_counter_enable <= counter_enable;

o_done_data <= done_data;
o_done_address <= done_address;

sta_condition <= '1' when ((psda1 = '1') and (i_sda = '0')) and ((pscl1 = '1') and (i_scl = '1')) else '0';
sto_condition <= '1' when ((psda1 = '0') and (i_sda = '1')) and ((pscl1 = '1') and (i_scl = '1')) else '0';

p1 : process (i_clock,i_reset) is
	constant I2C_PERIOD : natural := I2C_STRETCH;
	constant I2C_HALF_PERIOD : natural := I2C_PERIOD / 2;
	variable i2c_half_period_index : natural range 0 to I2C_HALF_PERIOD - 1;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			i2c_half_period_index := 0;
			scl_ping <= '0'; -- xxx begining for phase 0/1
		else
			if (i2c_half_period_index = I2C_HALF_PERIOD - 1) then
				i2c_half_period_index := 0;
				scl_ping <= not scl_ping;
			else
				i2c_half_period_index := i2c_half_period_index + 1;
				scl_ping <= scl_ping;
			end if;
		end if;
	end if;
end process p1;

p2 : process (i_clock,i_reset) is
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			psda1 <= '1';
			pscl1 <= '1';
		else
			psda1 <= i_sda;
			pscl1 <= i_scl;
		end if;
	end if;
end process p2;

p3 : process (scl_ping,i_reset) is
begin
	if (rising_edge(scl_ping)) then
		if (i_reset = '1') then
			s_sda_data_index <= 0;
		else
			if (counter_enable = '1') then
				if (s_sda_data_index = I2C_BITS_LENGTH - 1) then
					s_sda_data_index <= 0;
				else
					s_sda_data_index <= s_sda_data_index + 1;
				end if;
			else
				s_sda_data_index <= 0;
			end if;
		end if;
	end if;
end process p3;

p4_sync_proc : process (i_clock,i_reset) is
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			s_state_p4_c <= a;
			counter_enable <= '0';
		else
			s_state_p4_c <= s_state_p4_n;
			counter_enable <= counter_enable_internal;
		end if;
	end if;
end process p4_sync_proc;

p4_output_decode : process (s_state_p4_c) is
begin
	if s_state_p4_c = a then
		counter_enable_internal <= '0';
	else
		counter_enable_internal <= '1';
	end if;
	if s_state_p4_c = b then
		counter_enable_internal <= '1';
	else
		counter_enable_internal <= '0';
	end if;
end process p4_output_decode;

p4_next_state_decode : process (s_state_p4_c,sta_condition,sto_condition) is
begin
	s_state_p4_n <= s_state_p4_c;
	case (s_state_p4_c) is
		when a =>
			if (sta_condition = '1' and sto_condition = '0') then
				s_state_p4_n <= b;
			end if;
		when b =>
			if (sta_condition = '0' and sto_condition = '1') then
				s_state_p4_n <= a;
			end if;
		when others =>
			s_state_p4_n <= a;
	end case;
end process p4_next_state_decode;

p5 : process (scl_ping,i_reset) is
begin
	if (rising_edge(scl_ping)) then
		if (i_reset = '1') then
			s_sda_data_register <= (others => '0');
		else
			if (counter_enable = '1') then
				case (s_sda_data_index) is
					when 0 =>
						s_sda_data_register(0) <= i_sda;
					when 1 =>
						s_sda_data_register(1) <= i_sda;
					when 2 =>
						s_sda_data_register(2) <= i_sda;
					when 3 =>
						s_sda_data_register(3) <= i_sda;
					when 4 =>
						s_sda_data_register(4) <= i_sda;
					when 5 =>
						s_sda_data_register(5) <= i_sda;
					when 6 =>
						s_sda_data_register(6) <= i_sda;
					when 7 =>
						s_sda_data_register(7) <= i_sda;
					when 8 =>
						s_sda_data_register(8) <= i_sda;
				end case;
			else
				s_sda_data_register <= (others => '0');
			end if;
		end if;
	end if;
end process p5;

p6_sync_proc : process (scl_ping,i_reset) is
begin
	if (rising_edge(scl_ping)) then
		if (i_reset = '1') then
			s_state_p6_c <= a;
			s_sda_data_first_flag <= '0';
		else
			s_state_p6_c <= s_state_p6_n;
			s_sda_data_first_flag <= s_sda_data_first_flag_internal;
		end if;
	end if;
end process p6_sync_proc;

p6_output_decode : process (s_state_p6_c) is
begin
	if (s_state_p6_c = a) then
		s_sda_data_first_flag_internal <= '1';
	else
		s_sda_data_first_flag_internal <= '0';
	end if;
	if (s_state_p6_c = b) then
		s_sda_data_first_flag_internal <= '0';
	else
		s_sda_data_first_flag_internal <= '1';
	end if;
end process p6_output_decode;

p6_next_state_decode : process (s_state_p6_c,s_sda_data_index,sta_condition,sto_condition) is
begin
	s_state_p6_n <= s_state_p6_c;
	case (s_state_p6_c) is
		when a =>
			if (s_sda_data_index = I2C_BITS_LENGTH - 1) then
				s_state_p6_n <= b;
			end if;
		when b =>
			if (sta_condition = '0' and sto_condition = '1') then
				s_state_p6_n <= a;
			end if;
		when others =>
			s_state_p6_n <= a;
	end case;
end process p6_next_state_decode;

p7 : process (i_clock,i_reset) is
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			done_address <= '0';
		else
			if (counter_enable = '1') then
				if (s_sda_data_index = 0 and s_sda_data_first_flag = '1') then
					done_address <= '1';
				else
					done_address <= '0';
				end if;
			else
				done_address <= '0';
			end if;
		end if;
	end if;
end process p7;

p8 : process (i_clock,i_reset) is
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			done_data <= '0';
		else
			if (counter_enable = '1') then
				if (s_sda_data_index = 0 and s_sda_data_first_flag = '0') then
					done_data <= '1';
				else
					done_data <= '0';
				end if;
			else
				done_data <= '0';
			end if;
		end if;
	end if;
end process p8;

p9 : process (i_clock,i_reset) is
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			o_i2c_address <= (others => '0');
			o_i2c_address_rw <= '0';
			o_i2c_address_ack <= '0';
		else
			if (s_sda_data_first_flag = '1') then
				o_i2c_address(0) <= s_sda_data_register(6);
				o_i2c_address(1) <= s_sda_data_register(5);
				o_i2c_address(2) <= s_sda_data_register(4);
				o_i2c_address(3) <= s_sda_data_register(3);
				o_i2c_address(4) <= s_sda_data_register(2);
				o_i2c_address(5) <= s_sda_data_register(1);
				o_i2c_address(6) <= s_sda_data_register(0);
				o_i2c_address_rw <= s_sda_data_register(7);
				o_i2c_address_ack <= s_sda_data_register(8);
			else
				o_i2c_address <= (others => '0');
				o_i2c_address_rw <= '0';
				o_i2c_address_ack <= '0';
			end if;
		end if;
	end if;
end process p9;

p10 : process (i_clock,i_reset) is
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			o_i2c_data <= (others => '0');
			o_i2c_data_ack <= '0';
		else
			if (s_sda_data_first_flag = '0') then
				o_i2c_data(0) <= s_sda_data_register(7);
				o_i2c_data(1) <= s_sda_data_register(6);
				o_i2c_data(2) <= s_sda_data_register(5);
				o_i2c_data(3) <= s_sda_data_register(4);
				o_i2c_data(4) <= s_sda_data_register(3);
				o_i2c_data(5) <= s_sda_data_register(2);
				o_i2c_data(6) <= s_sda_data_register(1);
				o_i2c_data(7) <= s_sda_data_register(0);
				o_i2c_data_ack <= s_sda_data_register(8);
			else
				o_i2c_data <= (others => '0');
				o_i2c_data_ack <= '0';
			end if;
		end if;
	end if;
end process p10;

end architecture Behavioral;
