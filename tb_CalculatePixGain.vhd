-- TestBench Template 
-- CalculatePixGain

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.p_fphdl_package1.all;

ENTITY tb_CalculatePixGain IS
END tb_CalculatePixGain;

ARCHITECTURE behavior OF tb_CalculatePixGain IS 

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
component CalculatePixGain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_KGain : in fd2ft;

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_done : out std_logic;

o_rdy : out std_logic
);
end component CalculatePixGain;

signal CalculatePixGain_clock : std_logic := '0';
signal CalculatePixGain_reset : std_logic := '0';
signal CalculatePixGain_run : std_logic := '0';
signal CalculatePixGain_i2c_mem_ena : STD_LOGIC := '0';
signal CalculatePixGain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixGain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
signal CalculatePixGain_KGain : fd2ft := (others => '0');
signal CalculatePixGain_do : std_logic_vector (31 downto 0);
signal CalculatePixGain_addr : std_logic_vector (9 downto 0) := (others => '0'); -- 10bit-1024
signal CalculatePixGain_done : std_logic;
signal CalculatePixGain_rdy : std_logic;

constant clockperiod : time := 10 ns;

BEGIN

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculatePixGain_clock,
ena => CalculatePixGain_i2c_mem_ena,
wea => "0",
addra => CalculatePixGain_i2c_mem_addra,
dina => (others => '0'),
douta => CalculatePixGain_i2c_mem_douta
);

cp : process is
begin
CalculatePixGain_clock <= '0';
wait for clockperiod/2;
CalculatePixGain_clock <= '1';
wait for clockperiod/2;
end process cp;

-- Component Instantiation
uut: CalculatePixGain port map (
i_clock => CalculatePixGain_clock,
i_reset => CalculatePixGain_reset,
i_run => CalculatePixGain_run,
i2c_mem_ena => CalculatePixGain_i2c_mem_ena,
i2c_mem_addra => CalculatePixGain_i2c_mem_addra,
i2c_mem_douta => CalculatePixGain_i2c_mem_douta,
i_KGain => CalculatePixGain_KGain,
o_do => CalculatePixGain_do,
i_addr => CalculatePixGain_addr,
o_done => CalculatePixGain_done,
o_rdy => CalculatePixGain_rdy
);

--  Test Bench Statements
tb : PROCESS
BEGIN
CalculatePixGain_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
CalculatePixGain_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod*10;
CalculatePixGain_KGain <= x"3F823E9A";
CalculatePixGain_run <= '1'; wait for clockperiod; CalculatePixGain_run <= '0';
wait until CalculatePixGain_rdy = '1';
for i in 0 to 1024 loop
	CalculatePixGain_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for clockperiod;
end loop;
wait for 1 ps; -- must be for write
report "done" severity failure;
END PROCESS tb;
--  End Test Bench 

END ARCHITECTURE behavior;
