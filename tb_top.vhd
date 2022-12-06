--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:03:00 12/06/2022
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_top.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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

ENTITY tb_top IS
END tb_top;

ARCHITECTURE behavior OF tb_top IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT top
PORT(
sda : IN  std_logic;
scl : IN  std_logic
);
END COMPONENT;


--Inputs
signal sda : std_logic := '1';
signal scl : std_logic := '1';

signal clock : std_logic := '0';
signal scl_clock : std_logic := '0';
constant clock_period : time := 10 ns;
constant scl_clock_period : time := clock_period / 4;

signal idle : std_logic := '0';
signal sda_data : std_logic := '0';

BEGIN

-- MLX90641 16x12 IR array
-- REVISION 3 - DECEMBER 9, 2019
-- 3901090641
-- page11 10.2.1.4. I2C command format

-- Instantiate the Unit Under Test (UUT)
uut: top PORT MAP (
sda => sda,
scl => scl
);

-- Clock process definitions
clock_process : process
begin
clock <= '0';
wait for clock_period/2;
clock <= '1';
wait for clock_period/2;
end process;

scl_clock_process : process
begin
scl_clock <= '1';
wait for scl_clock_period;
scl_clock <= '1';
wait for scl_clock_period;
scl_clock <= '0';
wait for scl_clock_period;
scl_clock <= '0';
wait for scl_clock_period;
end process;

scl <= scl_clock when idle = '0' else '1' when idle = '1';
sda <= sda_data when idle = '0' else '1' when idle = '1';

-- Stimulus process
stim_proc : process
begin

idle <= '1';
wait for 100 ns;
idle <= '0';

-- insert stimulus here
-- start
sda_data <= '1'; wait for scl_clock_period;
sda_data <= '0'; wait for 2*scl_clock_period;

-- 7bit address
sda_data <= '0'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
-- 1bit write
sda_data <= '0'; wait for clock_period;
-- 1bit ack
sda_data <= '0'; wait for clock_period;

-- 8bit data MSB
sda_data <= '1'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
-- 1bit ack
sda_data <= '0'; wait for clock_period;

-- 8bit data LSB
sda_data <= '1'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
-- 1bit ack
sda_data <= '0'; wait for clock_period;

-- 8bit data MSB
sda_data <= '0'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
-- 1bit ack
sda_data <= '0'; wait for clock_period;

-- 8bit data LSB
sda_data <= '0'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
sda_data <= '1'; wait for clock_period;
sda_data <= '0'; wait for clock_period;
-- 1bit ack
sda_data <= '0'; wait for clock_period;

-- stop
sda_data <= '0'; wait for 2*scl_clock_period;
sda_data <= '1'; wait for scl_clock_period;

idle <= '1';
wait for 100 ns;
idle <= '0';

report "done" severity failure;

end process;

END;
