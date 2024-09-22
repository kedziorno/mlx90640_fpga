--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ExtractOffsetParameters.vhf
-- /___/   /\     Timestamp : 09/22/2024 19:44:36
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractOffsetParameters.vhf -w /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractOffsetParameters.sch
--Design Name: ExtractOffsetParameters
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

entity M2_1_MXILINX_ExtractOffsetParameters is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_ExtractOffsetParameters;

architecture BEHAVIORAL of M2_1_MXILINX_ExtractOffsetParameters is
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

entity ExtractOffsetParameters is
   port ( addfpr          : in    std_logic_vector (31 downto 0); 
          addfprdy        : in    std_logic; 
          fixed2floatr    : in    std_logic_vector (31 downto 0); 
          fixed2floatrdy  : in    std_logic; 
          i_addr          : in    std_logic_vector (9 downto 0); 
          i_clock         : in    std_logic; 
          i_reset         : in    std_logic; 
          i_run           : in    std_logic; 
          i2c_mem_douta   : in    std_logic_vector (7 downto 0); 
          mulfpr          : in    std_logic_vector (31 downto 0); 
          mulfprdy        : in    std_logic; 
          addfpa          : out   std_logic_vector (31 downto 0); 
          addfpb          : out   std_logic_vector (31 downto 0); 
          addfpce         : out   std_logic; 
          addfpond        : out   std_logic; 
          addfpsclr       : out   std_logic; 
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
end ExtractOffsetParameters;

architecture BEHAVIORAL of ExtractOffsetParameters is
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
   signal addra1                                   : std_logic_vector (14 
         downto 0);
   signal addra2                                   : std_logic_vector (14 
         downto 0);
   signal doa1                                     : std_logic_vector (31 
         downto 0);
   signal doa2                                     : std_logic_vector (31 
         downto 0);
   signal mux_addr1                                : std_logic_vector (9 downto 
         0);
   signal nibble_in1                               : std_logic_vector (31 
         downto 0);
   signal nibble_in2                               : std_logic_vector (31 
         downto 0);
   signal nibble_in3                               : std_logic_vector (31 
         downto 0);
   signal nibble_in4                               : std_logic_vector (31 
         downto 0);
   signal nibble_out1                              : std_logic_vector (3 downto 
         0);
   signal nibble_out2                              : std_logic_vector (3 downto 
         0);
   signal nibble_out3                              : std_logic_vector (5 downto 
         0);
   signal nibble_out4                              : std_logic_vector (3 downto 
         0);
   signal o_addra                                  : std_logic_vector (9 downto 
         0);
   signal o_dia                                    : std_logic_vector (31 
         downto 0);
   signal write_enable                             : std_logic;
   signal XLXN_59                                  : std_logic;
   signal XLXN_139                                 : std_logic_vector (3 downto 
         0);
   signal XLXN_169                                 : std_logic_vector (31 
         downto 0);
   signal XLXN_179                                 : std_logic_vector (31 
         downto 0);
   signal XLXN_180                                 : std_logic_vector (31 
         downto 0);
   signal o_rdy_DUMMY                              : std_logic;
   signal mem_extroffparam_1_ADDRB_openSignal      : std_logic_vector (14 
         downto 0);
   signal mem_extroffparam_1_CASCADEINA_openSignal : std_logic;
   signal mem_extroffparam_1_CASCADEINB_openSignal : std_logic;
   signal mem_extroffparam_1_CLKB_openSignal       : std_logic;
   signal mem_extroffparam_1_DIB_openSignal        : std_logic_vector (31 
         downto 0);
   signal mem_extroffparam_1_DIPA_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extroffparam_1_DIPB_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extroffparam_1_ENB_openSignal        : std_logic;
   signal mem_extroffparam_1_REGCEA_openSignal     : std_logic;
   signal mem_extroffparam_1_REGCEB_openSignal     : std_logic;
   signal mem_extroffparam_1_SSRB_openSignal       : std_logic;
   signal mem_extroffparam_1_WEB_openSignal        : std_logic_vector (3 downto 
         0);
   signal mem_extroffparam_2_ADDRB_openSignal      : std_logic_vector (14 
         downto 0);
   signal mem_extroffparam_2_CASCADEINA_openSignal : std_logic;
   signal mem_extroffparam_2_CASCADEINB_openSignal : std_logic;
   signal mem_extroffparam_2_CLKB_openSignal       : std_logic;
   signal mem_extroffparam_2_DIB_openSignal        : std_logic_vector (31 
         downto 0);
   signal mem_extroffparam_2_DIPA_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extroffparam_2_DIPB_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extroffparam_2_ENB_openSignal        : std_logic;
   signal mem_extroffparam_2_REGCEA_openSignal     : std_logic;
   signal mem_extroffparam_2_REGCEB_openSignal     : std_logic;
   signal mem_extroffparam_2_SSRB_openSignal       : std_logic;
   signal mem_extroffparam_2_WEB_openSignal        : std_logic_vector (3 downto 
         0);
   component mux_addr
      port ( rdy      : in    std_logic; 
             addra    : in    std_logic_vector (9 downto 0); 
             i_addr   : in    std_logic_vector (9 downto 0); 
             mux_addr : out   std_logic_vector (9 downto 0));
   end component;
   
   component ExtractOffsetParameters_process_p0
      port ( i_clock         : in    std_logic; 
             i_reset         : in    std_logic; 
             i_run           : in    std_logic; 
             fixed2floatrdy  : in    std_logic; 
             mulfprdy        : in    std_logic; 
             addfprdy        : in    std_logic; 
             i2c_mem_douta   : in    std_logic_vector (7 downto 0); 
             nibble_in1      : in    std_logic_vector (31 downto 0); 
             nibble_in2      : in    std_logic_vector (31 downto 0); 
             nibble_in4      : in    std_logic_vector (31 downto 0); 
             nibble_in3      : in    std_logic_vector (31 downto 0); 
             i_doa           : in    std_logic_vector (31 downto 0); 
             fixed2floatr    : in    std_logic_vector (31 downto 0); 
             mulfpr          : in    std_logic_vector (31 downto 0); 
             addfpr          : in    std_logic_vector (31 downto 0); 
             o_write_enable  : out   std_logic; 
             o_rdy           : out   std_logic; 
             i2c_mem_ena     : out   std_logic; 
             fixed2floatond  : out   std_logic; 
             fixed2floatsclr : out   std_logic; 
             fixed2floatce   : out   std_logic; 
             mulfpond        : out   std_logic; 
             mulfpsclr       : out   std_logic; 
             mulfpce         : out   std_logic; 
             addfpond        : out   std_logic; 
             addfpsclr       : out   std_logic; 
             addfpce         : out   std_logic; 
             i2c_mem_addra   : out   std_logic_vector (11 downto 0); 
             nibble_out1     : out   std_logic_vector (3 downto 0); 
             nibble_out2     : out   std_logic_vector (3 downto 0); 
             nibble_out4     : out   std_logic_vector (3 downto 0); 
             nibble_out3     : out   std_logic_vector (5 downto 0); 
             o_dia           : out   std_logic_vector (31 downto 0); 
             o_addra         : out   std_logic_vector (9 downto 0); 
             fixed2floata    : out   std_logic_vector (63 downto 0); 
             mulfpa          : out   std_logic_vector (31 downto 0); 
             mulfpb          : out   std_logic_vector (31 downto 0); 
             addfpa          : out   std_logic_vector (31 downto 0); 
             addfpb          : out   std_logic_vector (31 downto 0));
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
   
   component M2_1_MXILINX_ExtractOffsetParameters
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
   
   component rom_unsigned4bit
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed4bit
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed6bit
      port ( nibble_in  : in    std_logic_vector (5 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_unsigned4bit_2powx
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   attribute WRITE_WIDTH_B of mem_extroffparam_1 : label is "36";
   attribute WRITE_WIDTH_A of mem_extroffparam_1 : label is "36";
   attribute WRITE_MODE_B of mem_extroffparam_1 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_extroffparam_1 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_extroffparam_1 : label is "36";
   attribute READ_WIDTH_A of mem_extroffparam_1 : label is "36";
   attribute WRITE_WIDTH_B of mem_extroffparam_2 : label is "36";
   attribute WRITE_WIDTH_A of mem_extroffparam_2 : label is "36";
   attribute WRITE_MODE_B of mem_extroffparam_2 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_extroffparam_2 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_extroffparam_2 : label is "36";
   attribute READ_WIDTH_A of mem_extroffparam_2 : label is "36";
   attribute HU_SET of MUX_DO_0 : label is "MUX_DO_0_1735";
   attribute HU_SET of MUX_DO_1 : label is "MUX_DO_1_1734";
   attribute HU_SET of MUX_DO_2 : label is "MUX_DO_2_1733";
   attribute HU_SET of MUX_DO_3 : label is "MUX_DO_3_1732";
   attribute HU_SET of MUX_DO_4 : label is "MUX_DO_4_1731";
   attribute HU_SET of MUX_DO_5 : label is "MUX_DO_5_1730";
   attribute HU_SET of MUX_DO_6 : label is "MUX_DO_6_1729";
   attribute HU_SET of MUX_DO_7 : label is "MUX_DO_7_1728";
   attribute HU_SET of MUX_DO_8 : label is "MUX_DO_8_1727";
   attribute HU_SET of MUX_DO_9 : label is "MUX_DO_9_1726";
   attribute HU_SET of MUX_DO_10 : label is "MUX_DO_10_1725";
   attribute HU_SET of MUX_DO_11 : label is "MUX_DO_11_1724";
   attribute HU_SET of MUX_DO_12 : label is "MUX_DO_12_1723";
   attribute HU_SET of MUX_DO_13 : label is "MUX_DO_13_1722";
   attribute HU_SET of MUX_DO_14 : label is "MUX_DO_14_1721";
   attribute HU_SET of MUX_DO_15 : label is "MUX_DO_15_1720";
   attribute HU_SET of MUX_DO_16 : label is "MUX_DO_16_1719";
   attribute HU_SET of MUX_DO_17 : label is "MUX_DO_17_1718";
   attribute HU_SET of MUX_DO_18 : label is "MUX_DO_18_1717";
   attribute HU_SET of MUX_DO_19 : label is "MUX_DO_19_1716";
   attribute HU_SET of MUX_DO_20 : label is "MUX_DO_20_1715";
   attribute HU_SET of MUX_DO_21 : label is "MUX_DO_21_1714";
   attribute HU_SET of MUX_DO_22 : label is "MUX_DO_22_1713";
   attribute HU_SET of MUX_DO_23 : label is "MUX_DO_23_1712";
   attribute HU_SET of MUX_DO_24 : label is "MUX_DO_24_1711";
   attribute HU_SET of MUX_DO_25 : label is "MUX_DO_25_1710";
   attribute HU_SET of MUX_DO_26 : label is "MUX_DO_26_1709";
   attribute HU_SET of MUX_DO_27 : label is "MUX_DO_27_1708";
   attribute HU_SET of MUX_DO_28 : label is "MUX_DO_28_1707";
   attribute HU_SET of MUX_DO_29 : label is "MUX_DO_29_1706";
   attribute HU_SET of MUX_DO_30 : label is "MUX_DO_30_1705";
   attribute HU_SET of MUX_DO_31 : label is "MUX_DO_31_1704";
   attribute HU_SET of XLXI_56_0 : label is "XLXI_56_0_1767";
   attribute HU_SET of XLXI_56_1 : label is "XLXI_56_1_1766";
   attribute HU_SET of XLXI_56_2 : label is "XLXI_56_2_1765";
   attribute HU_SET of XLXI_56_3 : label is "XLXI_56_3_1764";
   attribute HU_SET of XLXI_56_4 : label is "XLXI_56_4_1763";
   attribute HU_SET of XLXI_56_5 : label is "XLXI_56_5_1762";
   attribute HU_SET of XLXI_56_6 : label is "XLXI_56_6_1761";
   attribute HU_SET of XLXI_56_7 : label is "XLXI_56_7_1760";
   attribute HU_SET of XLXI_56_8 : label is "XLXI_56_8_1759";
   attribute HU_SET of XLXI_56_9 : label is "XLXI_56_9_1758";
   attribute HU_SET of XLXI_56_10 : label is "XLXI_56_10_1757";
   attribute HU_SET of XLXI_56_11 : label is "XLXI_56_11_1756";
   attribute HU_SET of XLXI_56_12 : label is "XLXI_56_12_1755";
   attribute HU_SET of XLXI_56_13 : label is "XLXI_56_13_1754";
   attribute HU_SET of XLXI_56_14 : label is "XLXI_56_14_1753";
   attribute HU_SET of XLXI_56_15 : label is "XLXI_56_15_1752";
   attribute HU_SET of XLXI_56_16 : label is "XLXI_56_16_1751";
   attribute HU_SET of XLXI_56_17 : label is "XLXI_56_17_1750";
   attribute HU_SET of XLXI_56_18 : label is "XLXI_56_18_1749";
   attribute HU_SET of XLXI_56_19 : label is "XLXI_56_19_1748";
   attribute HU_SET of XLXI_56_20 : label is "XLXI_56_20_1747";
   attribute HU_SET of XLXI_56_21 : label is "XLXI_56_21_1746";
   attribute HU_SET of XLXI_56_22 : label is "XLXI_56_22_1745";
   attribute HU_SET of XLXI_56_23 : label is "XLXI_56_23_1744";
   attribute HU_SET of XLXI_56_24 : label is "XLXI_56_24_1743";
   attribute HU_SET of XLXI_56_25 : label is "XLXI_56_25_1742";
   attribute HU_SET of XLXI_56_26 : label is "XLXI_56_26_1741";
   attribute HU_SET of XLXI_56_27 : label is "XLXI_56_27_1740";
   attribute HU_SET of XLXI_56_28 : label is "XLXI_56_28_1739";
   attribute HU_SET of XLXI_56_29 : label is "XLXI_56_29_1738";
   attribute HU_SET of XLXI_56_30 : label is "XLXI_56_30_1737";
   attribute HU_SET of XLXI_56_31 : label is "XLXI_56_31_1736";
begin
   XLXN_179(31 downto 0) <= x"00000000";
   o_rdy <= o_rdy_DUMMY;
   extroffparam_mux_addr : mux_addr
      port map (addra(9 downto 0)=>o_addra(9 downto 0),
                i_addr(9 downto 0)=>i_addr(9 downto 0),
                rdy=>o_rdy_DUMMY,
                mux_addr(9 downto 0)=>mux_addr1(9 downto 0));
   
   inst_ExtrOffParam_proc0 : ExtractOffsetParameters_process_p0
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                fixed2floatr(31 downto 0)=>fixed2floatr(31 downto 0),
                fixed2floatrdy=>fixed2floatrdy,
                i_clock=>i_clock,
                i_doa(31 downto 0)=>XLXN_169(31 downto 0),
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                nibble_in1(31 downto 0)=>nibble_in1(31 downto 0),
                nibble_in2(31 downto 0)=>nibble_in2(31 downto 0),
                nibble_in3(31 downto 0)=>nibble_in3(31 downto 0),
                nibble_in4(31 downto 0)=>nibble_in4(31 downto 0),
                addfpa(31 downto 0)=>addfpa(31 downto 0),
                addfpb(31 downto 0)=>addfpb(31 downto 0),
                addfpce=>addfpce,
                addfpond=>addfpond,
                addfpsclr=>addfpsclr,
                fixed2floata(63 downto 0)=>fixed2floata(63 downto 0),
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
                nibble_out1(3 downto 0)=>nibble_out1(3 downto 0),
                nibble_out2(3 downto 0)=>nibble_out2(3 downto 0),
                nibble_out3(5 downto 0)=>nibble_out3(5 downto 0),
                nibble_out4(3 downto 0)=>nibble_out4(3 downto 0),
                o_addra(9 downto 0)=>o_addra(9 downto 0),
                o_dia(31 downto 0)=>o_dia(31 downto 0),
                o_rdy=>o_rdy_DUMMY,
                o_write_enable=>write_enable);
   
   mem_extroffparam_1 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>addra1(14 downto 0),
                ADDRB(14 downto 0)=>mem_extroffparam_1_ADDRB_openSignal(14 
            downto 0),
                CASCADEINA=>mem_extroffparam_1_CASCADEINA_openSignal,
                CASCADEINB=>mem_extroffparam_1_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_extroffparam_1_CLKB_openSignal,
                DIA(31 downto 0)=>o_dia(31 downto 0),
                DIB(31 downto 0)=>mem_extroffparam_1_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_extroffparam_1_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_extroffparam_1_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_59,
                ENB=>mem_extroffparam_1_ENB_openSignal,
                REGCEA=>mem_extroffparam_1_REGCEA_openSignal,
                REGCEB=>mem_extroffparam_1_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_extroffparam_1_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_extroffparam_1_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>doa1(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   mem_extroffparam_2 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>addra2(14 downto 0),
                ADDRB(14 downto 0)=>mem_extroffparam_2_ADDRB_openSignal(14 
            downto 0),
                CASCADEINA=>mem_extroffparam_2_CASCADEINA_openSignal,
                CASCADEINB=>mem_extroffparam_2_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_extroffparam_2_CLKB_openSignal,
                DIA(31 downto 0)=>o_dia(31 downto 0),
                DIB(31 downto 0)=>mem_extroffparam_2_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_extroffparam_2_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_extroffparam_2_DIPB_openSignal(3 downto 0),
                ENA=>mux_addr1(9),
                ENB=>mem_extroffparam_2_ENB_openSignal,
                REGCEA=>mem_extroffparam_2_REGCEA_openSignal,
                REGCEB=>mem_extroffparam_2_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_extroffparam_2_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_extroffparam_2_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>doa2(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   MUX_DO_0 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(0),
                D1=>doa2(0),
                S0=>mux_addr1(9),
                O=>XLXN_180(0));
   
   MUX_DO_1 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(1),
                D1=>doa2(1),
                S0=>mux_addr1(9),
                O=>XLXN_180(1));
   
   MUX_DO_2 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(2),
                D1=>doa2(2),
                S0=>mux_addr1(9),
                O=>XLXN_180(2));
   
   MUX_DO_3 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(3),
                D1=>doa2(3),
                S0=>mux_addr1(9),
                O=>XLXN_180(3));
   
   MUX_DO_4 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(4),
                D1=>doa2(4),
                S0=>mux_addr1(9),
                O=>XLXN_180(4));
   
   MUX_DO_5 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(5),
                D1=>doa2(5),
                S0=>mux_addr1(9),
                O=>XLXN_180(5));
   
   MUX_DO_6 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(6),
                D1=>doa2(6),
                S0=>mux_addr1(9),
                O=>XLXN_180(6));
   
   MUX_DO_7 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(7),
                D1=>doa2(7),
                S0=>mux_addr1(9),
                O=>XLXN_180(7));
   
   MUX_DO_8 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(8),
                D1=>doa2(8),
                S0=>mux_addr1(9),
                O=>XLXN_180(8));
   
   MUX_DO_9 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(9),
                D1=>doa2(9),
                S0=>mux_addr1(9),
                O=>XLXN_180(9));
   
   MUX_DO_10 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(10),
                D1=>doa2(10),
                S0=>mux_addr1(9),
                O=>XLXN_180(10));
   
   MUX_DO_11 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(11),
                D1=>doa2(11),
                S0=>mux_addr1(9),
                O=>XLXN_180(11));
   
   MUX_DO_12 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(12),
                D1=>doa2(12),
                S0=>mux_addr1(9),
                O=>XLXN_180(12));
   
   MUX_DO_13 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(13),
                D1=>doa2(13),
                S0=>mux_addr1(9),
                O=>XLXN_180(13));
   
   MUX_DO_14 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(14),
                D1=>doa2(14),
                S0=>mux_addr1(9),
                O=>XLXN_180(14));
   
   MUX_DO_15 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(15),
                D1=>doa2(15),
                S0=>mux_addr1(9),
                O=>XLXN_180(15));
   
   MUX_DO_16 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(16),
                D1=>doa2(16),
                S0=>mux_addr1(9),
                O=>XLXN_180(16));
   
   MUX_DO_17 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(17),
                D1=>doa2(17),
                S0=>mux_addr1(9),
                O=>XLXN_180(17));
   
   MUX_DO_18 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(18),
                D1=>doa2(18),
                S0=>mux_addr1(9),
                O=>XLXN_180(18));
   
   MUX_DO_19 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(19),
                D1=>doa2(19),
                S0=>mux_addr1(9),
                O=>XLXN_180(19));
   
   MUX_DO_20 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(20),
                D1=>doa2(20),
                S0=>mux_addr1(9),
                O=>XLXN_180(20));
   
   MUX_DO_21 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(21),
                D1=>doa2(21),
                S0=>mux_addr1(9),
                O=>XLXN_180(21));
   
   MUX_DO_22 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(22),
                D1=>doa2(22),
                S0=>mux_addr1(9),
                O=>XLXN_180(22));
   
   MUX_DO_23 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(23),
                D1=>doa2(23),
                S0=>mux_addr1(9),
                O=>XLXN_180(23));
   
   MUX_DO_24 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(24),
                D1=>doa2(24),
                S0=>mux_addr1(9),
                O=>XLXN_180(24));
   
   MUX_DO_25 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(25),
                D1=>doa2(25),
                S0=>mux_addr1(9),
                O=>XLXN_180(25));
   
   MUX_DO_26 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(26),
                D1=>doa2(26),
                S0=>mux_addr1(9),
                O=>XLXN_180(26));
   
   MUX_DO_27 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(27),
                D1=>doa2(27),
                S0=>mux_addr1(9),
                O=>XLXN_180(27));
   
   MUX_DO_28 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(28),
                D1=>doa2(28),
                S0=>mux_addr1(9),
                O=>XLXN_180(28));
   
   MUX_DO_29 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(29),
                D1=>doa2(29),
                S0=>mux_addr1(9),
                O=>XLXN_180(29));
   
   MUX_DO_30 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(30),
                D1=>doa2(30),
                S0=>mux_addr1(9),
                O=>XLXN_180(30));
   
   MUX_DO_31 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(31),
                D1=>doa2(31),
                S0=>mux_addr1(9),
                O=>XLXN_180(31));
   
   XLXI_7_0 : GND
      port map (G=>addra2(0));
   
   XLXI_7_1 : GND
      port map (G=>addra2(1));
   
   XLXI_7_2 : GND
      port map (G=>addra2(2));
   
   XLXI_7_3 : GND
      port map (G=>addra2(3));
   
   XLXI_7_4 : GND
      port map (G=>addra2(4));
   
   XLXI_8_0 : BUF
      port map (I=>mux_addr1(0),
                O=>addra2(5));
   
   XLXI_8_1 : BUF
      port map (I=>mux_addr1(1),
                O=>addra2(6));
   
   XLXI_8_2 : BUF
      port map (I=>mux_addr1(2),
                O=>addra2(7));
   
   XLXI_8_3 : BUF
      port map (I=>mux_addr1(3),
                O=>addra2(8));
   
   XLXI_8_4 : BUF
      port map (I=>mux_addr1(4),
                O=>addra2(9));
   
   XLXI_8_5 : BUF
      port map (I=>mux_addr1(5),
                O=>addra2(10));
   
   XLXI_8_6 : BUF
      port map (I=>mux_addr1(6),
                O=>addra2(11));
   
   XLXI_8_7 : BUF
      port map (I=>mux_addr1(7),
                O=>addra2(12));
   
   XLXI_8_8 : BUF
      port map (I=>mux_addr1(8),
                O=>addra2(13));
   
   XLXI_8_9 : BUF
      port map (I=>mux_addr1(9),
                O=>addra2(14));
   
   XLXI_10_0 : GND
      port map (G=>addra1(0));
   
   XLXI_10_1 : GND
      port map (G=>addra1(1));
   
   XLXI_10_2 : GND
      port map (G=>addra1(2));
   
   XLXI_10_3 : GND
      port map (G=>addra1(3));
   
   XLXI_10_4 : GND
      port map (G=>addra1(4));
   
   XLXI_11_0 : BUF
      port map (I=>mux_addr1(0),
                O=>addra1(5));
   
   XLXI_11_1 : BUF
      port map (I=>mux_addr1(1),
                O=>addra1(6));
   
   XLXI_11_2 : BUF
      port map (I=>mux_addr1(2),
                O=>addra1(7));
   
   XLXI_11_3 : BUF
      port map (I=>mux_addr1(3),
                O=>addra1(8));
   
   XLXI_11_4 : BUF
      port map (I=>mux_addr1(4),
                O=>addra1(9));
   
   XLXI_11_5 : BUF
      port map (I=>mux_addr1(5),
                O=>addra1(10));
   
   XLXI_11_6 : BUF
      port map (I=>mux_addr1(6),
                O=>addra1(11));
   
   XLXI_11_7 : BUF
      port map (I=>mux_addr1(7),
                O=>addra1(12));
   
   XLXI_11_8 : BUF
      port map (I=>mux_addr1(8),
                O=>addra1(13));
   
   XLXI_11_9 : BUF
      port map (I=>mux_addr1(9),
                O=>addra1(14));
   
   XLXI_12 : INV
      port map (I=>mux_addr1(9),
                O=>XLXN_59);
   
   XLXI_29_0 : BUF
      port map (I=>write_enable,
                O=>XLXN_139(0));
   
   XLXI_29_1 : BUF
      port map (I=>write_enable,
                O=>XLXN_139(1));
   
   XLXI_29_2 : BUF
      port map (I=>write_enable,
                O=>XLXN_139(2));
   
   XLXI_29_3 : BUF
      port map (I=>write_enable,
                O=>XLXN_139(3));
   
   XLXI_49 : rom_unsigned4bit
      port map (nibble_in(3 downto 0)=>nibble_out1(3 downto 0),
                nibble_out(31 downto 0)=>nibble_in1(31 downto 0));
   
   XLXI_50 : rom_signed4bit
      port map (nibble_in(3 downto 0)=>nibble_out2(3 downto 0),
                nibble_out(31 downto 0)=>nibble_in2(31 downto 0));
   
   XLXI_53 : rom_signed6bit
      port map (nibble_in(5 downto 0)=>nibble_out3(5 downto 0),
                nibble_out(31 downto 0)=>nibble_in3(31 downto 0));
   
   XLXI_54 : rom_unsigned4bit_2powx
      port map (nibble_in(3 downto 0)=>nibble_out4(3 downto 0),
                nibble_out(31 downto 0)=>nibble_in4(31 downto 0));
   
   XLXI_56_0 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(0),
                D1=>XLXN_180(0),
                S0=>o_rdy_DUMMY,
                O=>o_do(0));
   
   XLXI_56_1 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(1),
                D1=>XLXN_180(1),
                S0=>o_rdy_DUMMY,
                O=>o_do(1));
   
   XLXI_56_2 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(2),
                D1=>XLXN_180(2),
                S0=>o_rdy_DUMMY,
                O=>o_do(2));
   
   XLXI_56_3 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(3),
                D1=>XLXN_180(3),
                S0=>o_rdy_DUMMY,
                O=>o_do(3));
   
   XLXI_56_4 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(4),
                D1=>XLXN_180(4),
                S0=>o_rdy_DUMMY,
                O=>o_do(4));
   
   XLXI_56_5 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(5),
                D1=>XLXN_180(5),
                S0=>o_rdy_DUMMY,
                O=>o_do(5));
   
   XLXI_56_6 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(6),
                D1=>XLXN_180(6),
                S0=>o_rdy_DUMMY,
                O=>o_do(6));
   
   XLXI_56_7 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(7),
                D1=>XLXN_180(7),
                S0=>o_rdy_DUMMY,
                O=>o_do(7));
   
   XLXI_56_8 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(8),
                D1=>XLXN_180(8),
                S0=>o_rdy_DUMMY,
                O=>o_do(8));
   
   XLXI_56_9 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(9),
                D1=>XLXN_180(9),
                S0=>o_rdy_DUMMY,
                O=>o_do(9));
   
   XLXI_56_10 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(10),
                D1=>XLXN_180(10),
                S0=>o_rdy_DUMMY,
                O=>o_do(10));
   
   XLXI_56_11 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(11),
                D1=>XLXN_180(11),
                S0=>o_rdy_DUMMY,
                O=>o_do(11));
   
   XLXI_56_12 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(12),
                D1=>XLXN_180(12),
                S0=>o_rdy_DUMMY,
                O=>o_do(12));
   
   XLXI_56_13 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(13),
                D1=>XLXN_180(13),
                S0=>o_rdy_DUMMY,
                O=>o_do(13));
   
   XLXI_56_14 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(14),
                D1=>XLXN_180(14),
                S0=>o_rdy_DUMMY,
                O=>o_do(14));
   
   XLXI_56_15 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(15),
                D1=>XLXN_180(15),
                S0=>o_rdy_DUMMY,
                O=>o_do(15));
   
   XLXI_56_16 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(16),
                D1=>XLXN_180(16),
                S0=>o_rdy_DUMMY,
                O=>o_do(16));
   
   XLXI_56_17 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(17),
                D1=>XLXN_180(17),
                S0=>o_rdy_DUMMY,
                O=>o_do(17));
   
   XLXI_56_18 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(18),
                D1=>XLXN_180(18),
                S0=>o_rdy_DUMMY,
                O=>o_do(18));
   
   XLXI_56_19 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(19),
                D1=>XLXN_180(19),
                S0=>o_rdy_DUMMY,
                O=>o_do(19));
   
   XLXI_56_20 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(20),
                D1=>XLXN_180(20),
                S0=>o_rdy_DUMMY,
                O=>o_do(20));
   
   XLXI_56_21 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(21),
                D1=>XLXN_180(21),
                S0=>o_rdy_DUMMY,
                O=>o_do(21));
   
   XLXI_56_22 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(22),
                D1=>XLXN_180(22),
                S0=>o_rdy_DUMMY,
                O=>o_do(22));
   
   XLXI_56_23 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(23),
                D1=>XLXN_180(23),
                S0=>o_rdy_DUMMY,
                O=>o_do(23));
   
   XLXI_56_24 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(24),
                D1=>XLXN_180(24),
                S0=>o_rdy_DUMMY,
                O=>o_do(24));
   
   XLXI_56_25 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(25),
                D1=>XLXN_180(25),
                S0=>o_rdy_DUMMY,
                O=>o_do(25));
   
   XLXI_56_26 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(26),
                D1=>XLXN_180(26),
                S0=>o_rdy_DUMMY,
                O=>o_do(26));
   
   XLXI_56_27 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(27),
                D1=>XLXN_180(27),
                S0=>o_rdy_DUMMY,
                O=>o_do(27));
   
   XLXI_56_28 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(28),
                D1=>XLXN_180(28),
                S0=>o_rdy_DUMMY,
                O=>o_do(28));
   
   XLXI_56_29 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(29),
                D1=>XLXN_180(29),
                S0=>o_rdy_DUMMY,
                O=>o_do(29));
   
   XLXI_56_30 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(30),
                D1=>XLXN_180(30),
                S0=>o_rdy_DUMMY,
                O=>o_do(30));
   
   XLXI_56_31 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(31),
                D1=>XLXN_180(31),
                S0=>o_rdy_DUMMY,
                O=>o_do(31));
   
   XLXI_58_0 : BUF
      port map (I=>doa1(0),
                O=>XLXN_169(0));
   
   XLXI_58_1 : BUF
      port map (I=>doa1(1),
                O=>XLXN_169(1));
   
   XLXI_58_2 : BUF
      port map (I=>doa1(2),
                O=>XLXN_169(2));
   
   XLXI_58_3 : BUF
      port map (I=>doa1(3),
                O=>XLXN_169(3));
   
   XLXI_58_4 : BUF
      port map (I=>doa1(4),
                O=>XLXN_169(4));
   
   XLXI_58_5 : BUF
      port map (I=>doa1(5),
                O=>XLXN_169(5));
   
   XLXI_58_6 : BUF
      port map (I=>doa1(6),
                O=>XLXN_169(6));
   
   XLXI_58_7 : BUF
      port map (I=>doa1(7),
                O=>XLXN_169(7));
   
   XLXI_58_8 : BUF
      port map (I=>doa1(8),
                O=>XLXN_169(8));
   
   XLXI_58_9 : BUF
      port map (I=>doa1(9),
                O=>XLXN_169(9));
   
   XLXI_58_10 : BUF
      port map (I=>doa1(10),
                O=>XLXN_169(10));
   
   XLXI_58_11 : BUF
      port map (I=>doa1(11),
                O=>XLXN_169(11));
   
   XLXI_58_12 : BUF
      port map (I=>doa1(12),
                O=>XLXN_169(12));
   
   XLXI_58_13 : BUF
      port map (I=>doa1(13),
                O=>XLXN_169(13));
   
   XLXI_58_14 : BUF
      port map (I=>doa1(14),
                O=>XLXN_169(14));
   
   XLXI_58_15 : BUF
      port map (I=>doa1(15),
                O=>XLXN_169(15));
   
   XLXI_58_16 : BUF
      port map (I=>doa1(16),
                O=>XLXN_169(16));
   
   XLXI_58_17 : BUF
      port map (I=>doa1(17),
                O=>XLXN_169(17));
   
   XLXI_58_18 : BUF
      port map (I=>doa1(18),
                O=>XLXN_169(18));
   
   XLXI_58_19 : BUF
      port map (I=>doa1(19),
                O=>XLXN_169(19));
   
   XLXI_58_20 : BUF
      port map (I=>doa1(20),
                O=>XLXN_169(20));
   
   XLXI_58_21 : BUF
      port map (I=>doa1(21),
                O=>XLXN_169(21));
   
   XLXI_58_22 : BUF
      port map (I=>doa1(22),
                O=>XLXN_169(22));
   
   XLXI_58_23 : BUF
      port map (I=>doa1(23),
                O=>XLXN_169(23));
   
   XLXI_58_24 : BUF
      port map (I=>doa1(24),
                O=>XLXN_169(24));
   
   XLXI_58_25 : BUF
      port map (I=>doa1(25),
                O=>XLXN_169(25));
   
   XLXI_58_26 : BUF
      port map (I=>doa1(26),
                O=>XLXN_169(26));
   
   XLXI_58_27 : BUF
      port map (I=>doa1(27),
                O=>XLXN_169(27));
   
   XLXI_58_28 : BUF
      port map (I=>doa1(28),
                O=>XLXN_169(28));
   
   XLXI_58_29 : BUF
      port map (I=>doa1(29),
                O=>XLXN_169(29));
   
   XLXI_58_30 : BUF
      port map (I=>doa1(30),
                O=>XLXN_169(30));
   
   XLXI_58_31 : BUF
      port map (I=>doa1(31),
                O=>XLXN_169(31));
   
end BEHAVIORAL;


