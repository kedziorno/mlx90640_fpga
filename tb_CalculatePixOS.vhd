-- TestBench Template 
-- CalculatePixOS

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

--use work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

ENTITY tb_CalculatePixOS IS
END tb_CalculatePixOS;

ARCHITECTURE behavior OF tb_CalculatePixOS IS 

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
signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : STD_LOGIC;
signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : STD_LOGIC;
signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : STD_LOGIC;

signal fixed2floatclk : std_logic;
signal addfpclk : std_logic;
signal subfpclk : std_logic;
signal mulfpclk : std_logic;
signal divfpclk : std_logic;

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

component CalculatePixOS is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
i_const1 : in std_logic_vector (31 downto 0);
i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_VddV0 : in std_logic_vector (31 downto 0);
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
mulfpsclr : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;
addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : out STD_LOGIC;
addfpsclr : out STD_LOGIC;
addfpce : out STD_LOGIC;
addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : in STD_LOGIC;
subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : out STD_LOGIC;
subfpsclr : out STD_LOGIC;
subfpce : out STD_LOGIC;
subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : in STD_LOGIC;
divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : out STD_LOGIC;
divfpsclr : out STD_LOGIC;
divfpce : out STD_LOGIC;
divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : in STD_LOGIC
);
end component CalculatePixOS;
signal CalculatePixOS_clock : std_logic;
signal CalculatePixOS_reset : std_logic;
signal CalculatePixOS_run : std_logic;
signal CalculatePixOS_i2c_mem_ena : STD_LOGIC;
signal CalculatePixOS_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixOS_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixOS_const1 : std_logic_vector (31 downto 0);
signal CalculatePixOS_Ta : std_logic_vector (31 downto 0);
signal CalculatePixOS_Ta0 : std_logic_vector (31 downto 0);
signal CalculatePixOS_Vdd : std_logic_vector (31 downto 0);
signal CalculatePixOS_VddV0 : std_logic_vector (31 downto 0);
signal CalculatePixOS_do : std_logic_vector (31 downto 0);
signal CalculatePixOS_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal CalculatePixOS_rdy : std_logic;
signal CalculatePixOS_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculatePixOS_fixed2floatond : STD_LOGIC;
signal CalculatePixOS_fixed2floatce : STD_LOGIC;
signal CalculatePixOS_fixed2floatsclr : STD_LOGIC;
signal CalculatePixOS_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_fixed2floatrdy : STD_LOGIC;
signal CalculatePixOS_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_mulfpond : STD_LOGIC;
signal CalculatePixOS_mulfpsclr : STD_LOGIC;
signal CalculatePixOS_mulfpce : STD_LOGIC;
signal CalculatePixOS_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_mulfprdy : STD_LOGIC;
signal CalculatePixOS_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_divfpond : STD_LOGIC;
signal CalculatePixOS_divfpsclr : STD_LOGIC;
signal CalculatePixOS_divfpce : STD_LOGIC;
signal CalculatePixOS_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_divfprdy : STD_LOGIC;
signal CalculatePixOS_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_addfpond : STD_LOGIC;
signal CalculatePixOS_addfpsclr : STD_LOGIC;
signal CalculatePixOS_addfpce : STD_LOGIC;
signal CalculatePixOS_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_addfprdy : STD_LOGIC;
signal CalculatePixOS_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_subfpond : STD_LOGIC;
signal CalculatePixOS_subfpsclr : STD_LOGIC;
signal CalculatePixOS_subfpce : STD_LOGIC;
signal CalculatePixOS_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_subfprdy : STD_LOGIC;

signal CalculatePixOS_fixed2floatclk : std_logic;
signal CalculatePixOS_addfpclk : std_logic;
signal CalculatePixOS_subfpclk : std_logic;
signal CalculatePixOS_mulfpclk : std_logic;
signal CalculatePixOS_divfpclk : std_logic;

constant i_clock_period : time := 10 ns;
signal i_clock : std_logic;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (CalculatePixOS_do); -- output data

uut : CalculatePixOS port map (
i_clock => CalculatePixOS_clock,
i_reset => CalculatePixOS_reset,
i_run => CalculatePixOS_run,
i2c_mem_ena => CalculatePixOS_i2c_mem_ena,
i2c_mem_addra => CalculatePixOS_i2c_mem_addra,
i2c_mem_douta => CalculatePixOS_i2c_mem_douta,
i_const1 => CalculatePixOS_const1,
i_Ta => CalculatePixOS_Ta,
i_Ta0 => CalculatePixOS_Ta0,
i_Vdd => CalculatePixOS_Vdd,
i_VddV0 => CalculatePixOS_VddV0,
o_do => CalculatePixOS_do,
i_addr => CalculatePixOS_addr,
o_rdy => CalculatePixOS_rdy,
fixed2floata => CalculatePixOS_fixed2floata,
fixed2floatond => CalculatePixOS_fixed2floatond,
fixed2floatce => CalculatePixOS_fixed2floatce,
fixed2floatsclr => CalculatePixOS_fixed2floatsclr,
fixed2floatr => CalculatePixOS_fixed2floatr,
fixed2floatrdy => CalculatePixOS_fixed2floatrdy,
mulfpa => CalculatePixOS_mulfpa,
mulfpb => CalculatePixOS_mulfpb,
mulfpond => CalculatePixOS_mulfpond,
mulfpsclr => CalculatePixOS_mulfpsclr,
mulfpce => CalculatePixOS_mulfpce,
mulfpr => CalculatePixOS_mulfpr,
mulfprdy => CalculatePixOS_mulfprdy,
addfpa => CalculatePixOS_addfpa,
addfpb => CalculatePixOS_addfpb,
addfpond => CalculatePixOS_addfpond,
addfpsclr => CalculatePixOS_addfpsclr,
addfpce => CalculatePixOS_addfpce,
addfpr => CalculatePixOS_addfpr,
addfprdy => CalculatePixOS_addfprdy,
subfpa => CalculatePixOS_subfpa,
subfpb => CalculatePixOS_subfpb,
subfpond => CalculatePixOS_subfpond,
subfpsclr => CalculatePixOS_subfpsclr,
subfpce => CalculatePixOS_subfpce,
subfpr => CalculatePixOS_subfpr,
subfprdy => CalculatePixOS_subfprdy,
divfpa => CalculatePixOS_divfpa,
divfpb => CalculatePixOS_divfpb,
divfpond => CalculatePixOS_divfpond,
divfpsclr => CalculatePixOS_divfpsclr,
divfpce => CalculatePixOS_divfpce,
divfpr => CalculatePixOS_divfpr,
divfprdy => CalculatePixOS_divfprdy
);

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => i_clock,
ena => CalculatePixOS_i2c_mem_ena,
wea => "0",
addra => CalculatePixOS_i2c_mem_addra,
dina => (others => '0'),
douta => CalculatePixOS_i2c_mem_douta
);

CalculatePixOS_clock <= i_clock;

i_clock_process :process
begin
i_clock <= '0';
wait for i_clock_period/2;
i_clock <= '1';
wait for i_clock_period/2;
end process;

tb : PROCESS IS
BEGIN
CalculatePixOS_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
CalculatePixOS_reset <= '0';
wait for i_clock_period*10;
CalculatePixOS_const1 <= x"3F800000"; -- 1
CalculatePixOS_Ta <= x"421CBC6A"; -- 39.184
CalculatePixOS_Ta0 <= x"41C80000"; -- 25
CalculatePixOS_Vdd <= x"40546A7F"; -- 3.319
CalculatePixOS_VddV0 <= x"40533333"; -- 3.3
CalculatePixOS_run <= '1'; wait for i_clock_period; CalculatePixOS_run <= '0';
wait until CalculatePixOS_rdy = '1';
for i in 0 to 1024 loop
	CalculatePixOS_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps; -- must be for write
report "done" severity failure;
END PROCESS tb;

CalculatePixOS_fixed2floatclk <= i_clock;
CalculatePixOS_addfpclk <= i_clock;
CalculatePixOS_subfpclk <= i_clock;
CalculatePixOS_mulfpclk <= i_clock;
CalculatePixOS_divfpclk <= i_clock;

inst_fixed2float : fixed2float
PORT MAP (
a => CalculatePixOS_fixed2floata,
operation_nd => CalculatePixOS_fixed2floatond,
clk => CalculatePixOS_fixed2floatclk,
sclr => CalculatePixOS_fixed2floatsclr,
ce => CalculatePixOS_fixed2floatce,
result => CalculatePixOS_fixed2floatr,
rdy => CalculatePixOS_fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => CalculatePixOS_divfpa,
b => CalculatePixOS_divfpb,
operation_nd => CalculatePixOS_divfpond,
clk => CalculatePixOS_divfpclk,
sclr => CalculatePixOS_divfpsclr,
ce => CalculatePixOS_divfpce,
result => CalculatePixOS_divfpr,
rdy => CalculatePixOS_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => CalculatePixOS_mulfpa,
b => CalculatePixOS_mulfpb,
operation_nd => CalculatePixOS_mulfpond,
clk => CalculatePixOS_mulfpclk,
sclr => CalculatePixOS_mulfpsclr,
ce => CalculatePixOS_mulfpce,
result => CalculatePixOS_mulfpr,
rdy => CalculatePixOS_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => CalculatePixOS_addfpa,
b => CalculatePixOS_addfpb,
operation_nd => CalculatePixOS_addfpond,
clk => CalculatePixOS_addfpclk,
sclr => CalculatePixOS_addfpsclr,
ce => CalculatePixOS_addfpce,
result => CalculatePixOS_addfpr,
rdy => CalculatePixOS_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => CalculatePixOS_subfpa,
b => CalculatePixOS_subfpb,
operation_nd => CalculatePixOS_subfpond,
clk => CalculatePixOS_subfpclk,
sclr => CalculatePixOS_subfpsclr,
ce => CalculatePixOS_subfpce,
result => CalculatePixOS_subfpr,
rdy => CalculatePixOS_subfprdy
);

END ARCHITECTURE behavior;
