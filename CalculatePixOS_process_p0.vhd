----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:18 06/14/2023 
-- Design Name: 
-- Module Name:    CalculatePixOS_process_p0 - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package3.all;

entity CalculatePixOS_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

o_dummy : out std_logic;

i_const1 : in std_logic_vector (31 downto 0);
i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_VddV0 : in std_logic_vector (31 downto 0);

CalculatePixGain_run : out std_logic;
ExtractOffsetParameters_run : out std_logic;
ExtractKtaParameters_run : out std_logic;
ExtractKvParameters_run : out std_logic;

CalculatePixGain_mux : out std_logic;
ExtractOffsetParameters_mux : out std_logic;
ExtractKtaParameters_mux : out std_logic;
ExtractKvParameters_mux : out std_logic;

CalculatePixGain_rdy : in std_logic;
ExtractOffsetParameters_rdy : in std_logic;
ExtractKtaParameters_rdy : in std_logic;
ExtractKvParameters_rdy : in std_logic;

CalculatePixGain_addr : out std_logic_vector (9 downto 0);
ExtractOffsetParameters_addr : out std_logic_vector (9 downto 0);
ExtractKtaParameters_addr : out std_logic_vector (9 downto 0);
ExtractKvParameters_addr : out std_logic_vector (9 downto 0);

CalculatePixGain_do : in std_logic_vector (31 downto 0);
ExtractOffsetParameters_do : in std_logic_vector (31 downto 0);
ExtractKtaParameters_do : in std_logic_vector (31 downto 0);
ExtractKvParameters_do : in std_logic_vector (31 downto 0);

o_write_enable : out std_logic;
o_dia : out std_logic_vector (31 downto 0);
o_addra : out std_logic_vector (9 downto 0);

o_rdy : out std_logic;

mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;

addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : out STD_LOGIC;
addfpsclr : out STD_LOGIC;
addfpce : out STD_LOGIC;
addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : in STD_LOGIC;

subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : out STD_LOGIC;
subfpsclr : out STD_LOGIC;
subfpce : out STD_LOGIC;
subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : in STD_LOGIC

);
end CalculatePixOS_process_p0;

architecture Behavioral of CalculatePixOS_process_p0 is

signal mulfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond_internal : STD_LOGIC;
signal mulfpsclr_internal : STD_LOGIC;
signal mulfpce_internal : STD_LOGIC;
signal mulfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal mulfprdy_internal : STD_LOGIC;

signal addfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond_internal : STD_LOGIC;
signal addfpsclr_internal : STD_LOGIC;
signal addfpce_internal : STD_LOGIC;
signal addfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal addfprdy_internal : STD_LOGIC;

signal subfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond_internal : STD_LOGIC;
signal subfpsclr_internal : STD_LOGIC;
signal subfpce_internal : STD_LOGIC;
signal subfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal subfprdy_internal : STD_LOGIC;

signal addfp_wait : integer range 0 to C_ADDFP_WAIT-1;
signal mulfp_wait : integer range 0 to C_MULFP_WAIT-1;
signal subfp_wait : integer range 0 to C_SUBFP_WAIT-1;
signal addfp_run,addfp_rdy : std_logic;
signal mulfp_run,mulfp_rdy : std_logic;
signal subfp_run,subfp_rdy : std_logic;

begin

p1_counter_mulfp : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      mulfp_wait <= 0;
    elsif (mulfp_rdy = '1') then
      mulfp_wait <= 0;
    elsif (mulfp_run = '1') then
      mulfp_wait <= mulfp_wait + 1;
    end if;
  end if;
end process p1_counter_mulfp;

p1_counter_addfp : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      addfp_wait <= 0;
    elsif (addfp_rdy = '1') then
      addfp_wait <= 0;
    elsif (addfp_run = '1') then
      addfp_wait <= addfp_wait + 1;
    end if;
  end if;
end process p1_counter_addfp;

p1_counter_subfp : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      subfp_wait <= 0;
    elsif (subfp_rdy = '1') then
      subfp_wait <= 0;
    elsif (subfp_run = '1') then
      subfp_wait <= subfp_wait + 1;
    end if;
  end if;
end process p1_counter_subfp;

mulfpa <= mulfpa_internal;
mulfpb <= mulfpb_internal;
mulfpond <= mulfpond_internal;
mulfpsclr <= mulfpsclr_internal;
mulfpce <= mulfpce_internal;
mulfpr_internal <= mulfpr;
--mulfprdy_internal <= mulfprdy;

addfpa <= addfpa_internal;
addfpb <= addfpb_internal;
addfpond <= addfpond_internal;
addfpsclr <= addfpsclr_internal;
addfpce <= addfpce_internal;
addfpr_internal <= addfpr;
--addfprdy_internal <= addfprdy;

subfpa <= subfpa_internal;
subfpb <= subfpb_internal;
subfpond <= subfpond_internal;
subfpsclr <= subfpsclr_internal;
subfpce <= subfpce_internal;
subfpr_internal <= subfpr;
--subfprdy_internal <= subfprdy;

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	type states is (idle,
	s2,s3,s4,s5,s6,s7,s8,s9,s10,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,
	ending);
	variable state : states;
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			i := 0;
			addfpsclr_internal <= '1';
			subfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			o_rdy <= '0';
			CalculatePixGain_run <= '0';
			ExtractOffsetParameters_run <= '0';
			ExtractKtaParameters_run <= '0';
			ExtractKvParameters_run <= '0';
			CalculatePixGain_mux <= '0';
			ExtractOffsetParameters_mux <= '0';
			ExtractKtaParameters_mux <= '0';
			ExtractKvParameters_mux <= '0';
			CalculatePixGain_addr <= (others => '0');
			ExtractOffsetParameters_addr <= (others => '0');
			ExtractKtaParameters_addr <= (others => '0');
			ExtractKvParameters_addr <= (others => '0');
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			subfpa_internal <= (others => '0');
			subfpb_internal <= (others => '0');
			mulfpond_internal <= '0';
			addfpond_internal <= '0';
			subfpond_internal <= '0';
			mulfpce_internal <= '0';
			addfpce_internal <= '0';
			subfpce_internal <= '0';
			o_dia <= (others => '0');
			o_addra <= (others => '0');
			o_write_enable <= '0';
      mulfp_run <= '0';
      mulfp_rdy <= '0';
      addfp_run <= '0';
      addfp_rdy <= '0';
      subfp_run <= '0';
      subfp_rdy <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s2;
					else
						state := idle;
					end if;
					i := 0;
					addfpsclr_internal <= '0';
					subfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';

	when s2 => state := s3;		
		CalculatePixGain_run <= '1';
		CalculatePixGain_mux <= '1';
	when s3 => 
		CalculatePixGain_run <= '0';
		if (CalculatePixGain_rdy = '1') then
			state := s4;
			CalculatePixGain_mux <= '0';
		else
			state := s3;
			CalculatePixGain_mux <= '1';
		end if;

	when s4 => state := s5;
		ExtractOffsetParameters_run <= '1';
		ExtractOffsetParameters_mux <= '1';
	when s5 => 
		ExtractOffsetParameters_run <= '0';
		if (ExtractOffsetParameters_rdy = '1') then
			state := s6;
			ExtractOffsetParameters_mux <= '0';
		else
			state := s5;
			ExtractOffsetParameters_mux <= '1';
		end if;


	when s6 => state := s7;
		ExtractKtaParameters_run <= '1';
		ExtractKtaParameters_mux <= '1';
	when s7 => 
		ExtractKtaParameters_run <= '0';
		if (ExtractKtaParameters_rdy = '1') then
			state := s8;
			ExtractKtaParameters_mux <= '0';
		else
			state := s7;
			ExtractKtaParameters_mux <= '1';
		end if;


	when s8 => state := s9;
		ExtractKvParameters_run <= '1';
		ExtractKvParameters_mux <= '1';
	when s9 => 
		ExtractKvParameters_run <= '0';
		if (ExtractKvParameters_rdy = '1') then
			state := s10;
			ExtractKvParameters_mux <= '0';
		else
			state := s9;
			ExtractKvParameters_mux <= '1';
		end if;
	when s10 => state := s11;
		CalculatePixGain_addr <= std_logic_vector (to_unsigned (i, 10));
		ExtractOffsetParameters_addr <= std_logic_vector (to_unsigned (i, 10));
		ExtractKtaParameters_addr <= std_logic_vector (to_unsigned (i, 10));
		ExtractKvParameters_addr <= std_logic_vector (to_unsigned (i, 10));
					

when s11 => state := s12;
		subfpce_internal <= '1';
		subfpa_internal <= i_Vdd;
		subfpb_internal <= i_VddV0;
		subfpond_internal <= '1';
when s12 =>
if (subfp_wait = C_SUBFP_WAIT-1) then
fptmp1 := subfpr_internal;
subfpce_internal <= '0';
subfpond_internal <= '0';
subfpsclr_internal <= '1';
state := s13;
subfp_run <= '0';
subfp_rdy <= '1';
else
state := s12;
subfp_run <= '1';
end if;
--if (subfprdy_internal = '1') then state := s13;
--fptmp1 := subfpr_internal;
--subfpce_internal <= '0';
--subfpond_internal <= '0';
--subfpsclr_internal <= '1';
--else state := s12; end if;
when s13 => state := s14;
subfp_rdy <= '0';
	subfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= fptmp1;
	mulfpb_internal <= ExtractKvParameters_do;
	mulfpond_internal <= '1';
when s14 =>
if (mulfp_wait = C_MULFP_WAIT-1) then
fptmp1 := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s15;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s14;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s15;
--fptmp1 := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s14; end if;
when s15 => state := s16;
mulfp_rdy <= '0';
	mulfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= fptmp1;
	addfpb_internal <= i_const1;
	addfpond_internal <= '1';
when s16 =>
if (addfp_wait = C_ADDFP_WAIT-1) then
fptmp1 := addfpr_internal;
addfpce_internal <= '0';
addfpond_internal <= '0';
addfpsclr_internal <= '1';
state := s17;
addfp_run <= '0';
addfp_rdy <= '1';
else
state := s16;
addfp_run <= '1';
end if;
--if (addfprdy_internal = '1') then state := s17;
--fptmp1 := addfpr_internal;
--addfpce_internal <= '0';
--addfpond_internal <= '0';
--addfpsclr_internal <= '1';
--else state := s16; end if;
when s17 => state := s18;
addfp_rdy <= '0';
	addfpsclr_internal <= '0';
	subfpce_internal <= '1';
	subfpa_internal <= i_Ta;
	subfpb_internal <= i_Ta0;
	subfpond_internal <= '1';
when s18 =>
if (subfp_wait = C_SUBFP_WAIT-1) then
fptmp2 := subfpr_internal;
subfpce_internal <= '0';
subfpond_internal <= '0';
subfpsclr_internal <= '1';
state := s19;
subfp_run <= '0';
subfp_rdy <= '1';
else
state := s18;
subfp_run <= '1';
end if;
--if (subfprdy_internal = '1') then state := s19;
--fptmp2 := subfpr_internal;
--subfpce_internal <= '0';
--subfpond_internal <= '0';
--subfpsclr_internal <= '1';
--else state := s18; end if;
when s19 => state := s20;
subfp_rdy <= '0';
	subfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= fptmp2;
	mulfpb_internal <= ExtractKtaParameters_do;
	mulfpond_internal <= '1';
when s20 =>
if (mulfp_wait = C_MULFP_WAIT-1) then
fptmp2 := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s21;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s20;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s21;
--fptmp2 := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s20; end if;
when s21 => state := s22;
mulfp_rdy <= '0';
	mulfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= fptmp2;
	addfpb_internal <= i_const1;
	addfpond_internal <= '1';
when s22 =>
if (addfp_wait = C_ADDFP_WAIT-1) then
fptmp2 := addfpr_internal;
addfpce_internal <= '0';
addfpond_internal <= '0';
addfpsclr_internal <= '1';
state := s23;
addfp_run <= '0';
addfp_rdy <= '1';
else
state := s22;
addfp_run <= '1';
end if;
--if (addfprdy_internal = '1') then state := s23;
--fptmp2 := addfpr_internal;
--addfpce_internal <= '0';
--addfpond_internal <= '0';
--addfpsclr_internal <= '1';
--else state := s22; end if;
when s23 => state := s24;
addfp_rdy <= '0';
	addfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= fptmp1;
	mulfpb_internal <= fptmp2;
	mulfpond_internal <= '1';
when s24 =>
if (mulfp_wait = C_MULFP_WAIT-1) then
fptmp1 := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s25;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s24;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s25;
--fptmp1 := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s24; end if;
when s25 => state := s26;
mulfp_rdy <= '0';
	mulfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= fptmp1;
	mulfpb_internal <= ExtractOffsetParameters_do;
	mulfpond_internal <= '1';
when s26 =>
if (mulfp_wait = C_MULFP_WAIT-1) then
fptmp1 := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s27;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s26;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s27;
--fptmp1 := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s26; end if;
when s27 => state := s28;
mulfp_rdy <= '0';
	mulfpsclr_internal <= '0';
	subfpce_internal <= '1';
	subfpa_internal <= CalculatePixGain_do;
	subfpb_internal <= fptmp1;
	subfpond_internal <= '1';
when s28 =>
if (subfp_wait = C_SUBFP_WAIT-1) then
fptmp1 := subfpr_internal;
subfpce_internal <= '0';
subfpond_internal <= '0';
subfpsclr_internal <= '1';
state := s29;
subfp_run <= '0';
subfp_rdy <= '1';
else
state := s28;
subfp_run <= '1';
end if;
--if (subfprdy_internal = '1') then state := s29;
--fptmp1 := subfpr_internal;
--subfpce_internal <= '0';
--subfpond_internal <= '0';
--subfpsclr_internal <= '1';
--else state := s28; end if;
when s29 => state := s30;
subfp_rdy <= '0';
	subfpsclr_internal <= '0';
	o_write_enable <= '1';
	o_addra <= std_logic_vector (to_unsigned (i, 10)); -- pixos
	o_dia <= fptmp1;
--  report_error ("================pixos "&integer'image(i)&" ",fptmp1,0.0);
when s30 =>
	o_write_enable <= '0';
	if (i = (C_ROW*C_COL)-1) then
		state := ending;
		i := 0;
	else
		state := s10;
		i := i + 1;
	end if;
when ending => state := idle;
  o_rdy <= '1';
when others => null;
	end case;
	end if;
	end if;
	end process p0;

end Behavioral;

