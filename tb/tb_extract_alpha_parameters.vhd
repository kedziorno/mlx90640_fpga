-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   16:57:28 01/29/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_extract_alpha_parameters
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
--      fixed2float, divfp, mulfp, addfp, rom_constants, tb_i2c_mem
--    - Processes (Architecture: tb):
--      p_clock_generator, p_tb
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

use work.global_package.all;

ENTITY tb_extract_alpha_parameters IS
END tb_extract_alpha_parameters;

ARCHITECTURE tb OF tb_extract_alpha_parameters IS 

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

-- Component Declaration for the Unit Under Test (UUT)
component extract_alpha_parameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_done : out std_logic;
o_rdy : out std_logic;

signal i2c_mem_ena : out STD_LOGIC;
signal i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

signal o_signed4bit_ena : out std_logic;
signal o_signed4bit_adr : out std_logic_vector (3 downto 0);
signal o_signed6bit_ena : out std_logic;
signal o_signed6bit_adr : out std_logic_vector (5 downto 0);
signal o_alphascale_1_ena : out std_logic;
signal o_alphascale_1_adr : out std_logic_vector (3 downto 0);
signal o_2powx_4bit_ena : out std_logic;
signal o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);

signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

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

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC
);
end component extract_alpha_parameters;
signal extract_alpha_parameters_clock : std_logic;
signal extract_alpha_parameters_reset : std_logic;
signal extract_alpha_parameters_run : std_logic;
signal extract_alpha_parameters_i2c_mem_ena : STD_LOGIC;
signal extract_alpha_parameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal extract_alpha_parameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal extract_alpha_parameters_do : std_logic_vector (31 downto 0);
signal extract_alpha_parameters_addr : std_logic_vector (9 downto 0) := (others => '0'); -- 10bit-1024
signal extract_alpha_parameters_done : std_logic;
signal extract_alpha_parameters_rdy : std_logic;
signal extract_alpha_parameters_signed4bit_ena : std_logic;
signal extract_alpha_parameters_signed4bit_adr : std_logic_vector (3 downto 0);
signal extract_alpha_parameters_signed6bit_ena : std_logic;
signal extract_alpha_parameters_signed6bit_adr : std_logic_vector (5 downto 0);
signal extract_alpha_parameters_alphascale_1_ena : std_logic;
signal extract_alpha_parameters_alphascale_1_adr : std_logic_vector (3 downto 0);
signal extract_alpha_parameters_2powx_4bit_ena : std_logic;
signal extract_alpha_parameters_2powx_4bit_adr : std_logic_vector (3 downto 0);
signal extract_alpha_parameters_rom_constants_float : std_logic_vector (31 downto 0);
signal extract_alpha_parameters_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal extract_alpha_parameters_fixed2floatond : STD_LOGIC;
signal extract_alpha_parameters_fixed2floatsclr : STD_LOGIC;
signal extract_alpha_parameters_fixed2floatce : STD_LOGIC;
signal extract_alpha_parameters_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_alpha_parameters_fixed2floatrdy : STD_LOGIC;
signal extract_alpha_parameters_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_alpha_parameters_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_alpha_parameters_mulfpond : STD_LOGIC;
signal extract_alpha_parameters_mulfpsclr : STD_LOGIC;
signal extract_alpha_parameters_mulfpce : STD_LOGIC;
signal extract_alpha_parameters_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_alpha_parameters_mulfprdy : STD_LOGIC;
signal extract_alpha_parameters_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_alpha_parameters_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_alpha_parameters_addfpond : STD_LOGIC;
signal extract_alpha_parameters_addfpsclr : STD_LOGIC;
signal extract_alpha_parameters_addfpce : STD_LOGIC;
signal extract_alpha_parameters_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_alpha_parameters_addfprdy : STD_LOGIC;
signal extract_alpha_parameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_alpha_parameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_alpha_parameters_divfpond : STD_LOGIC;
signal extract_alpha_parameters_divfpsclr : STD_LOGIC;
signal extract_alpha_parameters_divfpce : STD_LOGIC;
signal extract_alpha_parameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_alpha_parameters_divfprdy : STD_LOGIC;

signal extract_alpha_parameters_fixed2floatclk : std_logic;
signal extract_alpha_parameters_addfpclk : std_logic;
signal extract_alpha_parameters_mulfpclk : std_logic;
signal extract_alpha_parameters_divfpclk : std_logic;

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

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (extract_alpha_parameters_do); -- output data

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => extract_alpha_parameters_clock,
ena => extract_alpha_parameters_i2c_mem_ena,
wea => "0",
addra => extract_alpha_parameters_i2c_mem_addra,
dina => (others => '0'),
douta => extract_alpha_parameters_i2c_mem_douta
);

-- Instantiate the Unit Under Test (UUT)
extract_alpha_parameters_uut: extract_alpha_parameters PORT MAP (
i_clock => extract_alpha_parameters_clock,
i_reset => extract_alpha_parameters_reset,
i_run => extract_alpha_parameters_run,

o_do => extract_alpha_parameters_do,
i_addr => extract_alpha_parameters_addr,
o_done => extract_alpha_parameters_done,
o_rdy => extract_alpha_parameters_rdy,

i2c_mem_ena => extract_alpha_parameters_i2c_mem_ena,
i2c_mem_addra => extract_alpha_parameters_i2c_mem_addra,
i2c_mem_douta => extract_alpha_parameters_i2c_mem_douta,

o_signed4bit_ena => extract_alpha_parameters_signed4bit_ena,
o_signed4bit_adr => extract_alpha_parameters_signed4bit_adr,
o_signed6bit_ena => extract_alpha_parameters_signed6bit_ena,
o_signed6bit_adr => extract_alpha_parameters_signed6bit_adr,
o_alphascale_1_ena => extract_alpha_parameters_alphascale_1_ena,
o_alphascale_1_adr => extract_alpha_parameters_alphascale_1_adr,
o_2powx_4bit_ena => extract_alpha_parameters_2powx_4bit_ena,
o_2powx_4bit_adr => extract_alpha_parameters_2powx_4bit_adr,
i_rom_constants_float => extract_alpha_parameters_rom_constants_float,

fixed2floata => extract_alpha_parameters_fixed2floata,
fixed2floatond => extract_alpha_parameters_fixed2floatond,
fixed2floatsclr => extract_alpha_parameters_fixed2floatsclr,
fixed2floatce => extract_alpha_parameters_fixed2floatce,
fixed2floatr => extract_alpha_parameters_fixed2floatr,
fixed2floatrdy => extract_alpha_parameters_fixed2floatrdy,

mulfpa => extract_alpha_parameters_mulfpa,
mulfpb => extract_alpha_parameters_mulfpb,
mulfpond => extract_alpha_parameters_mulfpond,
mulfpsclr => extract_alpha_parameters_mulfpsclr,
mulfpce => extract_alpha_parameters_mulfpce,
mulfpr => extract_alpha_parameters_mulfpr,
mulfprdy => extract_alpha_parameters_mulfprdy,

addfpa => extract_alpha_parameters_addfpa,
addfpb => extract_alpha_parameters_addfpb,
addfpond => extract_alpha_parameters_addfpond,
addfpsclr => extract_alpha_parameters_addfpsclr,
addfpce => extract_alpha_parameters_addfpce,
addfpr => extract_alpha_parameters_addfpr,
addfprdy => extract_alpha_parameters_addfprdy,

divfpa => extract_alpha_parameters_divfpa,
divfpb => extract_alpha_parameters_divfpb,
divfpond => extract_alpha_parameters_divfpond,
divfpsclr => extract_alpha_parameters_divfpsclr,
divfpce => extract_alpha_parameters_divfpce,
divfpr => extract_alpha_parameters_divfpr,
divfprdy => extract_alpha_parameters_divfprdy
);

-- Clock process definitions
p_clock_generator : process
begin
extract_alpha_parameters_clock <= '0';
wait for i_clock_period/2;
extract_alpha_parameters_clock <= '1';
wait for i_clock_period/2;
end process p_clock_generator;

extract_alpha_parameters_reset <= '1', '0' after 100 ns ;	

-- Stimulus process
p_tb : process
type itemr is record
a : std_logic_vector (31 downto 0);
b : integer;
end record; 
type ten_items is array (0 to 9) of itemr;
type mid_items is array (0 to 1) of itemr;
type datar is record
first : ten_items;
middle : mid_items;
last : ten_items;
end record;
-- XXX data from ExtractAlphaParameters
--constant datao : datar := ( -- XXX prev values
--first => (
--(a => x"331C6400", b => 0),
--(a => x"331E6400", b => 1),
--(a => x"3322E400", b => 2),
--(a => x"3324E400", b => 3),
--(a => x"332F6400", b => 4),
--(a => x"33326400", b => 5),
--(a => x"3332E400", b => 6),
--(a => x"33356400", b => 7),
--(a => x"333D6400", b => 8),
--(a => x"333FE400", b => 9)
--),
--middle => (
--(a => x"331EE400", b => 382),
--(a => x"3337E400", b => 384)
--),
--last => (
--(a => x"33326400", b => 758),
--(a => x"332F6400", b => 759),
--(a => x"332AE400", b => 760),
--(a => x"3329E400", b => 761),
--(a => x"331B6400", b => 762),
--(a => x"33196400", b => 763),
--(a => x"33126400", b => 764),
--(a => x"330FE400", b => 765),
--(a => x"32FFC800", b => 766),
--(a => x"32F6C800", b => 767)
--)
--);
constant datao : datar := ( -- XXX differ 2.473826e-10 after optimize reg
first => (
(a => x"331C6400", b => 0),
(a => x"331D5400", b => 1),
(a => x"3321D400", b => 2),
(a => x"3323D400", b => 3),
(a => x"332E5400", b => 4),
(a => x"33315400", b => 5),
(a => x"3331D400", b => 6),
(a => x"33345400", b => 7),
(a => x"333C5400", b => 8),
(a => x"333ED400", b => 9)
),
middle => (
(a => x"331DD400", b => 382),
(a => x"3336D400", b => 384)
),
last => (
(a => x"33315400", b => 758),
(a => x"332E5400", b => 759),
(a => x"3329D400", b => 760),
(a => x"3328D400", b => 761),
(a => x"331A5400", b => 762),
(a => x"33185400", b => 763),
(a => x"33115400", b => 764),
(a => x"330ED400", b => 765),
(a => x"32FDA800", b => 766),
(a => x"32F6C800", b => 767)
)
);
begin
-- hold reset state for 100 ns.
wait for 105 ns;
-- insert stimulus here
extract_alpha_parameters_run <= '1'; wait for i_clock_period; extract_alpha_parameters_run <= '0';
wait until extract_alpha_parameters_rdy = '1';
--report "rdy at 954.235us";
--report "rdy at 930.805us - with acc loop";
--report "rdy at 930.945us";
--report "rdy at 930.795us";
--report "rdy at 930.705us";
--report "end at 1007.415us - move fi2fl, rm valphareference reg";
--report "end at 1007.415us - move fi2fl, rm valphareference reg";
--report "end at 1107.255us - rm valphareference reg, rm vaccrowi, rm vacccolumnj";
--report "end at 1114.935us - rm valphareference reg, rm vaccrowi, rm vacccolumnj, rm fixed reg";
report "end at 1114.835us - rm valphareference reg, rm vaccrowi, rm vacccolumnj, rm fixed reg, rm remnant,row,col reg, to differ by ~2.47e-10";
extract_alpha_parameters_addr <= std_logic_vector (to_unsigned (datao.first(0).b, 10));
wait until rising_edge (extract_alpha_parameters_clock);
wait until rising_edge (extract_alpha_parameters_clock);
warning_neq_fp (extract_alpha_parameters_do, datao.first(0).a, "first " & integer'image (datao.first(0).b) & " different 2.473826e-10 - compare with prev");
for i in 1 to 9 loop
extract_alpha_parameters_addr <= std_logic_vector (to_unsigned (datao.first(i).b, 10));
wait until rising_edge (extract_alpha_parameters_clock);
wait until rising_edge (extract_alpha_parameters_clock);
warning_neq_fp (extract_alpha_parameters_do, datao.first(i).a, "first " & integer'image (datao.first(i).b));
end loop;
for i in 0 to 1 loop
extract_alpha_parameters_addr <= std_logic_vector (to_unsigned (datao.middle(i).b, 10));
wait until rising_edge (extract_alpha_parameters_clock);
wait until rising_edge (extract_alpha_parameters_clock);
warning_neq_fp (extract_alpha_parameters_do, datao.middle(i).a, "middle " & integer'image (datao.middle(i).b));
end loop;
for i in 0 to 8 loop
extract_alpha_parameters_addr <= std_logic_vector (to_unsigned (datao.last(i).b, 10));
wait until rising_edge (extract_alpha_parameters_clock);
wait until rising_edge (extract_alpha_parameters_clock);
warning_neq_fp (extract_alpha_parameters_do, datao.last(i).a, "last " & integer'image (datao.last(i).b));
end loop;
extract_alpha_parameters_addr <= std_logic_vector (to_unsigned (datao.last(9).b, 10));
wait until rising_edge (extract_alpha_parameters_clock);
wait until rising_edge (extract_alpha_parameters_clock);
warning_neq_fp (extract_alpha_parameters_do, datao.last(9).a, "last " & integer'image (datao.last(9).b) & " different 2.473826e-10 - compare with prev", true);
--report "end at 974.735us";
--report "end at 954.675us";
--report "end at 931.245us - with acc loop";
--report "end at 931.385us";
--report "end at 931.235us";
--report "end at 931.145us";
--report "end at 1007.855us - move fi2fl, rm valphareference reg";
--report "end at 1107.695us - rm valphareference reg, rm vaccrowi, rm vacccolumnj";
--report "end at 1115.375us - rm valphareference reg, rm vaccrowi, rm vacccolumnj, rm fixed reg";
report "end at 1115.275us - rm valphareference reg, rm vaccrowi, rm vacccolumnj, rm fixed reg, rm remnant,row,col reg, to differ by ~2.47e-10";
wait for 1 ps; -- must be for write
report "done" severity failure;
--wait on o_done;
end process p_tb;

extract_alpha_parameters_fixed2floatclk <= extract_alpha_parameters_clock;
extract_alpha_parameters_addfpclk <= extract_alpha_parameters_clock;
extract_alpha_parameters_mulfpclk <= extract_alpha_parameters_clock;
extract_alpha_parameters_divfpclk <= extract_alpha_parameters_clock;

fixed2float_i0 : fixed2float
PORT MAP (
a => extract_alpha_parameters_fixed2floata,
operation_nd => extract_alpha_parameters_fixed2floatond,
clk => extract_alpha_parameters_fixed2floatclk,
sclr => extract_alpha_parameters_fixed2floatsclr,
ce => extract_alpha_parameters_fixed2floatce,
result => extract_alpha_parameters_fixed2floatr,
rdy => extract_alpha_parameters_fixed2floatrdy
);

divfp_i0 : divfp
PORT MAP (
a => extract_alpha_parameters_divfpa,
b => extract_alpha_parameters_divfpb,
operation_nd => extract_alpha_parameters_divfpond,
clk => extract_alpha_parameters_divfpclk,
sclr => extract_alpha_parameters_divfpsclr,
ce => extract_alpha_parameters_divfpce,
result => extract_alpha_parameters_divfpr,
rdy => extract_alpha_parameters_divfprdy
);

mulfp_i0 : mulfp
PORT MAP (
a => extract_alpha_parameters_mulfpa,
b => extract_alpha_parameters_mulfpb,
operation_nd => extract_alpha_parameters_mulfpond,
clk => extract_alpha_parameters_mulfpclk,
sclr => extract_alpha_parameters_mulfpsclr,
ce => extract_alpha_parameters_mulfpce,
result => extract_alpha_parameters_mulfpr,
rdy => extract_alpha_parameters_mulfprdy
);

addfp_i0 : addfp
PORT MAP (
a => extract_alpha_parameters_addfpa,
b => extract_alpha_parameters_addfpb,
operation_nd => extract_alpha_parameters_addfpond,
clk => extract_alpha_parameters_addfpclk,
sclr => extract_alpha_parameters_addfpsclr,
ce => extract_alpha_parameters_addfpce,
result => extract_alpha_parameters_addfpr,
rdy => extract_alpha_parameters_addfprdy
);

rom_constants_i0 : rom_constants PORT MAP (
i_clock => extract_alpha_parameters_clock,
i_reset => extract_alpha_parameters_reset,
i_kvptat_en => '0',
i_kvptat_adr => (others => '0'),
i_alphaptat_en => '0',
i_alphaptat_adr => (others => '0'),
i_signed4bit_en => extract_alpha_parameters_signed4bit_ena,
i_signed4bit_adr => extract_alpha_parameters_signed4bit_adr,
i_signed6bit_en => extract_alpha_parameters_signed6bit_ena,
i_signed6bit_adr => extract_alpha_parameters_signed6bit_adr,
i_alphascale_1_en => extract_alpha_parameters_alphascale_1_ena,
i_alphascale_1_adr => extract_alpha_parameters_alphascale_1_adr,
i_2powx_4bit_en => extract_alpha_parameters_2powx_4bit_ena,
i_2powx_4bit_adr => extract_alpha_parameters_2powx_4bit_adr,
i_cpratio_en => '0',
i_cpratio_adr => (others => '0'),
i_alphascale_2_en => '0',
i_alphascale_2_adr => (others => '0'),
i_2powx_p8_4bit_en => '0',
i_2powx_p8_4bit_adr => (others => '0'),
i_signed3bit_en => '0',
i_signed3bit_adr => (others => '0'),
o_float => extract_alpha_parameters_rom_constants_float
);

END architecture tb;

