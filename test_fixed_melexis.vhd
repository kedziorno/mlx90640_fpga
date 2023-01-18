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
i_ee0x2433 : in slv16;
i_ram0x072a : in slv16;
i_ee0x2438 : in slv16;
i_ram0x800d : in slv16;
i_ee0x2432 : in slv16;
i_ee0x2431 : in slv16;
i_ee0x2410 : in slv16;
i_ram0x0720 : in slv16;
i_ram0x0700 : in slv16;
i_ram0x070a : in slv16;
i_ee0x2430 : in slv16;
i_ram0x056f : in slv16; -- pxdata12,16
i_ee0x2411 : in slv16;
i_ee0x2414 : in slv16;
i_ee0x241b : in slv16;
i_ee0x25af : in slv16;
i_ee0x2437 : in slv16;
i_ee0x2434 : in slv16;
o_out1 : out fd2ft;
o_rdy : out std_logic;
o_out2 : out st_sfixed_max
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
sclr : IN STD_LOGIC;
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
signal divfpsclr : STD_LOGIC;
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

component mem_float2powerN is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_N : in std_logic_vector (5 downto 0);
o_2powerN : out std_logic_vector (31 downto 0)
);
end component mem_float2powerN;

signal mem_float2powerN_clock1 : std_logic;
signal mem_float2powerN_reset1 : std_logic;
signal mem_float2powerN_N1 : std_logic_vector (5 downto 0);
signal mem_float2powerN_2powerN1 : std_logic_vector (31 downto 0);

signal mem_float2powerN_clock2 : std_logic;
signal mem_float2powerN_reset2 : std_logic;
signal mem_float2powerN_N2 : std_logic_vector (5 downto 0);
signal mem_float2powerN_2powerN2 : std_logic_vector (31 downto 0);

signal rdyrecover : std_logic; -- signal for tb when rdy not appear

begin

o_rdy <=
fixed2floatrdy when fixed2floatce = '1' else
float2fixedrdy when float2fixedce = '1' else
addfprdy when addfpce = '1' else
subfprdy when subfpce = '1' else
mulfprdy when mulfpce = '1' else
divfprdy when divfpce = '1' else
sqrtfp2rdy when sqrtfp2ce = '1' else
rdyrecover when
	(fixed2floatce = '0' and
	float2fixedce = '0' and
	addfpce = '0' and
	subfpce = '0' and
	mulfpce = '0' and
	divfpce = '0' and
	sqrtfp2ce = '0')
else
'0';

	-- purpose: main test loop
	tester : process (i_clock,i_reset) is
		variable state : states;
		variable sftmp_slv_fpbits : std_logic_vector(FP_BITS-1 downto 0);
		variable eeprom16slv,ram16slv : slv16;
		variable eeprom16sf,ram16sf : sfixed16;
		variable eeprom16uf,ram16uf : ufixed16;
		variable kvdd,vdd25,kvptat,ktptat,deltaV,vdd,vptat,vbe,vptat25,alphaptatee,alphaptat,vptatart,Ta,Kgain,gain : st_sfixed_max;
		variable pixgain1216,offsetaverage,occrow12,occscalerow,occcolumn16,occscalecolumn,offset1216,occscaleremnant : st_sfixed_max;
		variable pixosref1216,pixos1216,kta1216,ktarcee,ktascale1,ktascale2,kv1216,kvscale,kta1216ee,kv1216ee : st_sfixed_max;
		variable resee,resreg : st_ufixed_max;
		variable kvdd_ft,vdd25_ft,const256_ft,const2pow5_ft,const2pow13_ft,resee_ft,resreg_ft,rescorr_ft,Ta_ft,kta1216ee_ft : fd2ft;
		variable kvptat_ft,ktptat_ft,const2pow12_ft,const2pow3_ft,deltaV_ft,Vdd_ft,const3dot3_ft,vptat_ft,vbe_ft,vptat25_ft : fd2ft;
		variable alphaptatee_ft,const2pow2_ft,const8_ft,alphaptat_ft,const2pow18_ft,vptatart_ft,const25_ft,const1_ft,Kgain_ft,gain_ft : fd2ft;
		variable pixgain1216_ft,offsetaverage_ft,occrow12_ft,occscalerow_ft,occcolumn16_ft,occscalecolumn_ft,offset1216_ft : fd2ft;
		variable occscaleremnant_ft,pixosref1216_ft,pixos1216_ft,kta1216_ft,ktarcee_ft,ktascale1_ft,ktascale2_ft,kv1216_ft,kvscale_ft : fd2ft;
		variable kv1216ee_ft : fd2ft;
		variable fttmp1_ft,fttmp2_ft : fd2ft;
		constant const256 : st_sfixed_max := to_sfixed (256.0, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow5 : st_sfixed_max := to_sfixed (2.0**5, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow13 : st_sfixed_max := to_sfixed (2.0**13, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow12 : st_sfixed_max := to_sfixed (2.0**12, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow3 : st_sfixed_max := to_sfixed (2.0**3, st_sfixed_max'high, st_sfixed_max'low);
		constant const3dot3 : st_sfixed_max := to_sfixed (3.3, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow2 : st_sfixed_max := to_sfixed (2.0**2, st_sfixed_max'high, st_sfixed_max'low);
		constant const8 : st_sfixed_max := to_sfixed (8.0, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow18 : st_sfixed_max := to_sfixed (2.0**18, st_sfixed_max'high, st_sfixed_max'low);
		constant const25 : st_sfixed_max := to_sfixed (25.0, st_sfixed_max'high, st_sfixed_max'low);
		constant const1 : st_sfixed_max := to_sfixed (1.0, st_sfixed_max'high, st_sfixed_max'low);


		variable vddv0 : st_sfixed_max;
		variable h1,h2 : st_sfixed_max;
		variable tmp_uf8 : ufixed8;
		variable tmp_sf8 : sfixed8;
		variable tmp_uf6 : ufixed6;
		variable tmp_sf6 : sfixed6;
		variable tmp_uf9 : ufixed9;
		variable tmp_sf9 : sfixed9;
		variable tmp_uf15 : ufixed15;
		variable tmp_sf15 : sfixed15;
		constant C_WAIT1 : integer := G_C_WAIT1;
		variable v_wait1 : integer range 0 to C_WAIT1-1;
		variable Ta0 : st_sfixed_max;
		variable offset12_16 : st_sfixed_max; -- xxx for all pixels
	
		variable kv12_16 : st_sfixed_max;
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
		variable kta12_16 : st_sfixed_max;
		variable kta12_16_ee : st_sfixed_max;
		variable kta_rc_ee : st_sfixed_max;
		variable kta_scale_1 : st_sfixed_max;
		variable kta_scale_2 : st_sfixed_max;
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
		variable fracas : fracas;
		variable fracbs : fracbs;
		variable fracau : fracau;
		variable fracbu : fracbu;
		variable vout2 : st_sfixed_max;
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
				divfpsclr <= '1';
				fixed2floata <= (others => '0');
				fixed2floatce <= '0';
				fixed2floatond <= '0';
				float2fixeda <= (others => '0');
				float2fixedce <= '0';
				float2fixedond <= '0';
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
				mem_float2powerN_reset1 <= '1';
				mem_float2powerN_N1 <= (others => '0');
				mem_float2powerN_reset2 <= '1';
				mem_float2powerN_N2 <= (others => '0');
				rdyrecover <= '0';
			else
		o_out2 <= vout2;

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
			divfpsclr <= '0';
			mem_float2powerN_reset1 <= '0';
			mem_float2powerN_reset2 <= '0';
	when s1 => state := s2;
		--
		-- kvdd
		eeprom16slv := i_ee0x2433 and x"ff00";
		kvdd := resize (to_sfixed (eeprom16slv, eeprom16sf), kvdd);
		vout2 := resize (kvdd, st_sfixed_max'high, st_sfixed_max'low);
		kvdd := kvdd srl 8;
		kvdd := resize (to_sfixed (to_slv (kvdd (7 downto 0)), sfixed8'high, sfixed8'low), kvdd);
		vout2 := resize (kvdd, st_sfixed_max'high, st_sfixed_max'low);
		kvdd := kvdd sll 5;
		vout2 := resize (kvdd, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (kvdd (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (kvdd (fracbs'high downto fracbs'low)), fracbs));
	when s2 =>
		if (fixed2floatrdy = '1') then state := s3;
			kvdd_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s2; end if;
	when s3 => state := s4;
		fixed2floatsclr <= '0';
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const256 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const256 (fracbs'high downto fracbs'low)), fracbs));
	when s4 =>
		if (fixed2floatrdy = '1') then state := s5;
			const256_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s4; end if;
	when s5 => state := s6;
		fixed2floatsclr <= '0';
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const2pow5 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const2pow5 (fracbs'high downto fracbs'low)), fracbs));
	when s6 =>
		if (fixed2floatrdy = '1') then state := s7;
			const2pow5_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s6; end if;
	when s7 => state := s8;
		fixed2floatsclr <= '0';
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const2pow13 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const2pow13 (fracbs'high downto fracbs'low)), fracbs));
	when s8 =>
		if (fixed2floatrdy = '1') then state := s9;
			const2pow13_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s8; end if;
	when s9 => state := s10;
		fixed2floatsclr <= '0';
		--
		-- vdd25
		eeprom16slv := i_ee0x2433 and x"00ff";
		vdd25 := resize (to_sfixed (eeprom16slv, eeprom16sf), vdd25);
		vout2 := resize (vdd25, st_sfixed_max'high, st_sfixed_max'low);
		vdd25 := resize (to_sfixed (to_slv (vdd25 (7 downto 0)), sfixed8'high, sfixed8'low), vdd25);
		vout2 := resize (vdd25, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (vdd25 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (vdd25 (fracbs'high downto fracbs'low)), fracbs));
	when s10 =>
		if (fixed2floatrdy = '1') then state := s11;
			vdd25_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s10; end if;
	when s11 => state := s12;
		fixed2floatsclr <= '0';
		subfpce <= '1';
		subfpa <= vdd25_ft;
		subfpb <= const256_ft;
		subfpond <= '1';
	when s12 =>
		if (subfprdy = '1') then state := s13;
			vdd25_ft := subfpr;
			o_out1 <= vdd25_ft;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s12; end if;
	when s13 => state := s14;
		subfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= vdd25_ft;
		mulfpb <= const2pow5_ft;
		mulfpond <= '1';
	when s14 =>
		if (mulfprdy = '1') then state := s15;
			vdd25_ft := mulfpr;
			o_out1 <= vdd25_ft;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s14; end if;
	when s15 => state := s16;
		mulfpsclr <= '0';
		subfpce <= '1';
		subfpa <= vdd25_ft;
		subfpb <= const2pow13_ft;
		subfpond <= '1';
	when s16 =>
		if (subfprdy = '1') then state := s17;
			vdd25_ft := subfpr;
			o_out1 <= vdd25_ft;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s16; end if;
	when s17 => state := s18;
		subfpsclr <= '0';
		--
		-- resee
		eeprom16slv := i_ee0x2438 and x"3000";
		resee := resize (to_ufixed (eeprom16slv, eeprom16uf), resee);
--		vout2 := resize (resee, st_ufixed_max'high, st_ufixed_max'low);
		resee := resee srl 12;
		resee := resize (to_ufixed (to_slv (resee (1 downto 0)), ufixed2'high, ufixed2'low), resee);
		resee := to_ufixed (1.0, resee) sll to_integer (resee);
--		vout2 := resize (resee, st_ufixed_max'high, st_ufixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_ufixed (to_slv (resee (fracau'high downto fracau'low)), fracau)) & 
		to_slv (to_ufixed (to_slv (resee (fracbu'high downto fracbu'low)), fracbu));
	when s18 =>
		if (fixed2floatrdy = '1') then state := s19;
			resee_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s18; end if;
	when s19 => state := s20;
		fixed2floatsclr <= '0';
		--
		-- resreg
		eeprom16slv := i_ram0x800d and x"0c00";
		resreg := resize (to_ufixed (eeprom16slv, eeprom16uf), resreg);
--		vout2 := resize (resreg, st_ufixed_max'high, st_ufixed_max'low);
		resreg := resreg srl 10;
		resreg := resize (to_ufixed (to_slv (resreg (1 downto 0)), ufixed2'high, ufixed2'low), resreg);
		resreg := to_ufixed (1.0, resreg) sll to_integer (resreg);
--		vout2 := resize (resreg, st_ufixed_max'high, st_ufixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_ufixed (to_slv (resreg (fracau'high downto fracau'low)), fracau)) & 
		to_slv (to_ufixed (to_slv (resreg (fracbu'high downto fracbu'low)), fracbu));
	when s20 =>
		if (fixed2floatrdy = '1') then state := s21;
			resreg_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s20; end if;
	when s21 => state := s22;
		fixed2floatsclr <= '0';
		--
		-- rescorr
		divfpce <= '1';
		divfpa <= resee_ft;
		divfpb <= resreg_ft;
		divfpond <= '1';
	when s22 =>
		if (divfprdy = '1') then state := s23;
			rescorr_ft := divfpr;
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s22; end if;
	when s23 => state := s24;
		divfpsclr <= '0';
		-- 
		-- kvptat
		eeprom16slv := i_ee0x2432 and x"fc00";
		kvptat := resize (to_sfixed (eeprom16slv, eeprom16sf), kvptat);
		vout2 := resize (kvptat, st_sfixed_max'high, st_sfixed_max'low);
		kvptat := kvptat srl 10;
		kvptat := resize (to_sfixed (to_slv (kvptat (5 downto 0)), sfixed6'high, sfixed6'low), kvptat);
		vout2 := resize (kvptat, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (kvptat (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (kvptat (fracbs'high downto fracbs'low)), fracbs));
	when s24 =>
		if (fixed2floatrdy = '1') then state := s25;
			kvptat_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s24; end if;
	when s25 => state := s26;
		fixed2floatsclr <= '0';
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const2pow12 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const2pow12 (fracbs'high downto fracbs'low)), fracbs));
	when s26 =>
		if (fixed2floatrdy = '1') then state := s27;
			const2pow12_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s26; end if;
	when s27 => state := s28;
		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= kvptat_ft;
		divfpb <= const2pow12_ft;
		divfpond <= '1';
	when s28 =>
		if (divfprdy = '1') then state := s29;
			kvptat_ft := divfpr;
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s28; end if;
	when s29 => state := s30;
		divfpsclr <= '0';
		eeprom16slv := i_ee0x2432 and x"03ff";
		ktptat := resize (to_sfixed (eeprom16slv, eeprom16sf), ktptat);
		vout2 := resize (kvptat, st_sfixed_max'high, st_sfixed_max'low);
		ktptat := resize (to_sfixed (to_slv (ktptat (9 downto 0)), sfixed10'high, sfixed10'low), ktptat);
		vout2 := resize (ktptat, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (ktptat (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ktptat (fracbs'high downto fracbs'low)), fracbs));
	when s30 =>
		if (fixed2floatrdy = '1') then state := s31;
			ktptat_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s30; end if;
	when s31 => state := s32;
		fixed2floatsclr <= '0';
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const2pow3 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const2pow3 (fracbs'high downto fracbs'low)), fracbs));
	when s32 =>
		if (fixed2floatrdy = '1') then state := s33;
			const2pow3_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s32; end if;
	when s33 => state := s34;
		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= ktptat_ft;
		divfpb <= const2pow3_ft;
		divfpond <= '1';
	when s34 =>
		if (divfprdy = '1') then state := s35;
			ktptat_ft := divfpr;
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s34; end if;
	when s35 => state := s36;
		divfpsclr <= '0';
		--
		-- deltaV
		eeprom16slv := i_ram0x072a and x"ffff";
		deltaV := resize (to_sfixed (eeprom16slv, eeprom16sf), deltaV);
		vout2 := resize (deltaV, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (deltaV (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (deltaV (fracbs'high downto fracbs'low)), fracbs));
	when s36 =>
		if (fixed2floatrdy = '1') then state := s37;
			deltaV_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s36; end if;
	when s37 => state := s38;
		fixed2floatsclr <= '0';
		subfpce <= '1';
		subfpa <= deltaV_ft;
		subfpb <= vdd25_ft;
		subfpond <= '1';
	when s38 =>
		if (subfprdy = '1') then state := s39;
			deltaV_ft := subfpr;
			o_out1 <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s38; end if;
	when s39 => state := s40;
		subfpsclr <= '0';
		divfpce <= '1';
		divfpa <= deltaV_ft;
		divfpb <= kvdd_ft;
		divfpond <= '1';
	when s40 =>
		if (divfprdy = '1') then state := s41;
			deltaV_ft := divfpr;
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s40; end if;
	when s41 => state := s42;
		divfpsclr <= '0';
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const3dot3 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const3dot3 (fracbs'high downto fracbs'low)), fracbs));
	when s42 =>
		if (fixed2floatrdy = '1') then state := s43;
			const3dot3_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s42; end if;
	when s43 => state := s44;
		fixed2floatsclr <= '0';
		addfpce <= '1';
		addfpa <= deltaV_ft;
		addfpb <= const3dot3_ft;
		addfpond <= '1';
	when s44 =>
		if (addfprdy = '1') then state := s45;
			Vdd_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s44; end if;
	when s45 => state := s46;
		addfpsclr <= '0';
		--
		-- vptat25
		eeprom16slv := i_ee0x2431 and x"ffff";
		vptat25 := resize (to_sfixed (eeprom16slv, eeprom16sf), vptat25);
--		vptat25 := resize (to_sfixed (to_slv (vptat25), sfixed16'high, sfixed16'low), vptat25);
		vout2 := resize (ktptat, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (vptat25 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (vptat25 (fracbs'high downto fracbs'low)), fracbs));
	when s46 =>
		if (fixed2floatrdy = '1') then state := s47;
			vptat25_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s46; end if;
	when s47 => state := s48;
		fixed2floatsclr <= '0';
--		--
--		-- vptat
		eeprom16slv := i_ram0x0720 and x"ffff";
		vptat := resize (to_sfixed (eeprom16slv, eeprom16sf), vptat);
--		vptat := resize (to_sfixed (to_slv (vptat), sfixed16'high, sfixed16'low), vptat);
		vout2 := resize (vptat, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (vptat (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (vptat (fracbs'high downto fracbs'low)), fracbs));
	when s48 =>
		if (fixed2floatrdy = '1') then state := s49;
			vptat_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s48; end if;
	when s49 => state := s50;
		fixed2floatsclr <= '0';
		--
		-- vbe
		eeprom16slv := i_ram0x0700 and x"ffff";
		vbe := resize (to_sfixed (eeprom16slv, eeprom16sf), vbe);
--		vbe := resize (to_sfixed (to_slv (vbe), sfixed16'high, sfixed16'low), vbe);
		vout2 := resize (vbe, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (vbe (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (vbe (fracbs'high downto fracbs'low)), fracbs));
	when s50 =>
		if (fixed2floatrdy = '1') then state := s51;
			vbe_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s50; end if;
	when s51 => state := s52;
		fixed2floatsclr <= '0';
		--
		-- alphaptatee
		eeprom16slv := i_ee0x2410 and x"f000";
		alphaptatee := resize (to_sfixed (eeprom16slv, eeprom16sf), alphaptatee);
		vout2 := resize (alphaptatee, st_sfixed_max'high, st_sfixed_max'low);
		alphaptatee := alphaptatee srl 12;
		alphaptatee := resize (to_sfixed (to_slv (alphaptatee (3 downto 0)), sfixed4'high, sfixed4'low), alphaptatee);
		vout2 := resize (alphaptatee, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (alphaptatee (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (alphaptatee (fracbs'high downto fracbs'low)), fracbs));
	when s52 =>
		if (fixed2floatrdy = '1') then state := s53;
			alphaptatee_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s52; end if;
	when s53 => state := s54;
		fixed2floatsclr <= '0';
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const2pow2 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const2pow2 (fracbs'high downto fracbs'low)), fracbs));
	when s54 =>
		if (fixed2floatrdy = '1') then state := s55;
			const2pow2_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s54; end if;
	when s55 => state := s56;
		fixed2floatsclr <= '0';
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const8 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const8 (fracbs'high downto fracbs'low)), fracbs));
	when s56 =>
		if (fixed2floatrdy = '1') then state := s57;
			const8_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s56; end if;
	when s57 => state := s58;
		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= alphaptatee_ft;
		divfpb <= const2pow2_ft;
		divfpond <= '1';
	when s58 =>
		if (divfprdy = '1') then state := s59;
			alphaptat_ft := divfpr;
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s58; end if;
	when s59 => state := s60;
		divfpsclr <= '0';
		addfpce <= '1';
		addfpa <= alphaptat_ft;
		addfpb <= const8_ft;
		addfpond <= '1';
	when s60 =>
		if (addfprdy = '1') then state := s61;
			alphaptat_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s60; end if;
	when s61 => state := s62;
		addfpsclr <= '0';
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const2pow18 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const2pow18 (fracbs'high downto fracbs'low)), fracbs));
	when s62 =>
		if (fixed2floatrdy = '1') then state := s63;
			const2pow18_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s62; end if;
	when s63 => state := s64;
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= vptat_ft;
		mulfpb <= alphaptat_ft;
		mulfpond <= '1';
	when s64 =>
		if (mulfprdy = '1') then state := s65;
			vptatart_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s64; end if;
	when s65 => state := s66;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= vptatart_ft;
		addfpb <= vbe_ft;
		addfpond <= '1';
	when s66 =>
		if (addfprdy = '1') then state := s67;
			vptatart_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s66; end if;
	when s67 => state := s68;
		addfpsclr <= '0';
		divfpce <= '1';
		divfpa <= vptat_ft;
		divfpb <= vptatart_ft;
		divfpond <= '1';
	when s68 =>
		if (divfprdy = '1') then state := s69;
			vptatart_ft := divfpr;
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s68; end if;
	when s69 => state := s70;
		divfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= vptatart_ft;
		mulfpb <= const2pow18_ft;
		mulfpond <= '1';
	when s70 =>
		if (mulfprdy = '1') then state := s71;
			vptatart_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s70; end if;
	when s71 => state := s72;
		mulfpsclr <= '0';
		--
		-- Ta
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const1 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const1 (fracbs'high downto fracbs'low)), fracbs));
	when s72 =>
		if (fixed2floatrdy = '1') then state := s73;
			const1_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s72; end if;
	when s73 => state := s74;
		fixed2floatsclr <= '0';
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (const25 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (const25 (fracbs'high downto fracbs'low)), fracbs));
	when s74 =>
		if (fixed2floatrdy = '1') then state := s75;
			const25_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s74; end if;
	when s75 => state := s76;
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= kvptat_ft;
		mulfpb <= deltaV_ft;
		mulfpond <= '1';
	when s76 =>
		if (mulfprdy = '1') then state := s77;
			Ta_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s76; end if;
	when s77 => state := s78;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= const1_ft;
		addfpb <= Ta_ft;
		addfpond <= '1';
	when s78 =>
		if (addfprdy = '1') then state := s79;
			Ta_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s78; end if;
	when s79 => state := s80;
		addfpsclr <= '0';
		divfpce <= '1';
		divfpa <= vptatart_ft;
		divfpb <= Ta_ft;
		divfpond <= '1';
	when s80 =>
		if (divfprdy = '1') then state := s81;
			Ta_ft := divfpr;
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s80; end if;
	when s81 => state := s82;
		divfpsclr <= '0';
		subfpce <= '1';
		subfpa <= Ta_ft;
		subfpb <= vptat25_ft;
		subfpond <= '1';
	when s82 =>
		if (subfprdy = '1') then state := s83;
			Ta_ft := subfpr;
			o_out1 <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s82; end if;
	when s83 => state := s84;
		subfpsclr <= '0';
		divfpce <= '1';
		divfpa <= Ta_ft;
		divfpb <= ktptat_ft;
		divfpond <= '1';
	when s84 =>
		if (divfprdy = '1') then state := s85;
			Ta_ft := divfpr;
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s84; end if;
	when s85 => state := s86;
		divfpsclr <= '0';
		addfpce <= '1';
		addfpa <= Ta_ft;
		addfpb <= const25_ft;
		addfpond <= '1';
	when s86 =>
		if (addfprdy = '1') then state := s87;
			Ta_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s86; end if;
	when s87 => state := s88;
		addfpsclr <= '0';
		--
		-- Kgain
		eeprom16slv := i_ram0x070a and x"ffff";
		gain := resize (to_sfixed (eeprom16slv, eeprom16sf), gain);
		vout2 := resize (gain, st_sfixed_max'high, st_sfixed_max'low);
--		gain := resize (to_sfixed (to_slv (gain), sfixed16'high, sfixed16'low), gain);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (gain (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (gain (fracbs'high downto fracbs'low)), fracbs));
	when s88 =>
		if (fixed2floatrdy = '1') then state := s89;
			gain_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s88; end if;
	when s89 => state := s90;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2430 and x"ffff";
		Kgain := resize (to_sfixed (eeprom16slv, eeprom16sf), Kgain);
		vout2 := resize (Kgain, st_sfixed_max'high, st_sfixed_max'low);
--		Kgain := resize (to_sfixed (to_slv (Kgain), sfixed16'high, sfixed16'low), Kgain);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (Kgain (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (Kgain (fracbs'high downto fracbs'low)), fracbs));
	when s90 =>
		if (fixed2floatrdy = '1') then state := s91;
			Kgain_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s90; end if;
	when s91 => state := s92;
		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= Kgain_ft;
		divfpb <= gain_ft;
		divfpond <= '1';
	when s92 =>
		if (divfprdy = '1') then state := s93;
			Kgain_ft := divfpr;
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s92; end if;
	when s93 => state := s94;
		divfpsclr <= '0';
		eeprom16slv := i_ram0x056f and x"ffff";
		pixgain1216 := resize (to_sfixed (eeprom16slv, eeprom16sf), pixgain1216);
		vout2 := resize (pixgain1216, st_sfixed_max'high, st_sfixed_max'low);
--		pixgain1216 := resize (to_sfixed (to_slv (pixgain1216), sfixed16'high, sfixed16'low), pixgain1216);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (pixgain1216 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (pixgain1216 (fracbs'high downto fracbs'low)), fracbs));
	when s94 =>
		if (fixed2floatrdy = '1') then state := s95;
			pixgain1216_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s94; end if;
	when s95 => state := s96;
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= pixgain1216_ft;
		mulfpb <= Kgain_ft;
		mulfpond <= '1';
	when s96 =>
		if (mulfprdy = '1') then state := s97;
			pixgain1216_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s96; end if;
	when s97 => state := s98;
		mulfpsclr <= '0';
		eeprom16slv := i_ee0x2411 and x"ffff";
		offsetaverage := resize (to_sfixed (eeprom16slv, eeprom16sf), offsetaverage);
		vout2 := resize (offsetaverage, st_sfixed_max'high, st_sfixed_max'low);
--		offsetaverage := resize (to_sfixed (to_slv (offsetaverage), sfixed16'high, sfixed16'low), offsetaverage);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (offsetaverage (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (offsetaverage (fracbs'high downto fracbs'low)), fracbs));
	when s98 =>
		if (fixed2floatrdy = '1') then state := s99;
			offsetaverage_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s98; end if;
	when s99 => state := s100;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2414 and x"f000";
		occrow12 := resize (to_sfixed (eeprom16slv, eeprom16sf), occrow12);
		vout2 := resize (occrow12, st_sfixed_max'high, st_sfixed_max'low);
		occrow12 := occrow12 srl 12;
		occrow12 := resize (to_sfixed (to_slv (occrow12 (3 downto 0)), sfixed4'high, sfixed4'low), occrow12);
		vout2 := resize (occrow12, st_sfixed_max'high, st_sfixed_max'low);
--		occrow12 := resize (to_sfixed (to_slv (occrow12), sfixed16'high, sfixed16'low), occrow12);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (occrow12 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (occrow12 (fracbs'high downto fracbs'low)), fracbs));
	when s100 =>
		if (fixed2floatrdy = '1') then state := s101;
			occrow12_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s100; end if;
	when s101 => state := s102;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2410 and x"0f00";
		occscalerow := resize (to_sfixed (eeprom16slv, eeprom16sf), occscalerow);
		vout2 := resize (occscalerow, st_sfixed_max'high, st_sfixed_max'low);
		occscalerow := occscalerow srl 8;
		occscalerow := resize (to_sfixed (to_slv (occscalerow (3 downto 0)), sfixed4'high, sfixed4'low), occscalerow);
		vout2 := resize (occscalerow, st_sfixed_max'high, st_sfixed_max'low);
		occscalerow := to_sfixed (1.0, occscalerow) sll to_integer (occscalerow);
--		occscalerow := resize (to_sfixed (to_slv (occscalerow), sfixed16'high, sfixed16'low), occscalerow);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (occscalerow (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (occscalerow (fracbs'high downto fracbs'low)), fracbs));
	when s102 =>
		if (fixed2floatrdy = '1') then state := s103;
			occscalerow_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s102; end if;
	when s103 => state := s104;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x241b and x"f000";
		occcolumn16 := resize (to_sfixed (eeprom16slv, eeprom16sf), occcolumn16);
		vout2 := resize (occcolumn16, st_sfixed_max'high, st_sfixed_max'low);
		occcolumn16 := occcolumn16 srl 12;
		occcolumn16 := resize (to_sfixed (to_slv (occcolumn16 (3 downto 0)), sfixed4'high, sfixed4'low), occcolumn16);
		vout2 := resize (occcolumn16, st_sfixed_max'high, st_sfixed_max'low);
--		occcolumn16 := resize (to_sfixed (to_slv (occcolumn16), sfixed16'high, sfixed16'low), occcolumn16);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (occcolumn16 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (occcolumn16 (fracbs'high downto fracbs'low)), fracbs));
	when s104 =>
		if (fixed2floatrdy = '1') then state := s105;
			occcolumn16_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s104; end if;
	when s105 => state := s106;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2410 and x"00f0";
		occscalecolumn := resize (to_sfixed (eeprom16slv, eeprom16sf), occscalecolumn);
		vout2 := resize (occscalecolumn, st_sfixed_max'high, st_sfixed_max'low);
		occscalecolumn := occscalecolumn srl 4;
		occscalecolumn := resize (to_sfixed (to_slv (occscalecolumn (3 downto 0)), sfixed4'high, sfixed4'low), occscalecolumn);
		vout2 := resize (occscalecolumn, st_sfixed_max'high, st_sfixed_max'low);
		occscalecolumn := to_sfixed (1.0, occscalecolumn) sll to_integer (occscalecolumn);
--		occscalecolumn := resize (to_sfixed (to_slv (occscalecolumn), sfixed16'high, sfixed16'low), occscalecolumn);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (occscalecolumn (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (occscalecolumn (fracbs'high downto fracbs'low)), fracbs));
	when s106 =>
		if (fixed2floatrdy = '1') then state := s107;
			occscalecolumn_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s106; end if;
	when s107 => state := s108;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x25af and x"fc00";
		offset1216 := resize (to_sfixed (eeprom16slv, eeprom16sf), offset1216);
		vout2 := resize (offset1216, st_sfixed_max'high, st_sfixed_max'low);
		offset1216 := offset1216 srl 10;
		offset1216 := resize (to_sfixed (to_slv (offset1216 (5 downto 0)), sfixed6'high, sfixed6'low), offset1216);
		vout2 := resize (offset1216, st_sfixed_max'high, st_sfixed_max'low);
--		offset1216 := resize (to_sfixed (to_slv (offset1216), sfixed16'high, sfixed16'low), offset1216);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (offset1216 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (offset1216 (fracbs'high downto fracbs'low)), fracbs));
	when s108 =>
		if (fixed2floatrdy = '1') then state := s109;
			offset1216_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s108; end if;
	when s109 => state := s110;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2410 and x"000f";
		occscaleremnant := resize (to_sfixed (eeprom16slv, eeprom16sf), occscaleremnant);
		vout2 := resize (occscaleremnant, st_sfixed_max'high, st_sfixed_max'low);
		occscaleremnant := resize (to_sfixed (to_slv (occscaleremnant (3 downto 0)), sfixed4'high, sfixed4'low), occscaleremnant);
		vout2 := resize (occscaleremnant, st_sfixed_max'high, st_sfixed_max'low);
		occscaleremnant := to_sfixed (1.0, occscaleremnant) sll to_integer (occscaleremnant);
--		occscaleremnant := resize (to_sfixed (to_slv (occscaleremnant), sfixed16'high, sfixed16'low), occscaleremnant);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (occscaleremnant (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (occscaleremnant (fracbs'high downto fracbs'low)), fracbs));
	when s110 =>
		if (fixed2floatrdy = '1') then state := s111;
			occscaleremnant_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s110; end if;
	when s111 => state := s112;
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= offset1216_ft;
		mulfpb <= occscaleremnant_ft;
		mulfpond <= '1';
	when s112 =>
		if (mulfprdy = '1') then state := s113;
			offset1216_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s112; end if;
	when s113 => state := s114;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= occcolumn16_ft;
		mulfpb <= occscalecolumn_ft;
		mulfpond <= '1';
	when s114 =>
		if (mulfprdy = '1') then state := s115;
			occcolumn16_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s114; end if;
	when s115 => state := s116;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= occrow12_ft;
		mulfpb <= occscalerow_ft;
		mulfpond <= '1';
	when s116 =>
		if (mulfprdy = '1') then state := s117;
			occrow12_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s116; end if;
	when s117 => state := s118;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= offset1216_ft;
		addfpb <= occcolumn16_ft;
		addfpond <= '1';
	when s118 =>
		if (addfprdy = '1') then state := s119;
			pixosref1216_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s118; end if;
	when s119 => state := s120;
		addfpsclr <= '0';
		addfpce <= '1';
		addfpa <= pixosref1216_ft;
		addfpb <= occrow12_ft;
		addfpond <= '1';
	when s120 =>
		if (addfprdy = '1') then state := s121;
			pixosref1216_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s120; end if;
	when s121 => state := s122;
		addfpsclr <= '0';
		addfpce <= '1';
		addfpa <= pixosref1216_ft;
		addfpb <= offsetaverage_ft;
		addfpond <= '1';
	when s122 =>
		if (addfprdy = '1') then state := s123;
			pixosref1216_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s122; end if;
	when s123 => state := s124;
		addfpsclr <= '0';
		eeprom16slv := i_ee0x25af and x"000e";
		kta1216ee := resize (to_sfixed (eeprom16slv, eeprom16sf), kta1216ee);
		vout2 := resize (kta1216ee, st_sfixed_max'high, st_sfixed_max'low);
		kta1216ee := kta1216ee srl 1;
		kta1216ee := resize (to_sfixed (to_slv (kta1216ee (2 downto 0)), sfixed3'high, sfixed3'low), kta1216ee);
		vout2 := resize (kta1216ee, st_sfixed_max'high, st_sfixed_max'low);
--		kta1216ee := resize (to_sfixed (to_slv (kta1216ee), sfixed16'high, sfixed16'low), kta1216ee);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (kta1216ee (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (kta1216ee (fracbs'high downto fracbs'low)), fracbs));
	when s124 =>
		if (fixed2floatrdy = '1') then state := s125;
			kta1216ee_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s124; end if;
	when s125 => state := s126;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2437 and x"00ff";
		ktarcee := resize (to_sfixed (eeprom16slv, eeprom16sf), ktarcee);
		vout2 := resize (ktarcee, st_sfixed_max'high, st_sfixed_max'low);
		ktarcee := resize (to_sfixed (to_slv (ktarcee (7 downto 0)), sfixed8'high, sfixed8'low), ktarcee);
		vout2 := resize (ktarcee, st_sfixed_max'high, st_sfixed_max'low);
--		ktarcee := resize (to_sfixed (to_slv (ktarcee), sfixed16'high, sfixed16'low), ktarcee);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (ktarcee (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ktarcee (fracbs'high downto fracbs'low)), fracbs));
	when s126 =>
		if (fixed2floatrdy = '1') then state := s127;
			ktarcee_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s126; end if;
	when s127 => state := s128;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2438 and x"00f0";
		ktascale1 := resize (to_sfixed (eeprom16slv, eeprom16sf), ktascale1);
		vout2 := resize (ktascale1, st_sfixed_max'high, st_sfixed_max'low);
		ktascale1 := ktascale1 srl 4;
		ktascale1 := resize (to_sfixed (to_slv (ktascale1 (3 downto 0)), sfixed4'high, sfixed4'low), ktascale1);
		vout2 := resize (ktascale1, st_sfixed_max'high, st_sfixed_max'low);
--		ktascale1 := resize (to_sfixed (to_slv (ktascale1), sfixed16'high, sfixed16'low), ktascale1);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (ktascale1 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ktascale1 (fracbs'high downto fracbs'low)), fracbs));
	when s128 =>
		if (fixed2floatrdy = '1') then state := s129;
			ktascale1_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s128; end if;
	when s129 => state := s130;
		fixed2floatsclr <= '0';
		addfpce <= '1';
		addfpa <= ktascale1_ft;
		addfpb <= const8_ft;
		addfpond <= '1';
	when s130 =>
		if (addfprdy = '1') then state := s131;
			ktascale1_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s130; end if;
	when s131 => state := s132;
		addfpsclr <= '0';
		eeprom16slv := i_ee0x2438 and x"000f";
		ktascale2 := resize (to_sfixed (eeprom16slv, eeprom16sf), ktascale2);
		vout2 := resize (ktascale2, st_sfixed_max'high, st_sfixed_max'low);
		ktascale2 := resize (to_sfixed (to_slv (ktascale2 (3 downto 0)), sfixed4'high, sfixed4'low), ktascale2);
		vout2 := resize (ktascale2, st_sfixed_max'high, st_sfixed_max'low);
--		ktascale2 := resize (to_sfixed (to_slv (ktascale2), sfixed16'high, sfixed16'low), ktascale2);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (ktascale2 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ktascale2 (fracbs'high downto fracbs'low)), fracbs));
	when s132 =>
		if (fixed2floatrdy = '1') then state := s133;
			ktascale2_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s132; end if;
	when s133 => state := s134;
		fixed2floatsclr <= '0';
		-- ktascale1 float2fixed
		float2fixedce <= '1';
		float2fixedond <= '1';
		float2fixeda <= ktascale1_ft;
	when s134 =>
		if (float2fixedrdy = '1') then state := s135;
			ktascale1 := to_sfixed (float2fixedr, st_sfixed_max'high, st_sfixed_max'low);
			vout2 := resize (ktascale1, st_sfixed_max'high, st_sfixed_max'low);
--			o_out1 <= float2fixedr;
			float2fixedce <= '0';
			float2fixedond <= '0';
			float2fixedsclr <= '1';
		else state := s134; end if;
	when s135 => state := s136;
		float2fixedsclr <= '0';
		-- ktascale2 float2fixed
		float2fixedce <= '1';
		float2fixedond <= '1';
		float2fixeda <= ktascale2_ft;
	when s136 =>
		if (float2fixedrdy = '1') then state := s137;
			ktascale2 := to_sfixed (float2fixedr, st_sfixed_max'high, st_sfixed_max'low);
			vout2 := resize (ktascale2, st_sfixed_max'high, st_sfixed_max'low);
--			o_out1 <= float2fixedr;
			float2fixedce <= '0';
			float2fixedond <= '0';
			float2fixedsclr <= '1';
		else state := s136; end if;
	when s137 => state := s138;
		float2fixedsclr <= '0';
		-- ktascale1 and 2 to 2^ktascale1 and 2, return 2 cycle later
		mem_float2powerN_N1 <= std_logic_vector (to_unsigned (to_integer (ktascale1), 6));
		mem_float2powerN_N2 <= std_logic_vector (to_unsigned (to_integer (ktascale2), 6));
	when s138 => state := s139;
		-- wait for data from mem_float2powerN
--		rdyrecover <= '1';
	when s139 => state := s140;
--		rdyrecover <= '0';
--		o_out1 <= mem_float2powerN_2powerN2;
		mulfpce <= '1';
		mulfpa <= kta1216ee_ft;
		mulfpb <= mem_float2powerN_2powerN2; -- 2^ktascale2
		mulfpond <= '1';
	when s140 =>
		if (mulfprdy = '1') then state := s141;
			kta1216_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s140; end if;
	when s141 => state := s142;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= kta1216_ft;
		addfpb <= ktarcee_ft;
		addfpond <= '1';
	when s142 =>
		if (addfprdy = '1') then state := s143;
			kta1216_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s142; end if;
	when s143 => state := s144;
		addfpsclr <= '0';
		divfpce <= '1';
		divfpa <= kta1216_ft;
		divfpb <= mem_float2powerN_2powerN1; -- 2^ktascale1;
		divfpond <= '1';
	when s144 =>
		if (divfprdy = '1') then state := s145;
			kta1216_ft := divfpr; -- 0.005126953125
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s144; end if;
	when s145 => state := s146;
		divfpsclr <= '0';
		eeprom16slv := i_ee0x2434 and x"000f";
		kv1216 := resize (to_sfixed (eeprom16slv, eeprom16sf), kv1216);
		vout2 := resize (kv1216, st_sfixed_max'high, st_sfixed_max'low);
		kv1216 := resize (to_sfixed (to_slv (kv1216 (3 downto 0)), sfixed4'high, sfixed4'low), kv1216);
		vout2 := resize (kv1216, st_sfixed_max'high, st_sfixed_max'low);
--		kv1216 := resize (to_sfixed (to_slv (kv1216), sfixed16'high, sfixed16'low), kv1216);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (kv1216 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (kv1216 (fracbs'high downto fracbs'low)), fracbs));
	when s146 =>
		if (fixed2floatrdy = '1') then state := s147;
			kv1216_ft := fixed2floatr;
			o_out1 <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s146; end if;
	when s147 => state := s148;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2438 and x"0f00";
		kvscale := resize (to_sfixed (eeprom16slv, eeprom16sf), kvscale);
		vout2 := resize (kvscale, st_sfixed_max'high, st_sfixed_max'low);
		kvscale := kvscale srl 8;
		vout2 := resize (kvscale, st_sfixed_max'high, st_sfixed_max'low);
		kvscale := resize (to_sfixed (to_slv (kvscale (3 downto 0)), sfixed4'high, sfixed4'low), kvscale);
		vout2 := resize (kvscale, st_sfixed_max'high, st_sfixed_max'low);
--		kvscale := resize (to_sfixed (to_slv (kvscale), sfixed16'high, sfixed16'low), kvscale);
		mem_float2powerN_N1 <= std_logic_vector (to_unsigned (to_integer (kvscale), 6));
	when s148 => state := s149;
		-- wait for data
		rdyrecover <= '1';
	when s149 => state := s150;
		rdyrecover <= '0';
		o_out1 <= mem_float2powerN_2powerN1;
		divfpce <= '1';
		divfpa <= kv1216_ft;
		divfpb <= mem_float2powerN_2powerN1; -- 2^kvscale
		divfpond <= '1';
	when s150 =>
		if (divfprdy = '1') then state := s151;
			kv1216_ft := divfpr; -- 0.5
			o_out1 <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s150; end if;
	when s151 => state := s152;
		divfpsclr <= '0';
		subfpce <= '1';
		subfpa <= vdd_ft;
		subfpb <= const3dot3_ft;
		subfpond <= '1';
	when s152 =>
		if (subfprdy = '1') then state := s153;
			fttmp1_ft := subfpr;
			o_out1 <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s152; end if;
	when s153 => state := s154;
		subfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1_ft;
		mulfpb <= kv1216_ft;
		mulfpond <= '1';
	when s154 =>
		if (mulfprdy = '1') then state := s155;
			fttmp1_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s154; end if;
	when s155 => state := s156;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= fttmp1_ft;
		addfpb <= const1_ft;
		addfpond <= '1';
	when s156 =>
		if (addfprdy = '1') then state := s157;
			fttmp1_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s156; end if;
	when s157 => state := s158;
		addfpsclr <= '0';
		subfpce <= '1';
		subfpa <= Ta_ft;
		subfpb <= const25_ft;
		subfpond <= '1';
	when s158 =>
		if (subfprdy = '1') then state := s159;
			fttmp2_ft := subfpr;
			o_out1 <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s158; end if;
	when s159 => state := s160;
		subfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp2_ft;
		mulfpb <= kta1216_ft;
		mulfpond <= '1';
	when s160 =>
		if (mulfprdy = '1') then state := s161;
			fttmp2_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s160; end if;
	when s161 => state := s162;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= fttmp2_ft;
		addfpb <= const1_ft;
		addfpond <= '1';
	when s162 =>
		if (addfprdy = '1') then state := s163;
			fttmp2_ft := addfpr;
			o_out1 <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s162; end if;
	when s163 => state := s164;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1_ft;
		mulfpb <= fttmp2_ft;
		mulfpond <= '1';
	when s164 =>
		if (mulfprdy = '1') then state := s165;
			pixos1216_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s164; end if;
	when s165 => state := s166;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= pixos1216_ft;
		mulfpb <= pixosref1216_ft;
		mulfpond <= '1';
	when s166 =>
		if (mulfprdy = '1') then state := s167;
			pixos1216_ft := mulfpr;
			o_out1 <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s166; end if;
	when s167 => state := s168;
		mulfpsclr <= '0';
		subfpce <= '1';
		subfpa <= pixgain1216_ft;
		subfpb <= pixos1216_ft;
		subfpond <= '1';
	when s168 =>
		if (subfprdy = '1') then state := s169;
			pixos1216_ft := subfpr;
			o_out1 <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s168; end if;
	when s169 => state := s170;
		subfpsclr <= '0';

-----

--		fptmp2 := to_sfixed (25.0, fptmp2);
--		--report_error_normalize ("fail 25.0", fptmp2, to_sfixed (25.0, max_expected_s)); -- 25.0
----		cmd <= "0001"; -- - Ta-Ta0 Ta-25
--		in1sub <= Ta;
--		in2sub <= fptmp2;
--		state := w41;
--when w41 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s42; else v_wait1 := v_wait1 + 1; state := w41; end if;
--when s42 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		tad := resize (fpout, tad);
--		--report_error_normalize ("fail tad", tad, to_sfixed (39.184-25.0, max_expected_s)); -- 39.184-25.0
--		state := w42;
--when w42 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s43; else v_wait1 := v_wait1 + 1; state := w42; end if;
--when s43 =>
--		fptmp2 := to_sfixed (3.3, fptmp2);
--		--report_error_normalize ("fail 3.3", fptmp2, to_sfixed (3.3, max_expected_s)); -- 3.3
----		cmd <= "0001"; -- - Vdd-VddV0 Vdd-3.3
--		in1sub <= Vdd;
--		in2sub <= fptmp2;
--		state := w43;
--when w43 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s44; else v_wait1 := v_wait1 + 1; state := w43; end if;
--when s44 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		v0d := resize (fpout, v0d);
--		--report_error_normalize ("fail v0d", v0d, to_sfixed (3.319-3.3, max_expected_s)); -- 3.319-3.3
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
--		--report_error_normalize ("fail kv12_16", kv12_16, to_sfixed (0.5*(3.319-3.3), max_expected_s)); -- 0.5*(3.319-3.3)
--		state := w46;
--when w46 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s47; else v_wait1 := v_wait1 + 1; state := w46; end if;
--when s47 =>
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		--report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0000"; -- + 1+Kv12_16*(Vdd-VddV0)
--		in1add <= fptmp1;
--		in2add <= kv12_16;
--		state := w47;
--when w47 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s48; else v_wait1 := v_wait1 + 1; state := w47; end if;
--when s48 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kv12_16 := resize (fpout, kv12_16);
--		--report_error_normalize ("fail kv12_16", kv12_16, to_sfixed (1.0+(0.5*(3.319-3.3)), max_expected_s)); -- 1.0+(0.5*(3.319-3.3))
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
--		--report_error_normalize ("fail kta12_16", kta12_16, to_sfixed (0.005126953125*(39.184-25.0), max_expected_s)); -- 0.005126953125*(39.184-25.0)
--		state := w50;
--when w50 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s51; else v_wait1 := v_wait1 + 1; state := w50; end if;
--when s51 =>
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		--report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0000"; -- + 1+KTa(12,16)*(Ta-Ta0)
--		in1add <= fptmp1;
--		in2add <= kta12_16;
--		state := w51;
--when w51 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s52; else v_wait1 := v_wait1 + 1; state := w51; end if;
--when s52 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kta12_16 := resize (fpout, kta12_16);
--		--report_error_normalize ("fail kta12_16", kta12_16, to_sfixed (1.0+(0.005126953125*(39.184-25.0)), max_expected_s)); -- 1.0+(0.005126953125*(39.184-25.0))
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
--		--report_error_normalize ("fail kta12_16", kta12_16, to_sfixed ((-75.0)*(1.0+(0.005126953125*(39.184-25.0))), max_expected_s)); -- (-75.0)*(1.0+(0.005126953125*(39.184-25.0)))
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
--		--report_error_normalize ("fail kta12_16", kta12_16, to_sfixed ((-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- (-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3))
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
--		--report_error_normalize ("fail pixos12_16", pixos12_16, to_sfixed (619.679100908656-(-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- 619.679100908656-(-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3))
--		--report_error_normalize ("fail pixos12_16 const", pixos12_16, to_sfixed (700.882495690877, max_expected_s)); -- 700.882495690877
--		state := w58;
--when w58 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s59; else v_wait1 := v_wait1 + 1; state := w58; end if;
--when s59 =>
--		fptmp2 := to_sfixed (1.0, fptmp2);
--		--report_error_normalize ("fail 1.0", fptmp2, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0011"; -- / VIR(12,16)Emissivity_COMPOENSATED=pixos12_16/E E=1
--		in1div <= pixos12_16;
--		in2div <= fptmp2;
--		state := w59;
--when w59 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s60; else v_wait1 := v_wait1 + 1; state := w59; end if;
--when s60 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		vir12_16_emissitivy_componsated := resize (fpout, vir12_16_emissitivy_componsated);
--		--report_error_normalize ("fail vir12_16_emissitivy_componsated", vir12_16_emissitivy_componsated, to_sfixed (700.882495690877, max_expected_s)); -- 700.882495690877
--		state := w60;
--when w60 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s61; else v_wait1 := v_wait1 + 1; state := w60; end if;
--when s61 =>
--		sftmp_slv_16 := x"ffca" and x"ffff"; -- ram[0x0708]
--		pixgain_cp_sp0 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), pixgain_cp_sp0);
--		--report_error_normalize ("fail pixgain_cp_sp0", pixgain_cp_sp0, to_sfixed (-54.0, max_expected_s)); -- -54
----		cmd <= "0010"; -- * pixgain_cp_sp0*Kgain
--		in1mul <= pixgain_cp_sp0;
--		in2mul <= kgain;
--		state := w61;
--when w61 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s62; else v_wait1 := v_wait1 + 1; state := w61; end if;
--when s62 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		pixgain_cp_sp0 := resize (fpout, pixgain_cp_sp0);
--		--report_error_normalize ("fail pixgain_cp_sp0", pixgain_cp_sp0, to_sfixed (-54.9469153515065, max_expected_s)); -- -54.9469153515065
--		state := w62;
--when w62 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s63; else v_wait1 := v_wait1 + 1; state := w62; end if;
--when s63 =>
--		sftmp_slv_16 := x"ffc8" and x"ffff"; -- ram[0x0728]
--		pixgain_cp_sp1 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), pixgain_cp_sp1);
--		--report_error_normalize ("fail pixgain_cp_sp1", pixgain_cp_sp1, to_sfixed (-56.0, max_expected_s)); -- -56
----		cmd <= "0010"; -- * pixgain_cp_sp1*Kgain
--		in1mul <= pixgain_cp_sp1;
--		in2mul <= kgain;
--		state := w63;
--when w63 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s64; else v_wait1 := v_wait1 + 1; state := w63; end if;
--when s64 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		pixgain_cp_sp1 := resize (fpout, pixgain_cp_sp1);
--		--report_error_normalize ("fail pixgain_cp_sp1", pixgain_cp_sp1, to_sfixed (-56.9819862904511, max_expected_s)); -- -56.9819862904511
--		state := w64;
--when w64 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s65; else v_wait1 := v_wait1 + 1; state := w64; end if;
--when s65 =>
--		sftmp_slv_16 := x"fbb5" and x"03ff"; -- ee[0x243a]
--		tmpslv10 := sftmp_slv_16 (9 downto 0);
--		tmpsf10 := to_sfixed (tmpslv10, tmpsf10);
--		off_cpsubpage_0 := resize (tmpsf10, off_cpsubpage_0);
--		--report_error_normalize ("fail off_cpsubpage_0", off_cpsubpage_0, to_sfixed (-75.0, max_expected_s)); -- -75
--		state := w65;
--when w65 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s66; else v_wait1 := v_wait1 + 1; state := w65; end if;
--when s66 =>
--		sftmp_slv_16 := x"fbb5" and x"fc00"; -- ee[0x243a]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 10));
--		tmpslv6 := sftmp_slv_16 (5 downto 0);
--		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
--		off_cpsubpage_1_delta := resize (tmpsf6, kvscale);
--		--report_error_normalize ("fail off_cpsubpage_1_delta", off_cpsubpage_1_delta, to_sfixed (-2.0, max_expected_s)); -- -2
----		cmd <= "0000"; -- + OFF_CPsubpage_0+OFF_CPsubpage_1_delta
--		in1add <= off_cpsubpage_0;
--		in2add <= off_cpsubpage_1_delta;
--		state := w66;
--when w66 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s67; else v_wait1 := v_wait1 + 1; state := w66; end if;
--when s67 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		off_cpsubpage_1 := resize (fpout, off_cpsubpage_1);
--		--report_error_normalize ("fail off_cpsubpage_1", off_cpsubpage_1, to_sfixed (-77.0, max_expected_s)); -- -77.0
--		state := w67;
--when w67 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s68; else v_wait1 := v_wait1 + 1; state := w67; end if;
--when s68 =>
--		sftmp_slv_16 := x"044b" and x"00ff"; -- ee[0x243b]
--		kta_cp_ee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kta_cp_ee);
--		--report_error_normalize ("fail kta_cp_ee", kta_cp_ee, to_sfixed (75.0, max_expected_s)); -- 75
----		cmd <= "0011"; -- / KTa_cp_ee/2^KTa_scale_1
--		in1div <= kta_cp_ee;
--		in2div <= kta_scale_1;
--		state := w68;
--when w68 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s69; else v_wait1 := v_wait1 + 1; state := w68; end if;
--when s69 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		kta_cp := resize (fpout, kta_cp);
--		--report_error_normalize ("fail kta_cp", kta_cp, to_sfixed (0.00457763671875, max_expected_s)); -- 0.00457763671875
--		state := w69;
--when w69 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s70; else v_wait1 := v_wait1 + 1; state := w69; end if;
--when s70 =>
--		sftmp_slv_16 := x"2363" and x"0f00"; -- ee[0x2438]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		kv_scale := resize (tmpsf4, kv_scale);
--		--report_error_normalize("fail kv_scale", kv_scale, to_sfixed (3.0, max_expected_s)); -- 3
--		kv_scale := to_sfixed (1.0, kv_scale) sll to_integer (kv_scale);
--		--report_error_normalize("fail 2^kv_scale", kv_scale, to_sfixed (8.0, max_expected_s)); -- 8
--		state := w70;
--when w70 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s71; else v_wait1 := v_wait1 + 1; state := w70; end if;
--when s71 =>
--		sftmp_slv_16 := x"044b" and x"ff00"; -- ee[0x243b]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		tmpslv8 := sftmp_slv_16 (7 downto 0);
--		tmpsf8 := to_sfixed (tmpslv8, tmpsf8);
--		kv_cp_ee := resize (tmpsf8, kv_cp_ee);
--		--report_error_normalize("fail kv_cp_ee", kv_cp_ee, to_sfixed (4.0, max_expected_s)); -- 4
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
--		--report_error_normalize ("fail kv_cp", kv_cp, to_sfixed (0.5, max_expected_s)); -- 0.5
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
--		--report_error_normalize ("fail ilchessc1ee", ilchessc1ee, to_sfixed (20.0, max_expected_s)); -- 20.0
--		ilchessc1ee := ilchessc1ee srl 4;
--		--report_error_normalize ("fail ilchessc1ee/2^4", ilchessc1ee, to_sfixed (1.25, max_expected_s)); -- 1.25
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
--		--report_error_normalize ("fail kta_cp*(Ta-Ta0)", kta_cp, to_sfixed (0.00457763671875*(39.184-25.0), max_expected_s)); -- 0.00457763671875*(39.184-25.0)
--		state := w76;
--when w76 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s77; else v_wait1 := v_wait1 + 1; state := w76; end if;
--when s77 =>
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		--report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0000"; -- + 1+KTa_cp*(Ta-Ta0)
--		in1add <= fptmp1;
--		in2add <= kta_cp;
--		state := w77;
--when w77 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s78; else v_wait1 := v_wait1 + 1; state := w77; end if;
--when s78 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kta_cp := resize (fpout, kta_cp);
--		--report_error_normalize("fail kta_cp", kta_cp, to_sfixed (1.0+(0.00457763671875*(39.184-25.0)), max_expected_s)); -- 1.0+(0.00457763671875*(39.184-25.0))
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
--		--report_error_normalize ("fail Kv_cp*(Vdd-Vdd0)", kv_cp, to_sfixed (0.5*(3.319-3.3), max_expected_s)); -- 0.5*(3.319-3.3)
--		state := w80;
--when w80 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s81; else v_wait1 := v_wait1 + 1; state := w80; end if;
--when s81 =>
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		--report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0000"; -- 1+Kv_cp*(Vdd-Vdd0)
--		in1add <= fptmp1;
--		in2add <= kv_cp;
--		state := w81;
--when w81 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s82; else v_wait1 := v_wait1 + 1; state := w81; end if;
--when s82 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kv_cp := resize (fpout, kv_cp);
--		--report_error_normalize ("fail 1+Kv_cp*(Vdd-Vdd0)", kv_cp, to_sfixed (1.0+(0.5*(3.319-3.3)), max_expected_s)); -- 1.0+(0.5*(3.319-3.3))
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
--		--report_error_normalize ("fail (1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", ktacp_kvcp_mul, to_sfixed ((1.0+(0.00457763671875*(39.184-25.0)))*(1.0+(0.5*(3.319-3.3))), max_expected_s)); -- (1.0+(0.00457763671875*(39.184-25.0)))*(1.0+(0.5*(3.319-3.3)))
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
--		--report_error_normalize ("fail OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp0, to_sfixed((-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- (-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
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
--		--report_error_normalize ("fail PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp0, to_sfixed ((-54.9469153515065)-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- (-54.9469153515065)-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
--		--report_error_normalize ("fail PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) const", pixos_cp_sp0, to_sfixed (25.6666575059956, max_expected_s)); -- 25.6666575059956
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
--		--report_error_normalize("fail OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp1, to_sfixed ((-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- (-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
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
--		--report_error_normalize ("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp1, to_sfixed ((-56.9819862904511)-(-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), max_expected_s)); -- (-56.9819862904511)-(-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
--		--report_error_normalize ("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) const", pixos_cp_sp1, to_sfixed (21.63158656770509, max_expected_s)); -- 21.63158656770509 -- xxx ??? ERROR on page 41 ??? xxx
--		--report_error_normalize ("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) const, error ? on page 41 => pixos_cp_sp1 = 21.63158656770509", pixos_cp_sp1, to_sfixed (25.79655775862116562500, max_expected_s)); -- 25.79655775862116562500 -- xxx from bc calculator
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
--		--report_error_normalize ("fail pixelnumber12_16 xor uf", tmpuf1, to_ufixed (0.0, max_expected_u));
--		tmpsf1 := to_sfixed (tmpuf1)(0 downto 0);
--		--report_error_normalize ("fail pixelnumber12_16 xor sf", tmpsf1, to_sfixed (0.0, max_expected_s));
--		ch_pattern_12_16_u := resize (tmpuf1, ch_pattern_12_16_u);
--		--report_error_normalize ("fail ch_pattern_12_16_u", ch_pattern_12_16_u, to_ufixed (0.0, max_expected_u)); -- 0
--		ch_pattern_12_16_s := resize (to_sfixed (ch_pattern_12_16_u), ch_pattern_12_16_s);
--		--report_error_normalize ("fail ch_pattern_12_16_s", ch_pattern_12_16_s, to_sfixed (0.0, max_expected_s)); -- 0
--		ch_pattern_12_16 := ch_pattern_12_16_s;
--		--report_error_normalize ("fail ch_pattern_12_16 after convert u->s", ch_pattern_12_16, to_sfixed (0.0, max_expected_s)); -- 0
--		sftmp_slv_16 := x"f020" and x"003f"; -- ee[0x243c]
--		tgcee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), tgcee);
--		--report_error_normalize ("fail tgcee", tgcee, to_sfixed (32.0, max_expected_s)); -- 32
--		tgcee := tgcee srl 5;
--		--report_error_normalize ("fail tgcee/2^5", tgcee, to_sfixed (1.0, max_expected_s)); -- 1
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
--		--report_error_normalize ("fail pixospatt1", pixospatt1, to_sfixed (to_real (ch_pattern_12_16)*to_real (pixos_cp_sp1), max_expected_s)); -- ch_pattern_12_16*pixos_cp_sp1
--		state := w95;
--when w95 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s96; else v_wait1 := v_wait1 + 1; state := w95; end if;
--when s96 =>
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		--report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s)); -- 1.0
----		cmd <= "0001"; -- - (1-CHIL_pattern)
--		in1sub <= fptmp1;
--		in2sub <= ch_pattern_12_16;
--		state := w96;
--when w96 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s97; else v_wait1 := v_wait1 + 1; state := w96; end if;
--when s97 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		ch_pattern_12_16_minusone := resize (fpout, ch_pattern_12_16_minusone);
--		--report_error_normalize ("fail ch_pattern_12_16_minusone", ch_pattern_12_16_minusone, to_sfixed (1.0-to_real (ch_pattern_12_16), max_expected_s)); -- 1.0-ch_pattern_12_16
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
--		--report_error_normalize ("fail pixospatt2", pixospatt2, to_sfixed (to_real (ch_pattern_12_16_minusone)*to_real (pixos_cp_sp0), max_expected_s)); -- ch_pattern_12_16_minusone*pixos_cp_sp0
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
--		--report_error_normalize ("fail ((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)", pixospatt12, to_sfixed (((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)))), max_expected_s)); -- :E
--		--report_error_normalize ("fail ((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) const", pixospatt12, to_sfixed(21.6315865670509, max_expected_s)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
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
--		--report_error_normalize ("fail TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)", pixospatt12, to_sfixed ((1.0*((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))), max_expected_s)); -- :E
--		--report_error_normalize ("fail TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) const", pixospatt12, to_sfixed (21.6315865670509, max_expected_s)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
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
--		--report_error_normalize ("fail VIR(12,16)EMISSIVITY_COMPENSATED-TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)", vir_12_16_compensated, to_sfixed ((700.882495690877-(1.0*((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)))))), max_expected_s)); -- :E
--		--report_error_normalize ("fail VIR(12,16)EMISSIVITY_COMPENSATED-TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) const", vir_12_16_compensated, to_sfixed (679.250909123826, max_expected_s)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
--		state := w105;
--when w105 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s106; else v_wait1 := v_wait1 + 1; state := w105; end if;
--when s106 =>
--		sftmp_slv_16 := x"79a6" and x"f000"; -- ee[0x2420]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		ascalecp := resize (tmpsf4, ascalecp);
--		--report_error_normalize ("fail ascalecp", ascalecp, to_sfixed (7.0, max_expected_s)); -- 7
--		fptmp2 := to_sfixed (27.0, fptmp2);
--		--report_error_normalize ("fail 27.0", fptmp2, to_sfixed (27.0, max_expected_s));
----		cmd <= "0000"; -- +Ascale_cp+27
--		in1add <= ascalecp;
--		in2add <= fptmp2;
--		state := w106;
--when w106 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s107; else v_wait1 := v_wait1 + 1; state := w106; end if;
--when s107 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		ascalecp := resize (fpout, ascalecp);
--		--report_error_normalize ("fail ascalecp", ascalecp, to_sfixed (34.0, max_expected_s)); -- 34
--		sftmp_slv_16 := x"e446" and x"fc00"; -- ee[0x2439]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 10));
--		tmpslv6 := sftmp_slv_16 (5 downto 0);
--		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
--		cpp1p0ratio := resize (tmpsf6, cpp1p0ratio);
--		--report_error_normalize ("fail cpp1p0ratio", cpp1p0ratio, to_sfixed (-7.0, max_expected_s)); -- -7
--		sftmp_slv_16 := x"e446" and x"03ff"; -- ee[0x2439]
--		tmpslv10 := sftmp_slv_16 (9 downto 0);
--		tmpsf10 := to_sfixed (tmpslv10, tmpsf10);
--		acpsubpage0 := resize (tmpsf10, acpsubpage0);
--		--report_error_normalize ("fail acpsubpage0 - xxx", acpsubpage0, to_sfixed (70.0, max_expected_s)); -- 70
--		ascalecp := to_sfixed (1.0, ascalecp) sll to_integer (ascalecp);
--		--report_error_normalize ("2^ascalecp", ascalecp, to_sfixed (17179869184.0, max_expected_s)); -- 2**34
----		cmd <= "0011"; -- / acpsubpage0/2^ascalecp
--		in1div <= acpsubpage0;
--		in2div <= ascalecp;
--		state := w107;
--when w107 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s108; else v_wait1 := v_wait1 + 1; state := w107; end if;
--when s108 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		acpsubpage0 := resize (fpout, acpsubpage0);
--		--report_error_normalize ("fail acpsubpage0", acpsubpage0, to_sfixed (0.00000000407453626394272, max_expected_s)); -- 0.00000000407453626394272
--		fptmp2 := to_sfixed (2**7, fptmp2);
--		--report_error_normalize ("fail 2**7", fptmp2, to_sfixed (2**7, max_expected_s));		
----		cmd <= "0011"; -- / cpp1p0ratio/2^7
--		in1div <= cpp1p0ratio;
--		in2div <= fptmp2;
--		state := w108;
--when w108 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s109; else v_wait1 := v_wait1 + 1; state := w108; end if;
--when s109 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		cpp1p0ratio := resize (fpout, cpp1p0ratio);
--		--report_error_normalize ("fail cpp1p0ratio 1", cpp1p0ratio, to_sfixed (-0.05468750000000000000, max_expected_s)); -- -0.05468750000000000000
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		--report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s));
----		cmd <= "0000"; -- + 1+(cpp1p0ratio/2^7)
--		in1add <= fptmp1;
--		in2add <= cpp1p0ratio;
--		state := w109;
--when w109 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s110; else v_wait1 := v_wait1 + 1; state := w109; end if;
--when s110 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		cpp1p0ratio := resize (fpout, cpp1p0ratio);
--		--report_error_normalize ("fail cpp1p0ratio 2", cpp1p0ratio, to_sfixed (1.0+(-0.05468750000000000000), max_expected_s)); -- 0.9453125
----		cmd <= "0010"; -- * acpsubpage0*(1+(cpp1p0ratio/2^7))
--		in1mul <= acpsubpage0;
--		in2mul <= cpp1p0ratio;
--		state := w110;
--when w110 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s111; else v_wait1 := v_wait1 + 1; state := w110; end if;
--when s111 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acpsubpage1 := resize (fpout, acpsubpage1);
--		--report_error_normalize ("fail acpsubpage1", acpsubpage1, to_sfixed ((0.00000000407453626394272)*(0.9453125), max_expected_s)); -- 0.00000000407453626394272*0.9453125
--		--report_error_normalize ("fail acpsubpage1 const", acpsubpage1, to_sfixed (0.00000000385171006200835, max_expected_s)); -- 0.00000000385171006200835
--		sftmp_slv_16 := x"f020" and x"ff00"; -- ee[0x243c]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		tmpslv8 := sftmp_slv_16 (7 downto 0);
--		tmpsf8 := to_sfixed (tmpslv8, tmpsf8);
--		kstaee := resize (tmpsf8, kstaee);
--		--report_error_normalize ("fail kstaee", kstaee, to_sfixed (-16.0, max_expected_s)); -- -16
--		fptmp2 := to_sfixed (2**13, fptmp2);
--		--report_error_normalize ("fail 2**13", fptmp2, to_sfixed (2**13, max_expected_s)); -- 2**13
----		cmd <= "0011"; -- / kstaee/2^13
--		in1div <= kstaee;
--		in2div <= fptmp2;
--		state := w111;
--when w111 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s112; else v_wait1 := v_wait1 + 1; state := w111; end if;
--when s112 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		ksta := resize (fpout, ksta);
--		--report_error_normalize ("fail ksta", ksta, to_sfixed (-0.001953125, max_expected_s)); -- -0.001953125
--		sftmp_slv_16 := x"2f44" and x"ffff"; -- ee[0x2421]
--		areference := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), areference);
--		--report_error_normalize ("fail areference", areference, to_sfixed (12100.0, max_expected_s)); -- 12100
--		sftmp_slv_16 := x"79a6" and x"f000"; -- ee[0x2420]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		ascale := resize (tmpsf4, ascale);
--		--report_error_normalize ("fail ascale", ascale, to_sfixed (7.0, max_expected_s)); -- 7
--		fptmp2 := to_sfixed (30.0, fptmp2);
--		--report_error_normalize ("fail 30.0", fptmp2, to_sfixed (30.0, max_expected_s));
----		cmd <= "0000"; -- + ascale+30
--		in1add <= ascale;
--		in2add <= fptmp2;
--		state := w112;
--when w112 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s113; else v_wait1 := v_wait1 + 1; state := w112; end if;
--when s113 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		ascale := resize (fpout, ascale);
--		--report_error_normalize ("fail ascale", ascale, to_sfixed (37.0, max_expected_s)); -- 37
--		sftmp_slv_16 := x"3333" and x"f000"; -- ee[0x2424]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		accrow12 := resize (tmpsf4, accrow12);
--		--report_error_normalize ("fail accrow12", accrow12, to_sfixed (3.0, max_expected_s)); -- 3
--		sftmp_slv_16 := x"3333" and x"f000"; -- ee[0x242b]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		acccolumn16 := resize (tmpsf4, acccolumn16);
--		--report_error_normalize ("fail acccolumn16", acccolumn16, to_sfixed (3.0, max_expected_s)); -- 3
--		sftmp_slv_16 := x"79a6" and x"0f00"; -- ee[0x2420]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		accscalerow := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), accscalerow);
--		--report_error_normalize ("fail accscalerow", accscalerow, to_sfixed (9.0, max_expected_s)); -- 9
--		sftmp_slv_16 := x"79a6" and x"00f0"; -- ee[0x2420]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 4));
--		accscalecolumn := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), accscalecolumn);
--		--report_error_normalize ("fail accscalecolumn", accscalecolumn, to_sfixed (10.0, max_expected_s)); -- 10
--		sftmp_slv_16 := x"79a6" and x"000f"; -- ee[0x2420]
--		tmpslv4 := sftmp_slv_16 (3 downto 0);
--		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
--		accscaleremnant := resize (tmpsf4, accscaleremnant);
--		--report_error_normalize ("fail accscaleremnant", accscaleremnant, to_sfixed (6.0, max_expected_s)); -- 6
--		sftmp_slv_16 := x"08a0" and x"03f0"; -- ee[0x258f]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 4));
--		tmpslv6 := sftmp_slv_16 (5 downto 0);
--		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
--		apixel_12_16 := resize (tmpsf6, apixel_12_16);
--		--report_error_normalize ("fail apixel_12_16", apixel_12_16, to_sfixed (10.0, max_expected_s)); -- 10
--		accsro := to_sfixed (1.0, accsro) sll to_integer (accscalerow);
--		--report_error_normalize ("fail 2^accscalerow", accsro, to_sfixed (2**9, max_expected_s)); -- 2**9
--		accsc := to_sfixed (1.0, accsc) sll to_integer (accscalecolumn);
--		--report_error_normalize ("fail 2^accscalecolumn", accsc, to_sfixed (2**10, max_expected_s)); -- 2**10
--		accsre := to_sfixed (1.0, accsre) sll to_integer (accscaleremnant);
--		--report_error_normalize ("fail 2^accscaleremnant", accsre, to_sfixed (2**6, max_expected_s)); -- 2**6
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
--		--report_error_normalize ("fail accsror", accsror, to_sfixed (3.0*(2**9), max_expected_s)); -- 3.0*(2**9)
----		cmd <= "0010"; -- * acccolumn16*2^accscalecolumn
--		in1mul <= acccolumn16;
--		in2mul <= accsc;
--		state := w115;
--when w115 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s116; else v_wait1 := v_wait1 + 1; state := w115; end if;
--when s116 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		accscr := resize (fpout, accscr);
--		--report_error_normalize ("fail accscr", accscr, to_sfixed (3.0*(2**10), max_expected_s)); -- 3.0*(2**10)
----		cmd <= "0010"; -- * apixel_12_16*2^accscaleremnant
--		in1mul <= apixel_12_16;
--		in2mul <= accsre;
--		state := w116;
--when w116 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s117; else v_wait1 := v_wait1 + 1; state := w116; end if;
--when s117 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		accsrer := resize (fpout, accsrer);
--		--report_error_normalize ("fail accsrer", accsrer, to_sfixed (10.0*(2**6), max_expected_s)); -- 10.0*(2**6)
----		cmd <= "0000"; -- + areference+(accrow12*2^accscalerow)
--		in1add <= areference;
--		in2add <= accsror;
--		state := w117;
--when w117 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s118; else v_wait1 := v_wait1 + 1; state := w117; end if;
--when s118 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		a_12_16 := resize (fpout, a_12_16);
--		--report_error_normalize ("fail a_12_16 1", a_12_16, to_sfixed (12100.0+3.0*(2**9), max_expected_s)); -- 12100.0+(3.0*(2**9))
----		cmd <= "0000"; -- + areference+(accrow12*2^accscalerow)+(acccolumn16*2^accscalecolumn)
--		in1add <= a_12_16;
--		in2add <= accscr;
--		state := w118;
--when w118 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s119; else v_wait1 := v_wait1 + 1; state := w118; end if;
--when s119 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		a_12_16 := resize (fpout, a_12_16);
--		--report_error_normalize ("fail a_12_16 2", a_12_16, to_sfixed (12100.0+(3.0*(2**9))+(3.0*(2**10)), max_expected_s)); -- 12100.0+(3.0*(2**9))+(3.0*(2**10))
----		cmd <= "0000"; -- + areference+(accrow12*2^accscalerow)+(acccolumn16*2^accscalecolumn)+(apixel_12_16*2^accscaleremnant)
--		in1add <= a_12_16;
--		in2add <= accsrer;
--		state := w119;
--when w119 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s120; else v_wait1 := v_wait1 + 1; state := w119; end if;
--when s120 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		a_12_16 := resize (fpout, a_12_16);
--		--report_error_normalize ("fail a_12_16 3", a_12_16, to_sfixed (12100.0+(3.0*(2**9))+(3.0*(2**10))+(10.0*(2**6)), max_expected_s)); -- 12100.0+(3.0*(2**9))+(3.0*(2**10))+(10*(2**6))
--		ascale := to_sfixed (1.0, ascale) sll to_integer (ascale);
--		--report_error_normalize ("fail 2^ascale", ascale, to_sfixed (137438953472.0, max_expected_s)); -- 137438953472
----		cmd <= "0011"; -- / (12100.0+(3.0*(2**9))+(3.0*(2**10))+(10*(2**6)))/2^ascale
--		in1div <= a_12_16;
--		in2div <= ascale;
--		state := w120;
--when w120 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s121; else v_wait1 := v_wait1 + 1; state := w120; end if;
--when s121 =>
--		fpout := to_sfixed (to_slv (out1div), fpout);
--		a_12_16 := resize (fpout, a_12_16);
--		--report_error_normalize ("fail a_12_16 4", a_12_16, to_sfixed (0.000000126223312690865, max_expected_s)); -- 0.000000126223312690865
----		cmd <= "0010"; -- * Ksta*(Ta-Ta0)
--		in1mul <= ksta;
--		in2mul <= tad;
--		state := w121;
--when w121 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s122; else v_wait1 := v_wait1 + 1; state := w121; end if;
--when s122 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		ksta := resize (fpout, ksta);
--		--report_error_normalize ("fail Ksta*(Ta-Ta0)", ksta, to_sfixed (-0.001953125*(39.184-25.0), max_expected_s)); -- -0.001953125*(39.184-25.0)
--		fptmp1 := to_sfixed (1.0, fptmp1);
--		--report_error_normalize ("fail 1.0", fptmp1, to_sfixed (1.0, max_expected_s));
----		cmd <= "0000"; -- + 1+(Ksta*(Ta-Ta0))
--		in1add <= fptmp1;
--		in2add <= ksta;
--		state := w122;
--when w122 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s123; else v_wait1 := v_wait1 + 1; state := w122; end if;
--when s123 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		ksta := resize (fpout, ksta);
--		--report_error_normalize ("fail 1+(Ksta*(Ta-Ta0))", ksta, to_sfixed (1.0+(-0.001953125*(39.184-25.0)), max_expected_s)); -- 1+(-0.001953125*(39.184-25.0))
----		cmd <= "0010"; -- * pattern*acpsubpage1
--		in1mul <= ch_pattern_12_16;
--		in2mul <= acpsubpage1;
--		state := w123;
--when w123 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s124; else v_wait1 := v_wait1 + 1; state := w123; end if;
--when s124 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acpsubpagepatt1 := resize (fpout, acpsubpagepatt1);
--		--report_error_normalize ("fail pattern*acpsubpage1", acpsubpagepatt1, to_sfixed (0.0*0.00000000385171006200835, max_expected_s)); -- 0*0.00000000385171006200835
----		cmd <= "0010"; -- * (1-pattern)*acpsubpage0
--		in1mul <= ch_pattern_12_16_minusone;
--		in2mul <= acpsubpage0;
--		state := w124;
--when w124 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s125; else v_wait1 := v_wait1 + 1; state := w124; end if;
--when s125 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acpsubpagepatt0 := resize (fpout, acpsubpagepatt0);
--		--report_error_normalize ("fail (1-pattern)*acpsubpage0", acpsubpagepatt0, to_sfixed ((1.0-0.0)*0.00000000407453626394272, max_expected_s)); -- (1-0)*0.00000000407453626394272
----		cmd <= "0000"; -- + (((1-pattern)*acpsubpage0)+(pattern*acpsubpage1))
--		in1add <= acpsubpagepatt0;
--		in2add <= acpsubpagepatt1;
--		state := w125;
--when w125 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s126; else v_wait1 := v_wait1 + 1; state := w125; end if;
--when s126 => -- xxx LOL :ASDASDASD simulation stop here in isim 14.7 when state is signal
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		acpsubpagepatt01 := resize (fpout, acpsubpagepatt01);
--		--report_error_normalize ("fail (((1-pattern)*acpsubpage0)+(pattern*acpsubpage1))", acpsubpagepatt01, to_sfixed (((1.0-0.0)*0.00000000407453626394272)+(0*0.00000000385171006200835), max_expected_s)); -- (1-0)*0.00000000407453626394272
----		cmd <= "0010"; -- * tgc*(((1-pattern)*acpsubpage0)+(pattern*acpsubpage1))
--		in1mul <= tgc;
--		in2mul <= acpsubpagepatt01;
--		state := w126;
--when w126 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s127; else v_wait1 := v_wait1 + 1; state := w126; end if;
--when s127 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acpsubpagepatt01 := resize (fpout, acpsubpagepatt01);
--		--report_error_normalize ("fail tgc*(((1-pattern)*acpsubpage0)+(pattern*acpsubpage1))", acpsubpagepatt01, to_sfixed (1.0*(((1.0-0.0)*0.00000000407453626394272)+(0*0.00000000385171006200835)), max_expected_s)); -- 1.0*(((1.0-0.0)*0.00000000407453626394272)+(0*0.00000000385171006200835))
----		cmd <= "0001"; -- - a_12_16-(tgc*(((1-pattern)*acpsubpage0)+(pattern*acpsubpage1)))
--		in1sub <= a_12_16;
--		in2sub <= acpsubpagepatt01;
--		state := w127;
--when w127 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s128; else v_wait1 := v_wait1 + 1; state := w127; end if;
--when s128 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		acomp_12_16 := resize (fpout, acomp_12_16);
--		--report_error_normalize ("a_12_16-(tgc*(((1-pattern)*acpsubpage0)+(pattern*acpsubpage1)))", acomp_12_16, to_sfixed (0.000000126223312690865-(1.0*(((1.0-0.0)*0.00000000407453626394272)+(0*0.00000000385171006200835))), max_expected_s)); -- 0.000000126223312690865-(1.0*(((1.0-0.0)*0.00000000407453626394272)+(0*0.00000000385171006200835)))
----		cmd <= "0010"; -- * (a_12_16-(tgc*(((1-pattern)*acpsubpage0)+(pattern*acpsubpage1))))*(1+(Ksta*(Ta-Ta0)))
--		in1mul <= acomp_12_16;
--		in2mul <= ksta;
--		state := w128;
--when w128 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s129; else v_wait1 := v_wait1 + 1; state := w128; end if;
--when s129 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acomp_12_16 := resize (fpout, acomp_12_16);
--		--report_error_normalize ("fail acomp_12_16", acomp_12_16, to_sfixed (0.00000011876487360496, max_expected_s)); -- 0.00000011876487360496
--		sftmp_slv_16 := x"9797" and x"ff00"; -- ee[0x243d]
--		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
--		tmpslv8 := sftmp_slv_16 (7 downto 0);
--		tmpsf8 := to_sfixed (tmpslv8, tmpsf8);
--		ksto2ee := resize (tmpsf8, ksto2ee);
--		--report_error_normalize ("fail ksto2ee", ksto2ee, to_sfixed (-105.0, max_expected_s)); -- -105
--		sftmp_slv_16 := x"2889" and x"000f"; -- ee[0x243f]
--		kstoscale := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kstoscale);
--		--report_error_normalize ("fail kstoscale", kstoscale, to_sfixed (9.0, max_expected_s)); -- 9
--		fptmp2 := to_sfixed (8.0, fptmp2);
--		--report_error_normalize ("fail 8.0", fptmp2, to_sfixed (8.0, max_expected_s));
----		cmd <= "0000"; -- + kstoscale+8
--		in1add <= kstoscale;
--		in2add <= fptmp2;
--		state := w129;
--when w129 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s130; else v_wait1 := v_wait1 + 1; state := w129; end if;
--when s130 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		kstoscale := resize (fpout, kstoscale);
--		--report_error_normalize ("fail kstoscale", kstoscale, to_sfixed (17.0, max_expected_s)); -- 17
--		fptmp2 := to_sfixed (273.15, fptmp2);
--		--report_error_normalize ("fail 273.15", fptmp2, to_sfixed (273.15, max_expected_s));
----		cmd <= "0000"; -- + Ta+273.15
--		in1add <= Ta;
--		in2add <= fptmp2;
--		state := w130;
--when w130 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s131; else v_wait1 := v_wait1 + 1; state := w130; end if;
--when s131 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		tak4 := resize (fpout, tak4);
--		--report_error_normalize ("fail TaK4**1", tak4, to_sfixed (39.184+273.15, max_expected_s)); -- 39.184+273.15
----		cmd <= "0010"; -- * TaK4*TaK4
--		in1mul <= tak4;
--		in2mul <= tak4;
--		state := w131;
--when w131 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s132; else v_wait1 := v_wait1 + 1; state := w131; end if;
--when s132 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		fptmp1 := resize (fpout, fptmp1);
--		--report_error_normalize ("fail TaK4**2", fptmp1, to_sfixed ((39.184+273.15)*(39.184+273.15), max_expected_s)); -- (39.184+273.15)**2
----		cmd <= "0010"; -- * TaK4*TaK4*TaK4
--		in1mul <= fptmp1;
--		in2mul <= tak4;
--		state := w132;
--when w132 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s133; else v_wait1 := v_wait1 + 1; state := w132; end if;
--when s133 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		fptmp1 := resize (fpout, fptmp1);
--		--report_error_normalize ("fail TaK4**3", fptmp1, to_sfixed ((39.184+273.15)*(39.184+273.15)*(39.184+273.15), max_expected_s)); -- (39.184+273.15)**3
----		cmd <= "0010"; -- * TaK4*TaK4*TaK4*TaK4
--		in1mul <= fptmp1;
--		in2mul <= tak4;
--		state := w133;
--when w133 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s134; else v_wait1 := v_wait1 + 1; state := w133; end if;
--when s134 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		fptmp1 := resize (fpout, fptmp1);
--		--report_error_normalize ("fail TaK4**4", fptmp1, to_sfixed (to_real (tak4)*to_real (tak4)*to_real (tak4)*to_real (tak4), max_expected_s)); -- (39.184+273.15)**4
--		--report_error_normalize ("fail TaK4**4", fptmp1, to_sfixed ((39.184+273.15)*(39.184+273.15)*(39.184+273.15)*(39.184+273.15), max_expected_s)); -- (39.184+273.15)**4
--		--report_error_normalize ("fail TaK4**4 const", fptmp1, to_sfixed (9516495632.56, max_expected_s)); -- 9516495632.56
--		fptmp2 := to_sfixed (8.0, fptmp2);
--		--report_error_normalize ("fail 8.0", fptmp2, to_sfixed (8.0, fptmp2));
----		cmd <= "0001"; -- - Ta-8
--		in1sub <= Ta;
--		in2sub <= fptmp2;
--		state := w134;
--when w134 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s135; else v_wait1 := v_wait1 + 1; state := w134; end if;
--when s135 =>
--		fpout := to_sfixed (to_slv (out1sub), fpout);
--		trk4 := resize (fpout, trk4);
--		--report_error_normalize ("fail trk4", trk4, to_sfixed (31.184, max_expected_s)); -- 31.184 ~31
----		cmd <= "0010"; -- * acomp_12_16**2
--		in1mul <= acomp_12_16;
--		in2mul <= acomp_12_16;
--		state := w135;
--when w135 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s136; else v_wait1 := v_wait1 + 1; state := w135; end if;
--when s136 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acomp_12_16_pow3 := resize (fpout, acomp_12_16_pow3);
--		--report_error_normalize ("fail acomp_12_16**2", acomp_12_16_pow3, to_sfixed (to_real (acomp_12_16)*to_real (acomp_12_16), max_expected_s)); -- acomp_12_16**2
----		cmd <= "0010"; -- * acomp_12_16**3
--		in1mul <= acomp_12_16_pow3;
--		in2mul <= acomp_12_16;
--		state := w136;
--when w136 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s137; else v_wait1 := v_wait1 + 1; state := w136; end if;
--when s137 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acomp_12_16_pow3 := resize (fpout, acomp_12_16_pow3);
--		--report_error_normalize ("fail acomp_12_16**3", acomp_12_16_pow3, to_sfixed (to_real (acomp_12_16)*to_real (acomp_12_16)*to_real (acomp_12_16), max_expected_s)); -- acomp_12_16**3
----		cmd <= "0010"; -- * acomp_12_16**4
--		in1mul <= acomp_12_16_pow3;
--		in2mul <= acomp_12_16;
--		state := w137;
--when w137 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s138; else v_wait1 := v_wait1 + 1; state := w137; end if;
--when s138 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		acomp_12_16_pow4 := resize (fpout, acomp_12_16_pow4);
--		--report_error_normalize ("fail acomp_12_16**4", acomp_12_16_pow4, to_sfixed (to_real (acomp_12_16)*to_real (acomp_12_16)*to_real (acomp_12_16)*to_real (acomp_12_16), max_expected_s)); -- acomp_12_16**4
----		cmd <= "0010"; -- * acomp_12_16**3*vir_12_16_compensated
--		in1mul <= acomp_12_16_pow3;
--		in2mul <= vir_12_16_compensated;
--		state := w138;
--when w138 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s139; else v_wait1 := v_wait1 + 1; state := w138; end if;
--when s139 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		fptmp1 := resize (fpout, fptmp1);
--		--report_error_normalize ("fail acomp_12_16**3*vir_12_16_compensated", fptmp1, to_sfixed (((0.00000011876487360496)**3)*679.250909123826, max_expected_s)); -- ((0.00000011876487360496)**3)*679.250909123826
----		cmd <= "0010"; -- * acomp_12_16**4*TaK4
--		in1mul <= acomp_12_16_pow4;
--		in2mul <= Tak4;
--		state := w139;
--when w139 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s140; else v_wait1 := v_wait1 + 1; state := w139; end if;
--when s140 =>
--		fpout := to_sfixed (to_slv (out1mul), fpout);
--		fptmp2 := resize (fpout, fptmp2);
--		--report_error_normalize ("fail acomp_12_16**4*TaK4", fptmp2, to_sfixed (((0.00000011876487360496)**4)*9516495632.56, max_expected_s)); -- ((0.00000011876487360496)**4)*9516495632.56
----		cmd <= "0000"; -- + (acomp_12_16**3*vir_12_16_compensated)+(acomp_12_16**4*TaK4)
--		in1add <= fptmp1;
--		in1add <= fptmp2;
--		state := w140;
--when w140 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state := s141; else v_wait1 := v_wait1 + 1; state := w140; end if;
--when s141 =>
--		fpout := to_sfixed (to_slv (out1add), fpout);
--		fptmp1 := resize (fpout, fptmp1);
--		--report_error_normalize ("fail (acomp_12_16**3*vir_12_16_compensated)+(acomp_12_16**4*TaK4)", fptmp1, to_sfixed ((((0.00000011876487360496)**3)*679.250909123826)+(((0.00000011876487360496)**4)*9516495632.56), max_expected_s)); -- (((0.00000011876487360496)**3)*679.250909123826)+(((0.00000011876487360496)**4)*9516495632.56)
--		o_out1 <= acomp_12_16;
--report time'image(now) severity failure;

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
sclr => divfpsclr,
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

mem_float2powerN_clock1 <= i_clock;
mem_float2powerN_clock2 <= i_clock;

inst_mem_float2powerN1 : mem_float2powerN
port map (
i_clock => mem_float2powerN_clock1,
i_reset => mem_float2powerN_reset1,
i_N => mem_float2powerN_N1,
o_2powerN => mem_float2powerN_2powerN1
);

inst_mem_float2powerN2 : mem_float2powerN
port map (
i_clock => mem_float2powerN_clock2,
i_reset => mem_float2powerN_reset2,
i_N => mem_float2powerN_N2,
o_2powerN => mem_float2powerN_2powerN2
);

end architecture testbench;

