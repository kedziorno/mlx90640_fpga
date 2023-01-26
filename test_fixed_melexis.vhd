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
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_ee0x2410 : in slv16; -- (alphaptatee),kptat,scaleoccrow,scaleocccolumn,scaleoccremnant
i_ee0x2411 : in slv16; -- (offsetaverage),pixosaverage
i_ee0x2414 : in slv16; -- OCCROWS12,occrows11,occroes10,occrows09
i_ee0x241b : in slv16; -- OCCCOLUMN16,occcolumn15,occcolumn14,occcolumn13

i_ee0x2420 : in slv16; -- alphascale,scaleaccrow,scaleacccolumn,scaleaccremnand|ascalecp,ascale
i_ee0x2421 : in slv16; -- pixsensitivityaverage|areference
i_ee0x2424 : in slv16; -- ACCROWS12,accrows11,accrows10,accrows09
i_ee0x242b : in slv16; -- ACCCOLUMN16,acccolumn15,acccolumn14,acccolumn13

i_ee0x2430 : in slv16; -- gain
i_ee0x2431 : in slv16; -- vptat25
i_ee0x2432 : in slv16; -- kvptat,ktptat-6/10
i_ee0x2433 : in slv16; -- kvdd,vdd25
i_ee0x2434 : in slv16; -- kvavg_roco,kvavg_reco,kvavg_roce,kvavg_rece(kv_ij-p.39)

i_ee0x2437 : in slv16; -- ktaavg_roce,ktaavg_rece(ktarcee)
i_ee0x2438 : in slv16; -- resolutioncontrolcal,kvscale,ktascale1,ktascale2-2/4/4/4|resolutionee
i_ee0x2439 : in slv16; -- cpsp1ratio/cpsp0ratio,alphacpsp0-6/10,acpsubpage0|cpp1p0ratio

i_ee0x243a : in slv16; -- offcpsubpage1delta,offcpsubpage0-6/10
i_ee0x243b : in slv16; -- kvcp,(kvcpee),ktacp,(ktacpee)
i_ee0x243c : in slv16; -- ksta,(kstaee),tgc,(tgcee)
i_ee0x243d : in slv16; -- ksto2,(ksto2ee),ksto1
-- i_ee0x243e -- 9797 -- 0x00ff -- 97 (signed) -- ksto3ee, 0xff00 - 97 (signed) -- ksto4ee
i_ee0x243f : in slv16; -- step,ct4,ct3,kstoscale-2/4/4/4

i_ee0x258f : in slv16; -- apixel1216
i_ee0x25af : in slv16; -- offset1216,kta1216ee-6,...,3

i_ram0x056f : in slv16; -- pxdata1216,11.2.2.5.1

i_ram0x0700 : in slv16; -- for vbe
i_ram0x0708 : in slv16; -- for pixgaincpsp0,cpsubpage0
i_ram0x070a : in slv16; -- gain

i_ram0x0720 : in slv16; -- for vptat,ptat
i_ram0x0728 : in slv16; -- for pixgaincpsp1,cpsubpage1
i_ram0x072a : in slv16; -- for deltaV,vdd

i_ram0x800d : in slv16; -- resolution reg

i_pixelpattern : in slv14; -- 12x16
-----
o_To : out fd2ft; -- output Temp
o_rdy : out std_logic
);
end test_fixed_melexis;

architecture testbench of test_fixed_melexis is

COMPONENT float2fixed
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
--operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
--overflow : OUT STD_LOGIC;
--invalid_op : OUT STD_LOGIC;
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
--operation_rfd : OUT STD_LOGIC;
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
--operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
--underflow : OUT STD_LOGIC;
--overflow : OUT STD_LOGIC;
--invalid_op : OUT STD_LOGIC;
--divide_by_zero : OUT STD_LOGIC;
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
--operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
--underflow : OUT STD_LOGIC;
--overflow : OUT STD_LOGIC;
--invalid_op : OUT STD_LOGIC;
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
--operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
--underflow : OUT STD_LOGIC;
--overflow : OUT STD_LOGIC;
--invalid_op : OUT STD_LOGIC;
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
--operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
--underflow : OUT STD_LOGIC;
--overflow : OUT STD_LOGIC;
--invalid_op : OUT STD_LOGIC;
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
--operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
--invalid_op : OUT STD_LOGIC;
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

component mem_switchpattern is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_pixel : in std_logic_vector (13 downto 0);
o_pattern : out std_logic
);
end component mem_switchpattern;

signal mem_switchpattern_clock : std_logic;
signal mem_switchpattern_reset : std_logic;
signal mem_switchpattern_pixel : std_logic_vector (13 downto 0);
signal mem_switchpattern_pattern : std_logic;

component ExtractVDDParameters is
port (
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2433 : IN  std_logic_vector (15 downto 0);
o_kvdd : OUT  std_logic_vector (31 downto 0);
o_vdd25 : OUT  std_logic_vector (31 downto 0)
);
end component ExtractVDDParameters;

signal ExtractVDDParameters_clock : std_logic;
signal ExtractVDDParameters_reset : std_logic;
signal ExtractVDDParameters_ee0x2433 : std_logic_vector (15 downto 0);
signal ExtractVDDParameters_kvdd : std_logic_vector (31 downto 0);
signal ExtractVDDParameters_vdd25 : std_logic_vector (31 downto 0);

component ExtractAlphaPtatParameter is
port (
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2410 : IN  std_logic_vector (15 downto 0);
o_alphaptat: OUT  std_logic_vector (31 downto 0)
);
end component ExtractAlphaPtatParameter;

signal ExtractAlphaPtatParameter_clock : std_logic;
signal ExtractAlphaPtatParameter_reset : std_logic;
signal ExtractAlphaPtatParameter_ee0x2410 : std_logic_vector (15 downto 0);
signal ExtractAlphaPtatParameter_alphaptat : std_logic_vector (31 downto 0);

component ExtractCT34Parameter is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_ee0x243f : in std_logic_vector (15 downto 0);
o_ct3 : out std_logic_vector (31 downto 0);
o_ct4 : out std_logic_vector (31 downto 0)
);
end component ExtractCT34Parameter;

signal ExtractCT34Parameter_clock : std_logic;
signal ExtractCT34Parameter_reset : std_logic;
signal ExtractCT34Parameter_ee0x243f : std_logic_vector (15 downto 0);
signal ExtractCT34Parameter_ct3 : std_logic_vector (31 downto 0);
signal ExtractCT34Parameter_ct4 : std_logic_vector (31 downto 0);

COMPONENT ExtractKsTaParameters
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x243c : IN  std_logic_vector(15 downto 0);
o_ksta : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

signal ExtractKsTaParameters_clock : std_logic;
signal ExtractKsTaParameters_reset : std_logic;
signal ExtractKsTaParameters_ee0x243c : std_logic_vector (15 downto 0);
signal ExtractKsTaParameters_ksta : std_logic_vector (31 downto 0);

COMPONENT ExtractKsToScaleParameter
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x243f : IN  std_logic_vector(15 downto 0);
o_kstoscale : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

signal ExtractKsToScaleParameter_clock : std_logic;
signal ExtractKsToScaleParameter_reset : std_logic;
signal ExtractKsToScaleParameter_ee0x243f : std_logic_vector (15 downto 0);
signal ExtractKsToScaleParameter_kstoscale : std_logic_vector (31 downto 0);

COMPONENT ExtractKtPTATParameter
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2432 : IN  std_logic_vector(15 downto 0);
o_ktptat : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

signal ExtractKtPTATParameter_clock : std_logic;
signal ExtractKtPTATParameter_reset : std_logic;
signal ExtractKtPTATParameter_ee0x2432 : std_logic_vector (15 downto 0);
signal ExtractKtPTATParameter_ktptat : std_logic_vector (31 downto 0);

COMPONENT ExtractKvPTATParameter
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2432 : IN  std_logic_vector(15 downto 0);
o_kvptat : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

signal ExtractKvPTATParameter_clock : std_logic;
signal ExtractKvPTATParameter_reset : std_logic;
signal ExtractKvPTATParameter_ee0x2432 : std_logic_vector (15 downto 0);
signal ExtractKvPTATParameter_kvptat : std_logic_vector (31 downto 0);

COMPONENT ExtractTGCParameters
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x243c : IN  std_logic_vector(15 downto 0);
o_tgc : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

signal ExtractTGCParameters_clock : std_logic;
signal ExtractTGCParameters_reset : std_logic;
signal ExtractTGCParameters_ee0x243c : std_logic_vector (15 downto 0);
signal ExtractTGCParameters_tgc : std_logic_vector (31 downto 0);


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
		variable vir1216emissivitycompensated,pixgaincpsp0,pixgaincpsp1,offcpsubpage0,offcpsubpage1,offcpsubpage1delta : st_sfixed_max;
		variable ktacp,ktacpee,kvcp,kvcpee,pixoscpsp0,pixoscpsp1,tgcee,tgc,pattern,vir1216compensated : st_sfixed_max;
		variable vir1216emmisivitycompensated,ksto2ee : st_sfixed_max;
		variable acpsubpage0,acpsubpage1,ascalecp,cpp1p0ration,ksta,kstaee,areference,ascale,accrow12,acccolumn16: st_sfixed_max;
		variable apixel1216,a1216,acomp1216,cpp1p0ratio : st_sfixed_max;
		variable resee,resreg,accscalerow,accscalecolumn,accscaleremnant,kstoscale : st_ufixed_max;
		variable kvdd_ft,vdd25_ft,resee_ft,resreg_ft,rescorr_ft,Ta_ft,kta1216ee_ft : fd2ft;
		variable kvptat_ft,ktptat_ft,deltaV_ft,Vdd_ft,vptat_ft,vbe_ft,vptat25_ft,trk4_ft : fd2ft;
		variable alphaptatee_ft,alphaptat_ft,vptatart_ft,Kgain_ft,gain_ft : fd2ft;
		variable pixgain1216_ft,offsetaverage_ft,occrow12_ft,occscalerow_ft,occcolumn16_ft,occscalecolumn_ft,offset1216_ft : fd2ft;
		variable occscaleremnant_ft,pixosref1216_ft,pixos1216_ft,kta1216_ft,ktarcee_ft,ktascale1_ft,ktascale2_ft,kv1216_ft,kvscale_ft : fd2ft;
		variable kv1216ee_ft,vir1216emissivitycompensated_ft,pixgaincpsp0_ft,pixgaincpsp1_ft,v0d_ft,tad_ft,vir1216compensated_ft : fd2ft;
		variable offcpsubpage0_ft,offcpsubpage1_ft,offcpsubpage1delta_ft,pattern_ft,vir1216emmisivitycompensated_ft : fd2ft;
		variable ktacp_ft,ktacpee_ft,kvcp_ft,kvcpee_ft,pixoscpsp0_ft,pixoscpsp1_ft,tgcee_ft,tgc_ft,kstoscale_ft,tak4_ft : fd2ft;
		variable acpsubpage0_ft,acpsubpage1_ft,ascalecp_ft,cpp1p0ration_ft,ksta_ft,kstaee_ft,areference_ft,ascale_ft,accrow12_ft,accscalerow_ft,acccolumn16_ft,accscalecolumn_ft : fd2ft;
		variable apixel1216_ft,accscaleremnant_ft,a1216_ft,acomp1216_ft,cpp1p0ratio_ft,ksto2ee_ft,ksto2_ft : fd2ft;
		variable acomp1216_pow3_ft,acomp1216_pow4_ft,tak_ft,sx1216 : fd2ft;
		variable pattern_slv1 : slv1;
		variable fttmp1_ft,fttmp2_ft : fd2ft;
		variable fptmp1,fptmp2 : st_sfixed_max;
		constant k27315_ft : fd2ft := x"43889333"; --st_sfixed_max := to_sfixed (273.15, st_sfixed_max'high, st_sfixed_max'low); -- 0x43889333
		constant const256_ft : fd2ft := x"43800000"; --st_sfixed_max := to_sfixed (256.0, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow5_ft : fd2ft := x"42000000"; --st_sfixed_max := to_sfixed (2.0**5, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow7_ft : fd2ft := x"43000000"; --st_sfixed_max := to_sfixed (2.0**7, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow13_ft : fd2ft := x"46000000"; --st_sfixed_max := to_sfixed (2.0**13, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow12_ft : fd2ft := x"45800000"; --st_sfixed_max := to_sfixed (2.0**12, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow3_ft : fd2ft := x"41000000"; --st_sfixed_max := to_sfixed (2.0**3, st_sfixed_max'high, st_sfixed_max'low);
		constant const3dot3_ft : fd2ft := x"40533333"; --st_sfixed_max := to_sfixed (3.3, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow2_ft : fd2ft := x"40800000"; --st_sfixed_max := to_sfixed (2.0**2, st_sfixed_max'high, st_sfixed_max'low);
		constant const8_ft : fd2ft := x"41000000"; --st_sfixed_max := to_sfixed (8.0, st_sfixed_max'high, st_sfixed_max'low);
		constant const2pow18_ft : fd2ft := x"48800000"; --st_sfixed_max := to_sfixed (2.0**18, st_sfixed_max'high, st_sfixed_max'low);
		constant const25_ft : fd2ft := x"41C80000"; --st_sfixed_max := to_sfixed (25.0, st_sfixed_max'high, st_sfixed_max'low);
		constant const1_ft : fd2ft := x"3F800000"; --st_sfixed_max := to_sfixed (1.0, st_sfixed_max'high, st_sfixed_max'low);
		constant const27_ft : fd2ft := x"41D80000"; --st_sfixed_max := to_sfixed (27.0, st_sfixed_max'high, st_sfixed_max'low);
		constant constemissivity_ft : fd2ft := const1_ft; --st_sfixed_max := to_sfixed (1.0, st_sfixed_max'high, st_sfixed_max'low);
		constant const30_ft : fd2ft := x"41F00000"; --st_sfixed_max := to_sfixed (30.0, st_sfixed_max'high, st_sfixed_max'low);
-----
		variable fracas : fracas;
		variable fracbs : fracbs;
		variable fracau : fracau;
		variable fracbu : fracbu;
		variable outTo : fd2ft;
	begin
		if (rising_edge(i_clock)) then
			if (i_reset = '1') then
--				report "fp_add_hi : " & integer'image(st_sfixed_add'high);
--				report "fp_add_lo : " & integer'image(st_sfixed_add'low);
--				report "fp_sub_hi : " & integer'image(st_sfixed_sub'high);
--				report "fp_sub_lo : " & integer'image(st_sfixed_sub'low);
--				report "fp_mul_hi : " & integer'image(st_sfixed_mul'high);
--				report "fp_mul_lo : " & integer'image(st_sfixed_mul'low);
--				report "fp_div_hi : " & integer'image(st_sfixed_div'high);
--				report "fp_div_lo : " & integer'image(st_sfixed_div'low);
				state := idle;
				outTo := (others => '0');
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
				mem_switchpattern_reset <= '1';
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
			divfpsclr <= '0';
			mem_float2powerN_reset1 <= '0';
			mem_float2powerN_reset2 <= '0';
			mem_switchpattern_reset <= '0';
	when s1 => state := s17;
		--
		-- kvdd,vdd25
		

	when s17 => state := s18;
--		subfpsclr <= '0';
		--
		-- resee
		eeprom16slv := i_ee0x2438 and x"3000";
		resee := resize (to_ufixed (eeprom16slv, eeprom16uf), resee);
--		--vout2 := resize (resee, st_ufixed_max'high, st_ufixed_max'low);
		resee := resee srl 12;
		resee := resize (to_ufixed (to_slv (resee (1 downto 0)), ufixed2'high, ufixed2'low), resee);
		resee := to_ufixed (1.0, resee) sll to_integer (resee);
--		--vout2 := resize (resee, st_ufixed_max'high, st_ufixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_ufixed (to_slv (resee (fracau'high downto fracau'low)), fracau)) & 
		to_slv (to_ufixed (to_slv (resee (fracbu'high downto fracbu'low)), fracbu));
	when s18 =>
		if (fixed2floatrdy = '1') then state := s19;
			resee_ft := fixed2floatr;
			--o_To <= fixed2floatr;
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
--		--vout2 := resize (resreg, st_ufixed_max'high, st_ufixed_max'low);
		resreg := resreg srl 10;
		resreg := resize (to_ufixed (to_slv (resreg (1 downto 0)), ufixed2'high, ufixed2'low), resreg);
		resreg := to_ufixed (1.0, resreg) sll to_integer (resreg);
--		--vout2 := resize (resreg, st_ufixed_max'high, st_ufixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_ufixed (to_slv (resreg (fracau'high downto fracau'low)), fracau)) & 
		to_slv (to_ufixed (to_slv (resreg (fracbu'high downto fracbu'low)), fracbu));
	when s20 =>
		if (fixed2floatrdy = '1') then state := s21;
			resreg_ft := fixed2floatr;
			--o_To <= fixed2floatr;
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
			--o_To <= divfpr;
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
		--vout2 := resize (kvptat, st_sfixed_max'high, st_sfixed_max'low);
		kvptat := kvptat srl 10;
		kvptat := resize (to_sfixed (to_slv (kvptat (5 downto 0)), sfixed6'high, sfixed6'low), kvptat);
		--vout2 := resize (kvptat, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (kvptat (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (kvptat (fracbs'high downto fracbs'low)), fracbs));
	when s24 =>
		if (fixed2floatrdy = '1') then state := s25;
			kvptat_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s24; end if;
	when s25 => state := s28;
		fixed2floatsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const2pow12 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const2pow12 (fracbs'high downto fracbs'low)), fracbs));
--	when s26 =>
--		if (fixed2floatrdy = '1') then state := s27;
--			const2pow12_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s26; end if;
--	when s27 => state := s28;
--		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= kvptat_ft;
		divfpb <= const2pow12_ft;
		divfpond <= '1';
	when s28 =>
		if (divfprdy = '1') then state := s29;
			kvptat_ft := divfpr;
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s28; end if;
	when s29 => state := s35;
		divfpsclr <= '0';
--		eeprom16slv := i_ee0x2432 and x"03ff";
--		ktptat := resize (to_sfixed (eeprom16slv, eeprom16sf), ktptat);
--		--vout2 := resize (kvptat, st_sfixed_max'high, st_sfixed_max'low);
--		ktptat := resize (to_sfixed (to_slv (ktptat (9 downto 0)), sfixed10'high, sfixed10'low), ktptat);
--		--vout2 := resize (ktptat, st_sfixed_max'high, st_sfixed_max'low);
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (ktptat (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (ktptat (fracbs'high downto fracbs'low)), fracbs));
--	when s30 =>
--		if (fixed2floatrdy = '1') then state := s31;
--			ktptat_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s30; end if;
--	when s31 => state := s35;
--		fixed2floatsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const2pow3 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const2pow3 (fracbs'high downto fracbs'low)), fracbs));
--	when s32 =>
--		if (fixed2floatrdy = '1') then state := s33;
--			const2pow3_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s32; end if;
--	when s33 => state := s34;
--		fixed2floatsclr <= '0';
--		divfpce <= '1';
--		divfpa <= ktptat_ft;
--		divfpb <= const2pow3_ft;
--		divfpond <= '1';
--	when s34 =>
--		if (divfprdy = '1') then state := s35;
--			ktptat_ft := divfpr;
--			--o_To <= divfpr;
--			divfpce <= '0';
--			divfpond <= '0';
--			divfpsclr <= '1';
--		else state := s34; end if;
	when s35 => state := s36;
		divfpsclr <= '0';
		--
		-- deltaV
		eeprom16slv := i_ram0x072a and x"ffff";
		deltaV := resize (to_sfixed (eeprom16slv, eeprom16sf), deltaV);
		--vout2 := resize (deltaV, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (deltaV (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (deltaV (fracbs'high downto fracbs'low)), fracbs));
	when s36 =>
		if (fixed2floatrdy = '1') then state := s37;
			deltaV_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s36; end if;
	when s37 => state := s38;
		fixed2floatsclr <= '0';
		subfpce <= '1';
		subfpa <= deltaV_ft;
		subfpb <= ExtractVDDParameters_vdd25;
		subfpond <= '1';
	when s38 =>
		if (subfprdy = '1') then state := s39;
			deltaV_ft := subfpr;
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s38; end if;
	when s39 => state := s40;
		subfpsclr <= '0';
		divfpce <= '1';
		divfpa <= deltaV_ft;
		divfpb <= ExtractVDDParameters_kvdd;
		divfpond <= '1';
	when s40 =>
		if (divfprdy = '1') then state := s41;
			deltaV_ft := divfpr;
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s40; end if;
	when s41 => state := s44;
		divfpsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const3dot3 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const3dot3 (fracbs'high downto fracbs'low)), fracbs));
--	when s42 =>
--		if (fixed2floatrdy = '1') then state := s43;
--			const3dot3_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s42; end if;
--	when s43 => state := s44;
--		fixed2floatsclr <= '0';
		addfpce <= '1';
		addfpa <= deltaV_ft;
		addfpb <= const3dot3_ft;
		addfpond <= '1';
	when s44 =>
		if (addfprdy = '1') then state := s45;
			Vdd_ft := addfpr;
			--o_To <= addfpr;
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
		--vout2 := resize (ktptat, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (vptat25 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (vptat25 (fracbs'high downto fracbs'low)), fracbs));
	when s46 =>
		if (fixed2floatrdy = '1') then state := s47;
			vptat25_ft := fixed2floatr;
			--o_To <= fixed2floatr;
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
		--vout2 := resize (vptat, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (vptat (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (vptat (fracbs'high downto fracbs'low)), fracbs));
	when s48 =>
		if (fixed2floatrdy = '1') then state := s49;
			vptat_ft := fixed2floatr;
			--o_To <= fixed2floatr;
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
		--vout2 := resize (vbe, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (vbe (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (vbe (fracbs'high downto fracbs'low)), fracbs));
	when s50 =>
		if (fixed2floatrdy = '1') then state := s51;
			vbe_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s50; end if;
	when s51 => state := s63;
		fixed2floatsclr <= '0';
		--
		-- alphaptatee
--		eeprom16slv := i_ee0x2410 and x"f000";
--		alphaptatee := resize (to_sfixed (eeprom16slv, eeprom16sf), alphaptatee);
--		--vout2 := resize (alphaptatee, st_sfixed_max'high, st_sfixed_max'low);
--		alphaptatee := alphaptatee srl 12;
--		alphaptatee := resize (to_sfixed (to_slv (alphaptatee (3 downto 0)), sfixed4'high, sfixed4'low), alphaptatee);
--		--vout2 := resize (alphaptatee, st_sfixed_max'high, st_sfixed_max'low);
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (alphaptatee (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (alphaptatee (fracbs'high downto fracbs'low)), fracbs));
--	when s52 =>
--		if (fixed2floatrdy = '1') then state := s53;
--			alphaptatee_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s52; end if;
--	when s53 => state := s58;
--		fixed2floatsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const2pow2 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const2pow2 (fracbs'high downto fracbs'low)), fracbs));
--	when s54 =>
--		if (fixed2floatrdy = '1') then state := s55;
--			const2pow2_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s54; end if;
--	when s55 => state := s56;
--		fixed2floatsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const8 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const8 (fracbs'high downto fracbs'low)), fracbs));
--	when s56 =>
--		if (fixed2floatrdy = '1') then state := s57;
--			const8_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s56; end if;
--	when s57 => state := s58;
--		fixed2floatsclr <= '0';
--		divfpce <= '1';
--		divfpa <= alphaptatee_ft;
--		divfpb <= const2pow2_ft;
--		divfpond <= '1';
--	when s58 =>
--		if (divfprdy = '1') then state := s59;
--			alphaptat_ft := divfpr;
--			--o_To <= divfpr;
--			divfpce <= '0';
--			divfpond <= '0';
--			divfpsclr <= '1';
--		else state := s58; end if;
--	when s59 => state := s60;
--		divfpsclr <= '0';
--		addfpce <= '1';
--		addfpa <= alphaptat_ft;
--		addfpb <= const8_ft;
--		addfpond <= '1';
--	when s60 =>
--		if (addfprdy = '1') then state := s61;
--			alphaptat_ft := addfpr;
--			--o_To <= addfpr;
--			addfpce <= '0';
--			addfpond <= '0';
--			addfpsclr <= '1';
--		else state := s60; end if;
--	when s61 => state := s64;
--		addfpsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const2pow18 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const2pow18 (fracbs'high downto fracbs'low)), fracbs));
--	when s62 =>
--		if (fixed2floatrdy = '1') then state := s63;
--			const2pow18_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s62; end if;
	when s63 => state := s64;
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= vptat_ft;
		mulfpb <= ExtractAlphaPtatParameter_alphaptat;
		mulfpond <= '1';
	when s64 =>
		if (mulfprdy = '1') then state := s65;
			vptatart_ft := mulfpr;
			--o_To <= mulfpr;
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
			--o_To <= addfpr;
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
			--o_To <= divfpr;
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
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s70; end if;
	when s71 => state := s76;
		mulfpsclr <= '0';
		--
		-- Ta
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const1 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const1 (fracbs'high downto fracbs'low)), fracbs));
--	when s72 =>
--		if (fixed2floatrdy = '1') then state := s73;
--			const1_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s72; end if;
--	when s73 => state := s74;
--		fixed2floatsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const25 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const25 (fracbs'high downto fracbs'low)), fracbs));
--	when s74 =>
--		if (fixed2floatrdy = '1') then state := s75;
--			const25_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s74; end if;
--	when s75 => state := s76;
--		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= kvptat_ft;
		mulfpb <= deltaV_ft;
		mulfpond <= '1';
	when s76 =>
		if (mulfprdy = '1') then state := s77;
			Ta_ft := mulfpr;
			--o_To <= mulfpr;
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
			--o_To <= addfpr;
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
			--o_To <= divfpr;
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
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s82; end if;
	when s83 => state := s84;
		subfpsclr <= '0';
		divfpce <= '1';
		divfpa <= Ta_ft;
		divfpb <= ExtractKtPTATParameter_ktptat;
		divfpond <= '1';
	when s84 =>
		if (divfprdy = '1') then state := s85;
			Ta_ft := divfpr;
			--o_To <= divfpr;
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
			--o_To <= addfpr;
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
		--vout2 := resize (gain, st_sfixed_max'high, st_sfixed_max'low);
--		gain := resize (to_sfixed (to_slv (gain), sfixed16'high, sfixed16'low), gain);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (gain (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (gain (fracbs'high downto fracbs'low)), fracbs));
	when s88 =>
		if (fixed2floatrdy = '1') then state := s89;
			gain_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s88; end if;
	when s89 => state := s90;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2430 and x"ffff";
		Kgain := resize (to_sfixed (eeprom16slv, eeprom16sf), Kgain);
		--vout2 := resize (Kgain, st_sfixed_max'high, st_sfixed_max'low);
--		Kgain := resize (to_sfixed (to_slv (Kgain), sfixed16'high, sfixed16'low), Kgain);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (Kgain (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (Kgain (fracbs'high downto fracbs'low)), fracbs));
	when s90 =>
		if (fixed2floatrdy = '1') then state := s91;
			Kgain_ft := fixed2floatr;
			--o_To <= fixed2floatr;
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
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s92; end if;
	when s93 => state := s94;
		divfpsclr <= '0';
		eeprom16slv := i_ram0x056f and x"ffff";
		pixgain1216 := resize (to_sfixed (eeprom16slv, eeprom16sf), pixgain1216);
		--vout2 := resize (pixgain1216, st_sfixed_max'high, st_sfixed_max'low);
--		pixgain1216 := resize (to_sfixed (to_slv (pixgain1216), sfixed16'high, sfixed16'low), pixgain1216);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (pixgain1216 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (pixgain1216 (fracbs'high downto fracbs'low)), fracbs));
	when s94 =>
		if (fixed2floatrdy = '1') then state := s95;
			pixgain1216_ft := fixed2floatr;
			--o_To <= fixed2floatr;
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
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s96; end if;
	when s97 => state := s98;
		mulfpsclr <= '0';
		eeprom16slv := i_ee0x2411 and x"ffff";
		offsetaverage := resize (to_sfixed (eeprom16slv, eeprom16sf), offsetaverage);
		--vout2 := resize (offsetaverage, st_sfixed_max'high, st_sfixed_max'low);
--		offsetaverage := resize (to_sfixed (to_slv (offsetaverage), sfixed16'high, sfixed16'low), offsetaverage);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (offsetaverage (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (offsetaverage (fracbs'high downto fracbs'low)), fracbs));
	when s98 =>
		if (fixed2floatrdy = '1') then state := s99;
			offsetaverage_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s98; end if;
	when s99 => state := s100;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2414 and x"f000";
		occrow12 := resize (to_sfixed (eeprom16slv, eeprom16sf), occrow12);
		--vout2 := resize (occrow12, st_sfixed_max'high, st_sfixed_max'low);
		occrow12 := occrow12 srl 12;
		occrow12 := resize (to_sfixed (to_slv (occrow12 (3 downto 0)), sfixed4'high, sfixed4'low), occrow12);
		--vout2 := resize (occrow12, st_sfixed_max'high, st_sfixed_max'low);
--		occrow12 := resize (to_sfixed (to_slv (occrow12), sfixed16'high, sfixed16'low), occrow12);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (occrow12 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (occrow12 (fracbs'high downto fracbs'low)), fracbs));
	when s100 =>
		if (fixed2floatrdy = '1') then state := s101;
			occrow12_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s100; end if;
	when s101 => state := s102;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2410 and x"0f00";
		occscalerow := resize (to_sfixed (eeprom16slv, eeprom16sf), occscalerow);
		--vout2 := resize (occscalerow, st_sfixed_max'high, st_sfixed_max'low);
		occscalerow := occscalerow srl 8;
		occscalerow := resize (to_sfixed (to_slv (occscalerow (3 downto 0)), sfixed4'high, sfixed4'low), occscalerow);
		--vout2 := resize (occscalerow, st_sfixed_max'high, st_sfixed_max'low);
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
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s102; end if;
	when s103 => state := s104;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x241b and x"f000";
		occcolumn16 := resize (to_sfixed (eeprom16slv, eeprom16sf), occcolumn16);
		--vout2 := resize (occcolumn16, st_sfixed_max'high, st_sfixed_max'low);
		occcolumn16 := occcolumn16 srl 12;
		occcolumn16 := resize (to_sfixed (to_slv (occcolumn16 (3 downto 0)), sfixed4'high, sfixed4'low), occcolumn16);
		--vout2 := resize (occcolumn16, st_sfixed_max'high, st_sfixed_max'low);
--		occcolumn16 := resize (to_sfixed (to_slv (occcolumn16), sfixed16'high, sfixed16'low), occcolumn16);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (occcolumn16 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (occcolumn16 (fracbs'high downto fracbs'low)), fracbs));
	when s104 =>
		if (fixed2floatrdy = '1') then state := s105;
			occcolumn16_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s104; end if;
	when s105 => state := s106;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2410 and x"00f0";
		occscalecolumn := resize (to_sfixed (eeprom16slv, eeprom16sf), occscalecolumn);
		--vout2 := resize (occscalecolumn, st_sfixed_max'high, st_sfixed_max'low);
		occscalecolumn := occscalecolumn srl 4;
		occscalecolumn := resize (to_sfixed (to_slv (occscalecolumn (3 downto 0)), sfixed4'high, sfixed4'low), occscalecolumn);
		--vout2 := resize (occscalecolumn, st_sfixed_max'high, st_sfixed_max'low);
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
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s106; end if;
	when s107 => state := s108;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x25af and x"fc00";
		offset1216 := resize (to_sfixed (eeprom16slv, eeprom16sf), offset1216);
		--vout2 := resize (offset1216, st_sfixed_max'high, st_sfixed_max'low);
		offset1216 := offset1216 srl 10;
		offset1216 := resize (to_sfixed (to_slv (offset1216 (5 downto 0)), sfixed6'high, sfixed6'low), offset1216);
		--vout2 := resize (offset1216, st_sfixed_max'high, st_sfixed_max'low);
--		offset1216 := resize (to_sfixed (to_slv (offset1216), sfixed16'high, sfixed16'low), offset1216);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (offset1216 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (offset1216 (fracbs'high downto fracbs'low)), fracbs));
	when s108 =>
		if (fixed2floatrdy = '1') then state := s109;
			offset1216_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s108; end if;
	when s109 => state := s110;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2410 and x"000f";
		occscaleremnant := resize (to_sfixed (eeprom16slv, eeprom16sf), occscaleremnant);
		--vout2 := resize (occscaleremnant, st_sfixed_max'high, st_sfixed_max'low);
		occscaleremnant := resize (to_sfixed (to_slv (occscaleremnant (3 downto 0)), sfixed4'high, sfixed4'low), occscaleremnant);
		--vout2 := resize (occscaleremnant, st_sfixed_max'high, st_sfixed_max'low);
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
			--o_To <= fixed2floatr;
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
			--o_To <= mulfpr;
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
			--o_To <= mulfpr;
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
			--o_To <= mulfpr;
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
			--o_To <= addfpr;
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
			--o_To <= addfpr;
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
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s122; end if;
	when s123 => state := s124;
		addfpsclr <= '0';
		eeprom16slv := i_ee0x25af and x"000e";
		kta1216ee := resize (to_sfixed (eeprom16slv, eeprom16sf), kta1216ee);
		--vout2 := resize (kta1216ee, st_sfixed_max'high, st_sfixed_max'low);
		kta1216ee := kta1216ee srl 1;
		kta1216ee := resize (to_sfixed (to_slv (kta1216ee (2 downto 0)), sfixed3'high, sfixed3'low), kta1216ee);
		--vout2 := resize (kta1216ee, st_sfixed_max'high, st_sfixed_max'low);
--		kta1216ee := resize (to_sfixed (to_slv (kta1216ee), sfixed16'high, sfixed16'low), kta1216ee);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (kta1216ee (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (kta1216ee (fracbs'high downto fracbs'low)), fracbs));
	when s124 =>
		if (fixed2floatrdy = '1') then state := s125;
			kta1216ee_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s124; end if;
	when s125 => state := s126;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2437 and x"00ff";
		ktarcee := resize (to_sfixed (eeprom16slv, eeprom16sf), ktarcee);
		--vout2 := resize (ktarcee, st_sfixed_max'high, st_sfixed_max'low);
		ktarcee := resize (to_sfixed (to_slv (ktarcee (7 downto 0)), sfixed8'high, sfixed8'low), ktarcee);
		--vout2 := resize (ktarcee, st_sfixed_max'high, st_sfixed_max'low);
--		ktarcee := resize (to_sfixed (to_slv (ktarcee), sfixed16'high, sfixed16'low), ktarcee);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (ktarcee (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ktarcee (fracbs'high downto fracbs'low)), fracbs));
	when s126 =>
		if (fixed2floatrdy = '1') then state := s127;
			ktarcee_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s126; end if;
	when s127 => state := s128;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2438 and x"00f0";
		ktascale1 := resize (to_sfixed (eeprom16slv, eeprom16sf), ktascale1);
		--vout2 := resize (ktascale1, st_sfixed_max'high, st_sfixed_max'low);
		ktascale1 := ktascale1 srl 4;
		ktascale1 := resize (to_sfixed (to_slv (ktascale1 (3 downto 0)), sfixed4'high, sfixed4'low), ktascale1);
		--vout2 := resize (ktascale1, st_sfixed_max'high, st_sfixed_max'low);
--		ktascale1 := resize (to_sfixed (to_slv (ktascale1), sfixed16'high, sfixed16'low), ktascale1);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (ktascale1 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ktascale1 (fracbs'high downto fracbs'low)), fracbs));
	when s128 =>
		if (fixed2floatrdy = '1') then state := s129;
			ktascale1_ft := fixed2floatr;
			--o_To <= fixed2floatr;
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
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s130; end if;
	when s131 => state := s132;
		addfpsclr <= '0';
		eeprom16slv := i_ee0x2438 and x"000f";
		ktascale2 := resize (to_sfixed (eeprom16slv, eeprom16sf), ktascale2);
		--vout2 := resize (ktascale2, st_sfixed_max'high, st_sfixed_max'low);
		ktascale2 := resize (to_sfixed (to_slv (ktascale2 (3 downto 0)), sfixed4'high, sfixed4'low), ktascale2);
		--vout2 := resize (ktascale2, st_sfixed_max'high, st_sfixed_max'low);
--		ktascale2 := resize (to_sfixed (to_slv (ktascale2), sfixed16'high, sfixed16'low), ktascale2);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (ktascale2 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ktascale2 (fracbs'high downto fracbs'low)), fracbs));
	when s132 =>
		if (fixed2floatrdy = '1') then state := s133;
			ktascale2_ft := fixed2floatr;
			--o_To <= fixed2floatr;
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
			--vout2 := resize (ktascale1, st_sfixed_max'high, st_sfixed_max'low);
--			--o_To <= float2fixedr;
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
			--vout2 := resize (ktascale2, st_sfixed_max'high, st_sfixed_max'low);
--			--o_To <= float2fixedr;
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
--		--o_To <= mem_float2powerN_2powerN2;
		mulfpce <= '1';
		mulfpa <= kta1216ee_ft;
		mulfpb <= mem_float2powerN_2powerN2; -- 2^ktascale2
		mulfpond <= '1';
	when s140 =>
		if (mulfprdy = '1') then state := s141;
			kta1216_ft := mulfpr;
			--o_To <= mulfpr;
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
			--o_To <= addfpr;
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
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s144; end if;
	when s145 => state := s146;
		divfpsclr <= '0';
		eeprom16slv := i_ee0x2434 and x"000f";
		kv1216 := resize (to_sfixed (eeprom16slv, eeprom16sf), kv1216);
		--vout2 := resize (kv1216, st_sfixed_max'high, st_sfixed_max'low);
		kv1216 := resize (to_sfixed (to_slv (kv1216 (3 downto 0)), sfixed4'high, sfixed4'low), kv1216);
		--vout2 := resize (kv1216, st_sfixed_max'high, st_sfixed_max'low);
--		kv1216 := resize (to_sfixed (to_slv (kv1216), sfixed16'high, sfixed16'low), kv1216);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (kv1216 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (kv1216 (fracbs'high downto fracbs'low)), fracbs));
	when s146 =>
		if (fixed2floatrdy = '1') then state := s147;
			kv1216_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s146; end if;
	when s147 => state := s148;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2438 and x"0f00";
		kvscale := resize (to_sfixed (eeprom16slv, eeprom16sf), kvscale);
		--vout2 := resize (kvscale, st_sfixed_max'high, st_sfixed_max'low);
		kvscale := kvscale srl 8;
		--vout2 := resize (kvscale, st_sfixed_max'high, st_sfixed_max'low);
		kvscale := resize (to_sfixed (to_slv (kvscale (3 downto 0)), sfixed4'high, sfixed4'low), kvscale);
		--vout2 := resize (kvscale, st_sfixed_max'high, st_sfixed_max'low);
--		kvscale := resize (to_sfixed (to_slv (kvscale), sfixed16'high, sfixed16'low), kvscale);
		mem_float2powerN_N2 <= std_logic_vector (to_unsigned (to_integer (kvscale), 6));
	when s148 => state := s149;
		-- wait for data
		rdyrecover <= '1';
	when s149 => state := s150;
		rdyrecover <= '0';
		--o_To <= mem_float2powerN_2powerN2;
		divfpce <= '1';
		divfpa <= kv1216_ft;
		divfpb <= mem_float2powerN_2powerN2; -- 2^kvscale
		divfpond <= '1';
	when s150 =>
		if (divfprdy = '1') then state := s151;
			kv1216_ft := divfpr; -- 0.5
			--o_To <= divfpr;
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
			v0d_ft := subfpr;
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s152; end if;
	when s153 => state := s154;
		subfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= v0d_ft;
		mulfpb <= kv1216_ft;
		mulfpond <= '1';
	when s154 =>
		if (mulfprdy = '1') then state := s155;
			fttmp1_ft := mulfpr;
			--o_To <= mulfpr;
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
			--o_To <= addfpr;
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
			tad_ft := subfpr;
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s158; end if;
	when s159 => state := s160;
		subfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= tad_ft;
		mulfpb <= kta1216_ft;
		mulfpond <= '1';
	when s160 =>
		if (mulfprdy = '1') then state := s161;
			fttmp2_ft := mulfpr;
			--o_To <= mulfpr;
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
			--o_To <= addfpr;
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
			--o_To <= mulfpr;
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
			--o_To <= mulfpr;
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
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s168; end if;
	when s169 => state := s172;
		subfpsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (constemissivity (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (constemissivity (fracbs'high downto fracbs'low)), fracbs));
--	when s170 =>
--		if (fixed2floatrdy = '1') then state := s171;
--			constemissivity_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s170; end if;
--	when s171 => state := s172;
--		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= pixos1216_ft;
		divfpb <= constemissivity_ft;
		divfpond <= '1';
	when s172 =>
		if (divfprdy = '1') then state := s173;
			vir1216emissivitycompensated_ft := divfpr; -- 700.882
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s172; end if;
	when s173 => state := s174;
		divfpsclr <= '0';
		eeprom16slv := i_ram0x0708 and x"ffff";
		pixgaincpsp0 := resize (to_sfixed (eeprom16slv, eeprom16sf), pixgaincpsp0);
		--vout2 := resize (pixgaincpsp0, st_sfixed_max'high, st_sfixed_max'low);
--		pixgaincpsp0 := resize (to_sfixed (to_slv (pixgaincpsp0), sfixed16'high, sfixed16'low), pixgaincpsp0);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (pixgaincpsp0 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (pixgaincpsp0 (fracbs'high downto fracbs'low)), fracbs));
	when s174 =>
		if (fixed2floatrdy = '1') then state := s175;
			pixgaincpsp0_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s174; end if;
	when s175 => state := s176;
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= pixgaincpsp0_ft;
		mulfpb <= kgain_ft;
		mulfpond <= '1';
	when s176 =>
		if (mulfprdy = '1') then state := s177;
			pixgaincpsp0_ft := mulfpr; -- -54.946
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s176; end if;
	when s177 => state := s178;
		mulfpsclr <= '0';
		eeprom16slv := i_ram0x0728 and x"ffff";
		pixgaincpsp1 := resize (to_sfixed (eeprom16slv, eeprom16sf), pixgaincpsp1);
		--vout2 := resize (pixgaincpsp1, st_sfixed_max'high, st_sfixed_max'low);
--		pixgaincpsp1 := resize (to_sfixed (to_slv (pixgaincpsp1), sfixed16'high, sfixed16'low), pixgaincpsp1);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (pixgaincpsp1 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (pixgaincpsp1 (fracbs'high downto fracbs'low)), fracbs));
	when s178 =>
		if (fixed2floatrdy = '1') then state := s179;
			pixgaincpsp1_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s178; end if;
	when s179 => state := s180;
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= pixgaincpsp1_ft;
		mulfpb <= kgain_ft;
		mulfpond <= '1';
	when s180 =>
		if (mulfprdy = '1') then state := s181;
			pixgaincpsp1_ft := mulfpr; -- -56.981
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s180; end if;
	when s181 => state := s182;
		mulfpsclr <= '0';
		eeprom16slv := i_ee0x243a and x"03ff";
		offcpsubpage0 := resize (to_sfixed (eeprom16slv, eeprom16sf), offcpsubpage0);
		--vout2 := resize (offcpsubpage0, st_sfixed_max'high, st_sfixed_max'low);
		offcpsubpage0 := resize (to_sfixed (to_slv (offcpsubpage0 (9 downto 0)), sfixed10'high, sfixed10'low), offcpsubpage0);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (offcpsubpage0 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (offcpsubpage0 (fracbs'high downto fracbs'low)), fracbs));
	when s182 =>
		if (fixed2floatrdy = '1') then state := s183;
			offcpsubpage0_ft := fixed2floatr; -- -75
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s182; end if;
	when s183 => state := s184;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x243a and x"fc00";
		offcpsubpage1delta := resize (to_sfixed (eeprom16slv, eeprom16sf), offcpsubpage1delta);
		--vout2 := resize (offcpsubpage1delta, st_sfixed_max'high, st_sfixed_max'low);
		offcpsubpage1delta := offcpsubpage1delta srl 10;
		offcpsubpage1delta := resize (to_sfixed (to_slv (offcpsubpage1delta (5 downto 0)), sfixed6'high, sfixed6'low), offcpsubpage1delta);
		--vout2 := resize (offcpsubpage1delta, st_sfixed_max'high, st_sfixed_max'low);
--		offcpsubpage1delta := resize (to_sfixed (to_slv (offcpsubpage1delta), sfixed16'high, sfixed16'low), offcpsubpage1delta);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (offcpsubpage1delta (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (offcpsubpage1delta (fracbs'high downto fracbs'low)), fracbs));
	when s184 =>
		if (fixed2floatrdy = '1') then state := s185;
			offcpsubpage1delta_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s184; end if;
	when s185 => state := s186;
		fixed2floatsclr <= '0';
		addfpce <= '1';
		addfpa <= offcpsubpage0_ft;
		addfpb <= offcpsubpage1delta_ft;
		addfpond <= '1';
	when s186 =>
		if (addfprdy = '1') then state := s187;
			offcpsubpage1_ft := addfpr; -- -77
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s186; end if;
	when s187 => state := s188;
		addfpsclr <= '0';
		eeprom16slv := i_ee0x243b and x"00ff";
		ktacpee := resize (to_sfixed (eeprom16slv, eeprom16sf), ktacpee);
		--vout2 := resize (ktacpee, st_sfixed_max'high, st_sfixed_max'low);
		ktacpee := resize (to_sfixed (to_slv (ktacpee (7 downto 0)), sfixed8'high, sfixed8'low), ktacpee);
		--vout2 := resize (ktacpee, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (ktacpee (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ktacpee (fracbs'high downto fracbs'low)), fracbs));
	when s188 =>
		if (fixed2floatrdy = '1') then state := s189;
			ktacpee_ft := fixed2floatr; -- 75
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s188; end if;
	when s189 => state := s190;
		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= ktacpee_ft;
		divfpb <= mem_float2powerN_2powerN1; -- 2^ktascale1;
		divfpond <= '1';
	when s190 =>
		if (divfprdy = '1') then state := s191;
			ktacp_ft := divfpr; -- 0.004577
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s190; end if;
	when s191 => state := s192;
		eeprom16slv := i_ee0x243b and x"ff00";
		kvcpee := resize (to_sfixed (eeprom16slv, eeprom16sf), kvcpee);
		kvcpee := kvcpee srl 8;
		--vout2 := resize (kvcpee, st_sfixed_max'high, st_sfixed_max'low);
		ktacpee := resize (to_sfixed (to_slv (kvcpee (7 downto 0)), sfixed8'high, sfixed8'low), kvcpee);
		--vout2 := resize (kvcpee, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (kvcpee (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (kvcpee (fracbs'high downto fracbs'low)), fracbs));
	when s192 =>
		if (fixed2floatrdy = '1') then state := s193;
			kvcpee_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s192; end if;
	when s193 => state := s194;
		fixed2floatsclr <= '0';
		divfpsclr <= '0';
		divfpce <= '1';
		divfpa <= kvcpee_ft;
		divfpb <= mem_float2powerN_2powerN2; -- 2^kvscale
		divfpond <= '1';
	when s194 =>
		if (divfprdy = '1') then state := s195;
			kvcp_ft := divfpr;
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s194; end if;
	when s195 => state := s196;
		divfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= v0d_ft;
		mulfpb <= kvcp_ft;
		mulfpond <= '1';
	when s196 =>
		if (mulfprdy = '1') then state := s197;
			fttmp1_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s196; end if;
	when s197 => state := s198;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= fttmp1_ft;
		addfpb <= const1_ft;
		addfpond <= '1';
	when s198 =>
		if (addfprdy = '1') then state := s199;
			fttmp1_ft := addfpr;
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s198; end if;
	when s199 => state := s200;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= tad_ft;
		mulfpb <= ktacp_ft;
		mulfpond <= '1';
	when s200 =>
		if (mulfprdy = '1') then state := s201;
			fttmp2_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s200; end if;
	when s201 => state := s202;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= fttmp2_ft;
		addfpb <= const1_ft;
		addfpond <= '1';
	when s202 =>
		if (addfprdy = '1') then state := s203;
			fttmp2_ft := addfpr;
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s202; end if;
	when s203 => state := s204;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1_ft;
		mulfpb <= fttmp2_ft;
		mulfpond <= '1';
	when s204 =>
		if (mulfprdy = '1') then state := s205;
			fttmp1_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s204; end if;
	when s205 => state := s206;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= offcpsubpage0_ft;
		mulfpb <= fttmp1_ft;
		mulfpond <= '1';
	when s206 =>
		if (mulfprdy = '1') then state := s207;
			pixoscpsp0_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s206; end if;
	when s207 => state := s208;
		mulfpsclr <= '0';
		subfpce <= '1';
		subfpa <= pixgaincpsp0_ft;
		subfpb <= pixoscpsp0_ft;
		subfpond <= '1';
	when s208 =>
		if (subfprdy = '1') then state := s209;
			pixoscpsp0_ft := subfpr; -- 25.666657
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s208; end if;
	when s209 => state := s210;
		subfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1_ft;
		mulfpb <= offcpsubpage1_ft;
		mulfpond <= '1';
	when s210 =>
		if (mulfprdy = '1') then state := s211;
			pixoscpsp1_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s210; end if;
	when s211 => state := s212;
		mulfpsclr <= '0';
		subfpce <= '1';
		subfpa <= pixgaincpsp1_ft;
		subfpb <= pixoscpsp1_ft;
		subfpond <= '1';
	when s212 =>
		if (subfprdy = '1') then state := s213;
			pixoscpsp1_ft := subfpr;
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s212; end if;
	when s213 => state := s214;
		subfpsclr <= '0';
		eeprom16slv := i_ee0x243c and x"00ff";
		tgcee := resize (to_sfixed (eeprom16slv, eeprom16sf), tgcee);
		--vout2 := resize (tgcee, st_sfixed_max'high, st_sfixed_max'low);
		tgcee := resize (to_sfixed (to_slv (tgcee (7 downto 0)), sfixed8'high, sfixed8'low), tgcee);
		--vout2 := resize (tgcee, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (tgcee (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (tgcee (fracbs'high downto fracbs'low)), fracbs));
	when s214 =>
		if (fixed2floatrdy = '1') then state := s215;
			tgcee_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s214; end if;
	when s215 => state := s216;
		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= tgcee_ft;
		divfpb <= const2pow5_ft;
		divfpond <= '1';
	when s216 =>
		if (divfprdy = '1') then state := s217;
			tgc_ft := divfpr; -- 1
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s216; end if;
	when s217 => state := s218;
		divfpsclr <= '0';
	when s218 => state := s219;
		mem_switchpattern_pixel <= i_pixelpattern;
	when s219 => state := s220;
		-- wait for px pattern
	when s220 => state := s221;
		pattern_slv1(0) := mem_switchpattern_pattern;
		pattern := resize (to_sfixed ("0"&pattern_slv1, sfixed2'high, sfixed2'low), pattern);
		--vout2 := resize (pattern, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (pattern (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (pattern (fracbs'high downto fracbs'low)), fracbs));
	when s221 =>
		if (fixed2floatrdy = '1') then state := s222;
			pattern_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s221; end if;
	when s222 => state := s223;
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= pattern_ft;
		mulfpb <= pixoscpsp1_ft;
		mulfpond <= '1';
	when s223 =>
		if (mulfprdy = '1') then state := s224;
			fttmp1_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s223; end if;
	when s224 => state := s225;
		mulfpsclr <= '0';
		subfpce <= '1';
		subfpa <= const1_ft;
		subfpb <= pattern_ft;
		subfpond <= '1';
	when s225 =>
		if (subfprdy = '1') then state := s226;
			pattern_ft := subfpr;
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s225; end if;
	when s226 => state := s227;
		subfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= pattern_ft;
		mulfpb <= pixoscpsp0_ft;
		mulfpond <= '1';
	when s227 =>
		if (mulfprdy = '1') then state := s228;
			fttmp2_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s227; end if;
	when s228 => state := s229;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= fttmp1_ft;
		addfpb <= fttmp2_ft;
		addfpond <= '1';
	when s229 =>
		if (addfprdy = '1') then state := s230;
			vir1216compensated_ft := addfpr;
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s229; end if;
	when s230 => state := s231;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= vir1216compensated_ft;
		mulfpb <= tgc_ft;
		mulfpond <= '1';
	when s231 =>
		if (mulfprdy = '1') then state := s232;
			vir1216compensated_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s231; end if;
	when s232 => state := s233;
		mulfpsclr <= '0';
		subfpce <= '1';
		subfpa <= vir1216emissivitycompensated_ft;
		subfpb <= vir1216compensated_ft;
		subfpond <= '1';
	when s233 =>
		if (subfprdy = '1') then state := s234;
			vir1216compensated_ft := subfpr; -- 675.215, error on ds p.42 (679.250)
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s233; end if;
	when s234 => state := s235;
		subfpsclr <= '0';
		eeprom16slv := i_ee0x2420 and x"f000";
		ascalecp := resize (to_sfixed (eeprom16slv, eeprom16sf), ascalecp);
		--vout2 := resize (ascalecp, st_sfixed_max'high, st_sfixed_max'low);
		ascalecp := ascalecp srl 12;
		ascalecp := resize (to_sfixed (to_slv (ascalecp (3 downto 0)), sfixed4'high, sfixed4'low), ascalecp);
		--vout2 := resize (ascalecp, st_sfixed_max'high, st_sfixed_max'low);
--		ascalecp := resize (to_sfixed (to_slv (ascalecp), sfixed16'high, sfixed16'low), ascalecp);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (ascalecp (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ascalecp (fracbs'high downto fracbs'low)), fracbs));
	when s235 =>
		if (fixed2floatrdy = '1') then state := s236;
			ascalecp_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s235; end if;
	when s236 => state := s239;
		fixed2floatsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const27 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const27 (fracbs'high downto fracbs'low)), fracbs));
--	when s237 =>
--		if (fixed2floatrdy = '1') then state := s238;
--			const27_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s237; end if;
--	when s238 => state := s239;
--		fixed2floatsclr <= '0';
		addfpce <= '1';
		addfpa <= ascalecp_ft;
		addfpb <= const27_ft;
		addfpond <= '1';
	when s239 =>
		if (addfprdy = '1') then state := s240;
			ascalecp_ft := addfpr; -- 34
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s239; end if;
	when s240 => state := s241;
		addfpsclr <= '0';
		float2fixedce <= '1';
		float2fixedond <= '1';
		float2fixeda <= ascalecp_ft;
	when s241 =>
		if (float2fixedrdy = '1') then state := s242;
			ascalecp := to_sfixed (float2fixedr, st_sfixed_max'high, st_sfixed_max'low);
			--vout2 := resize (ascalecp, st_sfixed_max'high, st_sfixed_max'low);
			float2fixedce <= '0';
			float2fixedond <= '0';
			float2fixedsclr <= '1';
		else state := s241; end if;
	when s242 => state := s243;
		float2fixedsclr <= '0';
		mem_float2powerN_N1 <= std_logic_vector (to_unsigned (to_integer (ascalecp), 6));
	when s243 => state := s244;
		-- wait for 
	when s244 => state := s245;
		ascalecp_ft := mem_float2powerN_2powerN1; -- 2^ascalecp
		eeprom16slv := i_ee0x2439 and x"03ff";
		acpsubpage0 := resize (to_sfixed (eeprom16slv, eeprom16sf), acpsubpage0);
		--vout2 := resize (acpsubpage0, st_sfixed_max'high, st_sfixed_max'low);
		acpsubpage0 := resize (to_sfixed (to_slv (acpsubpage0 (9 downto 0)), sfixed10'high, sfixed10'low), acpsubpage0);
		--vout2 := resize (acpsubpage0, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (acpsubpage0 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (acpsubpage0 (fracbs'high downto fracbs'low)), fracbs));
	when s245 =>
		if (fixed2floatrdy = '1') then state := s246;
			acpsubpage0_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s245; end if;
	when s246 => state := s247;
		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= acpsubpage0_ft;
		divfpb <= ascalecp_ft;
		divfpond <= '1';
	when s247 =>
		if (divfprdy = '1') then state := s248;
			acpsubpage0_ft := divfpr;
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s247; end if;
	when s248 => state := s251;
		divfpsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const2pow7 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const2pow7 (fracbs'high downto fracbs'low)), fracbs));
--	when s249 =>
--		if (fixed2floatrdy = '1') then state := s250;
--			const2pow7_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s249; end if;
--	when s250 => state := s251;
--		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2439 and x"fc00";
		cpp1p0ratio := resize (to_sfixed (eeprom16slv, eeprom16sf), cpp1p0ratio);
		--vout2 := resize (cpp1p0ratio, st_sfixed_max'high, st_sfixed_max'low);
		cpp1p0ratio := cpp1p0ratio srl 10;
		cpp1p0ratio := resize (to_sfixed (to_slv (cpp1p0ratio (5 downto 0)), sfixed6'high, sfixed6'low), cpp1p0ratio);
		--vout2 := resize (cpp1p0ratio, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (cpp1p0ratio (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (cpp1p0ratio (fracbs'high downto fracbs'low)), fracbs));
	when s251 =>
		if (fixed2floatrdy = '1') then state := s252;
			cpp1p0ratio_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s251; end if;
	when s252 => state := s253;
		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= cpp1p0ratio_ft;
		divfpb <= const2pow7_ft;
		divfpond <= '1';
	when s253 =>
		if (divfprdy = '1') then state := s254;
			acpsubpage1_ft := divfpr;
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s253; end if;
	when s254 => state := s255;
		divfpsclr <= '0';
		addfpce <= '1';
		addfpa <= const1_ft;
		addfpb <= acpsubpage1_ft;
		addfpond <= '1';
	when s255 =>
		if (addfprdy = '1') then state := s256;
			acpsubpage1_ft := addfpr;
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s255; end if;
	when s256 => state := s257;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= acpsubpage1_ft;
		mulfpb <= acpsubpage0_ft;
		mulfpond <= '1';
	when s257 =>
		if (mulfprdy = '1') then state := s258;
			acpsubpage1_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s257; end if;
	when s258 => state := s262;
		mulfpsclr <= '0';
--		eeprom16slv := i_ee0x243c and x"ff00";
--		kstaee := resize (to_sfixed (eeprom16slv, eeprom16sf), kstaee);
--		--vout2 := resize (kstaee, st_sfixed_max'high, st_sfixed_max'low);
--		kstaee := kstaee srl 8;
--		kstaee := resize (to_sfixed (to_slv (kstaee (7 downto 0)), sfixed8'high, sfixed8'low), kstaee);
--		--vout2 := resize (kstaee, st_sfixed_max'high, st_sfixed_max'low);
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (kstaee (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (kstaee (fracbs'high downto fracbs'low)), fracbs));
--	when s259 =>
--		if (fixed2floatrdy = '1') then state := s260;
--			kstaee_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s259; end if;
--	when s260 => state := s261;
--		fixed2floatsclr <= '0';
--		divfpce <= '1';
--		divfpa <= kstaee_ft;
--		divfpb <= const2pow13_ft;
--		divfpond <= '1';
--	when s261 =>
--		if (divfprdy = '1') then state := s262;
--			ksta_ft := divfpr;
--			--o_To <= divfpr;
--			divfpce <= '0';
--			divfpond <= '0';
--			divfpsclr <= '1';
--		else state := s261; end if;
	when s262 => state := s263;
		divfpsclr <= '0';
		eeprom16slv := i_ee0x2421 and x"ffff";
		areference := resize (to_sfixed (eeprom16slv, eeprom16sf), areference);
		--vout2 := resize (areference, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (areference (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (areference (fracbs'high downto fracbs'low)), fracbs));
	when s263 =>
		if (fixed2floatrdy = '1') then state := s264;
			areference_ft := fixed2floatr; -- 12100
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s263; end if;
	when s264 => state := s267;
		fixed2floatsclr <= '0';
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (const30 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (const30 (fracbs'high downto fracbs'low)), fracbs));
--	when s265 =>
--		if (fixed2floatrdy = '1') then state := s266;
--			const30_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s265; end if;
--	when s266 => state := s267;
--		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2420 and x"f000"; -- val same as ascalecp ee0x2420&0xf000
		ascale := resize (to_sfixed (eeprom16slv, eeprom16sf), ascale);
		--vout2 := resize (ascale, st_sfixed_max'high, st_sfixed_max'low);
		ascale := ascale srl 12;
		ascale := resize (to_sfixed (to_slv (ascale (3 downto 0)), sfixed4'high, sfixed4'low), ascale);
		--vout2 := resize (ascale, st_sfixed_max'high, st_sfixed_max'low);
--		ascale := resize (to_sfixed (to_slv (ascale), sfixed16'high, sfixed16'low), ascale);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <=
		to_slv (to_sfixed (to_slv (ascale (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ascale (fracbs'high downto fracbs'low)), fracbs));
	when s267 =>
		if (fixed2floatrdy = '1') then state := s268;
			ascale_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s267; end if;
	when s268 => state := s269;
		fixed2floatsclr <= '0';
		addfpce <= '1';
		addfpa <= ascale_ft; -- prev val same as ascale ee0x2420&0xf000
		addfpb <= const30_ft;
		addfpond <= '1';
	when s269 =>
		if (addfprdy = '1') then state := s270;
			ascale_ft := addfpr; -- 37
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s269; end if;
	when s270 => state := s271;
		addfpsclr <= '0';
		float2fixedce <= '1';
		float2fixedond <= '1';
		float2fixeda <= ascale_ft;
	when s271 =>
		if (float2fixedrdy = '1') then state := s272;
			ascale := to_sfixed (float2fixedr, st_sfixed_max'high, st_sfixed_max'low);
			--vout2 := resize (ascale, st_sfixed_max'high, st_sfixed_max'low);
			float2fixedce <= '0';
			float2fixedond <= '0';
			float2fixedsclr <= '1';
		else state := s271; end if;
	when s272 => state := s273;
		float2fixedsclr <= '0';
		mem_float2powerN_N2 <= std_logic_vector (to_unsigned (to_integer (ascale), 6));
	when s273 => state := s274;
		--wait
	when s274 => state := s275;
		ascale_ft := mem_float2powerN_2powerN2; -- 2^ascale
		--o_To <= ascale_ft;
		eeprom16slv := i_ee0x2424 and x"f000";
		accrow12 := resize (to_sfixed (eeprom16slv, eeprom16sf), accrow12);
		--vout2 := resize (accrow12, st_sfixed_max'high, st_sfixed_max'low);
		accrow12 := accrow12 srl 12;
		accrow12 := resize (to_sfixed (to_slv (accrow12 (3 downto 0)), sfixed4'high, sfixed4'low), accrow12);
		--vout2 := resize (accrow12, st_sfixed_max'high, st_sfixed_max'low);
--		accrow12 := resize (to_sfixed (to_slv (accrow12), sfixed16'high, sfixed16'low), accrow12);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (accrow12 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (accrow12 (fracbs'high downto fracbs'low)), fracbs));
	when s275 =>
		if (fixed2floatrdy = '1') then state := s276;
			accrow12_ft := fixed2floatr; -- 3
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s275; end if;
	when s276 => state := s277;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x242b and x"f000";
		acccolumn16 := resize (to_sfixed (eeprom16slv, eeprom16sf), acccolumn16);
		--vout2 := resize (acccolumn16, st_sfixed_max'high, st_sfixed_max'low);
		acccolumn16 := acccolumn16 srl 12;
		acccolumn16 := resize (to_sfixed (to_slv (acccolumn16 (3 downto 0)), sfixed4'high, sfixed4'low), acccolumn16);
		--vout2 := resize (acccolumn16, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (acccolumn16 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (acccolumn16 (fracbs'high downto fracbs'low)), fracbs));
	when s277 =>
		if (fixed2floatrdy = '1') then state := s278;
			acccolumn16_ft := fixed2floatr; -- 3
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s277; end if;
	when s278 => state := s279;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x258f and x"03f0";
		apixel1216 := resize (to_sfixed (eeprom16slv, eeprom16sf), apixel1216);
		--vout2 := resize (apixel1216, st_sfixed_max'high, st_sfixed_max'low);
		apixel1216 := apixel1216 srl 4;
		apixel1216 := resize (to_sfixed (to_slv (apixel1216 (5 downto 0)), sfixed6'high, sfixed6'low), apixel1216);
		--vout2 := resize (apixel1216, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (apixel1216 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (apixel1216 (fracbs'high downto fracbs'low)), fracbs));
	when s279 =>
		if (fixed2floatrdy = '1') then state := s280;
			apixel1216_ft := fixed2floatr; -- 10
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s279; end if;
	when s280 => state := s281;
		fixed2floatsclr <= '0';
		eeprom16slv := i_ee0x2420 and x"0f00";
		accscalerow := resize (to_ufixed (eeprom16slv, eeprom16uf), accscalerow);
		--vout3 := resize (accscalerow, st_ufixed_max'high, st_ufixed_max'low);
		accscalerow := accscalerow srl 8;
		accscalerow := resize (to_ufixed (to_slv (accscalerow (3 downto 0)), ufixed4'high, ufixed4'low), accscalerow);
		--vout3 := resize (accscalerow, st_ufixed_max'high, st_ufixed_max'low);
		mem_float2powerN_N1 <= std_logic_vector (to_unsigned (to_integer (accscalerow), 6)); -- 9
	when s281 => state := s282;
		-- wait
	when s282 => state := s283;
		accscalerow_ft := mem_float2powerN_2powerN1; -- 2^accscalerow 512
		--o_To <= accscalerow_ft;
		eeprom16slv := i_ee0x2420 and x"00f0";
		accscalecolumn := resize (to_ufixed (eeprom16slv, eeprom16uf), accscalecolumn);
		--vout3 := resize (accscalecolumn, st_ufixed_max'high, st_ufixed_max'low);
		accscalecolumn := accscalecolumn srl 4;
		accscalecolumn := resize (to_ufixed (to_slv (accscalecolumn (3 downto 0)), ufixed4'high, ufixed4'low), accscalecolumn);
		--vout3 := resize (accscalecolumn, st_ufixed_max'high, st_ufixed_max'low);
		mem_float2powerN_N2 <= std_logic_vector (to_unsigned (to_integer (accscalecolumn), 6)); -- 10
	when s283 => state := s284;
		-- wait
	when s284 => state := s285;
		accscalecolumn_ft := mem_float2powerN_2powerN2; -- 2^accscalecolumn 1024
		--o_To <= accscalecolumn_ft;
		eeprom16slv := i_ee0x2420 and x"000f";
		accscaleremnant := resize (to_ufixed (eeprom16slv, eeprom16uf), accscaleremnant);
		--vout3 := resize (accscaleremnant, st_ufixed_max'high, st_ufixed_max'low);
		accscaleremnant := resize (to_ufixed (to_slv (accscaleremnant (3 downto 0)), ufixed4'high, ufixed4'low), accscaleremnant);
		--vout3 := resize (accscaleremnant, st_ufixed_max'high, st_ufixed_max'low);
		mem_float2powerN_N1 <= std_logic_vector (to_unsigned (to_integer (accscaleremnant), 6)); -- 6
	when s285 => state := s286;
		-- wait
	when s286 => state := s287;
		accscaleremnant_ft := mem_float2powerN_2powerN1; -- 2^accscaleremnant 64
		--o_To <= accscaleremnant_ft;
		mulfpce <= '1';
		mulfpa <= apixel1216_ft;
		mulfpb <= accscaleremnant_ft;
		mulfpond <= '1';
	when s287 =>
		if (mulfprdy = '1') then state := s288;
			fttmp1_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s287; end if;
	when s288 => state := s289;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= acccolumn16_ft;
		mulfpb <= accscalecolumn_ft;
		mulfpond <= '1';
	when s289 =>
		if (mulfprdy = '1') then state := s290;
			fttmp2_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s289; end if;
	when s290 => state := s291;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= fttmp1_ft;
		addfpb <= fttmp2_ft;
		addfpond <= '1';
	when s291 =>
		if (addfprdy = '1') then state := s292;
			fttmp1_ft := addfpr;
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s291; end if;
	when s292 => state := s293;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= accrow12_ft;
		mulfpb <= accscalerow_ft;
		mulfpond <= '1';
	when s293 =>
		if (mulfprdy = '1') then state := s294;
			fttmp2_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s293; end if;
	when s294 => state := s295;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= fttmp1_ft;
		addfpb <= fttmp2_ft;
		addfpond <= '1';
	when s295 =>
		if (addfprdy = '1') then state := s296;
			a1216_ft := addfpr;
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s295; end if;
	when s296 => state := s297;
		addfpsclr <= '0';
		addfpce <= '1';
		addfpa <= a1216_ft;
		addfpb <= areference_ft;
		addfpond <= '1';
	when s297 =>
		if (addfprdy = '1') then state := s298;
			a1216_ft := addfpr;
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s297; end if;
	when s298 => state := s299;
		addfpsclr <= '0';
		divfpce <= '1';
		divfpa <= a1216_ft;
		divfpb <= ascale_ft;
		divfpond <= '1';
	when s299 =>
		if (divfprdy = '1') then state := s300;
			a1216_ft := divfpr; -- 1.26223312690854e-07
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s299; end if;
	when s300 => state := s301;
		divfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= pattern_ft;
		mulfpb <= acpsubpage0_ft;
		mulfpond <= '1';
	when s301 =>
		if (mulfprdy = '1') then state := s302;
			fttmp1_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s301; end if;
	when s302 => state := s303;
		mulfpsclr <= '0';
		subfpce <= '1';
		subfpa <= pattern_ft;
		subfpb <= const1_ft;
		subfpond <= '1';
	when s303 =>
		if (subfprdy = '1') then state := s304;
			pattern_ft := subfpr;
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s303; end if;
	when s304 => state := s305;
		subfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= pattern_ft;
		mulfpb <= acpsubpage1_ft;
		mulfpond <= '1';
	when s305 =>
		if (mulfprdy = '1') then state := s306;
			fttmp2_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s305; end if;
	when s306 => state := s307;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= fttmp1_ft;
		addfpb <= fttmp2_ft;
		addfpond <= '1';
	when s307 =>
		if (addfprdy = '1') then state := s308;
			acomp1216_ft := addfpr;
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s307; end if;
	when s308 => state := s309;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= acomp1216_ft;
		mulfpb <= tgc_ft;
		mulfpond <= '1';
	when s309 =>
		if (mulfprdy = '1') then state := s310;
			acomp1216_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s309; end if;
	when s310 => state := s311;
		mulfpsclr <= '0';
		subfpce <= '1';
		subfpa <= a1216_ft;
		subfpb <= acomp1216_ft;
		subfpond <= '1';
	when s311 =>
		if (subfprdy = '1') then state := s312;
			acomp1216_ft := subfpr;
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s311; end if;
	when s312 => state := s313;
		subfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= tad_ft;
		mulfpb <= ExtractKsTaParameters_ksta;
		mulfpond <= '1';
	when s313 =>
		if (mulfprdy = '1') then state := s314;
			fttmp1_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s313; end if;
	when s314 => state := s315;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= fttmp1_ft;
		addfpb <= const1_ft;
		addfpond <= '1';
	when s315 =>
		if (addfprdy = '1') then state := s316;
			fttmp1_ft := addfpr;
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s315; end if;
	when s316 => state := s317;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1_ft;
		mulfpb <= acomp1216_ft;
		mulfpond <= '1';
	when s317 =>
		if (mulfprdy = '1') then state := s318;
			acomp1216_ft := mulfpr;
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s317; end if;
	when s318 => state := s319;
		mulfpsclr <= '0';
		eeprom16slv := i_ee0x243d and x"ff00";
		ksto2ee := resize (to_sfixed (eeprom16slv, eeprom16sf), ksto2ee);
		--vout2 := resize (ksto2ee, st_sfixed_max'high, st_sfixed_max'low);
		ksto2ee := ksto2ee srl 8;
		--vout2 := resize (ksto2ee, st_sfixed_max'high, st_sfixed_max'low);
		ksto2ee := resize (to_sfixed (to_slv (ksto2ee (7 downto 0)), sfixed8'high, sfixed8'low), ksto2ee);
		--vout2 := resize (ksto2ee, st_sfixed_max'high, st_sfixed_max'low);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (ksto2ee (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (ksto2ee (fracbs'high downto fracbs'low)), fracbs));
	when s319 =>
		if (fixed2floatrdy = '1') then state := s320;
			ksto2ee_ft := fixed2floatr;
			--o_To <= fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s319; end if;
	when s320 => state := s328;
		fixed2floatsclr <= '0';
--		eeprom16slv := i_ee0x243f and x"000f";
--		kstoscale := resize (to_ufixed (eeprom16slv, eeprom16uf), kstoscale);
--		--vout3 := resize (kstoscale, st_ufixed_max'high, st_ufixed_max'low);
--		kstoscale := resize (to_ufixed (to_slv (kstoscale (3 downto 0)), ufixed4'high, ufixed4'low), kstoscale);
--		--vout3 := resize (kstoscale, st_ufixed_max'high, st_ufixed_max'low);
--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_ufixed (to_slv (kstoscale (fracau'high downto fracau'low)), fracau)) & 
--		to_slv (to_ufixed (to_slv (kstoscale (fracbu'high downto fracbu'low)), fracbu));
--	when s321 =>
--		if (fixed2floatrdy = '1') then state := s322;
--			kstoscale_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s321; end if;
--	when s322 => state := s323;
--		fixed2floatsclr <= '0';
--		addfpce <= '1';
--		addfpa <= kstoscale_ft;
--		addfpb <= const8_ft;
--		addfpond <= '1';
--	when s323 =>
--		if (addfprdy = '1') then state := s324;
--			kstoscale_ft := addfpr;
--			--o_To <= addfpr;
--			addfpce <= '0';
--			addfpond <= '0';
--			addfpsclr <= '1';
--		else state := s323; end if;
--	when s324 => state := s325;
--		addfpsclr <= '0';
--		float2fixedce <= '1';
--		float2fixedond <= '1';
--		float2fixeda <= kstoscale_ft;
--	when s325 =>
--		if (float2fixedrdy = '1') then state := s326;
--			kstoscale := to_ufixed (float2fixedr, st_ufixed_max'high, st_ufixed_max'low);
----			--vout2 := resize (kstoscale, st_ufixed_max'high, st_ufixed_max'low);
--			--vout3 := resize (kstoscale, --vout3);
--			float2fixedce <= '0';
--			float2fixedond <= '0';
--			float2fixedsclr <= '1';
--		else state := s325; end if;
--	when s326 => state := s327;
--		float2fixedsclr <= '0';
--		mem_float2powerN_N1 <= std_logic_vector (to_unsigned (to_integer (kstoscale), 6)); -- 17
--	when s327 => state := s328;
--		-- wait
	when s328 => state := s329;
--		kstoscale_ft := mem_float2powerN_2powerN1; -- 2^kstoscale 2^17
		--o_To <= accscalecolumn_ft;
		divfpce <= '1';
		divfpa <= ksto2ee_ft;
		divfpb <= ExtractKsToScaleParameter_kstoscale;
		divfpond <= '1';
	when s329 =>
		if (divfprdy = '1') then state := s330;
			ksto2_ft := divfpr; -- -0.00080108642578125
			--o_To <= divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s329; end if;
	when s330 => state := s333;
		divfpsclr <= '0';

--		fixed2floatce <= '1';
--		fixed2floatond <= '1';
--		fixed2floata <= 
--		to_slv (to_sfixed (to_slv (k27315 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (k27315 (fracbs'high downto fracbs'low)), fracbs));
--	when s331 =>
--		if (fixed2floatrdy = '1') then state := s332;
--			k27315_ft := fixed2floatr;
--			--o_To <= fixed2floatr;
--			fixed2floatce <= '0';
--			fixed2floatond <= '0';
--			fixed2floatsclr <= '1';
--		else state := s331; end if;
--	when s332 => state := s333;
--		fixed2floatsclr <= '0';

		addfpce <= '1';
		addfpa <= ta_ft;
		addfpb <= k27315_ft;
		addfpond <= '1';
	when s333 =>
		if (addfprdy = '1') then state := s334;
			fttmp1_ft := addfpr; -- 312.334
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s333; end if;
	when s334 => state := s335;
		addfpsclr <= '0';

		mulfpce <= '1';
		mulfpa <= fttmp1_ft;
		mulfpb <= fttmp1_ft;
		mulfpond <= '1';
	when s335 =>
		if (mulfprdy = '1') then state := s336;
			fttmp2_ft := mulfpr; -- 312.334 ^2
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s335; end if;
	when s336 => state := s337;
		mulfpsclr <= '0';

		mulfpce <= '1';
		mulfpa <= fttmp2_ft;
		mulfpb <= fttmp1_ft;
		mulfpond <= '1';
	when s337 =>
		if (mulfprdy = '1') then state := s338;
			fttmp2_ft := mulfpr; -- 312.334 ^3
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s337; end if;
	when s338 => state := s339;
		mulfpsclr <= '0';

		mulfpce <= '1';
		mulfpa <= fttmp2_ft;
		mulfpb <= fttmp1_ft;
		mulfpond <= '1';
	when s339 =>
		if (mulfprdy = '1') then state := s340;
			tak4_ft := mulfpr; -- 312.334 ^4 9516495632.56
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s339; end if;
	when s340 => state := s341;
		mulfpsclr <= '0';
		
		subfpce <= '1';
		subfpa <= ta_ft;
		subfpb <= const8_ft;
		subfpond <= '1';
	when s341 =>
		if (subfprdy = '1') then state := s342;
			trk4_ft := subfpr;
			--o_To <= subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s341; end if;
	when s342 => state := s343;
		subfpsclr <= '0';
		
				addfpce <= '1';
		addfpa <= trk4_ft;
		addfpb <= k27315_ft;
		addfpond <= '1';
	when s343 =>
		if (addfprdy = '1') then state := s344;
			fttmp1_ft := addfpr; -- ta-8+273.15
			--o_To <= addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s343; end if;
	when s344 => state := s345;
		addfpsclr <= '0';
		
				mulfpce <= '1';
		mulfpa <= fttmp1_ft;
		mulfpb <= fttmp1_ft;
		mulfpond <= '1';
	when s345 =>
		if (mulfprdy = '1') then state := s346;
			fttmp2_ft := mulfpr; -- trk4^2 
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s345; end if;
	when s346 => state := s347;
		mulfpsclr <= '0';

				mulfpce <= '1';
		mulfpa <= fttmp2_ft;
		mulfpb <= fttmp1_ft;
		mulfpond <= '1';
	when s347 =>
		if (mulfprdy = '1') then state := s348;
			fttmp2_ft := mulfpr; -- trk4^3
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s347; end if;
	when s348 => state := s349;
		mulfpsclr <= '0';

				mulfpce <= '1';
		mulfpa <= fttmp2_ft;
		mulfpb <= fttmp1_ft;
		mulfpond <= '1';
	when s349 =>
		if (mulfprdy = '1') then state := s350;
			trk4_ft := mulfpr; -- trk4^4 8557586214.66
			--o_To <= mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s349; end if;
	when s350 => state := s351;
		mulfpsclr <= '0';
		-- xxx when emissivity=1 then tar=tak4 else tar=trk4-((trk4-tak4)/emissivity)
		


		
					mulfpa <= acomp1216_ft;
					mulfpb <= acomp1216_ft;
					mulfpce <= '1';
					mulfpond <= '1';
				when s351 =>
					if (mulfprdy = '1') then state := s352;
						fttmp1_ft := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s351; end if;
				when s352 => state := s353;
					mulfpsclr <= '0';
					

					mulfpce <= '1';
					mulfpa <= fttmp1_ft;
					mulfpb <= acomp1216_ft;
					mulfpond <= '1';
				when s353 =>
					if (mulfprdy = '1') then state := s354;
						acomp1216_pow3_ft := mulfpr; -- acomp**3 float
						--o_To <= mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s353; end if;
				when s354 => state := s355;
					mulfpsclr <= '0';
					

					mulfpce <= '1';
					mulfpa <= acomp1216_pow3_ft;
					mulfpb <= acomp1216_ft;
					mulfpond <= '1';
				when s355 =>
					if (mulfprdy = '1') then state := s356;
						acomp1216_pow4_ft := mulfpr; -- acomp**4 float
						--o_To <= mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s355; end if;
				when s356 => state := s357;
					mulfpsclr <= '0';



					mulfpce <= '1';
					mulfpa <= acomp1216_pow3_ft;
					mulfpb <= vir1216compensated_ft;
					mulfpond <= '1';
				when s357 =>
					if (mulfprdy = '1') then state := s358;
						fttmp1_ft := mulfpr; -- acomp**3*vircomp float
						--o_To <= mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s357; end if;
				when s358 => state := s359;
					mulfpsclr <= '0';



					mulfpce <= '1';
					mulfpa <= acomp1216_pow4_ft;
					mulfpb <= tak4_ft;
					mulfpond <= '1';
				when s359 =>
					if (mulfprdy = '1') then state := s360;
						fttmp2_ft := mulfpr; -- acomp**4*tak4 float , tar=tak , emissivity=1
						--o_To <= fttmp2_ft;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s359; end if;
				when s360 => state := s361;
					mulfpsclr <= '0';
					
--																			report "aaaaaaaaaaaaaa" severity failure;

					addfpce <= '1';
					addfpa <= fttmp1_ft;
					addfpb <= fttmp2_ft;
					addfpond <= '1';
				when s361 =>
					if (addfprdy = '1') then state := s362;
						fttmp1_ft := addfpr; -- (acomp1216^3*vir1216compensated)+(acomp1216^4*tar) float , tar=tak4
						--o_To <= addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s361; end if;
				when s362 => state := s363;
					addfpsclr <= '0';
					
					
					sqrtfp2ce <= '1';
					sqrtfp2a <= fttmp1_ft;
					sqrtfp2ond <= '1';
				when s363 =>
					if (sqrtfp2rdy = '1') then state := s364;
						fttmp1_ft := sqrtfp2r; -- sqrt2(acomp+ta) float
						--o_To <= fttmp1_ft;
						sqrtfp2ce <= '0';
						sqrtfp2ond <= '0';
						sqrtfp2sclr <= '1';
					else state := s363; end if;
				when s364 => state := s365;
					sqrtfp2sclr <= '0';
					sqrtfp2ce <= '1';
					sqrtfp2a <= fttmp1_ft;
					sqrtfp2ond <= '1';
				when s365 =>
					if (sqrtfp2rdy = '1') then state := s366;
						fttmp1_ft := sqrtfp2r; -- sqrt2(sqrt2(acomp+ta)) float
						--o_To <= fttmp1_ft;
						sqrtfp2ce <= '0';
						sqrtfp2ond <= '0';
						sqrtfp2sclr <= '1';
					else state := s365; end if;
				when s366 => state := s367;
					sqrtfp2sclr <= '0';



					mulfpce <= '1';
					mulfpa <= fttmp1_ft;
					mulfpb <= ksto2_ft;
					mulfpond <= '1';
				when s367 =>
					if (mulfprdy = '1') then state := s368;
--						sx1216 := mulfpr; -- sqrt4(acomp*ta)*ksto2 float
						fttmp1_ft := mulfpr; -- sqrt4(acomp*ta)*ksto2 float
						--o_To <= fttmp1_ft;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s367; end if;
				when s368 => state := s369;
					mulfpsclr <= '0';

					mulfpce <= '1';
					mulfpa <= ksto2_ft;
					mulfpb <= k27315_ft;
					mulfpond <= '1';
				when s369 =>
					if (mulfprdy = '1') then state := s370;
						fttmp2_ft := mulfpr;
						--o_To <= mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s369; end if;
				when s370 => state := s371;
					mulfpsclr <= '0';

					subfpce <= '1';
					subfpa <= const1_ft;
					subfpb <= fttmp2_ft;
					subfpond <= '1';
				when s371 =>
					if (subfprdy = '1') then state := s372;
						fttmp2_ft := subfpr;
						--o_To <= subfpr;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else state := s371; end if;
				when s372 => state := s373;
					subfpsclr <= '0';

					mulfpce <= '1';
					mulfpa <= acomp1216_ft;
					mulfpb <= fttmp2_ft;
					mulfpond <= '1';
				when s373 =>
					if (mulfprdy = '1') then state := s374;
						fttmp2_ft := mulfpr;
						--o_To <= fttmp2_ft;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s373; end if;
				when s374 => state := s375;
					mulfpsclr <= '0';

					addfpce <= '1';
					addfpa <= fttmp1_ft;
					addfpb <= fttmp2_ft;
					addfpond <= '1';
				when s375 =>
					if (addfprdy = '1') then state := s376;
						fttmp1_ft := addfpr; -- +sx1216
						--o_To <= fttmp1_ft;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s375; end if;
				when s376 => state := s377;
					addfpsclr <= '0';

					divfpce <= '1';
					divfpa <= vir1216compensated_ft;
					divfpb <= fttmp1_ft;
					divfpond <= '1';
				when s377 =>
					if (divfprdy = '1') then state := s378;
						fttmp1_ft := divfpr;
						--report "vircomp/(acomp*(1-ksto2*273.15)+Sx) real " & real'image (ap_slv2fp (ksto2_f));
						--o_To <= fttmp1_ft;
						divfpce <= '0';
						divfpond <= '0';
						divfpsclr <= '1';
					else state := s377; end if;
				when s378 => state := s379;
					divfpsclr <= '0';

					addfpce <= '1';
					addfpa <= fttmp1_ft;
					addfpb <= tak4_ft;
					addfpond <= '1';
				when s379 =>
					if (addfprdy = '1') then state := s380;
						fttmp1_ft := addfpr;
						--report "vircomp/(acomp*(1-ksto2*273.15)+Sx)+ta real " & real'image (ap_slv2fp (ksto2_f));
						--o_To <= fttmp1_ft;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s379; end if;
				when s380 => state := s381;
					addfpsclr <= '0';

					sqrtfp2ce <= '1';
					sqrtfp2a <= fttmp1_ft;
					sqrtfp2ond <= '1';
				when s381 =>
					if (sqrtfp2rdy = '1') then state := s382;
						fttmp1_ft := sqrtfp2r;
						--report "sqrt(vircomp/(acomp*(1-ksto2*273.15)+Sx)+ta) real " & real'image (ap_slv2fp (ksto2_f));
						--o_To <= fttmp1_ft;
						sqrtfp2ce <= '0';
						sqrtfp2ond <= '0';
						sqrtfp2sclr <= '1';
					else state := s381; end if;
				when s382 => state := s383;
					sqrtfp2sclr <= '0';

					sqrtfp2ce <= '1';
					sqrtfp2a <= fttmp1_ft;
					sqrtfp2ond <= '1';
				when s383 =>
					if (sqrtfp2rdy = '1') then state := s384;
						fttmp1_ft := sqrtfp2r;
						--report "sqrt(sqrt(vircomp/(acomp*(1-ksto2*273.15)+Sx)+ta)) real " & real'image (ap_slv2fp (ksto2_f));
						--o_To <= fttmp1_ft;
						sqrtfp2ce <= '0';
						sqrtfp2ond <= '0';
						sqrtfp2sclr <= '1';
					else state := s383; end if;
				when s384 => state := s385;
					sqrtfp2sclr <= '0';

					subfpce <= '1';
					subfpa <= fttmp1_ft;
					subfpb <= k27315_ft;
					subfpond <= '1';
				when s385 =>
					if (subfprdy = '1') then state := s386;
						fttmp1_ft := subfpr;
						--report "sqrt(sqrt(vircomp/(acomp*(1-ksto2*273.15)+Sx)+ta))-273.15 real " & real'image (ap_slv2fp (ksto2_f));
						--o_To <= fttmp1_ft;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else state := s385; end if;
				when s386 => state := s387;
					subfpsclr <= '0';
					outTo := fttmp1_ft;
				when s387 => state := idle;
--					report "end calc" severity failure;



-----

when others => null;
end case; o_To <= outTo; end if; end if;
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
--operation_rfd => float2fixedorfd,
clk => float2fixedclk,
sclr => float2fixedsclr,
ce => float2fixedce,
result => float2fixedr,
--overflow => float2fixedof,
--invalid_op => float2fixediop,
rdy => float2fixedrdy
);

inst_ff2 : fixed2float
PORT MAP (
a => fixed2floata,
operation_nd => fixed2floatond,
--operation_rfd => fixed2floatorfd,
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
--operation_rfd => divfporfd,
clk => divfpclk,
sclr => divfpsclr,
ce => divfpce,
result => divfpr,
--underflow => divfpuf,
--overflow => divfpof,
--invalid_op => divfpiop,
--divide_by_zero => divfpdz,
rdy => divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => mulfpa,
b => mulfpb,
operation_nd => mulfpond,
--operation_rfd => mulfporfd,
clk => mulfpclk,
sclr => mulfpsclr,
ce => mulfpce,
result => mulfpr,
--underflow => mulfpuf,
--overflow => mulfpof,
--invalid_op => mulfpiop,
rdy => mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => addfpa,
b => addfpb,
operation_nd => addfpond,
--operation_rfd => addfporfd,
clk => addfpclk,
sclr => addfpsclr,
ce => addfpce,
result => addfpr,
--underflow => addfpuf,
--overflow => addfpof,
--invalid_op => addfpiop,
rdy => addfprdy
);

inst_subfp : subfp
PORT MAP (
a => subfpa,
b => subfpb,
operation_nd => subfpond,
--operation_rfd => subfporfd,
clk => subfpclk,
sclr => subfpsclr,
ce => subfpce,
result => subfpr,
--underflow => subfpuf,
--overflow => subfpof,
--invalid_op => subfpiop,
rdy => subfprdy
);

inst_sqrtfp2 : sqrtfp2
PORT MAP (
a => sqrtfp2a,
operation_nd => sqrtfp2ond,
--operation_rfd => sqrtfp2orfd,
clk => sqrtfp2clk,
sclr => sqrtfp2sclr,
ce => sqrtfp2ce,
result => sqrtfp2r,
--invalid_op => sqrtfp2iop,
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

mem_switchpattern_clock <= i_clock;

inst_mem_switchpattern : mem_switchpattern
port map (
i_clock => mem_switchpattern_clock,
i_reset => mem_switchpattern_reset,
i_pixel => mem_switchpattern_pixel,
o_pattern => mem_switchpattern_pattern
);

ExtractVDDParameters_clock <= i_clock;
ExtractVDDParameters_reset <= i_reset;
ExtractVDDParameters_ee0x2433 <= i_ee0x2433;
inst_ExtractVDDParameters : ExtractVDDParameters
port map (
i_clock => ExtractVDDParameters_clock,
i_reset => ExtractVDDParameters_reset,
i_ee0x2433 => ExtractVDDParameters_ee0x2433,
o_kvdd => ExtractVDDParameters_kvdd,
o_vdd25 => ExtractVDDParameters_vdd25
);

ExtractAlphaPtatParameter_clock <= i_clock;
ExtractAlphaPtatParameter_reset <= i_reset;
ExtractAlphaPtatParameter_ee0x2410 <= i_ee0x2410;
inst_ExtractAlphaPtatParameter : ExtractAlphaPtatParameter
port map (
i_clock => ExtractAlphaPtatParameter_clock,
i_reset => ExtractAlphaPtatParameter_reset,
i_ee0x2410 => ExtractAlphaPtatParameter_ee0x2410,
o_alphaptat => ExtractAlphaPtatParameter_alphaptat
);

inst_ExtractCT34Parameter : ExtractCT34Parameter PORT MAP (
i_clock => ExtractCT34Parameter_clock,
i_reset => ExtractCT34Parameter_reset,
i_ee0x243f => ExtractCT34Parameter_ee0x243f,
o_ct3 => ExtractCT34Parameter_ct3,
o_ct4 => ExtractCT34Parameter_ct4
);

ExtractKsTaParameters_clock <= i_clock;
ExtractKsTaParameters_reset <= i_reset;
ExtractKsTaParameters_ee0x243c <= i_ee0x243c;
inst_ExtractKsTaParameters : ExtractKsTaParameters PORT MAP (
i_clock => ExtractKsTaParameters_clock,
i_reset => ExtractKsTaParameters_reset,
i_ee0x243c => ExtractKsTaParameters_ee0x243c,
o_ksta => ExtractKsTaParameters_ksta
);

ExtractKsToScaleParameter_clock <= i_clock;
ExtractKsToScaleParameter_reset <= i_reset;
ExtractKsToScaleParameter_ee0x243f <= i_ee0x243f;
inst_ExtractKsToScaleParameter : ExtractKsToScaleParameter PORT MAP (
i_clock => ExtractKsToScaleParameter_clock,
i_reset => ExtractKsToScaleParameter_reset,
i_ee0x243f => ExtractKsToScaleParameter_ee0x243f,
o_kstoscale => ExtractKsToScaleParameter_kstoscale
);

ExtractKtPTATParameter_clock <= i_clock;
ExtractKtPTATParameter_reset <= i_reset;
ExtractKtPTATParameter_ee0x2432 <= i_ee0x2432;
inst_ExtractKtPTATParameter : ExtractKtPTATParameter PORT MAP (
i_clock => ExtractKtPTATParameter_clock,
i_reset => ExtractKtPTATParameter_reset,
i_ee0x2432 => ExtractKtPTATParameter_ee0x2432,
o_ktptat => ExtractKtPTATParameter_ktptat
);

ExtractKvPTATParameter_clock <= i_clock;
ExtractKvPTATParameter_reset <= i_reset;
ExtractKvPTATParameter_ee0x2432 <= i_ee0x2432;
inst_ExtractKvPTATParameter : ExtractKvPTATParameter PORT MAP (
i_clock => ExtractKvPTATParameter_clock,
i_reset => ExtractKvPTATParameter_reset,
i_ee0x2432 => ExtractKvPTATParameter_ee0x2432,
o_kvptat => ExtractKvPTATParameter_kvptat
);

ExtractTGCParameters_clock <= i_clock;
ExtractTGCParameters_reset <= i_reset;
ExtractTGCParameters_ee0x243c <= i_ee0x243c;
inst_ExtractTGCParameters : ExtractTGCParameters PORT MAP (
i_clock => ExtractTGCParameters_clock,
i_reset => ExtractTGCParameters_reset,
i_ee0x243c => ExtractTGCParameters_ee0x243c,
o_tgc => ExtractTGCParameters_tgc
);

end architecture testbench;

