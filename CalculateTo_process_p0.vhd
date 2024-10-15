----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:11 06/16/2023 
-- Design Name: 
-- Module Name:    CalculateTo_process_p0 - Behavioral 
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

use work.p_fphdl_package3.all;

entity CalculateTo_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_Ta : IN  std_logic_vector(31 downto 0);

i_vircompensated_do : IN  std_logic_vector(31 downto 0);
o_vircompensated_addr : OUT  std_logic_vector(9 downto 0);

i_alphacomp_do : IN  std_logic_vector(31 downto 0);
o_alphacomp_addr : OUT  std_logic_vector(9 downto 0);

o_write_enable : out std_logic;
o_addra : out std_logic_vector (9 downto 0);
o_dia : out std_logic_vector (31 downto 0);

ExtractKsToScaleParameter_run : out std_logic;
ExtractKsToScaleParameter_mux : out std_logic;
ExtractKsToScaleParameter_rdy : in std_logic;
ExtractKsToScaleParameter_kstoscale : in std_logic_vector (31 downto 0);

mem_signed256_ovalue : in std_logic_vector (31 downto 0);
mem_signed256_ivalue : out std_logic_vector (7 downto 0);

o_rdy : out std_logic;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;

signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC;

signal subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : out STD_LOGIC;
signal subfpsclr : out STD_LOGIC;
signal subfpce : out STD_LOGIC;
signal subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : in STD_LOGIC;

signal sqrtfp2a : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : out STD_LOGIC;
signal sqrtfp2sclr : out STD_LOGIC;
signal sqrtfp2ce : out STD_LOGIC;
signal sqrtfp2r : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : in STD_LOGIC

);
end CalculateTo_process_p0;

architecture Behavioral of CalculateTo_process_p0 is

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;

signal mulfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond_internal : STD_LOGIC;
signal mulfpsclr_internal : STD_LOGIC;
signal mulfpce_internal : STD_LOGIC;
signal mulfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy_internal : STD_LOGIC;

signal addfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond_internal : STD_LOGIC;
signal addfpsclr_internal : STD_LOGIC;
signal addfpce_internal : STD_LOGIC;
signal addfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy_internal : STD_LOGIC;

signal subfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond_internal : STD_LOGIC;
signal subfpsclr_internal : STD_LOGIC;
signal subfpce_internal : STD_LOGIC;
signal subfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy_internal : STD_LOGIC;

signal sqrtfp2a_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond_internal : STD_LOGIC;
signal sqrtfp2sclr_internal : STD_LOGIC;
signal sqrtfp2ce_internal : STD_LOGIC;
signal sqrtfp2r_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy_internal : STD_LOGIC;

signal i2c_mem_ena_internal : STD_LOGIC;
signal i2c_mem_addra_internal : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta_internal : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

mulfpa <= mulfpa_internal;
mulfpb <= mulfpb_internal;
mulfpond <= mulfpond_internal;
mulfpsclr <= mulfpsclr_internal;
mulfpce <= mulfpce_internal;
mulfpr_internal <= mulfpr;
mulfprdy_internal <= mulfprdy;

addfpa <= addfpa_internal;
addfpb <= addfpb_internal;
addfpond <= addfpond_internal;
addfpsclr <= addfpsclr_internal;
addfpce <= addfpce_internal;
addfpr_internal <= addfpr;
addfprdy_internal <= addfprdy;

subfpa <= subfpa_internal;
subfpb <= subfpb_internal;
subfpond <= subfpond_internal;
subfpsclr <= subfpsclr_internal;
subfpce <= subfpce_internal;
subfpr_internal <= subfpr;
subfprdy_internal <= subfprdy;

sqrtfp2a <= sqrtfp2a_internal;
sqrtfp2ond <= sqrtfp2ond_internal;
sqrtfp2sclr <= sqrtfp2sclr_internal;
sqrtfp2ce <= sqrtfp2ce_internal;
sqrtfp2r_internal <= sqrtfp2r;
sqrtfp2rdy_internal <= sqrtfp2rdy;

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	constant constTr : std_logic_vector (31 downto 0) := x"41000000"; -- 8
	constant const27315 : std_logic_vector (31 downto 0) := x"43889333"; -- 273.15
	constant constEmissivity : std_logic_vector (31 downto 0) := x"3f800000"; -- 1
	constant const1 : std_logic_vector (31 downto 0) := x"3f800000"; -- 1
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s10a,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,
	s31,s32,s33,s34,s35,s36,s37,s38,s39,s40,
	s41,s42,s43,s44,s45,s46,s47,s48,s49,s50,
	s51,s52,s53,s54,s55,s56,s57,s58,s59,s60,
	s61,s62,s63,s64,s65,s66,s67,s68,s69,s70,
	s71,
	ending);
	variable state : states;
	variable fttmp1,fttmp2,ksto2,tak4,trk4,tar,sx,acomp_pow3,acomp_pow4,tr : std_logic_vector (31 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			i := 0;
			i2c_mem_ena_internal <= '0';
			o_rdy <= '0';
			addfpsclr_internal <= '1';
			subfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			divfpsclr_internal <= '1';
			sqrtfp2sclr_internal <= '1';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			subfpa_internal <= (others => '0');
			subfpb_internal <= (others => '0');
			divfpa_internal <= (others => '0');
			divfpb_internal <= (others => '0');
			sqrtfp2a_internal <= (others => '0');
			mulfpond_internal <= '0';
			addfpond_internal <= '0';
			subfpond_internal <= '0';
			divfpond_internal <= '0';
			sqrtfp2ond_internal <= '0';
			mulfpce_internal <= '0';
			addfpce_internal <= '0';
			subfpce_internal <= '0';
			divfpce_internal <= '0';
			sqrtfp2ce_internal <= '0';
			o_vircompensated_addr <= (others => '0');
			o_alphacomp_addr <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
						i2c_mem_ena_internal <= '1';
					else
						state := idle;
						i2c_mem_ena_internal <= '0';
					end if;
					i := 0;
					addfpsclr_internal <= '0';
					subfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
					sqrtfp2sclr_internal <= '0';
				when s1 => state := s2;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (61*2+0, 12)); -- ee243d MSB ksto2ee 0xff00
				when s2 => state := s3;
				when s3 => state := s4;
					mem_signed256_ivalue <= i2c_mem_douta_internal; -- ksto2ee

	when s4 => state := s5;
		ExtractKsToScaleParameter_run <= '1';
		ExtractKsToScaleParameter_mux <= '1';
	when s5 => 
		ExtractKsToScaleParameter_run <= '0';
		if (ExtractKsToScaleParameter_rdy = '1') then
			state := s6;
			ExtractKsToScaleParameter_mux <= '0';
		else
			state := s5;
			ExtractKsToScaleParameter_mux <= '1';
		end if;

	when s6 => state := s7;
		divfpce_internal <= '1';
		divfpa_internal <= mem_signed256_ovalue;
		divfpb_internal <= ExtractKsToScaleParameter_kstoscale;
		divfpond_internal <= '1';
	when s7 =>
		if (divfprdy_internal = '1') then state := s8;
			ksto2 := divfpr_internal;
			divfpce_internal <= '0';
			divfpond_internal <= '0';
			divfpsclr_internal <= '1';
		else state := s7; end if;
	when s8 => state := s9;
		divfpsclr_internal <= '0';
--		--report "================ To ksto2 : " & real'image (ap_slv2fp (ksto2));

		subfpce_internal <= '1';
		subfpa_internal <= i_Ta;
		subfpb_internal <= constTr;
		subfpond_internal <= '1';
	when s9 =>
		if (subfprdy_internal = '1') then state := s10;
			Tr := subfpr_internal; -- Tr~=Ta-8
			subfpce_internal <= '0';
			subfpond_internal <= '0';
			subfpsclr_internal <= '1';
		else state := s9; end if;
	when s10 => state := s10a;
		subfpsclr_internal <= '0';

		addfpce_internal <= '1';
		addfpa_internal <= i_Ta;
		addfpb_internal <= const27315;
		addfpond_internal <= '1';
	when s10a =>
		if (addfprdy_internal = '1') then state := s11;
			fttmp1 := addfpr_internal; -- Ta + 273.15
			addfpce_internal <= '0';
			addfpond_internal <= '0';
			addfpsclr_internal <= '1';
		else state := s10; end if;
	when s11 => state := s12;
		addfpsclr_internal <= '0';
		mulfpce_internal <= '1';
		mulfpa_internal <= fttmp1;
		mulfpb_internal <= fttmp1;
		mulfpond_internal <= '1';
	when s12 =>
		if (mulfprdy_internal = '1') then state := s13;
			fttmp2 := mulfpr_internal; -- (Ta + 273.15)^2
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s12; end if;
	when s13 => state := s14;
		mulfpsclr_internal <= '0';
		mulfpce_internal <= '1';
		mulfpa_internal <= fttmp2;
		mulfpb_internal <= fttmp1;
		mulfpond_internal <= '1';
	when s14 =>
		if (mulfprdy_internal = '1') then state := s15;
			fttmp2 := mulfpr_internal; -- (Ta + 273.15)^3
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s14; end if;
	when s15 => state := s16;
		mulfpsclr_internal <= '0';
		mulfpce_internal <= '1';
		mulfpa_internal <= fttmp2;
		mulfpb_internal <= fttmp1;
		mulfpond_internal <= '1';
	when s16 =>
		if (mulfprdy_internal = '1') then state := s17;
			tak4 := mulfpr_internal; -- TaK4=(Ta + 273.15)^4
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s16; end if;
	when s17 => state := s18;
		mulfpsclr_internal <= '0';

		addfpce_internal <= '1';
		addfpa_internal <= Tr;
		addfpb_internal <= const27315;
		addfpond_internal <= '1';
	when s18 =>
		if (addfprdy_internal = '1') then state := s19;
			fttmp1 := addfpr_internal; -- Tr + 273.15
			addfpce_internal <= '0';
			addfpond_internal <= '0';
			addfpsclr_internal <= '1';
		else state := s18; end if;
	when s19 => state := s20;
		addfpsclr_internal <= '0';
		mulfpce_internal <= '1';
		mulfpa_internal <= fttmp1;
		mulfpb_internal <= fttmp1;
		mulfpond_internal <= '1';
	when s20 =>
		if (mulfprdy_internal = '1') then state := s21;
			fttmp2 := mulfpr_internal; -- (Tr + 273.15)^2
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s20; end if;
	when s21 => state := s22;
		mulfpsclr_internal <= '0';
		mulfpce_internal <= '1';
		mulfpa_internal <= fttmp2;
		mulfpb_internal <= fttmp1;
		mulfpond_internal <= '1';
	when s22 =>
		if (mulfprdy_internal = '1') then state := s23;
			fttmp2 := mulfpr_internal; -- (Tr + 273.15)^3
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s22; end if;
	when s23 => state := s24;
		mulfpsclr_internal <= '0';
		mulfpce_internal <= '1';
		mulfpa_internal <= fttmp2;
		mulfpb_internal <= fttmp1;
		mulfpond_internal <= '1';
	when s24 =>
		if (mulfprdy_internal = '1') then state := s25;
			trk4 := mulfpr_internal; -- TrK4=(Tr + 273.15)^4
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s24; end if;
	when s25 => state := s26;
		mulfpsclr_internal <= '0';

		subfpce_internal <= '1';
		subfpa_internal <= trk4;
		subfpb_internal <= tak4;
		subfpond_internal <= '1';
	when s26 =>
		if (subfprdy_internal = '1') then state := s27;
			fttmp1 := subfpr_internal; -- TrK4-TaK4
			subfpce_internal <= '0';
			subfpond_internal <= '0';
			subfpsclr_internal <= '1';
		else state := s26; end if;
	when s27 => state := s28;
		subfpsclr_internal <= '0';

		divfpce_internal <= '1';
		divfpa_internal <= fttmp1; -- TrK4-TaK4
		divfpb_internal <= constEmissivity; -- Emissivity
		divfpond_internal <= '1';
	when s28 =>
		if (divfprdy_internal = '1') then state := s29;
			fttmp1 := divfpr_internal; -- (TrK4-TaK4)/Emissivity
			divfpce_internal <= '0';
			divfpond_internal <= '0';
			divfpsclr_internal <= '1';
		else state := s28; end if;
	when s29 => state := s30;
		divfpsclr_internal <= '0';

		subfpce_internal <= '1';
		subfpa_internal <= trk4;
		subfpb_internal <= fttmp1;
		subfpond_internal <= '1';
	when s30 =>
		if (subfprdy_internal = '1') then state := s31;
			tar := subfpr_internal; -- TrK4-((TrK4-TaK4)/Emissivity)
			subfpce_internal <= '0';
			subfpond_internal <= '0';
			subfpsclr_internal <= '1';
		else state := s30; end if;
	when s31 => state := s32;
		subfpsclr_internal <= '0';
	when s32 => state := s33;
		o_vircompensated_addr <= std_logic_vector (to_unsigned (i, 10));
		o_alphacomp_addr <= std_logic_vector (to_unsigned (i, 10));
	when s33 => state := s34;
	when s34 => state := s35;
		mulfpa_internal <= i_alphacomp_do;
		mulfpb_internal <= i_alphacomp_do;
		mulfpce_internal <= '1';
		mulfpond_internal <= '1';
	when s35 =>
		if (mulfprdy_internal = '1') then state := s36;
			fttmp1 := mulfpr_internal; -- alphacomp^2
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s35; end if;
	when s36 => state := s37;
		mulfpsclr_internal <= '0';
		mulfpce_internal <= '1';
		mulfpa_internal <= fttmp1;
		mulfpb_internal <= i_alphacomp_do;
		mulfpond_internal <= '1';
	when s37 =>
		if (mulfprdy_internal = '1') then state := s38;
			acomp_pow3 := mulfpr_internal; -- alphacomp^3
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s37; end if;
	when s38 => state := s39;
		mulfpsclr_internal <= '0';
		mulfpce_internal <= '1';
		mulfpa_internal <= acomp_pow3;
		mulfpb_internal <= i_alphacomp_do;
		mulfpond_internal <= '1';
	when s39 =>
		if (mulfprdy_internal = '1') then state := s40;
			acomp_pow4 := mulfpr_internal; -- alphacomp^4
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s39; end if;
	when s40 => state := s41;
		mulfpsclr_internal <= '0';

		mulfpce_internal <= '1';
		mulfpa_internal <= acomp_pow3;
		mulfpb_internal <= i_vircompensated_do;
		mulfpond_internal <= '1';
	when s41 =>
		if (mulfprdy_internal = '1') then state := s42;
			fttmp1 := mulfpr_internal; -- alphacomp^3*vircompensated
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s41; end if;
	when s42 => state := s43;
		mulfpsclr_internal <= '0';

		mulfpce_internal <= '1';
		mulfpa_internal <= acomp_pow4;
		mulfpb_internal <= tar;
		mulfpond_internal <= '1';
	when s43 =>
		if (mulfprdy_internal = '1') then state := s44;
			fttmp2 := mulfpr_internal; -- alphacomp^4*Tar
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s43; end if;
	when s44 => state := s45;
		mulfpsclr_internal <= '0';

		addfpce_internal <= '1';
		addfpa_internal <= fttmp1; -- alphacomp^3*vircompensated 
		addfpb_internal <= fttmp2; -- alphacomp^4*Tar
		addfpond_internal <= '1';
	when s45 =>
		if (addfprdy_internal = '1') then state := s46;
			fttmp1 := addfpr_internal; -- (alphacomp^3*vircompensated)+(alphacomp^4*Tar)
			addfpce_internal <= '0';
			addfpond_internal <= '0';
			addfpsclr_internal <= '1';
		else state := s45; end if;
	when s46 => state := s47;
		addfpsclr_internal <= '0';

		sqrtfp2ce_internal <= '1';
		sqrtfp2a_internal <= fttmp1;
		sqrtfp2ond_internal <= '1';
	when s47 =>
		if (sqrtfp2rdy_internal = '1') then state := s48;
			fttmp1 := sqrtfp2r_internal; -- sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar))
			sqrtfp2ce_internal <= '0';
			sqrtfp2ond_internal <= '0';
			sqrtfp2sclr_internal <= '1';
		else state := s47; end if;
	when s48 => state := s49;
		sqrtfp2sclr_internal <= '0';

		sqrtfp2ce_internal <= '1';
		sqrtfp2a_internal <= fttmp1;
		sqrtfp2ond_internal <= '1';
	when s49 =>
		if (sqrtfp2rdy_internal = '1') then state := s50;
			sx := sqrtfp2r_internal; -- sqrt2(sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar)))
			sqrtfp2ce_internal <= '0';
			sqrtfp2ond_internal <= '0';
			sqrtfp2sclr_internal <= '1';
		else state := s49; end if;
	when s50 => state := s51;
		sqrtfp2sclr_internal <= '0';

		mulfpce_internal <= '1';
		mulfpa_internal <= sx;
		mulfpb_internal <= ksto2;
		mulfpond_internal <= '1';
	when s51 =>
		if (mulfprdy_internal = '1') then state := s52;
			sx := mulfpr_internal; -- ksto2*sqrt2(sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar)))
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s51; end if;
	when s52 => state := s53;
		mulfpsclr_internal <= '0';

		mulfpce_internal <= '1';
		mulfpa_internal <= ksto2;
		mulfpb_internal <= const27315;
		mulfpond_internal <= '1';
	when s53 =>
		if (mulfprdy_internal = '1') then state := s54;
			fttmp2 := mulfpr_internal; -- ksto2*273.15
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s53; end if;
	when s54 => state := s55;
		mulfpsclr_internal <= '0';

		subfpce_internal <= '1';
		subfpa_internal <= const1;
		subfpb_internal <= fttmp2;
		subfpond_internal <= '1';
	when s55 =>
		if (subfprdy_internal = '1') then state := s56;
			fttmp2 := subfpr_internal; -- 1-ksto2*273.15
			subfpce_internal <= '0';
			subfpond_internal <= '0';
			subfpsclr_internal <= '1';
		else state := s55; end if;
	when s56 => state := s57;
		subfpsclr_internal <= '0';

		mulfpce_internal <= '1';
		mulfpa_internal <= i_alphacomp_do;
		mulfpb_internal <= fttmp2;
		mulfpond_internal <= '1';
	when s57 =>
		if (mulfprdy_internal = '1') then state := s58;
			fttmp2 := mulfpr_internal; -- alphacomp*(1-ksto2*273.15)
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mulfpsclr_internal <= '1';
		else state := s57; end if;
	when s58 => state := s59;
		mulfpsclr_internal <= '0';

		addfpce_internal <= '1';
		addfpa_internal <= fttmp2;
		addfpb_internal <= sx;
		addfpond_internal <= '1';
	when s59 =>
		if (addfprdy_internal = '1') then state := s60;
			fttmp1 := addfpr_internal; -- alphacomp*(1-ksto2*273.15)+sx
			addfpce_internal <= '0';
			addfpond_internal <= '0';
			addfpsclr_internal <= '1';
		else state := s59; end if;
	when s60 => state := s61;
		addfpsclr_internal <= '0';

		divfpce_internal <= '1';
		divfpa_internal <= i_vircompensated_do;
		divfpb_internal <= fttmp1;
		divfpond_internal <= '1';
	when s61 =>
		if (divfprdy_internal = '1') then state := s62;
			fttmp1 := divfpr_internal; -- vircompensated/(alphacomp*(1-ksto2*273.15)+sx)
			divfpce_internal <= '0';
			divfpond_internal <= '0';
			divfpsclr_internal <= '1';
		else state := s61; end if;
	when s62 => state := s63;
		divfpsclr_internal <= '0';

		addfpce_internal <= '1';
		addfpa_internal <= fttmp1;
		addfpb_internal <= tar;
		addfpond_internal <= '1';
	when s63 =>
		if (addfprdy_internal = '1') then state := s64;
			fttmp1 := addfpr_internal; -- (vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar
			addfpce_internal <= '0';
			addfpond_internal <= '0';
			addfpsclr_internal <= '1';
		else state := s63; end if;
	when s64 => state := s65;
		addfpsclr_internal <= '0';

		sqrtfp2ce_internal <= '1';
		sqrtfp2a_internal <= fttmp1;
		sqrtfp2ond_internal <= '1';
	when s65 =>
		if (sqrtfp2rdy_internal = '1') then state := s66;
			fttmp1 := sqrtfp2r_internal; -- sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar)
			sqrtfp2ce_internal <= '0';
			sqrtfp2ond_internal <= '0';
			sqrtfp2sclr_internal <= '1';
		else state := s65; end if;
	when s66 => state := s67;
		sqrtfp2sclr_internal <= '0';

		sqrtfp2ce_internal <= '1';
		sqrtfp2a_internal <= fttmp1;
		sqrtfp2ond_internal <= '1';
	when s67 =>
		if (sqrtfp2rdy_internal = '1') then state := s68;
			fttmp1 := sqrtfp2r_internal; -- sqrt2(sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar))
			sqrtfp2ce_internal <= '0';
			sqrtfp2ond_internal <= '0';
			sqrtfp2sclr_internal <= '1';
		else state := s67; end if;
	when s68 => state := s69;
		sqrtfp2sclr_internal <= '0';

		subfpce_internal <= '1';
		subfpa_internal <= fttmp1;
		subfpb_internal <= const27315;
		subfpond_internal <= '1';
	when s69 =>
		if (subfprdy_internal = '1') then state := s70;
			fttmp1 := subfpr_internal; -- To = (sqrt2(sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar)))-273.15
			subfpce_internal <= '0';
			subfpond_internal <= '0';
			subfpsclr_internal <= '1';
		else state := s69; end if;
	when s70 => state := s71;
		subfpsclr_internal <= '0';

		o_write_enable <= '1';
		o_addra <= std_logic_vector (to_unsigned (i, 10)); -- To
		o_dia <= fttmp1;
              --synthesis translate_off

		report_error ("To " & integer'image (i), fttmp1, 0.0);
          --synthesis translate_on
	when s71 =>
		o_write_enable <= '0';
		if (i = (C_ROW*C_COL)-1) then
			state := ending;
			i := 0;
		else
			state := s32;
			i := i + 1;
		end if;

	when ending => state := idle;
		o_rdy <= '1';

				when others => null;
			end case;
		end if;
	end if;
end process p0;

end Behavioral;

