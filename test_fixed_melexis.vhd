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

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

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
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal float2fixeda : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal float2fixedond : STD_LOGIC;
signal float2fixedclk : STD_LOGIC;
signal float2fixedsclr : STD_LOGIC;
signal float2fixedce : STD_LOGIC;
signal float2fixedr : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal float2fixedrdy : STD_LOGIC;

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
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
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfpclk : STD_LOGIC;
signal divfpsclr : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : STD_LOGIC;

COMPONENT mulfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfpclk : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : STD_LOGIC;

COMPONENT addfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfpclk : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : STD_LOGIC;

COMPONENT subfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfpclk : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : STD_LOGIC;

COMPONENT sqrtfp2
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : STD_LOGIC;
signal sqrtfp2clk : STD_LOGIC;
signal sqrtfp2sclr : STD_LOGIC;
signal sqrtfp2ce : STD_LOGIC;
signal sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
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

component calculateVdd is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2433 : in slv16; -- kvdd,vdd25
i_ee0x2438 : in slv16; -- resolutioncontrolcal,kvscale,ktascale1,ktascale2-2/4/4/4|resolutionee
i_ram0x072a : in slv16; -- for deltaV,vdd
i_ram0x800d : in slv16; -- resolution reg
o_Vdd : out fd2ft; -- output Vdd
o_kvdd : out fd2ft;
o_vdd25 : out fd2ft;
o_ram0x072a : out fd2ft;
o_rdy : out std_logic
);
end component calculateVdd;

signal calculateVdd_clock : std_logic;
signal calculateVdd_reset : std_logic;
signal calculateVdd_run : std_logic;
signal calculateVdd_ee0x2433 : slv16; -- kvdd,vdd25
signal calculateVdd_ee0x2438 : slv16; -- resolutioncontrolcal,kvscale,ktascale1,ktascale2-2/4/4/4|resolutionee
signal calculateVdd_ram0x072a : slv16; -- for deltaV,vdd
signal calculateVdd_ram0x800d : slv16; -- resolution reg
signal calculateVdd_Vdd : fd2ft; -- output Vdd
signal calculateVdd_kvdd : fd2ft;
signal calculateVdd_vdd25 : fd2ft;
signal calculateVdd_ram0x072a_ft : fd2ft;
signal calculateVdd_rdy : std_logic;

component calculateTa is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2432 : in slv16; -- kvptat,ktptat-6/10
i_ee0x2431 : in slv16; -- vptat25
i_ram0x0720 : in slv16; -- vptat
i_ram0x0700 : in slv16; -- vbe
i_ee0x2410 : in slv16; -- (alphaptatee),kptat,scaleoccrow,scaleocccolumn,scaleoccremnant
i_ram0x072a : in fd2ft; -- from VDD bram
i_kvdd : in fd2ft; -- from VDD bram
i_vdd25 : in fd2ft; -- from VDD bram
o_Ta : out fd2ft; -- output Ta
o_rdy : out std_logic
);
end component calculateTa;

signal calculateTa_clock : std_logic;
signal calculateTa_reset : std_logic;
signal calculateTa_run : std_logic;
signal calculateTa_ee0x2432 : slv16; -- kvptat,ktptat-6/10
signal calculateTa_ee0x2431 : slv16; -- vptat25
signal calculateTa_ram0x0720 : slv16; -- vptat
signal calculateTa_ram0x0700 : slv16; -- vbe
signal calculateTa_ee0x2410 : slv16; -- (alphaptatee),kptat,scaleoccrow,scaleocccolumn,scaleoccremnant
signal calculateTa_ram0x072a : fd2ft; -- from VDD bram
signal calculateTa_kvdd : fd2ft; -- from VDD bram
signal calculateTa_vdd25 : fd2ft; -- from VDD bram
signal calculateTa_Ta : fd2ft; -- output Ta
signal calculateTa_rdy : std_logic;

component calculateKGain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2430 : in slv16; -- gain
i_ram0x070a : in slv16;
o_KGain : out fd2ft;
o_rdy : out std_logic
);
end component calculateKGain;

signal calculateKGain_clock : std_logic;
signal calculateKGain_reset : std_logic;
signal calculateKGain_run : std_logic;
signal calculateKGain_ee0x2430 : slv16; -- gain
signal calculateKGain_ram0x070a : slv16;
signal calculateKGain_KGain : fd2ft;
signal calculateKGain_rdy : std_logic;

component ExtractOffsetParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_done : out std_logic;
o_rdy : out std_logic
);
end component ExtractOffsetParameters;

signal ExtractOffsetParameters_clock : std_logic;
signal ExtractOffsetParameters_reset : std_logic;
signal ExtractOffsetParameters_run : std_logic;
signal ExtractOffsetParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractOffsetParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractOffsetParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractOffsetParameters_do : std_logic_vector (31 downto 0);
signal ExtractOffsetParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractOffsetParameters_done : std_logic;
signal ExtractOffsetParameters_rdy : std_logic;

component ExtractAlphaParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_done : out std_logic;
o_rdy : out std_logic
);
end component ExtractAlphaParameters;

signal ExtractAlphaParameters_clock : std_logic;
signal ExtractAlphaParameters_reset : std_logic;
signal ExtractAlphaParameters_run : std_logic;
signal ExtractAlphaParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractAlphaParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractAlphaParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractAlphaParameters_do : std_logic_vector (31 downto 0);
signal ExtractAlphaParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractAlphaParameters_done : std_logic;
signal ExtractAlphaParameters_rdy : std_logic;

component ExtractKtaParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_done : out std_logic;
o_rdy : out std_logic
);
end component ExtractKtaParameters;

signal ExtractKtaParameters_clock : std_logic;
signal ExtractKtaParameters_reset : std_logic;
signal ExtractKtaParameters_run : std_logic;
signal ExtractKtaParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractKtaParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKtaParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKtaParameters_do : std_logic_vector (31 downto 0);
signal ExtractKtaParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractKtaParameters_done : std_logic;
signal ExtractKtaParameters_rdy : std_logic;

component ExtractKvParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_done : out std_logic;
o_rdy : out std_logic
);
end component ExtractKvParameters;

signal ExtractKvParameters_clock : std_logic;
signal ExtractKvParameters_reset : std_logic;
signal ExtractKvParameters_run : std_logic;
signal ExtractKvParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractKvParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKvParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKvParameters_do : std_logic_vector (31 downto 0);
signal ExtractKvParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractKvParameters_done : std_logic;
signal ExtractKvParameters_rdy : std_logic;

component CalculateAlphaCP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2439 : in slv16; -- CP_P12P0_ratio/Acpsubpage0 - 6/10bit
i_ee0x2420 : in slv16; -- Ascalecp
o_acpsubpage0 : out fd2ft;
o_acpsubpage1 : out fd2ft;
o_rdy : out std_logic
);
end component CalculateAlphaCP;

signal CalculateAlphaCP_clock : std_logic := '0';
signal CalculateAlphaCP_reset : std_logic := '0';
signal CalculateAlphaCP_run : std_logic := '0';
signal CalculateAlphaCP_ee0x2439 : slv16 := (others => '0'); -- CP_P12P0_ratio/Acpsubpage0 - 6/10bit
signal CalculateAlphaCP_ee0x2420 : slv16 := (others => '0'); -- Ascalecp
signal CalculateAlphaCP_acpsubpage0 : fd2ft := (others => '0');
signal CalculateAlphaCP_acpsubpage1 : fd2ft := (others => '0');
signal CalculateAlphaCP_rdy : std_logic := '0';

component CalculateOffsetCP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x243a : in slv16; -- offcpsubpage1delta/offcpsubpage0 - 6/10bit
o_offcpsubpage0 : out fd2ft;
o_offcpsubpage1 : out fd2ft;
o_rdy : out std_logic
);
end component CalculateOffsetCP;

signal CalculateOffsetCP_clock : std_logic := '0';
signal CalculateOffsetCP_reset : std_logic := '0';
signal CalculateOffsetCP_run : std_logic := '0';
signal CalculateOffsetCP_ee0x243a : slv16 := (others => '0');
signal CalculateOffsetCP_offcpsubpage0 : fd2ft := (others => '0');
signal CalculateOffsetCP_offcpsubpage1 : fd2ft := (others => '0');
signal CalculateOffsetCP_rdy : std_logic := '0';

component CalculatePixGain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
i_KGain : in fd2ft;
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_done : out std_logic;
o_rdy : out std_logic
);
end component CalculatePixGain;

signal CalculatePixGain_clock : std_logic := '0';
signal CalculatePixGain_reset : std_logic := '0';
signal CalculatePixGain_run : std_logic := '0';
signal CalculatePixGain_i2c_mem_ena : STD_LOGIC := '0';
signal CalculatePixGain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixGain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
signal CalculatePixGain_KGain : fd2ft := (others => '0');
signal CalculatePixGain_do : std_logic_vector (31 downto 0);
signal CalculatePixGain_addr : std_logic_vector (9 downto 0) := (others => '0'); -- 10bit-1024
signal CalculatePixGain_done : std_logic;
signal CalculatePixGain_rdy : std_logic;

component ExtractAlphaCorrRange1234 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x243d : in slv16; -- ksto1ee,ksto2ee
i_ee0x243e : in slv16; -- ksto3ee,ksto4ee
i_ee0x243f : in slv16; -- kstoscale,ct34param
o_alphacorrrange1 : out fd2ft;
o_alphacorrrange2 : out fd2ft;
o_alphacorrrange3 : out fd2ft;
o_alphacorrrange4 : out fd2ft;
o_rdy : out std_logic
);
end component ExtractAlphaCorrRange1234;

signal ExtractAlphaCorrRange1234_clock : std_logic := '0';
signal ExtractAlphaCorrRange1234_reset : std_logic := '0';
signal ExtractAlphaCorrRange1234_run : std_logic := '0';
signal ExtractAlphaCorrRange1234_ee0x243d : slv16 := (others => '0'); -- ksto1ee,ksto2ee
signal ExtractAlphaCorrRange1234_ee0x243e : slv16 := (others => '0'); -- ksto3ee,ksto4ee
signal ExtractAlphaCorrRange1234_ee0x243f : slv16 := (others => '0'); -- kstoscale,ct34param
signal ExtractAlphaCorrRange1234_alphacorrrange1 : fd2ft;
signal ExtractAlphaCorrRange1234_alphacorrrange2 : fd2ft;
signal ExtractAlphaCorrRange1234_alphacorrrange3 : fd2ft;
signal ExtractAlphaCorrRange1234_alphacorrrange4 : fd2ft;
signal ExtractAlphaCorrRange1234_rdy : std_logic;

component ExtractCPParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2420 : in slv16; -- alphascale
i_ee0x2438 : in slv16; -- ktaScale1,kvScale
i_ee0x2439 : in slv16; -- alphasp0,alphasp1
i_ee0x243a : in slv16; -- offsetsp0,offsetsp1
i_ee0x243b : in slv16; -- cpKta,cpKv
o_cpAlpha0 : out fd2ft;
o_cpAlpha1 : out fd2ft;
o_cpOffset0 : out fd2ft;
o_cpOffset1 : out fd2ft;
o_cpKv : out fd2ft;
o_cpKta : out fd2ft;
o_rdy : out std_logic
);
end component ExtractCPParameters;

signal ExtractCPParameters_clock : std_logic := '0';
signal ExtractCPParameters_reset : std_logic := '0';
signal ExtractCPParameters_run : std_logic := '0';
signal ExtractCPParameters_ee0x2420 : slv16 := (others => '0'); -- alphascale
signal ExtractCPParameters_ee0x2438 : slv16 := (others => '0'); -- ktaScale1,kvScale
signal ExtractCPParameters_ee0x2439 : slv16 := (others => '0'); -- alphasp0,alphasp1
signal ExtractCPParameters_ee0x243a : slv16 := (others => '0'); -- offsetsp0,offsetsp1
signal ExtractCPParameters_ee0x243b : slv16 := (others => '0'); -- cpKta,cpKv
signal ExtractCPParameters_cpAlpha0 : fd2ft := (others => '0');
signal ExtractCPParameters_cpAlpha1 : fd2ft := (others => '0');
signal ExtractCPParameters_cpOffset0 : fd2ft := (others => '0');
signal ExtractCPParameters_cpOffset1 : fd2ft := (others => '0');
signal ExtractCPParameters_cpKv : fd2ft := (others => '0');
signal ExtractCPParameters_cpKta : fd2ft := (others => '0');
signal ExtractCPParameters_rdy : std_logic := '0';

component CalculatePixOS is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
i_KGain : in std_logic_vector (31 downto 0);
i_const1 : in std_logic_vector (31 downto 0);
i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_VddV0 : in std_logic_vector (31 downto 0);
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_rdy : out std_logic
);
end component CalculatePixOS;

signal CalculatePixOS_clock : std_logic;
signal CalculatePixOS_reset : std_logic;
signal CalculatePixOS_run : std_logic;
signal CalculatePixOS_i2c_mem_ena : STD_LOGIC;
signal CalculatePixOS_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixOS_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixOS_KGain : std_logic_vector (31 downto 0);
signal CalculatePixOS_const1 : std_logic_vector (31 downto 0);
signal CalculatePixOS_Ta : std_logic_vector (31 downto 0);
signal CalculatePixOS_Ta0 : std_logic_vector (31 downto 0);
signal CalculatePixOS_Vdd : std_logic_vector (31 downto 0);
signal CalculatePixOS_VddV0 : std_logic_vector (31 downto 0);
signal CalculatePixOS_do : std_logic_vector (31 downto 0);
signal CalculatePixOS_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal CalculatePixOS_rdy : std_logic;

signal rdyrecover : std_logic; -- signal for tb when rdy not appear

signal CalculatePixOS_mux : std_logic;

begin

i2c_mem_ena <=
CalculatePixOS_i2c_mem_ena when CalculatePixOS_mux = '1'
else '0';

i2c_mem_addra <=
CalculatePixOS_i2c_mem_addra when CalculatePixOS_mux = '1'
else (others => '0');

CalculatePixOS_i2c_mem_douta <= i2c_mem_douta;

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
		constant k27315_ft : fd2ft := x"43889333";
		constant const256_ft : fd2ft := x"43800000";
		constant const2pow5_ft : fd2ft := x"42000000";
		constant const2pow7_ft : fd2ft := x"43000000";
		constant const2pow13_ft : fd2ft := x"46000000";
		constant const2pow12_ft : fd2ft := x"45800000";
		constant const2pow3_ft : fd2ft := x"41000000";
		constant const3dot3_ft : fd2ft := x"40533333";
		constant const2pow2_ft : fd2ft := x"40800000";
		constant const8_ft : fd2ft := x"41000000";
		constant const2pow18_ft : fd2ft := x"48800000";
		constant const25_ft : fd2ft := x"41C80000";
		constant const1_ft : fd2ft := x"3F800000";
		constant const27_ft : fd2ft := x"41D80000";
		constant constemissivity_ft : fd2ft := const1_ft;
		constant const30_ft : fd2ft := x"41F00000";
-----
		variable fracas : fracas;
		variable fracbs : fracbs;
		variable fracau : fracau;
		variable fracbu : fracbu;
		variable outTo : fd2ft;
	begin
		if (rising_edge(i_clock)) then
			if (i_reset = '1') then
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
				calculateVdd_run <= '0';
				calculateTa_run <= '0';
				calculateKGain_run <= '0';
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
	when s1 => state := s2;
		calculateVdd_run <= '1';
		calculateVdd_ee0x2433 <= i_ee0x2433;
		calculateVdd_ee0x2438 <= i_ee0x2438;
		calculateVdd_ram0x072a <= i_ram0x072a;
		calculateVdd_ram0x800d <= i_ram0x800d;
	when s2 =>
		calculateVdd_run <= '0';
		if (calculateVdd_rdy = '1') then
			state := s3;
		else
			state := s2;
		end if;
	when s3 => state := s4;
		calculateTa_run <= '1';
		calculateTa_ee0x2432 <= i_ee0x2432;
		calculateTa_ee0x2431 <= i_ee0x2431;
		calculateTa_ram0x0720 <= i_ram0x0720;
		calculateTa_ram0x0700 <= i_ram0x0700;
		calculateTa_ee0x2410 <= i_ee0x2410;
		calculateTa_ram0x072a <= calculateVdd_ram0x072a_ft;
		calculateTa_kvdd <= calculateVdd_kvdd;
		calculateTa_vdd25 <= calculateVdd_vdd25;
	when s4 =>
		calculateTa_run <= '0';
		if (calculateTa_rdy = '1') then
			state := s5;
		else
			state := s4;
		end if;
	when s5 => state := s6;
		calculateKGain_run <= '1';
		calculateKGain_ee0x2430 <= i_ee0x2430;
		calculateKGain_ram0x070a <= i_ram0x070a;
	when s6 =>
		calculateKGain_run <= '0';
		if (calculateKGain_rdy = '1') then
			state := s7;
		else
			state := s6;
		end if;
		
		
	when s7 => state := s94;
		CalculatePixOS_run <= '1';
		CalculatePixOS_mux <= '1';
	when s94 => 
		CalculatePixOS_run <= '0';
		if (CalculatePixOS_rdy = '1') then
			state := s169;
			CalculatePixOS_mux <= '0';
		else
			state := s94;
			CalculatePixOS_mux <= '1';
		end if;
		

	when s169 => state := s172;
		divfpce <= '1';
		divfpa <= pixos1216_ft;
		divfpb <= constemissivity_ft;
		divfpond <= '1';
	when s172 =>
		if (divfprdy = '1') then state := s173;
			vir1216emissivitycompensated_ft := divfpr; -- 700.882
			outTo := divfpr;
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
			outTo := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s174; end if;
	when s175 => state := s176;
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= pixgaincpsp0_ft;
		mulfpb <= calculateKGain_kgain;
		mulfpond <= '1';
	when s176 =>
		if (mulfprdy = '1') then state := s177;
			pixgaincpsp0_ft := mulfpr; -- -54.946
			outTo := mulfpr;
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
			outTo := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s178; end if;
	when s179 => state := s180;
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= pixgaincpsp1_ft;
		mulfpb <= calculateKGain_kgain;
		mulfpond <= '1';
	when s180 =>
		if (mulfprdy = '1') then state := s181;
			pixgaincpsp1_ft := mulfpr; -- -56.981
			outTo := mulfpr;
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
			outTo := fixed2floatr;
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
			outTo := fixed2floatr;
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
			outTo := addfpr;
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
			outTo := fixed2floatr;
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
			outTo := divfpr;
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
			outTo := fixed2floatr;
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
			outTo := divfpr;
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
			outTo := mulfpr;
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
			outTo := addfpr;
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
			outTo := mulfpr;
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
			outTo := addfpr;
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
			outTo := mulfpr;
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
			outTo := mulfpr;
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
			outTo := subfpr;
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
			outTo := mulfpr;
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
			outTo := subfpr;
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
			outTo := fixed2floatr;
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
			outTo := divfpr;
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
			outTo := fixed2floatr;
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
			outTo := mulfpr;
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
			outTo := subfpr;
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
			outTo := mulfpr;
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
			outTo := addfpr;
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
			outTo := mulfpr;
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
			outTo := subfpr;
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
			outTo := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s235; end if;
	when s236 => state := s239;
		fixed2floatsclr <= '0';
		addfpce <= '1';
		addfpa <= ascalecp_ft;
		addfpb <= const27_ft;
		addfpond <= '1';
	when s239 =>
		if (addfprdy = '1') then state := s240;
			ascalecp_ft := addfpr; -- 34
			outTo := addfpr;
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
			outTo := fixed2floatr;
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
			outTo := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s247; end if;
	when s248 => state := s251;
		divfpsclr <= '0';
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
			outTo := fixed2floatr;
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
			outTo := divfpr;
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
			outTo := addfpr;
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
			outTo := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s257; end if;
	when s258 => state := s263;
		mulfpsclr <= '0';
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
			outTo := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s263; end if;
	when s264 => state := s267;
		fixed2floatsclr <= '0';
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
			outTo := fixed2floatr;
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
			outTo := addfpr;
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
		outTo := ascale_ft;
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
			outTo := fixed2floatr;
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
			outTo := fixed2floatr;
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
			outTo := fixed2floatr;
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
		outTo := accscalerow_ft;
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
		outTo := accscalecolumn_ft;
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
		outTo := accscaleremnant_ft;
		mulfpce <= '1';
		mulfpa <= apixel1216_ft;
		mulfpb <= accscaleremnant_ft;
		mulfpond <= '1';
	when s287 =>
		if (mulfprdy = '1') then state := s288;
			fttmp1_ft := mulfpr;
			outTo := mulfpr;
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
			outTo := mulfpr;
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
			outTo := addfpr;
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
			outTo := mulfpr;
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
			outTo := addfpr;
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
			outTo := addfpr;
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
			outTo := divfpr;
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
			outTo := mulfpr;
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
			outTo := subfpr;
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
			outTo := mulfpr;
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
			outTo := addfpr;
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
			outTo := mulfpr;
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
			outTo := subfpr;
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
			outTo := mulfpr;
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
			outTo := addfpr;
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
			outTo := mulfpr;
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
			outTo := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s319; end if;
	when s320 => state := s329;
		fixed2floatsclr <= '0';
--		kstoscale_ft := mem_float2powerN_2powerN1; -- 2^kstoscale 2^17
		outTo := accscalecolumn_ft;
		divfpce <= '1';
		divfpa <= ksto2ee_ft;
		divfpb <= ExtractKsToScaleParameter_kstoscale;
		divfpond <= '1';
	when s329 =>
		if (divfprdy = '1') then state := s330;
			ksto2_ft := divfpr; -- -0.00080108642578125
			outTo := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s329; end if;
	when s330 => state := s333;
		divfpsclr <= '0';
		addfpce <= '1';
		addfpa <= calculateTa_Ta;
		addfpb <= k27315_ft;
		addfpond <= '1';
	when s333 =>
		if (addfprdy = '1') then state := s334;
			fttmp1_ft := addfpr; -- 312.334
			outTo := addfpr;
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
			outTo := mulfpr;
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
			outTo := mulfpr;
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
			outTo := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s339; end if;
	when s340 => state := s341;
		mulfpsclr <= '0';
		subfpce <= '1';
		subfpa <= calculateTa_Ta;
		subfpb <= const8_ft;
		subfpond <= '1';
	when s341 =>
		if (subfprdy = '1') then state := s342;
			trk4_ft := subfpr;
			outTo := subfpr;
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
			outTo := addfpr;
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
			outTo := mulfpr;
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
			outTo := mulfpr;
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
			outTo := mulfpr;
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
			outTo := mulfpr;
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
			outTo := mulfpr;
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
			outTo := mulfpr;
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
			outTo := fttmp2_ft;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s359; end if;
	when s360 => state := s361;
		mulfpsclr <= '0';
		addfpce <= '1';
		addfpa <= fttmp1_ft;
		addfpb <= fttmp2_ft;
		addfpond <= '1';
	when s361 =>
		if (addfprdy = '1') then state := s362;
			fttmp1_ft := addfpr; -- (acomp1216^3*vir1216compensated)+(acomp1216^4*tar) float , tar=tak4
			outTo := addfpr;
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
			outTo := fttmp1_ft;
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
			outTo := fttmp1_ft;
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
			outTo := fttmp1_ft;
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
			outTo := mulfpr;
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
			outTo := subfpr;
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
			outTo := fttmp2_ft;
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
			outTo := fttmp1_ft;
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
			outTo := fttmp1_ft;
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
			outTo := fttmp1_ft;
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
			outTo := fttmp1_ft;
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
			outTo := fttmp1_ft;
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
			outTo := fttmp1_ft;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s385; end if;
	when s386 => state := s387;
		subfpsclr <= '0';
		outTo := fttmp1_ft;
	when s387 => state := idle;
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
clk => float2fixedclk,
sclr => float2fixedsclr,
ce => float2fixedce,
result => float2fixedr,
rdy => float2fixedrdy
);

inst_ff2 : fixed2float
PORT MAP (
a => fixed2floata,
operation_nd => fixed2floatond,
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
clk => divfpclk,
sclr => divfpsclr,
ce => divfpce,
result => divfpr,
rdy => divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => mulfpa,
b => mulfpb,
operation_nd => mulfpond,
clk => mulfpclk,
sclr => mulfpsclr,
ce => mulfpce,
result => mulfpr,
rdy => mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => addfpa,
b => addfpb,
operation_nd => addfpond,
clk => addfpclk,
sclr => addfpsclr,
ce => addfpce,
result => addfpr,
rdy => addfprdy
);

inst_subfp : subfp
PORT MAP (
a => subfpa,
b => subfpb,
operation_nd => subfpond,
clk => subfpclk,
sclr => subfpsclr,
ce => subfpce,
result => subfpr,
rdy => subfprdy
);

inst_sqrtfp2 : sqrtfp2
PORT MAP (
a => sqrtfp2a,
operation_nd => sqrtfp2ond,
clk => sqrtfp2clk,
sclr => sqrtfp2sclr,
ce => sqrtfp2ce,
result => sqrtfp2r,
rdy => sqrtfp2rdy
);

mem_float2powerN_clock1 <= i_clock;
inst_mem_float2powerN1 : mem_float2powerN
port map (
i_clock => mem_float2powerN_clock1,
i_reset => mem_float2powerN_reset1,
i_N => mem_float2powerN_N1,
o_2powerN => mem_float2powerN_2powerN1
);

mem_float2powerN_clock2 <= i_clock;
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

calculateVdd_clock <= i_clock;
calculateVdd_reset <= i_reset;
inst_calculateVdd : calculateVdd port map (
i_clock => calculateVdd_clock,
i_reset => calculateVdd_reset,
i_run => calculateVdd_run,
i_ee0x2433 => calculateVdd_ee0x2433,
i_ee0x2438 => calculateVdd_ee0x2438,
i_ram0x072a => calculateVdd_ram0x072a,
i_ram0x800d => calculateVdd_ram0x800d,
o_Vdd => calculateVdd_Vdd,
o_kvdd => calculateVdd_kvdd,
o_vdd25 => calculateVdd_vdd25,
o_ram0x072a => calculateVdd_ram0x072a_ft,
o_rdy => calculateVdd_rdy
);

calculateTa_clock <= i_clock;
calculateTa_reset <= i_reset;
inst_calculateTa : calculateTa port map (
i_clock => calculateTa_clock,
i_reset => calculateTa_reset,
i_run => calculateTa_run,
i_ee0x2432 => calculateTa_ee0x2432,
i_ee0x2431 => calculateTa_ee0x2431,
i_ram0x0720 => calculateTa_ram0x0720,
i_ram0x0700 => calculateTa_ram0x0700,
i_ee0x2410 => calculateTa_ee0x2410,
i_ram0x072a => calculateTa_ram0x072a,
i_kvdd => calculateTa_kvdd,
i_vdd25 => calculateTa_vdd25,
o_Ta => calculateTa_Ta,
o_rdy => calculateTa_rdy
);

calculateKGain_clock <= i_clock;
calculateKGain_reset <= i_reset;
inst_calculateKGain : calculateKGain port map (
i_clock => calculateKGain_clock,
i_reset => calculateKGain_reset,
i_run => calculateKGain_run,
i_ee0x2430 => calculateKGain_ee0x2430,
i_ram0x070a => calculateKGain_ram0x070a,
o_KGain => calculateKGain_kgain,
o_rdy => calculateKGain_rdy
);

ExtractOffsetParameters_clock <= i_clock;
ExtractOffsetParameters_reset <= i_reset;
inst_ExtractOffsetParameters : ExtractOffsetParameters port map (
i_clock => ExtractOffsetParameters_clock,
i_reset => ExtractOffsetParameters_reset,
i_run => ExtractOffsetParameters_run,
i2c_mem_ena => ExtractOffsetParameters_i2c_mem_ena,
i2c_mem_addra => ExtractOffsetParameters_i2c_mem_addra,
i2c_mem_douta => ExtractOffsetParameters_i2c_mem_douta,
o_do => ExtractOffsetParameters_do,
i_addr => ExtractOffsetParameters_addr,
o_done => ExtractOffsetParameters_done,
o_rdy => ExtractOffsetParameters_rdy
);

ExtractAlphaParameters_clock <= i_clock;
ExtractAlphaParameters_reset <= i_reset;
inst_ExtractAlphaParameters : ExtractAlphaParameters port map (
i_clock => ExtractAlphaParameters_clock,
i_reset => ExtractAlphaParameters_reset,
i_run => ExtractAlphaParameters_run,
i2c_mem_ena => ExtractAlphaParameters_i2c_mem_ena,
i2c_mem_addra => ExtractAlphaParameters_i2c_mem_addra,
i2c_mem_douta => ExtractAlphaParameters_i2c_mem_douta,
o_do => ExtractAlphaParameters_do,
i_addr => ExtractAlphaParameters_addr,
o_done => ExtractAlphaParameters_done,
o_rdy => ExtractAlphaParameters_rdy
);

ExtractKtaParameters_clock <= i_clock;
ExtractKtaParameters_reset <= i_reset;
inst_ExtractKtaParameters : ExtractKtaParameters port map (
i_clock => ExtractKtaParameters_clock,
i_reset => ExtractKtaParameters_reset,
i_run => ExtractKtaParameters_run,
i2c_mem_ena => ExtractKtaParameters_i2c_mem_ena,
i2c_mem_addra => ExtractKtaParameters_i2c_mem_addra,
i2c_mem_douta => ExtractKtaParameters_i2c_mem_douta,
o_do => ExtractKtaParameters_do,
i_addr => ExtractKtaParameters_addr,
o_done => ExtractKtaParameters_done,
o_rdy => ExtractKtaParameters_rdy
);

ExtractKvParameters_clock <= i_clock;
ExtractKvParameters_reset <= i_reset;
inst_ExtractKvParameters : ExtractKvParameters port map (
i_clock => ExtractKvParameters_clock,
i_reset => ExtractKvParameters_reset,
i_run => ExtractKvParameters_run,
i2c_mem_ena => ExtractKvParameters_i2c_mem_ena,
i2c_mem_addra => ExtractKvParameters_i2c_mem_addra,
i2c_mem_douta => ExtractKvParameters_i2c_mem_douta,
o_do => ExtractKvParameters_do,
i_addr => ExtractKvParameters_addr,
o_done => ExtractKvParameters_done,
o_rdy => ExtractKvParameters_rdy
);

CalculateAlphaCP_clock <= i_clock;
CalculateAlphaCP_reset <= i_reset;
inst_CalculateAlphaCP : CalculateAlphaCP
port map (
i_clock => CalculateAlphaCP_clock,
i_reset => CalculateAlphaCP_reset,
i_run => CalculateAlphaCP_run,
i_ee0x2439 => CalculateAlphaCP_ee0x2439,
i_ee0x2420 => CalculateAlphaCP_ee0x2420,
o_acpsubpage0 => CalculateAlphaCP_acpsubpage0,
o_acpsubpage1 => CalculateAlphaCP_acpsubpage1,
o_rdy => CalculateAlphaCP_rdy
);

CalculateOffsetCP_clock <= i_clock;
CalculateOffsetCP_reset <= i_reset;
inst_CalculateOffsetCP : CalculateOffsetCP
port map (
i_clock => CalculateOffsetCP_clock,
i_reset => CalculateOffsetCP_reset,
i_run => CalculateOffsetCP_run,
i_ee0x243a => CalculateOffsetCP_ee0x243a,
o_offcpsubpage0 => CalculateOffsetCP_offcpsubpage0,
o_offcpsubpage1 => CalculateOffsetCP_offcpsubpage1,
o_rdy => CalculateOffsetCP_rdy
);

CalculatePixGain_clock <= i_clock;
CalculatePixGain_reset <= i_reset;
CalculatePixGain_KGain <= calculateKGain_kgain;
inst_CalculatePixGain : CalculatePixGain port map (
i_clock => CalculatePixGain_clock,
i_reset => CalculatePixGain_reset,
i_run => CalculatePixGain_run,
i2c_mem_ena => CalculatePixGain_i2c_mem_ena,
i2c_mem_addra => CalculatePixGain_i2c_mem_addra,
i2c_mem_douta => CalculatePixGain_i2c_mem_douta,
i_KGain => CalculatePixGain_KGain,
o_do => CalculatePixGain_do,
i_addr => CalculatePixGain_addr,
o_done => CalculatePixGain_done,
o_rdy => CalculatePixGain_rdy
);

ExtractAlphaCorrRange1234_clock <= i_clock;
ExtractAlphaCorrRange1234_reset <= i_reset;
ExtractAlphaCorrRange1234_ee0x243d <= x"0000"; -- xxx
ExtractAlphaCorrRange1234_ee0x243e <= x"0000"; -- xxx
ExtractAlphaCorrRange1234_ee0x243f <= x"0000"; -- xxx
inst_ExtractAlphaCorrRange1234 : ExtractAlphaCorrRange1234 port map (
i_clock => ExtractAlphaCorrRange1234_clock,
i_reset => ExtractAlphaCorrRange1234_reset,
i_run => ExtractAlphaCorrRange1234_run,
i_ee0x243d => ExtractAlphaCorrRange1234_ee0x243d,
i_ee0x243e => ExtractAlphaCorrRange1234_ee0x243e,
i_ee0x243f => ExtractAlphaCorrRange1234_ee0x243f,
o_alphacorrrange1 => ExtractAlphaCorrRange1234_alphacorrrange1,
o_alphacorrrange2 => ExtractAlphaCorrRange1234_alphacorrrange2,
o_alphacorrrange3 => ExtractAlphaCorrRange1234_alphacorrrange3,
o_alphacorrrange4 => ExtractAlphaCorrRange1234_alphacorrrange4,
o_rdy => ExtractAlphaCorrRange1234_rdy
);

ExtractCPParameters_clock <= i_clock;
ExtractCPParameters_reset <= i_reset;
ExtractCPParameters_ee0x2420 <= x"0000"; -- xxx
ExtractCPParameters_ee0x2438 <= x"0000"; -- xxx
ExtractCPParameters_ee0x2439 <= x"0000"; -- xxx
ExtractCPParameters_ee0x243a <= x"0000"; -- xxx
ExtractCPParameters_ee0x243b <= x"0000"; -- xxx
inst_ExtractCPParameters : ExtractCPParameters port map (
i_clock => ExtractCPParameters_clock,
i_reset => ExtractCPParameters_reset,
i_run => ExtractCPParameters_run,
i_ee0x2420 => ExtractCPParameters_ee0x2420,
i_ee0x2438 => ExtractCPParameters_ee0x2438,
i_ee0x2439 => ExtractCPParameters_ee0x2439,
i_ee0x243a => ExtractCPParameters_ee0x243a,
i_ee0x243b => ExtractCPParameters_ee0x243b,
o_cpAlpha0 => ExtractCPParameters_cpAlpha0,
o_cpAlpha1 => ExtractCPParameters_cpAlpha1,
o_cpOffset0 => ExtractCPParameters_cpOffset0,
o_cpOffset1 => ExtractCPParameters_cpOffset1,
o_cpKv => ExtractCPParameters_cpKv,
o_cpKta => ExtractCPParameters_cpKta,
o_rdy => ExtractCPParameters_rdy
);

CalculatePixOS_clock <= i_clock;
CalculatePixOS_reset <= i_reset;
CalculatePixOS_KGain <= calculateKGain_kgain;
CalculatePixOS_const1 <= x"3F800000"; -- 1
CalculatePixOS_Ta <= CalculateTa_Ta; -- xxx
CalculatePixOS_Ta0 <= x"41C80000"; -- 25
CalculatePixOS_Vdd <= CalculateVdd_Vdd; -- xxx
CalculatePixOS_VddV0 <= x"40533333"; -- 3.3
inst_CalculatePixOS : CalculatePixOS port map (
i_clock => CalculatePixOS_clock,
i_reset => CalculatePixOS_reset,
i_run => CalculatePixOS_run,
i2c_mem_ena => CalculatePixOS_i2c_mem_ena,
i2c_mem_addra => CalculatePixOS_i2c_mem_addra,
i2c_mem_douta => CalculatePixOS_i2c_mem_douta,
i_KGain => CalculatePixOS_KGain,
i_const1 => CalculatePixOS_const1,
i_Ta => CalculatePixOS_Ta,
i_Ta0 => CalculatePixOS_Ta0,
i_Vdd => CalculatePixOS_Vdd,
i_VddV0 => CalculatePixOS_VddV0,
o_do => CalculatePixOS_do,
i_addr => CalculatePixOS_addr,
o_rdy => CalculatePixOS_rdy
);

end architecture testbench;

