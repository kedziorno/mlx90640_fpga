--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:06:15 12/19/2022
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_mem_ramb16_16bit_address_single.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem_ramb16_16bit_address_single
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

ENTITY tb_mem_ramb16_16bit_address_single IS
END tb_mem_ramb16_16bit_address_single;

ARCHITECTURE behavior OF tb_mem_ramb16_16bit_address_single IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT mem_ramb16_16bit_address_single
PORT(
O_DO : OUT  std_logic_vector(31 downto 0);
O_DOP : OUT  std_logic_vector(3 downto 0);
I_ADDR : IN  std_logic_vector(15 downto 0);
I_CLK : IN  std_logic;
I_DI : IN  std_logic_vector(31 downto 0);
I_DIP : IN  std_logic_vector(3 downto 0);
I_EN : IN  std_logic;
I_REGCE : IN  std_logic;
I_SSR : IN  std_logic;
I_WE : IN  std_logic_vector(3 downto 0)
);
END COMPONENT;

--Inputs
signal I_ADDR : std_logic_vector(15 downto 0) := (others => '0');
signal I_CLK : std_logic := '0';
signal I_DI : std_logic_vector(31 downto 0) := (others => '0');
signal I_DIP : std_logic_vector(3 downto 0) := (others => '0');
signal I_EN : std_logic := '0';
signal I_REGCE : std_logic := '0';
signal I_SSR : std_logic := '0';
signal I_WE : std_logic_vector(3 downto 0) := (others => '0');

--Outputs
signal O_DO : std_logic_vector(31 downto 0);
signal O_DOP : std_logic_vector(3 downto 0);

-- Clock period definitions
constant I_CLK_period : time := 10 ns;
signal clock : std_logic := '0';

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut : mem_ramb16_16bit_address_single PORT MAP (
O_DO => O_DO,
O_DOP => O_DOP,
I_ADDR => I_ADDR,
I_CLK => I_CLK,
I_DI => I_DI,
I_DIP => I_DIP,
I_EN => I_EN,
I_REGCE => I_REGCE,
I_SSR => I_SSR,
I_WE => I_WE
);

-- Clock process definitions
I_CLK_process : process
begin
I_CLK <= '0';
wait for I_CLK_period/2;
I_CLK <= '1';
wait for I_CLK_period/2;
end process;

--I_CLK_process : process
--begin
--I_CLK <= '0';
--wait for I_CLK_period;
--I_CLK <= '0';
--wait for I_CLK_period;
--I_CLK <= '1';
--wait for I_CLK_period;
--I_CLK <= '1';
--wait for I_CLK_period;
--end process;

-- Stimulus process
stim_proc : process
begin
-- hold reset state for 100 ns.
I_SSR <= '1';
wait for 100 ns;
I_SSR <= '0';
wait for I_CLK_period*10;

-- insert stimulus here

-- write low
I_WE <= (others => '1');
--wait for I_CLK_period;
--I_DI <= x"deadbeef";
I_DI <= x"abababab";
--wait for I_CLK_period;
--I_ADDR <= "0000" & x"AAA";
I_ADDR <= "0101010101010101";
wait for I_CLK_period;
I_EN <= '1';
wait for I_CLK_period*2;
I_EN <= '0';
wait for I_CLK_period;
I_WE <= (others => '0');
wait for I_CLK_period;

I_EN <= '0';
I_WE <= (others => '0');
I_DI <= (others => '0');
I_ADDR <= (others => '0');
wait for I_CLK_period*10;

-- write hi
I_WE <= (others => '1');
--wait for I_CLK_period;
--I_DI <= x"beefdead";
I_DI <= x"cdcdcdcd";
--wait for I_CLK_period;
I_ADDR <= "1101010101110101";
wait for I_CLK_period;
I_EN <= '1';
wait for I_CLK_period*3;
I_EN <= '0';
wait for I_CLK_period;
I_WE <= (others => '0');
wait for I_CLK_period;

I_EN <= '0';
I_WE <= (others => '0');
I_DI <= (others => '0');
I_ADDR <= (others => '0');
wait for I_CLK_period*10;

-- read low
--I_ADDR <= "0000" & x"AAA";
I_ADDR <= "0101010101010101";
wait for I_CLK_period*2;
I_EN <= '1';
wait for I_CLK_period*2;
I_EN <= '0';
wait for I_CLK_period;

I_EN <= '0';
I_WE <= (others => '0');
I_DI <= (others => '0');
I_ADDR <= (others => '0');
wait for I_CLK_period*10;

-- read hi
--I_ADDR <= "1000" & x"BBB";
I_ADDR <= "1101010101110101";
wait for I_CLK_period*2;
I_EN <= '1';
wait for I_CLK_period*3;
I_EN <= '0';
wait for I_CLK_period;

I_EN <= '0';
I_WE <= (others => '0');
I_DI <= (others => '0');
I_ADDR <= (others => '0');
wait for I_CLK_period*10;

report "done" severity failure;
end process;

END;
