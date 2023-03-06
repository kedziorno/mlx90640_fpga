----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:25:31 02/09/2023 
-- Design Name: 
-- Module Name:    CalculateAlphaCP - Behavioral 
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
use work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CalculateAlphaCP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_acpsubpage0 : out fd2ft;
o_acpsubpage1 : out fd2ft;
o_rdy : out std_logic;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC

);
end CalculateAlphaCP;

architecture Behavioral of CalculateAlphaCP is

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;

signal mulfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond_internal : STD_LOGIC;
signal mulfpsclr_internal : STD_LOGIC;
signal mulfpce_internal : STD_LOGIC;
signal mulfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy_internal : STD_LOGIC;

component mem_signed1024 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_value : in std_logic_vector (9 downto 0); -- input hex from 0 to 1024
o_value : out std_logic_vector (31 downto 0) -- output signed 0 to 1024 in SP float
);
end component mem_signed1024;

signal mem_signed1024_clock : std_logic;
signal mem_signed1024_reset : std_logic;
signal mem_signed1024_ivalue : std_logic_vector (9 downto 0); -- input hex from 0 to 1024
signal mem_signed1024_ovalue : std_logic_vector (31 downto 0); -- output signed 0 to 1024 in SP float

signal nibble1 : std_logic_vector (5 downto 0);
signal nibble2 : std_logic_vector (3 downto 0);

signal out_nibble1,out_nibble2 : std_logic_vector (31 downto 0);

begin

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

mulfpa <= mulfpa_internal;
mulfpb <= mulfpb_internal;
mulfpond <= mulfpond_internal;
mulfpsclr <= mulfpsclr_internal;
mulfpce <= mulfpce_internal;
mulfpr_internal <= mulfpr;
mulfprdy_internal <= mulfprdy;

--INIT_00 => X"3f870000 3f860000 3f850000 3f840000 3f830000 3f820000 3f810000 3f800000",
--INIT_01 => X"3f8f0000 3f8e0000 3f8d0000 3f8c0000 3f8b0000 3f8a0000 3f890000 3f880000",
--INIT_02 => X"3f970000 3f960000 3f950000 3f940000 3f930000 3f920000 3f910000 3f900000",
--INIT_03 => X"3f9f0000 3f9e0000 3f9d0000 3f9c0000 3f9b0000 3f9a0000 3f990000 3f980000",
--INIT_04 => X"3f4e0000 3f4c0000 3f4a0000 3f480000 3f460000 3f440000 3f420000 3f400000",
--INIT_05 => X"3f5e0000 3f5c0000 3f5a0000 3f580000 3f560000 3f540000 3f520000 3f500000",
--INIT_06 => X"3f6e0000 3f6c0000 3f6a0000 3f680000 3f660000 3f640000 3f620000 3f600000",
--INIT_07 => X"3f7e0000 3f7c0000 3f7a0000 3f780000 3f760000 3f740000 3f720000 3f700000",
with nibble1 select out_nibble1 <= -- (1 + (CP_P12P0_ratio/2^7)) - CP_P12P0_ratio signed -32 - +31
x"3f830000" when "000011",x"3f820000" when "000010",x"3f810000" when "000001",x"3f800000" when "000000",
x"3f870000" when "000111",x"3f860000" when "000110",x"3f850000" when "000101",x"3f840000" when "000100",
x"3f8b0000" when "001011",x"3f8a0000" when "001010",x"3f890000" when "001001",x"3f880000" when "001000",
x"3f8f0000" when "001111",x"3f8e0000" when "001110",x"3f8d0000" when "001101",x"3f8c0000" when "001100",
x"3f930000" when "010011",x"3f920000" when "010010",x"3f910000" when "010001",x"3f900000" when "010000",
x"3f970000" when "010111",x"3f960000" when "010110",x"3f950000" when "010101",x"3f940000" when "010100",
x"3f9b0000" when "011011",x"3f9a0000" when "011010",x"3f990000" when "011001",x"3f980000" when "011000",
x"3f9f0000" when "011111",x"3f9e0000" when "011110",x"3f9d0000" when "011101",x"3f9c0000" when "011100",
x"3f460000" when "100011",x"3f440000" when "100010",x"3f420000" when "100001",x"3f400000" when "100000",
x"3f4e0000" when "100111",x"3f4c0000" when "100110",x"3f4a0000" when "100101",x"3f480000" when "100100",
x"3f560000" when "101011",x"3f540000" when "101010",x"3f520000" when "101001",x"3f500000" when "101000",
x"3f5e0000" when "101111",x"3f5c0000" when "101110",x"3f5a0000" when "101101",x"3f580000" when "101100",
x"3f660000" when "110011",x"3f640000" when "110010",x"3f620000" when "110001",x"3f600000" when "110000",
x"3f6e0000" when "110111",x"3f6c0000" when "110110",x"3f6a0000" when "110101",x"3f680000" when "110100",
x"3f760000" when "111011",x"3f740000" when "111010",x"3f720000" when "111001",x"3f700000" when "111000",
x"3f7e0000" when "111111",x"3f7c0000" when "111110",x"3f7a0000" when "111101",x"3f780000" when "111100",
x"00000000" when others;

--INIT_01 => X"54800000 54000000 53800000 53000000 52800000 52000000 51800000 51000000",
--INIT_00 => X"50800000 50000000 4f800000 4f000000 4e800000 4e000000 4d800000 4d000000",
with nibble2 select out_nibble2 <= -- 2^(x+27) - alphascale
x"4d000000" when x"0", x"4d800000" when x"1", x"4e000000" when x"2", x"4e800000" when x"3",
x"4f000000" when x"4", x"4f800000" when x"5", x"50000000" when x"6", x"50800000" when x"7",
x"51000000" when x"8", x"51800000" when x"9", x"52000000" when x"a", x"52800000" when x"b",
x"53000000" when x"c", x"53800000" when x"d", x"54000000" when x"e", x"54800000" when x"f",
x"00000000" when others;

p0 : process (i_clock,i_reset) is
	variable fptmp1,fptmp2 : fd2ft;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,
	ending);
	variable state : states;
	variable ee0x2439 : std_logic_vector (15 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			mulfpsclr_internal <= '1';
			divfpsclr_internal <= '1';
			o_acpsubpage0 <= (others => '0');
			o_acpsubpage1 <= (others => '0');
			o_rdy <= '0';
			divfpa_internal <= (others => '0');
			divfpb_internal <= (others => '0');
			divfpce_internal <= '0';
			divfpond_internal <= '0';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			mem_signed1024_ivalue <= (others => '0');
			nibble1 <= (others => '0');
			nibble2 <= (others => '0');
			i2c_mem_ena <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
						i2c_mem_ena <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
					end if;
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
				when s1 => state := s2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+0, 12)); -- 2420 MSB Ascalecp 4bit
				when s2 => state := s3;
					i2c_mem_addra <= std_logic_vector (to_unsigned (57*2+0, 12)); -- 2439 MSB Acpsubpage0 10bit/CP_P12P0_ratio 6bit
				when s3 => state := s4;
					nibble2 <= i2c_mem_douta (7 downto 4); -- Ascalecp 4bit
					i2c_mem_addra <= std_logic_vector (to_unsigned (57*2+1, 12)); -- 2439 LSB Acpsubpage0 10bit/CP_P12P0_ratio 6bit
				when s4 => state := s5;
					ee0x2439 (15 downto 8) := i2c_mem_douta;
				when s5 => state := s6;
					ee0x2439 (7 downto 0) := i2c_mem_douta;
				when s6 => state := s7;
					nibble1 <= ee0x2439 (15 downto 10); -- CP_P12P0_ratio 6bit
					mem_signed1024_ivalue <= ee0x2439 (9 downto 0); -- Acpsubpage0 10bit
				when s7 => state := s8;
				when s8 => state := s9;
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed1024_ovalue; -- Acpsubpage0
					divfpb_internal <= out_nibble2; -- 2^(Ascalecp+27)
					divfpond_internal <= '1';
				when s9 =>
					if (divfprdy_internal = '1') then state := s10;
						fptmp1 := divfpr_internal;
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
						o_acpsubpage0 <= fptmp1;
--						report "================ calculateAlphaCP o_acpsubpage0 : " & real'image (ap_slv2fp (fptmp1));
					else state := s9; end if;
				when s10 => state := s11;
					divfpsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= fptmp1; -- Acpsubpage0/(2^(Ascalecp+27))
					mulfpb_internal <= out_nibble1; -- (1 + (CP_P12P0_ratio/2^7))
					mulfpond_internal <= '1';
				when s11 =>
					if (mulfprdy_internal = '1') then state := ending;
						fptmp1 := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
						o_acpsubpage1 <= fptmp1;
--						report "================ calculateAlphaCP o_acpsubpage1 : " & real'image (ap_slv2fp (fptmp1));
					else state := s11; end if;
				when ending => state := idle;
					mulfpsclr_internal <= '0';
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

end Behavioral;

