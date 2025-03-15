-- TestBench Template 
-- ExtractCPParameters

library ieee, ieee_proposed;
--library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;


--library UNISIM;
--use UNISIM.VComponents.all;

--use work.p_fphdl_package1.all;

ENTITY tb_ExtractCPParameters IS
END tb_ExtractCPParameters;

ARCHITECTURE tb OF tb_ExtractCPParameters IS 

-- Component Declaration
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
o_cpAlpha0 : out std_logic_vector (31 downto 0);
o_cpAlpha1 : out std_logic_vector (31 downto 0);
o_cpOffset0 : out std_logic_vector (31 downto 0);
o_cpOffset1 : out std_logic_vector (31 downto 0);
o_cpKv : out std_logic_vector (31 downto 0);
o_cpKta : out std_logic_vector (31 downto 0);
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
signal ExtractCPParameters_cpAlpha0 : std_logic_vector (31 downto 0) := (others => '0');
signal ExtractCPParameters_cpAlpha1 : std_logic_vector (31 downto 0) := (others => '0');
signal ExtractCPParameters_cpOffset0 : std_logic_vector (31 downto 0) := (others => '0');
signal ExtractCPParameters_cpOffset1 : std_logic_vector (31 downto 0) := (others => '0');
signal ExtractCPParameters_cpKv : std_logic_vector (31 downto 0) := (others => '0');
signal ExtractCPParameters_cpKta : std_logic_vector (31 downto 0) := (others => '0');
signal ExtractCPParameters_rdy : std_logic := '0';

constant clockperiod : time := 10 ns;

BEGIN

-- Component Instantiation
uut: ExtractCPParameters port map (
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

cp : process is
begin
ExtractCPParameters_clock <= '0';
wait for clockperiod/2;
ExtractCPParameters_clock <= '1';
wait for clockperiod/2;
end process cp;

--  Test Bench Statements
tbprocess1 : PROCESS IS
BEGIN
ExtractCPParameters_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
ExtractCPParameters_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod*10;
ExtractCPParameters_ee0x2420 <= x"79a6";
ExtractCPParameters_ee0x2438 <= x"2363";
ExtractCPParameters_ee0x2439 <= x"e446";
ExtractCPParameters_ee0x243a <= x"fbb5";
ExtractCPParameters_ee0x243b <= x"044b";
wait for clockperiod; ExtractCPParameters_run <= '1'; wait for clockperiod; ExtractCPParameters_run <= '0';
wait for 100 us;
report "done" severity failure;
END PROCESS tbprocess1;
--  End Test Bench 

END architecture tb;
