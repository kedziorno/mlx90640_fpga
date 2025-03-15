--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:47:51 01/24/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractKtPTATParameter.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractKtPTATParameter
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

ENTITY tb_ExtractKtPTATParameter IS
END tb_ExtractKtPTATParameter;

ARCHITECTURE behavior OF tb_ExtractKtPTATParameter IS 

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT ExtractKtPTATParameter
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2432 : IN  std_logic_vector(15 downto 0);
o_ktptat : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;


--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_ee0x2432 : std_logic_vector(15 downto 0) := (others => '0');

--Outputs
signal o_ktptat : std_logic_vector(31 downto 0);

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: ExtractKtPTATParameter PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_ee0x2432 => i_ee0x2432,
o_ktptat => o_ktptat
);

-- Clock process definitions
i_clock_process :process
begin
i_clock <= '0';
wait for i_clock_period/2;
i_clock <= '1';
wait for i_clock_period/2;
end process;


-- Stimulus process
stim_proc: process
begin		
-- hold reset state for 100 ns.
i_reset <= '1';
wait for 100 ns;	
i_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here 
i_ee0x2432 <= x"5952";
wait for i_clock_period*2;
--i_ee0x2432 <= x"5f52";
--wait for i_clock_period*2;
report "done" severity failure;
end process;

END;
