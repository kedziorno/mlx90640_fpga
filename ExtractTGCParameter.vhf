--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ExtractTGCParameter.vhf
-- /___/   /\     Timestamp : 06/19/2023 15:05:27
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/melexis_mlx90641/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/workspace/melexis_mlx90641/ExtractTGCParameter.vhf -w /home/user/workspace/melexis_mlx90641/ExtractTGCParameter.sch
--Design Name: ExtractTGCParameter
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

entity ExtractTGCParameter is
   port ( i_clock       : in    std_logic; 
          i_reset       : in    std_logic; 
          i_run         : in    std_logic; 
          i2c_mem_douta : in    std_logic_vector (7 downto 0); 
          i2c_mem_addra : out   std_logic_vector (11 downto 0); 
          i2c_mem_ena   : out   std_logic; 
          o_rdy         : out   std_logic; 
          o_tgc         : out   std_logic_vector (31 downto 0));
end ExtractTGCParameter;

architecture BEHAVIORAL of ExtractTGCParameter is
   attribute BOX_TYPE            : string ;
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
   signal ADDRA                         : std_logic_vector (14 downto 0);
   signal XLXN_11                       : std_logic;
   signal XLXN_12                       : std_logic_vector (7 downto 0);
   signal XLXN_13                       : std_logic_vector (31 downto 0);
   signal ROM_TGC_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal ROM_TGC_CASCADEINA_openSignal : std_logic;
   signal ROM_TGC_CASCADEINB_openSignal : std_logic;
   signal ROM_TGC_CLKB_openSignal       : std_logic;
   signal ROM_TGC_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_TGC_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_TGC_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_TGC_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_TGC_ENB_openSignal        : std_logic;
   signal ROM_TGC_REGCEA_openSignal     : std_logic;
   signal ROM_TGC_REGCEB_openSignal     : std_logic;
   signal ROM_TGC_SSRB_openSignal       : std_logic;
   signal ROM_TGC_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal ROM_TGC_WEB_openSignal        : std_logic_vector (3 downto 0);
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
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
   
   component ExtractTGCParameter_process_p0
      port ( i_clock       : in    std_logic; 
             i_reset       : in    std_logic; 
             i_run         : in    std_logic; 
             i2c_mem_douta : in    std_logic_vector (7 downto 0); 
             i_data        : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena   : out   std_logic; 
             o_rdy         : out   std_logic; 
             i2c_mem_addra : out   std_logic_vector (11 downto 0); 
             o_address     : out   std_logic_vector (7 downto 0); 
             o_tgc         : out   std_logic_vector (31 downto 0));
   end component;
   
   attribute INIT_07 of ROM_TGC : label is 
         "3ffc00003ff800003ff400003ff000003fec00003fe800003fe400003fe00000";
   attribute INIT_06 of ROM_TGC : label is 
         "3fdc00003fd800003fd400003fd000003fcc00003fc800003fc400003fc00000";
   attribute INIT_05 of ROM_TGC : label is 
         "3fbc00003fb800003fb400003fb000003fac00003fa800003fa400003fa00000";
   attribute INIT_04 of ROM_TGC : label is 
         "3f9c00003f9800003f9400003f9000003f8c00003f8800003f8400003f800000";
   attribute INIT_03 of ROM_TGC : label is 
         "3f7800003f7000003f6800003f6000003f5800003f5000003f4800003f400000";
   attribute INIT_02 of ROM_TGC : label is 
         "3f3800003f3000003f2800003f2000003f1800003f1000003f0800003f000000";
   attribute INIT_01 of ROM_TGC : label is 
         "3ef000003ee000003ed000003ec000003eb000003ea000003e9000003e800000";
   attribute INIT_00 of ROM_TGC : label is 
         "3e6000003e4000003e2000003e0000003dc000003d8000003d00000000000000";
   attribute WRITE_WIDTH_B of ROM_TGC : label is "36";
   attribute WRITE_WIDTH_A of ROM_TGC : label is "36";
   attribute WRITE_MODE_B of ROM_TGC : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_TGC : label is "READ_FIRST";
   attribute READ_WIDTH_B of ROM_TGC : label is "36";
   attribute READ_WIDTH_A of ROM_TGC : label is "36";
   attribute INIT_1F of ROM_TGC : label is 
         "bd000000bd800000bdc00000be000000be200000be400000be600000be800000";
   attribute INIT_1E of ROM_TGC : label is 
         "be900000bea00000beb00000bec00000bed00000bee00000bef00000bf000000";
   attribute INIT_1D of ROM_TGC : label is 
         "bf080000bf100000bf180000bf200000bf280000bf300000bf380000bf400000";
   attribute INIT_1C of ROM_TGC : label is 
         "bf480000bf500000bf580000bf600000bf680000bf700000bf780000bf800000";
   attribute INIT_1B of ROM_TGC : label is 
         "bf840000bf880000bf8c0000bf900000bf940000bf980000bf9c0000bfa00000";
   attribute INIT_1A of ROM_TGC : label is 
         "bfa40000bfa80000bfac0000bfb00000bfb40000bfb80000bfbc0000bfc00000";
   attribute INIT_19 of ROM_TGC : label is 
         "bfc40000bfc80000bfcc0000bfd00000bfd40000bfd80000bfdc0000bfe00000";
   attribute INIT_18 of ROM_TGC : label is 
         "bfe40000bfe80000bfec0000bff00000bff40000bff80000bffc0000c0000000";
   attribute INIT_17 of ROM_TGC : label is 
         "c0020000c0040000c0060000c0080000c00a0000c00c0000c00e0000c0100000";
   attribute INIT_16 of ROM_TGC : label is 
         "c0120000c0140000c0160000c0180000c01a0000c01c0000c01e0000c0200000";
   attribute INIT_15 of ROM_TGC : label is 
         "c0220000c0240000c0260000c0280000c02a0000c02c0000c02e0000c0300000";
   attribute INIT_14 of ROM_TGC : label is 
         "c0320000c0340000c0360000c0380000c03a0000c03c0000c03e0000c0400000";
   attribute INIT_13 of ROM_TGC : label is 
         "c0420000c0440000c0460000c0480000c04a0000c04c0000c04e0000c0500000";
   attribute INIT_12 of ROM_TGC : label is 
         "c0520000c0540000c0560000c0580000c05a0000c05c0000c05e0000c0600000";
   attribute INIT_11 of ROM_TGC : label is 
         "c0620000c0640000c0660000c0680000c06a0000c06c0000c06e0000c0700000";
   attribute INIT_10 of ROM_TGC : label is 
         "c0720000c0740000c0760000c0780000c07a0000c07c0000c07e0000c0800000";
   attribute INIT_0F of ROM_TGC : label is 
         "407e0000407c0000407a00004078000040760000407400004072000040700000";
   attribute INIT_0E of ROM_TGC : label is 
         "406e0000406c0000406a00004068000040660000406400004062000040600000";
   attribute INIT_0D of ROM_TGC : label is 
         "405e0000405c0000405a00004058000040560000405400004052000040500000";
   attribute INIT_0C of ROM_TGC : label is 
         "404e0000404c0000404a00004048000040460000404400004042000040400000";
   attribute INIT_0B of ROM_TGC : label is 
         "403e0000403c0000403a00004038000040360000403400004032000040300000";
   attribute INIT_0A of ROM_TGC : label is 
         "402e0000402c0000402a00004028000040260000402400004022000040200000";
   attribute INIT_09 of ROM_TGC : label is 
         "401e0000401c0000401a00004018000040160000401400004012000040100000";
   attribute INIT_08 of ROM_TGC : label is 
         "400e0000400c0000400a00004008000040060000400400004002000040000000";
begin
   BUF_0 : BUF
      port map (I=>XLXN_12(0),
                O=>ADDRA(5));
   
   BUF_1 : BUF
      port map (I=>XLXN_12(1),
                O=>ADDRA(6));
   
   BUF_2 : BUF
      port map (I=>XLXN_12(2),
                O=>ADDRA(7));
   
   BUF_3 : BUF
      port map (I=>XLXN_12(3),
                O=>ADDRA(8));
   
   BUF_4 : BUF
      port map (I=>XLXN_12(4),
                O=>ADDRA(9));
   
   BUF_5 : BUF
      port map (I=>XLXN_12(5),
                O=>ADDRA(10));
   
   BUF_6 : BUF
      port map (I=>XLXN_12(6),
                O=>ADDRA(11));
   
   BUF_7 : BUF
      port map (I=>XLXN_12(7),
                O=>ADDRA(12));
   
   ROM_TGC : RAMB16
   -- synopsys translate_off
   generic map( INIT_07 => 
         x"3ffc00003ff800003ff400003ff000003fec00003fe800003fe400003fe00000",
            INIT_06 => 
         x"3fdc00003fd800003fd400003fd000003fcc00003fc800003fc400003fc00000",
            INIT_05 => 
         x"3fbc00003fb800003fb400003fb000003fac00003fa800003fa400003fa00000",
            INIT_04 => 
         x"3f9c00003f9800003f9400003f9000003f8c00003f8800003f8400003f800000",
            INIT_03 => 
         x"3f7800003f7000003f6800003f6000003f5800003f5000003f4800003f400000",
            INIT_02 => 
         x"3f3800003f3000003f2800003f2000003f1800003f1000003f0800003f000000",
            INIT_01 => 
         x"3ef000003ee000003ed000003ec000003eb000003ea000003e9000003e800000",
            INIT_00 => 
         x"3e6000003e4000003e2000003e0000003dc000003d8000003d00000000000000",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36,
            INIT_1F => 
         x"bd000000bd800000bdc00000be000000be200000be400000be600000be800000",
            INIT_1E => 
         x"be900000bea00000beb00000bec00000bed00000bee00000bef00000bf000000",
            INIT_1D => 
         x"bf080000bf100000bf180000bf200000bf280000bf300000bf380000bf400000",
            INIT_1C => 
         x"bf480000bf500000bf580000bf600000bf680000bf700000bf780000bf800000",
            INIT_1B => 
         x"bf840000bf880000bf8c0000bf900000bf940000bf980000bf9c0000bfa00000",
            INIT_1A => 
         x"bfa40000bfa80000bfac0000bfb00000bfb40000bfb80000bfbc0000bfc00000",
            INIT_19 => 
         x"bfc40000bfc80000bfcc0000bfd00000bfd40000bfd80000bfdc0000bfe00000",
            INIT_18 => 
         x"bfe40000bfe80000bfec0000bff00000bff40000bff80000bffc0000c0000000",
            INIT_17 => 
         x"c0020000c0040000c0060000c0080000c00a0000c00c0000c00e0000c0100000",
            INIT_16 => 
         x"c0120000c0140000c0160000c0180000c01a0000c01c0000c01e0000c0200000",
            INIT_15 => 
         x"c0220000c0240000c0260000c0280000c02a0000c02c0000c02e0000c0300000",
            INIT_14 => 
         x"c0320000c0340000c0360000c0380000c03a0000c03c0000c03e0000c0400000",
            INIT_13 => 
         x"c0420000c0440000c0460000c0480000c04a0000c04c0000c04e0000c0500000",
            INIT_12 => 
         x"c0520000c0540000c0560000c0580000c05a0000c05c0000c05e0000c0600000",
            INIT_11 => 
         x"c0620000c0640000c0660000c0680000c06a0000c06c0000c06e0000c0700000",
            INIT_10 => 
         x"c0720000c0740000c0760000c0780000c07a0000c07c0000c07e0000c0800000",
            INIT_0F => 
         x"407e0000407c0000407a00004078000040760000407400004072000040700000",
            INIT_0E => 
         x"406e0000406c0000406a00004068000040660000406400004062000040600000",
            INIT_0D => 
         x"405e0000405c0000405a00004058000040560000405400004052000040500000",
            INIT_0C => 
         x"404e0000404c0000404a00004048000040460000404400004042000040400000",
            INIT_0B => 
         x"403e0000403c0000403a00004038000040360000403400004032000040300000",
            INIT_0A => 
         x"402e0000402c0000402a00004028000040260000402400004022000040200000",
            INIT_09 => 
         x"401e0000401c0000401a00004018000040160000401400004012000040100000",
            INIT_08 => 
         x"400e0000400c0000400a00004008000040060000400400004002000040000000")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>ADDRA(14 downto 0),
                ADDRB(14 downto 0)=>ROM_TGC_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>ROM_TGC_CASCADEINA_openSignal,
                CASCADEINB=>ROM_TGC_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>ROM_TGC_CLKB_openSignal,
                DIA(31 downto 0)=>ROM_TGC_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>ROM_TGC_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>ROM_TGC_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>ROM_TGC_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_11,
                ENB=>ROM_TGC_ENB_openSignal,
                REGCEA=>ROM_TGC_REGCEA_openSignal,
                REGCEB=>ROM_TGC_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>ROM_TGC_SSRB_openSignal,
                WEA(3 downto 0)=>ROM_TGC_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>ROM_TGC_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_13(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_5_0 : GND
      port map (G=>ADDRA(13));
   
   XLXI_5_1 : GND
      port map (G=>ADDRA(14));
   
   XLXI_6_0 : GND
      port map (G=>ADDRA(0));
   
   XLXI_6_1 : GND
      port map (G=>ADDRA(1));
   
   XLXI_6_2 : GND
      port map (G=>ADDRA(2));
   
   XLXI_6_3 : GND
      port map (G=>ADDRA(3));
   
   XLXI_6_4 : GND
      port map (G=>ADDRA(4));
   
   XLXI_7 : VCC
      port map (P=>XLXN_11);
   
   XLXI_8 : ExtractTGCParameter_process_p0
      port map (i_clock=>i_clock,
                i_data(31 downto 0)=>XLXN_13(31 downto 0),
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                i2c_mem_addra(11 downto 0)=>i2c_mem_addra(11 downto 0),
                i2c_mem_ena=>i2c_mem_ena,
                o_address(7 downto 0)=>XLXN_12(7 downto 0),
                o_rdy=>o_rdy,
                o_tgc(31 downto 0)=>o_tgc(31 downto 0));
   
end BEHAVIORAL;


