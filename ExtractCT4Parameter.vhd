----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:20 01/25/2023 
-- Design Name: 
-- Module Name:    ExtractCT4Parameter - Behavioral 
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

entity ExtractCT34Parameter is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_ee0x243f : in std_logic_vector (15 downto 0);
o_ct3 : out std_logic_vector (31 downto 0);
o_ct4 : out std_logic_vector (31 downto 0)
);
end ExtractCT34Parameter;

architecture Behavioral of ExtractCT34Parameter is

COMPONENT mem_ramb16_s36_x2
generic (
INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

INIT_40 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_41 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_42 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_43 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_44 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_45 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_46 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_47 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_48 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_49 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_50 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_51 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_52 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_53 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_54 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_55 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_56 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_57 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_58 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_59 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_60 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_61 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_62 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_63 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_64 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_65 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_66 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_67 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_68 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_69 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_70 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_71 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_72 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_73 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_74 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_75 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_76 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_77 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_78 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_79 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

INITP_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0a : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0b : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0c : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0d : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0e : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0f : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
);
PORT(
DO : OUT  std_logic_vector(31 downto 0);
DOP : OUT  std_logic_vector(3 downto 0);
ADDR : IN  std_logic_vector(9 downto 0);
CLK : IN  std_logic;
DI : IN  std_logic_vector(31 downto 0);
DIP : IN  std_logic_vector(3 downto 0);
EN : IN  std_logic;
SSR : IN  std_logic;
WE : IN  std_logic
);
END COMPONENT mem_ramb16_s36_x2;

signal odata_ct34 : std_logic_vector (31 downto 0);
signal address_ct34 : std_logic_vector (9 downto 0);

begin

p0 : process (i_clock,i_reset) is
	type states is (a,b,c,d);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			o_ct3 <= (others => '0');
			o_ct4 <= (others => '0');
			address_ct34 <= (others => '0');
			state := a;
		else
			case (state) is
				when a =>
					address_ct34 <= i_ee0x243f (13 downto 12) & "0000" & i_ee0x243f (7 downto 4); -- ct3
					state := b;
				when b =>
					address_ct34 <= i_ee0x243f (13 downto 12) & i_ee0x243f (11 downto 8) & i_ee0x243f (7 downto 4); -- ct4
					state := c;
				when c =>
					o_ct3 <= odata_ct34;
					state := d;
				when d =>
					o_ct4 <= odata_ct34;
					state := a;
			end case;
		end if;
	end if;
end process p0;

inst_mem_ct : mem_ramb16_s36_x2 
GENERIC MAP (
INIT_00 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_01 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_02 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_03 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_04 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_05 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_06 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_07 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_08 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_09 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_0a => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_0b => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_0c => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_0d => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_0e => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_0f => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_10 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_11 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_12 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_13 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_14 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_15 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_16 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_17 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_18 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_19 => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_1a => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_1b => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_1c => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_1d => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_1e => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_1f => X"2200000022000000220000002200000022000000220000002200000022000000",
INIT_20 => X"428c000042700000424800004220000041f0000041a000004120000022000000",
INIT_21 => X"43160000430c00004302000042f0000042dc000042c8000042b4000042a00000",
INIT_22 => X"42a00000428c000042700000424800004220000041f0000041a0000041200000",
INIT_23 => X"4320000043160000430c00004302000042f0000042dc000042c8000042b40000",
INIT_24 => X"42b4000042a00000428c000042700000424800004220000041f0000041a00000",
INIT_25 => X"432a00004320000043160000430c00004302000042f0000042dc000042c80000",
INIT_26 => X"42c8000042b4000042a00000428c000042700000424800004220000041f00000",
INIT_27 => X"43340000432a00004320000043160000430c00004302000042f0000042dc0000",
INIT_28 => X"42dc000042c8000042b4000042a00000428c0000427000004248000042200000",
INIT_29 => X"433e000043340000432a00004320000043160000430c00004302000042f00000",
INIT_2a => X"42f0000042dc000042c8000042b4000042a00000428c00004270000042480000",
INIT_2b => X"43480000433e000043340000432a00004320000043160000430c000043020000",
INIT_2c => X"4302000042f0000042dc000042c8000042b4000042a00000428c000042700000",
INIT_2d => X"4352000043480000433e000043340000432a00004320000043160000430c0000",
INIT_2e => X"430c00004302000042f0000042dc000042c8000042b4000042a00000428c0000",
INIT_2f => X"435c00004352000043480000433e000043340000432a00004320000043160000",
INIT_30 => X"43160000430c00004302000042f0000042dc000042c8000042b4000042a00000",
INIT_31 => X"43660000435c00004352000043480000433e000043340000432a000043200000",
INIT_32 => X"4320000043160000430c00004302000042f0000042dc000042c8000042b40000",
INIT_33 => X"4370000043660000435c00004352000043480000433e000043340000432a0000",
INIT_34 => X"432a00004320000043160000430c00004302000042f0000042dc000042c80000",
INIT_35 => X"437a00004370000043660000435c00004352000043480000433e000043340000",
INIT_36 => X"43340000432a00004320000043160000430c00004302000042f0000042dc0000",
INIT_37 => X"43820000437a00004370000043660000435c00004352000043480000433e0000",
INIT_38 => X"433e000043340000432a00004320000043160000430c00004302000042f00000",
INIT_39 => X"4387000043820000437a00004370000043660000435c00004352000043480000",
INIT_3a => X"43480000433e000043340000432a00004320000043160000430c000043020000",
INIT_3b => X"438c00004387000043820000437a00004370000043660000435c000043520000",
INIT_3c => X"4352000043480000433e000043340000432a00004320000043160000430c0000",
INIT_3d => X"43910000438c00004387000043820000437a00004370000043660000435c0000",
INIT_3e => X"435c00004352000043480000433e000043340000432a00004320000043160000",
INIT_3f => X"4396000043910000438c00004387000043820000437a00004370000043660000",
INIT_40 => X"430c000042f0000042c8000042a00000427000004220000041a0000022000000",
INIT_41 => X"43960000438c00004382000043700000435c0000434800004334000043200000",
INIT_42 => X"43200000430c000042f0000042c8000042a00000427000004220000041a00000",
INIT_43 => X"43a0000043960000438c00004382000043700000435c00004348000043340000",
INIT_44 => X"4334000043200000430c000042f0000042c8000042a000004270000042200000",
INIT_45 => X"43aa000043a0000043960000438c00004382000043700000435c000043480000",
INIT_46 => X"434800004334000043200000430c000042f0000042c8000042a0000042700000",
INIT_47 => X"43b4000043aa000043a0000043960000438c00004382000043700000435c0000",
INIT_48 => X"435c0000434800004334000043200000430c000042f0000042c8000042a00000",
INIT_49 => X"43be000043b4000043aa000043a0000043960000438c00004382000043700000",
INIT_4a => X"43700000435c0000434800004334000043200000430c000042f0000042c80000",
INIT_4b => X"43c8000043be000043b4000043aa000043a0000043960000438c000043820000",
INIT_4c => X"4382000043700000435c0000434800004334000043200000430c000042f00000",
INIT_4d => X"43d2000043c8000043be000043b4000043aa000043a0000043960000438c0000",
INIT_4e => X"438c00004382000043700000435c0000434800004334000043200000430c0000",
INIT_4f => X"43dc000043d2000043c8000043be000043b4000043aa000043a0000043960000",
INIT_50 => X"43960000438c00004382000043700000435c0000434800004334000043200000",
INIT_51 => X"43e6000043dc000043d2000043c8000043be000043b4000043aa000043a00000",
INIT_52 => X"43a0000043960000438c00004382000043700000435c00004348000043340000",
INIT_53 => X"43f0000043e6000043dc000043d2000043c8000043be000043b4000043aa0000",
INIT_54 => X"43aa000043a0000043960000438c00004382000043700000435c000043480000",
INIT_55 => X"43fa000043f0000043e6000043dc000043d2000043c8000043be000043b40000",
INIT_56 => X"43b4000043aa000043a0000043960000438c00004382000043700000435c0000",
INIT_57 => X"4402000043fa000043f0000043e6000043dc000043d2000043c8000043be0000",
INIT_58 => X"43be000043b4000043aa000043a0000043960000438c00004382000043700000",
INIT_59 => X"440700004402000043fa000043f0000043e6000043dc000043d2000043c80000",
INIT_5a => X"43c8000043be000043b4000043aa000043a0000043960000438c000043820000",
INIT_5b => X"440c0000440700004402000043fa000043f0000043e6000043dc000043d20000",
INIT_5c => X"43d2000043c8000043be000043b4000043aa000043a0000043960000438c0000",
INIT_5d => X"44110000440c0000440700004402000043fa000043f0000043e6000043dc0000",
INIT_5e => X"43dc000043d2000043c8000043be000043b4000043aa000043a0000043960000",
INIT_5f => X"4416000044110000440c0000440700004402000043fa000043f0000043e60000",
INIT_60 => X"43520000433400004316000042f0000042b400004270000041f0000022000000",
INIT_61 => X"43e1000043d2000043c3000043b4000043a50000439600004387000043700000",
INIT_62 => X"4370000043520000433400004316000042f0000042b400004270000041f00000",
INIT_63 => X"43f0000043e1000043d2000043c3000043b4000043a500004396000043870000",
INIT_64 => X"438700004370000043520000433400004316000042f0000042b4000042700000",
INIT_65 => X"43ff000043f0000043e1000043d2000043c3000043b4000043a5000043960000",
INIT_66 => X"43960000438700004370000043520000433400004316000042f0000042b40000",
INIT_67 => X"4407000043ff000043f0000043e1000043d2000043c3000043b4000043a50000",
INIT_68 => X"43a5000043960000438700004370000043520000433400004316000042f00000",
INIT_69 => X"440e80004407000043ff000043f0000043e1000043d2000043c3000043b40000",
INIT_6a => X"43b4000043a50000439600004387000043700000435200004334000043160000",
INIT_6b => X"44160000440e80004407000043ff000043f0000043e1000043d2000043c30000",
INIT_6c => X"43c3000043b4000043a500004396000043870000437000004352000043340000",
INIT_6d => X"441d800044160000440e80004407000043ff000043f0000043e1000043d20000",
INIT_6e => X"43d2000043c3000043b4000043a5000043960000438700004370000043520000",
INIT_6f => X"44250000441d800044160000440e80004407000043ff000043f0000043e10000",
INIT_70 => X"43e1000043d2000043c3000043b4000043a50000439600004387000043700000",
INIT_71 => X"442c800044250000441d800044160000440e80004407000043ff000043f00000",
INIT_72 => X"43f0000043e1000043d2000043c3000043b4000043a500004396000043870000",
INIT_73 => X"44340000442c800044250000441d800044160000440e80004407000043ff0000",
INIT_74 => X"43ff000043f0000043e1000043d2000043c3000043b4000043a5000043960000",
INIT_75 => X"443b800044340000442c800044250000441d800044160000440e800044070000",
INIT_76 => X"4407000043ff000043f0000043e1000043d2000043c3000043b4000043a50000",
INIT_77 => X"44430000443b800044340000442c800044250000441d800044160000440e8000",
INIT_78 => X"440e80004407000043ff000043f0000043e1000043d2000043c3000043b40000",
INIT_79 => X"444a800044430000443b800044340000442c800044250000441d800044160000",
INIT_7a => X"44160000440e80004407000043ff000043f0000043e1000043d2000043c30000",
INIT_7b => X"44520000444a800044430000443b800044340000442c800044250000441d8000",
INIT_7c => X"441d800044160000440e80004407000043ff000043f0000043e1000043d20000",
INIT_7d => X"4459800044520000444a800044430000443b800044340000442c800044250000",
INIT_7e => X"44250000441d800044160000440e80004407000043ff000043f0000043e10000",
INIT_7f => X"446100004459800044520000444a800044430000443b800044340000442c8000"
)
PORT MAP (
DO => odata_ct34,
DOP => open,
ADDR => address_ct34,
CLK => i_clock,
DI => (others => '0'),
DIP => (others => '0'),
EN => '1',
SSR => i_reset,
WE => '0'
);

end Behavioral;
