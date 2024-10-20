----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:08:27 06/14/2023 
-- Design Name: 
-- Module Name:    ExtractKtaParameters_process_p1 - Behavioral 
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

entity ExtractKtaParameters_process_p1 is
port (
signal cole,rowe : in std_logic;
signal ktarcee_oo,ktarcee_eo,ktarcee_oe,ktarcee_ee : in std_logic_vector (7 downto 0);
signal ktarcee : out std_logic_vector (7 downto 0)
);
end ExtractKtaParameters_process_p1;

architecture Behavioral of ExtractKtaParameters_process_p1 is

begin

p1 : process (cole,rowe,ktarcee_oo,ktarcee_eo,ktarcee_oe,ktarcee_ee) is
	variable a : std_logic_vector (1 downto 0);
begin
	a := rowe&cole;
  case (a) is
    when "00" => ktarcee <= ktarcee_oo;
    when "10" => ktarcee <= ktarcee_eo;
    when "01" => ktarcee <= ktarcee_oe;
    when "11" => ktarcee <= ktarcee_ee;
    when others => ktarcee <= (others => '0');
  end case;
end process p1;

end Behavioral;

