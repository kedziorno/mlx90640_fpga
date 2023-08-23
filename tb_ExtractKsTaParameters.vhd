--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:50:09 01/24/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractKsTaParameters.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractKsTaParameters
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
--USE ieee.numeric_std.ALL;

ENTITY tb_ExtractKsTaParameters IS
END tb_ExtractKsTaParameters;

ARCHITECTURE behavior OF tb_ExtractKsTaParameters IS 

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
COMPONENT ExtractKsTaParameters
PORT(
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_ksta : out std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
END COMPONENT;

signal ExtractKsTaParameters_clock : std_logic;
signal ExtractKsTaParameters_reset : std_logic;
signal ExtractKsTaParameters_run : std_logic;
signal ExtractKsTaParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractKsTaParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKsTaParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKsTaParameters_ksta : std_logic_vector (31 downto 0);
signal ExtractKsTaParameters_rdy : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => ExtractKsTaParameters_clock,
ena => ExtractKsTaParameters_i2c_mem_ena,
wea => "0",
addra => ExtractKsTaParameters_i2c_mem_addra,
dina => (others => '0'),
douta => ExtractKsTaParameters_i2c_mem_douta
);

-- Instantiate the Unit Under Test (UUT)
uut: ExtractKsTaParameters PORT MAP (
i_clock => ExtractKsTaParameters_clock,
i_reset => ExtractKsTaParameters_reset,
i_run => ExtractKsTaParameters_run,
i2c_mem_ena => ExtractKsTaParameters_i2c_mem_ena,
i2c_mem_addra => ExtractKsTaParameters_i2c_mem_addra,
i2c_mem_douta => ExtractKsTaParameters_i2c_mem_douta,
o_ksta => ExtractKsTaParameters_ksta,
o_rdy => ExtractKsTaParameters_rdy
);

-- Clock process definitions
i_clock_process :process
begin
ExtractKsTaParameters_clock <= '0';
wait for i_clock_period/2;
ExtractKsTaParameters_clock <= '1';
wait for i_clock_period/2;
end process;


-- Stimulus process
stim_proc: process
begin		
-- hold reset state for 100 ns.
ExtractKsTaParameters_reset <= '1';
wait for 100 ns;	
ExtractKsTaParameters_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here 
ExtractKsTaParameters_run <= '1'; wait for i_clock_period; ExtractKsTaParameters_run <= '0';
wait until ExtractKsTaParameters_rdy = '1';
wait for 1 ps;
report "done" severity failure;
end process;

END;
