--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:19:24 10/08/2024
-- Design Name:   
-- Module Name:   /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/tb_rom_constants.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rom_constants
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

ENTITY tb_rom_constants IS
END tb_rom_constants;

ARCHITECTURE behavior OF tb_rom_constants IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT rom_constants
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_kvptat_en : IN  std_logic;
i_kvptat_adr : IN  std_logic_vector(5 downto 0);
i_alphaptat_en : IN  std_logic;
i_alphaptat_adr : IN  std_logic_vector(3 downto 0);
i_signed4bit_en : IN  std_logic;
i_signed4bit_adr : IN  std_logic_vector(3 downto 0);
i_signed6bit_en : IN  std_logic;
i_signed6bit_adr : IN  std_logic_vector(5 downto 0);
i_alphascale_1_en : IN  std_logic;
i_alphascale_1_adr : IN  std_logic_vector(3 downto 0);
i_2powx_4bit_en : IN  std_logic;
i_2powx_4bit_adr : IN  std_logic_vector(3 downto 0);
i_cpratio_en : IN  std_logic;
i_cpratio_adr : IN  std_logic_vector(5 downto 0);
i_alphascale_2_en : IN  std_logic;
i_alphascale_2_adr : IN  std_logic_vector(3 downto 0);
i_2powx_p8_4bit_en : IN  std_logic;
i_2powx_p8_4bit_adr : IN  std_logic_vector(3 downto 0);
i_signed3bit_en : IN  std_logic;
i_signed3bit_adr : IN  std_logic_vector(2 downto 0);
o_float : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_kvptat_en : std_logic := '0';
signal i_kvptat_adr : std_logic_vector(5 downto 0) := (others => '0');
signal i_alphaptat_en : std_logic := '0';
signal i_alphaptat_adr : std_logic_vector(3 downto 0) := (others => '0');
signal i_signed4bit_en : std_logic := '0';
signal i_signed4bit_adr : std_logic_vector(3 downto 0) := (others => '0');
signal i_signed6bit_en : std_logic := '0';
signal i_signed6bit_adr : std_logic_vector(5 downto 0) := (others => '0');
signal i_alphascale_1_en : std_logic := '0';
signal i_alphascale_1_adr : std_logic_vector(3 downto 0) := (others => '0');
signal i_2powx_4bit_en : std_logic := '0';
signal i_2powx_4bit_adr : std_logic_vector(3 downto 0) := (others => '0');
signal i_cpratio_en : std_logic := '0';
signal i_cpratio_adr : std_logic_vector(5 downto 0) := (others => '0');
signal i_alphascale_2_en : std_logic := '0';
signal i_alphascale_2_adr : std_logic_vector(3 downto 0) := (others => '0');
signal i_2powx_p8_4bit_en : std_logic := '0';
signal i_2powx_p8_4bit_adr : std_logic_vector(3 downto 0) := (others => '0');
signal i_signed3bit_en : std_logic := '0';
signal i_signed3bit_adr : std_logic_vector(2 downto 0) := (others => '0');

--Outputs
signal o_float : std_logic_vector(31 downto 0);

-- Clock period definitions
constant i_clock_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut : rom_constants PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_kvptat_en => i_kvptat_en,
i_kvptat_adr => i_kvptat_adr,
i_alphaptat_en => i_alphaptat_en,
i_alphaptat_adr => i_alphaptat_adr,
i_signed4bit_en => i_signed4bit_en,
i_signed4bit_adr => i_signed4bit_adr,
i_signed6bit_en => i_signed6bit_en,
i_signed6bit_adr => i_signed6bit_adr,
i_alphascale_1_en => i_alphascale_1_en,
i_alphascale_1_adr => i_alphascale_1_adr,
i_2powx_4bit_en => i_2powx_4bit_en,
i_2powx_4bit_adr => i_2powx_4bit_adr,
i_cpratio_en => i_cpratio_en,
i_cpratio_adr => i_cpratio_adr,
i_alphascale_2_en => i_alphascale_2_en,
i_alphascale_2_adr => i_alphascale_2_adr,
i_2powx_p8_4bit_en => i_2powx_p8_4bit_en,
i_2powx_p8_4bit_adr => i_2powx_p8_4bit_adr,
i_signed3bit_en => i_signed3bit_en,
i_signed3bit_adr => i_signed3bit_adr,
o_float => o_float
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
i_reset <= '0';
wait for i_clock_period*10+5 ns;
-- insert stimulus here

i_kvptat_en <= '1';
i_kvptat_adr <= std_logic_vector (to_unsigned (63, 6));
wait for i_clock_period;
i_kvptat_en <= '0';
wait for i_clock_period;
assert (o_float = x"b9800000") report "kvptat";

i_alphaptat_en <= '1';
i_alphaptat_adr <= std_logic_vector (to_unsigned (15, 4));
wait for i_clock_period;
i_alphaptat_en <= '0';
wait for i_clock_period;
assert (o_float = x"413c0000") report "alphaptat";

i_signed4bit_en <= '1';
i_signed4bit_adr <= std_logic_vector (to_unsigned (15, 4));
wait for i_clock_period;
i_signed4bit_en <= '0';
wait for i_clock_period;
assert (o_float = x"bf800000") report "signed4bit";

i_signed6bit_en <= '1';
i_signed6bit_adr <= std_logic_vector (to_unsigned (63, 6));
wait for i_clock_period;
i_signed6bit_en <= '0';
wait for i_clock_period;
assert (o_float = x"bf800000") report "signed6bit";

i_alphascale_1_en <= '1';
i_alphascale_1_adr <= std_logic_vector (to_unsigned (15, 4));
wait for i_clock_period;
i_alphascale_1_en <= '0';
wait for i_clock_period;
assert (o_float = x"56000000") report "alphascale_1";

i_2powx_4bit_en <= '1';
i_2powx_4bit_adr <= std_logic_vector (to_unsigned (15, 4));
wait for i_clock_period;
i_2powx_4bit_en <= '0';
wait for i_clock_period;
assert (o_float = x"47000000") report "2powx_4bit";

i_cpratio_en <= '1';
i_cpratio_adr <= std_logic_vector (to_unsigned (63, 6));
wait for i_clock_period;
i_cpratio_en <= '0';
wait for i_clock_period;
assert (o_float = x"3f7e0000") report "cpratio";

i_alphascale_2_en <= '1';
i_alphascale_2_adr <= std_logic_vector (to_unsigned (15, 4));
wait for i_clock_period;
i_alphascale_2_en <= '0';
wait for i_clock_period;
assert (o_float = x"54800000") report "alphascale_2";

i_2powx_p8_4bit_en <= '1';
i_2powx_p8_4bit_adr <= std_logic_vector (to_unsigned (15, 4));
wait for i_clock_period;
i_2powx_p8_4bit_en <= '0';
wait for i_clock_period;
assert (o_float = x"4b000000") report "2powx_p8_4bit";

i_signed3bit_en <= '1';
i_signed3bit_adr <= std_logic_vector (to_unsigned (7, 3));
wait for i_clock_period;
i_signed3bit_en <= '0';
wait for i_clock_period;
assert (o_float = x"bf800000") report "signed3bit";

wait for i_clock_period*2;
report "tb done" severity failure;
end process;

END;
