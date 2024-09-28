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

entity fp_mux is
port (
i_clock : in std_logic;
i_reset : in std_logic;
a : out std_logic_vector (31 downto 0);
b : out std_logic_vector (31 downto 0);
ce : out std_logic;
sclr : out std_logic;
ond : out std_logic;
r : in std_logic_vector (31 downto 0);
rdy : in std_logic;
t : out std_logic_vector (5 downto 0);

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

--signal s : std_logic_vector (5 downto 0);

architecture Behavioral of fp_mux is

begin

--s <= addfpce & subfpce & mulfpce & divfpce & sqrtfp2ce & fixed2floatce;

p0 : process (
--s,
addfpce,subfpce,mulfpce,divfpce,sqrtfp2ce,fixed2floatce,
addfpa,subfpa,mulfpa,divfpa,sqrtfp2a,fixed2floata,
addfpb,subfpb,mulfpb,divfpb,
addfpond,subfpond,mulfpond,divfpond,sqrtfp2ond,fixed2floatond,
addfpsclr,subfpsclr,mulfpsclr,divfpsclr,sqrtfp2sclr,fixed2floatsclr,
r,rdy
) is
begin
  a <= (others => '0');
  b <= (others => '0');
  ond <= '0';
  sclr <= '0';
  addfpr <= (others => '0');
  addfprdy <= '0';
  t <= (others => '0');
  ce <= '0';
--  case (s) is
--    when "100000" =>
--      a <= addfpa;
--      b <= addfpb;
--      ond <= addfpond;
--      sclr <= addfpsclr;
--      addfpr <= r;
--      addfprdy <= rdy;
--      t <= "000001";
--      ce <= addfpce;
--    when "010000" =>
--      a <= subfpa;
--      b <= subfpb;
--      ond <= subfpond;
--      sclr <= subfpsclr;
--      subfpr <= r;
--      subfprdy <= rdy;
--      t <= "000010";
--      ce <= subfpce;
--    when "001000" =>
--      a <= mulfpa;
--      b <= mulfpb;
--      ond <= mulfpond;
--      sclr <= mulfpsclr;
--      mulfpr <= r;
--      mulfprdy <= rdy;
--      t <= "000100";
--      ce <= mulfpce;
--    when "000100" =>
--      a <= divfpa;
--      b <= divfpb;
--      ond <= divfpond;
--      sclr <= divfpsclr;
--      divfpr <= r;
--      divfprdy <= rdy;
--      t <= "001000";
--      ce <= divfpce;
--    when "000010" =>
--      a <= sqrtfp2a;
--      ond <= sqrtfp2ond;
--      sclr <= sqrtfp2sclr;
--      sqrtfp2r <= r;
--      sqrtfp2rdy <= rdy;
--      t <= "010000";
--      ce <= sqrtfp2ce;
--    when others =>
--      a <= fixed2floata;
--      ond <= fixed2floatond;
--      sclr <= fixed2floatsclr;
--      fixed2floatr <= r;
--      fixed2floatrdy <= rdy;
--      t <= "100000";
--      ce <= fixed2floatce;
--  end case;
  if (addfpce = '1') then
    a <= addfpa;
    b <= addfpb;
    ond <= addfpond;
    sclr <= addfpsclr;
    addfpr <= r;
    addfprdy <= rdy;
    t <= "000001";
    ce <= addfpce;
  end if;
  if (subfpce = '1') then
    a <= subfpa;
    b <= subfpb;
    ond <= subfpond;
    sclr <= subfpsclr;
    subfpr <= r;
    subfprdy <= rdy;
    t <= "000010";
    ce <= subfpce;
  end if;
  if (mulfpce = '1') then
    a <= mulfpa;
    b <= mulfpb;
    ond <= mulfpond;
    sclr <= mulfpsclr;
    mulfpr <= r;
    mulfprdy <= rdy;
    t <= "000100";
    ce <= mulfpce;
  end if;
  if (divfpce = '1') then
    a <= divfpa;
    b <= divfpb;
    ond <= divfpond;
    sclr <= divfpsclr;
    divfpr <= r;
    divfprdy <= rdy;
    t <= "001000";
    ce <= divfpce;
  end if;
  if (sqrtfp2ce = '1') then
    a <= sqrtfp2a;
    ond <= sqrtfp2ond;
    sclr <= sqrtfp2sclr;
    sqrtfp2r <= r;
    sqrtfp2rdy <= rdy;
    t <= "010000";
    ce <= sqrtfp2ce;
  end if;
  if (fixed2floatce = '1') then
    a <= fixed2floata;
    ond <= fixed2floatond;
    sclr <= fixed2floatsclr;
    fixed2floatr <= r;
    fixed2floatrdy <= rdy;
    t <= "100000";
    ce <= fixed2floatce;
  end if;
end process p0;

end architecture Behavioral;
