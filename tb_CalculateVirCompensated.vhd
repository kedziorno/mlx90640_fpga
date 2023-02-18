--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:33:32 02/17/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_CalculateVirCompensated.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CalculateVirCompensated
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

USE work.p_fphdl_package3.all;

ENTITY tb_CalculateVirCompensated IS
END tb_CalculateVirCompensated;

ARCHITECTURE behavior OF tb_CalculateVirCompensated IS 

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT CalculateVirCompensated
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i_Emissivity : IN  std_logic_vector(31 downto 0);
i_pixoscpsp0 : IN  std_logic_vector(31 downto 0);
i_pixoscpsp1 : IN  std_logic_vector(31 downto 0);
i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);
i_pixos_do : IN  std_logic_vector(31 downto 0);
o_pixos_addr : OUT  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);
o_rdy : OUT  std_logic
);
END COMPONENT;

--Inputs
signal CalculateVirCompensated_clock : std_logic := '0';
signal CalculateVirCompensated_reset : std_logic := '0';
signal CalculateVirCompensated_run : std_logic := '0';
signal CalculateVirCompensated_Emissivity : std_logic_vector(31 downto 0) := x"3f800000"; -- 1
signal CalculateVirCompensated_pixoscpsp0 : std_logic_vector(31 downto 0) := x"41CD5551"; -- 25.6666575059956
signal CalculateVirCompensated_pixoscpsp1 : std_logic_vector(31 downto 0) := x"41AD0D7D"; -- 21.6315865670509
signal CalculateVirCompensated_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateVirCompensated_pixos_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateVirCompensated_addr : std_logic_vector(9 downto 0) := (others => '0');

--Outputs
signal CalculateVirCompensated_i2c_mem_ena : std_logic;
signal CalculateVirCompensated_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateVirCompensated_pixos_addr : std_logic_vector(9 downto 0);
signal CalculateVirCompensated_do : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_rdy : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (CalculateVirCompensated_do); -- output data

-- Instantiate the Unit Under Test (UUT)
uut: CalculateVirCompensated PORT MAP (
i_clock => CalculateVirCompensated_clock,
i_reset => CalculateVirCompensated_reset,
i_run => CalculateVirCompensated_run,
i_Emissivity => CalculateVirCompensated_Emissivity,
i_pixoscpsp0 => CalculateVirCompensated_pixoscpsp0,
i_pixoscpsp1 => CalculateVirCompensated_pixoscpsp1,
i2c_mem_ena => CalculateVirCompensated_i2c_mem_ena,
i2c_mem_addra => CalculateVirCompensated_i2c_mem_addra,
i2c_mem_douta => CalculateVirCompensated_i2c_mem_douta,
i_pixos_do => CalculateVirCompensated_pixos_do,
o_pixos_addr => CalculateVirCompensated_pixos_addr,
o_do => CalculateVirCompensated_do,
i_addr => CalculateVirCompensated_addr,
o_rdy => CalculateVirCompensated_rdy
);

-- Clock process definitions
i_clock_process :process
begin
CalculateVirCompensated_clock <= '0';
wait for i_clock_period/2;
CalculateVirCompensated_clock <= '1';
wait for i_clock_period/2;
end process;

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
CalculateVirCompensated_reset <= '1';
wait for 100 ns;
CalculateVirCompensated_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
CalculateVirCompensated_run <= '1'; wait for i_clock_period; CalculateVirCompensated_run <= '0';
wait until CalculateVirCompensated_rdy = '1';
for i in 0 to 1024 loop
	CalculateVirCompensated_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps;
report "done" severity failure;
end process stim_proc;

END ARCHITECTURE behavior;
