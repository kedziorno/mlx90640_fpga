-- TestBench Template 

LIBRARY ieee,ieee_proposed;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee_proposed.fixed_pkg.all;

USE work.p_fphdl_package1.all;

ENTITY tb_test_fixed_melexis IS
END tb_test_fixed_melexis;

ARCHITECTURE arch OF tb_test_fixed_melexis IS

-- Component Declaration
component test_fixed_melexis is
generic (
G_C_WAIT1 : integer := 0
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2433 : in slv16;
o_out1 : out fd2ft
);
end component test_fixed_melexis;

SIGNAL i_clock :  std_logic;
SIGNAL i_reset :  std_logic;
SIGNAL i_run :  std_logic;
SIGNAL o_out1 :  fd2ft;

constant clock_period : time := 500 ns;
constant G_C_WAIT1 : integer := 16;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (o_out1);

-- Component Instantiation
uut : test_fixed_melexis 
generic map (
G_C_WAIT1 => G_C_WAIT1
)
port map (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
i_ee0x2433 => x"9d68",
o_out1 => o_out1
);

cp : process
begin
	i_clock <= '0';
	wait for clock_period/2;
	i_clock <= '1';
	wait for clock_period/2;
end process cp;

--  Test Bench Statements
tb_run: PROCESS
BEGIN
i_reset <= '1';
wait for 600 ns; -- wait until global set/reset completes
i_reset <= '0';
-- Add user defined stimulus here
i_run <= '1';
wait for clock_period*100;
i_run <= '0';
wait; -- will wait forever
END PROCESS tb_run;
--  End Test Bench 

tb_wait : PROCESS
BEGIN
wait for 30 ms;
report "done simulation" severity failure;
END PROCESS tb_wait;

END ARCHITECTURE arch;
