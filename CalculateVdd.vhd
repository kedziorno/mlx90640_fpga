----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:35 02/02/2023 
-- Design Name: 
-- Module Name:    calculateVdd - Behavioral 
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

entity CalculateVdd is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_Vdd : out std_logic_vector (31 downto 0); -- output Vdd
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
end CalculateVdd;

architecture Behavioral of CalculateVdd is

--COMPONENT ExtractVDDParameters
--PORT(
--i_clock : IN  std_logic;
--i_reset : IN  std_logic;
--i_run : in std_logic;
--i2c_mem_ena : out STD_LOGIC;
--i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
--i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
--o_kvdd : OUT  std_logic_vector (31 downto 0);
--o_vdd25 : OUT  std_logic_vector (31 downto 0);
--o_rdy : out std_logic
--);
--END COMPONENT;
--signal ExtractVDDParameters_clock : std_logic;
--signal ExtractVDDParameters_reset : std_logic;
--signal ExtractVDDParameters_run : std_logic;
--signal ExtractVDDParameters_i2c_mem_ena : STD_LOGIC;
--signal ExtractVDDParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
--signal ExtractVDDParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
--signal ExtractVDDParameters_kvdd : std_logic_vector(31 downto 0);
--signal ExtractVDDParameters_vdd25 : std_logic_vector(31 downto 0);
--signal ExtractVDDParameters_rdy : std_logic;

signal out_resolutionee,out_resolutionreg : std_logic_vector (31 downto 0);
signal resolutionee,resolutionreg : std_logic_vector (1 downto 0);

signal i2c_mem_ena_internal : std_logic;
signal i2c_mem_addra_internal : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta_internal : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

i2c_mem_ena <= i2c_mem_ena_internal;
i2c_mem_addra <= i2c_mem_addra_internal;
i2c_mem_douta_internal <= i2c_mem_douta;

p0 : process (i_clock) is
	type states is (idle,
  s2,s4,s5,s9,s10,
  s11,s12,s13,s14,s14a,s15,s16,s17,s18,s19,
  s20,s21,s22,s23);
  variable state : states;
	constant const3dot3_ft : std_logic_vector (31 downto 0) := x"40533333";
	constant const2pow5_ft : std_logic_vector (31 downto 0) := x"42000000";
	constant const2pow13_ft : std_logic_vector (31 downto 0) := x"46000000";
	constant const256_ft : std_logic_vector (31 downto 0) := x"43800000";
	variable ram : std_logic_vector (7 downto 0); -- XXX ram072a
	constant resreg : std_logic_vector (15 downto 0) := x"1901" and x"0c00";
begin
	if (rising_edge (i_clock)) then
	if (i_reset = '1') then
		state := idle;
		fixed2floatsclr <= '1';
		addfpsclr <= '1';
		subfpsclr <= '1';
		mulfpsclr <= '1';
		divfpsclr <= '1';
		o_Vdd <= (others => '0');
		o_rdy <= '0';
		i2c_mem_ena_internal <= '0';
		i2c_mem_addra_internal <= (others => '0');
	else
	case (state) is
	when idle =>
		if (i_run = '1') then
			state := s2;
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
    fixed2floatsclr <= '0';
	when s2 => state := s4;
    i2c_mem_addra_internal <= std_logic_vector (to_unsigned (56*2+0, 12)); -- 2438 MSB resolutionee 2bit & 3000
	when s4 => state := s5;
    resolutionreg <= resreg (11 downto 10);
	when s5 => state := s9;
		resolutionee <= i2c_mem_douta_internal (5 downto 4);
	when s9 =>
		-- resolutioncorr
		divfpce <= '1';
		divfpa <= out_resolutionee;
		divfpb <= out_resolutionreg;
		divfpond <= '1';
		if (divfprdy = '1') then state := s10;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s9; end if;
	when s10 => state := s11;
		divfpsclr <= '0';
		i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(810*2)+0, 12)); -- ram MSB
	when s11 => state := s12;
		i2c_mem_addra_internal <= std_logic_vector (to_unsigned (1664+(810*2)+1, 12)); -- ram LSB
	when s12 => state := s13;
		ram (7 downto 0) := i2c_mem_douta_internal;		
	when s13 =>
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <=
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
    if (fixed2floatrdy = '1') then state := s14;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s13; end if;
	when s14 =>
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= divfpr; -- resolutioncorr
		mulfpb <= fixed2floatr; -- ram[0x072a]
		mulfpond <= '1';
    i2c_mem_addra_internal <= std_logic_vector (to_unsigned (51*2+1, 12)); -- 2433 LSB vdd25
		if (mulfprdy = '1') then state := s14a; -- res_corr * ram072a
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
    else state := s14; end if;
  when s14a => -- XXX empty state
    mulfpsclr <= '0';
    addfpce <= '1';
		addfpa <= mulfpr;
		addfpb <= x"00000000";
		addfpond <= '1';
    if (addfprdy = '1') then state := s15;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
    else state := s14a; end if;
  when s15 =>
    addfpsclr <= '0';
    fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= -- XXX vdd25
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
		i2c_mem_douta_internal (7) & i2c_mem_douta_internal & "00000000000000000000000000000";
    if (fixed2floatrdy = '1') then state := s16;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s15; end if;
  when s16 =>
    fixed2floatsclr <= '0';
    mulfpce <= '1';
		mulfpa <= fixed2floatr;
		mulfpb <= const2pow5_ft;
		mulfpond <= '1';
		if (mulfprdy = '1') then state := s17;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s16; end if;
	when s17 =>
		mulfpsclr <= '0';
    subfpce <= '1';
		subfpa <= mulfpr;
		subfpb <= const2pow13_ft;
		subfpond <= '1';
		if (subfprdy = '1') then state := s18; -- vdd25
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s17; end if;
	when s18 => state := s19;
		subfpsclr <= '0';
  when s19 =>
		subfpce <= '1';
		subfpa <= addfpr; -- s14a
		subfpb <= subfpr; -- vdd25
		subfpond <= '1';
		if (subfprdy = '1') then state := s20;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
      i2c_mem_addra_internal <= std_logic_vector (to_unsigned (51*2+0, 12)); -- 2433 MSB kvdd
		else state := s19; end if;
  when s20 =>
		subfpsclr <= '0';
    fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= -- XXX kvdd
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
		i2c_mem_douta_internal (7) & i2c_mem_douta_internal & "00000000000000000000000000000";
    if (fixed2floatrdy = '1') then state := s21;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s20; end if;
  when s21 =>
    fixed2floatsclr <= '0';
    mulfpce <= '1';
		mulfpa <= fixed2floatr; -- kvdd
		mulfpb <= const2pow5_ft;
		mulfpond <= '1';
		if (mulfprdy = '1') then state := s22;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s21; end if;
	when s22 =>
		mulfpsclr <= '0';
		divfpce <= '1';
		divfpa <= subfpr;
		divfpb <= mulfpr; -- kvdd
		divfpond <= '1';
		if (divfprdy = '1') then state := s23;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s21; end if;
	when s23 =>
		divfpsclr <= '0';
		addfpce <= '1';
		addfpa <= divfpr;
		addfpb <= const3dot3_ft;
		addfpond <= '1';
		if (addfprdy = '1') then state := idle;
      o_rdy <= '1';
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
      o_Vdd <= addfpr;
      --synthesis translate_off
      report_error("================ CalculateVdd o_Vdd", addfpr, 0.0);
      --synthesis translate_on
		else state := s23; end if;
	end case;
end if;
end if;
end process p0;

-- 0-3 2^x - EE[0x2438] & 0x3000 - resolutionee
-- 0-3 2^x - RAM[0x800d] & 0x0c00 - resolutionreg
with resolutionee select out_resolutionee <=
x"3f800000" when "00", x"40000000" when "01", x"40800000" when "10", x"41000000" when "11",
x"00000000" when others;
with resolutionreg select out_resolutionreg <=
x"3f800000" when "00", x"40000000" when "01", x"40800000" when "10", x"41000000" when "11",
x"00000000" when others;

end architecture Behavioral;
