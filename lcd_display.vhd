----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:24:00 11/28/2020
-- Design Name: 
-- Module Name:    /home/user/workspace/vhdl_projects/memorymodule/lcd_display.vhd
-- Project Name:   memorymodule
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.pack.all;

entity lcd_display is
Generic (
	LCDClockDivider : integer := 200 -- XXX in ms
);
Port (
	i_clock : in std_logic;
	i_LCDChar : LCDHex;
	o_anode : out std_logic_vector(3 downto 0);
	o_segment : out std_logic_vector(6 downto 0)
);
end lcd_display;

architecture Behavioral of lcd_display is
	
	component clock_divider is
	Generic(
		g_board_clock : integer;
		g_divider : integer
	);
	Port(
		i_clock : in STD_LOGIC;
		o_clock : out STD_LOGIC
	);
	end component clock_divider;
	for all : clock_divider use entity work.clock_divider(Behavioral);

	signal clock_divider_1 : std_logic;

begin

	c_clock_divider_1 : clock_divider
	Generic Map (
		g_board_clock => 100_000_000,
		g_divider => 200
	)
	Port Map (
		i_clock => i_clock,
		o_clock => clock_divider_1
	);

	p0 : process (clock_divider_1) is
		variable count : integer range 0 to 3 := 0;
	begin
		if (rising_edge(clock_divider_1)) then
			case count is
				when 0 =>
					o_anode(3 downto 0) <= "0111";
				when 1 =>
					o_anode(3 downto 0) <= "1011";
				when 2 =>
					o_anode(3 downto 0) <= "1101";
				when 3 =>
					o_anode(3 downto 0) <= "1110";
				when others =>
					o_anode(3 downto 0) <= "1111";
			end case;
			if (count = 3) then
				count := 0;			
			else
				count := count + 1;
			end if;
		end if;
	end process p0;

	p1 : process (clock_divider_1) is
		variable count : integer range 3 downto 0 := 3;
	begin
		if (rising_edge(clock_divider_1)) then
			case to_integer(unsigned(i_LCDChar(count))) is
				when 0 => o_segment <= "1000000"; -- 0
				when 1 => o_segment <= "1111001"; -- 1
				when 2 => o_segment <= "0100100"; -- 2
				when 3 => o_segment <= "0110000"; -- 3
				when 4 => o_segment <= "0011001"; -- 4
				when 5 => o_segment <= "0010010"; -- 5
				when 6 => o_segment <= "0000010"; -- 6
				when 7 => o_segment <= "1111000"; -- 7
				when 8 => o_segment <= "0000000"; -- 8
				when 9 => o_segment <= "0010000"; -- 9
				when 10 => o_segment <= "0001000"; -- a
				when 11 => o_segment <= "0000011"; -- b
				when 12 => o_segment <= "1000110"; -- c
				when 13 => o_segment <= "0100001"; -- d
				when 14 => o_segment <= "0000110"; -- e
				when 15 => o_segment <= "0001110"; -- f
				when others => null;
			end case;
			if (count = 0) then
				count := 3;
			else
				count := count - 1;
			end if;
		end if;
	end process p1;

end Behavioral;

