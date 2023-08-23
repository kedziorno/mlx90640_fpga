----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:28 06/14/2023 
-- Design Name: 
-- Module Name:    colrow_even - Behavioral 
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

entity colrow_even is
generic (
constant C_COL : integer := 32;
constant C_ROW : integer := 24
);
port (
signal col : in std_logic_vector (0 to 4);
signal row : in std_logic_vector (0 to 4);
signal cole,rowe : out std_logic
);
end colrow_even;

architecture Behavioral of colrow_even is

begin

cole <=
'1' when (to_integer (unsigned (col)) mod 2) = 0
else
'0' when (to_integer (unsigned (col)) mod 2) = 1
else '0'; -- column even

rowe <=
'1' when (to_integer (unsigned (row)) mod 2) = 0
else
'0' when (to_integer (unsigned (row)) mod 2) = 1
else '0'; -- row even

end Behavioral;

