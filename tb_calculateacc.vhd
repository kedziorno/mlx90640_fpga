--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:28 01/29/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_calculateacc.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: calculateacc
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

ENTITY tb_calculateacc IS
END tb_calculateacc;

ARCHITECTURE behavior OF tb_calculateacc IS 

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT calculateacc
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_start0x2422 : in std_logic_vector (15 downto 0);
i_start0x2423 : in std_logic_vector (15 downto 0);
i_start0x2424 : in std_logic_vector (15 downto 0);
i_start0x2425 : in std_logic_vector (15 downto 0);
i_start0x2426 : in std_logic_vector (15 downto 0);
i_start0x2427 : in std_logic_vector (15 downto 0);
i_start0x2428 : in std_logic_vector (15 downto 0);
i_start0x2429 : in std_logic_vector (15 downto 0);
i_start0x242a : in std_logic_vector (15 downto 0);
i_start0x242b : in std_logic_vector (15 downto 0);
i_start0x242c : in std_logic_vector (15 downto 0);
i_start0x242d : in std_logic_vector (15 downto 0);
i_start0x242e : in std_logic_vector (15 downto 0);
i_start0x242f : in std_logic_vector (15 downto 0);
o_done : OUT  std_logic
);
END COMPONENT;


--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_start0x2422 : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x2423 : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x2424 : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x2425 : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x2426 : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x2427 : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x2428 : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x2429 : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x242a : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x242b : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x242c : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x242d : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x242e : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x242f : std_logic_vector(15 downto 0) := (others => '0');

--Outputs
signal o_done : std_logic;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: calculateacc PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_start0x2422 => i_start0x2422,
i_start0x2423 => i_start0x2423,
i_start0x2424 => i_start0x2424,
i_start0x2425 => i_start0x2425,
i_start0x2426 => i_start0x2426,
i_start0x2427 => i_start0x2427,
i_start0x2428 => i_start0x2428,
i_start0x2429 => i_start0x2429,
i_start0x242a => i_start0x242a,
i_start0x242b => i_start0x242b,
i_start0x242c => i_start0x242c,
i_start0x242d => i_start0x242d,
i_start0x242e => i_start0x242e,
i_start0x242f => i_start0x242f,
o_done => o_done
);

-- Clock process definitions
i_clock_process :process
begin
i_clock <= '0';
wait for i_clock_period/2;
i_clock <= '1';
wait for i_clock_period/2;
end process;

i_reset <= '1', '0' after 100 ns ;	

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 105 ns;
-- insert stimulus here
i_start0x2422 <= x"abcd";
i_start0x2423 <= x"ef01";
i_start0x2424 <= x"2345";
i_start0x2425 <= x"6789";
i_start0x2426 <= x"abcd";
i_start0x2427 <= x"ef01";

i_start0x2428 <= x"6789";
i_start0x2429 <= x"abcd";
i_start0x242a <= x"ef01";
i_start0x242b <= x"2345";
i_start0x242c <= x"6789";
i_start0x242d <= x"abcd";
i_start0x242e <= x"ef01";
i_start0x242f <= x"2345";
wait for 240 ns + 320 ns + 100 ns;
wait for 1 ps; -- must be for write
report "done" severity failure;
end process;

END;
