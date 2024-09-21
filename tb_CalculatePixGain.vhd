-- TestBench Template 
-- CalculatePixGain

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.p_fphdl_package1.all;
use work.p_fphdl_package3.all;

ENTITY tb_CalculatePixGain IS
END tb_CalculatePixGain;

ARCHITECTURE behavior OF tb_CalculatePixGain IS 

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
component CalculatePixGain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;

mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC

);
end component CalculatePixGain;

signal CalculatePixGain_clock : std_logic;
signal CalculatePixGain_reset : std_logic;
signal CalculatePixGain_run : std_logic;
signal CalculatePixGain_i2c_mem_ena : STD_LOGIC;
signal CalculatePixGain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixGain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixGain_do : std_logic_vector (31 downto 0);
signal CalculatePixGain_addr : std_logic_vector (9 downto 0);
signal CalculatePixGain_rdy : std_logic;

signal CalculatePixGain_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculatePixGain_fixed2floatond : STD_LOGIC;
signal CalculatePixGain_fixed2floatce : STD_LOGIC;
signal CalculatePixGain_fixed2floatsclr : STD_LOGIC;
signal CalculatePixGain_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_fixed2floatrdy : STD_LOGIC;

signal CalculatePixGain_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_mulfpond : STD_LOGIC;
signal CalculatePixGain_mulfpce : STD_LOGIC;
signal CalculatePixGain_mulfpsclr : STD_LOGIC;
signal CalculatePixGain_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_mulfprdy : STD_LOGIC;

signal CalculatePixGain_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_divfpond : STD_LOGIC;
signal CalculatePixGain_divfpsclr : STD_LOGIC;
signal CalculatePixGain_divfpce : STD_LOGIC;
signal CalculatePixGain_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_divfprdy : STD_LOGIC;

signal CalculatePixGain_fixed2floatclk : std_logic;
signal CalculatePixGain_mulfpclk : std_logic;
signal CalculatePixGain_divfpclk : std_logic;

constant clockperiod : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (CalculatePixGain_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculatePixGain_clock,
ena => CalculatePixGain_i2c_mem_ena,
wea => "0",
addra => CalculatePixGain_i2c_mem_addra,
dina => (others => '0'),
douta => CalculatePixGain_i2c_mem_douta
);

cp : process is
begin
CalculatePixGain_clock <= '0';
wait for clockperiod/2;
CalculatePixGain_clock <= '1';
wait for clockperiod/2;
end process cp;

-- Component Instantiation
uut: CalculatePixGain port map (
i_clock => CalculatePixGain_clock,
i_reset => CalculatePixGain_reset,
i_run => CalculatePixGain_run,
i2c_mem_ena => CalculatePixGain_i2c_mem_ena,
i2c_mem_addra => CalculatePixGain_i2c_mem_addra,
i2c_mem_douta => CalculatePixGain_i2c_mem_douta,
o_do => CalculatePixGain_do,
i_addr => CalculatePixGain_addr,
o_rdy => CalculatePixGain_rdy,

fixed2floata => CalculatePixGain_fixed2floata,
fixed2floatond => CalculatePixGain_fixed2floatond,
fixed2floatce => CalculatePixGain_fixed2floatce,
fixed2floatsclr => CalculatePixGain_fixed2floatsclr,
fixed2floatr => CalculatePixGain_fixed2floatr,
fixed2floatrdy => CalculatePixGain_fixed2floatrdy,

mulfpa => CalculatePixGain_mulfpa,
mulfpb => CalculatePixGain_mulfpb,
mulfpond => CalculatePixGain_mulfpond,
mulfpce => CalculatePixGain_mulfpce,
mulfpsclr => CalculatePixGain_mulfpsclr,
mulfpr => CalculatePixGain_mulfpr,
mulfprdy => CalculatePixGain_mulfprdy,

divfpa => CalculatePixGain_divfpa,
divfpb => CalculatePixGain_divfpb,
divfpond => CalculatePixGain_divfpond,
divfpce => CalculatePixGain_divfpce,
divfpsclr => CalculatePixGain_divfpsclr,
divfpr => CalculatePixGain_divfpr,
divfprdy => CalculatePixGain_divfprdy
);

--  Test Bench Statements
tb : PROCESS
BEGIN
CalculatePixGain_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
CalculatePixGain_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod*10;
CalculatePixGain_run <= '1'; wait for clockperiod; CalculatePixGain_run <= '0';
wait until CalculatePixGain_rdy = '1';
for i in 0 to 1024 loop
	CalculatePixGain_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for clockperiod;
end loop;
wait for 1 ps; -- must be for write
report "done" severity failure;
END PROCESS tb;
--  End Test Bench 

CalculatePixGain_fixed2floatclk <= CalculatePixGain_clock;
CalculatePixGain_mulfpclk <= CalculatePixGain_clock;
CalculatePixGain_divfpclk <= CalculatePixGain_clock;

inst_fixed2float : fixed2float
PORT MAP (
a => CalculatePixGain_fixed2floata,
operation_nd => CalculatePixGain_fixed2floatond,
clk => CalculatePixGain_fixed2floatclk,
sclr => CalculatePixGain_fixed2floatsclr,
ce => CalculatePixGain_fixed2floatce,
result => CalculatePixGain_fixed2floatr,
rdy => CalculatePixGain_fixed2floatrdy
);

inst_mulfp : mulfp
PORT MAP (
a => CalculatePixGain_mulfpa,
b => CalculatePixGain_mulfpb,
operation_nd => CalculatePixGain_mulfpond,
clk => CalculatePixGain_mulfpclk,
sclr => CalculatePixGain_mulfpsclr,
ce => CalculatePixGain_mulfpce,
result => CalculatePixGain_mulfpr,
rdy => CalculatePixGain_mulfprdy
);

inst_divfp : divfp
PORT MAP (
a => CalculatePixGain_divfpa,
b => CalculatePixGain_divfpb,
operation_nd => CalculatePixGain_divfpond,
clk => CalculatePixGain_divfpclk,
sclr => CalculatePixGain_divfpsclr,
ce => CalculatePixGain_divfpce,
result => CalculatePixGain_divfpr,
rdy => CalculatePixGain_divfprdy
);

END ARCHITECTURE behavior;
