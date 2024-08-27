----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:59:35 06/14/2023 
-- Design Name: 
-- Module Name:    mux3x1 - Behavioral 
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

entity mux3x1 is
port (
o : out std_logic;
s0,s1,s2 : in std_logic;
i0,i1,i2,i3 : in std_logic
);
end mux3x1;

architecture Behavioral of mux3x1 is

begin

o <=
i0 when s0 = '1'
else
i1 when s1 = '1'
else
i2 when s2 = '1'
else i3;

end Behavioral;

