--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:28 01/29/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractOffsetParameters.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractOffsetParameters
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

USE work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY tb_ExtractOffsetParameters IS
END tb_ExtractOffsetParameters;

ARCHITECTURE behavior OF tb_ExtractOffsetParameters IS 

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;

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
component ExtractOffsetParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

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
end component ExtractOffsetParameters;
signal ExtractOffsetParameters_clock : std_logic;
signal ExtractOffsetParameters_reset : std_logic;
signal ExtractOffsetParameters_run : std_logic;
signal ExtractOffsetParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractOffsetParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractOffsetParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractOffsetParameters_do : std_logic_vector (31 downto 0);
signal ExtractOffsetParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractOffsetParameters_rdy : std_logic;
signal ExtractOffsetParameters_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal ExtractOffsetParameters_fixed2floatond : STD_LOGIC;
signal ExtractOffsetParameters_fixed2floatsclr : STD_LOGIC;
signal ExtractOffsetParameters_fixed2floatce : STD_LOGIC;
signal ExtractOffsetParameters_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_fixed2floatrdy : STD_LOGIC;
signal ExtractOffsetParameters_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_mulfpond : STD_LOGIC;
signal ExtractOffsetParameters_mulfpsclr : STD_LOGIC;
signal ExtractOffsetParameters_mulfpce : STD_LOGIC;
signal ExtractOffsetParameters_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_mulfprdy : STD_LOGIC;
signal ExtractOffsetParameters_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_addfpond : STD_LOGIC;
signal ExtractOffsetParameters_addfpsclr : STD_LOGIC;
signal ExtractOffsetParameters_addfpce : STD_LOGIC;
signal ExtractOffsetParameters_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_addfprdy : STD_LOGIC;

signal ExtractOffsetParameters_fixed2floatclk : std_logic;
signal ExtractOffsetParameters_addfpclk : std_logic;
signal ExtractOffsetParameters_mulfpclk : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (ExtractOffsetParameters_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => ExtractOffsetParameters_clock,
ena => ExtractOffsetParameters_i2c_mem_ena,
wea => "0",
addra => ExtractOffsetParameters_i2c_mem_addra,
dina => (others => '0'),
douta => ExtractOffsetParameters_i2c_mem_douta
);

-- Instantiate the Unit Under Test (UUT)
uut: ExtractOffsetParameters PORT MAP (
i_clock => ExtractOffsetParameters_clock,
i_reset => ExtractOffsetParameters_reset,
i_run => ExtractOffsetParameters_run,

i2c_mem_ena => ExtractOffsetParameters_i2c_mem_ena,
i2c_mem_addra => ExtractOffsetParameters_i2c_mem_addra,
i2c_mem_douta => ExtractOffsetParameters_i2c_mem_douta,

o_do => ExtractOffsetParameters_do,
i_addr => ExtractOffsetParameters_addr, -- 10bit-1024

o_rdy => ExtractOffsetParameters_rdy,

fixed2floata => ExtractOffsetParameters_fixed2floata,
fixed2floatond => ExtractOffsetParameters_fixed2floatond,
fixed2floatsclr => ExtractOffsetParameters_fixed2floatsclr,
fixed2floatce => ExtractOffsetParameters_fixed2floatce,
fixed2floatr => ExtractOffsetParameters_fixed2floatr,
fixed2floatrdy => ExtractOffsetParameters_fixed2floatrdy,

mulfpa => ExtractOffsetParameters_mulfpa,
mulfpb => ExtractOffsetParameters_mulfpb,
mulfpond => ExtractOffsetParameters_mulfpond,
mulfpsclr => ExtractOffsetParameters_mulfpsclr,
mulfpce => ExtractOffsetParameters_mulfpce,
mulfpr => ExtractOffsetParameters_mulfpr,
mulfprdy => ExtractOffsetParameters_mulfprdy,

addfpa => ExtractOffsetParameters_addfpa,
addfpb => ExtractOffsetParameters_addfpb,
addfpond => ExtractOffsetParameters_addfpond,
addfpsclr => ExtractOffsetParameters_addfpsclr,
addfpce => ExtractOffsetParameters_addfpce,
addfpr => ExtractOffsetParameters_addfpr,
addfprdy => ExtractOffsetParameters_addfprdy
);

-- Clock process definitions
i_clock_process :process
begin
ExtractOffsetParameters_clock <= '0';
wait for i_clock_period/2;
ExtractOffsetParameters_clock <= '1';
wait for i_clock_period/2;
end process;

ExtractOffsetParameters_reset <= '1', '0' after 100 ns ;	

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 105 ns;
-- insert stimulus here
ExtractOffsetParameters_run <= '1'; wait for i_clock_period; ExtractOffsetParameters_run <= '0';
wait until ExtractOffsetParameters_rdy = '1';
for i in 0 to 1024 loop
	ExtractOffsetParameters_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps; -- must be for write
report "done" severity failure;
--wait on o_done;
end process;

ExtractOffsetParameters_fixed2floatclk <= ExtractOffsetParameters_clock;
ExtractOffsetParameters_addfpclk <= ExtractOffsetParameters_clock;
ExtractOffsetParameters_mulfpclk <= ExtractOffsetParameters_clock;

inst_fixed2float : fixed2float
PORT MAP (
a => ExtractOffsetParameters_fixed2floata,
operation_nd => ExtractOffsetParameters_fixed2floatond,
clk => ExtractOffsetParameters_fixed2floatclk,
sclr => ExtractOffsetParameters_fixed2floatsclr,
ce => ExtractOffsetParameters_fixed2floatce,
result => ExtractOffsetParameters_fixed2floatr,
rdy => ExtractOffsetParameters_fixed2floatrdy
);

inst_mulfp : mulfp
PORT MAP (
a => ExtractOffsetParameters_mulfpa,
b => ExtractOffsetParameters_mulfpb,
operation_nd => ExtractOffsetParameters_mulfpond,
clk => ExtractOffsetParameters_mulfpclk,
sclr => ExtractOffsetParameters_mulfpsclr,
ce => ExtractOffsetParameters_mulfpce,
result => ExtractOffsetParameters_mulfpr,
rdy => ExtractOffsetParameters_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => ExtractOffsetParameters_addfpa,
b => ExtractOffsetParameters_addfpb,
operation_nd => ExtractOffsetParameters_addfpond,
clk => ExtractOffsetParameters_addfpclk,
sclr => ExtractOffsetParameters_addfpsclr,
ce => ExtractOffsetParameters_addfpce,
result => ExtractOffsetParameters_addfpr,
rdy => ExtractOffsetParameters_addfprdy
);

END;
