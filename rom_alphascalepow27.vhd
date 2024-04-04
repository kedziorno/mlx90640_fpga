----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:58 06/12/2023 
-- Design Name: 
-- Module Name:    rom_alphascalepow27 - Behavioral 
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

entity rom_alphascalepow27 is
port (
nibble_in : in std_logic_vector (3 downto 0);
nibble_out : out std_logic_vector (31 downto 0)
);
end rom_alphascalepow27;

architecture Behavioral of rom_alphascalepow27 is

begin

--INIT_01 => X"54800000 54000000 53800000 53000000 52800000 52000000 51800000 51000000",
--INIT_00 => X"50800000 50000000 4f800000 4f000000 4e800000 4e000000 4d800000 4d000000",
with nibble_in select nibble_out <= -- 2^(x+27) - alphascale
x"4d000000" when x"0", x"4d800000" when x"1", x"4e000000" when x"2", x"4e800000" when x"3",
x"4f000000" when x"4", x"4f800000" when x"5", x"50000000" when x"6", x"50800000" when x"7",
x"51000000" when x"8", x"51800000" when x"9", x"52000000" when x"a", x"52800000" when x"b",
x"53000000" when x"c", x"53800000" when x"d", x"54000000" when x"e", x"54800000" when x"f",
x"22000000" when others;

end Behavioral;

