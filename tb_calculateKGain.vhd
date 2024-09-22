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

--use work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

ENTITY tb_calculateKGain IS
END tb_calculateKGain;

ARCHITECTURE tb OF tb_calculateKGain IS 

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT divfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

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
o_KGain : out std_logic_vector (31 downto 0);
o_rdy : out std_logic;

signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC

);
end component calculateKGain;
signal calculateKGain_clock : std_logic;
signal calculateKGain_reset : std_logic;
signal calculateKGain_run : std_logic;
signal calculateKGain_i2c_mem_ena : STD_LOGIC;
signal calculateKGain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateKGain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculateKGain_KGain : std_logic_vector (31 downto 0);
signal calculateKGain_rdy : std_logic;

signal calculateKGain_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal calculateKGain_fixed2floatond : STD_LOGIC;
signal calculateKGain_fixed2floatsclr : STD_LOGIC;
signal calculateKGain_fixed2floatce : STD_LOGIC;
signal calculateKGain_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateKGain_fixed2floatrdy : STD_LOGIC;

signal calculateKGain_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateKGain_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateKGain_divfpond : STD_LOGIC;
signal calculateKGain_divfpsclr : STD_LOGIC;
signal calculateKGain_divfpce : STD_LOGIC;
signal calculateKGain_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateKGain_divfprdy : STD_LOGIC;

signal fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;

signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpsclr : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : STD_LOGIC;

signal calculateKGain_fixed2floatclk : std_logic;
signal calculateKGain_divfpclk : std_logic;

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
o_rdy => calculateKGain_rdy,

fixed2floata => calculateKGain_fixed2floata,
fixed2floatond => calculateKGain_fixed2floatond,
fixed2floatsclr => calculateKGain_fixed2floatsclr,
fixed2floatce => calculateKGain_fixed2floatce,
fixed2floatr => calculateKGain_fixed2floatr,
fixed2floatrdy => calculateKGain_fixed2floatrdy,

divfpa => calculateKGain_divfpa,
divfpb => calculateKGain_divfpb,
divfpond => calculateKGain_divfpond,
divfpsclr => calculateKGain_divfpsclr,
divfpce => calculateKGain_divfpce,
divfpr => calculateKGain_divfpr,
divfprdy => calculateKGain_divfprdy

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
warning_neq_fp (calculateKGain_KGain, x"3f81ac57", "kgain");
report "rdy at 955ns";
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

calculateKGain_fixed2floatclk <= calculateKGain_clock;
inst_fixed2float : fixed2float
PORT MAP (
a => calculateKGain_fixed2floata,
operation_nd => calculateKGain_fixed2floatond,
clk => calculateKGain_fixed2floatclk,
sclr => calculateKGain_fixed2floatsclr,
ce => calculateKGain_fixed2floatce,
result => calculateKGain_fixed2floatr,
rdy => calculateKGain_fixed2floatrdy
);

calculateKGain_divfpclk <= calculateKGain_clock;
inst_divfp : divfp
PORT MAP (
a => calculateKGain_divfpa,
b => calculateKGain_divfpb,
operation_nd => calculateKGain_divfpond,
clk => calculateKGain_divfpclk,
sclr => calculateKGain_divfpsclr,
ce => calculateKGain_divfpce,
result => calculateKGain_divfpr,
rdy => calculateKGain_divfprdy
);

END tb;
