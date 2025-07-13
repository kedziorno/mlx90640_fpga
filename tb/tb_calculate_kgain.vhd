-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   16:02:33 02/03/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_calculate_kgain
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
--    fixed2float, divfp
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules: -
--    - Processes (Architecture: tb):
--      p_clock_process, p_tb
--
-- Important objects:
--  - tb_i2c_mem
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

ENTITY tb_calculate_kgain IS
END tb_calculate_kgain;

ARCHITECTURE tb OF tb_calculate_kgain IS 

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

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

-- Component Declaration
component calculate_kgain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_KGain : out std_logic_vector (31 downto 0);
o_rdy : out std_logic;

signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC
);
end component calculate_kgain;
signal calculate_kgain_clock : std_logic;
signal calculate_kgain_reset : std_logic;
signal calculate_kgain_run : std_logic;
signal calculate_kgain_i2c_mem_ena : STD_LOGIC;
signal calculate_kgain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculate_kgain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculate_kgain_KGain : std_logic_vector (31 downto 0);
signal calculate_kgain_rdy : std_logic;

signal calculate_kgain_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal calculate_kgain_fixed2floatond : STD_LOGIC;
signal calculate_kgain_fixed2floatsclr : STD_LOGIC;
signal calculate_kgain_fixed2floatce : STD_LOGIC;
signal calculate_kgain_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_kgain_fixed2floatrdy : STD_LOGIC;

signal calculate_kgain_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_kgain_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_kgain_divfpond : STD_LOGIC;
signal calculate_kgain_divfpsclr : STD_LOGIC;
signal calculate_kgain_divfpce : STD_LOGIC;
signal calculate_kgain_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_kgain_divfprdy : STD_LOGIC;

signal calculate_kgain_fixed2floatclk : std_logic;
signal calculate_kgain_divfpclk : std_logic;

constant clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (calculate_kgain_KGain);

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => calculate_kgain_clock,
ena => calculate_kgain_i2c_mem_ena,
wea => "0",
addra => calculate_kgain_i2c_mem_addra,
dina => (others => '0'),
douta => calculate_kgain_i2c_mem_douta
);

p_clock_process : process
begin
	calculate_kgain_clock <= '0';
	wait for clock_period/2;
	calculate_kgain_clock <= '1';
	wait for clock_period/2;
end process p_clock_process;

-- Component Instantiation
calculate_kgain_uut : calculate_kgain port map (
i_clock => calculate_kgain_clock,
i_reset => calculate_kgain_reset,
i_run => calculate_kgain_run,
i2c_mem_ena => calculate_kgain_i2c_mem_ena,
i2c_mem_addra => calculate_kgain_i2c_mem_addra,
i2c_mem_douta => calculate_kgain_i2c_mem_douta,
o_KGain => calculate_kgain_KGain,
o_rdy => calculate_kgain_rdy,

fixed2floata => calculate_kgain_fixed2floata,
fixed2floatond => calculate_kgain_fixed2floatond,
fixed2floatsclr => calculate_kgain_fixed2floatsclr,
fixed2floatce => calculate_kgain_fixed2floatce,
fixed2floatr => calculate_kgain_fixed2floatr,
fixed2floatrdy => calculate_kgain_fixed2floatrdy,

divfpa => calculate_kgain_divfpa,
divfpb => calculate_kgain_divfpb,
divfpond => calculate_kgain_divfpond,
divfpsclr => calculate_kgain_divfpsclr,
divfpce => calculate_kgain_divfpce,
divfpr => calculate_kgain_divfpr,
divfprdy => calculate_kgain_divfprdy
);

--  Test Bench Statements
p_tb : PROCESS
BEGIN
calculate_kgain_reset <= '1';
wait for 254.3 ns; -- wait until global set/reset completes
calculate_kgain_reset <= '0';
wait for clock_period*10;
-- Add user defined stimulus here
calculate_kgain_run <= '1'; wait for clock_period; calculate_kgain_run <= '0';
wait until calculate_kgain_rdy = '1';
warning_neq_fp (calculate_kgain_KGain, x"3f81ac57", "kgain");
--report "rdy at 955ns";
--report "rdy at 925ns";
--report "rdy at 1.225us - rm fttmp1,fttmp2 reg";
report "rdy at 1.205us - rm fttmp1 fttmp2 reg,rm redundant regs,rm states";
wait for 1 ps;
report "done" severity failure;
END PROCESS p_tb;

calculate_kgain_fixed2floatclk <= calculate_kgain_clock;
fixed2float_i0 : fixed2float
PORT MAP (
a => calculate_kgain_fixed2floata,
operation_nd => calculate_kgain_fixed2floatond,
clk => calculate_kgain_fixed2floatclk,
sclr => calculate_kgain_fixed2floatsclr,
ce => calculate_kgain_fixed2floatce,
result => calculate_kgain_fixed2floatr,
rdy => calculate_kgain_fixed2floatrdy
);

calculate_kgain_divfpclk <= calculate_kgain_clock;
divfp_i0 : divfp
PORT MAP (
a => calculate_kgain_divfpa,
b => calculate_kgain_divfpb,
operation_nd => calculate_kgain_divfpond,
clk => calculate_kgain_divfpclk,
sclr => calculate_kgain_divfpsclr,
ce => calculate_kgain_divfpce,
result => calculate_kgain_divfpr,
rdy => calculate_kgain_divfprdy
);

end architecture tb;

