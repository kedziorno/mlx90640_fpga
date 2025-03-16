-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   15:49:00 02/17/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_calculate_pixos_cp_sp
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Testbench
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    (...)
--  - Modules:
--    (...)
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files:
--      (...)
--    - Modules:
--      (...)
--    - Processes (Architecture: (...)):
--      (...)
--
-- Important objects:
--  - (...)
--
-- Information from the software vendor:
--  - Messeges:
--    (...)
--  - Bugs:
--    (...)
--  - Notices:
--    (...)
--  - Infos:
--    (...)
--  - Notes:
--    (...)
--  - Criticals/Failures:
--    (...)
--
-- Concepts/Milestones:
-- (...)
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

ENTITY tb_calculate_pixos_cp_sp IS
END tb_calculate_pixos_cp_sp;

ARCHITECTURE tb OF tb_calculate_pixos_cp_sp IS 

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
component calculate_pixos_cp_sp is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_Ta : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_KGain : in std_logic_vector (31 downto 0);

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_pixoscpsp0 : out std_logic_vector (31 downto 0);
o_pixoscpsp1 : out std_logic_vector (31 downto 0);

o_rdy : out std_logic;

signal o_signed6bit_ena : out std_logic;
signal o_signed6bit_adr : out std_logic_vector (5 downto 0);
signal o_2powx_p8_4bit_ena : out std_logic;
signal o_2powx_p8_4bit_adr : out std_logic_vector (3 downto 0);
signal o_2powx_4bit_ena : out std_logic;
signal o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);

signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
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
end component calculate_pixos_cp_sp;
signal calculate_pixos_cp_sp_clock : std_logic;
signal calculate_pixos_cp_sp_reset : std_logic;
signal calculate_pixos_cp_sp_run : std_logic;
signal calculate_pixos_cp_sp_Ta : std_logic_vector (31 downto 0);
signal calculate_pixos_cp_sp_Vdd : std_logic_vector (31 downto 0);
signal calculate_pixos_cp_sp_KGain : std_logic_vector (31 downto 0);
signal calculate_pixos_cp_sp_i2c_mem_ena : STD_LOGIC;
signal calculate_pixos_cp_sp_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculate_pixos_cp_sp_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculate_pixos_cp_sp_pixoscpsp0 : std_logic_vector (31 downto 0);
signal calculate_pixos_cp_sp_pixoscpsp1 : std_logic_vector (31 downto 0);
signal calculate_pixos_cp_sp_rdy : std_logic;

signal calculate_pixos_cp_sp_signed6bit_ena : std_logic;
signal calculate_pixos_cp_sp_signed6bit_adr : std_logic_vector (5 downto 0);
signal calculate_pixos_cp_sp_2powx_p8_4bit_ena : std_logic;
signal calculate_pixos_cp_sp_2powx_p8_4bit_adr : std_logic_vector (3 downto 0);
signal calculate_pixos_cp_sp_2powx_4bit_ena : std_logic;
signal calculate_pixos_cp_sp_2powx_4bit_adr : std_logic_vector (3 downto 0);
signal calculate_pixos_cp_sp_rom_constants_float : std_logic_vector (31 downto 0);

signal calculate_pixos_cp_sp_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal calculate_pixos_cp_sp_fixed2floatond : STD_LOGIC;
signal calculate_pixos_cp_sp_fixed2floatsclr : STD_LOGIC;
signal calculate_pixos_cp_sp_fixed2floatce : STD_LOGIC;
signal calculate_pixos_cp_sp_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_fixed2floatrdy : STD_LOGIC;

signal calculate_pixos_cp_sp_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_divfpond : STD_LOGIC;
signal calculate_pixos_cp_sp_divfpsclr : STD_LOGIC;
signal calculate_pixos_cp_sp_divfpce : STD_LOGIC;
signal calculate_pixos_cp_sp_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_divfprdy : STD_LOGIC;

signal calculate_pixos_cp_sp_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_mulfpond : STD_LOGIC;
signal calculate_pixos_cp_sp_mulfpsclr : STD_LOGIC;
signal calculate_pixos_cp_sp_mulfpce : STD_LOGIC;
signal calculate_pixos_cp_sp_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_mulfprdy : STD_LOGIC;

signal calculate_pixos_cp_sp_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_addfpond : STD_LOGIC;
signal calculate_pixos_cp_sp_addfpsclr : STD_LOGIC;
signal calculate_pixos_cp_sp_addfpce : STD_LOGIC;
signal calculate_pixos_cp_sp_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_addfprdy : STD_LOGIC;

signal calculate_pixos_cp_sp_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_subfpond : STD_LOGIC;
signal calculate_pixos_cp_sp_subfpsclr : STD_LOGIC;
signal calculate_pixos_cp_sp_subfpce : STD_LOGIC;
signal calculate_pixos_cp_sp_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_cp_sp_subfprdy : STD_LOGIC;

signal calculate_pixos_cp_sp_fixed2floatclk : STD_LOGIC;
signal calculate_pixos_cp_sp_addfpclk : STD_LOGIC;
signal calculate_pixos_cp_sp_subfpclk : STD_LOGIC;
signal calculate_pixos_cp_sp_mulfpclk : STD_LOGIC;
signal calculate_pixos_cp_sp_divfpclk : STD_LOGIC;

COMPONENT rom_constants
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_kvptat_en : IN  std_logic;
i_kvptat_adr : IN  std_logic_vector(5 downto 0);
i_alphaptat_en : IN  std_logic;
i_alphaptat_adr : IN  std_logic_vector(3 downto 0);
i_signed4bit_en : IN  std_logic;
i_signed4bit_adr : IN  std_logic_vector(3 downto 0);
i_signed6bit_en : IN  std_logic;
i_signed6bit_adr : IN  std_logic_vector(5 downto 0);
i_alphascale_1_en : IN  std_logic;
i_alphascale_1_adr : IN  std_logic_vector(3 downto 0);
i_2powx_4bit_en : IN  std_logic;
i_2powx_4bit_adr : IN  std_logic_vector(3 downto 0);
i_cpratio_en : IN  std_logic;
i_cpratio_adr : IN  std_logic_vector(5 downto 0);
i_alphascale_2_en : IN  std_logic;
i_alphascale_2_adr : IN  std_logic_vector(3 downto 0);
i_2powx_p8_4bit_en : IN  std_logic;
i_2powx_p8_4bit_adr : IN  std_logic_vector(3 downto 0);
i_signed3bit_en : IN  std_logic;
i_signed3bit_adr : IN  std_logic_vector(2 downto 0);
o_float : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

constant clockperiod : time := 10 ns;

BEGIN

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => calculate_pixos_cp_sp_clock,
ena => calculate_pixos_cp_sp_i2c_mem_ena,
wea => "0",
addra => calculate_pixos_cp_sp_i2c_mem_addra,
dina => (others => '0'),
douta => calculate_pixos_cp_sp_i2c_mem_douta
);

p_clock_process : process is
begin
	calculate_pixos_cp_sp_clock <= '0';
	wait for clockperiod/2;
	calculate_pixos_cp_sp_clock <= '1';
	wait for clockperiod/2;
end process p_clock_process;

-- Component Instantiation
calculate_pixos_cp_sp_KGain <= x"3F81AC57"; -- 1.0130719
calculate_pixos_cp_sp_uut : calculate_pixos_cp_sp port map (
i_clock => calculate_pixos_cp_sp_clock,
i_reset => calculate_pixos_cp_sp_reset,
i_run => calculate_pixos_cp_sp_run,
i_Ta => calculate_pixos_cp_sp_Ta,
i_Vdd => calculate_pixos_cp_sp_Vdd,
i_KGain => calculate_pixos_cp_sp_KGain,
i2c_mem_ena => calculate_pixos_cp_sp_i2c_mem_ena,
i2c_mem_addra => calculate_pixos_cp_sp_i2c_mem_addra,
i2c_mem_douta => calculate_pixos_cp_sp_i2c_mem_douta,
o_pixoscpsp0 => calculate_pixos_cp_sp_pixoscpsp0,
o_pixoscpsp1 => calculate_pixos_cp_sp_pixoscpsp1,
o_rdy => calculate_pixos_cp_sp_rdy,

o_signed6bit_ena => calculate_pixos_cp_sp_signed6bit_ena,
o_signed6bit_adr => calculate_pixos_cp_sp_signed6bit_adr,
o_2powx_p8_4bit_ena => calculate_pixos_cp_sp_2powx_p8_4bit_ena,
o_2powx_p8_4bit_adr => calculate_pixos_cp_sp_2powx_p8_4bit_adr,
o_2powx_4bit_ena => calculate_pixos_cp_sp_2powx_4bit_ena,
o_2powx_4bit_adr => calculate_pixos_cp_sp_2powx_4bit_adr,
i_rom_constants_float => calculate_pixos_cp_sp_rom_constants_float,

fixed2floata => calculate_pixos_cp_sp_fixed2floata,
fixed2floatond => calculate_pixos_cp_sp_fixed2floatond,
fixed2floatsclr => calculate_pixos_cp_sp_fixed2floatsclr,
fixed2floatce => calculate_pixos_cp_sp_fixed2floatce,
fixed2floatr => calculate_pixos_cp_sp_fixed2floatr,
fixed2floatrdy => calculate_pixos_cp_sp_fixed2floatrdy,

divfpa => calculate_pixos_cp_sp_divfpa,
divfpb => calculate_pixos_cp_sp_divfpb,
divfpond => calculate_pixos_cp_sp_divfpond,
divfpsclr => calculate_pixos_cp_sp_divfpsclr,
divfpce => calculate_pixos_cp_sp_divfpce,
divfpr => calculate_pixos_cp_sp_divfpr,
divfprdy => calculate_pixos_cp_sp_divfprdy,

mulfpa => calculate_pixos_cp_sp_mulfpa,
mulfpb => calculate_pixos_cp_sp_mulfpb,
mulfpond => calculate_pixos_cp_sp_mulfpond,
mulfpsclr => calculate_pixos_cp_sp_mulfpsclr,
mulfpce => calculate_pixos_cp_sp_mulfpce,
mulfpr => calculate_pixos_cp_sp_mulfpr,
mulfprdy => calculate_pixos_cp_sp_mulfprdy,

addfpa => calculate_pixos_cp_sp_addfpa,
addfpb => calculate_pixos_cp_sp_addfpb,
addfpond => calculate_pixos_cp_sp_addfpond,
addfpsclr => calculate_pixos_cp_sp_addfpsclr,
addfpce => calculate_pixos_cp_sp_addfpce,
addfpr => calculate_pixos_cp_sp_addfpr,
addfprdy => calculate_pixos_cp_sp_addfprdy,

subfpa => calculate_pixos_cp_sp_subfpa,
subfpb => calculate_pixos_cp_sp_subfpb,
subfpond => calculate_pixos_cp_sp_subfpond,
subfpsclr => calculate_pixos_cp_sp_subfpsclr,
subfpce => calculate_pixos_cp_sp_subfpce,
subfpr => calculate_pixos_cp_sp_subfpr,
subfprdy => calculate_pixos_cp_sp_subfprdy
);

--  Test Bench Statements
p_tb : PROCESS
BEGIN
calculate_pixos_cp_sp_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
calculate_pixos_cp_sp_reset <= '0';
wait for clockperiod*10;
-- Add user defined stimulus here
calculate_pixos_cp_sp_Ta <= x"4207F54F"; -- 33.989559
calculate_pixos_cp_sp_Vdd <= x"40D2F5C3"; -- 6.5925
calculate_pixos_cp_sp_run <= '1'; wait for clockperiod; calculate_pixos_cp_sp_run <= '0';
wait until calculate_pixos_cp_sp_rdy = '1';
--report "rdy at 4.165us";
--report "rdy at 3.795us";
--report "rdy at 17.635us - rewrite calculation without regs";
--report "rdy at 17.475us - rewrite calculation without regs, cleanup";
report "rdy at 17.355us - rewrite calculation without regs, cleanup";
warning_neq_fp (calculate_pixos_cp_sp_pixoscpsp0, x"42b06005", "pixoscpsp0");
warning_neq_fp (calculate_pixos_cp_sp_pixoscpsp1, x"42a9f7c2", "pixoscpsp1");
wait for 1 ps;
report "done" severity failure;
END PROCESS p_tb;
--  End Test Bench 

calculate_pixos_cp_sp_fixed2floatclk <= calculate_pixos_cp_sp_clock;
calculate_pixos_cp_sp_addfpclk <= calculate_pixos_cp_sp_clock;
calculate_pixos_cp_sp_subfpclk <= calculate_pixos_cp_sp_clock;
calculate_pixos_cp_sp_mulfpclk <= calculate_pixos_cp_sp_clock;
calculate_pixos_cp_sp_divfpclk <= calculate_pixos_cp_sp_clock;

fixed2float_i0 : fixed2float
PORT MAP (
a => calculate_pixos_cp_sp_fixed2floata,
operation_nd => calculate_pixos_cp_sp_fixed2floatond,
clk => calculate_pixos_cp_sp_fixed2floatclk,
sclr => calculate_pixos_cp_sp_fixed2floatsclr,
ce => calculate_pixos_cp_sp_fixed2floatce,
result => calculate_pixos_cp_sp_fixed2floatr,
rdy => calculate_pixos_cp_sp_fixed2floatrdy
);

divfp_i0 : divfp
PORT MAP (
a => calculate_pixos_cp_sp_divfpa,
b => calculate_pixos_cp_sp_divfpb,
operation_nd => calculate_pixos_cp_sp_divfpond,
clk => calculate_pixos_cp_sp_divfpclk,
sclr => calculate_pixos_cp_sp_divfpsclr,
ce => calculate_pixos_cp_sp_divfpce,
result => calculate_pixos_cp_sp_divfpr,
rdy => calculate_pixos_cp_sp_divfprdy
);

mulfp_i0 : mulfp
PORT MAP (
a => calculate_pixos_cp_sp_mulfpa,
b => calculate_pixos_cp_sp_mulfpb,
operation_nd => calculate_pixos_cp_sp_mulfpond,
clk => calculate_pixos_cp_sp_mulfpclk,
sclr => calculate_pixos_cp_sp_mulfpsclr,
ce => calculate_pixos_cp_sp_mulfpce,
result => calculate_pixos_cp_sp_mulfpr,
rdy => calculate_pixos_cp_sp_mulfprdy
);

addfp_i0 : addfp
PORT MAP (
a => calculate_pixos_cp_sp_addfpa,
b => calculate_pixos_cp_sp_addfpb,
operation_nd => calculate_pixos_cp_sp_addfpond,
clk => calculate_pixos_cp_sp_addfpclk,
sclr => calculate_pixos_cp_sp_addfpsclr,
ce => calculate_pixos_cp_sp_addfpce,
result => calculate_pixos_cp_sp_addfpr,
rdy => calculate_pixos_cp_sp_addfprdy
);

subfp_i0 : subfp
PORT MAP (
a => calculate_pixos_cp_sp_subfpa,
b => calculate_pixos_cp_sp_subfpb,
operation_nd => calculate_pixos_cp_sp_subfpond,
clk => calculate_pixos_cp_sp_subfpclk,
sclr => calculate_pixos_cp_sp_subfpsclr,
ce => calculate_pixos_cp_sp_subfpce,
result => calculate_pixos_cp_sp_subfpr,
rdy => calculate_pixos_cp_sp_subfprdy
);

rom_constants_i0 : rom_constants PORT MAP (
i_clock => calculate_pixos_cp_sp_clock,
i_reset => calculate_pixos_cp_sp_reset,
i_kvptat_en => '0',
i_kvptat_adr => (others => '0'),
i_alphaptat_en => '0',
i_alphaptat_adr => (others => '0'),
i_signed4bit_en => '0',
i_signed4bit_adr => (others => '0'),
i_signed6bit_en => calculate_pixos_cp_sp_signed6bit_ena,
i_signed6bit_adr => calculate_pixos_cp_sp_signed6bit_adr,
i_alphascale_1_en => '0',
i_alphascale_1_adr => (others => '0'),
i_2powx_4bit_en => calculate_pixos_cp_sp_2powx_4bit_ena,
i_2powx_4bit_adr => calculate_pixos_cp_sp_2powx_4bit_adr,
i_cpratio_en => '0',
i_cpratio_adr => (others => '0'),
i_alphascale_2_en => '0',
i_alphascale_2_adr => (others => '0'),
i_2powx_p8_4bit_en => calculate_pixos_cp_sp_2powx_p8_4bit_ena,
i_2powx_p8_4bit_adr => calculate_pixos_cp_sp_2powx_p8_4bit_adr,
i_signed3bit_en => '0',
i_signed3bit_adr => (others => '0'),
o_float => calculate_pixos_cp_sp_rom_constants_float
);

end architecture tb;

