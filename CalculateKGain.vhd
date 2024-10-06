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

--use work.p_fphdl_package1.all;
--use work.p_fphdl_package2.all;
use work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CalculateKGain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_KGain : out std_logic_vector (31 downto 0);
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
end CalculateKGain;

architecture Behavioral of CalculateKGain is

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
	type states is (idle,
	s4,s5,s9,s10,s10a,s10b,s11,s14);
	variable state : states;
	variable ee2430 : std_logic_vector (7 downto 0);
  variable ram070a : std_logic_vector (7 downto 0);
  constant const1 : std_logic_vector (31 downto 0) := x"3f800000";
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
      o_KGain <= (others => '0');
      o_rdy <= '0';
      i2c_mem_ena <= '0';
      i2c_mem_addra <= (others => '0');
    else
      case (state) is
        when idle =>
          if (i_run = '1') then
            state := s4;
            i2c_mem_ena <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(778*2)+0, 12)); -- ram070a MSB ram gain
          else
            state := idle;
            i2c_mem_ena <= '0';
          end if;
          fixed2floatsclr_internal <= '0';
          divfpsclr_internal <= '0';
        when s4 => state := s5;
          i2c_mem_addra <= std_logic_vector (to_unsigned (1664+(778*2)+1, 12)); -- ram070a LSB ram gain
        when s5 => state := s9;
          ram070a (7 downto 0) := i2c_mem_douta; -- ram gain
        when s9 =>
          -- Kgain
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <=
          ram070a (7) & ram070a (7) & 
          ram070a (7) & ram070a (7) & 
          ram070a (7) & ram070a (7) & 
          ram070a (7) & ram070a (7) & 
          ram070a (7) & ram070a (7) & 
          ram070a (7) & ram070a (7) & 
          ram070a (7) & ram070a (7) & 
          ram070a (7) & ram070a (7) & 
          ram070a (7) & ram070a (7) & 
          ram070a (7) & ram070a & i2c_mem_douta & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s10;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
            --synthesis translate_off
            report_error("================ calculateKGain gainEE 1", fixed2floatr_internal, 0.0);
            --synthesis translate_on
          else state := s9; end if;
        when s10 => -- XXX empty state/calculate for rm fttmp1
          fixed2floatsclr_internal <= '0';
          divfpce_internal <= '1';
          divfpa_internal <= fixed2floatr_internal;
          divfpb_internal <= const1;
          divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := s10a;
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
            i2c_mem_addra <= std_logic_vector (to_unsigned (48*2+0, 12)); -- 2430 MSB ee gain
          else state := s10; end if;
        when s10a => state := s10b;
            i2c_mem_addra <= std_logic_vector (to_unsigned (48*2+1, 12)); -- 2430 LSB ee gain
        when s10b => state := s11;
          ee2430 (7 downto 0) := i2c_mem_douta; -- ee gain
        when s11 =>
          divfpsclr_internal <= '0';
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <=
          ee2430 (7) & ee2430 (7) & 
          ee2430 (7) & ee2430 (7) & 
          ee2430 (7) & ee2430 (7) & 
          ee2430 (7) & ee2430 (7) & 
          ee2430 (7) & ee2430 (7) & 
          ee2430 (7) & ee2430 (7) & 
          ee2430 (7) & ee2430 (7) & 
          ee2430 (7) & ee2430 (7) & 
          ee2430 (7) & ee2430 (7) & 
          ee2430 (7) & ee2430 & i2c_mem_douta & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s14;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
            --synthesis translate_off
            report_error("================ calculateKGain gainEE 2", fixed2floatr_internal, 0.0);
            --synthesis translate_on      
          else state := s11; end if;
        when s14 =>
          fixed2floatsclr_internal <= '0';
          divfpce_internal <= '1';
          divfpa_internal <= fixed2floatr_internal;
          divfpb_internal <= divfpr_internal;
          divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := idle;
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
            --synthesis translate_off
            report_error("================ calculateKGain gain", divfpr_internal, 0.0);
            --synthesis translate_on
            o_KGain <= divfpr_internal;
            o_rdy <= '1';
          else state := s14; end if;
      end case;
    end if;
  end if;
end process p0;

end architecture Behavioral;
