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

USE work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY tb_calculateAcc IS
END tb_calculateAcc;

ARCHITECTURE behavior OF tb_calculateAcc IS 

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT calculateAcc
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
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
i_start0x2440 : in std_logic_vector (15 downto 0); -- alphatemp ROWS*COLS
i_start0x2420 : in std_logic_vector (15 downto 0); -- accrowscale,acccolscale,accremnantscale
i_alphaRef : in std_logic_vector (31 downto 0); -- alpharef from fixed2float
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_rdy : OUT  std_logic
);
END COMPONENT;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_run : std_logic := '0';
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
signal i_start0x2420 : std_logic_vector(15 downto 0) := (others => '0');
signal i_start0x2440 : std_logic_vector(15 downto 0) := (others => '0');
signal i_alphaRef : std_logic_vector(31 downto 0) := (others => '0');

--Outputs
signal o_rdy : std_logic;

signal o_do : std_logic_vector (31 downto 0);
signal i_addr : std_logic_vector (9 downto 0); -- 10bit-1024

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (o_do); -- output data

-- Instantiate the Unit Under Test (UUT)
uut: calculateAcc PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
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
i_start0x2420 => i_start0x2420,
i_start0x2440 => i_start0x2440,
i_alphaRef => i_alphaRef,
o_do => o_do,
i_addr => i_addr,
o_rdy => o_rdy
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
i_start0x2420 <= x"8895"; -- alphascale,accrow,acccol,accrem
i_start0x2440 <= x"00ae";
i_alphaRef <= x"000030d9";

i_start0x2422 <= x"abcd";
i_start0x2423 <= x"eff1";
i_start0x2424 <= x"2345";
i_start0x2425 <= x"6789";
i_start0x2426 <= x"abcd";
i_start0x2427 <= x"eff1";

i_start0x2428 <= x"6789";
i_start0x2429 <= x"abcd";
i_start0x242a <= x"eff1";
i_start0x242b <= x"2345";
i_start0x242c <= x"6789";
i_start0x242d <= x"abcd";
i_start0x242e <= x"eff1";
i_start0x242f <= x"2345";
i_run <= '1'; wait for i_clock_period; i_run <= '0';
wait until o_rdy = '1';
for i in 0 to 1024 loop
	i_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period;
end loop;
wait for 1 ps; -- must be for write
report "done" severity failure;
--wait on o_done;
end process;

END;
