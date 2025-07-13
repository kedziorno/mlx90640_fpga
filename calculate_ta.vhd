-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   17:55:26 02/02/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   calculate_ta
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   11.1.2. Restoring the Ta sensor parameters (p. 22)
--                11.2.2.3. Ambient temperature calculation (common for all pixels) (p. 37)
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    global_package.vhd
--  - Modules: -
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules:
--      rom_constants
--    - Processes (Architecture: rtl):
--      p0
--
-- Important objects: -
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos: -
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones: -
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

use work.global_package.all;

entity calculate_ta is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_Vdd : in std_logic_vector (31 downto 0);

o_Ta : out std_logic_vector (31 downto 0); -- output Ta
o_rdy : out std_logic;

o_kvptat_ena : out std_logic;
o_kvptat_adr : out std_logic_vector (5 downto 0);
o_alphaptat_ena : out std_logic;
o_alphaptat_adr : out std_logic_vector (3 downto 0);
i_rom_constants_float : in std_logic_vector (31 downto 0);

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr :  in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;

divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : out STD_LOGIC;
divfpce : out STD_LOGIC;
divfpsclr : out STD_LOGIC;
divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : in STD_LOGIC;

mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;

addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : out STD_LOGIC;
addfpce : out STD_LOGIC;
addfpsclr : out STD_LOGIC;
addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : in STD_LOGIC;

subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : out STD_LOGIC;
subfpce : out STD_LOGIC;
subfpsclr : out STD_LOGIC;
subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : in STD_LOGIC
);
end calculate_ta;

architecture rtl of calculate_ta is

begin

p0 : process (i_clock) is
	type states is (idle,
	s1c,
	s8,s9,
	s12,s13,s14,s15,
	s16,s18,
	s22,s23,s24,s25,s26,s26a,s26b,s26c,
	s28,s30);
	variable state : states;
  variable ram : std_logic_vector (7 downto 0);
  variable tmp : std_logic_vector (1 downto 0);
begin
	if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      state := idle;
      fixed2floatsclr <= '1';
      addfpsclr <= '1';
      subfpsclr <= '1';
      mulfpsclr <= '1';
      divfpsclr <= '1';
      fixed2floata <= (others => '0');
      fixed2floatce <= '0';
      fixed2floatond <= '0';
      mulfpa <= (others => '0');
      mulfpb <= (others => '0');
      mulfpce <= '0';
      mulfpond <= '0';
      addfpa <= (others => '0');
      addfpb <= (others => '0');
      addfpce <= '0';
      addfpond <= '0';
      subfpce <= '0';
      subfpond <= '0';
      subfpa <= (others => '0');
      subfpb <= (others => '0');
      divfpce <= '0';
      divfpond <= '0';
      divfpa <= (others => '0');
      divfpb <= (others => '0');
      o_Ta <= (others => '0');
      o_rdy <= '0';
      i2c_mem_ena <= '0';
      o_kvptat_ena <= '0';
      o_kvptat_adr <= (others => '0');
      o_alphaptat_ena <= '0';
      o_alphaptat_adr <= (others => '0');
    else
      case (state) is
        when idle =>
          if (i_run = '1') then
            state := s1c;
            i2c_mem_ena <= '1';
            o_rdy <= '0';
          else
            state := idle;
            i2c_mem_ena <= '0';
          end if;
          fixed2floatsclr <= '0';
          addfpsclr <= '0';
          subfpsclr <= '0';
          mulfpsclr <= '0';
          divfpsclr <= '0';
        when s1c =>
          subfpce <= '1';
          subfpa <= i_Vdd;
          subfpb <= C_3DOT3;
          subfpond <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(800*2)+0, 12)); -- ram0720 MSB vptat
          if (subfprdy = '1') then state := s8;
            -- XXX duplicate calculation
            subfpce <= '0';
            subfpond <= '0';
            subfpsclr <= '1';
            --synthesis translate_off
            report_error("================ CalculateTa deltaV", subfpr, 0.0);
            --synthesis translate_on
            i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(800*2)+1, 12)); -- ram0720 LSB vptat
            ram := i2c_mem_douta;
          else state := s1c; end if;
        when s8 =>
          subfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <=
          ram & i2c_mem_douta;
          if (fixed2floatrdy = '1') then state := s9;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            --synthesis translate_off
            report_error("================ CalculateTa vptat", fixed2floatr, 0.0);
            --synthesis translate_on
            i2c_mem_addra <= std_logic_vector (to_unsigned (16*2+0, 12)); -- ee2410 MSB kptat
          else state := s8; end if;
        when s9 => state := s12;
          fixed2floatsclr <= '0';
        when s12 =>
          o_alphaptat_ena <= '1';
          o_alphaptat_adr <= i2c_mem_douta (7 downto 4);
          -- vptat*alphaptat
          mulfpce <= '1';
          mulfpa <= fixed2floatr;
          mulfpb <= i_rom_constants_float;
          mulfpond <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(768*2)+0, 12)); -- ram0700 MSB vbe
          if (mulfprdy = '1') then state := s13;
            --synthesis translate_off
            report_error("================ CalculateTa alphaptat", i_rom_constants_float, 0.0);
            --synthesis translate_on
            o_alphaptat_ena <= '0';
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
            i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(768*2)+1, 12)); -- ram0700 LSB vbe
            ram := i2c_mem_douta;
          else state := s12; end if;
        when s13 =>
          mulfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <=
          ram & i2c_mem_douta;
          if (fixed2floatrdy = '1') then state := s14;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            --synthesis translate_off
            report_error("================ CalculateTa vbe", fixed2floatr, 0.0);
            --synthesis translate_on
          else state := s13; end if;
        when s14 =>
          fixed2floatsclr <= '0';
          -- vptat*alphaptat+vbe
          addfpce <= '1';
          addfpa <= mulfpr; -- vptat*alphaptat
          addfpb <= fixed2floatr;
          addfpond <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(800*2)+0, 12)); -- ram0720 MSB vptat
          if (addfprdy = '1') then state := s15;
            addfpce <= '0';
            addfpond <= '0';
            addfpsclr <= '1';
            i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(800*2)+1, 12)); -- ram0720 LSB vptat
            ram := i2c_mem_douta;
          else state := s14; end if;
        when s15 => -- XXX fi2fl ram0720 twice for remove vptat_ft reg (compare syn)
          addfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <=
          ram & i2c_mem_douta;
          if (fixed2floatrdy = '1') then state := s16;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            --synthesis translate_off
            report_error("================ CalculateTa vptat", fixed2floatr, 0.0);
            --synthesis translate_on
          else state := s15; end if;
        when s16 =>
          fixed2floatsclr <= '0';
          -- vptat/(vptat*alphaptat+vbe)
          divfpce <= '1';
          divfpa <= fixed2floatr;
          divfpb <= addfpr; -- vptat*alphaptat+vbe
          divfpond <= '1';
          if (divfprdy = '1') then state := s18;
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
            i2c_mem_addra <= std_logic_vector (to_unsigned (50*2+0, 12)); -- ee2432 MSB kvptat-6bit,ktptat-10bit
          else state := s16; end if;
        when s18 =>
          divfpsclr <= '0';
          -- xxx move to s23
          -- kvptat*deltaV
          mulfpce <= '1';
          o_kvptat_ena <= '1';
          o_kvptat_adr <= i2c_mem_douta (7 downto 2);
          mulfpa <= i_rom_constants_float;
          mulfpb <= subfpr; -- XXX deltaV = Vdd - 3.3 
          mulfpond <= '1';
          if (mulfprdy = '1') then state := s22;
            o_kvptat_ena <= '0';
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
            --synthesis translate_off
            report_error("================ CalculateTa ExtractKvPTATParameter_kvptat", i_rom_constants_float, 0.0);
            --synthesis translate_on
            --synthesis translate_off
            report_error("================ CalculateTa 1", mulfpr, 0.0);
            --synthesis translate_on
          else state := s18; end if;
        when s22 =>
          mulfpsclr <= '0';
          -- 1+kvptat*deltaV
          addfpce <= '1';
          addfpa <= C_P1;
          addfpb <= mulfpr; -- kvptat*deltaV
          addfpond <= '1';
          if (addfprdy = '1') then state := s23;
            addfpce <= '0';
            addfpond <= '0';
            addfpsclr <= '1';
            --synthesis translate_off
            report_error("================ CalculateTa 2", addfpr, 0.0);
            --synthesis translate_on
          else state := s22; end if;
        when s23 => -- XXX move from s18
          addfpsclr <= '0';
          -- vptat/(vptat*alphaptat+vbe)*2^18
          mulfpce <= '1';
          mulfpa <= divfpr; -- vptat/(vptat*alphaptat+vbe)
          mulfpb <= C_2POW18;
          mulfpond <= '1';
          if (mulfprdy = '1') then state := s24;
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
          else state := s23; end if;
        when s24 =>
          mulfpsclr <= '0';
          -- vptatart/(1+kvptat*deltaV)
          divfpce <= '1';
          divfpa <= mulfpr; -- vptatart =  (vptat/(vptat*alphaptat+vbe))*2^18
          divfpb <= addfpr; -- 1+kvptat*deltaV
          divfpond <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (49*2+0, 12)); -- ee2431 MSB vptat25
          if (divfprdy = '1') then state := s25;
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
            --synthesis translate_off
            report_error("================ CalculateTa 3", divfpr, 0.0);
            --synthesis translate_on
            i2c_mem_addra <= std_logic_vector (to_unsigned (49*2+1, 12)); -- ee2431 LSB vptat25
            ram := i2c_mem_douta;
          else state := s24; end if;
        when s25 =>
          divfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <=
          ram & i2c_mem_douta;
          if (fixed2floatrdy = '1') then state := s26;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            --synthesis translate_off
            report_error("================ CalculateTa vptat25", fixed2floatr, 0.0);
            --synthesis translate_on
          else state := s25; end if;
        when s26 =>
          fixed2floatsclr <= '0';
          -- (vptatart/(1+kvptat*deltaV))-vptat25
          subfpce <= '1';
          subfpa <= divfpr; -- vptatart/(1+kvptat*deltaV)
          subfpb <= fixed2floatr;
          subfpond <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (50*2+0, 12)); -- ee2432 MSB kvptat-6bit,ktptat-10bit
          if (subfprdy = '1') then state := s26a;
            subfpce <= '0';
            subfpond <= '0';
            subfpsclr <= '1';
            --synthesis translate_off
            report_error("================ CalculateTa 4", subfpr, 0.0);
            --synthesis translate_on
            i2c_mem_addra <= std_logic_vector (to_unsigned (50*2+1, 12)); -- ee2432 LSB kvptat-6bit,ktptat-10bit
            tmp (1 downto 0) := i2c_mem_douta (1 downto 0); -- ee2432 msb
          else state := s26; end if;
        when s26a =>
          subfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <=
          tmp (1) & tmp (1) & 
          tmp (1) & tmp (1) & 
          tmp (1) & tmp (1) & 
          tmp (1 downto 0) & i2c_mem_douta;
          if (fixed2floatrdy = '1') then state := s26b;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            --synthesis translate_off
            report_error("================ KtPTAT fi2fl", fixed2floatr, 0.0);
            --synthesis translate_on
          else state := s26a; end if;
        when s26b =>
          fixed2floatsclr <= '0';
          divfpce <= '1';
          divfpa <= fixed2floatr;
          divfpb <= C_2POW3;
          divfpond <= '1';
          if (divfprdy = '1') then state := s26c;
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
          else state := s26b; end if;
        when s26c => state := s28;
          divfpsclr <= '0';
        when s28 =>
          -- ((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat
          divfpce <= '1';
          divfpa <= subfpr; -- (vptatart/(1+kvptat*deltaV))-vptat25
          divfpb <= divfpr; --ktptat
          divfpond <= '1';
          --synthesis translate_off
          report_error("================ CalculateTa ExtractKtPTATParameter_ktptat", divfpr, 0.0);
          --synthesis translate_on
          if (divfprdy = '1') then state := s30;
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
            --synthesis translate_off
            report_error("================ CalculateTa 5", divfpr, 0.0);
            --synthesis translate_on
          else state := s28; end if;
        when s30 =>
          divfpsclr <= '0';
          -- (((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat)+25
          addfpce <= '1';
          addfpa <= divfpr; -- ((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat
          addfpb <= C_TA0;
          addfpond <= '1';
          if (addfprdy = '1') then state := idle;
            addfpce <= '0';
            addfpond <= '0';
            addfpsclr <= '1';
            o_Ta <= addfpr;
            --o_Ta <= x"4207F54F"; -- example 33.989559
            --synthesis translate_off
            report_error("================ CalculateTa Ta", addfpr, 0.0); -- (((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat)+25
            --synthesis translate_on
            o_rdy <= '1';
          else state := s30; end if;
      end case;
    end if;
  end if;
end process p0;

end architecture rtl;

