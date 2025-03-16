-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   15:20:00 09/15/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_calculate_raw_image
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Testbench
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    global_package.vhd
--  - Modules:
--    mulfp, addfp
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules: -
--    - Processes (Architecture: tb): -
--
-- Important objects: -
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

USE work.global_package.all;

ENTITY tb_calculate_raw_image IS
END tb_calculate_raw_image;

ARCHITECTURE tb OF tb_calculate_raw_image IS

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

COMPONENT addfp
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
signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : STD_LOGIC;

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT calculate_raw_image
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
signal mulfprdy : in STD_LOGIC;

signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC
);
END COMPONENT;
signal calculate_raw_image_clock : std_logic := '0';
signal calculate_raw_image_reset : std_logic := '0';
signal calculate_raw_image_run : std_logic := '0';
signal calculate_raw_image_vircompensated_do : std_logic_vector(31 downto 0) := (others => '0');
signal calculate_raw_image_vircompensated_addr : std_logic_vector(9 downto 0);
signal calculate_raw_image_alphacomp_do : std_logic_vector(31 downto 0) := (others => '0');
signal calculate_raw_image_alphacomp_addr : std_logic_vector(9 downto 0);
signal calculate_raw_image_addr : std_logic_vector(9 downto 0) := (others => '0');
signal calculate_raw_image_do : std_logic_vector(31 downto 0);
signal calculate_raw_image_rdy : std_logic;

signal calculate_raw_image_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_raw_image_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_raw_image_mulfpond : STD_LOGIC;
signal calculate_raw_image_mulfpsclr : STD_LOGIC;
signal calculate_raw_image_mulfpce : STD_LOGIC;
signal calculate_raw_image_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_raw_image_mulfprdy : STD_LOGIC;

signal calculate_raw_image_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_raw_image_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_raw_image_addfpond : STD_LOGIC;
signal calculate_raw_image_addfpsclr : STD_LOGIC;
signal calculate_raw_image_addfpce : STD_LOGIC;
signal calculate_raw_image_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_raw_image_addfprdy : STD_LOGIC;

signal calculate_raw_image_mulfpclk : std_logic;
signal calculate_raw_image_addfpclk : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (calculate_raw_image_do); -- output data

-- Instantiate the Unit Under Test (UUT)
calculate_raw_image_uut : calculate_raw_image PORT MAP (
i_clock => calculate_raw_image_clock,
i_reset => calculate_raw_image_reset,
i_run => calculate_raw_image_run,
i_vircompensated_do => calculate_raw_image_vircompensated_do,
o_vircompensated_addr => calculate_raw_image_vircompensated_addr,
i_alphacomp_do => calculate_raw_image_alphacomp_do,
o_alphacomp_addr => calculate_raw_image_alphacomp_addr,
o_do => calculate_raw_image_do,
i_addr => calculate_raw_image_addr,
o_rdy => calculate_raw_image_rdy,

mulfpa => calculate_raw_image_mulfpa,
mulfpb => calculate_raw_image_mulfpb,
mulfpond => calculate_raw_image_mulfpond,
mulfpsclr => calculate_raw_image_mulfpsclr,
mulfpce => calculate_raw_image_mulfpce,
mulfpr => calculate_raw_image_mulfpr,
mulfprdy => calculate_raw_image_mulfprdy,

addfpa => calculate_raw_image_addfpa,
addfpb => calculate_raw_image_addfpb,
addfpond => calculate_raw_image_addfpond,
addfpsclr => calculate_raw_image_addfpsclr,
addfpce => calculate_raw_image_addfpce,
addfpr => calculate_raw_image_addfpr,
addfprdy => calculate_raw_image_addfprdy
);

-- Clock process definitions
p_clock_process : process
begin
calculate_raw_image_clock <= '0';
wait for i_clock_period/2;
calculate_raw_image_clock <= '1';
wait for i_clock_period/2;
end process p_clock_process;

p_tb : process
begin
-- hold reset state for 100 ns.
calculate_raw_image_reset <= '1';
wait for 100 ns;
calculate_raw_image_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
calculate_raw_image_run <= '1'; wait for i_clock_period; calculate_raw_image_run <= '0';
wait until calculate_raw_image_rdy = '1';
for i in 0 to 1024 loop
	calculate_raw_image_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps;
report "done" severity failure;
end process p_tb;

calculate_raw_image_mulfpclk <= calculate_raw_image_clock;
calculate_raw_image_addfpclk <= calculate_raw_image_clock;

mulfp_i0 : mulfp
PORT MAP (
a => calculate_raw_image_mulfpa,
b => calculate_raw_image_mulfpb,
operation_nd => calculate_raw_image_mulfpond,
clk => calculate_raw_image_mulfpclk,
sclr => calculate_raw_image_mulfpsclr,
ce => calculate_raw_image_mulfpce,
result => calculate_raw_image_mulfpr,
rdy => calculate_raw_image_mulfprdy
);

addfp_i0 : addfp
PORT MAP (
a => calculate_raw_image_addfpa,
b => calculate_raw_image_addfpb,
operation_nd => calculate_raw_image_addfpond,
clk => calculate_raw_image_addfpclk,
sclr => calculate_raw_image_addfpsclr,
ce => calculate_raw_image_addfpce,
result => calculate_raw_image_addfpr,
rdy => calculate_raw_image_addfprdy
);

end architecture tb;

