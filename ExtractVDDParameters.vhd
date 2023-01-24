----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:08:59 01/24/2023 
-- Design Name: 
-- Module Name:    ExtractVDDParameters - Behavioral 
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

entity ExtractVDDParameters is
port (
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2433 : IN  std_logic_vector (15 downto 0);
o_kvdd : OUT  std_logic_vector (15 downto 0);
o_vdd25 : OUT  std_logic_vector (15 downto 0)
);
end ExtractVDDParameters;

architecture Behavioral of ExtractVDDParameters is

COMPONENT mem_kvdd_vdd25
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_address_kvdd : IN  std_logic_vector (7 downto 0);
i_address_vdd25 : IN  std_logic_vector (7 downto 0);
o_data_kvdd : OUT  std_logic_vector (15 downto 0);
o_data_vdd25 : OUT  std_logic_vector (15 downto 0)
);
END COMPONENT;

begin

uut: mem_kvdd_vdd25 PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_address_kvdd => i_ee0x2433 (15 downto 8),
i_address_vdd25 => i_ee0x2433 (7 downto 0),
o_data_kvdd => o_kvdd,
o_data_vdd25 => o_vdd25
);

end Behavioral;

