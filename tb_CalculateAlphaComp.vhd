--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:36:12 02/18/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_CalculateAlphaComp.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CalculateAlphaComp
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

ENTITY tb_CalculateAlphaComp IS
END tb_CalculateAlphaComp;

ARCHITECTURE behavior OF tb_CalculateAlphaComp IS 

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT CalculateAlphaComp
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);
i_Ta : IN  std_logic_vector(31 downto 0);
i_Ta0 : IN  std_logic_vector(31 downto 0);
i_acpsubpage0 : IN  std_logic_vector(31 downto 0);
i_acpsubpage1 : IN  std_logic_vector(31 downto 0);
i_tgc : IN  std_logic_vector(31 downto 0);
i_const1 : IN  std_logic_vector(31 downto 0);
i_alpha_do : IN  std_logic_vector(31 downto 0);
o_alpha_addr : OUT  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);
o_rdy : OUT  std_logic
);
END COMPONENT;

--Inputs
signal CalculateAlphaComp_clock : std_logic := '0';
signal CalculateAlphaComp_reset : std_logic := '0';
signal CalculateAlphaComp_run : std_logic := '0';
signal CalculateAlphaComp_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateAlphaComp_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_Ta0 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage0 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage1 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_tgc : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_const1 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_alpha_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_addr : std_logic_vector(9 downto 0) := (others => '0');

--Outputs
signal CalculateAlphaComp_i2c_mem_ena : std_logic;
signal CalculateAlphaComp_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateAlphaComp_alpha_addr : std_logic_vector(9 downto 0);
signal CalculateAlphaComp_do : std_logic_vector(31 downto 0);
signal CalculateAlphaComp_rdy : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: CalculateAlphaComp PORT MAP (
i_clock => CalculateAlphaComp_clock,
i_reset => CalculateAlphaComp_reset,
i_run => CalculateAlphaComp_run,
i2c_mem_ena => CalculateAlphaComp_i2c_mem_ena,
i2c_mem_addra => CalculateAlphaComp_i2c_mem_addra,
i2c_mem_douta => CalculateAlphaComp_i2c_mem_douta,
i_Ta => CalculateAlphaComp_Ta,
i_Ta0 => CalculateAlphaComp_Ta0,
i_acpsubpage0 => CalculateAlphaComp_acpsubpage0,
i_acpsubpage1 => CalculateAlphaComp_acpsubpage1,
i_tgc => CalculateAlphaComp_tgc,
i_const1 => CalculateAlphaComp_const1,
i_alpha_do => CalculateAlphaComp_alpha_do,
o_alpha_addr => CalculateAlphaComp_alpha_addr,
o_do => CalculateAlphaComp_do,
i_addr => CalculateAlphaComp_addr,
o_rdy => CalculateAlphaComp_rdy
);

-- Clock process definitions
i_clock_process :process
begin
CalculateAlphaComp_clock <= '0';
wait for i_clock_period/2;
CalculateAlphaComp_clock <= '1';
wait for i_clock_period/2;
end process;


-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
CalculateAlphaComp_reset <= '1';
wait for 100 ns;
CalculateAlphaComp_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
CalculateAlphaComp_Ta <= x"421CBC6A"; -- 39.184
CalculateAlphaComp_Ta0 <= x"41C80000"; -- 25
CalculateAlphaComp_acpsubpage0 <= x"4082629A"; -- 4.07453626394272
CalculateAlphaComp_acpsubpage1 <= x"4076826B"; -- 3.85171006200835
CalculateAlphaComp_tgc <= x"3f800000"; -- 1
CalculateAlphaComp_const1 <= x"3f800000"; -- 1
wait for i_clock_period;
CalculateAlphaComp_run <= '1'; wait for i_clock_period; CalculateAlphaComp_run <= '0';
wait until CalculateAlphaComp_rdy = '1';
for i in 0 to 1024 loop
	CalculateAlphaComp_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps;
report "done" severity failure;
end process;

END;
