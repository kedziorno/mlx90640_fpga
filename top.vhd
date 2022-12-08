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
	o_led1 : out std_logic
);
end top;

architecture Behavioral of top is
	signal psda,pscl : std_logic;
	signal s_i2c_address : std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
	signal s_i2c_address_rw : std_logic;
	signal s_i2c_address_ack : std_logic;
	signal s_i2c_data : std_logic_vector(I2C_DATA_BITS - 1 downto 0);
	signal s_i2c_data_ack : std_logic;
begin

o_led1 <= '0';

p0 : process (i_clock,i_reset) is
	type states is (a,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,z);
	variable state : states;
	constant I2C_PERIOD : natural := I2C_STRETCH;
	variable i2c_period_index : natural range 0 to I2C_PERIOD - 1;
	constant I2C_HALF_PERIOD : natural := I2C_PERIOD / 2;
	variable i2c_half_period_index : natural range 0 to I2C_HALF_PERIOD - 1;
	variable v_i2c_address : std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
	variable v_i2c_address_rw : std_logic;
	variable v_i2c_address_ack : std_logic;
	variable v_i2c_data : std_logic_vector(I2C_DATA_BITS - 1 downto 0);
	variable v_i2c_data_ack : std_logic;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			psda <= '1';
			pscl <= '1';
			state := a;
			i2c_period_index := 0;
			i2c_half_period_index := 0;
			v_i2c_address := (others => '0');
			v_i2c_address_rw := '0';
			v_i2c_address_ack := '0';
			v_i2c_data := (others => '0');
			v_i2c_data_ack := '0';
		else
			psda <= i_sda;
			pscl <= i_scl;
			case (state) is
				when a =>
					v_i2c_address := (others => '0');
					v_i2c_address_rw := '0';
					v_i2c_address_ack := '0';
					v_i2c_data := (others => '0');
					v_i2c_address_ack := '0';
					if ((pscl = '1' and i_scl = '1') and (psda = '1' and i_sda = '0')) then
						state := c;
					else
						state := a;
					end if;
				when c =>
					if (i2c_half_period_index = I2C_HALF_PERIOD - 1) then
						state := d;
						i2c_half_period_index := 0;
						v_i2c_address(0) := i_sda;
					else
						state := c;
						i2c_half_period_index := i2c_half_period_index + 1;
					end if;
				when d =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := e;
						i2c_period_index := 0;
						v_i2c_address(1) := i_sda;
					else
						state := d;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when e =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := f;
						i2c_period_index := 0;
						v_i2c_address(2) := i_sda;
					else
						state := e;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when f =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := g;
						i2c_period_index := 0;
						v_i2c_address(3) := i_sda;
					else
						state := f;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when g =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := h;
						i2c_period_index := 0;
						v_i2c_address(4) := i_sda;
					else
						state := g;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when h =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := i;
						i2c_period_index := 0;
						v_i2c_address(5) := i_sda;
					else
						state := h;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when i =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := j;
						i2c_period_index := 0;
						v_i2c_address(6) := i_sda;
					else
						state := i;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when j =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						i2c_period_index := 0;
						v_i2c_address_rw := i_sda;
						if (v_i2c_address_rw = To_Std_Logic(I2C_ADDRESS_READ)) then
							state := k;
						elsif (v_i2c_address_rw = To_Std_Logic(I2C_ADDRESS_WRITE)) then
							state := a;
						end if;
					else
						state := j;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when k =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := l;
						i2c_period_index := 0;
						v_i2c_address_ack := i_sda;
					else
						state := k;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when l =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := m;
						i2c_period_index := 0;
						v_i2c_data(0) := i_sda;
					else
						state := l;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when m =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := n;
						i2c_period_index := 0;
						v_i2c_data(1) := i_sda;
					else
						state := m;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when n =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := o;
						i2c_period_index := 0;
						v_i2c_data(2) := i_sda;
					else
						state := n;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when o =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := p;
						i2c_period_index := 0;
						v_i2c_data(3) := i_sda;
					else
						state := o;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when p =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := q;
						i2c_period_index := 0;
						v_i2c_data(4) := i_sda;
					else
						state := p;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when q =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := r;
						i2c_period_index := 0;
						v_i2c_data(5) := i_sda;
					else
						state := q;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when r =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := s;
						i2c_period_index := 0;
						v_i2c_data(6) := i_sda;
					else
						state := r;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when s =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := t;
						i2c_period_index := 0;
						v_i2c_data(7) := i_sda;
					else
						state := s;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when t =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := z;
						i2c_period_index := 0;
						v_i2c_data_ack := i_sda;
					else
						state := t;
						i2c_period_index := i2c_period_index + 1;
					end if;
				when z =>
					if (i2c_period_index = I2C_PERIOD - 1) then
						state := a;
						i2c_period_index := 0;
					else
						state := z;
						i2c_period_index := i2c_period_index + 1;
					end if;
			end case;
			s_i2c_address <= v_i2c_address;
			s_i2c_address_rw <= v_i2c_address_rw;
			s_i2c_address_ack <= v_i2c_address_ack;
			s_i2c_data <= v_i2c_data;
			s_i2c_data_ack <= v_i2c_data_ack;
		end if;
	end if;
end process p0;

end Behavioral;

