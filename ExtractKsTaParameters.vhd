----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:10 01/24/2023 
-- Design Name: 
-- Module Name:    ExtractKsTaParameters - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity ExtractKsTaParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_ee0x243c : in std_logic_vector (15 downto 0);
o_ksta : out std_logic_vector (31 downto 0)
);
end ExtractKsTaParameters;

architecture Behavioral of ExtractKsTaParameters is

signal odata_ksta : std_logic_vector (31 downto 0);
signal address_ksta : std_logic_vector (8 downto 0);

begin

o_ksta  <= odata_ksta;

p0 : process (i_ee0x243c) is
begin
	address_ksta <= "0" & i_ee0x243c (15 downto 8);
end process p0;

inst_mem_ksta : RAMB16_S36
generic map (
INIT => X"0", -- Value of output RAM registers at startup
SRVAL => X"0", -- Output value upon SSR assertion
WRITE_MODE => "WRITE_FIRST", -- WRITE_FIRST, READ_FIRST or NO_CHANGE
-- The following INIT_xx declarations specify the intial contents of the RAM
-- Address 0 to 4095
INIT_00 => X"3a6000003a4000003a2000003a00000039c00000398000003900000022000000",
INIT_01 => X"3af000003ae000003ad000003ac000003ab000003aa000003a9000003a800000",
INIT_02 => X"3b3800003b3000003b2800003b2000003b1800003b1000003b0800003b000000",
INIT_03 => X"3b7800003b7000003b6800003b6000003b5800003b5000003b4800003b400000",
INIT_04 => X"3b9c00003b9800003b9400003b9000003b8c00003b8800003b8400003b800000",
INIT_05 => X"3bbc00003bb800003bb400003bb000003bac00003ba800003ba400003ba00000",
INIT_06 => X"3bdc00003bd800003bd400003bd000003bcc00003bc800003bc400003bc00000",
INIT_07 => X"3bfc00003bf800003bf400003bf000003bec00003be800003be400003be00000",
INIT_08 => X"3c0e00003c0c00003c0a00003c0800003c0600003c0400003c0200003c000000",
INIT_09 => X"3c1e00003c1c00003c1a00003c1800003c1600003c1400003c1200003c100000",
INIT_0a => X"3c2e00003c2c00003c2a00003c2800003c2600003c2400003c2200003c200000",
INIT_0b => X"3c3e00003c3c00003c3a00003c3800003c3600003c3400003c3200003c300000",
INIT_0c => X"3c4e00003c4c00003c4a00003c4800003c4600003c4400003c4200003c400000",
INIT_0d => X"3c5e00003c5c00003c5a00003c5800003c5600003c5400003c5200003c500000",
INIT_0e => X"3c6e00003c6c00003c6a00003c6800003c6600003c6400003c6200003c600000",
INIT_0f => X"3c7e00003c7c00003c7a00003c7800003c7600003c7400003c7200003c700000",
INIT_10 => X"bc720000bc740000bc760000bc780000bc7a0000bc7c0000bc7e0000bc800000",
INIT_11 => X"bc620000bc640000bc660000bc680000bc6a0000bc6c0000bc6e0000bc700000",
INIT_12 => X"bc520000bc540000bc560000bc580000bc5a0000bc5c0000bc5e0000bc600000",
INIT_13 => X"bc420000bc440000bc460000bc480000bc4a0000bc4c0000bc4e0000bc500000",
INIT_14 => X"bc320000bc340000bc360000bc380000bc3a0000bc3c0000bc3e0000bc400000",
INIT_15 => X"bc220000bc240000bc260000bc280000bc2a0000bc2c0000bc2e0000bc300000",
INIT_16 => X"bc120000bc140000bc160000bc180000bc1a0000bc1c0000bc1e0000bc200000",
INIT_17 => X"bc020000bc040000bc060000bc080000bc0a0000bc0c0000bc0e0000bc100000",
INIT_18 => X"bbe40000bbe80000bbec0000bbf00000bbf40000bbf80000bbfc0000bc000000",
INIT_19 => X"bbc40000bbc80000bbcc0000bbd00000bbd40000bbd80000bbdc0000bbe00000",
INIT_1a => X"bba40000bba80000bbac0000bbb00000bbb40000bbb80000bbbc0000bbc00000",
INIT_1b => X"bb840000bb880000bb8c0000bb900000bb940000bb980000bb9c0000bba00000",
INIT_1c => X"bb480000bb500000bb580000bb600000bb680000bb700000bb780000bb800000",
INIT_1d => X"bb080000bb100000bb180000bb200000bb280000bb300000bb380000bb400000",
INIT_1e => X"ba900000baa00000bab00000bac00000bad00000bae00000baf00000bb000000",
INIT_1f => X"b9000000b9800000b9c00000ba000000ba200000ba400000ba600000ba800000",
-- Address 8192 to 12287
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
-- Address 12288 to 16383
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
port map (
DO => odata_ksta, -- 1-bit Data Output
DOP => open, -- 1-bit Data Output
ADDR => address_ksta, -- 14-bit Address Input
CLK => i_clock, -- Clock
DI => (others => '0'), -- 1-bit Data Input
DIP => (others => '0'), -- 1-bit Data Input
EN => '1', -- RAM Enable Input
SSR => i_reset, -- Synchronous Set/Reset Input
WE => '0' -- Write Enable Input
);
-- End of RAMB16_S1_inst instantiation

end Behavioral;

