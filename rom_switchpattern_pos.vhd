----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:49:16 06/16/2023 
-- Design Name: 
-- Module Name:    rom_switchpattern_pos - Behavioral 
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

entity rom_switchpattern_pos is
port (
pattern_in : in std_logic;
pattern_out : out std_logic_vector (31 downto 0)
);
end rom_switchpattern_pos;

architecture Behavioral of rom_switchpattern_pos is

begin

with pattern_in select pattern_out <=
x"3f800000" when '1',
x"00000000" when others;

end Behavioral;

