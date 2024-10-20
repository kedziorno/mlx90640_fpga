-- Vhdl test bench created from schematic /home/user/workspace/melexis_mlx90641/mem_ramb16_s36_s36_x2.sch - Fri Jun  9 22:29:47 2023
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY mem_ramb16_s36_s36_x2_mem_ramb16_s36_s36_x2_sch_tb IS
END mem_ramb16_s36_s36_x2_mem_ramb16_s36_s36_x2_sch_tb;
ARCHITECTURE behavioral OF 
mem_ramb16_s36_s36_x2_mem_ramb16_s36_s36_x2_sch_tb IS 

COMPONENT rom_ktptat
PORT( ADDRA	:	IN	STD_LOGIC_VECTOR (9 DOWNTO 0); 
i_clock	:	IN	STD_LOGIC; 
i_reset	:	IN	STD_LOGIC; 
DOA	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0));
END COMPONENT;

SIGNAL ADDRA	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
SIGNAL i_clock	:	STD_LOGIC;
SIGNAL i_reset	:	STD_LOGIC;
SIGNAL DOA	:	STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN

UUT: rom_ktptat PORT MAP(
ADDRA => ADDRA, 
i_clock => i_clock, 
i_reset => i_reset, 
DOA => DOA
);

cp : process is
begin
i_clock <= '0';
wait for 10 ns;
i_clock <= '1';
wait for 10 ns;
end process cp;

-- *** Test Bench - User Defined Section ***
tb : PROCESS
BEGIN
i_reset <= '1';
wait for 100 ns;
i_reset <= '0';
ADDRA <= "0000000000";
wait for 100 ns;
ADDRA <= "1101010101";
--ADDRA <= "0000000001";
wait for 100 ns;
report "done tb" severity failure;
END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
