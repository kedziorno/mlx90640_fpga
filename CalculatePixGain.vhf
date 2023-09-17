--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CalculatePixGain.vhf
-- /___/   /\     Timestamp : 09/16/2023 17:26:07
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/CalculatePixGain.vhf -w /home/user/workspace/mlx90640_fpga/CalculatePixGain.sch
--Design Name: CalculatePixGain
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

entity M2_1_MXILINX_CalculatePixGain is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_CalculatePixGain;

architecture BEHAVIORAL of M2_1_MXILINX_CalculatePixGain is
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

entity CalculatePixGain is
   port ( divfpr          : in    std_logic_vector (31 downto 0); 
          divfprdy        : in    std_logic; 
          fixed2floatr    : in    std_logic_vector (31 downto 0); 
          fixed2floatrdy  : in    std_logic; 
          i_addr          : in    std_logic_vector (9 downto 0); 
          i_clock         : in    std_logic; 
          i_reset         : in    std_logic; 
          i_run           : in    std_logic; 
          i2c_mem_douta   : in    std_logic_vector (7 downto 0); 
          mulfpr          : in    std_logic_vector (31 downto 0); 
          mulfprdy        : in    std_logic; 
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
          o_do            : out   std_logic_vector (31 downto 0); 
          o_rdy           : out   std_logic);
end CalculatePixGain;

architecture BEHAVIORAL of CalculatePixGain is
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
   signal mux_addr                          : std_logic_vector (9 downto 0);
   signal XLXN_44                           : std_logic_vector (14 downto 0);
   signal XLXN_45                           : std_logic_vector (14 downto 0);
   signal XLXN_59                           : std_logic;
   signal XLXN_78                           : std_logic_vector (31 downto 0);
   signal XLXN_79                           : std_logic_vector (31 downto 0);
   signal XLXN_86                           : std_logic_vector (9 downto 0);
   signal XLXN_88                           : std_logic_vector (31 downto 0);
   signal XLXN_109                          : std_logic;
   signal XLXN_112                          : std_logic;
   signal XLXN_113                          : std_logic;
   signal XLXN_114                          : std_logic_vector (11 downto 0);
   signal XLXN_115                          : std_logic_vector (11 downto 0);
   signal XLXN_117                          : std_logic;
   signal XLXN_118                          : std_logic_vector (15 downto 0);
   signal XLXN_119                          : std_logic_vector (15 downto 0);
   signal XLXN_132                          : std_logic;
   signal XLXN_133                          : std_logic;
   signal XLXN_134                          : std_logic;
   signal XLXN_135                          : std_logic;
   signal XLXN_136                          : std_logic;
   signal XLXN_137                          : std_logic;
   signal XLXN_139                          : std_logic_vector (3 downto 0);
   signal XLXN_140                          : std_logic;
   signal XLXN_141                          : std_logic_vector (31 downto 0);
   signal XLXN_155                          : std_logic;
   signal XLXN_157                          : std_logic_vector (31 downto 0);
   signal XLXN_158                          : std_logic_vector (31 downto 0);
   signal o_rdy_DUMMY                       : std_logic;
   signal mem_KGain_1_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal mem_KGain_1_CASCADEINA_openSignal : std_logic;
   signal mem_KGain_1_CASCADEINB_openSignal : std_logic;
   signal mem_KGain_1_CLKB_openSignal       : std_logic;
   signal mem_KGain_1_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal mem_KGain_1_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal mem_KGain_1_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal mem_KGain_1_ENB_openSignal        : std_logic;
   signal mem_KGain_1_REGCEA_openSignal     : std_logic;
   signal mem_KGain_1_REGCEB_openSignal     : std_logic;
   signal mem_KGain_1_SSRB_openSignal       : std_logic;
   signal mem_KGain_1_WEB_openSignal        : std_logic_vector (3 downto 0);
   signal mem_KGain_2_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal mem_KGain_2_CASCADEINA_openSignal : std_logic;
   signal mem_KGain_2_CASCADEINB_openSignal : std_logic;
   signal mem_KGain_2_CLKB_openSignal       : std_logic;
   signal mem_KGain_2_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal mem_KGain_2_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal mem_KGain_2_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal mem_KGain_2_ENB_openSignal        : std_logic;
   signal mem_KGain_2_REGCEA_openSignal     : std_logic;
   signal mem_KGain_2_REGCEB_openSignal     : std_logic;
   signal mem_KGain_2_SSRB_openSignal       : std_logic;
   signal mem_KGain_2_WEB_openSignal        : std_logic_vector (3 downto 0);
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
             fixed2floata    : out   std_logic_vector (15 downto 0); 
             divfpa          : out   std_logic_vector (31 downto 0); 
             divfpb          : out   std_logic_vector (31 downto 0));
   end component;
   
   component CalculatePixGain_process_p0
      port ( i_clock              : in    std_logic; 
             i_reset              : in    std_logic; 
             i_run                : in    std_logic; 
             CalculateKGain_rdy   : in    std_logic; 
             fixed2floatrdy       : in    std_logic; 
             mulfprdy             : in    std_logic; 
             i2c_mem_douta        : in    std_logic_vector (7 downto 0); 
             CalculateKGain_KGain : in    std_logic_vector (31 downto 0); 
             fixed2floatr         : in    std_logic_vector (31 downto 0); 
             mulfpr               : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena          : out   std_logic; 
             CalculateKGain_run   : out   std_logic; 
             CalculateKGain_mux   : out   std_logic; 
             o_rdy                : out   std_logic; 
             o_write_enable       : out   std_logic; 
             fixed2floatond       : out   std_logic; 
             fixed2floatsclr      : out   std_logic; 
             fixed2floatce        : out   std_logic; 
             mulfpond             : out   std_logic; 
             mulfpsclr            : out   std_logic; 
             mulfpce              : out   std_logic; 
             i2c_mem_addra        : out   std_logic_vector (11 downto 0); 
             o_addra              : out   std_logic_vector (9 downto 0); 
             o_dia                : out   std_logic_vector (31 downto 0); 
             fixed2floata         : out   std_logic_vector (15 downto 0); 
             mulfpa               : out   std_logic_vector (31 downto 0); 
             mulfpb               : out   std_logic_vector (31 downto 0));
   end component;
   
   component M2_1_MXILINX_CalculatePixGain
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
   
   attribute HU_SET of CalculatePixGain_MUX_DIA_0 : label is 
         "CalculatePixGain_MUX_DIA_0_655";
   attribute HU_SET of CalculatePixGain_MUX_DIA_1 : label is 
         "CalculatePixGain_MUX_DIA_1_654";
   attribute HU_SET of CalculatePixGain_MUX_DIA_2 : label is 
         "CalculatePixGain_MUX_DIA_2_653";
   attribute HU_SET of CalculatePixGain_MUX_DIA_3 : label is 
         "CalculatePixGain_MUX_DIA_3_652";
   attribute HU_SET of CalculatePixGain_MUX_DIA_4 : label is 
         "CalculatePixGain_MUX_DIA_4_651";
   attribute HU_SET of CalculatePixGain_MUX_DIA_5 : label is 
         "CalculatePixGain_MUX_DIA_5_650";
   attribute HU_SET of CalculatePixGain_MUX_DIA_6 : label is 
         "CalculatePixGain_MUX_DIA_6_649";
   attribute HU_SET of CalculatePixGain_MUX_DIA_7 : label is 
         "CalculatePixGain_MUX_DIA_7_648";
   attribute HU_SET of CalculatePixGain_MUX_DIA_8 : label is 
         "CalculatePixGain_MUX_DIA_8_647";
   attribute HU_SET of CalculatePixGain_MUX_DIA_9 : label is 
         "CalculatePixGain_MUX_DIA_9_646";
   attribute HU_SET of CalculatePixGain_MUX_DIA_10 : label is 
         "CalculatePixGain_MUX_DIA_10_645";
   attribute HU_SET of CalculatePixGain_MUX_DIA_11 : label is 
         "CalculatePixGain_MUX_DIA_11_644";
   attribute HU_SET of CalculatePixGain_MUX_DIA_12 : label is 
         "CalculatePixGain_MUX_DIA_12_643";
   attribute HU_SET of CalculatePixGain_MUX_DIA_13 : label is 
         "CalculatePixGain_MUX_DIA_13_642";
   attribute HU_SET of CalculatePixGain_MUX_DIA_14 : label is 
         "CalculatePixGain_MUX_DIA_14_641";
   attribute HU_SET of CalculatePixGain_MUX_DIA_15 : label is 
         "CalculatePixGain_MUX_DIA_15_640";
   attribute HU_SET of CalculatePixGain_MUX_DIA_16 : label is 
         "CalculatePixGain_MUX_DIA_16_639";
   attribute HU_SET of CalculatePixGain_MUX_DIA_17 : label is 
         "CalculatePixGain_MUX_DIA_17_638";
   attribute HU_SET of CalculatePixGain_MUX_DIA_18 : label is 
         "CalculatePixGain_MUX_DIA_18_637";
   attribute HU_SET of CalculatePixGain_MUX_DIA_19 : label is 
         "CalculatePixGain_MUX_DIA_19_636";
   attribute HU_SET of CalculatePixGain_MUX_DIA_20 : label is 
         "CalculatePixGain_MUX_DIA_20_635";
   attribute HU_SET of CalculatePixGain_MUX_DIA_21 : label is 
         "CalculatePixGain_MUX_DIA_21_634";
   attribute HU_SET of CalculatePixGain_MUX_DIA_22 : label is 
         "CalculatePixGain_MUX_DIA_22_633";
   attribute HU_SET of CalculatePixGain_MUX_DIA_23 : label is 
         "CalculatePixGain_MUX_DIA_23_632";
   attribute HU_SET of CalculatePixGain_MUX_DIA_24 : label is 
         "CalculatePixGain_MUX_DIA_24_631";
   attribute HU_SET of CalculatePixGain_MUX_DIA_25 : label is 
         "CalculatePixGain_MUX_DIA_25_630";
   attribute HU_SET of CalculatePixGain_MUX_DIA_26 : label is 
         "CalculatePixGain_MUX_DIA_26_629";
   attribute HU_SET of CalculatePixGain_MUX_DIA_27 : label is 
         "CalculatePixGain_MUX_DIA_27_628";
   attribute HU_SET of CalculatePixGain_MUX_DIA_28 : label is 
         "CalculatePixGain_MUX_DIA_28_627";
   attribute HU_SET of CalculatePixGain_MUX_DIA_29 : label is 
         "CalculatePixGain_MUX_DIA_29_626";
   attribute HU_SET of CalculatePixGain_MUX_DIA_30 : label is 
         "CalculatePixGain_MUX_DIA_30_625";
   attribute HU_SET of CalculatePixGain_MUX_DIA_31 : label is 
         "CalculatePixGain_MUX_DIA_31_624";
   attribute HU_SET of CalculatePixGain_MUX_DO_0 : label is 
         "CalculatePixGain_MUX_DO_0_613";
   attribute HU_SET of CalculatePixGain_MUX_DO_1 : label is 
         "CalculatePixGain_MUX_DO_1_612";
   attribute HU_SET of CalculatePixGain_MUX_DO_2 : label is 
         "CalculatePixGain_MUX_DO_2_611";
   attribute HU_SET of CalculatePixGain_MUX_DO_3 : label is 
         "CalculatePixGain_MUX_DO_3_610";
   attribute HU_SET of CalculatePixGain_MUX_DO_4 : label is 
         "CalculatePixGain_MUX_DO_4_609";
   attribute HU_SET of CalculatePixGain_MUX_DO_5 : label is 
         "CalculatePixGain_MUX_DO_5_608";
   attribute HU_SET of CalculatePixGain_MUX_DO_6 : label is 
         "CalculatePixGain_MUX_DO_6_607";
   attribute HU_SET of CalculatePixGain_MUX_DO_7 : label is 
         "CalculatePixGain_MUX_DO_7_606";
   attribute HU_SET of CalculatePixGain_MUX_DO_8 : label is 
         "CalculatePixGain_MUX_DO_8_605";
   attribute HU_SET of CalculatePixGain_MUX_DO_9 : label is 
         "CalculatePixGain_MUX_DO_9_604";
   attribute HU_SET of CalculatePixGain_MUX_DO_10 : label is 
         "CalculatePixGain_MUX_DO_10_603";
   attribute HU_SET of CalculatePixGain_MUX_DO_11 : label is 
         "CalculatePixGain_MUX_DO_11_602";
   attribute HU_SET of CalculatePixGain_MUX_DO_12 : label is 
         "CalculatePixGain_MUX_DO_12_601";
   attribute HU_SET of CalculatePixGain_MUX_DO_13 : label is 
         "CalculatePixGain_MUX_DO_13_600";
   attribute HU_SET of CalculatePixGain_MUX_DO_14 : label is 
         "CalculatePixGain_MUX_DO_14_599";
   attribute HU_SET of CalculatePixGain_MUX_DO_15 : label is 
         "CalculatePixGain_MUX_DO_15_598";
   attribute HU_SET of CalculatePixGain_MUX_DO_16 : label is 
         "CalculatePixGain_MUX_DO_16_597";
   attribute HU_SET of CalculatePixGain_MUX_DO_17 : label is 
         "CalculatePixGain_MUX_DO_17_596";
   attribute HU_SET of CalculatePixGain_MUX_DO_18 : label is 
         "CalculatePixGain_MUX_DO_18_595";
   attribute HU_SET of CalculatePixGain_MUX_DO_19 : label is 
         "CalculatePixGain_MUX_DO_19_594";
   attribute HU_SET of CalculatePixGain_MUX_DO_20 : label is 
         "CalculatePixGain_MUX_DO_20_593";
   attribute HU_SET of CalculatePixGain_MUX_DO_21 : label is 
         "CalculatePixGain_MUX_DO_21_592";
   attribute HU_SET of CalculatePixGain_MUX_DO_22 : label is 
         "CalculatePixGain_MUX_DO_22_591";
   attribute HU_SET of CalculatePixGain_MUX_DO_23 : label is 
         "CalculatePixGain_MUX_DO_23_590";
   attribute HU_SET of CalculatePixGain_MUX_DO_24 : label is 
         "CalculatePixGain_MUX_DO_24_589";
   attribute HU_SET of CalculatePixGain_MUX_DO_25 : label is 
         "CalculatePixGain_MUX_DO_25_588";
   attribute HU_SET of CalculatePixGain_MUX_DO_26 : label is 
         "CalculatePixGain_MUX_DO_26_587";
   attribute HU_SET of CalculatePixGain_MUX_DO_27 : label is 
         "CalculatePixGain_MUX_DO_27_586";
   attribute HU_SET of CalculatePixGain_MUX_DO_28 : label is 
         "CalculatePixGain_MUX_DO_28_585";
   attribute HU_SET of CalculatePixGain_MUX_DO_29 : label is 
         "CalculatePixGain_MUX_DO_29_584";
   attribute HU_SET of CalculatePixGain_MUX_DO_30 : label is 
         "CalculatePixGain_MUX_DO_30_583";
   attribute HU_SET of CalculatePixGain_MUX_DO_31 : label is 
         "CalculatePixGain_MUX_DO_31_582";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_0 : label is 
         "CalculatePixGain_MUX_fi2fl_a_0_684";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_1 : label is 
         "CalculatePixGain_MUX_fi2fl_a_1_683";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_2 : label is 
         "CalculatePixGain_MUX_fi2fl_a_2_682";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_3 : label is 
         "CalculatePixGain_MUX_fi2fl_a_3_681";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_4 : label is 
         "CalculatePixGain_MUX_fi2fl_a_4_680";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_5 : label is 
         "CalculatePixGain_MUX_fi2fl_a_5_679";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_6 : label is 
         "CalculatePixGain_MUX_fi2fl_a_6_678";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_7 : label is 
         "CalculatePixGain_MUX_fi2fl_a_7_677";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_8 : label is 
         "CalculatePixGain_MUX_fi2fl_a_8_676";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_9 : label is 
         "CalculatePixGain_MUX_fi2fl_a_9_675";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_10 : label is 
         "CalculatePixGain_MUX_fi2fl_a_10_674";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_11 : label is 
         "CalculatePixGain_MUX_fi2fl_a_11_673";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_12 : label is 
         "CalculatePixGain_MUX_fi2fl_a_12_672";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_13 : label is 
         "CalculatePixGain_MUX_fi2fl_a_13_671";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_14 : label is 
         "CalculatePixGain_MUX_fi2fl_a_14_670";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_15 : label is 
         "CalculatePixGain_MUX_fi2fl_a_15_669";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_ce : label is 
         "CalculatePixGain_MUX_fi2fl_ce_687";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_ond : label is 
         "CalculatePixGain_MUX_fi2fl_ond_685";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_sclr : label is 
         "CalculatePixGain_MUX_fi2fl_sclr_686";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_0 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_0_668";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_1 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_1_667";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_2 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_2_666";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_3 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_3_665";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_4 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_4_664";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_5 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_5_663";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_6 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_6_662";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_7 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_7_661";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_8 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_8_660";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_9 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_9_659";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_10 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_10_658";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_11 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_11_657";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_ena : label is 
         "CalculatePixGain_MUX_i2c_mem_ena_656";
   attribute HU_SET of CalculatePixGain_mux2_addra_0 : label is 
         "CalculatePixGain_mux2_addra_0_623";
   attribute HU_SET of CalculatePixGain_mux2_addra_1 : label is 
         "CalculatePixGain_mux2_addra_1_622";
   attribute HU_SET of CalculatePixGain_mux2_addra_2 : label is 
         "CalculatePixGain_mux2_addra_2_621";
   attribute HU_SET of CalculatePixGain_mux2_addra_3 : label is 
         "CalculatePixGain_mux2_addra_3_620";
   attribute HU_SET of CalculatePixGain_mux2_addra_4 : label is 
         "CalculatePixGain_mux2_addra_4_619";
   attribute HU_SET of CalculatePixGain_mux2_addra_5 : label is 
         "CalculatePixGain_mux2_addra_5_618";
   attribute HU_SET of CalculatePixGain_mux2_addra_6 : label is 
         "CalculatePixGain_mux2_addra_6_617";
   attribute HU_SET of CalculatePixGain_mux2_addra_7 : label is 
         "CalculatePixGain_mux2_addra_7_616";
   attribute HU_SET of CalculatePixGain_mux2_addra_8 : label is 
         "CalculatePixGain_mux2_addra_8_615";
   attribute HU_SET of CalculatePixGain_mux2_addra_9 : label is 
         "CalculatePixGain_mux2_addra_9_614";
   attribute WRITE_WIDTH_B of mem_KGain_1 : label is "36";
   attribute WRITE_WIDTH_A of mem_KGain_1 : label is "36";
   attribute WRITE_MODE_B of mem_KGain_1 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_KGain_1 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_KGain_1 : label is "36";
   attribute READ_WIDTH_A of mem_KGain_1 : label is "36";
   attribute WRITE_WIDTH_B of mem_KGain_2 : label is "36";
   attribute WRITE_WIDTH_A of mem_KGain_2 : label is "36";
   attribute WRITE_MODE_B of mem_KGain_2 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_KGain_2 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_KGain_2 : label is "36";
   attribute READ_WIDTH_A of mem_KGain_2 : label is "36";
begin
   XLXN_158(31 downto 0) <= x"22000000";
   o_rdy <= o_rdy_DUMMY;
   CalculatePixGain_inst_CalcKGain_proc0 : CalculateKGain_process_p0
      port map (divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                fixed2floatr(31 downto 0)=>fixed2floatr(31 downto 0),
                fixed2floatrdy=>fixed2floatrdy,
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>XLXN_117,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                divfpa(31 downto 0)=>divfpa(31 downto 0),
                divfpb(31 downto 0)=>divfpb(31 downto 0),
                divfpce=>divfpce,
                divfpond=>divfpond,
                divfpsclr=>divfpsclr,
                fixed2floata(15 downto 0)=>XLXN_119(15 downto 0),
                fixed2floatce=>XLXN_137,
                fixed2floatond=>XLXN_135,
                fixed2floatsclr=>XLXN_136,
                i2c_mem_addra(11 downto 0)=>XLXN_115(11 downto 0),
                i2c_mem_ena=>XLXN_112,
                o_KGain(31 downto 0)=>XLXN_141(31 downto 0),
                o_rdy=>XLXN_155);
   
   CalculatePixGain_inst_CalcPixGain_proc0 : CalculatePixGain_process_p0
      port map (CalculateKGain_KGain(31 downto 0)=>XLXN_141(31 downto 0),
                CalculateKGain_rdy=>XLXN_155,
                fixed2floatr(31 downto 0)=>fixed2floatr(31 downto 0),
                fixed2floatrdy=>fixed2floatrdy,
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                CalculateKGain_mux=>XLXN_113,
                CalculateKGain_run=>XLXN_117,
                fixed2floata(15 downto 0)=>XLXN_118(15 downto 0),
                fixed2floatce=>XLXN_133,
                fixed2floatond=>XLXN_132,
                fixed2floatsclr=>XLXN_134,
                i2c_mem_addra(11 downto 0)=>XLXN_114(11 downto 0),
                i2c_mem_ena=>XLXN_109,
                mulfpa(31 downto 0)=>mulfpa(31 downto 0),
                mulfpb(31 downto 0)=>mulfpb(31 downto 0),
                mulfpce=>mulfpce,
                mulfpond=>mulfpond,
                mulfpsclr=>mulfpsclr,
                o_addra(9 downto 0)=>XLXN_86(9 downto 0),
                o_dia(31 downto 0)=>XLXN_157(31 downto 0),
                o_rdy=>o_rdy_DUMMY,
                o_write_enable=>XLXN_140);
   
   CalculatePixGain_MUX_DIA_0 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(0),
                D1=>XLXN_158(0),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(0));
   
   CalculatePixGain_MUX_DIA_1 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(1),
                D1=>XLXN_158(1),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(1));
   
   CalculatePixGain_MUX_DIA_2 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(2),
                D1=>XLXN_158(2),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(2));
   
   CalculatePixGain_MUX_DIA_3 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(3),
                D1=>XLXN_158(3),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(3));
   
   CalculatePixGain_MUX_DIA_4 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(4),
                D1=>XLXN_158(4),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(4));
   
   CalculatePixGain_MUX_DIA_5 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(5),
                D1=>XLXN_158(5),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(5));
   
   CalculatePixGain_MUX_DIA_6 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(6),
                D1=>XLXN_158(6),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(6));
   
   CalculatePixGain_MUX_DIA_7 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(7),
                D1=>XLXN_158(7),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(7));
   
   CalculatePixGain_MUX_DIA_8 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(8),
                D1=>XLXN_158(8),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(8));
   
   CalculatePixGain_MUX_DIA_9 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(9),
                D1=>XLXN_158(9),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(9));
   
   CalculatePixGain_MUX_DIA_10 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(10),
                D1=>XLXN_158(10),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(10));
   
   CalculatePixGain_MUX_DIA_11 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(11),
                D1=>XLXN_158(11),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(11));
   
   CalculatePixGain_MUX_DIA_12 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(12),
                D1=>XLXN_158(12),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(12));
   
   CalculatePixGain_MUX_DIA_13 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(13),
                D1=>XLXN_158(13),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(13));
   
   CalculatePixGain_MUX_DIA_14 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(14),
                D1=>XLXN_158(14),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(14));
   
   CalculatePixGain_MUX_DIA_15 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(15),
                D1=>XLXN_158(15),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(15));
   
   CalculatePixGain_MUX_DIA_16 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(16),
                D1=>XLXN_158(16),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(16));
   
   CalculatePixGain_MUX_DIA_17 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(17),
                D1=>XLXN_158(17),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(17));
   
   CalculatePixGain_MUX_DIA_18 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(18),
                D1=>XLXN_158(18),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(18));
   
   CalculatePixGain_MUX_DIA_19 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(19),
                D1=>XLXN_158(19),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(19));
   
   CalculatePixGain_MUX_DIA_20 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(20),
                D1=>XLXN_158(20),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(20));
   
   CalculatePixGain_MUX_DIA_21 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(21),
                D1=>XLXN_158(21),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(21));
   
   CalculatePixGain_MUX_DIA_22 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(22),
                D1=>XLXN_158(22),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(22));
   
   CalculatePixGain_MUX_DIA_23 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(23),
                D1=>XLXN_158(23),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(23));
   
   CalculatePixGain_MUX_DIA_24 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(24),
                D1=>XLXN_158(24),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(24));
   
   CalculatePixGain_MUX_DIA_25 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(25),
                D1=>XLXN_158(25),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(25));
   
   CalculatePixGain_MUX_DIA_26 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(26),
                D1=>XLXN_158(26),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(26));
   
   CalculatePixGain_MUX_DIA_27 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(27),
                D1=>XLXN_158(27),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(27));
   
   CalculatePixGain_MUX_DIA_28 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(28),
                D1=>XLXN_158(28),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(28));
   
   CalculatePixGain_MUX_DIA_29 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(29),
                D1=>XLXN_158(29),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(29));
   
   CalculatePixGain_MUX_DIA_30 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(30),
                D1=>XLXN_158(30),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(30));
   
   CalculatePixGain_MUX_DIA_31 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(31),
                D1=>XLXN_158(31),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(31));
   
   CalculatePixGain_MUX_DO_0 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(0),
                D1=>XLXN_78(0),
                S0=>mux_addr(9),
                O=>o_do(0));
   
   CalculatePixGain_MUX_DO_1 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(1),
                D1=>XLXN_78(1),
                S0=>mux_addr(9),
                O=>o_do(1));
   
   CalculatePixGain_MUX_DO_2 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(2),
                D1=>XLXN_78(2),
                S0=>mux_addr(9),
                O=>o_do(2));
   
   CalculatePixGain_MUX_DO_3 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(3),
                D1=>XLXN_78(3),
                S0=>mux_addr(9),
                O=>o_do(3));
   
   CalculatePixGain_MUX_DO_4 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(4),
                D1=>XLXN_78(4),
                S0=>mux_addr(9),
                O=>o_do(4));
   
   CalculatePixGain_MUX_DO_5 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(5),
                D1=>XLXN_78(5),
                S0=>mux_addr(9),
                O=>o_do(5));
   
   CalculatePixGain_MUX_DO_6 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(6),
                D1=>XLXN_78(6),
                S0=>mux_addr(9),
                O=>o_do(6));
   
   CalculatePixGain_MUX_DO_7 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(7),
                D1=>XLXN_78(7),
                S0=>mux_addr(9),
                O=>o_do(7));
   
   CalculatePixGain_MUX_DO_8 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(8),
                D1=>XLXN_78(8),
                S0=>mux_addr(9),
                O=>o_do(8));
   
   CalculatePixGain_MUX_DO_9 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(9),
                D1=>XLXN_78(9),
                S0=>mux_addr(9),
                O=>o_do(9));
   
   CalculatePixGain_MUX_DO_10 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(10),
                D1=>XLXN_78(10),
                S0=>mux_addr(9),
                O=>o_do(10));
   
   CalculatePixGain_MUX_DO_11 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(11),
                D1=>XLXN_78(11),
                S0=>mux_addr(9),
                O=>o_do(11));
   
   CalculatePixGain_MUX_DO_12 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(12),
                D1=>XLXN_78(12),
                S0=>mux_addr(9),
                O=>o_do(12));
   
   CalculatePixGain_MUX_DO_13 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(13),
                D1=>XLXN_78(13),
                S0=>mux_addr(9),
                O=>o_do(13));
   
   CalculatePixGain_MUX_DO_14 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(14),
                D1=>XLXN_78(14),
                S0=>mux_addr(9),
                O=>o_do(14));
   
   CalculatePixGain_MUX_DO_15 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(15),
                D1=>XLXN_78(15),
                S0=>mux_addr(9),
                O=>o_do(15));
   
   CalculatePixGain_MUX_DO_16 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(16),
                D1=>XLXN_78(16),
                S0=>mux_addr(9),
                O=>o_do(16));
   
   CalculatePixGain_MUX_DO_17 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(17),
                D1=>XLXN_78(17),
                S0=>mux_addr(9),
                O=>o_do(17));
   
   CalculatePixGain_MUX_DO_18 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(18),
                D1=>XLXN_78(18),
                S0=>mux_addr(9),
                O=>o_do(18));
   
   CalculatePixGain_MUX_DO_19 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(19),
                D1=>XLXN_78(19),
                S0=>mux_addr(9),
                O=>o_do(19));
   
   CalculatePixGain_MUX_DO_20 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(20),
                D1=>XLXN_78(20),
                S0=>mux_addr(9),
                O=>o_do(20));
   
   CalculatePixGain_MUX_DO_21 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(21),
                D1=>XLXN_78(21),
                S0=>mux_addr(9),
                O=>o_do(21));
   
   CalculatePixGain_MUX_DO_22 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(22),
                D1=>XLXN_78(22),
                S0=>mux_addr(9),
                O=>o_do(22));
   
   CalculatePixGain_MUX_DO_23 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(23),
                D1=>XLXN_78(23),
                S0=>mux_addr(9),
                O=>o_do(23));
   
   CalculatePixGain_MUX_DO_24 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(24),
                D1=>XLXN_78(24),
                S0=>mux_addr(9),
                O=>o_do(24));
   
   CalculatePixGain_MUX_DO_25 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(25),
                D1=>XLXN_78(25),
                S0=>mux_addr(9),
                O=>o_do(25));
   
   CalculatePixGain_MUX_DO_26 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(26),
                D1=>XLXN_78(26),
                S0=>mux_addr(9),
                O=>o_do(26));
   
   CalculatePixGain_MUX_DO_27 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(27),
                D1=>XLXN_78(27),
                S0=>mux_addr(9),
                O=>o_do(27));
   
   CalculatePixGain_MUX_DO_28 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(28),
                D1=>XLXN_78(28),
                S0=>mux_addr(9),
                O=>o_do(28));
   
   CalculatePixGain_MUX_DO_29 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(29),
                D1=>XLXN_78(29),
                S0=>mux_addr(9),
                O=>o_do(29));
   
   CalculatePixGain_MUX_DO_30 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(30),
                D1=>XLXN_78(30),
                S0=>mux_addr(9),
                O=>o_do(30));
   
   CalculatePixGain_MUX_DO_31 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(31),
                D1=>XLXN_78(31),
                S0=>mux_addr(9),
                O=>o_do(31));
   
   CalculatePixGain_MUX_fi2fl_a_0 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(0),
                D1=>XLXN_119(0),
                S0=>XLXN_113,
                O=>fixed2floata(0));
   
   CalculatePixGain_MUX_fi2fl_a_1 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(1),
                D1=>XLXN_119(1),
                S0=>XLXN_113,
                O=>fixed2floata(1));
   
   CalculatePixGain_MUX_fi2fl_a_2 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(2),
                D1=>XLXN_119(2),
                S0=>XLXN_113,
                O=>fixed2floata(2));
   
   CalculatePixGain_MUX_fi2fl_a_3 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(3),
                D1=>XLXN_119(3),
                S0=>XLXN_113,
                O=>fixed2floata(3));
   
   CalculatePixGain_MUX_fi2fl_a_4 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(4),
                D1=>XLXN_119(4),
                S0=>XLXN_113,
                O=>fixed2floata(4));
   
   CalculatePixGain_MUX_fi2fl_a_5 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(5),
                D1=>XLXN_119(5),
                S0=>XLXN_113,
                O=>fixed2floata(5));
   
   CalculatePixGain_MUX_fi2fl_a_6 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(6),
                D1=>XLXN_119(6),
                S0=>XLXN_113,
                O=>fixed2floata(6));
   
   CalculatePixGain_MUX_fi2fl_a_7 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(7),
                D1=>XLXN_119(7),
                S0=>XLXN_113,
                O=>fixed2floata(7));
   
   CalculatePixGain_MUX_fi2fl_a_8 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(8),
                D1=>XLXN_119(8),
                S0=>XLXN_113,
                O=>fixed2floata(8));
   
   CalculatePixGain_MUX_fi2fl_a_9 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(9),
                D1=>XLXN_119(9),
                S0=>XLXN_113,
                O=>fixed2floata(9));
   
   CalculatePixGain_MUX_fi2fl_a_10 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(10),
                D1=>XLXN_119(10),
                S0=>XLXN_113,
                O=>fixed2floata(10));
   
   CalculatePixGain_MUX_fi2fl_a_11 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(11),
                D1=>XLXN_119(11),
                S0=>XLXN_113,
                O=>fixed2floata(11));
   
   CalculatePixGain_MUX_fi2fl_a_12 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(12),
                D1=>XLXN_119(12),
                S0=>XLXN_113,
                O=>fixed2floata(12));
   
   CalculatePixGain_MUX_fi2fl_a_13 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(13),
                D1=>XLXN_119(13),
                S0=>XLXN_113,
                O=>fixed2floata(13));
   
   CalculatePixGain_MUX_fi2fl_a_14 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(14),
                D1=>XLXN_119(14),
                S0=>XLXN_113,
                O=>fixed2floata(14));
   
   CalculatePixGain_MUX_fi2fl_a_15 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(15),
                D1=>XLXN_119(15),
                S0=>XLXN_113,
                O=>fixed2floata(15));
   
   CalculatePixGain_MUX_fi2fl_ce : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_133,
                D1=>XLXN_137,
                S0=>XLXN_113,
                O=>fixed2floatce);
   
   CalculatePixGain_MUX_fi2fl_ond : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_132,
                D1=>XLXN_135,
                S0=>XLXN_113,
                O=>fixed2floatond);
   
   CalculatePixGain_MUX_fi2fl_sclr : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_134,
                D1=>XLXN_136,
                S0=>XLXN_113,
                O=>fixed2floatsclr);
   
   CalculatePixGain_MUX_i2c_mem_addra_0 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(0),
                D1=>XLXN_115(0),
                S0=>XLXN_113,
                O=>i2c_mem_addra(0));
   
   CalculatePixGain_MUX_i2c_mem_addra_1 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(1),
                D1=>XLXN_115(1),
                S0=>XLXN_113,
                O=>i2c_mem_addra(1));
   
   CalculatePixGain_MUX_i2c_mem_addra_2 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(2),
                D1=>XLXN_115(2),
                S0=>XLXN_113,
                O=>i2c_mem_addra(2));
   
   CalculatePixGain_MUX_i2c_mem_addra_3 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(3),
                D1=>XLXN_115(3),
                S0=>XLXN_113,
                O=>i2c_mem_addra(3));
   
   CalculatePixGain_MUX_i2c_mem_addra_4 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(4),
                D1=>XLXN_115(4),
                S0=>XLXN_113,
                O=>i2c_mem_addra(4));
   
   CalculatePixGain_MUX_i2c_mem_addra_5 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(5),
                D1=>XLXN_115(5),
                S0=>XLXN_113,
                O=>i2c_mem_addra(5));
   
   CalculatePixGain_MUX_i2c_mem_addra_6 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(6),
                D1=>XLXN_115(6),
                S0=>XLXN_113,
                O=>i2c_mem_addra(6));
   
   CalculatePixGain_MUX_i2c_mem_addra_7 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(7),
                D1=>XLXN_115(7),
                S0=>XLXN_113,
                O=>i2c_mem_addra(7));
   
   CalculatePixGain_MUX_i2c_mem_addra_8 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(8),
                D1=>XLXN_115(8),
                S0=>XLXN_113,
                O=>i2c_mem_addra(8));
   
   CalculatePixGain_MUX_i2c_mem_addra_9 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(9),
                D1=>XLXN_115(9),
                S0=>XLXN_113,
                O=>i2c_mem_addra(9));
   
   CalculatePixGain_MUX_i2c_mem_addra_10 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(10),
                D1=>XLXN_115(10),
                S0=>XLXN_113,
                O=>i2c_mem_addra(10));
   
   CalculatePixGain_MUX_i2c_mem_addra_11 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(11),
                D1=>XLXN_115(11),
                S0=>XLXN_113,
                O=>i2c_mem_addra(11));
   
   CalculatePixGain_MUX_i2c_mem_ena : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_109,
                D1=>XLXN_112,
                S0=>XLXN_113,
                O=>i2c_mem_ena);
   
   CalculatePixGain_mux2_addra_0 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(0),
                D1=>i_addr(0),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(0));
   
   CalculatePixGain_mux2_addra_1 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(1),
                D1=>i_addr(1),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(1));
   
   CalculatePixGain_mux2_addra_2 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(2),
                D1=>i_addr(2),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(2));
   
   CalculatePixGain_mux2_addra_3 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(3),
                D1=>i_addr(3),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(3));
   
   CalculatePixGain_mux2_addra_4 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(4),
                D1=>i_addr(4),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(4));
   
   CalculatePixGain_mux2_addra_5 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(5),
                D1=>i_addr(5),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(5));
   
   CalculatePixGain_mux2_addra_6 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(6),
                D1=>i_addr(6),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(6));
   
   CalculatePixGain_mux2_addra_7 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(7),
                D1=>i_addr(7),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(7));
   
   CalculatePixGain_mux2_addra_8 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(8),
                D1=>i_addr(8),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(8));
   
   CalculatePixGain_mux2_addra_9 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(9),
                D1=>i_addr(9),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(9));
   
   mem_KGain_1 : ramb16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_44(14 downto 0),
                ADDRB(14 downto 0)=>mem_KGain_1_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>mem_KGain_1_CASCADEINA_openSignal,
                CASCADEINB=>mem_KGain_1_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_KGain_1_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_88(31 downto 0),
                DIB(31 downto 0)=>mem_KGain_1_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_KGain_1_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_KGain_1_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_59,
                ENB=>mem_KGain_1_ENB_openSignal,
                REGCEA=>mem_KGain_1_REGCEA_openSignal,
                REGCEB=>mem_KGain_1_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_KGain_1_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_KGain_1_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_79(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   mem_KGain_2 : ramb16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_45(14 downto 0),
                ADDRB(14 downto 0)=>mem_KGain_2_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>mem_KGain_2_CASCADEINA_openSignal,
                CASCADEINB=>mem_KGain_2_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_KGain_2_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_88(31 downto 0),
                DIB(31 downto 0)=>mem_KGain_2_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_KGain_2_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_KGain_2_DIPB_openSignal(3 downto 0),
                ENA=>mux_addr(9),
                ENB=>mem_KGain_2_ENB_openSignal,
                REGCEA=>mem_KGain_2_REGCEA_openSignal,
                REGCEB=>mem_KGain_2_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_KGain_2_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_KGain_2_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_78(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
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
      port map (I=>mux_addr(0),
                O=>XLXN_45(5));
   
   XLXI_8_1 : BUF
      port map (I=>mux_addr(1),
                O=>XLXN_45(6));
   
   XLXI_8_2 : BUF
      port map (I=>mux_addr(2),
                O=>XLXN_45(7));
   
   XLXI_8_3 : BUF
      port map (I=>mux_addr(3),
                O=>XLXN_45(8));
   
   XLXI_8_4 : BUF
      port map (I=>mux_addr(4),
                O=>XLXN_45(9));
   
   XLXI_8_5 : BUF
      port map (I=>mux_addr(5),
                O=>XLXN_45(10));
   
   XLXI_8_6 : BUF
      port map (I=>mux_addr(6),
                O=>XLXN_45(11));
   
   XLXI_8_7 : BUF
      port map (I=>mux_addr(7),
                O=>XLXN_45(12));
   
   XLXI_8_8 : BUF
      port map (I=>mux_addr(8),
                O=>XLXN_45(13));
   
   XLXI_8_9 : BUF
      port map (I=>mux_addr(9),
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
      port map (I=>mux_addr(0),
                O=>XLXN_44(5));
   
   XLXI_11_1 : BUF
      port map (I=>mux_addr(1),
                O=>XLXN_44(6));
   
   XLXI_11_2 : BUF
      port map (I=>mux_addr(2),
                O=>XLXN_44(7));
   
   XLXI_11_3 : BUF
      port map (I=>mux_addr(3),
                O=>XLXN_44(8));
   
   XLXI_11_4 : BUF
      port map (I=>mux_addr(4),
                O=>XLXN_44(9));
   
   XLXI_11_5 : BUF
      port map (I=>mux_addr(5),
                O=>XLXN_44(10));
   
   XLXI_11_6 : BUF
      port map (I=>mux_addr(6),
                O=>XLXN_44(11));
   
   XLXI_11_7 : BUF
      port map (I=>mux_addr(7),
                O=>XLXN_44(12));
   
   XLXI_11_8 : BUF
      port map (I=>mux_addr(8),
                O=>XLXN_44(13));
   
   XLXI_11_9 : BUF
      port map (I=>mux_addr(9),
                O=>XLXN_44(14));
   
   XLXI_12 : INV
      port map (I=>mux_addr(9),
                O=>XLXN_59);
   
   XLXI_29_0 : BUF
      port map (I=>XLXN_140,
                O=>XLXN_139(0));
   
   XLXI_29_1 : BUF
      port map (I=>XLXN_140,
                O=>XLXN_139(1));
   
   XLXI_29_2 : BUF
      port map (I=>XLXN_140,
                O=>XLXN_139(2));
   
   XLXI_29_3 : BUF
      port map (I=>XLXN_140,
                O=>XLXN_139(3));
   
end BEHAVIORAL;

