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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee_proposed.fixed_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--use work.p_fphdl_package1.all;
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
o_KGain : out std_logic_vector (31 downto 0);
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
signal calculateKGain_KGain : std_logic_vector (31 downto 0);
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
	type states is (idle,s0,s0a,
	s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,
  s14,s15,s15a,s16,s17,s20,
	s23,
	s33,s52,s53,s55,s57,s58,s60,
	s63,s66,s69,
	s72,s75,s76,s78,
	s81,s84,s85,s87,s90);
  variable state : states;
	variable fttmp1,pixgaincpsp0_ft,pixgaincpsp1_ft,offcpsubpage1_ft,kvcpee_ft,ktacpee_ft,kvcp_ft,ktacp_ft : std_logic_vector (31 downto 0);
	variable ram0708,ram0728 : std_logic_vector (15 downto 0);
	variable offcpsubpage0 : std_logic_vector (15 downto 0);
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
						state := s2;
						CalculateKGain_mux <= '0';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(776*2)+0, 12)); -- ram0708 - pixgain_cp_sp0
					else
						state := s0a;
						CalculateKGain_mux <= '1';
					end if;
				when s2 => state := s3;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(776*2)+1, 12)); -- ram0708 - pixgain_cp_sp0
				when s3 => state := s4;
					ram0708 (15 downto 8) := i2c_mem_douta_internal;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(808*2)+0, 12)); -- ram0728 - pixgain_cp_sp1
				when s4 => state := s5;
					ram0708 (7 downto 0) := i2c_mem_douta_internal;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(808*2)+1, 12)); -- ram0728 - pixgain_cp_sp1
				when s5 => state := s6;
					ram0728 (15 downto 8) := i2c_mem_douta_internal;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (58*2+0, 12)); -- ee243a - offcpsubpage0
				when s6 => state := s7;
          ram0728 (7 downto 0) := i2c_mem_douta_internal;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (58*2+1, 12)); -- ee243a - offcpsubpage0
        when s7 => state := s8;
          offcpsubpage0 (15 downto 8) := i2c_mem_douta_internal;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (56*2+0, 12)); -- ee2438 MSB - kvscale
				when s8 => state := s9;
          offcpsubpage0 (7 downto 0) := i2c_mem_douta_internal;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (56*2+1, 12)); -- ee2438 LSB - ktascale1
				when s9 => state := s10;
					nibble3 <= i2c_mem_douta_internal (3 downto 0); -- ee2438 0f00
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
				when s10 => state := s11;
					nibble2 <= i2c_mem_douta_internal (7 downto 4); -- ee2438 00f0
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
				when s11 => state := s12;
					mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcpee
          i2c_mem_ena_internal <= '0';
				when s12 => state := s13;
					mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacpee
				when s13 => state := s14;
					kvcpee_ft := mem_signed256_ovalue;
          report_error ("kvcpee", kvcpee_ft, 0.0);
				when s14 => state := s15;
					ktacpee_ft := mem_signed256_ovalue;
          report_error ("ktacpee", ktacpee_ft, 0.0);
				when s15 =>
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
					if (fixed2floatrdy_internal = '1') then state := s15a;
            --synthesis translate_off
            report_error ("ram0708", fixed2floatr_internal, 0.0);
						--synthesis translate_on
            fixed2floatce_internal <= '0';
						fixed2floatond_internal <= '0';
						fixed2floatsclr_internal <= '1';
					else state := s15; end if;
        when s15a =>
					fixed2floatsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= fixed2floatr_internal;
					mulfpb_internal <= calculateKGain_KGain;
					mulfpond_internal <= '1';
					if (mulfprdy_internal = '1') then state := s16;
						pixgaincpsp0_ft := mulfpr_internal;
            --synthesis translate_off
            report_error ("pixgaincpsp0", pixgaincpsp0_ft, 0.0);
            --synthesis translate_on
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s15a; end if;
				when s16 => state := s17;
					mulfpsclr_internal <= '0';
					fixed2floatsclr_internal <= '0';
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
          if (fixed2floatrdy_internal = '1') then state := s20;
            --synthesis translate_off
						report_error ("ram0728", fixed2floatr_internal, 0.0);
            --synthesis translate_on
            fixed2floatce_internal <= '0';
						fixed2floatond_internal <= '0';
						fixed2floatsclr_internal <= '1';
					else state := s17; end if;
				when s20 =>
					fixed2floatsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= fixed2floatr_internal;
					mulfpb_internal <= calculateKGain_KGain;
					mulfpond_internal <= '1';
					if (mulfprdy_internal = '1') then state := s23;
						pixgaincpsp1_ft := mulfpr_internal;
            --synthesis translate_off
            report_error ("pixgaincpsp1", pixgaincpsp1_ft, 0.0);
						--synthesis translate_on
            mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s20; end if;
				when s23 => state := s33;
					mulfpsclr_internal <= '0';
          mem_signed1024_ivalue <= offcpsubpage0 (9 downto 0); -- ee243a 0x03ff
					nibble1 <= offcpsubpage0 (15 downto 10); -- ee243a 0xfc00
				when s33 =>
					addfpce_internal <= '1';
					addfpa_internal <= mem_signed1024_ovalue; -- offcpsubpage0
					addfpb_internal <= out_nibble1; -- offcpsubpage1delta
					addfpond_internal <= '1';
					if (addfprdy_internal = '1') then state := s52;
						offcpsubpage1_ft := addfpr_internal; -- offcpsubpage1
            --synthesis translate_off
            report_error ("offcpsubpage0", mem_signed1024_ovalue, 0.0);
            report_error ("offcpsubpage1delta", out_nibble1, 0.0);
            report_error ("offcpsubpage1", offcpsubpage1_ft, 0.0);
						--synthesis translate_on
            addfpce_internal <= '0';
						addfpond_internal <= '0';
						addfpsclr_internal <= '1';
					else state := s33; end if;
				when s52 =>
					addfpsclr_internal <= '0';
          divfpce_internal <= '1';
					divfpa_internal <= ktacpee_ft; -- ktacpee
					divfpb_internal <= out_nibble2; -- 2^(ktascale1+8);
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s53;
						ktacp_ft := divfpr_internal;
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
            report_error("================ CalculatePixOsCPSP ktacp", ktacp_ft, 0.0);
					else state := s52; end if;
				when s53 => state := s55;
					divfpsclr_internal <= '0';
				when s55 =>
					divfpce_internal <= '1';
					divfpa_internal <= kvcpee_ft; -- kvcpee
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s57;
						kvcp_ft := divfpr_internal;
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s55; end if;
				when s57 =>
					divfpsclr_internal <= '0';
					report_error("================ CalculatePixOsCPSP kvcp", kvcp_ft, 0.0);
					subfpce_internal <= '1';
					subfpa_internal <= i_Vdd;
					subfpb_internal <= i_VddV0;
					subfpond_internal <= '1';
					if (subfprdy_internal = '1') then state := s58;
						fttmp1 := subfpr_internal;
						subfpce_internal <= '0';
						subfpond_internal <= '0';
						subfpsclr_internal <= '1';
					else state := s57; end if;
				when s58 => state := s60;
					subfpsclr_internal <= '0';
				when s60 =>
					subfpce_internal <= '1';
					subfpa_internal <= i_Ta;
					subfpb_internal <= i_Ta0;
					subfpond_internal <= '1';
					if (subfprdy_internal = '1') then state := s63;
						subfpce_internal <= '0';
						subfpond_internal <= '0';
						subfpsclr_internal <= '1';
					else state := s60; end if;
				when s63 =>
					subfpsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= fttmp1;
					mulfpb_internal <= kvcp_ft;
					mulfpond_internal <= '1';
					if (mulfprdy_internal = '1') then state := s66;
						fttmp1 := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s63; end if;
				when s66 =>
					mulfpsclr_internal <= '0';
					addfpce_internal <= '1';
					addfpa_internal <= fttmp1;
					addfpb_internal <= i_const1;
					addfpond_internal <= '1';
					if (addfprdy_internal = '1') then state := s69;
						fttmp1 := addfpr_internal;
						addfpce_internal <= '0';
						addfpond_internal <= '0';
						addfpsclr_internal <= '1';
					else state := s66; end if;
				when s69 =>
					addfpsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= subfpr_internal; -- XXX Ta-Ta0
					mulfpb_internal <= ktacp_ft;
					mulfpond_internal <= '1';
					if (mulfprdy_internal = '1') then state := s72;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s69; end if;
				when s72 =>
					mulfpsclr_internal <= '0';
					addfpce_internal <= '1';
					addfpa_internal <= mulfpr_internal;
					addfpb_internal <= i_const1;
					addfpond_internal <= '1';
					if (addfprdy_internal = '1') then state := s75;
						addfpce_internal <= '0';
						addfpond_internal <= '0';
						addfpsclr_internal <= '1';
					else state := s72; end if;
				when s75 =>
					addfpsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= fttmp1;
					mulfpb_internal <= addfpr_internal;
					mulfpond_internal <= '1';
					if (mulfprdy_internal = '1') then state := s76;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s75; end if;
				when s76 => state := s78;
					mulfpsclr_internal <= '0';
				when s78 =>
					mulfpce_internal <= '1';
					mulfpa_internal <= mulfpr_internal;
					mulfpb_internal <= mem_signed1024_ovalue;
					mulfpond_internal <= '1';
					if (mulfprdy_internal = '1') then state := s81;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s78; end if;
				when s81 =>
					mulfpsclr_internal <= '0';
					subfpce_internal <= '1';
					subfpa_internal <= pixgaincpsp0_ft;
					subfpb_internal <= mulfpr_internal;
					subfpond_internal <= '1';
					if (subfprdy_internal = '1') then state := s84;
						o_pixoscpsp0 <= subfpr_internal;
						subfpce_internal <= '0';
						subfpond_internal <= '0';
						subfpsclr_internal <= '1';
            --synthesis translate_off
						report_error("================ CalculatePixOsCPSP o_pixoscpsp0", subfpr, 0.0);
            --synthesis translate_on
					else state := s81; end if;
				when s84 =>
					subfpsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= fttmp1;
					mulfpb_internal <= addfpr_internal;
					mulfpond_internal <= '1';
					if (mulfprdy_internal = '1') then state := s85;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s84; end if;
				when s85 => state := s87;
					mulfpsclr_internal <= '0';
				when s87 =>
					mulfpce_internal <= '1';
					mulfpa_internal <= mulfpr_internal;
					mulfpb_internal <= offcpsubpage1_ft;
					mulfpond_internal <= '1';
					if (mulfprdy_internal = '1') then state := s90;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s87; end if;
				when s90 =>
					mulfpsclr_internal <= '0';
					subfpce_internal <= '1';
					subfpa_internal <= pixgaincpsp1_ft; -- XXX s20
					subfpb_internal <= mulfpr_internal; -- XXX s87
					subfpond_internal <= '1';
					if (subfprdy_internal = '1') then state := idle;
            rdy <= '1';
						o_pixoscpsp1 <= subfpr_internal;
            --synthesis translate_off
						report_error("================ CalculatePixOsCPSP o_pixoscpsp1", subfpr_internal, 0.0);
            --synthesis translate_on
						subfpce_internal <= '0';
						subfpond_internal <= '0';
						subfpsclr_internal <= '1';
					else state := s90; end if;
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
