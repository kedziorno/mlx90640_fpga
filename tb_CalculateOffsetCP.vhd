-- TestBench Template 
-- CalculateOffsetCP

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.p_fphdl_package3.all;

ENTITY tb_CalculateOffsetCP IS
END tb_CalculateOffsetCP;

ARCHITECTURE behavior OF tb_CalculateOffsetCP IS 

-- Component Declaration
component CalculateOffsetCP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x243a : in std_logic_vector (15 downto 0); -- offcpsubpage1delta/offcpsubpage0 - 6/10bit
o_offcpsubpage0 : out std_logic_vector (31 downto 0);
o_offcpsubpage1 : out std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
end component CalculateOffsetCP;

signal CalculateOffsetCP_clock : std_logic := '0';
signal CalculateOffsetCP_reset : std_logic := '0';
signal CalculateOffsetCP_run : std_logic := '0';
signal CalculateOffsetCP_ee0x243a : std_logic_vector (15 downto 0) := (others => '0');
signal CalculateOffsetCP_offcpsubpage0 : std_logic_vector (31 downto 0) := (others => '0');
signal CalculateOffsetCP_offcpsubpage1 : std_logic_vector (31 downto 0) := (others => '0');
signal CalculateOffsetCP_rdy : std_logic := '0';

constant clockperiod : time := 10 ns;

BEGIN

-- Component Instantiation
uut: CalculateOffsetCP
port map (
i_clock => CalculateOffsetCP_clock,
i_reset => CalculateOffsetCP_reset,
i_run => CalculateOffsetCP_run,
i_ee0x243a => CalculateOffsetCP_ee0x243a,
o_offcpsubpage0 => CalculateOffsetCP_offcpsubpage0,
o_offcpsubpage1 => CalculateOffsetCP_offcpsubpage1,
o_rdy => CalculateOffsetCP_rdy
);

cp : process is
begin
	CalculateOffsetCP_clock <= '0';
	wait for clockperiod/2;
	CalculateOffsetCP_clock <= '1';
	wait for clockperiod/2;
end process cp;

--  Test Bench Statements
tbprocess : PROCESS
BEGIN
CalculateOffsetCP_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
CalculateOffsetCP_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod*10;
CalculateOffsetCP_ee0x243a <= x"fbb5";
wait for clockperiod;
CalculateOffsetCP_run <= '1'; wait for clockperiod; CalculateOffsetCP_run <= '0';
wait until CalculateOffsetCP_rdy = '1';
wait for 1 ps;
warning_neq_fp (CalculateOffsetCP_offcpsubpage0, x"c2960000", "offcpsubpage0");
warning_neq_fp (CalculateOffsetCP_offcpsubpage1, x"c29a0000", "offcpsubpage1");
--report "end at 415ns";
report "end at 375ns";
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

END architecture behavior;
