----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:21 06/09/2023 
-- Design Name: 
-- Module Name:    CalculateVDD_pow2_2bit - Behavioral 
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

entity CalculateVDD_pow2_2bit is
port (
x : in std_logic_vector (1 downto 0);
pow2x : out std_logic_vector (31 downto 0)
);
end CalculateVDD_pow2_2bit;

architecture Behavioral of CalculateVDD_pow2_2bit is

begin

with x select pow2x <=
x"3f800000" when "00", -- 2^0
x"40000000" when "01", -- 2^1
x"40800000" when "10", -- 2^2
x"41000000" when "11", -- 2^3
x"00000000" when others;

end Behavioral;

