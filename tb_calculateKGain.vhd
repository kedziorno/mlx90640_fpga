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

COMPONENT tb_i2c_mem
PORT (
clka : IN STD_LOGIC;
ena : IN STD_LOGIC;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

-- Component Declaration
component calculateKGain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_KGain : out fd2ft;
o_rdy : out std_logic
);
end component calculateKGain;
signal calculateKGain_clock : std_logic;
signal calculateKGain_reset : std_logic;
signal calculateKGain_run : std_logic;
signal calculateKGain_i2c_mem_ena : STD_LOGIC;
signal calculateKGain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateKGain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculateKGain_KGain : fd2ft;
signal calculateKGain_rdy : std_logic;

constant clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (calculateKGain_KGain);

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => calculateKGain_clock,
ena => calculateKGain_i2c_mem_ena,
wea => "0",
addra => calculateKGain_i2c_mem_addra,
dina => (others => '0'),
douta => calculateKGain_i2c_mem_douta
);

cp : process
begin
	calculateKGain_clock <= '0';
	wait for clock_period/2;
	calculateKGain_clock <= '1';
	wait for clock_period/2;
end process cp;

-- Component Instantiation
uut: calculateKGain port map (
i_clock => calculateKGain_clock,
i_reset => calculateKGain_reset,
i_run => calculateKGain_run,
i2c_mem_ena => calculateKGain_i2c_mem_ena,
i2c_mem_addra => calculateKGain_i2c_mem_addra,
i2c_mem_douta => calculateKGain_i2c_mem_douta,
o_KGain => calculateKGain_KGain,
o_rdy => calculateKGain_rdy
);


--  Test Bench Statements
tbprocess : PROCESS
BEGIN
calculateKGain_reset <= '1';
wait for 254.3 ns; -- wait until global set/reset completes
calculateKGain_reset <= '0';
wait for clock_period*10;
-- Add user defined stimulus here
calculateKGain_run <= '1'; wait for clock_period; calculateKGain_run <= '0';
wait until calculateKGain_rdy = '1';
wait for 1 ps;
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

END tb;
