----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:28 01/19/2023 
-- Design Name: 
-- Module Name:    mem_switchpattern - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_switchpattern is
port (
	i_clock : in std_logic;
	i_reset : in std_logic;
	i_pixel : in std_logic_vector (13 downto 0);
	o_pattern : out std_logic
);
end mem_switchpattern;

architecture Behavioral of mem_switchpattern is

begin

p0 : process (i_pixel) is
  variable i : integer range 0 to 767;
  variable index : integer range 0 to 11;
  variable offset : integer range 0 to 31;
  constant a : std_logic_vector (31 downto 0) := "10101010101010101010101010101010";
  constant b : std_logic_vector (31 downto 0) := "01010101010101010101010101010101";
begin
  i := to_integer (unsigned (i_pixel));
  index := i / 32;
  offset := i mod 32;
  case (index) is
    when 0 | 2 | 4 | 6 | 8 | 10 =>
      o_pattern <= a (offset);
    when 1 | 3 | 5 | 7 | 9 | 11 =>
      o_pattern <= b (offset);
  end case;
end process p0;

end architecture Behavioral;
