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
i_ram0x0720 : in slv16; -- vptat
i_ram0x0700 : in slv16; -- vbe
i_ee0x2410 : in slv16; -- (alphaptatee),kptat,scaleoccrow,scaleocccolumn,scaleoccremnant
i_ram0x072a : in fd2ft; -- from VDD bram
i_kvdd : in fd2ft; -- from VDD bram
i_vdd25 : in fd2ft; -- from VDD bram
o_Ta : out fd2ft; -- output Ta
o_rdy : out std_logic
);
end calculateTa;

architecture Behavioral of calculateTa is

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

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatclk : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;

COMPONENT divfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfpclk : STD_LOGIC;
signal divfpsclr : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : STD_LOGIC;

COMPONENT mulfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfpclk : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : STD_LOGIC;

COMPONENT addfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfpclk : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : STD_LOGIC;

COMPONENT subfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfpclk : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : STD_LOGIC;

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
	variable vbe,vptat,vptat25 : st_sfixed_max;
	variable vbe_ft,vptat_ft,vptat25_ft : fd2ft;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,
	s9,s10,s11,s12,s13,s14,
	s15,s16,s17,s18,s19,s20,
	s21,s22,s23,s24,s25,s26,
	s27,s28,s29,s30,ending);
	variable state : states;
	constant const3dot3_ft : fd2ft := x"40533333";
	constant const2pow18_ft : fd2ft := x"48800000";
	constant const1_ft : fd2ft := x"3F800000";
	constant const25_ft : fd2ft := x"41C80000";
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
		o_Ta <= (others => '0');
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
		if (subfprdy = '1') then state := s3;
			fttmp1 := subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s2; end if;
	when s3 => state := s4;
		subfpsclr <= '0';
		divfpce <= '1';
		divfpa <= fttmp1;
		divfpb <= i_kvdd;
		divfpond <= '1';
	when s4 =>
		if (divfprdy = '1') then state := s5;
			fttmp1 := divfpr; -- deltaV
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s4; end if;
	when s5 => state := s6;
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
		if (fixed2floatrdy = '1') then state := s7;
			vptat25_ft := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s6; end if;
	when s7 => state := s8;
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
		if (fixed2floatrdy = '1') then state := s9;
			vptat_ft := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s8; end if;
	when s9 => state := s10;
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
		if (fixed2floatrdy = '1') then state := s11;
			vbe_ft := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s10; end if;
	when s11 => state := s12;
		fixed2floatsclr <= '0';
		-- vptat*alphaptat
		mulfpce <= '1';
		mulfpa <= vptat_ft;
		mulfpb <= ExtractAlphaPtatParameter_alphaptat;
		mulfpond <= '1';
	when s12 =>
		if (mulfprdy = '1') then state := s13;
			fttmp2 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s12; end if;
	when s13 => state := s14;
		mulfpsclr <= '0';
		-- vptat*alphaptat+vbe
		addfpce <= '1';
		addfpa <= fttmp2;
		addfpb <= vbe_ft;
		addfpond <= '1';
	when s14 =>
		if (addfprdy = '1') then state := s15;
			fttmp2 := addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s14; end if;
	when s15 => state := s16;
		addfpsclr <= '0';
		-- vptat/(vptat*alphaptat+vbe)
		divfpce <= '1';
		divfpa <= vptat_ft;
		divfpb <= fttmp2;
		divfpond <= '1';
	when s16 =>
		if (divfprdy = '1') then state := s17;
			fttmp2 := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s16; end if;
	when s17 => state := s18;
		divfpsclr <= '0';
		-- vptat/(vptat*alphaptat+vbe)*2^18
		mulfpce <= '1';
		mulfpa <= fttmp2;
		mulfpb <= const2pow18_ft;
		mulfpond <= '1';
	when s18 =>
		if (mulfprdy = '1') then state := s19;
			fttmp2 := mulfpr; -- 12873.57952 vptatart
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s18; end if;
	when s19 => state := s20;
		mulfpsclr <= '0';
		-- kvptat*deltaV
		mulfpce <= '1';
		mulfpa <= ExtractKvPTATParameter_kvptat;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s20 =>
		if (mulfprdy = '1') then state := s21;
			fttmp1 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s20; end if;
	when s21 => state := s22;
		mulfpsclr <= '0';
		-- 1+kvptat*deltaV
		addfpce <= '1';
		addfpa <= const1_ft;
		addfpb <= fttmp1;
		addfpond <= '1';
	when s22 =>
		if (addfprdy = '1') then state := s23;
			fttmp1 := addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s22; end if;
	when s23 => state := s24;
		addfpsclr <= '0';
		-- vptatart/(1+kvptat*deltaV)
		divfpce <= '1';
		divfpa <= fttmp2;
		divfpb <= fttmp1;
		divfpond <= '1';
	when s24 =>
		if (divfprdy = '1') then state := s25;
			fttmp1 := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s24; end if;
	when s25 => state := s26;
		divfpsclr <= '0';
		-- (vptatart/(1+kvptat*deltaV))-vptat25
		subfpce <= '1';
		subfpa <= fttmp1;
		subfpb <= vptat25_ft;
		subfpond <= '1';
	when s26 =>
		if (subfprdy = '1') then state := s27;
			fttmp1 := subfpr;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s26; end if;
	when s27 => state := s28;
		subfpsclr <= '0';
		-- ((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat
		divfpce <= '1';
		divfpa <= fttmp1;
		divfpb <= ExtractKtPTATParameter_ktptat;
		divfpond <= '1';
	when s28 =>
		if (divfprdy = '1') then state := s29;
			fttmp1 := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s28; end if;
	when s29 => state := s30;
		divfpsclr <= '0';
		-- (((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat)+25
		addfpce <= '1';
		addfpa <= fttmp1;
		addfpb <= const25_ft;
		addfpond <= '1';
	when s30 =>
		if (addfprdy = '1') then state := ending;
			fttmp1 := addfpr;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s30; end if;
	when ending => state := idle;
		addfpsclr <= '0';
		o_Ta <= fttmp1;
		o_rdy <= '1';
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

ExtractAlphaPtatParameter_clock <= i_clock;
ExtractAlphaPtatParameter_reset <= i_reset;
ExtractAlphaPtatParameter_ee0x2410 <= i_ee0x2410;
inst_ExtractAlphaPtatParameter : ExtractAlphaPtatParameter
port map (
i_clock => ExtractAlphaPtatParameter_clock,
i_reset => ExtractAlphaPtatParameter_reset,
i_ee0x2410 => ExtractAlphaPtatParameter_ee0x2410,
o_alphaptat => ExtractAlphaPtatParameter_alphaptat
);

fixed2floatclk <= i_clock;
addfpclk <= i_clock;
subfpclk <= i_clock;
mulfpclk <= i_clock;
divfpclk <= i_clock;

inst_ff2 : fixed2float
PORT MAP (
a => fixed2floata,
operation_nd => fixed2floatond,
clk => fixed2floatclk,
sclr => fixed2floatsclr,
ce => fixed2floatce,
result => fixed2floatr,
rdy => fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => divfpa,
b => divfpb,
operation_nd => divfpond,
clk => divfpclk,
sclr => divfpsclr,
ce => divfpce,
result => divfpr,
rdy => divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => mulfpa,
b => mulfpb,
operation_nd => mulfpond,
clk => mulfpclk,
sclr => mulfpsclr,
ce => mulfpce,
result => mulfpr,
rdy => mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => addfpa,
b => addfpb,
operation_nd => addfpond,
clk => addfpclk,
sclr => addfpsclr,
ce => addfpce,
result => addfpr,
rdy => addfprdy
);

inst_subfp : subfp
PORT MAP (
a => subfpa,
b => subfpb,
operation_nd => subfpond,
clk => subfpclk,
sclr => subfpsclr,
ce => subfpce,
result => subfpr,
rdy => subfprdy
);

end Behavioral;
