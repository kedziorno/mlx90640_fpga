-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   10:42:32 01/24/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_extract_tgc_parameters
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Testbench
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
--      fixed2float, divfp, tb_i2c_mem
--    - Processes (Architecture: tb):
--      p_clock_generator, p_tb
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

use work.global_package.all;

ENTITY tb_extract_tgc_parameters IS
END tb_extract_tgc_parameters;

ARCHITECTURE tb OF tb_extract_tgc_parameters IS 

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
component extract_tgc_parameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
o_tgc : out std_logic_vector (31 downto 0);
o_rdy : out std_logic;
signal i2c_mem_ena : out STD_LOGIC;
signal i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
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
end component extract_tgc_parameters;

--Inputs
signal extract_tgc_parameters_clock : std_logic;
signal extract_tgc_parameters_reset : std_logic;
signal extract_tgc_parameters_run : std_logic;
signal extract_tgc_parameters_i2c_mem_ena : STD_LOGIC;
signal extract_tgc_parameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal extract_tgc_parameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);

--Outputs
signal extract_tgc_parameters_tgc : std_logic_vector (31 downto 0);
signal extract_tgc_parameters_rdy : std_logic;

signal extract_tgc_parameters_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal extract_tgc_parameters_fixed2floatond : STD_LOGIC;
signal extract_tgc_parameters_fixed2floatsclr : STD_LOGIC;
signal extract_tgc_parameters_fixed2floatce : STD_LOGIC;
signal extract_tgc_parameters_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_tgc_parameters_fixed2floatrdy : STD_LOGIC;

signal extract_tgc_parameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_tgc_parameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_tgc_parameters_divfpond : STD_LOGIC;
signal extract_tgc_parameters_divfpsclr : STD_LOGIC;
signal extract_tgc_parameters_divfpce : STD_LOGIC;
signal extract_tgc_parameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_tgc_parameters_divfprdy : STD_LOGIC;

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

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => extract_tgc_parameters_clock,
ena => extract_tgc_parameters_i2c_mem_ena,
wea => "0",
addra => extract_tgc_parameters_i2c_mem_addra,
dina => (others => '0'),
douta => extract_tgc_parameters_i2c_mem_douta
);

-- Instantiate the Unit Under Test (UUT)
extract_tgc_parameters_uut : extract_tgc_parameters port map (
i_clock => extract_tgc_parameters_clock,
i_reset => extract_tgc_parameters_reset,
i_run => extract_tgc_parameters_run,
o_tgc => extract_tgc_parameters_tgc,
o_rdy => extract_tgc_parameters_rdy,
i2c_mem_ena => extract_tgc_parameters_i2c_mem_ena,
i2c_mem_addra => extract_tgc_parameters_i2c_mem_addra,
i2c_mem_douta => extract_tgc_parameters_i2c_mem_douta,
fixed2floata => extract_tgc_parameters_fixed2floata,
fixed2floatond => extract_tgc_parameters_fixed2floatond,
fixed2floatsclr => extract_tgc_parameters_fixed2floatsclr,
fixed2floatce => extract_tgc_parameters_fixed2floatce,
fixed2floatr => extract_tgc_parameters_fixed2floatr,
fixed2floatrdy => extract_tgc_parameters_fixed2floatrdy,
divfpa => extract_tgc_parameters_divfpa,
divfpb => extract_tgc_parameters_divfpb,
divfpond => extract_tgc_parameters_divfpond,
divfpsclr => extract_tgc_parameters_divfpsclr,
divfpce => extract_tgc_parameters_divfpce,
divfpr => extract_tgc_parameters_divfpr,
divfprdy => extract_tgc_parameters_divfprdy
);

-- Clock process definitions
p_clock_generator : process
begin
extract_tgc_parameters_clock <= '0';
wait for i_clock_period/2;
extract_tgc_parameters_clock <= '1';
wait for i_clock_period/2;
end process p_clock_generator;

-- Stimulus process
p_tb : process
begin		
-- hold reset state for 100 ns.
extract_tgc_parameters_reset <= '1';
wait for 100 ns;	
extract_tgc_parameters_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
extract_tgc_parameters_run <= '1'; wait for i_clock_period; extract_tgc_parameters_run <= '0';
wait until extract_tgc_parameters_rdy = '1';
warning_neq_fp (extract_tgc_parameters_tgc, x"00000000", "tgc");
report "done" severity failure;
end process;

fixed2float_i0 : fixed2float
PORT MAP (
a => extract_tgc_parameters_fixed2floata,
operation_nd => extract_tgc_parameters_fixed2floatond,
clk => extract_tgc_parameters_clock,
sclr => extract_tgc_parameters_fixed2floatsclr,
ce => extract_tgc_parameters_fixed2floatce,
result => extract_tgc_parameters_fixed2floatr,
rdy => extract_tgc_parameters_fixed2floatrdy
);

divfp_i0 : divfp
PORT MAP (
a => extract_tgc_parameters_divfpa,
b => extract_tgc_parameters_divfpb,
operation_nd => extract_tgc_parameters_divfpond,
clk => extract_tgc_parameters_clock,
sclr => extract_tgc_parameters_divfpsclr,
ce => extract_tgc_parameters_divfpce,
result => extract_tgc_parameters_divfpr,
rdy => extract_tgc_parameters_divfprdy
);

END architecture tb;

