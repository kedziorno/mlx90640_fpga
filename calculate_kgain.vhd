-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   15:32:39 02/03/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   calculate_kgain
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   11.2.2.4. Gain parameter calculation (common for all pixels) (p. 37)
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    global_package.vhd
--  - Modules: -
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules:
--      fixed2float, divfp
--    - Processes (Architecture: rtl):
--      p0
--
-- Important objects: -
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos: -
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones: -
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.global_package.all;

entity calculate_kgain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out std_logic;
i2c_mem_addra : out i2c_memory_address_bits_st;
i2c_mem_douta : in i2c_memory_data_bits_st;

o_kgain : out fp32;
o_rdy : out std_logic;

signal fixed2floata : out slv16;
signal fixed2floatond : out std_logic;
signal fixed2floatsclr : out std_logic;
signal fixed2floatce : out std_logic;
signal fixed2floatr : in fp32;
signal fixed2floatrdy : in std_logic;

signal divfpa : out fp32;
signal divfpb : out fp32;
signal divfpond : out std_logic;
signal divfpsclr : out std_logic;
signal divfpce : out std_logic;
signal divfpr : in fp32;
signal divfprdy : in std_logic
);
end entity calculate_kgain;

architecture rtl of calculate_kgain is

signal fixed2floata_internal : slv16;
signal fixed2floatond_internal : std_logic;
signal fixed2floatsclr_internal : std_logic;
signal fixed2floatce_internal : std_logic;
signal fixed2floatr_internal : fp32;
signal fixed2floatrdy_internal : std_logic;

signal divfpa_internal : fp32;
signal divfpb_internal : fp32;
signal divfpond_internal : std_logic;
signal divfpsclr_internal : std_logic;
signal divfpce_internal : std_logic;
signal divfpr_internal : fp32;
signal divfprdy_internal : std_logic;

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
  variable ram : slv8;
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
            i2c_mem_addra <= std_logic_vector (to_unsigned (c_ram_x070a_msb, c_memory_i2c_address_bits));
            report "11.2.2.4. Gain parameter calculation (common for all pixels)";
          else
            state := idle;
            i2c_mem_ena <= '0';
          end if;
          fixed2floatsclr_internal <= '0';
          divfpsclr_internal <= '0';
          o_rdy <= '0';
        when s4 => state := s5;
          i2c_mem_addra <= std_logic_vector (to_unsigned (c_ram_x070a_lsb, c_memory_i2c_address_bits));
        when s5 => state := s9;
          ram (7 downto 0) := i2c_mem_douta; -- ram gain
        when s9 =>
          -- kgain
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= ram & i2c_mem_douta; -- ram gain msb & lsb
          if (fixed2floatrdy_internal = '1') then state := s10;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
            --synthesis translate_off
            report_error("(gain ram 5508)", fixed2floatr_internal, 5508.0);
            warning_neq_fp (fixed2floatr_internal, x"45ac2000", "(gain ram 5508)");
            --synthesis translate_on
          else state := s9; end if;
        when s10 => -- XXX empty state/calculate for rm fttmp1
          fixed2floatsclr_internal <= '0';
          divfpce_internal <= '1';
          divfpa_internal <= fixed2floatr_internal;
          divfpb_internal <= C_1;
          divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := s10a;
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
            i2c_mem_addra <= std_logic_vector (to_unsigned (c_eeprom_x2430_msb, c_memory_i2c_address_bits));
          else state := s10; end if;
        when s10a => state := s10b;
            i2c_mem_addra <= std_logic_vector (to_unsigned (c_eeprom_x2430_lsb, c_memory_i2c_address_bits));
        when s10b => state := s11;
          ram (7 downto 0) := i2c_mem_douta; -- ee kgain
        when s11 =>
          divfpsclr_internal <= '0';
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <= ram & i2c_mem_douta;
          if (fixed2floatrdy_internal = '1') then state := s14;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
            --synthesis translate_off
            report_error("(gain eeprom 5580)", fixed2floatr_internal, 5580.0);
            warning_neq_fp (fixed2floatr_internal, x"45ae6000", "(gain eeprom 5580)");
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
            report_error("(output gain 1.0130718946456909)", divfpr_internal, 1.0130718946456909);
            warning_neq_fp (divfpr_internal, x"3f81ac57", "(output gain 1.0130718946456909)");
            --synthesis translate_on
            o_kgain <= divfpr_internal;
            o_rdy <= '1';
          else state := s14; end if;
      end case;
    end if;
  end if;
end process p0;

end architecture rtl;

