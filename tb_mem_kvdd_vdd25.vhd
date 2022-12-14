--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:10:29 12/14/2022
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_mem_kvdd.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem_kvdd
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

ENTITY tb_mem_kvdd_vdd25 IS
END tb_mem_kvdd_vdd25;

ARCHITECTURE behavior OF tb_mem_kvdd_vdd25 IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT mem_kvdd_vdd25
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_clka : IN  std_logic;
i_address : IN  std_logic_vector(7 downto 0);
o_data_kvdd : OUT  std_logic_vector(15 downto 0);
o_data_vdd25 : OUT  std_logic_vector(15 downto 0)
);
END COMPONENT;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_clka : std_logic := '0';
signal i_address : std_logic_vector(7 downto 0);

--Outputs
signal o_data_kvdd : std_logic_vector(15 downto 0);
signal o_data_vdd25 : std_logic_vector(15 downto 0);

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: mem_kvdd_vdd25 PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_clka => i_clka,
i_address => i_address,
o_data_kvdd => o_data_kvdd,
o_data_vdd25 => o_data_vdd25
);

-- Clock process definitions
i_clock_process : process
begin
i_clock <= '0';
wait for i_clock_period/2;
i_clock <= '1';
wait for i_clock_period/2;
end process;

-- Stimulus process
stim_proc : process
begin
-- hold reset state for 100 ns.
i_reset <= '1';
wait for 100 ns;
wait for i_clock_period*10;
i_reset <= '0';
-- insert stimulus here
l0 : for i in 0 to 257 loop
	i_address <= std_logic_vector(to_unsigned(i,8));
	wait for i_clock_period;
end loop l0;
i_address <= x"33";
wait for i_clock_period;
report "done" severity failure;
end process;

END;
