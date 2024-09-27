----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:55:26 02/02/2023 
-- Design Name: 
-- Module Name:    calculateTa - Behavioral 
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
library ieee;
--library ieee;
use ieee.std_logic_1164.all;
--use ieee_proposed.fixed_pkg.all;

use work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CalculateTa is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_Vdd : in std_logic_vector (31 downto 0);

o_Ta : out std_logic_vector (31 downto 0); -- output Ta
o_rdy : out std_logic;

fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
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
end CalculateTa;

architecture Behavioral of CalculateTa is

COMPONENT ExtractKtPTATParameter
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2432 : IN  std_logic_vector(15 downto 0);
o_ktptat : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

signal ExtractKtPTATParameter_clock : std_logic;
signal ExtractKtPTATParameter_reset : std_logic;
signal ExtractKtPTATParameter_ee0x2432 : std_logic_vector (15 downto 0);
signal ExtractKtPTATParameter_ktptat : std_logic_vector (31 downto 0);

COMPONENT ExtractKvPTATParameter
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2432 : IN  std_logic_vector(15 downto 0);
o_kvptat : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;

signal ExtractKvPTATParameter_clock : std_logic;
signal ExtractKvPTATParameter_reset : std_logic;
signal ExtractKvPTATParameter_ee0x2432 : std_logic_vector (15 downto 0);
signal ExtractKvPTATParameter_kvptat : std_logic_vector (31 downto 0);

component ExtractAlphaPtatParameter is
port (
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2410 : IN  std_logic_vector (15 downto 0);
o_alphaptat: OUT  std_logic_vector (31 downto 0)
);
end component ExtractAlphaPtatParameter;

signal ExtractAlphaPtatParameter_clock : std_logic;
signal ExtractAlphaPtatParameter_reset : std_logic;
signal ExtractAlphaPtatParameter_ee0x2410 : std_logic_vector (15 downto 0);
signal ExtractAlphaPtatParameter_alphaptat : std_logic_vector (31 downto 0);

signal ee2432,ee2431,ram0720,ram0700,ee2410 : std_logic_vector (15 downto 0);

begin

p0 : process (i_clock) is
	variable fttmp1,fttmp2 : std_logic_vector (31 downto 0);
	variable vbe_ft,vptat_ft,vptat25_ft,vptatart : std_logic_vector (31 downto 0);
	type states is (idle,
	s0,s1,
	s1a,s1b,s1c,s1d,s1e,s1f,s1g,s1h,
	s2,s6,s7,s8,
	s9,s10,s12,s14,
	s16,s18,s19,s20,
	s22,s24,s26,
	s28,s30);
	variable state : states;
	constant const3dot3_ft : std_logic_vector (31 downto 0) := x"40533333";
	constant const2pow18_ft : std_logic_vector (31 downto 0) := x"48800000";
	constant const1_ft : std_logic_vector (31 downto 0) := x"3F800000";
	constant const25_ft : std_logic_vector (31 downto 0) := x"41C80000";
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
    else
      case (state) is
        when idle =>
          if (i_run = '1') then
            state := s0;
            i2c_mem_ena <= '1';
            i2c_mem_addra <= std_logic_vector (to_unsigned (50*2+0, 12)); -- ee2432 MSB kvptat,ktptat-6/10
          else
            state := idle;
            i2c_mem_ena <= '0';
          end if;
          fixed2floatsclr <= '0';
          addfpsclr <= '0';
          subfpsclr <= '0';
          mulfpsclr <= '0';
          divfpsclr <= '0';
        when s0 => state := s1;
          i2c_mem_addra <= std_logic_vector (to_unsigned (50*2+1, 12)); -- ee2432 LSB kvptat,ktptat-6/10
        when s1 => state := s1a;
          ee2432 (15 downto 8) <= i2c_mem_douta;
          i2c_mem_addra <= std_logic_vector (to_unsigned (49*2+0, 12)); -- ee2431 MSB vptat25
        when s1a => state := s1b;
          ee2432 (7 downto 0) <= i2c_mem_douta;
          i2c_mem_addra <= std_logic_vector (to_unsigned (49*2+1, 12)); -- ee2431 LSB vptat25
        when s1b => state := s1c;
          ee2431 (15 downto 8) <= i2c_mem_douta;
          i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(800*2)+0, 12)); -- ram0720 MSB vptat
        when s1c => state := s1d;
          ee2431 (7 downto 0) <= i2c_mem_douta;
          i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(800*2)+1, 12)); -- ram0720 LSB vptat
        when s1d => state := s1e;
          ram0720 (15 downto 8) <= i2c_mem_douta;
          i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(768*2)+0, 12)); -- ram0700 MSB vbe
        when s1e => state := s1f;
          ram0720 (7 downto 0) <= i2c_mem_douta;
          i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(768*2)+1, 12)); -- ram0700 LSB vbe
        when s1f => state := s1g;
          ram0700 (15 downto 8) <= i2c_mem_douta;
          i2c_mem_addra <= std_logic_vector (to_unsigned (16*2+0, 12)); -- ee2410 MSB kptat
        when s1g => state := s1h;
          ram0700 (7 downto 0) <= i2c_mem_douta;
          i2c_mem_addra <= std_logic_vector (to_unsigned (16*2+1, 12)); -- ee2410 LSB kptat
        when s1h => state := s2;
          ee2410 (15 downto 8) <= i2c_mem_douta;
        when s2 =>
          ee2410 (7 downto 0) <= i2c_mem_douta;
          subfpce <= '1';
          subfpa <= i_Vdd;
          subfpb <= const3dot3_ft;
          subfpond <= '1';
          if (subfprdy = '1') then state := s6;
            -- XXX duplicate calculation
            subfpce <= '0';
            subfpond <= '0';
            subfpsclr <= '1';
            report_error("================ CalculateTa deltaV", subfpr, 0.0);
          else state := s2; end if;
        when s6 =>
          subfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <=
          ee2431 (15) & ee2431 (15) & 
          ee2431 (15) & ee2431 (15) & 
          ee2431 (15) & ee2431 (15) & 
          ee2431 (15) & ee2431 (15) & 
          ee2431 (15) & ee2431 (15) & 
          ee2431 (15) & ee2431 (15) & 
          ee2431 (15) & ee2431 (15) & 
          ee2431 (15) & ee2431 (15) & 
          ee2431 (15) & ee2431 (15) & 
          ee2431 (15) & ee2431 & "00000000000000000000000000000";
          if (fixed2floatrdy = '1') then state := s7;
            vptat25_ft := fixed2floatr;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            report_error("================ CalculateTa vptat25", vptat25_ft, 0.0);
          else state := s6; end if;
        when s7 => state := s8;
          fixed2floatsclr <= '0';
        when s8 =>
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <=
          ram0720 (15) & ram0720 (15) & 
          ram0720 (15) & ram0720 (15) & 
          ram0720 (15) & ram0720 (15) & 
          ram0720 (15) & ram0720 (15) & 
          ram0720 (15) & ram0720 (15) & 
          ram0720 (15) & ram0720 (15) & 
          ram0720 (15) & ram0720 (15) & 
          ram0720 (15) & ram0720 (15) & 
          ram0720 (15) & ram0720 (15) & 
          ram0720 (15) & ram0720 & "00000000000000000000000000000";
          if (fixed2floatrdy = '1') then state := s9;
            vptat_ft := fixed2floatr;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            report_error("================ CalculateTa vptat", vptat_ft, 0.0);
          else state := s8; end if;
        when s9 => state := s10;
          fixed2floatsclr <= '0';
        when s10 =>
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <=
          ram0700 (15) & ram0700 (15) & 
          ram0700 (15) & ram0700 (15) & 
          ram0700 (15) & ram0700 (15) & 
          ram0700 (15) & ram0700 (15) & 
          ram0700 (15) & ram0700 (15) & 
          ram0700 (15) & ram0700 (15) & 
          ram0700 (15) & ram0700 (15) & 
          ram0700 (15) & ram0700 (15) & 
          ram0700 (15) & ram0700 (15) & 
          ram0700 (15) & ram0700 & "00000000000000000000000000000";
          if (fixed2floatrdy = '1') then state := s12;
            vbe_ft := fixed2floatr;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            report_error("================ CalculateTa vbe", vbe_ft, 0.0);
          else state := s10; end if;
        when s12 =>
          fixed2floatsclr <= '0';
          -- vptat*alphaptat
          mulfpce <= '1';
          mulfpa <= vptat_ft;
          mulfpb <= ExtractAlphaPtatParameter_alphaptat;
          mulfpond <= '1';
          report_error("================ CalculateTa alphaptat", ExtractAlphaPtatParameter_alphaptat, 0.0);
          if (mulfprdy = '1') then state := s14;
            fttmp2 := mulfpr; -- vptat*alphaptat
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
          else state := s12; end if;
        when s14 =>
          mulfpsclr <= '0';
          -- vptat*alphaptat+vbe
          addfpce <= '1';
          addfpa <= fttmp2;
          addfpb <= vbe_ft;
          addfpond <= '1';
          if (addfprdy = '1') then state := s16;
            fttmp2 := addfpr; -- vptat*alphaptat+vbe
            addfpce <= '0';
            addfpond <= '0';
            addfpsclr <= '1';
          else state := s14; end if;
        when s16 =>
          addfpsclr <= '0';
          -- vptat/(vptat*alphaptat+vbe)
          divfpce <= '1';
          divfpa <= vptat_ft;
          divfpb <= fttmp2;
          divfpond <= '1';
          if (divfprdy = '1') then state := s18;
            fttmp2 := divfpr; -- vptat/(vptat*alphaptat+vbe)
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
          else state := s16; end if;
        when s18 =>
          divfpsclr <= '0';
          -- vptat/(vptat*alphaptat+vbe)*2^18
          mulfpce <= '1';
          mulfpa <= fttmp2;
          mulfpb <= const2pow18_ft;
          mulfpond <= '1';
          if (mulfprdy = '1') then state := s19;
            vptatart := mulfpr; -- vptatart =  (vptat/(vptat*alphaptat+vbe))*2^18
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
          else state := s18; end if;
        when s19 => state := s20;
          mulfpsclr <= '0';
        when s20 =>
          -- kvptat*deltaV
          mulfpce <= '1';
          mulfpa <= ExtractKvPTATParameter_kvptat;
          mulfpb <= subfpr; -- XXX deltaV = Vdd - 3.3 
          mulfpond <= '1';
          report_error("================ CalculateTa ExtractKvPTATParameter_kvptat", ExtractKvPTATParameter_kvptat, 0.0);
          if (mulfprdy = '1') then state := s22;
            fttmp1 := mulfpr; -- kvptat*deltaV
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
            report_error("================ CalculateTa 1", fttmp1, 0.0);
          else state := s20; end if;
        when s22 =>
          mulfpsclr <= '0';
          -- 1+kvptat*deltaV
          addfpce <= '1';
          addfpa <= const1_ft;
          addfpb <= fttmp1;
          addfpond <= '1';
          if (addfprdy = '1') then state := s24;
            fttmp1 := addfpr; -- 1+kvptat*deltaV
            addfpce <= '0';
            addfpond <= '0';
            addfpsclr <= '1';
            report_error("================ CalculateTa 2", fttmp1, 0.0);
          else state := s22; end if;
        when s24 =>
          addfpsclr <= '0';
          -- vptatart/(1+kvptat*deltaV)
          divfpce <= '1';
          divfpa <= vptatart;
          divfpb <= fttmp1;
          divfpond <= '1';
          if (divfprdy = '1') then state := s26;
            fttmp1 := divfpr; -- vptatart/(1+kvptat*deltaV)
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
            report_error("================ CalculateTa 3", fttmp1, 0.0);
          else state := s24; end if;
        when s26 =>
          divfpsclr <= '0';
          -- (vptatart/(1+kvptat*deltaV))-vptat25
          subfpce <= '1';
          subfpa <= fttmp1;
          subfpb <= vptat25_ft;
          subfpond <= '1';
          if (subfprdy = '1') then state := s28;
            fttmp1 := subfpr; -- (vptatart/(1+kvptat*deltaV))-vptat25
            subfpce <= '0';
            subfpond <= '0';
            subfpsclr <= '1';
            report_error("================ CalculateTa 4", fttmp1, 0.0);
          else state := s26; end if;
        when s28 =>
          subfpsclr <= '0';
          -- ((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat
          divfpce <= '1';
          divfpa <= fttmp1;
          divfpb <= ExtractKtPTATParameter_ktptat;
          divfpond <= '1';
          report_error("================ CalculateTa ExtractKtPTATParameter_ktptat", ExtractKtPTATParameter_ktptat, 0.0);
          if (divfprdy = '1') then state := s30;
            fttmp1 := divfpr; -- ((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
            report_error("================ CalculateTa 5", fttmp1, 0.0);
          else state := s28; end if;
        when s30 =>
          divfpsclr <= '0';
          -- (((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat)+25
          addfpce <= '1';
          addfpa <= fttmp1;
          addfpb <= const25_ft;
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

ExtractKvPTATParameter_clock <= i_clock;
ExtractKvPTATParameter_reset <= i_reset;
ExtractKvPTATParameter_ee0x2432 <= ee2432;
inst_ExtractKvPTATParameter : ExtractKvPTATParameter PORT MAP (
i_clock => ExtractKvPTATParameter_clock,
i_reset => ExtractKvPTATParameter_reset,
i_ee0x2432 => ExtractKvPTATParameter_ee0x2432,
o_kvptat => ExtractKvPTATParameter_kvptat
);

ExtractKtPTATParameter_clock <= i_clock;
ExtractKtPTATParameter_reset <= i_reset;
ExtractKtPTATParameter_ee0x2432 <= ee2432;
inst_ExtractKtPTATParameter : ExtractKtPTATParameter PORT MAP (
i_clock => ExtractKtPTATParameter_clock,
i_reset => ExtractKtPTATParameter_reset,
i_ee0x2432 => ExtractKtPTATParameter_ee0x2432,
o_ktptat => ExtractKtPTATParameter_ktptat
);

ExtractAlphaPtatParameter_clock <= i_clock;
ExtractAlphaPtatParameter_reset <= i_reset;
ExtractAlphaPtatParameter_ee0x2410 <= ee2410;
inst_ExtractAlphaPtatParameter : ExtractAlphaPtatParameter
port map (
i_clock => ExtractAlphaPtatParameter_clock,
i_reset => ExtractAlphaPtatParameter_reset,
i_ee0x2410 => ExtractAlphaPtatParameter_ee0x2410,
o_alphaptat => ExtractAlphaPtatParameter_alphaptat
);

end Behavioral;

