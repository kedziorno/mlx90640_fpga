--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:45:27 08/24/2024
-- Design Name:   
-- Module Name:   /home/user/workspace/kedziorno/mlx90640_fpga/tb_tfm_mock.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tfm_mock
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

use work.p_fphdl_package3.all;

ENTITY tb_tfm_mock IS
END tb_tfm_mock;

ARCHITECTURE behavior OF tb_tfm_mock IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT tfm_mock
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);
o_rdy : OUT  std_logic;
i_addr : IN  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_run : std_logic := '0';
signal i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal i_addr : std_logic_vector(9 downto 0) := (others => '0');

--Outputs
signal i2c_mem_ena : std_logic;
signal i2c_mem_addra : std_logic_vector(11 downto 0);
signal o_rdy : std_logic;
signal o_do : std_logic_vector(31 downto 0);

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal o : real := 0.0;

BEGIN

o <= ap_slv2fp (o_do);

-- Instantiate the Unit Under Test (UUT)
uut: tfm_mock PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
i2c_mem_ena => i2c_mem_ena,
i2c_mem_addra => i2c_mem_addra,
i2c_mem_douta => i2c_mem_douta,
o_rdy => o_rdy,
i_addr => i_addr,
o_do => o_do
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
i_run <= '1';
wait for i_clock_period*10;
i_run <= '0';
wait for i_clock_period*10;
-- insert stimulus here
for i in 0 to 767 loop
i_addr <= std_logic_vector (to_unsigned (i, 10));
wait for i_clock_period*10;
end loop;
report "tb done" severity failure;
wait;
end process;

END;
