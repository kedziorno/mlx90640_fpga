----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:27:19 06/09/2023 
-- Design Name: 
-- Module Name:    CalculateVDD_process_p0 - Behavioral 
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

entity CalculateVDD_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

o_Vdd : out std_logic_vector (31 downto 0); -- output Vdd
o_rdy : out std_logic;

ExtractVDDParameters_run : out std_logic;
ExtractVDDParameters_mux : out std_logic;
ExtractVDDParameters_rdy : in std_logic;

ExtractVDDParameters_kvdd : in std_logic_vector (31 downto 0);
ExtractVDDParameters_vdd25 : in std_logic_vector (31 downto 0);

out_resolutionee,out_resolutionreg : out std_logic_vector (1 downto 0);
in_resolutionee,in_resolutionreg : in std_logic_vector (31 downto 0);

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

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
end CalculateVDD_process_p0;

architecture Behavioral of CalculateVDD_process_p0 is

signal i2c_mem_ena_internal : STD_LOGIC;
signal i2c_mem_addra_internal : STD_LOGIC_VECTOR (11 DOWNTO 0);
signal i2c_mem_douta_internal : STD_LOGIC_VECTOR (7 DOWNTO 0);

signal divfp_wait : integer range 0 to C_DIVFP_WAIT-1;
signal addfp_wait : integer range 0 to C_ADDFP_WAIT-1;
signal mulfp_wait : integer range 0 to C_MULFP_WAIT-1;
signal subfp_wait : integer range 0 to C_SUBFP_WAIT-1;
signal fi2fl_wait : integer range 0 to C_FI2FL_WAIT-1;
signal divfp_run,divfp_rdy : std_logic;
signal addfp_run,addfp_rdy : std_logic;
signal mulfp_run,mulfp_rdy : std_logic;
signal subfp_run,subfp_rdy : std_logic;
signal fi2fl_run,fi2fl_rdy : std_logic;

begin

i2c_mem_ena <= i2c_mem_ena_internal;
i2c_mem_addra <= i2c_mem_addra_internal;
i2c_mem_douta_internal <= i2c_mem_douta;

p1_counter_divfp : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      divfp_wait <= 0;
    elsif (divfp_rdy = '1') then
      divfp_wait <= 0;
    elsif (divfp_run = '1') then
      divfp_wait <= divfp_wait + 1;
    end if;
  end if;
end process p1_counter_divfp;

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

p1_counter_fi2fl : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      fi2fl_wait <= 0;
    elsif (fi2fl_rdy = '1') then
      fi2fl_wait <= 0;
    elsif (fi2fl_run = '1') then
      fi2fl_wait <= fi2fl_wait + 1;
    end if;
  end if;
end process p1_counter_fi2fl;

p0 : process (i_clock) is
	variable fttmp1,fttmp2 : std_logic_vector (31 downto 0);
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7a,s9,s10,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,
	ending);
	variable state : states;
	constant const3dot3_ft : std_logic_vector (31 downto 0) := x"40533333";
	variable ram072a : std_logic_vector (15 downto 0);
	constant resreg : std_logic_vector (15 downto 0) := x"1901" and x"0c00"; -- XXX request ram800d & 0c00 resolutionreg 2bit or constant
begin
	if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      state := idle;
      fixed2floatsclr <= '1';
      addfpsclr <= '1';
      subfpsclr <= '1';
      mulfpsclr <= '1';
      divfpsclr <= '1';
  --		fixed2floata <= (others => '0');
  --		fixed2floatce <= '0';
  --		fixed2floatond <= '0';
  --		mulfpa <= (others => '0');
  --		mulfpb <= (others => '0');
  --		mulfpce <= '0';
  --		mulfpond <= '0';
  --		addfpa <= (others => '0');
  --		addfpb <= (others => '0');
  --		addfpce <= '0';
  --		addfpond <= '0';
  --		subfpce <= '0';
  --		subfpond <= '0';
  --		subfpa <= (others => '0');
  --		subfpb <= (others => '0');
  --		divfpce <= '0';
  --		divfpond <= '0';
  --		divfpa <= (others => '0');
  --		divfpb <= (others => '0');
      o_Vdd <= (others => '0');
      o_rdy <= '0';
      i2c_mem_ena_internal <= '0';
    divfp_run <= '0';
    divfp_rdy <= '0';
    mulfp_run <= '0';
    mulfp_rdy <= '0';
    addfp_run <= '0';
    addfp_rdy <= '0';
    subfp_run <= '0';
    subfp_rdy <= '0';
    fi2fl_run <= '0';
    fi2fl_rdy <= '0';
    else
      case (state) is
        when idle =>
          if (i_run = '1') then
            state := s1;
            i2c_mem_ena_internal <= '1';
          else
            state := idle;
            i2c_mem_ena_internal <= '0';
          end if;
          fixed2floatsclr <= '0';
          addfpsclr <= '0';
          subfpsclr <= '0';
          mulfpsclr <= '0';
          divfpsclr <= '0';
        when s1 => state := s2;
          ExtractVDDParameters_run <= '1';
          ExtractVDDParameters_mux <= '1';
        when s2 => 
          ExtractVDDParameters_run <= '0';
          if (ExtractVDDParameters_rdy = '1') then
            state := s3;
            ExtractVDDParameters_mux <= '0';
          else
            state := s2;
            ExtractVDDParameters_mux <= '1';
          end if;
        when s3 => state := s4;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (56*2+0, 12)); -- 2438 MSB resolutionee 2bit & 3000
        when s4 => state := s5;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1, 12)); -- XXX request ram800d & 0c00 resolutionreg 2bit or constant
        when s5 => state := s6;
          out_resolutionee <= i2c_mem_douta_internal (5 downto 4);
        when s6 => state := s7a;
          --  resolutionreg <= i2c_mem_douta_internal (3 downto 2); --0x0c00=0000 1100 0000 0000
          out_resolutionreg <= resreg (11 downto 10); -- XXX constant variable
        when s7a => state := s9;
          -- resolutioncorr
          divfpce <= '1';
          divfpa <= in_resolutionee;
          divfpb <= in_resolutionreg;
          divfpond <= '1';
        when s9 =>
if (divfp_wait = C_DIVFP_WAIT-1) then
fttmp1 := divfpr;
divfpce <= '0';
divfpond <= '0';
divfpsclr <= '1';
divfp_run <= '0';
divfp_rdy <= '1';
state := s10;
else
divfp_run <= '1';
state := s9;
end if;
--          if (divfprdy = '1') then state := s10;
--            fttmp1 := divfpr;
--            divfpce <= '0';
--            divfpond <= '0';
--            divfpsclr <= '1';
--          else state := s9; end if;
        when s10 => state := s11;
divfp_rdy <= '0';
          divfpsclr <= '0';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(810*2)+0, 12)); -- ram072a MSB
        when s11 => state := s12;
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(810*2)+1, 12)); -- ram072a LSB
        when s12 => state := s13;
          ram072a (15 downto 8) := i2c_mem_douta_internal;
        when s13 => state := s14;
          ram072a (7 downto 0) := i2c_mem_douta_internal;
        when s14 => state := s15;
          -- ram[0x072a]
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <=
          ram072a (15) & ram072a (15) & 
          ram072a (15) & ram072a (15) & 
          ram072a (15) & ram072a (15) & 
          ram072a (15) & ram072a (15) & 
          ram072a (15) & ram072a (15) & 
          ram072a (15) & ram072a (15) & 
          ram072a (15) & ram072a (15) & 
          ram072a (15) & ram072a (15) & 
          ram072a (15) & ram072a (15) & 
          ram072a (15) & ram072a & "00000000000000000000000000000";
        when s15 =>
if (fi2fl_wait = C_FI2FL_WAIT-1) then
fttmp2 := fixed2floatr;
fixed2floatce <= '0';
fixed2floatond <= '0';
fixed2floatsclr <= '1';
state := s16;
fi2fl_run <= '0';
fi2fl_rdy <= '1';
else
state := s15;
fi2fl_run <= '1';
end if;
--          if (fixed2floatrdy = '1') then state := s16;
--            fttmp2 := fixed2floatr;
--            fixed2floatce <= '0';
--            fixed2floatond <= '0';
--            fixed2floatsclr <= '1';
--          else state := s15; end if;
        when s16 => state := s17;
fi2fl_rdy <= '0';
          fixed2floatsclr <= '0';
          mulfpce <= '1';
          mulfpa <= fttmp1; -- resolutioncorr
          mulfpb <= fttmp2; -- ram[0x072a]
          mulfpond <= '1';
        when s17 =>
if (mulfp_wait = C_MULFP_WAIT-1) then
fttmp1 := mulfpr;
mulfpce <= '0';
mulfpond <= '0';
mulfpsclr <= '1';
mulfp_run <= '0';
mulfp_rdy <= '1';
state := s18;
else
mulfp_run <= '1';
state := s17;
end if;
--          if (mulfprdy = '1') then state := s18;
--            fttmp1 := mulfpr;
--            mulfpce <= '0';
--            mulfpond <= '0';
--            mulfpsclr <= '1';
--          else state := s17; end if;
        when s18 => state := s19;
mulfp_rdy <= '0';
          mulfpsclr <= '0';
          subfpce <= '1';
          subfpa <= fttmp1;
          subfpb <= ExtractVDDParameters_vdd25;
          subfpond <= '1';
        when s19 =>
if (subfp_wait = C_SUBFP_WAIT-1) then
fttmp1 := subfpr;
subfpce <= '0';
subfpond <= '0';
subfpsclr <= '1';
state := s20;
subfp_run <= '0';
subfp_rdy <= '1';
else
state := s19;
subfp_run <= '1';
end if;
--          if (subfprdy = '1') then state := s20;
--            fttmp1 := subfpr;
--            subfpce <= '0';
--            subfpond <= '0';
--            subfpsclr <= '1';
--          else state := s19; end if;
        when s20 => state := s21;
subfp_rdy <= '0';
          subfpsclr <= '0';
          divfpce <= '1';
          divfpa <= fttmp1;
          divfpb <= ExtractVDDParameters_kvdd;
          divfpond <= '1';
        when s21 =>
if (divfp_wait = C_DIVFP_WAIT-1) then
fttmp1 := divfpr;
divfpce <= '0';
divfpond <= '0';
divfpsclr <= '1';
state := s22;
divfp_run <= '0';
divfp_rdy <= '1';
else
state := s21;
divfp_run <= '1';
end if;
--          if (divfprdy = '1') then state := s22;
--            fttmp1 := divfpr;
--            divfpce <= '0';
--            divfpond <= '0';
--            divfpsclr <= '1';
--          else state := s21; end if;
        when s22 => state := s23;
divfp_rdy <= '0';
          divfpsclr <= '0';
          addfpce <= '1';
          addfpa <= fttmp1;
          addfpb <= const3dot3_ft;
          addfpond <= '1';
        when s23 =>
if (addfp_wait = C_ADDFP_WAIT-1) then
fttmp1 := addfpr;
addfpce <= '0';
addfpond <= '0';
addfpsclr <= '1';
state := ending;
addfp_run <= '0';
addfp_rdy <= '1';
else
state := s23;
addfp_run <= '1';
end if;
--          if (addfprdy = '1') then state := ending;
--            fttmp1 := addfpr;
--            addfpce <= '0';
--            addfpond <= '0';
--            addfpsclr <= '1';
--          else state := s23; end if;
        when ending => state := idle;
addfp_rdy <= '0';
          addfpsclr <= '0';
          o_Vdd <= fttmp1;
          report_error ("================ CalculateVdd o_Vdd : ",fttmp1,0.0);
          --  report "================ CalculateVdd o_Vdd : " & real'image (ap_slv2fp (fttmp1));
          --  report "================ CalculateVdd o_kvdd : " & real'image (ap_slv2fp (ExtractVDDParameters_kvdd));
          --  report "================ CalculateVdd o_vdd25 : " & real'image (ap_slv2fp (ExtractVDDParameters_vdd25));
          --  report "================ CalculateVdd o_ram0x072a : " & real'image (ap_slv2fp (fttmp2));
          o_rdy <= '1';
        when others => null;
      end case;
    end if;
  end if;
end process p0;

end Behavioral;

