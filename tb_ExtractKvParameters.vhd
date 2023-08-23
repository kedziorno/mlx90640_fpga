--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:28 01/29/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractKvParameters.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractKvParameters
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

ENTITY tb_ExtractKvParameters IS
END tb_ExtractKvParameters;

ARCHITECTURE behavior OF tb_ExtractKvParameters IS 

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
component ExtractKvParameters is
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

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC
);
end component ExtractKvParameters;
signal ExtractKvParameters_clock : std_logic;
signal ExtractKvParameters_reset : std_logic;
signal ExtractKvParameters_run : std_logic;
signal ExtractKvParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractKvParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKvParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKvParameters_do : std_logic_vector (31 downto 0);
signal ExtractKvParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractKvParameters_rdy : std_logic;
signal ExtractKvParameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKvParameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKvParameters_divfpond : STD_LOGIC;
signal ExtractKvParameters_divfpsclr : STD_LOGIC;
signal ExtractKvParameters_divfpce : STD_LOGIC;
signal ExtractKvParameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKvParameters_divfprdy : STD_LOGIC;

signal ExtractKvParameters_divfpclk : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (ExtractKvParameters_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => ExtractKvParameters_clock,
ena => ExtractKvParameters_i2c_mem_ena,
wea => "0",
addra => ExtractKvParameters_i2c_mem_addra,
dina => (others => '0'),
douta => ExtractKvParameters_i2c_mem_douta
);
-- Instantiate the Unit Under Test (UUT)
uut: ExtractKvParameters PORT MAP (
i_clock => ExtractKvParameters_clock,
i_reset => ExtractKvParameters_reset,
i_run => ExtractKvParameters_run,

i2c_mem_ena => ExtractKvParameters_i2c_mem_ena,
i2c_mem_addra => ExtractKvParameters_i2c_mem_addra,
i2c_mem_douta => ExtractKvParameters_i2c_mem_douta,

o_do => ExtractKvParameters_do,
i_addr => ExtractKvParameters_addr,
o_rdy => ExtractKvParameters_rdy,

divfpa => ExtractKvParameters_divfpa,
divfpb => ExtractKvParameters_divfpb,
divfpond => ExtractKvParameters_divfpond,
divfpsclr => ExtractKvParameters_divfpsclr,
divfpce => ExtractKvParameters_divfpce,
divfpr => ExtractKvParameters_divfpr,
divfprdy => ExtractKvParameters_divfprdy

);

-- Clock process definitions
i_clock_process :process
begin
ExtractKvParameters_clock <= '0';
wait for i_clock_period/2;
ExtractKvParameters_clock <= '1';
wait for i_clock_period/2;
end process;

ExtractKvParameters_reset <= '1', '0' after 100 ns ;	

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 105 ns;
-- insert stimulus here
ExtractKvParameters_run <= '1'; wait for i_clock_period; ExtractKvParameters_run <= '0';
wait until ExtractKvParameters_rdy = '1';
for i in 0 to 1024 loop
	ExtractKvParameters_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps; -- must be for write
report "done" severity failure;
--wait on o_done;
end process;

ExtractKvParameters_divfpclk <= ExtractKvParameters_clock;
inst_divfp : divfp
PORT MAP (
a => ExtractKvParameters_divfpa,
b => ExtractKvParameters_divfpb,
operation_nd => ExtractKvParameters_divfpond,
clk => ExtractKvParameters_divfpclk,
sclr => ExtractKvParameters_divfpsclr,
ce => ExtractKvParameters_divfpce,
result => ExtractKvParameters_divfpr,
rdy => ExtractKvParameters_divfprdy
);

END;
