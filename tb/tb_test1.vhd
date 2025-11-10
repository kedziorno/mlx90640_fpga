--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:40:10 03/04/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_test1.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test1
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

use work.bmp_pkg.all;
--use work.global_package.all;

ENTITY tb_test1 IS
END tb_test1;

ARCHITECTURE behavior OF tb_test1 IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT test1
generic (
--constant c_board_clock : integer := c_clock_board_frequency;
----constant c_bus_clock : integer := c_clock_i2c_frequency;
--constant c_bus_clock : integer := 1_000_000;
----constant c_bus_clock : integer := 446_000; -- 447_000 - X signals in TB Post-Route SIM
----constant c_bus_clock : integer := 50;
----constant c_bus_clock : integer := 1;
constant c_sim : string (1 to 1) := "n";
--constant c_lcd : string (1 to 1) := "n";
--constant c_cold_start : integer := 1000;
--constant c_wait2 : integer := 1000;
--constant c_wait3 : integer := 10000;
--constant c_device : string (1 to 8) := "mlx90640"; -- mlx90640 (32x24),mlx90641 (16x12)
--constant c_calculate_type1 : string (1 to 13) := "c_temperature"; -- c_temperature,c_raws_images
--constant c_use_fisqrt1 : string (1 to 3) := " no" -- yes/no - depend from c_calculate_type(c_temperature)
constant zero : integer := 0
);
PORT(
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
o_an : out std_logic_vector (3 downto 0);
o_seg : out std_logic_vector (6 downto 0);
o_led : out std_logic_vector (7 downto 0);
o_data : out std_logic_vector (15 downto 0);
o_ready : out std_logic
);
END COMPONENT;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';

--Outputs
signal vga_hsync : std_logic;
signal vga_vsync : std_logic;
signal vga_clock : std_logic;
signal vga_syncn : std_logic;
signal vga_blankn : std_logic;
signal vga_psave : std_logic;
signal io_sda_dd : std_logic := 'Z';
signal io_scl_dd : std_logic := 'Z';
signal io_sda_dd1 : std_logic := 'Z';
signal io_scl_dd1 : std_logic := 'Z';
signal io_sda_nl : std_logic := 'Z';
signal io_scl_nl : std_logic := 'Z';
signal vga_r : std_logic_vector(7 downto 0);
signal vga_g : std_logic_vector(7 downto 0);
signal vga_b : std_logic_vector(7 downto 0);

-- Clock period definitions
--constant i_clock_period : time := 20 ns; -- nexys2
constant i_clock_period : time := 10 ns; -- ml402
--constant i_clock_period : time := 40 ns; -- 25

component vga_bmp_sink is
generic (
FILENAME        : string
);
port (
clk_i           : in    std_logic;
rst_i           : in    std_logic;
dat_i           : in    std_logic_vector(23 downto 0);
active_vid_i    : in    std_logic;
h_sync_i        : in    std_logic;
v_sync_i        : in    std_logic

);
end component vga_bmp_sink;

signal s_spattern : std_logic_vector (31 downto 0);

--constant c_period : time := 2.24 us; -- 10 ns
constant c_period : time := 1.92 us; -- 20 ns

COMPONENT i2c_stream
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_scl : IN  std_logic;
o_sda : OUT  std_logic;
o_done : OUT  std_logic;
i_mode2 : IN  std_logic;
i_enable : IN  std_logic;
i_addr : IN  std_logic_vector(15 downto 0);
compare1 : in integer
);
END COMPONENT;

--Inputs
signal i_scl : std_logic := '0';
signal i_mode2 : std_logic := '0';
signal i_enable : std_logic := '0';
signal i_addr : std_logic_vector(15 downto 0) := (others => '0');
signal compare1 : integer;

--Outputs
signal o_sda : std_logic;
signal o_done : std_logic;

signal a,a_prev,b,b_prev : std_logic;

--COMPONENT tb_i2c_mem
--PORT (
--clka : IN STD_LOGIC;
--ena : IN STD_LOGIC;
--wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
--);
--END COMPONENT;
--signal tb_i2c_mem_clka : STD_LOGIC;
--signal tb_i2c_mem_ena : STD_LOGIC;
--signal tb_i2c_mem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
--signal tb_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
--signal tb_i2c_mem_dina : STD_LOGIC_VECTOR(7 DOWNTO 0);
--signal tb_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);

constant number_frames_to_catch : integer := 100;
signal number_frame : integer := 0;
signal video_clock_mux : std_logic_vector(number_frames_to_catch-1 downto 0) := (others => '0');
signal video_blank_mux : std_logic_vector(number_frames_to_catch-1 downto 0) := (others => '0');
signal video_hsync_mux : std_logic_vector(number_frames_to_catch-1 downto 0) := (others => '0');
signal video_vsync_mux : std_logic_vector(number_frames_to_catch-1 downto 0) := (others => '0');
signal video_clock : std_logic;

constant video_clock_period   : time := 39.80099502487 ns; -- industrial clock 25.175MHz
-- constant video_clock_period   : time := 40 ns; -- normal clock 25Mhz

signal video_data : std_logic_vector(23 downto 0);

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: test1 PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
vga_hsync => vga_hsync,
vga_vsync => vga_vsync,
vga_clock => vga_clock,
vga_r => vga_r,
vga_g => vga_g,
vga_b => vga_b,
vga_syncn => vga_syncn,
vga_blankn => vga_blankn,
vga_psave => vga_psave,
io_sda_dd => io_sda_dd,
io_scl_dd => io_scl_dd,
io_sda_dd1 => io_sda_dd1,
io_scl_dd1 => io_scl_dd1,
io_sda_nl => io_sda_nl,
io_scl_nl => io_scl_nl
);

-- Clock process definitions
i_clock_process :process
begin
i_clock <= '0';
wait for i_clock_period/2;
i_clock <= '1';
wait for i_clock_period/2;
end process;

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
i_reset <= '1';
wait for 100 ns;
i_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
wait;
--wait for 34 ms;
--wait for 45 ms; -- 51 ms;
--wait for 15.776ms * 10;
--wait for 1 ms;
--wait for 610 us;
report "tb done" severity failure;
end process;

--vga_bmp : entity work.vga_bmp_sink
--generic map ( FILENAME => "vga.bmp" )
--port map (
--clk_i           => vga_clock,
--dat_i           =>
--vga_r &
--vga_g &
--vga_b ,
--active_vid_i    => not vga_blankn,
--h_sync_i        => vga_hsync,
--v_sync_i        => vga_vsync
--);

p0 : process is
begin
  wait for 653 us; -- wait on scl idle before mode2 1000k
--  wait for 869 us; -- wait on scl idle before mode2 1000k
--  wait for 878 us; -- wait on scl idle before mode2 1000k
--  wait for 1282 us; -- wait on scl idle before mode2 1000k -- pr
--  wait for 1950 us; -- wait on scl idle before mode2 1000k -- pr
--  wait for 1304 us; -- wait on scl idle before mode2 1000k -- pr
--  wait for 974 us; -- wait on scl idle before mode2 500k
--  wait for 1281 us; -- wait on scl idle before mode2 500k
--  wait for 2015 us; -- wait on scl idle before mode2 500k
--  wait for 3655 us; -- wait on scl idle before mode2 100k
  i_addr <= x"2400"; -- eeprom
  i_enable <= '1';
  compare1 <= 37;
  wait until o_done = '1';
  i_enable <= '0';
  wait until o_done = '0';
  wait for 324 us;
--  i_enable <= '1';
--  i_addr <= x"0000"; -- eeprom stop
--  i_enable <= '0';
  
--  wait for 268 us; -- 1000k
--  wait for 450 us; -- 500k
--  wait for 221 us; -- 500k
--  wait for 530 us; -- 500k
--  wait for 327 us; -- 500k
--  wait for 1742 us; -- 100k
--  i_addr <= x"0400"; -- data 1
--  i_enable <= '1';
--  compare1 <= 38;
--  wait until o_done = '1';
--  i_enable <= '0';
--  wait until o_done = '0';
--  i_addr <= x"0000"; -- data 1 end
----  wait for 268 us; -- 1000k - s1
----  wait for 327 us; -- 1000k - s1
----  wait for 430 us; -- 500k
----  wait for 529 us; -- 500k
----  wait for 1352 us; -- 100k

i_addr <= x"0400"; -- data X
  i_enable <= '1';
  compare1 <= 37; -- first frame poorly
  wait until o_done = '1';
  i_enable <= '0';
  wait until o_done = '0';
  i_addr <= x"0000"; -- data X end
  wait for 36 us;

  l0 : for i in 0 to number_frames_to_catch-1 loop
  i_addr <= x"0400"; -- data X
  i_enable <= '1';
  compare1 <= 37; -- first frame poorly
  wait until o_done = '1';
  i_enable <= '0';
  wait until o_done = '0';
  i_addr <= x"0000"; -- data X end
--  wait for 12656 us; -- 1000k - s1
--  wait for 430 us; -- 500k
--  wait for 529 us; -- 500k
--  wait for 324 us; -- 500k
--  wait for 327 us; -- 500k
--  wait for 23.93184 ms; -- 500k
--  wait for 1352 us; -- 100k
  wait for 36 us;
  end loop l0;
  wait;
end process p0;

a <= '1' when io_scl_dd1 = 'Z' else '0';

i2c_stream_i0 : i2c_stream PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_scl => a,
o_sda => io_sda_dd1,
i_mode2 => i_mode2,
i_enable => i_enable,
i_addr => i_addr,
o_done => o_done,
compare1 => compare1
);

--tb_i2c_mem_i0 : tb_i2c_mem
--PORT map (
--clka => tb_i2c_mem_clka,
--ena => tb_i2c_mem_ena,
--wea => tb_i2c_mem_wea,
--addra => tb_i2c_mem_addra,
--dina => tb_i2c_mem_dina,
--douta => tb_i2c_mem_douta
--);

p_vb_mux : process (i_clock) is
begin
if (falling_edge (i_clock)) then
video_blank_mux (number_frame) <= vga_blankn;
end if;
end process p_vb_mux;

p_write_bmps : process (vga_vsync) is
begin
if (falling_edge (vga_vsync)) then
if (number_frame = number_frames_to_catch - 1) then
number_frame <= 0;
report "tb done" severity failure;
else
number_frame <= number_frame + 1;
end if;
end if;
end process p_write_bmps;

g_write_bmps : for number_frame in 0 to number_frames_to_catch - 1 generate
vga_bmp : component vga_bmp_sink
generic map (
filename => "vga" & integer'image (number_frame) & ".bmp"
)
port map (
clk_i        => vga_clock,
rst_i        => i_reset,
dat_i        => vga_r & vga_g & vga_b,
active_vid_i => not video_blank_mux (number_frame),
h_sync_i     => vga_hsync,
v_sync_i     => vga_vsync
);
end generate g_write_bmps;

END;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_test1a IS
END tb_test1a;

architecture tb1 of tb_test1a is
--constant c_period : time := 2.24 us; -- 10 ns
constant c_period : time := 1.92 us; -- 20 ns
constant c1 : string (1 to 1) := "N";
signal io_sda_nl, io_scl_nl : std_logic;
signal s_spattern : std_logic_vector (15 downto 0);
begin

g0 : if (c1 = "Y") generate
mode2_read : process is
-- https://github.com/ghdl/ghdl/blob/69b0c75d726f6c5babe46eddbcb82f7269422821/testsuite/gna/issue1597/std_subs_pkg.vhdl#L23
function klsfr(bv: std_logic_vector) return std_logic_vector is
    alias v : std_logic_vector(bv'high downto 0) is bv;
    variable rtn : std_logic_vector(bv'high downto 0);
    variable len : integer := bv'length;
  begin
    for i in bv'range loop
      if (bv(i) /= '1' and
         bv(i) /= '0') then
        report "klsfr got a none logic value passed ..." severity failure;
      end if;
    end loop;
  
    case len is
      when 8 =>
        rtn := v(6 downto 0) & ((v(7) xor v(4)) xor (v(1) xor v(2)));
      when 16 =>
        rtn := v(14 downto 0) & ((v(15) xor v(14)) xor (v(12) xor v(3)));
      when 32 =>
        rtn := v(30 downto 0) & ((v(31) xor v(6)) xor (v(5) xor v(1)));
      when others =>
        report "ERROR: LSFR size not implemented ..." severity failure;
    end case;
    return rtn;
  end function;
  variable pattern : std_logic_vector (31 downto 0) := x"00000001";
begin
  io_sda_nl <= 'Z';
wait;
  wait for 1536.330 us;
  eeprom : for i in 0 to 832/2 loop
  pattern := klsfr (pattern); s_spattern <= pattern;
  s_spattern <= pattern;
  io_sda_nl <= pattern (31); wait for c_period;
  io_sda_nl <= pattern (30); wait for c_period;
  io_sda_nl <= pattern (29); wait for c_period;
  io_sda_nl <= pattern (28); wait for c_period;
  io_sda_nl <= pattern (27); wait for c_period;
  io_sda_nl <= pattern (26); wait for c_period;
  io_sda_nl <= pattern (25); wait for c_period;
  io_sda_nl <= pattern (24); wait for c_period;
  io_sda_nl <= 'Z'; wait for c_period; -- ack
  io_sda_nl <= pattern (23); wait for c_period;
  io_sda_nl <= pattern (22); wait for c_period;
  io_sda_nl <= pattern (21); wait for c_period;
  io_sda_nl <= pattern (20); wait for c_period;
  io_sda_nl <= pattern (19); wait for c_period;
  io_sda_nl <= pattern (18); wait for c_period;
  io_sda_nl <= pattern (17); wait for c_period;
  io_sda_nl <= pattern (16); wait for c_period;  
  io_sda_nl <= 'Z'; wait for c_period; -- ack
  io_sda_nl <= pattern (15); wait for c_period;
  io_sda_nl <= pattern (14); wait for c_period;
  io_sda_nl <= pattern (13); wait for c_period;
  io_sda_nl <= pattern (12); wait for c_period;
  io_sda_nl <= pattern (11); wait for c_period;
  io_sda_nl <= pattern (10); wait for c_period;
  io_sda_nl <= pattern (9); wait for c_period;
  io_sda_nl <= pattern (8); wait for c_period;
  io_sda_nl <= 'Z'; wait for c_period; -- ack  
  io_sda_nl <= pattern (7); wait for c_period;
  io_sda_nl <= pattern (6); wait for c_period;
  io_sda_nl <= pattern (5); wait for c_period;
  io_sda_nl <= pattern (4); wait for c_period;
  io_sda_nl <= pattern (3); wait for c_period;
  io_sda_nl <= pattern (2); wait for c_period;
  io_sda_nl <= pattern (1); wait for c_period;
  io_sda_nl <= pattern (0); wait for c_period;
  io_sda_nl <= 'Z'; wait for c_period; -- ack
  end loop eeprom;

  io_sda_nl <= 'Z';

  wait for 673.12 us - c_period;
  frame : for i in 0 to 832/2 loop
  pattern := klsfr (pattern); s_spattern <= pattern;
  s_spattern <= pattern;
  io_sda_nl <= pattern (31); wait for c_period;
  io_sda_nl <= pattern (30); wait for c_period;
  io_sda_nl <= pattern (29); wait for c_period;
  io_sda_nl <= pattern (28); wait for c_period;
  io_sda_nl <= pattern (27); wait for c_period;
  io_sda_nl <= pattern (26); wait for c_period;
  io_sda_nl <= pattern (25); wait for c_period;
  io_sda_nl <= pattern (24); wait for c_period;
  io_sda_nl <= 'Z'; wait for c_period; -- ack
  io_sda_nl <= pattern (23); wait for c_period;
  io_sda_nl <= pattern (22); wait for c_period;
  io_sda_nl <= pattern (21); wait for c_period;
  io_sda_nl <= pattern (20); wait for c_period;
  io_sda_nl <= pattern (19); wait for c_period;
  io_sda_nl <= pattern (18); wait for c_period;
  io_sda_nl <= pattern (17); wait for c_period;
  io_sda_nl <= pattern (16); wait for c_period;  
  io_sda_nl <= 'Z'; wait for c_period; -- ack
  io_sda_nl <= pattern (15); wait for c_period;
  io_sda_nl <= pattern (14); wait for c_period;
  io_sda_nl <= pattern (13); wait for c_period;
  io_sda_nl <= pattern (12); wait for c_period;
  io_sda_nl <= pattern (11); wait for c_period;
  io_sda_nl <= pattern (10); wait for c_period;
  io_sda_nl <= pattern (9); wait for c_period;
  io_sda_nl <= pattern (8); wait for c_period;
  io_sda_nl <= 'Z'; wait for c_period; -- ack  
  io_sda_nl <= pattern (7); wait for c_period;
  io_sda_nl <= pattern (6); wait for c_period;
  io_sda_nl <= pattern (5); wait for c_period;
  io_sda_nl <= pattern (4); wait for c_period;
  io_sda_nl <= pattern (3); wait for c_period;
  io_sda_nl <= pattern (2); wait for c_period;
  io_sda_nl <= pattern (1); wait for c_period;
  io_sda_nl <= pattern (0); wait for c_period;
  io_sda_nl <= 'Z'; wait for c_period; -- ack
  end loop frame;
  report "done" severity failure;
end process mode2_read;
end generate g0;

end architecture tb1;
