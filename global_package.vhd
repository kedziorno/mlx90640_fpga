-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   09:00:00 03/15/2025
-- Design Name:   mlx90640_fpga
-- Module Name:   global_package
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Package with all constants, used in ALL modules
--                (Rest is in commented code with XXX)
--
-- Dependencies:
--  - Files:
--    ieee_proposed library (fphdl)
--  - Modules: -
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules: -
--  - Revision 0.02 - i2c constants for VHDL module in synthesis
--    - Files: -
--    - Modules: -
--
-- Important objects:
--  - For tests:
--    - ap_slv2fp - convert std_logic_vector to float in tb 
--    - report_error - display when current /= expected values
--                      or for dump value when expected equal zero 
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
--synthesis translate_off
USE ieee.math_real.all;
--synthesis translate_on

--synthesis translate_off
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.float_pkg.all;
use ieee_proposed.numeric_std_additions.all;
use ieee_proposed.standard_additions.all;
use ieee_proposed.std_logic_1164_additions.all;
--synthesis translate_on

package global_package is

  -- main constants
  constant c_memory_i2c_address_bits  : integer := 12;
  constant c_memory_i2c_data_bits     : integer := 8;
  subtype  i2c_memory_address_bits_st is std_logic_vector (c_memory_i2c_address_bits - 1 downto 0);
  subtype  i2c_memory_data_bits_st    is std_logic_vector (c_memory_i2c_data_bits - 1 downto 0);
  subtype  fp32                       is std_logic_vector (31 downto 0); -- fp32
  subtype  slv16                      is std_logic_vector (15 downto 0); -- fi -> fp32
  subtype  slv8                       is std_logic_vector (7 downto 0);
  subtype  slv6                       is std_logic_vector (5 downto 0);
  subtype  slv4                       is std_logic_vector (3 downto 0);
  subtype  slv2                       is std_logic_vector (1 downto 0);

  constant c_rows           : integer := 24; -- matrix pixels y
  constant c_cols           : integer := 32; -- matrix pixels x
  constant c_matrix_pixels  : integer := c_rows * c_cols;

  constant c_pixgain_st : integer := 1664; -- pixgain start - eeprom max + 1
  constant c_pixgain_sz : integer := c_matrix_pixels; -- pixgain size

  -- 10.7. address map, p. 16
  -- _st - start, _ed - end, _sz - size
  -- eeprom cell size have 2 bytes (16 bit) [(_ed - _st + 1) * 2]
  constant c_rom_st       : integer := 16#0000#; -- 0x0000
  constant c_rom_ed       : integer := 16#03ff#; -- 0x03ff
  constant c_ram_st       : integer := 16#0400#; -- 0x0400
  constant c_ram_ed       : integer := 16#07ff#; -- 0x07ff
  constant c_eeprom_st    : integer := 16#2400#; -- 0x2400
  constant c_eeprom_ed    : integer := 16#273f#; -- 0x273f
  constant c_reg1_mlx_st  : integer := 16#8000#; -- 0x8000
  constant c_reg1_mlx_ed  : integer := 16#800c#; -- 0x800c
  constant c_reg_usr_st   : integer := 16#800d#; -- 0x800d
  constant c_reg_usr_ed   : integer := 16#8010#; -- 0x8010
  constant c_reg2_mlx_st  : integer := 16#8011#; -- 0x8011
  constant c_reg2_mlx_ed  : integer := 16#8016#; -- 0x8016
  constant c_rom_sz       : integer := (c_rom_ed      - c_rom_st      + 1) * 2;
  constant c_ram_sz       : integer := (c_ram_ed      - c_ram_st      + 1) * 2;
  constant c_eeprom_sz    : integer := (c_eeprom_ed   - c_eeprom_st   + 1) * 2;
  constant c_reg1_mlx_sz  : integer := (c_reg1_mlx_ed - c_reg1_mlx_st + 1) * 2;
  constant c_reg_usr_sz   : integer := (c_reg_usr_ed  - c_reg_usr_st  + 1) * 2;
  constant c_reg2_mlx_sz  : integer := (c_reg2_mlx_ed - c_reg2_mlx_st + 1) * 2;

  function extend_8_to_16 (a : slv8) return slv16;

  -- 5. glossary of terms, p. 7
  -- 11.2.1.2. example calibration data, p. 30
  -- eeprom constants (16 bit each)
  constant c_eeprom_x2410 : integer := 16#2410#; -- k_ptat(alpha_ptat),scale_occ_row,scale_occ_column,scale_occ_remnand[4/4/4/4]
  constant c_eeprom_x2411 : integer := 16#2411#; -- pix_os_average[16] (offset_average)
  constant c_eeprom_x2412 : integer := 16#2412#; -- occ_rows_04,occ_rows_03,occ_rows_02,occ_rows_01[4/4/4/4]
  constant c_eeprom_x2413 : integer := c_eeprom_x2412 + 1; -- occ_rows_08,occ_rows_07,occ_rows_06,occ_rows_05[4/4/4/4]
  constant c_eeprom_x2414 : integer := c_eeprom_x2412 + 2; -- occ_rows_12,occ_rows_11,occ_rows_10,occ_rows_09[4/4/4/4]
  constant c_eeprom_x2415 : integer := c_eeprom_x2412 + 3; -- occ_rows_16,occ_rows_15,occ_rows_14,occ_rows_13[4/4/4/4]
  constant c_eeprom_x2416 : integer := c_eeprom_x2412 + 4; -- occ_rows_20,occ_rows_19,occ_rows_18,occ_rows_17[4/4/4/4]
  constant c_eeprom_x2417 : integer := c_eeprom_x2412 + 5; -- occ_rows_24,occ_rows_23,occ_rows_22,occ_rows_21[4/4/4/4]
  constant c_eeprom_x2418 : integer := 16#2418#; -- occ_columns_04,occ_columns_03,occ_columns_02,occ_columns_01[4/4/4/4]
  constant c_eeprom_x2419 : integer := c_eeprom_x2418 + 1; -- occ_columns_08,occ_columns_07,occ_columns_06,occ_columns_05[4/4/4/4]
  constant c_eeprom_x241a : integer := c_eeprom_x2418 + 2; -- occ_columns_12,occ_columns_11,occ_columns_10,occ_columns_09[4/4/4/4]
  constant c_eeprom_x241b : integer := c_eeprom_x2418 + 3; -- occ_columns_16,occ_columns_15,occ_columns_14,occ_columns_13[4/4/4/4]
  constant c_eeprom_x241c : integer := c_eeprom_x2418 + 4; -- occ_columns_20,occ_columns_19,occ_columns_18,occ_columns_17[4/4/4/4]
  constant c_eeprom_x241d : integer := c_eeprom_x2418 + 5; -- occ_columns_24,occ_columns_23,occ_columns_22,occ_columns_21[4/4/4/4]
  constant c_eeprom_x241e : integer := c_eeprom_x2418 + 6; -- occ_columns_28,occ_columns_27,occ_columns_26,occ_columns_25[4/4/4/4]
  constant c_eeprom_x241f : integer := c_eeprom_x2418 + 7; -- occ_columns_32,occ_columns_31,occ_columns_30,occ_columns_29[4/4/4/4]
  constant c_eeprom_x2420 : integer := 16#2420#; -- alpha_scale,scale_acc_row,scale_acc_column,acc_scale_remnand[4/4/4/4]
  constant c_eeprom_x2421 : integer := 16#2421#; -- pix_sensitivity_average[16] (alpha_reference)
  constant c_eeprom_x2422 : integer := 16#2422#; -- acc_rows_04,acc_rows_03,acc_rows_02,acc_rows_01[4/4/4/4]
  constant c_eeprom_x2423 : integer := c_eeprom_x2422 + 1; -- acc_rows_08,acc_rows_07,acc_rows_06,acc_rows_05[4/4/4/4]
  constant c_eeprom_x2424 : integer := c_eeprom_x2422 + 2; -- acc_rows_12,acc_rows_11,acc_rows_10,acc_rows_09[4/4/4/4]
  constant c_eeprom_x2425 : integer := c_eeprom_x2422 + 3; -- acc_rows_16,acc_rows_15,acc_rows_14,acc_rows_13[4/4/4/4]
  constant c_eeprom_x2426 : integer := c_eeprom_x2422 + 4; -- acc_rows_20,acc_rows_19,acc_rows_18,acc_rows_17[4/4/4/4]
  constant c_eeprom_x2427 : integer := c_eeprom_x2422 + 5; -- acc_rows_24,acc_rows_23,acc_rows_22,acc_rows_11[4/4/4/4]
  
  constant c_eeprom_x2428 : integer := 16#2428#;
  
  constant c_eeprom_x2430 : integer := 16#2430#; -- gain[16]
  constant c_eeprom_x2431 : integer := 16#2431#; -- vptat25[16]
  constant c_eeprom_x2432 : integer := 16#2432#; -- kvptat,ktptat[6/10]
  constant c_eeprom_x2433 : integer := 16#2433#; -- kvdd,vdd25[8/8]
  constant c_eeprom_x2438 : integer := 16#2438#; -- resolution_control_cal,kv_scale,kta_scale_1,kta_scale_2[2/4/4/4]
  constant c_eeprom_x2439 : integer := 16#2439#; -- cp_sp_1/sp_0_ratio,alpha_cp_sp_0[6/10] (cp_p1_p0_ratio,alpha_cp_subpage_0)
  constant c_eeprom_x243c : integer := 16#243c#; -- ksta,tgcee[8/8]
  constant c_eeprom_x2440 : integer := 16#2440#; -- offset_pixel_rc,alpha_pixel_rc,kta_rc,outlier[6/6/3/1]
  constant c_ram_x0700    : integer := 16#0700#; -- vbe[16]
  constant c_ram_x070a    : integer := 16#070a#; -- gain[16]
  constant c_ram_x0720    : integer := 16#0720#; -- ta_ptat[16] (vptat,ptat)
  constant c_ram_x072a    : integer := 16#072a#; -- vddpix[16]
  constant c_ram_x800d    : slv16   := x"1901"; -- manufacturer default value

  -- 11.1.1. restoring the vdd sensor parameters, p. 22
  constant c_eeprom_x2433_off : integer := c_eeprom_x2433 - c_eeprom_st;
  constant c_eeprom_x2433_msb : integer := c_eeprom_x2433_off * 2 + 0;
  constant c_eeprom_x2433_lsb : integer := c_eeprom_x2433_off * 2 + 1;

  -- 11.2.2.1. resolution restore, p. 35
  constant c_ram_x800d_and_x0c00 : slv16 := c_ram_x800d and x"0c00";
  alias resolution_reg_a         : slv2 is c_ram_x800d_and_x0c00 (11 downto 10);

  -- 11.1.17. Restoring the resolution control coefficient, p. 29
  constant c_eeprom_x2438_off : integer := c_eeprom_x2438 - c_eeprom_st;
  constant c_eeprom_x2438_msb : integer := c_eeprom_x2438_off * 2 + 0;
  constant c_eeprom_x2438_lsb : integer := c_eeprom_x2438_off * 2 + 1;

  -- 11.2.2.2. supply voltage value calculation (common for all pixels), p. 36
  constant c_ram_x072a_off : integer := c_ram_x072a - c_ram_st;
  constant c_ram_x072a_msb : integer := c_eeprom_sz + (c_ram_x072a_off * 2) + 0;
  constant c_ram_x072a_lsb : integer := c_eeprom_sz + (c_ram_x072a_off * 2) + 1;

  -- 11.1.16. restoring the tgc coefficient, p. 29
  constant c_eeprom_x243c_off : integer := c_eeprom_x243c - c_eeprom_st;
  constant c_eeprom_x243c_msb : integer := c_eeprom_x243c_off * 2 + 0;
  constant c_eeprom_x243c_lsb : integer := c_eeprom_x243c_off * 2 + 1;

  -- 11.2.2.4. gain parameter calculation (common for all pixels), p. 37
  constant c_ram_x070a_off : integer := c_ram_x070a - c_ram_st;
  constant c_ram_x070a_msb : integer := c_eeprom_sz + (c_ram_x070a_off * 2) + 0;
  constant c_ram_x070a_lsb : integer := c_eeprom_sz + (c_ram_x070a_off * 2) + 1;
  constant c_eeprom_x2430_off : integer := c_eeprom_x2430 - c_eeprom_st;
  constant c_eeprom_x2430_msb : integer := c_eeprom_x2430_off * 2 + 0;
  constant c_eeprom_x2430_lsb : integer := c_eeprom_x2430_off * 2 + 1;

  -- 11.1.2. Restoring the ta sensor parameters, p. 22
  constant c_ram_x0720_off : integer := c_ram_x0720 - c_ram_st;
  constant c_ram_x0720_msb : integer := c_eeprom_sz + (c_ram_x0720_off * 2) + 0;
  constant c_ram_x0720_lsb : integer := c_eeprom_sz + (c_ram_x0720_off * 2) + 1;
  constant c_eeprom_x2432_off : integer := c_eeprom_x2432 - c_eeprom_st;
  constant c_eeprom_x2432_msb : integer := c_eeprom_x2432_off * 2 + 0;
  constant c_eeprom_x2432_lsb : integer := c_eeprom_x2432_off * 2 + 1;
  constant c_eeprom_x2431_off : integer := c_eeprom_x2431 - c_eeprom_st;
  constant c_eeprom_x2431_msb : integer := c_eeprom_x2431_off * 2 + 0;
  constant c_eeprom_x2431_lsb : integer := c_eeprom_x2431_off * 2 + 1;
  constant c_eeprom_x2410_off : integer := c_eeprom_x2410 - c_eeprom_st;
  constant c_eeprom_x2410_msb : integer := c_eeprom_x2410_off * 2 + 0;
  constant c_eeprom_x2410_lsb : integer := c_eeprom_x2410_off * 2 + 1;
  constant c_ram_x0700_off : integer := c_ram_x0700 - c_ram_st;
  constant c_ram_x0700_msb : integer := c_eeprom_sz + (c_ram_x0700_off * 2) + 0;
  constant c_ram_x0700_lsb : integer := c_eeprom_sz + (c_ram_x0700_off * 2) + 1;
  
  -- 11.2.2.8. normalizing to sensitivity, p. 43
  -- 11.1.4. restoring the sensitivity, p. 24
  constant c_eeprom_x2422_off : integer := c_eeprom_x2422 - c_eeprom_st;
  constant c_eeprom_x2422_msb : integer := c_eeprom_x2422_off * 2 + 0;
  constant c_eeprom_x2422_lsb : integer := c_eeprom_x2422_off * 2 + 1;
  constant c_eeprom_x2423_off : integer := c_eeprom_x2422_off + 1;
  constant c_eeprom_x2423_msb : integer := c_eeprom_x2423_off * 2 + 0;
  constant c_eeprom_x2423_lsb : integer := c_eeprom_x2423_off * 2 + 1;
  constant c_eeprom_x2424_off : integer := c_eeprom_x2422_off + 2;
  constant c_eeprom_x2424_msb : integer := c_eeprom_x2424_off * 2 + 0;
  constant c_eeprom_x2424_lsb : integer := c_eeprom_x2424_off * 2 + 1;
  constant c_eeprom_x2425_off : integer := c_eeprom_x2422_off + 3;
  constant c_eeprom_x2425_msb : integer := c_eeprom_x2425_off * 2 + 0;
  constant c_eeprom_x2425_lsb : integer := c_eeprom_x2425_off * 2 + 1;
  constant c_eeprom_x2426_off : integer := c_eeprom_x2422_off + 4;
  constant c_eeprom_x2426_msb : integer := c_eeprom_x2426_off * 2 + 0;
  constant c_eeprom_x2426_lsb : integer := c_eeprom_x2426_off * 2 + 1;
  constant c_eeprom_x2427_off : integer := c_eeprom_x2422_off + 5;
  constant c_eeprom_x2427_msb : integer := c_eeprom_x2427_off * 2 + 0;
  constant c_eeprom_x2427_lsb : integer := c_eeprom_x2427_off * 2 + 1;

  -- 11.2.2.8. normalizing to sensitivity, p. 43
  -- 11.1.3. restoring the offset, p. 23
  -- 11.2.2.5.2. offset calculation, p. 38
  constant c_eeprom_x2421_off : integer := c_eeprom_x2421 - c_eeprom_st;
  constant c_eeprom_x2421_msb : integer := c_eeprom_x2421_off * 2 + 0;
  constant c_eeprom_x2421_lsb : integer := c_eeprom_x2421_off * 2 + 1;
  constant c_eeprom_x2420_off : integer := c_eeprom_x2420 - c_eeprom_st;
  constant c_eeprom_x2420_msb : integer := c_eeprom_x2420_off * 2 + 0;
  constant c_eeprom_x2420_lsb : integer := c_eeprom_x2420_off * 2 + 1;
  constant c_eeprom_x2440_off : integer := c_eeprom_x2440 - c_eeprom_st;
  constant c_eeprom_x2440_msb : integer := c_eeprom_x2440_off * 2 + 0;
  constant c_eeprom_x2440_lsb : integer := c_eeprom_x2440_off * 2 + 1;
  
  -- 11.2.2.8. normalizing to sensitivity, p. 43
  -- 11.1.12. restoring the Sensitivity, p. 28
  constant c_eeprom_x2439_off : integer := c_eeprom_x2439 - c_eeprom_st;
  constant c_eeprom_x2439_msb : integer := c_eeprom_x2439_off * 2 + 0;
  constant c_eeprom_x2439_lsb : integer := c_eeprom_x2439_off * 2 + 1;

  -- 11.2.2.5.2. offset calculation, p. 38
  -- 11.1.3. restoring the offset, p. 23
  constant c_eeprom_x2412_off : integer := c_eeprom_x2412 - c_eeprom_st;
  constant c_eeprom_x2412_msb : integer := c_eeprom_x2412_off * 2 + 0;
  constant c_eeprom_x2412_lsb : integer := c_eeprom_x2412_off * 2 + 1;
  constant c_eeprom_x2418_off : integer := c_eeprom_x2418 - c_eeprom_st;
  constant c_eeprom_x2418_msb : integer := c_eeprom_x2418_off * 2 + 0;
  constant c_eeprom_x2418_lsb : integer := c_eeprom_x2418_off * 2 + 1;
  constant c_eeprom_x2428_off : integer := c_eeprom_x2428 - c_eeprom_st;
  constant c_eeprom_x2428_msb : integer := c_eeprom_x2428_off * 2 + 0;
  constant c_eeprom_x2428_lsb : integer := c_eeprom_x2428_off * 2 + 1;

  -- 11.2.2.5.2. offset calculation, p. 38
  -- 11.1.3. Restoring the offset, p. 23
  constant c_eeprom_x2411_off : integer := c_eeprom_x2411 - c_eeprom_st;
  constant c_eeprom_x2411_msb : integer := c_eeprom_x2411_off * 2 + 0;
  constant c_eeprom_x2411_lsb : integer := c_eeprom_x2411_off * 2 + 1;

  constant ram_0x0708_msb : integer := c_eeprom_sz + (776 * 2) + 0; -- pixgain_cp_sp0
  constant ram_0x0708_lsb : integer := c_eeprom_sz + (776 * 2) + 1; -- pixgain_cp_sp0
  constant ram_0x0728_msb : integer := c_eeprom_sz + (808 * 2) + 0; -- pixgain_cp_sp1
  constant ram_0x0728_lsb : integer := c_eeprom_sz + (808 * 2) + 1; -- pixgain_cp_sp1
  constant eeprom_0x2422_msb : integer := 32 * 2 + 1; -- accrow b,a
  constant eeprom_0x2422_lsb : integer := 32 * 2 + 0; -- accrow d,c
  constant eeprom_0x2421_lsb : integer := 32 * 2 + 2;
  constant eeprom_0x2421_msb : integer := 32 * 2 + 3;
  constant eeprom_0x2413_msb : integer := 32 + 4 + 1; -- occrow b,a
  constant eeprom_0x2413_lsb : integer := 32 + 4 + 0; -- occrow d,c
  constant eeprom_0x2434_lsb : integer := 52 * 2 + 0; -- kvijee
  constant eeprom_0x2434_msb : integer := 52 * 2 + 1; -- kvijee
  constant eeprom_0x2436_lsb : integer := 54 * 2 + 0; -- ktarcee_oo
  constant eeprom_0x2436_msb : integer := 54 * 2 + 1; -- ktarcee_eo
  constant eeprom_0x2437_lsb : integer := 54 * 2 + 2; -- ktarcee_oe
  constant eeprom_0x2437_msb : integer := 54 * 2 + 3; -- ktarcee_ee
  constant eeprom_0x243a_msb : integer := 58 * 2 + 0; -- ram
  constant eeprom_0x243a_lsb : integer := 58 * 2 + 1; -- ram
  constant eeprom_0x243b_msb : integer := 59 * 2 + 0; -- kvcpee
  constant eeprom_0x243b_lsb : integer := 59 * 2 + 1; -- ktacpee
  constant eeprom_0x243c_msb : integer := 60 * 2 + 0; -- kstaee
  constant eeprom_0x243c_lsb : integer := 60 * 2 + 1; -- tgcee
  constant eeprom_0x243d_msb : integer := 61 * 2 + 0; -- ksto2ee 0xff00
  constant eeprom_0x243f_lsb : integer := 63 * 2 + 1; -- kstoscale 0x000f

  -- color map - xxx todo make more universal (msb bit as sign)
  constant c_color_map_range_min_signed : integer := -256;
  constant c_color_map_range_max_signed : integer := 256;
  constant c_color_map_range_min_unsigned : integer := 0;
  constant c_color_map_range_max_unsigned : integer := 512;
  constant c_color_map_color_bits : integer := 24;
  subtype color_bits is std_logic_vector (c_color_map_color_bits - 1 downto 0);
  type t_color_map_rom_type_signed is array (c_color_map_range_min_signed to c_color_map_range_max_signed-1) of color_bits;
  type t_color_map_rom_type_unsigned is array (c_color_map_range_min_unsigned to c_color_map_range_max_unsigned-1) of color_bits;

  -- extract_tgc_parameters
  constant c_2pow5 : std_logic_vector (31 downto 0) := x"42000000";

  -- calculate_ta
  constant c_3dot3 : std_logic_vector (31 downto 0) := x"40533333";
  constant c_vddv0 : std_logic_vector (31 downto 0) := c_3dot3;
  constant c_2pow18 : std_logic_vector (31 downto 0) := x"48800000";  -- calculate_pixos_cp_sp
  constant c_2pow3 : std_logic_vector (31 downto 0) := x"41000000";   -- calculate_pix_gain

  -- calculate_raw_image, calculate_to
  constant c_emissivity : std_logic_vector (31 downto 0) := x"3f800000"; -- 1
  --constant c_emissivity : std_logic_vector (31 downto 0) := x"3f866666"; -- 1.05
  --constant c_emissivity : std_logic_vector (31 downto 0) := x"3f8147ae"; -- 1.01
  --constant c_emissivity : std_logic_vector (31 downto 0) := x"3f733333"; -- 0.95
  --constant c_emissivity : std_logic_vector (31 downto 0) := x"3f7d70a4"; -- 0.99
  constant c_tr : std_logic_vector (31 downto 0) := x"41000000"; -- 8
  constant c_273dot15 : std_logic_vector (31 downto 0) := x"43889333"; -- 273.15 kelvins
  constant c_1 : std_logic_vector (31 downto 0) := x"3f800000"; -- 1
  constant c_10e7 : std_logic_vector (31 downto 0) := x"4b189680"; -- 10e7
  --constant c_10e7 : std_logic_vector (31 downto 0) := x"cb189680"; -- -10e7 - neg image
  constant c_10e8 : std_logic_vector (31 downto 0) := x"4cbebc20"; -- 10e8
  --constant c_10e8 : std_logic_vector (31 downto 0) := x"ccbebc20"; -- -10e8 - neg image
  --constant c_upper : std_logic_vector (31 downto 0) := x"42800000"; -- xxx from datasheet, check tgc - 64
  --constant c_upper : std_logic_vector (31 downto 0) := x"c2800000"; -- xxx from datasheet, check tgc - -64
  constant c_upper : std_logic_vector (31 downto 0) := x"00000000"; -- xxx from datasheet, check tgc - 0
  --constant c_upper : std_logic_vector (31 downto 0) := c_1; -- xxx from datasheet, check tgc - 1
  -- xxx syn
  constant c_addfp_wait : integer := 32;
  constant c_mulfp_wait : integer := 32;
  -- xxx sim
  --constant c_addfp_wait : integer := 16;
  --constant c_mulfp_wait : integer := 16;

  -- mem_ramb16_s36_s36_x2
  constant c_mode_com : integer := 0;
  constant c_mode_seq : integer := 1;

  -- mem_switchpattern
  constant c_type_lut : integer := 0;
  constant c_type_rom1 : integer := 1;
  constant c_type_rom2 : integer := 2;

  -- calculate_vdd
  constant c_3dot3_ft : std_logic_vector (31 downto 0) := x"40533333";
  constant c_2pow5_ft : std_logic_vector (31 downto 0) := x"42000000";
  constant c_2pow13_ft : std_logic_vector (31 downto 0) := x"46000000";
  constant c_256_ft : std_logic_vector (31 downto 0) := x"43800000";
  constant resreg : std_logic_vector (15 downto 0) := x"1901" and x"0c00";

  -- calcualteacc
	constant const2 : std_logic_vector (31 downto 0) := x"40000000";
	constant scalealpha : std_logic_vector (31 downto 0) := x"358637bd"; -- 0.000001

	-- calculate_alpha_compensation
	constant c_p1 : std_logic_vector (31 downto 0) := x"3f800000"; -- +1
  constant c_m1 : std_logic_vector (31 downto 0) := x"bf800000"; -- -1
  constant c_2pow13 : std_logic_vector (31 downto 0) := x"46000000"; -- 2^13
  constant c_ta0 : std_logic_vector (31 downto 0) := x"41c80000"; -- temperature ambient ~25.0st c
  constant c_zero : std_logic_vector (31 downto 0) := x"00000000";

  --constant c_tb_data_file : string := "tb_data";
  --file fptr : text;
  constant c_byte_size : integer := 8;
  type array1 is array(natural range <>) of std_logic_vector (c_byte_size - 1 downto 0);
  
--  constant c_clock_board_frequency : natural := 100_000_000; -- XXX ml507/ml402/nexys2
--  constant c_clock_board_frequency : natural := 27_000_000; -- XXX ml507/ml402/nexys2
--  constant c_clock_board_frequency : natural := 33_000_000; -- XXX ml507/ml402/nexys2
--  constant c_clock_board_frequency : natural := 50_000_000; -- XXX nexys2
  constant c_clock_board_frequency : natural := 25_000_000; -- XXX nexys2
--  constant c_clock_i2c_frequency : natural := 1_000_000; -- XXX mlx90640 have default 1us clock period
--  constant c_clock_i2c_frequency : natural := 800_000; -- XXX mlx90640 have default 1us clock period
  constant c_clock_i2c_frequency : natural := 500_000;
--  constant c_clock_i2c_frequency : natural := 100_000;
--  constant c_clock_i2c_frequency : natural := 10;
  constant c_i2c_stretch : natural := c_clock_i2c_frequency/c_clock_board_frequency;
  constant c_i2c_clock_divider : natural := 4;
  constant c_i2c_address_bits : natural := 7;
  constant c_i2c_data_bits : natural := 8;
  constant c_i2c_address_read : boolean := true;
  constant c_i2c_address_write : boolean := false;
  constant c_i2c_data_ack : boolean := false;
  constant c_i2c_data_nak : boolean := true;
  constant c_i2c_bits_length : natural := 9;
  constant c_i2c_packet_data_size : integer := 3340; -- number bytes from i2c

--synthesis translate_off
  -- xxx https://comp.lang.vhdl.narkive.com/b8uinwjr/convert-boolean-to-std-logic
  function to_std_logic (l : boolean)   return std_ulogic;
  function to_std_logic (l : character) return boolean;
  function int2hex      (l : character) return natural;

	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2fraytrac%2fbranches%2ffp%2farithpack.vhd&rev=163
	function ap_slv2fp (sl:std_logic_vector) return real;
	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2fraytrac%2fbranches%2ffp%2farithpack.vhd&rev=163
	function ap_slv2int (sl:std_logic_vector) return integer;
	function to_string_1 ( s : std_logic_vector ) return string;
	procedure report_error (constant str : string; sl : std_logic_vector; constant ec : real; constant is_minimal : boolean := true);
	procedure report_error_sfixed (constant s1, s2 : integer; constant str : string; sl : std_logic_vector; constant ec : real);
  procedure warning_neq_fp (a, b : in float32; info : in string := ""; use_epsilon : boolean := false; epsilon : real := 0.5; constant is_minimal : boolean := true);
  procedure warning_neq_fp (a : in std_logic_vector (31 downto 0); b : in real; info : in string := ""; use_epsilon : boolean := false; epsilon : real := 0.5; constant is_minimal : boolean := true);
  procedure warning_neq_fp (a, b : in std_logic_vector (31 downto 0); info : in string := ""; use_epsilon : boolean := false; epsilon : real := 0.5; constant is_minimal : boolean := true);
  procedure assertepsilon (x, y : in real; epsilon : in real := 1.0e-5; message : in string := "");

  procedure wait_idle(signal idle : out std_logic;constant n : natural;constant clock_period : in time);
  procedure sda_start(signal sda_data : out std_logic;constant clock_period : in time);
  procedure sda_stop(signal sda_data : out std_logic;constant clock_period : in time);
  procedure sda_address_7bit(signal sda_data : out std_logic;constant address : in std_logic_vector(c_i2c_address_bits - 1 downto 0);constant address_rw : in boolean;conclock_period : in time);
  procedure sda_data_8bit(signal sda_data : out std_logic;constant data : in std_logic_vector(c_i2c_data_bits - 1 downto 0);constant data_ack : in boolean;constant clock_period : in time);
--synthesis translate_on

end package global_package;

package body global_package is

  function extend_8_to_16 (a : slv8) return slv16 is
  begin
    return a (7) & a (7) & a (7) & a (7) & a(7) & a(7) & a(7) & a(7) & a;
  end function extend_8_to_16;

--synthesis translate_off
	procedure report_error (constant str : string; sl : std_logic_vector; constant ec : real; constant is_minimal : boolean := true) is
		variable a : float32;
		variable b : float32 := to_float (ec, a);
		variable actual : real := ap_slv2fp (sl);
		variable expected : real := to_real (b);
		variable actuals,expecteds : string (1 to 13);
	begin
		if actual >= real(0.0) then
			actuals := " " & real'image (actual);
		else
			actuals := real'image (actual);
		end if;
		if expected >= real(0.0) then
			expecteds := " " & real'image (expected);
		else
			expecteds := real'image (expected);
		end if;
    if (is_minimal = false) then
      --assert actual = expected report "actual = expected : " & cr & actuals & cr & expecteds & cr & to_hex_string (sl) & cr & to_hex_string (b) & cr & to_string_1 (sl) & cr & to_string_1 (to_slv (b)) severity note;
      report str & " : " & actuals & " = " & expecteds & " " & to_hex_string (sl) & " " & to_hex_string (b) & " " & to_string_1 (sl) & " " & to_string_1 (to_slv (b)) severity note;
		end if;
    return;
	end procedure report_error;

	procedure report_error_sfixed (constant s1, s2 : integer; constant str : string; sl : std_logic_vector; constant ec : real) is
		variable a : sfixed (s1 downto -s2+1);
    variable b : sfixed (s1 downto -s2+1) := to_sfixed (sl, a);
	begin
		report str & " : " & to_string (to_real (b)) & " " & to_hex_string (b) & " " & to_hex_string (sl) & " " & to_string_1 (sl) & " " & to_string_1 (to_slv (b)) severity note;
		return;
	end procedure report_error_sfixed;

	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2fraytrac%2fbranches%2ffp%2farithpack.vhd&rev=163
	function ap_slv2int (sl:std_logic_vector) return integer is
		alias s : std_logic_vector (sl'high downto sl'low) is sl;
		variable i : integer; 
	begin
		i:=0;
		for index in s'high downto s'low loop
			if s(index)='1' then
				i:=i*2+1;
			else
				i:=i*2;
			end if;
		end loop;
		return i;
	end function;

	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2fraytrac%2fbranches%2ffp%2farithpack.vhd&rev=163
  function ap_slv2fp(sl:std_logic_vector) return real is
    variable frc:integer;
    alias s: std_logic_vector(31 downto 0) is sl;
    variable f,expo: real;
  begin
    expo:=real(ap_slv2int(s(30 downto 23)) - 127);
    expo:=(2.0)**(expo);
    frc:=ap_slv2int('1'&s(22 downto 0));
    f:=real(frc)*(2.0**(-23.0));
    f:=f*real(expo);
    if s(31)='1' then
      return -f;
    else
      return f;
    end if;
  end function;

	function to_string_1 ( s : std_logic_vector )
		return string
	is
		variable r : string ( s'length downto 1 ) ;
	begin
		for i in s'range  loop
			r(i+1) := std_logic'image (s(i))(2);
		end loop ;
		return r ;
	end function ;

  procedure assertepsilon (x, y : in real; epsilon : in real := 1.0e-5; message : in string := "") is
    variable vabs : real := 0.0;
  begin
    vabs := abs (x - y);
    assert     (vabs < epsilon) report message & " " & real'image (epsilon) & " <  " & real'image (vabs) severity note;
    assert not (vabs < epsilon) report message & " " & real'image (epsilon) & " >= " & real'image (vabs) severity warning;
  end procedure assertepsilon;

  procedure warning_neq_fp (a, b : in float32; info : in string := ""; use_epsilon : boolean := false; epsilon : real := 0.5; constant is_minimal : boolean := true) is
    variable src : float32 := a;
    variable dst : float32 := b;
    variable dif : float32;
  begin
    if (is_minimal = false) then
      if (use_epsilon = true) then
        dif := abs (dst - src);
        if (dif >= epsilon) then
          --assert not (src = dst) report info & ht & " current == expected " & ht & real'image (to_real(src)) & " == " & real'image (to_real(dst)) & ht & to_hex_string(src) & " == " & (to_hex_string(dst)) severity note;
          assert     (src = dst) report info & ht & " current /= expected " & ht & real'image (to_real(src)) & " /= " & real'image (to_real(dst)) & ht & to_hex_string(src) & " /= " & (to_hex_string(dst)) & ht & "differ >= epsilon (" & real'image (epsilon) & ") : " & real'image (to_real(dif)) & " > " & real'image (epsilon) severity warning;
        end if;
      else
        assert not (src = dst) report info & ht & " current == expected " & ht & real'image (to_real(src)) & " == " & real'image (to_real(dst)) & ht & to_hex_string(src) & " == " & (to_hex_string(dst)) severity note;
        assert     (src = dst) report info & ht & " current /= expected " & ht & real'image (to_real(src)) & " /= " & real'image (to_real(dst)) & ht & to_hex_string(src) & " /= " & (to_hex_string(dst)) & ht & "differ : " & real'image (to_real(dif)) severity warning;
      end if;
      --assert not (ieee.math_real.round(to_real(src)) = ieee.math_real.round(to_real(dst))) report info & ht & " current == expected " & ht & real'image (to_real(src)) & " == " & real'image (to_real(dst)) & ht & to_hex_string(src) & " == " & (to_hex_string(dst)) severity note;
      --assert     (ieee.math_real.round(to_real(src)) = ieee.math_real.round(to_real(dst))) report info & ht & " current /= expected " & ht & real'image (to_real(src)) & " /= " & real'image (to_real(dst)) & ht & to_hex_string(src) & " /= " & (to_hex_string(dst)) severity warning;
      --assertepsilon (to_real(src), to_real(dst), 1.0e-2, info);
    end if;
  end procedure;

  procedure warning_neq_fp (a : in std_logic_vector (31 downto 0); b : in real; info : in string := ""; use_epsilon : boolean := false; epsilon : real := 0.5; constant is_minimal : boolean := true) is
  begin
    warning_neq_fp (to_float (a), to_float (b), info, use_epsilon, epsilon, is_minimal);
  end procedure;

  procedure warning_neq_fp (a, b : in std_logic_vector (31 downto 0); info : in string := ""; use_epsilon : boolean := false; epsilon : real := 0.5; constant is_minimal : boolean := true) is
  begin
    warning_neq_fp (to_float (a), to_float (b), info, use_epsilon, epsilon, is_minimal);
  end procedure;
--synthesis translate_on

--synthesis translate_off
procedure wait_idle(
	signal idle : out std_logic;
	constant n : natural;
	constant clock_period : in time
) is
begin
	idle <= '1';
	wait for n * clock_period * c_i2c_stretch;
	idle <= '0';
end wait_idle;

procedure sda_start(
	signal sda_data : out std_logic;
	constant clock_period : in time
) is
	variable scl_clock_period : time := clock_period / c_i2c_clock_divider;
begin
	sda_data <= '0'; wait for 2 * scl_clock_period * c_i2c_stretch;
end procedure sda_start;

procedure sda_stop(
	signal sda_data : out std_logic;
	constant clock_period : in time
) is
	variable scl_clock_period : time := clock_period / c_i2c_clock_divider;
begin
	sda_data <= '0'; wait for 2 * scl_clock_period * c_i2c_stretch;
end procedure sda_stop;

procedure sda_address_7bit(
	signal sda_data : out std_logic;
	constant address : in std_logic_vector(c_i2c_address_bits - 1 downto 0);
	constant address_rw : in boolean;
	constant clock_period : in time
) is
	variable index : natural range 0 to c_i2c_address_bits - 1 := 0;
begin
	l0 : for i in address'range loop
		sda_data <= address(i); wait for clock_period * c_i2c_stretch;
	end loop l0;
	-- 1bit write
	sda_data <= to_std_logic(address_rw); wait for clock_period * c_i2c_stretch;
	-- 1bit ack
	sda_data <= '0'; wait for clock_period * c_i2c_stretch;
end procedure sda_address_7bit;

procedure sda_data_8bit(
	signal sda_data : out std_logic;
	constant data : in std_logic_vector(c_i2c_data_bits - 1 downto 0);
	constant data_ack : in boolean;
	constant clock_period : in time
) is
	variable index : natural range 0 to c_i2c_data_bits - 1 := 0;
begin
	l0 : for i in data'range loop
		sda_data <= data(i); wait for clock_period * c_i2c_stretch;
	end loop l0;
	-- 1bit ack
	sda_data <= to_std_logic(data_ack); wait for clock_period * c_i2c_stretch;
end procedure sda_data_8bit;

function to_std_logic(l: boolean) return std_ulogic is
begin
	if l then
		return('1');
	else
		return('0');
	end if;
end function to_std_logic;

function to_std_logic(l: character) return boolean is
begin
	if character'pos(l) = 49 then -- l '1'
		return true;
	end if;
	if character'pos(l) = 48 then -- l '0'
		return false;
	end if;
	return false;
end function to_std_logic;

function int2hex(l: character) return natural is
	constant value : natural := character'pos(l);
begin
	if (value >= character'pos('0') and value <= character'pos('9')) then
		return value - character'pos('0');
	end if;
	if (value >= character'pos('a') and value <= character'pos('f')) then
		return value - character'pos('a') + 10;
	end if;
	if (value >= character'pos('a') and value <= character'pos('f')) then
		return value - character'pos('a') + 10;
	end if;
	return 0;
end function int2hex;
--synthesis translate_on

end package body global_package;

