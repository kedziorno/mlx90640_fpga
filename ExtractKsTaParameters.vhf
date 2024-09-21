--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ExtractKsTaParameters.vhf
-- /___/   /\     Timestamp : 06/19/2023 15:05:21
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/melexis_mlx90641/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/workspace/melexis_mlx90641/ExtractKsTaParameters.vhf -w /home/user/workspace/melexis_mlx90641/ExtractKsTaParameters.sch
--Design Name: ExtractKsTaParameters
--Device: virtex4
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ExtractKsTaParameters is
   port ( i_clock       : in    std_logic; 
          i_reset       : in    std_logic; 
          i_run         : in    std_logic; 
          i2c_mem_douta : in    std_logic_vector (7 downto 0); 
          i2c_mem_addra : out   std_logic_vector (11 downto 0); 
          i2c_mem_ena   : out   std_logic; 
          o_ksta        : out   std_logic_vector (31 downto 0); 
          o_rdy         : out   std_logic);
end ExtractKsTaParameters;

architecture BEHAVIORAL of ExtractKsTaParameters is
   attribute DOA_REG             : string ;
   attribute DOB_REG             : string ;
   attribute INIT_00             : string ;
   attribute INIT_01             : string ;
   attribute INIT_02             : string ;
   attribute INIT_03             : string ;
   attribute INIT_04             : string ;
   attribute INIT_05             : string ;
   attribute INIT_06             : string ;
   attribute INIT_07             : string ;
   attribute INIT_08             : string ;
   attribute INIT_09             : string ;
   attribute INIT_0A             : string ;
   attribute INIT_0B             : string ;
   attribute INIT_0C             : string ;
   attribute INIT_0D             : string ;
   attribute INIT_0E             : string ;
   attribute INIT_0F             : string ;
   attribute INIT_10             : string ;
   attribute INIT_11             : string ;
   attribute INIT_12             : string ;
   attribute INIT_13             : string ;
   attribute INIT_14             : string ;
   attribute INIT_15             : string ;
   attribute INIT_16             : string ;
   attribute INIT_17             : string ;
   attribute INIT_18             : string ;
   attribute INIT_19             : string ;
   attribute INIT_1A             : string ;
   attribute INIT_1B             : string ;
   attribute INIT_1C             : string ;
   attribute INIT_1D             : string ;
   attribute INIT_1E             : string ;
   attribute INIT_1F             : string ;
   attribute INIT_20             : string ;
   attribute INIT_21             : string ;
   attribute INIT_22             : string ;
   attribute INIT_23             : string ;
   attribute INIT_24             : string ;
   attribute INIT_25             : string ;
   attribute INIT_26             : string ;
   attribute INIT_27             : string ;
   attribute INIT_28             : string ;
   attribute INIT_29             : string ;
   attribute INIT_2A             : string ;
   attribute INIT_2B             : string ;
   attribute INIT_2C             : string ;
   attribute INIT_2D             : string ;
   attribute INIT_2E             : string ;
   attribute INIT_2F             : string ;
   attribute INIT_30             : string ;
   attribute INIT_31             : string ;
   attribute INIT_32             : string ;
   attribute INIT_33             : string ;
   attribute INIT_34             : string ;
   attribute INIT_35             : string ;
   attribute INIT_36             : string ;
   attribute INIT_37             : string ;
   attribute INIT_38             : string ;
   attribute INIT_39             : string ;
   attribute INIT_3A             : string ;
   attribute INIT_3B             : string ;
   attribute INIT_3C             : string ;
   attribute INIT_3D             : string ;
   attribute INIT_3E             : string ;
   attribute INIT_3F             : string ;
   attribute INIT_A              : string ;
   attribute INIT_B              : string ;
   attribute INITP_00            : string ;
   attribute INITP_01            : string ;
   attribute INITP_02            : string ;
   attribute INITP_03            : string ;
   attribute INITP_04            : string ;
   attribute INITP_05            : string ;
   attribute INITP_06            : string ;
   attribute INITP_07            : string ;
   attribute INIT_FILE           : string ;
   attribute INVERT_CLK_DOA_REG  : string ;
   attribute INVERT_CLK_DOB_REG  : string ;
   attribute RAM_EXTENSION_A     : string ;
   attribute RAM_EXTENSION_B     : string ;
   attribute READ_WIDTH_A        : string ;
   attribute READ_WIDTH_B        : string ;
   attribute SRVAL_A             : string ;
   attribute SRVAL_B             : string ;
   attribute WRITE_MODE_A        : string ;
   attribute WRITE_MODE_B        : string ;
   attribute WRITE_WIDTH_A       : string ;
   attribute WRITE_WIDTH_B       : string ;
   attribute SIM_COLLISION_CHECK : string ;
   attribute BOX_TYPE            : string ;
   signal XLXN_1                         : std_logic_vector (14 downto 0);
   signal XLXN_10                        : std_logic;
   signal XLXN_84                        : std_logic_vector (31 downto 0);
   signal ROM_KSTA_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal ROM_KSTA_CASCADEINA_openSignal : std_logic;
   signal ROM_KSTA_CASCADEINB_openSignal : std_logic;
   signal ROM_KSTA_CLKB_openSignal       : std_logic;
   signal ROM_KSTA_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_KSTA_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_KSTA_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_KSTA_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_KSTA_ENB_openSignal        : std_logic;
   signal ROM_KSTA_REGCEA_openSignal     : std_logic;
   signal ROM_KSTA_REGCEB_openSignal     : std_logic;
   signal ROM_KSTA_SSRB_openSignal       : std_logic;
   signal ROM_KSTA_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal ROM_KSTA_WEB_openSignal        : std_logic_vector (3 downto 0);
   component RAMB16
      -- synopsys translate_off
      generic( DOA_REG : integer :=  0;
               DOB_REG : integer :=  0;
               INIT_00 : bit_vector :=  
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
               INIT_A : bit_vector :=  x"000000000";
               INIT_B : bit_vector :=  x"000000000";
               INITP_00 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_01 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_02 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_03 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_04 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_05 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_06 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INITP_07 : bit_vector :=  
            x"0000000000000000000000000000000000000000000000000000000000000000";
               INIT_FILE : string :=  "NONE";
               INVERT_CLK_DOA_REG : boolean :=  FALSE;
               INVERT_CLK_DOB_REG : boolean :=  FALSE;
               RAM_EXTENSION_A : string :=  "NONE";
               RAM_EXTENSION_B : string :=  "NONE";
               READ_WIDTH_A : integer :=  0;
               READ_WIDTH_B : integer :=  0;
               SRVAL_A : bit_vector :=  x"000000000";
               SRVAL_B : bit_vector :=  x"000000000";
               WRITE_MODE_A : string :=  "WRITE_FIRST";
               WRITE_MODE_B : string :=  "WRITE_FIRST";
               WRITE_WIDTH_A : integer :=  0;
               WRITE_WIDTH_B : integer :=  0;
               SIM_COLLISION_CHECK : string :=  "ALL");
      -- synopsys translate_on
      port ( ADDRA       : in    std_logic_vector (14 downto 0); 
             ADDRB       : in    std_logic_vector (14 downto 0); 
             CASCADEINA  : in    std_logic; 
             CASCADEINB  : in    std_logic; 
             CLKA        : in    std_logic; 
             CLKB        : in    std_logic; 
             DIA         : in    std_logic_vector (31 downto 0); 
             DIB         : in    std_logic_vector (31 downto 0); 
             DIPA        : in    std_logic_vector (3 downto 0); 
             DIPB        : in    std_logic_vector (3 downto 0); 
             ENA         : in    std_logic; 
             REGCEA      : in    std_logic; 
             REGCEB      : in    std_logic; 
             ENB         : in    std_logic; 
             SSRA        : in    std_logic; 
             SSRB        : in    std_logic; 
             WEA         : in    std_logic_vector (3 downto 0); 
             WEB         : in    std_logic_vector (3 downto 0); 
             CASCADEOUTA : out   std_logic; 
             CASCADEOUTB : out   std_logic; 
             DOA         : out   std_logic_vector (31 downto 0); 
             DOB         : out   std_logic_vector (31 downto 0); 
             DOPA        : out   std_logic_vector (3 downto 0); 
             DOPB        : out   std_logic_vector (3 downto 0));
   end component;
   attribute DOA_REG of RAMB16 : component is "0";
   attribute DOB_REG of RAMB16 : component is "0";
   attribute INIT_00 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_01 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_02 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_03 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_04 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_05 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_06 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_07 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_08 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_09 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0A of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0B of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0C of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0D of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0E of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0F of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_10 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_11 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_12 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_13 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_14 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_15 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_16 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_17 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_18 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_19 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1A of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1B of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1C of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1D of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1E of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1F of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_20 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_21 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_22 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_23 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_24 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_25 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_26 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_27 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_28 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_29 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2A of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2B of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2C of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2D of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2E of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2F of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_30 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_31 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_32 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_33 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_34 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_35 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_36 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_37 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_38 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_39 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3A of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3B of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3C of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3D of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3E of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3F of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_A of RAMB16 : component is "000000000";
   attribute INIT_B of RAMB16 : component is "000000000";
   attribute INITP_00 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_01 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_02 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_03 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_04 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_05 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_06 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_07 of RAMB16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_FILE of RAMB16 : component is "NONE";
   attribute INVERT_CLK_DOA_REG of RAMB16 : component is "FALSE";
   attribute INVERT_CLK_DOB_REG of RAMB16 : component is "FALSE";
   attribute RAM_EXTENSION_A of RAMB16 : component is "NONE";
   attribute RAM_EXTENSION_B of RAMB16 : component is "NONE";
   attribute READ_WIDTH_A of RAMB16 : component is "0";
   attribute READ_WIDTH_B of RAMB16 : component is "0";
   attribute SRVAL_A of RAMB16 : component is "000000000";
   attribute SRVAL_B of RAMB16 : component is "000000000";
   attribute WRITE_MODE_A of RAMB16 : component is "WRITE_FIRST";
   attribute WRITE_MODE_B of RAMB16 : component is "WRITE_FIRST";
   attribute WRITE_WIDTH_A of RAMB16 : component is "0";
   attribute WRITE_WIDTH_B of RAMB16 : component is "0";
   attribute SIM_COLLISION_CHECK of RAMB16 : component is "ALL";
   attribute BOX_TYPE of RAMB16 : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component ExtractKsTaParameter_process_p0
      port ( i_clock       : in    std_logic; 
             i_reset       : in    std_logic; 
             i_run         : in    std_logic; 
             odata_ksta    : in    std_logic_vector (31 downto 0); 
             i2c_mem_douta : in    std_logic_vector (7 downto 0); 
             i2c_mem_ena   : out   std_logic; 
             o_rdy         : out   std_logic; 
             address_ksta  : out   std_logic_vector (7 downto 0); 
             i2c_mem_addra : out   std_logic_vector (11 downto 0); 
             o_ksta        : out   std_logic_vector (31 downto 0));
   end component;
   
   attribute INIT_00 of ROM_KSTA : label is 
         "3a6000003a4000003a2000003a00000039c00000398000003900000000000000";
   attribute INIT_01 of ROM_KSTA : label is 
         "3af000003ae000003ad000003ac000003ab000003aa000003a9000003a800000";
   attribute WRITE_WIDTH_B of ROM_KSTA : label is "36";
   attribute WRITE_WIDTH_A of ROM_KSTA : label is "36";
   attribute WRITE_MODE_B of ROM_KSTA : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_KSTA : label is "READ_FIRST";
   attribute READ_WIDTH_B of ROM_KSTA : label is "36";
   attribute READ_WIDTH_A of ROM_KSTA : label is "36";
   attribute INIT_1F of ROM_KSTA : label is 
         "b9000000b9800000b9c00000ba000000ba200000ba400000ba600000ba800000";
   attribute INIT_1E of ROM_KSTA : label is 
         "ba900000baa00000bab00000bac00000bad00000bae00000baf00000bb000000";
   attribute INIT_1D of ROM_KSTA : label is 
         "bb080000bb100000bb180000bb200000bb280000bb300000bb380000bb400000";
   attribute INIT_1C of ROM_KSTA : label is 
         "bb480000bb500000bb580000bb600000bb680000bb700000bb780000bb800000";
   attribute INIT_1B of ROM_KSTA : label is 
         "bb840000bb880000bb8c0000bb900000bb940000bb980000bb9c0000bba00000";
   attribute INIT_1A of ROM_KSTA : label is 
         "bba40000bba80000bbac0000bbb00000bbb40000bbb80000bbbc0000bbc00000";
   attribute INIT_19 of ROM_KSTA : label is 
         "bbc40000bbc80000bbcc0000bbd00000bbd40000bbd80000bbdc0000bbe00000";
   attribute INIT_18 of ROM_KSTA : label is 
         "bbe40000bbe80000bbec0000bbf00000bbf40000bbf80000bbfc0000bc000000";
   attribute INIT_17 of ROM_KSTA : label is 
         "bc020000bc040000bc060000bc080000bc0a0000bc0c0000bc0e0000bc100000";
   attribute INIT_16 of ROM_KSTA : label is 
         "bc120000bc140000bc160000bc180000bc1a0000bc1c0000bc1e0000bc200000";
   attribute INIT_15 of ROM_KSTA : label is 
         "bc220000bc240000bc260000bc280000bc2a0000bc2c0000bc2e0000bc300000";
   attribute INIT_14 of ROM_KSTA : label is 
         "bc320000bc340000bc360000bc380000bc3a0000bc3c0000bc3e0000bc400000";
   attribute INIT_13 of ROM_KSTA : label is 
         "bc420000bc440000bc460000bc480000bc4a0000bc4c0000bc4e0000bc500000";
   attribute INIT_12 of ROM_KSTA : label is 
         "bc520000bc540000bc560000bc580000bc5a0000bc5c0000bc5e0000bc600000";
   attribute INIT_11 of ROM_KSTA : label is 
         "bc620000bc640000bc660000bc680000bc6a0000bc6c0000bc6e0000bc700000";
   attribute INIT_10 of ROM_KSTA : label is 
         "bc720000bc740000bc760000bc780000bc7a0000bc7c0000bc7e0000bc800000";
   attribute INIT_0F of ROM_KSTA : label is 
         "3c7e00003c7c00003c7a00003c7800003c7600003c7400003c7200003c700000";
   attribute INIT_0E of ROM_KSTA : label is 
         "3c6e00003c6c00003c6a00003c6800003c6600003c6400003c6200003c600000";
   attribute INIT_0D of ROM_KSTA : label is 
         "3c5e00003c5c00003c5a00003c5800003c5600003c5400003c5200003c500000";
   attribute INIT_0C of ROM_KSTA : label is 
         "3c4e00003c4c00003c4a00003c4800003c4600003c4400003c4200003c400000";
   attribute INIT_0B of ROM_KSTA : label is 
         "3c3e00003c3c00003c3a00003c3800003c3600003c3400003c3200003c300000";
   attribute INIT_0A of ROM_KSTA : label is 
         "3c2e00003c2c00003c2a00003c2800003c2600003c2400003c2200003c200000";
   attribute INIT_09 of ROM_KSTA : label is 
         "3c1e00003c1c00003c1a00003c1800003c1600003c1400003c1200003c100000";
   attribute INIT_08 of ROM_KSTA : label is 
         "3c0e00003c0c00003c0a00003c0800003c0600003c0400003c0200003c000000";
   attribute INIT_07 of ROM_KSTA : label is 
         "3bfc00003bf800003bf400003bf000003bec00003be800003be400003be00000";
   attribute INIT_06 of ROM_KSTA : label is 
         "3bdc00003bd800003bd400003bd000003bcc00003bc800003bc400003bc00000";
   attribute INIT_05 of ROM_KSTA : label is 
         "3bbc00003bb800003bb400003bb000003bac00003ba800003ba400003ba00000";
   attribute INIT_04 of ROM_KSTA : label is 
         "3b9c00003b9800003b9400003b9000003b8c00003b8800003b8400003b800000";
   attribute INIT_03 of ROM_KSTA : label is 
         "3b7800003b7000003b6800003b6000003b5800003b5000003b4800003b400000";
   attribute INIT_02 of ROM_KSTA : label is 
         "3b3800003b3000003b2800003b2000003b1800003b1000003b0800003b000000";
begin
   ROM_KSTA : RAMB16
   -- synopsys translate_off
   generic map( INIT_00 => 
         x"3a6000003a4000003a2000003a00000039c00000398000003900000000000000",
            INIT_01 => 
         x"3af000003ae000003ad000003ac000003ab000003aa000003a9000003a800000",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36,
            INIT_1F => 
         x"b9000000b9800000b9c00000ba000000ba200000ba400000ba600000ba800000",
            INIT_1E => 
         x"ba900000baa00000bab00000bac00000bad00000bae00000baf00000bb000000",
            INIT_1D => 
         x"bb080000bb100000bb180000bb200000bb280000bb300000bb380000bb400000",
            INIT_1C => 
         x"bb480000bb500000bb580000bb600000bb680000bb700000bb780000bb800000",
            INIT_1B => 
         x"bb840000bb880000bb8c0000bb900000bb940000bb980000bb9c0000bba00000",
            INIT_1A => 
         x"bba40000bba80000bbac0000bbb00000bbb40000bbb80000bbbc0000bbc00000",
            INIT_19 => 
         x"bbc40000bbc80000bbcc0000bbd00000bbd40000bbd80000bbdc0000bbe00000",
            INIT_18 => 
         x"bbe40000bbe80000bbec0000bbf00000bbf40000bbf80000bbfc0000bc000000",
            INIT_17 => 
         x"bc020000bc040000bc060000bc080000bc0a0000bc0c0000bc0e0000bc100000",
            INIT_16 => 
         x"bc120000bc140000bc160000bc180000bc1a0000bc1c0000bc1e0000bc200000",
            INIT_15 => 
         x"bc220000bc240000bc260000bc280000bc2a0000bc2c0000bc2e0000bc300000",
            INIT_14 => 
         x"bc320000bc340000bc360000bc380000bc3a0000bc3c0000bc3e0000bc400000",
            INIT_13 => 
         x"bc420000bc440000bc460000bc480000bc4a0000bc4c0000bc4e0000bc500000",
            INIT_12 => 
         x"bc520000bc540000bc560000bc580000bc5a0000bc5c0000bc5e0000bc600000",
            INIT_11 => 
         x"bc620000bc640000bc660000bc680000bc6a0000bc6c0000bc6e0000bc700000",
            INIT_10 => 
         x"bc720000bc740000bc760000bc780000bc7a0000bc7c0000bc7e0000bc800000",
            INIT_0F => 
         x"3c7e00003c7c00003c7a00003c7800003c7600003c7400003c7200003c700000",
            INIT_0E => 
         x"3c6e00003c6c00003c6a00003c6800003c6600003c6400003c6200003c600000",
            INIT_0D => 
         x"3c5e00003c5c00003c5a00003c5800003c5600003c5400003c5200003c500000",
            INIT_0C => 
         x"3c4e00003c4c00003c4a00003c4800003c4600003c4400003c4200003c400000",
            INIT_0B => 
         x"3c3e00003c3c00003c3a00003c3800003c3600003c3400003c3200003c300000",
            INIT_0A => 
         x"3c2e00003c2c00003c2a00003c2800003c2600003c2400003c2200003c200000",
            INIT_09 => 
         x"3c1e00003c1c00003c1a00003c1800003c1600003c1400003c1200003c100000",
            INIT_08 => 
         x"3c0e00003c0c00003c0a00003c0800003c0600003c0400003c0200003c000000",
            INIT_07 => 
         x"3bfc00003bf800003bf400003bf000003bec00003be800003be400003be00000",
            INIT_06 => 
         x"3bdc00003bd800003bd400003bd000003bcc00003bc800003bc400003bc00000",
            INIT_05 => 
         x"3bbc00003bb800003bb400003bb000003bac00003ba800003ba400003ba00000",
            INIT_04 => 
         x"3b9c00003b9800003b9400003b9000003b8c00003b8800003b8400003b800000",
            INIT_03 => 
         x"3b7800003b7000003b6800003b6000003b5800003b5000003b4800003b400000",
            INIT_02 => 
         x"3b3800003b3000003b2800003b2000003b1800003b1000003b0800003b000000")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_1(14 downto 0),
                ADDRB(14 downto 0)=>ROM_KSTA_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>ROM_KSTA_CASCADEINA_openSignal,
                CASCADEINB=>ROM_KSTA_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>ROM_KSTA_CLKB_openSignal,
                DIA(31 downto 0)=>ROM_KSTA_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>ROM_KSTA_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>ROM_KSTA_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>ROM_KSTA_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_10,
                ENB=>ROM_KSTA_ENB_openSignal,
                REGCEA=>ROM_KSTA_REGCEA_openSignal,
                REGCEB=>ROM_KSTA_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>ROM_KSTA_SSRB_openSignal,
                WEA(3 downto 0)=>ROM_KSTA_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>ROM_KSTA_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_84(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_3_0 : GND
      port map (G=>XLXN_1(0));
   
   XLXI_3_1 : GND
      port map (G=>XLXN_1(1));
   
   XLXI_3_2 : GND
      port map (G=>XLXN_1(2));
   
   XLXI_3_3 : GND
      port map (G=>XLXN_1(3));
   
   XLXI_3_4 : GND
      port map (G=>XLXN_1(4));
   
   XLXI_4_0 : GND
      port map (G=>XLXN_1(13));
   
   XLXI_4_1 : GND
      port map (G=>XLXN_1(14));
   
   XLXI_5 : VCC
      port map (P=>XLXN_10);
   
   XLXI_6 : ExtractKsTaParameter_process_p0
      port map (i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                odata_ksta(31 downto 0)=>XLXN_84(31 downto 0),
                address_ksta(7 downto 0)=>XLXN_1(12 downto 5),
                i2c_mem_addra(11 downto 0)=>i2c_mem_addra(11 downto 0),
                i2c_mem_ena=>i2c_mem_ena,
                o_ksta(31 downto 0)=>o_ksta(31 downto 0),
                o_rdy=>o_rdy);
   
end BEHAVIORAL;


