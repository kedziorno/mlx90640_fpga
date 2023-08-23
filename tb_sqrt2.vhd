--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:35:59 01/11/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_sqrt2.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sqrt2
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
 
ENTITY tb_sqrt2 IS
END tb_sqrt2;
 
ARCHITECTURE behavior OF tb_sqrt2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sqrt2
    PORT(
         x_in : IN  std_logic_vector(43 downto 0);
         x_out : OUT  std_logic_vector(22 downto 0);
         rdy : OUT  std_logic;
         clk : IN  std_logic;
         ce : IN  std_logic;
         sclr : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x_in : std_logic_vector(43 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal ce : std_logic := '1';
   signal sclr : std_logic := '0';

 	--Outputs
   signal x_out : std_logic_vector(22 downto 0);
   signal rdy : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sqrt2 PORT MAP (
          x_in => x_in,
          x_out => x_out,
          rdy => rdy,
          clk => clk,
          ce => ce,
          sclr => sclr
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
			sclr <= '1';
      wait for 100 ns;	
      sclr <= '0';
      wait for clk_period*10;
      -- insert stimulus here 
      x_in <= std_logic_vector(to_unsigned(36,44));
      wait;
   end process;

END;
