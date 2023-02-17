----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:58:44 02/17/2023 
-- Design Name: 
-- Module Name:    CalculatePixOsCPSP - Behavioral 
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
library IEEE,ieee_proposed;
use IEEE.STD_LOGIC_1164.ALL;
use ieee_proposed.fixed_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package1.all;

entity CalculatePixOsCPSP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_KGain : in std_logic_vector (31 downto 0);
i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_VddV0 : in std_logic_vector (31 downto 0);
i_const1 : in std_logic_vector (31 downto 0);

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_pixoscpsp0 : out std_logic_vector (31 downto 0);
o_pixoscpsp1 : out std_logic_vector (31 downto 0);

o_rdy : out std_logic
);
end CalculatePixOsCPSP;

architecture Behavioral of CalculatePixOsCPSP is

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatclk : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;

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

COMPONENT subfp
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

signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfpclk : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : STD_LOGIC;

COMPONENT mem_signed1024 -- 1024 - -512-511 - offsetSP0 floatSP
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

signal rdy : std_logic;

signal nibble1 : std_logic_vector (5 downto 0);
signal nibble2,nibble3 : std_logic_vector (3 downto 0);
signal out_nibble1,out_nibble2,out_nibble3 : std_logic_vector (31 downto 0);

begin

o_rdy <= rdy;

p0 : process (i_clock) is
	variable eeprom16slv,ram16slv : slv16;
	variable eeprom16sf,ram16sf : sfixed16;
	variable eeprom16uf,ram16uf : ufixed16;
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,
	s31,s32,s33,s34,s35,s36,s37,s38,s39,s40,
	s41,s42,s43,s44,s45,s46,s47,s48,s49,s50,
	s51,s52,s53,s54,s55,s56,s57,s58,s59,s60,
	s61,s62,s63,s64,s65,s66,s67,s68,s69,s70,
	s71,s72,s73,s74,s75,s76,s77,s78,s79,s80,
	s81,s82,s83,s84,s85,s86,s87,s88,s89,s90,
	s91,s92,s93,s94,s95,s96,s97,s98,s99,s100,s21a,s56a,
	ending);
	variable state : states;
	variable fttmp1,fttmp2,ram0708_ft,ram0728_ft,pixoscpsp0_ft,pixoscpsp1_ft,pixgaincpsp0_ft,pixgaincpsp1_ft,offcpsubpage0_ft,offcpsubpage1delta_ft,offcpsubpage1_ft,kvcpee_ft,ktacpee_ft,kvcp_ft,ktacp_ft : std_logic_vector (31 downto 0);
	variable ram0708,ram0728 : slv16;
	variable offcpsubpage0 : std_logic_vector (15 downto 0);
	variable ram0708_fd,ram0728_fd : st_sfixed_max;
	variable fracas : fracas;
	variable fracbs : fracbs;
	variable fracau : fracau;
	variable fracbu : fracbu;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			addfpsclr <= '1';
			subfpsclr <= '1';
			mulfpsclr <= '1';
			divfpsclr <= '1';
			fixed2floatsclr <= '1';
			rdy <= '0';
			mulfpa <= (others => '0');
			mulfpb <= (others => '0');
			addfpa <= (others => '0');
			addfpb <= (others => '0');
			subfpa <= (others => '0');
			subfpb <= (others => '0');
			divfpa <= (others => '0');
			divfpb <= (others => '0');
			mulfpond <= '0';
			addfpond <= '0';
			subfpond <= '0';
			divfpond <= '0';
			mulfpce <= '0';
			addfpce <= '0';
			subfpce <= '0';
			divfpce <= '0';
			i2c_mem_ena <= '0';
			i2c_mem_addra <= (others => '0');
			o_pixoscpsp0 <= (others => '0');
			o_pixoscpsp1 <= (others => '0');
			fixed2floata <= (others => '0');
			fixed2floatond <= '0';
			fixed2floatce <= '0';
			mem_signed1024_ivalue <= (others => '0');
			mem_signed256_ivalue <= (others => '0');
			nibble1 <= (others => '0');
			nibble2 <= (others => '0');
			nibble3 <= (others => '0');
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
					addfpsclr <= '0';
					subfpsclr <= '0';
					mulfpsclr <= '0';
					divfpsclr <= '0';
					fixed2floatsclr <= '0';
				when s1 => state := s2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(776*2)+0, 12)); -- ram0708 - pixgain_cp_sp0
				when s2 => state := s3;
				when s3 => state := s4;
					ram0708 (15 downto 8) := i2c_mem_douta;
				when s4 => state := s5;
					i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(776*2)+1, 12)); -- ram0708 - pixgain_cp_sp0
				when s5 => state := s6;
				when s6 => state := s7;
					ram0708 (7 downto 0) := i2c_mem_douta;

				when s7 => state := s8;
					i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(808*2)+0, 12)); -- ram0728 - pixgain_cp_sp1
				when s8 => state := s9;
				when s9 => state := s10;
					ram0728 (15 downto 8) := i2c_mem_douta;
				when s10 => state := s11;
					i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(808*2)+1, 12)); -- ram0728 - pixgain_cp_sp1
				when s11 => state := s12;
				when s12 => state := s13;
					ram0728 (7 downto 0) := i2c_mem_douta;

				when s13 => state := s14;
					ram0708_fd := resize (to_sfixed (ram0708, eeprom16sf), ram0708_fd);
					fixed2floatce <= '1';
					fixed2floatond <= '1';
					fixed2floata <= 
					to_slv (to_sfixed (to_slv (ram0708_fd (fracas'high downto fracas'low)), fracas)) & 
					to_slv (to_sfixed (to_slv (ram0708_fd (fracbs'high downto fracbs'low)), fracbs));
				when s14 =>
					if (fixed2floatrdy = '1') then state := s15;
						ram0708_ft := fixed2floatr;
						fixed2floatce <= '0';
						fixed2floatond <= '0';
						fixed2floatsclr <= '1';
					else state := s14; end if;
				when s15 => state := s16;
					fixed2floatsclr <= '0';

				when s16 => state := s17;
					ram0728_fd := resize (to_sfixed (ram0728, eeprom16sf), ram0728_fd);
					fixed2floatce <= '1';
					fixed2floatond <= '1';
					fixed2floata <= 
					to_slv (to_sfixed (to_slv (ram0728_fd (fracas'high downto fracas'low)), fracas)) & 
					to_slv (to_sfixed (to_slv (ram0728_fd (fracbs'high downto fracbs'low)), fracbs));
				when s17 =>
					if (fixed2floatrdy = '1') then state := s18;
						ram0728_ft := fixed2floatr;
						fixed2floatce <= '0';
						fixed2floatond <= '0';
						fixed2floatsclr <= '1';
					else state := s17; end if;
				when s18 => state := s19;
					fixed2floatsclr <= '0';

				when s19 => state := s20;
					mulfpce <= '1';
					mulfpa <= ram0708_ft;
					mulfpb <= i_KGain;
					mulfpond <= '1';
				--	report ": " & real'image (ap_slv2fp (mulfpa));
				--	report ": " & real'image (ap_slv2fp (mulfpb));
				when s20 =>
					if (mulfprdy = '1') then state := s21;
						pixgaincpsp0_ft := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s20; end if;
				when s21 => state := s21a;
					mulfpsclr <= '0';

				when s21a => state := s22;
					mulfpce <= '1';
					mulfpa <= ram0728_ft;
					mulfpb <= i_KGain;
					mulfpond <= '1';
				--	report ": " & real'image (ap_slv2fp (mulfpa));
				--	report ": " & real'image (ap_slv2fp (mulfpb));
				when s22 =>
					if (mulfprdy = '1') then state := s23;
						pixgaincpsp1_ft := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s22; end if;
				when s23 => state := s24;
					mulfpsclr <= '0';


				when s24 => state := s25;
					i2c_mem_addra <= std_logic_vector (to_unsigned (58*2+0, 12)); -- ee243a - offcpsubpage0
				when s25 => state := s26;
				when s26 => state := s27;
					offcpsubpage0 (15 downto 8) := i2c_mem_douta;
				when s27 => state := s28;
					i2c_mem_addra <= std_logic_vector (to_unsigned (58*2+1, 12)); -- ee243a - offcpsubpage0
				when s28 => state := s29;
				when s29 => state := s30;
					offcpsubpage0 (7 downto 0) := i2c_mem_douta;


				when s30 => state := s31;
					mem_signed1024_ivalue <= offcpsubpage0 (9 downto 0); -- ee243a 0x03ff
					nibble1 <= offcpsubpage0 (15 downto 10); -- ee243a 0xfc00
				when s31 => state := s32;
				when s32 => state := s33;
					offcpsubpage0_ft := mem_signed1024_ovalue; -- offcpsubpage0
					offcpsubpage1delta_ft := out_nibble1;
					addfpce <= '1';
					addfpa <= offcpsubpage0_ft;
					addfpb <= offcpsubpage1delta_ft;
					addfpond <= '1';
				when s33 =>
					if (addfprdy = '1') then state := s34;
						offcpsubpage1_ft := addfpr; -- offcpsubpage1
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s33; end if;
				when s34 => state := s35;
					addfpsclr <= '0';



				when s35 => state := s36;
					i2c_mem_addra <= std_logic_vector (to_unsigned (56*2+0, 12)); -- ee2438 MSB - kvscale
				when s36 => state := s37;
				when s37 => state := s38;
					nibble3 <= i2c_mem_douta (3 downto 0); -- ee2438 0f00


				when s38 => state := s39;
					i2c_mem_addra <= std_logic_vector (to_unsigned (56*2+1, 12)); -- ee2438 LSB - ktascale1
				when s39 => state := s40;
				when s40 => state := s41;
					nibble2 <= i2c_mem_douta (7 downto 4); -- ee2438 00f0


				when s41 => state := s42;
					i2c_mem_addra <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
				when s42 => state := s43;
				when s43 => state := s44;
					mem_signed256_ivalue <= i2c_mem_douta;
				when s44 => state := s45;
				when s45 => state := s46;
					kvcpee_ft := mem_signed256_ovalue;
				
				
				when s46 => state := s47;
					i2c_mem_addra <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
				when s47 => state := s48;
				when s48 => state := s49;
					mem_signed256_ivalue <= i2c_mem_douta;
				when s49 => state := s50;
				when s50 => state := s51;
					ktacpee_ft := mem_signed256_ovalue;


				when s51 => state := s52;
					divfpce <= '1';
					divfpa <= ktacpee_ft; -- ktacpee
					divfpb <= out_nibble2; -- 2^(ktascale1+8);
					divfpond <= '1';
				when s52 =>
					if (divfprdy = '1') then state := s53;
						ktacp_ft := divfpr;
						divfpce <= '0';
						divfpond <= '0';
						divfpsclr <= '1';
					else state := s52; end if;
				when s53 => state := s54;
					divfpsclr <= '0';


				when s54 => state := s55;
					divfpce <= '1';
					divfpa <= kvcpee_ft; -- kvcpee
					divfpb <= out_nibble3; -- 2^kvscale;
					divfpond <= '1';
				when s55 =>
					if (divfprdy = '1') then state := s56;
						kvcp_ft := divfpr;
						divfpce <= '0';
						divfpond <= '0';
						divfpsclr <= '1';
					else state := s55; end if;
				when s56 => state := s57;
					divfpsclr <= '0';
					subfpce <= '1';
					subfpa <= i_Vdd;
					subfpb <= i_VddV0;
					subfpond <= '1';
				when s57 =>
					if (subfprdy = '1') then state := s58;
						fttmp1 := subfpr;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else state := s57; end if;
				when s58 => state := s59;
					subfpsclr <= '0';


				when s59 => state := s60;
					subfpce <= '1';
					subfpa <= i_Ta;
					subfpb <= i_Ta0;
					subfpond <= '1';
				when s60 =>
					if (subfprdy = '1') then state := s61;
						fttmp2 := subfpr;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else state := s60; end if;
				when s61 => state := s62;
					subfpsclr <= '0';


				when s62 => state := s63;
					mulfpce <= '1';
					mulfpa <= fttmp1;
					mulfpb <= kvcp_ft;
					mulfpond <= '1';
				when s63 =>
					if (mulfprdy = '1') then state := s64;
						fttmp1 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s63; end if;
				when s64 => state := s65;
					mulfpsclr <= '0';


				when s65 => state := s66;
					addfpce <= '1';
					addfpa <= fttmp1;
					addfpb <= i_const1;
					addfpond <= '1';
				when s66 =>
					if (addfprdy = '1') then state := s67;
						fttmp1 := addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s66; end if;
				when s67 => state := s68;
					addfpsclr <= '0';


				when s68 => state := s69;
					mulfpce <= '1';
					mulfpa <= fttmp2;
					mulfpb <= ktacp_ft;
					mulfpond <= '1';
				when s69 =>
					if (mulfprdy = '1') then state := s70;
						fttmp2 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s69; end if;
				when s70 => state := s71;
					mulfpsclr <= '0';


				when s71 => state := s72;
					addfpce <= '1';
					addfpa <= fttmp2;
					addfpb <= i_const1;
					addfpond <= '1';
				when s72 =>
					if (addfprdy = '1') then state := s73;
						fttmp2 := addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s72; end if;
				when s73 => state := s74;
					addfpsclr <= '0';


				when s74 => state := s75;
					mulfpce <= '1';
					mulfpa <= fttmp1;
					mulfpb <= fttmp2;
					mulfpond <= '1';
				when s75 =>
					if (mulfprdy = '1') then state := s76;
						pixoscpsp0_ft := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s75; end if;
				when s76 => state := s77;
					mulfpsclr <= '0';


				when s77 => state := s78;
					mulfpce <= '1';
					mulfpa <= pixoscpsp0_ft;
					mulfpb <= offcpsubpage0_ft;
					mulfpond <= '1';
				when s78 =>
					if (mulfprdy = '1') then state := s79;
						pixoscpsp0_ft := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s78; end if;
				when s79 => state := s80;
					mulfpsclr <= '0';


				when s80 => state := s81;
					subfpce <= '1';
					subfpa <= pixgaincpsp0_ft;
					subfpb <= pixoscpsp0_ft;
					subfpond <= '1';
				when s81 =>
					if (subfprdy = '1') then state := s82;
						o_pixoscpsp0 <= subfpr;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else state := s81; end if;
				when s82 => state := s83;
					subfpsclr <= '0';


				when s83 => state := s84;
					mulfpce <= '1';
					mulfpa <= fttmp1;
					mulfpb <= fttmp2;
					mulfpond <= '1';
				when s84 =>
					if (mulfprdy = '1') then state := s85;
						pixoscpsp1_ft := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s84; end if;
				when s85 => state := s86;
					mulfpsclr <= '0';


				when s86 => state := s87;
					mulfpce <= '1';
					mulfpa <= pixoscpsp1_ft;
					mulfpb <= offcpsubpage1_ft;
					mulfpond <= '1';
				when s87 =>
					if (mulfprdy = '1') then state := s88;
						pixoscpsp1_ft := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s87; end if;
				when s88 => state := s89;
					mulfpsclr <= '0';


				when s89 => state := s90;
					subfpce <= '1';
					subfpa <= pixgaincpsp1_ft;
					subfpb <= pixoscpsp1_ft;
					subfpond <= '1';
				when s90 =>
					if (subfprdy = '1') then state := s91;
						o_pixoscpsp1 <= subfpr;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else state := s90; end if;
				when s91 => state := ending;
					subfpsclr <= '0';
				when ending => state := idle;
					rdy <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

mem_signed256_clock <= i_clock;
mem_signed256_reset <= i_reset;
inst_mem_signed256_ktacpee_kvcpee : mem_signed256
port map (
i_clock => mem_signed256_clock,
i_reset => mem_signed256_reset,
i_value => mem_signed256_ivalue,
o_value => mem_signed256_ovalue
);

mem_signed1024_clock <= i_clock;
mem_signed1024_reset <= i_reset;
inst_mem_signed1024_offsetSP0 : mem_signed1024 -- 1024 - -512-511 - offsetSP0 floatSP
port map (
i_clock => mem_signed1024_clock,
i_reset => mem_signed1024_reset,
i_value => mem_signed1024_ivalue,
o_value => mem_signed1024_ovalue
);

with nibble1 select out_nibble1 <= -- >31,-64 - offsetSP1 floatSP
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
with nibble2 select out_nibble2 <= -- 2^(x+8) - ktascale1
x"43800000" when x"0", x"44000000" when x"1", x"44800000" when x"2", x"45000000" when x"3",
x"45800000" when x"4", x"46000000" when x"5", x"46800000" when x"6", x"47000000" when x"7",
x"47800000" when x"8", x"48000000" when x"9", x"48800000" when x"a", x"49000000" when x"b",
x"49800000" when x"c", x"4a000000" when x"d", x"4a800000" when x"e", x"4b000000" when x"f",
x"00000000" when others;

--INIT_01 => X"47000000 46800000 46000000 45800000 45000000 44800000 44000000 43800000",
--INIT_00 => X"43000000 42800000 42000000 41800000 41000000 40800000 40000000 3f800000",
with nibble3 select out_nibble3 <= -- 2^x - kvscale
x"3f800000" when x"0", x"40000000" when x"1", x"40800000" when x"2", x"41000000" when x"3",
x"41800000" when x"4", x"42000000" when x"5", x"42800000" when x"6", x"43000000" when x"7",
x"43800000" when x"8", x"44000000" when x"9", x"44800000" when x"a", x"45000000" when x"b",
x"45800000" when x"c", x"46000000" when x"d", x"46800000" when x"e", x"47000000" when x"f",
x"00000000" when others;



addfpclk <= i_clock;
subfpclk <= i_clock;
mulfpclk <= i_clock;
divfpclk <= i_clock;
fixed2floatclk <= i_clock;

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

inst_subfp : subfp
PORT MAP (
a => subfpa,
b => subfpb,
operation_nd => subfpond,
clk => subfpclk,
sclr => subfpsclr,
ce => subfpce,
result => subfpr,
rdy => subfprdy
);

inst_ff2 : fixed2float
PORT MAP (
a => fixed2floata,
operation_nd => fixed2floatond,
clk => fixed2floatclk,
sclr => fixed2floatsclr,
ce => fixed2floatce,
result => fixed2floatr,
rdy => fixed2floatrdy
);

end Behavioral;

