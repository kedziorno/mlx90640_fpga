----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:21:45 12/13/2022 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity top is
port (
	i_clock : in std_logic;
	i_reset : in std_logic;
	i_sda : in std_logic;
	i_scl : in std_logic;
	o_data : out std_logic_vector(7 downto 0)
);
end top;

architecture Behavioral of top is

component i2c_r is
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
end component i2c_r;

signal i2c_r_address : std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
signal i2c_r_address_rw : std_logic;
signal i2c_r_address_ack : std_logic;
signal i2c_r_data : std_logic_vector(I2C_DATA_BITS - 1 downto 0);
signal i2c_r_data_ack : std_logic;
signal i2c_r_done_data : std_logic;
signal i2c_r_done_address : std_logic;

COMPONENT i2c_mem
PORT (
clka : IN STD_LOGIC;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
clkb : IN STD_LOGIC;
web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
dinb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

signal i2c_mem_clka : STD_LOGIC;
signal i2c_mem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal i2c_mem_addra : STD_LOGIC_VECTOR(10 DOWNTO 0);
signal i2c_mem_dina : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal i2c_mem_clkb : STD_LOGIC;
signal i2c_mem_web : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal i2c_mem_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0);
signal i2c_mem_dinb : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal i2c_mem_doutb : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal signal_i2c_mem_addra_index : std_logic_vector(10 downto 0);

signal i2c_r_done_address_prev : std_logic;
signal i2c_r_done_data_prev : std_logic;

begin

inst_i2c_r : i2c_r port map (
i_clock => i_clock,
i_reset => i_reset,
i_sda => i_sda,
i_scl => i_scl,
o_i2c_address => i2c_r_address,
o_i2c_address_rw => i2c_r_address_rw,
o_i2c_address_ack => i2c_r_address_ack,
o_i2c_data => i2c_r_data,
o_i2c_data_ack => i2c_r_data_ack,
o_done_data => i2c_r_done_data,
o_done_address => i2c_r_done_address
);

p0 : process (i_clock, i_reset) is
	variable variable_i2c_mem_addra_index : integer range 0 to C_DATA_SIZE - 1;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			variable_i2c_mem_addra_index := 0;
			i2c_r_done_data_prev <= '0';
			i2c_r_done_address_prev <= '0';
		else
			i2c_r_done_data_prev <= i2c_r_done_data;
			i2c_r_done_address_prev <= i2c_r_done_address;
			if (i2c_r_done_address_prev = '0' and i2c_r_done_address = '1') then
				variable_i2c_mem_addra_index := 0;
			elsif (i2c_r_done_data_prev = '0' and i2c_r_done_data = '1') then
				if (variable_i2c_mem_addra_index = C_DATA_SIZE - 1) then
					variable_i2c_mem_addra_index := 0;
				else
					variable_i2c_mem_addra_index := variable_i2c_mem_addra_index + 1;
				end if;
			end if;
		end if;
		signal_i2c_mem_addra_index <= std_logic_vector(to_unsigned(variable_i2c_mem_addra_index,11));
	end if;
end process p0;

i2c_mem_clka <= i2c_r_done_data;
i2c_mem_addra <= signal_i2c_mem_addra_index;
i2c_mem_dina <= i2c_r_data;
i2c_mem_wea <= "1";
o_data <= i2c_mem_douta;

inst_i2c_mem : i2c_mem
PORT MAP (
clka => i2c_mem_clka,
wea => i2c_mem_wea,
addra => i2c_mem_addra,
dina => i2c_mem_dina,
douta => i2c_mem_douta,
clkb => i2c_mem_clkb,
web => i2c_mem_web,
addrb => i2c_mem_addrb,
dinb => i2c_mem_dinb,
doutb => i2c_mem_doutb
);

end Behavioral;
