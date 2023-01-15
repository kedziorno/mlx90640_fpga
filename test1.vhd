----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:07 01/12/2023 
-- Design Name: 
-- Module Name:    test1 - Behavioral 
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
library ieee, ieee_proposed;
--library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;
use work.p_fphdl_package1.all;

entity test1 is
generic (
constant C_WAIT1 : integer := 1
);
port (
clock,reset : in std_logic;
out1 : out std_logic_vector (31 downto 0)
);
end test1;

architecture Behavioral of test1 is

COMPONENT float2fixed
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
overflow : OUT STD_LOGIC;
invalid_op : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal float2fixeda : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal float2fixedond : STD_LOGIC;
signal float2fixedorfd : STD_LOGIC;
signal float2fixedclk : STD_LOGIC;
signal float2fixedsclr : STD_LOGIC;
signal float2fixedce : STD_LOGIC;
signal float2fixedr : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal float2fixedof : STD_LOGIC;
signal float2fixediop : STD_LOGIC;
signal float2fixedrdy : STD_LOGIC;

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatorfd : STD_LOGIC;
signal fixed2floatclk : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;

COMPONENT divfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
underflow : OUT STD_LOGIC;
overflow : OUT STD_LOGIC;
invalid_op : OUT STD_LOGIC;
divide_by_zero : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfporfd : STD_LOGIC;
signal divfpclk : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpuf : STD_LOGIC;
signal divfpof : STD_LOGIC;
signal divfpiop : STD_LOGIC;
signal divfpdz : STD_LOGIC;
signal divfprdy : STD_LOGIC;

COMPONENT mulfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
underflow : OUT STD_LOGIC;
overflow : OUT STD_LOGIC;
invalid_op : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfporfd : STD_LOGIC;
signal mulfpclk : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpuf : STD_LOGIC;
signal mulfpof : STD_LOGIC;
signal mulfpiop : STD_LOGIC;
signal mulfprdy : STD_LOGIC;

COMPONENT addfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
underflow : OUT STD_LOGIC;
overflow : OUT STD_LOGIC;
invalid_op : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfporfd : STD_LOGIC;
signal addfpclk : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpuf : STD_LOGIC;
signal addfpof : STD_LOGIC;
signal addfpiop : STD_LOGIC;
signal addfprdy : STD_LOGIC;

COMPONENT subfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
underflow : OUT STD_LOGIC;
overflow : OUT STD_LOGIC;
invalid_op : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfporfd : STD_LOGIC;
signal subfpclk : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpuf : STD_LOGIC;
signal subfpof : STD_LOGIC;
signal subfpiop : STD_LOGIC;
signal subfprdy : STD_LOGIC;

COMPONENT sqrtfp2
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
invalid_op : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : STD_LOGIC;
signal sqrtfp2orfd : STD_LOGIC;
signal sqrtfp2clk : STD_LOGIC;
signal sqrtfp2sclr : STD_LOGIC;
signal sqrtfp2ce : STD_LOGIC;
signal sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2iop : STD_LOGIC;
signal sqrtfp2rdy : STD_LOGIC;

begin

float2fixedclk <= clock;
fixed2floatclk <= clock;
sqrtfp2clk <= clock;
addfpclk <= clock;
subfpclk <= clock;
mulfpclk <= clock;
divfpclk <= clock;

p0 : process (clock,reset) is
	variable v_wait1 : integer range 0 to C_WAIT1-1 := 0;
	type st is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37,s38,s39,s40,s41,s42,s43,s44,s45,s46,s47,s48,s49,s50);
	variable s : st := s0;
	subtype stsf_max is st_sfixed_max;
	subtype stsf_h1 is st_sfixed_h1;
	subtype stsf_h2 is st_sfixed_h2;
	variable a : stsf_max := (others => '0');
	constant acomp_const : stsf_max := to_sfixed (0.00000011876487360496, a);
	constant acomp_pow3_const : stsf_max := to_sfixed (0.0000000000000000000016751898488992162, a);
	constant acomp_pow4_const : stsf_max := to_sfixed (0.00000000000000000000000000019895371066882747, a);
	constant vircomp_const : stsf_max := to_sfixed (679.250909123826, a);
	constant ta_const : stsf_max := to_sfixed (9516495632.56, a);
	constant ksto2_const : stsf_max := to_sfixed (-0.00080108642578125, a);
	constant k27315 : stsf_max := to_sfixed (273.15, a); -- 0x43889333
	constant h1_0 : stsf_h1 := (others => '0');
	constant h2_0 : stsf_h2 := (others => '0');
	variable acomp1,acomp2,acomp3 : stsf_h1 := (others => '0');
	variable acomp5,acomp6 : stsf_h2 := (others => '0');
	variable acomp4 : stsf_max := (others => '0');
	variable sqrt2_1,sqrt2_2 : sfixed (24 downto 0);
	variable fraca : sfixed (FP_INTEGER-1 downto 0);
	variable fracb : sfixed (-1 downto -FP_FRACTION);
	variable acomp_f,acomp_pow3_f,acomp_pow4_f,vircomp_f,ta_f,ksto2_f,acomp_ta_f,acomp_ta_ksto2_f,k27315_f : std_logic_vector (31 downto 0);
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	constant onefp : std_logic_vector (31 downto 0) := x"3F800000";
begin
	if rising_edge (clock) then
		if (reset = '1') then
				fixed2floatsclr <= '1';
				float2fixedsclr <= '1';
				sqrtfp2sclr <= '1';
				addfpsclr <= '1';
				subfpsclr <= '1';
				mulfpsclr <= '1';
				out1 <= (others => '0');
				fixed2floata <= (others => '0');
				fixed2floatce <= '0';
				fixed2floatond <= '0';
				mulfpa <= (others => '0');
				mulfpb <= (others => '0');
				mulfpce <= '0';
				mulfpond <= '0';
				addfpa <= (others => '0');
				addfpb <= (others => '0');
				addfpce <= '0';
				addfpond <= '0';
				sqrtfp2a <= (others => '0');
				sqrtfp2ce <= '0';
				sqrtfp2ond <= '0';
		else
			case s is
				when s0 => s := s1;
					fixed2floatce <= '0';
					float2fixedce <= '0';
					sqrtfp2ce <= '0';
					addfpce <= '0';
					subfpce <= '0';
					mulfpce <= '0';
					divfpce <= '0';
					fixed2floata <= (others => '0');
					fixed2floatond <= '0';
					mulfpa <= (others => '0');
					mulfpb <= (others => '0');
					mulfpond <= '0';
				when s1 => s := s2;
					fixed2floatsclr <= '0';
					float2fixedsclr <= '0';
					sqrtfp2sclr <= '0';
					addfpsclr <= '0';
					subfpsclr <= '0';
					mulfpsclr <= '0';
				when s2 => s := s3;
					fixed2floatce <= '1';
					fixed2floatond <= '1';
					fixed2floata <= to_slv (resize (acomp_const, fraca)) & to_slv ( resize (acomp_const, fracb));
				when s3 =>
					if (fixed2floatrdy = '1') then s := s4;
						acomp_f := fixed2floatr; -- acomp float
						out1 <= acomp_f;
						fixed2floatce <= '0';
						fixed2floatond <= '0';
						fixed2floatsclr <= '1';
					else s := s3; end if;
				when s4 => s := s5;
					report_fixed_value ("acomp_const fix ", acomp_const);
					report "acomp_const real " & real'image (ap_slv2fp (fixed2floatr));
					report "acomp_const bin " & to_string (fixed2floata);
					fixed2floatsclr <= '0';
					mulfpa <= acomp_f;
					mulfpb <= acomp_f;
					mulfpce <= '1';
					mulfpond <= '1';
				when s5 =>
					if (mulfprdy = '1') then s := s6;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else s := s5; end if;
				when s6 => s := s7;
					mulfpsclr <= '0';
					mulfpce <= '1';
					mulfpa <= mulfpr;
					mulfpb <= acomp_f;
					mulfpond <= '1';
				when s7 =>
					if (mulfprdy = '1') then s := s8;
						acomp_pow3_f := mulfpr; -- acomp**3 float
						report "acomp_pow3_f real " & real'image (ap_slv2fp (acomp_pow3_f));
						out1 <= acomp_pow3_f;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else s := s7; end if;
				when s8 => s := s9;
					mulfpsclr <= '0';
					mulfpce <= '1';
					mulfpa <= mulfpr;
					mulfpb <= acomp_f;
					mulfpond <= '1';
				when s9 =>
					if (mulfprdy = '1') then s := s10;
						acomp_pow4_f := mulfpr; -- acomp**4 float
						report "acomp_pow4_f real " & real'image (ap_slv2fp (acomp_pow4_f));
						out1 <= acomp_pow4_f;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else s := s9; end if;
				when s10 => s:= s11;
					mulfpsclr <= '0';
					fixed2floatce <= '1';
					fixed2floatond <= '1';
					fixed2floata <= to_slv (resize (vircomp_const, fraca)) & to_slv ( resize (vircomp_const, fracb));
				when s11 =>
					if (fixed2floatrdy = '1') then s := s12;
						vircomp_f := fixed2floatr; -- vircomp float
						out1 <= vircomp_f;
						fixed2floatce <= '0';
						fixed2floatond <= '0';
						fixed2floatsclr <= '1';
					else s := s11; end if;
				when s12 => s := s13;
					report_fixed_value ("vircomp_const fix ", vircomp_const);
					report "vircomp_const real " & real'image (ap_slv2fp (fixed2floatr));
					report "vircomp_const bin " & to_string (fixed2floata);
					fixed2floatsclr <= '0';
					mulfpce <= '1';
					mulfpa <= acomp_pow3_f;
					mulfpb <= vircomp_f;
					mulfpond <= '1';
				when s13 =>
					if (mulfprdy = '1') then s := s14;
						fptmp1 := mulfpr; -- acomp**3*vircomp float
						report "acomp**3*vircomp real " & real'image (ap_slv2fp (fptmp1));
						out1 <= fptmp1;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else s := s13; end if;
				when s14 => s := s15;
					mulfpsclr <= '0';
					fixed2floatce <= '1';
					fixed2floatond <= '1';
					fixed2floata <= to_slv (resize (ta_const, fraca)) & to_slv ( resize (ta_const, fracb));
				when s15 =>
					if (fixed2floatrdy = '1') then s := s16;
						ta_f := fixed2floatr; -- ta float
						out1 <= ta_f;
						fixed2floatce <= '0';
						fixed2floatond <= '0';
						fixed2floatsclr <= '1';
					else s := s15; end if;
				when s16 => s := s17;
					report_fixed_value ("ta_const fix ", ta_const);
					report "ta_const real " & real'image (ap_slv2fp (fixed2floatr));
					report "ta_const bin " & to_string (fixed2floata);
					fixed2floatsclr <= '0';
					mulfpce <= '1';
					mulfpa <= acomp_pow4_f;
					mulfpb <= ta_f;
					mulfpond <= '1';
				when s17 =>
					if (mulfprdy = '1') then s := s18;
						fptmp2 := mulfpr; -- acomp**4*ta float
						report "acomp**4*ta real " & real'image (ap_slv2fp (fptmp2));
						out1 <= fptmp2;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else s := s17; end if;
				when s18 => s := s19;
					mulfpsclr <= '0';
					addfpce <= '1';
					addfpa <= fptmp1;
					addfpb <= fptmp2;
					addfpond <= '1';
				when s19 =>
					if (addfprdy = '1') then s := s20;
						acomp_ta_f := addfpr; -- acomp+ta float
						report "acomp**3*vir+acomp**4*ta real " & real'image (ap_slv2fp (acomp_ta_f));
						out1 <= acomp_ta_f;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else s := s19; end if;
				when s20 => s := s21;
					addfpsclr <= '0';
					sqrtfp2ce <= '1';
					sqrtfp2a <= acomp_ta_f;
					sqrtfp2ond <= '1';
				when s21 =>
					if (sqrtfp2rdy = '1') then s := s22;
						acomp_ta_f := sqrtfp2r; -- sqrt2(acomp+ta) float
						report "sqrt1 real " & real'image (ap_slv2fp (acomp_ta_f));
						out1 <= acomp_ta_f;
						sqrtfp2ce <= '0';
						sqrtfp2ond <= '0';
						sqrtfp2sclr <= '1';
					else s := s21; end if;
				when s22 => s := s23;
					sqrtfp2sclr <= '0';
					sqrtfp2ce <= '1';
					sqrtfp2a <= acomp_ta_f;
					sqrtfp2ond <= '1';
				when s23 =>
					if (sqrtfp2rdy = '1') then s := s24;
						acomp_ta_f := sqrtfp2r; -- sqrt2(acomp+ta) float
						report "sqrt2 real " & real'image (ap_slv2fp (acomp_ta_f));
						out1 <= acomp_ta_f;
						sqrtfp2ce <= '0';
						sqrtfp2ond <= '0';
						sqrtfp2sclr <= '1';
					else s := s23; end if;
				when s24 => s := s25;
					sqrtfp2sclr <= '0';
					fixed2floatce <= '1';
					fixed2floatond <= '1';
					fixed2floata <= to_slv (resize (ksto2_const, fraca)) & to_slv ( resize (ksto2_const, fracb));
				when s25 =>
					if (fixed2floatrdy = '1') then s := s26;
						ksto2_f := fixed2floatr; -- ksto2 float
						out1 <= ksto2_f;
						fixed2floatce <= '0';
						fixed2floatond <= '0';
						fixed2floatsclr <= '1';
					else s := s25; end if;
				when s26 => s := s27;
					report_fixed_value ("ksto2_const fix ", ksto2_const);
					report "ksto2_const real " & real'image (ap_slv2fp (fixed2floatr));
					report "ksto2_const bin " & to_string (fixed2floata);
					fixed2floatsclr <= '0';
					mulfpce <= '1';
					mulfpa <= acomp_ta_f;
					mulfpb <= ksto2_f;
					mulfpond <= '1';
				when s27 =>
					if (mulfprdy = '1') then s := s28;
						acomp_ta_ksto2_f := mulfpr; -- acomp*ta*ksto2 float
						report "Sx real " & real'image (ap_slv2fp (acomp_ta_ksto2_f));
						out1 <= acomp_ta_ksto2_f;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else s := s27; end if;
				when s28 => s := s29;
					mulfpsclr <= '0';
					fixed2floatce <= '1';
					fixed2floatond <= '1';
					fixed2floata <= to_slv (resize (k27315, fraca)) & to_slv ( resize (k27315, fracb));
				when s29 =>
					if (fixed2floatrdy = '1') then s := s30;
						k27315_f := fixed2floatr; -- 273.15 float
						out1 <= k27315_f;
						fixed2floatce <= '0';
						fixed2floatond <= '0';
						fixed2floatsclr <= '1';
					else s := s29; end if;
				when s30 => s := s31;
					fixed2floatsclr <= '0';
					mulfpce <= '1';
					mulfpa <= ksto2_f;
					mulfpb <= k27315_f;
					mulfpond <= '1';
				when s31 =>
					if (mulfprdy = '1') then s := s32;
						ksto2_f := mulfpr;
						report "ksto2*273.15 real " & real'image (ap_slv2fp (ksto2_f));
						out1 <= ksto2_f;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else s := s31; end if;
				when s32 => s := s33;
					mulfpsclr <= '0';
					subfpce <= '1';
					subfpa <= onefp;
					subfpb <= ksto2_f;
					subfpond <= '1';
				when s33 =>
					if (subfprdy = '1') then s := s34;
						ksto2_f := subfpr;
						report "1-ksto2*273.15 real " & real'image (ap_slv2fp (ksto2_f));
						out1 <= ksto2_f;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else s := s33; end if;
				when s34 => s := s35;
					subfpsclr <= '0';
					mulfpce <= '1';
					mulfpa <= acomp_f;
					mulfpb <= ksto2_f;
					mulfpond <= '1';
				when s35 =>
					if (mulfprdy = '1') then s := s36;
						ksto2_f := mulfpr;
						report "acomp*(1-ksto2*273.15) real " & real'image (ap_slv2fp (ksto2_f));
						out1 <= ksto2_f;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else s := s35; end if;
				when s36 => s := s37;
					mulfpsclr <= '0';
					addfpce <= '1';
					addfpa <= ksto2_f;
					addfpb <= acomp_ta_ksto2_f;
					addfpond <= '1';
				when s37 =>
					if (addfprdy = '1') then s := s38;
						ksto2_f := addfpr;
						report "acomp*(1-ksto2*273.15)+Sx real " & real'image (ap_slv2fp (ksto2_f));
						out1 <= ksto2_f;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else s := s37; end if;
				when s38 => s := s39;
					addfpsclr <= '0';
					divfpce <= '1';
					divfpa <= vircomp_f;
					divfpb <= ksto2_f;
					divfpond <= '1';
				when s39 =>
					if (divfprdy = '1') then s := s40;
						ksto2_f := divfpr;
						report "vircomp/(acomp*(1-ksto2*273.15)+Sx) real " & real'image (ap_slv2fp (ksto2_f));
						out1 <= ksto2_f;
						divfpce <= '0';
						divfpond <= '0';
--						divfpsclr <= '1';
					else s := s39; end if;
				when s40 => s := s41;
--					divfpsclr <= '0';
					addfpce <= '1';
					addfpa <= ksto2_f;
					addfpb <= ta_f;
					addfpond <= '1';
				when s41 =>
					if (addfprdy = '1') then s := s42;
						ksto2_f := addfpr;
						report "vircomp/(acomp*(1-ksto2*273.15)+Sx)+ta real " & real'image (ap_slv2fp (ksto2_f));
						out1 <= ksto2_f;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else s := s41; end if;
				when s42 => s := s43;
					addfpsclr <= '0';
					sqrtfp2ce <= '1';
					sqrtfp2a <= ksto2_f;
					sqrtfp2ond <= '1';
				when s43 =>
					if (sqrtfp2rdy = '1') then s := s44;
						ksto2_f := sqrtfp2r;
						report "sqrt(vircomp/(acomp*(1-ksto2*273.15)+Sx)+ta) real " & real'image (ap_slv2fp (ksto2_f));
						out1 <= ksto2_f;
						sqrtfp2ce <= '0';
						sqrtfp2ond <= '0';
						sqrtfp2sclr <= '1';
					else s := s43; end if;
				when s44 => s := s45;
					sqrtfp2sclr <= '0';
					sqrtfp2ce <= '1';
					sqrtfp2a <= ksto2_f;
					sqrtfp2ond <= '1';
				when s45 =>
					if (sqrtfp2rdy = '1') then s := s46;
						ksto2_f := sqrtfp2r;
						report "sqrt(sqrt(vircomp/(acomp*(1-ksto2*273.15)+Sx)+ta)) real " & real'image (ap_slv2fp (ksto2_f));
						out1 <= ksto2_f;
						sqrtfp2ce <= '0';
						sqrtfp2ond <= '0';
						sqrtfp2sclr <= '1';
					else s := s45; end if;
				when s46 => s := s47;
					sqrtfp2sclr <= '0';
					subfpce <= '1';
					subfpa <= ksto2_f;
					subfpb <= k27315_f;
					subfpond <= '1';
				when s47 =>
					if (subfprdy = '1') then s := s48;
						ksto2_f := subfpr;
						report "sqrt(sqrt(vircomp/(acomp*(1-ksto2*273.15)+Sx)+ta))-273.15 real " & real'image (ap_slv2fp (ksto2_f));
						out1 <= ksto2_f;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else s := s47; end if;
				when s48 =>
					subfpsclr <= '0';
					report "done" severity failure;
				when others => null;
			end case;
		end if;
	end if;
end process p0;

inst_ff1 : float2fixed
PORT MAP (
a => float2fixeda,
operation_nd => float2fixedond,
operation_rfd => float2fixedorfd,
clk => float2fixedclk,
sclr => float2fixedsclr,
ce => float2fixedce,
result => float2fixedr,
overflow => float2fixedof,
invalid_op => float2fixediop,
rdy => float2fixedrdy
);

inst_ff2 : fixed2float
PORT MAP (
a => fixed2floata,
operation_nd => fixed2floatond,
operation_rfd => fixed2floatorfd,
clk => fixed2floatclk,
sclr => fixed2floatsclr,
ce => fixed2floatce,
result => fixed2floatr,
rdy => fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => divfpa,
b => divfpb,
operation_nd => divfpond,
operation_rfd => divfporfd,
clk => divfpclk,
ce => divfpce,
result => divfpr,
underflow => divfpuf,
overflow => divfpof,
invalid_op => divfpiop,
divide_by_zero => divfpdz,
rdy => divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => mulfpa,
b => mulfpb,
operation_nd => mulfpond,
operation_rfd => mulfporfd,
clk => mulfpclk,
sclr => mulfpsclr,
ce => mulfpce,
result => mulfpr,
underflow => mulfpuf,
overflow => mulfpof,
invalid_op => mulfpiop,
rdy => mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => addfpa,
b => addfpb,
operation_nd => addfpond,
operation_rfd => addfporfd,
clk => addfpclk,
sclr => addfpsclr,
ce => addfpce,
result => addfpr,
underflow => addfpuf,
overflow => addfpof,
invalid_op => addfpiop,
rdy => addfprdy
);

inst_subfp : subfp
PORT MAP (
a => subfpa,
b => subfpb,
operation_nd => subfpond,
operation_rfd => subfporfd,
clk => subfpclk,
sclr => subfpsclr,
ce => subfpce,
result => subfpr,
underflow => subfpuf,
overflow => subfpof,
invalid_op => subfpiop,
rdy => subfprdy
);

inst_sqrtfp2 : sqrtfp2
PORT MAP (
a => sqrtfp2a,
operation_nd => sqrtfp2ond,
operation_rfd => sqrtfp2orfd,
clk => sqrtfp2clk,
sclr => sqrtfp2sclr,
ce => sqrtfp2ce,
result => sqrtfp2r,
invalid_op => sqrtfp2iop,
rdy => sqrtfp2rdy
);
end Behavioral;

