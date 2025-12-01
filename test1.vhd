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

library UNISIM;
use UNISIM.vcomponents.all;

use work.p_fphdl_package3.all;
use work.colormap_pkg.all;
use work.global_package.all;

entity test1 is
generic (
constant c_clock_board_frequency : integer := c_clock_board_frequency;
constant c_bus_clock : integer := c_clock_i2c_frequency;
c_sim : string (1 downto 1) := "n";
c_debug_spi : string (1 downto 1) := "n";
c_normal : string (1 downto 1) := "y";
constant c_cold_start : integer := 1024;
constant c_melexis_mlx90640_i2c_enable_wait : integer := 256;
constant c_melexis_mlx90640_i2c_wait : integer := 65536;
constant c_w_64us : integer := 65536; -- 64 us
constant c_w_180us : integer := 65536; -- 180 us
constant c_w_80ms : integer := 65536; -- 80 ms
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
o_ready : out std_logic;
o_an : out std_logic_vector (3 downto 0);
o_seg : out std_logic_vector (6 downto 0);
o_cs,o_do,o_clk : out std_logic
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

w8_80ms,
w_800d1981_a,
w_800d1981_b,
w8_rr,
r_2400_a,
r_2400_b,
r_2400_c,

start_process,

-- subframe 0
r_0400_1_a,
r_0400_1_b,
r_0400_1_c,
clear_nda_1_a,
clear_nda_1_b,
clear_nda_1_c,
s0_1,s1_1,s4_1,s5_1,s6_1,s7_1,s8_1,s9_1,s10_1,
set_som_1_a,
set_som_1_b,
set_som_1_c,
w8_rr_20_1,
check_nda_1,
check_nda_1_idle,

-- subframe 1
r_0400_2_a,
r_0400_2_b,
r_0400_2_c,
clear_nda_2_a,
clear_nda_2_b,
clear_nda_2_c,
s0_2,s1_2,s4_2,s5_2,s6_2,s7_2,s8_2,s9_2,s10_2,
set_som_2_a,
set_som_2_b,
set_som_2_c,
w8_rr_20_2,
check_nda_2,
check_nda_2_idle,

end_process
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
signal w_80ms : integer range 0 to c_w_80ms - 1;
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

signal d1, d1_s2 : std_logic;
signal selector : integer range 0 to 15;
signal mode2_ready_fe : std_logic;
signal mode2_ready_reg : std_logic;
signal spi_i : integer range 0 to 31;
type debug_spi_st is (a,b);
signal debug_spi_s : debug_spi_st;

begin

g_debug_spi_n : if (c_debug_spi = "n") generate

debug_spi_cs : o_cs <= '1';
debug_spi_do : o_do <= '0';
debug_spi_clk : o_clk <= '0';

end generate g_debug_spi_n;

g_debug_spi_y : if (c_debug_spi = "y") generate

-- debug
debug_spi_cs : o_cs <= d1_s2;
debug_spi_do : o_do <= melexis_mlx90640_i2c_bytes_to_recv (selector) when d1_s2 = '0' else '0';
debug_spi_clk : o_clk <= d1;

p_debug_spi_ready_re : process (vgaclk25,i_reset) is
begin
  if (i_reset = '1') then
    mode2_ready_reg <= '0';
  elsif (rising_edge (vgaclk25)) then
    mode2_ready_reg <= melexis_mlx90640_i2c_mode2_ready;
  end if;
end process p_debug_spi_ready_re;

debug_spi_ready_re : mode2_ready_fe <= '1' when mode2_ready_reg = '1' and melexis_mlx90640_i2c_mode2_ready = '0' else '0';

p_debug_spi_clk_cs : process (vgaclk25,i_reset) is
begin
  if (i_reset = '1') then
    d1 <= '1';
    debug_spi_s <= a;
    spi_i <= 0;
    d1_s2 <= '1';
  elsif (rising_edge (vgaclk25)) then
    case debug_spi_s is
      when a =>
        d1 <= '1';
        if (mode2_ready_fe = '1') then
          debug_spi_s <= b;
          d1 <= '1';
          d1_s2 <= '0';
          spi_i <= 0;
        end if;
      when b =>
        d1 <= not d1;
        if (spi_i = 31) then
          debug_spi_s <= a;
          d1_s2 <= '1';
        else
          spi_i <= spi_i + 1;
        end if;
    end case;
  end if;
end process p_debug_spi_clk_cs;

p_debug_spi_do : process (i_reset,d1) is
begin
  if (i_reset = '1') then
    selector <= 0;
  elsif (rising_edge (d1)) then
    if (selector = 15) then
      selector <= 0;
    else
      selector <= selector + 1;
    end if;
  end if;
end process p_debug_spi_do;

end generate g_debug_spi_y;

o_data <= (others => '0');
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
--    if (melexis_mlx90640_i2c_enable = '1') then
      if (temp1 = '0' and melexis_mlx90640_i2c_mode2_ready = '1' and melexis_mlx90640_i2c_mode2 = '1') then
        i2c_mlx_wea <= "1";
        i2c_mlx_ena <= '1';
        if (melexis_mlx90640_i2c_memory_address = x"2400") then
          i2c_mlx_addra <= std_logic_vector (to_unsigned (mem_addr + 0, 11));
        end if;
        if (melexis_mlx90640_i2c_memory_address = x"0400") then
          i2c_mlx_addra <= std_logic_vector (to_unsigned (mem_addr + 832, 11));
        end if;
      elsif (temp1 = '1' and melexis_mlx90640_i2c_mode2_ready = '0' and melexis_mlx90640_i2c_mode2 = '1') then
        i2c_mlx_wea <= "0";
        i2c_mlx_ena <= '0';
        if (mem_addr = c_max - 1) then
          mem_addr <= 0;
        else
          mem_addr <= mem_addr + 1;
        end if;
      end if;
--    end if;
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

o_led (7 downto 0) <= test_fixed_melexis_do(31-10 downto 31-7-10);
o_an <= (others => '1');
o_seg <= (others => '0');

vga_syncn <= '1';
g_blank_sim : if (c_sim = "y") generate
vga_blankn <= VGA_timing_synch_blank;
end generate g_blank_sim;
g_blank_syn : if (c_sim = "n") generate
vga_blankn <= '1';
end generate g_blank_syn;
vga_psave <= '1';

pTo : process (i_clock) is
	variable i : integer range 0 to PIXELS-1;
	variable j : integer range 0 to PIXELS-1;
  constant c_en_cnt : integer := 96;
  variable en_cnt : integer range 0 to c_en_cnt - 1;
	variable tout : std_logic_vector (8 downto 0);

  procedure wr_1_1 (address : in std_logic_vector (15 downto 0); next_state : in states) is
  begin
    melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '1';
    melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= address;
    if (en_cnt = c_en_cnt - 1) then
      state <= next_state;
      en_cnt := 0;
    else
      en_cnt := en_cnt + 1;
    end if;
  end procedure;
  procedure wr_1_2 (next_state : in states) is
  begin
    if (melexis_mlx90640_i2c_busy = '0') then
      if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
        state <= next_state;
        melexis_mlx90640_i2c_enable <= '0';
        melexis_mlx90640_i2c_enable_wait <= 0;
      else
        melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
      end if;
    end if;
  end procedure;

  procedure wr (address : in std_logic_vector (15 downto 0); next_state : in states) is
  begin
    melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '1'; melexis_mlx90640_i2c_mode2 <= '0'; 
    melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= address;
    if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
      if (melexis_mlx90640_i2c_busy = '0') then
        state <= next_state;
        melexis_mlx90640_i2c_enable <= '0';
        melexis_mlx90640_i2c_enable_wait <= 0;
      end if;
    else
      melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
    end if;
  end procedure;

  procedure wr_idle_1 (address1 : in std_logic_vector (15 downto 0); address2 : in std_logic_vector (15 downto 0); next_state : in states; prev_state : in states) is
  begin
    melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
    melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
    if (melexis_mlx90640_i2c_bytes_to_recv = address1 or melexis_mlx90640_i2c_bytes_to_recv = address2) then
      if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
        state <= next_state;
        melexis_mlx90640_i2c_wait <= 0;
      else
        melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
      end if;
    else
      state <= prev_state;
    end if;
  end procedure;

  procedure wr_idle (address1 : in std_logic_vector (15 downto 0); next_state : in states; prev_state : in states) is
  begin
    wr_idle_1 (address1, address1, next_state, prev_state);
  end procedure;
  procedure wr_idle_2 (address1 : in std_logic_vector (15 downto 0); next_state1 : in states; next_state2 : in states) is
  begin
    melexis_mlx90640_i2c_mode0 <= '0'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0'; 
    melexis_mlx90640_i2c_enable <= '0'; melexis_mlx90640_i2c_memory_address <= x"0000"; melexis_mlx90640_i2c_memory_data <= x"0000";
    if (melexis_mlx90640_i2c_bytes_to_recv = address1) then
      state <= next_state1;
    else
      if (melexis_mlx90640_i2c_wait = c_melexis_mlx90640_i2c_wait - 1) then
        state <= next_state2;
        melexis_mlx90640_i2c_wait <= 0;
      else
        melexis_mlx90640_i2c_wait <= melexis_mlx90640_i2c_wait + 1;
      end if;
    end if;
  end procedure;

  procedure w_1 (address : in std_logic_vector (15 downto 0); data : in std_logic_vector (15 downto 0); next_state : in states) is
  begin
    melexis_mlx90640_i2c_mode0 <= '1'; melexis_mlx90640_i2c_mode1 <= '0'; melexis_mlx90640_i2c_mode2 <= '0';
    melexis_mlx90640_i2c_enable <= '1'; melexis_mlx90640_i2c_memory_address <= address; melexis_mlx90640_i2c_memory_data <= data;
    if (en_cnt = c_en_cnt - 1) then
      state <= next_state;
      en_cnt := 0;
    else
      en_cnt := en_cnt + 1;
    end if;
  end procedure;
  procedure w_2 (next_state : in states) is
  begin
    if (melexis_mlx90640_i2c_busy = '0') then
      if (melexis_mlx90640_i2c_enable_wait = c_melexis_mlx90640_i2c_enable_wait - 1) then
        melexis_mlx90640_i2c_enable_wait <= 0;
        state <= next_state;
      else
        melexis_mlx90640_i2c_enable_wait <= melexis_mlx90640_i2c_enable_wait + 1;
      end if;
    end if;
  end procedure;

  procedure w8_64us (next_state : in states) is
  begin
    if (w_64us = c_w_64us - 1) then
      w_64us <= 0;
      state <= next_state;
    else
      w_64us <= w_64us + 1;
    end if;
  end procedure;
  procedure w8_200ms (next_state : in states) is
  begin
    if (w_200ms = c_w_200ms - 1) then
      w_200ms <= 0;
      state <= next_state;
    else
      w_200ms <= w_200ms + 1;
    end if;
  end procedure;
  procedure w8_160ms (next_state : in states) is
  begin
    if (w_160ms = c_w_160ms - 1) then
      w_160ms <= 0;
      state <= next_state;
    else
      w_160ms <= w_160ms + 1;
    end if;
  end procedure;
  procedure w8_180ms (next_state : in states) is
  begin
    if (w_180ms = c_w_180ms - 1) then
      w_180ms <= 0;
      state <= next_state;
    else
      w_180ms <= w_180ms + 1;
    end if;
  end procedure;
  procedure w8_21ms (next_state : in states) is
  begin
    if (w_21ms = c_w_21ms - 1) then
      w_21ms <= 0;
      state <= next_state;
    else
      w_21ms <= w_21ms + 1;
    end if;
  end procedure;
  procedure w8_80ms (next_state : in states) is
  begin
    if (w_80ms = c_w_80ms - 1) then
      w_80ms <= 0;
      state <= next_state;
    else
      w_80ms <= w_80ms + 1;
    end if;
  end procedure;
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
      en_cnt := 0;
		else
			case (state) is
				when idle =>
          en_cnt := 0;
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
            state <= w8_80ms;
            cold_start <= 0;
          else
            cold_start <= cold_start + 1;
          end if;

when w8_80ms =>
  w8_80ms (w_800d1981_a);
when w_800d1981_a =>
--  w_1 (x"800d", x"1981", w_800d1981_b);
--  w_1 (x"800d", x"1984", w_800d1981_b);
--  w_1 (x"800d", x"0000", w_800d1981_b);
  w_1 (x"800d", x"1b88", w_800d1981_b);
when w_800d1981_b =>
  if (en_cnt = c_en_cnt - 1) then
    melexis_mlx90640_i2c_enable <= '0';
    state <= w8_rr;
    en_cnt := 0;
  else
    en_cnt := en_cnt + 1;
  end if;
when w8_rr =>
  w8_64us (r_2400_a);
when r_2400_a =>
  wr_1_1 (x"2400", r_2400_b);
when r_2400_b =>
  if (en_cnt = c_en_cnt - 1) then
    melexis_mlx90640_i2c_enable <= '0';
    state <= r_2400_c;
    en_cnt := 0;
  else
    en_cnt := en_cnt + 1;
  end if;
when r_2400_c =>
  wr_1_2 (start_process);
when start_process =>
  dualmem_enb <= '1';
  if (en_cnt = c_en_cnt - 1) then
    state <= r_0400_1_a;
    en_cnt := 0;
  else
    en_cnt := en_cnt + 1;
  end if;

-- subframe 0
when r_0400_1_a =>
  wr_1_1 (x"0400", r_0400_1_b);
when r_0400_1_b =>
  if (en_cnt = c_en_cnt - 1) then
    melexis_mlx90640_i2c_enable <= '0';
    state <= r_0400_1_c;
    en_cnt := 0;
  else
    en_cnt := en_cnt + 1;
  end if;
when r_0400_1_c =>
  wr_1_2 (clear_nda_1_a);
when clear_nda_1_a =>
  w_1 (x"8000", x"0000", clear_nda_1_b);
when clear_nda_1_b =>
  if (en_cnt = c_en_cnt - 1) then
    melexis_mlx90640_i2c_enable <= '0';
    state <= clear_nda_1_c;
    en_cnt := 0;
  else
    en_cnt := en_cnt + 1;
  end if;
when clear_nda_1_c =>
  w_2 (s0_1);
when s0_1 =>
  if (melexis_mlx90640_i2c_mode2_ready_all = '1') then
    state <= s1_1;
    test_fixed_melexis_run <= '1';
    float2fixedsclr <= '0';
    dualmem_enb <= '1';
    w11ms <= 0;
  end if;
when s1_1 =>
  test_fixed_melexis_run <= '0';
  if (c_normal = "n") then
    if (w11ms = c_w11ms - 1) then
      state <= s4_1;
      w11ms <= 0;
    else
      state <= s1_1;
      w11ms <= w11ms + 1;
    end if;
  end if;
  if (c_normal = "y") then
    if (test_fixed_melexis_rdy = '1') then
      state <= s4_1;
      float2fixedsclr <= '0';
      i := 0;
      tout := (others => '0');
    else
      state <= s1_1;
    end if;
  end if;
when s4_1 => state <= s5_1;
  test_fixed_melexis_addr <= std_logic_vector (to_unsigned (i, 10));
when s5_1 => state <= s6_1;
when s6_1 => state <= s7_1;
  float2fixedond <= '1';
  float2fixedce <= '1';
  float2fixeda <= test_fixed_melexis_do;
when s7_1 =>
  if (float2fixedrdy = '1') then state <= s8_1;
    tout := float2fixedr;
    float2fixedond <= '0';
    float2fixedce <= '0';
    float2fixedsclr <= '1';
  else state <= s7_1; end if;
when s8_1 => state <= s9_1;
  float2fixedsclr <= '0';
  dualmem_wea <= "1";
  dualmem_addra <= std_logic_vector (to_unsigned (i, 10));
  dualmem_dina <= tout;
  dualmem_ena <= '1';
when s9_1 =>
  dualmem_wea <= "0";
  dualmem_ena <= '0';
  if (i = PIXELS-1) then
    i := 0;
    state <= s10_1;
  else
    state <= s4_1;
    i := i + 1;
  end if;
when s10_1 =>
  dualmem_enb <= '1';
  state <= set_som_1_a;
when set_som_1_a =>
  w_1 (x"8000", x"0020", set_som_1_b);
--  w (x"8000", x"0030", w8_rr_20_1);
when set_som_1_b =>
  if (en_cnt = c_en_cnt - 1) then
    melexis_mlx90640_i2c_enable <= '0';
    state <= set_som_1_c;
    en_cnt := 0;
  else
    en_cnt := en_cnt + 1;
  end if;
when set_som_1_c =>
  w_2 (w8_rr_20_1);
when w8_rr_20_1 =>
  w8_64us (check_nda_1);
when check_nda_1 =>
  wr (x"8000", check_nda_1_idle); -- to here is ok
when check_nda_1_idle =>
--  wr_idle (x"0008", r_0400_2, check_nda_1);
if (c_sim = "n") then
  wr_idle_1 (x"0008", x"0000", r_0400_2_a, check_nda_1);
end if;
if (c_sim = "y") then
  state <= r_0400_2_a;
  dualmem_enb <= '1';
end if;

-- subframe 1
when r_0400_2_a =>
  wr_1_1 (x"0400", r_0400_2_b);
when r_0400_2_b =>
  if (en_cnt = c_en_cnt - 1) then
    melexis_mlx90640_i2c_enable <= '0';
    state <= r_0400_2_c;
    en_cnt := 0;
  else
    en_cnt := en_cnt + 1;
  end if;
when r_0400_2_c =>
  wr_1_2 (clear_nda_2_a);
when clear_nda_2_a =>
  w_1 (x"8000", x"0000", clear_nda_2_b);
when clear_nda_2_b =>
  if (en_cnt = c_en_cnt - 1) then
    melexis_mlx90640_i2c_enable <= '0';
    state <= clear_nda_2_c;
    en_cnt := 0;
  else
    en_cnt := en_cnt + 1;
  end if;
when clear_nda_2_c =>
  w_2 (s0_2);
when s0_2 =>
  if (melexis_mlx90640_i2c_mode2_ready_all = '1') then
    state <= s1_2;
    test_fixed_melexis_run <= '1';
    float2fixedsclr <= '0';
    dualmem_enb <= '1';
    w11ms <= 0;
  end if;
when s1_2 =>
  test_fixed_melexis_run <= '0';
  if (c_normal = "n") then
    if (w11ms = c_w11ms - 1) then
      state <= s4_2;
      w11ms <= 0;
    else
      state <= s1_2;
      w11ms <= w11ms + 1;
    end if;
  end if;
  if (c_normal = "y") then
    if (test_fixed_melexis_rdy = '1') then
      state <= s4_2;
      float2fixedsclr <= '0';
      j := 0;
      tout := (others => '0');
    else
      state <= s1_2;
    end if;
  end if;
when s4_2 => state <= s5_2;
  test_fixed_melexis_addr <= std_logic_vector (to_unsigned (j, 10));
when s5_2 => state <= s6_2;
when s6_2 => state <= s7_2;
  float2fixedond <= '1';
  float2fixedce <= '1';
  float2fixeda <= test_fixed_melexis_do;
when s7_2 =>
  if (float2fixedrdy = '1') then state <= s8_2;
    tout := float2fixedr;
    float2fixedond <= '0';
    float2fixedce <= '0';
    float2fixedsclr <= '1';
  else state <= s7_2; end if;
when s8_2 => state <= s9_2;
  float2fixedsclr <= '0';
  dualmem_wea <= "1";
  dualmem_addra <= std_logic_vector (to_unsigned (j, 10));
  dualmem_dina <= tout;
  dualmem_ena <= '1';
when s9_2 =>
  dualmem_wea <= "0";
  dualmem_ena <= '0';
  if (j = PIXELS-1) then
    j := 0;
    state <= s10_2;
  else
    state <= s4_2;
    j := j + 1;
  end if;
when s10_2 =>
  dualmem_enb <= '1';
  state <= set_som_2_a;
when set_som_2_a =>
  w_1 (x"8000", x"0020", set_som_2_b);
--  w (x"8000", x"0030", w8_rr_20_2);
when set_som_2_b =>
  if (en_cnt = c_en_cnt - 1) then
    melexis_mlx90640_i2c_enable <= '0';
    state <= set_som_2_c;
    en_cnt := 0;
  else
    en_cnt := en_cnt + 1;
  end if;
when set_som_2_c =>
  w_2 (w8_rr_20_2);
when w8_rr_20_2 =>
  w8_64us (check_nda_2);
when check_nda_2 =>
  wr (x"8000", check_nda_2_idle);
when check_nda_2_idle =>
--  wr_idle (x"0008", end_process, check_nda_2);
if (c_sim = "n") then
  wr_idle_1 (x"0008", x"0000", end_process, check_nda_2);
end if;
if (c_sim = "y") then
  state <= end_process;
end if;
when end_process =>
  state <= start_process;
--  state <= idle;
when others => null;
			end case;
		end if;
	end if;
end process pTo;

--vgaclk25 <= i_clock; -- 25 mhz
--p_synchro_vga : process (i_clock, i_reset) is
--begin
--  if (i_reset = '1') then
--    vgaclk25 <= '0';
--  elsif (rising_edge (i_clock)) then
--    vgaclk25 <= not vgaclk25;
--  end if;
--end process p_synchro_vga;

pvgaclk : process (i_clock,i_reset) is
--	constant CMAX : integer := 1; -- 50/25
	constant CMAX : integer := 2; -- 100/25
	variable vmax : integer range 0 to CMAX-1;
begin
		if (i_reset = '1') then
			vgaclk25 <= '0';
			vmax := 0;
		elsif (rising_edge (i_clock)) then
			if (vmax = CMAX-1) then
				vgaclk25 <= not vgaclk25;
				vmax := 0;
			else
				vgaclk25 <= vgaclk25;
				vmax := vmax + 1;
			end if;
		end if;
end process pvgaclk;

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

--g_sda_scl_sim : if (c_sim = "y") generate
io_sda_dd1 <= '0' when sda_o = '0' else 'Z';
sda_i <= io_sda_dd1;
io_sda_dd <= sda_i;
io_sda_nl <= sda_i;

io_scl_dd1 <= '0' when scl_o = '0' else 'Z';
scl_i <= io_scl_dd1;
io_scl_nl <= scl_i;
io_scl_dd <= scl_i;
--end generate g_sda_scl_sim;

--g_sda_scl_syn : if (c_sim = "n") generate
--IOBUF_inst_sda : IOBUF
--generic map (
--DRIVE => 12,
--IOSTANDARD => "DEFAULT",
--SLEW => "SLOW")
--port map (
--O => sda_i, -- Buffer output
--IO => io_sda_dd1, -- Buffer inout port (connect directly to top-level port)
--I => '0', -- Buffer input
--T => sda_o -- 3-state enable input, high=input, low=output
--);
--io_sda_dd <= sda_i;
--io_sda_nl <= sda_i;
--
--IOBUF_inst_scl : IOBUF
--generic map (
--DRIVE => 12,
--IOSTANDARD => "DEFAULT",
--SLEW => "SLOW")
--port map (
--O => scl_i, -- Buffer output
--IO => io_scl_dd1, -- Buffer inout port (connect directly to top-level port)
--I => '0', -- Buffer input
--T => scl_o -- 3-state enable input, high=input, low=output
--);
--io_scl_dd <= scl_i;
--io_scl_nl <= scl_i;
--end generate g_sda_scl_syn;

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

