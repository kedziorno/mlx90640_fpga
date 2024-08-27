----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:01 06/11/2023 
-- Design Name: 
-- Module Name:    mux_addr - Behavioral 
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

entity mux_addr is
port (
rdy : in std_logic;
addra : in std_logic_vector (9 downto 0);
i_addr : in std_logic_vector (9 downto 0);
mux_addr : out std_logic_vector (9 downto 0)
);
end mux_addr;

architecture Behavioral of mux_addr is

constant C_COL : integer := 32;
constant C_ROW : integer := 24;

begin

mux_addr <=
addra when rdy = '0'
else
std_logic_vector (to_unsigned (to_integer(unsigned (i_addr))+C_COL+C_ROW,10)) when rdy = '1'
else
(others => '0');

end Behavioral;

