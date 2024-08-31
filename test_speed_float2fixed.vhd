----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:52:02 06/20/2023 
-- Design Name: 
-- Module Name:    test_speed_float2fixed - Behavioral 
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

entity test_speed_float2fixed is
generic (
constant width_fi : integer := fiexp+fifra;
constant width_fl : integer := flexp+flfra
);
port (
a : IN STD_LOGIC_VECTOR(width_fl-1 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(width_fi-1 DOWNTO 0);
rdy : OUT STD_LOGIC
);
end test_speed_float2fixed;

architecture Behavioral of test_speed_float2fixed is

COMPONENT float2fixed IS
PORT (
a : IN STD_LOGIC_VECTOR(width_fl-1 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(width_fi-1 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT float2fixed;

--type tstate is (s0,s1);
--signal state : tstate;
--
--signal sa : STD_LOGIC_VECTOR(width_fi-1 DOWNTO 0);
--signal soperation_nd : STD_LOGIC;
--signal sclk : STD_LOGIC;
--signal ssclr : STD_LOGIC;
--signal sce : STD_LOGIC;
--signal sresult : STD_LOGIC_VECTOR(width_fl-1 DOWNTO 0);
--signal srdy : STD_LOGIC;
--
begin
--
--p0 : process (clk) is
--begin
--  if rising_edge (clk) then
--    if (sclr = '1') then
--      result <= (others => '0');
--      rdy <= '0';
--      sa <= (others => '0');
--      soperation_nd <= '0';
--      ssclr <= '1';
--      sce <= '0';
--      state <= s0;
--    else
--      case (state) is
--        when s0 =>
--          if (operation_nd = '1') then
--            state <= s1;
--            soperation_nd <= '1';
--            sce <= '1';
--            sa <= a;
--            ssclr <= '0';
--            rdy <= '0';
--          else
--            state <= s0;
--            soperation_nd <= '0';
--            sce <= '0';
--            sa <= (others => '0');
--            ssclr <= '1';
--            rdy <= '1';
--          end if;
--        when s1 =>
--          if (srdy = '1') then
--            state <= s0;
--            result <= sresult;
--            rdy <= '1';
--            sce <= '0';
--            ssclr <= '1';
--            sa <= (others => '0');
--            soperation_nd <= '0';
--          else
--            state <= s1;
--          end if;
--      end case;
--    end if;
--  end if;
--end process p0;
--
--sclk <= clk;
--inst_float2fixed : float2fixed port map (
--a => sa,
--operation_nd => soperation_nd,
--clk => sclk,
--sclr => ssclr,
--ce => sce,
--result => sresult,
--rdy => srdy
--);

inst_float2fixed : float2fixed port map (
a => a,
operation_nd => operation_nd,
clk => clk,
sclr => sclr,
ce => ce,
result => result,
rdy => rdy
);

end Behavioral;

