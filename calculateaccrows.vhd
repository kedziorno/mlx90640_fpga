----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:35 01/29/2023 
-- Design Name: 
-- Module Name:    calculateaccrows - Behavioral 
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

entity calculateaccrows is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_start0x2422 : in std_logic_vector (15 downto 0);
o_done : out std_logic
);
end calculateaccrows;

architecture Behavioral of calculateaccrows is

--constant start1 : integer := 16*64*to_integer (unsigned (x"3e"));
signal address_read,address_write : std_logic_vector (8 downto 0);
signal odata_write,idata_write,odata_read,idata_read : std_logic_vector (31 downto 0);

signal ena_mux1,ena_mux2 : std_logic;
signal out_nibble : std_logic_vector (31 downto 0);

signal nibble1,nibble2,nibble3,nibble4 : std_logic_vector (3 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;

begin

with nibble1 select out_nibble1 <=
x"22000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"22000000" when others;

with nibble2 select out_nibble2 <=
x"22000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"22000000" when others;

with nibble3 select out_nibble3 <=
x"22000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"22000000" when others;

with nibble4 select out_nibble4 <=
x"22000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"22000000" when others;

p0 : process (i_clock, i_reset) is
	constant N : integer := 6;
	variable i : integer range 0 to N-1;
	type states is (idle,a,b,c,d,e,f,g);
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
					state := a;
					write_enable <= '0';
					ena_mux1 <= '0';
					ena_mux2 <= '0';
					o_done <= '0';
				when a =>
					state := b;
					nibble1 <= i_start0x2422 (3 downto 0);
					nibble2 <= i_start0x2422 (7 downto 4);
					nibble3 <= i_start0x2422 (11 downto 8);
					nibble4 <= i_start0x2422 (15 downto 12);
				when b =>
					state := c;
					write_enable <= '1';
					ena_mux1 <= '1';
					ena_mux2 <= '0';
					address_write <= std_logic_vector (to_unsigned (i * 4 + 0, 9));
--					idata_write <= "0000000000000000000000000000"&nibble1; --out_nibble1;
					idata_write <= out_nibble1;
				when c =>
					state := d;
					write_enable <= '1';
					ena_mux1 <= '1';
					ena_mux2 <= '0';
					address_write <= std_logic_vector (to_unsigned (i * 4 + 1, 9));
--					idata_write <= "0000000000000000000000000000"&nibble2; --out_nibble2;
					idata_write <= out_nibble2;
				when d =>
					state := e;
					write_enable <= '1';
					ena_mux1 <= '1';
					ena_mux2 <= '0';
					address_write <= std_logic_vector (to_unsigned (i * 4 + 2, 9));
--					idata_write <= "0000000000000000000000000000"&nibble3; --out_nibble3;
					idata_write <= out_nibble3;
				when e =>
					state := f;
					write_enable <= '1';
					ena_mux1 <= '1';
					ena_mux2 <= '0';
					address_write <= std_logic_vector (to_unsigned (i * 4 + 3, 9));
--					idata_write <= "0000000000000000000000000000"&nibble4; --out_nibble4;
					idata_write <= out_nibble4;
				when f =>
					write_enable <= '0';
					ena_mux1 <= '0';
					ena_mux2 <= '0';
					address_write <= (others => '0');
					idata_write <= (others => '0');
					if (i = N-1) then
						i := 0;
						state := g;
					else
						i := i + 1;
						state := a;
					end if;
				when g =>
					o_done <= '1';
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
DOA => odata_write, -- 1-bit Data Output
DOPA => open, -- 1-bit Data Output
ADDRA => address_write, -- 14-bit Address Input
CLKA => i_clock, -- Clock
DIA => idata_write, -- 1-bit Data Input
DIPA => (others => '0'), -- 1-bit Data Input
ENA => ena_mux1, -- RAM Enable Input
SSRA => i_reset, -- Synchronous Set/Reset Input
WEA => write_enable, -- Write Enable Input,

DOB => open, -- 1-bit Data Output
DOPB => open, -- 1-bit Data Output
ADDRB => (others => '0'), -- 14-bit Address Input
CLKB => i_clock, -- Clock
DIB => (others => '0'), -- 1-bit Data Input
DIPB => (others => '0'), -- 1-bit Data Input
ENB => ena_mux2, -- RAM Enable Input
SSRB => i_reset, -- Synchronous Set/Reset Input
WEB => '0' -- Write Enable Input,
);
-- End of RAMB16_S1_inst instantiation

end Behavioral;

