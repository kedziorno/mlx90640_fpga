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

SIGNAL i_clock :  std_logic := '0';
SIGNAL i_reset :  std_logic := '0';
SIGNAL i_run :  std_logic := '0';
SIGNAL o_Vdd : fd2ft;
SIGNAL o_kvdd : fd2ft;
SIGNAL o_vdd25 : fd2ft;
SIGNAL o_ram0x072a : fd2ft;
SIGNAL o_rdy : std_logic;

constant clock_period : time := 10 ns;
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
o_Vdd => o_Vdd,
o_kvdd => o_kvdd,
o_vdd25 => o_vdd25,
o_ram0x072a => o_ram0x072a,
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
