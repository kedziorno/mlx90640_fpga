----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:55 12/06/2022 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
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
	o_done_address : out std_logic
);
end top;

architecture Behavioral of top is
	signal psda1,pscl1 : std_logic;
	signal sta_condition,sto_condition : std_logic;
	signal counter_enable : std_logic;
	signal scl_ping : std_logic;
	signal s_sda_data_index : natural range 0 to I2C_BITS_LENGTH - 1;
	signal s_sda_data_register : std_logic_vector(I2C_BITS_LENGTH - 1 downto 0);
	signal s_sda_data_first_flag : std_logic;
	signal done_data : std_logic;
	signal done_address : std_logic;
begin

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
			scl_ping <= '1';
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

p4 : process (scl_ping,i_reset) is
	type states is (a,b);
	variable v_state : states;
begin
	if (rising_edge(scl_ping)) then
		if (i_reset = '1') then
			counter_enable <= '0';
			v_state := a;
		else
			case (v_state) is
				when a =>
					if (sta_condition = '1' and sto_condition = '0') then
						v_state := b;
						counter_enable <= '1';
					else
						v_state := a;
						counter_enable <= '0';
					end if;
				when b =>
					if (sta_condition = '0' and sto_condition = '1') then
						v_state := a;
						counter_enable <= '0';
					else
						v_state := b;
						counter_enable <= '1';
					end if;
			end case;
		end if;
	end if;
end process p4;

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

p6 : process (scl_ping,i_reset) is
	type states is (a,b);
	variable v_state : states;
begin
	if (rising_edge(scl_ping)) then
		if (i_reset = '1') then
			s_sda_data_first_flag <= '0';
			v_state := a;
		else
			case (v_state) is
				when a =>
					s_sda_data_first_flag <= '1';
					if (s_sda_data_index = I2C_BITS_LENGTH - 1) then
						v_state := b;
					else
						v_state := a;
					end if;
				when b =>
					s_sda_data_first_flag <= '0';
					if (sta_condition = '0' and sto_condition = '1') then
						v_state := a;
					else
						v_state := b;
					end if;
			end case;
		end if;
	end if;
end process p6;

p7 : process (scl_ping,i_reset) is
begin
	if (falling_edge(scl_ping)) then
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

p8 : process (scl_ping,i_reset) is
begin
	if (falling_edge(scl_ping)) then
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

p9 : process (scl_ping,i_reset) is
begin
	if (falling_edge(scl_ping)) then
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

p10 : process (scl_ping,i_reset) is
begin
	if (falling_edge(scl_ping)) then
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

end Behavioral;
