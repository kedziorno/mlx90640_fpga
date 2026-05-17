-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   17:55:26 02/02/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   calculate_ta
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   11.1.2. Restoring the Ta sensor parameters (p. 22)
--                11.2.2.3. Ambient temperature calculation (common for all pixels) (p. 37)
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
--      rom_constants
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

entity calculate_ta is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_vdd : in fp32;

o_ta : out fp32;
o_rdy : out std_logic;

o_kvptat_ena : out std_logic;
o_kvptat_adr : out std_logic_vector (5 downto 0);
o_alphaptat_ena : out std_logic;
o_alphaptat_adr : out std_logic_vector (3 downto 0);
i_rom_constants_float : in fp32;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out i2c_memory_address_bits_st;
i2c_mem_douta : in i2c_memory_data_bits_st;

fixed2floata : out slv16;
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr :  in fp32;
fixed2floatrdy : in STD_LOGIC;

divfpa : out fp32;
divfpb : out fp32;
divfpond : out STD_LOGIC;
divfpce : out STD_LOGIC;
divfpsclr : out STD_LOGIC;
divfpr : in fp32;
divfprdy : in STD_LOGIC;

mulfpa : out fp32;
mulfpb : out fp32;
mulfpond : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpr : in fp32;
mulfprdy : in STD_LOGIC;

addfpa : out fp32;
addfpb : out fp32;
addfpond : out STD_LOGIC;
addfpce : out STD_LOGIC;
addfpsclr : out STD_LOGIC;
addfpr : in fp32;
addfprdy : in STD_LOGIC;

subfpa : out fp32;
subfpb : out fp32;
subfpond : out STD_LOGIC;
subfpce : out STD_LOGIC;
subfpsclr : out STD_LOGIC;
subfpr : in fp32;
subfprdy : in STD_LOGIC
);
end calculate_ta;

architecture rtl of calculate_ta is

signal i2c_mem_douta_i : i2c_memory_data_bits_st;
alias alpha_ptat_ee_a  : slv4 is i2c_mem_douta_i (7 downto 4);
alias kvptat_ee_a      : slv6 is i2c_mem_douta_i (7 downto 2);
alias ktptat_msb_ee_a  : slv2 is i2c_mem_douta_i (1 downto 0);

signal nibble_in1 : std_logic_vector (5 downto 0);
signal nibble_in2 : std_logic_vector (3 downto 0);
signal nibble_out1, nibble_out2 : std_logic_vector (31 downto 0);

begin

i2c_mem_douta_i <= i2c_mem_douta;

p0 : process (i_clock) is
	type states is (idle,
	s1c,
	s8,s9,
	s12,s13,s14,s15,
	s16,s18,
	s22,s23,s24,s25,s26,s26a,s26b,s26c,
	s28,s30);
	variable state : states;
  variable ram : slv8;
  variable tmp : slv2;
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
      o_Ta <= (others => '0');
      o_rdy <= '0';
      i2c_mem_ena <= '0';
--      o_kvptat_ena <= '0';
--      o_kvptat_adr <= (others => '0');
--      o_alphaptat_ena <= '0';
--      o_alphaptat_adr <= (others => '0');
      nibble_in1 <= (others => '0');
      nibble_in2 <= (others => '0');
    else
      case (state) is
        when idle =>
          if (i_run = '1') then
            state := s1c;
            i2c_mem_ena <= '1';
          else
            state := idle;
            i2c_mem_ena <= '0';
          end if;
          fixed2floatsclr <= '0';
          addfpsclr <= '0';
          subfpsclr <= '0';
          mulfpsclr <= '0';
          divfpsclr <= '0';
          o_rdy <= '0';
        when s1c =>
          o_Ta <= (others => '0');
          subfpce <= '1';
          subfpa <= i_Vdd;
          subfpb <= C_3DOT3;
          subfpond <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (c_ram_x0720_msb, 12));
          if (subfprdy = '1') then state := s8;
            -- XXX duplicate calculation
            subfpce <= '0';
            subfpond <= '0';
            subfpsclr <= '1';
            --synthesis translate_off
            report_error("(input vdd 3.2925000190734863)", i_Vdd, 3.2925000190734863);
            warning_neq_fp (i_Vdd, x"4052b852", "(input vdd 3.2925000190734863)");
            --synthesis translate_on
            --synthesis translate_off
            report_error("vdd - 3.3", subfpr, (3.2925000190734863 - 3.3));
            --synthesis translate_on
            i2c_mem_addra <= std_logic_vector (to_unsigned (c_ram_x0720_lsb, 12));
            ram := i2c_mem_douta_i;
          else state := s1c; end if;
        when s8 =>
          subfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <= ram & i2c_mem_douta_i; -- vptat msb & lsb
          if (fixed2floatrdy = '1') then state := s9;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            --synthesis translate_off
            report_error("(vptat ram 1686)", fixed2floatr, 1686.0);
            warning_neq_fp (fixed2floatr, x"44d2c000", "(vptat ram 1686)");
            --synthesis translate_on
            i2c_mem_addra <= std_logic_vector (to_unsigned (c_eeprom_x2410_msb, 12));
          else state := s8; end if;
        when s9 => state := s12;
          fixed2floatsclr <= '0';
          o_alphaptat_ena <= '1';
          o_alphaptat_adr <= i2c_mem_douta (7 downto 4);
--          nibble_in2 <= i2c_mem_douta (7 downto 4);
        when s12 =>
          -- vptat*alphaptat
          mulfpce <= '1';
          mulfpa <= fixed2floatr; -- vptat
          mulfpb <= i_rom_constants_float; -- alphaptat
--          mulfpb <= nibble_out2; -- alphaptat
          mulfpond <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (c_ram_x0700_msb, 12));
          if (mulfprdy = '1') then state := s13;
            --synthesis translate_off
            report_error("(alphaptat eeprom 9.0)", i_rom_constants_float, 9.0);
            warning_neq_fp (i_rom_constants_float, x"41100000", "(alphaptat eeprom 9.0");
            --synthesis translate_on
            o_alphaptat_ena <= '0';
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
            i2c_mem_addra <= std_logic_vector (to_unsigned (c_ram_x0700_lsb, 12));
            ram := i2c_mem_douta_i;
          else state := s12; end if;
        when s13 =>
          mulfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <= ram & i2c_mem_douta_i; -- vbe msb & lsb
          if (fixed2floatrdy = '1') then state := s14;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            --synthesis translate_off
            report_error("(vbe ram 19962)", fixed2floatr, 19962.0);
            warning_neq_fp (fixed2floatr, x"469bf400", "(vbe ram 19962)");
            --synthesis translate_on
            --synthesis translate_off
            --report_error("================ CalculateTa vbe", fixed2floatr, 0.0);
            --synthesis translate_on
          else state := s13; end if;
        when s14 =>
          fixed2floatsclr <= '0';
          -- vptat*alphaptat+vbe
          addfpce <= '1';
          addfpa <= mulfpr; -- vptat*alphaptat
          addfpb <= fixed2floatr; -- vbe
          addfpond <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (c_ram_x0720_msb, 12));
          if (addfprdy = '1') then state := s15;
            addfpce <= '0';
            addfpond <= '0';
            addfpsclr <= '1';
            i2c_mem_addra <= std_logic_vector (to_unsigned (c_ram_x0720_lsb, 12));
            ram := i2c_mem_douta_i;
          else state := s14; end if;
        when s15 => -- XXX fi2fl ram0720 twice for remove vptat_ft reg (compare syn)
          addfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <= ram & i2c_mem_douta_i;
          if (fixed2floatrdy = '1') then state := s16;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            --synthesis translate_off
            report_error("(vptat ram 1686) twice", fixed2floatr, 1686.0);
            warning_neq_fp (fixed2floatr, x"44d2c000", "(vptat ram 1686) twice");
            --synthesis translate_on
            --synthesis translate_off
            --report_error("================ CalculateTa vptat", fixed2floatr, 0.0);
            --synthesis translate_on
            i2c_mem_addra <= std_logic_vector (to_unsigned (c_eeprom_x2432_msb, 12));
          else state := s15; end if;
        when s16 =>
          fixed2floatsclr <= '0';
          -- vptat/(vptat*alphaptat+vbe)
          divfpce <= '1';
          divfpa <= fixed2floatr; -- vptat
          divfpb <= addfpr; -- vptat*alphaptat+vbe
          divfpond <= '1';
          o_kvptat_ena <= '1';
          o_kvptat_adr <= kvptat_ee_a;
--          nibble_in1 <= kvptat_ee_a;
          if (divfprdy = '1') then state := s18;
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
          else state := s16; end if;
        when s18 =>
          divfpsclr <= '0';
          -- xxx move to s23
          -- kvptat*deltaV
          mulfpce <= '1';
          mulfpa <= i_rom_constants_float; -- kvptat
--          mulfpa <= nibble_out1; -- kvptat
          mulfpb <= subfpr; -- XXX s1c deltaV = Vdd - 3.3
          --synthesis translate_off
          report_error("(kvptat eeprom 0.0021972656250000)", i_rom_constants_float, 0.0021972656250000);
          warning_neq_fp (i_rom_constants_float, x"3b100000", "(kvptat eeprom 0.0021972656250000)");
          --synthesis translate_on
          mulfpond <= '1';
          if (mulfprdy = '1') then state := s22;
            o_kvptat_ena <= '0';
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
            --synthesis translate_off
            --report_error("================ CalculateTa ExtractKvPTATParameter_kvptat", i_rom_constants_float, 0.0);
            --synthesis translate_on
            --synthesis translate_off
            --report_error("================ CalculateTa 1", mulfpr, 0.0);
            --synthesis translate_on
          else state := s18; end if;
        when s22 =>
          mulfpsclr <= '0';
          -- 1+kvptat*deltaV
          addfpce <= '1';
          addfpa <= C_P1; -- 1
          addfpb <= mulfpr; -- kvptat*deltaV
          addfpond <= '1';
          if (addfprdy = '1') then state := s23;
            addfpce <= '0';
            addfpond <= '0';
            addfpsclr <= '1';
            --synthesis translate_off
            --report_error("================ CalculateTa 2", addfpr, 0.0);
            --synthesis translate_on
          else state := s22; end if;
        when s23 => -- XXX move from s18
          addfpsclr <= '0';
          -- vptat/(vptat*alphaptat+vbe)*2^18
          mulfpce <= '1';
          mulfpa <= divfpr; -- s16 vptat/(vptat*alphaptat+vbe)
          mulfpb <= C_2POW18; -- 2^18
          mulfpond <= '1';
          if (mulfprdy = '1') then state := s24;
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
            --synthesis translate_off
            report_error("(vptatart/ptatart calc 12578.9726562500000000)", mulfpr, 12578.9726562500000000);
            warning_neq_fp (mulfpr, x"46448be4", "(vptatart/ptatart calc 12578.9726562500000000)");
            --synthesis translate_on
          else state := s23; end if;
        when s24 =>
          mulfpsclr <= '0';
          -- vptatart/(1+kvptat*deltaV)
          divfpce <= '1';
          divfpa <= mulfpr; -- s23 vptatart =  (vptat/(vptat*alphaptat+vbe))*2^18
          divfpb <= addfpr; -- s22 1+kvptat*deltaV
          divfpond <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (c_eeprom_x2431_msb, 12));
          if (divfprdy = '1') then state := s25;
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
            --synthesis translate_off
            --report_error("================ CalculateTa 3", divfpr, 0.0);
            --synthesis translate_on
            i2c_mem_addra <= std_logic_vector (to_unsigned (c_eeprom_x2431_lsb, 12));
            ram := i2c_mem_douta_i;
          else state := s24; end if;
        when s25 =>
          divfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <= ram & i2c_mem_douta_i; -- vptat25 msb & lsb
          if (fixed2floatrdy = '1') then state := s26;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            --synthesis translate_off
            report_error("(vptat25 eeprom 12196)", fixed2floatr, 12196.0);
            warning_neq_fp (fixed2floatr, x"463e9000", "(vptat25 eeprom 12196)");
            --synthesis translate_on
            --synthesis translate_off
            --report_error("================ CalculateTa vptat25", fixed2floatr, 0.0);
            --synthesis translate_on
          else state := s25; end if;
        when s26 =>
          fixed2floatsclr <= '0';
          -- (vptatart/(1+kvptat*deltaV))-vptat25
          subfpce <= '1';
          subfpa <= divfpr; -- vptatart/(1+kvptat*deltaV)
          subfpb <= fixed2floatr; -- vptat25
          subfpond <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (c_eeprom_x2432_msb, 12));
          if (subfprdy = '1') then state := s26a;
            subfpce <= '0';
            subfpond <= '0';
            subfpsclr <= '1';
            --synthesis translate_off
            --report_error("================ CalculateTa 4", subfpr, 0.0);
            --synthesis translate_on
            i2c_mem_addra <= std_logic_vector (to_unsigned (c_eeprom_x2432_lsb, 12));
            tmp := ktptat_msb_ee_a;
          else state := s26; end if;
        when s26a =>
          subfpsclr <= '0';
          fixed2floatce <= '1';
          fixed2floatond <= '1';
          fixed2floata <=
          tmp (1) & tmp (1) & 
          tmp (1) & tmp (1) & 
          tmp (1) & tmp (1) & 
          tmp & i2c_mem_douta; -- ee2432 & 0x03ff
          if (fixed2floatrdy = '1') then state := s26b;
            fixed2floatce <= '0';
            fixed2floatond <= '0';
            fixed2floatsclr <= '1';
            --synthesis translate_off
            --report_error("================ KtPTAT fi2fl", fixed2floatr, 0.0);
            --synthesis translate_on
          else state := s26a; end if;
        when s26b =>
          fixed2floatsclr <= '0';
          divfpce <= '1';
          divfpa <= fixed2floatr; -- ktptat
          divfpb <= C_2POW3;
          divfpond <= '1';
          if (divfprdy = '1') then state := s26c;
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
            --synthesis translate_off
            report_error("(ktptat eeprom 42.6250000000000000)", divfpr, 42.6250000000000000);
            warning_neq_fp (divfpr, x"422a8000", "(ktptat eeprom 42.6250000000000000)");
            --synthesis translate_on
          else state := s26b; end if;
        when s26c => state := s28;
          divfpsclr <= '0';
        when s28 =>
          -- ((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat
          divfpce <= '1';
          divfpa <= subfpr; -- s26 (vptatart/(1+kvptat*deltaV))-vptat25
          divfpb <= divfpr; -- s26b ktptat
          divfpond <= '1';
          --synthesis translate_off
          --report_error("================ CalculateTa ExtractKtPTATParameter_ktptat", divfpr, 0.0);
          --synthesis translate_on
          if (divfprdy = '1') then state := s30;
            divfpce <= '0';
            divfpond <= '0';
            divfpsclr <= '1';
            --synthesis translate_off
            report_error("(ta calc 383.1799621582031250)", subfpr, 383.1799621582031250);
            warning_neq_fp (subfpr, x"43bf9709", "(ta calc 383.1799621582031250)");
            --synthesis translate_on
            --synthesis translate_off
            --report_error("================ CalculateTa 5", divfpr, 0.0);
            --synthesis translate_on
          else state := s28; end if;
        when s30 =>
          divfpsclr <= '0';
          -- (((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat)+25
          addfpce <= '1';
          addfpa <= divfpr; -- ((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat
          addfpb <= C_TA0;
          addfpond <= '1';
          if (addfprdy = '1') then state := idle;
            addfpce <= '0';
            addfpond <= '0';
            addfpsclr <= '1';
            o_Ta <= addfpr;
            --o_Ta <= x"4207F54F"; -- example 33.989559
            --synthesis translate_off
            report_error("(output ta 33.9895591735839844)", addfpr, 33.9895591735839844);
            warning_neq_fp (addfpr, x"4207f54f", "(output ta 33.9895591735839844)");
            --synthesis translate_on
            --synthesis translate_off
            --report_error("================ CalculateTa Ta", addfpr, 0.0); -- (((vptatart/(1+kvptat*deltaV))-vptat25)/ktptat)+25
            --synthesis translate_on
            o_rdy <= '1';
          else state := s30; end if;
      end case;
    end if;
  end if;
end process p0;

--INIT_00 => X"3ae000003ac000003aa000003a8000003a4000003a0000003980000000000000", -- kvptat signed 6bit >31,-64 kvptat/2^12
--INIT_01 => X"3b7000003b6000003b5000003b4000003b3000003b2000003b1000003b000000",
--INIT_02 => X"3bb800003bb000003ba800003ba000003b9800003b9000003b8800003b800000",
--INIT_03 => X"3bf800003bf000003be800003be000003bd800003bd000003bc800003bc00000",
--INIT_04 => X"bbc80000bbd00000bbd80000bbe00000bbe80000bbf00000bbf80000bc000000",
--INIT_05 => X"bb880000bb900000bb980000bba00000bba80000bbb00000bbb80000bbc00000",
--INIT_06 => X"bb100000bb200000bb300000bb400000bb500000bb600000bb700000bb800000",
--INIT_07 => X"b9800000ba000000ba400000ba800000baa00000bac00000bae00000bb000000", -- 64

with nibble_in1 select nibble_out1 <=
x"3ae00000" when std_logic_vector (to_unsigned (7, 6)),
x"3ac00000" when std_logic_vector (to_unsigned (6, 6)),
x"3aa00000" when std_logic_vector (to_unsigned (5, 6)),
x"3a800000" when std_logic_vector (to_unsigned (4, 6)),
x"3a400000" when std_logic_vector (to_unsigned (3, 6)),
x"3a000000" when std_logic_vector (to_unsigned (2, 6)),
x"39800000" when std_logic_vector (to_unsigned (1, 6)),
x"00000000" when std_logic_vector (to_unsigned (0, 6)),

x"3b700000" when std_logic_vector (to_unsigned (15, 6)),
x"3b600000" when std_logic_vector (to_unsigned (14, 6)),
x"3b500000" when std_logic_vector (to_unsigned (13, 6)),
x"3b400000" when std_logic_vector (to_unsigned (12, 6)),
x"3b300000" when std_logic_vector (to_unsigned (11, 6)),
x"3b200000" when std_logic_vector (to_unsigned (10, 6)),
x"3b100000" when std_logic_vector (to_unsigned (9, 6)),
x"3b000000" when std_logic_vector (to_unsigned (8, 6)),

x"3bb80000" when std_logic_vector (to_unsigned (23, 6)),
x"3bb00000" when std_logic_vector (to_unsigned (22, 6)),
x"3ba80000" when std_logic_vector (to_unsigned (21, 6)),
x"3ba00000" when std_logic_vector (to_unsigned (20, 6)),
x"3b980000" when std_logic_vector (to_unsigned (19, 6)),
x"3b900000" when std_logic_vector (to_unsigned (18, 6)),
x"3b880000" when std_logic_vector (to_unsigned (17, 6)),
x"3b800000" when std_logic_vector (to_unsigned (16, 6)),

x"3bf80000" when std_logic_vector (to_unsigned (31, 6)),
x"3bf00000" when std_logic_vector (to_unsigned (30, 6)),
x"3be80000" when std_logic_vector (to_unsigned (29, 6)),
x"3be00000" when std_logic_vector (to_unsigned (28, 6)),
x"3bd80000" when std_logic_vector (to_unsigned (27, 6)),
x"3bd00000" when std_logic_vector (to_unsigned (26, 6)),
x"3bc80000" when std_logic_vector (to_unsigned (25, 6)),
x"3bc00000" when std_logic_vector (to_unsigned (24, 6)),

x"bbc80000" when std_logic_vector (to_unsigned (39, 6)),
x"bbd00000" when std_logic_vector (to_unsigned (38, 6)),
x"bbd80000" when std_logic_vector (to_unsigned (37, 6)),
x"bbe00000" when std_logic_vector (to_unsigned (36, 6)),
x"bbe80000" when std_logic_vector (to_unsigned (35, 6)),
x"bbf00000" when std_logic_vector (to_unsigned (34, 6)),
x"bbf80000" when std_logic_vector (to_unsigned (33, 6)),
x"bc000000" when std_logic_vector (to_unsigned (32, 6)),

x"bb880000" when std_logic_vector (to_unsigned (47, 6)),
x"bb900000" when std_logic_vector (to_unsigned (46, 6)),
x"bb980000" when std_logic_vector (to_unsigned (45, 6)),
x"bba00000" when std_logic_vector (to_unsigned (44, 6)),
x"bba80000" when std_logic_vector (to_unsigned (43, 6)),
x"bbb00000" when std_logic_vector (to_unsigned (42, 6)),
x"bbb80000" when std_logic_vector (to_unsigned (41, 6)),
x"bbc00000" when std_logic_vector (to_unsigned (40, 6)),

x"bb100000" when std_logic_vector (to_unsigned (55, 6)),
x"bb200000" when std_logic_vector (to_unsigned (54, 6)),
x"bb300000" when std_logic_vector (to_unsigned (53, 6)),
x"bb400000" when std_logic_vector (to_unsigned (52, 6)),
x"bb500000" when std_logic_vector (to_unsigned (51, 6)),
x"bb600000" when std_logic_vector (to_unsigned (50, 6)),
x"bb700000" when std_logic_vector (to_unsigned (49, 6)),
x"bb800000" when std_logic_vector (to_unsigned (48, 6)),

x"ba000000" when std_logic_vector (to_unsigned (62, 6)),
x"ba400000" when std_logic_vector (to_unsigned (61, 6)),
x"ba800000" when std_logic_vector (to_unsigned (60, 6)),
x"baa00000" when std_logic_vector (to_unsigned (59, 6)),
x"bac00000" when std_logic_vector (to_unsigned (58, 6)),
x"bae00000" when std_logic_vector (to_unsigned (57, 6)),
x"bb000000" when std_logic_vector (to_unsigned (56, 6)),
x"b9800000" when others;

--INIT_08 => X"411c0000411800004114000041100000410c0000410800004104000041000000", -- alphaptat unsigned 4bit 0-15 (alphaptat/2^2)+8
--INIT_09 => X"413c0000413800004134000041300000412c0000412800004124000041200000", -- 80
with nibble_in2 select nibble_out2 <=
x"411c0000" when x"7",
x"41180000" when x"6",
x"41140000" when x"5",
x"41100000" when x"4",
x"410c0000" when x"3",
x"41080000" when x"2",
x"41040000" when x"1",
x"41000000" when x"0",

x"41380000" when x"e",
x"41340000" when x"d",
x"41300000" when x"c",
x"412c0000" when x"b",
x"41280000" when x"a",
x"41240000" when x"9",
x"41200000" when x"8",
x"413c0000" when others;

end architecture rtl;

