-- TestBench Template 
-- CalculateAlphaCP

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.p_fphdl_package1.all;

ENTITY tb_CalculateAlphaCP IS
END tb_CalculateAlphaCP;

ARCHITECTURE behavior OF tb_CalculateAlphaCP IS 

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
component CalculateAlphaCP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_acpsubpage0 : out fd2ft;
o_acpsubpage1 : out fd2ft;
o_rdy : out std_logic
);
end component CalculateAlphaCP;

signal CalculateAlphaCP_clock : std_logic;
signal CalculateAlphaCP_reset : std_logic;
signal CalculateAlphaCP_run : std_logic;
signal CalculateAlphaCP_i2c_mem_ena : STD_LOGIC;
signal CalculateAlphaCP_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculateAlphaCP_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculateAlphaCP_acpsubpage0 : fd2ft;
signal CalculateAlphaCP_acpsubpage1 : fd2ft;
signal CalculateAlphaCP_rdy : std_logic;

constant clockperiod : time := 10 ns;

BEGIN

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculateAlphaCP_clock,
ena => CalculateAlphaCP_i2c_mem_ena,
wea => "0",
addra => CalculateAlphaCP_i2c_mem_addra,
dina => (others => '0'),
douta => CalculateAlphaCP_i2c_mem_douta
);

-- Component Instantiation
uut: CalculateAlphaCP
port map (
i_clock => CalculateAlphaCP_clock,
i_reset => CalculateAlphaCP_reset,
i_run => CalculateAlphaCP_run,
i2c_mem_ena => CalculateAlphaCP_i2c_mem_ena,
i2c_mem_addra => CalculateAlphaCP_i2c_mem_addra,
i2c_mem_douta => CalculateAlphaCP_i2c_mem_douta,
o_acpsubpage0 => CalculateAlphaCP_acpsubpage0,
o_acpsubpage1 => CalculateAlphaCP_acpsubpage1,
o_rdy => CalculateAlphaCP_rdy
);

cp : process is
begin
	CalculateAlphaCP_clock <= '0';
	wait for clockperiod/2;
	CalculateAlphaCP_clock <= '1';
	wait for clockperiod/2;
end process cp;

--  Test Bench Statements
tbprocess : PROCESS
BEGIN
CalculateAlphaCP_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
CalculateAlphaCP_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod*10;
CalculateAlphaCP_run <= '1'; wait for clockperiod; CalculateAlphaCP_run <= '0';
wait until CalculateAlphaCP_rdy = '1';
wait for 1 ps;
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

END architecture behavior;
