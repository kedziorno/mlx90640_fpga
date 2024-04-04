----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:52:16 06/14/2023 
-- Design Name: 
-- Module Name:    rom_signed3bit - Behavioral 
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

entity rom_signed3bit is
port (
nibble_in : in std_logic_vector (2 downto 0);
nibble_out : out std_logic_vector (31 downto 0)
);
end rom_signed3bit;

architecture Behavioral of rom_signed3bit is

begin

--INIT_01 => X"40e00000 40c00000 40a00000 40800000 40400000 40000000 3f800000 00000000",
--INIT_00 => X"bf800000 c0000000 c0400000 c0800000 40400000 40000000 3f800000 00000000",
with nibble_in select nibble_out <= -- x signed (000e / 2) 0-7, >3,-8 - kta(i,j)_ee
x"22000000" when "000", x"3f800000" when "001", x"40000000" when "010", x"40400000" when "011",
x"c0800000" when "100", x"c0400000" when "101", x"c0000000" when "110", x"bf800000" when "111",
x"22000000" when others;

end Behavioral;

