--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:13:29 01/19/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_mem_switchpattern.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem_switchpattern
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

ENTITY tb_mem_switchpattern IS
END tb_mem_switchpattern;

ARCHITECTURE behavior OF tb_mem_switchpattern IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT mem_switchpattern
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_pixel : IN  std_logic_vector(9 downto 0);
o_pattern : OUT  std_logic
);
END COMPONENT;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_pixel : std_logic_vector(9 downto 0) := (others => '0');

--Outputs
signal o_pattern : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: mem_switchpattern PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_pixel => i_pixel,
o_pattern => o_pattern
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
i_pixel <= std_logic_vector (to_unsigned (367, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (368, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (369, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (370, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (1, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (2, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (3, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (4, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (5, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (6, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (7, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (8, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (1, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (2, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (767, 10)); wait for i_clock_period*10;
i_pixel <= std_logic_vector (to_unsigned (768, 10)); wait for i_clock_period*10;
--for i in 1 to 1024 loop
--	i_pixel <= std_logic_vector (to_unsigned (i, 10)); wait for i_clock_period*10;
--end loop;
report "done tb" severity failure;
end process;

END;
