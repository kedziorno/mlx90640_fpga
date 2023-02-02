-- TestBench Template 
-- calculateVdd

LIBRARY ieee,ieee_proposed;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.numeric_std_additions.all;
use ieee_proposed.standard_additions.all;
--use ieee_proposed.standard_textio_additions.all;
use ieee_proposed.std_logic_1164_additions.all;

USE work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

ENTITY tb_calculateVdd IS
END tb_calculateVdd;

ARCHITECTURE tb OF tb_calculateVdd IS 

-- Component Declaration
component calculateVdd is
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
o_Vdd : out fd2ft; -- output Temp
o_rdy : out std_logic
);
end component calculateVdd;

SIGNAL i_clock :  std_logic := '0';
SIGNAL i_reset :  std_logic := '0';
SIGNAL i_run :  std_logic := '0';
SIGNAL o_Vdd : fd2ft;
SIGNAL o_rdy :  std_logic;

constant clock_period : time := 500 ns;
constant G_C_WAIT1 : integer := 16;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (o_Vdd);

cp : process
begin
	i_clock <= '0';
	wait for clock_period/2;
	i_clock <= '1';
	wait for clock_period/2;
end process cp;

-- Component Instantiation
uut : calculateVdd
port map (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
i_ee0x2433 => x"9d68",
i_ee0x2438 => x"2363",
i_ram0x072a => x"ccc5",
i_ram0x800d => x"1901",
i_ee0x2432 => x"5952",
i_ee0x2431 => x"2ff1",
i_ee0x2410 => x"4210",
i_ram0x0720 => x"06af",
i_ram0x0700 => x"4bf2",
i_ram0x070a => x"1881",
i_ee0x2430 => x"18ef",
i_ram0x056f => x"0261",
i_ee0x2411 => x"ffbb",
i_ee0x2414 => x"f2f2",
i_ee0x241b => x"e0ef",
i_ee0x25af => x"08a0",
i_ee0x2437 => x"5354",
i_ee0x2434 => x"5454",
i_ram0x0708 => x"ffca",
i_ram0x0728 => x"ffc8",
i_ee0x243a => x"fbb5",
i_ee0x243b => x"044b",
i_ee0x243c => x"f020",
i_ee0x2439 => x"e446",
i_ee0x2420 => x"79a6",
i_ee0x2421 => x"2f44",
i_ee0x2424 => x"3333",
i_ee0x242b => x"3333",
i_ee0x258f => x"08a0",
i_ee0x243d => x"9797",
i_ee0x243f => x"2889",
i_pixelpattern => std_logic_vector (to_unsigned (368, 14)), -- px 12,16
o_Vdd => o_Vdd,
o_rdy => o_rdy
);

--  Test Bench Statements
tbprocess : PROCESS
BEGIN
i_reset <= '1';
wait for 254.3 ns; -- wait until global set/reset completes
i_reset <= '0';
wait for clock_period*10;
-- Add user defined stimulus here
i_run <= '1'; wait for clock_period; i_run <= '0';
wait for clock_period*10;
wait for 100 us;
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

END;
