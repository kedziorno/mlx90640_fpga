----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:07 12/26/2022 
-- Design Name: 
-- Module Name:    test_fixed_melexis - Behavioral 
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
-- Test vectors for the synthesis test for the fixed point math package
-- This test is designed to test fixed_synth and exercise much of the entity.
-- For fphdl vhdl-200x created by David Bishop (dbishop@vhdl.org)
----------------------------------------------------------------------------------

library ieee, ieee_proposed;
--library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;


--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package1.all;

entity test_fixed_melexis is
generic (
G_C_WAIT1 : integer := 16 -- xxx wait between states to calculate, >= 1
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
o_out1 : out st_sfixed_max
--o_in1 : out st_sfixed_max;
--o_in2 : out st_sfixed_max
);
end test_fixed_melexis;

architecture testbench of test_fixed_melexis is

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

	-- purpose: main test loop
	tester : process (i_clock,i_reset) is
		variable state : states;
		variable sftmp_slv_fpbits : std_logic_vector(FP_BITS-1 downto 0);
		variable eeprom16slv,ram16slv : slv16;
		variable eeprom16sf,ram16sf : sfixed16;
		variable kvdd : sfixed16;
		variable kvdd_ft : fd2ft;
		
		variable fptmp1,fptmp2,fpout : st_sfixed_max;
		variable vdd25 : sfixed16;
		variable kvptat,ktptat : st_sfixed_max;
		variable vdd,vddv0,deltaV : st_sfixed_max;
		variable vptat,vbe : st_sfixed_max;
		variable vptat25 : st_sfixed_max;
		variable vptatart : st_sfixed_max;
		variable alphaptatee : st_sfixed_max;
		variable alphaptat : st_sfixed_max;
		variable h1,h2 : st_sfixed_max;
		variable pow2_18 : st_sfixed_max;
		variable tmp_uf8 : ufixed8;
		variable tmp_sf8 : sfixed8;
		variable tmp_uf6 : ufixed6;
		variable tmp_sf6 : sfixed6;
		variable tmp_uf9 : ufixed9;
		variable tmp_sf9 : sfixed9;
		variable tmp_uf15 : ufixed15;
		variable tmp_sf15 : sfixed15;
		variable pow2to18 : st_sfixed_max;
		constant C_WAIT1 : integer := G_C_WAIT1;
		variable v_wait1 : integer range 0 to C_WAIT1-1;
		variable Ta,Ta0 : st_sfixed_max;
		variable Kgain : st_sfixed_max;
		variable pixgain12_16 : st_sfixed_max; -- xxx for all pixels
		variable offset12_16 : st_sfixed_max; -- xxx for all pixels
		variable offsetaverage : st_sfixed_max;
		variable occscalerow : st_sfixed_max;
		variable occscalecolumn : st_sfixed_max;
		variable kv12_16 : st_sfixed_max;
		variable occrow12 : st_sfixed_max;
		variable occcolumn16 : st_sfixed_max;
		variable occscaleremnant : st_sfixed_max;
		variable tmpuf1 : ufixed1;
		variable tmpulv1 : slv1;
		variable tmpsf1 : sfixed1;
		variable tmpslv1 : slv1;
		variable tmpsf2 : sfixed2;
		variable tmpslv2 : slv2;
		variable tmpsf3 : sfixed3;
		variable tmpslv3 : slv3;
		variable tmpsf4 : sfixed4;
		variable tmpslv4 : slv4;
		variable tmpsf5 : sfixed5;
		variable tmpslv5 : slv5;
		variable tmpsf6 : sfixed6;
		variable tmpslv6 : slv6;
		variable tmpsf7 : sfixed7;
		variable tmpslv7 : slv7;
		variable tmpsf8 : sfixed8;
		variable tmpslv8 : slv8;
		variable tmpsf9 : sfixed9;
		variable tmpslv9 : slv9;
		variable tmpsf10 : sfixed10;
		variable tmpslv10 : slv10;
		variable occsro,occsc,occsre : st_sfixed_max;
		variable occsror,occscr,occsrer : st_sfixed_max;
		variable pixosref12_16 : st_sfixed_max;
		variable kta12_16 : st_sfixed_max;
		variable kta12_16_ee : st_sfixed_max;
		variable kta_rc_ee : st_sfixed_max;
		variable kta_scale_1 : st_sfixed_max;
		variable kta_scale_2 : st_sfixed_max;
		variable kvscale : st_sfixed_max;
		variable pixos12_16 : st_sfixed_max;
		variable tad,v0d : st_sfixed_max;
		variable vir12_16_emissitivy_componsated : st_sfixed_max;
		variable pixgain_cp_sp0 : st_sfixed_max;
		variable pixgain_cp_sp1 : st_sfixed_max;
		variable off_cpsubpage_0 : st_sfixed_max;
		variable off_cpsubpage_1 : st_sfixed_max;
		variable off_cpsubpage_1_delta : st_sfixed_max;
		variable kta_cp_ee : st_sfixed_max;
		variable kta_cp : st_sfixed_max;
		variable kv_scale : st_sfixed_max;
		variable kv_cp_ee : st_sfixed_max;
		variable kv_cp : st_sfixed_max;
		variable ktacp_kvcp_mul,ilchessc1ee,ilchessc1,pixos_cp_sp0,pixos_cp_sp1,ch_pattern_12_16_s,ch_pattern_12_16,tgcee,tgc,vir_12_16_compensated : st_sfixed_max;
		variable ch_pattern_12_16_u : st_ufixed_max; -- xxx for xor
		constant pixelnumber12_16 : integer := 368; -- xxx good val
--		constant pixelnumber12_16 : integer := 367; -- xxx bad val
		variable pixospatt1,pixospatt2,pixospatt12,ch_pattern_12_16_minusone : st_sfixed_max;
		variable ascale,ascalecp,acomp_12_16,acpsubpage0,acpsubpage1,cpp1p0ratio,ksta,kstaee,a_12_16,areference,accrow12,accscalerow,acccolumn16,accscalecolumn,apixel_12_16,accscaleremnant : st_sfixed_max;
		variable accsro,accsc,accsre : st_sfixed_max;
		variable accsror,accscr,accsrer : st_sfixed_max;
		variable acpsubpagepatt01,acpsubpagepatt0,acpsubpagepatt1 : st_sfixed_max;
		variable ksto2ee,kstoscale : st_sfixed_max;
		variable tak4 : st_sfixed_max;
--		constant trk4 : st_sfixed_max := 8557586214.66; -- TaK4 = (Tr + 273.15)**4 Tr~Ta-8 Tr~31
		variable trk4 : st_sfixed_max;
		variable acomp_12_16_pow3,acomp_12_16_pow4 : st_sfixed_max;
		attribute keep : boolean;
		attribute keep of kvdd : variable is true;
--		attribute keep of vdd25 : variable is true;
		variable max_expected_s : st_sfixed_max_expected;
		variable max_expected_u : st_ufixed_max_expected;
		variable fraca : sfixed (FP_INTEGER-1 downto 0);
		variable fracb : sfixed (-1 downto -FP_FRACTION);
	begin
		if (rising_edge(i_clock)) then
			if (i_reset = '1') then
				report "fp_add_hi : " & integer'image(st_sfixed_add'high);
				report "fp_add_lo : " & integer'image(st_sfixed_add'low);
				report "fp_sub_hi : " & integer'image(st_sfixed_sub'high);
				report "fp_sub_lo : " & integer'image(st_sfixed_sub'low);
				report "fp_mul_hi : " & integer'image(st_sfixed_mul'high);
				report "fp_mul_lo : " & integer'image(st_sfixed_mul'low);
				report "fp_div_hi : " & integer'image(st_sfixed_div'high);
				report "fp_div_lo : " & integer'image(st_sfixed_div'low);
				v_wait1 := 0;
				state := idle;
				-- reset
				fixed2floatsclr <= '1';
				float2fixedsclr <= '1';
				sqrtfp2sclr <= '1';
				addfpsclr <= '1';
				subfpsclr <= '1';
				mulfpsclr <= '1';
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
				subfpce <= '0';
				subfpond <= '0';
				subfpa <= (others => '0');
				subfpb <= (others => '0');
				divfpce <= '0';
				divfpond <= '0';
				divfpa <= (others => '0');
				divfpb <= (others => '0');
				eeprom16slv := (others => '0');
				ram16slv := (others => '0');
			else
		case (state) is
when idle =>
			if (i_run = '1') then
				state := s1;
			else
				state := idle;
			end if;
			fixed2floatsclr <= '0';
			float2fixedsclr <= '0';
			sqrtfp2sclr <= '0';
			addfpsclr <= '0';
			subfpsclr <= '0';
			mulfpsclr <= '0';
	when s1 => state := s2;
		--
		-- kvdd
		eeprom16slv := x"9d68" and x"ff00"; -- ee[0x2433]
		kvdd := resize (to_sfixed (eeprom16slv, eeprom16sf), kvdd);
--		report_error_normalize ("kvdd", kvdd, to_sfixed (-25344.0, max_expected_s));
		kvdd := kvdd srl 8;
		kvdd := resize (to_sfixed (to_slv (kvdd (7 downto 0)), sfixed8'high, sfixed8'low), kvdd);
--		report_error_normalize ("kvdd", kvdd, to_sfixed (-99.0, max_expected_s));
		kvdd := kvdd sll 5;
		kvdd := resize (to_sfixed (to_slv (kvdd), sfixed16'high, sfixed16'low), kvdd);
		report_error_normalize ("kvdd", kvdd, to_sfixed (-3168.0, max_expected_s));
		fixed2floatce <= '1';
		fixed2floatond <= '1';
--		fixed2floata <= to_slv (resize (kvdd, 34, 0)) & to_slv ( resize (kvdd, 0, -27));
		fixed2floata <= to_slv (resize (kvdd, 34, 0)) & "00000000000000000000000000000";
	when s2 =>
		if (fixed2floatrdy = '1') then state := s3;
			kvdd_ft := fixed2floatr;
			report_error (kvdd_ft, -3168.0);
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s2; end if;
	when s3 =>
		fixed2floatsclr <= '0';
		
		
		
		--
		-- vdd25
		eeprom16slv := x"9d68" and x"00ff"; -- ee[0x2433]
		vdd25 := resize (to_sfixed (eeprom16slv, eeprom16sf), vdd25);
--		report_error_normalize ("vdd25", vdd25, to_sfixed (104.0, max_expected_s));
		vdd25 := resize (to_sfixed (to_slv (kvdd (7 downto 0)), sfixed8'high, sfixed8'low), vdd25);
--		report_error_normalize ("vdd25", vdd25, to_sfixed (-99.0, max_expected_s));

		vdd25 := vdd25 sll 5;
		vdd25 := resize (to_sfixed (to_slv (vdd25), vdd25), vdd25);
--		report_error_normalize ("vdd25", vdd25, to_sfixed (-3168.0, max_expected_s));

report "done" severity failure;

--when s1 =>
--		--
--		-- kvdd
--		sftmp_slv_16 := x"9d68" and x"ff00"; -- ee[0x2433]
--		kvdd := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kvdd);
--		report_error_normalize ("fail kvdd 1", kvdd, to_sfixed (-25344.0, max_expected_s)); -- -25344
--		fptmp2 := to_sfixed (2**8, fptmp2);
--		report_error_normalize ("fail 2**8", fptmp2, to_sfixed (2**8, max_expected_s)); -- 256
----		cmd <= "0011"; -- / ee[0x2433]&0xff00/256
--		in1div <= resize (kvdd, fptmp1);
--		in2div <= fptmp2;
--		state := w1;
--when w1 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s2; else v_wait1 := v_wait1 + 1; state := w1; end if;
--when s2 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		kvdd := resize (fpout, kvdd);
--		report_error_normalize ("fail kvdd 2", kvdd, to_sfixed (-99.0, max_expected_s)); -- -99
--		fptmp2 := to_sfixed (2**5, fptmp2);
--		report_error_normalize ("fail 2**5", fptmp2, to_sfixed (2**5, max_expected_s)); -- 32
----		cmd <= "0010"; -- * kvdd*2^5
--		in1mul <= resize (kvdd, fptmp1);
--		in2mul <= fptmp2;
--		state := w2;
--when w2 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s3; else v_wait1 := v_wait1 + 1; state := w2; end if;
--when s3 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		kvdd := resize (fpout, kvdd);
--		report_error_normalize ("fail kvdd 3", kvdd, to_sfixed (-3168.0, max_expected_s)); -- -3168
--		--
--		-- vdd25
--		sftmp_slv_16 := x"9d68" and x"00ff"; -- ee[0x2433]
--		vdd25 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), vdd25);
--		report_error_normalize ("fail vdd25 1", vdd25, to_sfixed (104.0, max_expected_s)); -- 104
--		fptmp2 := to_sfixed (2**8, fptmp2);
--		report_error_normalize ("fail 2**8", fptmp2, to_sfixed (2**8, max_expected_s)); -- 256
----		cmd <= "0001"; -- - vdd25-256
--		in1sub <= resize (vdd25, fptmp1);
--		in2sub <= fptmp2;
--		state := w3;
--when w3 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s4; else v_wait1 := v_wait1 + 1; state := w3; end if;
--when s4 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		vdd25 := resize (fpout, vdd25);
--		report_error_normalize ("fail vdd25 2", vdd25, to_sfixed (-152.0, max_expected_s)); -- -152
--		fptmp2 := to_sfixed (2**5, fptmp2);
--		report_error_normalize ("fail 2**5", fptmp2, to_sfixed (2**5, max_expected_s)); -- 32
----		cmd <= "0010"; -- * (vdd25-256)*2^5
--		in1mul <= resize (vdd25, fptmp1);
--		in2mul <= fptmp2;
--		state := w4;
--when w4 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s5; else v_wait1 := v_wait1 + 1; state := w4; end if;
--when s5 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		vdd25 := resize (fpout, vdd25);
--		report_error_normalize ("fail vdd25 3", vdd25, to_sfixed (-4864.0, max_expected_s)); -- -4864
--		fptmp2 := to_sfixed (2**13, fptmp2);
--		report_error_normalize ("fail 2**13", fptmp2, to_sfixed (2**13, max_expected_s)); -- 2**13
----		cmd <= "0001"; -- - (vdd25-256)*2^5-2^13
--		in1sub <= resize (vdd25, fptmp1);
--		in2sub <= fptmp2;
--		state := w5;
--when w5 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s6; else v_wait1 := v_wait1 + 1; state := w5; end if;
--when s6 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		vdd25 := resize (fpout, vdd25);
--		report_error_normalize ("fail vdd25 4", vdd25, to_sfixed (-13056.0, max_expected_s)); -- -13056
--		-- 
--		-- kvptat
--		sftmp_slv_16 := x"5952" and x"fc00"; -- ee[0x2432]
--		kvptat := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kvptat);
--		report_error_normalize ("fail kvptat 1", kvptat, to_sfixed (22528.0, max_expected_s)); -- 22528
--		fptmp2 := to_sfixed (2**10, fptmp2);
--		report_error_normalize ("fail 2**10", fptmp2, to_sfixed (2**10, max_expected_s)); -- 2**10
----		cmd <= "0011"; -- / ee[0x2432]&0xfc00/2**10
--		in1div <= kvptat;
--		in2div <= fptmp2;
--		state := w6;
--when w6 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s7; else v_wait1 := v_wait1 + 1; state := w6; end if;
--when s7 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		kvptat := resize (fpout, kvptat);
--		report_error_normalize ("fail kvptat 2", kvptat, to_sfixed (22.0, max_expected_s)); -- 22
--		fptmp2 := to_sfixed (2**12, fptmp2);
--		report_error_normalize ("fail 2**12", fptmp2, to_sfixed (2**12, max_expected_s)); -- 2**12
----		cmd <= "0011"; -- / kvptat/2**12
--		in1div <= kvptat;
--		in2div <= fptmp2;
--		state := w7;
--when w7 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s8; else v_wait1 := v_wait1 + 1; state := w7; end if;
--when s8 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		kvptat := resize (fpout, kvptat);
--		report_error_normalize ("fail kvptat 3", kvptat, to_sfixed (0.0053710939999973561498336493968963623046875, max_expected_s)); -- 5.371094e-03
--		-- 
--		-- ktptat
--		sftmp_slv_16 := x"5952" and x"03ff"; -- ee[0x2432]
--		ktptat := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), ktptat);
--		report_error_normalize ("fail ktptat 1", ktptat, to_sfixed (338.0, max_expected_s)); -- 338
--		fptmp2 := to_sfixed (2**3, fptmp2);
--		report_error_normalize ("fail 2**3", fptmp2, to_sfixed (2**3, max_expected_s)); -- 8
----		cmd <= "0011"; -- / ktptat/2^3
--		in1div <= ktptat;
--		in2div <= fptmp2;
--		state := w8;
--when w8 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s9; else v_wait1 := v_wait1 + 1; state := w8; end if;
--when s9 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		ktptat := resize (fpout, ktptat);
--		report_error_normalize ("fail ktptat 2", ktptat, to_sfixed (42.25, max_expected_s)); -- 42.25
--		--
--		-- deltaV
--		sftmp_slv_16 := x"ccc5" and x"ffff"; -- ram[0x072a]
--		deltaV := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), deltaV);
--		report_error_normalize ("fail deltaV 1", deltaV, to_sfixed (-13115.0, max_expected_s)); -- -13115
----		cmd <= "0001"; -- - ram[0x072a]-vdd25
--		in1sub <= resize (deltaV, in1sub);
--		in2sub <= resize (vdd25, in2sub);
--		state := w9;
--when w9 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s10; else v_wait1 := v_wait1 + 1; state := w9; end if;
--when s10 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		deltaV := resize (fpout, deltaV);
--		report_error_normalize ("fail deltaV 2", deltaV, to_sfixed (-13115.0-(-13056.0), max_expected_s)); -- -59
----		cmd <= "0011"; -- / (ram[0x072a]-vdd25)/kvdd
--		in1div <= resize (deltaV, in1div);
--		in2div <= resize (kvdd, in2div);
--		state := w10;
--when w10 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s11; else v_wait1 := v_wait1 + 1; state := w10; end if;
--when s11 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		deltaV := resize (fpout, deltaV);
--		report_error_normalize ("fail deltaV 3", deltaV, to_sfixed (0.018623737, max_expected_s)); -- 1.861572e-02
--		fptmp2 := to_sfixed (3.3, fptmp2);
--		report_error_normalize ("fail 3.3", fptmp2, to_sfixed (3.3, max_expected_s)); -- 3.3
----		cmd <= "0000"; -- +
--		in1add <= deltaV;
--		in2add <= fptmp2;
--		state := w11;
--when w11 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s12; else v_wait1 := v_wait1 + 1; state := w11; end if;
--when s12 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		vdd := resize (fpout, vdd);
--		report_error_normalize ("fail vdd", vdd, to_sfixed (3.319, max_expected_s)); -- 3.319
--		--
--		-- vptat25
--		sftmp_slv_16 := x"2ff1" and x"ffff"; -- ee[0x2431]
--		vptat25 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), vptat25);
--		report_error_normalize ("fail vptat25", vptat25, to_sfixed (12273.0, max_expected_s)); -- 12273
--		--
--		-- vptat
--		sftmp_slv_16 := x"06af" and x"ffff"; -- ram[0x0720]
--		vptat := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), vptat);
--		report_error_normalize ("fail vptat", vptat, to_sfixed (1711.0, max_expected_s)); -- 1711
--		--
--		-- vbe
--		sftmp_slv_16 := x"4bf2" and x"ffff"; -- ram[0x0700]
--		vbe := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), vbe);
--		report_error_normalize ("fail vbe", vbe, to_sfixed (19442.0, max_expected_s)); -- 19442
--		--
--		-- alphaptatee
--		sftmp_slv_16 := x"4210" and x"f000"; -- ee[0x2410]
--		alphaptatee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), alphaptatee);
--		report_error_normalize ("fail alphaptatee 1", alphaptatee, to_sfixed (16384.0, max_expected_s)); -- 16384
--		fptmp2 := to_sfixed (2**12, fptmp2);
--		report_error_normalize ("fail 2**12", fptmp2, to_sfixed (2**12, max_expected_s)); -- 2**12
----		cmd <= "0011"; -- / alphaptatee/2^12
--		in1div <= alphaptatee;
--		in2div <= fptmp2;
--		state := w12;
--when w12 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s13; else v_wait1 := v_wait1 + 1; state := w12; end if;
--when s13 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		alphaptatee := resize (fpout, alphaptatee);
--		report_error_normalize ("fail alphaptatee 2", alphaptatee, to_sfixed (4.0, max_expected_s)); -- 4
--		--
--		-- alphaptat
--		fptmp2 := to_sfixed (2**2, fptmp2);
--		report_error_normalize ("fail 2**2", fptmp2, to_sfixed (2**2, max_expected_s)); -- 4
----		cmd <= "0011"; -- / alphaptatee/2^2
--		in1div <= alphaptatee;
--		in2div <= fptmp2;
--		state := w13;
--when w13 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s14; else v_wait1 := v_wait1 + 1; state := w13; end if;
--when s14 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		alphaptat := resize (fpout, alphaptat);
--		report_error_normalize ("fail alphaptat 3", alphaptat, to_sfixed (1.0, max_expected_s)); -- 1
--		fptmp2 := to_sfixed (2**3, fptmp2);
--		report_error_normalize ("fail 2**3", fptmp2, to_sfixed (2**3, max_expected_s)); -- 2**3
----		cmd <= "0000"; -- + (alphaptatee/2^2)+2^3
--		in1add <= alphaptat;
--		in2add <= fptmp2;
--		state := w14;
--when w14 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s15; else v_wait1 := v_wait1 + 1; state := w14; end if;
--when s15 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		alphaptat := resize (fpout, alphaptat);
--		report_error_normalize ("fail alphaptat 4", alphaptat, to_sfixed (9.0, max_expected_s)); -- 9
--		--
--		-- vptatart
----		cmd <= "0010"; -- * vptat*alphaptat
--		in1mul <= vptat;
--		in2mul <= alphaptat;
--		state := w15;
--when w15 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s16; else v_wait1 := v_wait1 + 1; state := w15; end if;
--when s16 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		vptatart := resize (fpout, vptatart);
--		report_error_normalize ("fail vptatart 1", vptatart, to_sfixed (15399.0, max_expected_s)); -- 15399
----		cmd <= "0000"; -- + (vptat*alphaptat)+vbe
--		in1add <= vptatart;
--		in2add <= vbe;
--		state := w16;
--when w16 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s17; else v_wait1 := v_wait1 + 1; state := w16; end if;
--when s17 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		vptatart := resize (fpout, vptatart);
--		report_error_normalize ("fail vptatart 2", vptatart, to_sfixed (34841.0, max_expected_s)); -- 34841
----		cmd <= "0011"; -- / vptat/((vptat*alphaptat)+vbe)
--		in1div <= vptat;
--		in2div <= vptatart;
--		state := w17;
--when w17 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s18; else v_wait1 := v_wait1 + 1; state := w17; end if;
--when s18 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		vptatart := resize (fpout, vptatart);
--		report_error_normalize ("fail vptatart 3", vptatart, to_sfixed (0.049108808587561725289560854434967041015625, max_expected_s)); -- 0.049108808587561725289560854434967041015625
--		fptmp2 := to_sfixed (2**18, fptmp2);
--		report_error_normalize ("fail 2**18", fptmp2, to_sfixed (2**18, max_expected_s)); -- 2**18
----		cmd <= "0010"; -- * (vptat/((vptat*alphaptat)+vbe))*2^18
--		in1mul <= vptatart;
--		in2mul <= fptmp2;
--		state := w18;
--when w18 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s19; else v_wait1 := v_wait1 + 1; state := w18; end if;
--when s19 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		vptatart := resize (fpout, vptatart);
--		report_error_normalize ("fail vptatart 4", vptatart, to_sfixed (12873.5792, max_expected_s)); -- 12873.5792
--		--
--		-- Ta
----		cmd <= "0010"; -- * a=deltaV*kvptat
--		in1mul <= deltaV;
--		in2mul <= kvptat;
--		state := w20;
--when w20 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s21; else v_wait1 := v_wait1 + 1; state := w20; end if;
--when s21 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		Ta := resize (fpout, Ta);
--		report_error_normalize ("fail Ta 1", Ta, to_sfixed (0.00010002983935919473879039287567138671875, max_expected_s)); -- 0.00010002983935919473879039287567138671875
--		fptmp2 := to_sfixed (1.0, fptmp2);
--		report_error_normalize ("fail 1.0", fptmp2, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0000"; -- + b=1+a
--		in1add <= fptmp2;
--		in2add <= Ta;
--		state := w21;
--when w21 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s22; else v_wait1 := v_wait1 + 1; state := w21; end if;
--when s22 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		Ta := resize (fpout, Ta);
--		report_error_normalize ("fail Ta 2", Ta, to_sfixed (1.00010002983935919473879039287567138671875, max_expected_s)); -- 1.00010002983935919473879039287567138671875
----		cmd <= "0011"; -- / c=vptatart/b
--		in1div <= vptatart;
--		in2div <= Ta;
--		state := w22;
--when w22 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s23; else v_wait1 := v_wait1 + 1; state := w22; end if;
--when s23 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		Ta := resize (fpout, Ta);
--		report_error_normalize ("fail Ta 3", Ta, to_sfixed (12872.29190508633109857328236103057861328125, max_expected_s)); -- 12872.29190508633109857328236103057861328125
----		cmd <= "0001"; -- - d=c-vptat25
--		in1sub <= Ta;
--		in2sub <= vptat25;
--		state := w23;
--when w23 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s24; else v_wait1 := v_wait1 + 1; state := w23; end if;
--when s24 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		Ta := resize (fpout, Ta);
--		report_error_normalize ("fail Ta 4", Ta, to_sfixed (599.291905086330416452256031334400177001953125, max_expected_s)); -- 599.291905086330416452256031334400177001953125
----		cmd <= "0011"; -- / e=d/ktptat
--		in1div <= Ta;
--		in2div <= ktptat;
--		state := w24;
--when w24 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s25; else v_wait1 := v_wait1 + 1; state := w24; end if;
--when s25 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		Ta := resize (fpout, Ta);
--		report_error_normalize ("fail Ta 5", Ta, to_sfixed (14.1844237890254589729011058807373046875, max_expected_s)); -- 14.1844237890254589729011058807373046875
--		fptmp2 := to_sfixed (25.0, fptmp2);
--		report_error_normalize ("fail 25.0", fptmp2, to_sfixed (25.0, max_expected_s)); -- 25.0
----		cmd <= "0000"; -- + f=e+25.0
--		in1add <= Ta;
--		in2add <= fptmp2;
--		state := w25;
--when w25 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s26; else v_wait1 := v_wait1 + 1; state := w25; end if;
--when s26 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		Ta := resize (fpout, Ta);
--		report_error_normalize ("fail Ta 6", Ta, to_sfixed (39.184, max_expected_s)); -- 39.184
--		--
--		-- Kgain
--		sftmp_slv_16 := x"1881" and x"ffff"; -- ram[0x070a]
--		fptmp1 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), fptmp1);
--		report_error_normalize ("fail ram[0x070a]", fptmp1, to_sfixed (6273.0, max_expected_s)); -- 6273
--		sftmp_slv_16 := x"18ef" and x"ffff"; -- ee[0x2430]
--		fptmp2 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), fptmp2);
--		report_error_normalize ("fail ee[0x2430]", fptmp2, to_sfixed (6383.0, max_expected_s)); -- 6383
----		cmd <= "0011"; -- / GAIN/ram[0x070a]
--		in1div <= fptmp2;
--		in2div <= fptmp1;
--		state := w26;
--when w26 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s27; else v_wait1 := v_wait1 + 1; state := w26; end if;
--when s27 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		Kgain := resize (fpout, Kgain);
--		report_error_normalize ("fail Kgain", Kgain, to_sfixed (1.01753546947234, max_expected_s)); -- 1.01753546947234
--		-- xxx pixdata 12,16 ram[0x056f]
--		sftmp_slv_16 := x"0261" and x"ffff"; -- ram[0x056f]
--		pixgain12_16 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), pixgain12_16);
--		report_error_normalize ("fail pixgain12_16", pixgain12_16, to_sfixed (609.0, max_expected_s)); -- 609
----		cmd <= "0010"; -- * ram[pixel_data]*Kgain
--		in1mul <= pixgain12_16;
--		in2mul <= Kgain;
--		state := w27;
--when w27 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s28; else v_wait1 := v_wait1 + 1; state := w27; end if;
--when s28 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		pixgain12_16 := resize (fpout, pixgain12_16);
--		report_error_normalize ("fail pixgain12_16", pixgain12_16, to_sfixed (619.679100908656, max_expected_s)); -- 619.679100908656
--		sftmp_slv_16 := x"ffbb" and x"ffff"; -- ee[0x2411]
--		offsetaverage := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), offsetaverage);
--		report_error_normalize ("fail offsetaverage", offsetaverage, to_sfixed (-69.0, max_expected_s)); -- -69
--		sftmp_slv_16 := x"4210" and x"0f00"; -- ee[0x2410]
--		occscalerow := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), occscalerow);
--		occscalerow := occscalerow srl 8;
--		report_error_normalize ("fail occscalerow", occscalerow, to_sfixed (2.0, max_expected_s)); -- 2
--		sftmp_slv_16 := x"4210" and x"00f0"; -- ee[0x2410]
--		occscalecolumn := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), occscalecolumn);
--		occscalecolumn := occscalecolumn srl 4;
--		report_error_normalize ("fail occscalecolumn", occscalecolumn, to_sfixed (1.0, max_expected_s)); -- 1
--		sftmp_slv_16 := x"f2f2" and x"f000"; -- ee[0x2414]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		occrow12 := resize (tmpsf4, occrow12);
--		report_error_normalize ("fail occrow12", occrow12, to_sfixed (-1.0, max_expected_s)); -- -1 / 0xf signed
--		sftmp_slv_16 := x"e0ef" and x"f000"; -- ee[0x241b]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		occcolumn16 := resize (tmpsf4, occcolumn16);
--		report_error_normalize ("fail occcolumn16", occcolumn16, to_sfixed (-2.0, max_expected_s)); -- -2 / 0xe signed
--		sftmp_slv_16 := x"08a0" and x"fc00"; -- ee[0x25af]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 10));
--		tmpslv6 := sftmp_slv_16 (5 downto 0);
--		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
--		offset12_16 := resize (tmpsf6, offset12_16);
--		report_error_normalize ("fail offset12_16", offset12_16, to_sfixed (2.0, max_expected_s)); -- 2
--		sftmp_slv_16 := x"4210" and x"000f"; -- ee[0x2410]
--		occscaleremnant := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), occscaleremnant);
--		report_error_normalize ("fail occscaleremnant", occscaleremnant, to_sfixed (0.0, max_expected_s)); -- 0
--		occsro := to_sfixed (1.0, occsro) sll to_integer (occscalerow); -- 2^occscalerow=2^2=4.0
--		report_error_normalize ("fail occsro", occsro, to_sfixed (4.0, max_expected_s)); -- 4
--		occsc := to_sfixed (1.0, occsc) sll to_integer (occscalecolumn); -- 2^occscalecolumn=2^1=2.0
--		report_error_normalize ("fail occsc", occsc, to_sfixed (2.0, max_expected_s)); -- 2
--		occsre := to_sfixed (1.0, occsre) sll to_integer (occscaleremnant); -- 2^occscaleremnant=2^0=1.0
--		report_error_normalize ("fail occsre", occsre, to_sfixed (1.0, max_expected_s)); -- 1
----		cmd <= "0010"; -- * occrow12*2^occscalerow
--		in1mul <= occrow12;
--		in2mul <= occsro;
--		state := w28;
--when w28 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s29; else v_wait1 := v_wait1 + 1; state := w28; end if;
--when s29 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		occsro := resize (fpout, occsro);
--		report_error_normalize ("fail occsro 1", occsro, to_sfixed (-4.0, max_expected_s)); -- -4
----		cmd <= "0010"; -- * occcolumn16*2^occscalecolumn
--		in1mul <= occcolumn16;
--		in2mul <= occsc;
--		state := w29;
--when w29 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s30; else v_wait1 := v_wait1 + 1; state := w29; end if;
--when s30 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		occsc := resize (fpout, occsc);
--		report_error_normalize ("fail occsc 1", occsc, to_sfixed (-4.0, max_expected_s)); -- -4
----		cmd <= "0010"; -- * occremnant*2^occscaleremnant
--		in1mul <= offset12_16;
--		in2mul <= occsre;
--		state := w30;
--when w30 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s31; else v_wait1 := v_wait1 + 1; state := w30; end if;
--when s31 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		occsre := resize (fpout, occsre);
--		report_error_normalize ("fail occsre 1", occsre, to_sfixed (2.0, max_expected_s)); -- 2
----		cmd <= "0000"; -- + (occcolumn16*2^occscalecolumn)+(occremnant*2^occscaleremnant)
--		in1add <= occsc;
--		in2add <= occsre;
--		state := w31;
--when w31 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s32; else v_wait1 := v_wait1 + 1; state := w31; end if;
--when s32 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		occsre := resize (fpout, occsre);
--		report_error_normalize ("fail occsre 2", occsre, to_sfixed (-2.0, max_expected_s)); -- -2
----		cmd <= "0000"; -- + (occrow12*2^occscalerow)+(occcolumn16*2^occscalecolumn)+(occremnant*2^occscaleremnant)
--		in1add <= occsre;
--		in2add <= occsro;
--		state := w32;
--when w32 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s33; else v_wait1 := v_wait1 + 1; state := w32; end if;
--when s33 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		occsre := resize (fpout, occsre);
--		report_error_normalize ("fail occsre 3", occsre, to_sfixed (-6.0, max_expected_s)); -- -6
----		cmd <= "0000"; -- + offsetaverage+(occrow12*2^occscalerow)+(occcolumn16*2^occscalecolumn)+(occremnant*2^occscaleremnant)
--		in1add <= occsre;
--		in2add <= offsetaverage;
--		state := w33;
--when w33 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s34; else v_wait1 := v_wait1 + 1; state := w33; end if;
--when s34 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		pixosref12_16 := resize (fpout, pixosref12_16);
--		report_error_normalize ("fail pixosref12_16", pixosref12_16, to_sfixed (-75.0, max_expected_s)); -- -75
--		sftmp_slv_16 := x"08a0" and x"000e"; -- ee[0x25af]
--		kta12_16_ee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kta12_16_ee);
--		report_error_normalize ("fail kta12_16_ee", kta12_16_ee, to_sfixed (0.0, max_expected_s)); -- 0
--		kta12_16_ee := kta12_16_ee srl 1;
--		report_error_normalize ("fail kta12_16_ee", kta12_16_ee, to_sfixed (0.0, max_expected_s));
--		sftmp_slv_16 := x"5354" and x"00ff"; -- ee[0x2437]
--		kta_rc_ee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kta_rc_ee);
--		report_error_normalize ("fail kta_rc_ee", kta_rc_ee, to_sfixed (84.0, max_expected_s)); -- 84
--		sftmp_slv_16 := x"2363" and x"000f"; -- ee[0x2438]
--		kta_scale_2 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kta_scale_2);
--		report_error_normalize ("fail kta_scale_2", kta_scale_2, to_sfixed (3.0, max_expected_s)); -- 3
--		sftmp_slv_16 := x"2363" and x"00f0"; -- ee[0x2438]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 4));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		kta_scale_1 := resize (tmpsf4, kta_scale_1);
--		report_error_normalize ("fail kta_scale_1", kta_scale_1, to_sfixed (6.0, max_expected_s)); -- 6
--		fptmp2 := to_sfixed (8.0, fptmp2);
--		report_error_normalize ("fail 8.0", fptmp2, to_sfixed (8.0, max_expected_s)); -- 8.0
----		cmd <= "0000"; -- + kta_scale_1+8
--		in1add <= kta_scale_1;
--		in2add <= fptmp2;
--		state := w34;
--when w34 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s35; else v_wait1 := v_wait1 + 1; state := w34; end if;
--when s35 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kta_scale_1 := resize (fpout, kta_scale_1);
--		report_error_normalize ("fail kta_scale_1", kta_scale_1, to_sfixed (14.0, max_expected_s)); -- 14
--		sftmp_slv_16 := x"5454" and x"000f"; -- ee[0x2434]
--		kv12_16 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kv12_16);
--		report_error_normalize ("fail kv12_16", kv12_16, to_sfixed (4.0, max_expected_s)); -- 4
--		kta_scale_2 := to_sfixed(1.0, kta_scale_2) sll to_integer (kta_scale_2);
--		report_error_normalize ("fail kta_scale_2", kta_scale_2, to_sfixed (2**3, max_expected_s)); -- 2**3
----		cmd <= "0010"; -- * kta(12,16)_ee*2^Kta_scale_2
--		in1mul <= kta12_16_ee;
--		in2mul <= kta_scale_2;
--		state := w35;
--when w35 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s36; else v_wait1 := v_wait1 + 1; state := w35; end if;
--when s36 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		kta12_16 := resize (fpout, kta12_16);
--		report_error_normalize ("fail kta12_16 1", kta12_16, to_sfixed (0.0, max_expected_s)); -- 0
----		cmd <= "0000"; -- + kta_rc_ee+kta12_16_ee*2^kta_scale_2
--		in1add <= kta_rc_ee;
--		in2add <= kta12_16;
--		state := w36;
--when w36 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s37; else v_wait1 := v_wait1 + 1; state := w36; end if;
--when s37 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kta12_16 := resize (fpout, kta12_16);
--		report_error_normalize ("fail kta12_16 2", kta12_16, to_sfixed (84.0, max_expected_s)); -- 84
--		kta_scale_1 := to_sfixed (1.0, kta_scale_1) sll to_integer (kta_scale_1);
--		report_error_normalize ("fail 2^kta_scale_1", kta_scale_1, to_sfixed (2**14, max_expected_s)); -- 2**14
----		cmd <= "0011"; -- / (kta_rc_ee+kta12_16*2^kta_scale_2)/2^kta_scale_1
--		in1div <= kta12_16;
--		in2div <= kta_scale_1;
--		state := w37;
--when w37 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s38; else v_wait1 := v_wait1 + 1; state := w37; end if;
--when s38 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		kta12_16 := resize (fpout, kta12_16);
--		report_error_normalize ("fail kta12_16 3", kta12_16, to_sfixed (0.005126953125, max_expected_s)); -- 0.005126953125
--		state := w38;
--when w38 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s39; else v_wait1 := v_wait1 + 1; state := w38; end if;
--when s39 =>
--		sftmp_slv_16 := x"2363" and x"0f00"; -- ee[0x2438]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		kvscale := resize (tmpsf4, kvscale);
--		report_error_normalize ("fail kvscale", kvscale, to_sfixed (3.0, max_expected_s)); -- 3
--		kvscale := to_sfixed (1.0,kvscale) sll to_integer (kvscale);
--		report_error_normalize ("fail 2^kvscale", kvscale, to_sfixed(8.0, max_expected_s)); -- 8
----		cmd <= "0011"; -- / kv12_16/2^kvscale
--		in1div <= kv12_16;
--		in2div <= kvscale;
--		state := w39;
--when w39 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s40; else v_wait1 := v_wait1 + 1; state := w39; end if;
--when s40 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		kv12_16 := resize (fpout, kv12_16);
--		report_error_normalize ("fail kv12_16", kv12_16, to_sfixed (0.5, max_expected_s)); -- 0.5
--		state := w40;
--when w40 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s41; else v_wait1 := v_wait1 + 1; state := w40; end if;
--when s41 =>
--		fptmp2 := to_sfixed (25.0, fptmp2);
--		report_error_normalize ("fail 25.0", fptmp2, to_sfixed (25.0, max_expected_s)); -- 25.0
----		cmd <= "0001"; -- - Ta-Ta0 Ta-25
--		in1sub <= Ta;
--		in2sub <= fptmp2;
--		state := w41;
--when w41 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s42; else v_wait1 := v_wait1 + 1; state := w41; end if;
--when s42 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		tad := resize (fpout, tad);
--		report_error_normalize ("fail tad", tad, to_sfixed (39.184-25.0, max_expected_s)); -- 39.184-25.0
--		state := w42;
--when w42 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s43; else v_wait1 := v_wait1 + 1; state := w42; end if;
--when s43 =>
--		fptmp2 := to_sfixed (3.3, fptmp2);
--		report_error_normalize ("fail 3.3", fptmp2, to_sfixed (3.3, max_expected_s)); -- 3.3
----		cmd <= "0001"; -- - Vdd-VddV0 Vdd-3.3
--		in1sub <= Vdd;
--		in2sub <= fptmp2;
--		state := w43;
--when w43 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s44; else v_wait1 := v_wait1 + 1; state := w43; end if;
--when s44 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		v0d := resize (fpout, v0d);
--		report_error_normalize ("fail v0d", v0d, to_sfixed (3.319-3.3, max_expected_s)); -- 3.319-3.3
--		state := w44;
--when w44 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s45; else v_wait1 := v_wait1 + 1; state := w44; end if;
--when s45 =>
----		cmd <= "0010"; -- * Kv12_16*(Vdd-VddV0)
--		in1mul <= kv12_16;
--		in2mul <= v0d;
--		state := w45;
--when w45 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s46; else v_wait1 := v_wait1 + 1; state := w45; end if;
--when s46 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		kv12_16 := resize (fpout, kv12_16);
--		report_error_normalize ("fail kv12_16", kv12_16, to_sfixed (0.5*(3.319-3.3), max_expected_s)); -- 0.5*(3.319-3.3)
--		state := w46;
--when w46 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s47; else v_wait1 := v_wait1 + 1; state := w46; end if;
--when s47 =>
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0000"; -- + 1+Kv12_16*(Vdd-VddV0)
--		in1add <= fptmp1;
--		in2add <= kv12_16;
--		state := w47;
--when w47 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s48; else v_wait1 := v_wait1 + 1; state := w47; end if;
--when s48 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kv12_16 := resize (fpout, kv12_16);
--		report_error_normalize ("fail kv12_16", kv12_16, to_sfixed (1.0+(0.5*(3.319-3.3)), max_expected_s)); -- 1.0+(0.5*(3.319-3.3))
--		state := w48;
--when w48 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s49; else v_wait1 := v_wait1 + 1; state := w48; end if;
--when s49 =>
----		cmd <= "0010"; -- * KTa(12,16)*(Ta-Ta0)
--		in1mul <= kta12_16;
--		in2mul <= tad;
--		state := w49;
--when w49 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s50; else v_wait1 := v_wait1 + 1; state := w49; end if;
--when s50 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		kta12_16 := resize (fpout, kta12_16);
--		report_error_normalize ("fail kta12_16", kta12_16, to_sfixed (0.005126953125*(39.184-25.0), max_expected_s)); -- 0.005126953125*(39.184-25.0)
--		state := w50;
--when w50 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s51; else v_wait1 := v_wait1 + 1; state := w50; end if;
--when s51 =>
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0000"; -- + 1+KTa(12,16)*(Ta-Ta0)
--		in1add <= fptmp1;
--		in2add <= kta12_16;
--		state := w51;
--when w51 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s52; else v_wait1 := v_wait1 + 1; state := w51; end if;
--when s52 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kta12_16 := resize (fpout, kta12_16);
--		report_error_normalize ("fail kta12_16", kta12_16, to_sfixed (1.0+(0.005126953125*(39.184-25.0)), max_expected_s)); -- 1.0+(0.005126953125*(39.184-25.0))
--		state := w52;
--when w52 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s53; else v_wait1 := v_wait1 + 1; state := w52; end if;
--when s53 =>
----		cmd <= "0010"; -- * PIXosref*(1+KTa(12,16)*(Ta-Ta0))
--		in1mul <= pixosref12_16;
--		in2mul <= kta12_16;
--		state := w53;
--when w53 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s54; else v_wait1 := v_wait1 + 1; state := w53; end if;
--when s54 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		kta12_16 := resize (fpout, kta12_16);
--		report_error_normalize ("fail kta12_16", kta12_16, to_sfixed ((-75.0)*(1.0+(0.005126953125*(39.184-25.0))), max_expected_s)); -- (-75.0)*(1.0+(0.005126953125*(39.184-25.0)))
--		state := w54;
--when w54 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s55; else v_wait1 := v_wait1 + 1; state := w54; end if;
--when s55 =>
----		cmd <= "0010"; -- * PIXosref*(1+KTa(12,16)*(Ta-Ta0))*(1+Kv(12,16)*(Vdd-VddV0))
--		in1mul <= kta12_16;
--		in2mul <= kv12_16;
--		state := w55;
--when w55 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s56; else v_wait1 := v_wait1 + 1; state := w55; end if;
--when s56 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		kta12_16 := resize (fpout, kta12_16);
--		report_error_normalize ("fail kta12_16", kta12_16, to_sfixed ((-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- (-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3))
--		state := w56;
--when w56 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s57; else v_wait1 := v_wait1 + 1; state := w56; end if;
--when s57 =>
----		cmd <= "0001"; -- - PIXgain-PIXosref*(1+KTa(12,16)*(Ta-Ta0))*(1+Kv(12,16)*(Vdd-VddV0))
--		in1sub <= pixgain12_16;
--		in2sub <= kta12_16;
--		state := w57;
--when w57 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s58; else v_wait1 := v_wait1 + 1; state := w57; end if;
--when s58 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		pixos12_16 := resize (fpout, pixos12_16);
--		report_error_normalize ("fail pixos12_16", pixos12_16, to_sfixed (619.679100908656-(-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- 619.679100908656-(-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3))
--		report_error_normalize ("fail pixos12_16 const", pixos12_16, to_sfixed (700.882495690877, max_expected_s)); -- 700.882495690877
--		state := w58;
--when w58 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s59; else v_wait1 := v_wait1 + 1; state := w58; end if;
--when s59 =>
--		fptmp2 := to_sfixed (1.0, fptmp2);
--		report_error_normalize ("fail 1.0", fptmp2, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0011"; -- / VIR(12,16)Emissivity_COMPOENSATED=pixos12_16/E E=1
--		in1div <= pixos12_16;
--		in2div <= fptmp2;
--		state := w59;
--when w59 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s60; else v_wait1 := v_wait1 + 1; state := w59; end if;
--when s60 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		vir12_16_emissitivy_componsated := resize (fpout, vir12_16_emissitivy_componsated);
--		report_error_normalize ("fail vir12_16_emissitivy_componsated", vir12_16_emissitivy_componsated, to_sfixed (700.882495690877, max_expected_s)); -- 700.882495690877
--		state := w60;
--when w60 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s61; else v_wait1 := v_wait1 + 1; state := w60; end if;
--when s61 =>
--		sftmp_slv_16 := x"ffca" and x"ffff"; -- ram[0x0708]
--		pixgain_cp_sp0 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), pixgain_cp_sp0);
--		report_error_normalize ("fail pixgain_cp_sp0", pixgain_cp_sp0, to_sfixed (-54.0, max_expected_s)); -- -54
----		cmd <= "0010"; -- * pixgain_cp_sp0*Kgain
--		in1mul <= pixgain_cp_sp0;
--		in2mul <= kgain;
--		state := w61;
--when w61 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s62; else v_wait1 := v_wait1 + 1; state := w61; end if;
--when s62 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		pixgain_cp_sp0 := resize (fpout, pixgain_cp_sp0);
--		report_error_normalize ("fail pixgain_cp_sp0", pixgain_cp_sp0, to_sfixed (-54.9469153515065, max_expected_s)); -- -54.9469153515065
--		state := w62;
--when w62 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s63; else v_wait1 := v_wait1 + 1; state := w62; end if;
--when s63 =>
--		sftmp_slv_16 := x"ffc8" and x"ffff"; -- ram[0x0728]
--		pixgain_cp_sp1 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), pixgain_cp_sp1);
--		report_error_normalize ("fail pixgain_cp_sp1", pixgain_cp_sp1, to_sfixed (-56.0, max_expected_s)); -- -56
----		cmd <= "0010"; -- * pixgain_cp_sp1*Kgain
--		in1mul <= pixgain_cp_sp1;
--		in2mul <= kgain;
--		state := w63;
--when w63 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s64; else v_wait1 := v_wait1 + 1; state := w63; end if;
--when s64 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		pixgain_cp_sp1 := resize (fpout, pixgain_cp_sp1);
--		report_error_normalize ("fail pixgain_cp_sp1", pixgain_cp_sp1, to_sfixed (-56.9819862904511, max_expected_s)); -- -56.9819862904511
--		state := w64;
--when w64 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s65; else v_wait1 := v_wait1 + 1; state := w64; end if;
--when s65 =>
--		sftmp_slv_16 := x"fbb5" and x"03ff"; -- ee[0x243a]
--		tmpslv10 := sftmp_slv_16 (9 downto 0);
--		tmpsf10 := to_sfixed (tmpslv10, tmpsf10);
--		off_cpsubpage_0 := resize (tmpsf10, off_cpsubpage_0);
--		report_error_normalize ("fail off_cpsubpage_0", off_cpsubpage_0, to_sfixed (-75.0, max_expected_s)); -- -75
--		state := w65;
--when w65 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s66; else v_wait1 := v_wait1 + 1; state := w65; end if;
--when s66 =>
--		sftmp_slv_16 := x"fbb5" and x"fc00"; -- ee[0x243a]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 10));
--		tmpslv6 := sftmp_slv_16 (5 downto 0);
--		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
--		off_cpsubpage_1_delta := resize (tmpsf6, kvscale);
--		report_error_normalize ("fail off_cpsubpage_1_delta", off_cpsubpage_1_delta, to_sfixed (-2.0, max_expected_s)); -- -2
----		cmd <= "0000"; -- + OFF_CPsubpage_0+OFF_CPsubpage_1_delta
--		in1add <= off_cpsubpage_0;
--		in2add <= off_cpsubpage_1_delta;
--		state := w66;
--when w66 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s67; else v_wait1 := v_wait1 + 1; state := w66; end if;
--when s67 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		off_cpsubpage_1 := resize (fpout, off_cpsubpage_1);
--		report_error_normalize ("fail off_cpsubpage_1", off_cpsubpage_1, to_sfixed (-77.0, max_expected_s)); -- -77.0
--		state := w67;
--when w67 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s68; else v_wait1 := v_wait1 + 1; state := w67; end if;
--when s68 =>
--		sftmp_slv_16 := x"044b" and x"00ff"; -- ee[0x243b]
--		kta_cp_ee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kta_cp_ee);
--		report_error_normalize ("fail kta_cp_ee", kta_cp_ee, to_sfixed (75.0, max_expected_s)); -- 75
----		cmd <= "0011"; -- / KTa_cp_ee/2^KTa_scale_1
--		in1div <= kta_cp_ee;
--		in2div <= kta_scale_1;
--		state := w68;
--when w68 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s69; else v_wait1 := v_wait1 + 1; state := w68; end if;
--when s69 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		kta_cp := resize (fpout, kta_cp);
--		report_error_normalize ("fail kta_cp", kta_cp, to_sfixed (0.00457763671875, max_expected_s)); -- 0.00457763671875
--		state := w69;
--when w69 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s70; else v_wait1 := v_wait1 + 1; state := w69; end if;
--when s70 =>
--		sftmp_slv_16 := x"2363" and x"0f00"; -- ee[0x2438]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		kv_scale := resize (tmpsf4, kv_scale);
--		report_error_normalize("fail kv_scale", kv_scale, to_sfixed (3.0, max_expected_s)); -- 3
--		kv_scale := to_sfixed (1.0, kv_scale) sll to_integer (kv_scale);
--		report_error_normalize("fail 2^kv_scale", kv_scale, to_sfixed (8.0, max_expected_s)); -- 8
--		state := w70;
--when w70 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s71; else v_wait1 := v_wait1 + 1; state := w70; end if;
--when s71 =>
--		sftmp_slv_16 := x"044b" and x"ff00"; -- ee[0x243b]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		tmpslv8 := sftmp_slv_16 (7 downto 0);
--		tmpsf8 := to_sfixed (tmpslv8, tmpsf8);
--		kv_cp_ee := resize (tmpsf8, kv_cp_ee);
--		report_error_normalize("fail kv_cp_ee", kv_cp_ee, to_sfixed (4.0, max_expected_s)); -- 4
--		state := w71;
--when w71 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s72; else v_wait1 := v_wait1 + 1; state := w71; end if;
--when s72 =>
----		cmd <= "0011"; -- / kv_cp_ee/2^kv_scale
--		in1div <= kv_cp_ee;
--		in2div <= kv_scale;
--		state := w72;
--when w72 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s73; else v_wait1 := v_wait1 + 1; state := w72; end if;
--when s73 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		kv_cp := resize (fpout, kv_cp);
--		report_error_normalize ("fail kv_cp", kv_cp, to_sfixed (0.5, max_expected_s)); -- 0.5
--		state := w73;
--when w73 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s74; else v_wait1 := v_wait1 + 1; state := w73; end if;
--when s74 =>
------0x2435 0x0994 
------IL_CHESS_C3 - 5 bits
------IL_CHESS_C2 - 5 bits
------IL_CHESS_C1 - 6 bits
------IL_CHESS_C3 = 0.125
------IL_CHESS_C2 = 3
------IL_CHESS_C1 = 1.25
--		sftmp_slv_16 := x"0994" and x"003f"; -- ee[0x2435]
--		tmpslv6 := sftmp_slv_16 (5 downto 0);
--		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
--		ilchessc1ee := resize (tmpsf6, ilchessc1ee);
--		report_error_normalize ("fail ilchessc1ee", ilchessc1ee, to_sfixed (20.0, max_expected_s)); -- 20.0
--		ilchessc1ee := ilchessc1ee srl 4;
--		report_error_normalize ("fail ilchessc1ee/2^4", ilchessc1ee, to_sfixed (1.25, max_expected_s)); -- 1.25
--		state := w74;
--when w74 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s75; else v_wait1 := v_wait1 + 1; state := w74; end if;
--when s75 =>
----		cmd <= "0010"; -- * KTa_cp*(Ta-Ta0)
--		in1mul <= kta_cp;
--		in2mul <= tad;
--		state := w75;
--when w75 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s76; else v_wait1 := v_wait1 + 1; state := w75; end if;
--when s76 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		kta_cp := resize (fpout, kta_cp);
--		report_error_normalize ("fail kta_cp*(Ta-Ta0)", kta_cp, to_sfixed (0.00457763671875*(39.184-25.0), max_expected_s)); -- 0.00457763671875*(39.184-25.0)
--		state := w76;
--when w76 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s77; else v_wait1 := v_wait1 + 1; state := w76; end if;
--when s77 =>
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0000"; -- + 1+KTa_cp*(Ta-Ta0)
--		in1add <= fptmp1;
--		in2add <= kta_cp;
--		state := w77;
--when w77 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s78; else v_wait1 := v_wait1 + 1; state := w77; end if;
--when s78 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kta_cp := resize (fpout, kta_cp);
--		report_error_normalize("fail kta_cp", kta_cp, to_sfixed (1.0+(0.00457763671875*(39.184-25.0)), max_expected_s)); -- 1.0+(0.00457763671875*(39.184-25.0))
--		state := w78;
--when w78 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s79; else v_wait1 := v_wait1 + 1; state := w78; end if;
--when s79 =>
----		cmd <= "0010"; -- * Kv_cp*(Vdd-Vdd0)
--		in1mul <= kv_cp;
--		in2mul <= v0d;
--		state := w79;
--when w79 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s80; else v_wait1 := v_wait1 + 1; state := w79; end if;
--when s80 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		kv_cp := resize (fpout, kv_cp);
--		report_error_normalize ("fail Kv_cp*(Vdd-Vdd0)", kv_cp, to_sfixed (0.5*(3.319-3.3), max_expected_s)); -- 0.5*(3.319-3.3)
--		state := w80;
--when w80 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s81; else v_wait1 := v_wait1 + 1; state := w80; end if;
--when s81 =>
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0000"; -- 1+Kv_cp*(Vdd-Vdd0)
--		in1add <= fptmp1;
--		in2add <= kv_cp;
--		state := w81;
--when w81 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s82; else v_wait1 := v_wait1 + 1; state := w81; end if;
--when s82 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kv_cp := resize (fpout, kv_cp);
--		report_error_normalize ("fail 1+Kv_cp*(Vdd-Vdd0)", kv_cp, to_sfixed (1.0+(0.5*(3.319-3.3)), max_expected_s)); -- 1.0+(0.5*(3.319-3.3))
--		state := w82;
--when w82 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s83; else v_wait1 := v_wait1 + 1; state := w82; end if;
--when s83 =>
----		cmd <= "0010"; -- * (1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
--		in1mul <= kta_cp;
--		in2mul <= kv_cp;
--		state := w83;
--when w83 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s84; else v_wait1 := v_wait1 + 1; state := w83; end if;
--when s84 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		ktacp_kvcp_mul := resize (fpout, ktacp_kvcp_mul);
--		report_error_normalize ("fail (1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", ktacp_kvcp_mul, to_sfixed ((1.0+(0.00457763671875*(39.184-25.0)))*(1.0+(0.5*(3.319-3.3))), max_expected_s)); -- (1.0+(0.00457763671875*(39.184-25.0)))*(1.0+(0.5*(3.319-3.3)))
--		state := w84;
--when w84 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s85; else v_wait1 := v_wait1 + 1; state := w84; end if;
--when s85 =>
----		cmd <= "0010"; -- * OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
--		in1mul <= ktacp_kvcp_mul;
--		in2mul <= off_cpsubpage_0;
--		state := w85;
--when w85 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s86; else v_wait1 := v_wait1 + 1; state := w85; end if;
--when s86 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		pixos_cp_sp0 := resize (fpout, pixos_cp_sp0);
--		report_error_normalize ("fail OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp0, to_sfixed((-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- (-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
--		state := w86;
--when w86 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s87; else v_wait1 := v_wait1 + 1; state := w86; end if;
--when s87 =>
----		cmd <= "0001"; -- - PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
--		in1sub <= pixgain_cp_sp0;
--		in2sub <= pixos_cp_sp0;
--		state := w87;
--when w87 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s88; else v_wait1 := v_wait1 + 1; state := w87; end if;
--when s88 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		pixos_cp_sp0 := resize (fpout, pixos_cp_sp0);
--		report_error_normalize ("fail PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp0, to_sfixed ((-54.9469153515065)-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- (-54.9469153515065)-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
--		report_error_normalize ("fail PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) const", pixos_cp_sp0, to_sfixed (25.6666575059956, max_expected_s)); -- 25.6666575059956
--		state := w88;
--when w88 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s89; else v_wait1 := v_wait1 + 1; state := w88; end if;
--when s89 =>
----		cmd <= "0010"; -- * OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
--		in1mul <= ktacp_kvcp_mul;
--		in2mul <= off_cpsubpage_1;
--		state := w89;
--when w89 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s90; else v_wait1 := v_wait1 + 1; state := w89; end if;
--when s90 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		pixos_cp_sp1 := resize (fpout, pixos_cp_sp1);
--		report_error_normalize("fail OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp1, to_sfixed ((-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- (-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
--		state := w90;
--when w90 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s91; else v_wait1 := v_wait1 + 1; state := w90; end if;
--when s91 =>
----		cmd <= "0001"; -- - PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
--		in1sub <= pixgain_cp_sp1;
--		in2sub <= pixos_cp_sp1;
--		state := w91;
--when w91 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s92; else v_wait1 := v_wait1 + 1; state := w91; end if;
--when s92 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		pixos_cp_sp1 := resize (fpout, pixos_cp_sp1);
--		report_error_normalize ("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp1, to_sfixed ((-56.9819862904511)-(-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- (-56.9819862904511)-(-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
--		report_error_normalize ("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) const", pixos_cp_sp1, to_sfixed (21.63158656770509, max_expected_s)); -- 21.63158656770509 -- xxx ??? ERROR on page 41 ??? xxx
--		report_error_normalize ("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) const, error ? on page 41 => pixos_cp_sp1 = 21.63158656770509", pixos_cp_sp1, to_sfixed (25.79655775862116562500, max_expected_s)); -- 25.79655775862116562500 -- xxx from bc calculator
--		state := w92;
--when w92 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s93; else v_wait1 := v_wait1 + 1; state := w92; end if;
--when s93 =>
---- ch_pattern
--		tmpuf1 := to_ufixed(
--		std_logic_vector(
--		to_unsigned((integer((pixelnumber12_16-1)/32)-integer(integer((pixelnumber12_16-1)/32)/2)*2),1)
--		xor
--		to_unsigned((integer(pixelnumber12_16-1)-integer((pixelnumber12_16-1)/2)*2),1)
--		),tmpuf1
--		);
--		tmpuf1 := to_ufixed (0.0, tmpuf1);
--		report_error_normalize ("fail pixelnumber12_16 xor uf", tmpuf1, to_ufixed (0.0, max_expected_u));
--		tmpsf1 := to_sfixed (tmpuf1)(0 downto 0);
--		report_error_normalize ("fail pixelnumber12_16 xor sf", tmpsf1, to_sfixed (0.0, max_expected_s));
--		ch_pattern_12_16_u := resize (tmpuf1, ch_pattern_12_16_u);
--		report_error_normalize ("fail ch_pattern_12_16_u", ch_pattern_12_16_u, to_ufixed (0.0, max_expected_u)); -- 0
--		ch_pattern_12_16_s := resize (to_sfixed (ch_pattern_12_16_u), ch_pattern_12_16_s);
--		report_error_normalize ("fail ch_pattern_12_16_s", ch_pattern_12_16_s, to_sfixed (0.0, max_expected_s)); -- 0
--		ch_pattern_12_16 := ch_pattern_12_16_s;
--		report_error_normalize ("fail ch_pattern_12_16 after convert u->s", ch_pattern_12_16, to_sfixed (0.0, max_expected_s)); -- 0
--		sftmp_slv_16 := x"f020" and x"003f"; -- ee[0x243c]
--		tgcee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), tgcee);
--		report_error_normalize ("fail tgcee", tgcee, to_sfixed (32.0, max_expected_s)); -- 32
--		tgcee := tgcee srl 5;
--		report_error_normalize ("fail tgcee/2^5", tgcee, to_sfixed (1.0, max_expected_s)); -- 1
--		tgc := tgcee;
--		state := w93;
--when w93 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s94; else v_wait1 := v_wait1 + 1; state := w93; end if;
--when s94 =>
----		cmd <= "0010"; -- * CHIL_pattern*PIXos_cp_sp1
--		in1mul <= ch_pattern_12_16;
--		in2mul <= pixos_cp_sp1;
--		state := w94;
--when w94 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s95; else v_wait1 := v_wait1 + 1; state := w94; end if;
--when s95 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		pixospatt1 := resize (fpout, pixospatt1);
--		report_error_normalize ("fail pixospatt1", pixospatt1, to_sfixed (to_real (ch_pattern_12_16)*to_real (pixos_cp_sp1), max_expected_s)); -- ch_pattern_12_16*pixos_cp_sp1
--		state := w95;
--when w95 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s96; else v_wait1 := v_wait1 + 1; state := w95; end if;
--when s96 =>
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0001"; -- - (1-CHIL_pattern)
--		in1sub <= fptmp1;
--		in2sub <= ch_pattern_12_16;
--		state := w96;
--when w96 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s97; else v_wait1 := v_wait1 + 1; state := w96; end if;
--when s97 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		ch_pattern_12_16_minusone := resize (fpout, ch_pattern_12_16_minusone);
--		report_error_normalize ("fail ch_pattern_12_16_minusone", ch_pattern_12_16_minusone, to_sfixed (1.0-to_real (ch_pattern_12_16), max_expected_s)); -- 1.0-ch_pattern_12_16
--		state := w97;
--when w97 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s98; else v_wait1 := v_wait1 + 1; state := w97; end if;
--when s98 =>
----		cmd <= "0010"; -- * (1-CHIL_pattern)*PIXos_cp_sp0
--		in1mul <= ch_pattern_12_16_minusone;
--		in2mul <= pixos_cp_sp0;
--		state := w98;
--when w98 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s99; else v_wait1 := v_wait1 + 1; state := w98; end if;
--when s99 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		pixospatt2 := resize (fpout, pixospatt2);
--		report_error_normalize ("fail pixospatt2", pixospatt2, to_sfixed (to_real (ch_pattern_12_16_minusone)*to_real (pixos_cp_sp0), max_expected_s)); -- ch_pattern_12_16_minusone*pixos_cp_sp0
--		state := w99;
--when w99 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s100; else v_wait1 := v_wait1 + 1; state := w99; end if;
--when s100 =>
----		cmd <= "0000"; -- + ((1-CHIL_pattern)*PIXos_cp_sp0)+(CHIL_pattern*PIXos_cp_sp1)
--		in1add <= pixospatt1;
--		in2add <= pixospatt2;
--		state := w100;
--when w100 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s101; else v_wait1 := v_wait1 + 1; state := w100; end if;
--when s101 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		pixospatt12 := resize (fpout, pixospatt12);
--		report_error_normalize ("fail ((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)", pixospatt12, to_sfixed (((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)))), max_expected_s)); -- :E
--		report_error_normalize ("fail ((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) const", pixospatt12, to_sfixed(21.6315865670509, max_expected_s)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
--		state := w101;
--when w101 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s102; else v_wait1 := v_wait1 + 1; state := w101; end if;
--when s102 =>
----		cmd <= "0010"; -- * TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)
--		in1mul <= tgc;
--		in2mul <= pixospatt12;
--		state := w102;
--when w102 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s103; else v_wait1 := v_wait1 + 1; state := w102; end if;
--when s103 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		pixospatt12 := resize (fpout, pixospatt12);
--		report_error_normalize ("fail TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)", pixospatt12, to_sfixed ((1.0*((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))), max_expected_s)); -- :E
--		report_error_normalize ("fail TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) const", pixospatt12, to_sfixed (21.6315865670509, max_expected_s)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
--		state := w103;
--when w103 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s104; else v_wait1 := v_wait1 + 1; state := w103; end if;
--when s104 =>
----		cmd <= "0001"; -- - VIR(12,16)EMISSIVITY_COMPENSATED-TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)
--		in1sub <= vir12_16_emissitivy_componsated;
--		in2sub <= pixospatt12;
--		state := w104;
--when w104 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s105; else v_wait1 := v_wait1 + 1; state := w104; end if;
--when s105 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		vir_12_16_compensated := resize (fpout, vir_12_16_compensated);
--		report_error_normalize ("fail VIR(12,16)EMISSIVITY_COMPENSATED-TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)", vir_12_16_compensated, to_sfixed ((700.882495690877-(1.0*((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)))))), max_expected_s)); -- :E
--		report_error_normalize ("fail VIR(12,16)EMISSIVITY_COMPENSATED-TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) const", vir_12_16_compensated, to_sfixed (679.250909123826, max_expected_s)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
--		state := w105;
--when w105 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s106; else v_wait1 := v_wait1 + 1; state := w105; end if;
--when s106 =>
--		sftmp_slv_16 := x"79a6" and x"f000"; -- ee[0x2420]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		ascalecp := resize (tmpsf4, ascalecp);
--		report_error_normalize ("fail ascalecp", ascalecp, to_sfixed (7.0, max_expected_s)); -- 7
--		fptmp2 := to_sfixed (27.0, fptmp2);
--		report_error_normalize ("fail 27.0", fptmp2, to_sfixed (27.0, max_expected_s));
----		cmd <= "0000"; -- +Ascale_cp+27
--		in1add <= ascalecp;
--		in2add <= fptmp2;
--		state := w106;
--when w106 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s107; else v_wait1 := v_wait1 + 1; state := w106; end if;
--when s107 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		ascalecp := resize (fpout, ascalecp);
--		report_error_normalize ("fail ascalecp", ascalecp, to_sfixed (34.0, max_expected_s)); -- 34
--		sftmp_slv_16 := x"e446" and x"fc00"; -- ee[0x2439]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 10));
--		tmpslv6 := sftmp_slv_16 (5 downto 0);
--		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
--		cpp1p0ratio := resize (tmpsf6, cpp1p0ratio);
--		report_error_normalize ("fail cpp1p0ratio", cpp1p0ratio, to_sfixed (-7.0, max_expected_s)); -- -7
--		sftmp_slv_16 := x"e446" and x"03ff"; -- ee[0x2439]
--		tmpslv10 := sftmp_slv_16 (9 downto 0);
--		tmpsf10 := to_sfixed (tmpslv10, tmpsf10);
--		acpsubpage0 := resize (tmpsf10, acpsubpage0);
--		report_error_normalize ("fail acpsubpage0 - xxx", acpsubpage0, to_sfixed (70.0, max_expected_s)); -- 70
--		ascalecp := to_sfixed (1.0, ascalecp) sll to_integer (ascalecp);
--		report_error_normalize ("2^ascalecp", ascalecp, to_sfixed (17179869184.0, max_expected_s)); -- 2**34
----		cmd <= "0011"; -- / acpsubpage0/2^ascalecp
--		in1div <= acpsubpage0;
--		in2div <= ascalecp;
--		state := w107;
--when w107 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s108; else v_wait1 := v_wait1 + 1; state := w107; end if;
--when s108 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		acpsubpage0 := resize (fpout, acpsubpage0);
--		report_error_normalize ("fail acpsubpage0", acpsubpage0, to_sfixed (0.00000000407453626394272, max_expected_s)); -- 0.00000000407453626394272
--		fptmp2 := to_sfixed (2**7, fptmp2);
--		report_error_normalize ("fail 2**7", fptmp2, to_sfixed (2**7, max_expected_s));		
----		cmd <= "0011"; -- / cpp1p0ratio/2^7
--		in1div <= cpp1p0ratio;
--		in2div <= fptmp2;
--		state := w108;
--when w108 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s109; else v_wait1 := v_wait1 + 1; state := w108; end if;
--when s109 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		cpp1p0ratio := resize (fpout, cpp1p0ratio);
--		report_error_normalize ("fail cpp1p0ratio 1", cpp1p0ratio, to_sfixed (-0.05468750000000000000, max_expected_s)); -- -0.05468750000000000000
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s));
----		cmd <= "0000"; -- + 1+(cpp1p0ratio/2^7)
--		in1add <= fptmp1;
--		in2add <= cpp1p0ratio;
--		state := w109;
--when w109 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s110; else v_wait1 := v_wait1 + 1; state := w109; end if;
--when s110 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		cpp1p0ratio := resize (fpout, cpp1p0ratio);
--		report_error_normalize ("fail cpp1p0ratio 2", cpp1p0ratio, to_sfixed (1.0+(-0.05468750000000000000), max_expected_s)); -- 0.9453125
----		cmd <= "0010"; -- * acpsubpage0*(1+(cpp1p0ratio/2^7))
--		in1mul <= acpsubpage0;
--		in2mul <= cpp1p0ratio;
--		state := w110;
--when w110 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s111; else v_wait1 := v_wait1 + 1; state := w110; end if;
--when s111 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acpsubpage1 := resize (fpout, acpsubpage1);
--		report_error_normalize ("fail acpsubpage1", acpsubpage1, to_sfixed ((0.00000000407453626394272)*(0.9453125), max_expected_s)); -- 0.00000000407453626394272*0.9453125
--		report_error_normalize ("fail acpsubpage1 const", acpsubpage1, to_sfixed (0.00000000385171006200835, max_expected_s)); -- 0.00000000385171006200835
--		sftmp_slv_16 := x"f020" and x"ff00"; -- ee[0x243c]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		tmpslv8 := sftmp_slv_16 (7 downto 0);
--		tmpsf8 := to_sfixed (tmpslv8, tmpsf8);
--		kstaee := resize (tmpsf8, kstaee);
--		report_error_normalize ("fail kstaee", kstaee, to_sfixed (-16.0, max_expected_s)); -- -16
--		fptmp2 := to_sfixed (2**13, fptmp2);
--		report_error_normalize ("fail 2**13", fptmp2, to_sfixed (2**13, max_expected_s)); -- 2**13
----		cmd <= "0011"; -- / kstaee/2^13
--		in1div <= kstaee;
--		in2div <= fptmp2;
--		state := w111;
--when w111 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s112; else v_wait1 := v_wait1 + 1; state := w111; end if;
--when s112 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		ksta := resize (fpout, ksta);
--		report_error_normalize ("fail ksta", ksta, to_sfixed (-0.001953125, max_expected_s)); -- -0.001953125
--		sftmp_slv_16 := x"2f44" and x"ffff"; -- ee[0x2421]
--		areference := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), areference);
--		report_error_normalize ("fail areference", areference, to_sfixed (12100.0, max_expected_s)); -- 12100
--		sftmp_slv_16 := x"79a6" and x"f000"; -- ee[0x2420]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		ascale := resize (tmpsf4, ascale);
--		report_error_normalize ("fail ascale", ascale, to_sfixed (7.0, max_expected_s)); -- 7
--		fptmp2 := to_sfixed (30.0, fptmp2);
--		report_error_normalize ("fail 30.0", fptmp2, to_sfixed (30.0, max_expected_s));
----		cmd <= "0000"; -- + ascale+30
--		in1add <= ascale;
--		in2add <= fptmp2;
--		state := w112;
--when w112 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s113; else v_wait1 := v_wait1 + 1; state := w112; end if;
--when s113 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		ascale := resize (fpout, ascale);
--		report_error_normalize ("fail ascale", ascale, to_sfixed (37.0, max_expected_s)); -- 37
--		sftmp_slv_16 := x"3333" and x"f000"; -- ee[0x2424]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		accrow12 := resize (tmpsf4, accrow12);
--		report_error_normalize ("fail accrow12", accrow12, to_sfixed (3.0, max_expected_s)); -- 3
--		sftmp_slv_16 := x"3333" and x"f000"; -- ee[0x242b]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		acccolumn16 := resize (tmpsf4, acccolumn16);
--		report_error_normalize ("fail acccolumn16", acccolumn16, to_sfixed (3.0, max_expected_s)); -- 3
--		sftmp_slv_16 := x"79a6" and x"0f00"; -- ee[0x2420]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		accscalerow := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), accscalerow);
--		report_error_normalize ("fail accscalerow", accscalerow, to_sfixed (9.0, max_expected_s)); -- 9
--		sftmp_slv_16 := x"79a6" and x"00f0"; -- ee[0x2420]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 4));
--		accscalecolumn := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), accscalecolumn);
--		report_error_normalize ("fail accscalecolumn", accscalecolumn, to_sfixed (10.0, max_expected_s)); -- 10
--		sftmp_slv_16 := x"79a6" and x"000f"; -- ee[0x2420]
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		accscaleremnant := resize (tmpsf4, accscaleremnant);
--		report_error_normalize ("fail accscaleremnant", accscaleremnant, to_sfixed (6.0, max_expected_s)); -- 6
--		sftmp_slv_16 := x"08a0" and x"03f0"; -- ee[0x258f]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 4));
--		tmpslv6 := sftmp_slv_16 (5 downto 0);
--		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
--		apixel_12_16 := resize (tmpsf6, apixel_12_16);
--		report_error_normalize ("fail apixel_12_16", apixel_12_16, to_sfixed (10.0, max_expected_s)); -- 10
--		accsro := to_sfixed (1.0, accsro) sll to_integer (accscalerow);
--		report_error_normalize ("fail 2^accscalerow", accsro, to_sfixed (2**9, max_expected_s)); -- 2**9
--		accsc := to_sfixed (1.0, accsc) sll to_integer (accscalecolumn);
--		report_error_normalize ("fail 2^accscalecolumn", accsc, to_sfixed (2**10, max_expected_s)); -- 2**10
--		accsre := to_sfixed (1.0, accsre) sll to_integer (accscaleremnant);
--		report_error_normalize ("fail 2^accscaleremnant", accsre, to_sfixed (2**6, max_expected_s)); -- 2**6
--		state := w113;
--when w113 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s114; else v_wait1 := v_wait1 + 1; state := w113; end if;
--when s114 =>
----		cmd <= "0010"; -- * accrow12*2^accscalerow
--		in1mul <= accrow12;
--		in2mul <= accsro;
--		state := w114;
--when w114 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s115; else v_wait1 := v_wait1 + 1; state := w114; end if;
--when s115 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		accsror := resize (fpout, accsror);
--		report_error_normalize ("fail accsror", accsror, to_sfixed (3.0*(2**9), max_expected_s)); -- 3.0*(2**9)
----		cmd <= "0010"; -- * acccolumn16*2^accscalecolumn
--		in1mul <= acccolumn16;
--		in2mul <= accsc;
--		state := w115;
--when w115 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s116; else v_wait1 := v_wait1 + 1; state := w115; end if;
--when s116 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		accscr := resize (fpout, accscr);
--		report_error_normalize ("fail accscr", accscr, to_sfixed (3.0*(2**10), max_expected_s)); -- 3.0*(2**10)
----		cmd <= "0010"; -- * apixel_12_16*2^accscaleremnant
--		in1mul <= apixel_12_16;
--		in2mul <= accsre;
--		state := w116;
--when w116 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s117; else v_wait1 := v_wait1 + 1; state := w116; end if;
--when s117 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		accsrer := resize (fpout, accsrer);
--		report_error_normalize ("fail accsrer", accsrer, to_sfixed (10.0*(2**6), max_expected_s)); -- 10.0*(2**6)
----		cmd <= "0000"; -- + areference+(accrow12*2^accscalerow)
--		in1add <= areference;
--		in2add <= accsror;
--		state := w117;
--when w117 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s118; else v_wait1 := v_wait1 + 1; state := w117; end if;
--when s118 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		a_12_16 := resize (fpout, a_12_16);
--		report_error_normalize ("fail a_12_16 1", a_12_16, to_sfixed (12100.0+3.0*(2**9), max_expected_s)); -- 12100.0+(3.0*(2**9))
----		cmd <= "0000"; -- + areference+(accrow12*2^accscalerow)+(acccolumn16*2^accscalecolumn)
--		in1add <= a_12_16;
--		in2add <= accscr;
--		state := w118;
--when w118 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s119; else v_wait1 := v_wait1 + 1; state := w118; end if;
--when s119 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		a_12_16 := resize (fpout, a_12_16);
--		report_error_normalize ("fail a_12_16 2", a_12_16, to_sfixed (12100.0+(3.0*(2**9))+(3.0*(2**10)), max_expected_s)); -- 12100.0+(3.0*(2**9))+(3.0*(2**10))
----		cmd <= "0000"; -- + areference+(accrow12*2^accscalerow)+(acccolumn16*2^accscalecolumn)+(apixel_12_16*2^accscaleremnant)
--		in1add <= a_12_16;
--		in2add <= accsrer;
--		state := w119;
--when w119 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s120; else v_wait1 := v_wait1 + 1; state := w119; end if;
--when s120 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		a_12_16 := resize (fpout, a_12_16);
--		report_error_normalize ("fail a_12_16 3", a_12_16, to_sfixed (12100.0+(3.0*(2**9))+(3.0*(2**10))+(10.0*(2**6)), max_expected_s)); -- 12100.0+(3.0*(2**9))+(3.0*(2**10))+(10*(2**6))
--		ascale := to_sfixed (1.0, ascale) sll to_integer (ascale);
--		report_error_normalize ("fail 2^ascale", ascale, to_sfixed (137438953472.0, max_expected_s)); -- 137438953472
----		cmd <= "0011"; -- / (12100.0+(3.0*(2**9))+(3.0*(2**10))+(10*(2**6)))/2^ascale
--		in1div <= a_12_16;
--		in2div <= ascale;
--		state := w120;
--when w120 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s121; else v_wait1 := v_wait1 + 1; state := w120; end if;
--when s121 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		a_12_16 := resize (fpout, a_12_16);
--		report_error_normalize ("fail a_12_16 4", a_12_16, to_sfixed (0.000000126223312690865, max_expected_s)); -- 0.000000126223312690865
----		cmd <= "0010"; -- * Ksta*(Ta-Ta0)
--		in1mul <= ksta;
--		in2mul <= tad;
--		state := w121;
--when w121 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s122; else v_wait1 := v_wait1 + 1; state := w121; end if;
--when s122 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		ksta := resize (fpout, ksta);
--		report_error_normalize ("fail Ksta*(Ta-Ta0)", ksta, to_sfixed (-0.001953125*(39.184-25.0), max_expected_s)); -- -0.001953125*(39.184-25.0)
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s));
----		cmd <= "0000"; -- + 1+(Ksta*(Ta-Ta0))
--		in1add <= fptmp1;
--		in2add <= ksta;
--		state := w122;
--when w122 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s123; else v_wait1 := v_wait1 + 1; state := w122; end if;
--when s123 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		ksta := resize (fpout, ksta);
--		report_error_normalize ("fail 1+(Ksta*(Ta-Ta0))", ksta, to_sfixed (1.0+(-0.001953125*(39.184-25.0)), max_expected_s)); -- 1+(-0.001953125*(39.184-25.0))
----		cmd <= "0010"; -- * pattern*acpsubpage1
--		in1mul <= ch_pattern_12_16;
--		in2mul <= acpsubpage1;
--		state := w123;
--when w123 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s124; else v_wait1 := v_wait1 + 1; state := w123; end if;
--when s124 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acpsubpagepatt1 := resize (fpout, acpsubpagepatt1);
--		report_error_normalize ("fail pattern*acpsubpage1", acpsubpagepatt1, to_sfixed (0.0*0.00000000385171006200835, max_expected_s)); -- 0*0.00000000385171006200835
----		cmd <= "0010"; -- * (1-pattern)*acpsubpage0
--		in1mul <= ch_pattern_12_16_minusone;
--		in2mul <= acpsubpage0;
--		state := w124;
--when w124 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s125; else v_wait1 := v_wait1 + 1; state := w124; end if;
--when s125 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acpsubpagepatt0 := resize (fpout, acpsubpagepatt0);
--		report_error_normalize ("fail (1-pattern)*acpsubpage0", acpsubpagepatt0, to_sfixed ((1.0-0.0)*0.00000000407453626394272, max_expected_s)); -- (1-0)*0.00000000407453626394272
----		cmd <= "0000"; -- + (((1-pattern)*acpsubpage0)+(pattern*acpsubpage1))
--		in1add <= acpsubpagepatt0;
--		in2add <= acpsubpagepatt1;
--		state := w125;
--when w125 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s126; else v_wait1 := v_wait1 + 1; state := w125; end if;
--when s126 => -- xxx LOL :ASDASDASD simulation stop here in isim 14.7 when state is signal
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		acpsubpagepatt01 := resize (fpout, acpsubpagepatt01);
--		report_error_normalize ("fail (((1-pattern)*acpsubpage0)+(pattern*acpsubpage1))", acpsubpagepatt01, to_sfixed (((1.0-0.0)*0.00000000407453626394272)+(0*0.00000000385171006200835), max_expected_s)); -- (1-0)*0.00000000407453626394272
----		cmd <= "0010"; -- * tgc*(((1-pattern)*acpsubpage0)+(pattern*acpsubpage1))
--		in1mul <= tgc;
--		in2mul <= acpsubpagepatt01;
--		state := w126;
--when w126 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s127; else v_wait1 := v_wait1 + 1; state := w126; end if;
--when s127 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acpsubpagepatt01 := resize (fpout, acpsubpagepatt01);
--		report_error_normalize ("fail tgc*(((1-pattern)*acpsubpage0)+(pattern*acpsubpage1))", acpsubpagepatt01, to_sfixed (1.0*(((1.0-0.0)*0.00000000407453626394272)+(0*0.00000000385171006200835)), max_expected_s)); -- 1.0*(((1.0-0.0)*0.00000000407453626394272)+(0*0.00000000385171006200835))
----		cmd <= "0001"; -- - a_12_16-(tgc*(((1-pattern)*acpsubpage0)+(pattern*acpsubpage1)))
--		in1sub <= a_12_16;
--		in2sub <= acpsubpagepatt01;
--		state := w127;
--when w127 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s128; else v_wait1 := v_wait1 + 1; state := w127; end if;
--when s128 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		acomp_12_16 := resize (fpout, acomp_12_16);
--		report_error_normalize ("a_12_16-(tgc*(((1-pattern)*acpsubpage0)+(pattern*acpsubpage1)))", acomp_12_16, to_sfixed (0.000000126223312690865-(1.0*(((1.0-0.0)*0.00000000407453626394272)+(0*0.00000000385171006200835))), max_expected_s)); -- 0.000000126223312690865-(1.0*(((1.0-0.0)*0.00000000407453626394272)+(0*0.00000000385171006200835)))
----		cmd <= "0010"; -- * (a_12_16-(tgc*(((1-pattern)*acpsubpage0)+(pattern*acpsubpage1))))*(1+(Ksta*(Ta-Ta0)))
--		in1mul <= acomp_12_16;
--		in2mul <= ksta;
--		state := w128;
--when w128 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s129; else v_wait1 := v_wait1 + 1; state := w128; end if;
--when s129 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acomp_12_16 := resize (fpout, acomp_12_16);
--		report_error_normalize ("fail acomp_12_16", acomp_12_16, to_sfixed (0.00000011876487360496, max_expected_s)); -- 0.00000011876487360496
--		sftmp_slv_16 := x"9797" and x"ff00"; -- ee[0x243d]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		tmpslv8 := sftmp_slv_16 (7 downto 0);
--		tmpsf8 := to_sfixed (tmpslv8, tmpsf8);
--		ksto2ee := resize (tmpsf8, ksto2ee);
--		report_error_normalize ("fail ksto2ee", ksto2ee, to_sfixed (-105.0, max_expected_s)); -- -105
--		sftmp_slv_16 := x"2889" and x"000f"; -- ee[0x243f]
--		kstoscale := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kstoscale);
--		report_error_normalize ("fail kstoscale", kstoscale, to_sfixed (9.0, max_expected_s)); -- 9
--		fptmp2 := to_sfixed (8.0, fptmp2);
--		report_error_normalize ("fail 8.0", fptmp2, to_sfixed (8.0, max_expected_s));
----		cmd <= "0000"; -- + kstoscale+8
--		in1add <= kstoscale;
--		in2add <= fptmp2;
--		state := w129;
--when w129 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s130; else v_wait1 := v_wait1 + 1; state := w129; end if;
--when s130 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kstoscale := resize (fpout, kstoscale);
--		report_error_normalize ("fail kstoscale", kstoscale, to_sfixed (17.0, max_expected_s)); -- 17
--		fptmp2 := to_sfixed (273.15, fptmp2);
--		report_error_normalize ("fail 273.15", fptmp2, to_sfixed (273.15, max_expected_s));
----		cmd <= "0000"; -- + Ta+273.15
--		in1add <= Ta;
--		in2add <= fptmp2;
--		state := w130;
--when w130 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s131; else v_wait1 := v_wait1 + 1; state := w130; end if;
--when s131 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		tak4 := resize (fpout, tak4);
--		report_error_normalize ("fail TaK4**1", tak4, to_sfixed (39.184+273.15, max_expected_s)); -- 39.184+273.15
----		cmd <= "0010"; -- * TaK4*TaK4
--		in1mul <= tak4;
--		in2mul <= tak4;
--		state := w131;
--when w131 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s132; else v_wait1 := v_wait1 + 1; state := w131; end if;
--when s132 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		fptmp1 := resize (fpout, fptmp1);
--		report_error_normalize ("fail TaK4**2", fptmp1, to_sfixed ((39.184+273.15)*(39.184+273.15), max_expected_s)); -- (39.184+273.15)**2
----		cmd <= "0010"; -- * TaK4*TaK4*TaK4
--		in1mul <= fptmp1;
--		in2mul <= tak4;
--		state := w132;
--when w132 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s133; else v_wait1 := v_wait1 + 1; state := w132; end if;
--when s133 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		fptmp1 := resize (fpout, fptmp1);
--		report_error_normalize ("fail TaK4**3", fptmp1, to_sfixed ((39.184+273.15)*(39.184+273.15)*(39.184+273.15), max_expected_s)); -- (39.184+273.15)**3
----		cmd <= "0010"; -- * TaK4*TaK4*TaK4*TaK4
--		in1mul <= fptmp1;
--		in2mul <= tak4;
--		state := w133;
--when w133 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s134; else v_wait1 := v_wait1 + 1; state := w133; end if;
--when s134 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		fptmp1 := resize (fpout, fptmp1);
--		report_error_normalize ("fail TaK4**4", fptmp1, to_sfixed (to_real (tak4)*to_real (tak4)*to_real (tak4)*to_real (tak4), max_expected_s)); -- (39.184+273.15)**4
--		report_error_normalize ("fail TaK4**4", fptmp1, to_sfixed ((39.184+273.15)*(39.184+273.15)*(39.184+273.15)*(39.184+273.15), max_expected_s)); -- (39.184+273.15)**4
--		report_error_normalize ("fail TaK4**4 const", fptmp1, to_sfixed (9516495632.56, max_expected_s)); -- 9516495632.56
--		fptmp2 := to_sfixed (8.0, fptmp2);
--		report_error_normalize ("fail 8.0", fptmp2, to_sfixed (8.0, fptmp2));
----		cmd <= "0001"; -- - Ta-8
--		in1sub <= Ta;
--		in2sub <= fptmp2;
--		state := w134;
--when w134 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s135; else v_wait1 := v_wait1 + 1; state := w134; end if;
--when s135 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		trk4 := resize (fpout, trk4);
--		report_error_normalize ("fail trk4", trk4, to_sfixed (31.184, max_expected_s)); -- 31.184 ~31
----		cmd <= "0010"; -- * acomp_12_16**2
--		in1mul <= acomp_12_16;
--		in2mul <= acomp_12_16;
--		state := w135;
--when w135 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s136; else v_wait1 := v_wait1 + 1; state := w135; end if;
--when s136 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acomp_12_16_pow3 := resize (fpout, acomp_12_16_pow3);
--		report_error_normalize ("fail acomp_12_16**2", acomp_12_16_pow3, to_sfixed (to_real (acomp_12_16)*to_real (acomp_12_16), max_expected_s)); -- acomp_12_16**2
----		cmd <= "0010"; -- * acomp_12_16**3
--		in1mul <= acomp_12_16_pow3;
--		in2mul <= acomp_12_16;
--		state := w136;
--when w136 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s137; else v_wait1 := v_wait1 + 1; state := w136; end if;
--when s137 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acomp_12_16_pow3 := resize (fpout, acomp_12_16_pow3);
--		report_error_normalize ("fail acomp_12_16**3", acomp_12_16_pow3, to_sfixed (to_real (acomp_12_16)*to_real (acomp_12_16)*to_real (acomp_12_16), max_expected_s)); -- acomp_12_16**3
----		cmd <= "0010"; -- * acomp_12_16**4
--		in1mul <= acomp_12_16_pow3;
--		in2mul <= acomp_12_16;
--		state := w137;
--when w137 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s138; else v_wait1 := v_wait1 + 1; state := w137; end if;
--when s138 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acomp_12_16_pow4 := resize (fpout, acomp_12_16_pow4);
--		report_error_normalize ("fail acomp_12_16**4", acomp_12_16_pow4, to_sfixed (to_real (acomp_12_16)*to_real (acomp_12_16)*to_real (acomp_12_16)*to_real (acomp_12_16), max_expected_s)); -- acomp_12_16**4
----		cmd <= "0010"; -- * acomp_12_16**3*vir_12_16_compensated
--		in1mul <= acomp_12_16_pow3;
--		in2mul <= vir_12_16_compensated;
--		state := w138;
--when w138 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s139; else v_wait1 := v_wait1 + 1; state := w138; end if;
--when s139 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		fptmp1 := resize (fpout, fptmp1);
--		report_error_normalize ("fail acomp_12_16**3*vir_12_16_compensated", fptmp1, to_sfixed (((0.00000011876487360496)**3)*679.250909123826, max_expected_s)); -- ((0.00000011876487360496)**3)*679.250909123826
----		cmd <= "0010"; -- * acomp_12_16**4*TaK4
--		in1mul <= acomp_12_16_pow4;
--		in2mul <= Tak4;
--		state := w139;
--when w139 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s140; else v_wait1 := v_wait1 + 1; state := w139; end if;
--when s140 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		fptmp2 := resize (fpout, fptmp2);
--		report_error_normalize ("fail acomp_12_16**4*TaK4", fptmp2, to_sfixed (((0.00000011876487360496)**4)*9516495632.56, max_expected_s)); -- ((0.00000011876487360496)**4)*9516495632.56
----		cmd <= "0000"; -- + (acomp_12_16**3*vir_12_16_compensated)+(acomp_12_16**4*TaK4)
--		in1add <= fptmp1;
--		in1add <= fptmp2;
--		state := w140;
--when w140 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s141; else v_wait1 := v_wait1 + 1; state := w140; end if;
--when s141 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		fptmp1 := resize (fpout, fptmp1);
--		report_error_normalize ("fail (acomp_12_16**3*vir_12_16_compensated)+(acomp_12_16**4*TaK4)", fptmp1, to_sfixed ((((0.00000011876487360496)**3)*679.250909123826)+(((0.00000011876487360496)**4)*9516495632.56), max_expected_s)); -- (((0.00000011876487360496)**3)*679.250909123826)+(((0.00000011876487360496)**4)*9516495632.56)
--		o_out1 <= acomp_12_16;
report time'image(now) severity failure;

when ending =>

when others => null;
end case; end if; end if;
end process tester;

float2fixedclk <= i_clock;
fixed2floatclk <= i_clock;
sqrtfp2clk <= i_clock;
addfpclk <= i_clock;
subfpclk <= i_clock;
mulfpclk <= i_clock;
divfpclk <= i_clock;

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

end architecture testbench;

