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

entity calculateKGain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_KGain : out fd2ft;
o_rdy : out std_logic
);
end calculateKGain;

architecture Behavioral of calculateKGain is

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
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,
	ending);
	variable state : states;
	variable ee2430,ram070a : std_logic_vector (15 downto 0);
begin
	if (rising_edge (i_clock)) then
	if (i_reset = '1') then
		state := idle;
		fixed2floatsclr <= '1';
		divfpsclr <= '1';
		fixed2floata <= (others => '0');
		fixed2floatce <= '0';
		fixed2floatond <= '0';
		divfpce <= '0';
		divfpond <= '0';
		divfpa <= (others => '0');
		divfpb <= (others => '0');
		eeprom16slv := (others => '0');
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
		fixed2floatsclr <= '0';
		divfpsclr <= '0';

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
		eeprom16slv := ram070a;
		fptmp1 := resize (to_sfixed (eeprom16slv, eeprom16sf), fptmp1);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (fptmp1 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (fptmp1 (fracbs'high downto fracbs'low)), fracbs));
	when s10 =>
		if (fixed2floatrdy = '1') then state := s11;
			fttmp1 := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s10; end if;
	when s11 => state := s12;
		fixed2floatsclr <= '0';
		eeprom16slv := ee2430;
		fptmp2 := resize (to_sfixed (eeprom16slv, eeprom16sf), fptmp2);
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= 
		to_slv (to_sfixed (to_slv (fptmp2 (fracas'high downto fracas'low)), fracas)) & 
		to_slv (to_sfixed (to_slv (fptmp2 (fracbs'high downto fracbs'low)), fracbs));
	when s12 =>
		if (fixed2floatrdy = '1') then state := s13;
			fttmp2 := fixed2floatr;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s12; end if;
	when s13 => state := s14;
		fixed2floatsclr <= '0';
		divfpce <= '1';
		divfpa <= fttmp2;
		divfpb <= fttmp1;
		divfpond <= '1';
	when s14 =>
		if (divfprdy = '1') then state := ending;
			fttmp1 := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s14; end if;
	when ending => state := idle;
		divfpsclr <= '0';
		o_KGain <= fttmp1;
		o_rdy <= '1';
	when others => null;
	end case;
end if;
end if;
end process p0;

fixed2floatclk <= i_clock;
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

end Behavioral;

