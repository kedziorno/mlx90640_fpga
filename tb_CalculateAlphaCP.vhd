-- TestBench Template 
-- CalculateAlphaCP

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.p_fphdl_package1.all;
use work.p_fphdl_package3.all;

ENTITY tb_CalculateAlphaCP IS
END tb_CalculateAlphaCP;

ARCHITECTURE behavior OF tb_CalculateAlphaCP IS 

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
signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpsclr : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : STD_LOGIC;

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
signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : STD_LOGIC;

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
component CalculateAlphaCP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_acpsubpage0 : out fd2ft;
o_acpsubpage1 : out fd2ft;
o_rdy : out std_logic;

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
signal mulfprdy : in STD_LOGIC
);
end component CalculateAlphaCP;
signal CalculateAlphaCP_clock : std_logic;
signal CalculateAlphaCP_reset : std_logic;
signal CalculateAlphaCP_run : std_logic;
signal CalculateAlphaCP_i2c_mem_ena : STD_LOGIC;
signal CalculateAlphaCP_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculateAlphaCP_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculateAlphaCP_acpsubpage0 : fd2ft;
signal CalculateAlphaCP_acpsubpage1 : fd2ft;
signal CalculateAlphaCP_rdy : std_logic;
signal CalculateAlphaCP_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_divfpond : STD_LOGIC;
signal CalculateAlphaCP_divfpsclr : STD_LOGIC;
signal CalculateAlphaCP_divfpce : STD_LOGIC;
signal CalculateAlphaCP_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_divfprdy : STD_LOGIC;
signal CalculateAlphaCP_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_mulfpond : STD_LOGIC;
signal CalculateAlphaCP_mulfpsclr : STD_LOGIC;
signal CalculateAlphaCP_mulfpce : STD_LOGIC;
signal CalculateAlphaCP_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_mulfprdy : STD_LOGIC;

signal CalculateAlphaCP_divfpclk : std_logic;
signal CalculateAlphaCP_mulfpclk : std_logic;

constant clockperiod : time := 10 ns;

BEGIN

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculateAlphaCP_clock,
ena => CalculateAlphaCP_i2c_mem_ena,
wea => "0",
addra => CalculateAlphaCP_i2c_mem_addra,
dina => (others => '0'),
douta => CalculateAlphaCP_i2c_mem_douta
);

-- Component Instantiation
uut: CalculateAlphaCP
port map (
i_clock => CalculateAlphaCP_clock,
i_reset => CalculateAlphaCP_reset,
i_run => CalculateAlphaCP_run,
i2c_mem_ena => CalculateAlphaCP_i2c_mem_ena,
i2c_mem_addra => CalculateAlphaCP_i2c_mem_addra,
i2c_mem_douta => CalculateAlphaCP_i2c_mem_douta,
o_acpsubpage0 => CalculateAlphaCP_acpsubpage0,
o_acpsubpage1 => CalculateAlphaCP_acpsubpage1,
o_rdy => CalculateAlphaCP_rdy,

divfpa => CalculateAlphaCP_divfpa,
divfpb => CalculateAlphaCP_divfpb,
divfpond => CalculateAlphaCP_divfpond,
divfpsclr => CalculateAlphaCP_divfpsclr,
divfpce => CalculateAlphaCP_divfpce,
divfpr => CalculateAlphaCP_divfpr,
divfprdy => CalculateAlphaCP_divfprdy,

mulfpa => CalculateAlphaCP_mulfpa,
mulfpb => CalculateAlphaCP_mulfpb,
mulfpond => CalculateAlphaCP_mulfpond,
mulfpsclr => CalculateAlphaCP_mulfpsclr,
mulfpce => CalculateAlphaCP_mulfpce,
mulfpr => CalculateAlphaCP_mulfpr,
mulfprdy => CalculateAlphaCP_mulfprdy

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
CalculateAlphaCP_run <= '1'; wait for clockperiod; CalculateAlphaCP_run <= '0';
wait until CalculateAlphaCP_rdy = '1';
wait for 1 ps;
warning_neq_fp (CalculateAlphaCP_acpsubpage0, x"31460000", "acpsubpage0 585ns");
warning_neq_fp (CalculateAlphaCP_acpsubpage1, x"31478c00", "acpsubpage1 695ns");
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

CalculateAlphaCP_divfpclk <= CalculateAlphaCP_clock;
inst_divfp : divfp
PORT MAP (
a => CalculateAlphaCP_divfpa,
b => CalculateAlphaCP_divfpb,
operation_nd => CalculateAlphaCP_divfpond,
clk => CalculateAlphaCP_divfpclk,
sclr => CalculateAlphaCP_divfpsclr,
ce => CalculateAlphaCP_divfpce,
result => CalculateAlphaCP_divfpr,
rdy => CalculateAlphaCP_divfprdy
);

CalculateAlphaCP_mulfpclk <= CalculateAlphaCP_clock;
inst_mulfp : mulfp
PORT MAP (
a => CalculateAlphaCP_mulfpa,
b => CalculateAlphaCP_mulfpb,
operation_nd => CalculateAlphaCP_mulfpond,
clk => CalculateAlphaCP_mulfpclk,
sclr => CalculateAlphaCP_mulfpsclr,
ce => CalculateAlphaCP_mulfpce,
result => CalculateAlphaCP_mulfpr,
rdy => CalculateAlphaCP_mulfprdy
);

END architecture behavior;
