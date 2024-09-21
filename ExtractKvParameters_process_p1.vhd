----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:50 06/14/2023 
-- Design Name: 
-- Module Name:    ExtractKvParameters_process_p1 - Behavioral 
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

entity ExtractKvParameters_process_p1 is
port (
cole,rowe : in std_logic;
kvijee_oo,kvijee_eo,kvijee_oe,kvijee_ee : in std_logic_vector (3 downto 0);
kvijee : out std_logic_vector (3 downto 0)
);
end ExtractKvParameters_process_p1;

architecture Behavioral of ExtractKvParameters_process_p1 is

begin

p1 : process (cole,rowe,kvijee_oo,kvijee_eo,kvijee_oe,kvijee_ee) is
	variable a : std_logic_vector (1 downto 0);
begin
	a := rowe&cole;
  case (a) is
    when "00" => kvijee <= kvijee_oo;
    when "10" => kvijee <= kvijee_eo;
    when "01" => kvijee <= kvijee_oe;
    when "11" => kvijee <= kvijee_ee;
    when others => kvijee <= (others => '0');
  end case;
end process p1;

end Behavioral;

