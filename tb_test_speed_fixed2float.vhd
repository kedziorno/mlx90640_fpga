--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:01:16 06/20/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_test_speed_fixed2float.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test_speed_fixed2float
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

library ieee_proposed;
--use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.numeric_std_additions.all;
--use ieee_proposed.standard_additions.all;
--use ieee_proposed.standard_textio_additions.all;
--use ieee_proposed.std_logic_1164_additions.all;

use work.p_fphdl_package2.all;
use work.p_fphdl_package3.all;

ENTITY tb_test_speed_fixed2float IS
END tb_test_speed_fixed2float;

ARCHITECTURE behavior OF tb_test_speed_fixed2float IS

constant width_fi : integer := fiexp+fifra;
constant width_fl : integer := flexp+flfra;

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT test_speed_fixed2float
generic (
constant width_fi : integer := width_fi;
constant width_fl : integer := width_fl
);
PORT(
a : IN  std_logic_vector(width_fi-1 downto 0);
operation_nd : IN  std_logic;
clk : IN  std_logic;
sclr : IN  std_logic;
ce : IN  std_logic;
result : OUT  std_logic_vector(width_fl-1 downto 0);
rdy : OUT  std_logic
);
END COMPONENT;

--Inputs
signal a : std_logic_vector(width_fi-1 downto 0) := (others => '0');
signal operation_nd : std_logic := '0';
signal clk : std_logic := '0';
signal sclr : std_logic := '0';
signal ce : std_logic := '0';

--Outputs
signal result : std_logic_vector(width_fl-1 downto 0);
signal rdy : std_logic;

-- Clock period definitions
constant clk_period : time := 10 ns;

signal outr : real;

BEGIN

outr <= ap_slv2fpem (flexp,flfra,result);

-- Instantiate the Unit Under Test (UUT)
uut: test_speed_fixed2float PORT MAP (
a => a,
operation_nd => operation_nd,
clk => clk,
sclr => sclr,
ce => ce,
result => result,
rdy => rdy
);

-- Clock process definitions
clk_process :process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
sclr <= '1';
wait for 100 ns;	
sclr <= '0';
wait for clk_period*10;
-- insert stimulus here
ce <= '1'; 
operation_nd <= '1';
--a <= "0"&"111000000010000"&"00011111100"; --  28688.123046875 ~  28688.1234
--a <= "1"&"000111111101111"&"11100000011"; -- -28688.123046875 ~ -28688.1234

--a <= "1"&"000111111101111"&"11100000011"; -- -28688.123046875 ~ -28688.1234
a <= "11111111111111111111111000000010000"&"00011111100101110010010001110"; -- -28688.123046875 ~ -28688.1234
--wait until rdy = '1';
wait for 300 ns;
report_errorem (flexp,flfra,"result :",result,0.0);
--report_fixed_value ("a : ", to_sfixed (a, width_fi-1, 0));
report "done" severity failure;
end process;

END;
