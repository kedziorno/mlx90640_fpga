-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   13:30:00 02/09/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_calculate_alpha_cp
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
--    - Files:
--      rom_constants.vhd
--    - Modules:
--      fixed2float, divfp, mulfp, tb_i2c_mem, rom_constants
--    - Processes (Architecture: tb):
--      p_clock_process, p_tb
--
-- Important objects:
--  - tb_i2c_mem, rom_constants
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

ENTITY tb_calculate_alpha_cp IS
END tb_calculate_alpha_cp;

ARCHITECTURE tb OF tb_calculate_alpha_cp IS 

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
signal fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;

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
component calculate_alpha_cp is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_acpsubpage0 : out std_logic_vector (31 downto 0);
o_acpsubpage1 : out std_logic_vector (31 downto 0);
o_rdy : out std_logic;

signal o_cpratio_ena : out std_logic;
signal o_cpratio_adr : out std_logic_vector (5 downto 0);
signal o_alphascale_2_ena : out std_logic;
signal o_alphascale_2_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);

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

signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC

);
end component calculate_alpha_cp;
signal calculate_alpha_cp_clock : std_logic;
signal calculate_alpha_cp_reset : std_logic;
signal calculate_alpha_cp_run : std_logic;
signal calculate_alpha_cp_i2c_mem_ena : STD_LOGIC;
signal calculate_alpha_cp_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculate_alpha_cp_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculate_alpha_cp_acpsubpage0 : std_logic_vector (31 downto 0);
signal calculate_alpha_cp_acpsubpage1 : std_logic_vector (31 downto 0);
signal calculate_alpha_cp_rdy : std_logic;
signal calculate_alpha_cp_cpratio_ena : std_logic;
signal calculate_alpha_cp_cpratio_adr : std_logic_vector (5 downto 0);
signal calculate_alpha_cp_alphascale_2_ena : std_logic;
signal calculate_alpha_cp_alphascale_2_adr : std_logic_vector (3 downto 0);
signal calculate_alpha_cp_rom_constants_float : std_logic_vector (31 downto 0);
signal calculate_alpha_cp_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_cp_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_cp_divfpond : STD_LOGIC;
signal calculate_alpha_cp_divfpsclr : STD_LOGIC;
signal calculate_alpha_cp_divfpce : STD_LOGIC;
signal calculate_alpha_cp_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_cp_divfprdy : STD_LOGIC;
signal calculate_alpha_cp_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_cp_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_cp_mulfpond : STD_LOGIC;
signal calculate_alpha_cp_mulfpsclr : STD_LOGIC;
signal calculate_alpha_cp_mulfpce : STD_LOGIC;
signal calculate_alpha_cp_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_cp_mulfprdy : STD_LOGIC;
signal calculate_alpha_cp_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal calculate_alpha_cp_fixed2floatond : STD_LOGIC;
signal calculate_alpha_cp_fixed2floatce : STD_LOGIC;
signal calculate_alpha_cp_fixed2floatsclr : STD_LOGIC;
signal calculate_alpha_cp_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_cp_fixed2floatrdy : STD_LOGIC;

signal calculate_alpha_cp_divfpclk : std_logic;
signal calculate_alpha_cp_mulfpclk : std_logic;
signal calculate_alpha_cp_fixed2floatclk : std_logic;

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
END COMPONENT rom_constants;

constant clockperiod : time := 10 ns;

BEGIN

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => calculate_alpha_cp_clock,
ena => calculate_alpha_cp_i2c_mem_ena,
wea => "0",
addra => calculate_alpha_cp_i2c_mem_addra,
dina => (others => '0'),
douta => calculate_alpha_cp_i2c_mem_douta
);

-- Component Instantiation
calculate_alpha_cp_uut: calculate_alpha_cp
port map (
i_clock => calculate_alpha_cp_clock,
i_reset => calculate_alpha_cp_reset,
i_run => calculate_alpha_cp_run,
i2c_mem_ena => calculate_alpha_cp_i2c_mem_ena,
i2c_mem_addra => calculate_alpha_cp_i2c_mem_addra,
i2c_mem_douta => calculate_alpha_cp_i2c_mem_douta,
o_acpsubpage0 => calculate_alpha_cp_acpsubpage0,
o_acpsubpage1 => calculate_alpha_cp_acpsubpage1,
o_rdy => calculate_alpha_cp_rdy,

o_cpratio_ena => calculate_alpha_cp_cpratio_ena,
o_cpratio_adr => calculate_alpha_cp_cpratio_adr,
o_alphascale_2_ena => calculate_alpha_cp_alphascale_2_ena,
o_alphascale_2_adr => calculate_alpha_cp_alphascale_2_adr,
i_rom_constants_float => calculate_alpha_cp_rom_constants_float,

divfpa => calculate_alpha_cp_divfpa,
divfpb => calculate_alpha_cp_divfpb,
divfpond => calculate_alpha_cp_divfpond,
divfpsclr => calculate_alpha_cp_divfpsclr,
divfpce => calculate_alpha_cp_divfpce,
divfpr => calculate_alpha_cp_divfpr,
divfprdy => calculate_alpha_cp_divfprdy,

mulfpa => calculate_alpha_cp_mulfpa,
mulfpb => calculate_alpha_cp_mulfpb,
mulfpond => calculate_alpha_cp_mulfpond,
mulfpsclr => calculate_alpha_cp_mulfpsclr,
mulfpce => calculate_alpha_cp_mulfpce,
mulfpr => calculate_alpha_cp_mulfpr,
mulfprdy => calculate_alpha_cp_mulfprdy,

fixed2floata => calculate_alpha_cp_fixed2floata,
fixed2floatond => calculate_alpha_cp_fixed2floatond,
fixed2floatsclr => calculate_alpha_cp_fixed2floatsclr,
fixed2floatce => calculate_alpha_cp_fixed2floatce,
fixed2floatr => calculate_alpha_cp_fixed2floatr,
fixed2floatrdy => calculate_alpha_cp_fixed2floatrdy
);

p_clock_process : process is
begin
	calculate_alpha_cp_clock <= '0';
	wait for clockperiod/2;
	calculate_alpha_cp_clock <= '1';
	wait for clockperiod/2;
end process p_clock_process;

--  Test Bench Statements
p_tb : PROCESS
BEGIN
calculate_alpha_cp_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
calculate_alpha_cp_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod*10;
calculate_alpha_cp_run <= '1'; wait for clockperiod; calculate_alpha_cp_run <= '0';
wait until calculate_alpha_cp_rdy = '1';
warning_neq_fp (calculate_alpha_cp_acpsubpage0, x"31460000", "acpsubpage0 585ns");
warning_neq_fp (calculate_alpha_cp_acpsubpage1, x"31478c00", "acpsubpage1 695ns");
wait for 1 ps;
report "done" severity failure;
END PROCESS p_tb;

calculate_alpha_cp_divfpclk <= calculate_alpha_cp_clock;
divfp_i0 : divfp
PORT MAP (
a => calculate_alpha_cp_divfpa,
b => calculate_alpha_cp_divfpb,
operation_nd => calculate_alpha_cp_divfpond,
clk => calculate_alpha_cp_divfpclk,
sclr => calculate_alpha_cp_divfpsclr,
ce => calculate_alpha_cp_divfpce,
result => calculate_alpha_cp_divfpr,
rdy => calculate_alpha_cp_divfprdy
);

calculate_alpha_cp_mulfpclk <= calculate_alpha_cp_clock;
mulfp_i0 : mulfp
PORT MAP (
a => calculate_alpha_cp_mulfpa,
b => calculate_alpha_cp_mulfpb,
operation_nd => calculate_alpha_cp_mulfpond,
clk => calculate_alpha_cp_mulfpclk,
sclr => calculate_alpha_cp_mulfpsclr,
ce => calculate_alpha_cp_mulfpce,
result => calculate_alpha_cp_mulfpr,
rdy => calculate_alpha_cp_mulfprdy
);

calculate_alpha_cp_fixed2floatclk <= calculate_alpha_cp_clock;
fixed2float_i0 : fixed2float
PORT MAP (
a => calculate_alpha_cp_fixed2floata,
operation_nd => calculate_alpha_cp_fixed2floatond,
clk => calculate_alpha_cp_fixed2floatclk,
sclr => calculate_alpha_cp_fixed2floatsclr,
ce => calculate_alpha_cp_fixed2floatce,
result => calculate_alpha_cp_fixed2floatr,
rdy => calculate_alpha_cp_fixed2floatrdy
);

rom_constants_i0 : rom_constants PORT MAP (
i_clock => calculate_alpha_cp_clock,
i_reset => calculate_alpha_cp_reset,
i_kvptat_en => '0',
i_kvptat_adr => (others => '0'),
i_alphaptat_en => '0',
i_alphaptat_adr => (others => '0'),
i_signed4bit_en => '0',
i_signed4bit_adr => (others => '0'),
i_signed6bit_en => '0',
i_signed6bit_adr => (others => '0'),
i_alphascale_1_en => '0',
i_alphascale_1_adr => (others => '0'),
i_2powx_4bit_en => '0',
i_2powx_4bit_adr => (others => '0'),
i_cpratio_en => calculate_alpha_cp_cpratio_ena,
i_cpratio_adr => calculate_alpha_cp_cpratio_adr,
i_alphascale_2_en => calculate_alpha_cp_alphascale_2_ena,
i_alphascale_2_adr => calculate_alpha_cp_alphascale_2_adr,
i_2powx_p8_4bit_en => '0',
i_2powx_p8_4bit_adr => (others => '0'),
i_signed3bit_en => '0',
i_signed3bit_adr => (others => '0'),
o_float => calculate_alpha_cp_rom_constants_float
);

end architecture tb;

