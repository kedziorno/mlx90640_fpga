-- TestBench Template 
-- ExtractAlphaCorrRange1234

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

--use work.p_fphdl_package1.all;

ENTITY tb_ExtractAlphaCorrRange1234 IS
END tb_ExtractAlphaCorrRange1234;

ARCHITECTURE tb OF tb_ExtractAlphaCorrRange1234 IS 

-- Component Declaration
component ExtractAlphaCorrRange1234 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x243d : in slv16; -- ksto1ee,ksto2ee
i_ee0x243e : in slv16; -- ksto3ee,ksto4ee
i_ee0x243f : in slv16; -- kstoscale,ct34param
o_alphacorrrange1 : out std_logic_vector (31 downto 0);
o_alphacorrrange2 : out std_logic_vector (31 downto 0);
o_alphacorrrange3 : out std_logic_vector (31 downto 0);
o_alphacorrrange4 : out std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
end component ExtractAlphaCorrRange1234;

signal ExtractAlphaCorrRange1234_clock : std_logic := '0';
signal ExtractAlphaCorrRange1234_reset : std_logic := '0';
signal ExtractAlphaCorrRange1234_run : std_logic := '0';
signal ExtractAlphaCorrRange1234_ee0x243d : slv16 := (others => '0'); -- ksto1ee,ksto2ee
signal ExtractAlphaCorrRange1234_ee0x243e : slv16 := (others => '0'); -- ksto3ee,ksto4ee
signal ExtractAlphaCorrRange1234_ee0x243f : slv16 := (others => '0'); -- kstoscale,ct34param
signal ExtractAlphaCorrRange1234_alphacorrrange1 : std_logic_vector (31 downto 0);
signal ExtractAlphaCorrRange1234_alphacorrrange2 : std_logic_vector (31 downto 0);
signal ExtractAlphaCorrRange1234_alphacorrrange3 : std_logic_vector (31 downto 0);
signal ExtractAlphaCorrRange1234_alphacorrrange4 : std_logic_vector (31 downto 0);
signal ExtractAlphaCorrRange1234_rdy : std_logic;


constant clockperiod : time := 10 ns;

BEGIN

uut : ExtractAlphaCorrRange1234 port map (
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

clkp0 : process
begin
	ExtractAlphaCorrRange1234_clock <= '0';
	wait for clockperiod/2;
	ExtractAlphaCorrRange1234_clock <= '1';
	wait for clockperiod/2;
end process clkp0;

-- Component Instantiation

--  Test Bench Statements
tbprocess : PROCESS
BEGIN
ExtractAlphaCorrRange1234_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
ExtractAlphaCorrRange1234_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod;
ExtractAlphaCorrRange1234_ee0x243f <= x"2889";
ExtractAlphaCorrRange1234_ee0x243d <= x"9797";
ExtractAlphaCorrRange1234_ee0x243e <= x"9797";
wait for clockperiod;
ExtractAlphaCorrRange1234_run <= '1'; wait for clockperiod; ExtractAlphaCorrRange1234_run <= '0';
wait for 10 us;

report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

END tb;
