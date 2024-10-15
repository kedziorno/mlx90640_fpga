----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:41 06/16/2023 
-- Design Name: 
-- Module Name:    CalculateVirCompensated_process_p0 - Behavioral 
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

entity CalculateVirCompensated_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_Emissivity : in std_logic_vector (31 downto 0);
i_pixoscpsp0 : in std_logic_vector (31 downto 0);
i_pixoscpsp1 : in std_logic_vector (31 downto 0);

i_pixos_do : in std_logic_vector (31 downto 0);
o_pixos_addr : out std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

ExtractTGCParameters_run : out std_logic;
ExtractTGCParameters_mux : out std_logic;
ExtractTGCParameters_rdy : in std_logic;
ExtractTGCParameters_tgc : in std_logic_vector (31 downto 0);

o_write_enable : out std_logic;
o_addra : out std_logic_vector (9 downto 0);
o_dia : out std_logic_vector (31 downto 0);

mem_switchpattern_pixel : out std_logic_vector (11 downto 0);

pattern_neg_ft : in std_logic_vector (31 downto 0);
pattern_ft : in std_logic_vector (31 downto 0);

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
end CalculateVirCompensated_process_p0;

architecture Behavioral of CalculateVirCompensated_process_p0 is

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

addfpa <= addfpa_internal;
addfpb <= addfpb_internal;
addfpond <= addfpond_internal;
addfpsclr <= addfpsclr_internal;
addfpce <= addfpce_internal;
addfpr_internal <= addfpr;
addfprdy_internal <= addfprdy;

subfpa <= subfpa_internal;
subfpb <= subfpb_internal;
subfpond <= subfpond_internal;
subfpsclr <= subfpsclr_internal;
subfpce <= subfpce_internal;
subfpr_internal <= subfpr;
subfprdy_internal <= subfprdy;

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	type states is (idle,s0,s0a,
	s1,s2,s3,s4,s5,s8,s9,s10,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,
	ending);
	variable state : states;
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable emissivity_compensated : std_logic_vector (31 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			addfpsclr_internal <= '1';
			subfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			divfpsclr_internal <= '1';
			o_rdy <= '0';
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
			ExtractTGCParameters_run <= '0';
			ExtractTGCParameters_mux <= '0';
			o_write_enable <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s0;
					else
						state := idle;
					end if;
					i := 0;
					addfpsclr_internal <= '0';
					subfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
				when s0 => state := s0a;
					ExtractTGCParameters_run <= '1';
					ExtractTGCParameters_mux <= '1';
				when s0a => 
					ExtractTGCParameters_run <= '0';
					if (ExtractTGCParameters_rdy = '1') then
						state := s1;
						ExtractTGCParameters_mux <= '0';
					else
						state := s0a;
						ExtractTGCParameters_mux <= '1';
					end if;

				when s1 => state := s2;
					o_pixos_addr <= std_logic_vector (to_unsigned (i, 10));
					mem_switchpattern_pixel <= std_logic_vector (to_unsigned (i, 12));
				when s2 => state := s3;
				when s3 => state := s4;

					divfpce_internal <= '1';
					divfpa_internal <= i_pixos_do;
					divfpb_internal <= i_Emissivity;
					divfpond_internal <= '1';
				when s4 =>
					if (divfprdy_internal = '1') then state := s5;
						emissivity_compensated := divfpr_internal;
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
					else state := s4; end if;
				when s5 => state := s8;
					divfpsclr_internal <= '0';


				when s8 => state := s9;
					mulfpce_internal <= '1';
					mulfpa_internal <= i_pixoscpsp1;
					mulfpb_internal <= pattern_ft;
					mulfpond_internal <= '1';
				when s9 =>
					if (mulfprdy_internal = '1') then state := s10;
						fptmp1 := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s9; end if;
				when s10 => state := s11;
					mulfpsclr_internal <= '0';

				when s11 => state := s12;
					mulfpce_internal <= '1';
					mulfpa_internal <= i_pixoscpsp0;
					mulfpb_internal <= pattern_neg_ft;
					mulfpond_internal <= '1';
				when s12 =>
					if (mulfprdy_internal = '1') then state := s13;
						fptmp2 := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s12; end if;
				when s13 => state := s14;
					mulfpsclr_internal <= '0';

				when s14 => state := s15;
					addfpce_internal <= '1';
					addfpa_internal <= fptmp1;
					addfpb_internal <= fptmp2;
					addfpond_internal <= '1';
				when s15 =>
					if (addfprdy_internal = '1') then state := s16;
						fptmp1 := addfpr_internal;
						addfpce_internal <= '0';
						addfpond_internal <= '0';
						addfpsclr_internal <= '1';
					else state := s15; end if;
				when s16 => state := s17;
					addfpsclr_internal <= '0';

				when s17 => state := s18;
					mulfpce_internal <= '1';
					mulfpa_internal <= fptmp1;
					mulfpb_internal <= ExtractTGCParameters_tgc;
					mulfpond_internal <= '1';
				when s18 =>
					if (mulfprdy_internal = '1') then state := s19;
						fptmp1 := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s18; end if;
				when s19 => state := s20;
					mulfpsclr_internal <= '0';

				when s20 => state := s21;
					subfpce_internal <= '1';
					subfpa_internal <= emissivity_compensated;
					subfpb_internal <= fptmp1;
					subfpond_internal <= '1';
				when s21 =>
					if (subfprdy_internal = '1') then state := s22;
						fptmp1 := subfpr_internal;
						subfpce_internal <= '0';
						subfpond_internal <= '0';
						subfpsclr_internal <= '1';
					else state := s21; end if;
				when s22 => state := s23;
					subfpsclr_internal <= '0';

					o_write_enable <= '1';
					o_addra <= std_logic_vector (to_unsigned (i, 10)); -- pixos
					o_dia <= fptmp1;
                    --synthesis translate_off

         report_error ("================vircompensated " & integer'image(i),fptmp1,0.0);
          --synthesis translate_on
				when s23 =>
					o_write_enable <= '0';
					if (i = (C_ROW*C_COL)-1) then
						state := ending;
						i := 0;
					else
						state := s1;
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

