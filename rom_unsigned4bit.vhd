----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:19:55 06/11/2023 
-- Design Name: 
-- Module Name:    rom_unsigned4bit - Behavioral 
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

entity rom_unsigned4bit is
port (
signal nibble_in : in std_logic_vector (3 downto 0);
signal nibble_out : out std_logic_vector (31 downto 0)
);
end rom_unsigned4bit;

architecture Behavioral of rom_unsigned4bit is

begin

--INIT_7f => X"41700000 41600000 41500000 41400000 41300000 41200000 41100000 41000000", -- unsigned 0-15 for accremscale,accrowscale,acccolscale
--INIT_7e => X"40e00000 40c00000 40a00000 40800000 40400000 40000000 3f800000 22000000",
with nibble_in select nibble_out <= -- x - accremscale,accrowscale,acccolscale unsigned 4bit
x"22000000" when x"0",
x"3f800000" when x"1",
x"40000000" when x"2",
x"40400000" when x"3",
x"40800000" when x"4",
x"40a00000" when x"5",
x"40c00000" when x"6",
x"40e00000" when x"7",
x"41000000" when x"8",
x"41100000" when x"9",
x"41200000" when x"a",
x"41300000" when x"b",
x"41400000" when x"c",
x"41500000" when x"d",
x"41600000" when x"e",
x"41700000" when x"f",
x"22000000" when others;

end Behavioral;

