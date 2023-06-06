--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:22:17 02/19/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_CalculateTo.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CalculateTo
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

ENTITY tb_CalculateTo IS
END tb_CalculateTo;

ARCHITECTURE behavior OF tb_CalculateTo IS

COMPONENT divfp
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
signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpsclr : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : STD_LOGIC;

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

COMPONENT subfp
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
signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : STD_LOGIC;

COMPONENT sqrtfp2
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : STD_LOGIC;
signal sqrtfp2clk : STD_LOGIC;
signal sqrtfp2sclr : STD_LOGIC;
signal sqrtfp2ce : STD_LOGIC;
signal sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : STD_LOGIC;

COMPONENT tb_i2c_mem
PORT (
clka : IN STD_LOGIC;
ena : IN STD_LOGIC;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT CalculateTo
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);
i_Ta : IN  std_logic_vector(31 downto 0);
i_vircompensated_do : IN  std_logic_vector(31 downto 0);
o_vircompensated_addr : OUT  std_logic_vector(9 downto 0);
i_alphacomp_do : IN  std_logic_vector(31 downto 0);
o_alphacomp_addr : OUT  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);
o_rdy : OUT  std_logic;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

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
signal addfprdy : in STD_LOGIC;

signal subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : out STD_LOGIC;
signal subfpsclr : out STD_LOGIC;
signal subfpce : out STD_LOGIC;
signal subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : in STD_LOGIC;

signal sqrtfp2a : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : out STD_LOGIC;
signal sqrtfp2sclr : out STD_LOGIC;
signal sqrtfp2ce : out STD_LOGIC;
signal sqrtfp2r : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : in STD_LOGIC

);
END COMPONENT;
signal CalculateTo_clock : std_logic := '0';
signal CalculateTo_reset : std_logic := '0';
signal CalculateTo_run : std_logic := '0';
signal CalculateTo_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateTo_vircompensated_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_alphacomp_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_addr : std_logic_vector(9 downto 0) := (others => '0');
signal CalculateTo_i2c_mem_ena : std_logic;
signal CalculateTo_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateTo_vircompensated_addr : std_logic_vector(9 downto 0);
signal CalculateTo_alphacomp_addr : std_logic_vector(9 downto 0);
signal CalculateTo_do : std_logic_vector(31 downto 0);
signal CalculateTo_rdy : std_logic;

signal CalculateTo_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_divfpond : STD_LOGIC;
signal CalculateTo_divfpsclr : STD_LOGIC;
signal CalculateTo_divfpce : STD_LOGIC;
signal CalculateTo_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_divfprdy : STD_LOGIC;

signal CalculateTo_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_mulfpond : STD_LOGIC;
signal CalculateTo_mulfpsclr : STD_LOGIC;
signal CalculateTo_mulfpce : STD_LOGIC;
signal CalculateTo_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_mulfprdy : STD_LOGIC;

signal CalculateTo_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_addfpond : STD_LOGIC;
signal CalculateTo_addfpsclr : STD_LOGIC;
signal CalculateTo_addfpce : STD_LOGIC;
signal CalculateTo_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_addfprdy : STD_LOGIC;

signal CalculateTo_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_subfpond : STD_LOGIC;
signal CalculateTo_subfpsclr : STD_LOGIC;
signal CalculateTo_subfpce : STD_LOGIC;
signal CalculateTo_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_subfprdy : STD_LOGIC;

signal CalculateTo_sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_sqrtfp2ond : STD_LOGIC;
signal CalculateTo_sqrtfp2sclr : STD_LOGIC;
signal CalculateTo_sqrtfp2ce : STD_LOGIC;
signal CalculateTo_sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_sqrtfp2rdy : STD_LOGIC;

signal CalculateTo_sqrtfp2clk : std_logic;
signal CalculateTo_mulfpclk : std_logic;
signal CalculateTo_divfpclk : std_logic;
signal CalculateTo_addfpclk : std_logic;
signal CalculateTo_subfpclk : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (CalculateTo_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculateTo_clock,
ena => CalculateTo_i2c_mem_ena,
wea => "0",
addra => CalculateTo_i2c_mem_addra,
dina => (others => '0'),
douta => CalculateTo_i2c_mem_douta
);

-- Instantiate the Unit Under Test (UUT)
uut: CalculateTo PORT MAP (
i_clock => CalculateTo_clock,
i_reset => CalculateTo_reset,
i_run => CalculateTo_run,
i2c_mem_ena => CalculateTo_i2c_mem_ena,
i2c_mem_addra => CalculateTo_i2c_mem_addra,
i2c_mem_douta => CalculateTo_i2c_mem_douta,
i_Ta => CalculateTo_Ta,
i_vircompensated_do => CalculateTo_vircompensated_do,
o_vircompensated_addr => CalculateTo_vircompensated_addr,
i_alphacomp_do => CalculateTo_alphacomp_do,
o_alphacomp_addr => CalculateTo_alphacomp_addr,
o_do => CalculateTo_do,
i_addr => CalculateTo_addr,
o_rdy => CalculateTo_rdy,

divfpa => CalculateTo_divfpa,
divfpb => CalculateTo_divfpb,
divfpond => CalculateTo_divfpond,
divfpsclr => CalculateTo_divfpsclr,
divfpce => CalculateTo_divfpce,
divfpr => CalculateTo_divfpr,
divfprdy => CalculateTo_divfprdy,

mulfpa => CalculateTo_mulfpa,
mulfpb => CalculateTo_mulfpb,
mulfpond => CalculateTo_mulfpond,
mulfpsclr => CalculateTo_mulfpsclr,
mulfpce => CalculateTo_mulfpce,
mulfpr => CalculateTo_mulfpr,
mulfprdy => CalculateTo_mulfprdy,

addfpa => CalculateTo_addfpa,
addfpb => CalculateTo_addfpb,
addfpond => CalculateTo_addfpond,
addfpsclr => CalculateTo_addfpsclr,
addfpce => CalculateTo_addfpce,
addfpr => CalculateTo_addfpr,
addfprdy => CalculateTo_addfprdy,

subfpa => CalculateTo_subfpa,
subfpb => CalculateTo_subfpb,
subfpond => CalculateTo_subfpond,
subfpsclr => CalculateTo_subfpsclr,
subfpce => CalculateTo_subfpce,
subfpr => CalculateTo_subfpr,
subfprdy => CalculateTo_subfprdy,

sqrtfp2a => CalculateTo_sqrtfp2a,
sqrtfp2ond => CalculateTo_sqrtfp2ond,
sqrtfp2sclr => CalculateTo_sqrtfp2sclr,
sqrtfp2ce => CalculateTo_sqrtfp2ce,
sqrtfp2r => CalculateTo_sqrtfp2r,
sqrtfp2rdy => CalculateTo_sqrtfp2rdy

);

-- Clock process definitions
i_clock_process :process
begin
CalculateTo_clock <= '0';
wait for i_clock_period/2;
CalculateTo_clock <= '1';
wait for i_clock_period/2;
end process;

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
CalculateTo_reset <= '1';
wait for 100 ns;
CalculateTo_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
CalculateTo_Ta <= x"421CBC6A"; -- 39.184
CalculateTo_run <= '1'; wait for i_clock_period; CalculateTo_run <= '0';
wait until CalculateTo_rdy = '1';
for i in 0 to 1024 loop
	CalculateTo_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps;
report "done" severity failure;
end process;

CalculateTo_sqrtfp2clk <= CalculateTo_clock;
CalculateTo_mulfpclk <= CalculateTo_clock;
CalculateTo_divfpclk <= CalculateTo_clock;
CalculateTo_addfpclk <= CalculateTo_clock;
CalculateTo_subfpclk <= CalculateTo_clock;

inst_divfp : divfp
PORT MAP (
a => CalculateTo_divfpa,
b => CalculateTo_divfpb,
operation_nd => CalculateTo_divfpond,
clk => CalculateTo_divfpclk,
sclr => CalculateTo_divfpsclr,
ce => CalculateTo_divfpce,
result => CalculateTo_divfpr,
rdy => CalculateTo_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => CalculateTo_mulfpa,
b => CalculateTo_mulfpb,
operation_nd => CalculateTo_mulfpond,
clk => CalculateTo_mulfpclk,
sclr => CalculateTo_mulfpsclr,
ce => CalculateTo_mulfpce,
result => CalculateTo_mulfpr,
rdy => CalculateTo_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => CalculateTo_addfpa,
b => CalculateTo_addfpb,
operation_nd => CalculateTo_addfpond,
clk => CalculateTo_addfpclk,
sclr => CalculateTo_addfpsclr,
ce => CalculateTo_addfpce,
result => CalculateTo_addfpr,
rdy => CalculateTo_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => CalculateTo_subfpa,
b => CalculateTo_subfpb,
operation_nd => CalculateTo_subfpond,
clk => CalculateTo_subfpclk,
sclr => CalculateTo_subfpsclr,
ce => CalculateTo_subfpce,
result => CalculateTo_subfpr,
rdy => CalculateTo_subfprdy
);

inst_sqrtfp2 : sqrtfp2
PORT MAP (
a => CalculateTo_sqrtfp2a,
operation_nd => CalculateTo_sqrtfp2ond,
clk => CalculateTo_sqrtfp2clk,
sclr => CalculateTo_sqrtfp2sclr,
ce => CalculateTo_sqrtfp2ce,
result => CalculateTo_sqrtfp2r,
rdy => CalculateTo_sqrtfp2rdy
);

END;
