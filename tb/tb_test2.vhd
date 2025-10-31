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
--USE ieee.numeric_std.ALL;

--use work.global_package_sim.all;

ENTITY tb_test2 IS
END tb_test2;

ARCHITECTURE behavior OF tb_test2 IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT test2
--generic (
--  constant c_board_clock : integer := 100_000_000;
--  constant c_bus_clock : integer := 1_000_000;
----  constant c_bus_clock : integer := 400_000;
----  constant c_bus_clock : integer := 10;
--  constant c_sim : string (1 to 1) := "y";
--  constant c_cold_start : integer := 1000;
--  constant c_wait2 : integer := 4000
--);
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
io_scl_dd : inout STD_LOGIC := 'Z';
io_sda_dd : inout STD_LOGIC := 'Z';
io_scl_nl : inout STD_LOGIC := 'Z';
io_sda_nl : inout STD_LOGIC := 'Z';
o_camera_read : out std_logic_vector (15 downto 0);
o_ready,o_ready_all : out std_logic
);
END COMPONENT;

COMPONENT i2c_stream
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_scl : IN  std_logic;
o_sda : OUT  std_logic := 'Z';
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
signal o_sda : std_logic := 'Z';
signal o_done : std_logic;

signal a,a_prev,b,b_prev : std_logic;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';

--Outputs
signal io_sda_dd : std_logic := 'Z';
signal io_scl_dd : std_logic := 'Z';
signal io_sda_nl : std_logic := 'Z';
signal io_scl_nl : std_logic := 'Z';
signal o_ready : std_logic;
signal o_ready_all : std_logic;
signal o_camera_read : std_logic_vector (15 downto 0);

-- Clock period definitions
constant i_clock_period : time := 20 ns; -- nexys2
--constant i_clock_period : time := 10 ns; -- ml402

signal s_spattern : std_logic_vector (15 downto 0);

constant number_frames_to_catch : integer := 100;
signal number_frame : integer := 0;
signal video_clock_mux : std_logic_vector(number_frames_to_catch-1 downto 0) := (others => '0');
signal video_blank_mux : std_logic_vector(number_frames_to_catch-1 downto 0) := (others => '0');
signal video_hsync_mux : std_logic_vector(number_frames_to_catch-1 downto 0) := (others => '0');
signal video_vsync_mux : std_logic_vector(number_frames_to_catch-1 downto 0) := (others => '0');
signal video_clock : std_logic;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: test2 PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
io_scl_dd => io_scl_dd,
io_sda_dd => io_sda_dd,
io_scl_nl => io_scl_nl,
io_sda_nl => io_sda_nl,
o_camera_read => o_camera_read,
o_ready => o_ready,
o_ready_all => o_ready_all
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
--wait for 34 ms;
--wait for 1000 ms;
--wait for 15.776ms * 10;
--wait for 1 ms;
--wait for 610 us;
--report "tb done" severity failure;
wait;
end process;

a <= '1' when io_scl_nl = 'Z' else '0';

i2c_stream_i0 : i2c_stream PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_scl => a,
o_sda => io_sda_nl,
i_mode2 => i_mode2,
i_enable => i_enable,
i_addr => i_addr,
o_done => o_done,
compare1 => compare1
);

p0 : process is
begin
--  wait for 653 us; -- wait on scl idle before mode2 1000k
--  wait for 869 us; -- wait on scl idle before mode2 1000k
--  wait for 878 us; -- wait on scl idle before mode2 1000k
--  wait for 974 us; -- wait on scl idle before mode2 500k
--  wait for 1281 us; -- wait on scl idle before mode2 500k
--  wait for 2015 us; -- wait on scl idle before mode2 500k
--  wait for 3655 us; -- wait on scl idle before mode2 100k
wait for 1 us;
  i_addr <= x"2400"; -- eeprom
  i_enable <= '1';
  compare1 <= 37;
  wait until o_done = '1';
  i_enable <= '0';
  wait until o_done = '0';
  wait for 1 us;
--  wait for 324 us;
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
  compare1 <= 36; -- first frame poorly
  wait until o_done = '1';
  i_enable <= '0';
  wait until o_done = '0';
  i_addr <= x"0000"; -- data X end
--  wait for 36 us;

  l0 : for i in 0 to number_frames_to_catch-1 loop
  i_addr <= x"0400"; -- data X
  i_enable <= '1';
  compare1 <= 36; -- first frame poorly
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
--  wait for 36 us;
  end loop l0;
  wait;
end process p0;

--mode2_read : process is
---- https://github.com/ghdl/ghdl/blob/69b0c75d726f6c5babe46eddbcb82f7269422821/testsuite/gna/issue1597/std_subs_pkg.vhdl#L23
--function klsfr(bv: std_logic_vector) return std_logic_vector is
--    alias v : std_logic_vector(bv'high downto 0) is bv;
--    variable rtn : std_logic_vector(bv'high downto 0);
--    variable len : integer := bv'length;
--  begin
--    for i in bv'range loop
--      if (bv(i) /= '1' and
--         bv(i) /= '0') then
--        report "klsfr got a none logic value passed ..." severity failure;
--      end if;
--    end loop;
--  
--    case len is
--      when 8 =>
--        rtn := v(6 downto 0) & ((v(7) xor v(4)) xor (v(1) xor v(2)));
--      when 16 =>
--        rtn := v(14 downto 0) & ((v(15) xor v(14)) xor (v(12) xor v(3)));
--      when 32 =>
--        rtn := v(30 downto 0) & ((v(31) xor v(6)) xor (v(5) xor v(1)));
--      when others =>
--        report "ERROR: LSFR size not implemented ..." severity failure;
--    end case;
--    return rtn;
--  end function;
--  variable pattern : std_logic_vector (15 downto 0) := x"0001";
--begin
--  s_spattern <= pattern;
--wait;
----  wait for 46.775 us + 0.96 us;
--  wait for 46.765 us;
--  io_sda_nl <= 'Z';
----  pattern := x"1981";
----  pattern := x"1234";
--  pattern := x"4321"; s_spattern <= pattern;
----  pattern := x"0000";
----  pattern := x"ffff";
----  pattern := x"2222";
--  io_sda_nl <= pattern (15); wait for 0.96 us;
--  io_sda_nl <= pattern (14); wait for 0.96 us;
--  io_sda_nl <= pattern (13); wait for 0.96 us;
--  io_sda_nl <= pattern (12); wait for 0.96 us;
--  io_sda_nl <= pattern (11); wait for 0.96 us;
--  io_sda_nl <= pattern (10); wait for 0.96 us;
--  io_sda_nl <= pattern (9); wait for 0.96 us;
--  io_sda_nl <= pattern (8); wait for 0.96 us;
--  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack  
--  io_sda_nl <= pattern (7); wait for 0.96 us;
--  io_sda_nl <= pattern (6); wait for 0.96 us;
--  io_sda_nl <= pattern (5); wait for 0.96 us;
--  io_sda_nl <= pattern (4); wait for 0.96 us;
--  io_sda_nl <= pattern (3); wait for 0.96 us;
--  io_sda_nl <= pattern (2); wait for 0.96 us;
--  io_sda_nl <= pattern (1); wait for 0.96 us;
--  io_sda_nl <= pattern (0); wait for 0.96 us;
--  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
--
--  wait for 102.72 us - 0.96 us;
--  io_sda_nl <= 'Z';
--  pattern := x"1981"; s_spattern <= pattern;
----  pattern := x"3333";
--  io_sda_nl <= pattern (15); wait for 0.96 us;
--  io_sda_nl <= pattern (14); wait for 0.96 us;
--  io_sda_nl <= pattern (13); wait for 0.96 us;
--  io_sda_nl <= pattern (12); wait for 0.96 us;
--  io_sda_nl <= pattern (11); wait for 0.96 us;
--  io_sda_nl <= pattern (10); wait for 0.96 us;
--  io_sda_nl <= pattern (9); wait for 0.96 us;
--  io_sda_nl <= pattern (8); wait for 0.96 us;
--  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack  
--  io_sda_nl <= pattern (7); wait for 0.96 us;
--  io_sda_nl <= pattern (6); wait for 0.96 us;
--  io_sda_nl <= pattern (5); wait for 0.96 us;
--  io_sda_nl <= pattern (4); wait for 0.96 us;
--  io_sda_nl <= pattern (3); wait for 0.96 us;
--  io_sda_nl <= pattern (2); wait for 0.96 us;
--  io_sda_nl <= pattern (1); wait for 0.96 us;
--  io_sda_nl <= pattern (0); wait for 0.96 us;
--  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
--
--  wait for 46.57 us + 0.48 us - 0.96 us;
--  io_sda_nl <= 'Z';
--  for i in 0 to 830 loop
--  pattern := klsfr (pattern); s_spattern <= pattern;
--  s_spattern <= pattern;
--  io_sda_nl <= pattern (15); wait for 0.96 us;
--  io_sda_nl <= pattern (14); wait for 0.96 us;
--  io_sda_nl <= pattern (13); wait for 0.96 us;
--  io_sda_nl <= pattern (12); wait for 0.96 us;
--  io_sda_nl <= pattern (11); wait for 0.96 us;
--  io_sda_nl <= pattern (10); wait for 0.96 us;
--  io_sda_nl <= pattern (9); wait for 0.96 us;
--  io_sda_nl <= pattern (8); wait for 0.96 us;
--  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
--  io_sda_nl <= pattern (7); wait for 0.96 us;
--  io_sda_nl <= pattern (6); wait for 0.96 us;
--  io_sda_nl <= pattern (5); wait for 0.96 us;
--  io_sda_nl <= pattern (4); wait for 0.96 us;
--  io_sda_nl <= pattern (3); wait for 0.96 us;
--  io_sda_nl <= pattern (2); wait for 0.96 us;
--  io_sda_nl <= pattern (1); wait for 0.96 us;
--  io_sda_nl <= pattern (0); wait for 0.96 us;  
--  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
----  wait for 0.96 us;
--  end loop;
--  io_sda_nl <= 'Z'; -- rest Z
--  
----  wait for 108.96 us + 3*0.96 us;
----  io_sda_nl <= 'Z';
----  pattern := x"1981"; s_spattern <= pattern;
------  pattern := x"4444";
----  io_sda_nl <= pattern (15); wait for 0.96 us;
----  io_sda_nl <= pattern (14); wait for 0.96 us;
----  io_sda_nl <= pattern (13); wait for 0.96 us;
----  io_sda_nl <= pattern (12); wait for 0.96 us;
----  io_sda_nl <= pattern (11); wait for 0.96 us;
----  io_sda_nl <= pattern (10); wait for 0.96 us;
----  io_sda_nl <= pattern (9); wait for 0.96 us;
----  io_sda_nl <= pattern (8); wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack  
----  io_sda_nl <= pattern (7); wait for 0.96 us;
----  io_sda_nl <= pattern (6); wait for 0.96 us;
----  io_sda_nl <= pattern (5); wait for 0.96 us;
----  io_sda_nl <= pattern (4); wait for 0.96 us;
----  io_sda_nl <= pattern (3); wait for 0.96 us;
----  io_sda_nl <= pattern (2); wait for 0.96 us;
----  io_sda_nl <= pattern (1); wait for 0.96 us;
----  io_sda_nl <= pattern (0); wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
--
----  wait for 108.96 us + 3*0.96 us;
----  io_sda_nl <= 'Z';
----  pattern := x"1901"; s_spattern <= pattern;
------  pattern := x"5555";
----  io_sda_nl <= pattern (15); wait for 0.96 us;
----  io_sda_nl <= pattern (14); wait for 0.96 us;
----  io_sda_nl <= pattern (13); wait for 0.96 us;
----  io_sda_nl <= pattern (12); wait for 0.96 us;
----  io_sda_nl <= pattern (11); wait for 0.96 us;
----  io_sda_nl <= pattern (10); wait for 0.96 us;
----  io_sda_nl <= pattern (9); wait for 0.96 us;
----  io_sda_nl <= pattern (8); wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack  
----  io_sda_nl <= pattern (7); wait for 0.96 us;
----  io_sda_nl <= pattern (6); wait for 0.96 us;
----  io_sda_nl <= pattern (5); wait for 0.96 us;
----  io_sda_nl <= pattern (4); wait for 0.96 us;
----  io_sda_nl <= pattern (3); wait for 0.96 us;
----  io_sda_nl <= pattern (2); wait for 0.96 us;
----  io_sda_nl <= pattern (1); wait for 0.96 us;
----  io_sda_nl <= pattern (0); wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
--
----  wait for 35.52 us;
----wait;
--
----  wait for 2443.00 us; -- c1
----  wait for 2440.12 us; -- c1
----  wait until o_ready_all = '0';
----  wait for 102156.215 us;
----  wait for 42.28 us; -- c1
----  wait for 42.52 us; -- c1
----  wait for 42.76 us; -- c1
----  wait for 42.52 us; -- c1
----  wait for 59.80 us; -- c1
----  wait for 80.44 us; -- c1
----  wait for 79.96 us; -- c1
----  wait for 2443.24 us; -- c0
----wait for 2156.135 us; -- off pr
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;  
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
----
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;
----  io_sda_nl <= '1'; wait for 0.96 us;  
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
----
----  io_sda_nl <= pattern (15); wait for 0.96 us;
----  io_sda_nl <= pattern (14); wait for 0.96 us;
----  io_sda_nl <= pattern (13); wait for 0.96 us;
----  io_sda_nl <= pattern (12); wait for 0.96 us;
----  io_sda_nl <= pattern (11); wait for 0.96 us;
----  io_sda_nl <= pattern (10); wait for 0.96 us;
----  io_sda_nl <= pattern (9); wait for 0.96 us;
----  io_sda_nl <= pattern (8); wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
----  io_sda_nl <= pattern (7); wait for 0.96 us;
----  io_sda_nl <= pattern (6); wait for 0.96 us;
----  io_sda_nl <= pattern (5); wait for 0.96 us;
----  io_sda_nl <= pattern (4); wait for 0.96 us;
----  io_sda_nl <= pattern (3); wait for 0.96 us;
----  io_sda_nl <= pattern (2); wait for 0.96 us;
----  io_sda_nl <= pattern (1); wait for 0.96 us;
----  io_sda_nl <= pattern (0); wait for 0.96 us;  
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
--  
----  
----  pattern := x"ffff";
----  io_sda_nl <= pattern (0); wait for 0.96 us;
----  io_sda_nl <= pattern (1); wait for 0.96 us;
----  io_sda_nl <= pattern (2); wait for 0.96 us;
----  io_sda_nl <= pattern (3); wait for 0.96 us;
----  io_sda_nl <= pattern (4); wait for 0.96 us;
----  io_sda_nl <= pattern (5); wait for 0.96 us;
----  io_sda_nl <= pattern (6); wait for 0.96 us;
----  io_sda_nl <= pattern (7); wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack  
----  io_sda_nl <= pattern (8); wait for 0.96 us;
----  io_sda_nl <= pattern (9); wait for 0.96 us;
----  io_sda_nl <= pattern (10); wait for 0.96 us;
----  io_sda_nl <= pattern (11); wait for 0.96 us;
----  io_sda_nl <= pattern (12); wait for 0.96 us;
----  io_sda_nl <= pattern (13); wait for 0.96 us;
----  io_sda_nl <= pattern (14); wait for 0.96 us;
----  io_sda_nl <= pattern (15); wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack  
----    pattern := x"ffff";
----  io_sda_nl <= pattern (0); wait for 0.96 us;
----  io_sda_nl <= pattern (1); wait for 0.96 us;
----  io_sda_nl <= pattern (2); wait for 0.96 us;
----  io_sda_nl <= pattern (3); wait for 0.96 us;
----  io_sda_nl <= pattern (4); wait for 0.96 us;
----  io_sda_nl <= pattern (5); wait for 0.96 us;
----  io_sda_nl <= pattern (6); wait for 0.96 us;
----  io_sda_nl <= pattern (7); wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack  
----  io_sda_nl <= pattern (8); wait for 0.96 us;
----  io_sda_nl <= pattern (9); wait for 0.96 us;
----  io_sda_nl <= pattern (10); wait for 0.96 us;
----  io_sda_nl <= pattern (11); wait for 0.96 us;
----  io_sda_nl <= pattern (12); wait for 0.96 us;
----  io_sda_nl <= pattern (13); wait for 0.96 us;
----  io_sda_nl <= pattern (14); wait for 0.96 us;
----  io_sda_nl <= pattern (15); wait for 0.96 us;
----  io_sda_nl <= 'Z'; wait for 0.96 us; -- ack
--
----  wait for 233721.575 us;
----  wait for 10000 us;
--wait;
----  report "done" severity failure;
--end process mode2_read;

END;
