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

--COMPONENT ExtractVDDParameters
--PORT(
--i_clock : IN  std_logic;
--i_reset : IN  std_logic;
--i_run : in std_logic;
--i2c_mem_ena : out STD_LOGIC;
--i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
--i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
--o_kvdd : OUT  std_logic_vector (31 downto 0);
--o_vdd25 : OUT  std_logic_vector (31 downto 0);
--o_rdy : out std_logic
--);
--END COMPONENT;
signal ExtractVDDParameters_clock : std_logic;
signal ExtractVDDParameters_reset : std_logic;
signal ExtractVDDParameters_run : std_logic;
signal ExtractVDDParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractVDDParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractVDDParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractVDDParameters_kvdd : std_logic_vector(31 downto 0);
signal ExtractVDDParameters_vdd25 : std_logic_vector(31 downto 0);
signal ExtractVDDParameters_rdy : std_logic;

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

component calculateVdd is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
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
signal calculateVdd_i2c_mem_ena : STD_LOGIC;
signal calculateVdd_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateVdd_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculateVdd_Vdd : fd2ft; -- output Vdd
signal calculateVdd_kvdd : fd2ft;
signal calculateVdd_vdd25 : fd2ft;
signal calculateVdd_ram0x072a : fd2ft;
signal calculateVdd_rdy : std_logic;

component calculateTa is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
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
signal calculateTa_i2c_mem_ena : STD_LOGIC;
signal calculateTa_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateTa_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
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
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_acpsubpage0 : out fd2ft;
o_acpsubpage1 : out fd2ft;
o_rdy : out std_logic
);
end component CalculateAlphaCP;
signal CalculateAlphaCP_clock : std_logic;
signal CalculateAlphaCP_reset : std_logic;
signal CalculateAlphaCP_run : std_logic;
signal CalculateAlphaCP_i2c_mem_ena : STD_LOGIC;
signal CalculateAlphaCP_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculateAlphaCP_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculateAlphaCP_acpsubpage0 : fd2ft;
signal CalculateAlphaCP_acpsubpage1 : fd2ft;
signal CalculateAlphaCP_rdy : std_logic;

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

component CalculatePixOsCPSP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_KGain : in std_logic_vector (31 downto 0);
i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_VddV0 : in std_logic_vector (31 downto 0);
i_const1 : in std_logic_vector (31 downto 0);
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_pixoscpsp0 : out std_logic_vector (31 downto 0);
o_pixoscpsp1 : out std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
end component CalculatePixOsCPSP;
signal CalculatePixOsCPSP_clock : std_logic;
signal CalculatePixOsCPSP_reset : std_logic;
signal CalculatePixOsCPSP_run : std_logic;
signal CalculatePixOsCPSP_KGain : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_Ta : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_Ta0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_Vdd : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_VddV0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_const1 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_i2c_mem_ena : STD_LOGIC;
signal CalculatePixOsCPSP_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixOsCPSP_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixOsCPSP_pixoscpsp0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_pixoscpsp1 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_rdy : std_logic;

COMPONENT CalculateVirCompensated
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i_Emissivity : IN  std_logic_vector(31 downto 0);
i_pixoscpsp0 : IN  std_logic_vector(31 downto 0);
i_pixoscpsp1 : IN  std_logic_vector(31 downto 0);
i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);
i_pixos_do : IN  std_logic_vector(31 downto 0);
o_pixos_addr : OUT  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);
o_rdy : OUT  std_logic
);
END COMPONENT;
signal CalculateVirCompensated_clock : std_logic;
signal CalculateVirCompensated_reset : std_logic;
signal CalculateVirCompensated_run : std_logic;
signal CalculateVirCompensated_Emissivity : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_pixoscpsp0 : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_pixoscpsp1 : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_pixos_do : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_addr : std_logic_vector(9 downto 0);
signal CalculateVirCompensated_i2c_mem_ena : std_logic;
signal CalculateVirCompensated_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateVirCompensated_i2c_mem_douta : std_logic_vector(7 downto 0);
signal CalculateVirCompensated_pixos_addr : std_logic_vector(9 downto 0);
signal CalculateVirCompensated_do : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_rdy : std_logic;

COMPONENT CalculateAlphaComp
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);
i_Ta : IN  std_logic_vector(31 downto 0);
i_Ta0 : IN  std_logic_vector(31 downto 0);
i_acpsubpage0 : IN  std_logic_vector(31 downto 0);
i_acpsubpage1 : IN  std_logic_vector(31 downto 0);
i_const1 : IN  std_logic_vector(31 downto 0);
i_alpha_do : IN  std_logic_vector(31 downto 0);
o_alpha_addr : OUT  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);
o_rdy : OUT  std_logic
);
END COMPONENT;
signal CalculateAlphaComp_clock : std_logic := '0';
signal CalculateAlphaComp_reset : std_logic := '0';
signal CalculateAlphaComp_run : std_logic := '0';
signal CalculateAlphaComp_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateAlphaComp_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_Ta0 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage0 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage1 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_const1 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_alpha_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_addr : std_logic_vector(9 downto 0) := (others => '0');
signal CalculateAlphaComp_i2c_mem_ena : std_logic;
signal CalculateAlphaComp_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateAlphaComp_alpha_addr : std_logic_vector(9 downto 0);
signal CalculateAlphaComp_do : std_logic_vector(31 downto 0);
signal CalculateAlphaComp_rdy : std_logic;

COMPONENT CalculateTo
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);
i_Ta : IN  std_logic_vector(31 downto 0);
i_vircompensated_do : IN  std_logic_vector(31 downto 0);
o_vircompensated_addr : OUT  std_logic_vector(9 downto 0);
i_alphacomp_do : IN  std_logic_vector(31 downto 0);
o_alphacomp_addr : OUT  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);
o_rdy : OUT  std_logic
);
END COMPONENT;
signal CalculateTo_clock : std_logic := '0';
signal CalculateTo_reset : std_logic := '0';
signal CalculateTo_run : std_logic := '0';
signal CalculateTo_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateTo_vircompensated_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_alphacomp_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_addr : std_logic_vector(9 downto 0) := (others => '0');
signal CalculateTo_i2c_mem_ena : std_logic;
signal CalculateTo_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateTo_vircompensated_addr : std_logic_vector(9 downto 0);
signal CalculateTo_alphacomp_addr : std_logic_vector(9 downto 0);
signal CalculateTo_do : std_logic_vector(31 downto 0);
signal CalculateTo_rdy : std_logic;

signal rdyrecover : std_logic; -- signal for tb when rdy not appear

signal CalculatePixOS_mux,CalculatePixOsCPSP_mux,CalculateVirCompensated_mux,ExtractOffsetParameters_mux : std_logic;
signal ExtractAlphaParameters_mux,CalculateAlphaComp_mux,CalculateAlphaCP_mux,ExtractVDDParameters_mux : std_logic;
signal CalculateVdd_mux,CalculateTa_mux,CalculateTo_mux : std_logic;

begin

i2c_mem_ena <=
ExtractVDDParameters_i2c_mem_ena when ExtractVDDParameters_mux = '1'
else
CalculatePixOS_i2c_mem_ena when CalculatePixOS_mux = '1'
else
CalculatePixOsCPSP_i2c_mem_ena when CalculatePixOsCPSP_mux = '1'
else
CalculateVirCompensated_i2c_mem_ena when CalculateVirCompensated_mux = '1'
else
ExtractOffsetParameters_i2c_mem_ena when ExtractOffsetParameters_mux = '1'
else
CalculateAlphaCP_i2c_mem_ena when CalculateAlphaCP_mux = '1'
else
ExtractAlphaParameters_i2c_mem_ena when ExtractAlphaParameters_mux = '1'
else
CalculateAlphaComp_i2c_mem_ena when CalculateAlphaComp_mux = '1'
else
CalculateVdd_i2c_mem_ena when CalculateVdd_mux = '1'
else
CalculateTa_i2c_mem_ena when CalculateTa_mux = '1'
else
CalculateTo_i2c_mem_ena when CalculateTo_mux = '1'
else '0';

i2c_mem_addra <=
ExtractVDDParameters_i2c_mem_addra when ExtractVDDParameters_mux = '1'
else
CalculatePixOS_i2c_mem_addra when CalculatePixOS_mux = '1'
else
CalculatePixOsCPSP_i2c_mem_addra when CalculatePixOsCPSP_mux = '1'
else
CalculateVirCompensated_i2c_mem_addra when CalculateVirCompensated_mux = '1'
else
ExtractOffsetParameters_i2c_mem_addra when ExtractOffsetParameters_mux = '1'
else
CalculateAlphaCP_i2c_mem_addra when CalculateAlphaCP_mux = '1'
else
ExtractAlphaParameters_i2c_mem_addra when ExtractAlphaParameters_mux = '1'
else
CalculateAlphaComp_i2c_mem_addra when CalculateAlphaComp_mux = '1'
else
CalculateVdd_i2c_mem_addra when CalculateVdd_mux = '1'
else
CalculateTa_i2c_mem_addra when CalculateTa_mux = '1'
else
CalculateTo_i2c_mem_addra when CalculateTo_mux = '1'
else (others => '0');

ExtractVDDParameters_i2c_mem_douta <= i2c_mem_douta;
CalculatePixOS_i2c_mem_douta <= i2c_mem_douta;
CalculatePixOsCPSP_i2c_mem_douta <= i2c_mem_douta;
CalculateVirCompensated_i2c_mem_douta <= i2c_mem_douta;
ExtractOffsetParameters_i2c_mem_douta <= i2c_mem_douta;
CalculateAlphaCP_i2c_mem_douta <= i2c_mem_douta;
ExtractAlphaParameters_i2c_mem_douta <= i2c_mem_douta;
CalculateAlphaComp_i2c_mem_douta <= i2c_mem_douta;
CalculateVdd_i2c_mem_douta <= i2c_mem_douta;
CalculateTa_i2c_mem_douta <= i2c_mem_douta;
CalculateTo_i2c_mem_douta <= i2c_mem_douta;

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
		CalculateVdd_run <= '1';
		CalculateVdd_mux <= '1';
	when s2 => 
		CalculateVdd_run <= '0';
		if (CalculateVdd_rdy = '1') then
			state := s3;
			CalculateVdd_mux <= '0';
		else
			state := s2;
			CalculateVdd_mux <= '1';
		end if;

	when s3 => state := s4;
		calculateTa_run <= '1';
		CalculateTa_mux <= '1';
		calculateTa_ram0x072a <= calculateVdd_ram0x072a;
		calculateTa_kvdd <= calculateVdd_kvdd;
		calculateTa_vdd25 <= calculateVdd_vdd25;
	when s4 =>
		calculateTa_run <= '0';
		if (calculateTa_rdy = '1') then
			state := s5;
			CalculateTa_mux <= '0';
		else
			state := s4;
			CalculateTa_mux <= '1';
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
		
		
	when s7 => state := s8;
		CalculatePixOS_run <= '1';
		CalculatePixOS_mux <= '1';
	when s8 => 
		CalculatePixOS_run <= '0';
		if (CalculatePixOS_rdy = '1') then
			state := s9;
			CalculatePixOS_mux <= '0';
		else
			state := s8;
			CalculatePixOS_mux <= '1';
		end if;

	when s9 => state := s10;
		CalculatePixOsCPSP_run <= '1';
		CalculatePixOsCPSP_mux <= '1';
	when s10 => 
		CalculatePixOsCPSP_run <= '0';
		if (CalculatePixOsCPSP_rdy = '1') then
			state := s11;
			CalculatePixOsCPSP_mux <= '0';
		else
			state := s10;
			CalculatePixOsCPSP_mux <= '1';
		end if;


	when s11 => state := s12;
		CalculateVirCompensated_run <= '1';
		CalculateVirCompensated_mux <= '1';
	when s12 => 
		CalculateVirCompensated_run <= '0';
		if (CalculateVirCompensated_rdy = '1') then
			state := s13;
			CalculateVirCompensated_mux <= '0';
		else
			state := s12;
			CalculateVirCompensated_mux <= '1';
		end if;

	when s13 => state := s14;
		ExtractOffsetParameters_run <= '1';
		ExtractOffsetParameters_mux <= '1';
	when s14 => 
		ExtractOffsetParameters_run <= '0';
		if (ExtractOffsetParameters_rdy = '1') then
			state := s15;
			ExtractOffsetParameters_mux <= '0';
		else
			state := s14;
			ExtractOffsetParameters_mux <= '1';
		end if;

	when s15 => state := s16;
		CalculateAlphaCP_run <= '1';
		CalculateAlphaCP_mux <= '1';
	when s16 => 
		CalculateAlphaCP_run <= '0';
		if (CalculateAlphaCP_rdy = '1') then
			state := s17;
			CalculateAlphaCP_mux <= '0';
		else
			state := s16;
			CalculateAlphaCP_mux <= '1';
		end if;

	when s17 => state := s18;
		ExtractAlphaParameters_run <= '1';
		ExtractAlphaParameters_mux <= '1';
	when s18 => 
		ExtractAlphaParameters_run <= '0';
		if (ExtractAlphaParameters_rdy = '1') then
			state := s19;
			ExtractAlphaParameters_mux <= '0';
		else
			state := s18;
			ExtractAlphaParameters_mux <= '1';
		end if;

	when s19 => state := s20;
		CalculateAlphaComp_run <= '1';
		CalculateAlphaComp_mux <= '1';
	when s20 => 
		CalculateAlphaComp_run <= '0';
		if (CalculateAlphaComp_rdy = '1') then
			state := s21;
			CalculateAlphaComp_mux <= '0';
		else
			state := s20;
			CalculateAlphaComp_mux <= '1';
		end if;

	when s21 => state := s22;
		CalculateTo_run <= '1';
		CalculateTo_mux <= '1';
	when s22 => 
		CalculateTo_run <= '0';
		if (CalculateTo_rdy = '1') then
			state := ending;
			CalculateTo_mux <= '0';
		else
			state := s22;
			CalculateTo_mux <= '1';
		end if;


	when ending => state := idle;
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

--ExtractVDDParameters_clock <= i_clock;
--ExtractVDDParameters_reset <= i_reset;
--inst_ExtractVDDParameters : ExtractVDDParameters port map (
--i_clock => ExtractVDDParameters_clock,
--i_reset => ExtractVDDParameters_reset,
--i_run => ExtractVDDParameters_run,
--i2c_mem_ena => ExtractVDDParameters_i2c_mem_ena,
--i2c_mem_addra => ExtractVDDParameters_i2c_mem_addra,
--i2c_mem_douta => ExtractVDDParameters_i2c_mem_douta,
--o_kvdd => ExtractVDDParameters_kvdd,
--o_vdd25 => ExtractVDDParameters_vdd25,
--o_rdy => ExtractVDDParameters_rdy
--);

inst_ExtractCT34Parameter : ExtractCT34Parameter PORT MAP (
i_clock => ExtractCT34Parameter_clock,
i_reset => ExtractCT34Parameter_reset,
i_ee0x243f => ExtractCT34Parameter_ee0x243f,
o_ct3 => ExtractCT34Parameter_ct3,
o_ct4 => ExtractCT34Parameter_ct4
);

calculateVdd_clock <= i_clock;
calculateVdd_reset <= i_reset;
inst_calculateVdd : calculateVdd port map (
i_clock => calculateVdd_clock,
i_reset => calculateVdd_reset,
i_run => calculateVdd_run,
i2c_mem_ena => calculateVdd_i2c_mem_ena,
i2c_mem_addra => calculateVdd_i2c_mem_addra,
i2c_mem_douta => calculateVdd_i2c_mem_douta,
o_Vdd => calculateVdd_Vdd,
o_kvdd => calculateVdd_kvdd,
o_vdd25 => calculateVdd_vdd25,
o_ram0x072a => calculateVdd_ram0x072a,
o_rdy => calculateVdd_rdy
);

calculateTa_clock <= i_clock;
calculateTa_reset <= i_reset;
inst_calculateTa : calculateTa port map (
i_clock => calculateTa_clock,
i_reset => calculateTa_reset,
i_run => calculateTa_run,
i2c_mem_ena => calculateTa_i2c_mem_ena,
i2c_mem_addra => calculateTa_i2c_mem_addra,
i2c_mem_douta => calculateTa_i2c_mem_douta,
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
i2c_mem_ena => CalculateAlphaCP_i2c_mem_ena,
i2c_mem_addra => CalculateAlphaCP_i2c_mem_addra,
i2c_mem_douta => CalculateAlphaCP_i2c_mem_douta,
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

CalculatePixOsCPSP_clock <= i_clock;
CalculatePixOsCPSP_reset <= i_reset;
CalculatePixOsCPSP_KGain <= calculateKGain_kgain;
CalculatePixOsCPSP_Ta <= CalculateTa_Ta; -- xxx
CalculatePixOsCPSP_Ta0 <= x"41C80000"; -- 25
CalculatePixOsCPSP_Vdd <= CalculateVdd_Vdd; -- xxx
CalculatePixOsCPSP_VddV0 <= x"40533333"; -- 3.3
CalculatePixOsCPSP_const1 <= x"3F800000"; -- 1
inst_CalculatePixOsCPSP : CalculatePixOsCPSP port map (
i_clock => CalculatePixOsCPSP_clock,
i_reset => CalculatePixOsCPSP_reset,
i_run => CalculatePixOsCPSP_run,
i_KGain => CalculatePixOsCPSP_KGain,
i_Ta => CalculatePixOsCPSP_Ta,
i_Ta0 => CalculatePixOsCPSP_Ta0,
i_Vdd => CalculatePixOsCPSP_Vdd,
i_VddV0 => CalculatePixOsCPSP_VddV0,
i_const1 => CalculatePixOsCPSP_const1,
i2c_mem_ena => CalculatePixOsCPSP_i2c_mem_ena,
i2c_mem_addra => CalculatePixOsCPSP_i2c_mem_addra,
i2c_mem_douta => CalculatePixOsCPSP_i2c_mem_douta,
o_pixoscpsp0 => CalculatePixOsCPSP_pixoscpsp0,
o_pixoscpsp1 => CalculatePixOsCPSP_pixoscpsp1,
o_rdy => CalculatePixOsCPSP_rdy
);

CalculateVirCompensated_Emissivity <= x"3f800000"; -- 1
CalculateVirCompensated_pixoscpsp0 <= CalculatePixOsCPSP_pixoscpsp0;
CalculateVirCompensated_pixoscpsp1 <= CalculatePixOsCPSP_pixoscpsp1;
CalculateVirCompensated_clock <= i_clock;
CalculateVirCompensated_reset <= i_reset;
CalculateVirCompensated_pixos_do <= CalculatePixOS_do;
CalculateVirCompensated_pixos_addr <= CalculatePixOS_addr;
inst_CalculateVirCompensated : CalculateVirCompensated PORT MAP (
i_clock => CalculateVirCompensated_clock,
i_reset => CalculateVirCompensated_reset,
i_run => CalculateVirCompensated_run,
i_Emissivity => CalculateVirCompensated_Emissivity,
i_pixoscpsp0 => CalculateVirCompensated_pixoscpsp0,
i_pixoscpsp1 => CalculateVirCompensated_pixoscpsp1,
i2c_mem_ena => CalculateVirCompensated_i2c_mem_ena,
i2c_mem_addra => CalculateVirCompensated_i2c_mem_addra,
i2c_mem_douta => CalculateVirCompensated_i2c_mem_douta,
i_pixos_do => CalculateVirCompensated_pixos_do,
o_pixos_addr => CalculateVirCompensated_pixos_addr,
o_do => CalculateVirCompensated_do,
i_addr => CalculateVirCompensated_addr,
o_rdy => CalculateVirCompensated_rdy
);

CalculateAlphaComp_clock <= i_clock;
CalculateAlphaComp_reset <= i_reset;
CalculateAlphaComp_Ta <= CalculateTa_Ta;
CalculateAlphaComp_Ta0 <= x"41C80000"; -- 25
CalculateAlphaComp_acpsubpage0 <= CalculateAlphaCP_acpsubpage0;
CalculateAlphaComp_acpsubpage1 <= CalculateAlphaCP_acpsubpage1;
CalculateAlphaComp_const1 <= x"3f800000";
CalculateAlphaComp_alpha_do <= ExtractAlphaParameters_do;
CalculateAlphaComp_alpha_addr <= ExtractAlphaParameters_addr;
inst_CalculateAlphaComp : CalculateAlphaComp PORT MAP (
i_clock => CalculateAlphaComp_clock,
i_reset => CalculateAlphaComp_reset,
i_run => CalculateAlphaComp_run,
i2c_mem_ena => CalculateAlphaComp_i2c_mem_ena,
i2c_mem_addra => CalculateAlphaComp_i2c_mem_addra,
i2c_mem_douta => CalculateAlphaComp_i2c_mem_douta,
i_Ta => CalculateAlphaComp_Ta,
i_Ta0 => CalculateAlphaComp_Ta0,
i_acpsubpage0 => CalculateAlphaComp_acpsubpage0,
i_acpsubpage1 => CalculateAlphaComp_acpsubpage1,
i_const1 => CalculateAlphaComp_const1,
i_alpha_do => CalculateAlphaComp_alpha_do,
o_alpha_addr => CalculateAlphaComp_alpha_addr,
o_do => CalculateAlphaComp_do,
i_addr => CalculateAlphaComp_addr,
o_rdy => CalculateAlphaComp_rdy
);

CalculateTo_clock <= i_clock;
CalculateTo_reset <= i_reset;
CalculateTo_vircompensated_do <= CalculateVirCompensated_do;
CalculateTo_vircompensated_addr <= CalculateVirCompensated_addr;
CalculateTo_alphacomp_do <= CalculateAlphaComp_do;
CalculateTo_alphacomp_addr <= CalculateAlphaComp_addr;
CalculateTo_Ta <= CalculateTa_Ta;
inst_CalculateTo : CalculateTo PORT MAP (
i_clock => CalculateTo_clock,
i_reset => CalculateTo_reset,
i_run => CalculateTo_run,
i2c_mem_ena => CalculateTo_i2c_mem_ena,
i2c_mem_addra => CalculateTo_i2c_mem_addra,
i2c_mem_douta => CalculateTo_i2c_mem_douta,
i_Ta => CalculateTo_Ta,
i_vircompensated_do => CalculateTo_vircompensated_do,
o_vircompensated_addr => CalculateTo_vircompensated_addr,
i_alphacomp_do => CalculateTo_alphacomp_do,
o_alphacomp_addr => CalculateTo_alphacomp_addr,
o_do => CalculateTo_do,
i_addr => CalculateTo_addr,
o_rdy => CalculateTo_rdy
);
end architecture testbench;

