----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:36:11 06/19/2023 
-- Design Name: 
-- Module Name:    test_speed_addfp - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package3.all;

entity test_speed_addfp is
port (
a : IN STD_LOGIC_VECTOR(flexp+flfra-1 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(flexp+flfra-1 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(flexp+flfra-1 DOWNTO 0);
rdy : OUT STD_LOGIC
);
end test_speed_addfp;

architecture Behavioral of test_speed_addfp is

COMPONENT addfp IS
PORT (
a : IN STD_LOGIC_VECTOR(flexp+flfra-1 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(flexp+flfra-1 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(flexp+flfra-1 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT addfp;

begin

inst_addfp : addfp port map (
a => a,
b => b,
operation_nd => operation_nd,
clk => clk,
sclr => sclr,
ce => ce,
result => result,
rdy => rdy
);

end Behavioral;

