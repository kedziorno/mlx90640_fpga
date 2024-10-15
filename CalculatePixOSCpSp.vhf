--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CalculatePixOSCpSp.vhf
-- /___/   /\     Timestamp : 10/15/2024 22:04:25
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculatePixOSCpSp.vhf -w /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculatePixOSCpSp.sch
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
   signal XLXN_2                               : std_logic_vector (14 downto 0);
   signal XLXN_13                              : std_logic;
   signal mem_signed8bit_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal mem_signed8bit_CASCADEINA_openSignal : std_logic;
   signal mem_signed8bit_CASCADEINB_openSignal : std_logic;
   signal mem_signed8bit_CLKB_openSignal       : std_logic;
   signal mem_signed8bit_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal mem_signed8bit_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal mem_signed8bit_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal mem_signed8bit_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal mem_signed8bit_ENB_openSignal        : std_logic;
   signal mem_signed8bit_REGCEA_openSignal     : std_logic;
   signal mem_signed8bit_REGCEB_openSignal     : std_logic;
   signal mem_signed8bit_SSRB_openSignal       : std_logic;
   signal mem_signed8bit_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal mem_signed8bit_WEB_openSignal        : std_logic_vector (3 downto 0);
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
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute WRITE_WIDTH_B of mem_signed8bit : label is "36";
   attribute WRITE_WIDTH_A of mem_signed8bit : label is "36";
   attribute WRITE_MODE_B of mem_signed8bit : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_signed8bit : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_signed8bit : label is "36";
   attribute READ_WIDTH_A of mem_signed8bit : label is "36";
   attribute INIT_1F of mem_signed8bit : label is 
         "bf800000c0000000c0400000c0800000c0a00000c0c00000c0e00000c1000000";
   attribute INIT_1E of mem_signed8bit : label is 
         "c1100000c1200000c1300000c1400000c1500000c1600000c1700000c1800000";
   attribute INIT_1D of mem_signed8bit : label is 
         "c1880000c1900000c1980000c1a00000c1a80000c1b00000c1b80000c1c00000";
   attribute INIT_1C of mem_signed8bit : label is 
         "c1c80000c1d00000c1d80000c1e00000c1e80000c1f00000c1f80000c2000000";
   attribute INIT_1B of mem_signed8bit : label is 
         "c2040000c2080000c20c0000c2100000c2140000c2180000c21c0000c2200000";
   attribute INIT_1A of mem_signed8bit : label is 
         "c2240000c2280000c22c0000c2300000c2340000c2380000c23c0000c2400000";
   attribute INIT_19 of mem_signed8bit : label is 
         "c2440000c2480000c24c0000c2500000c2540000c2580000c25c0000c2600000";
   attribute INIT_18 of mem_signed8bit : label is 
         "c2640000c2680000c26c0000c2700000c2740000c2780000c27c0000c2800000";
   attribute INIT_17 of mem_signed8bit : label is 
         "c2820000c2840000c2860000c2880000c28a0000c28c0000c28e0000c2900000";
   attribute INIT_16 of mem_signed8bit : label is 
         "c2920000c2940000c2960000c2980000c29a0000c29c0000c29e0000c2a00000";
   attribute INIT_15 of mem_signed8bit : label is 
         "c2a20000c2a40000c2a60000c2a80000c2aa0000c2ac0000c2ae0000c2b00000";
   attribute INIT_14 of mem_signed8bit : label is 
         "c2b20000c2b40000c2b60000c2b80000c2ba0000c2bc0000c2be0000c2c00000";
   attribute INIT_13 of mem_signed8bit : label is 
         "c2c20000c2c40000c2c60000c2c80000c2ca0000c2cc0000c2ce0000c2d00000";
   attribute INIT_12 of mem_signed8bit : label is 
         "c2d20000c2d40000c2d60000c2d80000c2da0000c2dc0000c2de0000c2e00000";
   attribute INIT_11 of mem_signed8bit : label is 
         "c2e20000c2e40000c2e60000c2e80000c2ea0000c2ec0000c2ee0000c2f00000";
   attribute INIT_10 of mem_signed8bit : label is 
         "c2f20000c2f40000c2f60000c2f80000c2fa0000c2fc0000c2fe0000c3000000";
   attribute INIT_0F of mem_signed8bit : label is 
         "42fe000042fc000042fa000042f8000042f6000042f4000042f2000042f00000";
   attribute INIT_0E of mem_signed8bit : label is 
         "42ee000042ec000042ea000042e8000042e6000042e4000042e2000042e00000";
   attribute INIT_0D of mem_signed8bit : label is 
         "42de000042dc000042da000042d8000042d6000042d4000042d2000042d00000";
   attribute INIT_0C of mem_signed8bit : label is 
         "42ce000042cc000042ca000042c8000042c6000042c4000042c2000042c00000";
   attribute INIT_0B of mem_signed8bit : label is 
         "42be000042bc000042ba000042b8000042b6000042b4000042b2000042b00000";
   attribute INIT_0A of mem_signed8bit : label is 
         "42ae000042ac000042aa000042a8000042a6000042a4000042a2000042a00000";
   attribute INIT_09 of mem_signed8bit : label is 
         "429e0000429c0000429a00004298000042960000429400004292000042900000";
   attribute INIT_08 of mem_signed8bit : label is 
         "428e0000428c0000428a00004288000042860000428400004282000042800000";
   attribute INIT_07 of mem_signed8bit : label is 
         "427c0000427800004274000042700000426c0000426800004264000042600000";
   attribute INIT_06 of mem_signed8bit : label is 
         "425c0000425800004254000042500000424c0000424800004244000042400000";
   attribute INIT_05 of mem_signed8bit : label is 
         "423c0000423800004234000042300000422c0000422800004224000042200000";
   attribute INIT_04 of mem_signed8bit : label is 
         "421c0000421800004214000042100000420c0000420800004204000042000000";
   attribute INIT_03 of mem_signed8bit : label is 
         "41f8000041f0000041e8000041e0000041d8000041d0000041c8000041c00000";
   attribute INIT_02 of mem_signed8bit : label is 
         "41b8000041b0000041a8000041a0000041980000419000004188000041800000";
   attribute INIT_01 of mem_signed8bit : label is 
         "4170000041600000415000004140000041300000412000004110000041000000";
   attribute INIT_00 of mem_signed8bit : label is 
         "40e0000040c0000040a000004080000040400000400000003f80000000000000";
begin
   mem_signed8bit : RAMB16
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
         x"40e0000040c0000040a000004080000040400000400000003f80000000000000")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_2(14 downto 0),
                ADDRB(14 downto 0)=>mem_signed8bit_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>mem_signed8bit_CASCADEINA_openSignal,
                CASCADEINB=>mem_signed8bit_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_signed8bit_CLKB_openSignal,
                DIA(31 downto 0)=>mem_signed8bit_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>mem_signed8bit_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_signed8bit_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_signed8bit_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_13,
                ENB=>mem_signed8bit_ENB_openSignal,
                REGCEA=>mem_signed8bit_REGCEA_openSignal,
                REGCEB=>mem_signed8bit_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_signed8bit_SSRB_openSignal,
                WEA(3 downto 0)=>mem_signed8bit_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>mem_signed8bit_WEB_openSignal(3 downto 0),
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
   attribute HU_SET              : string ;
   signal XLXN_3                          : std_logic_vector (14 downto 0);
   signal XLXN_4                          : std_logic_vector (14 downto 0);
   signal XLXN_24                         : std_logic;
   signal XLXN_32                         : std_logic_vector (31 downto 0);
   signal XLXN_33                         : std_logic_vector (31 downto 0);
   signal XLXN_38                         : std_logic;
   signal mem_half1_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal mem_half1_CASCADEINA_openSignal : std_logic;
   signal mem_half1_CASCADEINB_openSignal : std_logic;
   signal mem_half1_CLKB_openSignal       : std_logic;
   signal mem_half1_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal mem_half1_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal mem_half1_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal mem_half1_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal mem_half1_REGCEA_openSignal     : std_logic;
   signal mem_half1_REGCEB_openSignal     : std_logic;
   signal mem_half1_SSRB_openSignal       : std_logic;
   signal mem_half1_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal mem_half1_WEB_openSignal        : std_logic_vector (3 downto 0);
   signal mem_half2_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal mem_half2_CASCADEINA_openSignal : std_logic;
   signal mem_half2_CASCADEINB_openSignal : std_logic;
   signal mem_half2_CLKB_openSignal       : std_logic;
   signal mem_half2_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal mem_half2_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal mem_half2_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal mem_half2_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal mem_half2_ENB_openSignal        : std_logic;
   signal mem_half2_REGCEA_openSignal     : std_logic;
   signal mem_half2_REGCEB_openSignal     : std_logic;
   signal mem_half2_SSRB_openSignal       : std_logic;
   signal mem_half2_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal mem_half2_WEB_openSignal        : std_logic_vector (3 downto 0);
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
   
   component M2_1_MXILINX_CalculatePixOSCpSp
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute WRITE_WIDTH_B of mem_half1 : label is "36";
   attribute WRITE_WIDTH_A of mem_half1 : label is "36";
   attribute WRITE_MODE_B of mem_half1 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_half1 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_half1 : label is "36";
   attribute READ_WIDTH_A of mem_half1 : label is "36";
   attribute INIT_3F of mem_half1 : label is 
         "43ff800043ff000043fe800043fe000043fd800043fd000043fc800043fc0000";
   attribute INIT_3E of mem_half1 : label is 
         "43fb800043fb000043fa800043fa000043f9800043f9000043f8800043f80000";
   attribute INIT_3D of mem_half1 : label is 
         "43f7800043f7000043f6800043f6000043f5800043f5000043f4800043f40000";
   attribute INIT_3C of mem_half1 : label is 
         "43f3800043f3000043f2800043f2000043f1800043f1000043f0800043f00000";
   attribute INIT_3B of mem_half1 : label is 
         "43ef800043ef000043ee800043ee000043ed800043ed000043ec800043ec0000";
   attribute INIT_3A of mem_half1 : label is 
         "43eb800043eb000043ea800043ea000043e9800043e9000043e8800043e80000";
   attribute INIT_39 of mem_half1 : label is 
         "43e7800043e7000043e6800043e6000043e5800043e5000043e4800043e40000";
   attribute INIT_38 of mem_half1 : label is 
         "43e3800043e3000043e2800043e2000043e1800043e1000043e0800043e00000";
   attribute INIT_37 of mem_half1 : label is 
         "43df800043df000043de800043de000043dd800043dd000043dc800043dc0000";
   attribute INIT_36 of mem_half1 : label is 
         "43db800043db000043da800043da000043d9800043d9000043d8800043d80000";
   attribute INIT_35 of mem_half1 : label is 
         "43d7800043d7000043d6800043d6000043d5800043d5000043d4800043d40000";
   attribute INIT_34 of mem_half1 : label is 
         "43d3800043d3000043d2800043d2000043d1800043d1000043d0800043d00000";
   attribute INIT_33 of mem_half1 : label is 
         "43cf800043cf000043ce800043ce000043cd800043cd000043cc800043cc0000";
   attribute INIT_32 of mem_half1 : label is 
         "43cb800043cb000043ca800043ca000043c9800043c9000043c8800043c80000";
   attribute INIT_31 of mem_half1 : label is 
         "43c7800043c7000043c6800043c6000043c5800043c5000043c4800043c40000";
   attribute INIT_30 of mem_half1 : label is 
         "43c3800043c3000043c2800043c2000043c1800043c1000043c0800043c00000";
   attribute INIT_2F of mem_half1 : label is 
         "43bf800043bf000043be800043be000043bd800043bd000043bc800043bc0000";
   attribute INIT_2E of mem_half1 : label is 
         "43bb800043bb000043ba800043ba000043b9800043b9000043b8800043b80000";
   attribute INIT_2D of mem_half1 : label is 
         "43b7800043b7000043b6800043b6000043b5800043b5000043b4800043b40000";
   attribute INIT_2C of mem_half1 : label is 
         "43b3800043b3000043b2800043b2000043b1800043b1000043b0800043b00000";
   attribute INIT_2B of mem_half1 : label is 
         "43af800043af000043ae800043ae000043ad800043ad000043ac800043ac0000";
   attribute INIT_2A of mem_half1 : label is 
         "43ab800043ab000043aa800043aa000043a9800043a9000043a8800043a80000";
   attribute INIT_29 of mem_half1 : label is 
         "43a7800043a7000043a6800043a6000043a5800043a5000043a4800043a40000";
   attribute INIT_28 of mem_half1 : label is 
         "43a3800043a3000043a2800043a2000043a1800043a1000043a0800043a00000";
   attribute INIT_27 of mem_half1 : label is 
         "439f8000439f0000439e8000439e0000439d8000439d0000439c8000439c0000";
   attribute INIT_26 of mem_half1 : label is 
         "439b8000439b0000439a8000439a000043998000439900004398800043980000";
   attribute INIT_25 of mem_half1 : label is 
         "4397800043970000439680004396000043958000439500004394800043940000";
   attribute INIT_24 of mem_half1 : label is 
         "4393800043930000439280004392000043918000439100004390800043900000";
   attribute INIT_23 of mem_half1 : label is 
         "438f8000438f0000438e8000438e0000438d8000438d0000438c8000438c0000";
   attribute INIT_22 of mem_half1 : label is 
         "438b8000438b0000438a8000438a000043898000438900004388800043880000";
   attribute INIT_21 of mem_half1 : label is 
         "4387800043870000438680004386000043858000438500004384800043840000";
   attribute INIT_20 of mem_half1 : label is 
         "4383800043830000438280004382000043818000438100004380800043800000";
   attribute INIT_1F of mem_half1 : label is 
         "437f0000437e0000437d0000437c0000437b0000437a00004379000043780000";
   attribute INIT_1E of mem_half1 : label is 
         "4377000043760000437500004374000043730000437200004371000043700000";
   attribute INIT_1D of mem_half1 : label is 
         "436f0000436e0000436d0000436c0000436b0000436a00004369000043680000";
   attribute INIT_1C of mem_half1 : label is 
         "4367000043660000436500004364000043630000436200004361000043600000";
   attribute INIT_1B of mem_half1 : label is 
         "435f0000435e0000435d0000435c0000435b0000435a00004359000043580000";
   attribute INIT_1A of mem_half1 : label is 
         "4357000043560000435500004354000043530000435200004351000043500000";
   attribute INIT_19 of mem_half1 : label is 
         "434f0000434e0000434d0000434c0000434b0000434a00004349000043480000";
   attribute INIT_18 of mem_half1 : label is 
         "4347000043460000434500004344000043430000434200004341000043400000";
   attribute INIT_17 of mem_half1 : label is 
         "433f0000433e0000433d0000433c0000433b0000433a00004339000043380000";
   attribute INIT_16 of mem_half1 : label is 
         "4337000043360000433500004334000043330000433200004331000043300000";
   attribute INIT_15 of mem_half1 : label is 
         "432f0000432e0000432d0000432c0000432b0000432a00004329000043280000";
   attribute INIT_14 of mem_half1 : label is 
         "4327000043260000432500004324000043230000432200004321000043200000";
   attribute INIT_13 of mem_half1 : label is 
         "431f0000431e0000431d0000431c0000431b0000431a00004319000043180000";
   attribute INIT_12 of mem_half1 : label is 
         "4317000043160000431500004314000043130000431200004311000043100000";
   attribute INIT_11 of mem_half1 : label is 
         "430f0000430e0000430d0000430c0000430b0000430a00004309000043080000";
   attribute INIT_10 of mem_half1 : label is 
         "4307000043060000430500004304000043030000430200004301000043000000";
   attribute INIT_0F of mem_half1 : label is 
         "42fe000042fc000042fa000042f8000042f6000042f4000042f2000042f00000";
   attribute INIT_0E of mem_half1 : label is 
         "42ee000042ec000042ea000042e8000042e6000042e4000042e2000042e00000";
   attribute INIT_0D of mem_half1 : label is 
         "42de000042dc000042da000042d8000042d6000042d4000042d2000042d00000";
   attribute INIT_0C of mem_half1 : label is 
         "42ce000042cc000042ca000042c8000042c6000042c4000042c2000042c00000";
   attribute INIT_0B of mem_half1 : label is 
         "42be000042bc000042ba000042b8000042b6000042b4000042b2000042b00000";
   attribute INIT_0A of mem_half1 : label is 
         "42ae000042ac000042aa000042a8000042a6000042a4000042a2000042a00000";
   attribute INIT_09 of mem_half1 : label is 
         "429e0000429c0000429a00004298000042960000429400004292000042900000";
   attribute INIT_08 of mem_half1 : label is 
         "428e0000428c0000428a00004288000042860000428400004282000042800000";
   attribute INIT_07 of mem_half1 : label is 
         "427c0000427800004274000042700000426c0000426800004264000042600000";
   attribute INIT_06 of mem_half1 : label is 
         "425c0000425800004254000042500000424c0000424800004244000042400000";
   attribute INIT_05 of mem_half1 : label is 
         "423c0000423800004234000042300000422c0000422800004224000042200000";
   attribute INIT_04 of mem_half1 : label is 
         "421c0000421800004214000042100000420c0000420800004204000042000000";
   attribute INIT_03 of mem_half1 : label is 
         "41f8000041f0000041e8000041e0000041d8000041d0000041c8000041c00000";
   attribute INIT_02 of mem_half1 : label is 
         "41b8000041b0000041a8000041a0000041980000419000004188000041800000";
   attribute INIT_01 of mem_half1 : label is 
         "4170000041600000415000004140000041300000412000004110000041000000";
   attribute INIT_00 of mem_half1 : label is 
         "40e0000040c0000040a000004080000040400000400000003f80000000000000";
   attribute INIT_3F of mem_half2 : label is 
         "bf800000c0000000c0400000c0800000c0a00000c0c00000c0e00000c1000000";
   attribute INIT_3E of mem_half2 : label is 
         "c1100000c1200000c1300000c1400000c1500000c1600000c1700000c1800000";
   attribute INIT_3D of mem_half2 : label is 
         "c1880000c1900000c1980000c1a00000c1a80000c1b00000c1b80000c1c00000";
   attribute INIT_3C of mem_half2 : label is 
         "c1c80000c1d00000c1d80000c1e00000c1e80000c1f00000c1f80000c2000000";
   attribute INIT_3B of mem_half2 : label is 
         "c2040000c2080000c20c0000c2100000c2140000c2180000c21c0000c2200000";
   attribute INIT_3A of mem_half2 : label is 
         "c2240000c2280000c22c0000c2300000c2340000c2380000c23c0000c2400000";
   attribute INIT_39 of mem_half2 : label is 
         "c2440000c2480000c24c0000c2500000c2540000c2580000c25c0000c2600000";
   attribute INIT_38 of mem_half2 : label is 
         "c2640000c2680000c26c0000c2700000c2740000c2780000c27c0000c2800000";
   attribute INIT_37 of mem_half2 : label is 
         "c2820000c2840000c2860000c2880000c28a0000c28c0000c28e0000c2900000";
   attribute INIT_36 of mem_half2 : label is 
         "c2920000c2940000c2960000c2980000c29a0000c29c0000c29e0000c2a00000";
   attribute INIT_35 of mem_half2 : label is 
         "c2a20000c2a40000c2a60000c2a80000c2aa0000c2ac0000c2ae0000c2b00000";
   attribute INIT_34 of mem_half2 : label is 
         "c2b20000c2b40000c2b60000c2b80000c2ba0000c2bc0000c2be0000c2c00000";
   attribute INIT_33 of mem_half2 : label is 
         "c2c20000c2c40000c2c60000c2c80000c2ca0000c2cc0000c2ce0000c2d00000";
   attribute INIT_32 of mem_half2 : label is 
         "c2d20000c2d40000c2d60000c2d80000c2da0000c2dc0000c2de0000c2e00000";
   attribute INIT_31 of mem_half2 : label is 
         "c2e20000c2e40000c2e60000c2e80000c2ea0000c2ec0000c2ee0000c2f00000";
   attribute INIT_30 of mem_half2 : label is 
         "c2f20000c2f40000c2f60000c2f80000c2fa0000c2fc0000c2fe0000c3000000";
   attribute INIT_2F of mem_half2 : label is 
         "c3010000c3020000c3030000c3040000c3050000c3060000c3070000c3080000";
   attribute INIT_2E of mem_half2 : label is 
         "c3090000c30a0000c30b0000c30c0000c30d0000c30e0000c30f0000c3100000";
   attribute INIT_2D of mem_half2 : label is 
         "c3110000c3120000c3130000c3140000c3150000c3160000c3170000c3180000";
   attribute INIT_2C of mem_half2 : label is 
         "c3190000c31a0000c31b0000c31c0000c31d0000c31e0000c31f0000c3200000";
   attribute INIT_2B of mem_half2 : label is 
         "c3210000c3220000c3230000c3240000c3250000c3260000c3270000c3280000";
   attribute INIT_2A of mem_half2 : label is 
         "c3290000c32a0000c32b0000c32c0000c32d0000c32e0000c32f0000c3300000";
   attribute INIT_29 of mem_half2 : label is 
         "c3310000c3320000c3330000c3340000c3350000c3360000c3370000c3380000";
   attribute INIT_28 of mem_half2 : label is 
         "c3390000c33a0000c33b0000c33c0000c33d0000c33e0000c33f0000c3400000";
   attribute INIT_27 of mem_half2 : label is 
         "c3410000c3420000c3430000c3440000c3450000c3460000c3470000c3480000";
   attribute INIT_26 of mem_half2 : label is 
         "c3490000c34a0000c34b0000c34c0000c34d0000c34e0000c34f0000c3500000";
   attribute INIT_25 of mem_half2 : label is 
         "c3510000c3520000c3530000c3540000c3550000c3560000c3570000c3580000";
   attribute INIT_24 of mem_half2 : label is 
         "c3590000c35a0000c35b0000c35c0000c35d0000c35e0000c35f0000c3600000";
   attribute INIT_23 of mem_half2 : label is 
         "c3610000c3620000c3630000c3640000c3650000c3660000c3670000c3680000";
   attribute INIT_22 of mem_half2 : label is 
         "c3690000c36a0000c36b0000c36c0000c36d0000c36e0000c36f0000c3700000";
   attribute INIT_21 of mem_half2 : label is 
         "c3710000c3720000c3730000c3740000c3750000c3760000c3770000c3780000";
   attribute INIT_20 of mem_half2 : label is 
         "c3790000c37a0000c37b0000c37c0000c37d0000c37e0000c37f0000c3800000";
   attribute INIT_1F of mem_half2 : label is 
         "c3808000c3810000c3818000c3820000c3828000c3830000c3838000c3840000";
   attribute INIT_1E of mem_half2 : label is 
         "c3848000c3850000c3858000c3860000c3868000c3870000c3878000c3880000";
   attribute INIT_1D of mem_half2 : label is 
         "c3888000c3890000c3898000c38a0000c38a8000c38b0000c38b8000c38c0000";
   attribute INIT_1C of mem_half2 : label is 
         "c38c8000c38d0000c38d8000c38e0000c38e8000c38f0000c38f8000c3900000";
   attribute INIT_1B of mem_half2 : label is 
         "c3908000c3910000c3918000c3920000c3928000c3930000c3938000c3940000";
   attribute INIT_1A of mem_half2 : label is 
         "c3948000c3950000c3958000c3960000c3968000c3970000c3978000c3980000";
   attribute INIT_19 of mem_half2 : label is 
         "c3988000c3990000c3998000c39a0000c39a8000c39b0000c39b8000c39c0000";
   attribute INIT_18 of mem_half2 : label is 
         "c39c8000c39d0000c39d8000c39e0000c39e8000c39f0000c39f8000c3a00000";
   attribute INIT_17 of mem_half2 : label is 
         "c3a08000c3a10000c3a18000c3a20000c3a28000c3a30000c3a38000c3a40000";
   attribute INIT_16 of mem_half2 : label is 
         "c3a48000c3a50000c3a58000c3a60000c3a68000c3a70000c3a78000c3a80000";
   attribute INIT_15 of mem_half2 : label is 
         "c3a88000c3a90000c3a98000c3aa0000c3aa8000c3ab0000c3ab8000c3ac0000";
   attribute INIT_14 of mem_half2 : label is 
         "c3ac8000c3ad0000c3ad8000c3ae0000c3ae8000c3af0000c3af8000c3b00000";
   attribute INIT_13 of mem_half2 : label is 
         "c3b08000c3b10000c3b18000c3b20000c3b28000c3b30000c3b38000c3b40000";
   attribute INIT_12 of mem_half2 : label is 
         "c3b48000c3b50000c3b58000c3b60000c3b68000c3b70000c3b78000c3b80000";
   attribute INIT_11 of mem_half2 : label is 
         "c3b88000c3b90000c3b98000c3ba0000c3ba8000c3bb0000c3bb8000c3bc0000";
   attribute INIT_10 of mem_half2 : label is 
         "c3bc8000c3bd0000c3bd8000c3be0000c3be8000c3bf0000c3bf8000c3c00000";
   attribute INIT_0F of mem_half2 : label is 
         "c3c08000c3c10000c3c18000c3c20000c3c28000c3c30000c3c38000c3c40000";
   attribute INIT_0E of mem_half2 : label is 
         "c3c48000c3c50000c3c58000c3c60000c3c68000c3c70000c3c78000c3c80000";
   attribute INIT_0D of mem_half2 : label is 
         "c3c88000c3c90000c3c98000c3ca0000c3ca8000c3cb0000c3cb8000c3cc0000";
   attribute INIT_0C of mem_half2 : label is 
         "c3cc8000c3cd0000c3cd8000c3ce0000c3ce8000c3cf0000c3cf8000c3d00000";
   attribute INIT_0B of mem_half2 : label is 
         "c3d08000c3d10000c3d18000c3d20000c3d28000c3d30000c3d38000c3d40000";
   attribute INIT_0A of mem_half2 : label is 
         "c3d48000c3d50000c3d58000c3d60000c3d68000c3d70000c3d78000c3d80000";
   attribute INIT_09 of mem_half2 : label is 
         "c3d88000c3d90000c3d98000c3da0000c3da8000c3db0000c3db8000c3dc0000";
   attribute INIT_08 of mem_half2 : label is 
         "c3dc8000c3dd0000c3dd8000c3de0000c3de8000c3df0000c3df8000c3e00000";
   attribute INIT_07 of mem_half2 : label is 
         "c3e08000c3e10000c3e18000c3e20000c3e28000c3e30000c3e38000c3e40000";
   attribute INIT_06 of mem_half2 : label is 
         "c3e48000c3e50000c3e58000c3e60000c3e68000c3e70000c3e78000c3e80000";
   attribute INIT_05 of mem_half2 : label is 
         "c3e88000c3e90000c3e98000c3ea0000c3ea8000c3eb0000c3eb8000c3ec0000";
   attribute INIT_04 of mem_half2 : label is 
         "c3ec8000c3ed0000c3ed8000c3ee0000c3ee8000c3ef0000c3ef8000c3f00000";
   attribute INIT_03 of mem_half2 : label is 
         "c3f08000c3f10000c3f18000c3f20000c3f28000c3f30000c3f38000c3f40000";
   attribute INIT_02 of mem_half2 : label is 
         "c3f48000c3f50000c3f58000c3f60000c3f68000c3f70000c3f78000c3f80000";
   attribute INIT_01 of mem_half2 : label is 
         "c3f88000c3f90000c3f98000c3fa0000c3fa8000c3fb0000c3fb8000c3fc0000";
   attribute INIT_00 of mem_half2 : label is 
         "c3fc8000c3fd0000c3fd8000c3fe0000c3fe8000c3ff0000c3ff8000c4000000";
   attribute WRITE_WIDTH_B of mem_half2 : label is "36";
   attribute WRITE_WIDTH_A of mem_half2 : label is "36";
   attribute WRITE_MODE_B of mem_half2 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_half2 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_half2 : label is "36";
   attribute READ_WIDTH_A of mem_half2 : label is "36";
   attribute HU_SET of XLXI_16_0 : label is "XLXI_16_0_2322";
   attribute HU_SET of XLXI_16_1 : label is "XLXI_16_1_2321";
   attribute HU_SET of XLXI_16_2 : label is "XLXI_16_2_2320";
   attribute HU_SET of XLXI_16_3 : label is "XLXI_16_3_2319";
   attribute HU_SET of XLXI_16_4 : label is "XLXI_16_4_2318";
   attribute HU_SET of XLXI_16_5 : label is "XLXI_16_5_2317";
   attribute HU_SET of XLXI_16_6 : label is "XLXI_16_6_2316";
   attribute HU_SET of XLXI_16_7 : label is "XLXI_16_7_2315";
   attribute HU_SET of XLXI_16_8 : label is "XLXI_16_8_2314";
   attribute HU_SET of XLXI_16_9 : label is "XLXI_16_9_2313";
   attribute HU_SET of XLXI_16_10 : label is "XLXI_16_10_2312";
   attribute HU_SET of XLXI_16_11 : label is "XLXI_16_11_2311";
   attribute HU_SET of XLXI_16_12 : label is "XLXI_16_12_2310";
   attribute HU_SET of XLXI_16_13 : label is "XLXI_16_13_2309";
   attribute HU_SET of XLXI_16_14 : label is "XLXI_16_14_2308";
   attribute HU_SET of XLXI_16_15 : label is "XLXI_16_15_2307";
   attribute HU_SET of XLXI_16_16 : label is "XLXI_16_16_2306";
   attribute HU_SET of XLXI_16_17 : label is "XLXI_16_17_2305";
   attribute HU_SET of XLXI_16_18 : label is "XLXI_16_18_2304";
   attribute HU_SET of XLXI_16_19 : label is "XLXI_16_19_2303";
   attribute HU_SET of XLXI_16_20 : label is "XLXI_16_20_2302";
   attribute HU_SET of XLXI_16_21 : label is "XLXI_16_21_2301";
   attribute HU_SET of XLXI_16_22 : label is "XLXI_16_22_2300";
   attribute HU_SET of XLXI_16_23 : label is "XLXI_16_23_2299";
   attribute HU_SET of XLXI_16_24 : label is "XLXI_16_24_2298";
   attribute HU_SET of XLXI_16_25 : label is "XLXI_16_25_2297";
   attribute HU_SET of XLXI_16_26 : label is "XLXI_16_26_2296";
   attribute HU_SET of XLXI_16_27 : label is "XLXI_16_27_2295";
   attribute HU_SET of XLXI_16_28 : label is "XLXI_16_28_2294";
   attribute HU_SET of XLXI_16_29 : label is "XLXI_16_29_2293";
   attribute HU_SET of XLXI_16_30 : label is "XLXI_16_30_2292";
   attribute HU_SET of XLXI_16_31 : label is "XLXI_16_31_2291";
begin
   mem_half1 : RAMB16
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
         x"40e0000040c0000040a000004080000040400000400000003f80000000000000")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_3(14 downto 0),
                ADDRB(14 downto 0)=>mem_half1_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>mem_half1_CASCADEINA_openSignal,
                CASCADEINB=>mem_half1_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_half1_CLKB_openSignal,
                DIA(31 downto 0)=>mem_half1_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>mem_half1_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_half1_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_half1_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_24,
                ENB=>XLXN_38,
                REGCEA=>mem_half1_REGCEA_openSignal,
                REGCEB=>mem_half1_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_half1_SSRB_openSignal,
                WEA(3 downto 0)=>mem_half1_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>mem_half1_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_32(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   mem_half2 : RAMB16
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
                ADDRB(14 downto 0)=>mem_half2_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>mem_half2_CASCADEINA_openSignal,
                CASCADEINB=>mem_half2_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_half2_CLKB_openSignal,
                DIA(31 downto 0)=>mem_half2_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>mem_half2_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_half2_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_half2_DIPB_openSignal(3 downto 0),
                ENA=>address(9),
                ENB=>mem_half2_ENB_openSignal,
                REGCEA=>mem_half2_REGCEA_openSignal,
                REGCEB=>mem_half2_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_half2_SSRB_openSignal,
                WEA(3 downto 0)=>mem_half2_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>mem_half2_WEB_openSignal(3 downto 0),
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
   
   XLXI_16_0 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(0),
                D1=>XLXN_33(0),
                S0=>address(9),
                O=>o_data(0));
   
   XLXI_16_1 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(1),
                D1=>XLXN_33(1),
                S0=>address(9),
                O=>o_data(1));
   
   XLXI_16_2 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(2),
                D1=>XLXN_33(2),
                S0=>address(9),
                O=>o_data(2));
   
   XLXI_16_3 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(3),
                D1=>XLXN_33(3),
                S0=>address(9),
                O=>o_data(3));
   
   XLXI_16_4 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(4),
                D1=>XLXN_33(4),
                S0=>address(9),
                O=>o_data(4));
   
   XLXI_16_5 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(5),
                D1=>XLXN_33(5),
                S0=>address(9),
                O=>o_data(5));
   
   XLXI_16_6 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(6),
                D1=>XLXN_33(6),
                S0=>address(9),
                O=>o_data(6));
   
   XLXI_16_7 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(7),
                D1=>XLXN_33(7),
                S0=>address(9),
                O=>o_data(7));
   
   XLXI_16_8 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(8),
                D1=>XLXN_33(8),
                S0=>address(9),
                O=>o_data(8));
   
   XLXI_16_9 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(9),
                D1=>XLXN_33(9),
                S0=>address(9),
                O=>o_data(9));
   
   XLXI_16_10 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(10),
                D1=>XLXN_33(10),
                S0=>address(9),
                O=>o_data(10));
   
   XLXI_16_11 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(11),
                D1=>XLXN_33(11),
                S0=>address(9),
                O=>o_data(11));
   
   XLXI_16_12 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(12),
                D1=>XLXN_33(12),
                S0=>address(9),
                O=>o_data(12));
   
   XLXI_16_13 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(13),
                D1=>XLXN_33(13),
                S0=>address(9),
                O=>o_data(13));
   
   XLXI_16_14 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(14),
                D1=>XLXN_33(14),
                S0=>address(9),
                O=>o_data(14));
   
   XLXI_16_15 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(15),
                D1=>XLXN_33(15),
                S0=>address(9),
                O=>o_data(15));
   
   XLXI_16_16 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(16),
                D1=>XLXN_33(16),
                S0=>address(9),
                O=>o_data(16));
   
   XLXI_16_17 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(17),
                D1=>XLXN_33(17),
                S0=>address(9),
                O=>o_data(17));
   
   XLXI_16_18 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(18),
                D1=>XLXN_33(18),
                S0=>address(9),
                O=>o_data(18));
   
   XLXI_16_19 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(19),
                D1=>XLXN_33(19),
                S0=>address(9),
                O=>o_data(19));
   
   XLXI_16_20 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(20),
                D1=>XLXN_33(20),
                S0=>address(9),
                O=>o_data(20));
   
   XLXI_16_21 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(21),
                D1=>XLXN_33(21),
                S0=>address(9),
                O=>o_data(21));
   
   XLXI_16_22 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(22),
                D1=>XLXN_33(22),
                S0=>address(9),
                O=>o_data(22));
   
   XLXI_16_23 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(23),
                D1=>XLXN_33(23),
                S0=>address(9),
                O=>o_data(23));
   
   XLXI_16_24 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(24),
                D1=>XLXN_33(24),
                S0=>address(9),
                O=>o_data(24));
   
   XLXI_16_25 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(25),
                D1=>XLXN_33(25),
                S0=>address(9),
                O=>o_data(25));
   
   XLXI_16_26 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(26),
                D1=>XLXN_33(26),
                S0=>address(9),
                O=>o_data(26));
   
   XLXI_16_27 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(27),
                D1=>XLXN_33(27),
                S0=>address(9),
                O=>o_data(27));
   
   XLXI_16_28 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(28),
                D1=>XLXN_33(28),
                S0=>address(9),
                O=>o_data(28));
   
   XLXI_16_29 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(29),
                D1=>XLXN_33(29),
                S0=>address(9),
                O=>o_data(29));
   
   XLXI_16_30 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(30),
                D1=>XLXN_33(30),
                S0=>address(9),
                O=>o_data(30));
   
   XLXI_16_31 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_32(31),
                D1=>XLXN_33(31),
                S0=>address(9),
                O=>o_data(31));
   
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
   component rom_unsigned4bit_2powx
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_unsigned4bit_2powx8
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed10bit_MUSER_CalculatePixOSCpSp
      port ( address : in    std_logic_vector (9 downto 0); 
             i_clock : in    std_logic; 
             i_reset : in    std_logic; 
             o_data  : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed8bit_MUSER_CalculatePixOSCpSp
      port ( i_value : in    std_logic_vector (7 downto 0); 
             i_clock : in    std_logic; 
             i_reset : in    std_logic; 
             o_value : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed6bit
      port ( nibble_in  : in    std_logic_vector (5 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
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
   
   component M2_1_MXILINX_CalculatePixOSCpSp
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_14_0 : label is "XLXI_14_0_2386";
   attribute HU_SET of XLXI_14_1 : label is "XLXI_14_1_2385";
   attribute HU_SET of XLXI_14_2 : label is "XLXI_14_2_2384";
   attribute HU_SET of XLXI_14_3 : label is "XLXI_14_3_2383";
   attribute HU_SET of XLXI_14_4 : label is "XLXI_14_4_2382";
   attribute HU_SET of XLXI_14_5 : label is "XLXI_14_5_2381";
   attribute HU_SET of XLXI_14_6 : label is "XLXI_14_6_2380";
   attribute HU_SET of XLXI_14_7 : label is "XLXI_14_7_2379";
   attribute HU_SET of XLXI_14_8 : label is "XLXI_14_8_2378";
   attribute HU_SET of XLXI_14_9 : label is "XLXI_14_9_2377";
   attribute HU_SET of XLXI_14_10 : label is "XLXI_14_10_2376";
   attribute HU_SET of XLXI_14_11 : label is "XLXI_14_11_2375";
   attribute HU_SET of XLXI_14_12 : label is "XLXI_14_12_2374";
   attribute HU_SET of XLXI_14_13 : label is "XLXI_14_13_2373";
   attribute HU_SET of XLXI_14_14 : label is "XLXI_14_14_2372";
   attribute HU_SET of XLXI_14_15 : label is "XLXI_14_15_2371";
   attribute HU_SET of XLXI_14_16 : label is "XLXI_14_16_2370";
   attribute HU_SET of XLXI_14_17 : label is "XLXI_14_17_2369";
   attribute HU_SET of XLXI_14_18 : label is "XLXI_14_18_2368";
   attribute HU_SET of XLXI_14_19 : label is "XLXI_14_19_2367";
   attribute HU_SET of XLXI_14_20 : label is "XLXI_14_20_2366";
   attribute HU_SET of XLXI_14_21 : label is "XLXI_14_21_2365";
   attribute HU_SET of XLXI_14_22 : label is "XLXI_14_22_2364";
   attribute HU_SET of XLXI_14_23 : label is "XLXI_14_23_2363";
   attribute HU_SET of XLXI_14_24 : label is "XLXI_14_24_2362";
   attribute HU_SET of XLXI_14_25 : label is "XLXI_14_25_2361";
   attribute HU_SET of XLXI_14_26 : label is "XLXI_14_26_2360";
   attribute HU_SET of XLXI_14_27 : label is "XLXI_14_27_2359";
   attribute HU_SET of XLXI_14_28 : label is "XLXI_14_28_2358";
   attribute HU_SET of XLXI_14_29 : label is "XLXI_14_29_2357";
   attribute HU_SET of XLXI_14_30 : label is "XLXI_14_30_2356";
   attribute HU_SET of XLXI_14_31 : label is "XLXI_14_31_2355";
   attribute HU_SET of XLXI_14_32 : label is "XLXI_14_32_2354";
   attribute HU_SET of XLXI_14_33 : label is "XLXI_14_33_2353";
   attribute HU_SET of XLXI_14_34 : label is "XLXI_14_34_2352";
   attribute HU_SET of XLXI_14_35 : label is "XLXI_14_35_2351";
   attribute HU_SET of XLXI_14_36 : label is "XLXI_14_36_2350";
   attribute HU_SET of XLXI_14_37 : label is "XLXI_14_37_2349";
   attribute HU_SET of XLXI_14_38 : label is "XLXI_14_38_2348";
   attribute HU_SET of XLXI_14_39 : label is "XLXI_14_39_2347";
   attribute HU_SET of XLXI_14_40 : label is "XLXI_14_40_2346";
   attribute HU_SET of XLXI_14_41 : label is "XLXI_14_41_2345";
   attribute HU_SET of XLXI_14_42 : label is "XLXI_14_42_2344";
   attribute HU_SET of XLXI_14_43 : label is "XLXI_14_43_2343";
   attribute HU_SET of XLXI_14_44 : label is "XLXI_14_44_2342";
   attribute HU_SET of XLXI_14_45 : label is "XLXI_14_45_2341";
   attribute HU_SET of XLXI_14_46 : label is "XLXI_14_46_2340";
   attribute HU_SET of XLXI_14_47 : label is "XLXI_14_47_2339";
   attribute HU_SET of XLXI_14_48 : label is "XLXI_14_48_2338";
   attribute HU_SET of XLXI_14_49 : label is "XLXI_14_49_2337";
   attribute HU_SET of XLXI_14_50 : label is "XLXI_14_50_2336";
   attribute HU_SET of XLXI_14_51 : label is "XLXI_14_51_2335";
   attribute HU_SET of XLXI_14_52 : label is "XLXI_14_52_2334";
   attribute HU_SET of XLXI_14_53 : label is "XLXI_14_53_2333";
   attribute HU_SET of XLXI_14_54 : label is "XLXI_14_54_2332";
   attribute HU_SET of XLXI_14_55 : label is "XLXI_14_55_2331";
   attribute HU_SET of XLXI_14_56 : label is "XLXI_14_56_2330";
   attribute HU_SET of XLXI_14_57 : label is "XLXI_14_57_2329";
   attribute HU_SET of XLXI_14_58 : label is "XLXI_14_58_2328";
   attribute HU_SET of XLXI_14_59 : label is "XLXI_14_59_2327";
   attribute HU_SET of XLXI_14_60 : label is "XLXI_14_60_2326";
   attribute HU_SET of XLXI_14_61 : label is "XLXI_14_61_2325";
   attribute HU_SET of XLXI_14_62 : label is "XLXI_14_62_2324";
   attribute HU_SET of XLXI_14_63 : label is "XLXI_14_63_2323";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_2387";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_2388";
   attribute HU_SET of XLXI_17 : label is "XLXI_17_2389";
   attribute HU_SET of XLXI_18_0 : label is "XLXI_18_0_2421";
   attribute HU_SET of XLXI_18_1 : label is "XLXI_18_1_2420";
   attribute HU_SET of XLXI_18_2 : label is "XLXI_18_2_2419";
   attribute HU_SET of XLXI_18_3 : label is "XLXI_18_3_2418";
   attribute HU_SET of XLXI_18_4 : label is "XLXI_18_4_2417";
   attribute HU_SET of XLXI_18_5 : label is "XLXI_18_5_2416";
   attribute HU_SET of XLXI_18_6 : label is "XLXI_18_6_2415";
   attribute HU_SET of XLXI_18_7 : label is "XLXI_18_7_2414";
   attribute HU_SET of XLXI_18_8 : label is "XLXI_18_8_2413";
   attribute HU_SET of XLXI_18_9 : label is "XLXI_18_9_2412";
   attribute HU_SET of XLXI_18_10 : label is "XLXI_18_10_2411";
   attribute HU_SET of XLXI_18_11 : label is "XLXI_18_11_2410";
   attribute HU_SET of XLXI_18_12 : label is "XLXI_18_12_2409";
   attribute HU_SET of XLXI_18_13 : label is "XLXI_18_13_2408";
   attribute HU_SET of XLXI_18_14 : label is "XLXI_18_14_2407";
   attribute HU_SET of XLXI_18_15 : label is "XLXI_18_15_2406";
   attribute HU_SET of XLXI_18_16 : label is "XLXI_18_16_2405";
   attribute HU_SET of XLXI_18_17 : label is "XLXI_18_17_2404";
   attribute HU_SET of XLXI_18_18 : label is "XLXI_18_18_2403";
   attribute HU_SET of XLXI_18_19 : label is "XLXI_18_19_2402";
   attribute HU_SET of XLXI_18_20 : label is "XLXI_18_20_2401";
   attribute HU_SET of XLXI_18_21 : label is "XLXI_18_21_2400";
   attribute HU_SET of XLXI_18_22 : label is "XLXI_18_22_2399";
   attribute HU_SET of XLXI_18_23 : label is "XLXI_18_23_2398";
   attribute HU_SET of XLXI_18_24 : label is "XLXI_18_24_2397";
   attribute HU_SET of XLXI_18_25 : label is "XLXI_18_25_2396";
   attribute HU_SET of XLXI_18_26 : label is "XLXI_18_26_2395";
   attribute HU_SET of XLXI_18_27 : label is "XLXI_18_27_2394";
   attribute HU_SET of XLXI_18_28 : label is "XLXI_18_28_2393";
   attribute HU_SET of XLXI_18_29 : label is "XLXI_18_29_2392";
   attribute HU_SET of XLXI_18_30 : label is "XLXI_18_30_2391";
   attribute HU_SET of XLXI_18_31 : label is "XLXI_18_31_2390";
   attribute HU_SET of XLXI_19_0 : label is "XLXI_19_0_2453";
   attribute HU_SET of XLXI_19_1 : label is "XLXI_19_1_2452";
   attribute HU_SET of XLXI_19_2 : label is "XLXI_19_2_2451";
   attribute HU_SET of XLXI_19_3 : label is "XLXI_19_3_2450";
   attribute HU_SET of XLXI_19_4 : label is "XLXI_19_4_2449";
   attribute HU_SET of XLXI_19_5 : label is "XLXI_19_5_2448";
   attribute HU_SET of XLXI_19_6 : label is "XLXI_19_6_2447";
   attribute HU_SET of XLXI_19_7 : label is "XLXI_19_7_2446";
   attribute HU_SET of XLXI_19_8 : label is "XLXI_19_8_2445";
   attribute HU_SET of XLXI_19_9 : label is "XLXI_19_9_2444";
   attribute HU_SET of XLXI_19_10 : label is "XLXI_19_10_2443";
   attribute HU_SET of XLXI_19_11 : label is "XLXI_19_11_2442";
   attribute HU_SET of XLXI_19_12 : label is "XLXI_19_12_2441";
   attribute HU_SET of XLXI_19_13 : label is "XLXI_19_13_2440";
   attribute HU_SET of XLXI_19_14 : label is "XLXI_19_14_2439";
   attribute HU_SET of XLXI_19_15 : label is "XLXI_19_15_2438";
   attribute HU_SET of XLXI_19_16 : label is "XLXI_19_16_2437";
   attribute HU_SET of XLXI_19_17 : label is "XLXI_19_17_2436";
   attribute HU_SET of XLXI_19_18 : label is "XLXI_19_18_2435";
   attribute HU_SET of XLXI_19_19 : label is "XLXI_19_19_2434";
   attribute HU_SET of XLXI_19_20 : label is "XLXI_19_20_2433";
   attribute HU_SET of XLXI_19_21 : label is "XLXI_19_21_2432";
   attribute HU_SET of XLXI_19_22 : label is "XLXI_19_22_2431";
   attribute HU_SET of XLXI_19_23 : label is "XLXI_19_23_2430";
   attribute HU_SET of XLXI_19_24 : label is "XLXI_19_24_2429";
   attribute HU_SET of XLXI_19_25 : label is "XLXI_19_25_2428";
   attribute HU_SET of XLXI_19_26 : label is "XLXI_19_26_2427";
   attribute HU_SET of XLXI_19_27 : label is "XLXI_19_27_2426";
   attribute HU_SET of XLXI_19_28 : label is "XLXI_19_28_2425";
   attribute HU_SET of XLXI_19_29 : label is "XLXI_19_29_2424";
   attribute HU_SET of XLXI_19_30 : label is "XLXI_19_30_2423";
   attribute HU_SET of XLXI_19_31 : label is "XLXI_19_31_2422";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_2454";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_2455";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_2456";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_2457";
   attribute HU_SET of XLXI_24_0 : label is "XLXI_24_0_2469";
   attribute HU_SET of XLXI_24_1 : label is "XLXI_24_1_2468";
   attribute HU_SET of XLXI_24_2 : label is "XLXI_24_2_2467";
   attribute HU_SET of XLXI_24_3 : label is "XLXI_24_3_2466";
   attribute HU_SET of XLXI_24_4 : label is "XLXI_24_4_2465";
   attribute HU_SET of XLXI_24_5 : label is "XLXI_24_5_2464";
   attribute HU_SET of XLXI_24_6 : label is "XLXI_24_6_2463";
   attribute HU_SET of XLXI_24_7 : label is "XLXI_24_7_2462";
   attribute HU_SET of XLXI_24_8 : label is "XLXI_24_8_2461";
   attribute HU_SET of XLXI_24_9 : label is "XLXI_24_9_2460";
   attribute HU_SET of XLXI_24_10 : label is "XLXI_24_10_2459";
   attribute HU_SET of XLXI_24_11 : label is "XLXI_24_11_2458";
begin
   XLXI_1 : rom_unsigned4bit_2powx
      port map (nibble_in(3 downto 0)=>XLXN_5(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_6(31 downto 0));
   
   XLXI_2 : rom_unsigned4bit_2powx8
      port map (nibble_in(3 downto 0)=>XLXN_3(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_4(31 downto 0));
   
   XLXI_4 : rom_signed10bit_MUSER_CalculatePixOSCpSp
      port map (address(9 downto 0)=>XLXN_8(9 downto 0),
                i_clock=>i_clock,
                i_reset=>i_reset,
                o_data(31 downto 0)=>XLXN_10(31 downto 0));
   
   XLXI_5 : rom_signed8bit_MUSER_CalculatePixOSCpSp
      port map (i_clock=>i_clock,
                i_reset=>i_reset,
                i_value(7 downto 0)=>XLXN_7(7 downto 0),
                o_value(31 downto 0)=>XLXN_9(31 downto 0));
   
   XLXI_6 : rom_signed6bit
      port map (nibble_in(5 downto 0)=>XLXN_1(5 downto 0),
                nibble_out(31 downto 0)=>XLXN_2(31 downto 0));
   
   XLXI_7 : CalculateKGain_process_p0
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
   
   XLXI_13 : CalculatePixOSCpSp_process_p0
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
   
   XLXI_14_0 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(0),
                D1=>XLXN_18(0),
                S0=>kgainmux,
                O=>fixed2floata(0));
   
   XLXI_14_1 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(1),
                D1=>XLXN_18(1),
                S0=>kgainmux,
                O=>fixed2floata(1));
   
   XLXI_14_2 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(2),
                D1=>XLXN_18(2),
                S0=>kgainmux,
                O=>fixed2floata(2));
   
   XLXI_14_3 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(3),
                D1=>XLXN_18(3),
                S0=>kgainmux,
                O=>fixed2floata(3));
   
   XLXI_14_4 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(4),
                D1=>XLXN_18(4),
                S0=>kgainmux,
                O=>fixed2floata(4));
   
   XLXI_14_5 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(5),
                D1=>XLXN_18(5),
                S0=>kgainmux,
                O=>fixed2floata(5));
   
   XLXI_14_6 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(6),
                D1=>XLXN_18(6),
                S0=>kgainmux,
                O=>fixed2floata(6));
   
   XLXI_14_7 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(7),
                D1=>XLXN_18(7),
                S0=>kgainmux,
                O=>fixed2floata(7));
   
   XLXI_14_8 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(8),
                D1=>XLXN_18(8),
                S0=>kgainmux,
                O=>fixed2floata(8));
   
   XLXI_14_9 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(9),
                D1=>XLXN_18(9),
                S0=>kgainmux,
                O=>fixed2floata(9));
   
   XLXI_14_10 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(10),
                D1=>XLXN_18(10),
                S0=>kgainmux,
                O=>fixed2floata(10));
   
   XLXI_14_11 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(11),
                D1=>XLXN_18(11),
                S0=>kgainmux,
                O=>fixed2floata(11));
   
   XLXI_14_12 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(12),
                D1=>XLXN_18(12),
                S0=>kgainmux,
                O=>fixed2floata(12));
   
   XLXI_14_13 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(13),
                D1=>XLXN_18(13),
                S0=>kgainmux,
                O=>fixed2floata(13));
   
   XLXI_14_14 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(14),
                D1=>XLXN_18(14),
                S0=>kgainmux,
                O=>fixed2floata(14));
   
   XLXI_14_15 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(15),
                D1=>XLXN_18(15),
                S0=>kgainmux,
                O=>fixed2floata(15));
   
   XLXI_14_16 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(16),
                D1=>XLXN_18(16),
                S0=>kgainmux,
                O=>fixed2floata(16));
   
   XLXI_14_17 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(17),
                D1=>XLXN_18(17),
                S0=>kgainmux,
                O=>fixed2floata(17));
   
   XLXI_14_18 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(18),
                D1=>XLXN_18(18),
                S0=>kgainmux,
                O=>fixed2floata(18));
   
   XLXI_14_19 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(19),
                D1=>XLXN_18(19),
                S0=>kgainmux,
                O=>fixed2floata(19));
   
   XLXI_14_20 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(20),
                D1=>XLXN_18(20),
                S0=>kgainmux,
                O=>fixed2floata(20));
   
   XLXI_14_21 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(21),
                D1=>XLXN_18(21),
                S0=>kgainmux,
                O=>fixed2floata(21));
   
   XLXI_14_22 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(22),
                D1=>XLXN_18(22),
                S0=>kgainmux,
                O=>fixed2floata(22));
   
   XLXI_14_23 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(23),
                D1=>XLXN_18(23),
                S0=>kgainmux,
                O=>fixed2floata(23));
   
   XLXI_14_24 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(24),
                D1=>XLXN_18(24),
                S0=>kgainmux,
                O=>fixed2floata(24));
   
   XLXI_14_25 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(25),
                D1=>XLXN_18(25),
                S0=>kgainmux,
                O=>fixed2floata(25));
   
   XLXI_14_26 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(26),
                D1=>XLXN_18(26),
                S0=>kgainmux,
                O=>fixed2floata(26));
   
   XLXI_14_27 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(27),
                D1=>XLXN_18(27),
                S0=>kgainmux,
                O=>fixed2floata(27));
   
   XLXI_14_28 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(28),
                D1=>XLXN_18(28),
                S0=>kgainmux,
                O=>fixed2floata(28));
   
   XLXI_14_29 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(29),
                D1=>XLXN_18(29),
                S0=>kgainmux,
                O=>fixed2floata(29));
   
   XLXI_14_30 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(30),
                D1=>XLXN_18(30),
                S0=>kgainmux,
                O=>fixed2floata(30));
   
   XLXI_14_31 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(31),
                D1=>XLXN_18(31),
                S0=>kgainmux,
                O=>fixed2floata(31));
   
   XLXI_14_32 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(32),
                D1=>XLXN_18(32),
                S0=>kgainmux,
                O=>fixed2floata(32));
   
   XLXI_14_33 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(33),
                D1=>XLXN_18(33),
                S0=>kgainmux,
                O=>fixed2floata(33));
   
   XLXI_14_34 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(34),
                D1=>XLXN_18(34),
                S0=>kgainmux,
                O=>fixed2floata(34));
   
   XLXI_14_35 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(35),
                D1=>XLXN_18(35),
                S0=>kgainmux,
                O=>fixed2floata(35));
   
   XLXI_14_36 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(36),
                D1=>XLXN_18(36),
                S0=>kgainmux,
                O=>fixed2floata(36));
   
   XLXI_14_37 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(37),
                D1=>XLXN_18(37),
                S0=>kgainmux,
                O=>fixed2floata(37));
   
   XLXI_14_38 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(38),
                D1=>XLXN_18(38),
                S0=>kgainmux,
                O=>fixed2floata(38));
   
   XLXI_14_39 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(39),
                D1=>XLXN_18(39),
                S0=>kgainmux,
                O=>fixed2floata(39));
   
   XLXI_14_40 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(40),
                D1=>XLXN_18(40),
                S0=>kgainmux,
                O=>fixed2floata(40));
   
   XLXI_14_41 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(41),
                D1=>XLXN_18(41),
                S0=>kgainmux,
                O=>fixed2floata(41));
   
   XLXI_14_42 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(42),
                D1=>XLXN_18(42),
                S0=>kgainmux,
                O=>fixed2floata(42));
   
   XLXI_14_43 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(43),
                D1=>XLXN_18(43),
                S0=>kgainmux,
                O=>fixed2floata(43));
   
   XLXI_14_44 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(44),
                D1=>XLXN_18(44),
                S0=>kgainmux,
                O=>fixed2floata(44));
   
   XLXI_14_45 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(45),
                D1=>XLXN_18(45),
                S0=>kgainmux,
                O=>fixed2floata(45));
   
   XLXI_14_46 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(46),
                D1=>XLXN_18(46),
                S0=>kgainmux,
                O=>fixed2floata(46));
   
   XLXI_14_47 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(47),
                D1=>XLXN_18(47),
                S0=>kgainmux,
                O=>fixed2floata(47));
   
   XLXI_14_48 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(48),
                D1=>XLXN_18(48),
                S0=>kgainmux,
                O=>fixed2floata(48));
   
   XLXI_14_49 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(49),
                D1=>XLXN_18(49),
                S0=>kgainmux,
                O=>fixed2floata(49));
   
   XLXI_14_50 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(50),
                D1=>XLXN_18(50),
                S0=>kgainmux,
                O=>fixed2floata(50));
   
   XLXI_14_51 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(51),
                D1=>XLXN_18(51),
                S0=>kgainmux,
                O=>fixed2floata(51));
   
   XLXI_14_52 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(52),
                D1=>XLXN_18(52),
                S0=>kgainmux,
                O=>fixed2floata(52));
   
   XLXI_14_53 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(53),
                D1=>XLXN_18(53),
                S0=>kgainmux,
                O=>fixed2floata(53));
   
   XLXI_14_54 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(54),
                D1=>XLXN_18(54),
                S0=>kgainmux,
                O=>fixed2floata(54));
   
   XLXI_14_55 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(55),
                D1=>XLXN_18(55),
                S0=>kgainmux,
                O=>fixed2floata(55));
   
   XLXI_14_56 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(56),
                D1=>XLXN_18(56),
                S0=>kgainmux,
                O=>fixed2floata(56));
   
   XLXI_14_57 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(57),
                D1=>XLXN_18(57),
                S0=>kgainmux,
                O=>fixed2floata(57));
   
   XLXI_14_58 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(58),
                D1=>XLXN_18(58),
                S0=>kgainmux,
                O=>fixed2floata(58));
   
   XLXI_14_59 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(59),
                D1=>XLXN_18(59),
                S0=>kgainmux,
                O=>fixed2floata(59));
   
   XLXI_14_60 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(60),
                D1=>XLXN_18(60),
                S0=>kgainmux,
                O=>fixed2floata(60));
   
   XLXI_14_61 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(61),
                D1=>XLXN_18(61),
                S0=>kgainmux,
                O=>fixed2floata(61));
   
   XLXI_14_62 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(62),
                D1=>XLXN_18(62),
                S0=>kgainmux,
                O=>fixed2floata(62));
   
   XLXI_14_63 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_22(63),
                D1=>XLXN_18(63),
                S0=>kgainmux,
                O=>fixed2floata(63));
   
   XLXI_15 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_23,
                D1=>XLXN_19,
                S0=>kgainmux,
                O=>fixed2floatond);
   
   XLXI_16 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_24,
                D1=>XLXN_20,
                S0=>kgainmux,
                O=>fixed2floatce);
   
   XLXI_17 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_25,
                D1=>XLXN_21,
                S0=>kgainmux,
                O=>fixed2floatsclr);
   
   XLXI_18_0 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(0),
                D1=>XLXN_30(0),
                S0=>kgainmux,
                O=>divfpa(0));
   
   XLXI_18_1 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(1),
                D1=>XLXN_30(1),
                S0=>kgainmux,
                O=>divfpa(1));
   
   XLXI_18_2 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(2),
                D1=>XLXN_30(2),
                S0=>kgainmux,
                O=>divfpa(2));
   
   XLXI_18_3 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(3),
                D1=>XLXN_30(3),
                S0=>kgainmux,
                O=>divfpa(3));
   
   XLXI_18_4 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(4),
                D1=>XLXN_30(4),
                S0=>kgainmux,
                O=>divfpa(4));
   
   XLXI_18_5 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(5),
                D1=>XLXN_30(5),
                S0=>kgainmux,
                O=>divfpa(5));
   
   XLXI_18_6 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(6),
                D1=>XLXN_30(6),
                S0=>kgainmux,
                O=>divfpa(6));
   
   XLXI_18_7 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(7),
                D1=>XLXN_30(7),
                S0=>kgainmux,
                O=>divfpa(7));
   
   XLXI_18_8 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(8),
                D1=>XLXN_30(8),
                S0=>kgainmux,
                O=>divfpa(8));
   
   XLXI_18_9 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(9),
                D1=>XLXN_30(9),
                S0=>kgainmux,
                O=>divfpa(9));
   
   XLXI_18_10 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(10),
                D1=>XLXN_30(10),
                S0=>kgainmux,
                O=>divfpa(10));
   
   XLXI_18_11 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(11),
                D1=>XLXN_30(11),
                S0=>kgainmux,
                O=>divfpa(11));
   
   XLXI_18_12 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(12),
                D1=>XLXN_30(12),
                S0=>kgainmux,
                O=>divfpa(12));
   
   XLXI_18_13 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(13),
                D1=>XLXN_30(13),
                S0=>kgainmux,
                O=>divfpa(13));
   
   XLXI_18_14 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(14),
                D1=>XLXN_30(14),
                S0=>kgainmux,
                O=>divfpa(14));
   
   XLXI_18_15 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(15),
                D1=>XLXN_30(15),
                S0=>kgainmux,
                O=>divfpa(15));
   
   XLXI_18_16 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(16),
                D1=>XLXN_30(16),
                S0=>kgainmux,
                O=>divfpa(16));
   
   XLXI_18_17 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(17),
                D1=>XLXN_30(17),
                S0=>kgainmux,
                O=>divfpa(17));
   
   XLXI_18_18 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(18),
                D1=>XLXN_30(18),
                S0=>kgainmux,
                O=>divfpa(18));
   
   XLXI_18_19 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(19),
                D1=>XLXN_30(19),
                S0=>kgainmux,
                O=>divfpa(19));
   
   XLXI_18_20 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(20),
                D1=>XLXN_30(20),
                S0=>kgainmux,
                O=>divfpa(20));
   
   XLXI_18_21 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(21),
                D1=>XLXN_30(21),
                S0=>kgainmux,
                O=>divfpa(21));
   
   XLXI_18_22 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(22),
                D1=>XLXN_30(22),
                S0=>kgainmux,
                O=>divfpa(22));
   
   XLXI_18_23 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(23),
                D1=>XLXN_30(23),
                S0=>kgainmux,
                O=>divfpa(23));
   
   XLXI_18_24 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(24),
                D1=>XLXN_30(24),
                S0=>kgainmux,
                O=>divfpa(24));
   
   XLXI_18_25 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(25),
                D1=>XLXN_30(25),
                S0=>kgainmux,
                O=>divfpa(25));
   
   XLXI_18_26 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(26),
                D1=>XLXN_30(26),
                S0=>kgainmux,
                O=>divfpa(26));
   
   XLXI_18_27 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(27),
                D1=>XLXN_30(27),
                S0=>kgainmux,
                O=>divfpa(27));
   
   XLXI_18_28 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(28),
                D1=>XLXN_30(28),
                S0=>kgainmux,
                O=>divfpa(28));
   
   XLXI_18_29 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(29),
                D1=>XLXN_30(29),
                S0=>kgainmux,
                O=>divfpa(29));
   
   XLXI_18_30 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(30),
                D1=>XLXN_30(30),
                S0=>kgainmux,
                O=>divfpa(30));
   
   XLXI_18_31 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_35(31),
                D1=>XLXN_30(31),
                S0=>kgainmux,
                O=>divfpa(31));
   
   XLXI_19_0 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(0),
                D1=>XLXN_31(0),
                S0=>kgainmux,
                O=>divfpb(0));
   
   XLXI_19_1 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(1),
                D1=>XLXN_31(1),
                S0=>kgainmux,
                O=>divfpb(1));
   
   XLXI_19_2 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(2),
                D1=>XLXN_31(2),
                S0=>kgainmux,
                O=>divfpb(2));
   
   XLXI_19_3 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(3),
                D1=>XLXN_31(3),
                S0=>kgainmux,
                O=>divfpb(3));
   
   XLXI_19_4 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(4),
                D1=>XLXN_31(4),
                S0=>kgainmux,
                O=>divfpb(4));
   
   XLXI_19_5 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(5),
                D1=>XLXN_31(5),
                S0=>kgainmux,
                O=>divfpb(5));
   
   XLXI_19_6 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(6),
                D1=>XLXN_31(6),
                S0=>kgainmux,
                O=>divfpb(6));
   
   XLXI_19_7 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(7),
                D1=>XLXN_31(7),
                S0=>kgainmux,
                O=>divfpb(7));
   
   XLXI_19_8 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(8),
                D1=>XLXN_31(8),
                S0=>kgainmux,
                O=>divfpb(8));
   
   XLXI_19_9 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(9),
                D1=>XLXN_31(9),
                S0=>kgainmux,
                O=>divfpb(9));
   
   XLXI_19_10 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(10),
                D1=>XLXN_31(10),
                S0=>kgainmux,
                O=>divfpb(10));
   
   XLXI_19_11 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(11),
                D1=>XLXN_31(11),
                S0=>kgainmux,
                O=>divfpb(11));
   
   XLXI_19_12 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(12),
                D1=>XLXN_31(12),
                S0=>kgainmux,
                O=>divfpb(12));
   
   XLXI_19_13 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(13),
                D1=>XLXN_31(13),
                S0=>kgainmux,
                O=>divfpb(13));
   
   XLXI_19_14 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(14),
                D1=>XLXN_31(14),
                S0=>kgainmux,
                O=>divfpb(14));
   
   XLXI_19_15 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(15),
                D1=>XLXN_31(15),
                S0=>kgainmux,
                O=>divfpb(15));
   
   XLXI_19_16 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(16),
                D1=>XLXN_31(16),
                S0=>kgainmux,
                O=>divfpb(16));
   
   XLXI_19_17 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(17),
                D1=>XLXN_31(17),
                S0=>kgainmux,
                O=>divfpb(17));
   
   XLXI_19_18 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(18),
                D1=>XLXN_31(18),
                S0=>kgainmux,
                O=>divfpb(18));
   
   XLXI_19_19 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(19),
                D1=>XLXN_31(19),
                S0=>kgainmux,
                O=>divfpb(19));
   
   XLXI_19_20 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(20),
                D1=>XLXN_31(20),
                S0=>kgainmux,
                O=>divfpb(20));
   
   XLXI_19_21 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(21),
                D1=>XLXN_31(21),
                S0=>kgainmux,
                O=>divfpb(21));
   
   XLXI_19_22 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(22),
                D1=>XLXN_31(22),
                S0=>kgainmux,
                O=>divfpb(22));
   
   XLXI_19_23 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(23),
                D1=>XLXN_31(23),
                S0=>kgainmux,
                O=>divfpb(23));
   
   XLXI_19_24 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(24),
                D1=>XLXN_31(24),
                S0=>kgainmux,
                O=>divfpb(24));
   
   XLXI_19_25 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(25),
                D1=>XLXN_31(25),
                S0=>kgainmux,
                O=>divfpb(25));
   
   XLXI_19_26 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(26),
                D1=>XLXN_31(26),
                S0=>kgainmux,
                O=>divfpb(26));
   
   XLXI_19_27 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(27),
                D1=>XLXN_31(27),
                S0=>kgainmux,
                O=>divfpb(27));
   
   XLXI_19_28 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(28),
                D1=>XLXN_31(28),
                S0=>kgainmux,
                O=>divfpb(28));
   
   XLXI_19_29 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(29),
                D1=>XLXN_31(29),
                S0=>kgainmux,
                O=>divfpb(29));
   
   XLXI_19_30 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(30),
                D1=>XLXN_31(30),
                S0=>kgainmux,
                O=>divfpb(30));
   
   XLXI_19_31 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_36(31),
                D1=>XLXN_31(31),
                S0=>kgainmux,
                O=>divfpb(31));
   
   XLXI_20 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_37,
                D1=>XLXN_32,
                S0=>kgainmux,
                O=>divfpond);
   
   XLXI_21 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_38,
                D1=>XLXN_33,
                S0=>kgainmux,
                O=>divfpsclr);
   
   XLXI_22 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_39,
                D1=>XLXN_34,
                S0=>kgainmux,
                O=>divfpce);
   
   XLXI_23 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_57,
                D1=>XLXN_55,
                S0=>kgainmux,
                O=>i2c_mem_ena);
   
   XLXI_24_0 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(0),
                D1=>XLXN_56(0),
                S0=>kgainmux,
                O=>i2c_mem_addra(0));
   
   XLXI_24_1 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(1),
                D1=>XLXN_56(1),
                S0=>kgainmux,
                O=>i2c_mem_addra(1));
   
   XLXI_24_2 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(2),
                D1=>XLXN_56(2),
                S0=>kgainmux,
                O=>i2c_mem_addra(2));
   
   XLXI_24_3 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(3),
                D1=>XLXN_56(3),
                S0=>kgainmux,
                O=>i2c_mem_addra(3));
   
   XLXI_24_4 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(4),
                D1=>XLXN_56(4),
                S0=>kgainmux,
                O=>i2c_mem_addra(4));
   
   XLXI_24_5 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(5),
                D1=>XLXN_56(5),
                S0=>kgainmux,
                O=>i2c_mem_addra(5));
   
   XLXI_24_6 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(6),
                D1=>XLXN_56(6),
                S0=>kgainmux,
                O=>i2c_mem_addra(6));
   
   XLXI_24_7 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(7),
                D1=>XLXN_56(7),
                S0=>kgainmux,
                O=>i2c_mem_addra(7));
   
   XLXI_24_8 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(8),
                D1=>XLXN_56(8),
                S0=>kgainmux,
                O=>i2c_mem_addra(8));
   
   XLXI_24_9 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(9),
                D1=>XLXN_56(9),
                S0=>kgainmux,
                O=>i2c_mem_addra(9));
   
   XLXI_24_10 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(10),
                D1=>XLXN_56(10),
                S0=>kgainmux,
                O=>i2c_mem_addra(10));
   
   XLXI_24_11 : M2_1_MXILINX_CalculatePixOSCpSp
      port map (D0=>XLXN_58(11),
                D1=>XLXN_56(11),
                S0=>kgainmux,
                O=>i2c_mem_addra(11));
   
end BEHAVIORAL;


