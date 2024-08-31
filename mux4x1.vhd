----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:51:33 06/14/2023 
-- Design Name: 
-- Module Name:    mux4x1 - Behavioral 
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

entity mux4x1 is
port (
i_clock : in std_logic;
o : out std_logic;
i0,i1,i2,i3 : in std_logic;
s0,s1,s2,s3 : in std_logic
);
end mux4x1;

architecture Behavioral of mux4x1 is

begin

-- xxx comb1
o <=
i0 when s0 = '1'
else
i1 when s1 = '1'
else
i2 when s2 = '1'
else
i3 when s3 = '1'
else '0';

-- xxx comb2
--p0: process (i0,i1,i2,i3,s0,s1,s2,s3) is
--  variable a : std_logic_vector (3 downto 0);
--begin
--  a := s3&s2&s1&s0;
--  case (a) is
--    when "0001" =>
--      o <= s3;
--    when "0010" =>
--      o <= s2;
--    when "0100" =>
--      o <= s1;
--    when "1000" =>
--      o <= s0;
--    when others =>
--      o <= '0';
--  end case;
--end process p0;

-- xxx seq,no prio
--p0: process (i_clock) is
--begin
--  if (rising_edge (i_clock)) then
--    if (i0 = '1') then
--    o <= s0;
--    end if;
--    if (i1 = '1') then
--    o <= s1;
--    end if;
--    if (i2 = '1') then
--    o <= s2;
--    end if;
--    if (i3 = '1') then
--    o <= s3;
--    end if;
--  end if;
--end process p0;

-- xxx seq,prio
--p0: process (i_clock) is
--begin
--  if (rising_edge (i_clock)) then
--    if (i0 = '1') then
--    o <= s0;
--    elsif (i1 = '1') then
--    o <= s1;
--    elsif (i2 = '1') then
--    o <= s2;
--    elsif (i3 = '1') then
--    o <= s3;
--    else
--    o <= '0';
--    end if;
--  end if;
--end process p0;

-- xxx seq,case1
--p0: process (i_clock) is
--  variable a : std_logic_vector (3 downto 0);
--begin
--  a := i3&i2&i1&i0;
--  if (rising_edge (i_clock)) then
--    case (a) is
--      when "1000" =>
--        o <= s3;
--      when "0100" =>
--        o <= s2;
--      when "0010" =>
--        o <= s1;
--      when "0001" =>
--        o <= s0;
--      when others =>
--        o <= '0';
--    end case;
--  end if;
--end process p0;

-- xxx seq,case2
--p0: process (i_clock) is
--  variable a : std_logic_vector (3 downto 0);
--begin
--  if (rising_edge (i_clock)) then
--    a := i3&i2&i1&i0;
--    case (a) is
--      when "1000" =>
--        o <= s3;
--      when "0100" =>
--        o <= s2;
--      when "0010" =>
--        o <= s1;
--      when "0001" =>
--        o <= s0;
--      when others =>
--        o <= '0';
--    end case;
--  end if;
--end process p0;

-- xxx seq,case3
--p0: process (i_clock) is
--  variable a : std_logic_vector (3 downto 0);
--begin
--  a := i3&i2&i1&i0;
--  if (rising_edge (i_clock)) then
--    case (a) is
--      when "1000" =>
--        o <= s3;
--      when "0100" =>
--        o <= s2;
--      when "0010" =>
--        o <= s1;
--      when others =>
--        o <= s0;
--    end case;
--  end if;
--end process p0;

-- xxx seq,case4
--p0: process (i_clock) is
--  variable a : std_logic_vector (3 downto 0);
--begin
--  if (rising_edge (i_clock)) then
--    a := i3&i2&i1&i0;
--    case (a) is
--      when "1000" =>
--        o <= s3;
--      when "0100" =>
--        o <= s2;
--      when "0010" =>
--        o <= s1;
--      when others =>
--        o <= s0;
--    end case;
--  end if;
--end process p0;

end Behavioral;

