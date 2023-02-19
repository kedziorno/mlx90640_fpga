-- TestBench Template 
-- calculateTa

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

ENTITY tb_calculateTa IS
END tb_calculateTa;

ARCHITECTURE tb OF tb_calculateTa IS 

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

component calculateTa is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
i_ram0x072a : in fd2ft; -- from VDD bram
i_kvdd : in fd2ft; -- from VDD bram
i_vdd25 : in fd2ft; -- from VDD bram
o_Ta : out fd2ft; -- output Ta
o_rdy : out std_logic
);
end component calculateTa;

signal calculateTa_clock : std_logic;
signal calculateTa_reset : std_logic;
signal calculateTa_run : std_logic;
signal calculateTa_i2c_mem_ena : STD_LOGIC;
signal calculateTa_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateTa_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculateTa_ram0x072a : fd2ft; -- from VDD bram
signal calculateTa_kvdd : fd2ft; -- from VDD bram
signal calculateTa_vdd25 : fd2ft; -- from VDD bram
signal calculateTa_Ta : fd2ft; -- output Ta
signal calculateTa_rdy : std_logic;

constant clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (calculateTa_Ta);

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => calculateTa_clock,
ena => calculateTa_i2c_mem_ena,
wea => "0",
addra => calculateTa_i2c_mem_addra,
dina => (others => '0'),
douta => calculateTa_i2c_mem_douta
);

cp : process
begin
	calculateTa_clock <= '0';
	wait for clock_period/2;
	calculateTa_clock <= '1';
	wait for clock_period/2;
end process cp;

-- Component Instantiation
uut : calculateTa port map (
i_clock => calculateTa_clock,
i_reset => calculateTa_reset,
i_run => calculateTa_run,
i2c_mem_ena => calculateTa_i2c_mem_ena,
i2c_mem_addra => calculateTa_i2c_mem_addra,
i2c_mem_douta => calculateTa_i2c_mem_douta,
i_ram0x072a => calculateTa_ram0x072a,
i_kvdd => calculateTa_kvdd,
i_vdd25 => calculateTa_vdd25,
o_Ta => calculateTa_Ta,
o_rdy => calculateTa_rdy
);

--i_ee0x2432 => x"5952",
--i_ee0x2431 => x"2ff1",
--i_ee0x2410 => x"4210",
--i_kvdd => x"C5480000",
--i_vdd25 => x"C6440000",
--i_ram0x072a => x"c64cec00",
--i_ram0x0720 => x"06af",
--i_ram0x0700 => x"4bf2",

tbprocess : PROCESS
BEGIN
calculateTa_reset <= '1';
wait for 254.3 ns; -- wait until global set/reset completes
calculateTa_reset <= '0';
wait for clock_period*10;
-- Add user defined stimulus here
calculateTa_kvdd <= x"C5480000";
calculateTa_vdd25 <= x"C6440000";
calculateTa_ram0x072a <= x"c64cec00";
calculateTa_run <= '1'; wait for clock_period; calculateTa_run <= '0';
wait until calculateTa_rdy = '1';
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

END tb;
