-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   21:42:12 02/16/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_calculate_pixos
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
--      tb_i2c_mem, divfp, mulfp, addfp, subfp, fixed2float, rom_constants
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

ENTITY tb_calculate_pixos IS
END tb_calculate_pixos;

ARCHITECTURE tb OF tb_calculate_pixos IS 

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

signal fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
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

component calculate_pixos is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_Ta : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_KGain : in std_logic_vector (31 downto 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

o_signed4bit_ena : out std_logic;
o_signed4bit_adr : out std_logic_vector (3 downto 0);
o_signed6bit_ena : out std_logic;
o_signed6bit_adr : out std_logic_vector (5 downto 0);
o_2powx_4bit_ena : out std_logic;
o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
o_2powx_p8_4bit_ena : out std_logic;
o_2powx_p8_4bit_adr : out std_logic_vector (3 downto 0);
o_signed3bit_ena : out std_logic;
o_signed3bit_adr : out std_logic_vector (2 downto 0);
i_rom_constants_float : in std_logic_vector (31 downto 0);

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
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
end component calculate_pixos;

signal calculate_pixos_clock : std_logic;
signal calculate_pixos_reset : std_logic;
signal calculate_pixos_run : std_logic;
signal calculate_pixos_i2c_mem_ena : STD_LOGIC;
signal calculate_pixos_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculate_pixos_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculate_pixos_const1 : std_logic_vector (31 downto 0);
signal calculate_pixos_Ta : std_logic_vector (31 downto 0);
signal calculate_pixos_Ta0 : std_logic_vector (31 downto 0);
signal calculate_pixos_Vdd : std_logic_vector (31 downto 0);
signal calculate_pixos_VddV0 : std_logic_vector (31 downto 0);
signal calculate_pixos_KGain : std_logic_vector (31 downto 0);
signal calculate_pixos_do : std_logic_vector (31 downto 0);
signal calculate_pixos_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal calculate_pixos_rdy : std_logic;
signal calculate_pixos_signed4bit_ena : std_logic := '0';
signal calculate_pixos_signed4bit_adr : std_logic_vector (3 downto 0) := (others => '0');
signal calculate_pixos_signed6bit_ena : std_logic := '0';
signal calculate_pixos_signed6bit_adr : std_logic_vector (5 downto 0) := (others => '0');
signal calculate_pixos_2powx_4bit_ena : std_logic := '0';
signal calculate_pixos_2powx_4bit_adr : std_logic_vector (3 downto 0) := (others => '0');
signal calculate_pixos_2powx_p8_4bit_ena : std_logic := '0';
signal calculate_pixos_2powx_p8_4bit_adr : std_logic_vector (3 downto 0) := (others => '0');
signal calculate_pixos_signed3bit_ena : std_logic := '0';
signal calculate_pixos_signed3bit_adr : std_logic_vector (2 downto 0) := (others => '0');
signal calculate_pixos_rom_constants_float : std_logic_vector (31 downto 0) := (others => '0');
signal calculate_pixos_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal calculate_pixos_fixed2floatond : STD_LOGIC;
signal calculate_pixos_fixed2floatce : STD_LOGIC;
signal calculate_pixos_fixed2floatsclr : STD_LOGIC;
signal calculate_pixos_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_fixed2floatrdy : STD_LOGIC;
signal calculate_pixos_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_mulfpond : STD_LOGIC;
signal calculate_pixos_mulfpsclr : STD_LOGIC;
signal calculate_pixos_mulfpce : STD_LOGIC;
signal calculate_pixos_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_mulfprdy : STD_LOGIC;
signal calculate_pixos_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_divfpond : STD_LOGIC;
signal calculate_pixos_divfpsclr : STD_LOGIC;
signal calculate_pixos_divfpce : STD_LOGIC;
signal calculate_pixos_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_divfprdy : STD_LOGIC;
signal calculate_pixos_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_addfpond : STD_LOGIC;
signal calculate_pixos_addfpsclr : STD_LOGIC;
signal calculate_pixos_addfpce : STD_LOGIC;
signal calculate_pixos_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_addfprdy : STD_LOGIC;
signal calculate_pixos_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_subfpond : STD_LOGIC;
signal calculate_pixos_subfpsclr : STD_LOGIC;
signal calculate_pixos_subfpce : STD_LOGIC;
signal calculate_pixos_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pixos_subfprdy : STD_LOGIC;

signal calculate_pixos_fixed2floatclk : std_logic;
signal calculate_pixos_addfpclk : std_logic;
signal calculate_pixos_subfpclk : std_logic;
signal calculate_pixos_mulfpclk : std_logic;
signal calculate_pixos_divfpclk : std_logic;

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

signal i_kvptat_en : std_logic;
signal i_kvptat_adr : std_logic_vector(5 downto 0);
signal i_alphaptat_en : std_logic;
signal i_alphaptat_adr : std_logic_vector(3 downto 0);
signal i_signed4bit_en : std_logic;
signal i_signed4bit_adr : std_logic_vector(3 downto 0);
signal i_signed6bit_en : std_logic;
signal i_signed6bit_adr : std_logic_vector(5 downto 0);
signal i_alphascale_1_en : std_logic;
signal i_alphascale_1_adr : std_logic_vector(3 downto 0);
signal i_2powx_4bit_en : std_logic;
signal i_2powx_4bit_adr : std_logic_vector(3 downto 0);
signal i_cpratio_en : std_logic;
signal i_cpratio_adr : std_logic_vector(5 downto 0);
signal i_alphascale_2_en : std_logic;
signal i_alphascale_2_adr : std_logic_vector(3 downto 0);
signal i_2powx_p8_4bit_en : std_logic;
signal i_2powx_p8_4bit_adr : std_logic_vector(3 downto 0);
signal i_signed3bit_en : std_logic;
signal i_signed3bit_adr : std_logic_vector(2 downto 0);
signal o_float : std_logic_vector(31 downto 0);

constant i_clock_period : time := 10 ns;
signal i_clock : std_logic;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (calculate_pixos_do); -- output data

calculate_pixos_KGain <= x"3F81AC57"; -- 1.0130719
i_signed4bit_en <= calculate_pixos_signed4bit_ena;
i_signed4bit_adr <= calculate_pixos_signed4bit_adr;
i_signed6bit_en <= calculate_pixos_signed6bit_ena;
i_signed6bit_adr <= calculate_pixos_signed6bit_adr;
i_2powx_4bit_en <= calculate_pixos_2powx_4bit_ena;
i_2powx_4bit_adr <= calculate_pixos_2powx_4bit_adr;
i_2powx_p8_4bit_en <= calculate_pixos_2powx_p8_4bit_ena;
i_2powx_p8_4bit_adr <= calculate_pixos_2powx_p8_4bit_adr;
i_signed3bit_en <= calculate_pixos_signed3bit_ena;
i_signed3bit_adr <= calculate_pixos_signed3bit_adr;
calculate_pixos_uut : calculate_pixos port map (
i_clock => calculate_pixos_clock,
i_reset => calculate_pixos_reset,
i_run => calculate_pixos_run,
i2c_mem_ena => calculate_pixos_i2c_mem_ena,
i2c_mem_addra => calculate_pixos_i2c_mem_addra,
i2c_mem_douta => calculate_pixos_i2c_mem_douta,
i_Ta => calculate_pixos_Ta,
i_Vdd => calculate_pixos_Vdd,
i_KGain => calculate_pixos_KGain,
o_do => calculate_pixos_do,
i_addr => calculate_pixos_addr,
o_rdy => calculate_pixos_rdy,
o_signed4bit_ena => calculate_pixos_signed4bit_ena,
o_signed4bit_adr => calculate_pixos_signed4bit_adr,
o_signed6bit_ena => calculate_pixos_signed6bit_ena,
o_signed6bit_adr => calculate_pixos_signed6bit_adr,
o_2powx_4bit_ena => calculate_pixos_2powx_4bit_ena,
o_2powx_4bit_adr => calculate_pixos_2powx_4bit_adr,
o_2powx_p8_4bit_ena => calculate_pixos_2powx_p8_4bit_ena,
o_2powx_p8_4bit_adr => calculate_pixos_2powx_p8_4bit_adr,
o_signed3bit_ena => calculate_pixos_signed3bit_ena,
o_signed3bit_adr => calculate_pixos_signed3bit_adr,
i_rom_constants_float => calculate_pixos_rom_constants_float,
fixed2floata => calculate_pixos_fixed2floata,
fixed2floatond => calculate_pixos_fixed2floatond,
fixed2floatce => calculate_pixos_fixed2floatce,
fixed2floatsclr => calculate_pixos_fixed2floatsclr,
fixed2floatr => calculate_pixos_fixed2floatr,
fixed2floatrdy => calculate_pixos_fixed2floatrdy,
mulfpa => calculate_pixos_mulfpa,
mulfpb => calculate_pixos_mulfpb,
mulfpond => calculate_pixos_mulfpond,
mulfpsclr => calculate_pixos_mulfpsclr,
mulfpce => calculate_pixos_mulfpce,
mulfpr => calculate_pixos_mulfpr,
mulfprdy => calculate_pixos_mulfprdy,
addfpa => calculate_pixos_addfpa,
addfpb => calculate_pixos_addfpb,
addfpond => calculate_pixos_addfpond,
addfpsclr => calculate_pixos_addfpsclr,
addfpce => calculate_pixos_addfpce,
addfpr => calculate_pixos_addfpr,
addfprdy => calculate_pixos_addfprdy,
subfpa => calculate_pixos_subfpa,
subfpb => calculate_pixos_subfpb,
subfpond => calculate_pixos_subfpond,
subfpsclr => calculate_pixos_subfpsclr,
subfpce => calculate_pixos_subfpce,
subfpr => calculate_pixos_subfpr,
subfprdy => calculate_pixos_subfprdy,
divfpa => calculate_pixos_divfpa,
divfpb => calculate_pixos_divfpb,
divfpond => calculate_pixos_divfpond,
divfpsclr => calculate_pixos_divfpsclr,
divfpce => calculate_pixos_divfpce,
divfpr => calculate_pixos_divfpr,
divfprdy => calculate_pixos_divfprdy
);

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => i_clock,
ena => calculate_pixos_i2c_mem_ena,
wea => "0",
addra => calculate_pixos_i2c_mem_addra,
dina => (others => '0'),
douta => calculate_pixos_i2c_mem_douta
);

calculate_pixos_clock <= i_clock;

p_clock_process :process
begin
i_clock <= '0';
wait for i_clock_period/2;
i_clock <= '1';
wait for i_clock_period/2;
end process p_clock_process;

p_tb : PROCESS IS
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
-- XXX data from CalculatePixOS
constant datao : datar := (
first => (
(a => x"436E2F29", b => 0),
(a => x"C1C67C98", b => 1),
(a => x"C1C24FD4", b => 2),
(a => x"C1BF07CA", b => 3),
(a => x"C1CC2AD6", b => 4),
(a => x"C1C87294", b => 5),
(a => x"C1C4A626", b => 6),
(a => x"C1CF3D56", b => 7),
(a => x"C1DCAB6A", b => 8),
(a => x"C1E06EE2", b => 9)
),
middle => (
(a => x"C1AE48B0", b => 382),
(a => x"C1D1355A", b => 384)
),
last => (
(a => x"C1C8AA24", b => 758),
(a => x"C1C1C800", b => 759),
(a => x"C12A65C0", b => 760),
(a => x"C17F93A8", b => 761),
(a => x"C0BAB5F0", b => 762),
(a => x"C09902B0", b => 763),
(a => x"C06E3E20", b => 764),
(a => x"C09902B0", b => 765),
(a => x"C11E3128", b => 766),
(a => x"C0B4CDC0", b => 767)
)
);
BEGIN
calculate_pixos_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
calculate_pixos_reset <= '0';
wait for i_clock_period*10;
calculate_pixos_const1 <= x"3F800000"; -- 1
calculate_pixos_Ta <= x"4207F54D"; -- 3.398955e+01
--calculate_pixos_Ta0 <= x"41C80000"; -- 25
calculate_pixos_Vdd <= x"4052B852"; -- 3.292500e+00
--calculate_pixos_VddV0 <= x"40533333"; -- 3.3
calculate_pixos_run <= '1'; wait for i_clock_period; calculate_pixos_run <= '0';
wait until calculate_pixos_rdy = '1';
--report "rdy at 2597.975us";
--report "rdy at 2352.505us";
--report "rdy at 2506.635us - rewrite submodules";
--report "rdy at 2629.515us - rewrite submodules, rm fptmp1";
--report "rdy at 2882.625us - rewrite submodules, rm fptmp1, rm vddDiff reg";
report "rdy at 3113.025us - rewrite submodules, rm fptmp1, rm vddDiff reg, rm taDiff reg";
for i in 0 to 9 loop
calculate_pixos_addr <= std_logic_vector (to_unsigned (datao.first(i).b, 10));
wait until rising_edge (calculate_pixos_clock);
wait until rising_edge (calculate_pixos_clock);
warning_neq_fp (calculate_pixos_do, datao.first(i).a, "first " & integer'image (datao.first(i).b));
--wait until rising_edge (calculate_pixos_clock);
end loop;
for i in 0 to 1 loop
calculate_pixos_addr <= std_logic_vector (to_unsigned (datao.middle(i).b, 10));
wait until rising_edge (calculate_pixos_clock);
wait until rising_edge (calculate_pixos_clock);
warning_neq_fp (calculate_pixos_do, datao.middle(i).a, "middle " & integer'image (datao.middle(i).b));
--wait until rising_edge (calculate_pixos_clock);
end loop;
for i in 0 to 8 loop -- XXX last_9 is OK here (tb_CalculateAlphaComp)
calculate_pixos_addr <= std_logic_vector (to_unsigned (datao.last(i).b, 10));
wait until rising_edge (calculate_pixos_clock);
wait until rising_edge (calculate_pixos_clock);
warning_neq_fp (calculate_pixos_do, datao.last(i).a, "last " & integer'image (datao.last(i).b));
--wait until rising_edge (calculate_pixos_clock);
end loop;
calculate_pixos_addr <= std_logic_vector (to_unsigned (datao.last(9).b, 10));
wait until rising_edge (calculate_pixos_clock);
wait until rising_edge (calculate_pixos_clock);
wait until rising_edge (calculate_pixos_clock);
warning_neq_fp (calculate_pixos_do, datao.last(9).a, "last " & integer'image (datao.last(9).b));
wait until rising_edge (calculate_pixos_clock);
wait until rising_edge (calculate_pixos_clock);
wait until rising_edge (calculate_pixos_clock);
--report "end at 2618.475us";
--report "end at 2352.945us";
--report "end at 2507.115us - rewrite submodules";
--report "end at 2629.995us - rewrite submodules, rm fptmp1";
--report "end at 2883.105us - rewrite submodules, rm fptmp1, rm vddDiff reg";
report "end at 3113.505us - rewrite submodules, rm fptmp1, rm vddDiff reg, rm taDiff reg";
wait for 1 ps; -- must be for write
report "done" severity failure;
END PROCESS p_tb;

calculate_pixos_fixed2floatclk <= i_clock;
calculate_pixos_addfpclk <= i_clock;
calculate_pixos_subfpclk <= i_clock;
calculate_pixos_mulfpclk <= i_clock;
calculate_pixos_divfpclk <= i_clock;

fixed2float_i0 : fixed2float
PORT MAP (
a => calculate_pixos_fixed2floata,
operation_nd => calculate_pixos_fixed2floatond,
clk => calculate_pixos_fixed2floatclk,
sclr => calculate_pixos_fixed2floatsclr,
ce => calculate_pixos_fixed2floatce,
result => calculate_pixos_fixed2floatr,
rdy => calculate_pixos_fixed2floatrdy
);

divfp_i0 : divfp
PORT MAP (
a => calculate_pixos_divfpa,
b => calculate_pixos_divfpb,
operation_nd => calculate_pixos_divfpond,
clk => calculate_pixos_divfpclk,
sclr => calculate_pixos_divfpsclr,
ce => calculate_pixos_divfpce,
result => calculate_pixos_divfpr,
rdy => calculate_pixos_divfprdy
);

mulfp_i0 : mulfp
PORT MAP (
a => calculate_pixos_mulfpa,
b => calculate_pixos_mulfpb,
operation_nd => calculate_pixos_mulfpond,
clk => calculate_pixos_mulfpclk,
sclr => calculate_pixos_mulfpsclr,
ce => calculate_pixos_mulfpce,
result => calculate_pixos_mulfpr,
rdy => calculate_pixos_mulfprdy
);

addfp_i0 : addfp
PORT MAP (
a => calculate_pixos_addfpa,
b => calculate_pixos_addfpb,
operation_nd => calculate_pixos_addfpond,
clk => calculate_pixos_addfpclk,
sclr => calculate_pixos_addfpsclr,
ce => calculate_pixos_addfpce,
result => calculate_pixos_addfpr,
rdy => calculate_pixos_addfprdy
);

subfp_i0 : subfp
PORT MAP (
a => calculate_pixos_subfpa,
b => calculate_pixos_subfpb,
operation_nd => calculate_pixos_subfpond,
clk => calculate_pixos_subfpclk,
sclr => calculate_pixos_subfpsclr,
ce => calculate_pixos_subfpce,
result => calculate_pixos_subfpr,
rdy => calculate_pixos_subfprdy
);

rom_constants_i0 : rom_constants PORT MAP (
i_clock => calculate_pixos_clock,
i_reset => calculate_pixos_reset,
i_kvptat_en => '0',
i_kvptat_adr => (others => '0'),
i_alphaptat_en => '0',
i_alphaptat_adr => (others => '0'),
i_signed4bit_en => calculate_pixos_signed4bit_ena,
i_signed4bit_adr => calculate_pixos_signed4bit_adr,
i_signed6bit_en => calculate_pixos_signed6bit_ena,
i_signed6bit_adr => calculate_pixos_signed6bit_adr,
i_alphascale_1_en => '0',
i_alphascale_1_adr => (others => '0'),
i_2powx_4bit_en => calculate_pixos_2powx_4bit_ena,
i_2powx_4bit_adr => calculate_pixos_2powx_4bit_adr,
i_cpratio_en => '0',
i_cpratio_adr => (others => '0'),
i_alphascale_2_en => '0',
i_alphascale_2_adr => (others => '0'),
i_2powx_p8_4bit_en => calculate_pixos_2powx_p8_4bit_ena,
i_2powx_p8_4bit_adr => calculate_pixos_2powx_p8_4bit_adr,
i_signed3bit_en => calculate_pixos_signed3bit_ena,
i_signed3bit_adr => calculate_pixos_signed3bit_adr,
o_float => calculate_pixos_rom_constants_float
);

end architecture tb;

