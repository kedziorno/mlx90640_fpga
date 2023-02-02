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
library ieee, ieee_proposed;
--library ieee;
use ieee.std_logic_1164.all;
use ieee_proposed.fixed_pkg.all;

use work.p_fphdl_package1.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calculateTa is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2432 : in slv16; -- kvptat,ktptat-6/10
i_ee0x2431 : in slv16; -- vptat25
i_ee0x2410 : in slv16; -- (alphaptatee),kptat,scaleoccrow,scaleocccolumn,scaleoccremnant
i_kvdd : in fd2ft;
i_vdd25 : in fd2ft;
i_ram0x072a : in fd2ft;
o_Ta : out fd2ft; -- output Ta
o_rdy : out std_logic
);
end calculateTa;

architecture Behavioral of calculateTa is

begin

p0 : process (i_clock) is
	variable eeprom16slv,ram16slv : slv16;
	variable eeprom16sf,ram16sf : sfixed16;
	variable eeprom16uf,ram16uf : ufixed16;
	variable fttmp1,fttmp2 : fd2ft;
	variable fptmp1,fptmp2 : st_sfixed_max;
	variable fracas : fracas;
	variable fracbs : fracbs;
	variable fracau : fracau;
	variable fracbu : fracbu;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,
	s9,s10,s11,s12,s13,s14);
	variable state : states;
	constant const3dot3_ft : fd2ft := x"40533333";
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
		eeprom16slv := (others => '0');
		ram16slv := (others => '0');
		o_Vdd <= (others => '0');
		o_rdy <= '0';
	else
	case (state) is
	when idle =>
		if (i_run = '1') then
			state := s1;
		else
			state := idle;
		end if;
		fixed2floatsclr <= '0';
		addfpsclr <= '0';
		subfpsclr <= '0';
		mulfpsclr <= '0';
		divfpsclr <= '0';
	when s1 => state := s2;
		-- deltaV
		subfpce <= '1';
		subfpa <= i_ram0x072a;
		subfpb <= i_vdd25;
		subfpond <= '1';
	when s2 =>
		if (subfprdy = '1') then state := s39;
			deltaV_ft := subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s38; end if;
	when s3 => state := s40;
		subfpsclr <= '0';
		divfpce <= '1';
		divfpa <= deltaV_ft;
		divfpb <= i_kvdd;
		divfpond <= '1';
	when s4 =>
		if (divfprdy = '1') then state := s41;
			deltaV_ft := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s40; end if;
	when s5 => state := s2;
		divfpsclr <= '0';
		-- vptat25
		eeprom16slv := i_ee0x2431 and x"ffff";
		vptat25 := resize (to_sfixed (eeprom16slv, eeprom16sf), vptat25);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (vptat25 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (vptat25 (fracbs'high downto fracbs'low)), fracbs));
	when s6 =>
		if (fixed2floatrdy = '1') then state := s47;
			vptat25_ft := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s46; end if;
	when s7 => state := s48;
		fixed2floatsclr <= '0';
		-- vptat
		eeprom16slv := i_ram0x0720 and x"ffff";
		vptat := resize (to_sfixed (eeprom16slv, eeprom16sf), vptat);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (vptat (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (vptat (fracbs'high downto fracbs'low)), fracbs));
	when s8 =>
		if (fixed2floatrdy = '1') then state := s49;
			vptat_ft := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s48; end if;
	when s9 => state := s50;
		fixed2floatsclr <= '0';
		-- vbe
		eeprom16slv := i_ram0x0700 and x"ffff";
		vbe := resize (to_sfixed (eeprom16slv, eeprom16sf), vbe);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (vbe (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (vbe (fracbs'high downto fracbs'low)), fracbs));
	when s10 =>
		if (fixed2floatrdy = '1') then state := s51;
			vbe_ft := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s50; end if;
	when s11 => state := s64;
		fixed2floatsclr <= '0';
		-- vptat*alphaptst
		mulfpce <= '1';
		mulfpa <= vptat_ft;
		mulfpb <= ExtractAlphaPtatParameter_alphaptat;
		mulfpond <= '1';
	when s12 =>
		if (mulfprdy = '1') then state := s65;
			vptatart_ft := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s64; end if;
	when s13 => state := s66;
		mulfpsclr <= '0';
		-- vptat*alphaptst+vbe
		addfpce <= '1';
		addfpa <= vptatart_ft;
		addfpb <= vbe_ft;
		addfpond <= '1';
	when s14 =>
		if (addfprdy = '1') then state := s67;
			vptatart_ft := addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s66; end if;
	when s15 => state := s68;
		addfpsclr <= '0';
		-- vptat/(vptat*alphaptst+vbe)
		divfpce <= '1';
		divfpa <= vptat_ft;
		divfpb <= vptatart_ft;
		divfpond <= '1';
	when s16 =>
		if (divfprdy = '1') then state := s69;
			vptatart_ft := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s68; end if;
	when s17 => state := s70;
		divfpsclr <= '0';
		-- vptat/(vptat*alphaptst+vbe)*2^18
		mulfpce <= '1';
		mulfpa <= vptatart_ft;
		mulfpb <= const2pow18_ft;
		mulfpond <= '1';
	when s18 =>
		if (mulfprdy = '1') then state := s71;
			vptatart_ft := mulfpr; -- 12873.57952
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s70; end if;
	when s19 => state := s76;
		mulfpsclr <= '0';
		-- kvptat*deltaV
		mulfpce <= '1';
		mulfpa <= kvptat_ft;
		mulfpb <= deltaV_ft;
		mulfpond <= '1';
	when s20 =>
		if (mulfprdy = '1') then state := s77;
			Ta_ft := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s76; end if;
	when s21 => state := s78;
		mulfpsclr <= '0';
		-- 1+kvptat*deltaV
		addfpce <= '1';
		addfpa <= const1_ft;
		addfpb <= Ta_ft;
		addfpond <= '1';
	when s22 =>
		if (addfprdy = '1') then state := s79;
			Ta_ft := addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s78; end if;
	when s23 => state := s80;
		addfpsclr <= '0';
		-- vptatart/(1+kvptat*deltaV)
		divfpce <= '1';
		divfpa <= vptatart_ft;
		divfpb <= Ta_ft;
		divfpond <= '1';
	when s24 =>
		if (divfprdy = '1') then state := s81;
			Ta_ft := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s80; end if;
	when s25 => state := s82;
		divfpsclr <= '0';
		-- (vptatart/(1+kvptat*deltaV))-vptat25
		subfpce <= '1';
		subfpa <= Ta_ft;
		subfpb <= vptat25_ft;
		subfpond <= '1';
	when s26 =>
		if (subfprdy = '1') then state := s83;
			Ta_ft := subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s82; end if;
	when s27 => state := s84;
		subfpsclr <= '0';
		-- ((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat
		divfpce <= '1';
		divfpa <= Ta_ft;
		divfpb <= ExtractKtPTATParameter_ktptat;
		divfpond <= '1';
	when s28 =>
		if (divfprdy = '1') then state := s85;
			Ta_ft := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s84; end if;
	when s29 => state := s86;
		divfpsclr <= '0';
		-- (((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat)+25
		addfpce <= '1';
		addfpa <= Ta_ft;
		addfpb <= const25_ft;
		addfpond <= '1';
	when s30 =>
		if (addfprdy = '1') then state := s87;
			Ta_ft := addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s86; end if;
	when ending =>
		addfpsclr <= '0';

	when others => null;
	end case;
end if;
end if;
end process p0;

ExtractKvPTATParameter_clock <= i_clock;
ExtractKvPTATParameter_reset <= i_reset;
ExtractKvPTATParameter_ee0x2432 <= i_ee0x2432;
inst_ExtractKvPTATParameter : ExtractKvPTATParameter PORT MAP (
i_clock => ExtractKvPTATParameter_clock,
i_reset => ExtractKvPTATParameter_reset,
i_ee0x2432 => ExtractKvPTATParameter_ee0x2432,
o_kvptat => ExtractKvPTATParameter_kvptat
);

ExtractKtPTATParameter_clock <= i_clock;
ExtractKtPTATParameter_reset <= i_reset;
ExtractKtPTATParameter_ee0x2432 <= i_ee0x2432;
inst_ExtractKtPTATParameter : ExtractKtPTATParameter PORT MAP (
i_clock => ExtractKtPTATParameter_clock,
i_reset => ExtractKtPTATParameter_reset,
i_ee0x2432 => ExtractKtPTATParameter_ee0x2432,
o_ktptat => ExtractKtPTATParameter_ktptat
);

end Behavioral;

