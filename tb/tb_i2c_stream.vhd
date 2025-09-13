--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:10:14 09/13/2025
-- Design Name:   
-- Module Name:   /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ipcore_dir/tb_i2c_stream.vhd
-- Project Name:  xilinx_ise_14.7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i2c_stream
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

ENTITY tb_i2c_stream IS
END tb_i2c_stream;

ARCHITECTURE behavior OF tb_i2c_stream IS 

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT i2c_stream
PORT(
i_reset : IN  std_logic;
i_scl : IN  std_logic;
o_sda : OUT  std_logic;
i_mode2 : IN  std_logic;
i_enable : IN  std_logic;
i_addr : IN  std_logic_vector(15 downto 0)
);
END COMPONENT;

--Inputs
signal i_reset : std_logic := '0';
signal i_scl : std_logic := '0';
signal i_mode2 : std_logic := '0';
signal i_enable : std_logic := '0';
signal i_addr : std_logic_vector(15 downto 0) := (others => '0');

--Outputs
signal o_sda : std_logic;
-- No clocks detected in port list. Replace scl below with 
-- appropriate port name 

constant scl_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: i2c_stream PORT MAP (
i_reset => i_reset,
i_scl => i_scl,
o_sda => o_sda,
i_mode2 => i_mode2,
i_enable => i_enable,
i_addr => i_addr
);

-- Clock process definitions
scl_process :process
begin
i_scl <= '0';
wait for scl_period/2;
i_scl <= '1';
wait for scl_period/2;
end process;

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 100 ns;
wait for scl_period*10;
-- insert stimulus here
i_enable <= '1';
i_mode2 <= '1';
i_addr <= x"2400";
wait;
end process;

END;
