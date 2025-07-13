--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:11:33 03/08/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_vts.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: VGA_timing_synch
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

ENTITY tb_vts IS
END tb_vts;

ARCHITECTURE behavior OF tb_vts IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT VGA_timing_synch
PORT(
reset : IN  std_logic;
vgaclk25 : IN  std_logic;
Hsync : OUT  std_logic;
Vsync : OUT  std_logic;
activeArea1 : OUT  std_logic;
activehaaddrgen : OUT  std_logic;
activeRender1 : OUT  std_logic;
blank : OUT  std_logic
);
END COMPONENT;

--Inputs
signal reset : std_logic := '0';
signal vgaclk25 : std_logic := '0';

--Outputs
signal Hsync : std_logic;
signal Vsync : std_logic;
signal activeArea1 : std_logic;
signal activehaaddrgen : std_logic;
signal activeRender1 : std_logic;
signal blank : std_logic;
-- No clocks detected in port list. Replace clock below with 
-- appropriate port name 

signal clock : std_logic;
constant clock_period : time := 39.7219464 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: VGA_timing_synch PORT MAP (
reset => reset,
vgaclk25 => vgaclk25,
Hsync => Hsync,
Vsync => Vsync,
activeArea1 => activeArea1,
activehaaddrgen => activehaaddrgen,
activeRender1 => activeRender1,
blank => blank
);

-- Clock process definitions
clock_process :process
begin
clock <= '0';
wait for clock_period/2;
clock <= '1';
wait for clock_period/2;
end process;

vgaclk25 <= clock;
-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
reset <= '1';
wait for 100 ns;
reset <= '0';
wait for clock_period*10;
-- insert stimulus here
wait for 17 ms;
report "tb done" severity failure;
end process;

END;
