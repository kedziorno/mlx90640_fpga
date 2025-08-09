--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:23:05 01/28/2022
-- Design Name:   
-- Module Name:   /home/user/workspace/vhdl_projects/myown_i2c/tb_my_i2c_pc2.vhd
-- Project Name:  myown_i2c
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: my_i2c_pc2
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
USE ieee.numeric_std.ALL;
use work.global_package.all; 
 
ENTITY tb_melexis_mlx90640_i2c IS
END tb_melexis_mlx90640_i2c;

ARCHITECTURE sim OF tb_melexis_mlx90640_i2c IS

constant N : integer := 20;

component melexis_mlx90640_i2c is
generic (
c_board_clock : integer := c_clock_board_frequency;
c_bus_clock : integer := c_clock_i2c_frequency
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_slave_address : in std_logic_vector (c_i2c_address_bits - 1 downto 0);
i_mode0 : in std_logic; -- W(A)/4b(A)
i_mode1 : in std_logic; -- W(A)/2b(A),ST,R(A)/2b(NA)
i_mode2 : in std_logic; -- W(A)/2b(A),ST,R(A)/2*N(NA)
i_memory_address : in std_logic_vector (0 to 15);
i_memory_data : in std_logic_vector (0 to 15);
o_bytes_to_recv : out std_logic_vector (0 to 15);
i_rw : in std_logic;
i_enable : in std_logic;
o_busy : out std_logic;
io_sda : inout std_logic;
io_scl : inout std_logic
);
end component melexis_mlx90640_i2c;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_slave_address : std_logic_vector (c_i2c_address_bits - 1 downto 0) := "0110011";
--signal i_slave_address : std_logic_vector (c_i2c_address_bits - 1 downto 0) := "1111111";
--signal i_slave_address : std_logic_vector (c_i2c_address_bits - 1 downto 0) := "0000000";
signal i_memory_address : std_logic_vector (0 to 15);
signal i_memory_data : std_logic_vector (0 to 15);
signal o_bytes_to_recv : std_logic_vector (0 to 15);
signal i_rw : std_logic;
signal i_enable : std_logic := '0';

signal i_mode0 : std_logic; -- W(A)/4b(A)
signal i_mode1 : std_logic; -- W(A)/2b(A),ST,R(A)/2b(NA)
signal i_mode2 : std_logic; -- W(A)/2b(A),ST,R(A)/2*N(NA)

--Outputs
signal o_busy : std_logic;
signal io_sda : std_logic;
signal io_scl : std_logic;

-- Clock period definitions
--constant i_clock_period : time := 18.368 us;
--constant i_clock_period : time := 0.23368*2 us;
--constant i_clock_period : time := 0.125 us; -- 400 khz - 2.5us / N (line ~50)
constant i_clock_period : time := 10 ns; -- board clock

constant V : integer := 4; -- num bytes to send
constant T : time := (1+7+1+(V*(8+1))+1) * i_clock_period; -- start,address,rw,ack,N byte+ack,stop
--constant T : time := 0 * i_clock_period;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut : melexis_mlx90640_i2c
PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_slave_address => i_slave_address,
i_mode0 => i_mode0,
i_mode1 => i_mode1,
i_mode2 => i_mode2,
i_memory_address => i_memory_address,
i_memory_data => i_memory_data,
o_bytes_to_recv => o_bytes_to_recv,
i_rw => i_rw,
i_enable => i_enable,
o_busy => o_busy,
io_sda => io_sda,
io_scl => io_scl
);

-- Clock process definitions
i_clock_process :process
begin
i_clock <= not i_clock;
wait for i_clock_period/2;
end process;

--i_reset <= '1', '0' after 2000 ns;
i_reset <= '1', '0' after 5*i_clock_period;
--i_reset <= i_clock;

--i_enable <= '1', '0' after T * N;
--i_enable <= '1';

-- Stimulus process
stim_proc : process
	type adata is array(0 to V-1) of std_logic_vector(0 to 32);
	variable vdata : adata := ( -- w = 0, r = 1
    x"aa55"&'1'&x"1111",
    x"0000"&'1'&x"0000",
		x"800d"&'0'&x"1901",
		x"ffff"&'0'&x"ffff"
	);
begin
wait for i_clock_period*500; -- cold start
--i_enable <= '1';
i_mode0 <= '1';
i_mode1 <= '0';
i_mode2 <= '0';
l0 : for i in 0 to V-1 loop
  i_enable <= '1';
	i_memory_address <= vdata(i)(0 to 15);
  i_rw <= vdata(i)(16);
  i_memory_data <= vdata(i)(17 to 32);
  wait for 1 us;
  wait until o_busy = '0'; -- wait for address and data
  i_enable <= '0';
  wait for i_clock_period;
--  wait for 100 us;
end loop l0;
wait for 1 ms;
i_mode0 <= '0';
i_mode1 <= '1';
i_mode2 <= '0';
l1 : for i in 0 to V-1 loop
  i_enable <= '1';
	i_memory_address <= vdata(i)(0 to 15);
  i_rw <= vdata(i)(16);
  i_memory_data <= vdata(i)(17 to 32);
  wait for 1 us;
  wait until o_busy = '0'; -- wait for address and data
  i_enable <= '0';
  wait for i_clock_period;
--  wait for 100 us;
end loop l1;
wait for 1 ms;
i_mode0 <= '0';
i_mode1 <= '0';
i_mode2 <= '1';
l2 : for i in 0 to V-1 loop
  i_enable <= '1';
	i_memory_address <= vdata(i)(0 to 15);
  i_rw <= vdata(i)(16);
  i_memory_data <= vdata(i)(17 to 32);
  wait for 1 us;
  wait until o_busy = '0'; -- wait for address and data
  i_enable <= '0';
  wait for i_clock_period;
--  wait for 100 us;
end loop l2;
wait for 2 us;
report "done" severity failure;
end process;

END;
