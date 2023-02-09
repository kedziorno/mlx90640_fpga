-- TestBench Template 
-- CalculateAlphaCP

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.p_fphdl_package1.all;

ENTITY tb_CalculateAlphaCP IS
END tb_CalculateAlphaCP;

ARCHITECTURE behavior OF tb_CalculateAlphaCP IS 

-- Component Declaration
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

constant clockperiod : time := 10 ns;

BEGIN

-- Component Instantiation
uut: CalculateAlphaCP
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

cp : process is
begin
	CalculateAlphaCP_clock <= '0';
	wait for clockperiod/2;
	CalculateAlphaCP_clock <= '1';
	wait for clockperiod/2;
end process cp;

--  Test Bench Statements
tbprocess : PROCESS
BEGIN
CalculateAlphaCP_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
CalculateAlphaCP_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod*10;
CalculateAlphaCP_ee0x2439 <= x"e446";
CalculateAlphaCP_ee0x2420 <= x"79a6";
wait for clockperiod;
CalculateAlphaCP_run <= '1'; wait for clockperiod; CalculateAlphaCP_run <= '0';
wait until CalculateAlphaCP_rdy = '1';
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

END architecture behavior;
