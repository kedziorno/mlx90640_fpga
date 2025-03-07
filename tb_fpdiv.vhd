--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:36:27 03/07/2025
-- Design Name:   
-- Module Name:   /home/user/_WORKSPACE_/PyFloGen/test/tb_fpdiv.vhd
-- Project Name:  test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FloatingPointDivider
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

use work.p_fphdl_package3.all;

ENTITY tb_fpdiv IS
END tb_fpdiv;

ARCHITECTURE behavior OF tb_fpdiv IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT FloatingPointDivider
PORT(
clk : IN  std_logic;
ce_1 : IN  std_logic;
ce_2 : IN  std_logic;
ce_3 : IN  std_logic;
ce_4 : IN  std_logic;
ce_5 : IN  std_logic;
X : IN  std_logic_vector(33 downto 0);
Y : IN  std_logic_vector(33 downto 0);
R : OUT  std_logic_vector(33 downto 0)
);
END COMPONENT;

--Inputs
signal clk : std_logic := '0';
signal ce_1 : std_logic := '0';
signal ce_2 : std_logic := '0';
signal ce_3 : std_logic := '0';
signal ce_4 : std_logic := '0';
signal ce_5 : std_logic := '0';
signal X : std_logic_vector(33 downto 0) := (others => '0');
signal Y : std_logic_vector(33 downto 0) := (others => '0');

--Outputs
signal R : std_logic_vector(33 downto 0);

-- Clock period definitions
constant clk_period : time := 10 ns;

signal o_x, o_y, o_r : real;

BEGIN

o_x <= ap_slv2fp (X (31 downto 0));
o_y <= ap_slv2fp (Y (31 downto 0));
o_r <= ap_slv2fp (R (31 downto 0));

-- Instantiate the Unit Under Test (UUT)
uut: FloatingPointDivider PORT MAP (
clk => clk,
ce_1 => ce_1,
ce_2 => ce_2,
ce_3 => ce_3,
ce_4 => ce_4,
ce_5 => ce_5,
X => X,
Y => Y,
R => R
);

-- Clock process definitions
clk_process : process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;

-- Stimulus process
stim_proc : process
begin
-- hold reset state for 100 ns.
wait for 100 ns;
ce_1 <= '1';
ce_2 <= '1';
ce_3 <= '1';
ce_4 <= '1';
ce_5 <= '1';
wait for 100 ns;
-- insert stimulus here
X <= "11"&x"449a43f3"; -- 1234.1234
Y <= "11"&x"449a43f3"; -- 1234.1234
wait for clk_period*10;
assert (R (31 downto 0) = x"3f800000") report "failure" severity failure; -- 1.0
X <= "11"&x"c51293c1"; -- -2345.2345
Y <= "11"&x"4608f782"; -- 8765.8765
wait for clk_period*10;
assert (R (31 downto 0) = x"be88fb2e") report "failure" severity failure; -- -0.267541
report "tb done" severity failure;
wait;
end process;

END;
