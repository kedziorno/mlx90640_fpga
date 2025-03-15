--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:20:00 09/15/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_CalculateGetImage.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CalculateGetImage
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

USE work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY tb_CalculateGetImage IS
END tb_CalculateGetImage;

ARCHITECTURE behavior OF tb_CalculateGetImage IS

COMPONENT mulfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : STD_LOGIC;

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT CalculateGetImage
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i_vircompensated_do : IN  std_logic_vector(31 downto 0);
o_vircompensated_addr : OUT  std_logic_vector(9 downto 0);
i_alphacomp_do : IN  std_logic_vector(31 downto 0);
o_alphacomp_addr : OUT  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);
o_rdy : OUT  std_logic;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC

);
END COMPONENT;
signal CalculateGetImage_clock : std_logic := '0';
signal CalculateGetImage_reset : std_logic := '0';
signal CalculateGetImage_run : std_logic := '0';
signal CalculateGetImage_vircompensated_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateGetImage_vircompensated_addr : std_logic_vector(9 downto 0);
signal CalculateGetImage_alphacomp_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateGetImage_alphacomp_addr : std_logic_vector(9 downto 0);
signal CalculateGetImage_addr : std_logic_vector(9 downto 0) := (others => '0');
signal CalculateGetImage_do : std_logic_vector(31 downto 0);
signal CalculateGetImage_rdy : std_logic;

signal CalculateGetImage_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateGetImage_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateGetImage_mulfpond : STD_LOGIC;
signal CalculateGetImage_mulfpsclr : STD_LOGIC;
signal CalculateGetImage_mulfpce : STD_LOGIC;
signal CalculateGetImage_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateGetImage_mulfprdy : STD_LOGIC;

signal CalculateGetImage_mulfpclk : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (CalculateGetImage_do); -- output data

-- Instantiate the Unit Under Test (UUT)
uut: CalculateGetImage PORT MAP (
i_clock => CalculateGetImage_clock,
i_reset => CalculateGetImage_reset,
i_run => CalculateGetImage_run,
i_vircompensated_do => CalculateGetImage_vircompensated_do,
o_vircompensated_addr => CalculateGetImage_vircompensated_addr,
i_alphacomp_do => CalculateGetImage_alphacomp_do,
o_alphacomp_addr => CalculateGetImage_alphacomp_addr,
o_do => CalculateGetImage_do,
i_addr => CalculateGetImage_addr,
o_rdy => CalculateGetImage_rdy,

mulfpa => CalculateGetImage_mulfpa,
mulfpb => CalculateGetImage_mulfpb,
mulfpond => CalculateGetImage_mulfpond,
mulfpsclr => CalculateGetImage_mulfpsclr,
mulfpce => CalculateGetImage_mulfpce,
mulfpr => CalculateGetImage_mulfpr,
mulfprdy => CalculateGetImage_mulfprdy

);

-- Clock process definitions
i_clock_process :process
begin
CalculateGetImage_clock <= '0';
wait for i_clock_period/2;
CalculateGetImage_clock <= '1';
wait for i_clock_period/2;
end process;

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
CalculateGetImage_reset <= '1';
wait for 100 ns;
CalculateGetImage_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
CalculateGetImage_run <= '1'; wait for i_clock_period; CalculateGetImage_run <= '0';
wait until CalculateGetImage_rdy = '1';
for i in 0 to 1024 loop
	CalculateGetImage_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps;
report "done" severity failure;
end process;

CalculateGetImage_mulfpclk <= CalculateGetImage_clock;

inst_mulfp : mulfp
PORT MAP (
a => CalculateGetImage_mulfpa,
b => CalculateGetImage_mulfpb,
operation_nd => CalculateGetImage_mulfpond,
clk => CalculateGetImage_mulfpclk,
sclr => CalculateGetImage_mulfpsclr,
ce => CalculateGetImage_mulfpce,
result => CalculateGetImage_mulfpr,
rdy => CalculateGetImage_mulfprdy
);

END;
