--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : rom_signed10bit.vhf
-- /___/   /\     Timestamp : 09/22/2024 19:44:29
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/rom_signed10bit.vhf -w /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/rom_signed10bit.sch
--Design Name: rom_signed10bit
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

entity M2_1_MXILINX_rom_signed10bit is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_rom_signed10bit;

architecture BEHAVIORAL of M2_1_MXILINX_rom_signed10bit is
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

entity rom_signed10bit is
   port ( address : in    std_logic_vector (9 downto 0); 
          i_clock : in    std_logic; 
          i_reset : in    std_logic; 
          o_data  : out   std_logic_vector (31 downto 0));
end rom_signed10bit;

architecture BEHAVIORAL of rom_signed10bit is
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
   
   component M2_1_MXILINX_rom_signed10bit
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
   attribute HU_SET of XLXI_16_0 : label is "XLXI_16_0_276";
   attribute HU_SET of XLXI_16_1 : label is "XLXI_16_1_275";
   attribute HU_SET of XLXI_16_2 : label is "XLXI_16_2_274";
   attribute HU_SET of XLXI_16_3 : label is "XLXI_16_3_273";
   attribute HU_SET of XLXI_16_4 : label is "XLXI_16_4_272";
   attribute HU_SET of XLXI_16_5 : label is "XLXI_16_5_271";
   attribute HU_SET of XLXI_16_6 : label is "XLXI_16_6_270";
   attribute HU_SET of XLXI_16_7 : label is "XLXI_16_7_269";
   attribute HU_SET of XLXI_16_8 : label is "XLXI_16_8_268";
   attribute HU_SET of XLXI_16_9 : label is "XLXI_16_9_267";
   attribute HU_SET of XLXI_16_10 : label is "XLXI_16_10_266";
   attribute HU_SET of XLXI_16_11 : label is "XLXI_16_11_265";
   attribute HU_SET of XLXI_16_12 : label is "XLXI_16_12_264";
   attribute HU_SET of XLXI_16_13 : label is "XLXI_16_13_263";
   attribute HU_SET of XLXI_16_14 : label is "XLXI_16_14_262";
   attribute HU_SET of XLXI_16_15 : label is "XLXI_16_15_261";
   attribute HU_SET of XLXI_16_16 : label is "XLXI_16_16_260";
   attribute HU_SET of XLXI_16_17 : label is "XLXI_16_17_259";
   attribute HU_SET of XLXI_16_18 : label is "XLXI_16_18_258";
   attribute HU_SET of XLXI_16_19 : label is "XLXI_16_19_257";
   attribute HU_SET of XLXI_16_20 : label is "XLXI_16_20_256";
   attribute HU_SET of XLXI_16_21 : label is "XLXI_16_21_255";
   attribute HU_SET of XLXI_16_22 : label is "XLXI_16_22_254";
   attribute HU_SET of XLXI_16_23 : label is "XLXI_16_23_253";
   attribute HU_SET of XLXI_16_24 : label is "XLXI_16_24_252";
   attribute HU_SET of XLXI_16_25 : label is "XLXI_16_25_251";
   attribute HU_SET of XLXI_16_26 : label is "XLXI_16_26_250";
   attribute HU_SET of XLXI_16_27 : label is "XLXI_16_27_249";
   attribute HU_SET of XLXI_16_28 : label is "XLXI_16_28_248";
   attribute HU_SET of XLXI_16_29 : label is "XLXI_16_29_247";
   attribute HU_SET of XLXI_16_30 : label is "XLXI_16_30_246";
   attribute HU_SET of XLXI_16_31 : label is "XLXI_16_31_245";
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
   
   XLXI_16_0 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(0),
                D1=>XLXN_33(0),
                S0=>address(9),
                O=>o_data(0));
   
   XLXI_16_1 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(1),
                D1=>XLXN_33(1),
                S0=>address(9),
                O=>o_data(1));
   
   XLXI_16_2 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(2),
                D1=>XLXN_33(2),
                S0=>address(9),
                O=>o_data(2));
   
   XLXI_16_3 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(3),
                D1=>XLXN_33(3),
                S0=>address(9),
                O=>o_data(3));
   
   XLXI_16_4 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(4),
                D1=>XLXN_33(4),
                S0=>address(9),
                O=>o_data(4));
   
   XLXI_16_5 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(5),
                D1=>XLXN_33(5),
                S0=>address(9),
                O=>o_data(5));
   
   XLXI_16_6 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(6),
                D1=>XLXN_33(6),
                S0=>address(9),
                O=>o_data(6));
   
   XLXI_16_7 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(7),
                D1=>XLXN_33(7),
                S0=>address(9),
                O=>o_data(7));
   
   XLXI_16_8 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(8),
                D1=>XLXN_33(8),
                S0=>address(9),
                O=>o_data(8));
   
   XLXI_16_9 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(9),
                D1=>XLXN_33(9),
                S0=>address(9),
                O=>o_data(9));
   
   XLXI_16_10 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(10),
                D1=>XLXN_33(10),
                S0=>address(9),
                O=>o_data(10));
   
   XLXI_16_11 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(11),
                D1=>XLXN_33(11),
                S0=>address(9),
                O=>o_data(11));
   
   XLXI_16_12 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(12),
                D1=>XLXN_33(12),
                S0=>address(9),
                O=>o_data(12));
   
   XLXI_16_13 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(13),
                D1=>XLXN_33(13),
                S0=>address(9),
                O=>o_data(13));
   
   XLXI_16_14 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(14),
                D1=>XLXN_33(14),
                S0=>address(9),
                O=>o_data(14));
   
   XLXI_16_15 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(15),
                D1=>XLXN_33(15),
                S0=>address(9),
                O=>o_data(15));
   
   XLXI_16_16 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(16),
                D1=>XLXN_33(16),
                S0=>address(9),
                O=>o_data(16));
   
   XLXI_16_17 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(17),
                D1=>XLXN_33(17),
                S0=>address(9),
                O=>o_data(17));
   
   XLXI_16_18 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(18),
                D1=>XLXN_33(18),
                S0=>address(9),
                O=>o_data(18));
   
   XLXI_16_19 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(19),
                D1=>XLXN_33(19),
                S0=>address(9),
                O=>o_data(19));
   
   XLXI_16_20 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(20),
                D1=>XLXN_33(20),
                S0=>address(9),
                O=>o_data(20));
   
   XLXI_16_21 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(21),
                D1=>XLXN_33(21),
                S0=>address(9),
                O=>o_data(21));
   
   XLXI_16_22 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(22),
                D1=>XLXN_33(22),
                S0=>address(9),
                O=>o_data(22));
   
   XLXI_16_23 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(23),
                D1=>XLXN_33(23),
                S0=>address(9),
                O=>o_data(23));
   
   XLXI_16_24 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(24),
                D1=>XLXN_33(24),
                S0=>address(9),
                O=>o_data(24));
   
   XLXI_16_25 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(25),
                D1=>XLXN_33(25),
                S0=>address(9),
                O=>o_data(25));
   
   XLXI_16_26 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(26),
                D1=>XLXN_33(26),
                S0=>address(9),
                O=>o_data(26));
   
   XLXI_16_27 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(27),
                D1=>XLXN_33(27),
                S0=>address(9),
                O=>o_data(27));
   
   XLXI_16_28 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(28),
                D1=>XLXN_33(28),
                S0=>address(9),
                O=>o_data(28));
   
   XLXI_16_29 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(29),
                D1=>XLXN_33(29),
                S0=>address(9),
                O=>o_data(29));
   
   XLXI_16_30 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(30),
                D1=>XLXN_33(30),
                S0=>address(9),
                O=>o_data(30));
   
   XLXI_16_31 : M2_1_MXILINX_rom_signed10bit
      port map (D0=>XLXN_32(31),
                D1=>XLXN_33(31),
                S0=>address(9),
                O=>o_data(31));
   
   XLXI_17 : VCC
      port map (P=>XLXN_38);
   
end BEHAVIORAL;


