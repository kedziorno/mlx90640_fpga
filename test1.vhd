----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:07 01/12/2023 
-- Design Name: 
-- Module Name:    test1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.p_fphdl_package3.all;
use work.colormap_pkg.all;
use work.global_package.all;

entity test1 is
generic (
constant c_clock_board_frequency : integer := c_clock_board_frequency;
constant c_bus_clock : integer := c_clock_i2c_frequency;
c_sim : string (1 downto 1) := "n";
constant c_cold_start : integer := 1024;
constant c_melexis_mlx90640_i2c_enable_wait : integer := 1024;
constant c_melexis_mlx90640_i2c_wait : integer := 65536;
constant c_w_64us : integer := 65536; -- 64 us
constant c_w_180us : integer := 65536; -- 180 us
constant c_w_160us : integer := 65536; -- 160 us
constant c_w_160ms : integer := 65536; -- 160 ms
constant c_w_180ms : integer := 65536; -- 180 ms
constant c_w_200ms : integer := 65536; -- 200 ms
constant c_w_21ms : integer := 65536; -- 21 ms
constant c_some_wait : integer := 2**20;
zero : integer := 0
);
port (
i_clock,i_reset : in std_logic;
vga_hsync : out std_logic;
vga_vsync : out std_logic;
vga_clock : out std_logic;
vga_r : out std_logic_vector (7 downto 0);
vga_g : out std_logic_vector (7 downto 0);
vga_b : out std_logic_vector (7 downto 0);
vga_syncn : out std_logic;
vga_blankn: out std_logic;
vga_psave: out std_logic;
io_sda_dd : inout std_logic;
io_scl_dd : inout std_logic;
io_sda_dd1 : inout std_logic;
io_scl_dd1 : inout std_logic;
io_sda_nl : inout std_logic;
io_scl_nl : inout std_logic;
o_led : out std_logic_vector (7 downto 0);
o_data : out std_logic_vector (15 downto 0);
o_ready : out std_logic
);
end test1;

architecture Behavioral of test1 is

constant PIXELS : integer := 768;
constant ADDRESS1 : integer := 10;
constant BITS : integer := 24;

component test_fixed_melexis is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_busy : out std_logic;
o_rdy : out std_logic;
i_addr : in std_logic_vector(9 downto 0);
o_do : out std_logic_vector(31 downto 0);

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
end component test_fixed_melexis;
signal test_fixed_melexis_clock : std_logic;
signal test_fixed_melexis_reset : std_logic;
signal test_fixed_melexis_run : std_logic;
signal test_fixed_melexis_i2c_mem_ena : STD_LOGIC;
signal test_fixed_melexis_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal test_fixed_melexis_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal test_fixed_melexis_busy : std_logic;
signal test_fixed_melexis_rdy : std_logic;
signal test_fixed_melexis_addr : std_logic_vector(9 downto 0);
signal test_fixed_melexis_do : std_logic_vector(31 downto 0);

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

--COMPONENT tb_data_calculateTo
--PORT (
--clka : IN STD_LOGIC;
--ena : IN STD_LOGIC;
--addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
--douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
--);
--END COMPONENT;
--signal tb_data_calculateTo_clka : STD_LOGIC;
--signal tb_data_calculateTo_ena : STD_LOGIC;
--signal tb_data_calculateTo_addra : STD_LOGIC_VECTOR(9 DOWNTO 0);
--signal tb_data_calculateTo_douta : STD_LOGIC_VECTOR(31 DOWNTO 0);

component address_generator is
Generic (
PIXELS : integer := PIXELS;
ADDRESS1 : integer := ADDRESS1
);
Port ( 
reset : in std_logic;
clk : in STD_LOGIC;
clk25 : in STD_LOGIC;
enable : in STD_LOGIC;
vsync : in STD_LOGIC;
activeh : in STD_LOGIC;
address : out STD_LOGIC_VECTOR (ADDRESS1-1 downto 0)
);  
end component address_generator;
signal address_generator_reset : std_logic;
signal address_generator_clk : STD_LOGIC;
signal address_generator_clk25 : STD_LOGIC;
signal address_generator_enable : STD_LOGIC;
signal address_generator_vsync : STD_LOGIC;
signal address_generator_activeh : STD_LOGIC;
signal address_generator_address : STD_LOGIC_VECTOR (ADDRESS1-1 downto 0);

component VGA_timing_synch is
Port (
reset : in std_logic;
vgaclk25 : in  STD_LOGIC;
Hsync : out  STD_LOGIC;
Vsync : out  STD_LOGIC;
activeArea1 : out  STD_LOGIC;
activehaaddrgen : out STD_LOGIC;
activeRender1 : out  STD_LOGIC;
blank : out STD_LOGIC
);
end component VGA_timing_synch;
signal VGA_timing_synch_reset : std_logic;
signal VGA_timing_synch_vgaclk25 : STD_LOGIC;
signal VGA_timing_synch_Hsync : STD_LOGIC;
signal VGA_timing_synch_Vsync : STD_LOGIC;
signal VGA_timing_synch_activeArea1 : STD_LOGIC;
signal VGA_timing_synch_activehaaddrgen : STD_LOGIC;
signal VGA_timing_synch_activeRender1 : STD_LOGIC;
signal VGA_timing_synch_blank : STD_LOGIC;

--component vga_imagegenerator is
--generic (BITS : integer := BITS);
--Port (
--reset : in std_logic;
--vgaclk25 : std_logic;
--Data_in1 : in STD_LOGIC_VECTOR (BITS-1 downto 0);
--active_area1 : in  STD_LOGIC;
--RGB_out : out  STD_LOGIC_VECTOR (BITS-1 downto 0)
--);
--end component vga_imagegenerator;
--signal vga_imagegenerator_reset : std_logic;
--signal vga_imagegenerator_vgaclk25 : std_logic;
--signal vga_imagegenerator_Data_in1 : STD_LOGIC_VECTOR (BITS-1 downto 0);
--signal vga_imagegenerator_active_area1 : STD_LOGIC;
--signal vga_imagegenerator_RGB_out : STD_LOGIC_VECTOR (BITS-1 downto 0);

signal vgaclk25,vgaclk25_1,vgaclk25_2,agclk : std_logic;

COMPONENT float2fixed
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal float2fixeda : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal float2fixedond : STD_LOGIC;
signal float2fixedclk : STD_LOGIC;
signal float2fixedsclr : STD_LOGIC;
signal float2fixedce : STD_LOGIC;
signal float2fixedr : STD_LOGIC_VECTOR(8 DOWNTO 0);
signal float2fixedrdy : STD_LOGIC;

COMPONENT dualmem
PORT (
clka : IN STD_LOGIC;
ena : IN STD_LOGIC;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
clkb : IN STD_LOGIC;
enb : IN STD_LOGIC;
addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
doutb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
);
END COMPONENT;
signal dualmem_clka : STD_LOGIC;
signal dualmem_ena : STD_LOGIC;
signal dualmem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal dualmem_addra : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal dualmem_dina : STD_LOGIC_VECTOR(8 DOWNTO 0);
signal dualmem_clkb : STD_LOGIC;
signal dualmem_enb : STD_LOGIC;
signal dualmem_addrb : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal dualmem_doutb : STD_LOGIC_VECTOR(8 DOWNTO 0);

--attribute RlOC : string;

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

--attribute RLOC of fixed2float : component is "SLICE_X40Y174:SLICE_X79Y191";

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

--attribute RLOC of divfp : component is "SLICE_X40Y112:SLICE_X79Y143";

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

--attribute RLOC of mulfp : component is "SLICE_X40Y80:SLICE_X79Y111";

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

--attribute RLOC of addfp : component is "SLICE_X40Y144:SLICE_X79Y175";

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

--attribute RLOC of subfp : component is "SLICE_X40Y48:SLICE_X79Y79";

--COMPONENT sqrtfp2
--PORT (
--a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--operation_nd : IN STD_LOGIC;
--clk : IN STD_LOGIC;
--sclr : IN STD_LOGIC;
--ce : IN STD_LOGIC;
--result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
--rdy : OUT STD_LOGIC
--);
--END COMPONENT;
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

signal rdata : std_logic_vector(23 downto 0);

component melexis_mlx90640_i2c is
generic (
  c_board_clock : integer := c_clock_board_frequency;
  c_bus_clock : integer := c_bus_clock
);
port (
  i_clock : in std_logic;
  i_reset : in std_logic;
  i_slave_address : in std_logic_vector (6 downto 0);
  i_mode0 : in std_logic; -- W(A)/4b(A)
  i_mode1 : in std_logic; -- W(A)/2b(A),ST,R(A)/2b(NA)
  i_mode2 : in std_logic; -- W(A)/2b(A),ST,R(A)/2*N(NA)
  o_mode2_ready : out std_logic;
  o_mode2_ready_all : out std_logic;
  i_memory_address : in std_logic_vector (15 downto 0);
  i_memory_data : in std_logic_vector (15 downto 0);
  o_bytes_to_recv : out std_logic_vector (15 downto 0);
  i_enable : in std_logic;
  o_busy : out std_logic;
  io_sda_o : out std_logic;
  io_sda_i : in std_logic;
  io_scl_o : out std_logic;
  io_scl_i : in std_logic
);
end component melexis_mlx90640_i2c;
signal melexis_mlx90640_i2c_clock : std_logic;
signal melexis_mlx90640_i2c_reset : std_logic;
signal melexis_mlx90640_i2c_slave_address : std_logic_vector (6 downto 0);
signal melexis_mlx90640_i2c_mode0 : std_logic; -- W(A)/4b(A)
signal melexis_mlx90640_i2c_mode1 : std_logic; -- W(A)/2b(A),ST,R(A)/2b(NA)
signal melexis_mlx90640_i2c_mode2 : std_logic; -- W(A)/2b(A),ST,R(A)/2*N(NA)
signal melexis_mlx90640_i2c_mode2_ready : std_logic;
signal melexis_mlx90640_i2c_mode2_ready_all : std_logic;
signal melexis_mlx90640_i2c_memory_address : std_logic_vector (15 downto 0);
signal melexis_mlx90640_i2c_memory_data : std_logic_vector (15 downto 0);
signal melexis_mlx90640_i2c_bytes_to_recv : std_logic_vector (15 downto 0);
signal melexis_mlx90640_i2c_enable : std_logic;
signal melexis_mlx90640_i2c_busy : std_logic;
signal melexis_mlx90640_i2c_sda_o : std_logic;
signal melexis_mlx90640_i2c_sda_i : std_logic;
signal melexis_mlx90640_i2c_scl : std_logic;
signal latch_data : std_logic_vector (15 downto 0);

signal asd,asd1,clock_i : std_logic;

signal sda_o, sda_i, scl_o, scl_i : std_logic;
signal io_sda_i, io_scl_i : std_logic;

component i2c_mlx
PORT (
clka : IN STD_LOGIC;
ena : in std_logic;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
clkb : IN STD_LOGIC;
enb : in std_logic;
addrb : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END component  i2c_mlx;
signal i2c_mlx_clka : STD_LOGIC;
signal i2c_mlx_ena : STD_LOGIC;
signal i2c_mlx_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal i2c_mlx_addra : STD_LOGIC_VECTOR(10 DOWNTO 0);
signal i2c_mlx_dina : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal i2c_mlx_clkb : STD_LOGIC;
signal i2c_mlx_enb : STD_LOGIC;
signal i2c_mlx_addrb : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mlx_addrb_conv1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mlx_addrb_1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mlx_addrb_2 : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mlx_doutb : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal i2c_mem_ena : std_logic;
signal i2c_mem_ena_1 : std_logic;
signal i2c_mem_ena_2 : std_logic;

signal temp1, temp2 : std_logic;

--synthesis translate_off
signal dualmem_dina_f : real;
signal float2fixeda_r : real;
--synthesis translate_on

constant c_max : integer := 832;
signal mem_addr : integer range 0 to c_max - 1;

--signal state : states;

constant c_j : integer := 3328;
signal j : integer range 0 to c_j-1;

type states is (
idle,

wr_800d_1901,
wr_800d_1901_idle,
w_800d1981_1,
wait_64us_1,
wr_800d_1981_1,
wr_800d_1981_1_idle,
wait_64us_2,
wr_800d_1981_2,
wr_800d_1981_2_idle,
w_800d1981_2,
wait_64us_3,
wr_800d_1981_3,
wr_800d_1981_3_idle,
wait_64us_4,
r_2400,

wait_200ms_1,

wr_8000_0008_1,
wr_8000_0008_1_idle,
w_80000030_1,
wait_64us_5,
wr_8000_0010_1,
wr_8000_0010_1_idle,
wait_64us_6,
r_0400_1,
--s0_1,s1_1,s2_1,s3_1,s4_1,s5_1,s6_1,s7_1,s8_1,s9_1,s10_1,
wait_180us_1,
wr_8000_0010_2,
wr_8000_0010_2_idle,
wait_64us_7,
wr_800d_1981_4,
wr_800d_1981_4_idle,

wait_160ms_1,

wr_8000_0010_3, -- ... 64 us
wr_8000_0010_3_idle,
wait_64us_8_1,
wait_64us_8_2,
wr_8000_0009_1,
wr_8000_0009_1_idle,
w_80000030_2,
wait_64us_9,
wr_8000_0011_1,
wr_8000_0011_1_idle,
wait_64us_10,
r_0400_2,
s0_2,s1_2,s2_2,s3_2,s4_2,s5_2,s6_2,s7_2,s8_2,s9_2,s10_2,
wait_180us_2,
wr_8000_0011_2,
wr_8000_0011_2_idle,
wait_64us_11,
wr_800d_1981_5,
wr_800d_1981_5_idle,

wait_160ms_2,

wr_8000_0011_3, -- ... 64 us
wr_8000_0011_3_idle,
wait_64us_12_1,
wait_64us_12_2,
wr_8000_0008_2,
wr_8000_0008_2_idle,
w_80000030_3,
wait_64us_13,
wr_8000_0010_4,
wr_8000_0010_4_idle,
wait_64us_14,
r_0400_3,
s0_3,s1_3,s2_3,s3_3,s4_3,s5_3,s6_3,s7_3,s8_3,s9_3,s10_3,
wait_180us_3,
wr_8000_0010_5,
wr_8000_0010_5_idle,
wait_64us_15,
wr_800d_1981_6,
wr_800d_1981_6_idle,

wait_180ms_1,

------------ frame 0
wr_8000_0010_6,
wr_8000_0010_6_idle,
wait_21ms_1,
wr_8000_0010_7,
wr_8000_0010_7_idle,
wait_21ms_2,
wr_8000_0010_8,
wr_8000_0010_8_idle,
wait_21ms_3,
wr_8000_0009_2,
wr_8000_0009_2_idle,
wait_64us_16,
wr_8000_0009_3,
wr_8000_0009_3_idle,
w_80000030_4,
wait_64us_17,
wr_8000_0011_4,
wr_8000_0011_4_idle,
wait_64us_18,
r_0400_4,
s0_4,s1_4,s2_4,s3_4,s4_4,s5_4,s6_4,s7_4,s8_4,s9_4,s10_4,
wait_180us_4,
wr_8000_0011_5,
wr_8000_0011_5_idle,
wait_64us_19,
wr_800d_1981_7,
wr_800d_1981_7_idle,

wait_180ms_2,

------------ frame1
wr_8000_0011_6,
wr_8000_0011_6_idle,
wait_21ms_4,
wr_8000_0011_7,
wr_8000_0011_7_idle,
wait_21ms_5,
wr_8000_0011_8,
wr_8000_0011_8_idle,
wait_21ms_6,
wr_8000_0008_3,
wr_8000_0008_3_idle,
wait_64us_20,
wr_8000_0008_4,
wr_8000_0008_4_idle,
w_80000030_5,
wait_64us_21,
wr_8000_0010_9,
wr_8000_0010_9_idle,
wait_64us_22,
r_0400_5,
s0_5,s1_5,s2_5,s3_5,s4_5,s5_5,s6_5,s7_5,s8_5,s9_5,s10_5,
wait_180us_5,
wr_8000_0010_10,
wr_8000_0010_10_idle,
wait_64us_23,
wr_800d_1981_8,
wr_800d_1981_8_idle,

wait_180ms_3
);
signal state : states;

--constant c_melexis_mlx90640_i2c_enable_wait : integer := 58;
--constant c_melexis_mlx90640_i2c_enable_wait : integer := 25*1_000_000/10000;
--constant c_melexis_mlx90640_i2c_enable_wait : integer := 25;
--constant c_melexis_mlx90640_i2c_enable_wait : integer := 60;
--constant c_melexis_mlx90640_i2c_enable_wait : integer := 47;
--constant c_melexis_mlx90640_i2c_enable_wait : integer := 115*4; -- scl 500k
--constant c_melexis_mlx90640_i2c_enable_wait : integer := c_melexis_mlx90640_i2c_enable_wait1; -- scl 100k
--constant c_melexis_mlx90640_i2c_enable_wait : integer := 115*4*1000; -- scl 100
--constant c_melexis_mlx90640_i2c_enable_wait : integer := 230*4*1000; -- scl 50
--constant c_melexis_mlx90640_i2c_enable_wait : integer := 230*5*4*1000; -- scl 10
--constant c_melexis_mlx90640_i2c_enable_wait : integer := 230*5*5*4*1000; -- scl 2
signal melexis_mlx90640_i2c_enable_wait : integer range 0 to c_melexis_mlx90640_i2c_enable_wait - 1;
signal melexis_mlx90640_i2c_wait : integer range 0 to c_melexis_mlx90640_i2c_wait - 1;
signal w_64us : integer range 0 to c_w_64us - 1;
signal w_180us : integer range 0 to c_w_180us - 1;
signal w_200ms : integer range 0 to c_w_200ms - 1;
signal w_160us : integer range 0 to c_w_160us - 1;
signal w_160ms : integer range 0 to c_w_160ms - 1;
signal w_180ms : integer range 0 to c_w_180ms - 1;
signal w_21ms : integer range 0 to c_w_21ms - 1;
constant c_w11ms : integer := (c_clock_board_frequency / 2);
signal w11ms : integer range 0 to c_w11ms - 1;
signal some_wait : integer range 0 to c_some_wait - 1;
signal cold_start : integer range 0 to c_cold_start - 1;

begin

o_data <= latch_data;
o_ready <= melexis_mlx90640_i2c_mode2_ready;

--p100 : process (melexis_mlx90640_i2c_mode2_ready, i_reset) is
p100 : process (clock_i, i_reset) is
begin
  if (i_reset = '1') then
    mem_addr <= 0;
    i2c_mlx_wea <= "0";
    i2c_mlx_ena <= '0';
    i2c_mlx_addra <= (others => '0');
    temp1 <= '0';
--  elsif (rising_edge (melexis_mlx90640_i2c_mode2_ready)) then
  elsif (rising_edge (clock_i)) then
    temp1 <= melexis_mlx90640_i2c_mode2_ready;
    if (melexis_mlx90640_i2c_enable = '1') then
      if (temp1 = '0' and melexis_mlx90640_i2c_mode2_ready = '1' and melexis_mlx90640_i2c_mode2 = '1') then
        i2c_mlx_wea <= "1";
        i2c_mlx_ena <= '1';
        if (melexis_mlx90640_i2c_memory_address = x"2400") then
          i2c_mlx_addra <= std_logic_vector (to_unsigned (mem_addr + 0, 11));
        end if;
        if (melexis_mlx90640_i2c_memory_address = x"0400") then
          i2c_mlx_addra <= std_logic_vector (to_unsigned (mem_addr + 832, 11));
        end if;
      elsif (temp1 = '1' and melexis_mlx90640_i2c_mode2_ready = '1' and melexis_mlx90640_i2c_mode2 = '1') then
        i2c_mlx_wea <= "0";
        i2c_mlx_ena <= '0';
      elsif (temp1 = '1' and melexis_mlx90640_i2c_mode2_ready = '0' and melexis_mlx90640_i2c_mode2 = '1') then
        if (mem_addr = c_max - 1) then
          mem_addr <= 0;
        else
          mem_addr <= mem_addr + 1;
        end if;
      end if;
    end if;
  end if;
end process p100;

dina_swap : if (c_sim = "n") generate
  --i2c_mlx_dina (15 downto 8) <= latch_data (7 downto 0);
  --i2c_mlx_dina (7 downto 0) <= latch_data (15 downto 8);
  i2c_mlx_dina (15 downto 8) <= melexis_mlx90640_i2c_bytes_to_recv (7 downto 0);
  i2c_mlx_dina (7 downto 0) <= melexis_mlx90640_i2c_bytes_to_recv (15 downto 8);
end generate dina_swap;

dina_no_swap : if (c_sim = "y") generate
  --i2c_mlx_dina (7 downto 0) <= latch_data (7 downto 0);
  --i2c_mlx_dina (15 downto 8) <= latch_data (15 downto 8);
--  i2c_mlx_dina (7 downto 0) <= melexis_mlx90640_i2c_bytes_to_recv (7 downto 0);
--  i2c_mlx_dina (15 downto 8) <= melexis_mlx90640_i2c_bytes_to_recv (15 downto 8);
  i2c_mlx_dina (15 downto 8) <= melexis_mlx90640_i2c_bytes_to_recv (7 downto 0);
  i2c_mlx_dina (7 downto 0) <= melexis_mlx90640_i2c_bytes_to_recv (15 downto 8);
end generate dina_no_swap;

--o_led (7 downto 0) <= test_fixed_melexis_do(31-9-9 downto 31-16-9);

vga_syncn <= '1';
vga_blankn <= VGA_timing_synch_blank;
--vga_blankn <= '1';
vga_psave <= '1';

pTo : process (i_clock) is
	variable i : integer range 0 to PIXELS-1;
	variable tout : std_logic_vector (8 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state <= idle;
			float2fixedsclr <= '1';
			i := 0;
			dualmem_ena <= '0';
			dualmem_enb <= '0';
			tout := (others => '0');
      melexis_mlx90640_i2c_mode0 <= '0';
      melexis_mlx90640_i2c_mode1 <= '0';
      melexis_mlx90640_i2c_mode2 <= '0';
      melexis_mlx90640_i2c_enable <= '0';
      melexis_mlx90640_i2c_memory_address <= x"0000";
      melexis_mlx90640_i2c_memory_data <= x"0000";
      melexis_mlx90640_i2c_enable_wait <= 0;
      melexis_mlx90640_i2c_wait <= 0;
      w_64us <= 0;
      w_180us <= 0;
      w_200ms <= 0;
      w_160us <= 0;
      w_160ms <= 0;
      w_180ms <= 0;
      w_21ms <= 0;
      w11ms <= 0;
      some_wait <= 0;
      cold_start <= 0;
		else
			case (state) is
				when idle =>
          float2fixedsclr <= '0';
          test_fixed_melexis_run <= '0';
          melexis_mlx90640_i2c_enable_wait <= 0;
          melexis_mlx90640_i2c_wait <= 0;
          w_64us <= 0;
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '0';
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '0';
          if (cold_start = c_cold_start - 1) then
            --state <= wr_800d_1901;
            state <= w_800d1981_1;
            cold_start <= 0;
          else
            cold_start <= cold_start + 1;
          end if;
        when wr_800d_1901 => -- no condition
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"800d";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_800d_1901_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
        when wr_800d_1901_idle => -- condition
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"1981" or melexis_mlx90640_i2c_bytes_to_recv = x"1901") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= w_800d1981_1;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_800d_1901;
          end if;
        when w_800d1981_1 => -- no condition
          melexis_mlx90640_i2c_mode0 <= '1'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"800d"; melexis_mlx90640_i2c_memory_data <= x"1981";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              melexis_mlx90640_i2c_enable_wait <= 0;
              state <= wait_64us_1;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
        when wait_64us_1 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_800d_1981_1;
          else
            w_64us <= w_64us + 1;
          end if;
        when wr_800d_1981_1 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"800d";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_800d_1981_1_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
        when wr_800d_1981_1_idle => -- condition
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"1981") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_2;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_800d_1981_1;
          end if;
        when wait_64us_2 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_800d_1981_2;
          else
            w_64us <= w_64us + 1;
          end if;
        when wr_800d_1981_2 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"800d";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_800d_1981_2_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
        when wr_800d_1981_2_idle => -- condition
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"1981") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= w_800d1981_2;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_800d_1981_2;
          end if;
        when w_800d1981_2 => -- no condition
          melexis_mlx90640_i2c_mode0 <= '1'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"800d"; melexis_mlx90640_i2c_memory_data <= x"1981";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              melexis_mlx90640_i2c_enable_wait <= 0;
              state <= wait_64us_3;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
        when wait_64us_3 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_800d_1981_3;
          else
            w_64us <= w_64us + 1;
          end if;
        when wr_800d_1981_3 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"800d";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_800d_1981_3_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
        when wr_800d_1981_3_idle => -- condition
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"1981") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_4;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_800d_1981_2;
          end if;
        when wait_64us_4 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= r_2400;
          else
            w_64us <= w_64us + 1;
          end if;
        when r_2400 => -- no condition
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '1';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"2400";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wait_200ms_1;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wait_200ms_1 =>
					if (w_200ms = c_w_200ms - 1) then
						w_200ms <= 0;
						state <= wr_8000_0008_1;
					else
						w_200ms <= w_200ms + 1;
					end if;
				when wr_8000_0008_1 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0008_1_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0008_1_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0008") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= w_80000030_1;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0008_1;
          end if;
				when w_80000030_1 =>
          melexis_mlx90640_i2c_mode0 <= '1'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000"; melexis_mlx90640_i2c_memory_data <= x"0030";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              melexis_mlx90640_i2c_enable_wait <= 0;
              state <= wait_64us_5;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wait_64us_5 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0010_1;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_8000_0010_1 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0010_1_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0010_1_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_6;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0010_1;
          end if;
				when wait_64us_6 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= r_0400_1;
          else
            w_64us <= w_64us + 1;
          end if;
        when r_0400_1 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '1';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"0400";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
--              state <= s0_1;
              state <= wait_180us_1;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;


--        when s0_1 =>
--          state <= s1_1;
--					test_fixed_melexis_run <= '1';
--          float2fixedsclr <= '0';
--          dualmem_enb <= '0';
--          w11ms <= 0;
--				when s1_1 =>
--          test_fixed_melexis_run <= '0';
--          if (c_sim = "n") then
--            if (w11ms = c_w11ms - 1) then
--              state <= s4_1;
--              w11ms <= 0;
--            else
--              state <= s1_1;
--              w11ms <= w11ms + 1;
--            end if;
--          end if;
--          if (c_sim = "y") then
--            if (test_fixed_melexis_busy = '0') then
--              state <= s4_1;
--              float2fixedsclr <= '0';
--              i := 0;
--              tout := (others => '0');
--            else
--              state <= s1_1;
--            end if;
--          end if;
--				when s4_1 => state <= s5_1;
--					test_fixed_melexis_addr <= std_logic_vector (to_unsigned (i, 10));
--				when s5_1 => state <= s6_1;
--				when s6_1 => state <= s7_1;
--					float2fixedond <= '1';
--					float2fixedce <= '1';
--					float2fixeda <= test_fixed_melexis_do;
--				when s7_1 =>
--					if (float2fixedrdy = '1') then state <= s8_1;
----						tout := "00000000000000000000000"&float2fixedr (36 downto 28) ; -- 35 29
----						tout := "00000000000000000000000"&float2fixedr (34 downto 26) ; -- 35 29
----						tout := "0000000000"&float2fixedr (35 downto 14); -- 35 29
--						tout := float2fixedr;
--						float2fixedond <= '0';
--						float2fixedce <= '0';
--						float2fixedsclr <= '1';
--					else state <= s7_1; end if;
--				when s8_1 => state <= s9_1;
--					float2fixedsclr <= '0';
--					dualmem_wea <= "1";
--					dualmem_addra <= std_logic_vector (to_unsigned (i, 10));
--					dualmem_dina <= tout;
--					dualmem_ena <= '1';
--          --synthesis translate_off
--          --report_error ("tout", tout, 0.0);
--          --synthesis translate_on
--				when s9_1 =>
--					dualmem_wea <= "0";
--					dualmem_ena <= '0';
--					if (i = PIXELS-1) then
--						i := 0;
--						state <= s10_1;
--					else
--						state <= s4_1;
--						i := i + 1;
--					end if;
--				when s10_1 =>
--          dualmem_enb <= '1';
----          if (some_wait = c_some_wait-1) then
----            some_wait <= 0;
--            state <= wr_8000_0010_2;
------            state <= wr_8000_0010_6;
----            float2fixedsclr <= '1';
----          else
----            some_wait <= some_wait + 1;
----            state <= s10;
----          end if;
--
          
				when wait_180us_1 =>
          if (w_200ms = c_w_200ms - 1) then
            w_200ms <= 0;
            state <= wr_8000_0010_2;
          else
            w_200ms <= w_200ms + 1;
          end if;
				when wr_8000_0010_2 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0010_2_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0010_2_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_7;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0010_2;
          end if;
				when wait_64us_7 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_800d_1981_4;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_800d_1981_4 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_800d_1981_4_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_800d_1981_4_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_160ms_1;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_800d_1981_4;
          end if;
				when wait_160ms_1 =>
          if (w_160ms = c_w_160ms - 1) then
            w_160ms <= 0;
            state <= wr_8000_0010_3;
          else
            w_160ms <= w_160ms + 1;
          end if;
				when wr_8000_0010_3 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0010_3_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0010_3_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            state <= wait_64us_8_1;
          else
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_8_2;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          end if;
				when wait_64us_8_1 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0010_3;
          else
            w_64us <= w_64us + 1;
          end if;
				when wait_64us_8_2 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0009_1;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_8000_0009_1 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0009_1_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0009_1_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0009") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= w_80000030_2;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0009_1;
          end if;
				when w_80000030_2 =>
          melexis_mlx90640_i2c_mode0 <= '1'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000"; melexis_mlx90640_i2c_memory_data <= x"0030";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              melexis_mlx90640_i2c_enable_wait <= 0;
              state <= wait_64us_9;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wait_64us_9 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0011_1;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_8000_0011_1 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0011_1_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0011_1_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0011") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_10;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0011_1;
          end if;
				when wait_64us_10 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= r_0400_2;
          else
            w_64us <= w_64us + 1;
          end if;
        when r_0400_2 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '1';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"0400";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= s0_2;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
          
        when s0_2 =>
          state <= s1_2;
					test_fixed_melexis_run <= '1';
          float2fixedsclr <= '0';
          dualmem_enb <= '0';
          w11ms <= 0;
				when s1_2 =>
          test_fixed_melexis_run <= '0';
          if (c_sim = "n") then
            if (w11ms = c_w11ms - 1) then
              state <= s4_2;
              w11ms <= 0;
            else
              state <= s1_2;
              w11ms <= w11ms + 1;
            end if;
          end if;
          if (c_sim = "y") then
            if (test_fixed_melexis_busy = '0') then
              state <= s4_2;
              float2fixedsclr <= '0';
              i := 0;
              tout := (others => '0');
            else
              state <= s1_2;
            end if;
          end if;
				when s4_2 => state <= s5_2;
					test_fixed_melexis_addr <= std_logic_vector (to_unsigned (i, 10));
				when s5_2 => state <= s6_2;
				when s6_2 => state <= s7_2;
					float2fixedond <= '1';
					float2fixedce <= '1';
					float2fixeda <= test_fixed_melexis_do;
				when s7_2 =>
					if (float2fixedrdy = '1') then state <= s8_2;
--						tout := "00000000000000000000000"&float2fixedr (36 downto 28) ; -- 35 29
--						tout := "00000000000000000000000"&float2fixedr (34 downto 26) ; -- 35 29
--						tout := "0000000000"&float2fixedr (35 downto 14); -- 35 29
						tout := float2fixedr;
						float2fixedond <= '0';
						float2fixedce <= '0';
						float2fixedsclr <= '1';
					else state <= s7_2; end if;
				when s8_2 => state <= s9_2;
					float2fixedsclr <= '0';
					dualmem_wea <= "1";
					dualmem_addra <= std_logic_vector (to_unsigned (i, 10));
					dualmem_dina <= tout;
					dualmem_ena <= '1';
          --synthesis translate_off
          --report_error ("tout", tout, 0.0);
          --synthesis translate_on
				when s9_2 =>
					dualmem_wea <= "0";
					dualmem_ena <= '0';
					if (i = PIXELS-1) then
						i := 0;
						state <= s10_2;
					else
						state <= s4_2;
						i := i + 1;
					end if;
				when s10_2 =>
          dualmem_enb <= '1';
--          if (some_wait = c_some_wait-1) then
--            some_wait <= 0;
            state <= wr_8000_0011_2;
----            state <= wr_8000_0010_6;
--            float2fixedsclr <= '1';
--          else
--            some_wait <= some_wait + 1;
--            state <= s10;
--          end if;


--				when wait_180us_2 =>
--          if (w_180us = c_w_180us - 1) then
--            w_180us <= 0;
--            state <= wr_8000_0011_2;
--          else
--            w_180us <= w_180us + 1;
--          end if;
				when wr_8000_0011_2 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0011_2_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0011_2_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0011") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_11;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0011_2;
          end if;
				when wait_64us_11 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_800d_1981_5;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_800d_1981_5 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"800d";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_800d_1981_5_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_800d_1981_5_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"1981") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_160ms_2;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_800d_1981_5;
          end if;
				when wait_160ms_2 =>
          if (w_160ms = c_w_160ms - 1) then
            w_160ms <= 0;
            state <= wr_8000_0011_3;
          else
            w_160ms <= w_160ms + 1;
          end if;
				when wr_8000_0011_3 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0011_3_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0011_3_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0011") then
            state <= wait_64us_12_1;
          else
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_12_2;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          end if;
				when wait_64us_12_1 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0011_3;
          else
            w_64us <= w_64us + 1;
          end if;
				when wait_64us_12_2 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0008_2;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_8000_0008_2 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0008_2_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0008_2_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0008") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= w_80000030_3;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0008_2;
          end if;
				when w_80000030_3 =>
          melexis_mlx90640_i2c_mode0 <= '1'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000"; melexis_mlx90640_i2c_memory_data <= x"0030";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              melexis_mlx90640_i2c_enable_wait <= 0;
              state <= wait_64us_13;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wait_64us_13 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0010_4;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_8000_0010_4 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0010_4_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0010_4_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_14;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0010_4;
          end if;
				when wait_64us_14 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= r_0400_3;
          else
            w_64us <= w_64us + 1;
          end if;
        when r_0400_3 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '1';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"0400";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= s0_3;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;

        when s0_3 =>
          state <= s1_3;
					test_fixed_melexis_run <= '1';
          float2fixedsclr <= '0';
          dualmem_enb <= '0';
          w11ms <= 0;
				when s1_3 =>
          test_fixed_melexis_run <= '0';
          if (c_sim = "n") then
            if (w11ms = c_w11ms - 1) then
              state <= s4_3;
              w11ms <= 0;
            else
              state <= s1_3;
              w11ms <= w11ms + 1;
            end if;
          end if;
          if (c_sim = "y") then
            if (test_fixed_melexis_busy = '0') then
              state <= s4_3;
              float2fixedsclr <= '0';
              i := 0;
              tout := (others => '0');
            else
              state <= s1_3;
            end if;
          end if;
				when s4_3 => state <= s5_3;
					test_fixed_melexis_addr <= std_logic_vector (to_unsigned (i, 10));
				when s5_3 => state <= s6_3;
				when s6_3 => state <= s7_3;
					float2fixedond <= '1';
					float2fixedce <= '1';
					float2fixeda <= test_fixed_melexis_do;
				when s7_3 =>
					if (float2fixedrdy = '1') then state <= s8_3;
--						tout := "00000000000000000000000"&float2fixedr (36 downto 28) ; -- 35 29
--						tout := "00000000000000000000000"&float2fixedr (34 downto 26) ; -- 35 29
--						tout := "0000000000"&float2fixedr (35 downto 14); -- 35 29
						tout := float2fixedr;
						float2fixedond <= '0';
						float2fixedce <= '0';
						float2fixedsclr <= '1';
					else state <= s7_3; end if;
				when s8_3 => state <= s9_3;
					float2fixedsclr <= '0';
					dualmem_wea <= "1";
					dualmem_addra <= std_logic_vector (to_unsigned (i, 10));
					dualmem_dina <= tout;
					dualmem_ena <= '1';
          --synthesis translate_off
          --report_error ("tout", tout, 0.0);
          --synthesis translate_on
				when s9_3 =>
					dualmem_wea <= "0";
					dualmem_ena <= '0';
					if (i = PIXELS-1) then
						i := 0;
						state <= s10_3;
					else
						state <= s4_3;
						i := i + 1;
					end if;
				when s10_3 =>
          dualmem_enb <= '1';
--          if (some_wait = c_some_wait-1) then
--            some_wait <= 0;
            state <= wr_8000_0010_5;
----            state <= wr_8000_0010_6;
--            float2fixedsclr <= '1';
--          else
--            some_wait <= some_wait + 1;
--            state <= s10;
--          end if;

--				when wait_180us_3 =>
--          if (w_180us = c_w_180us - 1) then
--            w_180us <= 0;
--            state <= wr_8000_0010_5;
--          else
--            w_180us <= w_180us + 1;
--          end if;
				when wr_8000_0010_5 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0010_5_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0010_5_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_15;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0010_5;
          end if;
				when wait_64us_15 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_800d_1981_6;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_800d_1981_6 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"800d";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_800d_1981_6_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_800d_1981_6_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"1981") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_180ms_1;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_800d_1981_6;
          end if;
				when wait_180ms_1 =>
          if (w_180ms = c_w_180ms - 1) then
            w_180ms <= 0;
            state <= wr_8000_0010_6;
          else
            w_180ms <= w_180ms + 1;
          end if;
				when wr_8000_0010_6 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0010_6_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0010_6_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_21ms_1;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0010_6;
          end if;
				when wait_21ms_1 =>
          if (w_21ms = c_w_21ms - 1) then
            w_21ms <= 0;
            state <= wr_8000_0010_7;
          else
            w_21ms <= w_21ms + 1;
          end if;
				when wr_8000_0010_7 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0010_7_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0010_7_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_21ms_2;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0010_7;
          end if;
				when wait_21ms_2 =>
          if (w_21ms = c_w_21ms - 1) then
            w_21ms <= 0;
            state <= wr_8000_0010_8;
          else
            w_21ms <= w_21ms + 1;
          end if;
				when wr_8000_0010_8 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0010_8_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0010_8_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_21ms_3;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0010_8;
          end if;
				when wait_21ms_3 =>
          if (w_21ms = c_w_21ms - 1) then
            w_21ms <= 0;
            state <= wr_8000_0009_2;
          else
            w_21ms <= w_21ms + 1;
          end if;
				when wr_8000_0009_2 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0009_2_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0009_2_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0009") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_16;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0009_2;
          end if;
				when wait_64us_16 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0009_3;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_8000_0009_3 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0009_3_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0009_3_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0009") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= w_80000030_4;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0009_3;
          end if;
				when w_80000030_4 =>
          melexis_mlx90640_i2c_mode0 <= '1'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000"; melexis_mlx90640_i2c_memory_data <= x"0030";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              melexis_mlx90640_i2c_enable_wait <= 0;
              state <= wait_64us_17;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wait_64us_17 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0011_4;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_8000_0011_4 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0011_4_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0011_4_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0011") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_18;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0011_4;
          end if;
				when wait_64us_18 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= r_0400_4;
          else
            w_64us <= w_64us + 1;
          end if;
				when r_0400_4 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '1';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"0400";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= s0_4;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;


        when s0_4 =>
          state <= s1_4;
					test_fixed_melexis_run <= '1';
          float2fixedsclr <= '0';
          dualmem_enb <= '0';
          w11ms <= 0;
				when s1_4 =>
          test_fixed_melexis_run <= '0';
          if (c_sim = "n") then
            if (w11ms = c_w11ms - 1) then
              state <= s4_4;
              w11ms <= 0;
            else
              state <= s1_4;
              w11ms <= w11ms + 1;
            end if;
          end if;
          if (c_sim = "y") then
            if (test_fixed_melexis_busy = '0') then
              state <= s4_4;
              float2fixedsclr <= '0';
              i := 0;
              tout := (others => '0');
            else
              state <= s1_4;
            end if;
          end if;
				when s4_4 => state <= s5_4;
					test_fixed_melexis_addr <= std_logic_vector (to_unsigned (i, 10));
				when s5_4 => state <= s6_4;
				when s6_4 => state <= s7_4;
					float2fixedond <= '1';
					float2fixedce <= '1';
					float2fixeda <= test_fixed_melexis_do;
				when s7_4 =>
					if (float2fixedrdy = '1') then state <= s8_4;
--						tout := "00000000000000000000000"&float2fixedr (36 downto 28) ; -- 35 29
--						tout := "00000000000000000000000"&float2fixedr (34 downto 26) ; -- 35 29
--						tout := "0000000000"&float2fixedr (35 downto 14); -- 35 29
						tout := float2fixedr;
						float2fixedond <= '0';
						float2fixedce <= '0';
						float2fixedsclr <= '1';
					else state <= s7_4; end if;
				when s8_4 => state <= s9_4;
					float2fixedsclr <= '0';
					dualmem_wea <= "1";
					dualmem_addra <= std_logic_vector (to_unsigned (i, 10));
					dualmem_dina <= tout;
					dualmem_ena <= '1';
          --synthesis translate_off
          --report_error ("tout", tout, 0.0);
          --synthesis translate_on
				when s9_4 =>
					dualmem_wea <= "0";
					dualmem_ena <= '0';
					if (i = PIXELS-1) then
						i := 0;
						state <= s10_4;
					else
						state <= s4_4;
						i := i + 1;
					end if;
				when s10_4 =>
          dualmem_enb <= '1';
--          if (some_wait = c_some_wait-1) then
--            some_wait <= 0;
            state <= wr_8000_0011_5;
----            state <= wr_8000_0010_6;
--            float2fixedsclr <= '1';
--          else
--            some_wait <= some_wait + 1;
--            state <= s10;
--          end if;


--				when wait_180us_4 =>
--          if (w_180us = c_w_180us - 1) then
--            w_180us <= 0;
--            state <= wr_8000_0011_5;
--          else
--            w_180us <= w_180us + 1;
--          end if;
				when wr_8000_0011_5 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0011_5_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0011_5_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0011") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_19;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0011_5;
          end if;
				when wait_64us_19 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_800d_1981_7;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_800d_1981_7 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"800d";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_800d_1981_7_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_800d_1981_7_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"1981") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_180ms_2;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_800d_1981_7;
          end if;
				when wait_180ms_2 =>
          if (w_180ms = c_w_180ms - 1) then
            w_180ms <= 0;
            state <= wr_8000_0011_6;
          else
            w_180ms <= w_180ms + 1;
          end if;

				when wr_8000_0011_6 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0011_6_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0011_6_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0011") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_21ms_4;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0011_6;
          end if;
				when wait_21ms_4 =>
          if (w_21ms = c_w_21ms - 1) then
            w_21ms <= 0;
            state <= wr_8000_0011_7;
          else
            w_21ms <= w_21ms + 1;
          end if;
				when wr_8000_0011_7 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0011_7_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0011_7_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0011") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_21ms_5;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0011_7;
          end if;
				when wait_21ms_5 =>
          if (w_21ms = c_w_21ms - 1) then
            w_21ms <= 0;
            state <= wr_8000_0011_8;
          else
            w_21ms <= w_21ms + 1;
          end if;
				when wr_8000_0011_8 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0011_8_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0011_8_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0011") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_21ms_6;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0011_8;
          end if;
				when wait_21ms_6 =>
          if (w_21ms = c_w_21ms - 1) then
            w_21ms <= 0;
            state <= wr_8000_0008_3;
          else
            w_21ms <= w_21ms + 1;
          end if;
				when wr_8000_0008_3 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0008_3_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0008_3_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0008") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_20;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0008_3;
          end if;
				when wait_64us_20 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0008_4;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_8000_0008_4 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0008_4_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0008_4_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0008") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= w_80000030_5;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0008_4;
          end if;
				when w_80000030_5 =>
          melexis_mlx90640_i2c_mode0 <= '1'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000"; melexis_mlx90640_i2c_memory_data <= x"0030";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              melexis_mlx90640_i2c_enable_wait <= 0;
              state <= wait_64us_21;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wait_64us_21 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_8000_0010_9;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_8000_0010_9 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0010_9_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0010_9_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_22;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0010_9;
          end if;
				when wait_64us_22 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= r_0400_5;
          else
            w_64us <= w_64us + 1;
          end if;
				when r_0400_5 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '1';
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"0400";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= s0_5;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;


        when s0_5 =>
          state <= s1_5;
					test_fixed_melexis_run <= '1';
          float2fixedsclr <= '0';
          dualmem_enb <= '0';
          w11ms <= 0;
				when s1_5 =>
          test_fixed_melexis_run <= '0';
          if (c_sim = "n") then
            if (w11ms = c_w11ms - 1) then
              state <= s4_5;
              w11ms <= 0;
            else
              state <= s1_5;
              w11ms <= w11ms + 1;
            end if;
          end if;
          if (c_sim = "y") then
            if (test_fixed_melexis_busy = '0') then
              state <= s4_5;
              float2fixedsclr <= '0';
              i := 0;
              tout := (others => '0');
            else
              state <= s1_5;
            end if;
          end if;
				when s4_5 => state <= s5_5;
					test_fixed_melexis_addr <= std_logic_vector (to_unsigned (i, 10));
				when s5_5 => state <= s6_5;
				when s6_5 => state <= s7_5;
					float2fixedond <= '1';
					float2fixedce <= '1';
					float2fixeda <= test_fixed_melexis_do;
				when s7_5 =>
					if (float2fixedrdy = '1') then state <= s8_5;
--						tout := "00000000000000000000000"&float2fixedr (36 downto 28) ; -- 35 29
--						tout := "00000000000000000000000"&float2fixedr (34 downto 26) ; -- 35 29
--						tout := "0000000000"&float2fixedr (35 downto 14); -- 35 29
						tout := float2fixedr;
						float2fixedond <= '0';
						float2fixedce <= '0';
						float2fixedsclr <= '1';
					else state <= s7_5; end if;
				when s8_5 => state <= s9_5;
					float2fixedsclr <= '0';
					dualmem_wea <= "1";
					dualmem_addra <= std_logic_vector (to_unsigned (i, 10));
					dualmem_dina <= tout;
					dualmem_ena <= '1';
          --synthesis translate_off
          --report_error ("tout", tout, 0.0);
          --synthesis translate_on
				when s9_5 =>
					dualmem_wea <= "0";
					dualmem_ena <= '0';
					if (i = PIXELS-1) then
						i := 0;
						state <= s10_5;
					else
						state <= s4_5;
						i := i + 1;
					end if;
				when s10_5 =>
          dualmem_enb <= '1';
--          if (some_wait = c_some_wait-1) then
--            some_wait <= 0;
            state <= wr_8000_0010_10;
----            state <= wr_8000_0010_6;
--            float2fixedsclr <= '1';
--          else
--            some_wait <= some_wait + 1;
--            state <= s10;
--          end if;

--				when wait_180us_5 =>
--          if (w_180us = c_w_180us - 1) then
--            w_180us <= 0;
--            state <= wr_8000_0010_10;
--          else
--            w_180us <= w_180us + 1;
--          end if;
				when wr_8000_0010_10 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"8000";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_8000_0010_10_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_8000_0010_10_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"0010") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_64us_23;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_8000_0010_10;
          end if;
				when wait_64us_23 =>
          if (w_64us = c_w_64us - 1) then
            w_64us <= 0;
            state <= wr_800d_1981_8;
          else
            w_64us <= w_64us + 1;
          end if;
				when wr_800d_1981_8 =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= x"800d";
          if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state <= wr_800d_1981_8_idle;
              melexis_mlx90640_i2c_enable_wait <= 0;
            end if;
          else
            melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
          end if;
				when wr_800d_1981_8_idle =>
          melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
          melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
          if (melexis_mlx90640_i2c_bytes_to_recv = x"1981") then
            if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
              state <= wait_180ms_3;
              melexis_mlx90640_i2c_wait <= 0;
            else
              melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
            end if;
          else
            state <= wr_800d_1981_8;
          end if;
				when wait_180ms_3 =>
          melexis_mlx90640_i2c_wait <= 0;
          melexis_mlx90640_i2c_enable_wait <= 0;
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '0';
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '0';
          melexis_mlx90640_i2c_memory_address <= x"0000";
          melexis_mlx90640_i2c_memory_data <= x"0000";
          if (w_180ms = c_w_180ms - 1) then
            w_180ms <= 0;
            state <= idle;
          else
            w_180ms <= w_180ms + 1;
          end if;
          
          
          
--        when s0_1 =>
--          state <= s1_1;
--					test_fixed_melexis_run <= '1';
--          float2fixedsclr <= '0';
--          dualmem_enb <= '0';
--          w11ms <= 0;
--				when s1_1 =>
--          test_fixed_melexis_run <= '0';
--          if (c_sim = "n") then
--            if (w11ms = c_w11ms - 1) then
--              state <= s4_1;
--              w11ms <= 0;
--            else
--              state <= s1_1;
--              w11ms <= w11ms + 1;
--            end if;
--          end if;
--          if (c_sim = "y") then
--            if (test_fixed_melexis_busy = '0') then
--              state <= s4_1;
--              float2fixedsclr <= '0';
--              i := 0;
--              tout := (others => '0');
--            else
--              state <= s1_1;
--            end if;
--          end if;
--				when s4_1 => state <= s5_1;
--					test_fixed_melexis_addr <= std_logic_vector (to_unsigned (i, 10));
--				when s5_1 => state <= s6_1;
--				when s6_1 => state <= s7_1;
--					float2fixedond <= '1';
--					float2fixedce <= '1';
--					float2fixeda <= test_fixed_melexis_do;
--				when s7_1 =>
--					if (float2fixedrdy = '1') then state <= s8_1;
----						tout := "00000000000000000000000"&float2fixedr (36 downto 28) ; -- 35 29
----						tout := "00000000000000000000000"&float2fixedr (34 downto 26) ; -- 35 29
----						tout := "0000000000"&float2fixedr (35 downto 14); -- 35 29
--						tout := float2fixedr;
--						float2fixedond <= '0';
--						float2fixedce <= '0';
--						float2fixedsclr <= '1';
--					else state <= s7_1; end if;
--				when s8_1 => state <= s9_1;
--					float2fixedsclr <= '0';
--					dualmem_wea <= "1";
--					dualmem_addra <= std_logic_vector (to_unsigned (i, 10));
--					dualmem_dina <= tout;
--					dualmem_ena <= '1';
--          --synthesis translate_off
--          --report_error ("tout", tout, 0.0);
--          --synthesis translate_on
--				when s9_1 =>
--					dualmem_wea <= "0";
--					dualmem_ena <= '0';
--					if (i = PIXELS-1) then
--						i := 0;
--						state <= s10_1;
--					else
--						state <= s4_1;
--						i := i + 1;
--					end if;
--				when s10_1 =>
--          dualmem_enb <= '1';
----          if (some_wait = c_some_wait-1) then
----            some_wait <= 0;
--            state <= idle;
------            state <= wr_8000_0010_6;
----            float2fixedsclr <= '1';
----          else
----            some_wait <= some_wait + 1;
----            state <= s10;
----          end if;


        when others => state <= idle;
			end case;
		end if;
	end if;
end process pTo;

--vgaclk25 <= i_clock; -- 25 mhz
p_synchro_vga : process (i_clock, i_reset) is
begin
  if (i_reset = '1') then
    vgaclk25 <= '0';
  elsif (rising_edge (i_clock)) then
    vgaclk25 <= not vgaclk25;
  end if;
end process p_synchro_vga;

--pvgaclk : process (i_clock,i_reset) is
--	constant CMAX : integer := 1; -- 50/25
----	constant CMAX : integer := 2; -- 100/25
--	variable vmax : integer range 0 to CMAX-1;
--begin
--		if (i_reset = '1') then
--			vgaclk25 <= '0';
--			vmax := 0;
--		elsif (rising_edge (i_clock)) then
--			if (vmax = CMAX-1) then
--				vgaclk25 <= not vgaclk25;
--				vmax := 0;
--			else
--				vgaclk25 <= vgaclk25;
--				vmax := vmax + 1;
--			end if;
--		end if;
--end process pvgaclk;

pagclk : process (vgaclk25,i_reset) is
--	constant CMAX : integer := 40; -- 1.25
	constant CMAX : integer := 10; -- 1.25
--	constant CMAX : integer := 63; -- 1260ns
	variable vmax : integer range 0 to CMAX-1;
begin
		if (i_reset = '1') then
			agclk <= '0';
			vmax := 0;
		elsif (rising_edge (vgaclk25)) then
			if (vmax = CMAX-1) then
				agclk <= not agclk;
				vmax := 0;
			else
				agclk <= agclk;
				vmax := vmax + 1;
			end if;
		end if;
end process pagclk;

--p0 : process (i_clock) is
--	type states is (idle,
--	s1,
--	ending);
--	variable state : states;
--begin
--	if (rising_edge (i_clock)) then
--		if (i_reset = '1') then
--			state <= idle;
--			test_fixed_melexis_run <= '0';
--		else
--			case (state) is
--				when idle => state <= s1;
--					test_fixed_melexis_run <= '1';
--				when s1 =>
--					test_fixed_melexis_run <= '0';
--					if (test_fixed_melexis_rdy = '1') then
--						state <= ending;
--					else
--						state <= s1;
--					end if;
--				when ending => state <= ending;
--				when others => null;
--			end case;
--		end if;
--	end if;
--end process p0;

i2c_mlx_addrb_conv1 <= i2c_mlx_addrb;
i2c_mlx_i0 : i2c_mlx
PORT MAP (
clka => i2c_mlx_clka,
ena => i2c_mlx_ena,
wea => i2c_mlx_wea,
addra => i2c_mlx_addra,
dina => i2c_mlx_dina,
clkb => i2c_mlx_clkb,
enb => test_fixed_melexis_i2c_mem_ena,
addrb => test_fixed_melexis_i2c_mem_addra,
doutb => test_fixed_melexis_i2c_mem_douta
);

test_fixed_melexis_clock <= i_clock;
test_fixed_melexis_reset <= i_reset;
--test_fixed_melexis_addr <= address_generator_address;
tfm_inst : test_fixed_melexis port map (
i_clock => test_fixed_melexis_clock,
i_reset => test_fixed_melexis_reset,
i_run => test_fixed_melexis_run,
i2c_mem_ena => test_fixed_melexis_i2c_mem_ena,
i2c_mem_addra => test_fixed_melexis_i2c_mem_addra,
i2c_mem_douta => test_fixed_melexis_i2c_mem_douta,
o_busy => test_fixed_melexis_busy,
o_rdy => test_fixed_melexis_rdy,
i_addr => test_fixed_melexis_addr,
o_do => test_fixed_melexis_do,

fixed2floata => fixed2floata,
fixed2floatond => fixed2floatond,
fixed2floatce => fixed2floatce,
fixed2floatsclr => fixed2floatsclr,
fixed2floatr => fixed2floatr,
fixed2floatrdy => fixed2floatrdy,

divfpa => divfpa,
divfpb => divfpb,
divfpond => divfpond,
divfpce => divfpce,
divfpsclr => divfpsclr,
divfpr => divfpr,
divfprdy => divfprdy,

mulfpa => mulfpa,
mulfpb => mulfpb,
mulfpond => mulfpond,
mulfpce => mulfpce,
mulfpsclr => mulfpsclr,
mulfpr => mulfpr,
mulfprdy => mulfprdy,

addfpa => addfpa,
addfpb => addfpb,
addfpond => addfpond,
addfpce => addfpce,
addfpsclr => addfpsclr,
addfpr => addfpr,
addfprdy => addfprdy,

subfpa => subfpa,
subfpb => subfpb,
subfpond => subfpond,
subfpce => subfpce,
subfpsclr => subfpsclr,
subfpr => subfpr,
subfprdy => subfprdy,

sqrtfp2a => sqrtfp2a,
sqrtfp2ond => sqrtfp2ond,
sqrtfp2sclr => sqrtfp2sclr,
sqrtfp2ce => sqrtfp2ce,
sqrtfp2r => sqrtfp2r,
sqrtfp2rdy => sqrtfp2rdy
);

--inst_tb_i2c_mem : tb_i2c_mem
--PORT MAP (
--clka => test_fixed_melexis_clock,
--ena => test_fixed_melexis_i2c_mem_ena,
--wea => "0",
--addra => test_fixed_melexis_i2c_mem_addra,
--dina => (others => '0'),
--douta => test_fixed_melexis_i2c_mem_douta
--);

address_generator_clk <= agclk;
address_generator_clk25 <= vgaclk25;
address_generator_reset <= i_reset;
address_generator_vsync <= VGA_timing_synch_Vsync;
address_generator_activeh <= VGA_timing_synch_activehaaddrgen;
address_generator_enable <= VGA_timing_synch_activeRender1;
--address_generator_enable <= VGA_timing_synch_Hsync;
ag_inst : address_generator port map (
reset => address_generator_reset,
clk => address_generator_clk,
clk25 => address_generator_clk25,
enable => address_generator_enable,
vsync => address_generator_vsync,
activeh => address_generator_activeh,
address => address_generator_address
);

VGA_timing_synch_vgaclk25 <= vgaclk25;
vga_clock <= VGA_timing_synch_vgaclk25;
vga_hsync <= VGA_timing_synch_Hsync;
vga_vsync <= VGA_timing_synch_Vsync;
VGA_timing_synch_reset <= i_reset;
vts_inst : VGA_timing_synch port map (
reset => VGA_timing_synch_reset,
vgaclk25 => VGA_timing_synch_vgaclk25,
Hsync => VGA_timing_synch_Hsync,
Vsync => VGA_timing_synch_Vsync,
activeArea1 => VGA_timing_synch_activeArea1,
activehaaddrgen => VGA_timing_synch_activehaaddrgen,
activeRender1 => VGA_timing_synch_activeRender1,
blank => VGA_timing_synch_blank
);

--vga_r <= vga_imagegenerator_RGB_out (7 downto 0);
--vga_g <= vga_imagegenerator_RGB_out (15 downto 8);
--vga_b <= vga_imagegenerator_RGB_out (23 downto 16);

--vga_r <= vga_imagegenerator_RGB_out (23 downto 16);
--vga_g <= vga_imagegenerator_RGB_out (23 downto 16);
--vga_b <= vga_imagegenerator_RGB_out (23 downto 16);

--vga_r <= vga_imagegenerator_RGB_out (23 downto 21) & vga_imagegenerator_RGB_out (15 downto 13) & vga_imagegenerator_RGB_out (7 downto 6);
--vga_g <= vga_imagegenerator_RGB_out (23 downto 21) & vga_imagegenerator_RGB_out (15 downto 13) & vga_imagegenerator_RGB_out (7 downto 6);
--vga_b <= vga_imagegenerator_RGB_out (23 downto 21) & vga_imagegenerator_RGB_out (15 downto 13) & vga_imagegenerator_RGB_out (7 downto 6);

--vga_r <= vga_imagegenerator_RGB_out (18 downto 16) & vga_imagegenerator_RGB_out (10 downto 8) & vga_imagegenerator_RGB_out (1 downto 0);
--vga_g <= vga_imagegenerator_RGB_out (18 downto 16) & vga_imagegenerator_RGB_out (10 downto 8) & vga_imagegenerator_RGB_out (1 downto 0);
--vga_b <= vga_imagegenerator_RGB_out (18 downto 16) & vga_imagegenerator_RGB_out (10 downto 8) & vga_imagegenerator_RGB_out (1 downto 0);

--vga_r <= dualmem_doutb (12 downto 8) & dualmem_doutb (8 downto 6) when VGA_timing_synch_activeArea1 = '1' else (others => '0');
--vga_g <= dualmem_doutb (12 downto 8) & dualmem_doutb (8 downto 6) when VGA_timing_synch_activeArea1 = '1' else (others => '0');
--vga_b <= dualmem_doutb (12 downto 8) & dualmem_doutb (8 downto 6) when VGA_timing_synch_activeArea1 = '1' else (others => '0');

-- xxx 9 bit signed heatmap, in simulation show all BGYW colors, on board 'only' YW colors, test image have range -172 to 17
-- XXX by using colormap we can use less channels in scaler
rdata <= colormap_rom (to_integer (signed (dualmem_doutb (8 downto 0)))); -- xxx i don't know, problem with dualmem module ?
--rdata <= colormap_rom (to_integer (unsigned (dualmem2_doutb (8 downto 0)))); -- xxx i don't know, problem with dualmem module ?

vga_r <= rdata (23-3 downto 16)&"000" when VGA_timing_synch_activeArea1 = '1' else (others => '0');
vga_g <= rdata (15-3 downto 8)&"000" when VGA_timing_synch_activeArea1 = '1' else (others => '0');
vga_b <= rdata (7-3 downto 0)&"000" when VGA_timing_synch_activeArea1 = '1' else (others => '0');

----vga_imagegenerator_active_area1 <= VGA_timing_synch_activeArea1;
--vga_imagegenerator_active_area1 <= '1';
----vga_imagegenerator_Data_in1 <= test_fixed_melexis_do (BITS-1 downto 0);
--vga_imagegenerator_Data_in1 <= dualmem_doutb (7 downto 0)&dualmem_doutb (7 downto 0)&dualmem_doutb (7 downto 0);
--vga_imagegenerator_vgaclk25 <= vgaclk25;
--vga_imagegenerator_reset <= i_reset;
--vig_inst : vga_imagegenerator port map (
--reset => vga_imagegenerator_reset,
--vgaclk25 => vga_imagegenerator_vgaclk25,
--Data_in1 => vga_imagegenerator_Data_in1,
--active_area1 => vga_imagegenerator_active_area1,
--RGB_out => vga_imagegenerator_RGB_out
--);

--tb_data_calculateTo_clka <= i_clock;
--tb_data_calculateTo_ena <= '1';
----tb_data_calculateTo_addra <= address_generator_address;
--tb_data_calculateTo_inst : tb_data_calculateTo PORT MAP (
--clka => tb_data_calculateTo_clka,
--ena => tb_data_calculateTo_ena,
--addra => tb_data_calculateTo_addra,
--douta => tb_data_calculateTo_douta
--);

float2fixedclk <= i_clock;
inst_float2fixed : float2fixed PORT MAP (
a => float2fixeda,
operation_nd => float2fixedond,
clk => float2fixedclk,
sclr => float2fixedsclr,
ce => float2fixedce,
result => float2fixedr,
rdy => float2fixedrdy
);

dualmem_clka <= i_clock;
dualmem_clkb <= agclk;
dualmem_addrb <= address_generator_address;
dualmem_inst : dualmem PORT MAP (
clka => dualmem_clka,
ena => dualmem_ena,
wea => dualmem_wea,
addra => dualmem_addra,
dina => dualmem_dina,
clkb => dualmem_clkb,
enb => dualmem_enb,
addrb => dualmem_addrb,
doutb => dualmem_doutb
);

fixed2floatclk <= i_clock;
addfpclk <= i_clock;
subfpclk <= i_clock;
mulfpclk <= i_clock;
divfpclk <= i_clock;
sqrtfp2clk <= i_clock;

b0 : block
attribute loc : string;
--attribute loc of inst_fixed2float : label is "SLICE_X40Y176:SLICE_X79Y191";
--attribute loc of inst_fixed2float : label is "SLICE_X40Y176:SLICE_X75Y191";
--attribute loc of inst_fixed2float : label is "SLICE_X40Y176:SLICE_X71Y191";

begin
inst_fixed2float : fixed2float
PORT MAP (
a => fixed2floata,
operation_nd => fixed2floatond,
clk => fixed2floatclk,
sclr => fixed2floatsclr,
ce => fixed2floatce,
result => fixed2floatr,
rdy => fixed2floatrdy
);
end block b0;

inst_divfp : divfp
PORT MAP (
a => divfpa,
b => divfpb,
operation_nd => divfpond,
clk => divfpclk,
sclr => divfpsclr,
ce => divfpce,
result => divfpr,
rdy => divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => mulfpa,
b => mulfpb,
operation_nd => mulfpond,
clk => mulfpclk,
sclr => mulfpsclr,
ce => mulfpce,
result => mulfpr,
rdy => mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => addfpa,
b => addfpb,
operation_nd => addfpond,
clk => addfpclk,
sclr => addfpsclr,
ce => addfpce,
result => addfpr,
rdy => addfprdy
);

inst_subfp : subfp
PORT MAP (
a => subfpa,
b => subfpb,
operation_nd => subfpond,
clk => subfpclk,
sclr => subfpsclr,
ce => subfpce,
result => subfpr,
rdy => subfprdy
);

--inst_sqrtfp2 : sqrtfp2
--PORT MAP (
--a => sqrtfp2a,
--operation_nd => sqrtfp2ond,
--clk => sqrtfp2clk,
--sclr => sqrtfp2sclr,
--ce => sqrtfp2ce,
--result => sqrtfp2r,
--rdy => sqrtfp2rdy
--);

melexis_mlx90640_i2c_slave_address <= "0110011";
melexis_mlx90640_i2c_i0 : melexis_mlx90640_i2c
port map (
i_clock => clock_i,
i_reset => i_reset,
i_slave_address => melexis_mlx90640_i2c_slave_address,
i_mode0 => melexis_mlx90640_i2c_mode0, -- W(A)/4b(A)
i_mode1 => melexis_mlx90640_i2c_mode1, -- W(A)/2b(A),ST,R(A)/2b(NA)
i_mode2 => melexis_mlx90640_i2c_mode2, -- W(A)/2b(A),ST,R(A)/2*N(NA)
o_mode2_ready => melexis_mlx90640_i2c_mode2_ready,
o_mode2_ready_all => melexis_mlx90640_i2c_mode2_ready_all,
i_memory_address => melexis_mlx90640_i2c_memory_address,
i_memory_data => melexis_mlx90640_i2c_memory_data,
o_bytes_to_recv => melexis_mlx90640_i2c_bytes_to_recv,
i_enable => melexis_mlx90640_i2c_enable,
o_busy => melexis_mlx90640_i2c_busy,
io_sda_o => sda_o,
io_sda_i => sda_i,
io_scl_o => scl_o,
io_scl_i => scl_i
);

io_sda_dd1 <= '0' when sda_o = '0' else 'Z';
sda_i <= io_sda_dd1;
io_sda_dd <= sda_i;
io_sda_nl <= sda_i;

io_scl_dd1 <= '0' when scl_o = '0' else 'Z';
scl_i <= io_scl_dd1;
io_scl_nl <= scl_i;
io_scl_dd <= scl_i;

clock_i <= i_clock;

i2c_mlx_clka <= test_fixed_melexis_clock;
i2c_mlx_clkb <= test_fixed_melexis_clock;

--mux_i2c_enb : i2c_mlx_enb <=
--i2c_mem_ena_2 when (
--state = z1 or
--state = z2 or
--state = z3 or
--state = z4 or
--state = z5)
--else
--i2c_mem_ena_1;

--mux_i2c_addrb : i2c_mlx_addrb <=
--i2c_mlx_addrb_2 when (
--state = z1 or
--state = z2 or
--state = z3 or
--state = z4 or
--state = z5)
--else
--i2c_mlx_addrb_1;


end Behavioral;

