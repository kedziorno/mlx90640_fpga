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

USE work.p_fphdl_package3.all;

ENTITY tb_CalculateAlphaComp IS
END tb_CalculateAlphaComp;

ARCHITECTURE behavior OF tb_CalculateAlphaComp IS 

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

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT CalculateAlphaComp
PORT(
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_acpsubpage0 : in std_logic_vector (31 downto 0);
i_acpsubpage1 : in std_logic_vector (31 downto 0);
i_const1 : in std_logic_vector (31 downto 0);

i_alpha_do : in std_logic_vector (31 downto 0);
o_alpha_addr : out std_logic_vector (9 downto 0); -- 10bit-1024

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

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
signal subfprdy : in STD_LOGIC
);
END COMPONENT;
signal CalculateAlphaComp_clock : std_logic := '0';
signal CalculateAlphaComp_reset : std_logic := '0';
signal CalculateAlphaComp_run : std_logic := '0';
signal CalculateAlphaComp_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateAlphaComp_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_Ta0 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage0 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage1 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_const1 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_alpha_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_addr : std_logic_vector(9 downto 0) := (others => '0');
signal CalculateAlphaComp_i2c_mem_ena : std_logic;
signal CalculateAlphaComp_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateAlphaComp_alpha_addr : std_logic_vector(9 downto 0);
signal CalculateAlphaComp_do : std_logic_vector(31 downto 0);
signal CalculateAlphaComp_rdy : std_logic;
signal CalculateAlphaComp_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_mulfpond : STD_LOGIC;
signal CalculateAlphaComp_mulfpsclr : STD_LOGIC;
signal CalculateAlphaComp_mulfpce : STD_LOGIC;
signal CalculateAlphaComp_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_mulfprdy : STD_LOGIC;
signal CalculateAlphaComp_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_addfpond : STD_LOGIC;
signal CalculateAlphaComp_addfpsclr : STD_LOGIC;
signal CalculateAlphaComp_addfpce : STD_LOGIC;
signal CalculateAlphaComp_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_addfprdy : STD_LOGIC;
signal CalculateAlphaComp_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_subfpond : STD_LOGIC;
signal CalculateAlphaComp_subfpsclr : STD_LOGIC;
signal CalculateAlphaComp_subfpce : STD_LOGIC;
signal CalculateAlphaComp_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_subfprdy : STD_LOGIC;

signal CalculateAlphaComp_mulfpclk : std_logic;
signal CalculateAlphaComp_addfpclk : std_logic;
signal CalculateAlphaComp_subfpclk : std_logic;

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

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (CalculateAlphaComp_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculateAlphaComp_clock,
ena => CalculateAlphaComp_i2c_mem_ena,
wea => "0",
addra => CalculateAlphaComp_i2c_mem_addra,
dina => (others => '0'),
douta => CalculateAlphaComp_i2c_mem_douta
);

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
i_const1 => CalculateAlphaComp_const1,
i_alpha_do => CalculateAlphaComp_alpha_do,
o_alpha_addr => CalculateAlphaComp_alpha_addr,
o_do => CalculateAlphaComp_do,
i_addr => CalculateAlphaComp_addr,
o_rdy => CalculateAlphaComp_rdy,

mulfpa => CalculateAlphaComp_mulfpa,
mulfpb => CalculateAlphaComp_mulfpb,
mulfpond => CalculateAlphaComp_mulfpond,
mulfpsclr => CalculateAlphaComp_mulfpsclr,
mulfpce => CalculateAlphaComp_mulfpce,
mulfpr => CalculateAlphaComp_mulfpr,
mulfprdy => CalculateAlphaComp_mulfprdy,

addfpa => CalculateAlphaComp_addfpa,
addfpb => CalculateAlphaComp_addfpb,
addfpond => CalculateAlphaComp_addfpond,
addfpsclr => CalculateAlphaComp_addfpsclr,
addfpce => CalculateAlphaComp_addfpce,
addfpr => CalculateAlphaComp_addfpr,
addfprdy => CalculateAlphaComp_addfprdy,

subfpa => CalculateAlphaComp_subfpa,
subfpb => CalculateAlphaComp_subfpb,
subfpond => CalculateAlphaComp_subfpond,
subfpsclr => CalculateAlphaComp_subfpsclr,
subfpce => CalculateAlphaComp_subfpce,
subfpr => CalculateAlphaComp_subfpr,
subfprdy => CalculateAlphaComp_subfprdy

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
CalculateAlphaComp_const1 <= x"3f800000"; -- 1
wait for i_clock_period;
CalculateAlphaComp_run <= '1'; wait for i_clock_period; CalculateAlphaComp_run <= '0';
wait until CalculateAlphaComp_rdy = '1';
--report "rdy at 645.945us";
report "rdy at 599.795us";
for i in 0 to 1024 loop
	CalculateAlphaComp_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps;
--report "end at 666.445us";
report "end at 620.295us";
report "done" severity failure;
end process;

CalculateAlphaComp_mulfpclk <= CalculateAlphaComp_clock;
CalculateAlphaComp_addfpclk <= CalculateAlphaComp_clock;
CalculateAlphaComp_subfpclk <= CalculateAlphaComp_clock;

inst_mulfp : mulfp
PORT MAP (
a => CalculateAlphaComp_mulfpa,
b => CalculateAlphaComp_mulfpb,
operation_nd => CalculateAlphaComp_mulfpond,
clk => CalculateAlphaComp_mulfpclk,
sclr => CalculateAlphaComp_mulfpsclr,
ce => CalculateAlphaComp_mulfpce,
result => CalculateAlphaComp_mulfpr,
rdy => CalculateAlphaComp_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => CalculateAlphaComp_addfpa,
b => CalculateAlphaComp_addfpb,
operation_nd => CalculateAlphaComp_addfpond,
clk => CalculateAlphaComp_addfpclk,
sclr => CalculateAlphaComp_addfpsclr,
ce => CalculateAlphaComp_addfpce,
result => CalculateAlphaComp_addfpr,
rdy => CalculateAlphaComp_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => CalculateAlphaComp_subfpa,
b => CalculateAlphaComp_subfpb,
operation_nd => CalculateAlphaComp_subfpond,
clk => CalculateAlphaComp_subfpclk,
sclr => CalculateAlphaComp_subfpsclr,
ce => CalculateAlphaComp_subfpce,
result => CalculateAlphaComp_subfpr,
rdy => CalculateAlphaComp_subfprdy
);

END;
