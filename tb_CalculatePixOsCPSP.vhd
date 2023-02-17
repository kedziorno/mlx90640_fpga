-- TestBench Template 
-- CalculatePixOS

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_CalculatePixOsCPSP IS
END tb_CalculatePixOsCPSP;

ARCHITECTURE behavior OF tb_CalculatePixOsCPSP IS 

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
component CalculatePixOsCPSP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_KGain : in std_logic_vector (31 downto 0);
i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_VddV0 : in std_logic_vector (31 downto 0);
i_const1 : in std_logic_vector (31 downto 0);
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_pixoscpsp0 : out std_logic_vector (31 downto 0);
o_pixoscpsp1 : out std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
end component CalculatePixOsCPSP;

signal CalculatePixOsCPSP_clock : std_logic;
signal CalculatePixOsCPSP_reset : std_logic;
signal CalculatePixOsCPSP_run : std_logic;
signal CalculatePixOsCPSP_KGain : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_Ta : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_Ta0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_Vdd : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_VddV0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_const1 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_i2c_mem_ena : STD_LOGIC;
signal CalculatePixOsCPSP_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixOsCPSP_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixOsCPSP_pixoscpsp0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_pixoscpsp1 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_rdy : std_logic;

constant clockperiod : time := 10 ns;

BEGIN

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculatePixOsCPSP_clock,
ena => CalculatePixOsCPSP_i2c_mem_ena,
wea => "0",
addra => CalculatePixOsCPSP_i2c_mem_addra,
dina => (others => '0'),
douta => CalculatePixOsCPSP_i2c_mem_douta
);

cp : process is
begin
	CalculatePixOsCPSP_clock <= '0';
	wait for clockperiod/2;
	CalculatePixOsCPSP_clock <= '1';
	wait for clockperiod/2;
end process cp;

-- Component Instantiation
uut : CalculatePixOsCPSP port map (
i_clock => CalculatePixOsCPSP_clock,
i_reset => CalculatePixOsCPSP_reset,
i_run => CalculatePixOsCPSP_run,
i_KGain => CalculatePixOsCPSP_KGain,
i_Ta => CalculatePixOsCPSP_Ta,
i_Ta0 => CalculatePixOsCPSP_Ta0,
i_Vdd => CalculatePixOsCPSP_Vdd,
i_VddV0 => CalculatePixOsCPSP_VddV0,
i_const1 => CalculatePixOsCPSP_const1,
i2c_mem_ena => CalculatePixOsCPSP_i2c_mem_ena,
i2c_mem_addra => CalculatePixOsCPSP_i2c_mem_addra,
i2c_mem_douta => CalculatePixOsCPSP_i2c_mem_douta,
o_pixoscpsp0 => CalculatePixOsCPSP_pixoscpsp0,
o_pixoscpsp1 => CalculatePixOsCPSP_pixoscpsp1,
o_rdy => CalculatePixOsCPSP_rdy
);

--  Test Bench Statements
tb : PROCESS
BEGIN
CalculatePixOsCPSP_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
CalculatePixOsCPSP_reset <= '0';
wait for clockperiod*10;
-- Add user defined stimulus here
CalculatePixOSCPSP_KGain <= x"3F823E9A"; -- 1.01753546947234
CalculatePixOSCPSP_const1 <= x"3F800000"; -- 1
CalculatePixOSCPSP_Ta <= x"421CBC6A"; -- 39.184
CalculatePixOSCPSP_Ta0 <= x"41C80000"; -- 25
CalculatePixOSCPSP_Vdd <= x"40546A7F"; -- 3.319
CalculatePixOSCPSP_VddV0 <= x"40533333"; -- 3.3
CalculatePixOsCPSP_run <= '1'; wait for clockperiod; CalculatePixOsCPSP_run <= '0';
wait until CalculatePixOsCPSP_rdy = '1';
wait for 1 ps;
report "done" severity failure;
END PROCESS tb;
--  End Test Bench 

END ARCHITECTURE behavior;
