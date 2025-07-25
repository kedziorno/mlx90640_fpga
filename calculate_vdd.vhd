-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   14:29:35 02/02/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   calculate_vdd
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   - 11.1.1. Restoring the VDD sensor parameters (p. 22)
--                - 11.2.2.2. Supply voltage value calculation (p. 36)
--                - 11.2.2.5.3. IR data compensation offset, VDD and Ta (p. 39)
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
--    - Modules: -
--    - Processes (Architecture: rtl):
--      p0
--
-- Important objects:
--  - Entity signals:
--    - i2c_mem_* - memory with raw data
--    - fixed2float* - conversion
--    - divfp, mulfp, addfp, subfp - FP cores
--    - o_vdd - main value
--    - o_rdy - end of calculations
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

entity calculate_vdd is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
o_Vdd : out fp32;
o_rdy : out std_logic;

i2c_mem_ena : out std_logic;
i2c_mem_addra : out i2c_memory_address_bits_st;
i2c_mem_douta : in i2c_memory_data_bits_st;

fixed2floata : out slv16;
fixed2floatond : out std_logic;
fixed2floatce : out std_logic;
fixed2floatsclr : out std_logic;
fixed2floatr :  in fp32;
fixed2floatrdy : in std_logic;

divfpa : out fp32;
divfpb : out fp32;
divfpond : out std_logic;
divfpce : out std_logic;
divfpsclr : out std_logic;
divfpr : in fp32;
divfprdy : in std_logic;

mulfpa : out fp32;
mulfpb : out fp32;
mulfpond : out std_logic;
mulfpce : out std_logic;
mulfpsclr : out std_logic;
mulfpr : in fp32;
mulfprdy : in std_logic;

addfpa : out fp32;
addfpb : out fp32;
addfpond : out std_logic;
addfpce : out std_logic;
addfpsclr : out std_logic;
addfpr : in fp32;
addfprdy : in std_logic;

subfpa : out fp32;
subfpb : out fp32;
subfpond : out std_logic;
subfpce : out std_logic;
subfpsclr : out std_logic;
subfpr : in fp32;
subfprdy : in std_logic
);
end entity calculate_vdd;

architecture rtl of calculate_vdd is

signal out_resolutionee,out_resolutionreg : fp32;
signal resolutionee,resolutionreg : slv2;

signal i2c_mem_ena_internal : std_logic;

signal i2c_mem_addra_i : i2c_memory_address_bits_st;
signal i2c_mem_douta_i : i2c_memory_data_bits_st;
alias resolution_ee_a  : slv2 is i2c_mem_douta_i (5 downto 4);

begin

i2c_mem_ena <= i2c_mem_ena_internal;
i2c_mem_addra <= i2c_mem_addra_i;
i2c_mem_douta_i <= i2c_mem_douta;

p0 : process (i_clock) is
	type states is (idle,
  s2,s4,s5,s9,s10,
  s11,s12,s13,s14,s14a,s15,s16,s16a,s17,s18,s19,
  s20,s21,s22,s23);
  variable state : states;
  variable ram : slv8; -- XXX ram072a
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
		i2c_mem_addra_i <= (others => '0');
	else
	case (state) is
	when idle =>
		if (i_run = '1') then
			state := s2;
			i2c_mem_ena_internal <= '1';
      report "calculate_vdd";
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
    o_rdy <= '0';
	when s2 => state := s4;
    i2c_mem_addra_i <= std_logic_vector (to_unsigned (c_eeprom_x2438_msb, c_memory_i2c_address_bits));
	when s4 => state := s5;
    resolutionreg <= resolution_reg_a;
	when s5 => state := s9;
		resolutionee <= resolution_ee_a;
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
		i2c_mem_addra_i <= std_logic_vector (to_unsigned (c_ram_x072a_msb, c_memory_i2c_address_bits));
	when s11 => state := s12;
		i2c_mem_addra_i <= std_logic_vector (to_unsigned (c_ram_x072a_lsb, c_memory_i2c_address_bits));
	when s12 => state := s13;
		ram (7 downto 0) := i2c_mem_douta_i;		
	when s13 =>
		fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= ram & i2c_mem_douta_i; -- vdd msb & lsb
    if (fixed2floatrdy = '1') then state := s14;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
		else state := s13; end if;
	when s14 =>
		fixed2floatsclr <= '0';
		mulfpce <= '1';
		mulfpa <= divfpr; -- s9
		mulfpb <= fixed2floatr; -- s13
		mulfpond <= '1';
		if (mulfprdy = '1') then state := s14a;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
    else state := s14; end if;
  when s14a => -- XXX empty state
    mulfpsclr <= '0';
    addfpce <= '1';
		addfpa <= mulfpr; -- s14
		addfpb <= x"00000000";
		addfpond <= '1';
    i2c_mem_addra_i <= std_logic_vector (to_unsigned (c_eeprom_x2433_lsb, c_memory_i2c_address_bits));
    if (addfprdy = '1') then state := s15;
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
    else state := s14a; end if;
  when s15 =>
    addfpsclr <= '0';
    fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= extend_8_to_16 (i2c_mem_douta_i); -- vdd25
    if (fixed2floatrdy = '1') then state := s16;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
      --synthesis translate_off
      report_error ("vdd25", fixed2floatr, 0.0);
      --synthesis translate_on
		else state := s15; end if;
  when s16 =>
    fixed2floatsclr <= '0';
    subfpce <= '1';
		subfpa <= fixed2floatr; -- s15
		subfpb <= c_256_ft;
		subfpond <= '1';
		if (subfprdy = '1') then state := s16a;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s16; end if;
  when s16a =>
		subfpsclr <= '0';
    mulfpce <= '1';
		mulfpa <= subfpr; -- s16
		mulfpb <= c_2pow5_ft;
		mulfpond <= '1';
		if (mulfprdy = '1') then state := s17;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s16a; end if;
	when s17 =>
		mulfpsclr <= '0';
    subfpce <= '1';
		subfpa <= mulfpr; -- s16a
		subfpb <= c_2pow13_ft;
		subfpond <= '1';
		if (subfprdy = '1') then state := s18;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s17; end if;
	when s18 => state := s19;
		subfpsclr <= '0';
  when s19 =>
		subfpce <= '1';
		subfpa <= addfpr; -- s14a
		subfpb <= subfpr; -- s17
		subfpond <= '1';
    i2c_mem_addra_i <= std_logic_vector (to_unsigned (c_eeprom_x2433_msb, c_memory_i2c_address_bits));
		if (subfprdy = '1') then state := s20;
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s19; end if;
  when s20 =>
		subfpsclr <= '0';
    fixed2floatce <= '1';
		fixed2floatond <= '1';
		fixed2floata <= extend_8_to_16 (i2c_mem_douta_i); -- kvdd
    if (fixed2floatrdy = '1') then state := s21;
			fixed2floatce <= '0';
			fixed2floatond <= '0';
			fixed2floatsclr <= '1';
      --synthesis translate_off
      report_error ("kvdd", fixed2floatr, 0.0);
      --synthesis translate_on
		else state := s20; end if;
  when s21 =>
    fixed2floatsclr <= '0';
    mulfpce <= '1';
		mulfpa <= fixed2floatr; -- s20
		mulfpb <= c_2pow5_ft;
		mulfpond <= '1';
		if (mulfprdy = '1') then state := s22;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s21; end if;
	when s22 =>
		mulfpsclr <= '0';
		divfpce <= '1';
		divfpa <= subfpr; -- s19
		divfpb <= mulfpr; -- s21
		divfpond <= '1';
		if (divfprdy = '1') then state := s23;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s21; end if;
	when s23 =>
		divfpsclr <= '0';
		addfpce <= '1';
		addfpa <= divfpr; -- s22
		addfpb <= c_3dot3_ft;
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
with resolutionee select out_resolutionee <=
x"3f800000" when "00",
x"40000000" when "01",
x"40800000" when "10",
x"41000000" when "11",
x"00000000" when others;

-- 0-3 2^x - RAM[0x800d] & 0x0c00 - resolutionreg
with resolutionreg select out_resolutionreg <=
x"3f800000" when "00",
x"40000000" when "01",
x"40800000" when "10",
x"41000000" when "11",
x"00000000" when others;

end architecture rtl;
