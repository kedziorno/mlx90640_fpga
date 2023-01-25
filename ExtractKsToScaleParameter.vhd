----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:07 01/25/2023 
-- Design Name: 
-- Module Name:    ExtractKsToScaleParameter - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity ExtractKsToScaleParameter is
port (
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x243f : IN  std_logic_vector (15 downto 0);
o_kstoscale : OUT  std_logic_vector (31 downto 0)
);
end ExtractKsToScaleParameter;

architecture Behavioral of ExtractKsToScaleParameter is

signal odata_kstoscale : std_logic_vector (31 downto 0);
signal address_kstoscale : std_logic_vector (8 downto 0);

begin

p0 : process (i_ee0x243f) is
begin
	address_kstoscale <= std_logic_vector (to_unsigned (to_integer (unsigned (i_ee0x243f (3 downto 0))),9));
end process p0;

o_kstoscale <= odata_kstoscale;

inst_mem_kstoscale : RAMB16_S36
generic map (
INIT => X"000000000", -- Value of output RAM registers at startup
SRVAL => X"000000000", -- Output value upon SSR assertion
WRITE_MODE => "WRITE_FIRST", -- WRITE_FIRST, READ_FIRST or NO_CHANGE
INIT_00 => X"4700000046800000460000004580000045000000448000004400000043800000",
INIT_01 => X"4b0000004a8000004a0000004980000049000000488000004800000047800000"
)
port map (
DO => odata_kstoscale, -- 1-bit Data Output
DOP => open, -- 1-bit Data Output
ADDR => address_kstoscale, -- 14-bit Address Input
CLK => i_clock, -- Clock
DI => (others => '0'), -- 1-bit Data Input
DIP => (others => '0'), -- 1-bit Data Input
EN => '1', -- RAM Enable Input
SSR => i_reset, -- Synchronous Set/Reset Input
WE => '0' -- Write Enable Input,
);
-- End of RAMB16_S1_inst instantiation

end Behavioral;

