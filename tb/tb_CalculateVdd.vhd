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

--use work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

ENTITY tb_CalculateVdd IS
END tb_CalculateVdd;

ARCHITECTURE tb OF tb_CalculateVdd IS 

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
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

COMPONENT mulfp
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

COMPONENT addfp
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

COMPONENT subfp
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
component calculateVdd is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_Vdd : out std_logic_vector (31 downto 0); -- output Vdd
o_rdy : out std_logic;

fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr :  in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;

divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : out STD_LOGIC;
divfpce : out STD_LOGIC;
divfpsclr : out STD_LOGIC;
divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : in STD_LOGIC;

mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;

addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : out STD_LOGIC;
addfpce : out STD_LOGIC;
addfpsclr : out STD_LOGIC;
addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : in STD_LOGIC;

subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : out STD_LOGIC;
subfpce : out STD_LOGIC;
subfpsclr : out STD_LOGIC;
subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : in STD_LOGIC
);
end component calculateVdd;

signal calculateVdd_clock : std_logic;
signal calculateVdd_reset : std_logic;
signal calculateVdd_run : std_logic;
signal calculateVdd_i2c_mem_ena : STD_LOGIC;
signal calculateVdd_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateVdd_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculateVdd_Vdd : std_logic_vector (31 downto 0); -- output Vdd
signal calculateVdd_rdy : std_logic;
signal calculateVdd_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal calculateVdd_fixed2floatond : STD_LOGIC;
signal calculateVdd_fixed2floatce : STD_LOGIC;
signal calculateVdd_fixed2floatsclr : STD_LOGIC;
signal calculateVdd_fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_fixed2floatrdy : STD_LOGIC;
signal calculateVdd_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_divfpond : STD_LOGIC;
signal calculateVdd_divfpce : STD_LOGIC;
signal calculateVdd_divfpsclr : STD_LOGIC;
signal calculateVdd_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_divfprdy : STD_LOGIC;
signal calculateVdd_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_mulfpond : STD_LOGIC;
signal calculateVdd_mulfpce : STD_LOGIC;
signal calculateVdd_mulfpsclr : STD_LOGIC;
signal calculateVdd_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_mulfprdy : STD_LOGIC;
signal calculateVdd_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_addfpond : STD_LOGIC;
signal calculateVdd_addfpce : STD_LOGIC;
signal calculateVdd_addfpsclr : STD_LOGIC;
signal calculateVdd_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_addfprdy : STD_LOGIC;
signal calculateVdd_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_subfpond : STD_LOGIC;
signal calculateVdd_subfpce : STD_LOGIC;
signal calculateVdd_subfpsclr : STD_LOGIC;
signal calculateVdd_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_subfprdy : STD_LOGIC;

signal CalculateVdd_fixed2floatclk : std_logic;
signal CalculateVdd_addfpclk : std_logic;
signal CalculateVdd_subfpclk : std_logic;
signal CalculateVdd_mulfpclk : std_logic;
signal CalculateVdd_divfpclk : std_logic;

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
i_clock => CalculateVdd_clock,
i_reset => CalculateVdd_reset,
i_run => CalculateVdd_run,

i2c_mem_ena => CalculateVdd_i2c_mem_ena,
i2c_mem_addra => CalculateVdd_i2c_mem_addra,
i2c_mem_douta => CalculateVdd_i2c_mem_douta,

o_Vdd => CalculateVdd_Vdd, -- output Vdd
o_rdy => CalculateVdd_rdy,

fixed2floata => CalculateVdd_fixed2floata,
fixed2floatond => CalculateVdd_fixed2floatond,
fixed2floatce => CalculateVdd_fixed2floatce,
fixed2floatsclr => CalculateVdd_fixed2floatsclr,
fixed2floatr => CalculateVdd_fixed2floatr,
fixed2floatrdy => CalculateVdd_fixed2floatrdy,

divfpa => CalculateVdd_divfpa,
divfpb => CalculateVdd_divfpb,
divfpond => CalculateVdd_divfpond,
divfpce => CalculateVdd_divfpce,
divfpsclr => CalculateVdd_divfpsclr,
divfpr => CalculateVdd_divfpr,
divfprdy => CalculateVdd_divfprdy,

mulfpa => CalculateVdd_mulfpa,
mulfpb => CalculateVdd_mulfpb,
mulfpond => CalculateVdd_mulfpond,
mulfpce => CalculateVdd_mulfpce,
mulfpsclr => CalculateVdd_mulfpsclr,
mulfpr => CalculateVdd_mulfpr,
mulfprdy => CalculateVdd_mulfprdy,

addfpa => CalculateVdd_addfpa,
addfpb => CalculateVdd_addfpb,
addfpond => CalculateVdd_addfpond,
addfpce => CalculateVdd_addfpce,
addfpsclr => CalculateVdd_addfpsclr,
addfpr => CalculateVdd_addfpr,
addfprdy => CalculateVdd_addfprdy,

subfpa => CalculateVdd_subfpa,
subfpb => CalculateVdd_subfpb,
subfpond => CalculateVdd_subfpond,
subfpce => CalculateVdd_subfpce,
subfpsclr => CalculateVdd_subfpsclr,
subfpr => CalculateVdd_subfpr,
subfprdy  => CalculateVdd_subfprdy

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
warning_neq_fp (CalculateVdd_Vdd, x"4052b852", "Vdd");
--report "rdy at 1.695us";
--report "rdy at 1.645us";
report "rdy at 1.605us";
wait for 100 ns;
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

CalculateVdd_fixed2floatclk <= calculateVdd_clock;
CalculateVdd_addfpclk <= calculateVdd_clock;
CalculateVdd_subfpclk <= calculateVdd_clock;
CalculateVdd_mulfpclk <= calculateVdd_clock;
CalculateVdd_divfpclk <= calculateVdd_clock;

inst_fixed2float : fixed2float
PORT MAP (
a => CalculateVdd_fixed2floata,
operation_nd => CalculateVdd_fixed2floatond,
clk => CalculateVdd_fixed2floatclk,
sclr => CalculateVdd_fixed2floatsclr,
ce => CalculateVdd_fixed2floatce,
result => CalculateVdd_fixed2floatr,
rdy => CalculateVdd_fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => CalculateVdd_divfpa,
b => CalculateVdd_divfpb,
operation_nd => CalculateVdd_divfpond,
clk => CalculateVdd_divfpclk,
sclr => CalculateVdd_divfpsclr,
ce => CalculateVdd_divfpce,
result => CalculateVdd_divfpr,
rdy => CalculateVdd_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => CalculateVdd_mulfpa,
b => CalculateVdd_mulfpb,
operation_nd => CalculateVdd_mulfpond,
clk => CalculateVdd_mulfpclk,
sclr => CalculateVdd_mulfpsclr,
ce => CalculateVdd_mulfpce,
result => CalculateVdd_mulfpr,
rdy => CalculateVdd_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => CalculateVdd_addfpa,
b => CalculateVdd_addfpb,
operation_nd => CalculateVdd_addfpond,
clk => CalculateVdd_addfpclk,
sclr => CalculateVdd_addfpsclr,
ce => CalculateVdd_addfpce,
result => CalculateVdd_addfpr,
rdy => CalculateVdd_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => CalculateVdd_subfpa,
b => CalculateVdd_subfpb,
operation_nd => CalculateVdd_subfpond,
clk => CalculateVdd_subfpclk,
sclr => CalculateVdd_subfpsclr,
ce => CalculateVdd_subfpce,
result => CalculateVdd_subfpr,
rdy => CalculateVdd_subfprdy
);

END;
