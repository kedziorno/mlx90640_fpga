----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:04 12/23/2022 
-- Design Name: 
-- Module Name:    mem_kvptat_ktptat - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity mem_kvptat_ktptat is
port (
	i_clock : in std_logic;
	i_reset : in std_logic;
	i_address : in std_logic_vector(15 downto 0);
	o_data_kvptat : out std_logic_vector(31 downto 0);
	o_data_ktptat : out std_logic_vector(31 downto 0)
);
end mem_kvptat_ktptat;

architecture Behavioral of mem_kvptat_ktptat is

component mem_ramb16_16bit_address_dual is
port (
O_DO          : out std_logic_vector (31 downto 0);
O_DOP         : out std_logic_vector (3 downto 0);
I_ADDR        : in  std_logic_vector (15 downto 0); -- 16bit
I_CLK         : in  std_ulogic;
I_DI          : in  std_logic_vector (31 downto 0);
I_DIP         : in  std_logic_vector (3 downto 0);
I_EN          : in  std_ulogic;
I_REGCE       : in  std_ulogic;
I_SSR         : in  std_ulogic;
I_WE          : in  std_logic_vector (3 downto 0)
);
end component mem_ramb16_16bit_address_dual;

signal mem_ramb16_16bit_address_dual_do : std_logic_vector(31 downto 0);
signal mem_ramb16_16bit_address_dual_dop : std_logic_vector(3 downto 0);
signal mem_ramb16_16bit_address_dual_addr : std_logic_vector(15 downto 0);
signal mem_ramb16_16bit_address_dual_clk : std_ulogic;
signal mem_ramb16_16bit_address_dual_di : std_logic_vector(31 downto 0);
signal mem_ramb16_16bit_address_dual_dip : std_logic_vector(3 downto 0);
signal mem_ramb16_16bit_address_dual_en : std_ulogic;
signal mem_ramb16_16bit_address_dual_regce : std_ulogic;
signal mem_ramb16_16bit_address_dual_ssr : std_ulogic;
signal mem_ramb16_16bit_address_dual_we : std_logic_vector(3 downto 0);

signal odata_kvptat : std_logic_vector(31 downto 0);
signal odata_ktptat : std_logic_vector(31 downto 0);
signal address_kvptat : std_logic_vector(15 downto 0);
signal address_ktptat : std_logic_vector(15 downto 0);

begin

odata_ktptat <= mem_ramb16_16bit_address_dual_do;
mem_ramb16_16bit_address_dual_addr <= address_ktptat;
mem_ramb16_16bit_address_dual_clk <= i_clock;
mem_ramb16_16bit_address_dual_di <= (others => '0');
mem_ramb16_16bit_address_dual_dip <= (others => '0');
mem_ramb16_16bit_address_dual_en <= '1';
mem_ramb16_16bit_address_dual_regce <= '0';
mem_ramb16_16bit_address_dual_ssr <= i_reset;
mem_ramb16_16bit_address_dual_we <= (others => '0');

--p0 : process (i_address) is
--begin
--	address_kvptat <= std_logic_vector(to_unsigned(to_integer(unsigned(i_address)) * 32,15));
--end process p0;

p1 : process (i_address) is
	variable vktptat : std_logic_vector(15 downto 0);
begin
	if (to_integer(unsigned(i_address)) > 511) then
		vktptat := std_logic_vector(to_unsigned(((to_integer(unsigned(i_address))) * 32),16));
		vktptat(15) := '1';
	else
		vktptat := std_logic_vector(to_unsigned(((to_integer(unsigned(i_address))) * 32),16));
		vktptat(15) := '0';
	end if;
	address_ktptat <= vktptat;
end process p1;

o_data_kvptat <= odata_kvptat;
o_data_ktptat <= odata_ktptat;

inst_mem_kvptat_ptptat : mem_ramb16_16bit_address_dual
port map (
	o_do => mem_ramb16_16bit_address_dual_do,
	o_dop => mem_ramb16_16bit_address_dual_dop,
	i_addr => mem_ramb16_16bit_address_dual_addr,
	i_clk => mem_ramb16_16bit_address_dual_clk,
	i_di => mem_ramb16_16bit_address_dual_di,
	i_dip => mem_ramb16_16bit_address_dual_dip,
	i_en => mem_ramb16_16bit_address_dual_en,
	i_regce => mem_ramb16_16bit_address_dual_regce,
	i_ssr => mem_ramb16_16bit_address_dual_ssr,
	i_we => mem_ramb16_16bit_address_dual_we
);

end Behavioral;
