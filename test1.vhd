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
Library UNISIM;
use UNISIM.vcomponents.all;

use work.global_package.all;
use work.colormap_pkg.all;
--use work.colormap_viridis.all;
--use work.colormap_magma.all;
--use work.colormap_brewer_ygb.all;
--use work.colormap_rainbow.all;
--use work.colormap_heat.all;
use work.p_package1.all;

entity test1 is
generic (
constant c_board_clock : integer := c_clock_board_frequency;
--constant c_bus_clock : integer := c_clock_i2c_frequency;
--constant c_bus_clock : integer := 446_000; -- 447_000 - X signals in TB Post-Route SIM
--constant c_bus_clock : integer := 50;
--constant c_bus_clock : integer := 1_000_000;
constant c_bus_clock : integer := c_clock_i2c_frequency;
-- constant c_bus_clock : integer := 100_000;
constant c_sim : string (1 to 1) := "n";
constant c_cold_start : integer := 1000;
constant c_wait2 : integer := 10000;
constant c_wait3 : integer := 10000;
constant c_device : string (1 to 8) := "mlx90640"; -- mlx90640 (32x24),mlx90641 (16x12)
constant c_calculate_type1 : string (1 to 13) := "c_raws_images"; -- c_temperature,c_raws_images
constant c_use_fisqrt1 : string (1 to 3) := "xxx" -- yes/no - depend from c_calculate_type(c_temperature)
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
io_sda_nl : inout std_logic;
io_scl_nl : inout std_logic
);
end test1;

architecture Behavioral of test1 is

constant PIXELS : integer := 768;
constant ADDRESS1 : integer := 10;
constant BITS : integer := 24;

component melexis_mlx9064x is
generic (
constant c_device : string (1 to 8) := c_device; -- mlx90640 (32x24),mlx90641 (16x12)
constant c_calculate_type : string (1 to 13) := c_calculate_type1; -- c_temperature,c_raws_images
constant c_use_fisqrt : string (1 to 3) := c_use_fisqrt1 -- yes/no - depend from c_calculate_type(c_temperature)
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
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
end component melexis_mlx9064x;
signal test_fixed_melexis_clock : std_logic;
signal test_fixed_melexis_reset : std_logic;
signal test_fixed_melexis_run : std_logic;
signal test_fixed_melexis_i2c_mem_ena : STD_LOGIC;
signal test_fixed_melexis_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal test_fixed_melexis_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
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

component vga_address_generator is
port (
i_clock, i_reset : in  std_logic;
i_vga_blank      : in  std_logic;
i_vga_v_blank    : in  std_logic;
o_vga_address    : out std_logic_vector (c_memory_address_bits - 1 downto 0)
);
end component vga_address_generator;
signal address_generator_reset : std_logic;
signal address_generator_clk : STD_LOGIC;
signal address_generator_vsync : STD_LOGIC;
signal address_generator_activeh : STD_LOGIC;
signal address_generator_address : STD_LOGIC_VECTOR (c_memory_address_bits-1 downto 0);

component vga_timing is
port (
i_clock   : in  std_logic;
i_reset   : in  std_logic;
o_hsync   : out std_logic;
o_vsync   : out std_logic;
o_blank   : out std_logic;
o_v_blank : out std_logic;
o_h_blank : out std_logic
);
end component vga_timing;
signal VGA_timing_synch_reset : std_logic;
signal VGA_timing_synch_vgaclk25 : STD_LOGIC;
signal VGA_timing_synch_Hsync : STD_LOGIC;
signal VGA_timing_synch_Vsync : STD_LOGIC;
signal VGA_timing_synch_activeArea1 : STD_LOGIC;
signal VGA_timing_synch_activehaaddrgen : STD_LOGIC;
signal VGA_timing_synch_activeRender1 : STD_LOGIC;
signal VGA_timing_synch_blank : STD_LOGIC;
signal VGA_timing_synch_V_Blank : std_logic;

signal vgaclk25,agclk : std_logic;

COMPONENT float2fixed_rawimg
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT float2fixed_rawimg;
COMPONENT float2fixed_temperature
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT float2fixed_temperature;
signal float2fixeda : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal float2fixedond : STD_LOGIC;
signal float2fixedclk : STD_LOGIC;
signal float2fixedsclr : STD_LOGIC;
signal float2fixedce : STD_LOGIC;
signal float2fixedr_t : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal float2fixedr_r : STD_LOGIC_VECTOR(8 DOWNTO 0);
signal float2fixedrdy : STD_LOGIC;

COMPONENT dualmem_rawimg
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
END COMPONENT dualmem_rawimg;
COMPONENT dualmem_temperature
PORT (
clka : IN STD_LOGIC;
ena : IN STD_LOGIC;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
clkb : IN STD_LOGIC;
enb : IN STD_LOGIC;
addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
doutb : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT dualmem_temperature;
signal dualmem_clka : STD_LOGIC;
signal dualmem_ena : STD_LOGIC;
signal dualmem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal dualmem_addra : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal dualmem_dina_t : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal dualmem_dina_r : STD_LOGIC_VECTOR(8 DOWNTO 0);
signal dualmem_clkb : STD_LOGIC;
signal dualmem_enb : STD_LOGIC;
signal dualmem_addrb : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal dualmem_doutb_t : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal dualmem_doutb_r : STD_LOGIC_VECTOR(8 DOWNTO 0);

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

signal rdata : std_logic_vector(23 downto 0);

signal cm : std_logic_vector (8 downto 0);

type states is (
idle,
wr1,
idle0,
w1,
idle1,
wr2,
idle2,

idlea,
wr1a,
idle0a,
w1a,
idle1a,
wr2a,
idle2a,

r1,
idle3,

idlea1,
wr1a1,
idle0a1,
w1a1,
idle1a1,
wr2a1,
idle2a1,

r2,
idle4,

r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,
s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14
);
signal t_state : states := idle;

COMPONENT tb_data_calculateTo
PORT (
clka : IN STD_LOGIC;
ena : IN STD_LOGIC;
addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END COMPONENT;
signal test_to_clka : STD_LOGIC := '0';
signal test_to_ena : STD_LOGIC := '0';
signal test_to_addra : STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '0');
signal test_to_douta : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

component melexis_mlx90640_i2c is
generic (
  c_board_clock : integer := c_board_clock;
  c_bus_clock : integer := c_bus_clock
);
port (
  i_clock : in std_logic;
  i_reset : in std_logic;
  i_slave_address : in std_logic_vector (c_i2c_address_bits - 1 downto 0);
  i_mode0 : in std_logic; -- W(A)/4b(A)
  i_mode1 : in std_logic; -- W(A)/2b(A),ST,R(A)/2b(NA)
  i_mode2 : in std_logic; -- W(A)/2b(A),ST,R(A)/2*N(NA)
  o_mode2_ready : out std_logic;
  o_mode2_ready_all : out std_logic;
  i_memory_address : in std_logic_vector (0 to 15);
  i_memory_data : in std_logic_vector (0 to 15);
  o_bytes_to_recv : out std_logic_vector (0 to 15);
  i_enable : in std_logic;
  o_busy : out std_logic;
  io_sda_o : out std_logic;
  io_sda_i : in std_logic;
  io_scl : out std_logic
);
end component melexis_mlx90640_i2c;
signal melexis_mlx90640_i2c_clock : std_logic;
signal melexis_mlx90640_i2c_reset : std_logic;
signal melexis_mlx90640_i2c_slave_address : std_logic_vector (c_i2c_address_bits - 1 downto 0);
signal melexis_mlx90640_i2c_mode0 : std_logic; -- W(A)/4b(A)
signal melexis_mlx90640_i2c_mode1 : std_logic; -- W(A)/2b(A),ST,R(A)/2b(NA)
signal melexis_mlx90640_i2c_mode2 : std_logic; -- W(A)/2b(A),ST,R(A)/2*N(NA)
signal melexis_mlx90640_i2c_mode2_ready : std_logic;
signal melexis_mlx90640_i2c_mode2_ready_all : std_logic;
signal melexis_mlx90640_i2c_memory_address : std_logic_vector (0 to 15);
signal melexis_mlx90640_i2c_memory_data : std_logic_vector (0 to 15);
signal melexis_mlx90640_i2c_bytes_to_recv : std_logic_vector (0 to 15);
signal melexis_mlx90640_i2c_enable : std_logic;
signal melexis_mlx90640_i2c_busy : std_logic;
signal melexis_mlx90640_i2c_sda_o : std_logic;
signal melexis_mlx90640_i2c_sda_i : std_logic;
signal melexis_mlx90640_i2c_scl : std_logic;

signal asd,asd1,clock_i : std_logic;

signal sda_o, sda_i, scl_i : std_logic;

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
signal i2c_mlx_doutb : STD_LOGIC_VECTOR(7 DOWNTO 0);

--constant c_wait1 : integer := 58;
--constant c_wait1 : integer := 25*1_000_000/10000;
--constant c_wait1 : integer := 25;
--constant c_wait1 : integer := 60;
--constant c_wait1 : integer := 47;
 constant c_wait1 : integer := 115*4; -- scl 500_000
--constant c_wait1 : integer := 115*4*1000; -- scl 100
--constant c_wait1 : integer := 230*4*1000; -- scl 50
--constant c_wait1 : integer := 230*5*4*1000; -- scl 10
--constant c_wait1 : integer := 230*5*5*4*1000; -- scl 2
signal wait1 : integer range 0 to c_wait1 - 1;

signal i2c_mem_ena_1 : std_logic;

signal temp1, temp2 : std_logic;

begin

vga_syncn <= '1';
vga_blankn <= VGA_timing_synch_blank;
--vga_blankn <= '1';
vga_psave <= '1';

--p100 : process (melexis_mlx90640_i2c_mode2_ready, i_reset) is
p100 : process (clock_i, i_reset) is
  constant c_max : integer := 832;
  variable mem_addr : integer range 0 to c_max - 1;
begin
  if (i_reset = '1') then
    mem_addr := 0;
    i2c_mlx_wea <= "0";
    i2c_mlx_addra <= (others => '0');
    i2c_mlx_dina <= (others => '0');
    i2c_mlx_addra <= (others => '0');
    i2c_mlx_dina <= (others => '0');
    temp1 <= '0';
    temp2 <= '0';
--  elsif (rising_edge (melexis_mlx90640_i2c_mode2_ready)) then
  elsif (rising_edge (clock_i)) then
    temp1 <= melexis_mlx90640_i2c_mode2_ready;
    --temp2 <= temp1;
    if (temp1 = '0' and melexis_mlx90640_i2c_mode2_ready = '1' and melexis_mlx90640_i2c_mode2 = '1') then
      i2c_mlx_wea <= "1";
      i2c_mlx_ena <= '1';
      if (melexis_mlx90640_i2c_memory_address = x"2400") then
        i2c_mlx_addra <= std_logic_vector (to_unsigned (mem_addr + 0, 11));
      end if;
      if (melexis_mlx90640_i2c_memory_address = x"0400") then
        i2c_mlx_addra <= std_logic_vector (to_unsigned (mem_addr + 832, 11));
      end if;
      i2c_mlx_dina <= melexis_mlx90640_i2c_bytes_to_recv;
      if (mem_addr = c_max - 1) then
        mem_addr := 0;
      else
        mem_addr := mem_addr + 1;
      end if;
    end if;
    if (temp1 = '1' and melexis_mlx90640_i2c_mode2_ready = '0' and melexis_mlx90640_i2c_mode2 = '1') then
      i2c_mlx_wea <= "0";
      i2c_mlx_ena <= '0';
    end if;
  end if;
end process p100;

pTo : process (clock_i,i_reset) is
	variable i : integer range 0 to PIXELS-1;
	variable state : states;
  constant c_some_wait : integer := 2**20;
  variable some_wait : integer range 0 to c_some_wait-1;
  --synthesis translate_off
  variable first : boolean := false;
  --synthesis translate_on
  variable tout_t : std_logic_vector (15 downto 0);
  variable tout_r : std_logic_vector (8 downto 0);
  variable camera_read : std_logic_vector (15 downto 0);
  variable cold_start : integer range 0 to c_cold_start - 1;
--  constant c_cold_start : integer := 1_000_000 * 100; -- 10ms * 100
  variable wait2 : integer range 0 to c_wait2 - 1;
  variable wait3 : integer range 0 to c_wait3 - 1;
begin
		if (i_reset = '1') then
			state := idle;
      wait1 <= 0;
      cold_start := 0;
      wait2 := 0;
      camera_read := (others => '0');
			float2fixedsclr <= '1';
			i := 0;
			dualmem_ena <= '0';
			if (c_calculate_type1 = "c_raws_images") then
        tout_r := (others => '0');
      end if;
      if (c_calculate_type1 = "c_temperature") then
        tout_t := (others => '0');
      end if;
      some_wait := 0;
      melexis_mlx90640_i2c_mode0 <= '0';
      melexis_mlx90640_i2c_mode1 <= '0';
      melexis_mlx90640_i2c_mode2 <= '0';
      melexis_mlx90640_i2c_enable <= '0';
      melexis_mlx90640_i2c_memory_address <= x"0000";
      melexis_mlx90640_i2c_memory_data <= x"0000";
		elsif (rising_edge (clock_i)) then
      t_state <= state;
			case (state) is
      
        when idle =>
          state := wr1;
--          if (cold_start = c_cold_start - 1) then
--            state := wr1;
----            state := w1;
--            cold_start := 0;
--          else
--            cold_start := cold_start + 1;
--          end if;

        when wr1 =>
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '1'; -- w800d/r1901
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"800d";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
--              if (camera_read = x"1981") then
                state := idle0;
                wait2 := 0;
--              else
--                state := stop;
--              end if;
              wait1 <= 0;
          end if;
          else
            wait1 <= wait1 + 1;
         end if;
        when idle0 =>
          if (wait2 = c_wait2 - 1) then
            state := w1;
--            state := idle;
            wait2 := 0;
          else
            wait2 := wait2 + 1;
          end if;
        when w1 =>
          melexis_mlx90640_i2c_mode0 <= '1'; -- w800d1981
          melexis_mlx90640_i2c_mode1 <= '0';
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"800d";
          melexis_mlx90640_i2c_memory_data <= x"1981";
--          melexis_mlx90640_i2c_memory_data <= x"1234";
--          melexis_mlx90640_i2c_memory_data <= x"4321";
--          melexis_mlx90640_i2c_memory_data <= x"0000";
--          melexis_mlx90640_i2c_memory_data <= x"ffff";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              wait1 <= 0;
              wait2 := 0;
              state := idle1;
          end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle1 =>
          if (wait3 = c_wait3 - 1) then
            state := wr2;
--            state := idle;
            wait3 := 0;
          else
            wait3 := wait3 + 1;
          end if;
		  
		  
        when wr2 =>
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '1';-- w800d/r1981
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"800d";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state := idle2;
              wait1 <= 0;
            end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle2 =>
          if (wait3 = c_wait3 - 1) then
            state := wr1a;
            wait3 := 0;
          else
            wait3 := wait3 + 1;
          end if;

        when wr1a =>
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '1'; -- w800d/r1901
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"800d";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
--              if (camera_read = x"1981") then
                state := idle0a;
                wait2 := 0;
--              else
--                state := stop;
--              end if;
              wait1 <= 0;
          end if;
          else
            wait1 <= wait1 + 1;
         end if;
        when idle0a =>
          if (wait2 = c_wait2 - 1) then
            state := w1a;
--            state := idle;
            wait2 := 0;
          else
            wait2 := wait2 + 1;
          end if;
        when w1a =>
          melexis_mlx90640_i2c_mode0 <= '1'; -- w800d1981
          melexis_mlx90640_i2c_mode1 <= '0';
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"800d";
          melexis_mlx90640_i2c_memory_data <= x"1981";
--          melexis_mlx90640_i2c_memory_data <= x"1234";
--          melexis_mlx90640_i2c_memory_data <= x"4321";
--          melexis_mlx90640_i2c_memory_data <= x"0000";
--          melexis_mlx90640_i2c_memory_data <= x"ffff";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              wait1 <= 0;
              wait2 := 0;
              state := idle1a;
          end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle1a =>
          if (wait3 = c_wait3 - 1) then
            state := wr2a;
--            state := idle;
            wait3 := 0;
          else
            wait3 := wait3 + 1;
          end if;
        when wr2a =>
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '1';-- w800d/r1981
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"800d";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state := idle2a;
              wait1 <= 0;
            end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle2a =>
          if (wait3 = c_wait3 - 1) then
            state := r1;
            wait3 := 0;
          else
            wait3 := wait3+ 1;
          end if;

        when r1 =>
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '0';
          melexis_mlx90640_i2c_mode2 <= '1';-- w2400/rN
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"2400";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state := idle3;
              wait1 <= 0;
            end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle3 => ------------------
          if (wait2 = c_wait2 - 1) then
            state := wr1a1;
            wait2 := 0;
          else
            wait2 := wait2 + 1;
          end if;
---------------------------
        when wr1a1 =>
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '1'; -- w8000/r0008
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"8000";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
--              if (camera_read = x"1981") then
                state := idle0a1;
                wait2 := 0;
--              else
--                state := stop;
--              end if;
              wait1 <= 0;
          end if;
          else
            wait1 <= wait1 + 1;
         end if;
        when idle0a1 =>
          if (wait2 = c_wait2 - 1) then
            state := w1a1;
--            state := idle;
            wait2 := 0;
          else
            wait2 := wait2 + 1;
          end if;
        when w1a1 =>
          melexis_mlx90640_i2c_mode0 <= '1'; -- w80000030
          melexis_mlx90640_i2c_mode1 <= '0';
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"8000";
          melexis_mlx90640_i2c_memory_data <= x"0030";
--          melexis_mlx90640_i2c_memory_data <= x"1234";
--          melexis_mlx90640_i2c_memory_data <= x"4321";
--          melexis_mlx90640_i2c_memory_data <= x"0000";
--          melexis_mlx90640_i2c_memory_data <= x"ffff";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              wait1 <= 0;
              wait2 := 0;
              state := idle1a1;
          end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle1a1 =>
          if (wait3 = c_wait3 - 1) then
            state := wr2a1;
--            state := idle;
            wait3 := 0;
          else
            wait3 := wait3 + 1;
          end if;
        when wr2a1 =>
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '1';-- w8000r0010
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"8000";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state := idle2a1;
              wait1 <= 0;
            end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle2a1 =>
          if (wait3 = c_wait3 - 1) then
            state := r2;
            wait3 := 0;
          else
            wait3 := wait3+ 1;
          end if;
-----------------------------
        when r2 =>
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '0';
          melexis_mlx90640_i2c_mode2 <= '1';-- w0400/rN
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"0400";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state := idle4;
              wait1 <= 0;
            end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle4 =>
          if (wait2 = c_wait2 - 1) then
            state := r14;
            wait2 := 0;
          else
            wait2 := wait2 + 1;
          end if;

        when r14 => state := s1;
		wait2 := 0;
		wait3 := 0;
		wait1 <= 0;
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '0';
          melexis_mlx90640_i2c_mode2 <= '0';-- w0400/rN
          melexis_mlx90640_i2c_enable <= '0';
          melexis_mlx90640_i2c_memory_address <= x"0000";
		            melexis_mlx90640_i2c_memory_data <= x"0000";

					test_fixed_melexis_run <= '1';
          float2fixedsclr <= '0';
				when s1 =>
					test_fixed_melexis_run <= '0';
					if (test_fixed_melexis_rdy = '1') then
						state := s2;
					else
						state := s1;
					end if;
				when s2 => state := s3;
					float2fixedsclr <= '0';
					i := 0;
          if (c_calculate_type1 = "c_raws_images") then
            tout_r := (others => '0');
          end if;
          if (c_calculate_type1 = "c_temperature") then
            tout_t := (others => '0');
          end if;
				when s3 => state := s4;
				when s4 => state := s5;
          --synthesis translate_off
          first := true;
					--synthesis translate_on
          test_fixed_melexis_addr <= std_logic_vector (to_unsigned (i, 10));
				when s5 => state := s6;
				when s6 => state := s7;
					float2fixedond <= '1';
					float2fixedce <= '1';
					float2fixeda <= test_fixed_melexis_do;
				when s7 =>
					if (float2fixedrdy = '1') then state := s8;
--						tout := "00000000000000000000000"&float2fixedr (36 downto 28) ; -- 35 29
--						tout := "00000000000000000000000"&float2fixedr (34 downto 26) ; -- 35 29
--						tout := "0000000000"&float2fixedr (35 downto 14); -- 35 29
            if (c_calculate_type1 = "c_raws_images") then
              tout_r := float2fixedr_r;
            end if;
            if (c_calculate_type1 = "c_temperature") then
              tout_t := float2fixedr_t;
            end if;
						float2fixedond <= '0';
						float2fixedce <= '0';
						float2fixedsclr <= '1';
					else state := s7; end if;
				when s8 => state := s9;
					float2fixedsclr <= '0';
					dualmem_wea <= "1";
					dualmem_addra <= std_logic_vector (to_unsigned (i, 10));
          if (c_calculate_type1 = "c_raws_images") then
            dualmem_dina_r <= tout_r;
          end if;
          if (c_calculate_type1 = "c_temperature") then
            dualmem_dina_t <= tout_t;
          end if;
					dualmem_ena <= '1';
          --synthesis translate_off
          if (first = true) then
            if (c_calculate_type1 = "c_raws_images") then
              report_error_sfixed (9, 7, "================ Fixed out "&integer'image(i), tout_r, 0.0);
            end if;
            if (c_calculate_type1 = "c_temperature") then
              report_error_sfixed (6, 8, "================ Fixed out "&integer'image(i), tout_t, 0.0);
            end if;
            first := false;
          end if;
          --synthesis translate_on
				when s9 =>
					dualmem_wea <= "0";
					dualmem_ena <= '0';
					if (i = PIXELS-1) then
						i := 0;
						state := s10;
					else
						state := s4;
						i := i + 1;
					end if;
				when s10 =>
          state := idle;
--          state := idle3;
        when others => null;
			end case;
		end if;
end process pTo;

dualmem_enb <= not address_generator_activeh;

pvgaclk : process (clock_i,i_reset) is
--	constant CMAX : integer := 1; -- 50/25 - nexys2
	constant CMAX : integer := 2; -- 100/25 - ml402
	variable vmax : integer range 0 to CMAX-1;
begin
		if (i_reset = '1') then
			vgaclk25 <= '0';
			vmax := 0;
		elsif (rising_edge (clock_i)) then
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

test_fixed_melexis_clock <= clock_i;
test_fixed_melexis_reset <= i_reset;
--test_fixed_melexis_addr <= address_generator_address;
melexis_mlx9064x_core_inst : melexis_mlx9064x
generic map (
c_device => c_device,
c_calculate_type => c_calculate_type1,
c_use_fisqrt => c_use_fisqrt1
)
port map (
i_clock => test_fixed_melexis_clock,
i_reset => test_fixed_melexis_reset,
i_run => test_fixed_melexis_run,
i2c_mem_ena => i2c_mem_ena_1,
i2c_mem_addra => i2c_mlx_addrb,
i2c_mem_douta => i2c_mlx_doutb,
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

address_generator_clk <= vgaclk25;
address_generator_reset <= i_reset;
address_generator_vsync <= not VGA_timing_synch_Vsync;
address_generator_activeh <= VGA_timing_synch_blank;
vag_inst : vga_address_generator
port map(
i_clock => address_generator_clk,
i_reset => address_generator_reset,
i_vga_blank => address_generator_activeh,
i_vga_v_blank => address_generator_vsync,
o_vga_address => address_generator_address
);

VGA_timing_synch_vgaclk25 <= vgaclk25;
vga_clock <= VGA_timing_synch_vgaclk25;
vga_hsync <= VGA_timing_synch_Hsync;
vga_vsync <= VGA_timing_synch_Vsync;
VGA_timing_synch_reset <= i_reset;
vts_inst : vga_timing
port map (
i_clock   => VGA_timing_synch_vgaclk25,
i_reset   => VGA_timing_synch_reset,
o_hsync   => VGA_timing_synch_Hsync,
o_vsync   => VGA_timing_synch_Vsync,
o_blank   => VGA_timing_synch_blank,
o_v_blank => VGA_timing_synch_V_Blank,
o_h_blank => open
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

--constant c_calculate_type1 : string (1 to 13) := "c_raws_images"; -- c_temperature,c_raws_images
--constant c_use_fisqrt1 : string (1 to 3) := "xxx" -- yes/no - depend from c_calculate_type1(c_temperature)

g0_1 : if (c_calculate_type1 = "c_raws_images") generate
cm <= dualmem_doutb_r (8 downto 0);
end generate g0_1;
g0_2 : if (c_calculate_type1 = "c_temperature") generate
--cm <= dualmem_doutb_t (12 downto 12) & '0' & dualmem_doutb_t (11 downto 5);
cm <= dualmem_doutb_t (13 downto 5);
end generate g0_2;
rdata <= colormap_rom (to_integer (signed (cm))); -- xxx i don't know, problem with dualmem module ?
--rdata <= colormap_rom (to_integer (unsigned (dualmem2_doutb (8 downto 0)))); -- xxx i don't know, problem with dualmem module ?

vga_r <= rdata (23-3 downto 16)&"000" when VGA_timing_synch_blank = '0' else (others => '0');
vga_g <= rdata (15-3 downto 8)&"000" when VGA_timing_synch_blank = '0' else (others => '0');
vga_b <= rdata (7-3 downto 0)&"000" when VGA_timing_synch_blank = '0' else (others => '0');

--synthesis translate_off
g0_mem_temperature : if (c_calculate_type1 = "c_temperature") generate
test_to_clka <= clock_i;
test_to_ena <= '1';
uut_test_to_i1 : tb_data_calculateTo
PORT MAP (
clka => test_to_clka, 
ena => test_to_ena,
addra => test_to_addra,
douta => test_to_douta
);
end generate g0_mem_temperature;
--synthesis translate_on

float2fixedclk <= clock_i;
g0_fl2fi_temperature : if (c_calculate_type1 = "c_temperature") generate
inst_float2fixed_t : float2fixed_temperature PORT MAP (
a => float2fixeda,
operation_nd => float2fixedond,
clk => float2fixedclk,
sclr => float2fixedsclr,
ce => float2fixedce,
result => float2fixedr_t,
rdy => float2fixedrdy
);
end generate g0_fl2fi_temperature;
g1_fl2fi_raw_image : if (c_calculate_type1 = "c_raws_images") generate
inst_float2fixed_r : float2fixed_rawimg PORT MAP (
a => float2fixeda,
operation_nd => float2fixedond,
clk => float2fixedclk,
sclr => float2fixedsclr,
ce => float2fixedce,
result => float2fixedr_r,
rdy => float2fixedrdy
);
end generate g1_fl2fi_raw_image;

dualmem_clka <= clock_i;
dualmem_clkb <= agclk;
dualmem_addrb <= address_generator_address;
g0_dualmem_temperature : if (c_calculate_type1 = "c_temperature") generate
dualmem_inst_t : dualmem_temperature PORT MAP (
clka => dualmem_clka,
ena => dualmem_ena,
wea => dualmem_wea,
addra => dualmem_addra,
dina => dualmem_dina_t,
clkb => dualmem_clkb,
enb => dualmem_enb,
addrb => dualmem_addrb,
doutb => dualmem_doutb_t
);
end generate g0_dualmem_temperature;
g1_dualmem_rawimg : if (c_calculate_type1 = "c_raws_images") generate
dualmem_inst_r : dualmem_rawimg PORT MAP (
clka => dualmem_clka,
ena => dualmem_ena,
wea => dualmem_wea,
addra => dualmem_addra,
dina => dualmem_dina_r,
clkb => dualmem_clkb,
enb => dualmem_enb,
addrb => dualmem_addrb,
doutb => dualmem_doutb_r
);
end generate g1_dualmem_rawimg;

fixed2floatclk <= clock_i;
addfpclk <= clock_i;
subfpclk <= clock_i;
mulfpclk <= clock_i;
divfpclk <= clock_i;
g0_sqrtfp2_clk : if (c_use_fisqrt1 /= "yes") generate
sqrtfp2clk <= clock_i;
end generate g0_sqrtfp2_clk;

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

g_calculate_to : if (c_calculate_type1 = "c_temperature" and c_use_fisqrt1 /= "yes") generate

inst_sqrtfp2 : sqrtfp2
PORT MAP (
a => sqrtfp2a,
operation_nd => sqrtfp2ond,
clk => sqrtfp2clk,
sclr => sqrtfp2sclr,
ce => sqrtfp2ce,
result => sqrtfp2r,
rdy => sqrtfp2rdy
);

end generate g_calculate_to;

--melexis_mlx90640_i2c_clock <= clock_i;
--io_scl <= melexis_mlx90640_i2c_scl;
--io_sda <= melexis_mlx90640_i2c_sda;
--melexis_mlx90640_i2c_sda <= io_sda;
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
io_scl => scl_i
);

io_sda_nl <= '0' when sda_o = '0' else 'Z';
sda_i <= io_sda_nl;
io_scl_nl <= '0' when scl_i = '0' else 'Z';
--io_sda_dd <= '0' when sda_i = '0' else 'Z';
--io_scl_dd <= '0' when scl_i = '0' else 'Z';
--io_sda_nl <= '0' when sda_i = '0' else 'Z';
--io_scl_nl <= '0' when scl_i = '0' else 'Z';
--io_sda_dd <= '0' when sda_i = '0' else 'Z';
--io_scl_dd <= '0' when scl_i = '0' else 'Z';
--io_sda_nl <= '0' when io_sda_dd = '0' else 'Z';
--io_scl_nl <= '0' when io_scl_dd = '0' else 'Z';
--io_sda_dd <= sda_i;
--io_scl_dd <= scl_i;
--io_sda_nl <= io_sda_dd;
--io_scl_nl <= io_scl_dd;

clock_IBUFG_inst : IBUFG
generic map (
CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" 
IOSTANDARD => "DEFAULT")
port map (
O => clock_i, -- Clock buffer output
I => i_clock  -- Clock buffer input (connect directly to top-level port)
);
--reset_BUFG_inst : BUFG
--port map (
--O => reset_i,     -- Clock buffer output
--I => i_reset      -- Clock buffer input
--);

--io_sda <= clock_i;
--io_scl <= asd1;

i2c_mlx_clka <= test_fixed_melexis_clock;
i2c_mlx_clkb <= test_fixed_melexis_clock;
i2c_mlx_enb <= i2c_mem_ena_1;
i2c_mlx_i0 : i2c_mlx
PORT MAP (
clka => i2c_mlx_clka,
ena => i2c_mlx_ena,
wea => i2c_mlx_wea,
addra => i2c_mlx_addra,
dina => i2c_mlx_dina,
clkb => i2c_mlx_clkb,
enb => i2c_mlx_enb,
addrb => i2c_mlx_addrb,
doutb => i2c_mlx_doutb
);

end Behavioral;

