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
component calculateVdd is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_Vdd : out fd2ft; -- output Vdd
o_kvdd : out fd2ft;
o_vdd25 : out fd2ft;
o_ram0x072a : out fd2ft;
o_rdy : out std_logic
);
end component calculateVdd;
--
signal calculateVdd_clock : std_logic;
signal calculateVdd_reset : std_logic;
signal calculateVdd_run : std_logic;
signal calculateVdd_i2c_mem_ena : STD_LOGIC;
signal calculateVdd_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateVdd_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculateVdd_Vdd : fd2ft; -- output Vdd
signal calculateVdd_kvdd : fd2ft;
signal calculateVdd_vdd25 : fd2ft;
signal calculateVdd_ram0x072a : fd2ft;
signal calculateVdd_rdy : std_logic;

constant clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (calculateVdd_Vdd);

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => calculateVdd_clock,
ena => calculateVdd_i2c_mem_ena,
wea => "0",
addra => calculateVdd_i2c_mem_addra,
dina => (others => '0'),
douta => calculateVdd_i2c_mem_douta
);

cp : process
begin
	calculateVdd_clock <= '0';
	wait for clock_period/2;
	calculateVdd_clock <= '1';
	wait for clock_period/2;
end process cp;

-- Component Instantiation
uut : calculateVdd port map (
i_clock => calculateVdd_clock,
i_reset => calculateVdd_reset,
i_run => calculateVdd_run,
i2c_mem_ena => calculateVdd_i2c_mem_ena,
i2c_mem_addra => calculateVdd_i2c_mem_addra,
i2c_mem_douta => calculateVdd_i2c_mem_douta,
o_Vdd => calculateVdd_Vdd,
o_kvdd => calculateVdd_kvdd,
o_vdd25 => calculateVdd_vdd25,
o_ram0x072a => calculateVdd_ram0x072a,
o_rdy => calculateVdd_rdy
);

--  Test Bench Statements
tbprocess : PROCESS
BEGIN
calculateVdd_reset <= '1';
wait for 254.3 ns; -- wait until global set/reset completes
calculateVdd_reset <= '0';
wait for clock_period*10;
-- Add user defined stimulus here
calculateVdd_run <= '1'; wait for clock_period; calculateVdd_run <= '0';
wait until calculateVdd_rdy = '1';
wait for 100 ns;
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

END;
