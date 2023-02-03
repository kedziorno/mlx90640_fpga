-- TestBench Template 
-- calculateKGain

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

ENTITY tb_calculateKGain IS
END tb_calculateKGain;

ARCHITECTURE tb OF tb_calculateKGain IS 

-- Component Declaration
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

signal i_clock : std_logic;
signal i_reset : std_logic;
signal i_run : std_logic;
signal o_KGain : fd2ft;
signal o_rdy : std_logic;

constant clock_period : time := 10 ns;
constant G_C_WAIT1 : integer := 16;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (o_KGain);

cp : process
begin
	i_clock <= '0';
	wait for clock_period/2;
	i_clock <= '1';
	wait for clock_period/2;
end process cp;

-- Component Instantiation
uut: calculateKGain port map (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
i_ee0x2430 => x"18ef",
i_ram0x070a => x"1881",
o_KGain => o_KGain,
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

END tb;
