-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   14:59:22 01/06/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   melexis_mlx9064x
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Testbench of core module
--                FIX THIS AND USE SOME VALUES TO ASSERT
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
--      tb_i2c_mem
--    - Processes (Architecture: tb):
--      p_clock_generator, p_tb, p_tb_run
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

USE work.global_package.all;

ENTITY tb_melexis_mlx9064x IS
END tb_melexis_mlx9064x;

ARCHITECTURE tb OF tb_melexis_mlx9064x IS

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

signal tb_i2c_mem_clka : STD_LOGIC;
signal tb_i2c_mem_ena : STD_LOGIC;
signal tb_i2c_mem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal tb_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal tb_i2c_mem_dina : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal tb_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);

-- Component Declaration
component melexis_mlx9064x is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_rdy : out std_logic;
i_addr : in std_logic_vector(9 downto 0);
o_do : out std_logic_vector(31 downto 0)
);
end component melexis_mlx9064x;

SIGNAL i_clock :  std_logic;
SIGNAL i_reset :  std_logic;
SIGNAL i_run :  std_logic;
SIGNAL o_do :  std_logic_vector (31 downto 0);
SIGNAL i_addr :  std_logic_vector (9 downto 0);
SIGNAL o_rdy :  std_logic;

constant clock_period : time := 20 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (o_do); -- output data

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => i_clock,
ena => tb_i2c_mem_ena,
wea => "0",
addra => tb_i2c_mem_addra,
dina => (others => '0'),
douta => tb_i2c_mem_douta
);

-- Component Instantiation
melexis_mlx9064x_uut : melexis_mlx9064x
port map (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
i2c_mem_ena => tb_i2c_mem_ena,
i2c_mem_addra => tb_i2c_mem_addra,
i2c_mem_douta => tb_i2c_mem_douta,
o_rdy => o_rdy,
i_addr => i_addr,
o_do => o_do
);

p_clock_generator: process
begin
i_clock <= '0';
wait for clock_period/2;
i_clock <= '1';
wait for clock_period/2;
end process p_clock_generator;

--  Test Bench Statements
p_tb_run : PROCESS
BEGIN
i_reset <= '1';
wait for 600 ns; -- wait until global set/reset completes
i_reset <= '0';
-- Add user defined stimulus here
i_run <= '1';
wait for clock_period*1;
i_run <= '0';
wait; -- will wait forever
END PROCESS p_tb_run;

p_tb : PROCESS
BEGIN
--wait for 1.5 ms;
wait until o_rdy = '1';
for i in 0 to 1024 loop
	i_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for clock_period*2;
end loop;
wait for 1 ps; -- must be for write
report "tb - To done simulation To - tb" severity failure;
END PROCESS p_tb;

END ARCHITECTURE tb;

