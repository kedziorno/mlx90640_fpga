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

o_done : out std_logic;
o_rdy : out std_logic
);
end component ExtractKvParameters;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_run : std_logic := '0';
signal i_ee0x2410 : slv16 := (others => '0');
signal i_offsetref : fd2ft := (others => '0');
signal i_ee0x2412 : slv16 := (others => '0');
signal i_ee0x2413 : slv16 := (others => '0');
signal i_ee0x2414 : slv16 := (others => '0');
signal i_ee0x2415 : slv16 := (others => '0');
signal i_ee0x2416 : slv16 := (others => '0');
signal i_ee0x2417 : slv16 := (others => '0');
signal i_ee0x2418 : slv16 := (others => '0');
signal i_ee0x2419 : slv16 := (others => '0');
signal i_ee0x241a : slv16 := (others => '0');
signal i_ee0x241b : slv16 := (others => '0');
signal i_ee0x241c : slv16 := (others => '0');
signal i_ee0x241d : slv16 := (others => '0');
signal i_ee0x241e : slv16 := (others => '0');
signal i_ee0x241f : slv16 := (others => '0');
signal i_ee0x2440 : slv16 := (others => '0');

--Outputs
signal o_done : std_logic;
signal o_rdy : std_logic;

signal o_do : std_logic_vector (31 downto 0) := (others => '0');
signal i_addr : std_logic_vector (9 downto 0) := (others => '0');

signal i2c_mem_ena : STD_LOGIC;
signal i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (o_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => i_clock,
ena => i2c_mem_ena,
wea => "0",
addra => i2c_mem_addra,
dina => (others => '0'),
douta => i2c_mem_douta
);
-- Instantiate the Unit Under Test (UUT)
uut: ExtractKvParameters PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,

i2c_mem_ena => i2c_mem_ena,
i2c_mem_addra => i2c_mem_addra,
i2c_mem_douta => i2c_mem_douta,

o_do => o_do,
i_addr => i_addr,
o_done => o_done,
o_rdy => o_rdy
);

-- Clock process definitions
i_clock_process :process
begin
i_clock <= '0';
wait for i_clock_period/2;
i_clock <= '1';
wait for i_clock_period/2;
end process;

i_reset <= '1', '0' after 100 ns ;	

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 105 ns;
-- insert stimulus here
i_run <= '1'; wait for i_clock_period; i_run <= '0';
wait until o_rdy = '1';
for i in 0 to 1024 loop
	i_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps; -- must be for write
report "done" severity failure;
--wait on o_done;
end process;

END;