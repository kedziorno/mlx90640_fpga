----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:58 02/19/2023 
-- Design Name: 
-- Module Name:    CalculateTo - Behavioral 
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

entity CalculateTo is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_Ta : IN  std_logic_vector(31 downto 0);

i_vircompensated_do : IN  std_logic_vector(31 downto 0);
o_vircompensated_addr : OUT  std_logic_vector(9 downto 0);

i_alphacomp_do : IN  std_logic_vector(31 downto 0);
o_alphacomp_addr : OUT  std_logic_vector(9 downto 0);

o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);

o_rdy : out std_logic
);
end CalculateTo;

architecture Behavioral of CalculateTo is

component mem_signed256 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_value : in std_logic_vector (7 downto 0); -- input hex from 0 to 255
o_value : out std_logic_vector (31 downto 0) -- output signed -128 to 127 in SP float
);
end component mem_signed256;
signal mem_signed256_clock : std_logic;
signal mem_signed256_reset : std_logic;
signal mem_signed256_ivalue : std_logic_vector (7 downto 0); -- input hex from 0 to 255
signal mem_signed256_ovalue : std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float

COMPONENT ExtractKsToScaleParameter
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_kstoscale : OUT  std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
END COMPONENT;
signal ExtractKsToScaleParameter_clock : std_logic;
signal ExtractKsToScaleParameter_reset : std_logic;
signal ExtractKsToScaleParameter_run : std_logic;
signal ExtractKsToScaleParameter_i2c_mem_ena : STD_LOGIC;
signal ExtractKsToScaleParameter_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKsToScaleParameter_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKsToScaleParameter_kstoscale : std_logic_vector (31 downto 0);
signal ExtractKsToScaleParameter_rdy : std_logic;

signal ExtractKsToScaleParameter_mux : std_logic;

begin

p0 : process (i_clock) is
	constant C_ROWS : integer := 24;
	constant C_COLS : integer := 32;
	variable i : integer range 0 to C_ROWS*C_COLS-1;
	constant constTr : std_logic_vector (31 downto 0) := x"41000000"; -- 8
	constant const27315 : std_logic_vector (31 downto 0) := x"43889333"; -- 273.15
	constant constEmissivity : std_logic_vector (31 downto 0) := x"3f800000"; -- 1
	constant const1 : std_logic_vector (31 downto 0) := x"3f800000"; -- 1
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			i := 0;
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
					i := 0;


				when s1 => state := s2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (61*2+0, 12)); -- ee243d MSB ksto2ee 0xff00
				when s2 => state := s3;
				when s3 => state := s4;
					mem_signed256_ivalue <= i2c_mem_douta; -- ksto2ee

	when s4 => state := s5;
		ExtractKsToScaleParameter_run <= '1';
		ExtractKsToScaleParameter_mux <= '1';
	when s5 => 
		ExtractKsToScaleParameter_run <= '0';
		if (ExtractKsToScaleParameter_rdy = '1') then
			state := s6;
			ExtractKsToScaleParameter_mux <= '0';
		else
			state := s5;
			ExtractKsToScaleParameter_mux <= '1';
		end if;

	when s6 => state := s7;
		divfpce <= '1';
		divfpa <= mem_signed256_ovalue;
		divfpb <= ExtractKsToScaleParameter_kstoscale;
		divfpond <= '1';
	when s7 =>
		if (divfprdy = '1') then state := s8;
			ksto2 := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s7; end if;
	when s8 => state := s9;
		divfpsclr <= '0';

		subfpce <= '1';
		subfpa <= i_Ta;
		subfpb <= constTr;
		subfpond <= '1';
	when s9 =>
		if (subfprdy = '1') then state := s10;
			tr_ft := subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s9; end if;
	when s10 => state := s11;
		subfpsclr <= '0';

		addfpce <= '1';
		addfpa <= i_Ta;
		addfpb <= const27315;
		addfpond <= '1';
	when s10 =>
		if (addfprdy = '1') then state := s11;
			fttmp1 := addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s10; end if;
	when s11 => state := s12;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s12 =>
		if (mulfprdy = '1') then state := s13;
			fttmp2 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s12; end if;
	when s13 => state := s14;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp2;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s14 =>
		if (mulfprdy = '1') then state := s15;
			fttmp2 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s14; end if;
	when s15 => state := s16;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp2;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s16 =>
		if (mulfprdy = '1') then state := s17;
			tak4 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s16; end if;
	when s17 => state := s18;
		mulfpsclr <= '0';

		addfpce <= '1';
		addfpa <= Tr;
		addfpb <= const27315;
		addfpond <= '1';
	when s18 =>
		if (addfprdy = '1') then state := s19;
			fttmp1 := addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s18; end if;
	when s19 => state := s20;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s20 =>
		if (mulfprdy = '1') then state := s21;
			fttmp2 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s20; end if;
	when s21 => state := s22;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp2;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s22 =>
		if (mulfprdy = '1') then state := s23;
			fttmp2 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s22; end if;
	when s23 => state := s24;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp2;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s24 =>
		if (mulfprdy = '1') then state := s25;
			trk4 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s24; end if;
	when s25 => state := s26;
		mulfpsclr <= '0';

		subfpce <= '1';
		subfpa <= trk4;
		subfpb <= tak4;
		subfpond <= '1';
	when s26 =>
		if (subfprdy = '1') then state := s27;
			fttmp1 := subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s26; end if;
	when s27 => state := s28;
		subfpsclr <= '0';

		divfpce <= '1';
		divfpa <= fttmp1;
		divfpb <= constEmissivity;
		divfpond <= '1';
	when s28 =>
		if (divfprdy = '1') then state := s29;
			fttmp1 := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s28; end if;
	when s29 => state := s30;
		divfpsclr <= '0';

		subfpce <= '1';
		subfpa <= trk4;
		subfpb <= fttmp1;
		subfpond <= '1';
	when s30 =>
		if (subfprdy = '1') then state := s31;
			tar := subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s30; end if;
	when s31 => state := s32;
		subfpsclr <= '0';
	when s32 => state := s33;
		o_vircompensated_addr <= std_logic_vector (to_unsigned (i, 10));
		o_alphacomp_addr <= std_logic_vector (to_unsigned (i, 10));
	when s33 => state := s34;
	when s34 => state := s35;
		mulfpa <= i_alphacomp_do;
		mulfpb <= i_alphacomp_do;
		mulfpce <= '1';
		mulfpond <= '1';
	when s35 =>
		if (mulfprdy = '1') then state := s36;
			fttmp1 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s35; end if;
	when s36 => state := s37;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1;
		mulfpb <= i_alphacomp_do;
		mulfpond <= '1';
	when s37 =>
		if (mulfprdy = '1') then state := s38;
			acomp_pow3 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s37; end if;
	when s38 => state := s39;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= acomp_pow3;
		mulfpb <= i_alphacomp_do;
		mulfpond <= '1';
	when s39 =>
		if (mulfprdy = '1') then state := s40;
			acomp_pow4 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s39; end if;
	when s40 => state := s41;
		mulfpsclr <= '0';

		mulfpce <= '1';
		mulfpa <= acomp_pow3;
		mulfpb <= i_vircompensated_do;
		mulfpond <= '1';
	when s41 =>
		if (mulfprdy = '1') then state := s42;
			fttmp1 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s41; end if;
	when s42 => state := s43;
		mulfpsclr <= '0';

		mulfpce <= '1';
		mulfpa <= acomp_pow4;
		mulfpb <= tar;
		mulfpond <= '1';
	when s43 =>
		if (mulfprdy = '1') then state := s44;
			fttmp2 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s43; end if;
	when s44 => state := s45;
		mulfpsclr <= '0';

		addfpce <= '1';
		addfpa <= fttmp1;
		addfpb <= fttmp2;
		addfpond <= '1';
	when s45 =>
		if (addfprdy = '1') then state := s46;
			fttmp1 := addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s45; end if;
	when s46 => state := s47;
		addfpsclr <= '0';

		sqrtfp2ce <= '1';
		sqrtfp2a <= fttmp1;
		sqrtfp2ond <= '1';
	when s47 =>
		if (sqrtfp2rdy = '1') then state := s48;
			fttmp1 := sqrtfp2r;
			sqrtfp2ce <= '0';
			sqrtfp2ond <= '0';
			sqrtfp2sclr <= '1';
		else state := s47; end if;
	when s48 => state := s49;
		sqrtfp2sclr <= '0';

		sqrtfp2ce <= '1';
		sqrtfp2a <= fttmp1;
		sqrtfp2ond <= '1';
	when s49 =>
		if (sqrtfp2rdy = '1') then state := s50;
			fttmp1 := sqrtfp2r;
			sqrtfp2ce <= '0';
			sqrtfp2ond <= '0';
			sqrtfp2sclr <= '1';
		else state := s49; end if;
	when s50 => state := s51;
		sqrtfp2sclr <= '0';

		mulfpce <= '1';
		mulfpa <= fttmp1;
		mulfpb <= ksto2;
		mulfpond <= '1';
	when s51 =>
		if (mulfprdy = '1') then state := s52;
			fttmp1 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s51; end if;
	when s52 => state := s54;
		mulfpsclr <= '0';

		mulfpce <= '1';
		mulfpa <= ksto2_ft;
		mulfpb <= k27315_ft;
		mulfpond <= '1';
	when s369 =>
		if (mulfprdy = '1') then state := s370;
			fttmp2_ft := mulfpr;
			outTo := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s369; end if;
	when s370 => state := s371;
		mulfpsclr <= '0';


				when others => null;
			end case;
		end if;
	end if;
end process p0;

--INIT_01 => X"4b000000 4a800000 4a000000 49800000 49000000 48800000 48000000 47800000",
--INIT_00 => X"47000000 46800000 46000000 45800000 45000000 44800000 44000000 43800000",
with nibble1 select out_nibble1 <= -- 2^(x+8) unsigned 0-15 - kstoscale
x"43800000" when x"0", x"44000000" when x"1", x"44800000" when x"2", x"45000000" when x"3",
x"45800000" when x"4", x"46000000" when x"5", x"46800000" when x"6", x"47000000" when x"7",
x"47800000" when x"8", x"48000000" when x"9", x"48800000" when x"a", x"49000000" when x"b",
x"49800000" when x"c", x"4a000000" when x"d", x"4a800000" when x"e", x"4b000000" when x"f",
x"00000000" when others;

mem_signed256_clock <= i_clock;
mem_signed256_reset <= i_reset;
inst_mem_signed256 : mem_signed256 port map (
i_clock => mem_signed256_clock,
i_reset => mem_signed256_reset,
i_value => mem_signed256_ivalue,
o_value => mem_signed256_ovalue
);

ExtractKsToScaleParameter_clock <= i_clock;
ExtractKsToScaleParameter_reset <= i_reset;
inst_ExtractKsToScaleParameter : ExtractKsToScaleParameter port map (
i_clock => ExtractKsToScaleParameter_clock,
i_reset => ExtractKsToScaleParameter_reset,
i_run => ExtractKsToScaleParameter_run,
i2c_mem_ena => ExtractKsToScaleParameter_i2c_mem_ena,
i2c_mem_addra => ExtractKsToScaleParameter_i2c_mem_addra,
i2c_mem_douta => ExtractKsToScaleParameter_i2c_mem_douta,
o_kstoscale => ExtractKsToScaleParameter_kstoscale,
o_rdy => ExtractKsToScaleParameter_rdy
);

end Behavioral;
