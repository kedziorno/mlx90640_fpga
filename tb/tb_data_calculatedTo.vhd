-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE work.global_package.ALL;

ENTITY tb_data_calculateTo_1 IS
END tb_data_calculateTo_1;

ARCHITECTURE behavior OF tb_data_calculateTo_1 IS 

-- Component Declaration
COMPONENT tb_data_calculateTo
PORT (
clka : IN STD_LOGIC;
ena : IN STD_LOGIC;
addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END COMPONENT;

signal clka : STD_LOGIC := '0';
signal ena : STD_LOGIC := '0';
signal addra : STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '0');
signal douta : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');

signal outr : real;

BEGIN

-- Component Instantiation
uut: COMPONENT tb_data_calculateTo
PORT MAP (
clka => clka, 
ena => ena,
addra => addra,
douta => douta
);

clka <= not clka after 10 ns;

outr <= ap_slv2fp (douta);

--  Test Bench Statements
tb : PROCESS
BEGIN
wait for 100 ns; -- wait until global set/reset completes
-- Add user defined stimulus here
ena <= '1';
for i in 0 to 767 loop
addra <= std_logic_vector (to_unsigned (i, 10));
wait for 20 ns;
end loop;
report "done" severity failure; -- will wait forever
END PROCESS tb;
--  End Test Bench 

END;
