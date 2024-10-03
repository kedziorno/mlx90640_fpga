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
-- Revision 0.02 - Rewrite Calculation, without regs
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
	type states is (idle,s0,s1,s1b,s1c,s1d,
	s2,s3a,s4,s6,s7,s8,s9,s10,
	s12,s13,s14,s16,s17,s18,s19,s20,
	s21,s22,s24,s25,s26,s27,s28,s29,s30,
	s31,s32,s34,s35,s36,s37,s38,s40,
	s41,s42,s43,s44,s45,s46,s47,s48,s50,
	s51,s52,s53,s54,s55,s56,s58,s59,
	s61,s63,s64,s64a,s64b,s65,s67,
	s71,
	d3a,d4,d6,d7,d8,d9,d10,
	d12,d13,d14,d16,d17,d18,d19,d20,
	d21,d22,d24,d25,d26,d27,d28,d29,d30,
	d31,d32,d34,d35,d36,d37,d38,d40,
	d41,d42,d43,d44,d45,d46,d47,d48,d50,
	d51,d52,d53,d54,d55,d56,d58,d59,d59a,
	d62a,d63,d64,d64a,d64b,d65,d67,
	d71);
  variable state : states;
	variable ram : std_logic_vector (7 downto 0);
  constant const_minus1 : std_logic_vector (31 downto 0) := x"bf800000";
  constant const_plus1 : std_logic_vector (31 downto 0) := x"3f800000";
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			addfpsclr_internal <= '1';
			subfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			divfpsclr_internal <= '1';
			fixed2floatsclr_internal <= '1';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			subfpa_internal <= (others => '0');
			subfpb_internal <= (others => '0');
			divfpa_internal <= (others => '0');
			divfpb_internal <= (others => '0');
			fixed2floata_internal <= (others => '0');
			mulfpond_internal <= '0';
			addfpond_internal <= '0';
			subfpond_internal <= '0';
			divfpond_internal <= '0';
			fixed2floatond_internal <= '0';
			mulfpce_internal <= '0';
			addfpce_internal <= '0';
			subfpce_internal <= '0';
			divfpce_internal <= '0';
			fixed2floatce_internal <= '0';
			mem_signed1024_ivalue <= (others => '0');
			mem_signed256_ivalue <= (others => '0');
			nibble1 <= (others => '0');
			nibble2 <= (others => '0');
			nibble3 <= (others => '0');
			i2c_mem_ena_internal <= '0';
			i2c_mem_addra_internal <= (others => '0');
			o_pixoscpsp0 <= (others => '0');
			o_pixoscpsp1 <= (others => '0');
			rdy <= '0';
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
				when s0 => state := s1;
					CalculateKGain_run <= '1';
					CalculateKGain_mux <= '1';
				when s1 => 
					CalculateKGain_run <= '0';
					if (CalculateKGain_rdy = '1') then
						state := s1b;
						CalculateKGain_mux <= '0';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (56*2+1, 12)); -- ee2438 LSB - ktascale1
					else
						state := s1;
						CalculateKGain_mux <= '1';
					end if;
        when s1b => state := s1c;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (56*2+0, 12)); -- ee2438 MSB - kvscale
        when s1c => state := s1d;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          nibble2 <= i2c_mem_douta_internal (7 downto 4); -- ee2438 00f0 - ktascale1
        when s1d => state := s2;
          nibble3 <= i2c_mem_douta_internal (3 downto 0); -- ee2438 0f00 - kvscale
        when s2 => state := s3a;
          mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
        when s3a =>
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcpee
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s4;
            --report "kvcp 1 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s3a; end if;
        when s4 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- kvcp
          mulfpb_internal <= i_Vdd;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s6;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s4; end if;
        when s6 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= mulfpr_internal;
          addfpb_internal <= const_plus1;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (addfprdy_internal = '1') then state := s7;
            --warning_neq_fp(addfpr_internal,3.4721875,"1+kvcp*vdd"); -- XXX OK
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := s6; end if;
        when s7 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcp
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s8;
            --report "kvcp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s7; end if;
        when s8 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- kvcp
          mulfpb_internal <= i_VddV0;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s9;
            --warning_neq_fp(mulfpr_internal,1.2375000,"kvcp*vdd0"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s8; end if;
        when s9 => state := s10;
          mulfpsclr_internal <= '0';
        when s10 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= const_minus1;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s12;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s10; end if;
        when s12 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := s13;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := s12; end if;
        when s13 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s14;
            --report "ktacp fgfhgfhgfhgfhf " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s13; end if;
        when s14 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s16;
            --warning_neq_fp(mulfpr_internal,0.145219065234699,"ktacp*ta  "); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s14; end if;
        when s16 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := s17;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := s16; end if;
        when s17 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s18;
            --report "ktacp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s17; end if;
        when s18 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta;
          mulfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (mulfprdy_internal = '1') then state := s19;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := s18; end if;
        when s19 =>
          mulfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcp
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s20;
            --report "kvcp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s19; end if;
        when s20 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= divfpr_internal; -- kvcp
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s21;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s20; end if;
        when s21 => state := s22;
          mulfpsclr_internal <= '0';
        when s22 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= i_Vdd;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s24;
            --warning_neq_fp(mulfpr_internal,0.35900875783490743406,"ktacp*ta*kvcp*vdd"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s22; end if;
        when s24 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := s25;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := s24; end if;
        when s25 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s26;
            --report "ktacp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s25; end if;
        when s26 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta;
          mulfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (mulfprdy_internal = '1') then state := s27;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := s26; end if;
        when s27 =>
          mulfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcp
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s28;
            --report "kvcp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s27; end if;
        when s28 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= divfpr_internal; -- kvcp
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s29;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s28; end if;
        when s29 => state := s30;
          mulfpsclr_internal <= '0';
        when s30 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= i_VddV0;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s31;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s30; end if;
        when s31 => state := s32;
          mulfpsclr_internal <= '0';
        when s32 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= const_minus1;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s34;
            --warning_neq_fp(mulfpr_internal,-0.17970859322794001250,"minus ktacp * ta * kvcp * vdd0"); -- XXX OK
            --warning_neq_fp(mulfpr_internal,-0.179708590,"-ktacp*ta*kvcp*vdd0"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s32; end if;
        when s34 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := s35;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := s34; end if;
        when s35 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s36;
            --report "ktacp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s35; end if;
        when s36 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta0;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s37;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s36; end if;
        when s37 => state := s38;
          mulfpsclr_internal <= '0';
        when s38 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= const_minus1;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s40;
            --warning_neq_fp(mulfpr_internal,-0.106811525,"-ktacp*ta0"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s38; end if;
        when s40 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := s41;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := s40; end if;
        when s41 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s42;
            --report "ktacp 1 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
            divfpsclr_internal <= '1';
					else state := s41; end if;
        when s42 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta0;
          mulfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (mulfprdy_internal = '1') then state := s43;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := s42; end if;
        when s43 =>
          mulfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcp
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s44;
            --report "kvcp 2 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s43; end if;
        when s44 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= divfpr_internal; -- kvcp
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s45;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s44; end if;
        when s45 => state := s46;
          mulfpsclr_internal <= '0';
        when s46 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= i_Vdd;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s47;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s46; end if;
        when s47 => state := s48;
          mulfpsclr_internal <= '0';
        when s48 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= const_minus1;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s50;
            --warning_neq_fp(mulfpr_internal,-0.26405811696093750000,"-ktacp*ta0*kvcp*vdd"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s48; end if;
        when s50 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := s51;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := s50; end if;
        when s51 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s52;
            --report "ktacp 1 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
            divfpsclr_internal <= '1';
					else state := s51; end if;
        when s52 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta0;
          mulfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (mulfprdy_internal = '1') then state := s53;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := s52; end if;
        when s53 =>
          mulfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcp
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s54;
            --report "kvcp 2 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s53; end if;
        when s54 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= divfpr_internal; -- kvcp
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s55;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s54; end if;
        when s55 => state := s56;
          mulfpsclr_internal <= '0';
        when s56 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= i_VddV0;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s58;
            --warning_neq_fp(mulfpr_internal,0.13217926218750000,"ktacp*ta0*kvcp*vdd0"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s56; end if;
        when s58 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (58*2+0, 12)); -- ee243a MSB - ram
          if (addfprdy_internal = '1') then state := s59;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            --warning_neq_fp(addfpr_internal,2.3205166,"calc end"); -- XXX OK
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (58*2+1, 12)); -- ee243a LSB - ram
          else state := s58; end if;
        when s59 => state := s61;
          addfpsclr_internal <= '0';
        when s61 => state := s63;
          ram (7 downto 0) := i2c_mem_douta_internal;
        when s63 =>
          mem_signed1024_ivalue <= i2c_mem_douta_internal (1 downto 0) & ram; -- ee243a 0x03ff - 10bit - ram
          mulfpce_internal <= '1';
          mulfpa_internal <= mem_signed1024_ovalue; -- ram
          mulfpb_internal <= addfpr_internal; -- (...)
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s64; -- -- --
            --warning_neq_fp(mem_signed1024_ovalue,0.0,"ram mem"); -- XXX OK
            --warning_neq_fp(mulfpr_internal,0.0,"ram"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s63; end if;
        when s64 => -- XXX empty state
          mulfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= mulfpr_internal;
          subfpb_internal <= x"00000000";
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := s64a;
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(776*2)+0, 12)); -- ram0708 - pixgain_cp_sp0
          else state := s64; end if;
        when s64a => state := s64b;
          subfpsclr_internal <= '0';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(776*2)+1, 12)); -- ram0708 - pixgain_cp_sp0
        when s64b => state := s65;
          ram (7 downto 0) := i2c_mem_douta_internal;
        when s65 =>
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <=
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram & i2c_mem_douta_internal & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s67;
            --warning_neq_fp(fixed2floatr_internal,0.0,"ram"); -- XXX OK  
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s65; end if;
        when s67 =>
          fixed2floatsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= fixed2floatr_internal;
          mulfpb_internal <= CalculateKGain_KGain;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s71;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s67; end if;
        when s71 =>
          mulfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= mulfpr_internal;
          subfpb_internal <= subfpr_internal;
          subfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (subfprdy_internal = '1') then state := d3a;
            --warning_neq_fp(subfpr_internal,0.0,"o_pixoscpsp0");
            o_pixoscpsp0 <= subfpr_internal;
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
          else state := s71; end if;
        when d3a =>
          subfpsclr_internal <= '0';
          mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcpee
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d4;
            --report "kvcp 1 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := d3a; end if;
        when d4 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- kvcp
          mulfpb_internal <= i_Vdd;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d6;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d4; end if;
        when d6 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= mulfpr_internal;
          addfpb_internal <= const_plus1;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (addfprdy_internal = '1') then state := d7;
            --warning_neq_fp(addfpr_internal,3.4721875,"1+kvcp*vdd"); -- XXX OK
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := d6; end if;
        when d7 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcp
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d8;
            --report "kvcp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := d7; end if;
        when d8 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- kvcp
          mulfpb_internal <= i_VddV0;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d9;
            --warning_neq_fp(mulfpr_internal,1.2375000,"kvcp*vdd0"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d8; end if;
        when d9 => state := d10;
          mulfpsclr_internal <= '0';
        when d10 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= const_minus1;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d12;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d10; end if;
        when d12 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := d13;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := d12; end if;
        when d13 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d14;
            --report "ktacp fgfhgfhgfhgfhf " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := d13; end if;
        when d14 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d16;
            --warning_neq_fp(mulfpr_internal,0.145219065234699,"ktacp*ta  "); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d14; end if;
        when d16 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := d17;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := d16; end if;
        when d17 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d18;
            --report "ktacp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := d17; end if;
        when d18 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta;
          mulfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (mulfprdy_internal = '1') then state := d19;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := d18; end if;
        when d19 =>
          mulfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcp
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d20;
            --report "kvcp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := d19; end if;
        when d20 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= divfpr_internal; -- kvcp
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d21;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d20; end if;
        when d21 => state := d22;
          mulfpsclr_internal <= '0';
        when d22 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= i_Vdd;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d24;
            --warning_neq_fp(mulfpr_internal,0.35900875783490743406,"ktacp*ta*kvcp*vdd"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d22; end if;
        when d24 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := d25;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := d24; end if;
        when d25 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d26;
            --report "ktacp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := d25; end if;
        when d26 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta;
          mulfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (mulfprdy_internal = '1') then state := d27;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := d26; end if;
        when d27 =>
          mulfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcp
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d28;
            --report "kvcp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := d27; end if;
        when d28 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= divfpr_internal; -- kvcp
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d29;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d28; end if;
        when d29 => state := d30;
          mulfpsclr_internal <= '0';
        when d30 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= i_VddV0;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d31;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d30; end if;
        when d31 => state := d32;
          mulfpsclr_internal <= '0';
        when d32 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= const_minus1;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d34;
            --warning_neq_fp(mulfpr_internal,-0.17970859322794001250,"minus ktacp * ta * kvcp * vdd0"); -- XXX OK
            --warning_neq_fp(mulfpr_internal,-0.179708590,"-ktacp*ta*kvcp*vdd0"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d32; end if;
        when d34 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := d35;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := d34; end if;
        when d35 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d36;
            --report "ktacp " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := d35; end if;
        when d36 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta0;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d37;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d36; end if;
        when d37 => state := d38;
          mulfpsclr_internal <= '0';
        when d38 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= const_minus1;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d40;
            --warning_neq_fp(mulfpr_internal,-0.106811525,"-ktacp*ta0"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d38; end if;
        when d40 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := d41;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := d40; end if;
        when d41 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d42;
            --report "ktacp 1 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
            divfpsclr_internal <= '1';
					else state := d41; end if;
        when d42 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta0;
          mulfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (mulfprdy_internal = '1') then state := d43;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := d42; end if;
        when d43 =>
          mulfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcp
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d44;
            --report "kvcp 2 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := d43; end if;
        when d44 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= divfpr_internal; -- kvcp
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d45;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d44; end if;
        when d45 => state := d46;
          mulfpsclr_internal <= '0';
        when d46 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= i_Vdd;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d47;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d46; end if;
        when d47 => state := d48;
          mulfpsclr_internal <= '0';
        when d48 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= const_minus1;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d50;
            --warning_neq_fp(mulfpr_internal,-0.26405811696093750000,"-ktacp*ta0*kvcp*vdd"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d48; end if;
        when d50 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          if (addfprdy_internal = '1') then state := d51;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := d50; end if;
        when d51 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- ktacp
					divfpb_internal <= out_nibble2; -- 2^ktascale1;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d52;
            --report "ktacp 1 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
            divfpsclr_internal <= '1';
					else state := d51; end if;
        when d52 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ktacp
          mulfpb_internal <= i_Ta0;
          mulfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (mulfprdy_internal = '1') then state := d53;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := d52; end if;
        when d53 =>
          mulfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= mem_signed256_ovalue; -- kvcp
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := d54;
            --report "kvcp 2 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := d53; end if;
        when d54 =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= divfpr_internal; -- kvcp
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d55;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d54; end if;
        when d55 => state := d56;
          mulfpsclr_internal <= '0';
        when d56 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal;
          mulfpb_internal <= i_VddV0;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d58;
            --warning_neq_fp(mulfpr_internal,0.13217926218750000,"ktacp*ta0*kvcp*vdd0"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d56; end if;
        when d58 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal;
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := d59;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            --warning_neq_fp(addfpr_internal,2.3205166,"calc end second"); -- XXX OK
          else state := d58; end if;
        when d59 => -- XXX empty state
          addfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= addfpr_internal;
          subfpb_internal <= x"00000000";
          subfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (58*2+1, 12)); -- ee243a LSB - ram
          if (subfprdy_internal = '1') then state := d59a;
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (58*2+0, 12)); -- ee243a MSB - ram
          else state := d59; end if;
        when d59a => state := d62a;
          subfpsclr_internal <= '0';
          ram (7 downto 0) := i2c_mem_douta_internal;
        when d62a =>
          mem_signed1024_ivalue <= i2c_mem_douta_internal (1 downto 0) & ram; -- ee243a 0x03ff - 10bit - ram
          nibble1 <= i2c_mem_douta_internal (7 downto 2); -- ee243a 0xfc00 - 6bit - offcpsubpage1delta
          addfpce_internal <= '1';
          addfpa_internal <= mem_signed1024_ovalue; -- ram
          addfpb_internal <= out_nibble1; -- offcpsubpage1delta
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := d63; -- offcpsubpage1
            --warning_neq_fp(addfpr_internal,0.0,"offcpsubpage1 second");
            --warning_neq_fp(mem_signed1024_ovalue,0.0,"ram mem second"); -- XXX OK
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := d62a; end if;
        when d63 =>
          addfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= addfpr_internal; -- offcpsubpage1
          mulfpb_internal <= subfpr_internal; -- (...) calc
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d64; -- -- --
            --warning_neq_fp(mulfpr_internal,0.0,"offcpsubpage1 second"); -- XXX OK
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d63; end if;
        when d64 => -- XXX empty state
          mulfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= mulfpr_internal;
          subfpb_internal <= x"00000000";
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := d64a;
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(808*2)+0, 12)); -- ram0728 - pixgain_cp_sp1
          else state := d64; end if;
        when d64a => state := d64b;
          subfpsclr_internal <= '0';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(808*2)+1, 12)); -- ram0728 - pixgain_cp_sp1
        when d64b => state := d65;
          ram (7 downto 0) := i2c_mem_douta_internal;
        when d65 =>
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <=
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram (7) & 
          ram (7) & ram & i2c_mem_douta_internal & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := d67;
            --warning_neq_fp(fixed2floatr_internal,0.0,"ram"); -- XXX OK
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := d65; end if;
        when d67 =>
          fixed2floatsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= fixed2floatr_internal;
          mulfpb_internal <= CalculateKGain_KGain;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := d71;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := d67; end if;
        when d71 =>
          mulfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= mulfpr_internal;
          subfpb_internal <= subfpr_internal;
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := idle;
            --warning_neq_fp(subfpr_internal,0.0,"o_pixoscpsp1");
            o_pixoscpsp1 <= subfpr_internal;
            rdy <= '1';
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
          else state := d71; end if;
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
