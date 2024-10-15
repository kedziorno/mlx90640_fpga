--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CalculateTo.vhf
-- /___/   /\     Timestamp : 10/15/2024 22:04:26
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculateTo.vhf -w /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculateTo.sch
--Design Name: CalculateTo
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

entity M2_1_MXILINX_CalculateTo is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_CalculateTo;

architecture BEHAVIORAL of M2_1_MXILINX_CalculateTo is
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

entity rom_signed8bit_MUSER_CalculateTo is
   port ( i_clock : in    std_logic; 
          i_reset : in    std_logic; 
          i_value : in    std_logic_vector (7 downto 0); 
          o_value : out   std_logic_vector (31 downto 0));
end rom_signed8bit_MUSER_CalculateTo;

architecture BEHAVIORAL of rom_signed8bit_MUSER_CalculateTo is
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

entity ExtractKsToScaleParameter_MUSER_CalculateTo is
   port ( i_clock       : in    std_logic; 
          i_reset       : in    std_logic; 
          i_run         : in    std_logic; 
          i2c_mem_douta : in    std_logic_vector (7 downto 0); 
          i2c_mem_addra : out   std_logic_vector (11 downto 0); 
          i2c_mem_ena   : out   std_logic; 
          o_kstoscale   : out   std_logic_vector (31 downto 0); 
          o_rdy         : out   std_logic);
end ExtractKsToScaleParameter_MUSER_CalculateTo;

architecture BEHAVIORAL of ExtractKsToScaleParameter_MUSER_CalculateTo is
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
   signal XLXN_1                              : std_logic_vector (14 downto 0);
   signal XLXN_10                             : std_logic;
   signal XLXN_20                             : std_logic_vector (31 downto 0);
   signal ROM_KSTOSCALE_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal ROM_KSTOSCALE_CASCADEINA_openSignal : std_logic;
   signal ROM_KSTOSCALE_CASCADEINB_openSignal : std_logic;
   signal ROM_KSTOSCALE_CLKB_openSignal       : std_logic;
   signal ROM_KSTOSCALE_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_KSTOSCALE_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_KSTOSCALE_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_KSTOSCALE_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_KSTOSCALE_ENB_openSignal        : std_logic;
   signal ROM_KSTOSCALE_REGCEA_openSignal     : std_logic;
   signal ROM_KSTOSCALE_REGCEB_openSignal     : std_logic;
   signal ROM_KSTOSCALE_SSRB_openSignal       : std_logic;
   signal ROM_KSTOSCALE_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal ROM_KSTOSCALE_WEB_openSignal        : std_logic_vector (3 downto 0);
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
   
   component ExtractKsToScaleParameter_process_p0
      port ( i_clock           : in    std_logic; 
             i_reset           : in    std_logic; 
             i_run             : in    std_logic; 
             i2c_mem_douta     : in    std_logic_vector (7 downto 0); 
             odata_kstoscale   : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena       : out   std_logic; 
             o_rdy             : out   std_logic; 
             i2c_mem_addra     : out   std_logic_vector (11 downto 0); 
             address_kstoscale : out   std_logic_vector (3 downto 0); 
             o_kstoscale       : out   std_logic_vector (31 downto 0));
   end component;
   
   attribute INIT_00 of ROM_KSTOSCALE : label is 
         "4700000046800000460000004580000045000000448000004400000043800000";
   attribute INIT_01 of ROM_KSTOSCALE : label is 
         "4b0000004a8000004a0000004980000049000000488000004800000047800000";
   attribute WRITE_WIDTH_B of ROM_KSTOSCALE : label is "36";
   attribute WRITE_WIDTH_A of ROM_KSTOSCALE : label is "36";
   attribute WRITE_MODE_B of ROM_KSTOSCALE : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_KSTOSCALE : label is "READ_FIRST";
   attribute READ_WIDTH_B of ROM_KSTOSCALE : label is "36";
   attribute READ_WIDTH_A of ROM_KSTOSCALE : label is "36";
begin
   ROM_KSTOSCALE : RAMB16
   -- synopsys translate_off
   generic map( INIT_00 => 
         x"4700000046800000460000004580000045000000448000004400000043800000",
            INIT_01 => 
         x"4b0000004a8000004a0000004980000049000000488000004800000047800000",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_1(14 downto 0),
                ADDRB(14 downto 0)=>ROM_KSTOSCALE_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>ROM_KSTOSCALE_CASCADEINA_openSignal,
                CASCADEINB=>ROM_KSTOSCALE_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>ROM_KSTOSCALE_CLKB_openSignal,
                DIA(31 downto 0)=>ROM_KSTOSCALE_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>ROM_KSTOSCALE_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>ROM_KSTOSCALE_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>ROM_KSTOSCALE_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_10,
                ENB=>ROM_KSTOSCALE_ENB_openSignal,
                REGCEA=>ROM_KSTOSCALE_REGCEA_openSignal,
                REGCEB=>ROM_KSTOSCALE_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>ROM_KSTOSCALE_SSRB_openSignal,
                WEA(3 downto 0)=>ROM_KSTOSCALE_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>ROM_KSTOSCALE_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_20(31 downto 0),
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
   
   XLXI_6 : ExtractKsToScaleParameter_process_p0
      port map (i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                odata_kstoscale(31 downto 0)=>XLXN_20(31 downto 0),
                address_kstoscale(3 downto 0)=>XLXN_1(8 downto 5),
                i2c_mem_addra(11 downto 0)=>i2c_mem_addra(11 downto 0),
                i2c_mem_ena=>i2c_mem_ena,
                o_kstoscale(31 downto 0)=>o_kstoscale(31 downto 0),
                o_rdy=>o_rdy);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CalculateTo is
   port ( addfpr                : in    std_logic_vector (31 downto 0); 
          addfprdy              : in    std_logic; 
          divfpr                : in    std_logic_vector (31 downto 0); 
          divfprdy              : in    std_logic; 
          i_addr                : in    std_logic_vector (9 downto 0); 
          i_alphacomp_do        : in    std_logic_vector (31 downto 0); 
          i_clock               : in    std_logic; 
          i_reset               : in    std_logic; 
          i_run                 : in    std_logic; 
          i_Ta                  : in    std_logic_vector (31 downto 0); 
          i_vircompensated_do   : in    std_logic_vector (31 downto 0); 
          i2c_mem_douta         : in    std_logic_vector (7 downto 0); 
          mulfpr                : in    std_logic_vector (31 downto 0); 
          mulfprdy              : in    std_logic; 
          sqrtfp2r              : in    std_logic_vector (31 downto 0); 
          sqrtfp2rdy            : in    std_logic; 
          subfpr                : in    std_logic_vector (31 downto 0); 
          subfprdy              : in    std_logic; 
          addfpa                : out   std_logic_vector (31 downto 0); 
          addfpb                : out   std_logic_vector (31 downto 0); 
          addfpce               : out   std_logic; 
          addfpond              : out   std_logic; 
          addfpsclr             : out   std_logic; 
          divfpa                : out   std_logic_vector (31 downto 0); 
          divfpb                : out   std_logic_vector (31 downto 0); 
          divfpce               : out   std_logic; 
          divfpond              : out   std_logic; 
          divfpsclr             : out   std_logic; 
          i2c_mem_addra         : out   std_logic_vector (11 downto 0); 
          i2c_mem_ena           : out   std_logic; 
          mulfpa                : out   std_logic_vector (31 downto 0); 
          mulfpb                : out   std_logic_vector (31 downto 0); 
          mulfpce               : out   std_logic; 
          mulfpond              : out   std_logic; 
          mulfpsclr             : out   std_logic; 
          o_alphacomp_addr      : out   std_logic_vector (9 downto 0); 
          o_do                  : out   std_logic_vector (31 downto 0); 
          o_rdy                 : out   std_logic; 
          o_vircompensated_addr : out   std_logic_vector (9 downto 0); 
          sqrtfp2a              : out   std_logic_vector (31 downto 0); 
          sqrtfp2ce             : out   std_logic; 
          sqrtfp2ond            : out   std_logic; 
          sqrtfp2sclr           : out   std_logic; 
          subfpa                : out   std_logic_vector (31 downto 0); 
          subfpb                : out   std_logic_vector (31 downto 0); 
          subfpce               : out   std_logic; 
          subfpond              : out   std_logic; 
          subfpsclr             : out   std_logic);
end CalculateTo;

architecture BEHAVIORAL of CalculateTo is
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
   signal mux_addr1                      : std_logic_vector (9 downto 0);
   signal XLXN_44                        : std_logic_vector (14 downto 0);
   signal XLXN_45                        : std_logic_vector (14 downto 0);
   signal XLXN_59                        : std_logic;
   signal XLXN_78                        : std_logic_vector (31 downto 0);
   signal XLXN_79                        : std_logic_vector (31 downto 0);
   signal XLXN_139                       : std_logic_vector (3 downto 0);
   signal XLXN_239                       : std_logic_vector (31 downto 0);
   signal XLXN_241                       : std_logic_vector (9 downto 0);
   signal XLXN_269                       : std_logic;
   signal XLXN_270                       : std_logic;
   signal XLXN_275                       : std_logic_vector (7 downto 0);
   signal XLXN_276                       : std_logic_vector (31 downto 0);
   signal XLXN_277                       : std_logic_vector (31 downto 0);
   signal XLXN_278                       : std_logic;
   signal XLXN_279                       : std_logic;
   signal XLXN_280                       : std_logic_vector (11 downto 0);
   signal XLXN_281                       : std_logic_vector (11 downto 0);
   signal XLXN_282                       : std_logic;
   signal XLXN_288                       : std_logic;
   signal o_rdy_DUMMY                    : std_logic;
   signal mem_To_1_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal mem_To_1_CASCADEINA_openSignal : std_logic;
   signal mem_To_1_CASCADEINB_openSignal : std_logic;
   signal mem_To_1_CLKB_openSignal       : std_logic;
   signal mem_To_1_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal mem_To_1_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal mem_To_1_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal mem_To_1_ENB_openSignal        : std_logic;
   signal mem_To_1_REGCEA_openSignal     : std_logic;
   signal mem_To_1_REGCEB_openSignal     : std_logic;
   signal mem_To_1_SSRB_openSignal       : std_logic;
   signal mem_To_1_WEB_openSignal        : std_logic_vector (3 downto 0);
   signal mem_To_2_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal mem_To_2_CASCADEINA_openSignal : std_logic;
   signal mem_To_2_CASCADEINB_openSignal : std_logic;
   signal mem_To_2_CLKB_openSignal       : std_logic;
   signal mem_To_2_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal mem_To_2_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal mem_To_2_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal mem_To_2_ENB_openSignal        : std_logic;
   signal mem_To_2_REGCEA_openSignal     : std_logic;
   signal mem_To_2_REGCEB_openSignal     : std_logic;
   signal mem_To_2_SSRB_openSignal       : std_logic;
   signal mem_To_2_WEB_openSignal        : std_logic_vector (3 downto 0);
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
   
   component M2_1_MXILINX_CalculateTo
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component ExtractKsToScaleParameter_MUSER_CalculateTo
      port ( i_clock       : in    std_logic; 
             i_reset       : in    std_logic; 
             i_run         : in    std_logic; 
             i2c_mem_douta : in    std_logic_vector (7 downto 0); 
             i2c_mem_ena   : out   std_logic; 
             o_rdy         : out   std_logic; 
             i2c_mem_addra : out   std_logic_vector (11 downto 0); 
             o_kstoscale   : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed8bit_MUSER_CalculateTo
      port ( i_value : in    std_logic_vector (7 downto 0); 
             i_clock : in    std_logic; 
             i_reset : in    std_logic; 
             o_value : out   std_logic_vector (31 downto 0));
   end component;
   
   component CalculateTo_process_p0
      port ( i_clock                             : in    std_logic; 
             i_reset                             : in    std_logic; 
             i_run                               : in    std_logic; 
             ExtractKsToScaleParameter_rdy       : in    std_logic; 
             divfprdy                            : in    std_logic; 
             mulfprdy                            : in    std_logic; 
             addfprdy                            : in    std_logic; 
             subfprdy                            : in    std_logic; 
             sqrtfp2rdy                          : in    std_logic; 
             i2c_mem_douta                       : in    std_logic_vector (7 
            downto 0); 
             i_Ta                                : in    std_logic_vector (31 
            downto 0); 
             i_vircompensated_do                 : in    std_logic_vector (31 
            downto 0); 
             i_alphacomp_do                      : in    std_logic_vector (31 
            downto 0); 
             ExtractKsToScaleParameter_kstoscale : in    std_logic_vector (31 
            downto 0); 
             mem_signed256_ovalue                : in    std_logic_vector (31 
            downto 0); 
             divfpr                              : in    std_logic_vector (31 
            downto 0); 
             mulfpr                              : in    std_logic_vector (31 
            downto 0); 
             addfpr                              : in    std_logic_vector (31 
            downto 0); 
             subfpr                              : in    std_logic_vector (31 
            downto 0); 
             sqrtfp2r                            : in    std_logic_vector (31 
            downto 0); 
             i2c_mem_ena                         : out   std_logic; 
             o_write_enable                      : out   std_logic; 
             ExtractKsToScaleParameter_run       : out   std_logic; 
             ExtractKsToScaleParameter_mux       : out   std_logic; 
             o_rdy                               : out   std_logic; 
             divfpond                            : out   std_logic; 
             divfpsclr                           : out   std_logic; 
             divfpce                             : out   std_logic; 
             mulfpond                            : out   std_logic; 
             mulfpsclr                           : out   std_logic; 
             mulfpce                             : out   std_logic; 
             addfpond                            : out   std_logic; 
             addfpsclr                           : out   std_logic; 
             addfpce                             : out   std_logic; 
             subfpond                            : out   std_logic; 
             subfpsclr                           : out   std_logic; 
             subfpce                             : out   std_logic; 
             sqrtfp2ond                          : out   std_logic; 
             sqrtfp2sclr                         : out   std_logic; 
             sqrtfp2ce                           : out   std_logic; 
             i2c_mem_addra                       : out   std_logic_vector (11 
            downto 0); 
             o_vircompensated_addr               : out   std_logic_vector (9 
            downto 0); 
             o_alphacomp_addr                    : out   std_logic_vector (9 
            downto 0); 
             o_addra                             : out   std_logic_vector (9 
            downto 0); 
             o_dia                               : out   std_logic_vector (31 
            downto 0); 
             mem_signed256_ivalue                : out   std_logic_vector (7 
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
            downto 0); 
             sqrtfp2a                            : out   std_logic_vector (31 
            downto 0));
   end component;
   
   attribute WRITE_WIDTH_B of mem_To_1 : label is "36";
   attribute WRITE_WIDTH_A of mem_To_1 : label is "36";
   attribute WRITE_MODE_B of mem_To_1 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_To_1 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_To_1 : label is "36";
   attribute READ_WIDTH_A of mem_To_1 : label is "36";
   attribute WRITE_WIDTH_B of mem_To_2 : label is "36";
   attribute WRITE_WIDTH_A of mem_To_2 : label is "36";
   attribute WRITE_MODE_B of mem_To_2 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_To_2 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_To_2 : label is "36";
   attribute READ_WIDTH_A of mem_To_2 : label is "36";
   attribute HU_SET of MUX_ADDR_0 : label is "MUX_ADDR_0_2532";
   attribute HU_SET of MUX_ADDR_1 : label is "MUX_ADDR_1_2531";
   attribute HU_SET of MUX_ADDR_2 : label is "MUX_ADDR_2_2530";
   attribute HU_SET of MUX_ADDR_3 : label is "MUX_ADDR_3_2529";
   attribute HU_SET of MUX_ADDR_4 : label is "MUX_ADDR_4_2528";
   attribute HU_SET of MUX_ADDR_5 : label is "MUX_ADDR_5_2527";
   attribute HU_SET of MUX_ADDR_6 : label is "MUX_ADDR_6_2526";
   attribute HU_SET of MUX_ADDR_7 : label is "MUX_ADDR_7_2525";
   attribute HU_SET of MUX_ADDR_8 : label is "MUX_ADDR_8_2524";
   attribute HU_SET of MUX_ADDR_9 : label is "MUX_ADDR_9_2523";
   attribute HU_SET of MUX_DO_0 : label is "MUX_DO_0_2522";
   attribute HU_SET of MUX_DO_1 : label is "MUX_DO_1_2521";
   attribute HU_SET of MUX_DO_2 : label is "MUX_DO_2_2520";
   attribute HU_SET of MUX_DO_3 : label is "MUX_DO_3_2519";
   attribute HU_SET of MUX_DO_4 : label is "MUX_DO_4_2518";
   attribute HU_SET of MUX_DO_5 : label is "MUX_DO_5_2517";
   attribute HU_SET of MUX_DO_6 : label is "MUX_DO_6_2516";
   attribute HU_SET of MUX_DO_7 : label is "MUX_DO_7_2515";
   attribute HU_SET of MUX_DO_8 : label is "MUX_DO_8_2514";
   attribute HU_SET of MUX_DO_9 : label is "MUX_DO_9_2513";
   attribute HU_SET of MUX_DO_10 : label is "MUX_DO_10_2512";
   attribute HU_SET of MUX_DO_11 : label is "MUX_DO_11_2511";
   attribute HU_SET of MUX_DO_12 : label is "MUX_DO_12_2510";
   attribute HU_SET of MUX_DO_13 : label is "MUX_DO_13_2509";
   attribute HU_SET of MUX_DO_14 : label is "MUX_DO_14_2508";
   attribute HU_SET of MUX_DO_15 : label is "MUX_DO_15_2507";
   attribute HU_SET of MUX_DO_16 : label is "MUX_DO_16_2506";
   attribute HU_SET of MUX_DO_17 : label is "MUX_DO_17_2505";
   attribute HU_SET of MUX_DO_18 : label is "MUX_DO_18_2504";
   attribute HU_SET of MUX_DO_19 : label is "MUX_DO_19_2503";
   attribute HU_SET of MUX_DO_20 : label is "MUX_DO_20_2502";
   attribute HU_SET of MUX_DO_21 : label is "MUX_DO_21_2501";
   attribute HU_SET of MUX_DO_22 : label is "MUX_DO_22_2500";
   attribute HU_SET of MUX_DO_23 : label is "MUX_DO_23_2499";
   attribute HU_SET of MUX_DO_24 : label is "MUX_DO_24_2498";
   attribute HU_SET of MUX_DO_25 : label is "MUX_DO_25_2497";
   attribute HU_SET of MUX_DO_26 : label is "MUX_DO_26_2496";
   attribute HU_SET of MUX_DO_27 : label is "MUX_DO_27_2495";
   attribute HU_SET of MUX_DO_28 : label is "MUX_DO_28_2494";
   attribute HU_SET of MUX_DO_29 : label is "MUX_DO_29_2493";
   attribute HU_SET of MUX_DO_30 : label is "MUX_DO_30_2492";
   attribute HU_SET of MUX_DO_31 : label is "MUX_DO_31_2491";
   attribute HU_SET of XLXI_61 : label is "XLXI_61_2533";
   attribute HU_SET of XLXI_62_0 : label is "XLXI_62_0_2545";
   attribute HU_SET of XLXI_62_1 : label is "XLXI_62_1_2544";
   attribute HU_SET of XLXI_62_2 : label is "XLXI_62_2_2543";
   attribute HU_SET of XLXI_62_3 : label is "XLXI_62_3_2542";
   attribute HU_SET of XLXI_62_4 : label is "XLXI_62_4_2541";
   attribute HU_SET of XLXI_62_5 : label is "XLXI_62_5_2540";
   attribute HU_SET of XLXI_62_6 : label is "XLXI_62_6_2539";
   attribute HU_SET of XLXI_62_7 : label is "XLXI_62_7_2538";
   attribute HU_SET of XLXI_62_8 : label is "XLXI_62_8_2537";
   attribute HU_SET of XLXI_62_9 : label is "XLXI_62_9_2536";
   attribute HU_SET of XLXI_62_10 : label is "XLXI_62_10_2535";
   attribute HU_SET of XLXI_62_11 : label is "XLXI_62_11_2534";
begin
   o_rdy <= o_rdy_DUMMY;
   mem_To_1 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_44(14 downto 0),
                ADDRB(14 downto 0)=>mem_To_1_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>mem_To_1_CASCADEINA_openSignal,
                CASCADEINB=>mem_To_1_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_To_1_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_239(31 downto 0),
                DIB(31 downto 0)=>mem_To_1_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_To_1_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_To_1_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_59,
                ENB=>mem_To_1_ENB_openSignal,
                REGCEA=>mem_To_1_REGCEA_openSignal,
                REGCEB=>mem_To_1_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_To_1_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_To_1_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_79(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   mem_To_2 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_45(14 downto 0),
                ADDRB(14 downto 0)=>mem_To_2_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>mem_To_2_CASCADEINA_openSignal,
                CASCADEINB=>mem_To_2_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_To_2_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_239(31 downto 0),
                DIB(31 downto 0)=>mem_To_2_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_To_2_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_To_2_DIPB_openSignal(3 downto 0),
                ENA=>mux_addr1(9),
                ENB=>mem_To_2_ENB_openSignal,
                REGCEA=>mem_To_2_REGCEA_openSignal,
                REGCEB=>mem_To_2_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_To_2_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_To_2_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_78(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   MUX_ADDR_0 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_241(0),
                D1=>i_addr(0),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(0));
   
   MUX_ADDR_1 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_241(1),
                D1=>i_addr(1),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(1));
   
   MUX_ADDR_2 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_241(2),
                D1=>i_addr(2),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(2));
   
   MUX_ADDR_3 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_241(3),
                D1=>i_addr(3),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(3));
   
   MUX_ADDR_4 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_241(4),
                D1=>i_addr(4),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(4));
   
   MUX_ADDR_5 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_241(5),
                D1=>i_addr(5),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(5));
   
   MUX_ADDR_6 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_241(6),
                D1=>i_addr(6),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(6));
   
   MUX_ADDR_7 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_241(7),
                D1=>i_addr(7),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(7));
   
   MUX_ADDR_8 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_241(8),
                D1=>i_addr(8),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(8));
   
   MUX_ADDR_9 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_241(9),
                D1=>i_addr(9),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(9));
   
   MUX_DO_0 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(0),
                D1=>XLXN_78(0),
                S0=>mux_addr1(9),
                O=>o_do(0));
   
   MUX_DO_1 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(1),
                D1=>XLXN_78(1),
                S0=>mux_addr1(9),
                O=>o_do(1));
   
   MUX_DO_2 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(2),
                D1=>XLXN_78(2),
                S0=>mux_addr1(9),
                O=>o_do(2));
   
   MUX_DO_3 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(3),
                D1=>XLXN_78(3),
                S0=>mux_addr1(9),
                O=>o_do(3));
   
   MUX_DO_4 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(4),
                D1=>XLXN_78(4),
                S0=>mux_addr1(9),
                O=>o_do(4));
   
   MUX_DO_5 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(5),
                D1=>XLXN_78(5),
                S0=>mux_addr1(9),
                O=>o_do(5));
   
   MUX_DO_6 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(6),
                D1=>XLXN_78(6),
                S0=>mux_addr1(9),
                O=>o_do(6));
   
   MUX_DO_7 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(7),
                D1=>XLXN_78(7),
                S0=>mux_addr1(9),
                O=>o_do(7));
   
   MUX_DO_8 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(8),
                D1=>XLXN_78(8),
                S0=>mux_addr1(9),
                O=>o_do(8));
   
   MUX_DO_9 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(9),
                D1=>XLXN_78(9),
                S0=>mux_addr1(9),
                O=>o_do(9));
   
   MUX_DO_10 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(10),
                D1=>XLXN_78(10),
                S0=>mux_addr1(9),
                O=>o_do(10));
   
   MUX_DO_11 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(11),
                D1=>XLXN_78(11),
                S0=>mux_addr1(9),
                O=>o_do(11));
   
   MUX_DO_12 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(12),
                D1=>XLXN_78(12),
                S0=>mux_addr1(9),
                O=>o_do(12));
   
   MUX_DO_13 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(13),
                D1=>XLXN_78(13),
                S0=>mux_addr1(9),
                O=>o_do(13));
   
   MUX_DO_14 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(14),
                D1=>XLXN_78(14),
                S0=>mux_addr1(9),
                O=>o_do(14));
   
   MUX_DO_15 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(15),
                D1=>XLXN_78(15),
                S0=>mux_addr1(9),
                O=>o_do(15));
   
   MUX_DO_16 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(16),
                D1=>XLXN_78(16),
                S0=>mux_addr1(9),
                O=>o_do(16));
   
   MUX_DO_17 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(17),
                D1=>XLXN_78(17),
                S0=>mux_addr1(9),
                O=>o_do(17));
   
   MUX_DO_18 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(18),
                D1=>XLXN_78(18),
                S0=>mux_addr1(9),
                O=>o_do(18));
   
   MUX_DO_19 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(19),
                D1=>XLXN_78(19),
                S0=>mux_addr1(9),
                O=>o_do(19));
   
   MUX_DO_20 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(20),
                D1=>XLXN_78(20),
                S0=>mux_addr1(9),
                O=>o_do(20));
   
   MUX_DO_21 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(21),
                D1=>XLXN_78(21),
                S0=>mux_addr1(9),
                O=>o_do(21));
   
   MUX_DO_22 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(22),
                D1=>XLXN_78(22),
                S0=>mux_addr1(9),
                O=>o_do(22));
   
   MUX_DO_23 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(23),
                D1=>XLXN_78(23),
                S0=>mux_addr1(9),
                O=>o_do(23));
   
   MUX_DO_24 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(24),
                D1=>XLXN_78(24),
                S0=>mux_addr1(9),
                O=>o_do(24));
   
   MUX_DO_25 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(25),
                D1=>XLXN_78(25),
                S0=>mux_addr1(9),
                O=>o_do(25));
   
   MUX_DO_26 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(26),
                D1=>XLXN_78(26),
                S0=>mux_addr1(9),
                O=>o_do(26));
   
   MUX_DO_27 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(27),
                D1=>XLXN_78(27),
                S0=>mux_addr1(9),
                O=>o_do(27));
   
   MUX_DO_28 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(28),
                D1=>XLXN_78(28),
                S0=>mux_addr1(9),
                O=>o_do(28));
   
   MUX_DO_29 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(29),
                D1=>XLXN_78(29),
                S0=>mux_addr1(9),
                O=>o_do(29));
   
   MUX_DO_30 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(30),
                D1=>XLXN_78(30),
                S0=>mux_addr1(9),
                O=>o_do(30));
   
   MUX_DO_31 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_79(31),
                D1=>XLXN_78(31),
                S0=>mux_addr1(9),
                O=>o_do(31));
   
   XLXI_5 : INV
      port map (I=>mux_addr1(9),
                O=>XLXN_59);
   
   XLXI_7_0 : GND
      port map (G=>XLXN_45(0));
   
   XLXI_7_1 : GND
      port map (G=>XLXN_45(1));
   
   XLXI_7_2 : GND
      port map (G=>XLXN_45(2));
   
   XLXI_7_3 : GND
      port map (G=>XLXN_45(3));
   
   XLXI_7_4 : GND
      port map (G=>XLXN_45(4));
   
   XLXI_8_0 : BUF
      port map (I=>mux_addr1(0),
                O=>XLXN_45(5));
   
   XLXI_8_1 : BUF
      port map (I=>mux_addr1(1),
                O=>XLXN_45(6));
   
   XLXI_8_2 : BUF
      port map (I=>mux_addr1(2),
                O=>XLXN_45(7));
   
   XLXI_8_3 : BUF
      port map (I=>mux_addr1(3),
                O=>XLXN_45(8));
   
   XLXI_8_4 : BUF
      port map (I=>mux_addr1(4),
                O=>XLXN_45(9));
   
   XLXI_8_5 : BUF
      port map (I=>mux_addr1(5),
                O=>XLXN_45(10));
   
   XLXI_8_6 : BUF
      port map (I=>mux_addr1(6),
                O=>XLXN_45(11));
   
   XLXI_8_7 : BUF
      port map (I=>mux_addr1(7),
                O=>XLXN_45(12));
   
   XLXI_8_8 : BUF
      port map (I=>mux_addr1(8),
                O=>XLXN_45(13));
   
   XLXI_8_9 : BUF
      port map (I=>mux_addr1(9),
                O=>XLXN_45(14));
   
   XLXI_10_0 : GND
      port map (G=>XLXN_44(0));
   
   XLXI_10_1 : GND
      port map (G=>XLXN_44(1));
   
   XLXI_10_2 : GND
      port map (G=>XLXN_44(2));
   
   XLXI_10_3 : GND
      port map (G=>XLXN_44(3));
   
   XLXI_10_4 : GND
      port map (G=>XLXN_44(4));
   
   XLXI_11_0 : BUF
      port map (I=>mux_addr1(0),
                O=>XLXN_44(5));
   
   XLXI_11_1 : BUF
      port map (I=>mux_addr1(1),
                O=>XLXN_44(6));
   
   XLXI_11_2 : BUF
      port map (I=>mux_addr1(2),
                O=>XLXN_44(7));
   
   XLXI_11_3 : BUF
      port map (I=>mux_addr1(3),
                O=>XLXN_44(8));
   
   XLXI_11_4 : BUF
      port map (I=>mux_addr1(4),
                O=>XLXN_44(9));
   
   XLXI_11_5 : BUF
      port map (I=>mux_addr1(5),
                O=>XLXN_44(10));
   
   XLXI_11_6 : BUF
      port map (I=>mux_addr1(6),
                O=>XLXN_44(11));
   
   XLXI_11_7 : BUF
      port map (I=>mux_addr1(7),
                O=>XLXN_44(12));
   
   XLXI_11_8 : BUF
      port map (I=>mux_addr1(8),
                O=>XLXN_44(13));
   
   XLXI_11_9 : BUF
      port map (I=>mux_addr1(9),
                O=>XLXN_44(14));
   
   XLXI_29_0 : BUF
      port map (I=>XLXN_288,
                O=>XLXN_139(0));
   
   XLXI_29_1 : BUF
      port map (I=>XLXN_288,
                O=>XLXN_139(1));
   
   XLXI_29_2 : BUF
      port map (I=>XLXN_288,
                O=>XLXN_139(2));
   
   XLXI_29_3 : BUF
      port map (I=>XLXN_288,
                O=>XLXN_139(3));
   
   XLXI_30 : ExtractKsToScaleParameter_MUSER_CalculateTo
      port map (i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>XLXN_270,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                i2c_mem_addra(11 downto 0)=>XLXN_280(11 downto 0),
                i2c_mem_ena=>XLXN_278,
                o_kstoscale(31 downto 0)=>XLXN_277(31 downto 0),
                o_rdy=>XLXN_269);
   
   XLXI_31 : rom_signed8bit_MUSER_CalculateTo
      port map (i_clock=>i_clock,
                i_reset=>i_reset,
                i_value(7 downto 0)=>XLXN_275(7 downto 0),
                o_value(31 downto 0)=>XLXN_276(31 downto 0));
   
   XLXI_32 : CalculateTo_process_p0
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                ExtractKsToScaleParameter_kstoscale(31 downto 0)=>XLXN_277(31 
            downto 0),
                ExtractKsToScaleParameter_rdy=>XLXN_269,
                i_alphacomp_do(31 downto 0)=>i_alphacomp_do(31 downto 0),
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>i_run,
                i_Ta(31 downto 0)=>i_Ta(31 downto 0),
                i_vircompensated_do(31 downto 0)=>i_vircompensated_do(31 downto 
            0),
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                mem_signed256_ovalue(31 downto 0)=>XLXN_276(31 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                sqrtfp2r(31 downto 0)=>sqrtfp2r(31 downto 0),
                sqrtfp2rdy=>sqrtfp2rdy,
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
                ExtractKsToScaleParameter_mux=>XLXN_282,
                ExtractKsToScaleParameter_run=>XLXN_270,
                i2c_mem_addra(11 downto 0)=>XLXN_281(11 downto 0),
                i2c_mem_ena=>XLXN_279,
                mem_signed256_ivalue(7 downto 0)=>XLXN_275(7 downto 0),
                mulfpa(31 downto 0)=>mulfpa(31 downto 0),
                mulfpb(31 downto 0)=>mulfpb(31 downto 0),
                mulfpce=>mulfpce,
                mulfpond=>mulfpond,
                mulfpsclr=>mulfpsclr,
                o_addra(9 downto 0)=>XLXN_241(9 downto 0),
                o_alphacomp_addr(9 downto 0)=>o_alphacomp_addr(9 downto 0),
                o_dia(31 downto 0)=>XLXN_239(31 downto 0),
                o_rdy=>o_rdy_DUMMY,
                o_vircompensated_addr(9 downto 0)=>o_vircompensated_addr(9 
            downto 0),
                o_write_enable=>XLXN_288,
                sqrtfp2a(31 downto 0)=>sqrtfp2a(31 downto 0),
                sqrtfp2ce=>sqrtfp2ce,
                sqrtfp2ond=>sqrtfp2ond,
                sqrtfp2sclr=>sqrtfp2sclr,
                subfpa(31 downto 0)=>subfpa(31 downto 0),
                subfpb(31 downto 0)=>subfpb(31 downto 0),
                subfpce=>subfpce,
                subfpond=>subfpond,
                subfpsclr=>subfpsclr);
   
   XLXI_61 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_279,
                D1=>XLXN_278,
                S0=>XLXN_282,
                O=>i2c_mem_ena);
   
   XLXI_62_0 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(0),
                D1=>XLXN_280(0),
                S0=>XLXN_282,
                O=>i2c_mem_addra(0));
   
   XLXI_62_1 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(1),
                D1=>XLXN_280(1),
                S0=>XLXN_282,
                O=>i2c_mem_addra(1));
   
   XLXI_62_2 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(2),
                D1=>XLXN_280(2),
                S0=>XLXN_282,
                O=>i2c_mem_addra(2));
   
   XLXI_62_3 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(3),
                D1=>XLXN_280(3),
                S0=>XLXN_282,
                O=>i2c_mem_addra(3));
   
   XLXI_62_4 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(4),
                D1=>XLXN_280(4),
                S0=>XLXN_282,
                O=>i2c_mem_addra(4));
   
   XLXI_62_5 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(5),
                D1=>XLXN_280(5),
                S0=>XLXN_282,
                O=>i2c_mem_addra(5));
   
   XLXI_62_6 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(6),
                D1=>XLXN_280(6),
                S0=>XLXN_282,
                O=>i2c_mem_addra(6));
   
   XLXI_62_7 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(7),
                D1=>XLXN_280(7),
                S0=>XLXN_282,
                O=>i2c_mem_addra(7));
   
   XLXI_62_8 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(8),
                D1=>XLXN_280(8),
                S0=>XLXN_282,
                O=>i2c_mem_addra(8));
   
   XLXI_62_9 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(9),
                D1=>XLXN_280(9),
                S0=>XLXN_282,
                O=>i2c_mem_addra(9));
   
   XLXI_62_10 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(10),
                D1=>XLXN_280(10),
                S0=>XLXN_282,
                O=>i2c_mem_addra(10));
   
   XLXI_62_11 : M2_1_MXILINX_CalculateTo
      port map (D0=>XLXN_281(11),
                D1=>XLXN_280(11),
                S0=>XLXN_282,
                O=>i2c_mem_addra(11));
   
end BEHAVIORAL;


