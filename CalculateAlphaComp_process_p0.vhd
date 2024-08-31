----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:04:11 06/16/2023 
-- Design Name: 
-- Module Name:    CalculateAlphaComp_process_p0 - Behavioral 
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

entity CalculateAlphaComp_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_acpsubpage0 : in std_logic_vector (31 downto 0);
i_acpsubpage1 : in std_logic_vector (31 downto 0);
i_const1 : in std_logic_vector (31 downto 0);

i_alpha_do : in std_logic_vector (31 downto 0);
o_alpha_addr : out std_logic_vector (9 downto 0);

o_rdy : out std_logic;

ExtractTGCParameters_run : out std_logic;
ExtractTGCParameters_mux : out std_logic;
ExtractTGCParameters_rdy : in std_logic;
ExtractTGCParameters_tgc : in std_logic_vector (31 downto 0);

ExtractKsTaParameters_run : out std_logic;
ExtractKsTaParameters_mux : out std_logic;
ExtractKsTaParameters_rdy : in std_logic;
ExtractKsTaParameters_ksta : in std_logic_vector (31 downto 0);

mem_switchpattern_pixel : out std_logic_vector (11 downto 0);

pattern_ft : in std_logic_vector (31 downto 0);
pattern_neg_ft : in std_logic_vector (31 downto 0);

o_write_enable : out std_logic;
o_addra : out std_logic_vector (9 downto 0);
o_dia : out std_logic_vector (31 downto 0);

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
end CalculateAlphaComp_process_p0;

architecture Behavioral of CalculateAlphaComp_process_p0 is

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

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,
	s31,
	ending);
	variable state : states;
	variable fptmp1,fptmp2,fptmp3 : std_logic_vector (31 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			addfpsclr_internal <= '1';
			subfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			o_rdy <= '0';
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
			o_write_enable <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
					else
						state := idle;
					end if;
					i := 0;
					addfpsclr_internal <= '0';
					subfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
				when s1 => state := s2;
					ExtractTGCParameters_run <= '1';
					ExtractTGCParameters_mux <= '1';
				when s2 => 
					ExtractTGCParameters_run <= '0';
					if (ExtractTGCParameters_rdy = '1') then
						state := s3;
						ExtractTGCParameters_mux <= '0';
					else
						state := s2;
						ExtractTGCParameters_mux <= '1';
					end if;
				when s3 => state := s4;
					ExtractKsTaParameters_run <= '1';
					ExtractKsTaParameters_mux <= '1';
				when s4 => 
					ExtractKsTaParameters_run <= '0';
					if (ExtractKsTaParameters_rdy = '1') then
						state := s5;
						ExtractKsTaParameters_mux <= '0';
					else
						state := s4;
						ExtractKsTaParameters_mux <= '1';
					end if;
				when s5 => state := s6;
					subfpce_internal <= '1';
					subfpa_internal <= i_Ta;
					subfpb_internal <= i_Ta0;
					subfpond_internal <= '1';
				when s6 =>
if (subfp_wait = C_SUBFP_WAIT-1) then
fptmp1 := subfpr_internal;
subfpce_internal <= '0';
subfpond_internal <= '0';
subfpsclr_internal <= '1';
state := s7;
subfp_run <= '0';
subfp_rdy <= '1';
else
state := s6;
subfp_run <= '1';
end if;
--if (subfprdy_internal = '1') then state := s7;
--fptmp1 := subfpr_internal;
--subfpce_internal <= '0';
--subfpond_internal <= '0';
--subfpsclr_internal <= '1';
--else state := s6; end if;
				when s7 => state := s8;
        subfp_rdy <= '0';
					subfpsclr_internal <= '0';

					mulfpce_internal <= '1';
					mulfpa_internal <= fptmp1;
					mulfpb_internal <= ExtractKsTaParameters_ksta;
					mulfpond_internal <= '1';
				when s8 =>
if (mulfp_wait = C_MULFP_WAIT-1) then
fptmp1 := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s9;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s8;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s9;
--fptmp1 := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s8; end if;
				when s9 => state := s10;
        mulfp_rdy <= '0';
					mulfpsclr_internal <= '0';

					addfpce_internal <= '1';
					addfpa_internal <= fptmp1;
					addfpb_internal <= i_const1;
					addfpond_internal <= '1';
				when s10 =>
if (addfp_wait = C_ADDFP_WAIT-1) then
fptmp3 := addfpr_internal;
addfpce_internal <= '0';
addfpond_internal <= '0';
addfpsclr_internal <= '1';
state := s11;
addfp_run <= '0';
addfp_rdy <= '1';
else
state := s10;
addfp_run <= '1';
end if;
--if (addfprdy_internal = '1') then state := s11;
--fptmp3 := addfpr_internal;
--addfpce_internal <= '0';
--addfpond_internal <= '0';
--addfpsclr_internal <= '1';
--else state := s10; end if;
				when s11 => state := s12;
        addfp_rdy <= '0';
					addfpsclr_internal <= '0';

				when s12 => state := s13;
					o_alpha_addr <= std_logic_vector (to_unsigned (i, 10));
					mem_switchpattern_pixel <= std_logic_vector (to_unsigned (i, 14));
				when s13 => state := s14;
				when s14 => state := s15;
					
					mulfpce_internal <= '1';
					mulfpa_internal <= pattern_ft;
					mulfpb_internal <= i_acpsubpage1;
					mulfpond_internal <= '1';
				when s15 =>
if (mulfp_wait = C_MULFP_WAIT-1) then
fptmp1 := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s16;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s15;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s16;
--fptmp1 := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s15; end if;
				when s16 => state := s17;
        mulfp_rdy <= '0';
					mulfpsclr_internal <= '0';

					mulfpce_internal <= '1';
					mulfpa_internal <= pattern_neg_ft;
					mulfpb_internal <= i_acpsubpage0;
					mulfpond_internal <= '1';
				when s17 =>
if (mulfp_wait = C_MULFP_WAIT-1) then
fptmp2 := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s18;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s17;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s18;
--fptmp2 := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s17; end if;
				when s18 => state := s19;
        mulfp_rdy <= '0';
					mulfpsclr_internal <= '0';

				when s19 => state := s20;
					addfpce_internal <= '1';
					addfpa_internal <= fptmp1;
					addfpb_internal <= fptmp2;
					addfpond_internal <= '1';
				when s20 =>
if (addfp_wait = C_ADDFP_WAIT-1) then
fptmp1 := addfpr_internal;
addfpce_internal <= '0';
addfpond_internal <= '0';
addfpsclr_internal <= '1';
state := s21;
addfp_run <= '0';
addfp_rdy <= '1';
else
state := s20;
addfp_run <= '1';
end if;
--if (addfprdy_internal = '1') then state := s21;
--fptmp1 := addfpr_internal;
--addfpce_internal <= '0';
--addfpond_internal <= '0';
--addfpsclr_internal <= '1';
--else state := s20; end if;
				when s21 => state := s22;
        addfp_rdy <= '0';
					addfpsclr_internal <= '0';

				when s22 => state := s23;
					mulfpce_internal <= '1';
					mulfpa_internal <= ExtractTGCParameters_tgc;
					mulfpb_internal <= fptmp1;
					mulfpond_internal <= '1';
				when s23 =>
if (mulfp_wait = C_MULFP_WAIT-1) then
fptmp1 := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s24;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s23;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s24;
--fptmp1 := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s23; end if;
				when s24 => state := s25;
        mulfp_rdy <= '0';
					mulfpsclr_internal <= '0';

				when s25 => state := s26;
					subfpce_internal <= '1';
					subfpa_internal <= i_alpha_do;
					subfpb_internal <= fptmp1;
					subfpond_internal <= '1';
				when s26 =>
if (subfp_wait = C_SUBFP_WAIT-1) then
fptmp1 := subfpr_internal;
subfpce_internal <= '0';
subfpond_internal <= '0';
subfpsclr_internal <= '1';
state := s27;
subfp_run <= '0';
subfp_rdy <= '1';
else
state := s26;
subfp_run <= '1';
end if;
--if (subfprdy_internal = '1') then state := s27;
--fptmp1 := subfpr_internal;
--subfpce_internal <= '0';
--subfpond_internal <= '0';
--subfpsclr_internal <= '1';
--else state := s26; end if;
				when s27 => state := s28;
        subfp_rdy <= '0';
					subfpsclr_internal <= '0';

				when s28 => state := s29;
					mulfpce_internal <= '1';
					mulfpa_internal <= fptmp1;
					mulfpb_internal <= fptmp3;
					mulfpond_internal <= '1';
				when s29 =>
if (mulfp_wait = C_MULFP_WAIT-1) then
fptmp1 := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s30;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s29;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s30;
--fptmp1 := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s29; end if;
				when s30 => state := s31;
        mulfp_rdy <= '0';
					mulfpsclr_internal <= '0';
					o_write_enable <= '1';
					o_addra <= std_logic_vector (to_unsigned (i, 10)); -- alphacomp
					o_dia <= fptmp1;
--          report_error ("================alphacomp : ",fptmp1,0.0);
				when s31 =>
					o_write_enable <= '0';
					if (i = (C_ROW*C_COL)-1) then
						state := ending;
						i := 0;
					else
						state := s12;
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
