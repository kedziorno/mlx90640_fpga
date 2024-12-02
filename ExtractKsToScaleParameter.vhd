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

use work.p_fphdl_package3.all;

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
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_kstoscale : OUT  std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
end ExtractKsToScaleParameter;

architecture Behavioral of ExtractKsToScaleParameter is

signal odata_kstoscale : std_logic_vector (31 downto 0);
signal address_kstoscale : std_logic_vector (8 downto 0);
signal en : std_logic;

begin

p0 : process (i_clock) is
	type states is (idle,
	s1,s2,s3,s4);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			i2c_mem_ena <= '0';
      i2c_mem_addra <= (others => '0');
			o_rdy <= '0';
      en <= '0';
      address_kstoscale <= (others => '0');
      o_kstoscale <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
						i2c_mem_ena <= '1';
            i2c_mem_addra <= std_logic_vector (to_unsigned (63*2+1, 12)); -- ee243f LSB kstoscale 0x000f
            en <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
            en <= '0';
					end if;
          o_rdy <= '0';
				when s1 => state := s2;
          address_kstoscale <= "00000"&i2c_mem_douta (3 downto 0);
				when s2 => state := s3;
          address_kstoscale <= "00000"&i2c_mem_douta (3 downto 0);
				when s3 => state := s4;
          o_kstoscale <= odata_kstoscale;
				when s4 => state := idle;
					o_rdy <= '1';
          o_kstoscale <= odata_kstoscale;
          report_error("==================== kstoscale", odata_kstoscale, 0.0);
			end case;
		end if;
	end if;
end process p0;

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
EN => en, -- RAM Enable Input
SSR => i_reset, -- Synchronous Set/Reset Input
WE => '0' -- Write Enable Input,
);
-- End of RAMB16_S1_inst instantiation

end Behavioral;

