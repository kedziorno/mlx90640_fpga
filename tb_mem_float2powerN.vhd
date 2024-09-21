--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:35:37 01/18/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_mem_float2powerN.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem_float2powerN
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

ENTITY tb_mem_float2powerN IS
END tb_mem_float2powerN;

ARCHITECTURE behavior OF tb_mem_float2powerN IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT mem_float2powerN
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_N : IN  std_logic_vector(5 downto 0);
o_2powerN : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_N : std_logic_vector(5 downto 0) := (others => '0');

--Outputs
signal o_2powerN : std_logic_vector(31 downto 0);

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: mem_float2powerN PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_N => i_N,
o_2powerN => o_2powerN
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
i_N <= std_logic_vector (to_unsigned (3, 6)); wait for i_clock_period*10;
i_N <= std_logic_vector (to_unsigned (19, 6)); wait for i_clock_period*10;
i_N <= std_logic_vector (to_unsigned (28, 6)); wait for i_clock_period*10;
i_N <= std_logic_vector (to_unsigned (37, 6)); wait for i_clock_period*10;
i_N <= std_logic_vector (to_unsigned (46, 6)); wait for i_clock_period*10;
i_N <= std_logic_vector (to_unsigned (55, 6)); wait for i_clock_period*10;
i_N <= std_logic_vector (to_unsigned (63, 6)); wait for i_clock_period*10;
i_N <= std_logic_vector (to_unsigned (64, 6)); wait for i_clock_period*10;
i_N <= std_logic_vector (to_unsigned (65, 6)); wait for i_clock_period*10;
report "tb done" severity failure;
end process;

END;
