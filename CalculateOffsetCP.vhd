----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:00 02/09/2023 
-- Design Name: 
-- Module Name:    CalculateOffsetCP - Behavioral 
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

use work.p_fphdl_package1.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CalculateOffsetCP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x243a : in slv16; -- offcpsubpage1delta/offcpsubpage0 - 6/10bit
o_offcpsubpage0 : out fd2ft;
o_offcpsubpage1 : out fd2ft;
o_rdy : out std_logic
);
end CalculateOffsetCP;

architecture Behavioral of CalculateOffsetCP is

COMPONENT addfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfpclk : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : STD_LOGIC;

component mem_signed1024 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_value : in std_logic_vector (9 downto 0); -- input hex from 0 to 1024
o_value : out std_logic_vector (31 downto 0) -- output signed -512 to 511 in SP float
);
end component mem_signed1024;

signal mem_signed1024_clock : std_logic;
signal mem_signed1024_reset : std_logic;
signal mem_signed1024_ivalue : std_logic_vector (9 downto 0);
signal mem_signed1024_ovalue : std_logic_vector (31 downto 0);

signal nibble1 : std_logic_vector (5 downto 0);

signal out_nibble1 : std_logic_vector (31 downto 0);

begin

with nibble1 select out_nibble1 <= -- >31,-64 - offcpsubpage1delta
x"40e00000" when "000111",x"40c00000" when "000110",x"40a00000" when "000101",x"40800000" when "000100",x"40400000" when "000011",x"40000000" when "000010",x"3f800000" when "000001",x"22000000" when "000000",
x"41700000" when "001111",x"41600000" when "001110",x"41500000" when "001101",x"41400000" when "001100",x"41300000" when "001011",x"41200000" when "001010",x"41100000" when "001001",x"41000000" when "001000",
x"41b80000" when "010111",x"41b00000" when "010110",x"41a80000" when "010101",x"41a00000" when "010100",x"41980000" when "010011",x"41900000" when "010010",x"41880000" when "010001",x"41800000" when "010000",
x"41f80000" when "011111",x"41f00000" when "011110",x"41e80000" when "011101",x"41e00000" when "011100",x"41d80000" when "011011",x"41d00000" when "011010",x"41c80000" when "011001",x"41c00000" when "011000",
x"c1c80000" when "100111",x"c1d00000" when "100110",x"c1d80000" when "100101",x"c1e00000" when "100100",x"c1e80000" when "100011",x"c1f00000" when "100010",x"c1f80000" when "100001",x"c2000000" when "100000",
x"c1880000" when "101111",x"c1900000" when "101110",x"c1980000" when "101101",x"c1a00000" when "101100",x"c1a80000" when "101011",x"c1b00000" when "101010",x"c1b80000" when "101001",x"c1c00000" when "101000",
x"c1100000" when "110111",x"c1200000" when "110110",x"c1300000" when "110101",x"c1400000" when "110100",x"c1500000" when "110011",x"c1600000" when "110010",x"c1700000" when "110001",x"c1800000" when "110000",
x"bf800000" when "111111",x"c0000000" when "111110",x"c0400000" when "111101",x"c0800000" when "111100",x"c0a00000" when "111011",x"c0c00000" when "111010",x"c0e00000" when "111001",x"c1000000" when "111000",
x"00000000" when others;

p0 : process (i_clock,i_reset) is
	variable fptmp1,fptmp2 : fd2ft;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			addfpsclr <= '1';
			o_offcpsubpage0 <= (others => '0');
			o_offcpsubpage1 <= (others => '0');
			o_rdy <= '0';
			addfpa <= (others => '0');
			addfpb <= (others => '0');
			addfpce <= '0';
			addfpond <= '0';
			mem_signed1024_ivalue <= (others => '0');
			nibble1 <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
					else
						state := idle;
					end if;
					addfpsclr <= '0';
				when s1 => state := s2;
					nibble1 <= i_ee0x243a (15 downto 10); -- offcpsubpage1delta 6bit
					mem_signed1024_ivalue <= i_ee0x243a (9 downto 0); -- offcpsubpage0 10bit
				when s2 => state := s3;
					--wait 1 clk
				when s3 => state := s4;
					--wait 1 clk
				when s4 => state := s5;
					addfpce <= '1';
					addfpa <= mem_signed1024_ovalue; -- offcpsubpage0
					addfpb <= out_nibble1; -- offcpsubpage1delta
					addfpond <= '1';
					o_offcpsubpage0 <= mem_signed1024_ovalue;
				when s5 =>
					if (addfprdy = '1') then state := s6;
						o_offcpsubpage1 <= addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s5; end if;
				when s6 => state := idle;
					addfpsclr <= '0';
					o_rdy <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

mem_signed1024_clock <= i_clock;
mem_signed1024_reset <= i_reset;
inst_mem_signed1024 : mem_signed1024
port map (
i_clock => mem_signed1024_clock,
i_reset => mem_signed1024_reset,
i_value => mem_signed1024_ivalue,
o_value => mem_signed1024_ovalue
);

addfpclk <= i_clock;
inst_addfp_acc : addfp
PORT MAP (
a => addfpa,
b => addfpb,
operation_nd => addfpond,
clk => addfpclk,
sclr => addfpsclr,
ce => addfpce,
result => addfpr,
rdy => addfprdy
);

end Behavioral;

