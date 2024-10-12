--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:42:32 01/24/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractTGCParameters.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractTGCParameters
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

use work.p_fphdl_package3.all;

ENTITY tb_ExtractTGCParameters IS
END tb_ExtractTGCParameters;

ARCHITECTURE behavior OF tb_ExtractTGCParameters IS 

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
component ExtractTGCParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_tgc : out std_logic_vector (31 downto 0);
o_rdy : out std_logic;
signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
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
end component ExtractTGCParameters;

--Inputs
signal ExtractTGCParameters_clock : std_logic;
signal ExtractTGCParameters_reset : std_logic;
signal ExtractTGCParameters_run : std_logic;
signal ExtractTGCParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractTGCParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractTGCParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);

--Outputs
signal ExtractTGCParameters_tgc : std_logic_vector (31 downto 0);
signal ExtractTGCParameters_rdy : std_logic;

signal ExtractTGCParameters_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal ExtractTGCParameters_fixed2floatond : STD_LOGIC;
signal ExtractTGCParameters_fixed2floatsclr : STD_LOGIC;
signal ExtractTGCParameters_fixed2floatce : STD_LOGIC;
signal ExtractTGCParameters_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractTGCParameters_fixed2floatrdy : STD_LOGIC;

signal ExtractTGCParameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractTGCParameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractTGCParameters_divfpond : STD_LOGIC;
signal ExtractTGCParameters_divfpsclr : STD_LOGIC;
signal ExtractTGCParameters_divfpce : STD_LOGIC;
signal ExtractTGCParameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractTGCParameters_divfprdy : STD_LOGIC;

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

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => ExtractTGCParameters_clock,
ena => ExtractTGCParameters_i2c_mem_ena,
wea => "0",
addra => ExtractTGCParameters_i2c_mem_addra,
dina => (others => '0'),
douta => ExtractTGCParameters_i2c_mem_douta
);

-- Instantiate the Unit Under Test (UUT)
uut: ExtractTGCParameters port map (
i_clock => ExtractTGCParameters_clock,
i_reset => ExtractTGCParameters_reset,
i_run => ExtractTGCParameters_run,
i2c_mem_ena => ExtractTGCParameters_i2c_mem_ena,
i2c_mem_addra => ExtractTGCParameters_i2c_mem_addra,
i2c_mem_douta => ExtractTGCParameters_i2c_mem_douta,
o_tgc => ExtractTGCParameters_tgc,
o_rdy => ExtractTGCParameters_rdy,
fixed2floata => ExtractTGCParameters_fixed2floata,
fixed2floatond => ExtractTGCParameters_fixed2floatond,
fixed2floatsclr => ExtractTGCParameters_fixed2floatsclr,
fixed2floatce => ExtractTGCParameters_fixed2floatce,
fixed2floatr => ExtractTGCParameters_fixed2floatr,
fixed2floatrdy => ExtractTGCParameters_fixed2floatrdy,
divfpa => ExtractTGCParameters_divfpa,
divfpb => ExtractTGCParameters_divfpb,
divfpond => ExtractTGCParameters_divfpond,
divfpsclr => ExtractTGCParameters_divfpsclr,
divfpce => ExtractTGCParameters_divfpce,
divfpr => ExtractTGCParameters_divfpr,
divfprdy => ExtractTGCParameters_divfprdy
);

-- Clock process definitions
i_clock_process :process
begin
ExtractTGCParameters_clock <= '0';
wait for i_clock_period/2;
ExtractTGCParameters_clock <= '1';
wait for i_clock_period/2;
end process;

-- Stimulus process
stim_proc: process
begin		
-- hold reset state for 100 ns.
ExtractTGCParameters_reset <= '1';
wait for 100 ns;	
ExtractTGCParameters_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
ExtractTGCParameters_run <= '1'; wait for i_clock_period; ExtractTGCParameters_run <= '0';
wait until ExtractTGCParameters_rdy = '1';
warning_neq_fp (ExtractTGCParameters_tgc, x"00000000", "tgc");
report "done" severity failure;
end process;

inst_fixed2float : fixed2float
PORT MAP (
a => ExtractTGCParameters_fixed2floata,
operation_nd => ExtractTGCParameters_fixed2floatond,
clk => ExtractTGCParameters_clock,
sclr => ExtractTGCParameters_fixed2floatsclr,
ce => ExtractTGCParameters_fixed2floatce,
result => ExtractTGCParameters_fixed2floatr,
rdy => ExtractTGCParameters_fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => ExtractTGCParameters_divfpa,
b => ExtractTGCParameters_divfpb,
operation_nd => ExtractTGCParameters_divfpond,
clk => ExtractTGCParameters_clock,
sclr => ExtractTGCParameters_divfpsclr,
ce => ExtractTGCParameters_divfpce,
result => ExtractTGCParameters_divfpr,
rdy => ExtractTGCParameters_divfprdy
);

END;
