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

ENTITY tb_test1 IS
END tb_test1;

ARCHITECTURE behavior OF tb_test1 IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT test1
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
vga_hsync : OUT  std_logic;
vga_vsync : OUT  std_logic;
vga_clock : OUT  std_logic;
vga_r : OUT  std_logic_vector(7 downto 0);
vga_g : OUT  std_logic_vector(7 downto 0);
vga_b : OUT  std_logic_vector(7 downto 0);
vga_syncn : out std_logic;
vga_blankn: out std_logic;
vga_psave: out std_logic
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
signal vga_r : std_logic_vector(7 downto 0);
signal vga_g : std_logic_vector(7 downto 0);
signal vga_b : std_logic_vector(7 downto 0);

-- Clock period definitions
constant i_clock_period : time := 10 ns;

component vga_bmp_sink is
generic (
FILENAME        : string
);
port (
clk_i           : in    std_logic;
dat_i           : in    std_logic_vector(23 downto 0);
active_vid_i    : in    std_logic;
h_sync_i        : in    std_logic;
v_sync_i        : in    std_logic

);
end component vga_bmp_sink;

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
vga_psave => vga_psave
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
wait for 34 ms;
report "tb done" severity failure;
end process;

vga_bmp : entity work.vga_bmp_sink
generic map ( FILENAME => "vga.bmp" )
port map (
clk_i           => vga_clock,
dat_i           => vga_r & vga_g & vga_b,
active_vid_i    => not vga_blankn,
h_sync_i        => vga_hsync,
v_sync_i        => vga_vsync
);

END;
