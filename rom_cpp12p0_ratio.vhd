----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:19:41 06/12/2023 
-- Design Name: 
-- Module Name:    rom_cpp12p0_ratio - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom_cpp12p0_ratio is
port (
nibble_in : in std_logic_vector (5 downto 0);
nibble_out : out std_logic_vector (31 downto 0)
);
end rom_cpp12p0_ratio;

architecture Behavioral of rom_cpp12p0_ratio is

begin

--INIT_00 => X"3f870000 3f860000 3f850000 3f840000 3f830000 3f820000 3f810000 3f800000",
--INIT_01 => X"3f8f0000 3f8e0000 3f8d0000 3f8c0000 3f8b0000 3f8a0000 3f890000 3f880000",
--INIT_02 => X"3f970000 3f960000 3f950000 3f940000 3f930000 3f920000 3f910000 3f900000",
--INIT_03 => X"3f9f0000 3f9e0000 3f9d0000 3f9c0000 3f9b0000 3f9a0000 3f990000 3f980000",
--INIT_04 => X"3f4e0000 3f4c0000 3f4a0000 3f480000 3f460000 3f440000 3f420000 3f400000",
--INIT_05 => X"3f5e0000 3f5c0000 3f5a0000 3f580000 3f560000 3f540000 3f520000 3f500000",
--INIT_06 => X"3f6e0000 3f6c0000 3f6a0000 3f680000 3f660000 3f640000 3f620000 3f600000",
--INIT_07 => X"3f7e0000 3f7c0000 3f7a0000 3f780000 3f760000 3f740000 3f720000 3f700000",
with nibble_in select nibble_out <= -- (1 + (CP_P12P0_ratio/2^7)) - CP_P12P0_ratio signed -32 - +31
x"3f830000" when "000011",x"3f820000" when "000010",x"3f810000" when "000001",x"3f800000" when "000000",
x"3f870000" when "000111",x"3f860000" when "000110",x"3f850000" when "000101",x"3f840000" when "000100",
x"3f8b0000" when "001011",x"3f8a0000" when "001010",x"3f890000" when "001001",x"3f880000" when "001000",
x"3f8f0000" when "001111",x"3f8e0000" when "001110",x"3f8d0000" when "001101",x"3f8c0000" when "001100",
x"3f930000" when "010011",x"3f920000" when "010010",x"3f910000" when "010001",x"3f900000" when "010000",
x"3f970000" when "010111",x"3f960000" when "010110",x"3f950000" when "010101",x"3f940000" when "010100",
x"3f9b0000" when "011011",x"3f9a0000" when "011010",x"3f990000" when "011001",x"3f980000" when "011000",
x"3f9f0000" when "011111",x"3f9e0000" when "011110",x"3f9d0000" when "011101",x"3f9c0000" when "011100",
x"3f460000" when "100011",x"3f440000" when "100010",x"3f420000" when "100001",x"3f400000" when "100000",
x"3f4e0000" when "100111",x"3f4c0000" when "100110",x"3f4a0000" when "100101",x"3f480000" when "100100",
x"3f560000" when "101011",x"3f540000" when "101010",x"3f520000" when "101001",x"3f500000" when "101000",
x"3f5e0000" when "101111",x"3f5c0000" when "101110",x"3f5a0000" when "101101",x"3f580000" when "101100",
x"3f660000" when "110011",x"3f640000" when "110010",x"3f620000" when "110001",x"3f600000" when "110000",
x"3f6e0000" when "110111",x"3f6c0000" when "110110",x"3f6a0000" when "110101",x"3f680000" when "110100",
x"3f760000" when "111011",x"3f740000" when "111010",x"3f720000" when "111001",x"3f700000" when "111000",
x"3f7e0000" when "111111",x"3f7c0000" when "111110",x"3f7a0000" when "111101",x"3f780000" when "111100",
x"22000000" when others;

end Behavioral;

