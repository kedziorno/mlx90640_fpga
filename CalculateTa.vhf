--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CalculateTa.vhf
-- /___/   /\     Timestamp : 10/06/2023 16:03:19
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/CalculateTa.vhf -w /home/user/workspace/mlx90640_fpga/CalculateTa.sch
--Design Name: CalculateTa
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

entity ExtractAlphaPTATParameter_MUSER_CalculateTa is
   port ( i_clock     : in    std_logic; 
          i_ee0x2410  : in    std_logic_vector (15 downto 0); 
          i_reset     : in    std_logic; 
          o_alphaptat : out   std_logic_vector (31 downto 0));
end ExtractAlphaPTATParameter_MUSER_CalculateTa;

architecture BEHAVIORAL of ExtractAlphaPTATParameter_MUSER_CalculateTa is
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
   signal XLXN_1                              : std_logic_vector (14 downto 0);
   signal XLXN_10                             : std_logic;
   signal ROM_ALPHAPTAT_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal ROM_ALPHAPTAT_CASCADEINA_openSignal : std_logic;
   signal ROM_ALPHAPTAT_CASCADEINB_openSignal : std_logic;
   signal ROM_ALPHAPTAT_CLKB_openSignal       : std_logic;
   signal ROM_ALPHAPTAT_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_ALPHAPTAT_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_ALPHAPTAT_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_ALPHAPTAT_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_ALPHAPTAT_ENB_openSignal        : std_logic;
   signal ROM_ALPHAPTAT_REGCEA_openSignal     : std_logic;
   signal ROM_ALPHAPTAT_REGCEB_openSignal     : std_logic;
   signal ROM_ALPHAPTAT_SSRB_openSignal       : std_logic;
   signal ROM_ALPHAPTAT_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal ROM_ALPHAPTAT_WEB_openSignal        : std_logic_vector (3 downto 0);
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component ramb16
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
   attribute DOA_REG of ramb16 : component is "0";
   attribute DOB_REG of ramb16 : component is "0";
   attribute INIT_00 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_01 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_02 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_03 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_04 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_05 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_06 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_07 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_08 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_09 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_10 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_11 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_12 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_13 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_14 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_15 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_16 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_17 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_18 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_19 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_20 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_21 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_22 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_23 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_24 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_25 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_26 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_27 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_28 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_29 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_30 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_31 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_32 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_33 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_34 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_35 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_36 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_37 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_38 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_39 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_A of ramb16 : component is "000000000";
   attribute INIT_B of ramb16 : component is "000000000";
   attribute INITP_00 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_01 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_02 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_03 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_04 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_05 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_06 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_07 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_FILE of ramb16 : component is "NONE";
   attribute INVERT_CLK_DOA_REG of ramb16 : component is "FALSE";
   attribute INVERT_CLK_DOB_REG of ramb16 : component is "FALSE";
   attribute RAM_EXTENSION_A of ramb16 : component is "NONE";
   attribute RAM_EXTENSION_B of ramb16 : component is "NONE";
   attribute READ_WIDTH_A of ramb16 : component is "0";
   attribute READ_WIDTH_B of ramb16 : component is "0";
   attribute SRVAL_A of ramb16 : component is "000000000";
   attribute SRVAL_B of ramb16 : component is "000000000";
   attribute WRITE_MODE_A of ramb16 : component is "WRITE_FIRST";
   attribute WRITE_MODE_B of ramb16 : component is "WRITE_FIRST";
   attribute WRITE_WIDTH_A of ramb16 : component is "0";
   attribute WRITE_WIDTH_B of ramb16 : component is "0";
   attribute SIM_COLLISION_CHECK of ramb16 : component is "ALL";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute INIT_00 of ROM_ALPHAPTAT : label is 
         "411c0000411800004114000041100000410c0000410800004104000041000000";
   attribute INIT_01 of ROM_ALPHAPTAT : label is 
         "413c0000413800004134000041300000412c0000412800004124000041200000";
   attribute WRITE_WIDTH_B of ROM_ALPHAPTAT : label is "36";
   attribute WRITE_WIDTH_A of ROM_ALPHAPTAT : label is "36";
   attribute WRITE_MODE_B of ROM_ALPHAPTAT : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_ALPHAPTAT : label is "READ_FIRST";
   attribute READ_WIDTH_B of ROM_ALPHAPTAT : label is "36";
   attribute READ_WIDTH_A of ROM_ALPHAPTAT : label is "36";
begin
   BUF_0 : BUF
      port map (I=>i_ee0x2410(12),
                O=>XLXN_1(5));
   
   BUF_1 : BUF
      port map (I=>i_ee0x2410(13),
                O=>XLXN_1(6));
   
   BUF_2 : BUF
      port map (I=>i_ee0x2410(14),
                O=>XLXN_1(7));
   
   BUF_3 : BUF
      port map (I=>i_ee0x2410(15),
                O=>XLXN_1(8));
   
   ROM_ALPHAPTAT : ramb16
   -- synopsys translate_off
   generic map( INIT_00 => 
         x"411c0000411800004114000041100000410c0000410800004104000041000000",
            INIT_01 => 
         x"413c0000413800004134000041300000412c0000412800004124000041200000",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_1(14 downto 0),
                ADDRB(14 downto 0)=>ROM_ALPHAPTAT_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>ROM_ALPHAPTAT_CASCADEINA_openSignal,
                CASCADEINB=>ROM_ALPHAPTAT_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>ROM_ALPHAPTAT_CLKB_openSignal,
                DIA(31 downto 0)=>ROM_ALPHAPTAT_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>ROM_ALPHAPTAT_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>ROM_ALPHAPTAT_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>ROM_ALPHAPTAT_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_10,
                ENB=>ROM_ALPHAPTAT_ENB_openSignal,
                REGCEA=>ROM_ALPHAPTAT_REGCEA_openSignal,
                REGCEB=>ROM_ALPHAPTAT_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>ROM_ALPHAPTAT_SSRB_openSignal,
                WEA(3 downto 0)=>ROM_ALPHAPTAT_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>ROM_ALPHAPTAT_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>o_alphaptat(31 downto 0),
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
      port map (G=>XLXN_1(9));
   
   XLXI_4_1 : GND
      port map (G=>XLXN_1(10));
   
   XLXI_4_2 : GND
      port map (G=>XLXN_1(11));
   
   XLXI_4_3 : GND
      port map (G=>XLXN_1(12));
   
   XLXI_4_4 : GND
      port map (G=>XLXN_1(13));
   
   XLXI_4_5 : GND
      port map (G=>XLXN_1(14));
   
   XLXI_5 : VCC
      port map (P=>XLXN_10);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ExtractKvPTATParameter_MUSER_CalculateTa is
   port ( i_clock    : in    std_logic; 
          i_ee0x2432 : in    std_logic_vector (15 downto 0); 
          i_reset    : in    std_logic; 
          o_kvptat   : out   std_logic_vector (31 downto 0));
end ExtractKvPTATParameter_MUSER_CalculateTa;

architecture BEHAVIORAL of ExtractKvPTATParameter_MUSER_CalculateTa is
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
   signal ADDRA                            : std_logic_vector (14 downto 0);
   signal XLXN_11                          : std_logic;
   signal ROM_KVPTAT_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal ROM_KVPTAT_CASCADEINA_openSignal : std_logic;
   signal ROM_KVPTAT_CASCADEINB_openSignal : std_logic;
   signal ROM_KVPTAT_CLKB_openSignal       : std_logic;
   signal ROM_KVPTAT_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_KVPTAT_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_KVPTAT_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_KVPTAT_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_KVPTAT_ENB_openSignal        : std_logic;
   signal ROM_KVPTAT_REGCEA_openSignal     : std_logic;
   signal ROM_KVPTAT_REGCEB_openSignal     : std_logic;
   signal ROM_KVPTAT_SSRB_openSignal       : std_logic;
   signal ROM_KVPTAT_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal ROM_KVPTAT_WEB_openSignal        : std_logic_vector (3 downto 0);
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component ramb16
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
   attribute DOA_REG of ramb16 : component is "0";
   attribute DOB_REG of ramb16 : component is "0";
   attribute INIT_00 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_01 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_02 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_03 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_04 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_05 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_06 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_07 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_08 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_09 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_10 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_11 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_12 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_13 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_14 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_15 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_16 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_17 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_18 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_19 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_20 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_21 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_22 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_23 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_24 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_25 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_26 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_27 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_28 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_29 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_30 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_31 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_32 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_33 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_34 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_35 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_36 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_37 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_38 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_39 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_A of ramb16 : component is "000000000";
   attribute INIT_B of ramb16 : component is "000000000";
   attribute INITP_00 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_01 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_02 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_03 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_04 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_05 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_06 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_07 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_FILE of ramb16 : component is "NONE";
   attribute INVERT_CLK_DOA_REG of ramb16 : component is "FALSE";
   attribute INVERT_CLK_DOB_REG of ramb16 : component is "FALSE";
   attribute RAM_EXTENSION_A of ramb16 : component is "NONE";
   attribute RAM_EXTENSION_B of ramb16 : component is "NONE";
   attribute READ_WIDTH_A of ramb16 : component is "0";
   attribute READ_WIDTH_B of ramb16 : component is "0";
   attribute SRVAL_A of ramb16 : component is "000000000";
   attribute SRVAL_B of ramb16 : component is "000000000";
   attribute WRITE_MODE_A of ramb16 : component is "WRITE_FIRST";
   attribute WRITE_MODE_B of ramb16 : component is "WRITE_FIRST";
   attribute WRITE_WIDTH_A of ramb16 : component is "0";
   attribute WRITE_WIDTH_B of ramb16 : component is "0";
   attribute SIM_COLLISION_CHECK of ramb16 : component is "ALL";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute INIT_07 of ROM_KVPTAT : label is 
         "b9800000ba000000ba400000ba800000baa00000bac00000bae00000bb000000";
   attribute INIT_06 of ROM_KVPTAT : label is 
         "bb100000bb200000bb300000bb400000bb500000bb600000bb700000bb800000";
   attribute INIT_05 of ROM_KVPTAT : label is 
         "bb880000bb900000bb980000bba00000bba80000bbb00000bbb80000bbc00000";
   attribute INIT_04 of ROM_KVPTAT : label is 
         "bbc80000bbd00000bbd80000bbe00000bbe80000bbf00000bbf80000bc000000";
   attribute INIT_03 of ROM_KVPTAT : label is 
         "3bf800003bf000003be800003be000003bd800003bd000003bc800003bc00000";
   attribute INIT_02 of ROM_KVPTAT : label is 
         "3bb800003bb000003ba800003ba000003b9800003b9000003b8800003b800000";
   attribute INIT_01 of ROM_KVPTAT : label is 
         "3b7000003b6000003b5000003b4000003b3000003b2000003b1000003b000000";
   attribute INIT_00 of ROM_KVPTAT : label is 
         "3ae000003ac000003aa000003a8000003a4000003a0000003980000022000000";
   attribute WRITE_WIDTH_B of ROM_KVPTAT : label is "36";
   attribute WRITE_WIDTH_A of ROM_KVPTAT : label is "36";
   attribute WRITE_MODE_B of ROM_KVPTAT : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_KVPTAT : label is "READ_FIRST";
   attribute READ_WIDTH_B of ROM_KVPTAT : label is "36";
   attribute READ_WIDTH_A of ROM_KVPTAT : label is "36";
begin
   BUF_0 : BUF
      port map (I=>i_ee0x2432(10),
                O=>ADDRA(5));
   
   BUF_1 : BUF
      port map (I=>i_ee0x2432(11),
                O=>ADDRA(6));
   
   BUF_2 : BUF
      port map (I=>i_ee0x2432(12),
                O=>ADDRA(7));
   
   BUF_3 : BUF
      port map (I=>i_ee0x2432(13),
                O=>ADDRA(8));
   
   BUF_4 : BUF
      port map (I=>i_ee0x2432(14),
                O=>ADDRA(9));
   
   BUF_5 : BUF
      port map (I=>i_ee0x2432(15),
                O=>ADDRA(10));
   
   ROM_KVPTAT : ramb16
   -- synopsys translate_off
   generic map( INIT_07 => 
         x"b9800000ba000000ba400000ba800000baa00000bac00000bae00000bb000000",
            INIT_06 => 
         x"bb100000bb200000bb300000bb400000bb500000bb600000bb700000bb800000",
            INIT_05 => 
         x"bb880000bb900000bb980000bba00000bba80000bbb00000bbb80000bbc00000",
            INIT_04 => 
         x"bbc80000bbd00000bbd80000bbe00000bbe80000bbf00000bbf80000bc000000",
            INIT_03 => 
         x"3bf800003bf000003be800003be000003bd800003bd000003bc800003bc00000",
            INIT_02 => 
         x"3bb800003bb000003ba800003ba000003b9800003b9000003b8800003b800000",
            INIT_01 => 
         x"3b7000003b6000003b5000003b4000003b3000003b2000003b1000003b000000",
            INIT_00 => 
         x"3ae000003ac000003aa000003a8000003a4000003a0000003980000022000000",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>ADDRA(14 downto 0),
                ADDRB(14 downto 0)=>ROM_KVPTAT_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>ROM_KVPTAT_CASCADEINA_openSignal,
                CASCADEINB=>ROM_KVPTAT_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>ROM_KVPTAT_CLKB_openSignal,
                DIA(31 downto 0)=>ROM_KVPTAT_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>ROM_KVPTAT_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>ROM_KVPTAT_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>ROM_KVPTAT_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_11,
                ENB=>ROM_KVPTAT_ENB_openSignal,
                REGCEA=>ROM_KVPTAT_REGCEA_openSignal,
                REGCEB=>ROM_KVPTAT_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>ROM_KVPTAT_SSRB_openSignal,
                WEA(3 downto 0)=>ROM_KVPTAT_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>ROM_KVPTAT_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>o_kvptat(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_5_0 : GND
      port map (G=>ADDRA(11));
   
   XLXI_5_1 : GND
      port map (G=>ADDRA(12));
   
   XLXI_5_2 : GND
      port map (G=>ADDRA(13));
   
   XLXI_5_3 : GND
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
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity M2_1_MXILINX_CalculateTa is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_CalculateTa;

architecture BEHAVIORAL of M2_1_MXILINX_CalculateTa is
   attribute BOX_TYPE   : string ;
   signal M0 : std_logic;
   signal M1 : std_logic;
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   I_36_7 : AND2B1
      port map (I0=>S0,
                I1=>D0,
                O=>M0);
   
   I_36_8 : OR2
      port map (I0=>M1,
                I1=>M0,
                O=>O);
   
   I_36_9 : AND2
      port map (I0=>D1,
                I1=>S0,
                O=>M1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ExtractKtPTATParameter_MUSER_CalculateTa is
   port ( i_clock    : in    std_logic; 
          i_ee0x2432 : in    std_logic_vector (15 downto 0); 
          i_reset    : in    std_logic; 
          o_ktptat   : out   std_logic_vector (31 downto 0));
end ExtractKtPTATParameter_MUSER_CalculateTa;

architecture BEHAVIORAL of ExtractKtPTATParameter_MUSER_CalculateTa is
   attribute BOX_TYPE            : string ;
   attribute HU_SET              : string ;
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
   signal ADDRA      : std_logic_vector (15 downto 0);
   signal MEM1_ADDRA : std_logic_vector (14 downto 0);
   signal MEM2_ADDRA : std_logic_vector (14 downto 0);
   signal XLXN_41    : std_logic_vector (9 downto 0);
   signal XLXN_58    : std_logic_vector (31 downto 0);
   signal XLXN_59    : std_logic_vector (31 downto 0);
   signal XLXN_68    : std_logic;
   signal XLXN_72    : std_logic_vector (31 downto 0);
   signal XLXN_74    : std_logic_vector (3 downto 0);
   signal XLXN_76    : std_logic;
   signal XLXN_82    : std_logic_vector (31 downto 0);
   signal XLXN_83    : std_logic_vector (3 downto 0);
   signal XLXN_84    : std_logic;
   signal XLXN_85    : std_logic;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component M2_1_MXILINX_CalculateTa
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component ramb16
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
   attribute DOA_REG of ramb16 : component is "0";
   attribute DOB_REG of ramb16 : component is "0";
   attribute INIT_00 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_01 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_02 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_03 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_04 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_05 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_06 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_07 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_08 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_09 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_10 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_11 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_12 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_13 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_14 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_15 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_16 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_17 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_18 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_19 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_20 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_21 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_22 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_23 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_24 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_25 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_26 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_27 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_28 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_29 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_30 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_31 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_32 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_33 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_34 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_35 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_36 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_37 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_38 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_39 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3A of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3B of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3C of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3D of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3E of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3F of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_A of ramb16 : component is "000000000";
   attribute INIT_B of ramb16 : component is "000000000";
   attribute INITP_00 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_01 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_02 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_03 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_04 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_05 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_06 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INITP_07 of ramb16 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_FILE of ramb16 : component is "NONE";
   attribute INVERT_CLK_DOA_REG of ramb16 : component is "FALSE";
   attribute INVERT_CLK_DOB_REG of ramb16 : component is "FALSE";
   attribute RAM_EXTENSION_A of ramb16 : component is "NONE";
   attribute RAM_EXTENSION_B of ramb16 : component is "NONE";
   attribute READ_WIDTH_A of ramb16 : component is "0";
   attribute READ_WIDTH_B of ramb16 : component is "0";
   attribute SRVAL_A of ramb16 : component is "000000000";
   attribute SRVAL_B of ramb16 : component is "000000000";
   attribute WRITE_MODE_A of ramb16 : component is "WRITE_FIRST";
   attribute WRITE_MODE_B of ramb16 : component is "WRITE_FIRST";
   attribute WRITE_WIDTH_A of ramb16 : component is "0";
   attribute WRITE_WIDTH_B of ramb16 : component is "0";
   attribute SIM_COLLISION_CHECK of ramb16 : component is "ALL";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of extractktptatparameter_MUX_DO_0 : label is 
         "extractktptatparameter_MUX_DO_0_653";
   attribute HU_SET of extractktptatparameter_MUX_DO_1 : label is 
         "extractktptatparameter_MUX_DO_1_652";
   attribute HU_SET of extractktptatparameter_MUX_DO_2 : label is 
         "extractktptatparameter_MUX_DO_2_651";
   attribute HU_SET of extractktptatparameter_MUX_DO_3 : label is 
         "extractktptatparameter_MUX_DO_3_650";
   attribute HU_SET of extractktptatparameter_MUX_DO_4 : label is 
         "extractktptatparameter_MUX_DO_4_649";
   attribute HU_SET of extractktptatparameter_MUX_DO_5 : label is 
         "extractktptatparameter_MUX_DO_5_648";
   attribute HU_SET of extractktptatparameter_MUX_DO_6 : label is 
         "extractktptatparameter_MUX_DO_6_647";
   attribute HU_SET of extractktptatparameter_MUX_DO_7 : label is 
         "extractktptatparameter_MUX_DO_7_646";
   attribute HU_SET of extractktptatparameter_MUX_DO_8 : label is 
         "extractktptatparameter_MUX_DO_8_645";
   attribute HU_SET of extractktptatparameter_MUX_DO_9 : label is 
         "extractktptatparameter_MUX_DO_9_644";
   attribute HU_SET of extractktptatparameter_MUX_DO_10 : label is 
         "extractktptatparameter_MUX_DO_10_643";
   attribute HU_SET of extractktptatparameter_MUX_DO_11 : label is 
         "extractktptatparameter_MUX_DO_11_642";
   attribute HU_SET of extractktptatparameter_MUX_DO_12 : label is 
         "extractktptatparameter_MUX_DO_12_641";
   attribute HU_SET of extractktptatparameter_MUX_DO_13 : label is 
         "extractktptatparameter_MUX_DO_13_640";
   attribute HU_SET of extractktptatparameter_MUX_DO_14 : label is 
         "extractktptatparameter_MUX_DO_14_639";
   attribute HU_SET of extractktptatparameter_MUX_DO_15 : label is 
         "extractktptatparameter_MUX_DO_15_638";
   attribute HU_SET of extractktptatparameter_MUX_DO_16 : label is 
         "extractktptatparameter_MUX_DO_16_637";
   attribute HU_SET of extractktptatparameter_MUX_DO_17 : label is 
         "extractktptatparameter_MUX_DO_17_636";
   attribute HU_SET of extractktptatparameter_MUX_DO_18 : label is 
         "extractktptatparameter_MUX_DO_18_635";
   attribute HU_SET of extractktptatparameter_MUX_DO_19 : label is 
         "extractktptatparameter_MUX_DO_19_634";
   attribute HU_SET of extractktptatparameter_MUX_DO_20 : label is 
         "extractktptatparameter_MUX_DO_20_633";
   attribute HU_SET of extractktptatparameter_MUX_DO_21 : label is 
         "extractktptatparameter_MUX_DO_21_632";
   attribute HU_SET of extractktptatparameter_MUX_DO_22 : label is 
         "extractktptatparameter_MUX_DO_22_631";
   attribute HU_SET of extractktptatparameter_MUX_DO_23 : label is 
         "extractktptatparameter_MUX_DO_23_630";
   attribute HU_SET of extractktptatparameter_MUX_DO_24 : label is 
         "extractktptatparameter_MUX_DO_24_629";
   attribute HU_SET of extractktptatparameter_MUX_DO_25 : label is 
         "extractktptatparameter_MUX_DO_25_628";
   attribute HU_SET of extractktptatparameter_MUX_DO_26 : label is 
         "extractktptatparameter_MUX_DO_26_627";
   attribute HU_SET of extractktptatparameter_MUX_DO_27 : label is 
         "extractktptatparameter_MUX_DO_27_626";
   attribute HU_SET of extractktptatparameter_MUX_DO_28 : label is 
         "extractktptatparameter_MUX_DO_28_625";
   attribute HU_SET of extractktptatparameter_MUX_DO_29 : label is 
         "extractktptatparameter_MUX_DO_29_624";
   attribute HU_SET of extractktptatparameter_MUX_DO_30 : label is 
         "extractktptatparameter_MUX_DO_30_623";
   attribute HU_SET of extractktptatparameter_MUX_DO_31 : label is 
         "extractktptatparameter_MUX_DO_31_622";
   attribute WRITE_WIDTH_B of ROM_KTPTAT_0to3F : label is "36";
   attribute WRITE_WIDTH_A of ROM_KTPTAT_0to3F : label is "36";
   attribute READ_WIDTH_B of ROM_KTPTAT_0to3F : label is "36";
   attribute READ_WIDTH_A of ROM_KTPTAT_0to3F : label is "36";
   attribute INIT_0B of ROM_KTPTAT_0to3F : label is 
         "413e0000413c0000413a00004138000041360000413400004132000041300000";
   attribute INIT_0A of ROM_KTPTAT_0to3F : label is 
         "412e0000412c0000412a00004128000041260000412400004122000041200000";
   attribute INIT_2A of ROM_KTPTAT_0to3F : label is 
         "422b8000422b0000422a8000422a000042298000422900004228800042280000";
   attribute INIT_2B of ROM_KTPTAT_0to3F : label is 
         "422f8000422f0000422e8000422e0000422d8000422d0000422c8000422c0000";
   attribute WRITE_MODE_B of ROM_KTPTAT_0to3F : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_KTPTAT_0to3F : label is "READ_FIRST";
   attribute INIT_16 of ROM_KTPTAT_0to3F : label is 
         "41b7000041b6000041b5000041b4000041b3000041b2000041b1000041b00000";
   attribute INIT_15 of ROM_KTPTAT_0to3F : label is 
         "41af000041ae000041ad000041ac000041ab000041aa000041a9000041a80000";
   attribute INIT_3F of ROM_KTPTAT_0to3F : label is 
         "427f8000427f0000427e8000427e0000427d8000427d0000427c8000427c0000";
   attribute INIT_3E of ROM_KTPTAT_0to3F : label is 
         "427b8000427b0000427a8000427a000042798000427900004278800042780000";
   attribute INIT_3D of ROM_KTPTAT_0to3F : label is 
         "4277800042770000427680004276000042758000427500004274800042740000";
   attribute INIT_3C of ROM_KTPTAT_0to3F : label is 
         "4273800042730000427280004272000042718000427100004270800042700000";
   attribute INIT_3B of ROM_KTPTAT_0to3F : label is 
         "426f8000426f0000426e8000426e0000426d8000426d0000426c8000426c0000";
   attribute INIT_3A of ROM_KTPTAT_0to3F : label is 
         "426b8000426b0000426a8000426a000042698000426900004268800042680000";
   attribute INIT_39 of ROM_KTPTAT_0to3F : label is 
         "4267800042670000426680004266000042658000426500004264800042640000";
   attribute INIT_38 of ROM_KTPTAT_0to3F : label is 
         "4263800042630000426280004262000042618000426100004260800042600000";
   attribute INIT_37 of ROM_KTPTAT_0to3F : label is 
         "425f8000425f0000425e8000425e0000425d8000425d0000425c8000425c0000";
   attribute INIT_36 of ROM_KTPTAT_0to3F : label is 
         "425b8000425b0000425a8000425a000042598000425900004258800042580000";
   attribute INIT_35 of ROM_KTPTAT_0to3F : label is 
         "4257800042570000425680004256000042558000425500004254800042540000";
   attribute INIT_34 of ROM_KTPTAT_0to3F : label is 
         "4253800042530000425280004252000042518000425100004250800042500000";
   attribute INIT_33 of ROM_KTPTAT_0to3F : label is 
         "424f8000424f0000424e8000424e0000424d8000424d0000424c8000424c0000";
   attribute INIT_32 of ROM_KTPTAT_0to3F : label is 
         "424b8000424b0000424a8000424a000042498000424900004248800042480000";
   attribute INIT_31 of ROM_KTPTAT_0to3F : label is 
         "4247800042470000424680004246000042458000424500004244800042440000";
   attribute INIT_30 of ROM_KTPTAT_0to3F : label is 
         "4243800042430000424280004242000042418000424100004240800042400000";
   attribute INIT_2F of ROM_KTPTAT_0to3F : label is 
         "423f8000423f0000423e8000423e0000423d8000423d0000423c8000423c0000";
   attribute INIT_2E of ROM_KTPTAT_0to3F : label is 
         "423b8000423b0000423a8000423a000042398000423900004238800042380000";
   attribute INIT_2D of ROM_KTPTAT_0to3F : label is 
         "4237800042370000423680004236000042358000423500004234800042340000";
   attribute INIT_2C of ROM_KTPTAT_0to3F : label is 
         "4233800042330000423280004232000042318000423100004230800042300000";
   attribute INIT_29 of ROM_KTPTAT_0to3F : label is 
         "4227800042270000422680004226000042258000422500004224800042240000";
   attribute INIT_28 of ROM_KTPTAT_0to3F : label is 
         "4223800042230000422280004222000042218000422100004220800042200000";
   attribute INIT_27 of ROM_KTPTAT_0to3F : label is 
         "421f8000421f0000421e8000421e0000421d8000421d0000421c8000421c0000";
   attribute INIT_26 of ROM_KTPTAT_0to3F : label is 
         "421b8000421b0000421a8000421a000042198000421900004218800042180000";
   attribute INIT_25 of ROM_KTPTAT_0to3F : label is 
         "4217800042170000421680004216000042158000421500004214800042140000";
   attribute INIT_24 of ROM_KTPTAT_0to3F : label is 
         "4213800042130000421280004212000042118000421100004210800042100000";
   attribute INIT_23 of ROM_KTPTAT_0to3F : label is 
         "420f8000420f0000420e8000420e0000420d8000420d0000420c8000420c0000";
   attribute INIT_22 of ROM_KTPTAT_0to3F : label is 
         "420b8000420b0000420a8000420a000042098000420900004208800042080000";
   attribute INIT_21 of ROM_KTPTAT_0to3F : label is 
         "4207800042070000420680004206000042058000420500004204800042040000";
   attribute INIT_20 of ROM_KTPTAT_0to3F : label is 
         "4203800042030000420280004202000042018000420100004200800042000000";
   attribute INIT_1F of ROM_KTPTAT_0to3F : label is 
         "41ff000041fe000041fd000041fc000041fb000041fa000041f9000041f80000";
   attribute INIT_1E of ROM_KTPTAT_0to3F : label is 
         "41f7000041f6000041f5000041f4000041f3000041f2000041f1000041f00000";
   attribute INIT_1D of ROM_KTPTAT_0to3F : label is 
         "41ef000041ee000041ed000041ec000041eb000041ea000041e9000041e80000";
   attribute INIT_1C of ROM_KTPTAT_0to3F : label is 
         "41e7000041e6000041e5000041e4000041e3000041e2000041e1000041e00000";
   attribute INIT_1B of ROM_KTPTAT_0to3F : label is 
         "41df000041de000041dd000041dc000041db000041da000041d9000041d80000";
   attribute INIT_1A of ROM_KTPTAT_0to3F : label is 
         "41d7000041d6000041d5000041d4000041d3000041d2000041d1000041d00000";
   attribute INIT_19 of ROM_KTPTAT_0to3F : label is 
         "41cf000041ce000041cd000041cc000041cb000041ca000041c9000041c80000";
   attribute INIT_18 of ROM_KTPTAT_0to3F : label is 
         "41c7000041c6000041c5000041c4000041c3000041c2000041c1000041c00000";
   attribute INIT_17 of ROM_KTPTAT_0to3F : label is 
         "41bf000041be000041bd000041bc000041bb000041ba000041b9000041b80000";
   attribute INIT_14 of ROM_KTPTAT_0to3F : label is 
         "41a7000041a6000041a5000041a4000041a3000041a2000041a1000041a00000";
   attribute INIT_13 of ROM_KTPTAT_0to3F : label is 
         "419f0000419e0000419d0000419c0000419b0000419a00004199000041980000";
   attribute INIT_12 of ROM_KTPTAT_0to3F : label is 
         "4197000041960000419500004194000041930000419200004191000041900000";
   attribute INIT_11 of ROM_KTPTAT_0to3F : label is 
         "418f0000418e0000418d0000418c0000418b0000418a00004189000041880000";
   attribute INIT_10 of ROM_KTPTAT_0to3F : label is 
         "4187000041860000418500004184000041830000418200004181000041800000";
   attribute INIT_0F of ROM_KTPTAT_0to3F : label is 
         "417e0000417c0000417a00004178000041760000417400004172000041700000";
   attribute INIT_0E of ROM_KTPTAT_0to3F : label is 
         "416e0000416c0000416a00004168000041660000416400004162000041600000";
   attribute INIT_0D of ROM_KTPTAT_0to3F : label is 
         "415e0000415c0000415a00004158000041560000415400004152000041500000";
   attribute INIT_0C of ROM_KTPTAT_0to3F : label is 
         "414e0000414c0000414a00004148000041460000414400004142000041400000";
   attribute INIT_09 of ROM_KTPTAT_0to3F : label is 
         "411e0000411c0000411a00004118000041160000411400004112000041100000";
   attribute INIT_08 of ROM_KTPTAT_0to3F : label is 
         "410e0000410c0000410a00004108000041060000410400004102000041000000";
   attribute INIT_07 of ROM_KTPTAT_0to3F : label is 
         "40fc000040f8000040f4000040f0000040ec000040e8000040e4000040e00000";
   attribute INIT_06 of ROM_KTPTAT_0to3F : label is 
         "40dc000040d8000040d4000040d0000040cc000040c8000040c4000040c00000";
   attribute INIT_05 of ROM_KTPTAT_0to3F : label is 
         "40bc000040b8000040b4000040b0000040ac000040a8000040a4000040a00000";
   attribute INIT_04 of ROM_KTPTAT_0to3F : label is 
         "409c0000409800004094000040900000408c0000408800004084000040800000";
   attribute INIT_03 of ROM_KTPTAT_0to3F : label is 
         "4078000040700000406800004060000040580000405000004048000040400000";
   attribute INIT_02 of ROM_KTPTAT_0to3F : label is 
         "4038000040300000402800004020000040180000401000004008000040000000";
   attribute INIT_01 of ROM_KTPTAT_0to3F : label is 
         "3ff000003fe000003fd000003fc000003fb000003fa000003f9000003f800000";
   attribute INIT_00 of ROM_KTPTAT_0to3F : label is 
         "3f6000003f4000003f2000003f0000003ec000003e8000003e00000022000000";
   attribute WRITE_WIDTH_B of ROM_KTPTAT_40to7f : label is "36";
   attribute WRITE_WIDTH_A of ROM_KTPTAT_40to7f : label is "36";
   attribute READ_WIDTH_B of ROM_KTPTAT_40to7f : label is "36";
   attribute READ_WIDTH_A of ROM_KTPTAT_40to7f : label is "36";
   attribute INIT_0B of ROM_KTPTAT_40to7f : label is 
         "c2508000c2510000c2518000c2520000c2528000c2530000c2538000c2540000";
   attribute INIT_0A of ROM_KTPTAT_40to7f : label is 
         "c2548000c2550000c2558000c2560000c2568000c2570000c2578000c2580000";
   attribute INIT_2A of ROM_KTPTAT_40to7f : label is 
         "c1a90000c1aa0000c1ab0000c1ac0000c1ad0000c1ae0000c1af0000c1b00000";
   attribute INIT_2B of ROM_KTPTAT_40to7f : label is 
         "c1a10000c1a20000c1a30000c1a40000c1a50000c1a60000c1a70000c1a80000";
   attribute WRITE_MODE_B of ROM_KTPTAT_40to7f : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_KTPTAT_40to7f : label is "READ_FIRST";
   attribute INIT_16 of ROM_KTPTAT_40to7f : label is 
         "c2248000c2250000c2258000c2260000c2268000c2270000c2278000c2280000";
   attribute INIT_15 of ROM_KTPTAT_40to7f : label is 
         "c2288000c2290000c2298000c22a0000c22a8000c22b0000c22b8000c22c0000";
   attribute INIT_3F of ROM_KTPTAT_40to7f : label is 
         "be000000be800000bec00000bf000000bf200000bf400000bf600000bf800000";
   attribute INIT_3E of ROM_KTPTAT_40to7f : label is 
         "bf900000bfa00000bfb00000bfc00000bfd00000bfe00000bff00000c0000000";
   attribute INIT_3D of ROM_KTPTAT_40to7f : label is 
         "c0080000c0100000c0180000c0200000c0280000c0300000c0380000c0400000";
   attribute INIT_3C of ROM_KTPTAT_40to7f : label is 
         "c0480000c0500000c0580000c0600000c0680000c0700000c0780000c0800000";
   attribute INIT_3B of ROM_KTPTAT_40to7f : label is 
         "c0840000c0880000c08c0000c0900000c0940000c0980000c09c0000c0a00000";
   attribute INIT_3A of ROM_KTPTAT_40to7f : label is 
         "c0a40000c0a80000c0ac0000c0b00000c0b40000c0b80000c0bc0000c0c00000";
   attribute INIT_39 of ROM_KTPTAT_40to7f : label is 
         "c0c40000c0c80000c0cc0000c0d00000c0d40000c0d80000c0dc0000c0e00000";
   attribute INIT_38 of ROM_KTPTAT_40to7f : label is 
         "c0e40000c0e80000c0ec0000c0f00000c0f40000c0f80000c0fc0000c1000000";
   attribute INIT_37 of ROM_KTPTAT_40to7f : label is 
         "c1020000c1040000c1060000c1080000c10a0000c10c0000c10e0000c1100000";
   attribute INIT_36 of ROM_KTPTAT_40to7f : label is 
         "c1120000c1140000c1160000c1180000c11a0000c11c0000c11e0000c1200000";
   attribute INIT_35 of ROM_KTPTAT_40to7f : label is 
         "c1220000c1240000c1260000c1280000c12a0000c12c0000c12e0000c1300000";
   attribute INIT_34 of ROM_KTPTAT_40to7f : label is 
         "c1320000c1340000c1360000c1380000c13a0000c13c0000c13e0000c1400000";
   attribute INIT_33 of ROM_KTPTAT_40to7f : label is 
         "c1420000c1440000c1460000c1480000c14a0000c14c0000c14e0000c1500000";
   attribute INIT_32 of ROM_KTPTAT_40to7f : label is 
         "c1520000c1540000c1560000c1580000c15a0000c15c0000c15e0000c1600000";
   attribute INIT_31 of ROM_KTPTAT_40to7f : label is 
         "c1620000c1640000c1660000c1680000c16a0000c16c0000c16e0000c1700000";
   attribute INIT_30 of ROM_KTPTAT_40to7f : label is 
         "c1720000c1740000c1760000c1780000c17a0000c17c0000c17e0000c1800000";
   attribute INIT_2F of ROM_KTPTAT_40to7f : label is 
         "c1810000c1820000c1830000c1840000c1850000c1860000c1870000c1880000";
   attribute INIT_2E of ROM_KTPTAT_40to7f : label is 
         "c1890000c18a0000c18b0000c18c0000c18d0000c18e0000c18f0000c1900000";
   attribute INIT_2D of ROM_KTPTAT_40to7f : label is 
         "c1910000c1920000c1930000c1940000c1950000c1960000c1970000c1980000";
   attribute INIT_2C of ROM_KTPTAT_40to7f : label is 
         "c1990000c19a0000c19b0000c19c0000c19d0000c19e0000c19f0000c1a00000";
   attribute INIT_29 of ROM_KTPTAT_40to7f : label is 
         "c1b10000c1b20000c1b30000c1b40000c1b50000c1b60000c1b70000c1b80000";
   attribute INIT_28 of ROM_KTPTAT_40to7f : label is 
         "c1b90000c1ba0000c1bb0000c1bc0000c1bd0000c1be0000c1bf0000c1c00000";
   attribute INIT_27 of ROM_KTPTAT_40to7f : label is 
         "c1c10000c1c20000c1c30000c1c40000c1c50000c1c60000c1c70000c1c80000";
   attribute INIT_26 of ROM_KTPTAT_40to7f : label is 
         "c1c90000c1ca0000c1cb0000c1cc0000c1cd0000c1ce0000c1cf0000c1d00000";
   attribute INIT_25 of ROM_KTPTAT_40to7f : label is 
         "c1d10000c1d20000c1d30000c1d40000c1d50000c1d60000c1d70000c1d80000";
   attribute INIT_24 of ROM_KTPTAT_40to7f : label is 
         "c1d90000c1da0000c1db0000c1dc0000c1dd0000c1de0000c1df0000c1e00000";
   attribute INIT_23 of ROM_KTPTAT_40to7f : label is 
         "c1e10000c1e20000c1e30000c1e40000c1e50000c1e60000c1e70000c1e80000";
   attribute INIT_22 of ROM_KTPTAT_40to7f : label is 
         "c1e90000c1ea0000c1eb0000c1ec0000c1ed0000c1ee0000c1ef0000c1f00000";
   attribute INIT_21 of ROM_KTPTAT_40to7f : label is 
         "c1f10000c1f20000c1f30000c1f40000c1f50000c1f60000c1f70000c1f80000";
   attribute INIT_20 of ROM_KTPTAT_40to7f : label is 
         "c1f90000c1fa0000c1fb0000c1fc0000c1fd0000c1fe0000c1ff0000c2000000";
   attribute INIT_1F of ROM_KTPTAT_40to7f : label is 
         "c2008000c2010000c2018000c2020000c2028000c2030000c2038000c2040000";
   attribute INIT_1E of ROM_KTPTAT_40to7f : label is 
         "c2048000c2050000c2058000c2060000c2068000c2070000c2078000c2080000";
   attribute INIT_1D of ROM_KTPTAT_40to7f : label is 
         "c2088000c2090000c2098000c20a0000c20a8000c20b0000c20b8000c20c0000";
   attribute INIT_1C of ROM_KTPTAT_40to7f : label is 
         "c20c8000c20d0000c20d8000c20e0000c20e8000c20f0000c20f8000c2100000";
   attribute INIT_1B of ROM_KTPTAT_40to7f : label is 
         "c2108000c2110000c2118000c2120000c2128000c2130000c2138000c2140000";
   attribute INIT_1A of ROM_KTPTAT_40to7f : label is 
         "c2148000c2150000c2158000c2160000c2168000c2170000c2178000c2180000";
   attribute INIT_19 of ROM_KTPTAT_40to7f : label is 
         "c2188000c2190000c2198000c21a0000c21a8000c21b0000c21b8000c21c0000";
   attribute INIT_18 of ROM_KTPTAT_40to7f : label is 
         "c21c8000c21d0000c21d8000c21e0000c21e8000c21f0000c21f8000c2200000";
   attribute INIT_17 of ROM_KTPTAT_40to7f : label is 
         "c2208000c2210000c2218000c2220000c2228000c2230000c2238000c2240000";
   attribute INIT_14 of ROM_KTPTAT_40to7f : label is 
         "c22c8000c22d0000c22d8000c22e0000c22e8000c22f0000c22f8000c2300000";
   attribute INIT_13 of ROM_KTPTAT_40to7f : label is 
         "c2308000c2310000c2318000c2320000c2328000c2330000c2338000c2340000";
   attribute INIT_12 of ROM_KTPTAT_40to7f : label is 
         "c2348000c2350000c2358000c2360000c2368000c2370000c2378000c2380000";
   attribute INIT_11 of ROM_KTPTAT_40to7f : label is 
         "c2388000c2390000c2398000c23a0000c23a8000c23b0000c23b8000c23c0000";
   attribute INIT_10 of ROM_KTPTAT_40to7f : label is 
         "c23c8000c23d0000c23d8000c23e0000c23e8000c23f0000c23f8000c2400000";
   attribute INIT_0F of ROM_KTPTAT_40to7f : label is 
         "c2408000c2410000c2418000c2420000c2428000c2430000c2438000c2440000";
   attribute INIT_0E of ROM_KTPTAT_40to7f : label is 
         "c2448000c2450000c2458000c2460000c2468000c2470000c2478000c2480000";
   attribute INIT_0D of ROM_KTPTAT_40to7f : label is 
         "c2488000c2490000c2498000c24a0000c24a8000c24b0000c24b8000c24c0000";
   attribute INIT_0C of ROM_KTPTAT_40to7f : label is 
         "c24c8000c24d0000c24d8000c24e0000c24e8000c24f0000c24f8000c2500000";
   attribute INIT_09 of ROM_KTPTAT_40to7f : label is 
         "c2588000c2590000c2598000c25a0000c25a8000c25b0000c25b8000c25c0000";
   attribute INIT_08 of ROM_KTPTAT_40to7f : label is 
         "c25c8000c25d0000c25d8000c25e0000c25e8000c25f0000c25f8000c2600000";
   attribute INIT_07 of ROM_KTPTAT_40to7f : label is 
         "c2608000c2610000c2618000c2620000c2628000c2630000c2638000c2640000";
   attribute INIT_06 of ROM_KTPTAT_40to7f : label is 
         "c2648000c2650000c2658000c2660000c2668000c2670000c2678000c2680000";
   attribute INIT_05 of ROM_KTPTAT_40to7f : label is 
         "c2688000c2690000c2698000c26a0000c26a8000c26b0000c26b8000c26c0000";
   attribute INIT_04 of ROM_KTPTAT_40to7f : label is 
         "c26c8000c26d0000c26d8000c26e0000c26e8000c26f0000c26f8000c2700000";
   attribute INIT_03 of ROM_KTPTAT_40to7f : label is 
         "c2708000c2710000c2718000c2720000c2728000c2730000c2738000c2740000";
   attribute INIT_02 of ROM_KTPTAT_40to7f : label is 
         "c2748000c2750000c2758000c2760000c2768000c2770000c2778000c2780000";
   attribute INIT_01 of ROM_KTPTAT_40to7f : label is 
         "c2788000c2790000c2798000c27a0000c27a8000c27b0000c27b8000c27c0000";
   attribute INIT_00 of ROM_KTPTAT_40to7f : label is 
         "c27c8000c27d0000c27d8000c27e0000c27e8000c27f0000c27f8000c2800000";
begin
   BUF_MEM1_ADDRA_5 : BUF
      port map (I=>XLXN_41(0),
                O=>MEM1_ADDRA(5));
   
   BUF_MEM1_ADDRA_6 : BUF
      port map (I=>XLXN_41(1),
                O=>MEM1_ADDRA(6));
   
   BUF_MEM1_ADDRA_7 : BUF
      port map (I=>XLXN_41(2),
                O=>MEM1_ADDRA(7));
   
   BUF_MEM1_ADDRA_8 : BUF
      port map (I=>XLXN_41(3),
                O=>MEM1_ADDRA(8));
   
   BUF_MEM1_ADDRA_9 : BUF
      port map (I=>XLXN_41(4),
                O=>MEM1_ADDRA(9));
   
   BUF_MEM1_ADDRA_10 : BUF
      port map (I=>XLXN_41(5),
                O=>MEM1_ADDRA(10));
   
   BUF_MEM1_ADDRA_11 : BUF
      port map (I=>XLXN_41(6),
                O=>MEM1_ADDRA(11));
   
   BUF_MEM1_ADDRA_12 : BUF
      port map (I=>XLXN_41(7),
                O=>MEM1_ADDRA(12));
   
   BUF_MEM1_ADDRA_13 : BUF
      port map (I=>XLXN_41(8),
                O=>MEM1_ADDRA(13));
   
   BUF_MEM2_ADDRA_5 : BUF
      port map (I=>ADDRA(0),
                O=>MEM2_ADDRA(5));
   
   BUF_MEM2_ADDRA_6 : BUF
      port map (I=>ADDRA(1),
                O=>MEM2_ADDRA(6));
   
   BUF_MEM2_ADDRA_7 : BUF
      port map (I=>ADDRA(2),
                O=>MEM2_ADDRA(7));
   
   BUF_MEM2_ADDRA_8 : BUF
      port map (I=>ADDRA(3),
                O=>MEM2_ADDRA(8));
   
   BUF_MEM2_ADDRA_9 : BUF
      port map (I=>ADDRA(4),
                O=>MEM2_ADDRA(9));
   
   BUF_MEM2_ADDRA_10 : BUF
      port map (I=>ADDRA(5),
                O=>MEM2_ADDRA(10));
   
   BUF_MEM2_ADDRA_11 : BUF
      port map (I=>ADDRA(6),
                O=>MEM2_ADDRA(11));
   
   BUF_MEM2_ADDRA_12 : BUF
      port map (I=>ADDRA(7),
                O=>MEM2_ADDRA(12));
   
   BUF_MEM2_ADDRA_13 : BUF
      port map (I=>ADDRA(8),
                O=>MEM2_ADDRA(13));
   
   BUF_0 : BUF
      port map (I=>i_ee0x2432(0),
                O=>ADDRA(0));
   
   BUF_1 : BUF
      port map (I=>i_ee0x2432(1),
                O=>ADDRA(1));
   
   BUF_2 : BUF
      port map (I=>i_ee0x2432(2),
                O=>ADDRA(2));
   
   BUF_3 : BUF
      port map (I=>i_ee0x2432(3),
                O=>ADDRA(3));
   
   BUF_4 : BUF
      port map (I=>i_ee0x2432(4),
                O=>ADDRA(4));
   
   BUF_5 : BUF
      port map (I=>i_ee0x2432(5),
                O=>ADDRA(5));
   
   BUF_6 : BUF
      port map (I=>i_ee0x2432(6),
                O=>ADDRA(6));
   
   BUF_7 : BUF
      port map (I=>i_ee0x2432(7),
                O=>ADDRA(7));
   
   BUF_8 : BUF
      port map (I=>i_ee0x2432(8),
                O=>ADDRA(8));
   
   BUF_9 : BUF
      port map (I=>i_ee0x2432(9),
                O=>ADDRA(9));
   
   BUF_10 : BUF
      port map (I=>i_ee0x2432(10),
                O=>ADDRA(10));
   
   BUF_11 : BUF
      port map (I=>i_ee0x2432(11),
                O=>ADDRA(11));
   
   BUF_12 : BUF
      port map (I=>i_ee0x2432(12),
                O=>ADDRA(12));
   
   BUF_13 : BUF
      port map (I=>i_ee0x2432(13),
                O=>ADDRA(13));
   
   BUF_14 : BUF
      port map (I=>i_ee0x2432(14),
                O=>ADDRA(14));
   
   BUF_15 : BUF
      port map (I=>i_ee0x2432(15),
                O=>ADDRA(15));
   
   BUF1_ADDRA_0 : BUF
      port map (I=>ADDRA(0),
                O=>XLXN_41(0));
   
   BUF1_ADDRA_1 : BUF
      port map (I=>ADDRA(1),
                O=>XLXN_41(1));
   
   BUF1_ADDRA_2 : BUF
      port map (I=>ADDRA(2),
                O=>XLXN_41(2));
   
   BUF1_ADDRA_3 : BUF
      port map (I=>ADDRA(3),
                O=>XLXN_41(3));
   
   BUF1_ADDRA_4 : BUF
      port map (I=>ADDRA(4),
                O=>XLXN_41(4));
   
   BUF1_ADDRA_5 : BUF
      port map (I=>ADDRA(5),
                O=>XLXN_41(5));
   
   BUF1_ADDRA_6 : BUF
      port map (I=>ADDRA(6),
                O=>XLXN_41(6));
   
   BUF1_ADDRA_7 : BUF
      port map (I=>ADDRA(7),
                O=>XLXN_41(7));
   
   BUF1_ADDRA_8 : BUF
      port map (I=>ADDRA(8),
                O=>XLXN_41(8));
   
   BUF1_ADDRA_9 : BUF
      port map (I=>ADDRA(9),
                O=>XLXN_41(9));
   
   extractktptatparameter_MUX_DO_0 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(0),
                D1=>XLXN_59(0),
                S0=>XLXN_41(9),
                O=>o_ktptat(0));
   
   extractktptatparameter_MUX_DO_1 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(1),
                D1=>XLXN_59(1),
                S0=>XLXN_41(9),
                O=>o_ktptat(1));
   
   extractktptatparameter_MUX_DO_2 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(2),
                D1=>XLXN_59(2),
                S0=>XLXN_41(9),
                O=>o_ktptat(2));
   
   extractktptatparameter_MUX_DO_3 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(3),
                D1=>XLXN_59(3),
                S0=>XLXN_41(9),
                O=>o_ktptat(3));
   
   extractktptatparameter_MUX_DO_4 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(4),
                D1=>XLXN_59(4),
                S0=>XLXN_41(9),
                O=>o_ktptat(4));
   
   extractktptatparameter_MUX_DO_5 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(5),
                D1=>XLXN_59(5),
                S0=>XLXN_41(9),
                O=>o_ktptat(5));
   
   extractktptatparameter_MUX_DO_6 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(6),
                D1=>XLXN_59(6),
                S0=>XLXN_41(9),
                O=>o_ktptat(6));
   
   extractktptatparameter_MUX_DO_7 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(7),
                D1=>XLXN_59(7),
                S0=>XLXN_41(9),
                O=>o_ktptat(7));
   
   extractktptatparameter_MUX_DO_8 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(8),
                D1=>XLXN_59(8),
                S0=>XLXN_41(9),
                O=>o_ktptat(8));
   
   extractktptatparameter_MUX_DO_9 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(9),
                D1=>XLXN_59(9),
                S0=>XLXN_41(9),
                O=>o_ktptat(9));
   
   extractktptatparameter_MUX_DO_10 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(10),
                D1=>XLXN_59(10),
                S0=>XLXN_41(9),
                O=>o_ktptat(10));
   
   extractktptatparameter_MUX_DO_11 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(11),
                D1=>XLXN_59(11),
                S0=>XLXN_41(9),
                O=>o_ktptat(11));
   
   extractktptatparameter_MUX_DO_12 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(12),
                D1=>XLXN_59(12),
                S0=>XLXN_41(9),
                O=>o_ktptat(12));
   
   extractktptatparameter_MUX_DO_13 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(13),
                D1=>XLXN_59(13),
                S0=>XLXN_41(9),
                O=>o_ktptat(13));
   
   extractktptatparameter_MUX_DO_14 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(14),
                D1=>XLXN_59(14),
                S0=>XLXN_41(9),
                O=>o_ktptat(14));
   
   extractktptatparameter_MUX_DO_15 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(15),
                D1=>XLXN_59(15),
                S0=>XLXN_41(9),
                O=>o_ktptat(15));
   
   extractktptatparameter_MUX_DO_16 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(16),
                D1=>XLXN_59(16),
                S0=>XLXN_41(9),
                O=>o_ktptat(16));
   
   extractktptatparameter_MUX_DO_17 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(17),
                D1=>XLXN_59(17),
                S0=>XLXN_41(9),
                O=>o_ktptat(17));
   
   extractktptatparameter_MUX_DO_18 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(18),
                D1=>XLXN_59(18),
                S0=>XLXN_41(9),
                O=>o_ktptat(18));
   
   extractktptatparameter_MUX_DO_19 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(19),
                D1=>XLXN_59(19),
                S0=>XLXN_41(9),
                O=>o_ktptat(19));
   
   extractktptatparameter_MUX_DO_20 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(20),
                D1=>XLXN_59(20),
                S0=>XLXN_41(9),
                O=>o_ktptat(20));
   
   extractktptatparameter_MUX_DO_21 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(21),
                D1=>XLXN_59(21),
                S0=>XLXN_41(9),
                O=>o_ktptat(21));
   
   extractktptatparameter_MUX_DO_22 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(22),
                D1=>XLXN_59(22),
                S0=>XLXN_41(9),
                O=>o_ktptat(22));
   
   extractktptatparameter_MUX_DO_23 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(23),
                D1=>XLXN_59(23),
                S0=>XLXN_41(9),
                O=>o_ktptat(23));
   
   extractktptatparameter_MUX_DO_24 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(24),
                D1=>XLXN_59(24),
                S0=>XLXN_41(9),
                O=>o_ktptat(24));
   
   extractktptatparameter_MUX_DO_25 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(25),
                D1=>XLXN_59(25),
                S0=>XLXN_41(9),
                O=>o_ktptat(25));
   
   extractktptatparameter_MUX_DO_26 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(26),
                D1=>XLXN_59(26),
                S0=>XLXN_41(9),
                O=>o_ktptat(26));
   
   extractktptatparameter_MUX_DO_27 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(27),
                D1=>XLXN_59(27),
                S0=>XLXN_41(9),
                O=>o_ktptat(27));
   
   extractktptatparameter_MUX_DO_28 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(28),
                D1=>XLXN_59(28),
                S0=>XLXN_41(9),
                O=>o_ktptat(28));
   
   extractktptatparameter_MUX_DO_29 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(29),
                D1=>XLXN_59(29),
                S0=>XLXN_41(9),
                O=>o_ktptat(29));
   
   extractktptatparameter_MUX_DO_30 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(30),
                D1=>XLXN_59(30),
                S0=>XLXN_41(9),
                O=>o_ktptat(30));
   
   extractktptatparameter_MUX_DO_31 : M2_1_MXILINX_CalculateTa
      port map (D0=>XLXN_58(31),
                D1=>XLXN_59(31),
                S0=>XLXN_41(9),
                O=>o_ktptat(31));
   
   ROM_KTPTAT_0to3F : ramb16
   -- synopsys translate_off
   generic map( INIT_FILE => "NONE",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36,
            INIT_0B => 
         x"413e0000413c0000413a00004138000041360000413400004132000041300000",
            INIT_0A => 
         x"412e0000412c0000412a00004128000041260000412400004122000041200000",
            INIT_2A => 
         x"422b8000422b0000422a8000422a000042298000422900004228800042280000",
            INIT_2B => 
         x"422f8000422f0000422e8000422e0000422d8000422d0000422c8000422c0000",
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            INIT_16 => 
         x"41b7000041b6000041b5000041b4000041b3000041b2000041b1000041b00000",
            INIT_15 => 
         x"41af000041ae000041ad000041ac000041ab000041aa000041a9000041a80000",
            INIT_3F => 
         x"427f8000427f0000427e8000427e0000427d8000427d0000427c8000427c0000",
            INIT_3E => 
         x"427b8000427b0000427a8000427a000042798000427900004278800042780000",
            INIT_3D => 
         x"4277800042770000427680004276000042758000427500004274800042740000",
            INIT_3C => 
         x"4273800042730000427280004272000042718000427100004270800042700000",
            INIT_3B => 
         x"426f8000426f0000426e8000426e0000426d8000426d0000426c8000426c0000",
            INIT_3A => 
         x"426b8000426b0000426a8000426a000042698000426900004268800042680000",
            INIT_39 => 
         x"4267800042670000426680004266000042658000426500004264800042640000",
            INIT_38 => 
         x"4263800042630000426280004262000042618000426100004260800042600000",
            INIT_37 => 
         x"425f8000425f0000425e8000425e0000425d8000425d0000425c8000425c0000",
            INIT_36 => 
         x"425b8000425b0000425a8000425a000042598000425900004258800042580000",
            INIT_35 => 
         x"4257800042570000425680004256000042558000425500004254800042540000",
            INIT_34 => 
         x"4253800042530000425280004252000042518000425100004250800042500000",
            INIT_33 => 
         x"424f8000424f0000424e8000424e0000424d8000424d0000424c8000424c0000",
            INIT_32 => 
         x"424b8000424b0000424a8000424a000042498000424900004248800042480000",
            INIT_31 => 
         x"4247800042470000424680004246000042458000424500004244800042440000",
            INIT_30 => 
         x"4243800042430000424280004242000042418000424100004240800042400000",
            INIT_2F => 
         x"423f8000423f0000423e8000423e0000423d8000423d0000423c8000423c0000",
            INIT_2E => 
         x"423b8000423b0000423a8000423a000042398000423900004238800042380000",
            INIT_2D => 
         x"4237800042370000423680004236000042358000423500004234800042340000",
            INIT_2C => 
         x"4233800042330000423280004232000042318000423100004230800042300000",
            INIT_29 => 
         x"4227800042270000422680004226000042258000422500004224800042240000",
            INIT_28 => 
         x"4223800042230000422280004222000042218000422100004220800042200000",
            INIT_27 => 
         x"421f8000421f0000421e8000421e0000421d8000421d0000421c8000421c0000",
            INIT_26 => 
         x"421b8000421b0000421a8000421a000042198000421900004218800042180000",
            INIT_25 => 
         x"4217800042170000421680004216000042158000421500004214800042140000",
            INIT_24 => 
         x"4213800042130000421280004212000042118000421100004210800042100000",
            INIT_23 => 
         x"420f8000420f0000420e8000420e0000420d8000420d0000420c8000420c0000",
            INIT_22 => 
         x"420b8000420b0000420a8000420a000042098000420900004208800042080000",
            INIT_21 => 
         x"4207800042070000420680004206000042058000420500004204800042040000",
            INIT_20 => 
         x"4203800042030000420280004202000042018000420100004200800042000000",
            INIT_1F => 
         x"41ff000041fe000041fd000041fc000041fb000041fa000041f9000041f80000",
            INIT_1E => 
         x"41f7000041f6000041f5000041f4000041f3000041f2000041f1000041f00000",
            INIT_1D => 
         x"41ef000041ee000041ed000041ec000041eb000041ea000041e9000041e80000",
            INIT_1C => 
         x"41e7000041e6000041e5000041e4000041e3000041e2000041e1000041e00000",
            INIT_1B => 
         x"41df000041de000041dd000041dc000041db000041da000041d9000041d80000",
            INIT_1A => 
         x"41d7000041d6000041d5000041d4000041d3000041d2000041d1000041d00000",
            INIT_19 => 
         x"41cf000041ce000041cd000041cc000041cb000041ca000041c9000041c80000",
            INIT_18 => 
         x"41c7000041c6000041c5000041c4000041c3000041c2000041c1000041c00000",
            INIT_17 => 
         x"41bf000041be000041bd000041bc000041bb000041ba000041b9000041b80000",
            INIT_14 => 
         x"41a7000041a6000041a5000041a4000041a3000041a2000041a1000041a00000",
            INIT_13 => 
         x"419f0000419e0000419d0000419c0000419b0000419a00004199000041980000",
            INIT_12 => 
         x"4197000041960000419500004194000041930000419200004191000041900000",
            INIT_11 => 
         x"418f0000418e0000418d0000418c0000418b0000418a00004189000041880000",
            INIT_10 => 
         x"4187000041860000418500004184000041830000418200004181000041800000",
            INIT_0F => 
         x"417e0000417c0000417a00004178000041760000417400004172000041700000",
            INIT_0E => 
         x"416e0000416c0000416a00004168000041660000416400004162000041600000",
            INIT_0D => 
         x"415e0000415c0000415a00004158000041560000415400004152000041500000",
            INIT_0C => 
         x"414e0000414c0000414a00004148000041460000414400004142000041400000",
            INIT_09 => 
         x"411e0000411c0000411a00004118000041160000411400004112000041100000",
            INIT_08 => 
         x"410e0000410c0000410a00004108000041060000410400004102000041000000",
            INIT_07 => 
         x"40fc000040f8000040f4000040f0000040ec000040e8000040e4000040e00000",
            INIT_06 => 
         x"40dc000040d8000040d4000040d0000040cc000040c8000040c4000040c00000",
            INIT_05 => 
         x"40bc000040b8000040b4000040b0000040ac000040a8000040a4000040a00000",
            INIT_04 => 
         x"409c0000409800004094000040900000408c0000408800004084000040800000",
            INIT_03 => 
         x"4078000040700000406800004060000040580000405000004048000040400000",
            INIT_02 => 
         x"4038000040300000402800004020000040180000401000004008000040000000",
            INIT_01 => 
         x"3ff000003fe000003fd000003fc000003fb000003fa000003f9000003f800000",
            INIT_00 => 
         x"3f6000003f4000003f2000003f0000003ec000003e8000003e00000022000000")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>MEM1_ADDRA(14 downto 0),
                ADDRB(14 downto 0)=>MEM1_ADDRA(14 downto 0),
                CASCADEINA=>XLXN_68,
                CASCADEINB=>XLXN_68,
                CLKA=>i_clock,
                CLKB=>XLXN_68,
                DIA(31 downto 0)=>XLXN_72(31 downto 0),
                DIB(31 downto 0)=>XLXN_72(31 downto 0),
                DIPA(3 downto 0)=>XLXN_74(3 downto 0),
                DIPB(3 downto 0)=>XLXN_74(3 downto 0),
                ENA=>XLXN_84,
                ENB=>XLXN_68,
                REGCEA=>XLXN_68,
                REGCEB=>XLXN_68,
                SSRA=>i_reset,
                SSRB=>XLXN_68,
                WEA(3 downto 0)=>XLXN_74(3 downto 0),
                WEB(3 downto 0)=>XLXN_74(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_58(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   ROM_KTPTAT_40to7f : ramb16
   -- synopsys translate_off
   generic map( INIT_FILE => "NONE",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36,
            INIT_0B => 
         x"c2508000c2510000c2518000c2520000c2528000c2530000c2538000c2540000",
            INIT_0A => 
         x"c2548000c2550000c2558000c2560000c2568000c2570000c2578000c2580000",
            INIT_2A => 
         x"c1a90000c1aa0000c1ab0000c1ac0000c1ad0000c1ae0000c1af0000c1b00000",
            INIT_2B => 
         x"c1a10000c1a20000c1a30000c1a40000c1a50000c1a60000c1a70000c1a80000",
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            INIT_16 => 
         x"c2248000c2250000c2258000c2260000c2268000c2270000c2278000c2280000",
            INIT_15 => 
         x"c2288000c2290000c2298000c22a0000c22a8000c22b0000c22b8000c22c0000",
            INIT_3F => 
         x"be000000be800000bec00000bf000000bf200000bf400000bf600000bf800000",
            INIT_3E => 
         x"bf900000bfa00000bfb00000bfc00000bfd00000bfe00000bff00000c0000000",
            INIT_3D => 
         x"c0080000c0100000c0180000c0200000c0280000c0300000c0380000c0400000",
            INIT_3C => 
         x"c0480000c0500000c0580000c0600000c0680000c0700000c0780000c0800000",
            INIT_3B => 
         x"c0840000c0880000c08c0000c0900000c0940000c0980000c09c0000c0a00000",
            INIT_3A => 
         x"c0a40000c0a80000c0ac0000c0b00000c0b40000c0b80000c0bc0000c0c00000",
            INIT_39 => 
         x"c0c40000c0c80000c0cc0000c0d00000c0d40000c0d80000c0dc0000c0e00000",
            INIT_38 => 
         x"c0e40000c0e80000c0ec0000c0f00000c0f40000c0f80000c0fc0000c1000000",
            INIT_37 => 
         x"c1020000c1040000c1060000c1080000c10a0000c10c0000c10e0000c1100000",
            INIT_36 => 
         x"c1120000c1140000c1160000c1180000c11a0000c11c0000c11e0000c1200000",
            INIT_35 => 
         x"c1220000c1240000c1260000c1280000c12a0000c12c0000c12e0000c1300000",
            INIT_34 => 
         x"c1320000c1340000c1360000c1380000c13a0000c13c0000c13e0000c1400000",
            INIT_33 => 
         x"c1420000c1440000c1460000c1480000c14a0000c14c0000c14e0000c1500000",
            INIT_32 => 
         x"c1520000c1540000c1560000c1580000c15a0000c15c0000c15e0000c1600000",
            INIT_31 => 
         x"c1620000c1640000c1660000c1680000c16a0000c16c0000c16e0000c1700000",
            INIT_30 => 
         x"c1720000c1740000c1760000c1780000c17a0000c17c0000c17e0000c1800000",
            INIT_2F => 
         x"c1810000c1820000c1830000c1840000c1850000c1860000c1870000c1880000",
            INIT_2E => 
         x"c1890000c18a0000c18b0000c18c0000c18d0000c18e0000c18f0000c1900000",
            INIT_2D => 
         x"c1910000c1920000c1930000c1940000c1950000c1960000c1970000c1980000",
            INIT_2C => 
         x"c1990000c19a0000c19b0000c19c0000c19d0000c19e0000c19f0000c1a00000",
            INIT_29 => 
         x"c1b10000c1b20000c1b30000c1b40000c1b50000c1b60000c1b70000c1b80000",
            INIT_28 => 
         x"c1b90000c1ba0000c1bb0000c1bc0000c1bd0000c1be0000c1bf0000c1c00000",
            INIT_27 => 
         x"c1c10000c1c20000c1c30000c1c40000c1c50000c1c60000c1c70000c1c80000",
            INIT_26 => 
         x"c1c90000c1ca0000c1cb0000c1cc0000c1cd0000c1ce0000c1cf0000c1d00000",
            INIT_25 => 
         x"c1d10000c1d20000c1d30000c1d40000c1d50000c1d60000c1d70000c1d80000",
            INIT_24 => 
         x"c1d90000c1da0000c1db0000c1dc0000c1dd0000c1de0000c1df0000c1e00000",
            INIT_23 => 
         x"c1e10000c1e20000c1e30000c1e40000c1e50000c1e60000c1e70000c1e80000",
            INIT_22 => 
         x"c1e90000c1ea0000c1eb0000c1ec0000c1ed0000c1ee0000c1ef0000c1f00000",
            INIT_21 => 
         x"c1f10000c1f20000c1f30000c1f40000c1f50000c1f60000c1f70000c1f80000",
            INIT_20 => 
         x"c1f90000c1fa0000c1fb0000c1fc0000c1fd0000c1fe0000c1ff0000c2000000",
            INIT_1F => 
         x"c2008000c2010000c2018000c2020000c2028000c2030000c2038000c2040000",
            INIT_1E => 
         x"c2048000c2050000c2058000c2060000c2068000c2070000c2078000c2080000",
            INIT_1D => 
         x"c2088000c2090000c2098000c20a0000c20a8000c20b0000c20b8000c20c0000",
            INIT_1C => 
         x"c20c8000c20d0000c20d8000c20e0000c20e8000c20f0000c20f8000c2100000",
            INIT_1B => 
         x"c2108000c2110000c2118000c2120000c2128000c2130000c2138000c2140000",
            INIT_1A => 
         x"c2148000c2150000c2158000c2160000c2168000c2170000c2178000c2180000",
            INIT_19 => 
         x"c2188000c2190000c2198000c21a0000c21a8000c21b0000c21b8000c21c0000",
            INIT_18 => 
         x"c21c8000c21d0000c21d8000c21e0000c21e8000c21f0000c21f8000c2200000",
            INIT_17 => 
         x"c2208000c2210000c2218000c2220000c2228000c2230000c2238000c2240000",
            INIT_14 => 
         x"c22c8000c22d0000c22d8000c22e0000c22e8000c22f0000c22f8000c2300000",
            INIT_13 => 
         x"c2308000c2310000c2318000c2320000c2328000c2330000c2338000c2340000",
            INIT_12 => 
         x"c2348000c2350000c2358000c2360000c2368000c2370000c2378000c2380000",
            INIT_11 => 
         x"c2388000c2390000c2398000c23a0000c23a8000c23b0000c23b8000c23c0000",
            INIT_10 => 
         x"c23c8000c23d0000c23d8000c23e0000c23e8000c23f0000c23f8000c2400000",
            INIT_0F => 
         x"c2408000c2410000c2418000c2420000c2428000c2430000c2438000c2440000",
            INIT_0E => 
         x"c2448000c2450000c2458000c2460000c2468000c2470000c2478000c2480000",
            INIT_0D => 
         x"c2488000c2490000c2498000c24a0000c24a8000c24b0000c24b8000c24c0000",
            INIT_0C => 
         x"c24c8000c24d0000c24d8000c24e0000c24e8000c24f0000c24f8000c2500000",
            INIT_09 => 
         x"c2588000c2590000c2598000c25a0000c25a8000c25b0000c25b8000c25c0000",
            INIT_08 => 
         x"c25c8000c25d0000c25d8000c25e0000c25e8000c25f0000c25f8000c2600000",
            INIT_07 => 
         x"c2608000c2610000c2618000c2620000c2628000c2630000c2638000c2640000",
            INIT_06 => 
         x"c2648000c2650000c2658000c2660000c2668000c2670000c2678000c2680000",
            INIT_05 => 
         x"c2688000c2690000c2698000c26a0000c26a8000c26b0000c26b8000c26c0000",
            INIT_04 => 
         x"c26c8000c26d0000c26d8000c26e0000c26e8000c26f0000c26f8000c2700000",
            INIT_03 => 
         x"c2708000c2710000c2718000c2720000c2728000c2730000c2738000c2740000",
            INIT_02 => 
         x"c2748000c2750000c2758000c2760000c2768000c2770000c2778000c2780000",
            INIT_01 => 
         x"c2788000c2790000c2798000c27a0000c27a8000c27b0000c27b8000c27c0000",
            INIT_00 => 
         x"c27c8000c27d0000c27d8000c27e0000c27e8000c27f0000c27f8000c2800000")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>MEM2_ADDRA(14 downto 0),
                ADDRB(14 downto 0)=>MEM2_ADDRA(14 downto 0),
                CASCADEINA=>XLXN_76,
                CASCADEINB=>XLXN_76,
                CLKA=>i_clock,
                CLKB=>XLXN_76,
                DIA(31 downto 0)=>XLXN_82(31 downto 0),
                DIB(31 downto 0)=>XLXN_82(31 downto 0),
                DIPA(3 downto 0)=>XLXN_83(3 downto 0),
                DIPB(3 downto 0)=>XLXN_83(3 downto 0),
                ENA=>XLXN_85,
                ENB=>XLXN_76,
                REGCEA=>XLXN_76,
                REGCEB=>XLXN_76,
                SSRA=>i_reset,
                SSRB=>XLXN_76,
                WEA(3 downto 0)=>XLXN_83(3 downto 0),
                WEB(3 downto 0)=>XLXN_83(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_59(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_41_0 : GND
      port map (G=>MEM2_ADDRA(0));
   
   XLXI_41_1 : GND
      port map (G=>MEM2_ADDRA(1));
   
   XLXI_41_2 : GND
      port map (G=>MEM2_ADDRA(2));
   
   XLXI_41_3 : GND
      port map (G=>MEM2_ADDRA(3));
   
   XLXI_41_4 : GND
      port map (G=>MEM2_ADDRA(4));
   
   XLXI_42 : GND
      port map (G=>MEM2_ADDRA(14));
   
   XLXI_43 : GND
      port map (G=>MEM1_ADDRA(14));
   
   XLXI_44_0 : GND
      port map (G=>MEM1_ADDRA(0));
   
   XLXI_44_1 : GND
      port map (G=>MEM1_ADDRA(1));
   
   XLXI_44_2 : GND
      port map (G=>MEM1_ADDRA(2));
   
   XLXI_44_3 : GND
      port map (G=>MEM1_ADDRA(3));
   
   XLXI_44_4 : GND
      port map (G=>MEM1_ADDRA(4));
   
   XLXI_45 : GND
      port map (G=>XLXN_68);
   
   XLXI_46_0 : GND
      port map (G=>XLXN_72(0));
   
   XLXI_46_1 : GND
      port map (G=>XLXN_72(1));
   
   XLXI_46_2 : GND
      port map (G=>XLXN_72(2));
   
   XLXI_46_3 : GND
      port map (G=>XLXN_72(3));
   
   XLXI_46_4 : GND
      port map (G=>XLXN_72(4));
   
   XLXI_46_5 : GND
      port map (G=>XLXN_72(5));
   
   XLXI_46_6 : GND
      port map (G=>XLXN_72(6));
   
   XLXI_46_7 : GND
      port map (G=>XLXN_72(7));
   
   XLXI_46_8 : GND
      port map (G=>XLXN_72(8));
   
   XLXI_46_9 : GND
      port map (G=>XLXN_72(9));
   
   XLXI_46_10 : GND
      port map (G=>XLXN_72(10));
   
   XLXI_46_11 : GND
      port map (G=>XLXN_72(11));
   
   XLXI_46_12 : GND
      port map (G=>XLXN_72(12));
   
   XLXI_46_13 : GND
      port map (G=>XLXN_72(13));
   
   XLXI_46_14 : GND
      port map (G=>XLXN_72(14));
   
   XLXI_46_15 : GND
      port map (G=>XLXN_72(15));
   
   XLXI_46_16 : GND
      port map (G=>XLXN_72(16));
   
   XLXI_46_17 : GND
      port map (G=>XLXN_72(17));
   
   XLXI_46_18 : GND
      port map (G=>XLXN_72(18));
   
   XLXI_46_19 : GND
      port map (G=>XLXN_72(19));
   
   XLXI_46_20 : GND
      port map (G=>XLXN_72(20));
   
   XLXI_46_21 : GND
      port map (G=>XLXN_72(21));
   
   XLXI_46_22 : GND
      port map (G=>XLXN_72(22));
   
   XLXI_46_23 : GND
      port map (G=>XLXN_72(23));
   
   XLXI_46_24 : GND
      port map (G=>XLXN_72(24));
   
   XLXI_46_25 : GND
      port map (G=>XLXN_72(25));
   
   XLXI_46_26 : GND
      port map (G=>XLXN_72(26));
   
   XLXI_46_27 : GND
      port map (G=>XLXN_72(27));
   
   XLXI_46_28 : GND
      port map (G=>XLXN_72(28));
   
   XLXI_46_29 : GND
      port map (G=>XLXN_72(29));
   
   XLXI_46_30 : GND
      port map (G=>XLXN_72(30));
   
   XLXI_46_31 : GND
      port map (G=>XLXN_72(31));
   
   XLXI_47_0 : GND
      port map (G=>XLXN_74(0));
   
   XLXI_47_1 : GND
      port map (G=>XLXN_74(1));
   
   XLXI_47_2 : GND
      port map (G=>XLXN_74(2));
   
   XLXI_47_3 : GND
      port map (G=>XLXN_74(3));
   
   XLXI_49 : GND
      port map (G=>XLXN_76);
   
   XLXI_50_0 : GND
      port map (G=>XLXN_82(0));
   
   XLXI_50_1 : GND
      port map (G=>XLXN_82(1));
   
   XLXI_50_2 : GND
      port map (G=>XLXN_82(2));
   
   XLXI_50_3 : GND
      port map (G=>XLXN_82(3));
   
   XLXI_50_4 : GND
      port map (G=>XLXN_82(4));
   
   XLXI_50_5 : GND
      port map (G=>XLXN_82(5));
   
   XLXI_50_6 : GND
      port map (G=>XLXN_82(6));
   
   XLXI_50_7 : GND
      port map (G=>XLXN_82(7));
   
   XLXI_50_8 : GND
      port map (G=>XLXN_82(8));
   
   XLXI_50_9 : GND
      port map (G=>XLXN_82(9));
   
   XLXI_50_10 : GND
      port map (G=>XLXN_82(10));
   
   XLXI_50_11 : GND
      port map (G=>XLXN_82(11));
   
   XLXI_50_12 : GND
      port map (G=>XLXN_82(12));
   
   XLXI_50_13 : GND
      port map (G=>XLXN_82(13));
   
   XLXI_50_14 : GND
      port map (G=>XLXN_82(14));
   
   XLXI_50_15 : GND
      port map (G=>XLXN_82(15));
   
   XLXI_50_16 : GND
      port map (G=>XLXN_82(16));
   
   XLXI_50_17 : GND
      port map (G=>XLXN_82(17));
   
   XLXI_50_18 : GND
      port map (G=>XLXN_82(18));
   
   XLXI_50_19 : GND
      port map (G=>XLXN_82(19));
   
   XLXI_50_20 : GND
      port map (G=>XLXN_82(20));
   
   XLXI_50_21 : GND
      port map (G=>XLXN_82(21));
   
   XLXI_50_22 : GND
      port map (G=>XLXN_82(22));
   
   XLXI_50_23 : GND
      port map (G=>XLXN_82(23));
   
   XLXI_50_24 : GND
      port map (G=>XLXN_82(24));
   
   XLXI_50_25 : GND
      port map (G=>XLXN_82(25));
   
   XLXI_50_26 : GND
      port map (G=>XLXN_82(26));
   
   XLXI_50_27 : GND
      port map (G=>XLXN_82(27));
   
   XLXI_50_28 : GND
      port map (G=>XLXN_82(28));
   
   XLXI_50_29 : GND
      port map (G=>XLXN_82(29));
   
   XLXI_50_30 : GND
      port map (G=>XLXN_82(30));
   
   XLXI_50_31 : GND
      port map (G=>XLXN_82(31));
   
   XLXI_51_0 : GND
      port map (G=>XLXN_83(0));
   
   XLXI_51_1 : GND
      port map (G=>XLXN_83(1));
   
   XLXI_51_2 : GND
      port map (G=>XLXN_83(2));
   
   XLXI_51_3 : GND
      port map (G=>XLXN_83(3));
   
   XLXI_52 : VCC
      port map (P=>XLXN_84);
   
   XLXI_53 : VCC
      port map (P=>XLXN_85);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CalculateTa is
   port ( addfpr          : in    std_logic_vector (31 downto 0); 
          addfprdy        : in    std_logic; 
          divfpr          : in    std_logic_vector (31 downto 0); 
          divfprdy        : in    std_logic; 
          fixed2floatr    : in    std_logic_vector (31 downto 0); 
          fixed2floatrdy  : in    std_logic; 
          i_clock         : in    std_logic; 
          i_reset         : in    std_logic; 
          i_run           : in    std_logic; 
          i_Vdd           : in    std_logic_vector (31 downto 0); 
          i2c_mem_douta   : in    std_logic_vector (7 downto 0); 
          mulfpr          : in    std_logic_vector (31 downto 0); 
          mulfprdy        : in    std_logic; 
          subfpr          : in    std_logic_vector (31 downto 0); 
          subfprdy        : in    std_logic; 
          addfpa          : out   std_logic_vector (31 downto 0); 
          addfpb          : out   std_logic_vector (31 downto 0); 
          addfpce         : out   std_logic; 
          addfpond        : out   std_logic; 
          addfpsclr       : out   std_logic; 
          divfpa          : out   std_logic_vector (31 downto 0); 
          divfpb          : out   std_logic_vector (31 downto 0); 
          divfpce         : out   std_logic; 
          divfpond        : out   std_logic; 
          divfpsclr       : out   std_logic; 
          fixed2floata    : out   std_logic_vector (15 downto 0); 
          fixed2floatce   : out   std_logic; 
          fixed2floatond  : out   std_logic; 
          fixed2floatsclr : out   std_logic; 
          i2c_mem_addra   : out   std_logic_vector (11 downto 0); 
          i2c_mem_ena     : out   std_logic; 
          mulfpa          : out   std_logic_vector (31 downto 0); 
          mulfpb          : out   std_logic_vector (31 downto 0); 
          mulfpce         : out   std_logic; 
          mulfpond        : out   std_logic; 
          mulfpsclr       : out   std_logic; 
          o_rdy           : out   std_logic; 
          o_Ta            : out   std_logic_vector (31 downto 0); 
          subfpa          : out   std_logic_vector (31 downto 0); 
          subfpb          : out   std_logic_vector (31 downto 0); 
          subfpce         : out   std_logic; 
          subfpond        : out   std_logic; 
          subfpsclr       : out   std_logic);
end CalculateTa;

architecture BEHAVIORAL of CalculateTa is
   signal ee0x2410        : std_logic_vector (15 downto 0);
   signal ee0x2432        : std_logic_vector (15 downto 0);
   signal XLXN_4          : std_logic_vector (31 downto 0);
   signal XLXN_5          : std_logic_vector (31 downto 0);
   signal XLXN_6          : std_logic_vector (31 downto 0);
   component ExtractKtPTATParameter_MUSER_CalculateTa
      port ( i_clock    : in    std_logic; 
             i_reset    : in    std_logic; 
             i_ee0x2432 : in    std_logic_vector (15 downto 0); 
             o_ktptat   : out   std_logic_vector (31 downto 0));
   end component;
   
   component ExtractAlphaPTATParameter_MUSER_CalculateTa
      port ( i_ee0x2410  : in    std_logic_vector (15 downto 0); 
             i_clock     : in    std_logic; 
             i_reset     : in    std_logic; 
             o_alphaptat : out   std_logic_vector (31 downto 0));
   end component;
   
   component ExtractKvPTATParameter_MUSER_CalculateTa
      port ( i_ee0x2432 : in    std_logic_vector (15 downto 0); 
             i_clock    : in    std_logic; 
             i_reset    : in    std_logic; 
             o_kvptat   : out   std_logic_vector (31 downto 0));
   end component;
   
   component calculateTa_process_p0
      port ( i_clock                             : in    std_logic; 
             i_reset                             : in    std_logic; 
             i_run                               : in    std_logic; 
             fixed2floatrdy                      : in    std_logic; 
             divfprdy                            : in    std_logic; 
             mulfprdy                            : in    std_logic; 
             addfprdy                            : in    std_logic; 
             subfprdy                            : in    std_logic; 
             ExtractAlphaPTATParameter_alphaptat : in    std_logic_vector (31 
            downto 0); 
             ExtractKvPTATParameter_kvptat       : in    std_logic_vector (31 
            downto 0); 
             ExtractKtPTATParameter_ktptat       : in    std_logic_vector (31 
            downto 0); 
             i2c_mem_douta                       : in    std_logic_vector (7 
            downto 0); 
             i_Vdd                               : in    std_logic_vector (31 
            downto 0); 
             fixed2floatr                        : in    std_logic_vector (31 
            downto 0); 
             divfpr                              : in    std_logic_vector (31 
            downto 0); 
             mulfpr                              : in    std_logic_vector (31 
            downto 0); 
             addfpr                              : in    std_logic_vector (31 
            downto 0); 
             subfpr                              : in    std_logic_vector (31 
            downto 0); 
             i2c_mem_ena                         : out   std_logic; 
             o_rdy                               : out   std_logic; 
             fixed2floatond                      : out   std_logic; 
             fixed2floatce                       : out   std_logic; 
             fixed2floatsclr                     : out   std_logic; 
             divfpond                            : out   std_logic; 
             divfpce                             : out   std_logic; 
             divfpsclr                           : out   std_logic; 
             mulfpond                            : out   std_logic; 
             mulfpce                             : out   std_logic; 
             mulfpsclr                           : out   std_logic; 
             addfpond                            : out   std_logic; 
             addfpce                             : out   std_logic; 
             addfpsclr                           : out   std_logic; 
             subfpond                            : out   std_logic; 
             subfpce                             : out   std_logic; 
             subfpsclr                           : out   std_logic; 
             o_ee2410                            : out   std_logic_vector (15 
            downto 0); 
             o_ee2432                            : out   std_logic_vector (15 
            downto 0); 
             i2c_mem_addra                       : out   std_logic_vector (11 
            downto 0); 
             o_Ta                                : out   std_logic_vector (31 
            downto 0); 
             fixed2floata                        : out   std_logic_vector (15 
            downto 0); 
             divfpa                              : out   std_logic_vector (31 
            downto 0); 
             divfpb                              : out   std_logic_vector (31 
            downto 0); 
             mulfpa                              : out   std_logic_vector (31 
            downto 0); 
             mulfpb                              : out   std_logic_vector (31 
            downto 0); 
             addfpa                              : out   std_logic_vector (31 
            downto 0); 
             addfpb                              : out   std_logic_vector (31 
            downto 0); 
             subfpa                              : out   std_logic_vector (31 
            downto 0); 
             subfpb                              : out   std_logic_vector (31 
            downto 0));
   end component;
   
begin
   CalculateTa_etractktptatparameter : ExtractKtPTATParameter_MUSER_CalculateTa
      port map (i_clock=>i_clock,
                i_ee0x2432(15 downto 0)=>ee0x2432(15 downto 0),
                i_reset=>i_reset,
                o_ktptat(31 downto 0)=>XLXN_4(31 downto 0));
   
   CalculateTa_extractalphaptatparameter : 
         ExtractAlphaPTATParameter_MUSER_CalculateTa
      port map (i_clock=>i_clock,
                i_ee0x2410(15 downto 0)=>ee0x2410(15 downto 0),
                i_reset=>i_reset,
                o_alphaptat(31 downto 0)=>XLXN_6(31 downto 0));
   
   CalculateTa_extractkvptatparameter : ExtractKvPTATParameter_MUSER_CalculateTa
      port map (i_clock=>i_clock,
                i_ee0x2432(15 downto 0)=>ee0x2432(15 downto 0),
                i_reset=>i_reset,
                o_kvptat(31 downto 0)=>XLXN_5(31 downto 0));
   
   CalculateTa_process_p0_inst : calculateTa_process_p0
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                ExtractAlphaPTATParameter_alphaptat(31 downto 0)=>XLXN_6(31 
            downto 0),
                ExtractKtPTATParameter_ktptat(31 downto 0)=>XLXN_4(31 downto 0),
                ExtractKvPTATParameter_kvptat(31 downto 0)=>XLXN_5(31 downto 0),
                fixed2floatr(31 downto 0)=>fixed2floatr(31 downto 0),
                fixed2floatrdy=>fixed2floatrdy,
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>i_run,
                i_Vdd(31 downto 0)=>i_Vdd(31 downto 0),
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                subfpr(31 downto 0)=>subfpr(31 downto 0),
                subfprdy=>subfprdy,
                addfpa(31 downto 0)=>addfpa(31 downto 0),
                addfpb(31 downto 0)=>addfpb(31 downto 0),
                addfpce=>addfpce,
                addfpond=>addfpond,
                addfpsclr=>addfpsclr,
                divfpa(31 downto 0)=>divfpa(31 downto 0),
                divfpb(31 downto 0)=>divfpb(31 downto 0),
                divfpce=>divfpce,
                divfpond=>divfpond,
                divfpsclr=>divfpsclr,
                fixed2floata(15 downto 0)=>fixed2floata(15 downto 0),
                fixed2floatce=>fixed2floatce,
                fixed2floatond=>fixed2floatond,
                fixed2floatsclr=>fixed2floatsclr,
                i2c_mem_addra(11 downto 0)=>i2c_mem_addra(11 downto 0),
                i2c_mem_ena=>i2c_mem_ena,
                mulfpa(31 downto 0)=>mulfpa(31 downto 0),
                mulfpb(31 downto 0)=>mulfpb(31 downto 0),
                mulfpce=>mulfpce,
                mulfpond=>mulfpond,
                mulfpsclr=>mulfpsclr,
                o_ee2410(15 downto 0)=>ee0x2410(15 downto 0),
                o_ee2432(15 downto 0)=>ee0x2432(15 downto 0),
                o_rdy=>o_rdy,
                o_Ta(31 downto 0)=>o_Ta(31 downto 0),
                subfpa(31 downto 0)=>subfpa(31 downto 0),
                subfpb(31 downto 0)=>subfpb(31 downto 0),
                subfpce=>subfpce,
                subfpond=>subfpond,
                subfpsclr=>subfpsclr);
   
end BEHAVIORAL;


