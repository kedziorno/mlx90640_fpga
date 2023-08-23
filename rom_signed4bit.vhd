----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:56 06/11/2023 
-- Design Name: 
-- Module Name:    rom_signed4bit - Behavioral 
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

entity rom_signed4bit is
port (
signal nibble_in : in std_logic_vector (3 downto 0);
signal nibble_out : out std_logic_vector (31 downto 0)
);
end rom_signed4bit;

architecture Behavioral of rom_signed4bit is

begin

with nibble_in select nibble_out <= -- >7,-16 - rows1-24,cols1-32 signed 4bit
x"00000000" when x"0",
x"3f800000" when x"1",
x"40000000" when x"2",
x"40400000" when x"3",
x"40800000" when x"4",
x"40a00000" when x"5",
x"40c00000" when x"6",
x"40e00000" when x"7",
x"c1000000" when x"8",
x"c0e00000" when x"9",
x"c0c00000" when x"a",
x"c0a00000" when x"b",
x"c0800000" when x"c",
x"c0400000" when x"d",
x"c0000000" when x"e",
x"bf800000" when x"f",
x"00000000" when others;

end Behavioral;

