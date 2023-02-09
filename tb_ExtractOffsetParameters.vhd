--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:28 01/29/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractOffsetParameters.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractOffsetParameters
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

ENTITY tb_ExtractOffsetParameters IS
END tb_ExtractOffsetParameters;

ARCHITECTURE behavior OF tb_ExtractOffsetParameters IS 

-- Component Declaration for the Unit Under Test (UUT)

component ExtractOffsetParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2410 : in slv16; -- 1-occremscale,2-occcolumnscale,3-occrowscale
i_offsetref : in fd2ft; -- offsetref from fixed2float

i_ee0x2412 : in slv16; -- occrow1-4
i_ee0x2413 : in slv16; -- occrow5-8
i_ee0x2414 : in slv16; -- occrow9-12
i_ee0x2415 : in slv16; -- occrow13-16
i_ee0x2416 : in slv16; -- occrow17-20
i_ee0x2417 : in slv16; -- occrow21-24

i_ee0x2418 : in slv16; -- occcol1-4
i_ee0x2419 : in slv16; -- occcol5-8
i_ee0x241a : in slv16; -- occcol9-12
i_ee0x241b : in slv16; -- occcol13-16
i_ee0x241c : in slv16; -- occcol17-20
i_ee0x241d : in slv16; -- occcol21-24
i_ee0x241e : in slv16; -- occcol25-28
i_ee0x241f : in slv16; -- occcol29-32

i_ee0x2440 : in slv16; -- offset ROWS*COLS

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_done : out std_logic;
o_rdy : out std_logic
);
end component ExtractOffsetParameters;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_run : std_logic := '0';
signal i_ee0x2410 : slv16 := (others => '0');
signal i_offsetref : fd2ft := (others => '0');
signal i_ee0x2412 : slv16 := (others => '0');
signal i_ee0x2413 : slv16 := (others => '0');
signal i_ee0x2414 : slv16 := (others => '0');
signal i_ee0x2415 : slv16 := (others => '0');
signal i_ee0x2416 : slv16 := (others => '0');
signal i_ee0x2417 : slv16 := (others => '0');
signal i_ee0x2418 : slv16 := (others => '0');
signal i_ee0x2419 : slv16 := (others => '0');
signal i_ee0x241a : slv16 := (others => '0');
signal i_ee0x241b : slv16 := (others => '0');
signal i_ee0x241c : slv16 := (others => '0');
signal i_ee0x241d : slv16 := (others => '0');
signal i_ee0x241e : slv16 := (others => '0');
signal i_ee0x241f : slv16 := (others => '0');
signal i_ee0x2440 : slv16 := (others => '0');

--Outputs
signal o_done : std_logic;
signal o_rdy : std_logic;

signal o_do : std_logic_vector (31 downto 0) := (others => '0');
signal i_addr : std_logic_vector (9 downto 0) := (others => '0');

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (o_do); -- output data

-- Instantiate the Unit Under Test (UUT)
uut: ExtractOffsetParameters PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
i_ee0x2410 => i_ee0x2410,
i_offsetRef => i_offsetRef,
i_ee0x2412 => i_ee0x2412,
i_ee0x2413 => i_ee0x2413,
i_ee0x2414 => i_ee0x2414,
i_ee0x2415 => i_ee0x2415,
i_ee0x2416 => i_ee0x2416,
i_ee0x2417 => i_ee0x2417,
i_ee0x2418 => i_ee0x2418,
i_ee0x2419 => i_ee0x2419,
i_ee0x241a => i_ee0x241a,
i_ee0x241b => i_ee0x241b,
i_ee0x241c => i_ee0x241c,
i_ee0x241d => i_ee0x241d,
i_ee0x241e => i_ee0x241e,
i_ee0x241f => i_ee0x241f,
i_ee0x2440 => i_ee0x2440,
o_do => o_do,
i_addr => i_addr,
o_done => o_done,
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
i_ee0x2410 <= x"4210"; -- occrow,occcolumn,occremnant,k_ptat
i_ee0x2440 <= x"08a0";
i_offsetRef <= x"477FBB00"; -- 65467

i_ee0x2412 <= x"0202";
i_ee0x2413 <= x"f202";
i_ee0x2414 <= x"f2f2";
i_ee0x2415 <= x"e2e2";
i_ee0x2416 <= x"d1e1";
i_ee0x2417 <= x"b1d1";

i_ee0x2418 <= x"f10f";
i_ee0x2419 <= x"f00f";
i_ee0x241a <= x"e0ef";
i_ee0x241b <= x"e0ef";
i_ee0x241c <= x"e1e1";
i_ee0x241d <= x"f3f2";
i_ee0x241e <= x"f404";
i_ee0x241f <= x"e504";
i_run <= '1'; wait for i_clock_period; i_run <= '0';
wait until o_rdy = '1';
for i in 0 to 1024 loop
	i_addr <= std_logic_vector (to_unsigned (i, 10));
	wait for i_clock_period*2;
end loop;
wait for 1 ps; -- must be for write
report "done" severity failure;
--wait on o_done;
end process;

END;
