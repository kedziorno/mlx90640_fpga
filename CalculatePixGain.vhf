--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CalculatePixGain.vhf
-- /___/   /\     Timestamp : 10/15/2024 22:04:23
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculatePixGain.vhf -w /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculatePixGain.sch
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
          o_do            : out   std_logic_vector (31 downto 0); 
          o_rdy           : out   std_logic);
end CalculatePixGain;

architecture BEHAVIORAL of CalculatePixGain is
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
   signal XLXN_118                          : std_logic_vector (63 downto 0);
   signal XLXN_119                          : std_logic_vector (63 downto 0);
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
             fixed2floata    : out   std_logic_vector (63 downto 0); 
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
             fixed2floata         : out   std_logic_vector (63 downto 0); 
             mulfpa               : out   std_logic_vector (31 downto 0); 
             mulfpb               : out   std_logic_vector (31 downto 0));
   end component;
   
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
   
   component M2_1_MXILINX_CalculatePixGain
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
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
   attribute HU_SET of MUX_DIA_0 : label is "MUX_DIA_0_2104";
   attribute HU_SET of MUX_DIA_1 : label is "MUX_DIA_1_2103";
   attribute HU_SET of MUX_DIA_2 : label is "MUX_DIA_2_2102";
   attribute HU_SET of MUX_DIA_3 : label is "MUX_DIA_3_2101";
   attribute HU_SET of MUX_DIA_4 : label is "MUX_DIA_4_2100";
   attribute HU_SET of MUX_DIA_5 : label is "MUX_DIA_5_2099";
   attribute HU_SET of MUX_DIA_6 : label is "MUX_DIA_6_2098";
   attribute HU_SET of MUX_DIA_7 : label is "MUX_DIA_7_2097";
   attribute HU_SET of MUX_DIA_8 : label is "MUX_DIA_8_2096";
   attribute HU_SET of MUX_DIA_9 : label is "MUX_DIA_9_2095";
   attribute HU_SET of MUX_DIA_10 : label is "MUX_DIA_10_2094";
   attribute HU_SET of MUX_DIA_11 : label is "MUX_DIA_11_2093";
   attribute HU_SET of MUX_DIA_12 : label is "MUX_DIA_12_2092";
   attribute HU_SET of MUX_DIA_13 : label is "MUX_DIA_13_2091";
   attribute HU_SET of MUX_DIA_14 : label is "MUX_DIA_14_2090";
   attribute HU_SET of MUX_DIA_15 : label is "MUX_DIA_15_2089";
   attribute HU_SET of MUX_DIA_16 : label is "MUX_DIA_16_2088";
   attribute HU_SET of MUX_DIA_17 : label is "MUX_DIA_17_2087";
   attribute HU_SET of MUX_DIA_18 : label is "MUX_DIA_18_2086";
   attribute HU_SET of MUX_DIA_19 : label is "MUX_DIA_19_2085";
   attribute HU_SET of MUX_DIA_20 : label is "MUX_DIA_20_2084";
   attribute HU_SET of MUX_DIA_21 : label is "MUX_DIA_21_2083";
   attribute HU_SET of MUX_DIA_22 : label is "MUX_DIA_22_2082";
   attribute HU_SET of MUX_DIA_23 : label is "MUX_DIA_23_2081";
   attribute HU_SET of MUX_DIA_24 : label is "MUX_DIA_24_2080";
   attribute HU_SET of MUX_DIA_25 : label is "MUX_DIA_25_2079";
   attribute HU_SET of MUX_DIA_26 : label is "MUX_DIA_26_2078";
   attribute HU_SET of MUX_DIA_27 : label is "MUX_DIA_27_2077";
   attribute HU_SET of MUX_DIA_28 : label is "MUX_DIA_28_2076";
   attribute HU_SET of MUX_DIA_29 : label is "MUX_DIA_29_2075";
   attribute HU_SET of MUX_DIA_30 : label is "MUX_DIA_30_2074";
   attribute HU_SET of MUX_DIA_31 : label is "MUX_DIA_31_2073";
   attribute HU_SET of MUX_DO_0 : label is "MUX_DO_0_2062";
   attribute HU_SET of MUX_DO_1 : label is "MUX_DO_1_2061";
   attribute HU_SET of MUX_DO_2 : label is "MUX_DO_2_2060";
   attribute HU_SET of MUX_DO_3 : label is "MUX_DO_3_2059";
   attribute HU_SET of MUX_DO_4 : label is "MUX_DO_4_2058";
   attribute HU_SET of MUX_DO_5 : label is "MUX_DO_5_2057";
   attribute HU_SET of MUX_DO_6 : label is "MUX_DO_6_2056";
   attribute HU_SET of MUX_DO_7 : label is "MUX_DO_7_2055";
   attribute HU_SET of MUX_DO_8 : label is "MUX_DO_8_2054";
   attribute HU_SET of MUX_DO_9 : label is "MUX_DO_9_2053";
   attribute HU_SET of MUX_DO_10 : label is "MUX_DO_10_2052";
   attribute HU_SET of MUX_DO_11 : label is "MUX_DO_11_2051";
   attribute HU_SET of MUX_DO_12 : label is "MUX_DO_12_2050";
   attribute HU_SET of MUX_DO_13 : label is "MUX_DO_13_2049";
   attribute HU_SET of MUX_DO_14 : label is "MUX_DO_14_2048";
   attribute HU_SET of MUX_DO_15 : label is "MUX_DO_15_2047";
   attribute HU_SET of MUX_DO_16 : label is "MUX_DO_16_2046";
   attribute HU_SET of MUX_DO_17 : label is "MUX_DO_17_2045";
   attribute HU_SET of MUX_DO_18 : label is "MUX_DO_18_2044";
   attribute HU_SET of MUX_DO_19 : label is "MUX_DO_19_2043";
   attribute HU_SET of MUX_DO_20 : label is "MUX_DO_20_2042";
   attribute HU_SET of MUX_DO_21 : label is "MUX_DO_21_2041";
   attribute HU_SET of MUX_DO_22 : label is "MUX_DO_22_2040";
   attribute HU_SET of MUX_DO_23 : label is "MUX_DO_23_2039";
   attribute HU_SET of MUX_DO_24 : label is "MUX_DO_24_2038";
   attribute HU_SET of MUX_DO_25 : label is "MUX_DO_25_2037";
   attribute HU_SET of MUX_DO_26 : label is "MUX_DO_26_2036";
   attribute HU_SET of MUX_DO_27 : label is "MUX_DO_27_2035";
   attribute HU_SET of MUX_DO_28 : label is "MUX_DO_28_2034";
   attribute HU_SET of MUX_DO_29 : label is "MUX_DO_29_2033";
   attribute HU_SET of MUX_DO_30 : label is "MUX_DO_30_2032";
   attribute HU_SET of MUX_DO_31 : label is "MUX_DO_31_2031";
   attribute HU_SET of MUX_F2FA_0 : label is "MUX_F2FA_0_2181";
   attribute HU_SET of MUX_F2FA_1 : label is "MUX_F2FA_1_2180";
   attribute HU_SET of MUX_F2FA_2 : label is "MUX_F2FA_2_2179";
   attribute HU_SET of MUX_F2FA_3 : label is "MUX_F2FA_3_2178";
   attribute HU_SET of MUX_F2FA_4 : label is "MUX_F2FA_4_2177";
   attribute HU_SET of MUX_F2FA_5 : label is "MUX_F2FA_5_2176";
   attribute HU_SET of MUX_F2FA_6 : label is "MUX_F2FA_6_2175";
   attribute HU_SET of MUX_F2FA_7 : label is "MUX_F2FA_7_2174";
   attribute HU_SET of MUX_F2FA_8 : label is "MUX_F2FA_8_2173";
   attribute HU_SET of MUX_F2FA_9 : label is "MUX_F2FA_9_2172";
   attribute HU_SET of MUX_F2FA_10 : label is "MUX_F2FA_10_2171";
   attribute HU_SET of MUX_F2FA_11 : label is "MUX_F2FA_11_2170";
   attribute HU_SET of MUX_F2FA_12 : label is "MUX_F2FA_12_2169";
   attribute HU_SET of MUX_F2FA_13 : label is "MUX_F2FA_13_2168";
   attribute HU_SET of MUX_F2FA_14 : label is "MUX_F2FA_14_2167";
   attribute HU_SET of MUX_F2FA_15 : label is "MUX_F2FA_15_2166";
   attribute HU_SET of MUX_F2FA_16 : label is "MUX_F2FA_16_2165";
   attribute HU_SET of MUX_F2FA_17 : label is "MUX_F2FA_17_2164";
   attribute HU_SET of MUX_F2FA_18 : label is "MUX_F2FA_18_2163";
   attribute HU_SET of MUX_F2FA_19 : label is "MUX_F2FA_19_2162";
   attribute HU_SET of MUX_F2FA_20 : label is "MUX_F2FA_20_2161";
   attribute HU_SET of MUX_F2FA_21 : label is "MUX_F2FA_21_2160";
   attribute HU_SET of MUX_F2FA_22 : label is "MUX_F2FA_22_2159";
   attribute HU_SET of MUX_F2FA_23 : label is "MUX_F2FA_23_2158";
   attribute HU_SET of MUX_F2FA_24 : label is "MUX_F2FA_24_2157";
   attribute HU_SET of MUX_F2FA_25 : label is "MUX_F2FA_25_2156";
   attribute HU_SET of MUX_F2FA_26 : label is "MUX_F2FA_26_2155";
   attribute HU_SET of MUX_F2FA_27 : label is "MUX_F2FA_27_2154";
   attribute HU_SET of MUX_F2FA_28 : label is "MUX_F2FA_28_2153";
   attribute HU_SET of MUX_F2FA_29 : label is "MUX_F2FA_29_2152";
   attribute HU_SET of MUX_F2FA_30 : label is "MUX_F2FA_30_2151";
   attribute HU_SET of MUX_F2FA_31 : label is "MUX_F2FA_31_2150";
   attribute HU_SET of MUX_F2FA_32 : label is "MUX_F2FA_32_2149";
   attribute HU_SET of MUX_F2FA_33 : label is "MUX_F2FA_33_2148";
   attribute HU_SET of MUX_F2FA_34 : label is "MUX_F2FA_34_2147";
   attribute HU_SET of MUX_F2FA_35 : label is "MUX_F2FA_35_2146";
   attribute HU_SET of MUX_F2FA_36 : label is "MUX_F2FA_36_2145";
   attribute HU_SET of MUX_F2FA_37 : label is "MUX_F2FA_37_2144";
   attribute HU_SET of MUX_F2FA_38 : label is "MUX_F2FA_38_2143";
   attribute HU_SET of MUX_F2FA_39 : label is "MUX_F2FA_39_2142";
   attribute HU_SET of MUX_F2FA_40 : label is "MUX_F2FA_40_2141";
   attribute HU_SET of MUX_F2FA_41 : label is "MUX_F2FA_41_2140";
   attribute HU_SET of MUX_F2FA_42 : label is "MUX_F2FA_42_2139";
   attribute HU_SET of MUX_F2FA_43 : label is "MUX_F2FA_43_2138";
   attribute HU_SET of MUX_F2FA_44 : label is "MUX_F2FA_44_2137";
   attribute HU_SET of MUX_F2FA_45 : label is "MUX_F2FA_45_2136";
   attribute HU_SET of MUX_F2FA_46 : label is "MUX_F2FA_46_2135";
   attribute HU_SET of MUX_F2FA_47 : label is "MUX_F2FA_47_2134";
   attribute HU_SET of MUX_F2FA_48 : label is "MUX_F2FA_48_2133";
   attribute HU_SET of MUX_F2FA_49 : label is "MUX_F2FA_49_2132";
   attribute HU_SET of MUX_F2FA_50 : label is "MUX_F2FA_50_2131";
   attribute HU_SET of MUX_F2FA_51 : label is "MUX_F2FA_51_2130";
   attribute HU_SET of MUX_F2FA_52 : label is "MUX_F2FA_52_2129";
   attribute HU_SET of MUX_F2FA_53 : label is "MUX_F2FA_53_2128";
   attribute HU_SET of MUX_F2FA_54 : label is "MUX_F2FA_54_2127";
   attribute HU_SET of MUX_F2FA_55 : label is "MUX_F2FA_55_2126";
   attribute HU_SET of MUX_F2FA_56 : label is "MUX_F2FA_56_2125";
   attribute HU_SET of MUX_F2FA_57 : label is "MUX_F2FA_57_2124";
   attribute HU_SET of MUX_F2FA_58 : label is "MUX_F2FA_58_2123";
   attribute HU_SET of MUX_F2FA_59 : label is "MUX_F2FA_59_2122";
   attribute HU_SET of MUX_F2FA_60 : label is "MUX_F2FA_60_2121";
   attribute HU_SET of MUX_F2FA_61 : label is "MUX_F2FA_61_2120";
   attribute HU_SET of MUX_F2FA_62 : label is "MUX_F2FA_62_2119";
   attribute HU_SET of MUX_F2FA_63 : label is "MUX_F2FA_63_2118";
   attribute HU_SET of MUX_I2C_ADDR_0 : label is "MUX_I2C_ADDR_0_2117";
   attribute HU_SET of MUX_I2C_ADDR_1 : label is "MUX_I2C_ADDR_1_2116";
   attribute HU_SET of MUX_I2C_ADDR_2 : label is "MUX_I2C_ADDR_2_2115";
   attribute HU_SET of MUX_I2C_ADDR_3 : label is "MUX_I2C_ADDR_3_2114";
   attribute HU_SET of MUX_I2C_ADDR_4 : label is "MUX_I2C_ADDR_4_2113";
   attribute HU_SET of MUX_I2C_ADDR_5 : label is "MUX_I2C_ADDR_5_2112";
   attribute HU_SET of MUX_I2C_ADDR_6 : label is "MUX_I2C_ADDR_6_2111";
   attribute HU_SET of MUX_I2C_ADDR_7 : label is "MUX_I2C_ADDR_7_2110";
   attribute HU_SET of MUX_I2C_ADDR_8 : label is "MUX_I2C_ADDR_8_2109";
   attribute HU_SET of MUX_I2C_ADDR_9 : label is "MUX_I2C_ADDR_9_2108";
   attribute HU_SET of MUX_I2C_ADDR_10 : label is "MUX_I2C_ADDR_10_2107";
   attribute HU_SET of MUX_I2C_ADDR_11 : label is "MUX_I2C_ADDR_11_2106";
   attribute HU_SET of mux2_addra_0 : label is "mux2_addra_0_2072";
   attribute HU_SET of mux2_addra_1 : label is "mux2_addra_1_2071";
   attribute HU_SET of mux2_addra_2 : label is "mux2_addra_2_2070";
   attribute HU_SET of mux2_addra_3 : label is "mux2_addra_3_2069";
   attribute HU_SET of mux2_addra_4 : label is "mux2_addra_4_2068";
   attribute HU_SET of mux2_addra_5 : label is "mux2_addra_5_2067";
   attribute HU_SET of mux2_addra_6 : label is "mux2_addra_6_2066";
   attribute HU_SET of mux2_addra_7 : label is "mux2_addra_7_2065";
   attribute HU_SET of mux2_addra_8 : label is "mux2_addra_8_2064";
   attribute HU_SET of mux2_addra_9 : label is "mux2_addra_9_2063";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_2105";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_2182";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_2183";
   attribute HU_SET of XLXI_27 : label is "XLXI_27_2184";
begin
   XLXN_158(31 downto 0) <= x"00000000";
   o_rdy <= o_rdy_DUMMY;
   inst_CalcKGain_proc0 : CalculateKGain_process_p0
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
                fixed2floata(63 downto 0)=>XLXN_119(63 downto 0),
                fixed2floatce=>XLXN_137,
                fixed2floatond=>XLXN_135,
                fixed2floatsclr=>XLXN_136,
                i2c_mem_addra(11 downto 0)=>XLXN_115(11 downto 0),
                i2c_mem_ena=>XLXN_112,
                o_KGain(31 downto 0)=>XLXN_141(31 downto 0),
                o_rdy=>XLXN_155);
   
   inst_CalcPixGain_proc0 : CalculatePixGain_process_p0
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
                fixed2floata(63 downto 0)=>XLXN_118(63 downto 0),
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
   
   mem_KGain_1 : RAMB16
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
   
   mem_KGain_2 : RAMB16
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
   
   MUX_DIA_0 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(0),
                D1=>XLXN_158(0),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(0));
   
   MUX_DIA_1 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(1),
                D1=>XLXN_158(1),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(1));
   
   MUX_DIA_2 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(2),
                D1=>XLXN_158(2),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(2));
   
   MUX_DIA_3 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(3),
                D1=>XLXN_158(3),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(3));
   
   MUX_DIA_4 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(4),
                D1=>XLXN_158(4),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(4));
   
   MUX_DIA_5 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(5),
                D1=>XLXN_158(5),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(5));
   
   MUX_DIA_6 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(6),
                D1=>XLXN_158(6),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(6));
   
   MUX_DIA_7 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(7),
                D1=>XLXN_158(7),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(7));
   
   MUX_DIA_8 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(8),
                D1=>XLXN_158(8),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(8));
   
   MUX_DIA_9 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(9),
                D1=>XLXN_158(9),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(9));
   
   MUX_DIA_10 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(10),
                D1=>XLXN_158(10),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(10));
   
   MUX_DIA_11 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(11),
                D1=>XLXN_158(11),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(11));
   
   MUX_DIA_12 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(12),
                D1=>XLXN_158(12),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(12));
   
   MUX_DIA_13 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(13),
                D1=>XLXN_158(13),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(13));
   
   MUX_DIA_14 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(14),
                D1=>XLXN_158(14),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(14));
   
   MUX_DIA_15 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(15),
                D1=>XLXN_158(15),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(15));
   
   MUX_DIA_16 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(16),
                D1=>XLXN_158(16),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(16));
   
   MUX_DIA_17 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(17),
                D1=>XLXN_158(17),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(17));
   
   MUX_DIA_18 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(18),
                D1=>XLXN_158(18),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(18));
   
   MUX_DIA_19 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(19),
                D1=>XLXN_158(19),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(19));
   
   MUX_DIA_20 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(20),
                D1=>XLXN_158(20),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(20));
   
   MUX_DIA_21 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(21),
                D1=>XLXN_158(21),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(21));
   
   MUX_DIA_22 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(22),
                D1=>XLXN_158(22),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(22));
   
   MUX_DIA_23 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(23),
                D1=>XLXN_158(23),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(23));
   
   MUX_DIA_24 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(24),
                D1=>XLXN_158(24),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(24));
   
   MUX_DIA_25 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(25),
                D1=>XLXN_158(25),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(25));
   
   MUX_DIA_26 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(26),
                D1=>XLXN_158(26),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(26));
   
   MUX_DIA_27 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(27),
                D1=>XLXN_158(27),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(27));
   
   MUX_DIA_28 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(28),
                D1=>XLXN_158(28),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(28));
   
   MUX_DIA_29 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(29),
                D1=>XLXN_158(29),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(29));
   
   MUX_DIA_30 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(30),
                D1=>XLXN_158(30),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(30));
   
   MUX_DIA_31 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_157(31),
                D1=>XLXN_158(31),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(31));
   
   MUX_DO_0 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(0),
                D1=>XLXN_78(0),
                S0=>mux_addr(9),
                O=>o_do(0));
   
   MUX_DO_1 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(1),
                D1=>XLXN_78(1),
                S0=>mux_addr(9),
                O=>o_do(1));
   
   MUX_DO_2 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(2),
                D1=>XLXN_78(2),
                S0=>mux_addr(9),
                O=>o_do(2));
   
   MUX_DO_3 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(3),
                D1=>XLXN_78(3),
                S0=>mux_addr(9),
                O=>o_do(3));
   
   MUX_DO_4 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(4),
                D1=>XLXN_78(4),
                S0=>mux_addr(9),
                O=>o_do(4));
   
   MUX_DO_5 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(5),
                D1=>XLXN_78(5),
                S0=>mux_addr(9),
                O=>o_do(5));
   
   MUX_DO_6 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(6),
                D1=>XLXN_78(6),
                S0=>mux_addr(9),
                O=>o_do(6));
   
   MUX_DO_7 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(7),
                D1=>XLXN_78(7),
                S0=>mux_addr(9),
                O=>o_do(7));
   
   MUX_DO_8 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(8),
                D1=>XLXN_78(8),
                S0=>mux_addr(9),
                O=>o_do(8));
   
   MUX_DO_9 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(9),
                D1=>XLXN_78(9),
                S0=>mux_addr(9),
                O=>o_do(9));
   
   MUX_DO_10 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(10),
                D1=>XLXN_78(10),
                S0=>mux_addr(9),
                O=>o_do(10));
   
   MUX_DO_11 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(11),
                D1=>XLXN_78(11),
                S0=>mux_addr(9),
                O=>o_do(11));
   
   MUX_DO_12 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(12),
                D1=>XLXN_78(12),
                S0=>mux_addr(9),
                O=>o_do(12));
   
   MUX_DO_13 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(13),
                D1=>XLXN_78(13),
                S0=>mux_addr(9),
                O=>o_do(13));
   
   MUX_DO_14 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(14),
                D1=>XLXN_78(14),
                S0=>mux_addr(9),
                O=>o_do(14));
   
   MUX_DO_15 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(15),
                D1=>XLXN_78(15),
                S0=>mux_addr(9),
                O=>o_do(15));
   
   MUX_DO_16 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(16),
                D1=>XLXN_78(16),
                S0=>mux_addr(9),
                O=>o_do(16));
   
   MUX_DO_17 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(17),
                D1=>XLXN_78(17),
                S0=>mux_addr(9),
                O=>o_do(17));
   
   MUX_DO_18 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(18),
                D1=>XLXN_78(18),
                S0=>mux_addr(9),
                O=>o_do(18));
   
   MUX_DO_19 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(19),
                D1=>XLXN_78(19),
                S0=>mux_addr(9),
                O=>o_do(19));
   
   MUX_DO_20 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(20),
                D1=>XLXN_78(20),
                S0=>mux_addr(9),
                O=>o_do(20));
   
   MUX_DO_21 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(21),
                D1=>XLXN_78(21),
                S0=>mux_addr(9),
                O=>o_do(21));
   
   MUX_DO_22 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(22),
                D1=>XLXN_78(22),
                S0=>mux_addr(9),
                O=>o_do(22));
   
   MUX_DO_23 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(23),
                D1=>XLXN_78(23),
                S0=>mux_addr(9),
                O=>o_do(23));
   
   MUX_DO_24 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(24),
                D1=>XLXN_78(24),
                S0=>mux_addr(9),
                O=>o_do(24));
   
   MUX_DO_25 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(25),
                D1=>XLXN_78(25),
                S0=>mux_addr(9),
                O=>o_do(25));
   
   MUX_DO_26 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(26),
                D1=>XLXN_78(26),
                S0=>mux_addr(9),
                O=>o_do(26));
   
   MUX_DO_27 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(27),
                D1=>XLXN_78(27),
                S0=>mux_addr(9),
                O=>o_do(27));
   
   MUX_DO_28 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(28),
                D1=>XLXN_78(28),
                S0=>mux_addr(9),
                O=>o_do(28));
   
   MUX_DO_29 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(29),
                D1=>XLXN_78(29),
                S0=>mux_addr(9),
                O=>o_do(29));
   
   MUX_DO_30 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(30),
                D1=>XLXN_78(30),
                S0=>mux_addr(9),
                O=>o_do(30));
   
   MUX_DO_31 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_79(31),
                D1=>XLXN_78(31),
                S0=>mux_addr(9),
                O=>o_do(31));
   
   MUX_F2FA_0 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(0),
                D1=>XLXN_119(0),
                S0=>XLXN_113,
                O=>fixed2floata(0));
   
   MUX_F2FA_1 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(1),
                D1=>XLXN_119(1),
                S0=>XLXN_113,
                O=>fixed2floata(1));
   
   MUX_F2FA_2 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(2),
                D1=>XLXN_119(2),
                S0=>XLXN_113,
                O=>fixed2floata(2));
   
   MUX_F2FA_3 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(3),
                D1=>XLXN_119(3),
                S0=>XLXN_113,
                O=>fixed2floata(3));
   
   MUX_F2FA_4 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(4),
                D1=>XLXN_119(4),
                S0=>XLXN_113,
                O=>fixed2floata(4));
   
   MUX_F2FA_5 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(5),
                D1=>XLXN_119(5),
                S0=>XLXN_113,
                O=>fixed2floata(5));
   
   MUX_F2FA_6 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(6),
                D1=>XLXN_119(6),
                S0=>XLXN_113,
                O=>fixed2floata(6));
   
   MUX_F2FA_7 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(7),
                D1=>XLXN_119(7),
                S0=>XLXN_113,
                O=>fixed2floata(7));
   
   MUX_F2FA_8 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(8),
                D1=>XLXN_119(8),
                S0=>XLXN_113,
                O=>fixed2floata(8));
   
   MUX_F2FA_9 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(9),
                D1=>XLXN_119(9),
                S0=>XLXN_113,
                O=>fixed2floata(9));
   
   MUX_F2FA_10 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(10),
                D1=>XLXN_119(10),
                S0=>XLXN_113,
                O=>fixed2floata(10));
   
   MUX_F2FA_11 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(11),
                D1=>XLXN_119(11),
                S0=>XLXN_113,
                O=>fixed2floata(11));
   
   MUX_F2FA_12 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(12),
                D1=>XLXN_119(12),
                S0=>XLXN_113,
                O=>fixed2floata(12));
   
   MUX_F2FA_13 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(13),
                D1=>XLXN_119(13),
                S0=>XLXN_113,
                O=>fixed2floata(13));
   
   MUX_F2FA_14 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(14),
                D1=>XLXN_119(14),
                S0=>XLXN_113,
                O=>fixed2floata(14));
   
   MUX_F2FA_15 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(15),
                D1=>XLXN_119(15),
                S0=>XLXN_113,
                O=>fixed2floata(15));
   
   MUX_F2FA_16 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(16),
                D1=>XLXN_119(16),
                S0=>XLXN_113,
                O=>fixed2floata(16));
   
   MUX_F2FA_17 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(17),
                D1=>XLXN_119(17),
                S0=>XLXN_113,
                O=>fixed2floata(17));
   
   MUX_F2FA_18 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(18),
                D1=>XLXN_119(18),
                S0=>XLXN_113,
                O=>fixed2floata(18));
   
   MUX_F2FA_19 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(19),
                D1=>XLXN_119(19),
                S0=>XLXN_113,
                O=>fixed2floata(19));
   
   MUX_F2FA_20 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(20),
                D1=>XLXN_119(20),
                S0=>XLXN_113,
                O=>fixed2floata(20));
   
   MUX_F2FA_21 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(21),
                D1=>XLXN_119(21),
                S0=>XLXN_113,
                O=>fixed2floata(21));
   
   MUX_F2FA_22 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(22),
                D1=>XLXN_119(22),
                S0=>XLXN_113,
                O=>fixed2floata(22));
   
   MUX_F2FA_23 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(23),
                D1=>XLXN_119(23),
                S0=>XLXN_113,
                O=>fixed2floata(23));
   
   MUX_F2FA_24 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(24),
                D1=>XLXN_119(24),
                S0=>XLXN_113,
                O=>fixed2floata(24));
   
   MUX_F2FA_25 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(25),
                D1=>XLXN_119(25),
                S0=>XLXN_113,
                O=>fixed2floata(25));
   
   MUX_F2FA_26 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(26),
                D1=>XLXN_119(26),
                S0=>XLXN_113,
                O=>fixed2floata(26));
   
   MUX_F2FA_27 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(27),
                D1=>XLXN_119(27),
                S0=>XLXN_113,
                O=>fixed2floata(27));
   
   MUX_F2FA_28 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(28),
                D1=>XLXN_119(28),
                S0=>XLXN_113,
                O=>fixed2floata(28));
   
   MUX_F2FA_29 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(29),
                D1=>XLXN_119(29),
                S0=>XLXN_113,
                O=>fixed2floata(29));
   
   MUX_F2FA_30 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(30),
                D1=>XLXN_119(30),
                S0=>XLXN_113,
                O=>fixed2floata(30));
   
   MUX_F2FA_31 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(31),
                D1=>XLXN_119(31),
                S0=>XLXN_113,
                O=>fixed2floata(31));
   
   MUX_F2FA_32 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(32),
                D1=>XLXN_119(32),
                S0=>XLXN_113,
                O=>fixed2floata(32));
   
   MUX_F2FA_33 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(33),
                D1=>XLXN_119(33),
                S0=>XLXN_113,
                O=>fixed2floata(33));
   
   MUX_F2FA_34 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(34),
                D1=>XLXN_119(34),
                S0=>XLXN_113,
                O=>fixed2floata(34));
   
   MUX_F2FA_35 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(35),
                D1=>XLXN_119(35),
                S0=>XLXN_113,
                O=>fixed2floata(35));
   
   MUX_F2FA_36 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(36),
                D1=>XLXN_119(36),
                S0=>XLXN_113,
                O=>fixed2floata(36));
   
   MUX_F2FA_37 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(37),
                D1=>XLXN_119(37),
                S0=>XLXN_113,
                O=>fixed2floata(37));
   
   MUX_F2FA_38 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(38),
                D1=>XLXN_119(38),
                S0=>XLXN_113,
                O=>fixed2floata(38));
   
   MUX_F2FA_39 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(39),
                D1=>XLXN_119(39),
                S0=>XLXN_113,
                O=>fixed2floata(39));
   
   MUX_F2FA_40 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(40),
                D1=>XLXN_119(40),
                S0=>XLXN_113,
                O=>fixed2floata(40));
   
   MUX_F2FA_41 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(41),
                D1=>XLXN_119(41),
                S0=>XLXN_113,
                O=>fixed2floata(41));
   
   MUX_F2FA_42 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(42),
                D1=>XLXN_119(42),
                S0=>XLXN_113,
                O=>fixed2floata(42));
   
   MUX_F2FA_43 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(43),
                D1=>XLXN_119(43),
                S0=>XLXN_113,
                O=>fixed2floata(43));
   
   MUX_F2FA_44 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(44),
                D1=>XLXN_119(44),
                S0=>XLXN_113,
                O=>fixed2floata(44));
   
   MUX_F2FA_45 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(45),
                D1=>XLXN_119(45),
                S0=>XLXN_113,
                O=>fixed2floata(45));
   
   MUX_F2FA_46 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(46),
                D1=>XLXN_119(46),
                S0=>XLXN_113,
                O=>fixed2floata(46));
   
   MUX_F2FA_47 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(47),
                D1=>XLXN_119(47),
                S0=>XLXN_113,
                O=>fixed2floata(47));
   
   MUX_F2FA_48 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(48),
                D1=>XLXN_119(48),
                S0=>XLXN_113,
                O=>fixed2floata(48));
   
   MUX_F2FA_49 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(49),
                D1=>XLXN_119(49),
                S0=>XLXN_113,
                O=>fixed2floata(49));
   
   MUX_F2FA_50 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(50),
                D1=>XLXN_119(50),
                S0=>XLXN_113,
                O=>fixed2floata(50));
   
   MUX_F2FA_51 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(51),
                D1=>XLXN_119(51),
                S0=>XLXN_113,
                O=>fixed2floata(51));
   
   MUX_F2FA_52 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(52),
                D1=>XLXN_119(52),
                S0=>XLXN_113,
                O=>fixed2floata(52));
   
   MUX_F2FA_53 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(53),
                D1=>XLXN_119(53),
                S0=>XLXN_113,
                O=>fixed2floata(53));
   
   MUX_F2FA_54 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(54),
                D1=>XLXN_119(54),
                S0=>XLXN_113,
                O=>fixed2floata(54));
   
   MUX_F2FA_55 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(55),
                D1=>XLXN_119(55),
                S0=>XLXN_113,
                O=>fixed2floata(55));
   
   MUX_F2FA_56 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(56),
                D1=>XLXN_119(56),
                S0=>XLXN_113,
                O=>fixed2floata(56));
   
   MUX_F2FA_57 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(57),
                D1=>XLXN_119(57),
                S0=>XLXN_113,
                O=>fixed2floata(57));
   
   MUX_F2FA_58 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(58),
                D1=>XLXN_119(58),
                S0=>XLXN_113,
                O=>fixed2floata(58));
   
   MUX_F2FA_59 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(59),
                D1=>XLXN_119(59),
                S0=>XLXN_113,
                O=>fixed2floata(59));
   
   MUX_F2FA_60 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(60),
                D1=>XLXN_119(60),
                S0=>XLXN_113,
                O=>fixed2floata(60));
   
   MUX_F2FA_61 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(61),
                D1=>XLXN_119(61),
                S0=>XLXN_113,
                O=>fixed2floata(61));
   
   MUX_F2FA_62 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(62),
                D1=>XLXN_119(62),
                S0=>XLXN_113,
                O=>fixed2floata(62));
   
   MUX_F2FA_63 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(63),
                D1=>XLXN_119(63),
                S0=>XLXN_113,
                O=>fixed2floata(63));
   
   MUX_I2C_ADDR_0 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(0),
                D1=>XLXN_115(0),
                S0=>XLXN_113,
                O=>i2c_mem_addra(0));
   
   MUX_I2C_ADDR_1 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(1),
                D1=>XLXN_115(1),
                S0=>XLXN_113,
                O=>i2c_mem_addra(1));
   
   MUX_I2C_ADDR_2 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(2),
                D1=>XLXN_115(2),
                S0=>XLXN_113,
                O=>i2c_mem_addra(2));
   
   MUX_I2C_ADDR_3 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(3),
                D1=>XLXN_115(3),
                S0=>XLXN_113,
                O=>i2c_mem_addra(3));
   
   MUX_I2C_ADDR_4 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(4),
                D1=>XLXN_115(4),
                S0=>XLXN_113,
                O=>i2c_mem_addra(4));
   
   MUX_I2C_ADDR_5 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(5),
                D1=>XLXN_115(5),
                S0=>XLXN_113,
                O=>i2c_mem_addra(5));
   
   MUX_I2C_ADDR_6 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(6),
                D1=>XLXN_115(6),
                S0=>XLXN_113,
                O=>i2c_mem_addra(6));
   
   MUX_I2C_ADDR_7 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(7),
                D1=>XLXN_115(7),
                S0=>XLXN_113,
                O=>i2c_mem_addra(7));
   
   MUX_I2C_ADDR_8 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(8),
                D1=>XLXN_115(8),
                S0=>XLXN_113,
                O=>i2c_mem_addra(8));
   
   MUX_I2C_ADDR_9 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(9),
                D1=>XLXN_115(9),
                S0=>XLXN_113,
                O=>i2c_mem_addra(9));
   
   MUX_I2C_ADDR_10 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(10),
                D1=>XLXN_115(10),
                S0=>XLXN_113,
                O=>i2c_mem_addra(10));
   
   MUX_I2C_ADDR_11 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_114(11),
                D1=>XLXN_115(11),
                S0=>XLXN_113,
                O=>i2c_mem_addra(11));
   
   mux2_addra_0 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(0),
                D1=>i_addr(0),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(0));
   
   mux2_addra_1 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(1),
                D1=>i_addr(1),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(1));
   
   mux2_addra_2 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(2),
                D1=>i_addr(2),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(2));
   
   mux2_addra_3 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(3),
                D1=>i_addr(3),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(3));
   
   mux2_addra_4 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(4),
                D1=>i_addr(4),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(4));
   
   mux2_addra_5 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(5),
                D1=>i_addr(5),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(5));
   
   mux2_addra_6 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(6),
                D1=>i_addr(6),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(6));
   
   mux2_addra_7 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(7),
                D1=>i_addr(7),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(7));
   
   mux2_addra_8 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(8),
                D1=>i_addr(8),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(8));
   
   mux2_addra_9 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_86(9),
                D1=>i_addr(9),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(9));
   
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
   
   XLXI_21 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_109,
                D1=>XLXN_112,
                S0=>XLXN_113,
                O=>i2c_mem_ena);
   
   XLXI_24 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_132,
                D1=>XLXN_135,
                S0=>XLXN_113,
                O=>fixed2floatond);
   
   XLXI_26 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_134,
                D1=>XLXN_136,
                S0=>XLXN_113,
                O=>fixed2floatsclr);
   
   XLXI_27 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_133,
                D1=>XLXN_137,
                S0=>XLXN_113,
                O=>fixed2floatce);
   
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


