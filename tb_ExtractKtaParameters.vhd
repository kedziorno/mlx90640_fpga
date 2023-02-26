--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:28 01/29/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractKtaParameters.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractKtaParameters
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

ENTITY tb_ExtractKtaParameters IS
END tb_ExtractKtaParameters;

ARCHITECTURE behavior OF tb_ExtractKtaParameters IS 

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
component ExtractKtaParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_done : out std_logic;
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

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC
);
end component ExtractKtaParameters;
signal ExtractKtaParameters_clock : std_logic;
signal ExtractKtaParameters_reset : std_logic;
signal ExtractKtaParameters_run : std_logic;
signal ExtractKtaParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractKtaParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKtaParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKtaParameters_do : std_logic_vector (31 downto 0);
signal ExtractKtaParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractKtaParameters_done : std_logic;
signal ExtractKtaParameters_rdy : std_logic;
signal ExtractKtaParameters_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_mulfpond : STD_LOGIC;
signal ExtractKtaParameters_mulfpsclr : STD_LOGIC;
signal ExtractKtaParameters_mulfpce : STD_LOGIC;
signal ExtractKtaParameters_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_mulfprdy : STD_LOGIC;
signal ExtractKtaParameters_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_addfpond : STD_LOGIC;
signal ExtractKtaParameters_addfpsclr : STD_LOGIC;
signal ExtractKtaParameters_addfpce : STD_LOGIC;
signal ExtractKtaParameters_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_addfprdy : STD_LOGIC;
signal ExtractKtaParameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_divfpond : STD_LOGIC;
signal ExtractKtaParameters_divfpsclr : STD_LOGIC;
signal ExtractKtaParameters_divfpce : STD_LOGIC;
signal ExtractKtaParameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_divfprdy : STD_LOGIC;

signal ExtractKtaParameters_divfpclk : std_logic;
signal ExtractKtaParameters_mulfpclk : std_logic;
signal ExtractKtaParameters_addfpclk : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (ExtractKtaParameters_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => ExtractKtaParameters_clock,
ena => ExtractKtaParameters_i2c_mem_ena,
wea => "0",
addra => ExtractKtaParameters_i2c_mem_addra,
dina => (others => '0'),
douta => ExtractKtaParameters_i2c_mem_douta
);
-- Instantiate the Unit Under Test (UUT)
uut: ExtractKtaParameters PORT MAP (
i_clock => ExtractKtaParameters_clock,
i_reset => ExtractKtaParameters_reset,
i_run => ExtractKtaParameters_run,

i2c_mem_ena => ExtractKtaParameters_i2c_mem_ena,
i2c_mem_addra => ExtractKtaParameters_i2c_mem_addra,
i2c_mem_douta => ExtractKtaParameters_i2c_mem_douta,

o_do => ExtractKtaParameters_do,
i_addr => ExtractKtaParameters_addr, -- 10bit-1024

o_done => ExtractKtaParameters_done,
o_rdy => ExtractKtaParameters_rdy,

mulfpa => ExtractKtaParameters_mulfpa,
mulfpb => ExtractKtaParameters_mulfpb,
mulfpond => ExtractKtaParameters_mulfpond,
mulfpsclr => ExtractKtaParameters_mulfpsclr,
mulfpce => ExtractKtaParameters_mulfpce,
mulfpr => ExtractKtaParameters_mulfpr,
mulfprdy => ExtractKtaParameters_mulfprdy,

addfpa => ExtractKtaParameters_addfpa,
addfpb => ExtractKtaParameters_addfpb,
addfpond => ExtractKtaParameters_addfpond,
addfpsclr => ExtractKtaParameters_addfpsclr,
addfpce => ExtractKtaParameters_addfpce,
addfpr => ExtractKtaParameters_addfpr,
addfprdy => ExtractKtaParameters_addfprdy,

divfpa => ExtractKtaParameters_divfpa,
divfpb => ExtractKtaParameters_divfpb,
divfpond => ExtractKtaParameters_divfpond,
divfpsclr => ExtractKtaParameters_divfpsclr,
divfpce => ExtractKtaParameters_divfpce,
divfpr => ExtractKtaParameters_divfpr,
divfprdy => ExtractKtaParameters_divfprdy
);

-- Clock process definitions
i_clock_process :process
begin
ExtractKtaParameters_clock <= '0';
wait for i_clock_period/2;
ExtractKtaParameters_clock <= '1';
wait for i_clock_period/2;
end process;

ExtractKtaParameters_reset <= '1', '0' after 100 ns ;	

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 105 ns;
-- insert stimulus here
ExtractKtaParameters_run <= '1'; wait for i_clock_period; ExtractKtaParameters_run <= '0';
wait until ExtractKtaParameters_rdy = '1';
for i in 0 to 1024 loop
	ExtractKtaParameters_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps; -- must be for write
report "done" severity failure;
--wait on o_done;
end process;

ExtractKtaParameters_divfpclk <= ExtractKtaParameters_clock;
ExtractKtaParameters_mulfpclk <= ExtractKtaParameters_clock;
ExtractKtaParameters_addfpclk <= ExtractKtaParameters_clock;

inst_divfp : divfp
PORT MAP (
a => ExtractKtaParameters_divfpa,
b => ExtractKtaParameters_divfpb,
operation_nd => ExtractKtaParameters_divfpond,
clk => ExtractKtaParameters_divfpclk,
sclr => ExtractKtaParameters_divfpsclr,
ce => ExtractKtaParameters_divfpce,
result => ExtractKtaParameters_divfpr,
rdy => ExtractKtaParameters_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => ExtractKtaParameters_mulfpa,
b => ExtractKtaParameters_mulfpb,
operation_nd => ExtractKtaParameters_mulfpond,
clk => ExtractKtaParameters_mulfpclk,
sclr => ExtractKtaParameters_mulfpsclr,
ce => ExtractKtaParameters_mulfpce,
result => ExtractKtaParameters_mulfpr,
rdy => ExtractKtaParameters_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => ExtractKtaParameters_addfpa,
b => ExtractKtaParameters_addfpb,
operation_nd => ExtractKtaParameters_addfpond,
clk => ExtractKtaParameters_addfpclk,
sclr => ExtractKtaParameters_addfpsclr,
ce => ExtractKtaParameters_addfpce,
result => ExtractKtaParameters_addfpr,
rdy => ExtractKtaParameters_addfprdy
);

END;
