-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   16:09:00 2/2/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_calculate_vdd
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Testbench
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
--      fixed2float, divfp, mulfp, addfp, subfp, tb_i2c_mem, calculate_vdd
--    - Processes (Architecture: tb):
--      p_clock_generation, p_tb
--
-- Important objects:
--  - tb_i2c_mem_i - store raw data for calculates
--  - calculate_vdd_vdd - output value in FP32 format
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

use work.global_package.all;

ENTITY tb_calculate_vdd IS
END tb_calculate_vdd;

ARCHITECTURE tb OF tb_calculate_vdd IS 

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

component calculate_vdd is
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
end component calculate_vdd;

signal calculate_vdd_clock : std_logic;
signal calculate_vdd_reset : std_logic;
signal calculate_vdd_run : std_logic;
signal calculate_vdd_i2c_mem_ena : STD_LOGIC;
signal calculate_vdd_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculate_vdd_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculate_vdd_vdd : std_logic_vector (31 downto 0); -- output Vdd
signal calculate_vdd_rdy : std_logic;
signal calculate_vdd_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal calculate_vdd_fixed2floatond : STD_LOGIC;
signal calculate_vdd_fixed2floatce : STD_LOGIC;
signal calculate_vdd_fixed2floatsclr : STD_LOGIC;
signal calculate_vdd_fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_fixed2floatrdy : STD_LOGIC;
signal calculate_vdd_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_divfpond : STD_LOGIC;
signal calculate_vdd_divfpce : STD_LOGIC;
signal calculate_vdd_divfpsclr : STD_LOGIC;
signal calculate_vdd_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_divfprdy : STD_LOGIC;
signal calculate_vdd_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_mulfpond : STD_LOGIC;
signal calculate_vdd_mulfpce : STD_LOGIC;
signal calculate_vdd_mulfpsclr : STD_LOGIC;
signal calculate_vdd_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_mulfprdy : STD_LOGIC;
signal calculate_vdd_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_addfpond : STD_LOGIC;
signal calculate_vdd_addfpce : STD_LOGIC;
signal calculate_vdd_addfpsclr : STD_LOGIC;
signal calculate_vdd_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_addfprdy : STD_LOGIC;
signal calculate_vdd_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_subfpond : STD_LOGIC;
signal calculate_vdd_subfpce : STD_LOGIC;
signal calculate_vdd_subfpsclr : STD_LOGIC;
signal calculate_vdd_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vdd_subfprdy : STD_LOGIC;

signal calculate_vdd_fixed2floatclk : std_logic;
signal calculate_vdd_addfpclk : std_logic;
signal calculate_vdd_subfpclk : std_logic;
signal calculate_vdd_mulfpclk : std_logic;
signal calculate_vdd_divfpclk : std_logic;

constant clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (calculate_vdd_vdd);

tb_i2c_mem_i : tb_i2c_mem
PORT MAP (
clka => calculate_vdd_clock,
ena => calculate_vdd_i2c_mem_ena,
wea => "0",
addra => calculate_vdd_i2c_mem_addra,
dina => (others => '0'),
douta => calculate_vdd_i2c_mem_douta
);

p_clock_generation : process
begin
	calculate_vdd_clock <= '0';
	wait for clock_period/2;
	calculate_vdd_clock <= '1';
	wait for clock_period/2;
end process p_clock_generation;

calculate_vdd_uut : calculate_vdd port map (
i_clock => calculate_vdd_clock,
i_reset => calculate_vdd_reset,
i_run => calculate_vdd_run,

i2c_mem_ena => calculate_vdd_i2c_mem_ena,
i2c_mem_addra => calculate_vdd_i2c_mem_addra,
i2c_mem_douta => calculate_vdd_i2c_mem_douta,

o_Vdd => calculate_vdd_vdd,
o_rdy => calculate_vdd_rdy,

fixed2floata => calculate_vdd_fixed2floata,
fixed2floatond => calculate_vdd_fixed2floatond,
fixed2floatce => calculate_vdd_fixed2floatce,
fixed2floatsclr => calculate_vdd_fixed2floatsclr,
fixed2floatr => calculate_vdd_fixed2floatr,
fixed2floatrdy => calculate_vdd_fixed2floatrdy,

divfpa => calculate_vdd_divfpa,
divfpb => calculate_vdd_divfpb,
divfpond => calculate_vdd_divfpond,
divfpce => calculate_vdd_divfpce,
divfpsclr => calculate_vdd_divfpsclr,
divfpr => calculate_vdd_divfpr,
divfprdy => calculate_vdd_divfprdy,

mulfpa => calculate_vdd_mulfpa,
mulfpb => calculate_vdd_mulfpb,
mulfpond => calculate_vdd_mulfpond,
mulfpce => calculate_vdd_mulfpce,
mulfpsclr => calculate_vdd_mulfpsclr,
mulfpr => calculate_vdd_mulfpr,
mulfprdy => calculate_vdd_mulfprdy,

addfpa => calculate_vdd_addfpa,
addfpb => calculate_vdd_addfpb,
addfpond => calculate_vdd_addfpond,
addfpce => calculate_vdd_addfpce,
addfpsclr => calculate_vdd_addfpsclr,
addfpr => calculate_vdd_addfpr,
addfprdy => calculate_vdd_addfprdy,

subfpa => calculate_vdd_subfpa,
subfpb => calculate_vdd_subfpb,
subfpond => calculate_vdd_subfpond,
subfpce => calculate_vdd_subfpce,
subfpsclr => calculate_vdd_subfpsclr,
subfpr => calculate_vdd_subfpr,
subfprdy  => calculate_vdd_subfprdy

);

p_tb : PROCESS
BEGIN
calculate_vdd_reset <= '1';
wait for 254.3 ns; -- wait until global set/reset completes
calculate_vdd_reset <= '0';
wait for clock_period*10;
-- Add user defined stimulus here
calculate_vdd_run <= '1'; wait for clock_period; calculate_vdd_run <= '0';
wait until calculate_vdd_rdy = '1';
warning_neq_fp (calculate_vdd_vdd, x"4052b852", "Vdd");
--report "rdy at 1.695us";
--report "rdy at 1.645us";
report "rdy at 1.605us";
wait for 100 ns;
report "done" severity failure;
END PROCESS p_tb;

calculate_vdd_fixed2floatclk <= calculate_vdd_clock;
calculate_vdd_addfpclk <= calculate_vdd_clock;
calculate_vdd_subfpclk <= calculate_vdd_clock;
calculate_vdd_mulfpclk <= calculate_vdd_clock;
calculate_vdd_divfpclk <= calculate_vdd_clock;

fixed2float_i : fixed2float
PORT MAP (
a => calculate_vdd_fixed2floata,
operation_nd => calculate_vdd_fixed2floatond,
clk => calculate_vdd_fixed2floatclk,
sclr => calculate_vdd_fixed2floatsclr,
ce => calculate_vdd_fixed2floatce,
result => calculate_vdd_fixed2floatr,
rdy => calculate_vdd_fixed2floatrdy
);

divfp_i : divfp
PORT MAP (
a => calculate_vdd_divfpa,
b => calculate_vdd_divfpb,
operation_nd => calculate_vdd_divfpond,
clk => calculate_vdd_divfpclk,
sclr => calculate_vdd_divfpsclr,
ce => calculate_vdd_divfpce,
result => calculate_vdd_divfpr,
rdy => calculate_vdd_divfprdy
);

mulfp_i : mulfp
PORT MAP (
a => calculate_vdd_mulfpa,
b => calculate_vdd_mulfpb,
operation_nd => calculate_vdd_mulfpond,
clk => calculate_vdd_mulfpclk,
sclr => calculate_vdd_mulfpsclr,
ce => calculate_vdd_mulfpce,
result => calculate_vdd_mulfpr,
rdy => calculate_vdd_mulfprdy
);

addfp_i : addfp
PORT MAP (
a => calculate_vdd_addfpa,
b => calculate_vdd_addfpb,
operation_nd => calculate_vdd_addfpond,
clk => calculate_vdd_addfpclk,
sclr => calculate_vdd_addfpsclr,
ce => calculate_vdd_addfpce,
result => calculate_vdd_addfpr,
rdy => calculate_vdd_addfprdy
);

subfp_i : subfp
PORT MAP (
a => calculate_vdd_subfpa,
b => calculate_vdd_subfpb,
operation_nd => calculate_vdd_subfpond,
clk => calculate_vdd_subfpclk,
sclr => calculate_vdd_subfpsclr,
ce => calculate_vdd_subfpce,
result => calculate_vdd_subfpr,
rdy => calculate_vdd_subfprdy
);

end architecture tb;

