--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:28 01/29/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_calculateaccrows.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: calculateaccrows
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

ENTITY tb_calculateaccrows IS
END tb_calculateaccrows;

ARCHITECTURE behavior OF tb_calculateaccrows IS 

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT calculateaccrows
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_start0x2422 : IN  std_logic_vector(15 downto 0);
o_done : OUT  std_logic
);
END COMPONENT;


--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_start0x2422 : std_logic_vector(15 downto 0) := (others => '0');

--Outputs
signal o_done : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: calculateaccrows PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_start0x2422 => i_start0x2422,
o_done => o_done
);

-- Clock process definitions
i_clock_process :process
begin
i_clock <= '0';
wait for i_clock_period/2;
i_clock <= '1';
wait for i_clock_period/2;
end process;

i_reset <= '1', '0' after 100 ns ;	

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
i_start0x2422 <= x"abcd";
wait for 110 ns;
-- insert stimulus here
wait for i_clock_period*60;
report "done" severity failure;
end process;

END;
