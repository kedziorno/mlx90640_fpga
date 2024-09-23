-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
--use ieee_proposed.fixed_float_types.all;
--use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.numeric_std_additions.all;
--use ieee_proposed.standard_additions.all;
--use ieee_proposed.standard_textio_additions.all;
--use ieee_proposed.std_logic_1164_additions.all;

----use work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

ENTITY tb_test_fixed_melexis IS
END tb_test_fixed_melexis;

ARCHITECTURE arch OF tb_test_fixed_melexis IS

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
component test_fixed_melexis is
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
end component test_fixed_melexis;

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

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => i_clock,
ena => tb_i2c_mem_ena,
wea => "0",
addra => tb_i2c_mem_addra,
dina => (others => '0'),
douta => tb_i2c_mem_douta
);

-- Component Instantiation
uut : test_fixed_melexis
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

cp : process
begin
	i_clock <= '0';
	wait for clock_period/2;
	i_clock <= '1';
	wait for clock_period/2;
end process cp;

--  Test Bench Statements
tb_run: PROCESS
BEGIN
i_reset <= '1';
wait for 600 ns; -- wait until global set/reset completes
i_reset <= '0';
-- Add user defined stimulus here
i_run <= '1';
wait for clock_period*1;
i_run <= '0';
wait; -- will wait forever
END PROCESS tb_run;
--  End Test Bench

tb_wait : PROCESS
BEGIN
--wait for 1.5 ms;
wait until o_rdy = '1';
for i in 0 to 1024 loop
	i_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for clock_period*2;
end loop;
wait for 1 ps; -- must be for write
report "tb - To done simulation To - tb" severity failure;
END PROCESS tb_wait;

END ARCHITECTURE arch;
