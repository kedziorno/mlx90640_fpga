----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:19 09/28/2024 
-- Design Name: 
-- Module Name:    fp_mux - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package1.all;

entity fp_mux is
port (
i_clock : in std_logic;
i_reset : in std_logic;
a : out std_logic_vector (31 downto 0);
b : out std_logic_vector (31 downto 0);
a63 : out std_logic_vector (63 downto 0);
ce : out std_logic;
sclr : out std_logic;
ond : out std_logic;
rfd : in std_logic;
rdy : in std_logic;
r : in std_logic_vector (31 downto 0);
t : out t_fpop;

fixed2floata : in STD_LOGIC_VECTOR(63 DOWNTO 0);
fixed2floatond : in STD_LOGIC;
fixed2floatsclr : in STD_LOGIC;
fixed2floatce : in STD_LOGIC;
fixed2floatr : out STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : out STD_LOGIC;

divfpa : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : in STD_LOGIC;
divfpsclr : in STD_LOGIC;
divfpce : in STD_LOGIC;
divfpr : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : out STD_LOGIC;

mulfpa : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : in STD_LOGIC;
mulfpsclr : in STD_LOGIC;
mulfpce : in STD_LOGIC;
mulfpr : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : out STD_LOGIC;

addfpa : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : in STD_LOGIC;
addfpsclr : in STD_LOGIC;
addfpce : in STD_LOGIC;
addfpr : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : out STD_LOGIC;

subfpa : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : in STD_LOGIC;
subfpsclr : in STD_LOGIC;
subfpce : in STD_LOGIC;
subfpr : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : out STD_LOGIC;

sqrtfp2a : in STD_LOGIC_VECTOR(31 DOWNTO 0);
sqrtfp2ond : in STD_LOGIC;
sqrtfp2sclr : in STD_LOGIC;
sqrtfp2ce : in STD_LOGIC;
sqrtfp2r : out STD_LOGIC_VECTOR(31 DOWNTO 0);
sqrtfp2rdy : out STD_LOGIC

);
end entity fp_mux;

architecture Behavioral of fp_mux is

signal s : std_logic_vector (5 downto 0);
signal rdy_prev1,rdy_prev2 : std_logic;
signal addfpce_prev,subfpce_prev,mulfpce_prev,divfpce_prev,sqrtfp2ce_prev,fixed2floatce_prev : std_logic;

signal t1 : t_fpop;

begin

t <= t1;

p1 : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      sclr <= '1';
    else
      sclr <= '0';
      if (addfpce = '0' and t1 = c_fpadd) then
        sclr <= addfpsclr;
      elsif (subfpce = '0' and t1 = c_fpsub) then
        sclr <= subfpsclr;
      elsif (mulfpce = '0' and t1 = c_fpmul) then
        sclr <= mulfpsclr;
      elsif (divfpce = '0' and t1 = c_fpdiv) then
        sclr <= divfpsclr;
      elsif (sqrtfp2ce = '0' and t1 = c_fpsqrt) then
        sclr <= sqrtfp2sclr;
      elsif (fixed2floatce = '0' and t1 = c_fpfi2fl) then
        sclr <= fixed2floatsclr;
      end if;
    end if;
  end if;
end process p1;

p0 : process (i_clock) is
  variable s : std_logic_vector (5 downto 0);
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      t1 <= (others => '0');
      s := (others => '0');
      a <= (others => '0');
      b <= (others => '0');
      ond <= '0';
--      sclr <= '0';
      ce <= '0';
      addfpr <= (others => '0');
      addfprdy <= '0';
      subfpr <= (others => '0');
      subfprdy <= '0';
      mulfpr <= (others => '0');
      mulfprdy <= '0';
      divfpr <= (others => '0');
      divfprdy <= '0';
      sqrtfp2r <= (others => '0');
      sqrtfp2rdy <= '0';
      fixed2floatr <= (others => '0');
      fixed2floatrdy <= '0';
    else
      s := addfpce & subfpce & mulfpce & divfpce & sqrtfp2ce & fixed2floatce;
      case (s) is
        when "100000" =>
          a <= addfpa;
          b <= addfpb;
          ond <= addfpond;
--          sclr <= addfpsclr;
          addfpr <= r;
          addfprdy <= rdy;
          t1 <= c_fpadd;
          ce <= addfpce;
        when "010000" =>
          a <= subfpa;
          b <= subfpb;
          ond <= subfpond;
--          sclr <= subfpsclr;
          subfpr <= r;
          subfprdy <= rdy;
          t1 <= c_fpsub;
          ce <= subfpce;
        when "001000" =>
          a <= mulfpa;
          b <= mulfpb;
          ond <= mulfpond;
--          sclr <= mulfpsclr;
          mulfpr <= r;
          mulfprdy <= rdy;
          t1 <= c_fpmul;
          ce <= mulfpce;
        when "000100" =>
          a <= divfpa;
          b <= divfpb;
          ond <= divfpond;
--          sclr <= divfpsclr;
          divfpr <= r;
          divfprdy <= rdy;
          t1 <= c_fpdiv;
          ce <= divfpce;
        when "000010" =>
          a <= sqrtfp2a;
          ond <= sqrtfp2ond;
--          sclr <= sqrtfp2sclr;
          sqrtfp2r <= r;
          sqrtfp2rdy <= rdy;
          t1 <= c_fpsqrt;
          ce <= sqrtfp2ce;
        when "000001" =>
          a63 <= fixed2floata;
          ond <= fixed2floatond;
--          sclr <= fixed2floatsclr;
          fixed2floatr <= r;
          fixed2floatrdy <= rdy;
          t1 <= c_fpfi2fl;
          ce <= fixed2floatce;
        when others =>
          a <= (others => '0');
          b <= (others => '0');
          a63 <= (others => '0');
          ond <= '0';
--          sclr <= '0';
          t1 <= (others => '0');
          ce <= '0';
          addfpr <= (others => '0');
          addfprdy <= '0';
          subfpr <= (others => '0');
          subfprdy <= '0';
          mulfpr <= (others => '0');
          mulfprdy <= '0';
          divfpr <= (others => '0');
          divfprdy <= '0';
          sqrtfp2r <= (others => '0');
          sqrtfp2rdy <= '0';
          fixed2floatr <= (others => '0');
          fixed2floatrdy <= '0';
      end case;
    end if;
  end if;
end process p0;

--
--p3 : process (i_clock) is
--begin
--  if (rising_edge (i_clock)) then
--    addfpce_prev <= addfpce;
--    subfpce_prev <= subfpce;
--    mulfpce_prev <= mulfpce;
--    divfpce_prev <= divfpce;
--    sqrtfp2ce_prev <= sqrtfp2ce;
--    fixed2floatce_prev <= fixed2floatce;
--  end if;
--end process p3;
--
--p2 : process (i_clock) is
--begin
--  if (rising_edge (i_clock)) then
--    rdy_prev2 <= rdy_prev1;
--    rdy_prev1 <= rdy;
--  end if;
--end process p2;
--
--p1 : process (
--addfpce,subfpce,mulfpce,divfpce,sqrtfp2ce,fixed2floatce,
--addfpsclr,subfpsclr,mulfpsclr,divfpsclr,sqrtfp2sclr,fixed2floatsclr,
----addfprdy,subfprdy,mulfprdy,divfprdy,sqrtfp2rdy,fixed2floatrdy
--t1
--) is
--begin
--  if (i_reset = '1') then
--    sclr <= '1';
--  else
--    sclr <= '0';
--    if (addfpce = '0' and t1 = "000001") then
--      sclr <= addfpsclr;
--    elsif (subfpce = '0' and t1 = "000010") then
--      sclr <= subfpsclr;
--    elsif (mulfpce = '0' and t1 = "000100") then
--      sclr <= mulfpsclr;
--    elsif (divfpce = '0' and t1 = "001000") then
--      sclr <= divfpsclr;
--    elsif (sqrtfp2ce = '0' and t1 = "010000") then
--      sclr <= sqrtfp2sclr;
--    elsif (fixed2floatce = '0' and t1 = "100000") then
--      sclr <= fixed2floatsclr;
--    end if;
--  end if;
--end process p1;
--
--t <= t1;
--
--p0 : process (
----s,
--addfpce,subfpce,mulfpce,divfpce,sqrtfp2ce,fixed2floatce,
--addfpa,subfpa,mulfpa,divfpa,sqrtfp2a,fixed2floata,
--addfpb,subfpb,mulfpb,divfpb,
--addfpond,subfpond,mulfpond,divfpond,sqrtfp2ond,fixed2floatond,
--r,rdy
--) is
--begin
--  a <= (others => '0');
--  b <= (others => '0');
--  ond <= '0';
--  --r <= (others => '0');
--  --rdy <= '0';
--  --t1 <= (others => '0');
--  ce <= '0';
--  if (addfpce = '1') then
--    a <= addfpa;
--    b <= addfpb;
--    a63 <= (others => '0');
--    ond <= addfpond;
--    addfpr <= r;
--    addfprdy <= rdy;
--    t1 <= "000001";
--    ce <= addfpce;
--  elsif (subfpce = '1') then
--    a <= subfpa;
--    b <= subfpb;
--    a63 <= (others => '0');
--    ond <= subfpond;
--    subfpr <= r;
--    subfprdy <= rdy;
--    t1 <= "000010";
--    ce <= subfpce;
--  elsif (mulfpce = '1') then
--    a <= mulfpa;
--    b <= mulfpb;
--    a63 <= (others => '0');
--    ond <= mulfpond;
--    mulfpr <= r;
--    mulfprdy <= rdy;
--    t1 <= "000100";
--    ce <= mulfpce;
--  elsif (divfpce = '1') then
--    a <= divfpa;
--    b <= divfpb;
--    a63 <= (others => '0');
--    ond <= divfpond;
--    divfpr <= r;
--    divfprdy <= rdy;
--    t1 <= "001000";
--    ce <= divfpce;
--  elsif (sqrtfp2ce = '1') then
--    a <= sqrtfp2a;
--    a63 <= (others => '0');
--    ond <= sqrtfp2ond;
--    sqrtfp2r <= r;
--    sqrtfp2rdy <= rdy;
--    t1 <= "010000";
--    ce <= sqrtfp2ce;
--  elsif (fixed2floatce = '1') then
--    a <= (others => '0');
--    a63 <= fixed2floata;
--    ond <= fixed2floatond;
--    fixed2floatr <= r;
--    fixed2floatrdy <= rdy;
--    t1 <= "100000";
--    ce <= fixed2floatce;
--  end if;
----  case (s) is
----    when "100000" =>
----      a <= addfpa;
----      b <= addfpb;
----      ond <= addfpond;
----      sclr <= addfpsclr;
----      addfpr <= r;
----      addfprdy <= rdy;
----      t <= "000001";
----      ce <= addfpce;
----    when "010000" =>
----      a <= subfpa;
----      b <= subfpb;
----      ond <= subfpond;
----      sclr <= subfpsclr;
----      subfpr <= r;
----      subfprdy <= rdy;
----      t <= "000010";
----      ce <= subfpce;
----    when "001000" =>
----      a <= mulfpa;
----      b <= mulfpb;
----      ond <= mulfpond;
----      sclr <= mulfpsclr;
----      mulfpr <= r;
----      mulfprdy <= rdy;
----      t <= "000100";
----      ce <= mulfpce;
----    when "000100" =>
----      a <= divfpa;
----      b <= divfpb;
----      ond <= divfpond;
----      sclr <= divfpsclr;
----      divfpr <= r;
----      divfprdy <= rdy;
----      t <= "001000";
----      ce <= divfpce;
----    when "000010" =>
----      a <= sqrtfp2a;
----      ond <= sqrtfp2ond;
----      sclr <= sqrtfp2sclr;
----      sqrtfp2r <= r;
----      sqrtfp2rdy <= rdy;
----      t <= "010000";
----      ce <= sqrtfp2ce;
----    when others =>
----      a <= fixed2floata;
----      ond <= fixed2floatond;
----      sclr <= fixed2floatsclr;
----      fixed2floatr <= r;
----      fixed2floatrdy <= rdy;
----      t <= "100000";
----      ce <= fixed2floatce;
----  end case;
--end process p0;

end architecture Behavioral;
