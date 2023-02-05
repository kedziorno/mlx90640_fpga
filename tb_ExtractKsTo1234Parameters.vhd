-- TestBench Template 
-- ExtractKsTo1234Parameters

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.p_fphdl_package1.all;

ENTITY tb_ExtractKsTo1234Parameters IS
END tb_ExtractKsTo1234Parameters;

ARCHITECTURE tb OF tb_ExtractKsTo1234Parameters IS 

-- Component Declaration
component ExtractKsTo1234Parameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x243f : in slv16; -- kstoscale
i_ee0x243d : in slv16; -- ksto1ee,ksto2ee
i_ee0x243e : in slv16; -- ksto3ee,ksto4ee
o_ksto1 : out fd2ft;
o_ksto2 : out fd2ft;
o_ksto3 : out fd2ft;
o_ksto4 : out fd2ft
);
end component ExtractKsTo1234Parameters;

signal ExtractKsTo1234Parameters_clock : std_logic := '0';
signal ExtractKsTo1234Parameters_reset : std_logic := '0';
signal ExtractKsTo1234Parameters_run : std_logic := '0';
signal ExtractKsTo1234Parameters_ee0x243f : slv16 := (others => '0'); -- kstoscale
signal ExtractKsTo1234Parameters_ee0x243d : slv16 := (others => '0'); -- ksto1ee,ksto2ee
signal ExtractKsTo1234Parameters_ee0x243e : slv16 := (others => '0'); -- ksto3ee,ksto4ee
signal ExtractKsTo1234Parameters_ksto1 : fd2ft := (others => '0');
signal ExtractKsTo1234Parameters_ksto2 : fd2ft := (others => '0');
signal ExtractKsTo1234Parameters_ksto3 : fd2ft := (others => '0');
signal ExtractKsTo1234Parameters_ksto4 : fd2ft := (others => '0');

constant clockperiod : time := 10 ns;

BEGIN

clkp0 : process
begin
	ExtractKsTo1234Parameters_clock <= '0';
	wait for clockperiod/2;
	ExtractKsTo1234Parameters_clock <= '1';
	wait for clockperiod/2;
end process clkp0;

-- Component Instantiation
uut : ExtractKsTo1234Parameters port map (
i_clock => ExtractKsTo1234Parameters_clock,
i_reset => ExtractKsTo1234Parameters_reset,
i_run => ExtractKsTo1234Parameters_run,
i_ee0x243f => ExtractKsTo1234Parameters_ee0x243f,
i_ee0x243d => ExtractKsTo1234Parameters_ee0x243d,
i_ee0x243e => ExtractKsTo1234Parameters_ee0x243e,
o_ksto1 => ExtractKsTo1234Parameters_ksto1,
o_ksto2 => ExtractKsTo1234Parameters_ksto2,
o_ksto3 => ExtractKsTo1234Parameters_ksto3,
o_ksto4 => ExtractKsTo1234Parameters_ksto4
);

--  Test Bench Statements
tbprocess : PROCESS
BEGIN
ExtractKsTo1234Parameters_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
ExtractKsTo1234Parameters_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod;
ExtractKsTo1234Parameters_ee0x243f <= x"2889";
ExtractKsTo1234Parameters_ee0x243d <= x"9797";
ExtractKsTo1234Parameters_ee0x243e <= x"9797";
wait for clockperiod;
ExtractKsTo1234Parameters_run <= '1'; wait for clockperiod; ExtractKsTo1234Parameters_run <= '0';
wait for 10 us;

report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

END tb;
