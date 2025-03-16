-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   16:13:29 01/19/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_mem_switchpattern
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Testbench
--                Test chess pattern mode
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    global_package.vhd
--  - Modules: -
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules: 
--    - Processes (Architecture: tb):
--      p_clock_process, p_tb
--
-- Important objects:
--  - c_mem_type - c_type_lut, c_type_rom1, c_type_rom2
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos: -
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones: -
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE ieee.numeric_std.ALL;

use work.global_package.all;

ENTITY tb_mem_switchpattern IS
END tb_mem_switchpattern;

ARCHITECTURE tb OF tb_mem_switchpattern IS

COMPONENT mem_switchpattern
GENERIC (
constant c_mem_type : integer := c_type_lut
);
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_pixel : IN  std_logic_vector(9 downto 0);
o_pattern : OUT  std_logic
);
END COMPONENT mem_switchpattern;

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
mem_switchpattern_uut : mem_switchpattern PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_pixel => i_pixel,
o_pattern => o_pattern
);

-- Clock process definitions
p_clock_process : process
begin
i_clock <= '0';
wait for i_clock_period/2;
i_clock <= '1';
wait for i_clock_period/2;
end process p_clock_process;

-- Stimulus process
p_tb : process
begin
-- hold reset state for 100 ns.
i_reset <= '1';
wait for 100 ns;
i_reset <= '0';
--wait for i_clock_period*10;
-- insert stimulus here
-- XXX chess pattern, todo heck this test for all mem types
-- OK
i_pixel <= std_logic_vector (to_unsigned (367, 10)); wait for i_clock_period*10; assert o_pattern /= '1' report "fail 367" severity note;
i_pixel <= std_logic_vector (to_unsigned (368, 10)); wait for i_clock_period*10; assert o_pattern /= '0' report "fail 368" severity note;
i_pixel <= std_logic_vector (to_unsigned (369, 10)); wait for i_clock_period*10; assert o_pattern /= '1' report "fail 369" severity note;
i_pixel <= std_logic_vector (to_unsigned (370, 10)); wait for i_clock_period*10; assert o_pattern /= '0' report "fail 370" severity note;
i_pixel <= std_logic_vector (to_unsigned (1, 10)); wait for i_clock_period*10; assert o_pattern /= '0' report "fail 1" severity note;
i_pixel <= std_logic_vector (to_unsigned (2, 10)); wait for i_clock_period*10; assert o_pattern /= '1' report "fail 2" severity note;
i_pixel <= std_logic_vector (to_unsigned (3, 10)); wait for i_clock_period*10; assert o_pattern /= '0' report "fail 3" severity note;
i_pixel <= std_logic_vector (to_unsigned (4, 10)); wait for i_clock_period*10; assert o_pattern /= '1' report "fail 4" severity note;
i_pixel <= std_logic_vector (to_unsigned (5, 10)); wait for i_clock_period*10; assert o_pattern /= '0' report "fail 5" severity note;
i_pixel <= std_logic_vector (to_unsigned (6, 10)); wait for i_clock_period*10; assert o_pattern /= '1' report "fail 6" severity note;
i_pixel <= std_logic_vector (to_unsigned (7, 10)); wait for i_clock_period*10; assert o_pattern /= '0' report "fail 7" severity note;
i_pixel <= std_logic_vector (to_unsigned (8, 10)); wait for i_clock_period*10; assert o_pattern /= '1' report "fail 8" severity note;
i_pixel <= std_logic_vector (to_unsigned (1, 10)); wait for i_clock_period*10; assert o_pattern /= '0' report "fail 1" severity note;
i_pixel <= std_logic_vector (to_unsigned (2, 10)); wait for i_clock_period*10; assert o_pattern /= '1' report "fail 2" severity note;
i_pixel <= std_logic_vector (to_unsigned (767, 10)); wait for i_clock_period*10; assert o_pattern /= '1' report "fail 767" severity note;
i_pixel <= std_logic_vector (to_unsigned (768, 10)); wait for i_clock_period*10; assert o_pattern /= '0' report "fail 768" severity note;
-- FAIL
i_pixel <= std_logic_vector (to_unsigned (449, 10)); wait for i_clock_period*10; assert o_pattern /= '1' report "fail 449" severity note;
i_pixel <= std_logic_vector (to_unsigned (450, 10)); wait for i_clock_period*10; assert o_pattern /= '0' report "fail 450" severity note;
i_pixel <= std_logic_vector (to_unsigned (451, 10)); wait for i_clock_period*10; assert o_pattern /= '1' report "fail 451" severity note;
--for i in 1 to 1024 loop
--	i_pixel <= std_logic_vector (to_unsigned (i, 10)); wait for i_clock_period*10;
--end loop;
report "done tb" severity failure;
end process p_tb;

end architecture tb;

