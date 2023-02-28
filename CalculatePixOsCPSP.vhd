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
use work.p_fphdl_package3.all;

entity CalculatePixOsCPSP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

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

o_rdy : out std_logic;

signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

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
signal mulfprdy : in STD_LOGIC;

signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC;

signal subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : out STD_LOGIC;
signal subfpsclr : out STD_LOGIC;
signal subfpce : out STD_LOGIC;
signal subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : in STD_LOGIC

);
end CalculatePixOsCPSP;

architecture Behavioral of CalculatePixOsCPSP is

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

component calculateKGain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_KGain : out fd2ft;
o_rdy : out std_logic;

signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC

);
end component calculateKGain;
signal calculateKGain_clock : std_logic;
signal calculateKGain_reset : std_logic;
signal calculateKGain_run : std_logic;
signal calculateKGain_i2c_mem_ena : STD_LOGIC;
signal calculateKGain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateKGain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculateKGain_KGain : fd2ft;
signal calculateKGain_rdy : std_logic;

signal calculateKGain_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal calculateKGain_fixed2floatond : STD_LOGIC;
signal calculateKGain_fixed2floatsclr : STD_LOGIC;
signal calculateKGain_fixed2floatce : STD_LOGIC;
signal calculateKGain_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateKGain_fixed2floatrdy : STD_LOGIC;

signal calculateKGain_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateKGain_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateKGain_divfpond : STD_LOGIC;
signal calculateKGain_divfpsclr : STD_LOGIC;
signal calculateKGain_divfpce : STD_LOGIC;
signal calculateKGain_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateKGain_divfprdy : STD_LOGIC;

signal rdy : std_logic;

signal nibble1 : std_logic_vector (5 downto 0);
signal nibble2,nibble3 : std_logic_vector (3 downto 0);
signal out_nibble1,out_nibble2,out_nibble3 : std_logic_vector (31 downto 0);

signal i2c_mem_ena_internal : STD_LOGIC;
signal i2c_mem_addra_internal : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta_internal : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal CalculateKGain_mux : std_logic;

signal fixed2floata_internal : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond_internal : STD_LOGIC;
signal fixed2floatce_internal : STD_LOGIC;
signal fixed2floatsclr_internal : STD_LOGIC;
signal fixed2floatr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy_internal : STD_LOGIC;

signal mulfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond_internal : STD_LOGIC;
signal mulfpce_internal : STD_LOGIC;
signal mulfpsclr_internal : STD_LOGIC;
signal mulfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy_internal : STD_LOGIC;

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;

signal addfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond_internal : STD_LOGIC;
signal addfpsclr_internal : STD_LOGIC;
signal addfpce_internal : STD_LOGIC;
signal addfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy_internal : STD_LOGIC;

signal subfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond_internal : STD_LOGIC;
signal subfpsclr_internal : STD_LOGIC;
signal subfpce_internal : STD_LOGIC;
signal subfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy_internal : STD_LOGIC;

begin

fixed2floata <= CalculateKGain_fixed2floata when CalculateKGain_mux = '1' else fixed2floata_internal;
fixed2floatond <= CalculateKGain_fixed2floatond when CalculateKGain_mux = '1' else fixed2floatond_internal;
fixed2floatce <= CalculateKGain_fixed2floatce when CalculateKGain_mux = '1' else fixed2floatce_internal;
fixed2floatsclr <= CalculateKGain_fixed2floatsclr when CalculateKGain_mux = '1' else fixed2floatsclr_internal;
CalculateKGain_fixed2floatr <= fixed2floatr when CalculateKGain_mux = '1' else (others => '0');
CalculateKGain_fixed2floatrdy <= fixed2floatrdy when CalculateKGain_mux = '1' else '0';
fixed2floatr_internal <= fixed2floatr;
fixed2floatrdy_internal <= fixed2floatrdy;

divfpa <= CalculateKGain_divfpa when CalculateKGain_mux = '1' else divfpa_internal;
divfpb <= CalculateKGain_divfpb when CalculateKGain_mux = '1' else divfpb_internal;
divfpond <= CalculateKGain_divfpond when CalculateKGain_mux = '1' else divfpond_internal;
divfpsclr <= CalculateKGain_divfpsclr when CalculateKGain_mux = '1' else divfpsclr_internal;
divfpce <= CalculateKGain_divfpce when CalculateKGain_mux = '1' else divfpce_internal;
CalculateKGain_divfpr <= divfpr when CalculateKGain_mux = '1' else (others => '0');
CalculateKGain_divfprdy <= divfprdy when CalculateKGain_mux = '1' else '0';
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

mulfpa <= mulfpa_internal;
mulfpb <= mulfpb_internal;
mulfpond <= mulfpond_internal;
mulfpce <= mulfpce_internal;
mulfpsclr <= mulfpsclr_internal;
mulfpr_internal <= mulfpr;
mulfprdy_internal <= mulfprdy;

addfpa <= addfpa_internal;
addfpb <= addfpb_internal;
addfpond <= addfpond_internal;
addfpce <= addfpce_internal;
addfpsclr <= addfpsclr_internal;
addfpr_internal <= addfpr;
addfprdy_internal <= addfprdy;

subfpa <= subfpa_internal;
subfpb <= subfpb_internal;
subfpond <= subfpond_internal;
subfpce <= subfpce_internal;
subfpsclr <= subfpsclr_internal;
subfpr_internal <= subfpr;
subfprdy_internal <= subfprdy;

i2c_mem_ena <=
CalculateKGain_i2c_mem_ena when CalculateKGain_mux = '1'
else i2c_mem_ena_internal;

i2c_mem_addra <=
CalculateKGain_i2c_mem_addra when CalculateKGain_mux = '1'
else i2c_mem_addra_internal;

CalculateKGain_i2c_mem_douta <= i2c_mem_douta when CalculateKGain_mux = '1' else (others => '0');
i2c_mem_douta_internal <= i2c_mem_douta;

o_rdy <= rdy;

p0 : process (i_clock) is
--	variable eeprom16slv,ram16slv : slv16;
--	variable eeprom16sf,ram16sf : sfixed16;
--	variable eeprom16uf,ram16uf : ufixed16;
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	type states is (idle,s0,s0a,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s21a,s22,s23,s24,s25,s26,s27,s28,s29,s30,
	s31,s32,s33,s34,s35,s36,s37,s38,s39,s40,
	s41,s42,s43,s44,s45,s46,s47,s48,s49,s50,
	s51,s52,s53,s54,s55,s56,s57,s58,s59,s60,
	s61,s62,s63,s64,s65,s66,s67,s68,s69,s70,
	s71,s72,s73,s74,s75,s76,s77,s78,s79,s80,
	s81,s82,s83,s84,s85,s86,s87,s88,s89,s90,
	s91,
	ending);
	variable state : states;
	variable fttmp1,fttmp2,ram0708_ft,ram0728_ft,pixoscpsp0_ft,pixoscpsp1_ft,pixgaincpsp0_ft,pixgaincpsp1_ft,offcpsubpage0_ft,offcpsubpage1delta_ft,offcpsubpage1_ft,kvcpee_ft,ktacpee_ft,kvcp_ft,ktacp_ft : std_logic_vector (31 downto 0);
	variable ram0708,ram0728 : std_logic_vector (15 downto 0);
	variable offcpsubpage0 : std_logic_vector (15 downto 0);
--	variable ram0708_fd,ram0728_fd : st_sfixed_max;
--	variable fracas : fracas;
--	variable fracbs : fracbs;
--	variable fracau : fracau;
--	variable fracbu : fracbu;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			addfpsclr_internal <= '1';
			subfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			divfpsclr_internal <= '1';
			fixed2floatsclr_internal <= '1';
			rdy <= '0';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			subfpa_internal <= (others => '0');
			subfpb_internal <= (others => '0');
			divfpa_internal <= (others => '0');
			divfpb_internal <= (others => '0');
			mulfpond_internal <= '0';
			addfpond_internal <= '0';
			subfpond_internal <= '0';
			divfpond_internal <= '0';
			mulfpce_internal <= '0';
			addfpce_internal <= '0';
			subfpce_internal <= '0';
			divfpce_internal <= '0';
			i2c_mem_ena_internal <= '0';
			i2c_mem_addra_internal <= (others => '0');
			o_pixoscpsp0 <= (others => '0');
			o_pixoscpsp1 <= (others => '0');
			fixed2floata_internal <= (others => '0');
			fixed2floatond_internal <= '0';
			fixed2floatce_internal <= '0';
			mem_signed1024_ivalue <= (others => '0');
			mem_signed256_ivalue <= (others => '0');
			nibble1 <= (others => '0');
			nibble2 <= (others => '0');
			nibble3 <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s0;
						i2c_mem_ena_internal <= '1';
					else
						state := idle;
						i2c_mem_ena_internal <= '0';
					end if;
					i := 0;
					addfpsclr_internal <= '0';
					subfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
					fixed2floatsclr_internal <= '0';
					
				when s0 => state := s0a;
					CalculateKGain_run <= '1';
					CalculateKGain_mux <= '1';
				when s0a => 
					CalculateKGain_run <= '0';
					if (CalculateKGain_rdy = '1') then
						state := s1;
						CalculateKGain_mux <= '0';
					else
						state := s0a;
						CalculateKGain_mux <= '1';
					end if;

					
					
				when s1 => state := s2;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(776*2)+0, 12)); -- ram0708 - pixgain_cp_sp0
				when s2 => state := s3;
				when s3 => state := s4;
					ram0708 (15 downto 8) := i2c_mem_douta_internal;
				when s4 => state := s5;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(776*2)+1, 12)); -- ram0708 - pixgain_cp_sp0
				when s5 => state := s6;
				when s6 => state := s7;
					ram0708 (7 downto 0) := i2c_mem_douta_internal;

				when s7 => state := s8;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(808*2)+0, 12)); -- ram0728 - pixgain_cp_sp1
				when s8 => state := s9;
				when s9 => state := s10;
					ram0728 (15 downto 8) := i2c_mem_douta_internal;
				when s10 => state := s11;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(808*2)+1, 12)); -- ram0728 - pixgain_cp_sp1
				when s11 => state := s12;
				when s12 => state := s13;
					ram0728 (7 downto 0) := i2c_mem_douta_internal;

				when s13 => state := s14;
--					ram0708_fd := resize (to_sfixed (ram0708, eeprom16sf), ram0708_fd);
--					fixed2floatce_internal <= '1';
--					fixed2floatond_internal <= '1';
--					fixed2floata_internal <= 
--					to_slv (to_sfixed (to_slv (ram0708_fd (fracas'high downto fracas'low)), fracas)) & 
--					to_slv (to_sfixed (to_slv (ram0708_fd (fracbs'high downto fracbs'low)), fracbs));
fixed2floatce_internal <= '1';
fixed2floatond_internal <= '1';
fixed2floata_internal <=
ram0708 (15) & ram0708 (15) & 
ram0708 (15) & ram0708 (15) & 
ram0708 (15) & ram0708 (15) & 
ram0708 (15) & ram0708 (15) & 
ram0708 (15) & ram0708 (15) & 
ram0708 (15) & ram0708 (15) & 
ram0708 (15) & ram0708 (15) & 
ram0708 (15) & ram0708 (15) & 
ram0708 (15) & ram0708 (15) & 
ram0708 (15) & ram0708 & "00000000000000000000000000000";
				when s14 =>
					if (fixed2floatrdy_internal = '1') then state := s15;
						ram0708_ft := fixed2floatr_internal;
						fixed2floatce_internal <= '0';
						fixed2floatond_internal <= '0';
						fixed2floatsclr_internal <= '1';
					else state := s14; end if;
				when s15 => state := s16;
					fixed2floatsclr_internal <= '0';

				when s16 => state := s17;
--					ram0728_fd := resize (to_sfixed (ram0728, eeprom16sf), ram0728_fd);
--					fixed2floatce_internal <= '1';
--					fixed2floatond_internal <= '1';
--					fixed2floata_internal <= 
--					to_slv (to_sfixed (to_slv (ram0728_fd (fracas'high downto fracas'low)), fracas)) & 
--					to_slv (to_sfixed (to_slv (ram0728_fd (fracbs'high downto fracbs'low)), fracbs));
fixed2floatce_internal <= '1';
fixed2floatond_internal <= '1';
fixed2floata_internal <=
ram0728 (15) & ram0728 (15) & 
ram0728 (15) & ram0728 (15) & 
ram0728 (15) & ram0728 (15) & 
ram0728 (15) & ram0728 (15) & 
ram0728 (15) & ram0728 (15) & 
ram0728 (15) & ram0728 (15) & 
ram0728 (15) & ram0728 (15) & 
ram0728 (15) & ram0728 (15) & 
ram0728 (15) & ram0728 (15) & 
ram0728 (15) & ram0728 & "00000000000000000000000000000";
				when s17 =>
					if (fixed2floatrdy_internal = '1') then state := s18;
						ram0728_ft := fixed2floatr_internal;
						fixed2floatce_internal <= '0';
						fixed2floatond_internal <= '0';
						fixed2floatsclr_internal <= '1';
					else state := s17; end if;
				when s18 => state := s19;
					fixed2floatsclr_internal <= '0';

				when s19 => state := s20;
					mulfpce_internal <= '1';
					mulfpa_internal <= ram0708_ft;
					mulfpb_internal <= calculateKGain_KGain;
					mulfpond_internal <= '1';
				--	report ": " & real'image (ap_slv2fp (mulfpa));
				--	report ": " & real'image (ap_slv2fp (mulfpb));
				when s20 =>
					if (mulfprdy_internal = '1') then state := s21;
						pixgaincpsp0_ft := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s20; end if;
				when s21 => state := s21a;
					mulfpsclr_internal <= '0';

				when s21a => state := s22;
					mulfpce_internal <= '1';
					mulfpa_internal <= ram0728_ft;
					mulfpb_internal <= calculateKGain_KGain;
					mulfpond_internal <= '1';
				--	report ": " & real'image (ap_slv2fp (mulfpa));
				--	report ": " & real'image (ap_slv2fp (mulfpb));
				when s22 =>
					if (mulfprdy_internal = '1') then state := s23;
						pixgaincpsp1_ft := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s22; end if;
				when s23 => state := s24;
					mulfpsclr_internal <= '0';


				when s24 => state := s25;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (58*2+0, 12)); -- ee243a - offcpsubpage0
				when s25 => state := s26;
				when s26 => state := s27;
					offcpsubpage0 (15 downto 8) := i2c_mem_douta_internal;
				when s27 => state := s28;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (58*2+1, 12)); -- ee243a - offcpsubpage0
				when s28 => state := s29;
				when s29 => state := s30;
					offcpsubpage0 (7 downto 0) := i2c_mem_douta_internal;


				when s30 => state := s31;
					mem_signed1024_ivalue <= offcpsubpage0 (9 downto 0); -- ee243a 0x03ff
					nibble1 <= offcpsubpage0 (15 downto 10); -- ee243a 0xfc00
				when s31 => state := s32;
				when s32 => state := s33;
					offcpsubpage0_ft := mem_signed1024_ovalue; -- offcpsubpage0
					report "================ CalculatePixOsCPSP offcpsubpage0 : " & real'image (ap_slv2fp (offcpsubpage0_ft));
					offcpsubpage1delta_ft := out_nibble1;
					addfpce_internal <= '1';
					addfpa_internal <= offcpsubpage0_ft;
					addfpb_internal <= offcpsubpage1delta_ft;
					addfpond_internal <= '1';
				when s33 =>
					if (addfprdy_internal = '1') then state := s34;
						offcpsubpage1_ft := addfpr_internal; -- offcpsubpage1
						report "================ CalculatePixOsCPSP offcpsubpage1 : " & real'image (ap_slv2fp (offcpsubpage1_ft));
						addfpce_internal <= '0';
						addfpond_internal <= '0';
						addfpsclr_internal <= '1';
					else state := s33; end if;
				when s34 => state := s35;
					addfpsclr_internal <= '0';



				when s35 => state := s36;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (56*2+0, 12)); -- ee2438 MSB - kvscale
				when s36 => state := s37;
				when s37 => state := s38;
					nibble3 <= i2c_mem_douta_internal (3 downto 0); -- ee2438 0f00


				when s38 => state := s39;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (56*2+1, 12)); -- ee2438 LSB - ktascale1
				when s39 => state := s40;
				when s40 => state := s41;
					nibble2 <= i2c_mem_douta_internal (7 downto 4); -- ee2438 00f0


				when s41 => state := s42;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
				when s42 => state := s43;
				when s43 => state := s44;
					mem_signed256_ivalue <= i2c_mem_douta_internal;
				when s44 => state := s45;
				when s45 => state := s46;
					kvcpee_ft := mem_signed256_ovalue;
				
				
				when s46 => state := s47;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
				when s47 => state := s48;
				when s48 => state := s49;
					mem_signed256_ivalue <= i2c_mem_douta_internal;
				when s49 => state := s50;
				when s50 => state := s51;
					ktacpee_ft := mem_signed256_ovalue;

				when s51 => state := s52;
					divfpce_internal <= '1';
					divfpa_internal <= ktacpee_ft; -- ktacpee
					divfpb_internal <= out_nibble2; -- 2^(ktascale1+8);
					divfpond_internal <= '1';
				when s52 =>
					if (divfprdy_internal = '1') then state := s53;
						ktacp_ft := divfpr_internal;
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s52; end if;
				when s53 => state := s54;
					divfpsclr_internal <= '0';
					report "================ CalculatePixOsCPSP ktacp : " & real'image (ap_slv2fp (ktacp_ft));


				when s54 => state := s55;
					divfpce_internal <= '1';
					divfpa_internal <= kvcpee_ft; -- kvcpee
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
				when s55 =>
					if (divfprdy_internal = '1') then state := s56;
						kvcp_ft := divfpr_internal;
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s55; end if;
				when s56 => state := s57;
					divfpsclr_internal <= '0';
					report "================ CalculatePixOsCPSP kvcp : " & real'image (ap_slv2fp (kvcp_ft));

					subfpce_internal <= '1';
					subfpa_internal <= i_Vdd;
					subfpb_internal <= i_VddV0;
					subfpond_internal <= '1';
				when s57 =>
					if (subfprdy_internal = '1') then state := s58;
						fttmp1 := subfpr_internal;
						subfpce_internal <= '0';
						subfpond_internal <= '0';
						subfpsclr_internal <= '1';
					else state := s57; end if;
				when s58 => state := s59;
					subfpsclr_internal <= '0';


				when s59 => state := s60;
					subfpce_internal <= '1';
					subfpa_internal <= i_Ta;
					subfpb_internal <= i_Ta0;
					subfpond_internal <= '1';
				when s60 =>
					if (subfprdy_internal = '1') then state := s61;
						fttmp2 := subfpr_internal;
						subfpce_internal <= '0';
						subfpond_internal <= '0';
						subfpsclr_internal <= '1';
					else state := s60; end if;
				when s61 => state := s62;
					subfpsclr_internal <= '0';


				when s62 => state := s63;
					mulfpce_internal <= '1';
					mulfpa_internal <= fttmp1;
					mulfpb_internal <= kvcp_ft;
					mulfpond_internal <= '1';
				when s63 =>
					if (mulfprdy_internal = '1') then state := s64;
						fttmp1 := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s63; end if;
				when s64 => state := s65;
					mulfpsclr_internal <= '0';


				when s65 => state := s66;
					addfpce_internal <= '1';
					addfpa_internal <= fttmp1;
					addfpb_internal <= i_const1;
					addfpond_internal <= '1';
				when s66 =>
					if (addfprdy_internal = '1') then state := s67;
						fttmp1 := addfpr_internal;
						addfpce_internal <= '0';
						addfpond_internal <= '0';
						addfpsclr_internal <= '1';
					else state := s66; end if;
				when s67 => state := s68;
					addfpsclr_internal <= '0';


				when s68 => state := s69;
					mulfpce_internal <= '1';
					mulfpa_internal <= fttmp2;
					mulfpb_internal <= ktacp_ft;
					mulfpond_internal <= '1';
				when s69 =>
					if (mulfprdy_internal = '1') then state := s70;
						fttmp2 := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s69; end if;
				when s70 => state := s71;
					mulfpsclr_internal <= '0';


				when s71 => state := s72;
					addfpce_internal <= '1';
					addfpa_internal <= fttmp2;
					addfpb_internal <= i_const1;
					addfpond_internal <= '1';
				when s72 =>
					if (addfprdy_internal = '1') then state := s73;
						fttmp2 := addfpr_internal;
						addfpce_internal <= '0';
						addfpond_internal <= '0';
						addfpsclr_internal <= '1';
					else state := s72; end if;
				when s73 => state := s74;
					addfpsclr_internal <= '0';


				when s74 => state := s75;
					mulfpce_internal <= '1';
					mulfpa_internal <= fttmp1;
					mulfpb_internal <= fttmp2;
					mulfpond_internal <= '1';
				when s75 =>
					if (mulfprdy_internal = '1') then state := s76;
						pixoscpsp0_ft := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s75; end if;
				when s76 => state := s77;
					mulfpsclr_internal <= '0';


				when s77 => state := s78;
					mulfpce_internal <= '1';
					mulfpa_internal <= pixoscpsp0_ft;
					mulfpb_internal <= offcpsubpage0_ft;
					mulfpond_internal <= '1';
				when s78 =>
					if (mulfprdy_internal = '1') then state := s79;
						pixoscpsp0_ft := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s78; end if;
				when s79 => state := s80;
					mulfpsclr_internal <= '0';


				when s80 => state := s81;
					subfpce_internal <= '1';
					subfpa_internal <= pixgaincpsp0_ft;
					subfpb_internal <= pixoscpsp0_ft;
					subfpond_internal <= '1';
				when s81 =>
					if (subfprdy_internal = '1') then state := s82;
						o_pixoscpsp0 <= subfpr_internal;
						subfpce_internal <= '0';
						subfpond_internal <= '0';
						subfpsclr_internal <= '1';
						report "================ CalculatePixOsCPSP o_pixoscpsp0 : " & real'image (ap_slv2fp (subfpr));
					else state := s81; end if;
				when s82 => state := s83;
					subfpsclr_internal <= '0';


				when s83 => state := s84;
					mulfpce_internal <= '1';
					mulfpa_internal <= fttmp1;
					mulfpb_internal <= fttmp2;
					mulfpond_internal <= '1';
				when s84 =>
					if (mulfprdy_internal = '1') then state := s85;
						pixoscpsp1_ft := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s84; end if;
				when s85 => state := s86;
					mulfpsclr_internal <= '0';


				when s86 => state := s87;
					mulfpce_internal <= '1';
					mulfpa_internal <= pixoscpsp1_ft;
					mulfpb_internal <= offcpsubpage1_ft;
					mulfpond_internal <= '1';
				when s87 =>
					if (mulfprdy_internal = '1') then state := s88;
						pixoscpsp1_ft := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s87; end if;
				when s88 => state := s89;
					mulfpsclr_internal <= '0';


				when s89 => state := s90;
					subfpce_internal <= '1';
					subfpa_internal <= pixgaincpsp1_ft;
					subfpb_internal <= pixoscpsp1_ft;
					subfpond_internal <= '1';
				when s90 =>
					if (subfprdy_internal = '1') then state := s91;
						o_pixoscpsp1 <= subfpr_internal;
						report "================ CalculatePixOsCPSP o_pixoscpsp1 : " & real'image (ap_slv2fp (subfpr));
						subfpce_internal <= '0';
						subfpond_internal <= '0';
						subfpsclr_internal <= '1';
					else state := s90; end if;
				when s91 => state := ending;
					subfpsclr_internal <= '0';
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

calculateKGain_clock <= i_clock;
calculateKGain_reset <= i_reset;
inst_calculateKGain : calculateKGain port map (
i_clock => calculateKGain_clock,
i_reset => calculateKGain_reset,
i_run => calculateKGain_run,
i2c_mem_ena => calculateKGain_i2c_mem_ena,
i2c_mem_addra => calculateKGain_i2c_mem_addra,
i2c_mem_douta => calculateKGain_i2c_mem_douta,
o_KGain => calculateKGain_KGain,
o_rdy => calculateKGain_rdy,

fixed2floata => calculateKGain_fixed2floata,
fixed2floatond => calculateKGain_fixed2floatond,
fixed2floatsclr => calculateKGain_fixed2floatsclr,
fixed2floatce => calculateKGain_fixed2floatce,
fixed2floatr => calculateKGain_fixed2floatr,
fixed2floatrdy => calculateKGain_fixed2floatrdy,

divfpa => calculateKGain_divfpa,
divfpb => calculateKGain_divfpb,
divfpond => calculateKGain_divfpond,
divfpsclr => calculateKGain_divfpsclr,
divfpce => calculateKGain_divfpce,
divfpr => calculateKGain_divfpr,
divfprdy => calculateKGain_divfprdy
);

end Behavioral;

