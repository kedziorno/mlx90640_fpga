--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CalculatePixOSCpSp.vhf
-- /___/   /\     Timestamp : 09/16/2023 16:10:31
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/CalculatePixOSCpSp.vhf -w /home/user/workspace/mlx90640_fpga/CalculatePixOSCpSp.sch
--Design Name: CalculatePixOSCpSp
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

entity M2_1_MXILINX_CalculatePixOSCpSp is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_CalculatePixOSCpSp;

architecture BEHAVIORAL of M2_1_MXILINX_CalculatePixOSCpSp is
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

entity rom_signed8bit_MUSER_CalculatePixOSCpSp is
   port ( i_clock : in    std_logic; 
          i_reset : in    std_logic; 
          i_value : in    std_logic_vector (7 downto 0); 
          o_value : out   std_logic_vector (31 downto 0));
end rom_signed8bit_MUSER_CalculatePixOSCpSp;

architecture BEHAVIORAL of rom_signed8bit_MUSER_CalculatePixOSCpSp is
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
   signal XLXN_2                                   : std_logic_vector (14 
         downto 0);
   signal XLXN_13                                  : std_logic;
   signal ROM_mem_signed8bit_ADDRB_openSignal      : std_logic_vector (14 
         downto 0);
   signal ROM_mem_signed8bit_CASCADEINA_openSignal : std_logic;
   signal ROM_mem_signed8bit_CASCADEINB_openSignal : std_logic;
   signal ROM_mem_signed8bit_CLKB_openSignal       : std_logic;
   signal ROM_mem_signed8bit_DIA_openSignal        : std_logic_vector (31 
         downto 0);
   signal ROM_mem_signed8bit_DIB_openSignal        : std_logic_vector (31 
         downto 0);
   signal ROM_mem_signed8bit_DIPA_openSignal       : std_logic_vector (3 downto 
         0);
   signal ROM_mem_signed8bit_DIPB_openSignal       : std_logic_vector (3 downto 
         0);
   signal ROM_mem_signed8bit_ENB_openSignal        : std_logic;
   signal ROM_mem_signed8bit_REGCEA_openSignal     : std_logic;
   signal ROM_mem_signed8bit_REGCEB_openSignal     : std_logic;
   signal ROM_mem_signed8bit_SSRB_openSignal       : std_logic;
   signal ROM_mem_signed8bit_WEA_openSignal        : std_logic_vector (3 downto 
         0);
   signal ROM_mem_signed8bit_WEB_openSignal        : std_logic_vector (3 downto 
         0);
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
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute WRITE_WIDTH_B of ROM_mem_signed8bit : label is "36";
   attribute WRITE_WIDTH_A of ROM_mem_signed8bit : label is "36";
   attribute WRITE_MODE_B of ROM_mem_signed8bit : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_mem_signed8bit : label is "READ_FIRST";
   attribute READ_WIDTH_B of ROM_mem_signed8bit : label is "36";
   attribute READ_WIDTH_A of ROM_mem_signed8bit : label is "36";
   attribute INIT_1F of ROM_mem_signed8bit : label is 
         "bf800000c0000000c0400000c0800000c0a00000c0c00000c0e00000c1000000";
   attribute INIT_1E of ROM_mem_signed8bit : label is 
         "c1100000c1200000c1300000c1400000c1500000c1600000c1700000c1800000";
   attribute INIT_1D of ROM_mem_signed8bit : label is 
         "c1880000c1900000c1980000c1a00000c1a80000c1b00000c1b80000c1c00000";
   attribute INIT_1C of ROM_mem_signed8bit : label is 
         "c1c80000c1d00000c1d80000c1e00000c1e80000c1f00000c1f80000c2000000";
   attribute INIT_1B of ROM_mem_signed8bit : label is 
         "c2040000c2080000c20c0000c2100000c2140000c2180000c21c0000c2200000";
   attribute INIT_1A of ROM_mem_signed8bit : label is 
         "c2240000c2280000c22c0000c2300000c2340000c2380000c23c0000c2400000";
   attribute INIT_19 of ROM_mem_signed8bit : label is 
         "c2440000c2480000c24c0000c2500000c2540000c2580000c25c0000c2600000";
   attribute INIT_18 of ROM_mem_signed8bit : label is 
         "c2640000c2680000c26c0000c2700000c2740000c2780000c27c0000c2800000";
   attribute INIT_17 of ROM_mem_signed8bit : label is 
         "c2820000c2840000c2860000c2880000c28a0000c28c0000c28e0000c2900000";
   attribute INIT_16 of ROM_mem_signed8bit : label is 
         "c2920000c2940000c2960000c2980000c29a0000c29c0000c29e0000c2a00000";
   attribute INIT_15 of ROM_mem_signed8bit : label is 
         "c2a20000c2a40000c2a60000c2a80000c2aa0000c2ac0000c2ae0000c2b00000";
   attribute INIT_14 of ROM_mem_signed8bit : label is 
         "c2b20000c2b40000c2b60000c2b80000c2ba0000c2bc0000c2be0000c2c00000";
   attribute INIT_13 of ROM_mem_signed8bit : label is 
         "c2c20000c2c40000c2c60000c2c80000c2ca0000c2cc0000c2ce0000c2d00000";
   attribute INIT_12 of ROM_mem_signed8bit : label is 
         "c2d20000c2d40000c2d60000c2d80000c2da0000c2dc0000c2de0000c2e00000";
   attribute INIT_11 of ROM_mem_signed8bit : label is 
         "c2e20000c2e40000c2e60000c2e80000c2ea0000c2ec0000c2ee0000c2f00000";
   attribute INIT_10 of ROM_mem_signed8bit : label is 
         "c2f20000c2f40000c2f60000c2f80000c2fa0000c2fc0000c2fe0000c3000000";
   attribute INIT_0F of ROM_mem_signed8bit : label is 
         "42fe000042fc000042fa000042f8000042f6000042f4000042f2000042f00000";
   attribute INIT_0E of ROM_mem_signed8bit : label is 
         "42ee000042ec000042ea000042e8000042e6000042e4000042e2000042e00000";
   attribute INIT_0D of ROM_mem_signed8bit : label is 
         "42de000042dc000042da000042d8000042d6000042d4000042d2000042d00000";
   attribute INIT_0C of ROM_mem_signed8bit : label is 
         "42ce000042cc000042ca000042c8000042c6000042c4000042c2000042c00000";
   attribute INIT_0B of ROM_mem_signed8bit : label is 
         "42be000042bc000042ba000042b8000042b6000042b4000042b2000042b00000";
   attribute INIT_0A of ROM_mem_signed8bit : label is 
         "42ae000042ac000042aa000042a8000042a6000042a4000042a2000042a00000";
   attribute INIT_09 of ROM_mem_signed8bit : label is 
         "429e0000429c0000429a00004298000042960000429400004292000042900000";
   attribute INIT_08 of ROM_mem_signed8bit : label is 
         "428e0000428c0000428a00004288000042860000428400004282000042800000";
   attribute INIT_07 of ROM_mem_signed8bit : label is 
         "427c0000427800004274000042700000426c0000426800004264000042600000";
   attribute INIT_06 of ROM_mem_signed8bit : label is 
         "425c0000425800004254000042500000424c0000424800004244000042400000";
   attribute INIT_05 of ROM_mem_signed8bit : label is 
         "423c0000423800004234000042300000422c0000422800004224000042200000";
   attribute INIT_04 of ROM_mem_signed8bit : label is 
         "421c0000421800004214000042100000420c0000420800004204000042000000";
   attribute INIT_03 of ROM_mem_signed8bit : label is 
         "41f8000041f0000041e8000041e0000041d8000041d0000041c8000041c00000";
   attribute INIT_02 of ROM_mem_signed8bit : label is 
         "41b8000041b0000041a8000041a0000041980000419000004188000041800000";
   attribute INIT_01 of ROM_mem_signed8bit : label is 
         "4170000041600000415000004140000041300000412000004110000041000000";
   attribute INIT_00 of ROM_mem_signed8bit : label is 
         "40e0000040c0000040a000004080000040400000400000003f80000022000000";
begin
   ROM_mem_signed8bit : ramb16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36,
            INIT_1F => 
         x"bf800000c0000000c0400000c0800000c0a00000c0c00000c0e00000c1000000",
            INIT_1E => 
         x"c1100000c1200000c1300000c1400000c1500000c1600000c1700000c1800000",
            INIT_1D => 
         x"c1880000c1900000c1980000c1a00000c1a80000c1b00000c1b80000c1c00000",
            INIT_1C => 
         x"c1c80000c1d00000c1d80000c1e00000c1e80000c1f00000c1f80000c2000000",
            INIT_1B => 
         x"c2040000c2080000c20c0000c2100000c2140000c2180000c21c0000c2200000",
            INIT_1A => 
         x"c2240000c2280000c22c0000c2300000c2340000c2380000c23c0000c2400000",
            INIT_19 => 
         x"c2440000c2480000c24c0000c2500000c2540000c2580000c25c0000c2600000",
            INIT_18 => 
         x"c2640000c2680000c26c0000c2700000c2740000c2780000c27c0000c2800000",
            INIT_17 => 
         x"c2820000c2840000c2860000c2880000c28a0000c28c0000c28e0000c2900000",
            INIT_16 => 
         x"c2920000c2940000c2960000c2980000c29a0000c29c0000c29e0000c2a00000",
            INIT_15 => 
         x"c2a20000c2a40000c2a60000c2a80000c2aa0000c2ac0000c2ae0000c2b00000",
            INIT_14 => 
         x"c2b20000c2b40000c2b60000c2b80000c2ba0000c2bc0000c2be0000c2c00000",
            INIT_13 => 
         x"c2c20000c2c40000c2c60000c2c80000c2ca0000c2cc0000c2ce0000c2d00000",
            INIT_12 => 
         x"c2d20000c2d40000c2d60000c2d80000c2da0000c2dc0000c2de0000c2e00000",
            INIT_11 => 
         x"c2e20000c2e40000c2e60000c2e80000c2ea0000c2ec0000c2ee0000c2f00000",
            INIT_10 => 
         x"c2f20000c2f40000c2f60000c2f80000c2fa0000c2fc0000c2fe0000c3000000",
            INIT_0F => 
         x"42fe000042fc000042fa000042f8000042f6000042f4000042f2000042f00000",
            INIT_0E => 
         x"42ee000042ec000042ea000042e8000042e6000042e4000042e2000042e00000",
            INIT_0D => 
         x"42de000042dc000042da000042d8000042d6000042d4000042d2000042d00000",
            INIT_0C => 
         x"42ce000042cc000042ca000042c8000042c6000042c4000042c2000042c00000",
            INIT_0B => 
         x"42be000042bc000042ba000042b8000042b6000042b4000042b2000042b00000",
            INIT_0A => 
         x"42ae000042ac000042aa000042a8000042a6000042a4000042a2000042a00000",
            INIT_09 => 
         x"429e0000429c0000429a00004298000042960000429400004292000042900000",
            INIT_08 => 
         x"428e0000428c0000428a00004288000042860000428400004282000042800000",
            INIT_07 => 
         x"427c0000427800004274000042700000426c0000426800004264000042600000",
            INIT_06 => 
         x"425c0000425800004254000042500000424c0000424800004244000042400000",
            INIT_05 => 
         x"423c0000423800004234000042300000422c0000422800004224000042200000",
            INIT_04 => 
         x"421c0000421800004214000042100000420c0000420800004204000042000000",
            INIT_03 => 
         x"41f8000041f0000041e8000041e0000041d8000041d0000041c8000041c00000",
            INIT_02 => 
         x"41b8000041b0000041a8000041a0000041980000419000004188000041800000",
            INIT_01 => 
         x"4170000041600000415000004140000041300000412000004110000041000000",
            INIT_00 => 
         x"40e0000040c0000040a000004080000040400000400000003f80000022000000")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_2(14 downto 0),
                ADDRB(14 downto 0)=>ROM_mem_signed8bit_ADDRB_openSignal(14 
            downto 0),
                CASCADEINA=>ROM_mem_signed8bit_CASCADEINA_openSignal,
                CASCADEINB=>ROM_mem_signed8bit_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>ROM_mem_signed8bit_CLKB_openSignal,
                DIA(31 downto 0)=>ROM_mem_signed8bit_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>ROM_mem_signed8bit_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>ROM_mem_signed8bit_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>ROM_mem_signed8bit_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_13,
                ENB=>ROM_mem_signed8bit_ENB_openSignal,
                REGCEA=>ROM_mem_signed8bit_REGCEA_openSignal,
                REGCEB=>ROM_mem_signed8bit_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>ROM_mem_signed8bit_SSRB_openSignal,
                WEA(3 downto 0)=>ROM_mem_signed8bit_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>ROM_mem_signed8bit_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>o_value(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_3_0 : GND
      port map (G=>XLXN_2(13));
   
   XLXI_3_1 : GND
      port map (G=>XLXN_2(14));
   
   XLXI_4_0 : GND
      port map (G=>XLXN_2(0));
   
   XLXI_4_1 : GND
      port map (G=>XLXN_2(1));
   
   XLXI_4_2 : GND
      port map (G=>XLXN_2(2));
   
   XLXI_4_3 : GND
      port map (G=>XLXN_2(3));
   
   XLXI_4_4 : GND
      port map (G=>XLXN_2(4));
   
   XLXI_5_0 : BUF
      port map (I=>i_value(0),
                O=>XLXN_2(5));
   
   XLXI_5_1 : BUF
      port map (I=>i_value(1),
                O=>XLXN_2(6));
   
   XLXI_5_2 : BUF
      port map (I=>i_value(2),
                O=>XLXN_2(7));
   
   XLXI_5_3 : BUF
      port map (I=>i_value(3),
                O=>XLXN_2(8));
   
   XLXI_5_4 : BUF
      port map (I=>i_value(4),
                O=>XLXN_2(9));
   
   XLXI_5_5 : BUF
      port map (I=>i_value(5),
                O=>XLXN_2(10));
   
   XLXI_5_6 : BUF
      port map (I=>i_value(6),
                O=>XLXN_2(11));
   
   XLXI_5_7 : BUF
      port map (I=>i_value(7),
                O=>XLXN_2(12));
   
   XLXI_6 : VCC
      port map (P=>XLXN_13);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity rom_signed10bit_MUSER_CalculatePixOSCpSp is
   port ( address : in    std_logic_vector (9 downto 0); 
          i_clock : in    std_logic; 
          i_reset : in    std_logic; 
          o_data  : out   std_logic_vector (31 downto 0));
end rom_signed10bit_MUSER_CalculatePixOSCpSp;

architecture BEHAVIORAL of rom_signed10bit_MUSER_CalculatePixOSCpSp is
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
   attribute BOX_TYPE            : string ;
   signal XLXN_3                                           : std_logic_vector 
         (14 downto 0);
   signal XLXN_4                                           : std_logic_vector 
         (14 downto 0);
   signal XLXN_24                                          : std_logic;
   signal XLXN_32                                          : std_logic_vector 
         (31 downto 0);
   signal XLXN_33                                          : std_logic_vector 
         (31 downto 0);
   signal XLXN_38                                          : std_logic;
   signal rom_signed_10bit_mem_half1_ADDRB_openSignal      : std_logic_vector 
         (14 downto 0);
   signal rom_signed_10bit_mem_half1_CASCADEINA_openSignal : std_logic;
   signal rom_signed_10bit_mem_half1_CASCADEINB_openSignal : std_logic;
   signal rom_signed_10bit_mem_half1_CLKB_openSignal       : std_logic;
   signal rom_signed_10bit_mem_half1_DIA_openSignal        : std_logic_vector 
         (31 downto 0);
   signal rom_signed_10bit_mem_half1_DIB_openSignal        : std_logic_vector 
         (31 downto 0);
   signal rom_signed_10bit_mem_half1_DIPA_openSignal       : std_logic_vector 
         (3 downto 0);
   signal rom_signed_10bit_mem_half1_DIPB_openSignal       : std_logic_vector 
         (3 downto 0);
   signal rom_signed_10bit_mem_half1_REGCEA_openSignal     : std_logic;
   signal rom_signed_10bit_mem_half1_REGCEB_openSignal     : std_logic;
   signal rom_signed_10bit_mem_half1_SSRB_openSignal       : std_logic;
   signal rom_signed_10bit_mem_half1_WEA_openSignal        : std_logic_vector 
         (3 downto 0);
   signal rom_signed_10bit_mem_half1_WEB_openSignal        : std_logic_vector 
         (3 downto 0);
   signal rom_signed_10bit_mem_half2_ADDRB_openSignal      : std_logic_vector 
         (14 downto 0);
   signal rom_signed_10bit_mem_half2_CASCADEINA_openSignal : std_logic;
   signal rom_signed_10bit_mem_half2_CASCADEINB_openSignal : std_logic;
   signal rom_signed_10bit_mem_half2_CLKB_openSignal       : std_logic;
   signal rom_signed_10bit_mem_half2_DIA_openSignal        : std_logic_vector 
         (31 downto 0);
   signal rom_signed_10bit_mem_half2_DIB_openSignal        : std_logic_vector 
         (31 downto 0);
   signal rom_signed_10bit_mem_half2_DIPA_openSignal       : std_logic_vector 
         (3 downto 0);
   signal rom_signed_10bit_mem_half2_DIPB_openSignal       : std_logic_vector 
         (3 downto 0);
   signal rom_signed_10bit_mem_half2_ENB_openSignal        : std_logic;
   signal rom_signed_10bit_mem_half2_REGCEA_openSignal     : std_logic;
   signal rom_signed_10bit_mem_half2_REGCEB_openSignal     : std_logic;
   signal rom_signed_10bit_mem_half2_SSRB_openSignal       : std_logic;
   signal rom_signed_10bit_mem_half2_WEA_openSignal        : std_logic_vector 
         (3 downto 0);
   signal rom_signed_10bit_mem_half2_WEB_openSignal        : std_logic_vector 
         (3 downto 0);
   component M2_1_MXILINX_CalculatePixOSCpSp
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
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of MUX_rom_signed_10bit_0 : label is 
         "MUX_rom_signed_10bit_0_2120";
   attribute HU_SET of MUX_rom_signed_10bit_1 : label is 
         "MUX_rom_signed_10bit_1_2119";
   attribute HU_SET of MUX_rom_signed_10bit_2 : label is 
         "MUX_rom_signed_10bit_2_2118";
   attribute HU_SET of MUX_rom_signed_10bit_3 : label is 
         "MUX_rom_signed_10bit_3_2117";
   attribute HU_SET of MUX_rom_signed_10bit_4 : label is 
         "MUX_rom_signed_10bit_4_2116";
   attribute HU_SET of MUX_rom_signed_10bit_5 : label is 
         "MUX_rom_signed_10bit_5_2115";
   attribute HU_SET of MUX_rom_signed_10bit_6 : label is 
         "MUX_rom_signed_10bit_6_2114";
   attribute HU_SET of MUX_rom_signed_10bit_7 : label is 
         "MUX_rom_signed_10bit_7_2113";
   attribute HU_SET of MUX_rom_signed_10bit_8 : label is 
         "MUX_rom_signed_10bit_8_2112";
   attribute HU_SET of MUX_rom_signed_10bit_9 : label is 
         "MUX_rom_signed_10bit_9_2111";
   attribute HU_SET of MUX_rom_signed_10bit_10 : label is 
         "MUX_rom_signed_10bit_10_2110";
   attribute HU_SET of MUX_rom_signed_10bit_11 : label is 
         "MUX_rom_signed_10bit_11_2109";
   attribute HU_SET of MUX_rom_signed_10bit_12 : label is 
         "MUX_rom_signed_10bit_12_2108";
   attribute HU_SET of MUX_rom_signed_10bit_13 : label is 
         "MUX_rom_signed_10bit_13_2107";
   attribute HU_SET of MUX_rom_signed_10bit_14 : label is 
         "MUX_rom_signed_10bit_14_2106";
   attribute HU_SET of MUX_rom_signed_10bit_15 : label is 
         "MUX_rom_signed_10bit_15_2105";
   attribute HU_SET of MUX_rom_signed_10bit_16 : label is 
         "MUX_rom_signed_10bit_16_2104";
   attribute HU_SET of MUX_rom_signed_10bit_17 : label is 
         "MUX_rom_signed_10bit_17_2103";
   attribute HU_SET of MUX_rom_signed_10bit_18 : label is 
         "MUX_rom_signed_10bit_18_2102";
   attribute HU_SET of MUX_rom_signed_10bit_19 : label is 
         "MUX_rom_signed_10bit_19_2101";
   attribute HU_SET of MUX_rom_signed_10bit_20 : label is 
         "MUX_rom_signed_10bit_20_2100";
   attribute HU_SET of MUX_rom_signed_10bit_21 : label is 
         "MUX_rom_signed_10bit_21_2099";
   attribute HU_SET of MUX_rom_signed_10bit_22 : label is 
         "MUX_rom_signed_10bit_22_2098";
   attribute HU_SET of MUX_rom_signed_10bit_23 : label is 
         "MUX_rom_signed_10bit_23_2097";
   attribute HU_SET of MUX_rom_signed_10bit_24 : label is 
         "MUX_rom_signed_10bit_24_2096";
   attribute HU_SET of MUX_rom_signed_10bit_25 : label is 
         "MUX_rom_signed_10bit_25_2095";
   attribute HU_SET of MUX_rom_signed_10bit_26 : label is 
         "MUX_rom_signed_10bit_26_2094";
   attribute HU_SET of MUX_rom_signed_10bit_27 : label is 
         "MUX_rom_signed_10bit_27_2093";
   attribute HU_SET of MUX_rom_signed_10bit_28 : label is 
         "MUX_rom_signed_10bit_28_2092";
   attribute HU_SET of MUX_rom_signed_10bit_29 : label is 
         "MUX_rom_signed_10bit_29_2091";
   attribute HU_SET of MUX_rom_signed_10bit_30 : label is 
         "MUX_rom_signed_10bit_30_2090";
   attribute HU_SET of MUX_rom_signed_10bit_31 : label is 
         "MUX_rom_signed_10bit_31_2089";
   attribute WRITE_WIDTH_B of rom_signed_10bit_mem_half1 : label is "36";
   attribute WRITE_WIDTH_A of rom_signed_10bit_mem_half1 : label is "36";
   attribute WRITE_MODE_B of rom_signed_10bit_mem_half1 : label is "READ_FIRST";
   attribute WRITE_MODE_A of rom_signed_10bit_mem_half1 : label is "READ_FIRST";
   attribute READ_WIDTH_B of rom_signed_10bit_mem_half1 : label is "36";
   attribute READ_WIDTH_A of rom_signed_10bit_mem_half1 : label is "36";
   attribute INIT_3F of rom_signed_10bit_mem_half1 : label is 
         "43ff800043ff000043fe800043fe000043fd800043fd000043fc800043fc0000";
   attribute INIT_3E of rom_signed_10bit_mem_half1 : label is 
         "43fb800043fb000043fa800043fa000043f9800043f9000043f8800043f80000";
   attribute INIT_3D of rom_signed_10bit_mem_half1 : label is 
         "43f7800043f7000043f6800043f6000043f5800043f5000043f4800043f40000";
   attribute INIT_3C of rom_signed_10bit_mem_half1 : label is 
         "43f3800043f3000043f2800043f2000043f1800043f1000043f0800043f00000";
   attribute INIT_3B of rom_signed_10bit_mem_half1 : label is 
         "43ef800043ef000043ee800043ee000043ed800043ed000043ec800043ec0000";
   attribute INIT_3A of rom_signed_10bit_mem_half1 : label is 
         "43eb800043eb000043ea800043ea000043e9800043e9000043e8800043e80000";
   attribute INIT_39 of rom_signed_10bit_mem_half1 : label is 
         "43e7800043e7000043e6800043e6000043e5800043e5000043e4800043e40000";
   attribute INIT_38 of rom_signed_10bit_mem_half1 : label is 
         "43e3800043e3000043e2800043e2000043e1800043e1000043e0800043e00000";
   attribute INIT_37 of rom_signed_10bit_mem_half1 : label is 
         "43df800043df000043de800043de000043dd800043dd000043dc800043dc0000";
   attribute INIT_36 of rom_signed_10bit_mem_half1 : label is 
         "43db800043db000043da800043da000043d9800043d9000043d8800043d80000";
   attribute INIT_35 of rom_signed_10bit_mem_half1 : label is 
         "43d7800043d7000043d6800043d6000043d5800043d5000043d4800043d40000";
   attribute INIT_34 of rom_signed_10bit_mem_half1 : label is 
         "43d3800043d3000043d2800043d2000043d1800043d1000043d0800043d00000";
   attribute INIT_33 of rom_signed_10bit_mem_half1 : label is 
         "43cf800043cf000043ce800043ce000043cd800043cd000043cc800043cc0000";
   attribute INIT_32 of rom_signed_10bit_mem_half1 : label is 
         "43cb800043cb000043ca800043ca000043c9800043c9000043c8800043c80000";
   attribute INIT_31 of rom_signed_10bit_mem_half1 : label is 
         "43c7800043c7000043c6800043c6000043c5800043c5000043c4800043c40000";
   attribute INIT_30 of rom_signed_10bit_mem_half1 : label is 
         "43c3800043c3000043c2800043c2000043c1800043c1000043c0800043c00000";
   attribute INIT_2F of rom_signed_10bit_mem_half1 : label is 
         "43bf800043bf000043be800043be000043bd800043bd000043bc800043bc0000";
   attribute INIT_2E of rom_signed_10bit_mem_half1 : label is 
         "43bb800043bb000043ba800043ba000043b9800043b9000043b8800043b80000";
   attribute INIT_2D of rom_signed_10bit_mem_half1 : label is 
         "43b7800043b7000043b6800043b6000043b5800043b5000043b4800043b40000";
   attribute INIT_2C of rom_signed_10bit_mem_half1 : label is 
         "43b3800043b3000043b2800043b2000043b1800043b1000043b0800043b00000";
   attribute INIT_2B of rom_signed_10bit_mem_half1 : label is 
         "43af800043af000043ae800043ae000043ad800043ad000043ac800043ac0000";
   attribute INIT_2A of rom_signed_10bit_mem_half1 : label is 
         "43ab800043ab000043aa800043aa000043a9800043a9000043a8800043a80000";
   attribute INIT_29 of rom_signed_10bit_mem_half1 : label is 
         "43a7800043a7000043a6800043a6000043a5800043a5000043a4800043a40000";
   attribute INIT_28 of rom_signed_10bit_mem_half1 : label is 
         "43a3800043a3000043a2800043a2000043a1800043a1000043a0800043a00000";
   attribute INIT_27 of rom_signed_10bit_mem_half1 : label is 
         "439f8000439f0000439e8000439e0000439d8000439d0000439c8000439c0000";
   attribute INIT_26 of rom_signed_10bit_mem_half1 : label is 
         "439b8000439b0000439a8000439a000043998000439900004398800043980000";
   attribute INIT_25 of rom_signed_10bit_mem_half1 : label is 
         "4397800043970000439680004396000043958000439500004394800043940000";
   attribute INIT_24 of rom_signed_10bit_mem_half1 : label is 
         "4393800043930000439280004392000043918000439100004390800043900000";
   attribute INIT_23 of rom_signed_10bit_mem_half1 : label is 
         "438f8000438f0000438e8000438e0000438d8000438d0000438c8000438c0000";
   attribute INIT_22 of rom_signed_10bit_mem_half1 : label is 
         "438b8000438b0000438a8000438a000043898000438900004388800043880000";
   attribute INIT_21 of rom_signed_10bit_mem_half1 : label is 
         "4387800043870000438680004386000043858000438500004384800043840000";
   attribute INIT_20 of rom_signed_10bit_mem_half1 : label is 
         "4383800043830000438280004382000043818000438100004380800043800000";
   attribute INIT_1F of rom_signed_10bit_mem_half1 : label is 
         "437f0000437e0000437d0000437c0000437b0000437a00004379000043780000";
   attribute INIT_1E of rom_signed_10bit_mem_half1 : label is 
         "4377000043760000437500004374000043730000437200004371000043700000";
   attribute INIT_1D of rom_signed_10bit_mem_half1 : label is 
         "436f0000436e0000436d0000436c0000436b0000436a00004369000043680000";
   attribute INIT_1C of rom_signed_10bit_mem_half1 : label is 
         "4367000043660000436500004364000043630000436200004361000043600000";
   attribute INIT_1B of rom_signed_10bit_mem_half1 : label is 
         "435f0000435e0000435d0000435c0000435b0000435a00004359000043580000";
   attribute INIT_1A of rom_signed_10bit_mem_half1 : label is 
         "4357000043560000435500004354000043530000435200004351000043500000";
   attribute INIT_19 of rom_signed_10bit_mem_half1 : label is 
         "434f0000434e0000434d0000434c0000434b0000434a00004349000043480000";
   attribute INIT_18 of rom_signed_10bit_mem_half1 : label is 
         "4347000043460000434500004344000043430000434200004341000043400000";
   attribute INIT_17 of rom_signed_10bit_mem_half1 : label is 
         "433f0000433e0000433d0000433c0000433b0000433a00004339000043380000";
   attribute INIT_16 of rom_signed_10bit_mem_half1 : label is 
         "4337000043360000433500004334000043330000433200004331000043300000";
   attribute INIT_15 of rom_signed_10bit_mem_half1 : label is 
         "432f0000432e0000432d0000432c0000432b0000432a00004329000043280000";
   attribute INIT_14 of rom_signed_10bit_mem_half1 : label is 
         "4327000043260000432500004324000043230000432200004321000043200000";
   attribute INIT_13 of rom_signed_10bit_mem_half1 : label is 
         "431f0000431e0000431d0000431c0000431b0000431a00004319000043180000";
   attribute INIT_12 of rom_signed_10bit_mem_half1 : label is 
         "4317000043160000431500004314000043130000431200004311000043100000";
   attribute INIT_11 of rom_signed_10bit_mem_half1 : label is 
         "430f0000430e0000430d0000430c0000430b0000430a00004309000043080000";
   attribute INIT_10 of rom_signed_10bit_mem_half1 : label is 
         "4307000043060000430500004304000043030000430200004301000043000000";
   attribute INIT_0F of rom_signed_10bit_mem_half1 : label is 
         "42fe000042fc000042fa000042f8000042f6000042f4000042f2000042f00000";
   attribute INIT_0E of rom_signed_10bit_mem_half1 : label is 
         "42ee000042ec000042ea000042e8000042e6000042e4000042e2000042e00000";
   attribute INIT_0D of rom_signed_10bit_mem_half1 : label is 
         "42de000042dc000042da000042d8000042d6000042d4000042d2000042d00000";
   attribute INIT_0C of rom_signed_10bit_mem_half1 : label is 
         "42ce000042cc000042ca000042c8000042c6000042c4000042c2000042c00000";
   attribute INIT_0B of rom_signed_10bit_mem_half1 : label is 
         "42be000042bc000042ba000042b8000042b6000042b4000042b2000042b00000";
   attribute INIT_0A of rom_signed_10bit_mem_half1 : label is 
         "42ae000042ac000042aa000042a8000042a6000042a4000042a2000042a00000";
   attribute INIT_09 of rom_signed_10bit_mem_half1 : label is 
         "429e0000429c0000429a00004298000042960000429400004292000042900000";
   attribute INIT_08 of rom_signed_10bit_mem_half1 : label is 
         "428e0000428c0000428a00004288000042860000428400004282000042800000";
   attribute INIT_07 of rom_signed_10bit_mem_half1 : label is 
         "427c0000427800004274000042700000426c0000426800004264000042600000";
   attribute INIT_06 of rom_signed_10bit_mem_half1 : label is 
         "425c0000425800004254000042500000424c0000424800004244000042400000";
   attribute INIT_05 of rom_signed_10bit_mem_half1 : label is 
         "423c0000423800004234000042300000422c0000422800004224000042200000";
   attribute INIT_04 of rom_signed_10bit_mem_half1 : label is 
         "421c0000421800004214000042100000420c0000420800004204000042000000";
   attribute INIT_03 of rom_signed_10bit_mem_half1 : label is 
         "41f8000041f0000041e8000041e0000041d8000041d0000041c8000041c00000";
   attribute INIT_02 of rom_signed_10bit_mem_half1 : label is 
         "41b8000041b0000041a8000041a0000041980000419000004188000041800000";
   attribute INIT_01 of rom_signed_10bit_mem_half1 : label is 
         "4170000041600000415000004140000041300000412000004110000041000000";
   attribute INIT_00 of rom_signed_10bit_mem_half1 : label is 
         "40e0000040c0000040a000004080000040400000400000003f80000022000000";
   attribute INIT_3F of rom_signed_10bit_mem_half2 : label is 
         "bf800000c0000000c0400000c0800000c0a00000c0c00000c0e00000c1000000";
   attribute INIT_3E of rom_signed_10bit_mem_half2 : label is 
         "c1100000c1200000c1300000c1400000c1500000c1600000c1700000c1800000";
   attribute INIT_3D of rom_signed_10bit_mem_half2 : label is 
         "c1880000c1900000c1980000c1a00000c1a80000c1b00000c1b80000c1c00000";
   attribute INIT_3C of rom_signed_10bit_mem_half2 : label is 
         "c1c80000c1d00000c1d80000c1e00000c1e80000c1f00000c1f80000c2000000";
   attribute INIT_3B of rom_signed_10bit_mem_half2 : label is 
         "c2040000c2080000c20c0000c2100000c2140000c2180000c21c0000c2200000";
   attribute INIT_3A of rom_signed_10bit_mem_half2 : label is 
         "c2240000c2280000c22c0000c2300000c2340000c2380000c23c0000c2400000";
   attribute INIT_39 of rom_signed_10bit_mem_half2 : label is 
         "c2440000c2480000c24c0000c2500000c2540000c2580000c25c0000c2600000";
   attribute INIT_38 of rom_signed_10bit_mem_half2 : label is 
         "c2640000c2680000c26c0000c2700000c2740000c2780000c27c0000c2800000";
   attribute INIT_37 of rom_signed_10bit_mem_half2 : label is 
         "c2820000c2840000c2860000c2880000c28a0000c28c0000c28e0000c2900000";
   attribute INIT_36 of rom_signed_10bit_mem_half2 : label is 
         "c2920000c2940000c2960000c2980000c29a0000c29c0000c29e0000c2a00000";
   attribute INIT_35 of rom_signed_10bit_mem_half2 : label is 
         "c2a20000c2a40000c2a60000c2a80000c2aa0000c2ac0000c2ae0000c2b00000";
   attribute INIT_34 of rom_signed_10bit_mem_half2 : label is 
         "c2b20000c2b40000c2b60000c2b80000c2ba0000c2bc0000c2be0000c2c00000";
   attribute INIT_33 of rom_signed_10bit_mem_half2 : label is 
         "c2c20000c2c40000c2c60000c2c80000c2ca0000c2cc0000c2ce0000c2d00000";
   attribute INIT_32 of rom_signed_10bit_mem_half2 : label is 
         "c2d20000c2d40000c2d60000c2d80000c2da0000c2dc0000c2de0000c2e00000";
   attribute INIT_31 of rom_signed_10bit_mem_half2 : label is 
         "c2e20000c2e40000c2e60000c2e80000c2ea0000c2ec0000c2ee0000c2f00000";
   attribute INIT_30 of rom_signed_10bit_mem_half2 : label is 
         "c2f20000c2f40000c2f60000c2f80000c2fa0000c2fc0000c2fe0000c3000000";
   attribute INIT_2F of rom_signed_10bit_mem_half2 : label is 
         "c3010000c3020000c3030000c3040000c3050000c3060000c3070000c3080000";
   attribute INIT_2E of rom_signed_10bit_mem_half2 : label is 
         "c3090000c30a0000c30b0000c30c0000c30d0000c30e0000c30f0000c3100000";
   attribute INIT_2D of rom_signed_10bit_mem_half2 : label is 
         "c3110000c3120000c3130000c3140000c3150000c3160000c3170000c3180000";
   attribute INIT_2C of rom_signed_10bit_mem_half2 : label is 
         "c3190000c31a0000c31b0000c31c0000c31d0000c31e0000c31f0000c3200000";
   attribute INIT_2B of rom_signed_10bit_mem_half2 : label is 
         "c3210000c3220000c3230000c3240000c3250000c3260000c3270000c3280000";
   attribute INIT_2A of rom_signed_10bit_mem_half2 : label is 
         "c3290000c32a0000c32b0000c32c0000c32d0000c32e0000c32f0000c3300000";
   attribute INIT_29 of rom_signed_10bit_mem_half2 : label is 
         "c3310000c3320000c3330000c3340000c3350000c3360000c3370000c3380000";
   attribute INIT_28 of rom_signed_10bit_mem_half2 : label is 
         "c3390000c33a0000c33b0000c33c0000c33d0000c33e0000c33f0000c3400000";
   attribute INIT_27 of rom_signed_10bit_mem_half2 : label is 
         "c3410000c3420000c3430000c3440000c3450000c3460000c3470000c3480000";
   attribute INIT_26 of rom_signed_10bit_mem_half2 : label is 
         "c3490000c34a0000c34b0000c34c0000c34d0000c34e0000c34f0000c3500000";
   attribute INIT_25 of rom_signed_10bit_mem_half2 : label is 
         "c3510000c3520000c3530000c3540000c3550000c3560000c3570000c3580000";
   attribute INIT_24 of rom_signed_10bit_mem_half2 : label is 
         "c3590000c35a0000c35b0000c35c0000c35d0000c35e0000c35f0000c3600000";
   attribute INIT_23 of rom_signed_10bit_mem_half2 : label is 
         "c3610000c3620000c3630000c3640000c3650000c3660000c3670000c3680000";
   attribute INIT_22 of rom_signed_10bit_mem_half2 : label is 
         "c3690000c36a0000c36b0000c36c0000c36d0000c36e0000c36f0000c3700000";
   attribute INIT_21 of rom_signed_10bit_mem_half2 : label is 
         "c3710000c3720000c3730000c3740000c3750000c3760000c3770000c3780000";
   attribute INIT_20 of rom_signed_10bit_mem_half2 : label is 
         "c3790000c37a0000c37b0000c37c0000c37d0000c37e0000c37f0000c3800000";
   attribute INIT_1F of rom_signed_10bit_mem_half2 : label is 
         "c3808000c3810000c3818000c3820000c3828000c3830000c3838000c3840000";
   attribute INIT_1E of rom_signed_10bit_mem_half2 : label is 
         "c3848000c3850000c3858000c3860000c3868000c3870000c3878000c3880000";
   attribute INIT_1D of rom_signed_10bit_mem_half2 : label is 
         "c3888000c3890000c3898000c38a0000c38a8000c38b0000c38b8000c38c0000";
   attribute INIT_1C of rom_signed_10bit_mem_half2 : label is 
         "c38c8000c38d0000c38d8000c38e0000c38e8000c38f0000c38f8000c3900000";
   attribute INIT_1B of rom_signed_10bit_mem_half2 : label is 
         "c3908000c3910000c3918000c3920000c3928000c3930000c3938000c3940000";
   attribute INIT_1A of rom_signed_10bit_mem_half2 : label is 
         "c3948000c3950000c3958000c3960000c3968000c3970000c3978000c3980000";
   attribute INIT_19 of rom_signed_10bit_mem_half2 : label is 
         "c3988000c3990000c3998000c39a0000c39a8000c39b0000c39b8000c39c0000";
   attribute INIT_18 of rom_signed_10bit_mem_half2 : label is 
         "c39c8000c39d0000c39d8000c39e0000c39e8000c39f0000c39f8000c3a00000";
   attribute INIT_17 of rom_signed_10bit_mem_half2 : label is 
         "c3a08000c3a10000c3a18000c3a20000c3a28000c3a30000c3a38000c3a40000";
   attribute INIT_16 of rom_signed_10bit_mem_half2 : label is 
         "c3a48000c3a50000c3a58000c3a60000c3a68000c3a70000c3a78000c3a80000";
   attribute INIT_15 of rom_signed_10bit_mem_half2 : label is 
         "c3a88000c3a90000c3a98000c3aa0000c3aa8000c3ab0000c3ab8000c3ac0000";
   attribute INIT_14 of rom_signed_10bit_mem_half2 : label is 
         "c3ac8000c3ad0000c3ad8000c3ae0000c3ae8000c3af0000c3af8000c3b00000";
   attribute INIT_13 of rom_signed_10bit_mem_half2 : label is 
         "c3b08000c3b10000c3b18000c3b20000c3b28000c3b30000c3b38000c3b40000";
   attribute INIT_12 of rom_signed_10bit_mem_half2 : label is 
         "c3b48000c3b50000c3b58000c3b60000c3b68000c3b70000c3b78000c3b80000";
   attribute INIT_11 of rom_signed_10bit_mem_half2 : label is 
         "c3b88000c3b90000c3b98000c3ba0000c3ba8000c3bb0000c3bb8000c3bc0000";
   attribute INIT_10 of rom_signed_10bit_mem_half2 : label is 
         "c3bc8000c3bd0000c3bd8000c3be0000c3be8000c3bf0000c3bf8000c3c00000";
   attribute INIT_0F of rom_signed_10bit_mem_half2 : label is 
         "c3c08000c3c10000c3c18000c3c20000c3c28000c3c30000c3c38000c3c40000";
   attribute INIT_0E of rom_signed_10bit_mem_half2 : label is 
         "c3c48000c3c50000c3c58000c3c60000c3c68000c3c70000c3c78000c3c80000";
   attribute INIT_0D of rom_signed_10bit_mem_half2 : label is 
         "c3c88000c3c90000c3c98000c3ca0000c3ca8000c3cb0000c3cb8000c3cc0000";
   attribute INIT_0C of rom_signed_10bit_mem_half2 : label is 
         "c3cc8000c3cd0000c3cd8000c3ce0000c3ce8000c3cf0000c3cf8000c3d00000";
   attribute INIT_0B of rom_signed_10bit_mem_half2 : label is 
         "c3d08000c3d10000c3d18000c3d20000c3d28000c3d30000c3d38000c3d40000";
   attribute INIT_0A of rom_signed_10bit_mem_half2 : label is 
         "c3d48000c3d50000c3d58000c3d60000c3d68000c3d70000c3d78000c3d80000";
   attribute INIT_09 of rom_signed_10bit_mem_half2 : label is 
         "c3d88000c3d90000c3d98000c3da0000c3da8000c3db0000c3db8000c3dc0000";
   attribute INIT_08 of rom_signed_10bit_mem_half2 : label is 
         "c3dc8000c3dd0000c3dd8000c3de0000c3de8000c3df0000c3df8000c3e00000";
   attribute INIT_07 of rom_signed_10bit_mem_half2 : label is 
         "c3e08000c3e10000c3e18000c3e20000c3e28000c3e30000c3e38000c3e40000";
   attribute INIT_06 of rom_signed_10bit_mem_half2 : label is 
         "c3e48000c3e50000c3e58000c3e60000c3e68000c3e70000c3e78000c3e80000";
   attribute INIT_05 of rom_signed_10bit_mem_half2 : label is 
         "c3e88000c3e90000c3e98000c3ea0000c3ea8000c3eb0000c3eb8000c3ec0000";
   attribute INIT_04 of rom_signed_10bit_mem_half2 : label is 
         "c3ec8000c3ed0000c3ed8000c3ee0000c3ee8000c3ef0000c3ef8000c3f00000";
   attribute INIT_03 of rom_signed_10bit_mem_half2 : label is 
         "c3f08000c3f10000c3f18000c3f20000c3f28000c3f30000c3f38000c3f40000";
   attribute INIT_02 of rom_signed_10bit_mem_half2 : label is 
         "c3f48000c3f50000c3f58000c3f60000c3f68000c3f70000c3f78000c3f80000";
   attribute INIT_01 of rom_signed_10bit_mem_half2 : label is 
         "c3f88000c3f90000c3f98000c3fa0000c3fa8000c3fb0000c3fb8000c3fc0000";
   attribute INIT_00 of rom_signed_10bit_mem_half2 : label is 
         "c3fc8000c3fd0000c3fd8000c3fe0000c3fe8000c3ff0000c3ff8000c4000000";
   attribute WRITE_WIDTH_B of rom_signed_10bit_mem_half2 : label is "36";
   attribute WRITE_WIDTH_A of rom_signed_10bit_mem_half2 : label is "36";
   attribute WRITE_MODE_B of rom_signed_10bit_mem_half2 : label is "READ_FIRST";
   attribute WRITE_MODE_A of rom_signed_10bit_mem_half2 : label is "READ_FIRST";
   attribute READ_WIDTH_B of rom_signed_10bit_mem_half2 : label is "36";
   attribute READ_WIDTH_A of rom_signed_10bit_mem_half2 : label is "36";
begin
   MUX_rom_signed_10bit_0 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(0),
                D1=>XLXN_33(0),
                S0=>address(9),
                O=>o_data(0));
   
   MUX_rom_signed_10bit_1 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(1),
                D1=>XLXN_33(1),
                S0=>address(9),
                O=>o_data(1));
   
   MUX_rom_signed_10bit_2 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(2),
                D1=>XLXN_33(2),
                S0=>address(9),
                O=>o_data(2));
   
   MUX_rom_signed_10bit_3 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(3),
                D1=>XLXN_33(3),
                S0=>address(9),
                O=>o_data(3));
   
   MUX_rom_signed_10bit_4 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(4),
                D1=>XLXN_33(4),
                S0=>address(9),
                O=>o_data(4));
   
   MUX_rom_signed_10bit_5 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(5),
                D1=>XLXN_33(5),
                S0=>address(9),
                O=>o_data(5));
   
   MUX_rom_signed_10bit_6 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(6),
                D1=>XLXN_33(6),
                S0=>address(9),
                O=>o_data(6));
   
   MUX_rom_signed_10bit_7 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(7),
                D1=>XLXN_33(7),
                S0=>address(9),
                O=>o_data(7));
   
   MUX_rom_signed_10bit_8 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(8),
                D1=>XLXN_33(8),
                S0=>address(9),
                O=>o_data(8));
   
   MUX_rom_signed_10bit_9 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(9),
                D1=>XLXN_33(9),
                S0=>address(9),
                O=>o_data(9));
   
   MUX_rom_signed_10bit_10 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(10),
                D1=>XLXN_33(10),
                S0=>address(9),
                O=>o_data(10));
   
   MUX_rom_signed_10bit_11 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(11),
                D1=>XLXN_33(11),
                S0=>address(9),
                O=>o_data(11));
   
   MUX_rom_signed_10bit_12 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(12),
                D1=>XLXN_33(12),
                S0=>address(9),
                O=>o_data(12));
   
   MUX_rom_signed_10bit_13 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(13),
                D1=>XLXN_33(13),
                S0=>address(9),
                O=>o_data(13));
   
   MUX_rom_signed_10bit_14 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(14),
                D1=>XLXN_33(14),
                S0=>address(9),
                O=>o_data(14));
   
   MUX_rom_signed_10bit_15 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(15),
                D1=>XLXN_33(15),
                S0=>address(9),
                O=>o_data(15));
   
   MUX_rom_signed_10bit_16 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(16),
                D1=>XLXN_33(16),
                S0=>address(9),
                O=>o_data(16));
   
   MUX_rom_signed_10bit_17 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(17),
                D1=>XLXN_33(17),
                S0=>address(9),
                O=>o_data(17));
   
   MUX_rom_signed_10bit_18 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(18),
                D1=>XLXN_33(18),
                S0=>address(9),
                O=>o_data(18));
   
   MUX_rom_signed_10bit_19 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(19),
                D1=>XLXN_33(19),
                S0=>address(9),
                O=>o_data(19));
   
   MUX_rom_signed_10bit_20 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(20),
                D1=>XLXN_33(20),
                S0=>address(9),
                O=>o_data(20));
   
   MUX_rom_signed_10bit_21 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(21),
                D1=>XLXN_33(21),
                S0=>address(9),
                O=>o_data(21));
   
   MUX_rom_signed_10bit_22 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(22),
                D1=>XLXN_33(22),
                S0=>address(9),
                O=>o_data(22));
   
   MUX_rom_signed_10bit_23 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(23),
                D1=>XLXN_33(23),
                S0=>address(9),
                O=>o_data(23));
   
   MUX_rom_signed_10bit_24 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(24),
                D1=>XLXN_33(24),
                S0=>address(9),
                O=>o_data(24));
   
   MUX_rom_signed_10bit_25 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(25),
                D1=>XLXN_33(25),
                S0=>address(9),
                O=>o_data(25));
   
   MUX_rom_signed_10bit_26 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(26),
                D1=>XLXN_33(26),
                S0=>address(9),
                O=>o_data(26));
   
   MUX_rom_signed_10bit_27 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(27),
                D1=>XLXN_33(27),
                S0=>address(9),
                O=>o_data(27));
   
   MUX_rom_signed_10bit_28 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(28),
                D1=>XLXN_33(28),
                S0=>address(9),
                O=>o_data(28));
   
   MUX_rom_signed_10bit_29 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(29),
                D1=>XLXN_33(29),
                S0=>address(9),
                O=>o_data(29));
   
   MUX_rom_signed_10bit_30 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(30),
                D1=>XLXN_33(30),
                S0=>address(9),
                O=>o_data(30));
   
   MUX_rom_signed_10bit_31 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(31),
                D1=>XLXN_33(31),
                S0=>address(9),
                O=>o_data(31));
   
   rom_signed_10bit_mem_half1 : ramb16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36,
            INIT_3F => 
         x"43ff800043ff000043fe800043fe000043fd800043fd000043fc800043fc0000",
            INIT_3E => 
         x"43fb800043fb000043fa800043fa000043f9800043f9000043f8800043f80000",
            INIT_3D => 
         x"43f7800043f7000043f6800043f6000043f5800043f5000043f4800043f40000",
            INIT_3C => 
         x"43f3800043f3000043f2800043f2000043f1800043f1000043f0800043f00000",
            INIT_3B => 
         x"43ef800043ef000043ee800043ee000043ed800043ed000043ec800043ec0000",
            INIT_3A => 
         x"43eb800043eb000043ea800043ea000043e9800043e9000043e8800043e80000",
            INIT_39 => 
         x"43e7800043e7000043e6800043e6000043e5800043e5000043e4800043e40000",
            INIT_38 => 
         x"43e3800043e3000043e2800043e2000043e1800043e1000043e0800043e00000",
            INIT_37 => 
         x"43df800043df000043de800043de000043dd800043dd000043dc800043dc0000",
            INIT_36 => 
         x"43db800043db000043da800043da000043d9800043d9000043d8800043d80000",
            INIT_35 => 
         x"43d7800043d7000043d6800043d6000043d5800043d5000043d4800043d40000",
            INIT_34 => 
         x"43d3800043d3000043d2800043d2000043d1800043d1000043d0800043d00000",
            INIT_33 => 
         x"43cf800043cf000043ce800043ce000043cd800043cd000043cc800043cc0000",
            INIT_32 => 
         x"43cb800043cb000043ca800043ca000043c9800043c9000043c8800043c80000",
            INIT_31 => 
         x"43c7800043c7000043c6800043c6000043c5800043c5000043c4800043c40000",
            INIT_30 => 
         x"43c3800043c3000043c2800043c2000043c1800043c1000043c0800043c00000",
            INIT_2F => 
         x"43bf800043bf000043be800043be000043bd800043bd000043bc800043bc0000",
            INIT_2E => 
         x"43bb800043bb000043ba800043ba000043b9800043b9000043b8800043b80000",
            INIT_2D => 
         x"43b7800043b7000043b6800043b6000043b5800043b5000043b4800043b40000",
            INIT_2C => 
         x"43b3800043b3000043b2800043b2000043b1800043b1000043b0800043b00000",
            INIT_2B => 
         x"43af800043af000043ae800043ae000043ad800043ad000043ac800043ac0000",
            INIT_2A => 
         x"43ab800043ab000043aa800043aa000043a9800043a9000043a8800043a80000",
            INIT_29 => 
         x"43a7800043a7000043a6800043a6000043a5800043a5000043a4800043a40000",
            INIT_28 => 
         x"43a3800043a3000043a2800043a2000043a1800043a1000043a0800043a00000",
            INIT_27 => 
         x"439f8000439f0000439e8000439e0000439d8000439d0000439c8000439c0000",
            INIT_26 => 
         x"439b8000439b0000439a8000439a000043998000439900004398800043980000",
            INIT_25 => 
         x"4397800043970000439680004396000043958000439500004394800043940000",
            INIT_24 => 
         x"4393800043930000439280004392000043918000439100004390800043900000",
            INIT_23 => 
         x"438f8000438f0000438e8000438e0000438d8000438d0000438c8000438c0000",
            INIT_22 => 
         x"438b8000438b0000438a8000438a000043898000438900004388800043880000",
            INIT_21 => 
         x"4387800043870000438680004386000043858000438500004384800043840000",
            INIT_20 => 
         x"4383800043830000438280004382000043818000438100004380800043800000",
            INIT_1F => 
         x"437f0000437e0000437d0000437c0000437b0000437a00004379000043780000",
            INIT_1E => 
         x"4377000043760000437500004374000043730000437200004371000043700000",
            INIT_1D => 
         x"436f0000436e0000436d0000436c0000436b0000436a00004369000043680000",
            INIT_1C => 
         x"4367000043660000436500004364000043630000436200004361000043600000",
            INIT_1B => 
         x"435f0000435e0000435d0000435c0000435b0000435a00004359000043580000",
            INIT_1A => 
         x"4357000043560000435500004354000043530000435200004351000043500000",
            INIT_19 => 
         x"434f0000434e0000434d0000434c0000434b0000434a00004349000043480000",
            INIT_18 => 
         x"4347000043460000434500004344000043430000434200004341000043400000",
            INIT_17 => 
         x"433f0000433e0000433d0000433c0000433b0000433a00004339000043380000",
            INIT_16 => 
         x"4337000043360000433500004334000043330000433200004331000043300000",
            INIT_15 => 
         x"432f0000432e0000432d0000432c0000432b0000432a00004329000043280000",
            INIT_14 => 
         x"4327000043260000432500004324000043230000432200004321000043200000",
            INIT_13 => 
         x"431f0000431e0000431d0000431c0000431b0000431a00004319000043180000",
            INIT_12 => 
         x"4317000043160000431500004314000043130000431200004311000043100000",
            INIT_11 => 
         x"430f0000430e0000430d0000430c0000430b0000430a00004309000043080000",
            INIT_10 => 
         x"4307000043060000430500004304000043030000430200004301000043000000",
            INIT_0F => 
         x"42fe000042fc000042fa000042f8000042f6000042f4000042f2000042f00000",
            INIT_0E => 
         x"42ee000042ec000042ea000042e8000042e6000042e4000042e2000042e00000",
            INIT_0D => 
         x"42de000042dc000042da000042d8000042d6000042d4000042d2000042d00000",
            INIT_0C => 
         x"42ce000042cc000042ca000042c8000042c6000042c4000042c2000042c00000",
            INIT_0B => 
         x"42be000042bc000042ba000042b8000042b6000042b4000042b2000042b00000",
            INIT_0A => 
         x"42ae000042ac000042aa000042a8000042a6000042a4000042a2000042a00000",
            INIT_09 => 
         x"429e0000429c0000429a00004298000042960000429400004292000042900000",
            INIT_08 => 
         x"428e0000428c0000428a00004288000042860000428400004282000042800000",
            INIT_07 => 
         x"427c0000427800004274000042700000426c0000426800004264000042600000",
            INIT_06 => 
         x"425c0000425800004254000042500000424c0000424800004244000042400000",
            INIT_05 => 
         x"423c0000423800004234000042300000422c0000422800004224000042200000",
            INIT_04 => 
         x"421c0000421800004214000042100000420c0000420800004204000042000000",
            INIT_03 => 
         x"41f8000041f0000041e8000041e0000041d8000041d0000041c8000041c00000",
            INIT_02 => 
         x"41b8000041b0000041a8000041a0000041980000419000004188000041800000",
            INIT_01 => 
         x"4170000041600000415000004140000041300000412000004110000041000000",
            INIT_00 => 
         x"40e0000040c0000040a000004080000040400000400000003f80000022000000")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_3(14 downto 0),
                ADDRB(14 downto 
            0)=>rom_signed_10bit_mem_half1_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>rom_signed_10bit_mem_half1_CASCADEINA_openSignal,
                CASCADEINB=>rom_signed_10bit_mem_half1_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>rom_signed_10bit_mem_half1_CLKB_openSignal,
                DIA(31 downto 0)=>rom_signed_10bit_mem_half1_DIA_openSignal(31 
            downto 0),
                DIB(31 downto 0)=>rom_signed_10bit_mem_half1_DIB_openSignal(31 
            downto 0),
                DIPA(3 downto 0)=>rom_signed_10bit_mem_half1_DIPA_openSignal(3 
            downto 0),
                DIPB(3 downto 0)=>rom_signed_10bit_mem_half1_DIPB_openSignal(3 
            downto 0),
                ENA=>XLXN_24,
                ENB=>XLXN_38,
                REGCEA=>rom_signed_10bit_mem_half1_REGCEA_openSignal,
                REGCEB=>rom_signed_10bit_mem_half1_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>rom_signed_10bit_mem_half1_SSRB_openSignal,
                WEA(3 downto 0)=>rom_signed_10bit_mem_half1_WEA_openSignal(3 
            downto 0),
                WEB(3 downto 0)=>rom_signed_10bit_mem_half1_WEB_openSignal(3 
            downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_32(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   rom_signed_10bit_mem_half2 : ramb16
   -- synopsys translate_off
   generic map( INIT_3F => 
         x"bf800000c0000000c0400000c0800000c0a00000c0c00000c0e00000c1000000",
            INIT_3E => 
         x"c1100000c1200000c1300000c1400000c1500000c1600000c1700000c1800000",
            INIT_3D => 
         x"c1880000c1900000c1980000c1a00000c1a80000c1b00000c1b80000c1c00000",
            INIT_3C => 
         x"c1c80000c1d00000c1d80000c1e00000c1e80000c1f00000c1f80000c2000000",
            INIT_3B => 
         x"c2040000c2080000c20c0000c2100000c2140000c2180000c21c0000c2200000",
            INIT_3A => 
         x"c2240000c2280000c22c0000c2300000c2340000c2380000c23c0000c2400000",
            INIT_39 => 
         x"c2440000c2480000c24c0000c2500000c2540000c2580000c25c0000c2600000",
            INIT_38 => 
         x"c2640000c2680000c26c0000c2700000c2740000c2780000c27c0000c2800000",
            INIT_37 => 
         x"c2820000c2840000c2860000c2880000c28a0000c28c0000c28e0000c2900000",
            INIT_36 => 
         x"c2920000c2940000c2960000c2980000c29a0000c29c0000c29e0000c2a00000",
            INIT_35 => 
         x"c2a20000c2a40000c2a60000c2a80000c2aa0000c2ac0000c2ae0000c2b00000",
            INIT_34 => 
         x"c2b20000c2b40000c2b60000c2b80000c2ba0000c2bc0000c2be0000c2c00000",
            INIT_33 => 
         x"c2c20000c2c40000c2c60000c2c80000c2ca0000c2cc0000c2ce0000c2d00000",
            INIT_32 => 
         x"c2d20000c2d40000c2d60000c2d80000c2da0000c2dc0000c2de0000c2e00000",
            INIT_31 => 
         x"c2e20000c2e40000c2e60000c2e80000c2ea0000c2ec0000c2ee0000c2f00000",
            INIT_30 => 
         x"c2f20000c2f40000c2f60000c2f80000c2fa0000c2fc0000c2fe0000c3000000",
            INIT_2F => 
         x"c3010000c3020000c3030000c3040000c3050000c3060000c3070000c3080000",
            INIT_2E => 
         x"c3090000c30a0000c30b0000c30c0000c30d0000c30e0000c30f0000c3100000",
            INIT_2D => 
         x"c3110000c3120000c3130000c3140000c3150000c3160000c3170000c3180000",
            INIT_2C => 
         x"c3190000c31a0000c31b0000c31c0000c31d0000c31e0000c31f0000c3200000",
            INIT_2B => 
         x"c3210000c3220000c3230000c3240000c3250000c3260000c3270000c3280000",
            INIT_2A => 
         x"c3290000c32a0000c32b0000c32c0000c32d0000c32e0000c32f0000c3300000",
            INIT_29 => 
         x"c3310000c3320000c3330000c3340000c3350000c3360000c3370000c3380000",
            INIT_28 => 
         x"c3390000c33a0000c33b0000c33c0000c33d0000c33e0000c33f0000c3400000",
            INIT_27 => 
         x"c3410000c3420000c3430000c3440000c3450000c3460000c3470000c3480000",
            INIT_26 => 
         x"c3490000c34a0000c34b0000c34c0000c34d0000c34e0000c34f0000c3500000",
            INIT_25 => 
         x"c3510000c3520000c3530000c3540000c3550000c3560000c3570000c3580000",
            INIT_24 => 
         x"c3590000c35a0000c35b0000c35c0000c35d0000c35e0000c35f0000c3600000",
            INIT_23 => 
         x"c3610000c3620000c3630000c3640000c3650000c3660000c3670000c3680000",
            INIT_22 => 
         x"c3690000c36a0000c36b0000c36c0000c36d0000c36e0000c36f0000c3700000",
            INIT_21 => 
         x"c3710000c3720000c3730000c3740000c3750000c3760000c3770000c3780000",
            INIT_20 => 
         x"c3790000c37a0000c37b0000c37c0000c37d0000c37e0000c37f0000c3800000",
            INIT_1F => 
         x"c3808000c3810000c3818000c3820000c3828000c3830000c3838000c3840000",
            INIT_1E => 
         x"c3848000c3850000c3858000c3860000c3868000c3870000c3878000c3880000",
            INIT_1D => 
         x"c3888000c3890000c3898000c38a0000c38a8000c38b0000c38b8000c38c0000",
            INIT_1C => 
         x"c38c8000c38d0000c38d8000c38e0000c38e8000c38f0000c38f8000c3900000",
            INIT_1B => 
         x"c3908000c3910000c3918000c3920000c3928000c3930000c3938000c3940000",
            INIT_1A => 
         x"c3948000c3950000c3958000c3960000c3968000c3970000c3978000c3980000",
            INIT_19 => 
         x"c3988000c3990000c3998000c39a0000c39a8000c39b0000c39b8000c39c0000",
            INIT_18 => 
         x"c39c8000c39d0000c39d8000c39e0000c39e8000c39f0000c39f8000c3a00000",
            INIT_17 => 
         x"c3a08000c3a10000c3a18000c3a20000c3a28000c3a30000c3a38000c3a40000",
            INIT_16 => 
         x"c3a48000c3a50000c3a58000c3a60000c3a68000c3a70000c3a78000c3a80000",
            INIT_15 => 
         x"c3a88000c3a90000c3a98000c3aa0000c3aa8000c3ab0000c3ab8000c3ac0000",
            INIT_14 => 
         x"c3ac8000c3ad0000c3ad8000c3ae0000c3ae8000c3af0000c3af8000c3b00000",
            INIT_13 => 
         x"c3b08000c3b10000c3b18000c3b20000c3b28000c3b30000c3b38000c3b40000",
            INIT_12 => 
         x"c3b48000c3b50000c3b58000c3b60000c3b68000c3b70000c3b78000c3b80000",
            INIT_11 => 
         x"c3b88000c3b90000c3b98000c3ba0000c3ba8000c3bb0000c3bb8000c3bc0000",
            INIT_10 => 
         x"c3bc8000c3bd0000c3bd8000c3be0000c3be8000c3bf0000c3bf8000c3c00000",
            INIT_0F => 
         x"c3c08000c3c10000c3c18000c3c20000c3c28000c3c30000c3c38000c3c40000",
            INIT_0E => 
         x"c3c48000c3c50000c3c58000c3c60000c3c68000c3c70000c3c78000c3c80000",
            INIT_0D => 
         x"c3c88000c3c90000c3c98000c3ca0000c3ca8000c3cb0000c3cb8000c3cc0000",
            INIT_0C => 
         x"c3cc8000c3cd0000c3cd8000c3ce0000c3ce8000c3cf0000c3cf8000c3d00000",
            INIT_0B => 
         x"c3d08000c3d10000c3d18000c3d20000c3d28000c3d30000c3d38000c3d40000",
            INIT_0A => 
         x"c3d48000c3d50000c3d58000c3d60000c3d68000c3d70000c3d78000c3d80000",
            INIT_09 => 
         x"c3d88000c3d90000c3d98000c3da0000c3da8000c3db0000c3db8000c3dc0000",
            INIT_08 => 
         x"c3dc8000c3dd0000c3dd8000c3de0000c3de8000c3df0000c3df8000c3e00000",
            INIT_07 => 
         x"c3e08000c3e10000c3e18000c3e20000c3e28000c3e30000c3e38000c3e40000",
            INIT_06 => 
         x"c3e48000c3e50000c3e58000c3e60000c3e68000c3e70000c3e78000c3e80000",
            INIT_05 => 
         x"c3e88000c3e90000c3e98000c3ea0000c3ea8000c3eb0000c3eb8000c3ec0000",
            INIT_04 => 
         x"c3ec8000c3ed0000c3ed8000c3ee0000c3ee8000c3ef0000c3ef8000c3f00000",
            INIT_03 => 
         x"c3f08000c3f10000c3f18000c3f20000c3f28000c3f30000c3f38000c3f40000",
            INIT_02 => 
         x"c3f48000c3f50000c3f58000c3f60000c3f68000c3f70000c3f78000c3f80000",
            INIT_01 => 
         x"c3f88000c3f90000c3f98000c3fa0000c3fa8000c3fb0000c3fb8000c3fc0000",
            INIT_00 => 
         x"c3fc8000c3fd0000c3fd8000c3fe0000c3fe8000c3ff0000c3ff8000c4000000",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_4(14 downto 0),
                ADDRB(14 downto 
            0)=>rom_signed_10bit_mem_half2_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>rom_signed_10bit_mem_half2_CASCADEINA_openSignal,
                CASCADEINB=>rom_signed_10bit_mem_half2_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>rom_signed_10bit_mem_half2_CLKB_openSignal,
                DIA(31 downto 0)=>rom_signed_10bit_mem_half2_DIA_openSignal(31 
            downto 0),
                DIB(31 downto 0)=>rom_signed_10bit_mem_half2_DIB_openSignal(31 
            downto 0),
                DIPA(3 downto 0)=>rom_signed_10bit_mem_half2_DIPA_openSignal(3 
            downto 0),
                DIPB(3 downto 0)=>rom_signed_10bit_mem_half2_DIPB_openSignal(3 
            downto 0),
                ENA=>address(9),
                ENB=>rom_signed_10bit_mem_half2_ENB_openSignal,
                REGCEA=>rom_signed_10bit_mem_half2_REGCEA_openSignal,
                REGCEB=>rom_signed_10bit_mem_half2_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>rom_signed_10bit_mem_half2_SSRB_openSignal,
                WEA(3 downto 0)=>rom_signed_10bit_mem_half2_WEA_openSignal(3 
            downto 0),
                WEB(3 downto 0)=>rom_signed_10bit_mem_half2_WEB_openSignal(3 
            downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_33(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_8_0 : GND
      port map (G=>XLXN_3(0));
   
   XLXI_8_1 : GND
      port map (G=>XLXN_3(1));
   
   XLXI_8_2 : GND
      port map (G=>XLXN_3(2));
   
   XLXI_8_3 : GND
      port map (G=>XLXN_3(3));
   
   XLXI_8_4 : GND
      port map (G=>XLXN_3(4));
   
   XLXI_12_0 : GND
      port map (G=>XLXN_4(0));
   
   XLXI_12_1 : GND
      port map (G=>XLXN_4(1));
   
   XLXI_12_2 : GND
      port map (G=>XLXN_4(2));
   
   XLXI_12_3 : GND
      port map (G=>XLXN_4(3));
   
   XLXI_12_4 : GND
      port map (G=>XLXN_4(4));
   
   XLXI_13_0 : BUF
      port map (I=>address(0),
                O=>XLXN_3(5));
   
   XLXI_13_1 : BUF
      port map (I=>address(1),
                O=>XLXN_3(6));
   
   XLXI_13_2 : BUF
      port map (I=>address(2),
                O=>XLXN_3(7));
   
   XLXI_13_3 : BUF
      port map (I=>address(3),
                O=>XLXN_3(8));
   
   XLXI_13_4 : BUF
      port map (I=>address(4),
                O=>XLXN_3(9));
   
   XLXI_13_5 : BUF
      port map (I=>address(5),
                O=>XLXN_3(10));
   
   XLXI_13_6 : BUF
      port map (I=>address(6),
                O=>XLXN_3(11));
   
   XLXI_13_7 : BUF
      port map (I=>address(7),
                O=>XLXN_3(12));
   
   XLXI_13_8 : BUF
      port map (I=>address(8),
                O=>XLXN_3(13));
   
   XLXI_13_9 : BUF
      port map (I=>address(9),
                O=>XLXN_3(14));
   
   XLXI_14_0 : BUF
      port map (I=>address(0),
                O=>XLXN_4(5));
   
   XLXI_14_1 : BUF
      port map (I=>address(1),
                O=>XLXN_4(6));
   
   XLXI_14_2 : BUF
      port map (I=>address(2),
                O=>XLXN_4(7));
   
   XLXI_14_3 : BUF
      port map (I=>address(3),
                O=>XLXN_4(8));
   
   XLXI_14_4 : BUF
      port map (I=>address(4),
                O=>XLXN_4(9));
   
   XLXI_14_5 : BUF
      port map (I=>address(5),
                O=>XLXN_4(10));
   
   XLXI_14_6 : BUF
      port map (I=>address(6),
                O=>XLXN_4(11));
   
   XLXI_14_7 : BUF
      port map (I=>address(7),
                O=>XLXN_4(12));
   
   XLXI_14_8 : BUF
      port map (I=>address(8),
                O=>XLXN_4(13));
   
   XLXI_14_9 : BUF
      port map (I=>address(9),
                O=>XLXN_4(14));
   
   XLXI_15 : INV
      port map (I=>address(9),
                O=>XLXN_24);
   
   XLXI_17 : VCC
      port map (P=>XLXN_38);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CalculatePixOSCpSp is
   port ( addfpr          : in    std_logic_vector (31 downto 0); 
          addfprdy        : in    std_logic; 
          divfpr          : in    std_logic_vector (31 downto 0); 
          divfprdy        : in    std_logic; 
          fixed2floatr    : in    std_logic_vector (31 downto 0); 
          fixed2floatrdy  : in    std_logic; 
          i_clock         : in    std_logic; 
          i_const1        : in    std_logic_vector (31 downto 0); 
          i_reset         : in    std_logic; 
          i_run           : in    std_logic; 
          i_Ta            : in    std_logic_vector (31 downto 0); 
          i_Ta0           : in    std_logic_vector (31 downto 0); 
          i_Vdd           : in    std_logic_vector (31 downto 0); 
          i_VddV0         : in    std_logic_vector (31 downto 0); 
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
          fixed2floata    : out   std_logic_vector (63 downto 0); 
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
          o_pixoscpsp0    : out   std_logic_vector (31 downto 0); 
          o_pixoscpsp1    : out   std_logic_vector (31 downto 0); 
          o_rdy           : out   std_logic; 
          subfpa          : out   std_logic_vector (31 downto 0); 
          subfpb          : out   std_logic_vector (31 downto 0); 
          subfpce         : out   std_logic; 
          subfpond        : out   std_logic; 
          subfpsclr       : out   std_logic);
end CalculatePixOSCpSp;

architecture BEHAVIORAL of CalculatePixOSCpSp is
   attribute HU_SET     : string ;
   signal kgainmux        : std_logic;
   signal XLXN_1          : std_logic_vector (5 downto 0);
   signal XLXN_2          : std_logic_vector (31 downto 0);
   signal XLXN_3          : std_logic_vector (3 downto 0);
   signal XLXN_4          : std_logic_vector (31 downto 0);
   signal XLXN_5          : std_logic_vector (3 downto 0);
   signal XLXN_6          : std_logic_vector (31 downto 0);
   signal XLXN_7          : std_logic_vector (7 downto 0);
   signal XLXN_8          : std_logic_vector (9 downto 0);
   signal XLXN_9          : std_logic_vector (31 downto 0);
   signal XLXN_10         : std_logic_vector (31 downto 0);
   signal XLXN_11         : std_logic;
   signal XLXN_12         : std_logic;
   signal XLXN_18         : std_logic_vector (63 downto 0);
   signal XLXN_19         : std_logic;
   signal XLXN_20         : std_logic;
   signal XLXN_21         : std_logic;
   signal XLXN_22         : std_logic_vector (63 downto 0);
   signal XLXN_23         : std_logic;
   signal XLXN_24         : std_logic;
   signal XLXN_25         : std_logic;
   signal XLXN_30         : std_logic_vector (31 downto 0);
   signal XLXN_31         : std_logic_vector (31 downto 0);
   signal XLXN_32         : std_logic;
   signal XLXN_33         : std_logic;
   signal XLXN_34         : std_logic;
   signal XLXN_35         : std_logic_vector (31 downto 0);
   signal XLXN_36         : std_logic_vector (31 downto 0);
   signal XLXN_37         : std_logic;
   signal XLXN_38         : std_logic;
   signal XLXN_39         : std_logic;
   signal XLXN_55         : std_logic;
   signal XLXN_56         : std_logic_vector (11 downto 0);
   signal XLXN_57         : std_logic;
   signal XLXN_58         : std_logic_vector (11 downto 0);
   signal XLXN_59         : std_logic_vector (31 downto 0);
   component CalculateKGain_process_p0
      port ( i_clock         : in    std_logic; 
             i_reset         : in    std_logic; 
             i_run           : in    std_logic; 
             fixed2floatrdy  : in    std_logic; 
             divfprdy        : in    std_logic; 
             i2c_mem_douta   : in    std_logic_vector (7 downto 0); 
             fixed2floatr    : in    std_logic_vector (31 downto 0); 
             divfpr          : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena     : out   std_logic; 
             o_rdy           : out   std_logic; 
             fixed2floatond  : out   std_logic; 
             fixed2floatsclr : out   std_logic; 
             fixed2floatce   : out   std_logic; 
             divfpond        : out   std_logic; 
             divfpsclr       : out   std_logic; 
             divfpce         : out   std_logic; 
             i2c_mem_addra   : out   std_logic_vector (11 downto 0); 
             o_KGain         : out   std_logic_vector (31 downto 0); 
             fixed2floata    : out   std_logic_vector (63 downto 0); 
             divfpa          : out   std_logic_vector (31 downto 0); 
             divfpb          : out   std_logic_vector (31 downto 0));
   end component;
   
   component M2_1_MXILINX_CalculatePixOSCpSp
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component CalculatePixOSCpSp_process_p0
      port ( i_clock               : in    std_logic; 
             i_reset               : in    std_logic; 
             i_run                 : in    std_logic; 
             CalculateKGain_rdy    : in    std_logic; 
             fixed2floatrdy        : in    std_logic; 
             divfprdy              : in    std_logic; 
             mulfprdy              : in    std_logic; 
             addfprdy              : in    std_logic; 
             subfprdy              : in    std_logic; 
             i_Ta                  : in    std_logic_vector (31 downto 0); 
             i_Ta0                 : in    std_logic_vector (31 downto 0); 
             i_Vdd                 : in    std_logic_vector (31 downto 0); 
             i_VddV0               : in    std_logic_vector (31 downto 0); 
             i_const1              : in    std_logic_vector (31 downto 0); 
             i2c_mem_douta         : in    std_logic_vector (7 downto 0); 
             mem_signed256_ovalue  : in    std_logic_vector (31 downto 0); 
             mem_signed1024_ovalue : in    std_logic_vector (31 downto 0); 
             nibble_in1            : in    std_logic_vector (31 downto 0); 
             nibble_in2            : in    std_logic_vector (31 downto 0); 
             nibble_in3            : in    std_logic_vector (31 downto 0); 
             calculateKGain_KGain  : in    std_logic_vector (31 downto 0); 
             fixed2floatr          : in    std_logic_vector (31 downto 0); 
             divfpr                : in    std_logic_vector (31 downto 0); 
             mulfpr                : in    std_logic_vector (31 downto 0); 
             addfpr                : in    std_logic_vector (31 downto 0); 
             subfpr                : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena           : out   std_logic; 
             o_rdy                 : out   std_logic; 
             CalculateKGain_run    : out   std_logic; 
             CalculateKGain_mux    : out   std_logic; 
             fixed2floatond        : out   std_logic; 
             fixed2floatsclr       : out   std_logic; 
             fixed2floatce         : out   std_logic; 
             divfpond              : out   std_logic; 
             divfpsclr             : out   std_logic; 
             divfpce               : out   std_logic; 
             mulfpond              : out   std_logic; 
             mulfpsclr             : out   std_logic; 
             mulfpce               : out   std_logic; 
             addfpond              : out   std_logic; 
             addfpsclr             : out   std_logic; 
             addfpce               : out   std_logic; 
             subfpond              : out   std_logic; 
             subfpsclr             : out   std_logic; 
             subfpce               : out   std_logic; 
             i2c_mem_addra         : out   std_logic_vector (11 downto 0); 
             o_pixoscpsp0          : out   std_logic_vector (31 downto 0); 
             o_pixoscpsp1          : out   std_logic_vector (31 downto 0); 
             mem_signed256_ivalue  : out   std_logic_vector (7 downto 0); 
             mem_signed1024_ivalue : out   std_logic_vector (9 downto 0); 
             nibble_out1           : out   std_logic_vector (5 downto 0); 
             nibble_out2           : out   std_logic_vector (3 downto 0); 
             nibble_out3           : out   std_logic_vector (3 downto 0); 
             fixed2floata          : out   std_logic_vector (63 downto 0); 
             divfpa                : out   std_logic_vector (31 downto 0); 
             divfpb                : out   std_logic_vector (31 downto 0); 
             mulfpa                : out   std_logic_vector (31 downto 0); 
             mulfpb                : out   std_logic_vector (31 downto 0); 
             addfpa                : out   std_logic_vector (31 downto 0); 
             addfpb                : out   std_logic_vector (31 downto 0); 
             subfpa                : out   std_logic_vector (31 downto 0); 
             subfpb                : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed6bit
      port ( nibble_in  : in    std_logic_vector (5 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed8bit_MUSER_CalculatePixOSCpSp
      port ( i_value : in    std_logic_vector (7 downto 0); 
             i_clock : in    std_logic; 
             i_reset : in    std_logic; 
             o_value : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed10bit_MUSER_CalculatePixOSCpSp
      port ( address : in    std_logic_vector (9 downto 0); 
             i_clock : in    std_logic; 
             i_reset : in    std_logic; 
             o_data  : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_unsigned4bit_2powx
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_unsigned4bit_2powx8
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_0 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_0_2219";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_1 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_1_2218";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_2 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_2_2217";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_3 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_3_2216";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_4 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_4_2215";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_5 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_5_2214";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_6 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_6_2213";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_7 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_7_2212";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_8 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_8_2211";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_9 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_9_2210";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_10 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_10_2209";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_11 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_11_2208";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_12 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_12_2207";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_13 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_13_2206";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_14 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_14_2205";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_15 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_15_2204";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_16 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_16_2203";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_17 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_17_2202";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_18 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_18_2201";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_19 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_19_2200";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_20 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_20_2199";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_21 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_21_2198";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_22 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_22_2197";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_23 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_23_2196";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_24 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_24_2195";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_25 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_25_2194";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_26 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_26_2193";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_27 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_27_2192";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_28 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_28_2191";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_29 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_29_2190";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_30 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_30_2189";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_a_31 : label is 
         "CalculatePixOSCpSp_MUX_divfp_a_31_2188";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_0 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_0_2251";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_1 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_1_2250";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_2 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_2_2249";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_3 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_3_2248";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_4 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_4_2247";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_5 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_5_2246";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_6 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_6_2245";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_7 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_7_2244";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_8 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_8_2243";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_9 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_9_2242";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_10 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_10_2241";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_11 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_11_2240";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_12 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_12_2239";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_13 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_13_2238";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_14 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_14_2237";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_15 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_15_2236";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_16 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_16_2235";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_17 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_17_2234";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_18 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_18_2233";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_19 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_19_2232";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_20 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_20_2231";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_21 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_21_2230";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_22 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_22_2229";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_23 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_23_2228";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_24 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_24_2227";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_25 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_25_2226";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_26 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_26_2225";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_27 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_27_2224";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_28 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_28_2223";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_29 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_29_2222";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_30 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_30_2221";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_b_31 : label is 
         "CalculatePixOSCpSp_MUX_divfp_b_31_2220";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_ce : label is 
         "CalculatePixOSCpSp_MUX_divfp_ce_2254";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_ond : label is 
         "CalculatePixOSCpSp_MUX_divfp_ond_2252";
   attribute HU_SET of CalculatePixOSCpSp_MUX_divfp_sclr : label is 
         "CalculatePixOSCpSp_MUX_divfp_sclr_2253";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_0 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_0_2184";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_1 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_1_2183";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_2 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_2_2182";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_3 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_3_2181";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_4 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_4_2180";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_5 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_5_2179";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_6 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_6_2178";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_7 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_7_2177";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_8 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_8_2176";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_9 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_9_2175";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_10 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_10_2174";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_11 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_11_2173";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_12 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_12_2172";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_13 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_13_2171";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_14 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_14_2170";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_15 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_15_2169";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_16 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_16_2168";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_17 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_17_2167";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_18 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_18_2166";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_19 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_19_2165";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_20 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_20_2164";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_21 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_21_2163";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_22 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_22_2162";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_23 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_23_2161";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_24 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_24_2160";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_25 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_25_2159";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_26 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_26_2158";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_27 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_27_2157";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_28 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_28_2156";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_29 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_29_2155";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_30 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_30_2154";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_31 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_31_2153";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_32 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_32_2152";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_33 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_33_2151";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_34 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_34_2150";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_35 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_35_2149";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_36 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_36_2148";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_37 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_37_2147";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_38 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_38_2146";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_39 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_39_2145";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_40 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_40_2144";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_41 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_41_2143";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_42 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_42_2142";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_43 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_43_2141";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_44 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_44_2140";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_45 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_45_2139";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_46 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_46_2138";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_47 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_47_2137";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_48 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_48_2136";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_49 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_49_2135";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_50 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_50_2134";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_51 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_51_2133";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_52 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_52_2132";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_53 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_53_2131";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_54 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_54_2130";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_55 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_55_2129";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_56 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_56_2128";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_57 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_57_2127";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_58 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_58_2126";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_59 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_59_2125";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_60 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_60_2124";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_61 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_61_2123";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_62 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_62_2122";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_a_63 : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_a_63_2121";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_ce : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_ce_2186";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_ond : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_ond_2185";
   attribute HU_SET of CalculatePixOSCpSp_MUX_fi2fl_sclr : label is 
         "CalculatePixOSCpSp_MUX_fi2fl_sclr_2187";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_0 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_0_2267";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_1 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_1_2266";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_2 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_2_2265";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_3 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_3_2264";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_4 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_4_2263";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_5 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_5_2262";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_6 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_6_2261";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_7 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_7_2260";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_8 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_8_2259";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_9 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_9_2258";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_10 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_10_2257";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_addra_11 : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_addra_11_2256";
   attribute HU_SET of CalculatePixOSCpSp_MUX_i2c_mem_ena : label is 
         "CalculatePixOSCpSp_MUX_i2c_mem_ena_2255";
begin
   CalculatePixOSCpSp_calculatekgain_process_p0 : CalculateKGain_process_p0
      port map (divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                fixed2floatr(31 downto 0)=>fixed2floatr(31 downto 0),
                fixed2floatrdy=>fixed2floatrdy,
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>XLXN_12,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                divfpa(31 downto 0)=>XLXN_30(31 downto 0),
                divfpb(31 downto 0)=>XLXN_31(31 downto 0),
                divfpce=>XLXN_34,
                divfpond=>XLXN_32,
                divfpsclr=>XLXN_33,
                fixed2floata(63 downto 0)=>XLXN_18(63 downto 0),
                fixed2floatce=>XLXN_20,
                fixed2floatond=>XLXN_19,
                fixed2floatsclr=>XLXN_21,
                i2c_mem_addra(11 downto 0)=>XLXN_56(11 downto 0),
                i2c_mem_ena=>XLXN_55,
                o_KGain(31 downto 0)=>XLXN_59(31 downto 0),
                o_rdy=>XLXN_11);
   
   CalculatePixOSCpSp_MUX_divfp_a_0 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(0),
                D1=>XLXN_30(0),
                S0=>kgainmux,
                O=>divfpa(0));
   
   CalculatePixOSCpSp_MUX_divfp_a_1 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(1),
                D1=>XLXN_30(1),
                S0=>kgainmux,
                O=>divfpa(1));
   
   CalculatePixOSCpSp_MUX_divfp_a_2 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(2),
                D1=>XLXN_30(2),
                S0=>kgainmux,
                O=>divfpa(2));
   
   CalculatePixOSCpSp_MUX_divfp_a_3 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(3),
                D1=>XLXN_30(3),
                S0=>kgainmux,
                O=>divfpa(3));
   
   CalculatePixOSCpSp_MUX_divfp_a_4 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(4),
                D1=>XLXN_30(4),
                S0=>kgainmux,
                O=>divfpa(4));
   
   CalculatePixOSCpSp_MUX_divfp_a_5 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(5),
                D1=>XLXN_30(5),
                S0=>kgainmux,
                O=>divfpa(5));
   
   CalculatePixOSCpSp_MUX_divfp_a_6 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(6),
                D1=>XLXN_30(6),
                S0=>kgainmux,
                O=>divfpa(6));
   
   CalculatePixOSCpSp_MUX_divfp_a_7 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(7),
                D1=>XLXN_30(7),
                S0=>kgainmux,
                O=>divfpa(7));
   
   CalculatePixOSCpSp_MUX_divfp_a_8 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(8),
                D1=>XLXN_30(8),
                S0=>kgainmux,
                O=>divfpa(8));
   
   CalculatePixOSCpSp_MUX_divfp_a_9 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(9),
                D1=>XLXN_30(9),
                S0=>kgainmux,
                O=>divfpa(9));
   
   CalculatePixOSCpSp_MUX_divfp_a_10 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(10),
                D1=>XLXN_30(10),
                S0=>kgainmux,
                O=>divfpa(10));
   
   CalculatePixOSCpSp_MUX_divfp_a_11 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(11),
                D1=>XLXN_30(11),
                S0=>kgainmux,
                O=>divfpa(11));
   
   CalculatePixOSCpSp_MUX_divfp_a_12 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(12),
                D1=>XLXN_30(12),
                S0=>kgainmux,
                O=>divfpa(12));
   
   CalculatePixOSCpSp_MUX_divfp_a_13 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(13),
                D1=>XLXN_30(13),
                S0=>kgainmux,
                O=>divfpa(13));
   
   CalculatePixOSCpSp_MUX_divfp_a_14 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(14),
                D1=>XLXN_30(14),
                S0=>kgainmux,
                O=>divfpa(14));
   
   CalculatePixOSCpSp_MUX_divfp_a_15 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(15),
                D1=>XLXN_30(15),
                S0=>kgainmux,
                O=>divfpa(15));
   
   CalculatePixOSCpSp_MUX_divfp_a_16 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(16),
                D1=>XLXN_30(16),
                S0=>kgainmux,
                O=>divfpa(16));
   
   CalculatePixOSCpSp_MUX_divfp_a_17 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(17),
                D1=>XLXN_30(17),
                S0=>kgainmux,
                O=>divfpa(17));
   
   CalculatePixOSCpSp_MUX_divfp_a_18 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(18),
                D1=>XLXN_30(18),
                S0=>kgainmux,
                O=>divfpa(18));
   
   CalculatePixOSCpSp_MUX_divfp_a_19 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(19),
                D1=>XLXN_30(19),
                S0=>kgainmux,
                O=>divfpa(19));
   
   CalculatePixOSCpSp_MUX_divfp_a_20 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(20),
                D1=>XLXN_30(20),
                S0=>kgainmux,
                O=>divfpa(20));
   
   CalculatePixOSCpSp_MUX_divfp_a_21 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(21),
                D1=>XLXN_30(21),
                S0=>kgainmux,
                O=>divfpa(21));
   
   CalculatePixOSCpSp_MUX_divfp_a_22 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(22),
                D1=>XLXN_30(22),
                S0=>kgainmux,
                O=>divfpa(22));
   
   CalculatePixOSCpSp_MUX_divfp_a_23 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(23),
                D1=>XLXN_30(23),
                S0=>kgainmux,
                O=>divfpa(23));
   
   CalculatePixOSCpSp_MUX_divfp_a_24 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(24),
                D1=>XLXN_30(24),
                S0=>kgainmux,
                O=>divfpa(24));
   
   CalculatePixOSCpSp_MUX_divfp_a_25 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(25),
                D1=>XLXN_30(25),
                S0=>kgainmux,
                O=>divfpa(25));
   
   CalculatePixOSCpSp_MUX_divfp_a_26 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(26),
                D1=>XLXN_30(26),
                S0=>kgainmux,
                O=>divfpa(26));
   
   CalculatePixOSCpSp_MUX_divfp_a_27 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(27),
                D1=>XLXN_30(27),
                S0=>kgainmux,
                O=>divfpa(27));
   
   CalculatePixOSCpSp_MUX_divfp_a_28 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(28),
                D1=>XLXN_30(28),
                S0=>kgainmux,
                O=>divfpa(28));
   
   CalculatePixOSCpSp_MUX_divfp_a_29 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(29),
                D1=>XLXN_30(29),
                S0=>kgainmux,
                O=>divfpa(29));
   
   CalculatePixOSCpSp_MUX_divfp_a_30 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(30),
                D1=>XLXN_30(30),
                S0=>kgainmux,
                O=>divfpa(30));
   
   CalculatePixOSCpSp_MUX_divfp_a_31 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(31),
                D1=>XLXN_30(31),
                S0=>kgainmux,
                O=>divfpa(31));
   
   CalculatePixOSCpSp_MUX_divfp_b_0 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(0),
                D1=>XLXN_31(0),
                S0=>kgainmux,
                O=>divfpb(0));
   
   CalculatePixOSCpSp_MUX_divfp_b_1 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(1),
                D1=>XLXN_31(1),
                S0=>kgainmux,
                O=>divfpb(1));
   
   CalculatePixOSCpSp_MUX_divfp_b_2 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(2),
                D1=>XLXN_31(2),
                S0=>kgainmux,
                O=>divfpb(2));
   
   CalculatePixOSCpSp_MUX_divfp_b_3 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(3),
                D1=>XLXN_31(3),
                S0=>kgainmux,
                O=>divfpb(3));
   
   CalculatePixOSCpSp_MUX_divfp_b_4 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(4),
                D1=>XLXN_31(4),
                S0=>kgainmux,
                O=>divfpb(4));
   
   CalculatePixOSCpSp_MUX_divfp_b_5 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(5),
                D1=>XLXN_31(5),
                S0=>kgainmux,
                O=>divfpb(5));
   
   CalculatePixOSCpSp_MUX_divfp_b_6 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(6),
                D1=>XLXN_31(6),
                S0=>kgainmux,
                O=>divfpb(6));
   
   CalculatePixOSCpSp_MUX_divfp_b_7 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(7),
                D1=>XLXN_31(7),
                S0=>kgainmux,
                O=>divfpb(7));
   
   CalculatePixOSCpSp_MUX_divfp_b_8 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(8),
                D1=>XLXN_31(8),
                S0=>kgainmux,
                O=>divfpb(8));
   
   CalculatePixOSCpSp_MUX_divfp_b_9 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(9),
                D1=>XLXN_31(9),
                S0=>kgainmux,
                O=>divfpb(9));
   
   CalculatePixOSCpSp_MUX_divfp_b_10 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(10),
                D1=>XLXN_31(10),
                S0=>kgainmux,
                O=>divfpb(10));
   
   CalculatePixOSCpSp_MUX_divfp_b_11 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(11),
                D1=>XLXN_31(11),
                S0=>kgainmux,
                O=>divfpb(11));
   
   CalculatePixOSCpSp_MUX_divfp_b_12 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(12),
                D1=>XLXN_31(12),
                S0=>kgainmux,
                O=>divfpb(12));
   
   CalculatePixOSCpSp_MUX_divfp_b_13 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(13),
                D1=>XLXN_31(13),
                S0=>kgainmux,
                O=>divfpb(13));
   
   CalculatePixOSCpSp_MUX_divfp_b_14 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(14),
                D1=>XLXN_31(14),
                S0=>kgainmux,
                O=>divfpb(14));
   
   CalculatePixOSCpSp_MUX_divfp_b_15 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(15),
                D1=>XLXN_31(15),
                S0=>kgainmux,
                O=>divfpb(15));
   
   CalculatePixOSCpSp_MUX_divfp_b_16 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(16),
                D1=>XLXN_31(16),
                S0=>kgainmux,
                O=>divfpb(16));
   
   CalculatePixOSCpSp_MUX_divfp_b_17 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(17),
                D1=>XLXN_31(17),
                S0=>kgainmux,
                O=>divfpb(17));
   
   CalculatePixOSCpSp_MUX_divfp_b_18 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(18),
                D1=>XLXN_31(18),
                S0=>kgainmux,
                O=>divfpb(18));
   
   CalculatePixOSCpSp_MUX_divfp_b_19 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(19),
                D1=>XLXN_31(19),
                S0=>kgainmux,
                O=>divfpb(19));
   
   CalculatePixOSCpSp_MUX_divfp_b_20 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(20),
                D1=>XLXN_31(20),
                S0=>kgainmux,
                O=>divfpb(20));
   
   CalculatePixOSCpSp_MUX_divfp_b_21 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(21),
                D1=>XLXN_31(21),
                S0=>kgainmux,
                O=>divfpb(21));
   
   CalculatePixOSCpSp_MUX_divfp_b_22 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(22),
                D1=>XLXN_31(22),
                S0=>kgainmux,
                O=>divfpb(22));
   
   CalculatePixOSCpSp_MUX_divfp_b_23 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(23),
                D1=>XLXN_31(23),
                S0=>kgainmux,
                O=>divfpb(23));
   
   CalculatePixOSCpSp_MUX_divfp_b_24 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(24),
                D1=>XLXN_31(24),
                S0=>kgainmux,
                O=>divfpb(24));
   
   CalculatePixOSCpSp_MUX_divfp_b_25 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(25),
                D1=>XLXN_31(25),
                S0=>kgainmux,
                O=>divfpb(25));
   
   CalculatePixOSCpSp_MUX_divfp_b_26 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(26),
                D1=>XLXN_31(26),
                S0=>kgainmux,
                O=>divfpb(26));
   
   CalculatePixOSCpSp_MUX_divfp_b_27 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(27),
                D1=>XLXN_31(27),
                S0=>kgainmux,
                O=>divfpb(27));
   
   CalculatePixOSCpSp_MUX_divfp_b_28 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(28),
                D1=>XLXN_31(28),
                S0=>kgainmux,
                O=>divfpb(28));
   
   CalculatePixOSCpSp_MUX_divfp_b_29 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(29),
                D1=>XLXN_31(29),
                S0=>kgainmux,
                O=>divfpb(29));
   
   CalculatePixOSCpSp_MUX_divfp_b_30 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(30),
                D1=>XLXN_31(30),
                S0=>kgainmux,
                O=>divfpb(30));
   
   CalculatePixOSCpSp_MUX_divfp_b_31 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(31),
                D1=>XLXN_31(31),
                S0=>kgainmux,
                O=>divfpb(31));
   
   CalculatePixOSCpSp_MUX_divfp_ce : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_39,
                D1=>XLXN_34,
                S0=>kgainmux,
                O=>divfpce);
   
   CalculatePixOSCpSp_MUX_divfp_ond : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_37,
                D1=>XLXN_32,
                S0=>kgainmux,
                O=>divfpond);
   
   CalculatePixOSCpSp_MUX_divfp_sclr : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_38,
                D1=>XLXN_33,
                S0=>kgainmux,
                O=>divfpsclr);
   
   CalculatePixOSCpSp_MUX_fi2fl_a_0 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(0),
                D1=>XLXN_18(0),
                S0=>kgainmux,
                O=>fixed2floata(0));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_1 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(1),
                D1=>XLXN_18(1),
                S0=>kgainmux,
                O=>fixed2floata(1));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_2 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(2),
                D1=>XLXN_18(2),
                S0=>kgainmux,
                O=>fixed2floata(2));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_3 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(3),
                D1=>XLXN_18(3),
                S0=>kgainmux,
                O=>fixed2floata(3));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_4 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(4),
                D1=>XLXN_18(4),
                S0=>kgainmux,
                O=>fixed2floata(4));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_5 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(5),
                D1=>XLXN_18(5),
                S0=>kgainmux,
                O=>fixed2floata(5));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_6 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(6),
                D1=>XLXN_18(6),
                S0=>kgainmux,
                O=>fixed2floata(6));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_7 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(7),
                D1=>XLXN_18(7),
                S0=>kgainmux,
                O=>fixed2floata(7));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_8 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(8),
                D1=>XLXN_18(8),
                S0=>kgainmux,
                O=>fixed2floata(8));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_9 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(9),
                D1=>XLXN_18(9),
                S0=>kgainmux,
                O=>fixed2floata(9));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_10 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(10),
                D1=>XLXN_18(10),
                S0=>kgainmux,
                O=>fixed2floata(10));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_11 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(11),
                D1=>XLXN_18(11),
                S0=>kgainmux,
                O=>fixed2floata(11));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_12 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(12),
                D1=>XLXN_18(12),
                S0=>kgainmux,
                O=>fixed2floata(12));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_13 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(13),
                D1=>XLXN_18(13),
                S0=>kgainmux,
                O=>fixed2floata(13));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_14 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(14),
                D1=>XLXN_18(14),
                S0=>kgainmux,
                O=>fixed2floata(14));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_15 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(15),
                D1=>XLXN_18(15),
                S0=>kgainmux,
                O=>fixed2floata(15));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_16 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(16),
                D1=>XLXN_18(16),
                S0=>kgainmux,
                O=>fixed2floata(16));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_17 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(17),
                D1=>XLXN_18(17),
                S0=>kgainmux,
                O=>fixed2floata(17));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_18 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(18),
                D1=>XLXN_18(18),
                S0=>kgainmux,
                O=>fixed2floata(18));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_19 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(19),
                D1=>XLXN_18(19),
                S0=>kgainmux,
                O=>fixed2floata(19));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_20 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(20),
                D1=>XLXN_18(20),
                S0=>kgainmux,
                O=>fixed2floata(20));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_21 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(21),
                D1=>XLXN_18(21),
                S0=>kgainmux,
                O=>fixed2floata(21));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_22 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(22),
                D1=>XLXN_18(22),
                S0=>kgainmux,
                O=>fixed2floata(22));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_23 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(23),
                D1=>XLXN_18(23),
                S0=>kgainmux,
                O=>fixed2floata(23));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_24 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(24),
                D1=>XLXN_18(24),
                S0=>kgainmux,
                O=>fixed2floata(24));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_25 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(25),
                D1=>XLXN_18(25),
                S0=>kgainmux,
                O=>fixed2floata(25));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_26 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(26),
                D1=>XLXN_18(26),
                S0=>kgainmux,
                O=>fixed2floata(26));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_27 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(27),
                D1=>XLXN_18(27),
                S0=>kgainmux,
                O=>fixed2floata(27));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_28 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(28),
                D1=>XLXN_18(28),
                S0=>kgainmux,
                O=>fixed2floata(28));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_29 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(29),
                D1=>XLXN_18(29),
                S0=>kgainmux,
                O=>fixed2floata(29));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_30 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(30),
                D1=>XLXN_18(30),
                S0=>kgainmux,
                O=>fixed2floata(30));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_31 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(31),
                D1=>XLXN_18(31),
                S0=>kgainmux,
                O=>fixed2floata(31));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_32 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(32),
                D1=>XLXN_18(32),
                S0=>kgainmux,
                O=>fixed2floata(32));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_33 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(33),
                D1=>XLXN_18(33),
                S0=>kgainmux,
                O=>fixed2floata(33));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_34 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(34),
                D1=>XLXN_18(34),
                S0=>kgainmux,
                O=>fixed2floata(34));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_35 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(35),
                D1=>XLXN_18(35),
                S0=>kgainmux,
                O=>fixed2floata(35));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_36 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(36),
                D1=>XLXN_18(36),
                S0=>kgainmux,
                O=>fixed2floata(36));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_37 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(37),
                D1=>XLXN_18(37),
                S0=>kgainmux,
                O=>fixed2floata(37));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_38 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(38),
                D1=>XLXN_18(38),
                S0=>kgainmux,
                O=>fixed2floata(38));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_39 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(39),
                D1=>XLXN_18(39),
                S0=>kgainmux,
                O=>fixed2floata(39));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_40 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(40),
                D1=>XLXN_18(40),
                S0=>kgainmux,
                O=>fixed2floata(40));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_41 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(41),
                D1=>XLXN_18(41),
                S0=>kgainmux,
                O=>fixed2floata(41));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_42 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(42),
                D1=>XLXN_18(42),
                S0=>kgainmux,
                O=>fixed2floata(42));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_43 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(43),
                D1=>XLXN_18(43),
                S0=>kgainmux,
                O=>fixed2floata(43));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_44 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(44),
                D1=>XLXN_18(44),
                S0=>kgainmux,
                O=>fixed2floata(44));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_45 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(45),
                D1=>XLXN_18(45),
                S0=>kgainmux,
                O=>fixed2floata(45));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_46 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(46),
                D1=>XLXN_18(46),
                S0=>kgainmux,
                O=>fixed2floata(46));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_47 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(47),
                D1=>XLXN_18(47),
                S0=>kgainmux,
                O=>fixed2floata(47));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_48 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(48),
                D1=>XLXN_18(48),
                S0=>kgainmux,
                O=>fixed2floata(48));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_49 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(49),
                D1=>XLXN_18(49),
                S0=>kgainmux,
                O=>fixed2floata(49));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_50 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(50),
                D1=>XLXN_18(50),
                S0=>kgainmux,
                O=>fixed2floata(50));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_51 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(51),
                D1=>XLXN_18(51),
                S0=>kgainmux,
                O=>fixed2floata(51));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_52 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(52),
                D1=>XLXN_18(52),
                S0=>kgainmux,
                O=>fixed2floata(52));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_53 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(53),
                D1=>XLXN_18(53),
                S0=>kgainmux,
                O=>fixed2floata(53));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_54 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(54),
                D1=>XLXN_18(54),
                S0=>kgainmux,
                O=>fixed2floata(54));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_55 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(55),
                D1=>XLXN_18(55),
                S0=>kgainmux,
                O=>fixed2floata(55));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_56 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(56),
                D1=>XLXN_18(56),
                S0=>kgainmux,
                O=>fixed2floata(56));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_57 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(57),
                D1=>XLXN_18(57),
                S0=>kgainmux,
                O=>fixed2floata(57));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_58 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(58),
                D1=>XLXN_18(58),
                S0=>kgainmux,
                O=>fixed2floata(58));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_59 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(59),
                D1=>XLXN_18(59),
                S0=>kgainmux,
                O=>fixed2floata(59));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_60 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(60),
                D1=>XLXN_18(60),
                S0=>kgainmux,
                O=>fixed2floata(60));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_61 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(61),
                D1=>XLXN_18(61),
                S0=>kgainmux,
                O=>fixed2floata(61));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_62 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(62),
                D1=>XLXN_18(62),
                S0=>kgainmux,
                O=>fixed2floata(62));
   
   CalculatePixOSCpSp_MUX_fi2fl_a_63 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(63),
                D1=>XLXN_18(63),
                S0=>kgainmux,
                O=>fixed2floata(63));
   
   CalculatePixOSCpSp_MUX_fi2fl_ce : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_24,
                D1=>XLXN_20,
                S0=>kgainmux,
                O=>fixed2floatce);
   
   CalculatePixOSCpSp_MUX_fi2fl_ond : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_23,
                D1=>XLXN_19,
                S0=>kgainmux,
                O=>fixed2floatond);
   
   CalculatePixOSCpSp_MUX_fi2fl_sclr : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_25,
                D1=>XLXN_21,
                S0=>kgainmux,
                O=>fixed2floatsclr);
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_0 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(0),
                D1=>XLXN_56(0),
                S0=>kgainmux,
                O=>i2c_mem_addra(0));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_1 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(1),
                D1=>XLXN_56(1),
                S0=>kgainmux,
                O=>i2c_mem_addra(1));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_2 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(2),
                D1=>XLXN_56(2),
                S0=>kgainmux,
                O=>i2c_mem_addra(2));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_3 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(3),
                D1=>XLXN_56(3),
                S0=>kgainmux,
                O=>i2c_mem_addra(3));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_4 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(4),
                D1=>XLXN_56(4),
                S0=>kgainmux,
                O=>i2c_mem_addra(4));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_5 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(5),
                D1=>XLXN_56(5),
                S0=>kgainmux,
                O=>i2c_mem_addra(5));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_6 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(6),
                D1=>XLXN_56(6),
                S0=>kgainmux,
                O=>i2c_mem_addra(6));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_7 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(7),
                D1=>XLXN_56(7),
                S0=>kgainmux,
                O=>i2c_mem_addra(7));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_8 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(8),
                D1=>XLXN_56(8),
                S0=>kgainmux,
                O=>i2c_mem_addra(8));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_9 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(9),
                D1=>XLXN_56(9),
                S0=>kgainmux,
                O=>i2c_mem_addra(9));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_10 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(10),
                D1=>XLXN_56(10),
                S0=>kgainmux,
                O=>i2c_mem_addra(10));
   
   CalculatePixOSCpSp_MUX_i2c_mem_addra_11 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(11),
                D1=>XLXN_56(11),
                S0=>kgainmux,
                O=>i2c_mem_addra(11));
   
   CalculatePixOSCpSp_MUX_i2c_mem_ena : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_57,
                D1=>XLXN_55,
                S0=>kgainmux,
                O=>i2c_mem_ena);
   
   CalculatePixOSCpSp_process_p0_inst : CalculatePixOSCpSp_process_p0
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                calculateKGain_KGain(31 downto 0)=>XLXN_59(31 downto 0),
                CalculateKGain_rdy=>XLXN_11,
                divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                fixed2floatr(31 downto 0)=>fixed2floatr(31 downto 0),
                fixed2floatrdy=>fixed2floatrdy,
                i_clock=>i_clock,
                i_const1(31 downto 0)=>i_const1(31 downto 0),
                i_reset=>i_reset,
                i_run=>i_run,
                i_Ta(31 downto 0)=>i_Ta(31 downto 0),
                i_Ta0(31 downto 0)=>i_Ta0(31 downto 0),
                i_Vdd(31 downto 0)=>i_Vdd(31 downto 0),
                i_VddV0(31 downto 0)=>i_VddV0(31 downto 0),
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                mem_signed256_ovalue(31 downto 0)=>XLXN_9(31 downto 0),
                mem_signed1024_ovalue(31 downto 0)=>XLXN_10(31 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                nibble_in1(31 downto 0)=>XLXN_2(31 downto 0),
                nibble_in2(31 downto 0)=>XLXN_4(31 downto 0),
                nibble_in3(31 downto 0)=>XLXN_6(31 downto 0),
                subfpr(31 downto 0)=>subfpr(31 downto 0),
                subfprdy=>subfprdy,
                addfpa(31 downto 0)=>addfpa(31 downto 0),
                addfpb(31 downto 0)=>addfpb(31 downto 0),
                addfpce=>addfpce,
                addfpond=>addfpond,
                addfpsclr=>addfpsclr,
                CalculateKGain_mux=>kgainmux,
                CalculateKGain_run=>XLXN_12,
                divfpa(31 downto 0)=>XLXN_35(31 downto 0),
                divfpb(31 downto 0)=>XLXN_36(31 downto 0),
                divfpce=>XLXN_39,
                divfpond=>XLXN_37,
                divfpsclr=>XLXN_38,
                fixed2floata(63 downto 0)=>XLXN_22(63 downto 0),
                fixed2floatce=>XLXN_24,
                fixed2floatond=>XLXN_23,
                fixed2floatsclr=>XLXN_25,
                i2c_mem_addra(11 downto 0)=>XLXN_58(11 downto 0),
                i2c_mem_ena=>XLXN_57,
                mem_signed256_ivalue(7 downto 0)=>XLXN_7(7 downto 0),
                mem_signed1024_ivalue(9 downto 0)=>XLXN_8(9 downto 0),
                mulfpa(31 downto 0)=>mulfpa(31 downto 0),
                mulfpb(31 downto 0)=>mulfpb(31 downto 0),
                mulfpce=>mulfpce,
                mulfpond=>mulfpond,
                mulfpsclr=>mulfpsclr,
                nibble_out1(5 downto 0)=>XLXN_1(5 downto 0),
                nibble_out2(3 downto 0)=>XLXN_3(3 downto 0),
                nibble_out3(3 downto 0)=>XLXN_5(3 downto 0),
                o_pixoscpsp0(31 downto 0)=>o_pixoscpsp0(31 downto 0),
                o_pixoscpsp1(31 downto 0)=>o_pixoscpsp1(31 downto 0),
                o_rdy=>o_rdy,
                subfpa(31 downto 0)=>subfpa(31 downto 0),
                subfpb(31 downto 0)=>subfpb(31 downto 0),
                subfpce=>subfpce,
                subfpond=>subfpond,
                subfpsclr=>subfpsclr);
   
   CalculatePixOSCpSp_rom_signed6bit : rom_signed6bit
      port map (nibble_in(5 downto 0)=>XLXN_1(5 downto 0),
                nibble_out(31 downto 0)=>XLXN_2(31 downto 0));
   
   CalculatePixOSCpSp_rom_signed8bit : rom_signed8bit_MUSER_CalculatePixOSCpSp
      port map (i_clock=>i_clock,
                i_reset=>i_reset,
                i_value(7 downto 0)=>XLXN_7(7 downto 0),
                o_value(31 downto 0)=>XLXN_9(31 downto 0));
   
   CalculatePixOSCpSp_rom_signed10bit : rom_signed10bit_MUSER_CalculatePixOSCpSp
      port map (address(9 downto 0)=>XLXN_8(9 downto 0),
                i_clock=>i_clock,
                i_reset=>i_reset,
                o_data(31 downto 0)=>XLXN_10(31 downto 0));
   
   CalculatePixOSCpSp_rom_unsigned4bit_2powx : rom_unsigned4bit_2powx
      port map (nibble_in(3 downto 0)=>XLXN_5(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_6(31 downto 0));
   
   CalculatePixOSCpSp_rom_unsigned4bit_2powx8 : rom_unsigned4bit_2powx8
      port map (nibble_in(3 downto 0)=>XLXN_3(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_4(31 downto 0));
   
end BEHAVIORAL;


