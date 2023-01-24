--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:50:09 01/24/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractKsTaParameters.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractKsTaParameters
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

ENTITY tb_ExtractKsTaParameters IS
END tb_ExtractKsTaParameters;

ARCHITECTURE behavior OF tb_ExtractKsTaParameters IS 

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT ExtractKsTaParameters
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x243c : IN  std_logic_vector(15 downto 0);
o_ksta : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;


--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_ee0x243c : std_logic_vector(15 downto 0) := (others => '0');

--Outputs
signal o_ksta : std_logic_vector(31 downto 0);

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: ExtractKsTaParameters PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_ee0x243c => i_ee0x243c,
o_ksta => o_ksta
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
i_ee0x243c <= x"f020";
wait for i_clock_period;
i_ee0x243c <= x"bbbb";
wait for i_clock_period;
i_ee0x243c <= x"cccc";
wait for i_clock_period;
i_ee0x243c <= x"dede";
wait for i_clock_period;
i_ee0x243c <= x"fefe";
wait for i_clock_period;
report "done" severity failure;
end process;

END;
