-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   14:59:22 01/06/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   melexis_mlx9064x
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Testbench of core module
--                FIX THIS AND USE SOME VALUES TO ASSERT
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    global_package.vhd
--  - Modules: -
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules:
--      tb_i2c_mem
--    - Processes (Architecture: tb):
--      p_clock_generator, p_tb, p_tb_run
--
-- Important objects: -
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos: -
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones: -
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE work.global_package.all;

ENTITY tb_melexis_mlx9064x IS
END tb_melexis_mlx9064x;

ARCHITECTURE tb OF tb_melexis_mlx9064x IS

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
signal melexis_mlx9064x_i2c_mem_clka : STD_LOGIC;
signal melexis_mlx9064x_i2c_mem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal melexis_mlx9064x_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal melexis_mlx9064x_i2c_mem_dina : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal melexis_mlx9064x_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);

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
signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : STD_LOGIC;

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
signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : STD_LOGIC;

COMPONENT sqrtfp2
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : STD_LOGIC;
signal sqrtfp2clk : STD_LOGIC;
signal sqrtfp2sclr : STD_LOGIC;
signal sqrtfp2ce : STD_LOGIC;
signal sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : STD_LOGIC;

signal fixed2floatclk : std_logic;
signal addfpclk : std_logic;
signal subfpclk : std_logic;
signal mulfpclk : std_logic;
signal divfpclk : std_logic;

-- Component Declaration
component melexis_mlx9064x is
generic (
constant c_device : string (1 to 8) := "mlx90640"; -- mlx90640 (32x24),mlx90641 (16x12)
constant c_calculate_type : string (1 to 13) := "c_temperature"; -- c_temperature,c_raws_images
constant c_use_fisqrt : string (1 to 3) := "no" -- yes/no - depend from c_calculate_type(c_temperature)
);
port (
i_clock : in std_logic;
i_reset : in std_logic;

i_run : in std_logic;
o_rdy : out std_logic;

i_addr : in std_logic_vector(9 downto 0);
o_do : out std_logic_vector(31 downto 0);

signal i2c_mem_ena : out STD_LOGIC;
signal i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;

signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC;

signal subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : out STD_LOGIC;
signal subfpce : out STD_LOGIC;
signal subfpsclr : out STD_LOGIC;
signal subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : in STD_LOGIC;

signal sqrtfp2a : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : out STD_LOGIC;
signal sqrtfp2sclr : out STD_LOGIC;
signal sqrtfp2ce : out STD_LOGIC;
signal sqrtfp2r : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : in STD_LOGIC
);
end component melexis_mlx9064x;

signal melexis_mlx9064x_clock : std_logic;
signal melexis_mlx9064x_reset : std_logic;
signal melexis_mlx9064x_run : std_logic;
signal melexis_mlx9064x_rdy : std_logic;
signal melexis_mlx9064x_addr :  std_logic_vector(9 downto 0);
signal melexis_mlx9064x_do :  std_logic_vector(31 downto 0);
signal melexis_mlx9064x_i2c_mem_ena :  STD_LOGIC;
signal melexis_mlx9064x_mem_addra :  STD_LOGIC_VECTOR(11 DOWNTO 0);
signal melexis_mlx9064x_mem_da :  STD_LOGIC_VECTOR(7 DOWNTO 0);
signal melexis_mlx9064x_fixed2floata :  STD_LOGIC_VECTOR(15 DOWNTO 0);
signal melexis_mlx9064x_fixed2floatond :  STD_LOGIC;
signal melexis_mlx9064x_fixed2floatce :  STD_LOGIC;
signal melexis_mlx9064x_fixed2floatsclr :  STD_LOGIC;
signal melexis_mlx9064x_fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_fixed2floatrdy :  STD_LOGIC;
signal melexis_mlx9064x_divfpa :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_divfpb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_divfpond :  STD_LOGIC;
signal melexis_mlx9064x_divfpce :  STD_LOGIC;
signal melexis_mlx9064x_divfpsclr :  STD_LOGIC;
signal melexis_mlx9064x_divfpr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_divfprdy :  STD_LOGIC;
signal melexis_mlx9064x_mulfpa :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_mulfpb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_mulfpond :  STD_LOGIC;
signal melexis_mlx9064x_mulfpce :  STD_LOGIC;
signal melexis_mlx9064x_mulfpsclr :  STD_LOGIC;
signal melexis_mlx9064x_mulfpr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_mulfprdy :  STD_LOGIC;
signal melexis_mlx9064x_addfpa :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_addfpb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_addfpond :  STD_LOGIC;
signal melexis_mlx9064x_addfpce :  STD_LOGIC;
signal melexis_mlx9064x_addfpsclr :  STD_LOGIC;
signal melexis_mlx9064x_addfpr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_addfprdy :  STD_LOGIC;
signal melexis_mlx9064x_subfpa :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_subfpb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_subfpond :  STD_LOGIC;
signal melexis_mlx9064x_subfpce :  STD_LOGIC;
signal melexis_mlx9064x_subfpsclr :  STD_LOGIC;
signal melexis_mlx9064x_subfpr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_subfprdy :  STD_LOGIC;
signal melexis_mlx9064x_sqrtfp2a :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_sqrtfp2ond :  STD_LOGIC;
signal melexis_mlx9064x_sqrtfp2sclr :  STD_LOGIC;
signal melexis_mlx9064x_sqrtfp2ce :  STD_LOGIC;
signal melexis_mlx9064x_sqrtfp2r :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal melexis_mlx9064x_sqrtfp2rdy :  STD_LOGIC;

constant clock_period : time := 20 ns;

signal out1r : real;

signal melexis_mlx9064x_fixed2floatclk : std_logic;
signal melexis_mlx9064x_sqrtfp2clk : std_logic;
signal melexis_mlx9064x_addfpclk : std_logic;
signal melexis_mlx9064x_subfpclk : std_logic;
signal melexis_mlx9064x_mulfpclk : std_logic;
signal melexis_mlx9064x_divfpclk : std_logic;

BEGIN

out1r <= ap_slv2fp (melexis_mlx9064x_do); -- output data

  tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => melexis_mlx9064x_clock,
ena => melexis_mlx9064x_i2c_mem_ena,
wea => "0",
addra => melexis_mlx9064x_i2c_mem_addra,
dina => (others => '0'),
douta => melexis_mlx9064x_i2c_mem_douta
);

-- Component Instantiation
melexis_mlx9064x_uut : melexis_mlx9064x
generic map (
c_calculate_type => "c_temperature",
--c_calculate_type => "c_raws_images",
--c_use_fisqrt => "yes"
c_use_fisqrt => " no"
--c_use_fisqrt => "xxx"
)
port map (
i_clock => melexis_mlx9064x_clock,
i_reset => melexis_mlx9064x_reset,
i_run => melexis_mlx9064x_run,
o_rdy => melexis_mlx9064x_rdy,
i_addr => melexis_mlx9064x_addr,
o_do => melexis_mlx9064x_do,
i2c_mem_ena => melexis_mlx9064x_i2c_mem_ena,
i2c_mem_addra => melexis_mlx9064x_i2c_mem_addra,
i2c_mem_douta => melexis_mlx9064x_i2c_mem_douta,
fixed2floata => melexis_mlx9064x_fixed2floata,
fixed2floatond => melexis_mlx9064x_fixed2floatond,
fixed2floatce => melexis_mlx9064x_fixed2floatce,
fixed2floatsclr => melexis_mlx9064x_fixed2floatsclr,
fixed2floatr => melexis_mlx9064x_fixed2floatr,
fixed2floatrdy => melexis_mlx9064x_fixed2floatrdy,
divfpa => melexis_mlx9064x_divfpa,
divfpb => melexis_mlx9064x_divfpb,
divfpond => melexis_mlx9064x_divfpond,
divfpce => melexis_mlx9064x_divfpce,
divfpsclr => melexis_mlx9064x_divfpsclr,
divfpr => melexis_mlx9064x_divfpr,
divfprdy => melexis_mlx9064x_divfprdy,
mulfpa => melexis_mlx9064x_mulfpa,
mulfpb => melexis_mlx9064x_mulfpb,
mulfpond => melexis_mlx9064x_mulfpond,
mulfpce => melexis_mlx9064x_mulfpce,
mulfpsclr => melexis_mlx9064x_mulfpsclr,
mulfpr => melexis_mlx9064x_mulfpr,
mulfprdy => melexis_mlx9064x_mulfprdy,
addfpa => melexis_mlx9064x_addfpa,
addfpb => melexis_mlx9064x_addfpb,
addfpond => melexis_mlx9064x_addfpond,
addfpce => melexis_mlx9064x_addfpce,
addfpsclr => melexis_mlx9064x_addfpsclr,
addfpr => melexis_mlx9064x_addfpr,
addfprdy => melexis_mlx9064x_addfprdy,
subfpa => melexis_mlx9064x_subfpa,
subfpb => melexis_mlx9064x_subfpb,
subfpond => melexis_mlx9064x_subfpond,
subfpce => melexis_mlx9064x_subfpce,
subfpsclr => melexis_mlx9064x_subfpsclr,
subfpr => melexis_mlx9064x_subfpr,
subfprdy => melexis_mlx9064x_subfprdy,
sqrtfp2a => melexis_mlx9064x_sqrtfp2a,
sqrtfp2ond => melexis_mlx9064x_sqrtfp2ond,
sqrtfp2sclr => melexis_mlx9064x_sqrtfp2sclr,
sqrtfp2ce => melexis_mlx9064x_sqrtfp2ce,
sqrtfp2r => melexis_mlx9064x_sqrtfp2r,
sqrtfp2rdy => melexis_mlx9064x_sqrtfp2rdy
);

p_clock_generator: process
begin
melexis_mlx9064x_clock <= '0';
wait for clock_period/2;
melexis_mlx9064x_clock <= '1';
wait for clock_period/2;
end process p_clock_generator;

--  Test Bench Statements
p_tb_run : PROCESS
BEGIN
melexis_mlx9064x_reset <= '1';
wait for 600 ns; -- wait until global set/reset completes
melexis_mlx9064x_reset <= '0';
-- Add user defined stimulus here
melexis_mlx9064x_run <= '1';
wait for clock_period*1;
melexis_mlx9064x_run <= '0';
wait; -- will wait forever
END PROCESS p_tb_run;

p_tb : PROCESS
BEGIN
--wait for 1.5 ms;
wait until melexis_mlx9064x_rdy = '1';
for i in 0 to 1024 loop
	melexis_mlx9064x_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for clock_period*2;
end loop;
wait for 1 ps; -- must be for write
report "tb - To done simulation To - tb" severity failure;
END PROCESS p_tb;

melexis_mlx9064x_fixed2floatclk <= melexis_mlx9064x_clock;
melexis_mlx9064x_sqrtfp2clk <= melexis_mlx9064x_clock;
melexis_mlx9064x_addfpclk <= melexis_mlx9064x_clock;
melexis_mlx9064x_subfpclk <= melexis_mlx9064x_clock;
melexis_mlx9064x_mulfpclk <= melexis_mlx9064x_clock;
melexis_mlx9064x_divfpclk <= melexis_mlx9064x_clock;

inst_fixed2float : fixed2float
PORT MAP (
a => melexis_mlx9064x_fixed2floata,
operation_nd => melexis_mlx9064x_fixed2floatond,
clk => melexis_mlx9064x_fixed2floatclk,
sclr => melexis_mlx9064x_fixed2floatsclr,
ce => melexis_mlx9064x_fixed2floatce,
result => melexis_mlx9064x_fixed2floatr,
rdy => melexis_mlx9064x_fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => melexis_mlx9064x_divfpa,
b => melexis_mlx9064x_divfpb,
operation_nd => melexis_mlx9064x_divfpond,
clk => melexis_mlx9064x_divfpclk,
sclr => melexis_mlx9064x_divfpsclr,
ce => melexis_mlx9064x_divfpce,
result => melexis_mlx9064x_divfpr,
rdy => melexis_mlx9064x_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => melexis_mlx9064x_mulfpa,
b => melexis_mlx9064x_mulfpb,
operation_nd => melexis_mlx9064x_mulfpond,
clk => melexis_mlx9064x_mulfpclk,
sclr => melexis_mlx9064x_mulfpsclr,
ce => melexis_mlx9064x_mulfpce,
result => melexis_mlx9064x_mulfpr,
rdy => melexis_mlx9064x_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => melexis_mlx9064x_addfpa,
b => melexis_mlx9064x_addfpb,
operation_nd => melexis_mlx9064x_addfpond,
clk => melexis_mlx9064x_addfpclk,
sclr => melexis_mlx9064x_addfpsclr,
ce => melexis_mlx9064x_addfpce,
result => melexis_mlx9064x_addfpr,
rdy => melexis_mlx9064x_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => melexis_mlx9064x_subfpa,
b => melexis_mlx9064x_subfpb,
operation_nd => melexis_mlx9064x_subfpond,
clk => melexis_mlx9064x_subfpclk,
sclr => melexis_mlx9064x_subfpsclr,
ce => melexis_mlx9064x_subfpce,
result => melexis_mlx9064x_subfpr,
rdy => melexis_mlx9064x_subfprdy
);

inst_sqrtfp2 : sqrtfp2
PORT MAP (
a => melexis_mlx9064x_sqrtfp2a,
operation_nd => melexis_mlx9064x_sqrtfp2ond,
clk => melexis_mlx9064x_sqrtfp2clk,
sclr => melexis_mlx9064x_sqrtfp2sclr,
ce => melexis_mlx9064x_sqrtfp2ce,
result => melexis_mlx9064x_sqrtfp2r,
rdy => melexis_mlx9064x_sqrtfp2rdy
);

END ARCHITECTURE tb;

