--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:16:16 02/06/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_signed1024.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem_signed1024
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

ENTITY tb_signed1024 IS
END tb_signed1024;

ARCHITECTURE behavior OF tb_signed1024 IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT mem_signed1024
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_value : IN  std_logic_vector(9 downto 0);
o_value : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_value : std_logic_vector(9 downto 0) := (others => '0');

--Outputs
signal o_value : std_logic_vector(31 downto 0);

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: mem_signed1024 PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_value => i_value,
o_value => o_value
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
i_value <= std_logic_vector (to_signed (-1, 10)); wait for i_clock_period*10;
i_value <= std_logic_vector (to_unsigned (0, 10)); wait for i_clock_period*10;
i_value <= std_logic_vector (to_unsigned (1, 10)); wait for i_clock_period*10;

i_value <= std_logic_vector (to_unsigned (511, 10)); wait for i_clock_period*10;
i_value <= std_logic_vector (to_unsigned (512, 10)); wait for i_clock_period*10;
i_value <= std_logic_vector (to_unsigned (513, 10)); wait for i_clock_period*10;

i_value <= std_logic_vector (to_unsigned (1023, 10)); wait for i_clock_period*10;
i_value <= std_logic_vector (to_unsigned (1024, 10)); wait for i_clock_period*10;
i_value <= std_logic_vector (to_unsigned (1025, 10)); wait for i_clock_period*10;
report "done" severity failure;
end process;

END;
