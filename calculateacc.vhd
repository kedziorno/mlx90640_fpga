----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:35 01/29/2023 
-- Design Name: 
-- Module Name:    calculateacc - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity calculateacc is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_start0x2422 : in std_logic_vector (15 downto 0);
i_start0x2423 : in std_logic_vector (15 downto 0);
i_start0x2424 : in std_logic_vector (15 downto 0);
i_start0x2425 : in std_logic_vector (15 downto 0);
i_start0x2426 : in std_logic_vector (15 downto 0);
i_start0x2427 : in std_logic_vector (15 downto 0);
i_start0x2428 : in std_logic_vector (15 downto 0);
i_start0x2429 : in std_logic_vector (15 downto 0);
i_start0x242a : in std_logic_vector (15 downto 0);
i_start0x242b : in std_logic_vector (15 downto 0);
i_start0x242c : in std_logic_vector (15 downto 0);
i_start0x242d : in std_logic_vector (15 downto 0);
i_start0x242e : in std_logic_vector (15 downto 0);
i_start0x242f : in std_logic_vector (15 downto 0);
o_done : out std_logic
);
end calculateacc;

architecture Behavioral of calculateacc is

--constant start1 : integer := 16*64*to_integer (unsigned (x"3e"));
signal address_read,addra,addrb : std_logic_vector (8 downto 0);
signal doa,dia,dob,dib,odata_read,idata_read : std_logic_vector (31 downto 0);

signal ena_mux1,ena_mux2 : std_logic;
signal out_nibble : std_logic_vector (31 downto 0);

signal nibble1,nibble2 : std_logic_vector (3 downto 0);
signal nibble3,nibble4 : std_logic_vector (5 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;

begin

with nibble1 select out_nibble1 <= -- >7,-16 - rows1-24
x"22000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"22000000" when others;

with nibble2 select out_nibble2 <= -- >7,-16 - cols1-32
x"22000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"22000000" when others;

with nibble3 select out_nibble3 <= -- >31,-64 - alphatemp
x"40e00000" when "000111",x"40c00000" when "000110",x"40a00000" when "000101",x"40800000" when "000100",x"40400000" when "000011",x"40000000" when "000010",x"3f800000" when "000001",x"22000000" when "000000",
x"41700000" when "001111",x"41600000" when "001110",x"41500000" when "001101",x"41400000" when "001100",x"41300000" when "001011",x"41200000" when "001010",x"41100000" when "001001",x"41000000" when "001000",
x"41b80000" when "010111",x"41b00000" when "010110",x"41a80000" when "010101",x"41a00000" when "010100",x"41980000" when "010011",x"41900000" when "010010",x"41880000" when "010001",x"41800000" when "010000",
x"41f80000" when "011111",x"41f00000" when "011110",x"41e80000" when "011101",x"41e00000" when "011100",x"41d80000" when "011011",x"41d00000" when "011010",x"41c80000" when "011001",x"41c00000" when "011000",
x"c1c80000" when "100111",x"c1d00000" when "100110",x"c1d80000" when "100101",x"c1e00000" when "100100",x"c1e80000" when "100011",x"c1f00000" when "100010",x"c1f80000" when "100001",x"c2000000" when "100000",
x"c1880000" when "101111",x"c1900000" when "101110",x"c1980000" when "101101",x"c1a00000" when "101100",x"c1a80000" when "101011",x"c1b00000" when "101010",x"c1b80000" when "101001",x"c1c00000" when "101000",
x"c1100000" when "110111",x"c1200000" when "110110",x"c1300000" when "110101",x"c1400000" when "110100",x"c1500000" when "110011",x"c1600000" when "110010",x"c1700000" when "110001",x"c1800000" when "110000",
x"bf800000" when "111111",x"c0000000" when "111110",x"c0400000" when "111101",x"c0800000" when "111100",x"c0a00000" when "111011",x"c0c00000" when "111010",x"c0e00000" when "111001",x"c1000000" when "111000",
x"22000000" when others;

p0 : process (i_clock, i_reset) is
	constant N : integer := 6;
	variable i : integer range 0 to N-1;
	type states is (idle,
	a1,b1,c1,d1,
	a2,b2,c2,d2,
	a3,b3,c3,d3,
	a4,b4,c4,d4,
	a5,b5,c5,d5,
	a6,b6,c6,d6,
	a7,b7,c7,d7,
	a8,b8,c8,d8,
	ending);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			nibble1 <= (others => '0');
			nibble2 <= (others => '0');
			nibble3 <= (others => '0');
			nibble4 <= (others => '0');
			state := idle;
			i := 0;
			write_enable <= '0';
			ena_mux1 <= '0';
			ena_mux2 <= '0';
			o_done <= '0';
		else
			case (state) is
				when idle =>
					state := a1;
					write_enable <= '1';
					ena_mux1 <= '1';
					ena_mux2 <= '1';
					o_done <= '0';


				when a1 => state := b1;
					nibble1 <= i_start0x2422 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (0, 9));
					nibble2 <= i_start0x2428 (3 downto 0);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (0+24, 9));

				when b1 => state := c1;
					nibble1 <= i_start0x2422 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (1, 9));
					nibble2 <= i_start0x2428 (7 downto 4);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (1+24, 9));

				when c1 => state := d1;
					nibble1 <= i_start0x2422 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (2, 9));
					nibble2 <= i_start0x2428 (11 downto 8);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (2+24, 9));

				when d1 => state := a2;
					nibble1 <= i_start0x2422 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (3, 9));
					nibble2 <= i_start0x2428 (15 downto 12);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (3+24, 9));


				when a2 => state := b2;
					nibble1 <= i_start0x2423 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (4, 9));
					nibble2 <= i_start0x2429 (3 downto 0);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (4+24, 9));

				when b2 => state := c2;
					nibble1 <= i_start0x2423 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (5, 9));
					nibble2 <= i_start0x2429 (7 downto 4);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (5+24, 9));

				when c2 => state := d2;
					nibble1 <= i_start0x2423 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (6, 9));
					nibble2 <= i_start0x2429 (11 downto 8);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (6+24, 9));

				when d2 => state := a3;
					nibble1 <= i_start0x2423 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (7, 9));
					nibble2 <= i_start0x2429 (15 downto 12);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (7+24, 9));


				when a3 => state := b3;
					nibble1 <= i_start0x2424 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (8, 9));
					nibble2 <= i_start0x242a (3 downto 0);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (8+24, 9));

				when b3 => state := c3;
					nibble1 <= i_start0x2424 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (9, 9));
					nibble2 <= i_start0x242a (7 downto 4);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (9+24, 9));

				when c3 => state := d3;
					nibble1 <= i_start0x2424 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (10, 9));
					nibble2 <= i_start0x242a (11 downto 8);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (10+24, 9));

				when d3 => state := a4;
					nibble1 <= i_start0x2424 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (11, 9));
					nibble2 <= i_start0x242a (15 downto 12);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (11+24, 9));


				when a4 => state := b4;
					nibble1 <= i_start0x2425 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (12, 9));
					nibble2 <= i_start0x242b (3 downto 0);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (12+24, 9));

				when b4 => state := c4;
					nibble1 <= i_start0x2425 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (13, 9));
					nibble2 <= i_start0x242b (7 downto 4);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (13+24, 9));

				when c4 => state := d4;
					nibble1 <= i_start0x2425 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (14, 9));
					nibble2 <= i_start0x242b (11 downto 8);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (14+24, 9));

				when d4 => state := a5;
					nibble1 <= i_start0x2425 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (15, 9));
					nibble2 <= i_start0x242b (15 downto 12);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (15+24, 9));


				when a5 => state := b5;
					nibble1 <= i_start0x2426 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (16, 9));
					nibble2 <= i_start0x242c (3 downto 0);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (16+24, 9));

				when b5 => state := c5;
					nibble1 <= i_start0x2426 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (17, 9));
					nibble2 <= i_start0x242c (7 downto 4);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (17+24, 9));

				when c5 => state := d5;
					nibble1 <= i_start0x2426 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (18, 9));
					nibble2 <= i_start0x242c (11 downto 8);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (18+24, 9));

				when d5 => state := a6;
					nibble1 <= i_start0x2426 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (19, 9));
					nibble2 <= i_start0x242c (15 downto 12);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (19+24, 9));


				when a6 => state := b6;
					nibble1 <= i_start0x2427 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (20, 9));
					nibble2 <= i_start0x242d (3 downto 0);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (20+24, 9));

				when b6 => state := c6;
					nibble1 <= i_start0x2427 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (21, 9));
					nibble2 <= i_start0x242d (7 downto 4);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (21+24, 9));

				when c6 => state := d6;
					nibble1 <= i_start0x2427 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (22, 9));
					nibble2 <= i_start0x242d (11 downto 8);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (22+24, 9));

				when d6 => state := a7;
					nibble1 <= i_start0x2427 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (23, 9));
					nibble2 <= i_start0x242d (15 downto 12);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (23+24, 9));
----
				when a7 => state := b7;
					nibble2 <= i_start0x242e (3 downto 0);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (24+24, 9));

				when b7 => state := c7;
					nibble2 <= i_start0x242e (7 downto 4);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (25+24, 9));

				when c7 => state := d7;
					nibble2 <= i_start0x242e (11 downto 8);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (26+24, 9));

				when d7 => state := a8;
					nibble2 <= i_start0x242e (15 downto 12);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (27+24, 9));

---
				when a8 => state := b8;
					nibble2 <= i_start0x242f (3 downto 0);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (28+24, 9));

				when b8 => state := c8;
					nibble2 <= i_start0x242f (7 downto 4);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (29+24, 9));

				when c8 => state := d8;
					nibble2 <= i_start0x242f (11 downto 8);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (30+24, 9));

				when d8 => state := ending;
					nibble2 <= i_start0x242f (15 downto 12);
					dib <= out_nibble2;
					addrb <= std_logic_vector (to_unsigned (31+24, 9));

---
				when ending =>
					o_done <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

inst_mem_kvdd_vdd25 : RAMB16_S36_S36
generic map (
INIT_A => X"000000000", -- Value of output RAM registers on Port A at startup
INIT_B => X"000000000", -- Value of output RAM registers on Port B at startup
SRVAL_A => X"000000000", -- Port A output value upon SSR assertion
SRVAL_B => X"000000000", -- Port B output value upon SSR assertion
WRITE_MODE_A => "WRITE_FIRST", -- WRITE_FIRST, READ_FIRST or NO_CHANGE
WRITE_MODE_B => "WRITE_FIRST", -- WRITE_FIRST, READ_FIRST or NO_CHANGE
SIM_COLLISION_CHECK => "NONE", -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL"-- The following INIT_xx declarations specify the intial contents of the RAM
-- init 00-3f
INIT_3e => X"40e0000040c0000040a000004080000040400000400000003f80000022000000",
INIT_3f => X"bf800000c0000000c0400000c0800000c0a00000c0c00000c0e00000c1000000"
)
port map (
DOA => doa, -- 1-bit Data Output
DOPA => open, -- 1-bit Data Output
ADDRA => addra, -- 14-bit Address Input
CLKA => i_clock, -- Clock
DIA => dia, -- 1-bit Data Input
DIPA => (others => '0'), -- 1-bit Data Input
ENA => ena_mux1, -- RAM Enable Input
SSRA => i_reset, -- Synchronous Set/Reset Input
WEA => write_enable, -- Write Enable Input,

DOB => dob, -- 1-bit Data Output
DOPB => open, -- 1-bit Data Output
ADDRB => addrb, -- 14-bit Address Input
CLKB => i_clock, -- Clock
DIB => dib, -- 1-bit Data Input
DIPB => (others => '0'), -- 1-bit Data Input
ENB => ena_mux2, -- RAM Enable Input
SSRB => i_reset, -- Synchronous Set/Reset Input
WEB => write_enable -- Write Enable Input,
);
-- End of RAMB16_S1_inst instantiation

end Behavioral;

