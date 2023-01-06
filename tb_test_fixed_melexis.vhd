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
o_out1 : out st_sfixed_max;
o_in1 : out st_sfixed_max;
o_in2 : out st_sfixed_max
);
end component test_fixed_melexis;

SIGNAL i_clock :  std_logic;
SIGNAL i_reset :  std_logic;
SIGNAL i_run :  std_logic;
SIGNAL o_out1 :  st_sfixed_max;
SIGNAL o_in1 :  st_sfixed_max;
SIGNAL o_in2 :  st_sfixed_max;

constant clock_period : time := 500 ns;
constant G_C_WAIT1 : integer := 16;

signal out1r,in1r,in2r : real;
signal out1,in1,in2 : st_sfixed_max;

BEGIN

out1r <= to_real(o_out1);
in1r <= to_real(o_in1);
in2r <= to_real(o_in2);

-- Component Instantiation
uut : test_fixed_melexis 
generic map (
G_C_WAIT1 => G_C_WAIT1
)
port map (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
o_out1 => o_out1,
o_in1 => o_in1,
o_in2 => o_in2
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
