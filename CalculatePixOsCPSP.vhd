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
i_Vdd : in std_logic_vector (31 downto 0);
i_KGain : in std_logic_vector (31 downto 0);

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_pixoscpsp0 : out std_logic_vector (31 downto 0);
o_pixoscpsp1 : out std_logic_vector (31 downto 0);

o_rdy : out std_logic;

signal o_signed6bit_ena : out std_logic;
signal o_signed6bit_adr : out std_logic_vector (5 downto 0);
signal o_2powx_p8_4bit_ena : out std_logic;
signal o_2powx_p8_4bit_adr : out std_logic_vector (3 downto 0);
signal o_2powx_4bit_ena : out std_logic;
signal o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);

signal o_mem_signed256_ivalue : out std_logic_vector (7 downto 0);
signal i_mem_signed256_ovalue : in std_logic_vector (31 downto 0);
signal o_mem_signed1024_ivalue : out std_logic_vector(9 downto 0);
signal i_mem_signed1024_ovalue : in std_logic_vector(31 downto 0);

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

signal rdy : std_logic;

signal out_nibble2,out_nibble3 : std_logic_vector (31 downto 0);

signal i2c_mem_ena_internal : STD_LOGIC;
signal i2c_mem_addra_internal : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta_internal : STD_LOGIC_VECTOR(7 DOWNTO 0);

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

fixed2floata <= fixed2floata_internal;
fixed2floatond <= fixed2floatond_internal;
fixed2floatce <= fixed2floatce_internal;
fixed2floatsclr <= fixed2floatsclr_internal;
fixed2floatr_internal <= fixed2floatr;
fixed2floatrdy_internal <= fixed2floatrdy;

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

i2c_mem_ena <= i2c_mem_ena_internal;
i2c_mem_addra <= i2c_mem_addra_internal;
i2c_mem_douta_internal <= i2c_mem_douta;

o_rdy <= rdy;

p0 : process (i_clock) is
	type states is (idle,s0,s1a,s1b,s1c,s1d,
	s1e,s1f,s2,s4,s6,s6a,s7,s8,s9,s10,
	s12,s12a,s13,s14,s16,s16a,s17,s18,s18a,s19,s20,
	s21,s22,s24,s24a,s25,s26,s26a,s27,s28,s29,s30,
	s31,s32,s34,s34a,s35,s36,s37,s38,s40,s40a,
	s41,s42,s42a,s43,s44,s45,s46,s47,s48,s50,
	s51,s52,s53,s54,s55,s56,s58,s59,
	s61,s63,s64,s64a,s64b,s65,s67,
	s71,d58,d59,d59a,d62c,
  d63,d64,d64a,d64b,d65,d67,
	d71);
  variable state : states;
	variable ram : std_logic_vector (7 downto 0);
  variable calc : std_logic_vector (31 downto 0);
  constant const_minus1 : std_logic_vector (31 downto 0) := x"bf800000";
  constant const_plus1 : std_logic_vector (31 downto 0) := x"3f800000";
  constant const_Ta0 : std_logic_vector (31 downto 0) := x"41C80000"; -- 25
  constant const_VddV0 : std_logic_vector (31 downto 0) := x"40533333"; -- 3.3
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
			o_mem_signed1024_ivalue <= (others => '0');
			o_mem_signed256_ivalue <= (others => '0');
			i2c_mem_ena_internal <= '0';
			i2c_mem_addra_internal <= (others => '0');
			o_pixoscpsp0 <= (others => '0');
			o_pixoscpsp1 <= (others => '0');
			rdy <= '0';
      calc := (others => '0');
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
				when s0 => state := s1a;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (56*2+1, 12)); -- ee2438 LSB - ktascale1
        when s1a => state := s1b;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (56*2+0, 12)); -- ee2438 MSB - kvscale
        when s1b => state := s1c;
          o_2powx_p8_4bit_ena <= '1';
          o_2powx_p8_4bit_adr <= i2c_mem_douta_internal (7 downto 4); -- ee2438 00f0 - ktascale1
        when s1c => state := s1d;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
        when s1d => state := s1e;
          out_nibble2 <= i_rom_constants_float; -- ktascale
          o_2powx_p8_4bit_ena <= '0';
          o_2powx_4bit_ena <= '1';
          o_2powx_4bit_adr <= i2c_mem_douta_internal (3 downto 0); -- ee2438 0f00 - kvscale
        when s1e =>
        
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= -- kvcp
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s1f;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s1e; end if;

        when s1f => state := s2; -- xxx
          fixed2floatsclr_internal <= '0';
          out_nibble3 <= i_rom_constants_float; -- kvscale
          o_2powx_4bit_ena <= '0';
        when s2 =>
					divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- kvcpee
					divfpb_internal <= out_nibble3; -- 2^kvscale;
					divfpond_internal <= '1';
					if (divfprdy_internal = '1') then state := s4;
            o_2powx_4bit_ena <= '0';
            --report "kvcp 1 " & real'image(ap_slv2fp(divfpr_internal));
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s2; end if;
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
          if (addfprdy_internal = '1') then state := s6a;
            --warning_neq_fp(addfpr_internal,3.4721875,"1+kvcp*vdd"); -- XXX OK
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          else state := s6; end if;
        when s6a =>
          addfpsclr_internal <= '0';
          
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= -- kvcpee
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s7;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s6a; end if;
          
        when s7 =>
          fixed2floatsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- kvcp
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
          mulfpb_internal <= const_VddV0;
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
          if (addfprdy_internal = '1') then state := s12a;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          else state := s12; end if;
        when s12a =>
          addfpsclr_internal <= '0';
          
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= -- ktacpee
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s13;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s12a; end if;
        when s13 =>
          fixed2floatsclr_internal <= '0';

					divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- ktacp
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
          if (addfprdy_internal = '1') then state := s16a;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          else state := s16; end if;
        when s16a =>
          addfpsclr_internal <= '0';

          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= -- ktacp
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s17;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s16a; end if;

        when s17 =>
          fixed2floatsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- ktacp
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
          if (mulfprdy_internal = '1') then state := s18a;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          else state := s18; end if;
        
        when s18a =>
          mulfpsclr_internal <= '0';

          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= -- kvcpee
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s19;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s18a; end if;

        when s19 =>
          fixed2floatsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- kvcp
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
          if (addfprdy_internal = '1') then state := s24a;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          else state := s24; end if;
          
        when s24a =>
          addfpsclr_internal <= '0';
				
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= -- ktacp
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s25;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s24a; end if;
      
        when s25 =>
          fixed2floatsclr_internal <= '0';

        	divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- ktacp
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
          if (mulfprdy_internal = '1') then state := s26a;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          else state := s26; end if;
        
        when s26a =>
          mulfpsclr_internal <= '0';
					
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= -- kvcpee
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s27;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s26a; end if;

        when s27 =>
          fixed2floatsclr_internal <= '0';

          divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- kvcp
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
          mulfpb_internal <= const_VddV0;
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
          if (addfprdy_internal = '1') then state := s34a;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          else state := s34; end if;
          
        when s34a =>
          addfpsclr_internal <= '0';
					
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= -- ktacp
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s35;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s34a; end if;

        when s35 =>
          fixed2floatsclr_internal <= '0';

          divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- ktacp
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
          mulfpb_internal <= const_Ta0;
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
          if (addfprdy_internal = '1') then state := s40a;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+1, 12)); -- ee243b LSB - ktacpee
          else state := s40; end if;
          
        when s40a =>
          addfpsclr_internal <= '0';
					
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= -- ktacp
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s41;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s40a; end if;

        when s41 =>
          fixed2floatsclr_internal <= '0';

          divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- ktacp
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
          mulfpb_internal <= const_Ta0;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s42a;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          else state := s42; end if;
          
        when s42a =>
          mulfpsclr_internal <= '0';
					
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= -- kvcpee
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7) & 
          i2c_mem_douta_internal (7) & i2c_mem_douta_internal (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s43;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
          else state := s42a; end if;

        when s43 =>
          fixed2floatsclr_internal <= '0';

          divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- kvcp
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
            o_mem_signed256_ivalue <= i2c_mem_douta_internal; -- ktacp
          else state := s50; end if;
        when s51 =>
          addfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= i_mem_signed256_ovalue; -- ktacp
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
          mulfpb_internal <= const_Ta0;
          mulfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          if (mulfprdy_internal = '1') then state := s53;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            o_mem_signed256_ivalue <= i2c_mem_douta_internal; -- kvcp
          else state := s52; end if;
        when s53 =>
          mulfpsclr_internal <= '0';
					divfpce_internal <= '1';
					divfpa_internal <= i_mem_signed256_ovalue; -- kvcp
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
          mulfpb_internal <= const_VddV0;
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
            calc := addfpr_internal;
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
          o_mem_signed1024_ivalue <= i2c_mem_douta_internal (1 downto 0) & ram; -- ee243a 0x03ff - 10bit - ram
          mulfpce_internal <= '1';
          mulfpa_internal <= i_mem_signed1024_ovalue; -- ram
          mulfpb_internal <= calc; -- (...)
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
          mulfpb_internal <= i_KGain;
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
--          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (59*2+0, 12)); -- ee243b MSB - kvcpee
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (58*2+1, 12)); -- ee243a LSB - ram
          if (subfprdy_internal = '1') then state := d58;
            --synthesis translate_off
            warning_neq_fp(subfpr_internal,0.0,"o_pixoscpsp0");
            --synthesis translate_on
            o_pixoscpsp0 <= subfpr_internal;
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
            i2c_mem_addra_internal <= std_logic_vector (to_unsigned (58*2+0, 12)); -- ee243a MSB - ram
          else state := s71; end if;
        -- XXX second calc
        when d58 => state := d59;
          ram (7 downto 0) := i2c_mem_douta_internal;
          subfpsclr_internal <= '0';
        when d59 => state := d59a;
          o_signed6bit_ena <= '1';
          o_signed6bit_adr <= i2c_mem_douta_internal (7 downto 2); -- ee243a 0xfc00 - 6bit - offcpsubpage1delta
        when d59a => state := d62c;
          o_mem_signed1024_ivalue <= i2c_mem_douta_internal (1 downto 0) & ram; -- ee243a 0x03ff - 10bit - ram
        when d62c =>
          addfpce_internal <= '1';
          addfpa_internal <= i_mem_signed1024_ovalue; -- ram
          addfpb_internal <= i_rom_constants_float; -- offcpsubpage1delta
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := d63; -- offcpsubpage1
            o_signed6bit_ena <= '0';
            --warning_neq_fp(addfpr_internal,0.0,"offcpsubpage1 second");
            --warning_neq_fp(mem_signed1024_ovalue,0.0,"ram mem second"); -- XXX OK
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := d62c; end if;
        when d63 =>
          addfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= addfpr_internal; -- offcpsubpage1
          mulfpb_internal <= calc; -- (...) calc
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
          mulfpb_internal <= i_KGain;
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
            --synthesis translate_off
            warning_neq_fp(subfpr_internal,0.0,"o_pixoscpsp1");
            --synthesis translate_on
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

end architecture Behavioral;
