----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:32:39 02/03/2023 
-- Design Name: 
-- Module Name:    calculateKGain - Behavioral 
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

use work.p_fphdl_package1.all;
--use work.p_fphdl_package2.all;
use work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calculateKGain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_KGain : out fd2ft;
o_rdy : out std_logic;

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
signal divfprdy : in STD_LOGIC

);
end calculateKGain;

architecture Behavioral of calculateKGain is

signal fixed2floata_internal : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond_internal : STD_LOGIC;
signal fixed2floatsclr_internal : STD_LOGIC;
signal fixed2floatce_internal : STD_LOGIC;
signal fixed2floatr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy_internal : STD_LOGIC;

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;

begin

fixed2floata <= fixed2floata_internal;
fixed2floatond <= fixed2floatond_internal;
fixed2floatsclr <= fixed2floatsclr_internal;
fixed2floatce <= fixed2floatce_internal;
fixed2floatr_internal <= fixed2floatr;
fixed2floatrdy_internal <= fixed2floatrdy;

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

p0 : process (i_clock) is
--	variable eeprom16slv,ram16slv : slv16;
--	variable eeprom16sf,ram16sf : sfixed16;
--	variable eeprom16uf,ram16uf : ufixed16;
	variable fttmp1,fttmp2 : fd2ft;
--	variable fptmp1,fptmp2 : st_sfixed_max;
--	variable fracas : fracas;
--	variable fracbs : fracbs;
--	variable fracau : fracau;
--	variable fracbu : fracbu;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,
	ending);
	variable state : states;
	variable ee2430,ram070a : std_logic_vector (15 downto 0);
begin
	if (rising_edge (i_clock)) then
	if (i_reset = '1') then
		state := idle;
		fixed2floatsclr_internal <= '1';
		divfpsclr_internal <= '1';
		fixed2floata_internal <= (others => '0');
		fixed2floatce_internal <= '0';
		fixed2floatond_internal <= '0';
		divfpce_internal <= '0';
		divfpond_internal <= '0';
		divfpa_internal <= (others => '0');
		divfpb_internal <= (others => '0');
--		eeprom16slv := (others => '0');
		o_KGain <= (others => '0');
		o_rdy <= '0';
		i2c_mem_ena <= '0';
		i2c_mem_addra <= (others => '0');
	else
	case (state) is
	when idle =>
		if (i_run = '1') then
			state := s1;
			i2c_mem_ena <= '1';
		else
			state := idle;
			i2c_mem_ena <= '0';
		end if;
		fixed2floatsclr_internal <= '0';
		divfpsclr_internal <= '0';

--i_ee0x2430 : in slv16; -- gain
--i_ram0x070a : in slv16;

	when s1 => state := s2;
		i2c_mem_addra <= std_logic_vector (to_unsigned (48*2+0, 12)); -- 2430 MSB ee gain
	when s2 => state := s3;
		i2c_mem_addra <= std_logic_vector (to_unsigned (48*2+1, 12)); -- 2430 LSB ee gain
	when s3 => state := s4;
		ee2430 (15 downto 8) := i2c_mem_douta; -- ee gain
	when s4 => state := s5;
		ee2430 (7 downto 0) := i2c_mem_douta; -- ee gain

	when s5 => state := s6;
		i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(778*2)+0, 12)); -- ram070a MSB ram gain
	when s6 => state := s7;
		i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(778*2)+1, 12)); -- ram070a LSB ram gain
	when s7 => state := s8;
		ram070a (15 downto 8) := i2c_mem_douta; -- ram gain
	when s8 => state := s9;
		ram070a (7 downto 0) := i2c_mem_douta; -- ram gain
	
	when s9 => state := s10;
		-- Kgain
--		eeprom16slv := ram070a;
--		fptmp1 := resize (to_sfixed (eeprom16slv, eeprom16sf), fptmp1);
--		report_error (eeprom16slv, 0.0);
--		report_all ("asd", fptmp1, to_sfixed (0.0, fptmp1));
--		fixed2floatce_internal <= '1';
--		fixed2floatond_internal <= '1';
--		fixed2floata_internal <= 
--		to_slv (to_sfixed (to_slv (fptmp1 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (fptmp1 (fracbs'high downto fracbs'low)), fracbs));

		fixed2floatce_internal <= '1';
		fixed2floatond_internal <= '1';
		fixed2floata_internal <=
		ram070a (15) & ram070a (15) & 
		ram070a (15) & ram070a (15) & 
		ram070a (15) & ram070a (15) & 
		ram070a (15) & ram070a (15) & 
		ram070a (15) & ram070a (15) & 
		ram070a (15) & ram070a (15) & 
		ram070a (15) & ram070a (15) & 
		ram070a (15) & ram070a (15) & 
		ram070a (15) & ram070a (15) & 
		ram070a (15) & ram070a & "00000000000000000000000000000";
	when s10 =>
		if (fixed2floatrdy_internal = '1') then state := s11;
			fttmp1 := fixed2floatr_internal;
			fixed2floatce_internal <= '0';
			fixed2floatond_internal <= '0';
			fixed2floatsclr_internal <= '1';
--			report "================ calculateKGain gainEE : " & real'image (ap_slv2fp (fttmp1));
		else state := s10; end if;
	when s11 => state := s12;
		fixed2floatsclr_internal <= '0';
--		eeprom16slv := ee2430;
--		fptmp2 := resize (to_sfixed (eeprom16slv, eeprom16sf), fptmp2);
--		fixed2floatce_internal <= '1';
--		fixed2floatond_internal <= '1';
--		fixed2floata_internal <= 
--		to_slv (to_sfixed (to_slv (fptmp2 (fracas'high downto fracas'low)), fracas)) & 
--		to_slv (to_sfixed (to_slv (fptmp2 (fracbs'high downto fracbs'low)), fracbs));

		fixed2floatce_internal <= '1';
		fixed2floatond_internal <= '1';
		fixed2floata_internal <=
		ee2430 (15) & ee2430 (15) & 
		ee2430 (15) & ee2430 (15) & 
		ee2430 (15) & ee2430 (15) & 
		ee2430 (15) & ee2430 (15) & 
		ee2430 (15) & ee2430 (15) & 
		ee2430 (15) & ee2430 (15) & 
		ee2430 (15) & ee2430 (15) & 
		ee2430 (15) & ee2430 (15) & 
		ee2430 (15) & ee2430 (15) & 
		ee2430 (15) & ee2430 & "00000000000000000000000000000";

	when s12 =>
		if (fixed2floatrdy_internal = '1') then state := s13;
			fttmp2 := fixed2floatr_internal;
			fixed2floatce_internal <= '0';
			fixed2floatond_internal <= '0';
			fixed2floatsclr_internal <= '1';
		else state := s12; end if;
	when s13 => state := s14;
		fixed2floatsclr_internal <= '0';
		divfpce_internal <= '1';
		divfpa_internal <= fttmp2;
		divfpb_internal <= fttmp1;
		divfpond_internal <= '1';
	when s14 =>
		if (divfprdy_internal = '1') then state := ending;
			fttmp1 := divfpr_internal;
			divfpce_internal <= '0';
			divfpond_internal <= '0';
			divfpsclr_internal <= '1';
      --synthesis translate_off
			report "================ calculateKGain gain : " & real'image (ap_slv2fp (fttmp1));
      --synthesis translate_on
		else state := s14; end if;
	when ending => state := idle;
		divfpsclr_internal <= '0';
		o_KGain <= fttmp1;
		o_rdy <= '1';
	when others => null;
	end case;
end if;
end if;
end process p0;

end Behavioral;

