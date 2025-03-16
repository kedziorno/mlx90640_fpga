-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   17:31:56 01/24/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   mem_ramb16_s36_x2
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Make synchronous RAM/ROM 1024x32bit from 2 Block RAMs
--                Type of switch - c_mode_com, c_mode_seq
--                Output and enable must be combinatorial (this works after syn)
--                First half - INIT_00 to INIT_3F
--                Second half - INIT_40 to INIT_7F
--                Rest pins as normal (follow Xilinx datasheet)
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    global_package.vhd
--  - Modules:
--    RAMB16_S36
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules: -
--    - Processes (Architecture: rtl):
--      - p0, p1 - combinatorial
--      - p2, p3 - sequential
--
-- Imporant objects: -
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos:
--    - Synchronous version after synthesis dont see first/second half RAM
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones: -
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

use work.global_package.all;

entity mem_ramb16_s36_x2 is
generic (
constant c_mode : integer := c_mode_com;
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
port (
signal DO : out std_logic_vector (31 downto 0);
signal DOP : out std_logic_vector (3 downto 0);
signal ADDR : in std_logic_vector (9 downto 0); -- 10bit-1024
signal CLK : in std_logic;
signal DI : in std_logic_vector (31 downto 0);
signal DIP : in std_logic_vector (3 downto 0);
signal EN : in std_logic;
signal SSR : in std_logic;
signal WE : in std_logic
);
end mem_ramb16_s36_x2;

architecture rtl of mem_ramb16_s36_x2 is

signal DO1,DO2 : std_logic_vector (31 downto 0);
signal DOP1,DOP2 : std_logic_vector (3 downto 0);
signal ADDR1,ADDR2 : std_logic_vector (8 downto 0);
signal CLK1,CLK2 : std_logic;
signal DI1,DI2 : std_logic_vector (31 downto 0);
signal DIP1,DIP2 : std_logic_vector (3 downto 0);
signal EN1,EN2 : std_logic;
signal SSR1,SSR2 : std_logic;
signal WE1,WE2 : std_logic;
signal EN_i : std_logic;

begin

--EN_i <= not CLK; -- XXX BAD
--EN_i <= '1'; -- XXX always enabled, check differents in syn report (more power)
EN_i <= EN;

ADDR1 <= ADDR (8 downto 0);
ADDR2 <= ADDR (8 downto 0);
CLK1 <= CLK;
SSR1 <= SSR;
WE1 <= WE;
CLK2 <= CLK;
SSR2 <= SSR;
WE2 <= WE;
DI1 <= DI;
DIP1 <= DIP;
DI2 <= DI;
DIP2 <= DIP;

-- XXX Combinatorial version
g_mem_ramb16_s36_x2_1 : if (c_mode = c_mode_com) generate

p0 : process (EN1, EN2, DO1, DOP1, DO2, DOP2) is -- XXX Switch output between banks
begin
	DO <= (others => '0');
	DOP <= (others => '0');
	if (EN1 = '1' and EN2 = '0') then
		DO <= DO1;
		DOP <= DOP1;
	end if;
	if (EN1 = '0' and EN2 = '1') then
		DO <= DO2;
		DOP <= DOP2;
	end if;
end process p0;

p1 : process (ADDR(9), EN_i) is -- XXX Enable bank depend on MSB ADDR (9)
begin
  EN1 <= '0';
  EN2 <= '0';
  if (ADDR (9) = '0') then
    EN1 <= EN_i;
    EN2 <= '0';
  end if;
  if (ADDR (9) = '1') then
    EN1 <= '0';
    EN2 <= EN_i;
  end if;
end process p1;

end generate g_mem_ramb16_s36_x2_1;

-- XXX Synchronous version, works in behavioral simulation
g_mem_ramb16_s36_x2_2 : if (c_mode = c_mode_seq) generate

p2 : process (CLK) is
begin
	if (rising_edge (CLK)) then
		if (ADDR (9) = '0') then
			EN1 <= EN_i;
			EN2 <= '0';
--			SSR1 <= '0';
--			SSR2 <= SSR;
		end if;
		if (ADDR (9) = '1') then
			EN1 <= '0';
			EN2 <= EN_i;
--			SSR1 <= SSR;
--			SSR2 <= '0';
		end if;
	end if;
end process p2;

p3 : process (CLK,SSR) is
begin
	if (SSR = '1') then
		DO <= (others => '0');
		DOP <= (others => '0');
	elsif (rising_edge (CLK)) then
    if (EN1 = '1' and EN2 = '0') then
      DO <= DO1;
      DOP <= DOP1;
    elsif (EN1 = '0' and EN2 = '1') then
      DO <= DO2;
      DOP <= DOP2;
    else
      DO <= (others => '0');
      DOP <= (others => '0');
    end if;
	end if;
end process p3;

end generate g_mem_ramb16_s36_x2_2;

RAMB16_S36_i1 : RAMB16_S36
generic map (
INIT => X"000000000", -- Value of output RAM registers at startup
SRVAL => X"000000000", -- Output value upon SSR assertion
WRITE_MODE => "NO_CHANGE", -- WRITE_FIRST, READ_FIRST or NO_CHANGE
-- The following INIT_xx declarations specify the initial contents of the RAM
-- Address 0 to 127
INIT_00 => INIT_00,
INIT_01 => INIT_01,
INIT_02 => INIT_02,
INIT_03 => INIT_03,
INIT_04 => INIT_04,
INIT_05 => INIT_05,
INIT_06 => INIT_06,
INIT_07 => INIT_07,
INIT_08 => INIT_08,
INIT_09 => INIT_09,
INIT_0A => INIT_0a,
INIT_0B => INIT_0b,
INIT_0C => INIT_0c,
INIT_0D => INIT_0d,
INIT_0E => INIT_0e,
INIT_0F => INIT_0f,
-- Address 128 to 255
INIT_10 => INIT_10,
INIT_11 => INIT_11,
INIT_12 => INIT_12,
INIT_13 => INIT_13,
INIT_14 => INIT_14,
INIT_15 => INIT_15,
INIT_16 => INIT_16,
INIT_17 => INIT_17,
INIT_18 => INIT_18,
INIT_19 => INIT_19,
INIT_1A => INIT_1a,
INIT_1B => INIT_1b,
INIT_1C => INIT_1c,
INIT_1D => INIT_1d,
INIT_1E => INIT_1e,
INIT_1F => INIT_1f,
-- Address 256 to 383
INIT_20 => INIT_20,
INIT_21 => INIT_21,
INIT_22 => INIT_22,
INIT_23 => INIT_23,
INIT_24 => INIT_24,
INIT_25 => INIT_25,
INIT_26 => INIT_26,
INIT_27 => INIT_27,
INIT_28 => INIT_28,
INIT_29 => INIT_29,
INIT_2A => INIT_2a,
INIT_2B => INIT_2b,
INIT_2C => INIT_2c,
INIT_2D => INIT_2d,
INIT_2E => INIT_2e,
INIT_2F => INIT_2f,
-- Address 384 to 511
INIT_30 => INIT_30,
INIT_31 => INIT_31,
INIT_32 => INIT_32,
INIT_33 => INIT_33,
INIT_34 => INIT_34,
INIT_35 => INIT_35,
INIT_36 => INIT_36,
INIT_37 => INIT_37,
INIT_38 => INIT_38,
INIT_39 => INIT_39,
INIT_3A => INIT_3a,
INIT_3B => INIT_3b,
INIT_3C => INIT_3c,
INIT_3D => INIT_3d,
INIT_3E => INIT_3e,
INIT_3F => INIT_3f,
-- The next set of INITP_xx are for the parity bits
-- Address 0 to 127
INITP_00 => INITP_00,
INITP_01 => INITP_01,
-- Address 128 to 255
INITP_02 => INITP_02,
INITP_03 => INITP_03,
-- Address 256 to 383
INITP_04 => INITP_04,
INITP_05 => INITP_05,
-- Address 384 to 511
INITP_06 => INITP_06,
INITP_07 => INITP_07
)
port map (
DO => DO1, -- 32-bit Data Output
DOP => DOP1, -- 4-bit parity Output
ADDR => ADDR1, -- 9-bit Address Input
CLK => CLK1, -- Clock
DI => DI1, -- 32-bit Data Input
DIP => DIP1, -- 4-bit parity Input
EN => EN1, -- RAM Enable Input
SSR => SSR1, -- Synchronous Set/Reset Input
WE => WE1 -- Write Enable Input
);

RAMB16_S36_i2 : RAMB16_S36
generic map (
INIT => X"000000000", -- Value of output RAM registers at startup
SRVAL => X"000000000", -- Output value upon SSR assertion
WRITE_MODE => "NO_CHANGE", -- WRITE_FIRST, READ_FIRST or NO_CHANGE
-- The following INIT_xx declarations specify the initial contents of the RAM
-- Address 0 to 127
INIT_00 => INIT_40,
INIT_01 => INIT_41,
INIT_02 => INIT_42,
INIT_03 => INIT_43,
INIT_04 => INIT_44,
INIT_05 => INIT_45,
INIT_06 => INIT_46,
INIT_07 => INIT_47,
INIT_08 => INIT_48,
INIT_09 => INIT_49,
INIT_0A => INIT_4a,
INIT_0B => INIT_4b,
INIT_0C => INIT_4c,
INIT_0D => INIT_4d,
INIT_0E => INIT_4e,
INIT_0F => INIT_4f,
-- Address 128 to 255
INIT_10 => INIT_50,
INIT_11 => INIT_51,
INIT_12 => INIT_52,
INIT_13 => INIT_53,
INIT_14 => INIT_54,
INIT_15 => INIT_55,
INIT_16 => INIT_56,
INIT_17 => INIT_57,
INIT_18 => INIT_58,
INIT_19 => INIT_59,
INIT_1A => INIT_5a,
INIT_1B => INIT_5b,
INIT_1C => INIT_5c,
INIT_1D => INIT_5d,
INIT_1E => INIT_5e,
INIT_1F => INIT_5f,
-- Address 256 to 383
INIT_20 => INIT_60,
INIT_21 => INIT_61,
INIT_22 => INIT_62,
INIT_23 => INIT_63,
INIT_24 => INIT_64,
INIT_25 => INIT_65,
INIT_26 => INIT_66,
INIT_27 => INIT_67,
INIT_28 => INIT_68,
INIT_29 => INIT_69,
INIT_2A => INIT_6a,
INIT_2B => INIT_6b,
INIT_2C => INIT_6c,
INIT_2D => INIT_6d,
INIT_2E => INIT_6e,
INIT_2F => INIT_6f,
-- Address 384 to 511
INIT_30 => INIT_70,
INIT_31 => INIT_71,
INIT_32 => INIT_72,
INIT_33 => INIT_73,
INIT_34 => INIT_74,
INIT_35 => INIT_75,
INIT_36 => INIT_76,
INIT_37 => INIT_77,
INIT_38 => INIT_78,
INIT_39 => INIT_79,
INIT_3A => INIT_7a,
INIT_3B => INIT_7b,
INIT_3C => INIT_7c,
INIT_3D => INIT_7d,
INIT_3E => INIT_7e,
INIT_3F => INIT_7f,
-- The next set of INITP_xx are for the parity bits
-- Address 0 to 127
INITP_00 => INITP_08,
INITP_01 => INITP_09,
-- Address 128 to 255
INITP_02 => INITP_0a,
INITP_03 => INITP_0b,
-- Address 256 to 383
INITP_04 => INITP_0c,
INITP_05 => INITP_0d,
-- Address 384 to 511
INITP_06 => INITP_0e,
INITP_07 => INITP_0f
)
port map (
DO => DO2, -- 32-bit Data Output
DOP => DOP2, -- 4-bit parity Output
ADDR => ADDR2, -- 9-bit Address Input
CLK => CLK2, -- Clock
DI => DI2, -- 32-bit Data Input
DIP => DIP2, -- 4-bit parity Input
EN => EN2, -- RAM Enable Input
SSR => SSR2, -- Synchronous Set/Reset Input
WE => WE2 -- Write Enable Input
);

end architecture rtl;

