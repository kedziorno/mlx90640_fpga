--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : mem_switchpattern.vhf
-- /___/   /\     Timestamp : 09/03/2023 19:01:57
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family spartan3e -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/mem_switchpattern.vhf -w /home/user/workspace/mlx90640_fpga/mem_switchpattern.sch
--Design Name: mem_switchpattern
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mem_switchpattern is
   port ( i_clock   : in    std_logic; 
          i_pixel   : in    std_logic_vector (11 downto 0); 
          i_reset   : in    std_logic; 
          o_pattern : out   std_logic);
end mem_switchpattern;

architecture BEHAVIORAL of mem_switchpattern is
   attribute INIT_00     : string ;
   attribute INIT_01     : string ;
   attribute INIT_02     : string ;
   attribute INIT_03     : string ;
   attribute INIT_04     : string ;
   attribute INIT_05     : string ;
   attribute INIT_06     : string ;
   attribute INIT_07     : string ;
   attribute INIT_08     : string ;
   attribute INIT_09     : string ;
   attribute INIT_0A     : string ;
   attribute INIT_0B     : string ;
   attribute INIT_0C     : string ;
   attribute INIT_0D     : string ;
   attribute INIT_0E     : string ;
   attribute INIT_0F     : string ;
   attribute INIT_10     : string ;
   attribute INIT_11     : string ;
   attribute INIT_12     : string ;
   attribute INIT_13     : string ;
   attribute INIT_14     : string ;
   attribute INIT_15     : string ;
   attribute INIT_16     : string ;
   attribute INIT_17     : string ;
   attribute INIT_18     : string ;
   attribute INIT_19     : string ;
   attribute INIT_1A     : string ;
   attribute INIT_1B     : string ;
   attribute INIT_1C     : string ;
   attribute INIT_1D     : string ;
   attribute INIT_1E     : string ;
   attribute INIT_1F     : string ;
   attribute INIT_20     : string ;
   attribute INIT_21     : string ;
   attribute INIT_22     : string ;
   attribute INIT_23     : string ;
   attribute INIT_24     : string ;
   attribute INIT_25     : string ;
   attribute INIT_26     : string ;
   attribute INIT_27     : string ;
   attribute INIT_28     : string ;
   attribute INIT_29     : string ;
   attribute INIT_2A     : string ;
   attribute INIT_2B     : string ;
   attribute INIT_2C     : string ;
   attribute INIT_2D     : string ;
   attribute INIT_2E     : string ;
   attribute INIT_2F     : string ;
   attribute INIT_30     : string ;
   attribute INIT_31     : string ;
   attribute INIT_32     : string ;
   attribute INIT_33     : string ;
   attribute INIT_34     : string ;
   attribute INIT_35     : string ;
   attribute INIT_36     : string ;
   attribute INIT_37     : string ;
   attribute INIT_38     : string ;
   attribute INIT_39     : string ;
   attribute INIT_3A     : string ;
   attribute INIT_3B     : string ;
   attribute INIT_3C     : string ;
   attribute INIT_3D     : string ;
   attribute INIT_3E     : string ;
   attribute INIT_3F     : string ;
   attribute INIT        : string ;
   attribute SRVAL       : string ;
   attribute WRITE_MODE  : string ;
   attribute BOX_TYPE    : string ;
   signal ADDR                                : std_logic_vector (13 downto 0);
   signal do                                  : std_logic;
   signal XLXN_11                             : std_logic;
   signal XLXN_44                             : std_logic;
   signal ROM_mem_switchpattern_DI_openSignal : std_logic_vector (0 downto 0);
   component RAMB16_S1
      -- synopsys translate_off
      generic( INIT_00 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_01 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_02 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_03 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_04 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_05 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_06 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_07 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_08 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_09 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_0F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_10 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_11 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_12 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_13 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_14 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_15 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_16 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_17 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_18 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_19 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_1F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_20 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_21 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_22 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_23 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_24 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_25 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_26 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_27 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_28 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_29 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_2F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_30 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_31 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_32 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_33 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_34 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_35 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_36 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_37 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_38 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_39 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3A : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3B : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3C : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3D : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3E : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_3F : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT : bit_vector :=  b"0";
               SRVAL : bit_vector :=  b"0";
               WRITE_MODE : string :=  "NO_CHANGE");
      -- synopsys translate_on
      port ( ADDR : in    std_logic_vector (13 downto 0); 
             CLK  : in    std_logic; 
             DI   : in    std_logic_vector (0 downto 0); 
             EN   : in    std_logic; 
             SSR  : in    std_logic; 
             WE   : in    std_logic; 
             DO   : out   std_logic_vector (0 downto 0));
   end component;
   attribute INIT_00 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_01 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_02 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_03 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_04 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_05 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_06 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_07 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_08 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_09 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0A of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0B of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0C of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0D of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0E of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0F of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_10 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_11 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_12 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_13 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_14 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_15 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_16 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_17 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_18 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_19 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1A of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1B of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1C of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1D of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1E of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1F of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_20 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_21 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_22 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_23 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_24 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_25 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_26 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_27 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_28 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_29 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2A of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2B of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2C of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2D of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2E of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2F of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_30 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_31 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_32 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_33 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_34 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_35 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_36 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_37 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_38 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_39 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3A of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3B of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3C of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3D of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3E of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3F of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT of RAMB16_S1 : component is "0";
   attribute SRVAL of RAMB16_S1 : component is "0";
   attribute WRITE_MODE of RAMB16_S1 : component is "NO_CHANGE";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute INIT_0B of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_0A of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_09 of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_08 of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_07 of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_06 of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_05 of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_04 of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_03 of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_02 of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_01 of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_00 of ROM_mem_switchpattern : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
begin
   ROM_mem_switchpattern : RAMB16_S1
   -- synopsys translate_off
   generic map( INIT_0B => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_0A => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_09 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_08 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_07 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_06 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_05 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_04 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_03 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_02 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_01 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_00 => 
         x"0101010101010101010101010101010110101010101010101010101010101010")
   -- synopsys translate_on
      port map (ADDR(13 downto 0)=>ADDR(13 downto 0),
                CLK=>i_clock,
                DI(0)=>ROM_mem_switchpattern_DI_openSignal(0),
                EN=>XLXN_11,
                SSR=>i_reset,
                WE=>XLXN_44,
                DO(0)=>do);
   
   XLXI_7 : VCC
      port map (P=>XLXN_11);
   
   XLXI_8 : BUF
      port map (I=>do,
                O=>o_pattern);
   
   XLXI_11 : GND
      port map (G=>XLXN_44);
   
   XLXI_12_0 : GND
      port map (G=>ADDR(0));
   
   XLXI_12_1 : GND
      port map (G=>ADDR(1));
   
   XLXI_13_0 : BUF
      port map (I=>i_pixel(0),
                O=>ADDR(2));
   
   XLXI_13_1 : BUF
      port map (I=>i_pixel(1),
                O=>ADDR(3));
   
   XLXI_13_2 : BUF
      port map (I=>i_pixel(2),
                O=>ADDR(4));
   
   XLXI_13_3 : BUF
      port map (I=>i_pixel(3),
                O=>ADDR(5));
   
   XLXI_13_4 : BUF
      port map (I=>i_pixel(4),
                O=>ADDR(6));
   
   XLXI_13_5 : BUF
      port map (I=>i_pixel(5),
                O=>ADDR(7));
   
   XLXI_13_6 : BUF
      port map (I=>i_pixel(6),
                O=>ADDR(8));
   
   XLXI_13_7 : BUF
      port map (I=>i_pixel(7),
                O=>ADDR(9));
   
   XLXI_13_8 : BUF
      port map (I=>i_pixel(8),
                O=>ADDR(10));
   
   XLXI_13_9 : BUF
      port map (I=>i_pixel(9),
                O=>ADDR(11));
   
   XLXI_13_10 : BUF
      port map (I=>i_pixel(10),
                O=>ADDR(12));
   
   XLXI_13_11 : BUF
      port map (I=>i_pixel(11),
                O=>ADDR(13));
   
end BEHAVIORAL;


