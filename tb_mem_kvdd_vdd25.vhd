--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:10:29 12/14/2022
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_mem_kvdd.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem_kvdd
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
use ieee.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY tb_mem_kvdd_vdd25 IS
END tb_mem_kvdd_vdd25;

ARCHITECTURE behavior OF tb_mem_kvdd_vdd25 IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT mem_kvdd_vdd25
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_address : IN  std_logic_vector(7 downto 0);
o_data_kvdd : OUT  std_logic_vector(15 downto 0);
o_data_vdd25 : OUT  std_logic_vector(15 downto 0)
);
END COMPONENT;

--Inputs
signal i_clock : std_logic := '0';
signal i_reset : std_logic := '0';
signal i_address : std_logic_vector(7 downto 0);

--Outputs
signal o_data_kvdd : std_logic_vector(15 downto 0);
signal o_data_vdd25 : std_logic_vector(15 downto 0);

-- Clock period definitions
constant i_clock_period : time := 10 ns;

-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2Fraytrac%2Fbranches%2Ffp%2Farithpack.vhd&rev=163
function ap_slv2int (sl:std_logic_vector) return integer is
alias s : std_logic_vector (sl'high downto sl'low) is sl;
variable i : integer; 
begin
i:=0;
for index in s'high downto s'low loop
if s(index)='1' then
i:=i*2+1;
else
i:=i*2;
end if;
end loop;
return i;
end function;

function ap_slv2fp(sl:std_logic_vector) return real is
variable frc:integer;
alias s: std_logic_vector(31 downto 0) is sl;
variable f,expo: real;
begin
expo:=real(ap_slv2int(s(30 downto 23)) - 127);
expo:=(2.0)**(expo);
frc:=ap_slv2int('1'&s(22 downto 0));
f:=real(frc)*(2.0**(-23.0));
f:=f*real(expo);
if s(31)='1' then
return -f;
else
return f;
end if;
end function;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: mem_kvdd_vdd25 PORT MAP (
i_clock => i_clock,
i_reset => i_reset,
i_address => i_address,
o_data_kvdd => o_data_kvdd,
o_data_vdd25 => o_data_vdd25
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
wait for i_clock_period*10;
i_reset <= '0';
-- insert stimulus here
l0 : for i in 0 to 257 loop
i_address <= std_logic_vector(to_unsigned(i,8));
wait for i_clock_period;
report real'image(ap_slv2fp(o_data_kvdd));
end loop l0;
i_address <= x"33";
wait for i_clock_period;
report "done" severity failure;
end process;

END;
