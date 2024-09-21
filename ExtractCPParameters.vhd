----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:00:55 02/06/2023 
-- Design Name: 
-- Module Name:    ExtractCPParameters - Behavioral 
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
library ieee, ieee_proposed;
--library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;


--library UNISIM;
--use UNISIM.VComponents.all;

--use work.p_fphdl_package1.all;
use work.p_fphdl_package3.all;

entity ExtractCPParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2420 : in slv16; -- alphascale
i_ee0x2438 : in slv16; -- ktaScale1,kvScale
i_ee0x2439 : in slv16; -- alphasp0,alphasp1
i_ee0x243a : in slv16; -- offsetsp0,offsetsp1 - offcpsubpage0,offcpsubpage1
i_ee0x243b : in slv16; -- cpKta,cpKv
o_cpAlpha0 : out std_logic_vector (31 downto 0); -- acpsubpage0
o_cpAlpha1 : out std_logic_vector (31 downto 0); -- acpsubpage1
o_cpOffset0 : out std_logic_vector (31 downto 0); -- offcpsubpage0
o_cpOffset1 : out std_logic_vector (31 downto 0); -- offcpsubpage1
o_cpKv : out std_logic_vector (31 downto 0); -- kvcp
o_cpKta : out std_logic_vector (31 downto 0); -- ktacp
o_rdy : out std_logic
);
end ExtractCPParameters;

architecture Behavioral of ExtractCPParameters is

COMPONENT divfp
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

signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfpclk : STD_LOGIC;
signal divfpsclr : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : STD_LOGIC;

COMPONENT mulfp
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

signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfpclk : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : STD_LOGIC;

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

component mem_signed256 is -- for Kta,Kv,cpKta,cpKv
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_value : in std_logic_vector (7 downto 0); -- input hex from 0 to 255
o_value : out std_logic_vector (31 downto 0) -- output signed -128 to 127 in SP float
);
end component mem_signed256;

signal mem_signed256_clock : std_logic;
signal mem_signed256_reset : std_logic;
signal mem_signed256_ivalue : std_logic_vector (7 downto 0);
signal mem_signed256_ovalue : std_logic_vector (31 downto 0);

COMPONENT mem_signed1024 -- 1024 - -512-511 - offsetSP0 floatSP , alphaSP0
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_value : IN  std_logic_vector(9 downto 0);
o_value : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT mem_signed1024;

signal mem_signed1024_clock : std_logic;
signal mem_signed1024_reset : std_logic;
signal mem_signed1024_ivalue : std_logic_vector(9 downto 0);
signal mem_signed1024_ovalue : std_logic_vector(31 downto 0);

signal nibble1,nibble3,nibble4 : std_logic_vector (3 downto 0);
signal nibble2 : std_logic_vector (5 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4 : std_logic_vector (31 downto 0);

begin

p0 : process (i_clock) is
	constant const1 : std_logic_vector (31 downto 0) := x"3f800000";
	constant const128 : std_logic_vector (31 downto 0) := x"43000000";
	variable offsetSP01 : std_logic_vector (31 downto 0);
	variable alphaSP0,alphaSP1 : std_logic_vector (31 downto 0);
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			addfpsclr <= '1';
			mulfpsclr <= '1';
			divfpsclr <= '1';
			o_rdy <= '0';
			addfpa <= (others => '0');
			addfpb <= (others => '0');
			mulfpa <= (others => '0');
			mulfpb <= (others => '0');
			divfpa <= (others => '0');
			divfpb <= (others => '0');
			addfpond <= '0';
			mulfpond <= '0';
			divfpond <= '0';
			addfpce <= '0';
			mulfpce <= '0';
			divfpce <= '0';
			mem_signed256_ivalue <= (others => '0');
			mem_signed1024_ivalue <= (others => '0');
			nibble1 <= (others => '0');
			nibble2 <= (others => '0');
			nibble3 <= (others => '0');
			nibble4 <= (others => '0');
			o_cpAlpha0 <= (others => '0');
			o_cpAlpha1 <= (others => '0');
			o_cpOffset0 <= (others => '0');
			o_cpOffset1 <= (others => '0');
			o_cpKv <= (others => '0');
			o_cpKta <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
					else
						state := idle;
					end if;
					addfpsclr <= '0';
					mulfpsclr <= '0';
					divfpsclr <= '0';
				when s1 => state := s2;
					nibble1 <= i_ee0x2420 (15 downto 12); -- alphascale
					nibble2 <= i_ee0x243a (15 downto 10); -- offsetSP1 6bit
					mem_signed1024_ivalue <= i_ee0x243a (9 downto 0); -- offsetSP0 10bit
				when s2 => state := s3;
				when s3 => state := s4;
					addfpce <= '1';
					addfpa <= out_nibble2; -- offsetSP1
					addfpb <= mem_signed1024_ovalue; -- offsetSP0
					addfpond <= '1';
					o_cpOffset0 <= mem_signed1024_ovalue;
				when s4 =>
					if (addfprdy = '1') then state := s5;
						offsetSP01 := addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
						o_cpOffset1 <= offsetSP01;
						mem_signed1024_ivalue <= i_ee0x2439 (9 downto 0); -- alphaSP0
					else state := s4; end if;
				when s5 => state := s6;
					addfpsclr <= '0';
					nibble2 <= i_ee0x2439 (15 downto 10); -- alphaSP1
					divfpce <= '1';
					divfpa <= mem_signed1024_ovalue; -- alphaSP0
					divfpb <= out_nibble1; -- 2^(alphaScale+27)
					divfpond <= '1';
				when s6 =>
					if (divfprdy = '1') then state := s7;
						alphaSP0 := divfpr;
						divfpce <= '0';
						divfpond <= '0';
						divfpsclr <= '1';
						o_cpAlpha0 <= alphaSP0; -- alphaSP0/(2^(alphaScale+27))
					else state := s6; end if;
				when s7 => state := s8;
					divfpsclr <= '0';
					divfpce <= '1';
					divfpa <= out_nibble2; -- alphaSP1
					divfpb <= const128; -- 128
					divfpond <= '1';
				when s8 =>
					if (divfprdy = '1') then state := s9;
						alphaSP1 := divfpr;
						divfpce <= '0';
						divfpond <= '0';
						divfpsclr <= '1';
					else state := s8; end if;
				when s9 => state := s10;
					divfpsclr <= '0';
					addfpce <= '1';
					addfpa <= alphaSP1; -- alphaSP1/128
					addfpb <= const1; -- 1
					addfpond <= '1';
				when s10 =>
					if (addfprdy = '1') then state := s11;
						alphaSP1 := addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s10; end if;
				when s11 => state := s12;
					addfpsclr <= '0';
					mem_signed256_ivalue <= i_ee0x243b (7 downto 0); -- cpKta
					nibble3 <= i_ee0x2438 (7 downto 4); -- ktascale1
					mulfpce <= '1';
					mulfpa <= alphaSP1; -- 1+alphaSP1/128
					mulfpb <= alphaSP0; -- alphaSP0
					mulfpond <= '1';
				when s12 =>
					if (mulfprdy = '1') then state := s13;
						alphaSP1 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
						o_cpAlpha1 <= alphaSP1; -- (1+alphaSP1/128)*alphaSP0
					else state := s12; end if;
				when s13 => state := s14;
					mulfpsclr <= '0';
					mem_signed256_ivalue <= i_ee0x243b (15 downto 0); -- cpKv
					nibble4 <= i_ee0x2438 (11 downto 8); -- kvscale
					divfpce <= '1';
					divfpa <= mem_signed256_ovalue; -- cpKta
					divfpb <= out_nibble3; -- 2^(ktaScale1+8)
					divfpond <= '1';
				when s14 =>
					if (divfprdy = '1') then state := s15;
						o_cpKta <= divfpr;
						divfpce <= '0';
						divfpond <= '0';
						divfpsclr <= '1';
            --synthesis translate_off
						report "================ extractCPParameters cpKta : " & real'image (ap_slv2fp (divfpr));
            --synthesis translate_on
          else state := s14; end if;
				when s15 => state := s16;
					divfpsclr <= '0';
					divfpce <= '1';
					divfpa <= mem_signed256_ovalue; -- cpKv
					divfpb <= out_nibble4; -- 2^kvscale
					divfpond <= '1';
				when s16 =>
					if (divfprdy = '1') then state := s17;
						o_cpKv <= divfpr;
						divfpce <= '0';
						divfpond <= '0';
						divfpsclr <= '1';
            --synthesis translate_off
						report "================ extractCPParameters cpKv : " & real'image (ap_slv2fp (divfpr));
            --synthesis translate_on
          else state := s16; end if;
				when s17 => state := idle;
					divfpsclr <= '0';
					o_rdy <= '1';
				when others => null;
			end case;
		end if;
		end if;
end process p0;

--INIT_01 => X"54800000 54000000 53800000 53000000 52800000 52000000 51800000 51000000",
--INIT_00 => X"50800000 50000000 4f800000 4f000000 4e800000 4e000000 4d800000 4d000000",
with nibble1 select out_nibble1 <= -- 2^(x+27) - alphascale
x"4d000000" when x"0", x"4d800000" when x"1", x"4e000000" when x"2", x"4e800000" when x"3",
x"4f000000" when x"4", x"4f800000" when x"5", x"50000000" when x"6", x"50800000" when x"7",
x"51000000" when x"8", x"51800000" when x"9", x"52000000" when x"a", x"52800000" when x"b",
x"53000000" when x"c", x"53800000" when x"d", x"54000000" when x"e", x"54800000" when x"f",
x"00000000" when others;

with nibble2 select out_nibble2 <= -- >31,-64 - offsetSP1 , alphaSP1
x"40e00000" when "000111",x"40c00000" when "000110",x"40a00000" when "000101",x"40800000" when "000100",x"40400000" when "000011",x"40000000" when "000010",x"3f800000" when "000001",x"22000000" when "000000",
x"41700000" when "001111",x"41600000" when "001110",x"41500000" when "001101",x"41400000" when "001100",x"41300000" when "001011",x"41200000" when "001010",x"41100000" when "001001",x"41000000" when "001000",
x"41b80000" when "010111",x"41b00000" when "010110",x"41a80000" when "010101",x"41a00000" when "010100",x"41980000" when "010011",x"41900000" when "010010",x"41880000" when "010001",x"41800000" when "010000",
x"41f80000" when "011111",x"41f00000" when "011110",x"41e80000" when "011101",x"41e00000" when "011100",x"41d80000" when "011011",x"41d00000" when "011010",x"41c80000" when "011001",x"41c00000" when "011000",
x"c1c80000" when "100111",x"c1d00000" when "100110",x"c1d80000" when "100101",x"c1e00000" when "100100",x"c1e80000" when "100011",x"c1f00000" when "100010",x"c1f80000" when "100001",x"c2000000" when "100000",
x"c1880000" when "101111",x"c1900000" when "101110",x"c1980000" when "101101",x"c1a00000" when "101100",x"c1a80000" when "101011",x"c1b00000" when "101010",x"c1b80000" when "101001",x"c1c00000" when "101000",
x"c1100000" when "110111",x"c1200000" when "110110",x"c1300000" when "110101",x"c1400000" when "110100",x"c1500000" when "110011",x"c1600000" when "110010",x"c1700000" when "110001",x"c1800000" when "110000",
x"bf800000" when "111111",x"c0000000" when "111110",x"c0400000" when "111101",x"c0800000" when "111100",x"c0a00000" when "111011",x"c0c00000" when "111010",x"c0e00000" when "111001",x"c1000000" when "111000",
x"00000000" when others;

--INIT_01 => X"4b000000 4a800000 4a000000 49800000 49000000 48800000 48000000 47800000",
--INIT_00 => X"47000000 46800000 46000000 45800000 45000000 44800000 44000000 43800000",
with nibble3 select out_nibble3 <= -- 2^(x+8) - ktascale1
x"43800000" when x"0", x"44000000" when x"1", x"44800000" when x"2", x"45000000" when x"3",
x"45800000" when x"4", x"46000000" when x"5", x"46800000" when x"6", x"47000000" when x"7",
x"47800000" when x"8", x"48000000" when x"9", x"48800000" when x"a", x"49000000" when x"b",
x"49800000" when x"c", x"4a000000" when x"d", x"4a800000" when x"e", x"4b000000" when x"f",
x"00000000" when others;

--INIT_01 => X"47000000 46800000 46000000 45800000 45000000 44800000 44000000 43800000",
--INIT_00 => X"43000000 42800000 42000000 41800000 41000000 40800000 40000000 3f800000",
with nibble4 select out_nibble4 <= -- 2^x - kvscale
x"3f800000" when x"0", x"40000000" when x"1", x"40800000" when x"2", x"41000000" when x"3",
x"41800000" when x"4", x"42000000" when x"5", x"42800000" when x"6", x"43000000" when x"7",
x"43800000" when x"8", x"44000000" when x"9", x"44800000" when x"a", x"45000000" when x"b",
x"45800000" when x"c", x"46000000" when x"d", x"46800000" when x"e", x"47000000" when x"f",
x"00000000" when others;

mem_signed256_clock <= i_clock;
mem_signed256_reset <= i_reset;
inst_mem_signed256 : mem_signed256
port map (
i_clock => mem_signed256_clock,
i_reset => mem_signed256_reset,
i_value => mem_signed256_ivalue,
o_value => mem_signed256_ovalue
);

mem_signed1024_clock <= i_clock;
mem_signed1024_reset <= i_reset;
inst_mem_signed1024_offsetSP0_alphaSP0 : mem_signed1024 -- 1024 - -512-511 - offsetSP0 floatSP , alphaSP0
port map (
i_clock => mem_signed1024_clock,
i_reset => mem_signed1024_reset,
i_value => mem_signed1024_ivalue,
o_value => mem_signed1024_ovalue
);

addfpclk <= i_clock;
mulfpclk <= i_clock;
divfpclk <= i_clock;

inst_divfp : divfp
PORT MAP (
a => divfpa,
b => divfpb,
operation_nd => divfpond,
clk => divfpclk,
sclr => divfpsclr,
ce => divfpce,
result => divfpr,
rdy => divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => mulfpa,
b => mulfpb,
operation_nd => mulfpond,
clk => mulfpclk,
sclr => mulfpsclr,
ce => mulfpce,
result => mulfpr,
rdy => mulfprdy
);

inst_addfp : addfp
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
