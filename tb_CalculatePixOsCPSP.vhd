-- TestBench Template 
-- CalculatePixOS

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_CalculatePixOsCPSP IS
END tb_CalculatePixOsCPSP;

ARCHITECTURE behavior OF tb_CalculatePixOsCPSP IS 

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
component CalculatePixOsCPSP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_VddV0 : in std_logic_vector (31 downto 0);
i_const1 : in std_logic_vector (31 downto 0);

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_pixoscpsp0 : out std_logic_vector (31 downto 0);
o_pixoscpsp1 : out std_logic_vector (31 downto 0);

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
signal divfprdy : in STD_LOGIC;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;

signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC;

signal subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : out STD_LOGIC;
signal subfpsclr : out STD_LOGIC;
signal subfpce : out STD_LOGIC;
signal subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : in STD_LOGIC
);
end component CalculatePixOsCPSP;
signal CalculatePixOsCPSP_clock : std_logic;
signal CalculatePixOsCPSP_reset : std_logic;
signal CalculatePixOsCPSP_run : std_logic;
signal CalculatePixOsCPSP_Ta : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_Ta0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_Vdd : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_VddV0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_const1 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_i2c_mem_ena : STD_LOGIC;
signal CalculatePixOsCPSP_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixOsCPSP_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixOsCPSP_pixoscpsp0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_pixoscpsp1 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_rdy : std_logic;

signal CalculatePixOsCPSP_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculatePixOsCPSP_fixed2floatond : STD_LOGIC;
signal CalculatePixOsCPSP_fixed2floatsclr : STD_LOGIC;
signal CalculatePixOsCPSP_fixed2floatce : STD_LOGIC;
signal CalculatePixOsCPSP_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_fixed2floatrdy : STD_LOGIC;

signal CalculatePixOsCPSP_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_divfpond : STD_LOGIC;
signal CalculatePixOsCPSP_divfpsclr : STD_LOGIC;
signal CalculatePixOsCPSP_divfpce : STD_LOGIC;
signal CalculatePixOsCPSP_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_divfprdy : STD_LOGIC;

signal CalculatePixOsCPSP_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_mulfpond : STD_LOGIC;
signal CalculatePixOsCPSP_mulfpsclr : STD_LOGIC;
signal CalculatePixOsCPSP_mulfpce : STD_LOGIC;
signal CalculatePixOsCPSP_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_mulfprdy : STD_LOGIC;

signal CalculatePixOsCPSP_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_addfpond : STD_LOGIC;
signal CalculatePixOsCPSP_addfpsclr : STD_LOGIC;
signal CalculatePixOsCPSP_addfpce : STD_LOGIC;
signal CalculatePixOsCPSP_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_addfprdy : STD_LOGIC;

signal CalculatePixOsCPSP_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_subfpond : STD_LOGIC;
signal CalculatePixOsCPSP_subfpsclr : STD_LOGIC;
signal CalculatePixOsCPSP_subfpce : STD_LOGIC;
signal CalculatePixOsCPSP_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_subfprdy : STD_LOGIC;

signal CalculatePixOsCPSP_fixed2floatclk : STD_LOGIC;
signal CalculatePixOsCPSP_addfpclk : STD_LOGIC;
signal CalculatePixOsCPSP_subfpclk : STD_LOGIC;
signal CalculatePixOsCPSP_mulfpclk : STD_LOGIC;
signal CalculatePixOsCPSP_divfpclk : STD_LOGIC;

constant clockperiod : time := 10 ns;

BEGIN

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculatePixOsCPSP_clock,
ena => CalculatePixOsCPSP_i2c_mem_ena,
wea => "0",
addra => CalculatePixOsCPSP_i2c_mem_addra,
dina => (others => '0'),
douta => CalculatePixOsCPSP_i2c_mem_douta
);

cp : process is
begin
	CalculatePixOsCPSP_clock <= '0';
	wait for clockperiod/2;
	CalculatePixOsCPSP_clock <= '1';
	wait for clockperiod/2;
end process cp;

-- Component Instantiation
uut : CalculatePixOsCPSP port map (
i_clock => CalculatePixOsCPSP_clock,
i_reset => CalculatePixOsCPSP_reset,
i_run => CalculatePixOsCPSP_run,
i_Ta => CalculatePixOsCPSP_Ta,
i_Ta0 => CalculatePixOsCPSP_Ta0,
i_Vdd => CalculatePixOsCPSP_Vdd,
i_VddV0 => CalculatePixOsCPSP_VddV0,
i_const1 => CalculatePixOsCPSP_const1,
i2c_mem_ena => CalculatePixOsCPSP_i2c_mem_ena,
i2c_mem_addra => CalculatePixOsCPSP_i2c_mem_addra,
i2c_mem_douta => CalculatePixOsCPSP_i2c_mem_douta,
o_pixoscpsp0 => CalculatePixOsCPSP_pixoscpsp0,
o_pixoscpsp1 => CalculatePixOsCPSP_pixoscpsp1,
o_rdy => CalculatePixOsCPSP_rdy,

fixed2floata => CalculatePixOSCPSP_fixed2floata,
fixed2floatond => CalculatePixOSCPSP_fixed2floatond,
fixed2floatsclr => CalculatePixOSCPSP_fixed2floatsclr,
fixed2floatce => CalculatePixOSCPSP_fixed2floatce,
fixed2floatr => CalculatePixOSCPSP_fixed2floatr,
fixed2floatrdy => CalculatePixOSCPSP_fixed2floatrdy,

divfpa => CalculatePixOSCPSP_divfpa,
divfpb => CalculatePixOSCPSP_divfpb,
divfpond => CalculatePixOSCPSP_divfpond,
divfpsclr => CalculatePixOSCPSP_divfpsclr,
divfpce => CalculatePixOSCPSP_divfpce,
divfpr => CalculatePixOSCPSP_divfpr,
divfprdy => CalculatePixOSCPSP_divfprdy,

mulfpa => CalculatePixOSCPSP_mulfpa,
mulfpb => CalculatePixOSCPSP_mulfpb,
mulfpond => CalculatePixOSCPSP_mulfpond,
mulfpsclr => CalculatePixOSCPSP_mulfpsclr,
mulfpce => CalculatePixOSCPSP_mulfpce,
mulfpr => CalculatePixOSCPSP_mulfpr,
mulfprdy => CalculatePixOSCPSP_mulfprdy,

addfpa => CalculatePixOSCPSP_addfpa,
addfpb => CalculatePixOSCPSP_addfpb,
addfpond => CalculatePixOSCPSP_addfpond,
addfpsclr => CalculatePixOSCPSP_addfpsclr,
addfpce => CalculatePixOSCPSP_addfpce,
addfpr => CalculatePixOSCPSP_addfpr,
addfprdy => CalculatePixOSCPSP_addfprdy,

subfpa => CalculatePixOSCPSP_subfpa,
subfpb => CalculatePixOSCPSP_subfpb,
subfpond => CalculatePixOSCPSP_subfpond,
subfpsclr => CalculatePixOSCPSP_subfpsclr,
subfpce => CalculatePixOSCPSP_subfpce,
subfpr => CalculatePixOSCPSP_subfpr,
subfprdy => CalculatePixOSCPSP_subfprdy

);

--  Test Bench Statements
tb : PROCESS
BEGIN
CalculatePixOsCPSP_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
CalculatePixOsCPSP_reset <= '0';
wait for clockperiod*10;
-- Add user defined stimulus here
CalculatePixOSCPSP_const1 <= x"3F800000"; -- 1
CalculatePixOSCPSP_Ta <= x"4207F54F"; -- 33.989559
CalculatePixOSCPSP_Ta0 <= x"41C80000"; -- 25
CalculatePixOSCPSP_Vdd <= x"40D2F5C3"; -- 6.5925
CalculatePixOSCPSP_VddV0 <= x"40533333"; -- 3.3
CalculatePixOsCPSP_run <= '1'; wait for clockperiod; CalculatePixOsCPSP_run <= '0';
wait until CalculatePixOsCPSP_rdy = '1';
wait for 1 ps;
report "done" severity failure;
END PROCESS tb;
--  End Test Bench 

CalculatePixOsCPSP_fixed2floatclk <= CalculatePixOsCPSP_clock;
CalculatePixOsCPSP_addfpclk <= CalculatePixOsCPSP_clock;
CalculatePixOsCPSP_subfpclk <= CalculatePixOsCPSP_clock;
CalculatePixOsCPSP_mulfpclk <= CalculatePixOsCPSP_clock;
CalculatePixOsCPSP_divfpclk <= CalculatePixOsCPSP_clock;

inst_fixed2float : fixed2float
PORT MAP (
a => CalculatePixOsCPSP_fixed2floata,
operation_nd => CalculatePixOsCPSP_fixed2floatond,
clk => CalculatePixOsCPSP_fixed2floatclk,
sclr => CalculatePixOsCPSP_fixed2floatsclr,
ce => CalculatePixOsCPSP_fixed2floatce,
result => CalculatePixOsCPSP_fixed2floatr,
rdy => CalculatePixOsCPSP_fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => CalculatePixOsCPSP_divfpa,
b => CalculatePixOsCPSP_divfpb,
operation_nd => CalculatePixOsCPSP_divfpond,
clk => CalculatePixOsCPSP_divfpclk,
sclr => CalculatePixOsCPSP_divfpsclr,
ce => CalculatePixOsCPSP_divfpce,
result => CalculatePixOsCPSP_divfpr,
rdy => CalculatePixOsCPSP_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => CalculatePixOsCPSP_mulfpa,
b => CalculatePixOsCPSP_mulfpb,
operation_nd => CalculatePixOsCPSP_mulfpond,
clk => CalculatePixOsCPSP_mulfpclk,
sclr => CalculatePixOsCPSP_mulfpsclr,
ce => CalculatePixOsCPSP_mulfpce,
result => CalculatePixOsCPSP_mulfpr,
rdy => CalculatePixOsCPSP_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => CalculatePixOsCPSP_addfpa,
b => CalculatePixOsCPSP_addfpb,
operation_nd => CalculatePixOsCPSP_addfpond,
clk => CalculatePixOsCPSP_addfpclk,
sclr => CalculatePixOsCPSP_addfpsclr,
ce => CalculatePixOsCPSP_addfpce,
result => CalculatePixOsCPSP_addfpr,
rdy => CalculatePixOsCPSP_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => CalculatePixOsCPSP_subfpa,
b => CalculatePixOsCPSP_subfpb,
operation_nd => CalculatePixOsCPSP_subfpond,
clk => CalculatePixOsCPSP_subfpclk,
sclr => CalculatePixOsCPSP_subfpsclr,
ce => CalculatePixOsCPSP_subfpce,
result => CalculatePixOsCPSP_subfpr,
rdy => CalculatePixOsCPSP_subfprdy
);

END ARCHITECTURE behavior;
