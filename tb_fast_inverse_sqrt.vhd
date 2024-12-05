--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:35:23 08/29/2024
-- Design Name:   
-- Module Name:   /home/user/workspace/fast_inverse_sqrt/tb_fast_inverse_sqrt.vhd
-- Project Name:  fast_inverse_
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fast_inverse_sqrt
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

ENTITY tb_fast_inverse_sqrt IS
END tb_fast_inverse_sqrt;

ARCHITECTURE behavior OF tb_fast_inverse_sqrt IS 

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT fast_inverse_sqrt
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i_sqrt_original : IN  std_logic_vector(31 downto 0);
o_sqrt_inverse : OUT  std_logic_vector(31 downto 0);
o_done : OUT  std_logic
);
END COMPONENT;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_run : std_logic := '0';
signal i_sqrt_original_fixed : std_logic_vector(63 downto 0) := (others => '0');

--Outputs
signal o_sqrt_inverse_fixed : std_logic_vector(63 downto 0) := (others => '0');
signal o_done : std_logic := '0';

-- Clock period definitions
constant i_clock_period : time := 10 ns;

-- fixed2float
component fi2fl
port (
a            : in  std_logic_vector (63 downto 0) := (others => '0');
operation_nd : in  std_logic;
clk          : in  std_logic;
sclr         : in  std_logic;
ce           : in  std_logic;
result       : out std_logic_vector (31 downto 0) := (others => '0');
rdy          : out std_logic
);
end component fi2fl;
signal fi2fl_a            : std_logic_vector (63 downto 0) := (others => '0');
signal fi2fl_operation_nd : std_logic := '0';
signal fi2fl_clk          : std_logic := '0';
signal fi2fl_sclr         : std_logic := '0';
signal fi2fl_ce           : std_logic := '0';
signal fi2fl_result       : std_logic_vector (31 downto 0) := (others => '0');
signal fi2fl_rdy          : std_logic := '0';

-- float2fixed
component fl2fi
port (
a            : in  std_logic_vector (31 downto 0) := (others => '0');
operation_nd : in  std_logic;
clk          : in  std_logic;
sclr         : in  std_logic;
ce           : in  std_logic;
result       : out std_logic_vector (63 downto 0) := (others => '0');
rdy          : out std_logic
);
end component fl2fi;
signal fl2fi_a            : std_logic_vector (31 downto 0) := (others => '0');
signal fl2fi_operation_nd : std_logic := '0';
signal fl2fi_clk          : std_logic := '0';
signal fl2fi_sclr         : std_logic := '0';
signal fl2fi_ce           : std_logic := '0';
signal fl2fi_result       : std_logic_vector (63 downto 0) := (others => '0');
signal fl2fi_rdy          : std_logic := '0';

-- from uut
signal i_sqrt_original_float : std_logic_vector(31 downto 0) := (others => '0');
signal o_sqrt_inverse_float : std_logic_vector(31 downto 0) := (others => '0');

function to_string_1 ( s : std_logic_vector )
  return string
is
  variable r : string ( s'length downto 1 ) ;
begin
  for i in s'range  loop
    r(i+1) := std_logic'image (s(i))(2);
  end loop ;
  return r ;
end function ;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut : fast_inverse_sqrt PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
i_sqrt_original => i_sqrt_original_float,
o_sqrt_inverse => o_sqrt_inverse_float,
o_done => o_done
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
fi2fl_sclr <= '1';
fl2fi_sclr <= '1';
wait for 100 ns;
i_reset <= '0';
fi2fl_sclr <= '0';
fl2fi_sclr <= '0';

wait for i_clock_period*10;

-- insert stimulus here 
i_sqrt_original_fixed <= std_logic_vector (to_unsigned (100000000, 32)) & x"00000000";
--i_sqrt_original <= std_logic_vector (to_unsigned (7, 32)) & x"00000000";
--i_sqrt_original <= std_logic_vector (to_unsigned (0, 32)) & "00101000000000000000000000000000"; -- 0.15625
--i_sqrt_original <= std_logic_vector (to_unsigned (3, 32)) & x"00000000";
--i_sqrt_original <= std_logic_vector (to_unsigned (2, 32)) & x"00000000";
--i_sqrt_original <= std_logic_vector (to_unsigned (100, 32)) & x"00000000";
--i_sqrt_original <= std_logic_vector (to_unsigned (1, 32)) & x"00000000";
--i_sqrt_original <= std_logic_vector (to_unsigned (500, 32)) & x"00000000";
--i_sqrt_original <= std_logic_vector (to_unsigned (111, 32)) & x"00000000";

wait for i_clock_period;

fi2fl_ce <= '1';
fi2fl_operation_nd <= '1';
fi2fl_sclr <= '0';
fi2fl_a <= i_sqrt_original_fixed;

wait until fi2fl_rdy = '1';

fi2fl_ce <= '0';
fi2fl_operation_nd <= '0';
fi2fl_sclr <= '1';
wait for i_clock_period;
fi2fl_sclr <= '0';
wait for i_clock_period;

i_sqrt_original_float <= fi2fl_result;
i_run <= '1';
wait for i_clock_period*1;
i_run <= '0';
wait until o_done = '1';
fl2fi_a <= o_sqrt_inverse_float;

fl2fi_ce <= '1';
fl2fi_operation_nd <= '1';
fl2fi_sclr <= '0';
wait until fl2fi_rdy = '1';
fl2fi_ce <= '0';
fl2fi_operation_nd <= '0';
fl2fi_sclr <= '1';
wait for i_clock_period;
fl2fi_sclr <= '0';
wait for i_clock_period;

o_sqrt_inverse_fixed <= fl2fi_result;
wait for i_clock_period;

report "o_sqrt_inverse_fixed : " & to_string_1 (o_sqrt_inverse_fixed);

assert (o_sqrt_inverse_fixed = x"00000000184630D5") report "fail";
report "tb done" severity failure;
wait;
end process;

fi2fl_clk <= i_clock;
fl2fi_clk <= i_clock;

inst_fixed2float : fi2fl
port map (
a            => fi2fl_a,
operation_nd => fi2fl_operation_nd,
clk          => fi2fl_clk,
sclr         => fi2fl_sclr,
ce           => fi2fl_ce,
result       => fi2fl_result,
rdy          => fi2fl_rdy
);

inst_float2fixed : fl2fi
port map (
a            => fl2fi_a,
operation_nd => fl2fi_operation_nd,
clk          => fl2fi_clk,
sclr         => fl2fi_sclr,
ce           => fl2fi_ce,
result       => fl2fi_result,
rdy          => fl2fi_rdy
);

END;
