--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CalculatePixOS.vhf
-- /___/   /\     Timestamp : 10/15/2024 22:04:20
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculatePixOS.vhf -w /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculatePixOS.sch
--Design Name: CalculatePixOS
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

entity M2_1_MXILINX_CalculatePixOS is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_CalculatePixOS;

architecture BEHAVIORAL of M2_1_MXILINX_CalculatePixOS is
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

entity ExtractKvParameters_MUSER_CalculatePixOS is
   port ( divfpr        : in    std_logic_vector (31 downto 0); 
          divfprdy      : in    std_logic; 
          i_addr        : in    std_logic_vector (9 downto 0); 
          i_clock       : in    std_logic; 
          i_reset       : in    std_logic; 
          i_run         : in    std_logic; 
          i2c_mem_douta : in    std_logic_vector (7 downto 0); 
          divfpa        : out   std_logic_vector (31 downto 0); 
          divfpb        : out   std_logic_vector (31 downto 0); 
          divfpce       : out   std_logic; 
          divfpond      : out   std_logic; 
          divfpsclr     : out   std_logic; 
          i2c_mem_addra : out   std_logic_vector (11 downto 0); 
          i2c_mem_ena   : out   std_logic; 
          o_do          : out   std_logic_vector (31 downto 0); 
          o_rdy         : out   std_logic);
end ExtractKvParameters_MUSER_CalculatePixOS;

architecture BEHAVIORAL of ExtractKvParameters_MUSER_CalculatePixOS is
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
   signal mux_addr1                               : std_logic_vector (9 downto 
         0);
   signal XLXN_44                                 : std_logic_vector (14 downto 
         0);
   signal XLXN_45                                 : std_logic_vector (14 downto 
         0);
   signal XLXN_59                                 : std_logic;
   signal XLXN_78                                 : std_logic_vector (31 downto 
         0);
   signal XLXN_79                                 : std_logic_vector (31 downto 
         0);
   signal XLXN_139                                : std_logic_vector (3 downto 
         0);
   signal XLXN_186                                : std_logic;
   signal XLXN_187                                : std_logic;
   signal XLXN_188                                : std_logic_vector (0 to 4);
   signal XLXN_189                                : std_logic_vector (0 to 4);
   signal XLXN_194                                : std_logic_vector (3 downto 
         0);
   signal XLXN_195                                : std_logic_vector (3 downto 
         0);
   signal XLXN_200                                : std_logic_vector (31 downto 
         0);
   signal XLXN_201                                : std_logic_vector (31 downto 
         0);
   signal XLXN_202                                : std_logic_vector (3 downto 
         0);
   signal XLXN_203                                : std_logic_vector (3 downto 
         0);
   signal XLXN_204                                : std_logic_vector (3 downto 
         0);
   signal XLXN_205                                : std_logic_vector (3 downto 
         0);
   signal XLXN_209                                : std_logic_vector (3 downto 
         0);
   signal XLXN_210                                : std_logic_vector (9 downto 
         0);
   signal XLXN_211                                : std_logic_vector (31 downto 
         0);
   signal XLXN_216                                : std_logic;
   signal o_rdy_DUMMY                             : std_logic;
   signal mem_extrkvparam_1_ADDRB_openSignal      : std_logic_vector (14 downto 
         0);
   signal mem_extrkvparam_1_CASCADEINA_openSignal : std_logic;
   signal mem_extrkvparam_1_CASCADEINB_openSignal : std_logic;
   signal mem_extrkvparam_1_CLKB_openSignal       : std_logic;
   signal mem_extrkvparam_1_DIB_openSignal        : std_logic_vector (31 downto 
         0);
   signal mem_extrkvparam_1_DIPA_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extrkvparam_1_DIPB_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extrkvparam_1_ENB_openSignal        : std_logic;
   signal mem_extrkvparam_1_REGCEA_openSignal     : std_logic;
   signal mem_extrkvparam_1_REGCEB_openSignal     : std_logic;
   signal mem_extrkvparam_1_SSRB_openSignal       : std_logic;
   signal mem_extrkvparam_1_WEB_openSignal        : std_logic_vector (3 downto 
         0);
   signal mem_extrkvparam_2_ADDRB_openSignal      : std_logic_vector (14 downto 
         0);
   signal mem_extrkvparam_2_CASCADEINA_openSignal : std_logic;
   signal mem_extrkvparam_2_CASCADEINB_openSignal : std_logic;
   signal mem_extrkvparam_2_CLKB_openSignal       : std_logic;
   signal mem_extrkvparam_2_DIB_openSignal        : std_logic_vector (31 downto 
         0);
   signal mem_extrkvparam_2_DIPA_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extrkvparam_2_DIPB_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extrkvparam_2_ENB_openSignal        : std_logic;
   signal mem_extrkvparam_2_REGCEA_openSignal     : std_logic;
   signal mem_extrkvparam_2_REGCEB_openSignal     : std_logic;
   signal mem_extrkvparam_2_SSRB_openSignal       : std_logic;
   signal mem_extrkvparam_2_WEB_openSignal        : std_logic_vector (3 downto 
         0);
   component ExtractKvParameters_process_p0
      port ( i_clock        : in    std_logic; 
             i_reset        : in    std_logic; 
             i_run          : in    std_logic; 
             divfprdy       : in    std_logic; 
             i2c_mem_douta  : in    std_logic_vector (7 downto 0); 
             nibble_in1     : in    std_logic_vector (31 downto 0); 
             nibble_in2     : in    std_logic_vector (31 downto 0); 
             kvijee         : in    std_logic_vector (3 downto 0); 
             divfpr         : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena    : out   std_logic; 
             o_write_enable : out   std_logic; 
             o_rdy          : out   std_logic; 
             divfpond       : out   std_logic; 
             divfpsclr      : out   std_logic; 
             divfpce        : out   std_logic; 
             i2c_mem_addra  : out   std_logic_vector (11 downto 0); 
             o_addra        : out   std_logic_vector (9 downto 0); 
             o_dia          : out   std_logic_vector (31 downto 0); 
             nibble_out1    : out   std_logic_vector (3 downto 0); 
             nibble_out2    : out   std_logic_vector (3 downto 0); 
             o_row          : out   std_logic_vector (0 to 4); 
             o_col          : out   std_logic_vector (0 to 4); 
             kvijee_oo      : out   std_logic_vector (3 downto 0); 
             kvijee_eo      : out   std_logic_vector (3 downto 0); 
             kvijee_oe      : out   std_logic_vector (3 downto 0); 
             kvijee_ee      : out   std_logic_vector (3 downto 0); 
             divfpa         : out   std_logic_vector (31 downto 0); 
             divfpb         : out   std_logic_vector (31 downto 0));
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
   
   component M2_1_MXILINX_CalculatePixOS
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
   
   component rom_unsigned4bit_2powx
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed4bit
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component colrow_even
      port ( col  : in    std_logic_vector (0 to 4); 
             row  : in    std_logic_vector (0 to 4); 
             cole : out   std_logic; 
             rowe : out   std_logic);
   end component;
   
   component ExtractKvParameters_process_p1
      port ( cole      : in    std_logic; 
             rowe      : in    std_logic; 
             kvijee_oo : in    std_logic_vector (3 downto 0); 
             kvijee_eo : in    std_logic_vector (3 downto 0); 
             kvijee_oe : in    std_logic_vector (3 downto 0); 
             kvijee_ee : in    std_logic_vector (3 downto 0); 
             kvijee    : out   std_logic_vector (3 downto 0));
   end component;
   
   attribute WRITE_WIDTH_B of mem_extrkvparam_1 : label is "36";
   attribute WRITE_WIDTH_A of mem_extrkvparam_1 : label is "36";
   attribute WRITE_MODE_B of mem_extrkvparam_1 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_extrkvparam_1 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_extrkvparam_1 : label is "36";
   attribute READ_WIDTH_A of mem_extrkvparam_1 : label is "36";
   attribute WRITE_WIDTH_B of mem_extrkvparam_2 : label is "36";
   attribute WRITE_WIDTH_A of mem_extrkvparam_2 : label is "36";
   attribute WRITE_MODE_B of mem_extrkvparam_2 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_extrkvparam_2 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_extrkvparam_2 : label is "36";
   attribute READ_WIDTH_A of mem_extrkvparam_2 : label is "36";
   attribute HU_SET of MUX_ADDR_0 : label is "MUX_ADDR_0_1388";
   attribute HU_SET of MUX_ADDR_1 : label is "MUX_ADDR_1_1387";
   attribute HU_SET of MUX_ADDR_2 : label is "MUX_ADDR_2_1386";
   attribute HU_SET of MUX_ADDR_3 : label is "MUX_ADDR_3_1385";
   attribute HU_SET of MUX_ADDR_4 : label is "MUX_ADDR_4_1384";
   attribute HU_SET of MUX_ADDR_5 : label is "MUX_ADDR_5_1383";
   attribute HU_SET of MUX_ADDR_6 : label is "MUX_ADDR_6_1382";
   attribute HU_SET of MUX_ADDR_7 : label is "MUX_ADDR_7_1381";
   attribute HU_SET of MUX_ADDR_8 : label is "MUX_ADDR_8_1380";
   attribute HU_SET of MUX_ADDR_9 : label is "MUX_ADDR_9_1379";
   attribute HU_SET of MUX_DO_0 : label is "MUX_DO_0_1378";
   attribute HU_SET of MUX_DO_1 : label is "MUX_DO_1_1377";
   attribute HU_SET of MUX_DO_2 : label is "MUX_DO_2_1376";
   attribute HU_SET of MUX_DO_3 : label is "MUX_DO_3_1375";
   attribute HU_SET of MUX_DO_4 : label is "MUX_DO_4_1374";
   attribute HU_SET of MUX_DO_5 : label is "MUX_DO_5_1373";
   attribute HU_SET of MUX_DO_6 : label is "MUX_DO_6_1372";
   attribute HU_SET of MUX_DO_7 : label is "MUX_DO_7_1371";
   attribute HU_SET of MUX_DO_8 : label is "MUX_DO_8_1370";
   attribute HU_SET of MUX_DO_9 : label is "MUX_DO_9_1369";
   attribute HU_SET of MUX_DO_10 : label is "MUX_DO_10_1368";
   attribute HU_SET of MUX_DO_11 : label is "MUX_DO_11_1367";
   attribute HU_SET of MUX_DO_12 : label is "MUX_DO_12_1366";
   attribute HU_SET of MUX_DO_13 : label is "MUX_DO_13_1365";
   attribute HU_SET of MUX_DO_14 : label is "MUX_DO_14_1364";
   attribute HU_SET of MUX_DO_15 : label is "MUX_DO_15_1363";
   attribute HU_SET of MUX_DO_16 : label is "MUX_DO_16_1362";
   attribute HU_SET of MUX_DO_17 : label is "MUX_DO_17_1361";
   attribute HU_SET of MUX_DO_18 : label is "MUX_DO_18_1360";
   attribute HU_SET of MUX_DO_19 : label is "MUX_DO_19_1359";
   attribute HU_SET of MUX_DO_20 : label is "MUX_DO_20_1358";
   attribute HU_SET of MUX_DO_21 : label is "MUX_DO_21_1357";
   attribute HU_SET of MUX_DO_22 : label is "MUX_DO_22_1356";
   attribute HU_SET of MUX_DO_23 : label is "MUX_DO_23_1355";
   attribute HU_SET of MUX_DO_24 : label is "MUX_DO_24_1354";
   attribute HU_SET of MUX_DO_25 : label is "MUX_DO_25_1353";
   attribute HU_SET of MUX_DO_26 : label is "MUX_DO_26_1352";
   attribute HU_SET of MUX_DO_27 : label is "MUX_DO_27_1351";
   attribute HU_SET of MUX_DO_28 : label is "MUX_DO_28_1350";
   attribute HU_SET of MUX_DO_29 : label is "MUX_DO_29_1349";
   attribute HU_SET of MUX_DO_30 : label is "MUX_DO_30_1348";
   attribute HU_SET of MUX_DO_31 : label is "MUX_DO_31_1347";
begin
   o_rdy <= o_rdy_DUMMY;
   inst_extrkvparam_proc0 : ExtractKvParameters_process_p0
      port map (divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                kvijee(3 downto 0)=>XLXN_209(3 downto 0),
                nibble_in1(31 downto 0)=>XLXN_200(31 downto 0),
                nibble_in2(31 downto 0)=>XLXN_201(31 downto 0),
                divfpa(31 downto 0)=>divfpa(31 downto 0),
                divfpb(31 downto 0)=>divfpb(31 downto 0),
                divfpce=>divfpce,
                divfpond=>divfpond,
                divfpsclr=>divfpsclr,
                i2c_mem_addra(11 downto 0)=>i2c_mem_addra(11 downto 0),
                i2c_mem_ena=>i2c_mem_ena,
                kvijee_ee(3 downto 0)=>XLXN_202(3 downto 0),
                kvijee_eo(3 downto 0)=>XLXN_204(3 downto 0),
                kvijee_oe(3 downto 0)=>XLXN_203(3 downto 0),
                kvijee_oo(3 downto 0)=>XLXN_205(3 downto 0),
                nibble_out1(3 downto 0)=>XLXN_194(3 downto 0),
                nibble_out2(3 downto 0)=>XLXN_195(3 downto 0),
                o_addra(9 downto 0)=>XLXN_210(9 downto 0),
                o_col(0 to 4)=>XLXN_189(0 to 4),
                o_dia(31 downto 0)=>XLXN_211(31 downto 0),
                o_rdy=>o_rdy_DUMMY,
                o_row(0 to 4)=>XLXN_188(0 to 4),
                o_write_enable=>XLXN_216);
   
   mem_extrkvparam_1 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_44(14 downto 0),
                ADDRB(14 downto 0)=>mem_extrkvparam_1_ADDRB_openSignal(14 
            downto 0),
                CASCADEINA=>mem_extrkvparam_1_CASCADEINA_openSignal,
                CASCADEINB=>mem_extrkvparam_1_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_extrkvparam_1_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_211(31 downto 0),
                DIB(31 downto 0)=>mem_extrkvparam_1_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_extrkvparam_1_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_extrkvparam_1_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_59,
                ENB=>mem_extrkvparam_1_ENB_openSignal,
                REGCEA=>mem_extrkvparam_1_REGCEA_openSignal,
                REGCEB=>mem_extrkvparam_1_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_extrkvparam_1_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_extrkvparam_1_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_79(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   mem_extrkvparam_2 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_45(14 downto 0),
                ADDRB(14 downto 0)=>mem_extrkvparam_2_ADDRB_openSignal(14 
            downto 0),
                CASCADEINA=>mem_extrkvparam_2_CASCADEINA_openSignal,
                CASCADEINB=>mem_extrkvparam_2_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_extrkvparam_2_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_211(31 downto 0),
                DIB(31 downto 0)=>mem_extrkvparam_2_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_extrkvparam_2_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_extrkvparam_2_DIPB_openSignal(3 downto 0),
                ENA=>mux_addr1(9),
                ENB=>mem_extrkvparam_2_ENB_openSignal,
                REGCEA=>mem_extrkvparam_2_REGCEA_openSignal,
                REGCEB=>mem_extrkvparam_2_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_extrkvparam_2_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_extrkvparam_2_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_78(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   MUX_ADDR_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(0),
                D1=>i_addr(0),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(0));
   
   MUX_ADDR_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(1),
                D1=>i_addr(1),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(1));
   
   MUX_ADDR_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(2),
                D1=>i_addr(2),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(2));
   
   MUX_ADDR_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(3),
                D1=>i_addr(3),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(3));
   
   MUX_ADDR_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(4),
                D1=>i_addr(4),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(4));
   
   MUX_ADDR_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(5),
                D1=>i_addr(5),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(5));
   
   MUX_ADDR_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(6),
                D1=>i_addr(6),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(6));
   
   MUX_ADDR_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(7),
                D1=>i_addr(7),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(7));
   
   MUX_ADDR_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(8),
                D1=>i_addr(8),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(8));
   
   MUX_ADDR_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(9),
                D1=>i_addr(9),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(9));
   
   MUX_DO_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(0),
                D1=>XLXN_78(0),
                S0=>mux_addr1(9),
                O=>o_do(0));
   
   MUX_DO_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(1),
                D1=>XLXN_78(1),
                S0=>mux_addr1(9),
                O=>o_do(1));
   
   MUX_DO_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(2),
                D1=>XLXN_78(2),
                S0=>mux_addr1(9),
                O=>o_do(2));
   
   MUX_DO_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(3),
                D1=>XLXN_78(3),
                S0=>mux_addr1(9),
                O=>o_do(3));
   
   MUX_DO_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(4),
                D1=>XLXN_78(4),
                S0=>mux_addr1(9),
                O=>o_do(4));
   
   MUX_DO_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(5),
                D1=>XLXN_78(5),
                S0=>mux_addr1(9),
                O=>o_do(5));
   
   MUX_DO_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(6),
                D1=>XLXN_78(6),
                S0=>mux_addr1(9),
                O=>o_do(6));
   
   MUX_DO_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(7),
                D1=>XLXN_78(7),
                S0=>mux_addr1(9),
                O=>o_do(7));
   
   MUX_DO_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(8),
                D1=>XLXN_78(8),
                S0=>mux_addr1(9),
                O=>o_do(8));
   
   MUX_DO_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(9),
                D1=>XLXN_78(9),
                S0=>mux_addr1(9),
                O=>o_do(9));
   
   MUX_DO_10 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(10),
                D1=>XLXN_78(10),
                S0=>mux_addr1(9),
                O=>o_do(10));
   
   MUX_DO_11 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(11),
                D1=>XLXN_78(11),
                S0=>mux_addr1(9),
                O=>o_do(11));
   
   MUX_DO_12 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(12),
                D1=>XLXN_78(12),
                S0=>mux_addr1(9),
                O=>o_do(12));
   
   MUX_DO_13 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(13),
                D1=>XLXN_78(13),
                S0=>mux_addr1(9),
                O=>o_do(13));
   
   MUX_DO_14 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(14),
                D1=>XLXN_78(14),
                S0=>mux_addr1(9),
                O=>o_do(14));
   
   MUX_DO_15 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(15),
                D1=>XLXN_78(15),
                S0=>mux_addr1(9),
                O=>o_do(15));
   
   MUX_DO_16 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(16),
                D1=>XLXN_78(16),
                S0=>mux_addr1(9),
                O=>o_do(16));
   
   MUX_DO_17 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(17),
                D1=>XLXN_78(17),
                S0=>mux_addr1(9),
                O=>o_do(17));
   
   MUX_DO_18 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(18),
                D1=>XLXN_78(18),
                S0=>mux_addr1(9),
                O=>o_do(18));
   
   MUX_DO_19 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(19),
                D1=>XLXN_78(19),
                S0=>mux_addr1(9),
                O=>o_do(19));
   
   MUX_DO_20 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(20),
                D1=>XLXN_78(20),
                S0=>mux_addr1(9),
                O=>o_do(20));
   
   MUX_DO_21 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(21),
                D1=>XLXN_78(21),
                S0=>mux_addr1(9),
                O=>o_do(21));
   
   MUX_DO_22 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(22),
                D1=>XLXN_78(22),
                S0=>mux_addr1(9),
                O=>o_do(22));
   
   MUX_DO_23 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(23),
                D1=>XLXN_78(23),
                S0=>mux_addr1(9),
                O=>o_do(23));
   
   MUX_DO_24 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(24),
                D1=>XLXN_78(24),
                S0=>mux_addr1(9),
                O=>o_do(24));
   
   MUX_DO_25 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(25),
                D1=>XLXN_78(25),
                S0=>mux_addr1(9),
                O=>o_do(25));
   
   MUX_DO_26 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(26),
                D1=>XLXN_78(26),
                S0=>mux_addr1(9),
                O=>o_do(26));
   
   MUX_DO_27 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(27),
                D1=>XLXN_78(27),
                S0=>mux_addr1(9),
                O=>o_do(27));
   
   MUX_DO_28 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(28),
                D1=>XLXN_78(28),
                S0=>mux_addr1(9),
                O=>o_do(28));
   
   MUX_DO_29 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(29),
                D1=>XLXN_78(29),
                S0=>mux_addr1(9),
                O=>o_do(29));
   
   MUX_DO_30 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(30),
                D1=>XLXN_78(30),
                S0=>mux_addr1(9),
                O=>o_do(30));
   
   MUX_DO_31 : M2_1_MXILINX_CalculatePixOS
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
      port map (I=>XLXN_216,
                O=>XLXN_139(0));
   
   XLXI_29_1 : BUF
      port map (I=>XLXN_216,
                O=>XLXN_139(1));
   
   XLXI_29_2 : BUF
      port map (I=>XLXN_216,
                O=>XLXN_139(2));
   
   XLXI_29_3 : BUF
      port map (I=>XLXN_216,
                O=>XLXN_139(3));
   
   XLXI_110 : rom_unsigned4bit_2powx
      port map (nibble_in(3 downto 0)=>XLXN_194(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_200(31 downto 0));
   
   XLXI_111 : rom_signed4bit
      port map (nibble_in(3 downto 0)=>XLXN_195(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_201(31 downto 0));
   
   XLXI_112 : colrow_even
      port map (col(0 to 4)=>XLXN_189(0 to 4),
                row(0 to 4)=>XLXN_188(0 to 4),
                cole=>XLXN_187,
                rowe=>XLXN_186);
   
   XLXI_113 : ExtractKvParameters_process_p1
      port map (cole=>XLXN_187,
                kvijee_ee(3 downto 0)=>XLXN_202(3 downto 0),
                kvijee_eo(3 downto 0)=>XLXN_204(3 downto 0),
                kvijee_oe(3 downto 0)=>XLXN_203(3 downto 0),
                kvijee_oo(3 downto 0)=>XLXN_205(3 downto 0),
                rowe=>XLXN_186,
                kvijee(3 downto 0)=>XLXN_209(3 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity rom_signed8bit_MUSER_CalculatePixOS is
   port ( i_clock : in    std_logic; 
          i_reset : in    std_logic; 
          i_value : in    std_logic_vector (7 downto 0); 
          o_value : out   std_logic_vector (31 downto 0));
end rom_signed8bit_MUSER_CalculatePixOS;

architecture BEHAVIORAL of rom_signed8bit_MUSER_CalculatePixOS is
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

entity ExtractKtaParameters_MUSER_CalculatePixOS is
   port ( addfpr        : in    std_logic_vector (31 downto 0); 
          addfprdy      : in    std_logic; 
          divfpr        : in    std_logic_vector (31 downto 0); 
          divfprdy      : in    std_logic; 
          i_addr        : in    std_logic_vector (9 downto 0); 
          i_clock       : in    std_logic; 
          i_reset       : in    std_logic; 
          i_run         : in    std_logic; 
          i2c_mem_douta : in    std_logic_vector (7 downto 0); 
          mulfpr        : in    std_logic_vector (31 downto 0); 
          mulfprdy      : in    std_logic; 
          addfpa        : out   std_logic_vector (31 downto 0); 
          addfpb        : out   std_logic_vector (31 downto 0); 
          addfpce       : out   std_logic; 
          addfpond      : out   std_logic; 
          addfpsclr     : out   std_logic; 
          divfpa        : out   std_logic_vector (31 downto 0); 
          divfpb        : out   std_logic_vector (31 downto 0); 
          divfpce       : out   std_logic; 
          divfpond      : out   std_logic; 
          divfpsclr     : out   std_logic; 
          i2c_mem_addra : out   std_logic_vector (11 downto 0); 
          i2c_mem_ena   : out   std_logic; 
          mulfpa        : out   std_logic_vector (31 downto 0); 
          mulfpb        : out   std_logic_vector (31 downto 0); 
          mulfpce       : out   std_logic; 
          mulfpond      : out   std_logic; 
          mulfpsclr     : out   std_logic; 
          o_do          : out   std_logic_vector (31 downto 0); 
          o_rdy         : out   std_logic);
end ExtractKtaParameters_MUSER_CalculatePixOS;

architecture BEHAVIORAL of ExtractKtaParameters_MUSER_CalculatePixOS is
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
   signal mux_addr1                                : std_logic_vector (9 downto 
         0);
   signal o_write_enable                           : std_logic;
   signal XLXN_44                                  : std_logic_vector (14 
         downto 0);
   signal XLXN_45                                  : std_logic_vector (14 
         downto 0);
   signal XLXN_59                                  : std_logic;
   signal XLXN_78                                  : std_logic_vector (31 
         downto 0);
   signal XLXN_79                                  : std_logic_vector (31 
         downto 0);
   signal XLXN_88                                  : std_logic_vector (31 
         downto 0);
   signal XLXN_139                                 : std_logic_vector (3 downto 
         0);
   signal XLXN_173                                 : std_logic_vector (31 
         downto 0);
   signal XLXN_178                                 : std_logic_vector (31 
         downto 0);
   signal XLXN_196                                 : std_logic_vector (7 downto 
         0);
   signal XLXN_197                                 : std_logic_vector (3 downto 
         0);
   signal XLXN_200                                 : std_logic_vector (31 
         downto 0);
   signal XLXN_201                                 : std_logic_vector (3 downto 
         0);
   signal XLXN_235                                 : std_logic_vector (2 downto 
         0);
   signal XLXN_238                                 : std_logic_vector (31 
         downto 0);
   signal XLXN_239                                 : std_logic_vector (0 to 4);
   signal XLXN_240                                 : std_logic_vector (0 to 4);
   signal XLXN_243                                 : std_logic;
   signal XLXN_244                                 : std_logic;
   signal XLXN_245                                 : std_logic_vector (7 downto 
         0);
   signal XLXN_246                                 : std_logic_vector (7 downto 
         0);
   signal XLXN_247                                 : std_logic_vector (7 downto 
         0);
   signal XLXN_248                                 : std_logic_vector (7 downto 
         0);
   signal XLXN_253                                 : std_logic_vector (7 downto 
         0);
   signal XLXN_254                                 : std_logic_vector (9 downto 
         0);
   signal o_rdy_DUMMY                              : std_logic;
   signal mem_extrktaparam_1_ADDRB_openSignal      : std_logic_vector (14 
         downto 0);
   signal mem_extrktaparam_1_CASCADEINA_openSignal : std_logic;
   signal mem_extrktaparam_1_CASCADEINB_openSignal : std_logic;
   signal mem_extrktaparam_1_CLKB_openSignal       : std_logic;
   signal mem_extrktaparam_1_DIB_openSignal        : std_logic_vector (31 
         downto 0);
   signal mem_extrktaparam_1_DIPA_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extrktaparam_1_DIPB_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extrktaparam_1_ENB_openSignal        : std_logic;
   signal mem_extrktaparam_1_REGCEA_openSignal     : std_logic;
   signal mem_extrktaparam_1_REGCEB_openSignal     : std_logic;
   signal mem_extrktaparam_1_SSRB_openSignal       : std_logic;
   signal mem_extrktaparam_1_WEB_openSignal        : std_logic_vector (3 downto 
         0);
   signal mem_extrktaparam_2_ADDRB_openSignal      : std_logic_vector (14 
         downto 0);
   signal mem_extrktaparam_2_CASCADEINA_openSignal : std_logic;
   signal mem_extrktaparam_2_CASCADEINB_openSignal : std_logic;
   signal mem_extrktaparam_2_CLKB_openSignal       : std_logic;
   signal mem_extrktaparam_2_DIB_openSignal        : std_logic_vector (31 
         downto 0);
   signal mem_extrktaparam_2_DIPA_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extrktaparam_2_DIPB_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_extrktaparam_2_ENB_openSignal        : std_logic;
   signal mem_extrktaparam_2_REGCEA_openSignal     : std_logic;
   signal mem_extrktaparam_2_REGCEB_openSignal     : std_logic;
   signal mem_extrktaparam_2_SSRB_openSignal       : std_logic;
   signal mem_extrktaparam_2_WEB_openSignal        : std_logic_vector (3 downto 
         0);
   component ExtractKtaParameters_process_p0
      port ( i_clock              : in    std_logic; 
             i_reset              : in    std_logic; 
             i_run                : in    std_logic; 
             mulfprdy             : in    std_logic; 
             addfprdy             : in    std_logic; 
             divfprdy             : in    std_logic; 
             i2c_mem_douta        : in    std_logic_vector (7 downto 0); 
             nibble_in1           : in    std_logic_vector (31 downto 0); 
             nibble_in2           : in    std_logic_vector (31 downto 0); 
             nibble_in3           : in    std_logic_vector (31 downto 0); 
             ktarcee              : in    std_logic_vector (7 downto 0); 
             mem_signed256_ovalue : in    std_logic_vector (31 downto 0); 
             mulfpr               : in    std_logic_vector (31 downto 0); 
             addfpr               : in    std_logic_vector (31 downto 0); 
             divfpr               : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena          : out   std_logic; 
             o_write_enable       : out   std_logic; 
             o_rdy                : out   std_logic; 
             mulfpond             : out   std_logic; 
             mulfpsclr            : out   std_logic; 
             mulfpce              : out   std_logic; 
             addfpond             : out   std_logic; 
             addfpsclr            : out   std_logic; 
             addfpce              : out   std_logic; 
             divfpond             : out   std_logic; 
             divfpsclr            : out   std_logic; 
             divfpce              : out   std_logic; 
             i2c_mem_addra        : out   std_logic_vector (11 downto 0); 
             nibble_out1          : out   std_logic_vector (3 downto 0); 
             nibble_out2          : out   std_logic_vector (3 downto 0); 
             nibble_out3          : out   std_logic_vector (2 downto 0); 
             o_dia                : out   std_logic_vector (31 downto 0); 
             o_addra              : out   std_logic_vector (9 downto 0); 
             ktarcee_oo           : out   std_logic_vector (7 downto 0); 
             ktarcee_eo           : out   std_logic_vector (7 downto 0); 
             ktarcee_oe           : out   std_logic_vector (7 downto 0); 
             ktarcee_ee           : out   std_logic_vector (7 downto 0); 
             mem_signed256_ivalue : out   std_logic_vector (7 downto 0); 
             o_col                : out   std_logic_vector (0 to 4); 
             o_row                : out   std_logic_vector (0 to 4); 
             mulfpa               : out   std_logic_vector (31 downto 0); 
             mulfpb               : out   std_logic_vector (31 downto 0); 
             addfpa               : out   std_logic_vector (31 downto 0); 
             addfpb               : out   std_logic_vector (31 downto 0); 
             divfpa               : out   std_logic_vector (31 downto 0); 
             divfpb               : out   std_logic_vector (31 downto 0));
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
   
   component M2_1_MXILINX_CalculatePixOS
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
   
   component rom_signed8bit_MUSER_CalculatePixOS
      port ( i_value : in    std_logic_vector (7 downto 0); 
             i_clock : in    std_logic; 
             i_reset : in    std_logic; 
             o_value : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_unsigned4bit_2powx8
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_unsigned4bit_2powx
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_signed3bit
      port ( nibble_in  : in    std_logic_vector (2 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component colrow_even
      port ( col  : in    std_logic_vector (0 to 4); 
             row  : in    std_logic_vector (0 to 4); 
             cole : out   std_logic; 
             rowe : out   std_logic);
   end component;
   
   component ExtractKtaParameters_process_p1
      port ( cole       : in    std_logic; 
             rowe       : in    std_logic; 
             ktarcee_oo : in    std_logic_vector (7 downto 0); 
             ktarcee_eo : in    std_logic_vector (7 downto 0); 
             ktarcee_oe : in    std_logic_vector (7 downto 0); 
             ktarcee_ee : in    std_logic_vector (7 downto 0); 
             ktarcee    : out   std_logic_vector (7 downto 0));
   end component;
   
   attribute WRITE_WIDTH_B of mem_extrktaparam_1 : label is "36";
   attribute WRITE_WIDTH_A of mem_extrktaparam_1 : label is "36";
   attribute WRITE_MODE_B of mem_extrktaparam_1 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_extrktaparam_1 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_extrktaparam_1 : label is "36";
   attribute READ_WIDTH_A of mem_extrktaparam_1 : label is "36";
   attribute WRITE_WIDTH_B of mem_extrktaparam_2 : label is "36";
   attribute WRITE_WIDTH_A of mem_extrktaparam_2 : label is "36";
   attribute WRITE_MODE_B of mem_extrktaparam_2 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_extrktaparam_2 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_extrktaparam_2 : label is "36";
   attribute READ_WIDTH_A of mem_extrktaparam_2 : label is "36";
   attribute HU_SET of MUX_ADDR_0 : label is "MUX_ADDR_0_1430";
   attribute HU_SET of MUX_ADDR_1 : label is "MUX_ADDR_1_1429";
   attribute HU_SET of MUX_ADDR_2 : label is "MUX_ADDR_2_1428";
   attribute HU_SET of MUX_ADDR_3 : label is "MUX_ADDR_3_1427";
   attribute HU_SET of MUX_ADDR_4 : label is "MUX_ADDR_4_1426";
   attribute HU_SET of MUX_ADDR_5 : label is "MUX_ADDR_5_1425";
   attribute HU_SET of MUX_ADDR_6 : label is "MUX_ADDR_6_1424";
   attribute HU_SET of MUX_ADDR_7 : label is "MUX_ADDR_7_1423";
   attribute HU_SET of MUX_ADDR_8 : label is "MUX_ADDR_8_1422";
   attribute HU_SET of MUX_ADDR_9 : label is "MUX_ADDR_9_1421";
   attribute HU_SET of MUX_DO_0 : label is "MUX_DO_0_1420";
   attribute HU_SET of MUX_DO_1 : label is "MUX_DO_1_1419";
   attribute HU_SET of MUX_DO_2 : label is "MUX_DO_2_1418";
   attribute HU_SET of MUX_DO_3 : label is "MUX_DO_3_1417";
   attribute HU_SET of MUX_DO_4 : label is "MUX_DO_4_1416";
   attribute HU_SET of MUX_DO_5 : label is "MUX_DO_5_1415";
   attribute HU_SET of MUX_DO_6 : label is "MUX_DO_6_1414";
   attribute HU_SET of MUX_DO_7 : label is "MUX_DO_7_1413";
   attribute HU_SET of MUX_DO_8 : label is "MUX_DO_8_1412";
   attribute HU_SET of MUX_DO_9 : label is "MUX_DO_9_1411";
   attribute HU_SET of MUX_DO_10 : label is "MUX_DO_10_1410";
   attribute HU_SET of MUX_DO_11 : label is "MUX_DO_11_1409";
   attribute HU_SET of MUX_DO_12 : label is "MUX_DO_12_1408";
   attribute HU_SET of MUX_DO_13 : label is "MUX_DO_13_1407";
   attribute HU_SET of MUX_DO_14 : label is "MUX_DO_14_1406";
   attribute HU_SET of MUX_DO_15 : label is "MUX_DO_15_1405";
   attribute HU_SET of MUX_DO_16 : label is "MUX_DO_16_1404";
   attribute HU_SET of MUX_DO_17 : label is "MUX_DO_17_1403";
   attribute HU_SET of MUX_DO_18 : label is "MUX_DO_18_1402";
   attribute HU_SET of MUX_DO_19 : label is "MUX_DO_19_1401";
   attribute HU_SET of MUX_DO_20 : label is "MUX_DO_20_1400";
   attribute HU_SET of MUX_DO_21 : label is "MUX_DO_21_1399";
   attribute HU_SET of MUX_DO_22 : label is "MUX_DO_22_1398";
   attribute HU_SET of MUX_DO_23 : label is "MUX_DO_23_1397";
   attribute HU_SET of MUX_DO_24 : label is "MUX_DO_24_1396";
   attribute HU_SET of MUX_DO_25 : label is "MUX_DO_25_1395";
   attribute HU_SET of MUX_DO_26 : label is "MUX_DO_26_1394";
   attribute HU_SET of MUX_DO_27 : label is "MUX_DO_27_1393";
   attribute HU_SET of MUX_DO_28 : label is "MUX_DO_28_1392";
   attribute HU_SET of MUX_DO_29 : label is "MUX_DO_29_1391";
   attribute HU_SET of MUX_DO_30 : label is "MUX_DO_30_1390";
   attribute HU_SET of MUX_DO_31 : label is "MUX_DO_31_1389";
begin
   o_rdy <= o_rdy_DUMMY;
   inst_extrktaparam_proc0 : ExtractKtaParameters_process_p0
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                ktarcee(7 downto 0)=>XLXN_253(7 downto 0),
                mem_signed256_ovalue(31 downto 0)=>XLXN_173(31 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                nibble_in1(31 downto 0)=>XLXN_178(31 downto 0),
                nibble_in2(31 downto 0)=>XLXN_200(31 downto 0),
                nibble_in3(31 downto 0)=>XLXN_238(31 downto 0),
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
                i2c_mem_addra(11 downto 0)=>i2c_mem_addra(11 downto 0),
                i2c_mem_ena=>i2c_mem_ena,
                ktarcee_ee(7 downto 0)=>XLXN_245(7 downto 0),
                ktarcee_eo(7 downto 0)=>XLXN_247(7 downto 0),
                ktarcee_oe(7 downto 0)=>XLXN_246(7 downto 0),
                ktarcee_oo(7 downto 0)=>XLXN_248(7 downto 0),
                mem_signed256_ivalue(7 downto 0)=>XLXN_196(7 downto 0),
                mulfpa(31 downto 0)=>mulfpa(31 downto 0),
                mulfpb(31 downto 0)=>mulfpb(31 downto 0),
                mulfpce=>mulfpce,
                mulfpond=>mulfpond,
                mulfpsclr=>mulfpsclr,
                nibble_out1(3 downto 0)=>XLXN_201(3 downto 0),
                nibble_out2(3 downto 0)=>XLXN_197(3 downto 0),
                nibble_out3(2 downto 0)=>XLXN_235(2 downto 0),
                o_addra(9 downto 0)=>XLXN_254(9 downto 0),
                o_col(0 to 4)=>XLXN_240(0 to 4),
                o_dia(31 downto 0)=>XLXN_88(31 downto 0),
                o_rdy=>o_rdy_DUMMY,
                o_row(0 to 4)=>XLXN_239(0 to 4),
                o_write_enable=>o_write_enable);
   
   mem_extrktaparam_1 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_44(14 downto 0),
                ADDRB(14 downto 0)=>mem_extrktaparam_1_ADDRB_openSignal(14 
            downto 0),
                CASCADEINA=>mem_extrktaparam_1_CASCADEINA_openSignal,
                CASCADEINB=>mem_extrktaparam_1_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_extrktaparam_1_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_88(31 downto 0),
                DIB(31 downto 0)=>mem_extrktaparam_1_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_extrktaparam_1_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_extrktaparam_1_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_59,
                ENB=>mem_extrktaparam_1_ENB_openSignal,
                REGCEA=>mem_extrktaparam_1_REGCEA_openSignal,
                REGCEB=>mem_extrktaparam_1_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_extrktaparam_1_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_extrktaparam_1_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_79(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   mem_extrktaparam_2 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_45(14 downto 0),
                ADDRB(14 downto 0)=>mem_extrktaparam_2_ADDRB_openSignal(14 
            downto 0),
                CASCADEINA=>mem_extrktaparam_2_CASCADEINA_openSignal,
                CASCADEINB=>mem_extrktaparam_2_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_extrktaparam_2_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_88(31 downto 0),
                DIB(31 downto 0)=>mem_extrktaparam_2_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_extrktaparam_2_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_extrktaparam_2_DIPB_openSignal(3 downto 0),
                ENA=>mux_addr1(9),
                ENB=>mem_extrktaparam_2_ENB_openSignal,
                REGCEA=>mem_extrktaparam_2_REGCEA_openSignal,
                REGCEB=>mem_extrktaparam_2_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_extrktaparam_2_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_extrktaparam_2_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_78(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   MUX_ADDR_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_254(0),
                D1=>i_addr(0),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(0));
   
   MUX_ADDR_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_254(1),
                D1=>i_addr(1),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(1));
   
   MUX_ADDR_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_254(2),
                D1=>i_addr(2),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(2));
   
   MUX_ADDR_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_254(3),
                D1=>i_addr(3),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(3));
   
   MUX_ADDR_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_254(4),
                D1=>i_addr(4),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(4));
   
   MUX_ADDR_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_254(5),
                D1=>i_addr(5),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(5));
   
   MUX_ADDR_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_254(6),
                D1=>i_addr(6),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(6));
   
   MUX_ADDR_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_254(7),
                D1=>i_addr(7),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(7));
   
   MUX_ADDR_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_254(8),
                D1=>i_addr(8),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(8));
   
   MUX_ADDR_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_254(9),
                D1=>i_addr(9),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(9));
   
   MUX_DO_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(0),
                D1=>XLXN_78(0),
                S0=>mux_addr1(9),
                O=>o_do(0));
   
   MUX_DO_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(1),
                D1=>XLXN_78(1),
                S0=>mux_addr1(9),
                O=>o_do(1));
   
   MUX_DO_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(2),
                D1=>XLXN_78(2),
                S0=>mux_addr1(9),
                O=>o_do(2));
   
   MUX_DO_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(3),
                D1=>XLXN_78(3),
                S0=>mux_addr1(9),
                O=>o_do(3));
   
   MUX_DO_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(4),
                D1=>XLXN_78(4),
                S0=>mux_addr1(9),
                O=>o_do(4));
   
   MUX_DO_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(5),
                D1=>XLXN_78(5),
                S0=>mux_addr1(9),
                O=>o_do(5));
   
   MUX_DO_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(6),
                D1=>XLXN_78(6),
                S0=>mux_addr1(9),
                O=>o_do(6));
   
   MUX_DO_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(7),
                D1=>XLXN_78(7),
                S0=>mux_addr1(9),
                O=>o_do(7));
   
   MUX_DO_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(8),
                D1=>XLXN_78(8),
                S0=>mux_addr1(9),
                O=>o_do(8));
   
   MUX_DO_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(9),
                D1=>XLXN_78(9),
                S0=>mux_addr1(9),
                O=>o_do(9));
   
   MUX_DO_10 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(10),
                D1=>XLXN_78(10),
                S0=>mux_addr1(9),
                O=>o_do(10));
   
   MUX_DO_11 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(11),
                D1=>XLXN_78(11),
                S0=>mux_addr1(9),
                O=>o_do(11));
   
   MUX_DO_12 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(12),
                D1=>XLXN_78(12),
                S0=>mux_addr1(9),
                O=>o_do(12));
   
   MUX_DO_13 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(13),
                D1=>XLXN_78(13),
                S0=>mux_addr1(9),
                O=>o_do(13));
   
   MUX_DO_14 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(14),
                D1=>XLXN_78(14),
                S0=>mux_addr1(9),
                O=>o_do(14));
   
   MUX_DO_15 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(15),
                D1=>XLXN_78(15),
                S0=>mux_addr1(9),
                O=>o_do(15));
   
   MUX_DO_16 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(16),
                D1=>XLXN_78(16),
                S0=>mux_addr1(9),
                O=>o_do(16));
   
   MUX_DO_17 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(17),
                D1=>XLXN_78(17),
                S0=>mux_addr1(9),
                O=>o_do(17));
   
   MUX_DO_18 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(18),
                D1=>XLXN_78(18),
                S0=>mux_addr1(9),
                O=>o_do(18));
   
   MUX_DO_19 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(19),
                D1=>XLXN_78(19),
                S0=>mux_addr1(9),
                O=>o_do(19));
   
   MUX_DO_20 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(20),
                D1=>XLXN_78(20),
                S0=>mux_addr1(9),
                O=>o_do(20));
   
   MUX_DO_21 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(21),
                D1=>XLXN_78(21),
                S0=>mux_addr1(9),
                O=>o_do(21));
   
   MUX_DO_22 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(22),
                D1=>XLXN_78(22),
                S0=>mux_addr1(9),
                O=>o_do(22));
   
   MUX_DO_23 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(23),
                D1=>XLXN_78(23),
                S0=>mux_addr1(9),
                O=>o_do(23));
   
   MUX_DO_24 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(24),
                D1=>XLXN_78(24),
                S0=>mux_addr1(9),
                O=>o_do(24));
   
   MUX_DO_25 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(25),
                D1=>XLXN_78(25),
                S0=>mux_addr1(9),
                O=>o_do(25));
   
   MUX_DO_26 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(26),
                D1=>XLXN_78(26),
                S0=>mux_addr1(9),
                O=>o_do(26));
   
   MUX_DO_27 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(27),
                D1=>XLXN_78(27),
                S0=>mux_addr1(9),
                O=>o_do(27));
   
   MUX_DO_28 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(28),
                D1=>XLXN_78(28),
                S0=>mux_addr1(9),
                O=>o_do(28));
   
   MUX_DO_29 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(29),
                D1=>XLXN_78(29),
                S0=>mux_addr1(9),
                O=>o_do(29));
   
   MUX_DO_30 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(30),
                D1=>XLXN_78(30),
                S0=>mux_addr1(9),
                O=>o_do(30));
   
   MUX_DO_31 : M2_1_MXILINX_CalculatePixOS
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
      port map (I=>o_write_enable,
                O=>XLXN_139(0));
   
   XLXI_29_1 : BUF
      port map (I=>o_write_enable,
                O=>XLXN_139(1));
   
   XLXI_29_2 : BUF
      port map (I=>o_write_enable,
                O=>XLXN_139(2));
   
   XLXI_29_3 : BUF
      port map (I=>o_write_enable,
                O=>XLXN_139(3));
   
   XLXI_62 : rom_signed8bit_MUSER_CalculatePixOS
      port map (i_clock=>i_clock,
                i_reset=>i_reset,
                i_value(7 downto 0)=>XLXN_196(7 downto 0),
                o_value(31 downto 0)=>XLXN_173(31 downto 0));
   
   XLXI_63 : rom_unsigned4bit_2powx8
      port map (nibble_in(3 downto 0)=>XLXN_201(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_178(31 downto 0));
   
   XLXI_66 : rom_unsigned4bit_2powx
      port map (nibble_in(3 downto 0)=>XLXN_197(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_200(31 downto 0));
   
   XLXI_83 : rom_signed3bit
      port map (nibble_in(2 downto 0)=>XLXN_235(2 downto 0),
                nibble_out(31 downto 0)=>XLXN_238(31 downto 0));
   
   XLXI_84 : colrow_even
      port map (col(0 to 4)=>XLXN_240(0 to 4),
                row(0 to 4)=>XLXN_239(0 to 4),
                cole=>XLXN_243,
                rowe=>XLXN_244);
   
   XLXI_85 : ExtractKtaParameters_process_p1
      port map (cole=>XLXN_243,
                ktarcee_ee(7 downto 0)=>XLXN_245(7 downto 0),
                ktarcee_eo(7 downto 0)=>XLXN_247(7 downto 0),
                ktarcee_oe(7 downto 0)=>XLXN_246(7 downto 0),
                ktarcee_oo(7 downto 0)=>XLXN_248(7 downto 0),
                rowe=>XLXN_244,
                ktarcee(7 downto 0)=>XLXN_253(7 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ExtractOffsetParameters_MUSER_CalculatePixOS is
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
end ExtractOffsetParameters_MUSER_CalculatePixOS;

architecture BEHAVIORAL of ExtractOffsetParameters_MUSER_CalculatePixOS is
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
   
   component M2_1_MXILINX_CalculatePixOS
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
   attribute HU_SET of MUX_DO_0 : label is "MUX_DO_0_1462";
   attribute HU_SET of MUX_DO_1 : label is "MUX_DO_1_1461";
   attribute HU_SET of MUX_DO_2 : label is "MUX_DO_2_1460";
   attribute HU_SET of MUX_DO_3 : label is "MUX_DO_3_1459";
   attribute HU_SET of MUX_DO_4 : label is "MUX_DO_4_1458";
   attribute HU_SET of MUX_DO_5 : label is "MUX_DO_5_1457";
   attribute HU_SET of MUX_DO_6 : label is "MUX_DO_6_1456";
   attribute HU_SET of MUX_DO_7 : label is "MUX_DO_7_1455";
   attribute HU_SET of MUX_DO_8 : label is "MUX_DO_8_1454";
   attribute HU_SET of MUX_DO_9 : label is "MUX_DO_9_1453";
   attribute HU_SET of MUX_DO_10 : label is "MUX_DO_10_1452";
   attribute HU_SET of MUX_DO_11 : label is "MUX_DO_11_1451";
   attribute HU_SET of MUX_DO_12 : label is "MUX_DO_12_1450";
   attribute HU_SET of MUX_DO_13 : label is "MUX_DO_13_1449";
   attribute HU_SET of MUX_DO_14 : label is "MUX_DO_14_1448";
   attribute HU_SET of MUX_DO_15 : label is "MUX_DO_15_1447";
   attribute HU_SET of MUX_DO_16 : label is "MUX_DO_16_1446";
   attribute HU_SET of MUX_DO_17 : label is "MUX_DO_17_1445";
   attribute HU_SET of MUX_DO_18 : label is "MUX_DO_18_1444";
   attribute HU_SET of MUX_DO_19 : label is "MUX_DO_19_1443";
   attribute HU_SET of MUX_DO_20 : label is "MUX_DO_20_1442";
   attribute HU_SET of MUX_DO_21 : label is "MUX_DO_21_1441";
   attribute HU_SET of MUX_DO_22 : label is "MUX_DO_22_1440";
   attribute HU_SET of MUX_DO_23 : label is "MUX_DO_23_1439";
   attribute HU_SET of MUX_DO_24 : label is "MUX_DO_24_1438";
   attribute HU_SET of MUX_DO_25 : label is "MUX_DO_25_1437";
   attribute HU_SET of MUX_DO_26 : label is "MUX_DO_26_1436";
   attribute HU_SET of MUX_DO_27 : label is "MUX_DO_27_1435";
   attribute HU_SET of MUX_DO_28 : label is "MUX_DO_28_1434";
   attribute HU_SET of MUX_DO_29 : label is "MUX_DO_29_1433";
   attribute HU_SET of MUX_DO_30 : label is "MUX_DO_30_1432";
   attribute HU_SET of MUX_DO_31 : label is "MUX_DO_31_1431";
   attribute HU_SET of XLXI_56_0 : label is "XLXI_56_0_1494";
   attribute HU_SET of XLXI_56_1 : label is "XLXI_56_1_1493";
   attribute HU_SET of XLXI_56_2 : label is "XLXI_56_2_1492";
   attribute HU_SET of XLXI_56_3 : label is "XLXI_56_3_1491";
   attribute HU_SET of XLXI_56_4 : label is "XLXI_56_4_1490";
   attribute HU_SET of XLXI_56_5 : label is "XLXI_56_5_1489";
   attribute HU_SET of XLXI_56_6 : label is "XLXI_56_6_1488";
   attribute HU_SET of XLXI_56_7 : label is "XLXI_56_7_1487";
   attribute HU_SET of XLXI_56_8 : label is "XLXI_56_8_1486";
   attribute HU_SET of XLXI_56_9 : label is "XLXI_56_9_1485";
   attribute HU_SET of XLXI_56_10 : label is "XLXI_56_10_1484";
   attribute HU_SET of XLXI_56_11 : label is "XLXI_56_11_1483";
   attribute HU_SET of XLXI_56_12 : label is "XLXI_56_12_1482";
   attribute HU_SET of XLXI_56_13 : label is "XLXI_56_13_1481";
   attribute HU_SET of XLXI_56_14 : label is "XLXI_56_14_1480";
   attribute HU_SET of XLXI_56_15 : label is "XLXI_56_15_1479";
   attribute HU_SET of XLXI_56_16 : label is "XLXI_56_16_1478";
   attribute HU_SET of XLXI_56_17 : label is "XLXI_56_17_1477";
   attribute HU_SET of XLXI_56_18 : label is "XLXI_56_18_1476";
   attribute HU_SET of XLXI_56_19 : label is "XLXI_56_19_1475";
   attribute HU_SET of XLXI_56_20 : label is "XLXI_56_20_1474";
   attribute HU_SET of XLXI_56_21 : label is "XLXI_56_21_1473";
   attribute HU_SET of XLXI_56_22 : label is "XLXI_56_22_1472";
   attribute HU_SET of XLXI_56_23 : label is "XLXI_56_23_1471";
   attribute HU_SET of XLXI_56_24 : label is "XLXI_56_24_1470";
   attribute HU_SET of XLXI_56_25 : label is "XLXI_56_25_1469";
   attribute HU_SET of XLXI_56_26 : label is "XLXI_56_26_1468";
   attribute HU_SET of XLXI_56_27 : label is "XLXI_56_27_1467";
   attribute HU_SET of XLXI_56_28 : label is "XLXI_56_28_1466";
   attribute HU_SET of XLXI_56_29 : label is "XLXI_56_29_1465";
   attribute HU_SET of XLXI_56_30 : label is "XLXI_56_30_1464";
   attribute HU_SET of XLXI_56_31 : label is "XLXI_56_31_1463";
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
   
   MUX_DO_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(0),
                D1=>doa2(0),
                S0=>mux_addr1(9),
                O=>XLXN_180(0));
   
   MUX_DO_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(1),
                D1=>doa2(1),
                S0=>mux_addr1(9),
                O=>XLXN_180(1));
   
   MUX_DO_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(2),
                D1=>doa2(2),
                S0=>mux_addr1(9),
                O=>XLXN_180(2));
   
   MUX_DO_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(3),
                D1=>doa2(3),
                S0=>mux_addr1(9),
                O=>XLXN_180(3));
   
   MUX_DO_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(4),
                D1=>doa2(4),
                S0=>mux_addr1(9),
                O=>XLXN_180(4));
   
   MUX_DO_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(5),
                D1=>doa2(5),
                S0=>mux_addr1(9),
                O=>XLXN_180(5));
   
   MUX_DO_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(6),
                D1=>doa2(6),
                S0=>mux_addr1(9),
                O=>XLXN_180(6));
   
   MUX_DO_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(7),
                D1=>doa2(7),
                S0=>mux_addr1(9),
                O=>XLXN_180(7));
   
   MUX_DO_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(8),
                D1=>doa2(8),
                S0=>mux_addr1(9),
                O=>XLXN_180(8));
   
   MUX_DO_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(9),
                D1=>doa2(9),
                S0=>mux_addr1(9),
                O=>XLXN_180(9));
   
   MUX_DO_10 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(10),
                D1=>doa2(10),
                S0=>mux_addr1(9),
                O=>XLXN_180(10));
   
   MUX_DO_11 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(11),
                D1=>doa2(11),
                S0=>mux_addr1(9),
                O=>XLXN_180(11));
   
   MUX_DO_12 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(12),
                D1=>doa2(12),
                S0=>mux_addr1(9),
                O=>XLXN_180(12));
   
   MUX_DO_13 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(13),
                D1=>doa2(13),
                S0=>mux_addr1(9),
                O=>XLXN_180(13));
   
   MUX_DO_14 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(14),
                D1=>doa2(14),
                S0=>mux_addr1(9),
                O=>XLXN_180(14));
   
   MUX_DO_15 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(15),
                D1=>doa2(15),
                S0=>mux_addr1(9),
                O=>XLXN_180(15));
   
   MUX_DO_16 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(16),
                D1=>doa2(16),
                S0=>mux_addr1(9),
                O=>XLXN_180(16));
   
   MUX_DO_17 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(17),
                D1=>doa2(17),
                S0=>mux_addr1(9),
                O=>XLXN_180(17));
   
   MUX_DO_18 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(18),
                D1=>doa2(18),
                S0=>mux_addr1(9),
                O=>XLXN_180(18));
   
   MUX_DO_19 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(19),
                D1=>doa2(19),
                S0=>mux_addr1(9),
                O=>XLXN_180(19));
   
   MUX_DO_20 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(20),
                D1=>doa2(20),
                S0=>mux_addr1(9),
                O=>XLXN_180(20));
   
   MUX_DO_21 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(21),
                D1=>doa2(21),
                S0=>mux_addr1(9),
                O=>XLXN_180(21));
   
   MUX_DO_22 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(22),
                D1=>doa2(22),
                S0=>mux_addr1(9),
                O=>XLXN_180(22));
   
   MUX_DO_23 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(23),
                D1=>doa2(23),
                S0=>mux_addr1(9),
                O=>XLXN_180(23));
   
   MUX_DO_24 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(24),
                D1=>doa2(24),
                S0=>mux_addr1(9),
                O=>XLXN_180(24));
   
   MUX_DO_25 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(25),
                D1=>doa2(25),
                S0=>mux_addr1(9),
                O=>XLXN_180(25));
   
   MUX_DO_26 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(26),
                D1=>doa2(26),
                S0=>mux_addr1(9),
                O=>XLXN_180(26));
   
   MUX_DO_27 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(27),
                D1=>doa2(27),
                S0=>mux_addr1(9),
                O=>XLXN_180(27));
   
   MUX_DO_28 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(28),
                D1=>doa2(28),
                S0=>mux_addr1(9),
                O=>XLXN_180(28));
   
   MUX_DO_29 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(29),
                D1=>doa2(29),
                S0=>mux_addr1(9),
                O=>XLXN_180(29));
   
   MUX_DO_30 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>doa1(30),
                D1=>doa2(30),
                S0=>mux_addr1(9),
                O=>XLXN_180(30));
   
   MUX_DO_31 : M2_1_MXILINX_CalculatePixOS
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
   
   XLXI_56_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(0),
                D1=>XLXN_180(0),
                S0=>o_rdy_DUMMY,
                O=>o_do(0));
   
   XLXI_56_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(1),
                D1=>XLXN_180(1),
                S0=>o_rdy_DUMMY,
                O=>o_do(1));
   
   XLXI_56_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(2),
                D1=>XLXN_180(2),
                S0=>o_rdy_DUMMY,
                O=>o_do(2));
   
   XLXI_56_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(3),
                D1=>XLXN_180(3),
                S0=>o_rdy_DUMMY,
                O=>o_do(3));
   
   XLXI_56_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(4),
                D1=>XLXN_180(4),
                S0=>o_rdy_DUMMY,
                O=>o_do(4));
   
   XLXI_56_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(5),
                D1=>XLXN_180(5),
                S0=>o_rdy_DUMMY,
                O=>o_do(5));
   
   XLXI_56_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(6),
                D1=>XLXN_180(6),
                S0=>o_rdy_DUMMY,
                O=>o_do(6));
   
   XLXI_56_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(7),
                D1=>XLXN_180(7),
                S0=>o_rdy_DUMMY,
                O=>o_do(7));
   
   XLXI_56_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(8),
                D1=>XLXN_180(8),
                S0=>o_rdy_DUMMY,
                O=>o_do(8));
   
   XLXI_56_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(9),
                D1=>XLXN_180(9),
                S0=>o_rdy_DUMMY,
                O=>o_do(9));
   
   XLXI_56_10 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(10),
                D1=>XLXN_180(10),
                S0=>o_rdy_DUMMY,
                O=>o_do(10));
   
   XLXI_56_11 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(11),
                D1=>XLXN_180(11),
                S0=>o_rdy_DUMMY,
                O=>o_do(11));
   
   XLXI_56_12 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(12),
                D1=>XLXN_180(12),
                S0=>o_rdy_DUMMY,
                O=>o_do(12));
   
   XLXI_56_13 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(13),
                D1=>XLXN_180(13),
                S0=>o_rdy_DUMMY,
                O=>o_do(13));
   
   XLXI_56_14 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(14),
                D1=>XLXN_180(14),
                S0=>o_rdy_DUMMY,
                O=>o_do(14));
   
   XLXI_56_15 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(15),
                D1=>XLXN_180(15),
                S0=>o_rdy_DUMMY,
                O=>o_do(15));
   
   XLXI_56_16 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(16),
                D1=>XLXN_180(16),
                S0=>o_rdy_DUMMY,
                O=>o_do(16));
   
   XLXI_56_17 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(17),
                D1=>XLXN_180(17),
                S0=>o_rdy_DUMMY,
                O=>o_do(17));
   
   XLXI_56_18 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(18),
                D1=>XLXN_180(18),
                S0=>o_rdy_DUMMY,
                O=>o_do(18));
   
   XLXI_56_19 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(19),
                D1=>XLXN_180(19),
                S0=>o_rdy_DUMMY,
                O=>o_do(19));
   
   XLXI_56_20 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(20),
                D1=>XLXN_180(20),
                S0=>o_rdy_DUMMY,
                O=>o_do(20));
   
   XLXI_56_21 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(21),
                D1=>XLXN_180(21),
                S0=>o_rdy_DUMMY,
                O=>o_do(21));
   
   XLXI_56_22 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(22),
                D1=>XLXN_180(22),
                S0=>o_rdy_DUMMY,
                O=>o_do(22));
   
   XLXI_56_23 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(23),
                D1=>XLXN_180(23),
                S0=>o_rdy_DUMMY,
                O=>o_do(23));
   
   XLXI_56_24 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(24),
                D1=>XLXN_180(24),
                S0=>o_rdy_DUMMY,
                O=>o_do(24));
   
   XLXI_56_25 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(25),
                D1=>XLXN_180(25),
                S0=>o_rdy_DUMMY,
                O=>o_do(25));
   
   XLXI_56_26 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(26),
                D1=>XLXN_180(26),
                S0=>o_rdy_DUMMY,
                O=>o_do(26));
   
   XLXI_56_27 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(27),
                D1=>XLXN_180(27),
                S0=>o_rdy_DUMMY,
                O=>o_do(27));
   
   XLXI_56_28 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(28),
                D1=>XLXN_180(28),
                S0=>o_rdy_DUMMY,
                O=>o_do(28));
   
   XLXI_56_29 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(29),
                D1=>XLXN_180(29),
                S0=>o_rdy_DUMMY,
                O=>o_do(29));
   
   XLXI_56_30 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_179(30),
                D1=>XLXN_180(30),
                S0=>o_rdy_DUMMY,
                O=>o_do(30));
   
   XLXI_56_31 : M2_1_MXILINX_CalculatePixOS
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CalculatePixGain_MUSER_CalculatePixOS is
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
end CalculatePixGain_MUSER_CalculatePixOS;

architecture BEHAVIORAL of CalculatePixGain_MUSER_CalculatePixOS is
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
   
   component M2_1_MXILINX_CalculatePixOS
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
   attribute HU_SET of MUX_DIA_0 : label is "MUX_DIA_0_1568";
   attribute HU_SET of MUX_DIA_1 : label is "MUX_DIA_1_1567";
   attribute HU_SET of MUX_DIA_2 : label is "MUX_DIA_2_1566";
   attribute HU_SET of MUX_DIA_3 : label is "MUX_DIA_3_1565";
   attribute HU_SET of MUX_DIA_4 : label is "MUX_DIA_4_1564";
   attribute HU_SET of MUX_DIA_5 : label is "MUX_DIA_5_1563";
   attribute HU_SET of MUX_DIA_6 : label is "MUX_DIA_6_1562";
   attribute HU_SET of MUX_DIA_7 : label is "MUX_DIA_7_1561";
   attribute HU_SET of MUX_DIA_8 : label is "MUX_DIA_8_1560";
   attribute HU_SET of MUX_DIA_9 : label is "MUX_DIA_9_1559";
   attribute HU_SET of MUX_DIA_10 : label is "MUX_DIA_10_1558";
   attribute HU_SET of MUX_DIA_11 : label is "MUX_DIA_11_1557";
   attribute HU_SET of MUX_DIA_12 : label is "MUX_DIA_12_1556";
   attribute HU_SET of MUX_DIA_13 : label is "MUX_DIA_13_1555";
   attribute HU_SET of MUX_DIA_14 : label is "MUX_DIA_14_1554";
   attribute HU_SET of MUX_DIA_15 : label is "MUX_DIA_15_1553";
   attribute HU_SET of MUX_DIA_16 : label is "MUX_DIA_16_1552";
   attribute HU_SET of MUX_DIA_17 : label is "MUX_DIA_17_1551";
   attribute HU_SET of MUX_DIA_18 : label is "MUX_DIA_18_1550";
   attribute HU_SET of MUX_DIA_19 : label is "MUX_DIA_19_1549";
   attribute HU_SET of MUX_DIA_20 : label is "MUX_DIA_20_1548";
   attribute HU_SET of MUX_DIA_21 : label is "MUX_DIA_21_1547";
   attribute HU_SET of MUX_DIA_22 : label is "MUX_DIA_22_1546";
   attribute HU_SET of MUX_DIA_23 : label is "MUX_DIA_23_1545";
   attribute HU_SET of MUX_DIA_24 : label is "MUX_DIA_24_1544";
   attribute HU_SET of MUX_DIA_25 : label is "MUX_DIA_25_1543";
   attribute HU_SET of MUX_DIA_26 : label is "MUX_DIA_26_1542";
   attribute HU_SET of MUX_DIA_27 : label is "MUX_DIA_27_1541";
   attribute HU_SET of MUX_DIA_28 : label is "MUX_DIA_28_1540";
   attribute HU_SET of MUX_DIA_29 : label is "MUX_DIA_29_1539";
   attribute HU_SET of MUX_DIA_30 : label is "MUX_DIA_30_1538";
   attribute HU_SET of MUX_DIA_31 : label is "MUX_DIA_31_1537";
   attribute HU_SET of MUX_DO_0 : label is "MUX_DO_0_1526";
   attribute HU_SET of MUX_DO_1 : label is "MUX_DO_1_1525";
   attribute HU_SET of MUX_DO_2 : label is "MUX_DO_2_1524";
   attribute HU_SET of MUX_DO_3 : label is "MUX_DO_3_1523";
   attribute HU_SET of MUX_DO_4 : label is "MUX_DO_4_1522";
   attribute HU_SET of MUX_DO_5 : label is "MUX_DO_5_1521";
   attribute HU_SET of MUX_DO_6 : label is "MUX_DO_6_1520";
   attribute HU_SET of MUX_DO_7 : label is "MUX_DO_7_1519";
   attribute HU_SET of MUX_DO_8 : label is "MUX_DO_8_1518";
   attribute HU_SET of MUX_DO_9 : label is "MUX_DO_9_1517";
   attribute HU_SET of MUX_DO_10 : label is "MUX_DO_10_1516";
   attribute HU_SET of MUX_DO_11 : label is "MUX_DO_11_1515";
   attribute HU_SET of MUX_DO_12 : label is "MUX_DO_12_1514";
   attribute HU_SET of MUX_DO_13 : label is "MUX_DO_13_1513";
   attribute HU_SET of MUX_DO_14 : label is "MUX_DO_14_1512";
   attribute HU_SET of MUX_DO_15 : label is "MUX_DO_15_1511";
   attribute HU_SET of MUX_DO_16 : label is "MUX_DO_16_1510";
   attribute HU_SET of MUX_DO_17 : label is "MUX_DO_17_1509";
   attribute HU_SET of MUX_DO_18 : label is "MUX_DO_18_1508";
   attribute HU_SET of MUX_DO_19 : label is "MUX_DO_19_1507";
   attribute HU_SET of MUX_DO_20 : label is "MUX_DO_20_1506";
   attribute HU_SET of MUX_DO_21 : label is "MUX_DO_21_1505";
   attribute HU_SET of MUX_DO_22 : label is "MUX_DO_22_1504";
   attribute HU_SET of MUX_DO_23 : label is "MUX_DO_23_1503";
   attribute HU_SET of MUX_DO_24 : label is "MUX_DO_24_1502";
   attribute HU_SET of MUX_DO_25 : label is "MUX_DO_25_1501";
   attribute HU_SET of MUX_DO_26 : label is "MUX_DO_26_1500";
   attribute HU_SET of MUX_DO_27 : label is "MUX_DO_27_1499";
   attribute HU_SET of MUX_DO_28 : label is "MUX_DO_28_1498";
   attribute HU_SET of MUX_DO_29 : label is "MUX_DO_29_1497";
   attribute HU_SET of MUX_DO_30 : label is "MUX_DO_30_1496";
   attribute HU_SET of MUX_DO_31 : label is "MUX_DO_31_1495";
   attribute HU_SET of MUX_F2FA_0 : label is "MUX_F2FA_0_1645";
   attribute HU_SET of MUX_F2FA_1 : label is "MUX_F2FA_1_1644";
   attribute HU_SET of MUX_F2FA_2 : label is "MUX_F2FA_2_1643";
   attribute HU_SET of MUX_F2FA_3 : label is "MUX_F2FA_3_1642";
   attribute HU_SET of MUX_F2FA_4 : label is "MUX_F2FA_4_1641";
   attribute HU_SET of MUX_F2FA_5 : label is "MUX_F2FA_5_1640";
   attribute HU_SET of MUX_F2FA_6 : label is "MUX_F2FA_6_1639";
   attribute HU_SET of MUX_F2FA_7 : label is "MUX_F2FA_7_1638";
   attribute HU_SET of MUX_F2FA_8 : label is "MUX_F2FA_8_1637";
   attribute HU_SET of MUX_F2FA_9 : label is "MUX_F2FA_9_1636";
   attribute HU_SET of MUX_F2FA_10 : label is "MUX_F2FA_10_1635";
   attribute HU_SET of MUX_F2FA_11 : label is "MUX_F2FA_11_1634";
   attribute HU_SET of MUX_F2FA_12 : label is "MUX_F2FA_12_1633";
   attribute HU_SET of MUX_F2FA_13 : label is "MUX_F2FA_13_1632";
   attribute HU_SET of MUX_F2FA_14 : label is "MUX_F2FA_14_1631";
   attribute HU_SET of MUX_F2FA_15 : label is "MUX_F2FA_15_1630";
   attribute HU_SET of MUX_F2FA_16 : label is "MUX_F2FA_16_1629";
   attribute HU_SET of MUX_F2FA_17 : label is "MUX_F2FA_17_1628";
   attribute HU_SET of MUX_F2FA_18 : label is "MUX_F2FA_18_1627";
   attribute HU_SET of MUX_F2FA_19 : label is "MUX_F2FA_19_1626";
   attribute HU_SET of MUX_F2FA_20 : label is "MUX_F2FA_20_1625";
   attribute HU_SET of MUX_F2FA_21 : label is "MUX_F2FA_21_1624";
   attribute HU_SET of MUX_F2FA_22 : label is "MUX_F2FA_22_1623";
   attribute HU_SET of MUX_F2FA_23 : label is "MUX_F2FA_23_1622";
   attribute HU_SET of MUX_F2FA_24 : label is "MUX_F2FA_24_1621";
   attribute HU_SET of MUX_F2FA_25 : label is "MUX_F2FA_25_1620";
   attribute HU_SET of MUX_F2FA_26 : label is "MUX_F2FA_26_1619";
   attribute HU_SET of MUX_F2FA_27 : label is "MUX_F2FA_27_1618";
   attribute HU_SET of MUX_F2FA_28 : label is "MUX_F2FA_28_1617";
   attribute HU_SET of MUX_F2FA_29 : label is "MUX_F2FA_29_1616";
   attribute HU_SET of MUX_F2FA_30 : label is "MUX_F2FA_30_1615";
   attribute HU_SET of MUX_F2FA_31 : label is "MUX_F2FA_31_1614";
   attribute HU_SET of MUX_F2FA_32 : label is "MUX_F2FA_32_1613";
   attribute HU_SET of MUX_F2FA_33 : label is "MUX_F2FA_33_1612";
   attribute HU_SET of MUX_F2FA_34 : label is "MUX_F2FA_34_1611";
   attribute HU_SET of MUX_F2FA_35 : label is "MUX_F2FA_35_1610";
   attribute HU_SET of MUX_F2FA_36 : label is "MUX_F2FA_36_1609";
   attribute HU_SET of MUX_F2FA_37 : label is "MUX_F2FA_37_1608";
   attribute HU_SET of MUX_F2FA_38 : label is "MUX_F2FA_38_1607";
   attribute HU_SET of MUX_F2FA_39 : label is "MUX_F2FA_39_1606";
   attribute HU_SET of MUX_F2FA_40 : label is "MUX_F2FA_40_1605";
   attribute HU_SET of MUX_F2FA_41 : label is "MUX_F2FA_41_1604";
   attribute HU_SET of MUX_F2FA_42 : label is "MUX_F2FA_42_1603";
   attribute HU_SET of MUX_F2FA_43 : label is "MUX_F2FA_43_1602";
   attribute HU_SET of MUX_F2FA_44 : label is "MUX_F2FA_44_1601";
   attribute HU_SET of MUX_F2FA_45 : label is "MUX_F2FA_45_1600";
   attribute HU_SET of MUX_F2FA_46 : label is "MUX_F2FA_46_1599";
   attribute HU_SET of MUX_F2FA_47 : label is "MUX_F2FA_47_1598";
   attribute HU_SET of MUX_F2FA_48 : label is "MUX_F2FA_48_1597";
   attribute HU_SET of MUX_F2FA_49 : label is "MUX_F2FA_49_1596";
   attribute HU_SET of MUX_F2FA_50 : label is "MUX_F2FA_50_1595";
   attribute HU_SET of MUX_F2FA_51 : label is "MUX_F2FA_51_1594";
   attribute HU_SET of MUX_F2FA_52 : label is "MUX_F2FA_52_1593";
   attribute HU_SET of MUX_F2FA_53 : label is "MUX_F2FA_53_1592";
   attribute HU_SET of MUX_F2FA_54 : label is "MUX_F2FA_54_1591";
   attribute HU_SET of MUX_F2FA_55 : label is "MUX_F2FA_55_1590";
   attribute HU_SET of MUX_F2FA_56 : label is "MUX_F2FA_56_1589";
   attribute HU_SET of MUX_F2FA_57 : label is "MUX_F2FA_57_1588";
   attribute HU_SET of MUX_F2FA_58 : label is "MUX_F2FA_58_1587";
   attribute HU_SET of MUX_F2FA_59 : label is "MUX_F2FA_59_1586";
   attribute HU_SET of MUX_F2FA_60 : label is "MUX_F2FA_60_1585";
   attribute HU_SET of MUX_F2FA_61 : label is "MUX_F2FA_61_1584";
   attribute HU_SET of MUX_F2FA_62 : label is "MUX_F2FA_62_1583";
   attribute HU_SET of MUX_F2FA_63 : label is "MUX_F2FA_63_1582";
   attribute HU_SET of MUX_I2C_ADDR_0 : label is "MUX_I2C_ADDR_0_1581";
   attribute HU_SET of MUX_I2C_ADDR_1 : label is "MUX_I2C_ADDR_1_1580";
   attribute HU_SET of MUX_I2C_ADDR_2 : label is "MUX_I2C_ADDR_2_1579";
   attribute HU_SET of MUX_I2C_ADDR_3 : label is "MUX_I2C_ADDR_3_1578";
   attribute HU_SET of MUX_I2C_ADDR_4 : label is "MUX_I2C_ADDR_4_1577";
   attribute HU_SET of MUX_I2C_ADDR_5 : label is "MUX_I2C_ADDR_5_1576";
   attribute HU_SET of MUX_I2C_ADDR_6 : label is "MUX_I2C_ADDR_6_1575";
   attribute HU_SET of MUX_I2C_ADDR_7 : label is "MUX_I2C_ADDR_7_1574";
   attribute HU_SET of MUX_I2C_ADDR_8 : label is "MUX_I2C_ADDR_8_1573";
   attribute HU_SET of MUX_I2C_ADDR_9 : label is "MUX_I2C_ADDR_9_1572";
   attribute HU_SET of MUX_I2C_ADDR_10 : label is "MUX_I2C_ADDR_10_1571";
   attribute HU_SET of MUX_I2C_ADDR_11 : label is "MUX_I2C_ADDR_11_1570";
   attribute HU_SET of mux2_addra_0 : label is "mux2_addra_0_1536";
   attribute HU_SET of mux2_addra_1 : label is "mux2_addra_1_1535";
   attribute HU_SET of mux2_addra_2 : label is "mux2_addra_2_1534";
   attribute HU_SET of mux2_addra_3 : label is "mux2_addra_3_1533";
   attribute HU_SET of mux2_addra_4 : label is "mux2_addra_4_1532";
   attribute HU_SET of mux2_addra_5 : label is "mux2_addra_5_1531";
   attribute HU_SET of mux2_addra_6 : label is "mux2_addra_6_1530";
   attribute HU_SET of mux2_addra_7 : label is "mux2_addra_7_1529";
   attribute HU_SET of mux2_addra_8 : label is "mux2_addra_8_1528";
   attribute HU_SET of mux2_addra_9 : label is "mux2_addra_9_1527";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_1569";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_1646";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_1647";
   attribute HU_SET of XLXI_27 : label is "XLXI_27_1648";
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
   
   MUX_DIA_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(0),
                D1=>XLXN_158(0),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(0));
   
   MUX_DIA_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(1),
                D1=>XLXN_158(1),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(1));
   
   MUX_DIA_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(2),
                D1=>XLXN_158(2),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(2));
   
   MUX_DIA_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(3),
                D1=>XLXN_158(3),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(3));
   
   MUX_DIA_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(4),
                D1=>XLXN_158(4),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(4));
   
   MUX_DIA_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(5),
                D1=>XLXN_158(5),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(5));
   
   MUX_DIA_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(6),
                D1=>XLXN_158(6),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(6));
   
   MUX_DIA_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(7),
                D1=>XLXN_158(7),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(7));
   
   MUX_DIA_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(8),
                D1=>XLXN_158(8),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(8));
   
   MUX_DIA_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(9),
                D1=>XLXN_158(9),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(9));
   
   MUX_DIA_10 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(10),
                D1=>XLXN_158(10),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(10));
   
   MUX_DIA_11 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(11),
                D1=>XLXN_158(11),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(11));
   
   MUX_DIA_12 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(12),
                D1=>XLXN_158(12),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(12));
   
   MUX_DIA_13 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(13),
                D1=>XLXN_158(13),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(13));
   
   MUX_DIA_14 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(14),
                D1=>XLXN_158(14),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(14));
   
   MUX_DIA_15 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(15),
                D1=>XLXN_158(15),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(15));
   
   MUX_DIA_16 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(16),
                D1=>XLXN_158(16),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(16));
   
   MUX_DIA_17 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(17),
                D1=>XLXN_158(17),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(17));
   
   MUX_DIA_18 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(18),
                D1=>XLXN_158(18),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(18));
   
   MUX_DIA_19 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(19),
                D1=>XLXN_158(19),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(19));
   
   MUX_DIA_20 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(20),
                D1=>XLXN_158(20),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(20));
   
   MUX_DIA_21 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(21),
                D1=>XLXN_158(21),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(21));
   
   MUX_DIA_22 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(22),
                D1=>XLXN_158(22),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(22));
   
   MUX_DIA_23 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(23),
                D1=>XLXN_158(23),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(23));
   
   MUX_DIA_24 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(24),
                D1=>XLXN_158(24),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(24));
   
   MUX_DIA_25 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(25),
                D1=>XLXN_158(25),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(25));
   
   MUX_DIA_26 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(26),
                D1=>XLXN_158(26),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(26));
   
   MUX_DIA_27 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(27),
                D1=>XLXN_158(27),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(27));
   
   MUX_DIA_28 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(28),
                D1=>XLXN_158(28),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(28));
   
   MUX_DIA_29 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(29),
                D1=>XLXN_158(29),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(29));
   
   MUX_DIA_30 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(30),
                D1=>XLXN_158(30),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(30));
   
   MUX_DIA_31 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_157(31),
                D1=>XLXN_158(31),
                S0=>o_rdy_DUMMY,
                O=>XLXN_88(31));
   
   MUX_DO_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(0),
                D1=>XLXN_78(0),
                S0=>mux_addr(9),
                O=>o_do(0));
   
   MUX_DO_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(1),
                D1=>XLXN_78(1),
                S0=>mux_addr(9),
                O=>o_do(1));
   
   MUX_DO_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(2),
                D1=>XLXN_78(2),
                S0=>mux_addr(9),
                O=>o_do(2));
   
   MUX_DO_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(3),
                D1=>XLXN_78(3),
                S0=>mux_addr(9),
                O=>o_do(3));
   
   MUX_DO_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(4),
                D1=>XLXN_78(4),
                S0=>mux_addr(9),
                O=>o_do(4));
   
   MUX_DO_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(5),
                D1=>XLXN_78(5),
                S0=>mux_addr(9),
                O=>o_do(5));
   
   MUX_DO_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(6),
                D1=>XLXN_78(6),
                S0=>mux_addr(9),
                O=>o_do(6));
   
   MUX_DO_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(7),
                D1=>XLXN_78(7),
                S0=>mux_addr(9),
                O=>o_do(7));
   
   MUX_DO_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(8),
                D1=>XLXN_78(8),
                S0=>mux_addr(9),
                O=>o_do(8));
   
   MUX_DO_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(9),
                D1=>XLXN_78(9),
                S0=>mux_addr(9),
                O=>o_do(9));
   
   MUX_DO_10 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(10),
                D1=>XLXN_78(10),
                S0=>mux_addr(9),
                O=>o_do(10));
   
   MUX_DO_11 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(11),
                D1=>XLXN_78(11),
                S0=>mux_addr(9),
                O=>o_do(11));
   
   MUX_DO_12 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(12),
                D1=>XLXN_78(12),
                S0=>mux_addr(9),
                O=>o_do(12));
   
   MUX_DO_13 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(13),
                D1=>XLXN_78(13),
                S0=>mux_addr(9),
                O=>o_do(13));
   
   MUX_DO_14 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(14),
                D1=>XLXN_78(14),
                S0=>mux_addr(9),
                O=>o_do(14));
   
   MUX_DO_15 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(15),
                D1=>XLXN_78(15),
                S0=>mux_addr(9),
                O=>o_do(15));
   
   MUX_DO_16 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(16),
                D1=>XLXN_78(16),
                S0=>mux_addr(9),
                O=>o_do(16));
   
   MUX_DO_17 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(17),
                D1=>XLXN_78(17),
                S0=>mux_addr(9),
                O=>o_do(17));
   
   MUX_DO_18 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(18),
                D1=>XLXN_78(18),
                S0=>mux_addr(9),
                O=>o_do(18));
   
   MUX_DO_19 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(19),
                D1=>XLXN_78(19),
                S0=>mux_addr(9),
                O=>o_do(19));
   
   MUX_DO_20 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(20),
                D1=>XLXN_78(20),
                S0=>mux_addr(9),
                O=>o_do(20));
   
   MUX_DO_21 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(21),
                D1=>XLXN_78(21),
                S0=>mux_addr(9),
                O=>o_do(21));
   
   MUX_DO_22 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(22),
                D1=>XLXN_78(22),
                S0=>mux_addr(9),
                O=>o_do(22));
   
   MUX_DO_23 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(23),
                D1=>XLXN_78(23),
                S0=>mux_addr(9),
                O=>o_do(23));
   
   MUX_DO_24 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(24),
                D1=>XLXN_78(24),
                S0=>mux_addr(9),
                O=>o_do(24));
   
   MUX_DO_25 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(25),
                D1=>XLXN_78(25),
                S0=>mux_addr(9),
                O=>o_do(25));
   
   MUX_DO_26 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(26),
                D1=>XLXN_78(26),
                S0=>mux_addr(9),
                O=>o_do(26));
   
   MUX_DO_27 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(27),
                D1=>XLXN_78(27),
                S0=>mux_addr(9),
                O=>o_do(27));
   
   MUX_DO_28 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(28),
                D1=>XLXN_78(28),
                S0=>mux_addr(9),
                O=>o_do(28));
   
   MUX_DO_29 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(29),
                D1=>XLXN_78(29),
                S0=>mux_addr(9),
                O=>o_do(29));
   
   MUX_DO_30 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(30),
                D1=>XLXN_78(30),
                S0=>mux_addr(9),
                O=>o_do(30));
   
   MUX_DO_31 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(31),
                D1=>XLXN_78(31),
                S0=>mux_addr(9),
                O=>o_do(31));
   
   MUX_F2FA_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(0),
                D1=>XLXN_119(0),
                S0=>XLXN_113,
                O=>fixed2floata(0));
   
   MUX_F2FA_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(1),
                D1=>XLXN_119(1),
                S0=>XLXN_113,
                O=>fixed2floata(1));
   
   MUX_F2FA_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(2),
                D1=>XLXN_119(2),
                S0=>XLXN_113,
                O=>fixed2floata(2));
   
   MUX_F2FA_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(3),
                D1=>XLXN_119(3),
                S0=>XLXN_113,
                O=>fixed2floata(3));
   
   MUX_F2FA_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(4),
                D1=>XLXN_119(4),
                S0=>XLXN_113,
                O=>fixed2floata(4));
   
   MUX_F2FA_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(5),
                D1=>XLXN_119(5),
                S0=>XLXN_113,
                O=>fixed2floata(5));
   
   MUX_F2FA_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(6),
                D1=>XLXN_119(6),
                S0=>XLXN_113,
                O=>fixed2floata(6));
   
   MUX_F2FA_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(7),
                D1=>XLXN_119(7),
                S0=>XLXN_113,
                O=>fixed2floata(7));
   
   MUX_F2FA_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(8),
                D1=>XLXN_119(8),
                S0=>XLXN_113,
                O=>fixed2floata(8));
   
   MUX_F2FA_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(9),
                D1=>XLXN_119(9),
                S0=>XLXN_113,
                O=>fixed2floata(9));
   
   MUX_F2FA_10 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(10),
                D1=>XLXN_119(10),
                S0=>XLXN_113,
                O=>fixed2floata(10));
   
   MUX_F2FA_11 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(11),
                D1=>XLXN_119(11),
                S0=>XLXN_113,
                O=>fixed2floata(11));
   
   MUX_F2FA_12 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(12),
                D1=>XLXN_119(12),
                S0=>XLXN_113,
                O=>fixed2floata(12));
   
   MUX_F2FA_13 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(13),
                D1=>XLXN_119(13),
                S0=>XLXN_113,
                O=>fixed2floata(13));
   
   MUX_F2FA_14 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(14),
                D1=>XLXN_119(14),
                S0=>XLXN_113,
                O=>fixed2floata(14));
   
   MUX_F2FA_15 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(15),
                D1=>XLXN_119(15),
                S0=>XLXN_113,
                O=>fixed2floata(15));
   
   MUX_F2FA_16 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(16),
                D1=>XLXN_119(16),
                S0=>XLXN_113,
                O=>fixed2floata(16));
   
   MUX_F2FA_17 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(17),
                D1=>XLXN_119(17),
                S0=>XLXN_113,
                O=>fixed2floata(17));
   
   MUX_F2FA_18 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(18),
                D1=>XLXN_119(18),
                S0=>XLXN_113,
                O=>fixed2floata(18));
   
   MUX_F2FA_19 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(19),
                D1=>XLXN_119(19),
                S0=>XLXN_113,
                O=>fixed2floata(19));
   
   MUX_F2FA_20 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(20),
                D1=>XLXN_119(20),
                S0=>XLXN_113,
                O=>fixed2floata(20));
   
   MUX_F2FA_21 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(21),
                D1=>XLXN_119(21),
                S0=>XLXN_113,
                O=>fixed2floata(21));
   
   MUX_F2FA_22 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(22),
                D1=>XLXN_119(22),
                S0=>XLXN_113,
                O=>fixed2floata(22));
   
   MUX_F2FA_23 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(23),
                D1=>XLXN_119(23),
                S0=>XLXN_113,
                O=>fixed2floata(23));
   
   MUX_F2FA_24 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(24),
                D1=>XLXN_119(24),
                S0=>XLXN_113,
                O=>fixed2floata(24));
   
   MUX_F2FA_25 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(25),
                D1=>XLXN_119(25),
                S0=>XLXN_113,
                O=>fixed2floata(25));
   
   MUX_F2FA_26 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(26),
                D1=>XLXN_119(26),
                S0=>XLXN_113,
                O=>fixed2floata(26));
   
   MUX_F2FA_27 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(27),
                D1=>XLXN_119(27),
                S0=>XLXN_113,
                O=>fixed2floata(27));
   
   MUX_F2FA_28 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(28),
                D1=>XLXN_119(28),
                S0=>XLXN_113,
                O=>fixed2floata(28));
   
   MUX_F2FA_29 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(29),
                D1=>XLXN_119(29),
                S0=>XLXN_113,
                O=>fixed2floata(29));
   
   MUX_F2FA_30 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(30),
                D1=>XLXN_119(30),
                S0=>XLXN_113,
                O=>fixed2floata(30));
   
   MUX_F2FA_31 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(31),
                D1=>XLXN_119(31),
                S0=>XLXN_113,
                O=>fixed2floata(31));
   
   MUX_F2FA_32 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(32),
                D1=>XLXN_119(32),
                S0=>XLXN_113,
                O=>fixed2floata(32));
   
   MUX_F2FA_33 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(33),
                D1=>XLXN_119(33),
                S0=>XLXN_113,
                O=>fixed2floata(33));
   
   MUX_F2FA_34 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(34),
                D1=>XLXN_119(34),
                S0=>XLXN_113,
                O=>fixed2floata(34));
   
   MUX_F2FA_35 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(35),
                D1=>XLXN_119(35),
                S0=>XLXN_113,
                O=>fixed2floata(35));
   
   MUX_F2FA_36 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(36),
                D1=>XLXN_119(36),
                S0=>XLXN_113,
                O=>fixed2floata(36));
   
   MUX_F2FA_37 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(37),
                D1=>XLXN_119(37),
                S0=>XLXN_113,
                O=>fixed2floata(37));
   
   MUX_F2FA_38 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(38),
                D1=>XLXN_119(38),
                S0=>XLXN_113,
                O=>fixed2floata(38));
   
   MUX_F2FA_39 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(39),
                D1=>XLXN_119(39),
                S0=>XLXN_113,
                O=>fixed2floata(39));
   
   MUX_F2FA_40 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(40),
                D1=>XLXN_119(40),
                S0=>XLXN_113,
                O=>fixed2floata(40));
   
   MUX_F2FA_41 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(41),
                D1=>XLXN_119(41),
                S0=>XLXN_113,
                O=>fixed2floata(41));
   
   MUX_F2FA_42 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(42),
                D1=>XLXN_119(42),
                S0=>XLXN_113,
                O=>fixed2floata(42));
   
   MUX_F2FA_43 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(43),
                D1=>XLXN_119(43),
                S0=>XLXN_113,
                O=>fixed2floata(43));
   
   MUX_F2FA_44 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(44),
                D1=>XLXN_119(44),
                S0=>XLXN_113,
                O=>fixed2floata(44));
   
   MUX_F2FA_45 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(45),
                D1=>XLXN_119(45),
                S0=>XLXN_113,
                O=>fixed2floata(45));
   
   MUX_F2FA_46 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(46),
                D1=>XLXN_119(46),
                S0=>XLXN_113,
                O=>fixed2floata(46));
   
   MUX_F2FA_47 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(47),
                D1=>XLXN_119(47),
                S0=>XLXN_113,
                O=>fixed2floata(47));
   
   MUX_F2FA_48 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(48),
                D1=>XLXN_119(48),
                S0=>XLXN_113,
                O=>fixed2floata(48));
   
   MUX_F2FA_49 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(49),
                D1=>XLXN_119(49),
                S0=>XLXN_113,
                O=>fixed2floata(49));
   
   MUX_F2FA_50 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(50),
                D1=>XLXN_119(50),
                S0=>XLXN_113,
                O=>fixed2floata(50));
   
   MUX_F2FA_51 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(51),
                D1=>XLXN_119(51),
                S0=>XLXN_113,
                O=>fixed2floata(51));
   
   MUX_F2FA_52 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(52),
                D1=>XLXN_119(52),
                S0=>XLXN_113,
                O=>fixed2floata(52));
   
   MUX_F2FA_53 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(53),
                D1=>XLXN_119(53),
                S0=>XLXN_113,
                O=>fixed2floata(53));
   
   MUX_F2FA_54 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(54),
                D1=>XLXN_119(54),
                S0=>XLXN_113,
                O=>fixed2floata(54));
   
   MUX_F2FA_55 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(55),
                D1=>XLXN_119(55),
                S0=>XLXN_113,
                O=>fixed2floata(55));
   
   MUX_F2FA_56 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(56),
                D1=>XLXN_119(56),
                S0=>XLXN_113,
                O=>fixed2floata(56));
   
   MUX_F2FA_57 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(57),
                D1=>XLXN_119(57),
                S0=>XLXN_113,
                O=>fixed2floata(57));
   
   MUX_F2FA_58 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(58),
                D1=>XLXN_119(58),
                S0=>XLXN_113,
                O=>fixed2floata(58));
   
   MUX_F2FA_59 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(59),
                D1=>XLXN_119(59),
                S0=>XLXN_113,
                O=>fixed2floata(59));
   
   MUX_F2FA_60 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(60),
                D1=>XLXN_119(60),
                S0=>XLXN_113,
                O=>fixed2floata(60));
   
   MUX_F2FA_61 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(61),
                D1=>XLXN_119(61),
                S0=>XLXN_113,
                O=>fixed2floata(61));
   
   MUX_F2FA_62 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(62),
                D1=>XLXN_119(62),
                S0=>XLXN_113,
                O=>fixed2floata(62));
   
   MUX_F2FA_63 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_118(63),
                D1=>XLXN_119(63),
                S0=>XLXN_113,
                O=>fixed2floata(63));
   
   MUX_I2C_ADDR_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(0),
                D1=>XLXN_115(0),
                S0=>XLXN_113,
                O=>i2c_mem_addra(0));
   
   MUX_I2C_ADDR_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(1),
                D1=>XLXN_115(1),
                S0=>XLXN_113,
                O=>i2c_mem_addra(1));
   
   MUX_I2C_ADDR_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(2),
                D1=>XLXN_115(2),
                S0=>XLXN_113,
                O=>i2c_mem_addra(2));
   
   MUX_I2C_ADDR_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(3),
                D1=>XLXN_115(3),
                S0=>XLXN_113,
                O=>i2c_mem_addra(3));
   
   MUX_I2C_ADDR_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(4),
                D1=>XLXN_115(4),
                S0=>XLXN_113,
                O=>i2c_mem_addra(4));
   
   MUX_I2C_ADDR_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(5),
                D1=>XLXN_115(5),
                S0=>XLXN_113,
                O=>i2c_mem_addra(5));
   
   MUX_I2C_ADDR_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(6),
                D1=>XLXN_115(6),
                S0=>XLXN_113,
                O=>i2c_mem_addra(6));
   
   MUX_I2C_ADDR_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(7),
                D1=>XLXN_115(7),
                S0=>XLXN_113,
                O=>i2c_mem_addra(7));
   
   MUX_I2C_ADDR_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(8),
                D1=>XLXN_115(8),
                S0=>XLXN_113,
                O=>i2c_mem_addra(8));
   
   MUX_I2C_ADDR_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(9),
                D1=>XLXN_115(9),
                S0=>XLXN_113,
                O=>i2c_mem_addra(9));
   
   MUX_I2C_ADDR_10 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(10),
                D1=>XLXN_115(10),
                S0=>XLXN_113,
                O=>i2c_mem_addra(10));
   
   MUX_I2C_ADDR_11 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_114(11),
                D1=>XLXN_115(11),
                S0=>XLXN_113,
                O=>i2c_mem_addra(11));
   
   mux2_addra_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_86(0),
                D1=>i_addr(0),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(0));
   
   mux2_addra_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_86(1),
                D1=>i_addr(1),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(1));
   
   mux2_addra_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_86(2),
                D1=>i_addr(2),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(2));
   
   mux2_addra_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_86(3),
                D1=>i_addr(3),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(3));
   
   mux2_addra_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_86(4),
                D1=>i_addr(4),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(4));
   
   mux2_addra_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_86(5),
                D1=>i_addr(5),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(5));
   
   mux2_addra_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_86(6),
                D1=>i_addr(6),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(6));
   
   mux2_addra_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_86(7),
                D1=>i_addr(7),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(7));
   
   mux2_addra_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_86(8),
                D1=>i_addr(8),
                S0=>o_rdy_DUMMY,
                O=>mux_addr(8));
   
   mux2_addra_9 : M2_1_MXILINX_CalculatePixOS
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
   
   XLXI_21 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_109,
                D1=>XLXN_112,
                S0=>XLXN_113,
                O=>i2c_mem_ena);
   
   XLXI_24 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_132,
                D1=>XLXN_135,
                S0=>XLXN_113,
                O=>fixed2floatond);
   
   XLXI_26 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_134,
                D1=>XLXN_136,
                S0=>XLXN_113,
                O=>fixed2floatsclr);
   
   XLXI_27 : M2_1_MXILINX_CalculatePixOS
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CalculatePixOS is
   port ( addfpr          : in    std_logic_vector (31 downto 0); 
          addfprdy        : in    std_logic; 
          divfpr          : in    std_logic_vector (31 downto 0); 
          divfprdy        : in    std_logic; 
          fixed2floatr    : in    std_logic_vector (31 downto 0); 
          fixed2floatrdy  : in    std_logic; 
          i_addr          : in    std_logic_vector (9 downto 0); 
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
          o_do            : out   std_logic_vector (31 downto 0); 
          o_rdy           : out   std_logic; 
          subfpa          : out   std_logic_vector (31 downto 0); 
          subfpb          : out   std_logic_vector (31 downto 0); 
          subfpce         : out   std_logic; 
          subfpond        : out   std_logic; 
          subfpsclr       : out   std_logic);
end CalculatePixOS;

architecture BEHAVIORAL of CalculatePixOS is
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
   signal calculatepixgainmux                    : std_logic;
   signal cpgi2caddr                             : std_logic_vector (11 downto 
         0);
   signal eopi2caddr                             : std_logic_vector (11 downto 
         0);
   signal extractktaparametersmux                : std_logic;
   signal extractkvparametersmux                 : std_logic;
   signal extractoffsetparametersmux             : std_logic;
   signal ktai2caddr                             : std_logic_vector (11 downto 
         0);
   signal kvi2caddr                              : std_logic_vector (11 downto 
         0);
   signal mux_addr1                              : std_logic_vector (9 downto 
         0);
   signal XLXN_44                                : std_logic_vector (14 downto 
         0);
   signal XLXN_45                                : std_logic_vector (14 downto 
         0);
   signal XLXN_59                                : std_logic;
   signal XLXN_78                                : std_logic_vector (31 downto 
         0);
   signal XLXN_79                                : std_logic_vector (31 downto 
         0);
   signal XLXN_139                               : std_logic_vector (3 downto 
         0);
   signal XLXN_210                               : std_logic_vector (9 downto 
         0);
   signal XLXN_211                               : std_logic_vector (31 downto 
         0);
   signal XLXN_216                               : std_logic;
   signal XLXN_385                               : std_logic;
   signal XLXN_386                               : std_logic;
   signal XLXN_387                               : std_logic;
   signal XLXN_388                               : std_logic;
   signal XLXN_401                               : std_logic;
   signal XLXN_402                               : std_logic;
   signal XLXN_403                               : std_logic;
   signal XLXN_404                               : std_logic;
   signal XLXN_407                               : std_logic;
   signal XLXN_408                               : std_logic;
   signal XLXN_409                               : std_logic;
   signal XLXN_410                               : std_logic;
   signal XLXN_412                               : std_logic_vector (9 downto 
         0);
   signal XLXN_413                               : std_logic_vector (9 downto 
         0);
   signal XLXN_414                               : std_logic_vector (9 downto 
         0);
   signal XLXN_415                               : std_logic_vector (9 downto 
         0);
   signal XLXN_416                               : std_logic_vector (31 downto 
         0);
   signal XLXN_417                               : std_logic_vector (31 downto 
         0);
   signal XLXN_418                               : std_logic_vector (31 downto 
         0);
   signal XLXN_419                               : std_logic_vector (31 downto 
         0);
   signal XLXN_459                               : std_logic_vector (63 downto 
         0);
   signal XLXN_461                               : std_logic_vector (63 downto 
         0);
   signal XLXN_464                               : std_logic;
   signal XLXN_465                               : std_logic;
   signal XLXN_469                               : std_logic;
   signal XLXN_470                               : std_logic;
   signal XLXN_473                               : std_logic;
   signal XLXN_474                               : std_logic;
   signal XLXN_477                               : std_logic_vector (31 downto 
         0);
   signal XLXN_478                               : std_logic_vector (31 downto 
         0);
   signal XLXN_479                               : std_logic_vector (31 downto 
         0);
   signal XLXN_480                               : std_logic_vector (31 downto 
         0);
   signal XLXN_487                               : std_logic_vector (31 downto 
         0);
   signal XLXN_488                               : std_logic_vector (31 downto 
         0);
   signal XLXN_489                               : std_logic_vector (31 downto 
         0);
   signal XLXN_490                               : std_logic_vector (31 downto 
         0);
   signal XLXN_495                               : std_logic;
   signal XLXN_496                               : std_logic;
   signal XLXN_497                               : std_logic;
   signal XLXN_498                               : std_logic;
   signal XLXN_503                               : std_logic;
   signal XLXN_504                               : std_logic;
   signal XLXN_505                               : std_logic;
   signal XLXN_506                               : std_logic;
   signal XLXN_511                               : std_logic;
   signal XLXN_512                               : std_logic;
   signal XLXN_513                               : std_logic;
   signal XLXN_514                               : std_logic;
   signal XLXN_518                               : std_logic_vector (31 downto 
         0);
   signal XLXN_519                               : std_logic_vector (31 downto 
         0);
   signal XLXN_520                               : std_logic_vector (31 downto 
         0);
   signal XLXN_526                               : std_logic_vector (31 downto 
         0);
   signal XLXN_529                               : std_logic_vector (31 downto 
         0);
   signal XLXN_530                               : std_logic_vector (31 downto 
         0);
   signal XLXN_534                               : std_logic;
   signal XLXN_535                               : std_logic;
   signal XLXN_536                               : std_logic;
   signal XLXN_537                               : std_logic;
   signal XLXN_538                               : std_logic;
   signal XLXN_539                               : std_logic;
   signal XLXN_540                               : std_logic;
   signal XLXN_542                               : std_logic;
   signal XLXN_543                               : std_logic;
   signal XLXN_558                               : std_logic_vector (31 downto 
         0);
   signal XLXN_559                               : std_logic_vector (31 downto 
         0);
   signal XLXN_560                               : std_logic_vector (31 downto 
         0);
   signal XLXN_561                               : std_logic_vector (31 downto 
         0);
   signal XLXN_562                               : std_logic_vector (31 downto 
         0);
   signal XLXN_563                               : std_logic_vector (31 downto 
         0);
   signal XLXN_564                               : std_logic;
   signal XLXN_565                               : std_logic;
   signal XLXN_566                               : std_logic;
   signal XLXN_567                               : std_logic;
   signal XLXN_568                               : std_logic;
   signal XLXN_569                               : std_logic;
   signal XLXN_570                               : std_logic;
   signal XLXN_571                               : std_logic;
   signal XLXN_572                               : std_logic;
   signal XLXN_573                               : std_logic_vector (7 downto 
         0);
   signal XLXN_574                               : std_logic_vector (7 downto 
         0);
   signal XLXN_575                               : std_logic_vector (7 downto 
         0);
   signal XLXN_576                               : std_logic_vector (7 downto 
         0);
   signal XLXN_580                               : std_logic_vector (7 downto 
         0);
   signal XLXN_581                               : std_logic_vector (7 downto 
         0);
   signal XLXN_582                               : std_logic_vector (7 downto 
         0);
   signal XLXN_583                               : std_logic_vector (7 downto 
         0);
   signal XLXN_589                               : std_logic_vector (7 downto 
         0);
   signal o_rdy_DUMMY                            : std_logic;
   signal mem_calc_pixos_1_ADDRB_openSignal      : std_logic_vector (14 downto 
         0);
   signal mem_calc_pixos_1_CASCADEINA_openSignal : std_logic;
   signal mem_calc_pixos_1_CASCADEINB_openSignal : std_logic;
   signal mem_calc_pixos_1_CLKB_openSignal       : std_logic;
   signal mem_calc_pixos_1_DIB_openSignal        : std_logic_vector (31 downto 
         0);
   signal mem_calc_pixos_1_DIPA_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_calc_pixos_1_DIPB_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_calc_pixos_1_ENB_openSignal        : std_logic;
   signal mem_calc_pixos_1_REGCEA_openSignal     : std_logic;
   signal mem_calc_pixos_1_REGCEB_openSignal     : std_logic;
   signal mem_calc_pixos_1_SSRB_openSignal       : std_logic;
   signal mem_calc_pixos_1_WEB_openSignal        : std_logic_vector (3 downto 
         0);
   signal mem_calc_pixos_2_ADDRB_openSignal      : std_logic_vector (14 downto 
         0);
   signal mem_calc_pixos_2_CASCADEINA_openSignal : std_logic;
   signal mem_calc_pixos_2_CASCADEINB_openSignal : std_logic;
   signal mem_calc_pixos_2_CLKB_openSignal       : std_logic;
   signal mem_calc_pixos_2_DIB_openSignal        : std_logic_vector (31 downto 
         0);
   signal mem_calc_pixos_2_DIPA_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_calc_pixos_2_DIPB_openSignal       : std_logic_vector (3 downto 
         0);
   signal mem_calc_pixos_2_ENB_openSignal        : std_logic;
   signal mem_calc_pixos_2_REGCEA_openSignal     : std_logic;
   signal mem_calc_pixos_2_REGCEB_openSignal     : std_logic;
   signal mem_calc_pixos_2_SSRB_openSignal       : std_logic;
   signal mem_calc_pixos_2_WEB_openSignal        : std_logic_vector (3 downto 
         0);
   signal XLXI_113_0_i3_openSignal               : std_logic;
   signal XLXI_113_1_i3_openSignal               : std_logic;
   signal XLXI_113_2_i3_openSignal               : std_logic;
   signal XLXI_113_3_i3_openSignal               : std_logic;
   signal XLXI_113_4_i3_openSignal               : std_logic;
   signal XLXI_113_5_i3_openSignal               : std_logic;
   signal XLXI_113_6_i3_openSignal               : std_logic;
   signal XLXI_113_7_i3_openSignal               : std_logic;
   signal XLXI_113_8_i3_openSignal               : std_logic;
   signal XLXI_113_9_i3_openSignal               : std_logic;
   signal XLXI_113_10_i3_openSignal              : std_logic;
   signal XLXI_113_11_i3_openSignal              : std_logic;
   signal XLXI_113_12_i3_openSignal              : std_logic;
   signal XLXI_113_13_i3_openSignal              : std_logic;
   signal XLXI_113_14_i3_openSignal              : std_logic;
   signal XLXI_113_15_i3_openSignal              : std_logic;
   signal XLXI_113_16_i3_openSignal              : std_logic;
   signal XLXI_113_17_i3_openSignal              : std_logic;
   signal XLXI_113_18_i3_openSignal              : std_logic;
   signal XLXI_113_19_i3_openSignal              : std_logic;
   signal XLXI_113_20_i3_openSignal              : std_logic;
   signal XLXI_113_21_i3_openSignal              : std_logic;
   signal XLXI_113_22_i3_openSignal              : std_logic;
   signal XLXI_113_23_i3_openSignal              : std_logic;
   signal XLXI_113_24_i3_openSignal              : std_logic;
   signal XLXI_113_25_i3_openSignal              : std_logic;
   signal XLXI_113_26_i3_openSignal              : std_logic;
   signal XLXI_113_27_i3_openSignal              : std_logic;
   signal XLXI_113_28_i3_openSignal              : std_logic;
   signal XLXI_113_29_i3_openSignal              : std_logic;
   signal XLXI_113_30_i3_openSignal              : std_logic;
   signal XLXI_113_31_i3_openSignal              : std_logic;
   signal XLXI_114_0_i3_openSignal               : std_logic;
   signal XLXI_114_1_i3_openSignal               : std_logic;
   signal XLXI_114_2_i3_openSignal               : std_logic;
   signal XLXI_114_3_i3_openSignal               : std_logic;
   signal XLXI_114_4_i3_openSignal               : std_logic;
   signal XLXI_114_5_i3_openSignal               : std_logic;
   signal XLXI_114_6_i3_openSignal               : std_logic;
   signal XLXI_114_7_i3_openSignal               : std_logic;
   signal XLXI_114_8_i3_openSignal               : std_logic;
   signal XLXI_114_9_i3_openSignal               : std_logic;
   signal XLXI_114_10_i3_openSignal              : std_logic;
   signal XLXI_114_11_i3_openSignal              : std_logic;
   signal XLXI_114_12_i3_openSignal              : std_logic;
   signal XLXI_114_13_i3_openSignal              : std_logic;
   signal XLXI_114_14_i3_openSignal              : std_logic;
   signal XLXI_114_15_i3_openSignal              : std_logic;
   signal XLXI_114_16_i3_openSignal              : std_logic;
   signal XLXI_114_17_i3_openSignal              : std_logic;
   signal XLXI_114_18_i3_openSignal              : std_logic;
   signal XLXI_114_19_i3_openSignal              : std_logic;
   signal XLXI_114_20_i3_openSignal              : std_logic;
   signal XLXI_114_21_i3_openSignal              : std_logic;
   signal XLXI_114_22_i3_openSignal              : std_logic;
   signal XLXI_114_23_i3_openSignal              : std_logic;
   signal XLXI_114_24_i3_openSignal              : std_logic;
   signal XLXI_114_25_i3_openSignal              : std_logic;
   signal XLXI_114_26_i3_openSignal              : std_logic;
   signal XLXI_114_27_i3_openSignal              : std_logic;
   signal XLXI_114_28_i3_openSignal              : std_logic;
   signal XLXI_114_29_i3_openSignal              : std_logic;
   signal XLXI_114_30_i3_openSignal              : std_logic;
   signal XLXI_114_31_i3_openSignal              : std_logic;
   signal XLXI_115_i3_openSignal                 : std_logic;
   signal XLXI_116_i3_openSignal                 : std_logic;
   signal XLXI_117_i3_openSignal                 : std_logic;
   component CalculatePixGain_MUSER_CalculatePixOS
      port ( i2c_mem_douta   : in    std_logic_vector (7 downto 0); 
             i_addr          : in    std_logic_vector (9 downto 0); 
             fixed2floatr    : in    std_logic_vector (31 downto 0); 
             fixed2floatrdy  : in    std_logic; 
             i_clock         : in    std_logic; 
             i_reset         : in    std_logic; 
             i_run           : in    std_logic; 
             mulfprdy        : in    std_logic; 
             mulfpr          : in    std_logic_vector (31 downto 0); 
             divfprdy        : in    std_logic; 
             divfpr          : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena     : out   std_logic; 
             i2c_mem_addra   : out   std_logic_vector (11 downto 0); 
             fixed2floata    : out   std_logic_vector (63 downto 0); 
             fixed2floatond  : out   std_logic; 
             fixed2floatsclr : out   std_logic; 
             fixed2floatce   : out   std_logic; 
             mulfpb          : out   std_logic_vector (31 downto 0); 
             mulfpa          : out   std_logic_vector (31 downto 0); 
             mulfpond        : out   std_logic; 
             mulfpsclr       : out   std_logic; 
             mulfpce         : out   std_logic; 
             divfpb          : out   std_logic_vector (31 downto 0); 
             divfpa          : out   std_logic_vector (31 downto 0); 
             divfpce         : out   std_logic; 
             divfpsclr       : out   std_logic; 
             divfpond        : out   std_logic; 
             o_rdy           : out   std_logic; 
             o_do            : out   std_logic_vector (31 downto 0));
   end component;
   
   component CalculatePixOS_process_p0
      port ( i_clock                      : in    std_logic; 
             i_reset                      : in    std_logic; 
             i_run                        : in    std_logic; 
             CalculatePixGain_rdy         : in    std_logic; 
             ExtractOffsetParameters_rdy  : in    std_logic; 
             ExtractKtaParameters_rdy     : in    std_logic; 
             ExtractKvParameters_rdy      : in    std_logic; 
             mulfprdy                     : in    std_logic; 
             addfprdy                     : in    std_logic; 
             subfprdy                     : in    std_logic; 
             i_const1                     : in    std_logic_vector (31 downto 
            0); 
             i_Ta                         : in    std_logic_vector (31 downto 
            0); 
             i_Ta0                        : in    std_logic_vector (31 downto 
            0); 
             i_Vdd                        : in    std_logic_vector (31 downto 
            0); 
             i_VddV0                      : in    std_logic_vector (31 downto 
            0); 
             CalculatePixGain_do          : in    std_logic_vector (31 downto 
            0); 
             ExtractOffsetParameters_do   : in    std_logic_vector (31 downto 
            0); 
             ExtractKtaParameters_do      : in    std_logic_vector (31 downto 
            0); 
             ExtractKvParameters_do       : in    std_logic_vector (31 downto 
            0); 
             mulfpr                       : in    std_logic_vector (31 downto 
            0); 
             addfpr                       : in    std_logic_vector (31 downto 
            0); 
             subfpr                       : in    std_logic_vector (31 downto 
            0); 
             o_dummy                      : out   std_logic; 
             CalculatePixGain_run         : out   std_logic; 
             ExtractOffsetParameters_run  : out   std_logic; 
             ExtractKtaParameters_run     : out   std_logic; 
             ExtractKvParameters_run      : out   std_logic; 
             CalculatePixGain_mux         : out   std_logic; 
             ExtractOffsetParameters_mux  : out   std_logic; 
             ExtractKtaParameters_mux     : out   std_logic; 
             ExtractKvParameters_mux      : out   std_logic; 
             o_write_enable               : out   std_logic; 
             o_rdy                        : out   std_logic; 
             mulfpond                     : out   std_logic; 
             mulfpsclr                    : out   std_logic; 
             mulfpce                      : out   std_logic; 
             addfpond                     : out   std_logic; 
             addfpsclr                    : out   std_logic; 
             addfpce                      : out   std_logic; 
             subfpond                     : out   std_logic; 
             subfpsclr                    : out   std_logic; 
             subfpce                      : out   std_logic; 
             CalculatePixGain_addr        : out   std_logic_vector (9 downto 
            0); 
             ExtractOffsetParameters_addr : out   std_logic_vector (9 downto 
            0); 
             ExtractKtaParameters_addr    : out   std_logic_vector (9 downto 
            0); 
             ExtractKvParameters_addr     : out   std_logic_vector (9 downto 
            0); 
             o_dia                        : out   std_logic_vector (31 downto 
            0); 
             o_addra                      : out   std_logic_vector (9 downto 
            0); 
             mulfpa                       : out   std_logic_vector (31 downto 
            0); 
             mulfpb                       : out   std_logic_vector (31 downto 
            0); 
             addfpa                       : out   std_logic_vector (31 downto 
            0); 
             addfpb                       : out   std_logic_vector (31 downto 
            0); 
             subfpa                       : out   std_logic_vector (31 downto 
            0); 
             subfpb                       : out   std_logic_vector (31 downto 
            0));
   end component;
   
   component ExtractKtaParameters_MUSER_CalculatePixOS
      port ( i_addr        : in    std_logic_vector (9 downto 0); 
             i_clock       : in    std_logic; 
             i_reset       : in    std_logic; 
             divfpr        : in    std_logic_vector (31 downto 0); 
             addfpr        : in    std_logic_vector (31 downto 0); 
             mulfpr        : in    std_logic_vector (31 downto 0); 
             i2c_mem_douta : in    std_logic_vector (7 downto 0); 
             divfprdy      : in    std_logic; 
             addfprdy      : in    std_logic; 
             mulfprdy      : in    std_logic; 
             i_run         : in    std_logic; 
             o_rdy         : out   std_logic; 
             i2c_mem_ena   : out   std_logic; 
             mulfpond      : out   std_logic; 
             mulfpsclr     : out   std_logic; 
             mulfpce       : out   std_logic; 
             addfpond      : out   std_logic; 
             addfpsclr     : out   std_logic; 
             addfpce       : out   std_logic; 
             divfpond      : out   std_logic; 
             divfpsclr     : out   std_logic; 
             divfpce       : out   std_logic; 
             i2c_mem_addra : out   std_logic_vector (11 downto 0); 
             mulfpa        : out   std_logic_vector (31 downto 0); 
             mulfpb        : out   std_logic_vector (31 downto 0); 
             addfpa        : out   std_logic_vector (31 downto 0); 
             addfpb        : out   std_logic_vector (31 downto 0); 
             divfpa        : out   std_logic_vector (31 downto 0); 
             divfpb        : out   std_logic_vector (31 downto 0); 
             o_do          : out   std_logic_vector (31 downto 0));
   end component;
   
   component ExtractKvParameters_MUSER_CalculatePixOS
      port ( i_addr        : in    std_logic_vector (9 downto 0); 
             i_reset       : in    std_logic; 
             i_clock       : in    std_logic; 
             i_run         : in    std_logic; 
             divfprdy      : in    std_logic; 
             i2c_mem_douta : in    std_logic_vector (7 downto 0); 
             divfpr        : in    std_logic_vector (31 downto 0); 
             o_do          : out   std_logic_vector (31 downto 0); 
             o_rdy         : out   std_logic; 
             i2c_mem_ena   : out   std_logic; 
             divfpond      : out   std_logic; 
             divfpsclr     : out   std_logic; 
             divfpce       : out   std_logic; 
             i2c_mem_addra : out   std_logic_vector (11 downto 0); 
             divfpa        : out   std_logic_vector (31 downto 0); 
             divfpb        : out   std_logic_vector (31 downto 0));
   end component;
   
   component ExtractOffsetParameters_MUSER_CalculatePixOS
      port ( i_clock         : in    std_logic; 
             i_reset         : in    std_logic; 
             i_addr          : in    std_logic_vector (9 downto 0); 
             i_run           : in    std_logic; 
             fixed2floatrdy  : in    std_logic; 
             mulfprdy        : in    std_logic; 
             addfprdy        : in    std_logic; 
             i2c_mem_douta   : in    std_logic_vector (7 downto 0); 
             fixed2floatr    : in    std_logic_vector (31 downto 0); 
             mulfpr          : in    std_logic_vector (31 downto 0); 
             addfpr          : in    std_logic_vector (31 downto 0); 
             o_do            : out   std_logic_vector (31 downto 0); 
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
   
   component M2_1_MXILINX_CalculatePixOS
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
   
   component mux4x1
      port ( i_clock : in    std_logic; 
             o       : out   std_logic; 
             i0      : in    std_logic; 
             i1      : in    std_logic; 
             i2      : in    std_logic; 
             i3      : in    std_logic; 
             s0      : in    std_logic; 
             s1      : in    std_logic; 
             s2      : in    std_logic; 
             s3      : in    std_logic);
   end component;
   
   component mux2x1
      port ( s1 : in    std_logic; 
             s0 : in    std_logic; 
             i1 : in    std_logic; 
             i0 : in    std_logic; 
             o  : out   std_logic);
   end component;
   
   component mux3x1
      port ( i3 : in    std_logic; 
             i2 : in    std_logic; 
             i1 : in    std_logic; 
             i0 : in    std_logic; 
             s2 : in    std_logic; 
             s1 : in    std_logic; 
             s0 : in    std_logic; 
             o  : out   std_logic);
   end component;
   
   component mux3x1a
      port ( s1 : in    std_logic; 
             s0 : in    std_logic; 
             i2 : in    std_logic; 
             i1 : in    std_logic; 
             i0 : in    std_logic; 
             o  : out   std_logic);
   end component;
   
   attribute WRITE_WIDTH_B of mem_calc_pixos_1 : label is "36";
   attribute WRITE_WIDTH_A of mem_calc_pixos_1 : label is "36";
   attribute WRITE_MODE_B of mem_calc_pixos_1 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_calc_pixos_1 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_calc_pixos_1 : label is "36";
   attribute READ_WIDTH_A of mem_calc_pixos_1 : label is "36";
   attribute WRITE_WIDTH_B of mem_calc_pixos_2 : label is "36";
   attribute WRITE_WIDTH_A of mem_calc_pixos_2 : label is "36";
   attribute WRITE_MODE_B of mem_calc_pixos_2 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_calc_pixos_2 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_calc_pixos_2 : label is "36";
   attribute READ_WIDTH_A of mem_calc_pixos_2 : label is "36";
   attribute HU_SET of MUX_ADDR_0 : label is "MUX_ADDR_0_1690";
   attribute HU_SET of MUX_ADDR_1 : label is "MUX_ADDR_1_1689";
   attribute HU_SET of MUX_ADDR_2 : label is "MUX_ADDR_2_1688";
   attribute HU_SET of MUX_ADDR_3 : label is "MUX_ADDR_3_1687";
   attribute HU_SET of MUX_ADDR_4 : label is "MUX_ADDR_4_1686";
   attribute HU_SET of MUX_ADDR_5 : label is "MUX_ADDR_5_1685";
   attribute HU_SET of MUX_ADDR_6 : label is "MUX_ADDR_6_1684";
   attribute HU_SET of MUX_ADDR_7 : label is "MUX_ADDR_7_1683";
   attribute HU_SET of MUX_ADDR_8 : label is "MUX_ADDR_8_1682";
   attribute HU_SET of MUX_ADDR_9 : label is "MUX_ADDR_9_1681";
   attribute HU_SET of MUX_DO_0 : label is "MUX_DO_0_1680";
   attribute HU_SET of MUX_DO_1 : label is "MUX_DO_1_1679";
   attribute HU_SET of MUX_DO_2 : label is "MUX_DO_2_1678";
   attribute HU_SET of MUX_DO_3 : label is "MUX_DO_3_1677";
   attribute HU_SET of MUX_DO_4 : label is "MUX_DO_4_1676";
   attribute HU_SET of MUX_DO_5 : label is "MUX_DO_5_1675";
   attribute HU_SET of MUX_DO_6 : label is "MUX_DO_6_1674";
   attribute HU_SET of MUX_DO_7 : label is "MUX_DO_7_1673";
   attribute HU_SET of MUX_DO_8 : label is "MUX_DO_8_1672";
   attribute HU_SET of MUX_DO_9 : label is "MUX_DO_9_1671";
   attribute HU_SET of MUX_DO_10 : label is "MUX_DO_10_1670";
   attribute HU_SET of MUX_DO_11 : label is "MUX_DO_11_1669";
   attribute HU_SET of MUX_DO_12 : label is "MUX_DO_12_1668";
   attribute HU_SET of MUX_DO_13 : label is "MUX_DO_13_1667";
   attribute HU_SET of MUX_DO_14 : label is "MUX_DO_14_1666";
   attribute HU_SET of MUX_DO_15 : label is "MUX_DO_15_1665";
   attribute HU_SET of MUX_DO_16 : label is "MUX_DO_16_1664";
   attribute HU_SET of MUX_DO_17 : label is "MUX_DO_17_1663";
   attribute HU_SET of MUX_DO_18 : label is "MUX_DO_18_1662";
   attribute HU_SET of MUX_DO_19 : label is "MUX_DO_19_1661";
   attribute HU_SET of MUX_DO_20 : label is "MUX_DO_20_1660";
   attribute HU_SET of MUX_DO_21 : label is "MUX_DO_21_1659";
   attribute HU_SET of MUX_DO_22 : label is "MUX_DO_22_1658";
   attribute HU_SET of MUX_DO_23 : label is "MUX_DO_23_1657";
   attribute HU_SET of MUX_DO_24 : label is "MUX_DO_24_1656";
   attribute HU_SET of MUX_DO_25 : label is "MUX_DO_25_1655";
   attribute HU_SET of MUX_DO_26 : label is "MUX_DO_26_1654";
   attribute HU_SET of MUX_DO_27 : label is "MUX_DO_27_1653";
   attribute HU_SET of MUX_DO_28 : label is "MUX_DO_28_1652";
   attribute HU_SET of MUX_DO_29 : label is "MUX_DO_29_1651";
   attribute HU_SET of MUX_DO_30 : label is "MUX_DO_30_1650";
   attribute HU_SET of MUX_DO_31 : label is "MUX_DO_31_1649";
   attribute HU_SET of XLXI_140_0 : label is "XLXI_140_0_1698";
   attribute HU_SET of XLXI_140_1 : label is "XLXI_140_1_1697";
   attribute HU_SET of XLXI_140_2 : label is "XLXI_140_2_1696";
   attribute HU_SET of XLXI_140_3 : label is "XLXI_140_3_1695";
   attribute HU_SET of XLXI_140_4 : label is "XLXI_140_4_1694";
   attribute HU_SET of XLXI_140_5 : label is "XLXI_140_5_1693";
   attribute HU_SET of XLXI_140_6 : label is "XLXI_140_6_1692";
   attribute HU_SET of XLXI_140_7 : label is "XLXI_140_7_1691";
   attribute HU_SET of XLXI_141_0 : label is "XLXI_141_0_1706";
   attribute HU_SET of XLXI_141_1 : label is "XLXI_141_1_1705";
   attribute HU_SET of XLXI_141_2 : label is "XLXI_141_2_1704";
   attribute HU_SET of XLXI_141_3 : label is "XLXI_141_3_1703";
   attribute HU_SET of XLXI_141_4 : label is "XLXI_141_4_1702";
   attribute HU_SET of XLXI_141_5 : label is "XLXI_141_5_1701";
   attribute HU_SET of XLXI_141_6 : label is "XLXI_141_6_1700";
   attribute HU_SET of XLXI_141_7 : label is "XLXI_141_7_1699";
   attribute HU_SET of XLXI_142_0 : label is "XLXI_142_0_1714";
   attribute HU_SET of XLXI_142_1 : label is "XLXI_142_1_1713";
   attribute HU_SET of XLXI_142_2 : label is "XLXI_142_2_1712";
   attribute HU_SET of XLXI_142_3 : label is "XLXI_142_3_1711";
   attribute HU_SET of XLXI_142_4 : label is "XLXI_142_4_1710";
   attribute HU_SET of XLXI_142_5 : label is "XLXI_142_5_1709";
   attribute HU_SET of XLXI_142_6 : label is "XLXI_142_6_1708";
   attribute HU_SET of XLXI_142_7 : label is "XLXI_142_7_1707";
   attribute HU_SET of XLXI_143_0 : label is "XLXI_143_0_1722";
   attribute HU_SET of XLXI_143_1 : label is "XLXI_143_1_1721";
   attribute HU_SET of XLXI_143_2 : label is "XLXI_143_2_1720";
   attribute HU_SET of XLXI_143_3 : label is "XLXI_143_3_1719";
   attribute HU_SET of XLXI_143_4 : label is "XLXI_143_4_1718";
   attribute HU_SET of XLXI_143_5 : label is "XLXI_143_5_1717";
   attribute HU_SET of XLXI_143_6 : label is "XLXI_143_6_1716";
   attribute HU_SET of XLXI_143_7 : label is "XLXI_143_7_1715";
begin
   XLXN_589(7 downto 0) <= x"00";
   o_rdy <= o_rdy_DUMMY;
   inst_CalcPixGain : CalculatePixGain_MUSER_CalculatePixOS
      port map (divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                fixed2floatr(31 downto 0)=>fixed2floatr(31 downto 0),
                fixed2floatrdy=>fixed2floatrdy,
                i_addr(9 downto 0)=>XLXN_412(9 downto 0),
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>XLXN_401,
                i2c_mem_douta(7 downto 0)=>XLXN_573(7 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                divfpa(31 downto 0)=>XLXN_518(31 downto 0),
                divfpb(31 downto 0)=>XLXN_526(31 downto 0),
                divfpce=>XLXN_540,
                divfpond=>XLXN_534,
                divfpsclr=>XLXN_537,
                fixed2floata(63 downto 0)=>XLXN_459(63 downto 0),
                fixed2floatce=>XLXN_469,
                fixed2floatond=>XLXN_464,
                fixed2floatsclr=>XLXN_473,
                i2c_mem_addra(11 downto 0)=>cpgi2caddr(11 downto 0),
                i2c_mem_ena=>XLXN_385,
                mulfpa(31 downto 0)=>XLXN_477(31 downto 0),
                mulfpb(31 downto 0)=>XLXN_487(31 downto 0),
                mulfpce=>XLXN_511,
                mulfpond=>XLXN_495,
                mulfpsclr=>XLXN_503,
                o_do(31 downto 0)=>XLXN_416(31 downto 0),
                o_rdy=>XLXN_407);
   
   inst_CalcPixOS_proc0 : CalculatePixOS_process_p0
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                CalculatePixGain_do(31 downto 0)=>XLXN_416(31 downto 0),
                CalculatePixGain_rdy=>XLXN_407,
                ExtractKtaParameters_do(31 downto 0)=>XLXN_418(31 downto 0),
                ExtractKtaParameters_rdy=>XLXN_409,
                ExtractKvParameters_do(31 downto 0)=>XLXN_419(31 downto 0),
                ExtractKvParameters_rdy=>XLXN_410,
                ExtractOffsetParameters_do(31 downto 0)=>XLXN_417(31 downto 0),
                ExtractOffsetParameters_rdy=>XLXN_408,
                i_clock=>i_clock,
                i_const1(31 downto 0)=>i_const1(31 downto 0),
                i_reset=>i_reset,
                i_run=>i_run,
                i_Ta(31 downto 0)=>i_Ta(31 downto 0),
                i_Ta0(31 downto 0)=>i_Ta0(31 downto 0),
                i_Vdd(31 downto 0)=>i_Vdd(31 downto 0),
                i_VddV0(31 downto 0)=>i_VddV0(31 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                subfpr(31 downto 0)=>subfpr(31 downto 0),
                subfprdy=>subfprdy,
                addfpa(31 downto 0)=>XLXN_560(31 downto 0),
                addfpb(31 downto 0)=>XLXN_563(31 downto 0),
                addfpce=>XLXN_572,
                addfpond=>XLXN_566,
                addfpsclr=>XLXN_569,
                CalculatePixGain_addr(9 downto 0)=>XLXN_412(9 downto 0),
                CalculatePixGain_mux=>calculatepixgainmux,
                CalculatePixGain_run=>XLXN_401,
                ExtractKtaParameters_addr(9 downto 0)=>XLXN_414(9 downto 0),
                ExtractKtaParameters_mux=>extractktaparametersmux,
                ExtractKtaParameters_run=>XLXN_403,
                ExtractKvParameters_addr(9 downto 0)=>XLXN_415(9 downto 0),
                ExtractKvParameters_mux=>extractkvparametersmux,
                ExtractKvParameters_run=>XLXN_404,
                ExtractOffsetParameters_addr(9 downto 0)=>XLXN_413(9 downto 0),
                ExtractOffsetParameters_mux=>extractoffsetparametersmux,
                ExtractOffsetParameters_run=>XLXN_402,
                mulfpa(31 downto 0)=>XLXN_480(31 downto 0),
                mulfpb(31 downto 0)=>XLXN_490(31 downto 0),
                mulfpce=>XLXN_514,
                mulfpond=>XLXN_498,
                mulfpsclr=>XLXN_506,
                o_addra(9 downto 0)=>XLXN_210(9 downto 0),
                o_dia(31 downto 0)=>XLXN_211(31 downto 0),
                o_dummy=>open,
                o_rdy=>o_rdy_DUMMY,
                o_write_enable=>XLXN_216,
                subfpa(31 downto 0)=>subfpa(31 downto 0),
                subfpb(31 downto 0)=>subfpb(31 downto 0),
                subfpce=>subfpce,
                subfpond=>subfpond,
                subfpsclr=>subfpsclr);
   
   inst_ExtrKtaParam : ExtractKtaParameters_MUSER_CalculatePixOS
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                i_addr(9 downto 0)=>XLXN_414(9 downto 0),
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>XLXN_403,
                i2c_mem_douta(7 downto 0)=>XLXN_575(7 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                addfpa(31 downto 0)=>XLXN_559(31 downto 0),
                addfpb(31 downto 0)=>XLXN_562(31 downto 0),
                addfpce=>XLXN_571,
                addfpond=>XLXN_565,
                addfpsclr=>XLXN_568,
                divfpa(31 downto 0)=>XLXN_519(31 downto 0),
                divfpb(31 downto 0)=>XLXN_529(31 downto 0),
                divfpce=>XLXN_542,
                divfpond=>XLXN_535,
                divfpsclr=>XLXN_538,
                i2c_mem_addra(11 downto 0)=>ktai2caddr(11 downto 0),
                i2c_mem_ena=>XLXN_387,
                mulfpa(31 downto 0)=>XLXN_479(31 downto 0),
                mulfpb(31 downto 0)=>XLXN_489(31 downto 0),
                mulfpce=>XLXN_513,
                mulfpond=>XLXN_497,
                mulfpsclr=>XLXN_505,
                o_do(31 downto 0)=>XLXN_418(31 downto 0),
                o_rdy=>XLXN_409);
   
   inst_ExtrKvParam : ExtractKvParameters_MUSER_CalculatePixOS
      port map (divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                i_addr(9 downto 0)=>XLXN_415(9 downto 0),
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>XLXN_404,
                i2c_mem_douta(7 downto 0)=>XLXN_576(7 downto 0),
                divfpa(31 downto 0)=>XLXN_520(31 downto 0),
                divfpb(31 downto 0)=>XLXN_530(31 downto 0),
                divfpce=>XLXN_543,
                divfpond=>XLXN_536,
                divfpsclr=>XLXN_539,
                i2c_mem_addra(11 downto 0)=>kvi2caddr(11 downto 0),
                i2c_mem_ena=>XLXN_388,
                o_do(31 downto 0)=>XLXN_419(31 downto 0),
                o_rdy=>XLXN_410);
   
   inst_ExtrOffParam : ExtractOffsetParameters_MUSER_CalculatePixOS
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                fixed2floatr(31 downto 0)=>fixed2floatr(31 downto 0),
                fixed2floatrdy=>fixed2floatrdy,
                i_addr(9 downto 0)=>XLXN_413(9 downto 0),
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>XLXN_402,
                i2c_mem_douta(7 downto 0)=>XLXN_574(7 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                addfpa(31 downto 0)=>XLXN_558(31 downto 0),
                addfpb(31 downto 0)=>XLXN_561(31 downto 0),
                addfpce=>XLXN_570,
                addfpond=>XLXN_564,
                addfpsclr=>XLXN_567,
                fixed2floata(63 downto 0)=>XLXN_461(63 downto 0),
                fixed2floatce=>XLXN_470,
                fixed2floatond=>XLXN_465,
                fixed2floatsclr=>XLXN_474,
                i2c_mem_addra(11 downto 0)=>eopi2caddr(11 downto 0),
                i2c_mem_ena=>XLXN_386,
                mulfpa(31 downto 0)=>XLXN_478(31 downto 0),
                mulfpb(31 downto 0)=>XLXN_488(31 downto 0),
                mulfpce=>XLXN_512,
                mulfpond=>XLXN_496,
                mulfpsclr=>XLXN_504,
                o_do(31 downto 0)=>XLXN_417(31 downto 0),
                o_rdy=>XLXN_408);
   
   mem_calc_pixos_1 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_44(14 downto 0),
                ADDRB(14 downto 0)=>mem_calc_pixos_1_ADDRB_openSignal(14 downto 
            0),
                CASCADEINA=>mem_calc_pixos_1_CASCADEINA_openSignal,
                CASCADEINB=>mem_calc_pixos_1_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_calc_pixos_1_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_211(31 downto 0),
                DIB(31 downto 0)=>mem_calc_pixos_1_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_calc_pixos_1_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_calc_pixos_1_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_59,
                ENB=>mem_calc_pixos_1_ENB_openSignal,
                REGCEA=>mem_calc_pixos_1_REGCEA_openSignal,
                REGCEB=>mem_calc_pixos_1_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_calc_pixos_1_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_calc_pixos_1_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_79(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   mem_calc_pixos_2 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_45(14 downto 0),
                ADDRB(14 downto 0)=>mem_calc_pixos_2_ADDRB_openSignal(14 downto 
            0),
                CASCADEINA=>mem_calc_pixos_2_CASCADEINA_openSignal,
                CASCADEINB=>mem_calc_pixos_2_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_calc_pixos_2_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_211(31 downto 0),
                DIB(31 downto 0)=>mem_calc_pixos_2_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>mem_calc_pixos_2_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>mem_calc_pixos_2_DIPB_openSignal(3 downto 0),
                ENA=>mux_addr1(9),
                ENB=>mem_calc_pixos_2_ENB_openSignal,
                REGCEA=>mem_calc_pixos_2_REGCEA_openSignal,
                REGCEB=>mem_calc_pixos_2_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_calc_pixos_2_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_calc_pixos_2_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_78(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   MUX_ADDR_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(0),
                D1=>i_addr(0),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(0));
   
   MUX_ADDR_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(1),
                D1=>i_addr(1),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(1));
   
   MUX_ADDR_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(2),
                D1=>i_addr(2),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(2));
   
   MUX_ADDR_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(3),
                D1=>i_addr(3),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(3));
   
   MUX_ADDR_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(4),
                D1=>i_addr(4),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(4));
   
   MUX_ADDR_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(5),
                D1=>i_addr(5),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(5));
   
   MUX_ADDR_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(6),
                D1=>i_addr(6),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(6));
   
   MUX_ADDR_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(7),
                D1=>i_addr(7),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(7));
   
   MUX_ADDR_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(8),
                D1=>i_addr(8),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(8));
   
   MUX_ADDR_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_210(9),
                D1=>i_addr(9),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(9));
   
   MUX_DO_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(0),
                D1=>XLXN_78(0),
                S0=>mux_addr1(9),
                O=>o_do(0));
   
   MUX_DO_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(1),
                D1=>XLXN_78(1),
                S0=>mux_addr1(9),
                O=>o_do(1));
   
   MUX_DO_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(2),
                D1=>XLXN_78(2),
                S0=>mux_addr1(9),
                O=>o_do(2));
   
   MUX_DO_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(3),
                D1=>XLXN_78(3),
                S0=>mux_addr1(9),
                O=>o_do(3));
   
   MUX_DO_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(4),
                D1=>XLXN_78(4),
                S0=>mux_addr1(9),
                O=>o_do(4));
   
   MUX_DO_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(5),
                D1=>XLXN_78(5),
                S0=>mux_addr1(9),
                O=>o_do(5));
   
   MUX_DO_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(6),
                D1=>XLXN_78(6),
                S0=>mux_addr1(9),
                O=>o_do(6));
   
   MUX_DO_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(7),
                D1=>XLXN_78(7),
                S0=>mux_addr1(9),
                O=>o_do(7));
   
   MUX_DO_8 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(8),
                D1=>XLXN_78(8),
                S0=>mux_addr1(9),
                O=>o_do(8));
   
   MUX_DO_9 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(9),
                D1=>XLXN_78(9),
                S0=>mux_addr1(9),
                O=>o_do(9));
   
   MUX_DO_10 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(10),
                D1=>XLXN_78(10),
                S0=>mux_addr1(9),
                O=>o_do(10));
   
   MUX_DO_11 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(11),
                D1=>XLXN_78(11),
                S0=>mux_addr1(9),
                O=>o_do(11));
   
   MUX_DO_12 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(12),
                D1=>XLXN_78(12),
                S0=>mux_addr1(9),
                O=>o_do(12));
   
   MUX_DO_13 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(13),
                D1=>XLXN_78(13),
                S0=>mux_addr1(9),
                O=>o_do(13));
   
   MUX_DO_14 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(14),
                D1=>XLXN_78(14),
                S0=>mux_addr1(9),
                O=>o_do(14));
   
   MUX_DO_15 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(15),
                D1=>XLXN_78(15),
                S0=>mux_addr1(9),
                O=>o_do(15));
   
   MUX_DO_16 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(16),
                D1=>XLXN_78(16),
                S0=>mux_addr1(9),
                O=>o_do(16));
   
   MUX_DO_17 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(17),
                D1=>XLXN_78(17),
                S0=>mux_addr1(9),
                O=>o_do(17));
   
   MUX_DO_18 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(18),
                D1=>XLXN_78(18),
                S0=>mux_addr1(9),
                O=>o_do(18));
   
   MUX_DO_19 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(19),
                D1=>XLXN_78(19),
                S0=>mux_addr1(9),
                O=>o_do(19));
   
   MUX_DO_20 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(20),
                D1=>XLXN_78(20),
                S0=>mux_addr1(9),
                O=>o_do(20));
   
   MUX_DO_21 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(21),
                D1=>XLXN_78(21),
                S0=>mux_addr1(9),
                O=>o_do(21));
   
   MUX_DO_22 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(22),
                D1=>XLXN_78(22),
                S0=>mux_addr1(9),
                O=>o_do(22));
   
   MUX_DO_23 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(23),
                D1=>XLXN_78(23),
                S0=>mux_addr1(9),
                O=>o_do(23));
   
   MUX_DO_24 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(24),
                D1=>XLXN_78(24),
                S0=>mux_addr1(9),
                O=>o_do(24));
   
   MUX_DO_25 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(25),
                D1=>XLXN_78(25),
                S0=>mux_addr1(9),
                O=>o_do(25));
   
   MUX_DO_26 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(26),
                D1=>XLXN_78(26),
                S0=>mux_addr1(9),
                O=>o_do(26));
   
   MUX_DO_27 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(27),
                D1=>XLXN_78(27),
                S0=>mux_addr1(9),
                O=>o_do(27));
   
   MUX_DO_28 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(28),
                D1=>XLXN_78(28),
                S0=>mux_addr1(9),
                O=>o_do(28));
   
   MUX_DO_29 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(29),
                D1=>XLXN_78(29),
                S0=>mux_addr1(9),
                O=>o_do(29));
   
   MUX_DO_30 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_79(30),
                D1=>XLXN_78(30),
                S0=>mux_addr1(9),
                O=>o_do(30));
   
   MUX_DO_31 : M2_1_MXILINX_CalculatePixOS
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
      port map (I=>XLXN_216,
                O=>XLXN_139(0));
   
   XLXI_29_1 : BUF
      port map (I=>XLXN_216,
                O=>XLXN_139(1));
   
   XLXI_29_2 : BUF
      port map (I=>XLXN_216,
                O=>XLXN_139(2));
   
   XLXI_29_3 : BUF
      port map (I=>XLXN_216,
                O=>XLXN_139(3));
   
   XLXI_82_0 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(0),
                i1=>eopi2caddr(0),
                i2=>ktai2caddr(0),
                i3=>kvi2caddr(0),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(0));
   
   XLXI_82_1 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(1),
                i1=>eopi2caddr(1),
                i2=>ktai2caddr(1),
                i3=>kvi2caddr(1),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(1));
   
   XLXI_82_2 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(2),
                i1=>eopi2caddr(2),
                i2=>ktai2caddr(2),
                i3=>kvi2caddr(2),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(2));
   
   XLXI_82_3 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(3),
                i1=>eopi2caddr(3),
                i2=>ktai2caddr(3),
                i3=>kvi2caddr(3),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(3));
   
   XLXI_82_4 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(4),
                i1=>eopi2caddr(4),
                i2=>ktai2caddr(4),
                i3=>kvi2caddr(4),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(4));
   
   XLXI_82_5 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(5),
                i1=>eopi2caddr(5),
                i2=>ktai2caddr(5),
                i3=>kvi2caddr(5),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(5));
   
   XLXI_82_6 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(6),
                i1=>eopi2caddr(6),
                i2=>ktai2caddr(6),
                i3=>kvi2caddr(6),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(6));
   
   XLXI_82_7 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(7),
                i1=>eopi2caddr(7),
                i2=>ktai2caddr(7),
                i3=>kvi2caddr(7),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(7));
   
   XLXI_82_8 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(8),
                i1=>eopi2caddr(8),
                i2=>ktai2caddr(8),
                i3=>kvi2caddr(8),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(8));
   
   XLXI_82_9 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(9),
                i1=>eopi2caddr(9),
                i2=>ktai2caddr(9),
                i3=>kvi2caddr(9),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(9));
   
   XLXI_82_10 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(10),
                i1=>eopi2caddr(10),
                i2=>ktai2caddr(10),
                i3=>kvi2caddr(10),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(10));
   
   XLXI_82_11 : mux4x1
      port map (i_clock=>i_clock,
                i0=>cpgi2caddr(11),
                i1=>eopi2caddr(11),
                i2=>ktai2caddr(11),
                i3=>kvi2caddr(11),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_addra(11));
   
   XLXI_83 : mux4x1
      port map (i_clock=>i_clock,
                i0=>XLXN_385,
                i1=>XLXN_386,
                i2=>XLXN_387,
                i3=>XLXN_388,
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                s3=>extractkvparametersmux,
                o=>i2c_mem_ena);
   
   XLXI_98_0 : mux2x1
      port map (i0=>XLXN_459(0),
                i1=>XLXN_461(0),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(0));
   
   XLXI_98_1 : mux2x1
      port map (i0=>XLXN_459(1),
                i1=>XLXN_461(1),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(1));
   
   XLXI_98_2 : mux2x1
      port map (i0=>XLXN_459(2),
                i1=>XLXN_461(2),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(2));
   
   XLXI_98_3 : mux2x1
      port map (i0=>XLXN_459(3),
                i1=>XLXN_461(3),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(3));
   
   XLXI_98_4 : mux2x1
      port map (i0=>XLXN_459(4),
                i1=>XLXN_461(4),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(4));
   
   XLXI_98_5 : mux2x1
      port map (i0=>XLXN_459(5),
                i1=>XLXN_461(5),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(5));
   
   XLXI_98_6 : mux2x1
      port map (i0=>XLXN_459(6),
                i1=>XLXN_461(6),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(6));
   
   XLXI_98_7 : mux2x1
      port map (i0=>XLXN_459(7),
                i1=>XLXN_461(7),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(7));
   
   XLXI_98_8 : mux2x1
      port map (i0=>XLXN_459(8),
                i1=>XLXN_461(8),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(8));
   
   XLXI_98_9 : mux2x1
      port map (i0=>XLXN_459(9),
                i1=>XLXN_461(9),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(9));
   
   XLXI_98_10 : mux2x1
      port map (i0=>XLXN_459(10),
                i1=>XLXN_461(10),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(10));
   
   XLXI_98_11 : mux2x1
      port map (i0=>XLXN_459(11),
                i1=>XLXN_461(11),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(11));
   
   XLXI_98_12 : mux2x1
      port map (i0=>XLXN_459(12),
                i1=>XLXN_461(12),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(12));
   
   XLXI_98_13 : mux2x1
      port map (i0=>XLXN_459(13),
                i1=>XLXN_461(13),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(13));
   
   XLXI_98_14 : mux2x1
      port map (i0=>XLXN_459(14),
                i1=>XLXN_461(14),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(14));
   
   XLXI_98_15 : mux2x1
      port map (i0=>XLXN_459(15),
                i1=>XLXN_461(15),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(15));
   
   XLXI_98_16 : mux2x1
      port map (i0=>XLXN_459(16),
                i1=>XLXN_461(16),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(16));
   
   XLXI_98_17 : mux2x1
      port map (i0=>XLXN_459(17),
                i1=>XLXN_461(17),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(17));
   
   XLXI_98_18 : mux2x1
      port map (i0=>XLXN_459(18),
                i1=>XLXN_461(18),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(18));
   
   XLXI_98_19 : mux2x1
      port map (i0=>XLXN_459(19),
                i1=>XLXN_461(19),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(19));
   
   XLXI_98_20 : mux2x1
      port map (i0=>XLXN_459(20),
                i1=>XLXN_461(20),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(20));
   
   XLXI_98_21 : mux2x1
      port map (i0=>XLXN_459(21),
                i1=>XLXN_461(21),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(21));
   
   XLXI_98_22 : mux2x1
      port map (i0=>XLXN_459(22),
                i1=>XLXN_461(22),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(22));
   
   XLXI_98_23 : mux2x1
      port map (i0=>XLXN_459(23),
                i1=>XLXN_461(23),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(23));
   
   XLXI_98_24 : mux2x1
      port map (i0=>XLXN_459(24),
                i1=>XLXN_461(24),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(24));
   
   XLXI_98_25 : mux2x1
      port map (i0=>XLXN_459(25),
                i1=>XLXN_461(25),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(25));
   
   XLXI_98_26 : mux2x1
      port map (i0=>XLXN_459(26),
                i1=>XLXN_461(26),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(26));
   
   XLXI_98_27 : mux2x1
      port map (i0=>XLXN_459(27),
                i1=>XLXN_461(27),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(27));
   
   XLXI_98_28 : mux2x1
      port map (i0=>XLXN_459(28),
                i1=>XLXN_461(28),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(28));
   
   XLXI_98_29 : mux2x1
      port map (i0=>XLXN_459(29),
                i1=>XLXN_461(29),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(29));
   
   XLXI_98_30 : mux2x1
      port map (i0=>XLXN_459(30),
                i1=>XLXN_461(30),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(30));
   
   XLXI_98_31 : mux2x1
      port map (i0=>XLXN_459(31),
                i1=>XLXN_461(31),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(31));
   
   XLXI_98_32 : mux2x1
      port map (i0=>XLXN_459(32),
                i1=>XLXN_461(32),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(32));
   
   XLXI_98_33 : mux2x1
      port map (i0=>XLXN_459(33),
                i1=>XLXN_461(33),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(33));
   
   XLXI_98_34 : mux2x1
      port map (i0=>XLXN_459(34),
                i1=>XLXN_461(34),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(34));
   
   XLXI_98_35 : mux2x1
      port map (i0=>XLXN_459(35),
                i1=>XLXN_461(35),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(35));
   
   XLXI_98_36 : mux2x1
      port map (i0=>XLXN_459(36),
                i1=>XLXN_461(36),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(36));
   
   XLXI_98_37 : mux2x1
      port map (i0=>XLXN_459(37),
                i1=>XLXN_461(37),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(37));
   
   XLXI_98_38 : mux2x1
      port map (i0=>XLXN_459(38),
                i1=>XLXN_461(38),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(38));
   
   XLXI_98_39 : mux2x1
      port map (i0=>XLXN_459(39),
                i1=>XLXN_461(39),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(39));
   
   XLXI_98_40 : mux2x1
      port map (i0=>XLXN_459(40),
                i1=>XLXN_461(40),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(40));
   
   XLXI_98_41 : mux2x1
      port map (i0=>XLXN_459(41),
                i1=>XLXN_461(41),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(41));
   
   XLXI_98_42 : mux2x1
      port map (i0=>XLXN_459(42),
                i1=>XLXN_461(42),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(42));
   
   XLXI_98_43 : mux2x1
      port map (i0=>XLXN_459(43),
                i1=>XLXN_461(43),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(43));
   
   XLXI_98_44 : mux2x1
      port map (i0=>XLXN_459(44),
                i1=>XLXN_461(44),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(44));
   
   XLXI_98_45 : mux2x1
      port map (i0=>XLXN_459(45),
                i1=>XLXN_461(45),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(45));
   
   XLXI_98_46 : mux2x1
      port map (i0=>XLXN_459(46),
                i1=>XLXN_461(46),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(46));
   
   XLXI_98_47 : mux2x1
      port map (i0=>XLXN_459(47),
                i1=>XLXN_461(47),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(47));
   
   XLXI_98_48 : mux2x1
      port map (i0=>XLXN_459(48),
                i1=>XLXN_461(48),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(48));
   
   XLXI_98_49 : mux2x1
      port map (i0=>XLXN_459(49),
                i1=>XLXN_461(49),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(49));
   
   XLXI_98_50 : mux2x1
      port map (i0=>XLXN_459(50),
                i1=>XLXN_461(50),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(50));
   
   XLXI_98_51 : mux2x1
      port map (i0=>XLXN_459(51),
                i1=>XLXN_461(51),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(51));
   
   XLXI_98_52 : mux2x1
      port map (i0=>XLXN_459(52),
                i1=>XLXN_461(52),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(52));
   
   XLXI_98_53 : mux2x1
      port map (i0=>XLXN_459(53),
                i1=>XLXN_461(53),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(53));
   
   XLXI_98_54 : mux2x1
      port map (i0=>XLXN_459(54),
                i1=>XLXN_461(54),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(54));
   
   XLXI_98_55 : mux2x1
      port map (i0=>XLXN_459(55),
                i1=>XLXN_461(55),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(55));
   
   XLXI_98_56 : mux2x1
      port map (i0=>XLXN_459(56),
                i1=>XLXN_461(56),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(56));
   
   XLXI_98_57 : mux2x1
      port map (i0=>XLXN_459(57),
                i1=>XLXN_461(57),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(57));
   
   XLXI_98_58 : mux2x1
      port map (i0=>XLXN_459(58),
                i1=>XLXN_461(58),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(58));
   
   XLXI_98_59 : mux2x1
      port map (i0=>XLXN_459(59),
                i1=>XLXN_461(59),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(59));
   
   XLXI_98_60 : mux2x1
      port map (i0=>XLXN_459(60),
                i1=>XLXN_461(60),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(60));
   
   XLXI_98_61 : mux2x1
      port map (i0=>XLXN_459(61),
                i1=>XLXN_461(61),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(61));
   
   XLXI_98_62 : mux2x1
      port map (i0=>XLXN_459(62),
                i1=>XLXN_461(62),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(62));
   
   XLXI_98_63 : mux2x1
      port map (i0=>XLXN_459(63),
                i1=>XLXN_461(63),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floata(63));
   
   XLXI_99 : mux2x1
      port map (i0=>XLXN_464,
                i1=>XLXN_465,
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floatond);
   
   XLXI_100 : mux2x1
      port map (i0=>XLXN_469,
                i1=>XLXN_470,
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floatce);
   
   XLXI_101 : mux2x1
      port map (i0=>XLXN_473,
                i1=>XLXN_474,
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                o=>fixed2floatsclr);
   
   XLXI_102_0 : mux3x1
      port map (i0=>XLXN_477(0),
                i1=>XLXN_478(0),
                i2=>XLXN_479(0),
                i3=>XLXN_480(0),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(0));
   
   XLXI_102_1 : mux3x1
      port map (i0=>XLXN_477(1),
                i1=>XLXN_478(1),
                i2=>XLXN_479(1),
                i3=>XLXN_480(1),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(1));
   
   XLXI_102_2 : mux3x1
      port map (i0=>XLXN_477(2),
                i1=>XLXN_478(2),
                i2=>XLXN_479(2),
                i3=>XLXN_480(2),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(2));
   
   XLXI_102_3 : mux3x1
      port map (i0=>XLXN_477(3),
                i1=>XLXN_478(3),
                i2=>XLXN_479(3),
                i3=>XLXN_480(3),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(3));
   
   XLXI_102_4 : mux3x1
      port map (i0=>XLXN_477(4),
                i1=>XLXN_478(4),
                i2=>XLXN_479(4),
                i3=>XLXN_480(4),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(4));
   
   XLXI_102_5 : mux3x1
      port map (i0=>XLXN_477(5),
                i1=>XLXN_478(5),
                i2=>XLXN_479(5),
                i3=>XLXN_480(5),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(5));
   
   XLXI_102_6 : mux3x1
      port map (i0=>XLXN_477(6),
                i1=>XLXN_478(6),
                i2=>XLXN_479(6),
                i3=>XLXN_480(6),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(6));
   
   XLXI_102_7 : mux3x1
      port map (i0=>XLXN_477(7),
                i1=>XLXN_478(7),
                i2=>XLXN_479(7),
                i3=>XLXN_480(7),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(7));
   
   XLXI_102_8 : mux3x1
      port map (i0=>XLXN_477(8),
                i1=>XLXN_478(8),
                i2=>XLXN_479(8),
                i3=>XLXN_480(8),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(8));
   
   XLXI_102_9 : mux3x1
      port map (i0=>XLXN_477(9),
                i1=>XLXN_478(9),
                i2=>XLXN_479(9),
                i3=>XLXN_480(9),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(9));
   
   XLXI_102_10 : mux3x1
      port map (i0=>XLXN_477(10),
                i1=>XLXN_478(10),
                i2=>XLXN_479(10),
                i3=>XLXN_480(10),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(10));
   
   XLXI_102_11 : mux3x1
      port map (i0=>XLXN_477(11),
                i1=>XLXN_478(11),
                i2=>XLXN_479(11),
                i3=>XLXN_480(11),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(11));
   
   XLXI_102_12 : mux3x1
      port map (i0=>XLXN_477(12),
                i1=>XLXN_478(12),
                i2=>XLXN_479(12),
                i3=>XLXN_480(12),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(12));
   
   XLXI_102_13 : mux3x1
      port map (i0=>XLXN_477(13),
                i1=>XLXN_478(13),
                i2=>XLXN_479(13),
                i3=>XLXN_480(13),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(13));
   
   XLXI_102_14 : mux3x1
      port map (i0=>XLXN_477(14),
                i1=>XLXN_478(14),
                i2=>XLXN_479(14),
                i3=>XLXN_480(14),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(14));
   
   XLXI_102_15 : mux3x1
      port map (i0=>XLXN_477(15),
                i1=>XLXN_478(15),
                i2=>XLXN_479(15),
                i3=>XLXN_480(15),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(15));
   
   XLXI_102_16 : mux3x1
      port map (i0=>XLXN_477(16),
                i1=>XLXN_478(16),
                i2=>XLXN_479(16),
                i3=>XLXN_480(16),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(16));
   
   XLXI_102_17 : mux3x1
      port map (i0=>XLXN_477(17),
                i1=>XLXN_478(17),
                i2=>XLXN_479(17),
                i3=>XLXN_480(17),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(17));
   
   XLXI_102_18 : mux3x1
      port map (i0=>XLXN_477(18),
                i1=>XLXN_478(18),
                i2=>XLXN_479(18),
                i3=>XLXN_480(18),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(18));
   
   XLXI_102_19 : mux3x1
      port map (i0=>XLXN_477(19),
                i1=>XLXN_478(19),
                i2=>XLXN_479(19),
                i3=>XLXN_480(19),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(19));
   
   XLXI_102_20 : mux3x1
      port map (i0=>XLXN_477(20),
                i1=>XLXN_478(20),
                i2=>XLXN_479(20),
                i3=>XLXN_480(20),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(20));
   
   XLXI_102_21 : mux3x1
      port map (i0=>XLXN_477(21),
                i1=>XLXN_478(21),
                i2=>XLXN_479(21),
                i3=>XLXN_480(21),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(21));
   
   XLXI_102_22 : mux3x1
      port map (i0=>XLXN_477(22),
                i1=>XLXN_478(22),
                i2=>XLXN_479(22),
                i3=>XLXN_480(22),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(22));
   
   XLXI_102_23 : mux3x1
      port map (i0=>XLXN_477(23),
                i1=>XLXN_478(23),
                i2=>XLXN_479(23),
                i3=>XLXN_480(23),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(23));
   
   XLXI_102_24 : mux3x1
      port map (i0=>XLXN_477(24),
                i1=>XLXN_478(24),
                i2=>XLXN_479(24),
                i3=>XLXN_480(24),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(24));
   
   XLXI_102_25 : mux3x1
      port map (i0=>XLXN_477(25),
                i1=>XLXN_478(25),
                i2=>XLXN_479(25),
                i3=>XLXN_480(25),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(25));
   
   XLXI_102_26 : mux3x1
      port map (i0=>XLXN_477(26),
                i1=>XLXN_478(26),
                i2=>XLXN_479(26),
                i3=>XLXN_480(26),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(26));
   
   XLXI_102_27 : mux3x1
      port map (i0=>XLXN_477(27),
                i1=>XLXN_478(27),
                i2=>XLXN_479(27),
                i3=>XLXN_480(27),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(27));
   
   XLXI_102_28 : mux3x1
      port map (i0=>XLXN_477(28),
                i1=>XLXN_478(28),
                i2=>XLXN_479(28),
                i3=>XLXN_480(28),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(28));
   
   XLXI_102_29 : mux3x1
      port map (i0=>XLXN_477(29),
                i1=>XLXN_478(29),
                i2=>XLXN_479(29),
                i3=>XLXN_480(29),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(29));
   
   XLXI_102_30 : mux3x1
      port map (i0=>XLXN_477(30),
                i1=>XLXN_478(30),
                i2=>XLXN_479(30),
                i3=>XLXN_480(30),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(30));
   
   XLXI_102_31 : mux3x1
      port map (i0=>XLXN_477(31),
                i1=>XLXN_478(31),
                i2=>XLXN_479(31),
                i3=>XLXN_480(31),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpa(31));
   
   XLXI_103_0 : mux3x1
      port map (i0=>XLXN_487(0),
                i1=>XLXN_488(0),
                i2=>XLXN_489(0),
                i3=>XLXN_490(0),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(0));
   
   XLXI_103_1 : mux3x1
      port map (i0=>XLXN_487(1),
                i1=>XLXN_488(1),
                i2=>XLXN_489(1),
                i3=>XLXN_490(1),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(1));
   
   XLXI_103_2 : mux3x1
      port map (i0=>XLXN_487(2),
                i1=>XLXN_488(2),
                i2=>XLXN_489(2),
                i3=>XLXN_490(2),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(2));
   
   XLXI_103_3 : mux3x1
      port map (i0=>XLXN_487(3),
                i1=>XLXN_488(3),
                i2=>XLXN_489(3),
                i3=>XLXN_490(3),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(3));
   
   XLXI_103_4 : mux3x1
      port map (i0=>XLXN_487(4),
                i1=>XLXN_488(4),
                i2=>XLXN_489(4),
                i3=>XLXN_490(4),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(4));
   
   XLXI_103_5 : mux3x1
      port map (i0=>XLXN_487(5),
                i1=>XLXN_488(5),
                i2=>XLXN_489(5),
                i3=>XLXN_490(5),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(5));
   
   XLXI_103_6 : mux3x1
      port map (i0=>XLXN_487(6),
                i1=>XLXN_488(6),
                i2=>XLXN_489(6),
                i3=>XLXN_490(6),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(6));
   
   XLXI_103_7 : mux3x1
      port map (i0=>XLXN_487(7),
                i1=>XLXN_488(7),
                i2=>XLXN_489(7),
                i3=>XLXN_490(7),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(7));
   
   XLXI_103_8 : mux3x1
      port map (i0=>XLXN_487(8),
                i1=>XLXN_488(8),
                i2=>XLXN_489(8),
                i3=>XLXN_490(8),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(8));
   
   XLXI_103_9 : mux3x1
      port map (i0=>XLXN_487(9),
                i1=>XLXN_488(9),
                i2=>XLXN_489(9),
                i3=>XLXN_490(9),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(9));
   
   XLXI_103_10 : mux3x1
      port map (i0=>XLXN_487(10),
                i1=>XLXN_488(10),
                i2=>XLXN_489(10),
                i3=>XLXN_490(10),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(10));
   
   XLXI_103_11 : mux3x1
      port map (i0=>XLXN_487(11),
                i1=>XLXN_488(11),
                i2=>XLXN_489(11),
                i3=>XLXN_490(11),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(11));
   
   XLXI_103_12 : mux3x1
      port map (i0=>XLXN_487(12),
                i1=>XLXN_488(12),
                i2=>XLXN_489(12),
                i3=>XLXN_490(12),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(12));
   
   XLXI_103_13 : mux3x1
      port map (i0=>XLXN_487(13),
                i1=>XLXN_488(13),
                i2=>XLXN_489(13),
                i3=>XLXN_490(13),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(13));
   
   XLXI_103_14 : mux3x1
      port map (i0=>XLXN_487(14),
                i1=>XLXN_488(14),
                i2=>XLXN_489(14),
                i3=>XLXN_490(14),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(14));
   
   XLXI_103_15 : mux3x1
      port map (i0=>XLXN_487(15),
                i1=>XLXN_488(15),
                i2=>XLXN_489(15),
                i3=>XLXN_490(15),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(15));
   
   XLXI_103_16 : mux3x1
      port map (i0=>XLXN_487(16),
                i1=>XLXN_488(16),
                i2=>XLXN_489(16),
                i3=>XLXN_490(16),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(16));
   
   XLXI_103_17 : mux3x1
      port map (i0=>XLXN_487(17),
                i1=>XLXN_488(17),
                i2=>XLXN_489(17),
                i3=>XLXN_490(17),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(17));
   
   XLXI_103_18 : mux3x1
      port map (i0=>XLXN_487(18),
                i1=>XLXN_488(18),
                i2=>XLXN_489(18),
                i3=>XLXN_490(18),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(18));
   
   XLXI_103_19 : mux3x1
      port map (i0=>XLXN_487(19),
                i1=>XLXN_488(19),
                i2=>XLXN_489(19),
                i3=>XLXN_490(19),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(19));
   
   XLXI_103_20 : mux3x1
      port map (i0=>XLXN_487(20),
                i1=>XLXN_488(20),
                i2=>XLXN_489(20),
                i3=>XLXN_490(20),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(20));
   
   XLXI_103_21 : mux3x1
      port map (i0=>XLXN_487(21),
                i1=>XLXN_488(21),
                i2=>XLXN_489(21),
                i3=>XLXN_490(21),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(21));
   
   XLXI_103_22 : mux3x1
      port map (i0=>XLXN_487(22),
                i1=>XLXN_488(22),
                i2=>XLXN_489(22),
                i3=>XLXN_490(22),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(22));
   
   XLXI_103_23 : mux3x1
      port map (i0=>XLXN_487(23),
                i1=>XLXN_488(23),
                i2=>XLXN_489(23),
                i3=>XLXN_490(23),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(23));
   
   XLXI_103_24 : mux3x1
      port map (i0=>XLXN_487(24),
                i1=>XLXN_488(24),
                i2=>XLXN_489(24),
                i3=>XLXN_490(24),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(24));
   
   XLXI_103_25 : mux3x1
      port map (i0=>XLXN_487(25),
                i1=>XLXN_488(25),
                i2=>XLXN_489(25),
                i3=>XLXN_490(25),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(25));
   
   XLXI_103_26 : mux3x1
      port map (i0=>XLXN_487(26),
                i1=>XLXN_488(26),
                i2=>XLXN_489(26),
                i3=>XLXN_490(26),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(26));
   
   XLXI_103_27 : mux3x1
      port map (i0=>XLXN_487(27),
                i1=>XLXN_488(27),
                i2=>XLXN_489(27),
                i3=>XLXN_490(27),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(27));
   
   XLXI_103_28 : mux3x1
      port map (i0=>XLXN_487(28),
                i1=>XLXN_488(28),
                i2=>XLXN_489(28),
                i3=>XLXN_490(28),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(28));
   
   XLXI_103_29 : mux3x1
      port map (i0=>XLXN_487(29),
                i1=>XLXN_488(29),
                i2=>XLXN_489(29),
                i3=>XLXN_490(29),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(29));
   
   XLXI_103_30 : mux3x1
      port map (i0=>XLXN_487(30),
                i1=>XLXN_488(30),
                i2=>XLXN_489(30),
                i3=>XLXN_490(30),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(30));
   
   XLXI_103_31 : mux3x1
      port map (i0=>XLXN_487(31),
                i1=>XLXN_488(31),
                i2=>XLXN_489(31),
                i3=>XLXN_490(31),
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpb(31));
   
   XLXI_104 : mux3x1
      port map (i0=>XLXN_495,
                i1=>XLXN_496,
                i2=>XLXN_497,
                i3=>XLXN_498,
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpond);
   
   XLXI_105 : mux3x1
      port map (i0=>XLXN_503,
                i1=>XLXN_504,
                i2=>XLXN_505,
                i3=>XLXN_506,
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpsclr);
   
   XLXI_106 : mux3x1
      port map (i0=>XLXN_511,
                i1=>XLXN_512,
                i2=>XLXN_513,
                i3=>XLXN_514,
                s0=>calculatepixgainmux,
                s1=>extractoffsetparametersmux,
                s2=>extractktaparametersmux,
                o=>mulfpce);
   
   XLXI_113_0 : mux3x1
      port map (i0=>XLXN_518(0),
                i1=>XLXN_519(0),
                i2=>XLXN_520(0),
                i3=>XLXI_113_0_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(0));
   
   XLXI_113_1 : mux3x1
      port map (i0=>XLXN_518(1),
                i1=>XLXN_519(1),
                i2=>XLXN_520(1),
                i3=>XLXI_113_1_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(1));
   
   XLXI_113_2 : mux3x1
      port map (i0=>XLXN_518(2),
                i1=>XLXN_519(2),
                i2=>XLXN_520(2),
                i3=>XLXI_113_2_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(2));
   
   XLXI_113_3 : mux3x1
      port map (i0=>XLXN_518(3),
                i1=>XLXN_519(3),
                i2=>XLXN_520(3),
                i3=>XLXI_113_3_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(3));
   
   XLXI_113_4 : mux3x1
      port map (i0=>XLXN_518(4),
                i1=>XLXN_519(4),
                i2=>XLXN_520(4),
                i3=>XLXI_113_4_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(4));
   
   XLXI_113_5 : mux3x1
      port map (i0=>XLXN_518(5),
                i1=>XLXN_519(5),
                i2=>XLXN_520(5),
                i3=>XLXI_113_5_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(5));
   
   XLXI_113_6 : mux3x1
      port map (i0=>XLXN_518(6),
                i1=>XLXN_519(6),
                i2=>XLXN_520(6),
                i3=>XLXI_113_6_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(6));
   
   XLXI_113_7 : mux3x1
      port map (i0=>XLXN_518(7),
                i1=>XLXN_519(7),
                i2=>XLXN_520(7),
                i3=>XLXI_113_7_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(7));
   
   XLXI_113_8 : mux3x1
      port map (i0=>XLXN_518(8),
                i1=>XLXN_519(8),
                i2=>XLXN_520(8),
                i3=>XLXI_113_8_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(8));
   
   XLXI_113_9 : mux3x1
      port map (i0=>XLXN_518(9),
                i1=>XLXN_519(9),
                i2=>XLXN_520(9),
                i3=>XLXI_113_9_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(9));
   
   XLXI_113_10 : mux3x1
      port map (i0=>XLXN_518(10),
                i1=>XLXN_519(10),
                i2=>XLXN_520(10),
                i3=>XLXI_113_10_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(10));
   
   XLXI_113_11 : mux3x1
      port map (i0=>XLXN_518(11),
                i1=>XLXN_519(11),
                i2=>XLXN_520(11),
                i3=>XLXI_113_11_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(11));
   
   XLXI_113_12 : mux3x1
      port map (i0=>XLXN_518(12),
                i1=>XLXN_519(12),
                i2=>XLXN_520(12),
                i3=>XLXI_113_12_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(12));
   
   XLXI_113_13 : mux3x1
      port map (i0=>XLXN_518(13),
                i1=>XLXN_519(13),
                i2=>XLXN_520(13),
                i3=>XLXI_113_13_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(13));
   
   XLXI_113_14 : mux3x1
      port map (i0=>XLXN_518(14),
                i1=>XLXN_519(14),
                i2=>XLXN_520(14),
                i3=>XLXI_113_14_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(14));
   
   XLXI_113_15 : mux3x1
      port map (i0=>XLXN_518(15),
                i1=>XLXN_519(15),
                i2=>XLXN_520(15),
                i3=>XLXI_113_15_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(15));
   
   XLXI_113_16 : mux3x1
      port map (i0=>XLXN_518(16),
                i1=>XLXN_519(16),
                i2=>XLXN_520(16),
                i3=>XLXI_113_16_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(16));
   
   XLXI_113_17 : mux3x1
      port map (i0=>XLXN_518(17),
                i1=>XLXN_519(17),
                i2=>XLXN_520(17),
                i3=>XLXI_113_17_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(17));
   
   XLXI_113_18 : mux3x1
      port map (i0=>XLXN_518(18),
                i1=>XLXN_519(18),
                i2=>XLXN_520(18),
                i3=>XLXI_113_18_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(18));
   
   XLXI_113_19 : mux3x1
      port map (i0=>XLXN_518(19),
                i1=>XLXN_519(19),
                i2=>XLXN_520(19),
                i3=>XLXI_113_19_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(19));
   
   XLXI_113_20 : mux3x1
      port map (i0=>XLXN_518(20),
                i1=>XLXN_519(20),
                i2=>XLXN_520(20),
                i3=>XLXI_113_20_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(20));
   
   XLXI_113_21 : mux3x1
      port map (i0=>XLXN_518(21),
                i1=>XLXN_519(21),
                i2=>XLXN_520(21),
                i3=>XLXI_113_21_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(21));
   
   XLXI_113_22 : mux3x1
      port map (i0=>XLXN_518(22),
                i1=>XLXN_519(22),
                i2=>XLXN_520(22),
                i3=>XLXI_113_22_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(22));
   
   XLXI_113_23 : mux3x1
      port map (i0=>XLXN_518(23),
                i1=>XLXN_519(23),
                i2=>XLXN_520(23),
                i3=>XLXI_113_23_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(23));
   
   XLXI_113_24 : mux3x1
      port map (i0=>XLXN_518(24),
                i1=>XLXN_519(24),
                i2=>XLXN_520(24),
                i3=>XLXI_113_24_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(24));
   
   XLXI_113_25 : mux3x1
      port map (i0=>XLXN_518(25),
                i1=>XLXN_519(25),
                i2=>XLXN_520(25),
                i3=>XLXI_113_25_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(25));
   
   XLXI_113_26 : mux3x1
      port map (i0=>XLXN_518(26),
                i1=>XLXN_519(26),
                i2=>XLXN_520(26),
                i3=>XLXI_113_26_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(26));
   
   XLXI_113_27 : mux3x1
      port map (i0=>XLXN_518(27),
                i1=>XLXN_519(27),
                i2=>XLXN_520(27),
                i3=>XLXI_113_27_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(27));
   
   XLXI_113_28 : mux3x1
      port map (i0=>XLXN_518(28),
                i1=>XLXN_519(28),
                i2=>XLXN_520(28),
                i3=>XLXI_113_28_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(28));
   
   XLXI_113_29 : mux3x1
      port map (i0=>XLXN_518(29),
                i1=>XLXN_519(29),
                i2=>XLXN_520(29),
                i3=>XLXI_113_29_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(29));
   
   XLXI_113_30 : mux3x1
      port map (i0=>XLXN_518(30),
                i1=>XLXN_519(30),
                i2=>XLXN_520(30),
                i3=>XLXI_113_30_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(30));
   
   XLXI_113_31 : mux3x1
      port map (i0=>XLXN_518(31),
                i1=>XLXN_519(31),
                i2=>XLXN_520(31),
                i3=>XLXI_113_31_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpa(31));
   
   XLXI_114_0 : mux3x1
      port map (i0=>XLXN_526(0),
                i1=>XLXN_529(0),
                i2=>XLXN_530(0),
                i3=>XLXI_114_0_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(0));
   
   XLXI_114_1 : mux3x1
      port map (i0=>XLXN_526(1),
                i1=>XLXN_529(1),
                i2=>XLXN_530(1),
                i3=>XLXI_114_1_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(1));
   
   XLXI_114_2 : mux3x1
      port map (i0=>XLXN_526(2),
                i1=>XLXN_529(2),
                i2=>XLXN_530(2),
                i3=>XLXI_114_2_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(2));
   
   XLXI_114_3 : mux3x1
      port map (i0=>XLXN_526(3),
                i1=>XLXN_529(3),
                i2=>XLXN_530(3),
                i3=>XLXI_114_3_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(3));
   
   XLXI_114_4 : mux3x1
      port map (i0=>XLXN_526(4),
                i1=>XLXN_529(4),
                i2=>XLXN_530(4),
                i3=>XLXI_114_4_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(4));
   
   XLXI_114_5 : mux3x1
      port map (i0=>XLXN_526(5),
                i1=>XLXN_529(5),
                i2=>XLXN_530(5),
                i3=>XLXI_114_5_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(5));
   
   XLXI_114_6 : mux3x1
      port map (i0=>XLXN_526(6),
                i1=>XLXN_529(6),
                i2=>XLXN_530(6),
                i3=>XLXI_114_6_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(6));
   
   XLXI_114_7 : mux3x1
      port map (i0=>XLXN_526(7),
                i1=>XLXN_529(7),
                i2=>XLXN_530(7),
                i3=>XLXI_114_7_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(7));
   
   XLXI_114_8 : mux3x1
      port map (i0=>XLXN_526(8),
                i1=>XLXN_529(8),
                i2=>XLXN_530(8),
                i3=>XLXI_114_8_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(8));
   
   XLXI_114_9 : mux3x1
      port map (i0=>XLXN_526(9),
                i1=>XLXN_529(9),
                i2=>XLXN_530(9),
                i3=>XLXI_114_9_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(9));
   
   XLXI_114_10 : mux3x1
      port map (i0=>XLXN_526(10),
                i1=>XLXN_529(10),
                i2=>XLXN_530(10),
                i3=>XLXI_114_10_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(10));
   
   XLXI_114_11 : mux3x1
      port map (i0=>XLXN_526(11),
                i1=>XLXN_529(11),
                i2=>XLXN_530(11),
                i3=>XLXI_114_11_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(11));
   
   XLXI_114_12 : mux3x1
      port map (i0=>XLXN_526(12),
                i1=>XLXN_529(12),
                i2=>XLXN_530(12),
                i3=>XLXI_114_12_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(12));
   
   XLXI_114_13 : mux3x1
      port map (i0=>XLXN_526(13),
                i1=>XLXN_529(13),
                i2=>XLXN_530(13),
                i3=>XLXI_114_13_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(13));
   
   XLXI_114_14 : mux3x1
      port map (i0=>XLXN_526(14),
                i1=>XLXN_529(14),
                i2=>XLXN_530(14),
                i3=>XLXI_114_14_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(14));
   
   XLXI_114_15 : mux3x1
      port map (i0=>XLXN_526(15),
                i1=>XLXN_529(15),
                i2=>XLXN_530(15),
                i3=>XLXI_114_15_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(15));
   
   XLXI_114_16 : mux3x1
      port map (i0=>XLXN_526(16),
                i1=>XLXN_529(16),
                i2=>XLXN_530(16),
                i3=>XLXI_114_16_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(16));
   
   XLXI_114_17 : mux3x1
      port map (i0=>XLXN_526(17),
                i1=>XLXN_529(17),
                i2=>XLXN_530(17),
                i3=>XLXI_114_17_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(17));
   
   XLXI_114_18 : mux3x1
      port map (i0=>XLXN_526(18),
                i1=>XLXN_529(18),
                i2=>XLXN_530(18),
                i3=>XLXI_114_18_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(18));
   
   XLXI_114_19 : mux3x1
      port map (i0=>XLXN_526(19),
                i1=>XLXN_529(19),
                i2=>XLXN_530(19),
                i3=>XLXI_114_19_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(19));
   
   XLXI_114_20 : mux3x1
      port map (i0=>XLXN_526(20),
                i1=>XLXN_529(20),
                i2=>XLXN_530(20),
                i3=>XLXI_114_20_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(20));
   
   XLXI_114_21 : mux3x1
      port map (i0=>XLXN_526(21),
                i1=>XLXN_529(21),
                i2=>XLXN_530(21),
                i3=>XLXI_114_21_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(21));
   
   XLXI_114_22 : mux3x1
      port map (i0=>XLXN_526(22),
                i1=>XLXN_529(22),
                i2=>XLXN_530(22),
                i3=>XLXI_114_22_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(22));
   
   XLXI_114_23 : mux3x1
      port map (i0=>XLXN_526(23),
                i1=>XLXN_529(23),
                i2=>XLXN_530(23),
                i3=>XLXI_114_23_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(23));
   
   XLXI_114_24 : mux3x1
      port map (i0=>XLXN_526(24),
                i1=>XLXN_529(24),
                i2=>XLXN_530(24),
                i3=>XLXI_114_24_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(24));
   
   XLXI_114_25 : mux3x1
      port map (i0=>XLXN_526(25),
                i1=>XLXN_529(25),
                i2=>XLXN_530(25),
                i3=>XLXI_114_25_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(25));
   
   XLXI_114_26 : mux3x1
      port map (i0=>XLXN_526(26),
                i1=>XLXN_529(26),
                i2=>XLXN_530(26),
                i3=>XLXI_114_26_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(26));
   
   XLXI_114_27 : mux3x1
      port map (i0=>XLXN_526(27),
                i1=>XLXN_529(27),
                i2=>XLXN_530(27),
                i3=>XLXI_114_27_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(27));
   
   XLXI_114_28 : mux3x1
      port map (i0=>XLXN_526(28),
                i1=>XLXN_529(28),
                i2=>XLXN_530(28),
                i3=>XLXI_114_28_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(28));
   
   XLXI_114_29 : mux3x1
      port map (i0=>XLXN_526(29),
                i1=>XLXN_529(29),
                i2=>XLXN_530(29),
                i3=>XLXI_114_29_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(29));
   
   XLXI_114_30 : mux3x1
      port map (i0=>XLXN_526(30),
                i1=>XLXN_529(30),
                i2=>XLXN_530(30),
                i3=>XLXI_114_30_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(30));
   
   XLXI_114_31 : mux3x1
      port map (i0=>XLXN_526(31),
                i1=>XLXN_529(31),
                i2=>XLXN_530(31),
                i3=>XLXI_114_31_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpb(31));
   
   XLXI_115 : mux3x1
      port map (i0=>XLXN_534,
                i1=>XLXN_535,
                i2=>XLXN_536,
                i3=>XLXI_115_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpond);
   
   XLXI_116 : mux3x1
      port map (i0=>XLXN_537,
                i1=>XLXN_538,
                i2=>XLXN_539,
                i3=>XLXI_116_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpsclr);
   
   XLXI_117 : mux3x1
      port map (i0=>XLXN_540,
                i1=>XLXN_542,
                i2=>XLXN_543,
                i3=>XLXI_117_i3_openSignal,
                s0=>calculatepixgainmux,
                s1=>extractktaparametersmux,
                s2=>extractkvparametersmux,
                o=>divfpce);
   
   XLXI_128_0 : mux3x1a
      port map (i0=>XLXN_558(0),
                i1=>XLXN_559(0),
                i2=>XLXN_560(0),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(0));
   
   XLXI_128_1 : mux3x1a
      port map (i0=>XLXN_558(1),
                i1=>XLXN_559(1),
                i2=>XLXN_560(1),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(1));
   
   XLXI_128_2 : mux3x1a
      port map (i0=>XLXN_558(2),
                i1=>XLXN_559(2),
                i2=>XLXN_560(2),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(2));
   
   XLXI_128_3 : mux3x1a
      port map (i0=>XLXN_558(3),
                i1=>XLXN_559(3),
                i2=>XLXN_560(3),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(3));
   
   XLXI_128_4 : mux3x1a
      port map (i0=>XLXN_558(4),
                i1=>XLXN_559(4),
                i2=>XLXN_560(4),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(4));
   
   XLXI_128_5 : mux3x1a
      port map (i0=>XLXN_558(5),
                i1=>XLXN_559(5),
                i2=>XLXN_560(5),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(5));
   
   XLXI_128_6 : mux3x1a
      port map (i0=>XLXN_558(6),
                i1=>XLXN_559(6),
                i2=>XLXN_560(6),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(6));
   
   XLXI_128_7 : mux3x1a
      port map (i0=>XLXN_558(7),
                i1=>XLXN_559(7),
                i2=>XLXN_560(7),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(7));
   
   XLXI_128_8 : mux3x1a
      port map (i0=>XLXN_558(8),
                i1=>XLXN_559(8),
                i2=>XLXN_560(8),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(8));
   
   XLXI_128_9 : mux3x1a
      port map (i0=>XLXN_558(9),
                i1=>XLXN_559(9),
                i2=>XLXN_560(9),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(9));
   
   XLXI_128_10 : mux3x1a
      port map (i0=>XLXN_558(10),
                i1=>XLXN_559(10),
                i2=>XLXN_560(10),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(10));
   
   XLXI_128_11 : mux3x1a
      port map (i0=>XLXN_558(11),
                i1=>XLXN_559(11),
                i2=>XLXN_560(11),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(11));
   
   XLXI_128_12 : mux3x1a
      port map (i0=>XLXN_558(12),
                i1=>XLXN_559(12),
                i2=>XLXN_560(12),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(12));
   
   XLXI_128_13 : mux3x1a
      port map (i0=>XLXN_558(13),
                i1=>XLXN_559(13),
                i2=>XLXN_560(13),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(13));
   
   XLXI_128_14 : mux3x1a
      port map (i0=>XLXN_558(14),
                i1=>XLXN_559(14),
                i2=>XLXN_560(14),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(14));
   
   XLXI_128_15 : mux3x1a
      port map (i0=>XLXN_558(15),
                i1=>XLXN_559(15),
                i2=>XLXN_560(15),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(15));
   
   XLXI_128_16 : mux3x1a
      port map (i0=>XLXN_558(16),
                i1=>XLXN_559(16),
                i2=>XLXN_560(16),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(16));
   
   XLXI_128_17 : mux3x1a
      port map (i0=>XLXN_558(17),
                i1=>XLXN_559(17),
                i2=>XLXN_560(17),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(17));
   
   XLXI_128_18 : mux3x1a
      port map (i0=>XLXN_558(18),
                i1=>XLXN_559(18),
                i2=>XLXN_560(18),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(18));
   
   XLXI_128_19 : mux3x1a
      port map (i0=>XLXN_558(19),
                i1=>XLXN_559(19),
                i2=>XLXN_560(19),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(19));
   
   XLXI_128_20 : mux3x1a
      port map (i0=>XLXN_558(20),
                i1=>XLXN_559(20),
                i2=>XLXN_560(20),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(20));
   
   XLXI_128_21 : mux3x1a
      port map (i0=>XLXN_558(21),
                i1=>XLXN_559(21),
                i2=>XLXN_560(21),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(21));
   
   XLXI_128_22 : mux3x1a
      port map (i0=>XLXN_558(22),
                i1=>XLXN_559(22),
                i2=>XLXN_560(22),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(22));
   
   XLXI_128_23 : mux3x1a
      port map (i0=>XLXN_558(23),
                i1=>XLXN_559(23),
                i2=>XLXN_560(23),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(23));
   
   XLXI_128_24 : mux3x1a
      port map (i0=>XLXN_558(24),
                i1=>XLXN_559(24),
                i2=>XLXN_560(24),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(24));
   
   XLXI_128_25 : mux3x1a
      port map (i0=>XLXN_558(25),
                i1=>XLXN_559(25),
                i2=>XLXN_560(25),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(25));
   
   XLXI_128_26 : mux3x1a
      port map (i0=>XLXN_558(26),
                i1=>XLXN_559(26),
                i2=>XLXN_560(26),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(26));
   
   XLXI_128_27 : mux3x1a
      port map (i0=>XLXN_558(27),
                i1=>XLXN_559(27),
                i2=>XLXN_560(27),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(27));
   
   XLXI_128_28 : mux3x1a
      port map (i0=>XLXN_558(28),
                i1=>XLXN_559(28),
                i2=>XLXN_560(28),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(28));
   
   XLXI_128_29 : mux3x1a
      port map (i0=>XLXN_558(29),
                i1=>XLXN_559(29),
                i2=>XLXN_560(29),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(29));
   
   XLXI_128_30 : mux3x1a
      port map (i0=>XLXN_558(30),
                i1=>XLXN_559(30),
                i2=>XLXN_560(30),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(30));
   
   XLXI_128_31 : mux3x1a
      port map (i0=>XLXN_558(31),
                i1=>XLXN_559(31),
                i2=>XLXN_560(31),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpa(31));
   
   XLXI_129_0 : mux3x1a
      port map (i0=>XLXN_561(0),
                i1=>XLXN_562(0),
                i2=>XLXN_563(0),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(0));
   
   XLXI_129_1 : mux3x1a
      port map (i0=>XLXN_561(1),
                i1=>XLXN_562(1),
                i2=>XLXN_563(1),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(1));
   
   XLXI_129_2 : mux3x1a
      port map (i0=>XLXN_561(2),
                i1=>XLXN_562(2),
                i2=>XLXN_563(2),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(2));
   
   XLXI_129_3 : mux3x1a
      port map (i0=>XLXN_561(3),
                i1=>XLXN_562(3),
                i2=>XLXN_563(3),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(3));
   
   XLXI_129_4 : mux3x1a
      port map (i0=>XLXN_561(4),
                i1=>XLXN_562(4),
                i2=>XLXN_563(4),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(4));
   
   XLXI_129_5 : mux3x1a
      port map (i0=>XLXN_561(5),
                i1=>XLXN_562(5),
                i2=>XLXN_563(5),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(5));
   
   XLXI_129_6 : mux3x1a
      port map (i0=>XLXN_561(6),
                i1=>XLXN_562(6),
                i2=>XLXN_563(6),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(6));
   
   XLXI_129_7 : mux3x1a
      port map (i0=>XLXN_561(7),
                i1=>XLXN_562(7),
                i2=>XLXN_563(7),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(7));
   
   XLXI_129_8 : mux3x1a
      port map (i0=>XLXN_561(8),
                i1=>XLXN_562(8),
                i2=>XLXN_563(8),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(8));
   
   XLXI_129_9 : mux3x1a
      port map (i0=>XLXN_561(9),
                i1=>XLXN_562(9),
                i2=>XLXN_563(9),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(9));
   
   XLXI_129_10 : mux3x1a
      port map (i0=>XLXN_561(10),
                i1=>XLXN_562(10),
                i2=>XLXN_563(10),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(10));
   
   XLXI_129_11 : mux3x1a
      port map (i0=>XLXN_561(11),
                i1=>XLXN_562(11),
                i2=>XLXN_563(11),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(11));
   
   XLXI_129_12 : mux3x1a
      port map (i0=>XLXN_561(12),
                i1=>XLXN_562(12),
                i2=>XLXN_563(12),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(12));
   
   XLXI_129_13 : mux3x1a
      port map (i0=>XLXN_561(13),
                i1=>XLXN_562(13),
                i2=>XLXN_563(13),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(13));
   
   XLXI_129_14 : mux3x1a
      port map (i0=>XLXN_561(14),
                i1=>XLXN_562(14),
                i2=>XLXN_563(14),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(14));
   
   XLXI_129_15 : mux3x1a
      port map (i0=>XLXN_561(15),
                i1=>XLXN_562(15),
                i2=>XLXN_563(15),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(15));
   
   XLXI_129_16 : mux3x1a
      port map (i0=>XLXN_561(16),
                i1=>XLXN_562(16),
                i2=>XLXN_563(16),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(16));
   
   XLXI_129_17 : mux3x1a
      port map (i0=>XLXN_561(17),
                i1=>XLXN_562(17),
                i2=>XLXN_563(17),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(17));
   
   XLXI_129_18 : mux3x1a
      port map (i0=>XLXN_561(18),
                i1=>XLXN_562(18),
                i2=>XLXN_563(18),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(18));
   
   XLXI_129_19 : mux3x1a
      port map (i0=>XLXN_561(19),
                i1=>XLXN_562(19),
                i2=>XLXN_563(19),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(19));
   
   XLXI_129_20 : mux3x1a
      port map (i0=>XLXN_561(20),
                i1=>XLXN_562(20),
                i2=>XLXN_563(20),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(20));
   
   XLXI_129_21 : mux3x1a
      port map (i0=>XLXN_561(21),
                i1=>XLXN_562(21),
                i2=>XLXN_563(21),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(21));
   
   XLXI_129_22 : mux3x1a
      port map (i0=>XLXN_561(22),
                i1=>XLXN_562(22),
                i2=>XLXN_563(22),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(22));
   
   XLXI_129_23 : mux3x1a
      port map (i0=>XLXN_561(23),
                i1=>XLXN_562(23),
                i2=>XLXN_563(23),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(23));
   
   XLXI_129_24 : mux3x1a
      port map (i0=>XLXN_561(24),
                i1=>XLXN_562(24),
                i2=>XLXN_563(24),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(24));
   
   XLXI_129_25 : mux3x1a
      port map (i0=>XLXN_561(25),
                i1=>XLXN_562(25),
                i2=>XLXN_563(25),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(25));
   
   XLXI_129_26 : mux3x1a
      port map (i0=>XLXN_561(26),
                i1=>XLXN_562(26),
                i2=>XLXN_563(26),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(26));
   
   XLXI_129_27 : mux3x1a
      port map (i0=>XLXN_561(27),
                i1=>XLXN_562(27),
                i2=>XLXN_563(27),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(27));
   
   XLXI_129_28 : mux3x1a
      port map (i0=>XLXN_561(28),
                i1=>XLXN_562(28),
                i2=>XLXN_563(28),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(28));
   
   XLXI_129_29 : mux3x1a
      port map (i0=>XLXN_561(29),
                i1=>XLXN_562(29),
                i2=>XLXN_563(29),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(29));
   
   XLXI_129_30 : mux3x1a
      port map (i0=>XLXN_561(30),
                i1=>XLXN_562(30),
                i2=>XLXN_563(30),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(30));
   
   XLXI_129_31 : mux3x1a
      port map (i0=>XLXN_561(31),
                i1=>XLXN_562(31),
                i2=>XLXN_563(31),
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpb(31));
   
   XLXI_130 : mux3x1a
      port map (i0=>XLXN_564,
                i1=>XLXN_565,
                i2=>XLXN_566,
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpond);
   
   XLXI_131 : mux3x1a
      port map (i0=>XLXN_567,
                i1=>XLXN_568,
                i2=>XLXN_569,
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpsclr);
   
   XLXI_132 : mux3x1a
      port map (i0=>XLXN_570,
                i1=>XLXN_571,
                i2=>XLXN_572,
                s0=>extractoffsetparametersmux,
                s1=>extractktaparametersmux,
                o=>addfpce);
   
   XLXI_134_0 : BUF
      port map (I=>XLXN_580(0),
                O=>XLXN_573(0));
   
   XLXI_134_1 : BUF
      port map (I=>XLXN_580(1),
                O=>XLXN_573(1));
   
   XLXI_134_2 : BUF
      port map (I=>XLXN_580(2),
                O=>XLXN_573(2));
   
   XLXI_134_3 : BUF
      port map (I=>XLXN_580(3),
                O=>XLXN_573(3));
   
   XLXI_134_4 : BUF
      port map (I=>XLXN_580(4),
                O=>XLXN_573(4));
   
   XLXI_134_5 : BUF
      port map (I=>XLXN_580(5),
                O=>XLXN_573(5));
   
   XLXI_134_6 : BUF
      port map (I=>XLXN_580(6),
                O=>XLXN_573(6));
   
   XLXI_134_7 : BUF
      port map (I=>XLXN_580(7),
                O=>XLXN_573(7));
   
   XLXI_135_0 : BUF
      port map (I=>XLXN_581(0),
                O=>XLXN_574(0));
   
   XLXI_135_1 : BUF
      port map (I=>XLXN_581(1),
                O=>XLXN_574(1));
   
   XLXI_135_2 : BUF
      port map (I=>XLXN_581(2),
                O=>XLXN_574(2));
   
   XLXI_135_3 : BUF
      port map (I=>XLXN_581(3),
                O=>XLXN_574(3));
   
   XLXI_135_4 : BUF
      port map (I=>XLXN_581(4),
                O=>XLXN_574(4));
   
   XLXI_135_5 : BUF
      port map (I=>XLXN_581(5),
                O=>XLXN_574(5));
   
   XLXI_135_6 : BUF
      port map (I=>XLXN_581(6),
                O=>XLXN_574(6));
   
   XLXI_135_7 : BUF
      port map (I=>XLXN_581(7),
                O=>XLXN_574(7));
   
   XLXI_136_0 : BUF
      port map (I=>XLXN_582(0),
                O=>XLXN_575(0));
   
   XLXI_136_1 : BUF
      port map (I=>XLXN_582(1),
                O=>XLXN_575(1));
   
   XLXI_136_2 : BUF
      port map (I=>XLXN_582(2),
                O=>XLXN_575(2));
   
   XLXI_136_3 : BUF
      port map (I=>XLXN_582(3),
                O=>XLXN_575(3));
   
   XLXI_136_4 : BUF
      port map (I=>XLXN_582(4),
                O=>XLXN_575(4));
   
   XLXI_136_5 : BUF
      port map (I=>XLXN_582(5),
                O=>XLXN_575(5));
   
   XLXI_136_6 : BUF
      port map (I=>XLXN_582(6),
                O=>XLXN_575(6));
   
   XLXI_136_7 : BUF
      port map (I=>XLXN_582(7),
                O=>XLXN_575(7));
   
   XLXI_137_0 : BUF
      port map (I=>XLXN_583(0),
                O=>XLXN_576(0));
   
   XLXI_137_1 : BUF
      port map (I=>XLXN_583(1),
                O=>XLXN_576(1));
   
   XLXI_137_2 : BUF
      port map (I=>XLXN_583(2),
                O=>XLXN_576(2));
   
   XLXI_137_3 : BUF
      port map (I=>XLXN_583(3),
                O=>XLXN_576(3));
   
   XLXI_137_4 : BUF
      port map (I=>XLXN_583(4),
                O=>XLXN_576(4));
   
   XLXI_137_5 : BUF
      port map (I=>XLXN_583(5),
                O=>XLXN_576(5));
   
   XLXI_137_6 : BUF
      port map (I=>XLXN_583(6),
                O=>XLXN_576(6));
   
   XLXI_137_7 : BUF
      port map (I=>XLXN_583(7),
                O=>XLXN_576(7));
   
   XLXI_140_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(0),
                D1=>i2c_mem_douta(0),
                S0=>calculatepixgainmux,
                O=>XLXN_580(0));
   
   XLXI_140_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(1),
                D1=>i2c_mem_douta(1),
                S0=>calculatepixgainmux,
                O=>XLXN_580(1));
   
   XLXI_140_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(2),
                D1=>i2c_mem_douta(2),
                S0=>calculatepixgainmux,
                O=>XLXN_580(2));
   
   XLXI_140_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(3),
                D1=>i2c_mem_douta(3),
                S0=>calculatepixgainmux,
                O=>XLXN_580(3));
   
   XLXI_140_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(4),
                D1=>i2c_mem_douta(4),
                S0=>calculatepixgainmux,
                O=>XLXN_580(4));
   
   XLXI_140_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(5),
                D1=>i2c_mem_douta(5),
                S0=>calculatepixgainmux,
                O=>XLXN_580(5));
   
   XLXI_140_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(6),
                D1=>i2c_mem_douta(6),
                S0=>calculatepixgainmux,
                O=>XLXN_580(6));
   
   XLXI_140_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(7),
                D1=>i2c_mem_douta(7),
                S0=>calculatepixgainmux,
                O=>XLXN_580(7));
   
   XLXI_141_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(0),
                D1=>i2c_mem_douta(0),
                S0=>extractoffsetparametersmux,
                O=>XLXN_581(0));
   
   XLXI_141_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(1),
                D1=>i2c_mem_douta(1),
                S0=>extractoffsetparametersmux,
                O=>XLXN_581(1));
   
   XLXI_141_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(2),
                D1=>i2c_mem_douta(2),
                S0=>extractoffsetparametersmux,
                O=>XLXN_581(2));
   
   XLXI_141_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(3),
                D1=>i2c_mem_douta(3),
                S0=>extractoffsetparametersmux,
                O=>XLXN_581(3));
   
   XLXI_141_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(4),
                D1=>i2c_mem_douta(4),
                S0=>extractoffsetparametersmux,
                O=>XLXN_581(4));
   
   XLXI_141_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(5),
                D1=>i2c_mem_douta(5),
                S0=>extractoffsetparametersmux,
                O=>XLXN_581(5));
   
   XLXI_141_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(6),
                D1=>i2c_mem_douta(6),
                S0=>extractoffsetparametersmux,
                O=>XLXN_581(6));
   
   XLXI_141_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(7),
                D1=>i2c_mem_douta(7),
                S0=>extractoffsetparametersmux,
                O=>XLXN_581(7));
   
   XLXI_142_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(0),
                D1=>i2c_mem_douta(0),
                S0=>extractktaparametersmux,
                O=>XLXN_582(0));
   
   XLXI_142_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(1),
                D1=>i2c_mem_douta(1),
                S0=>extractktaparametersmux,
                O=>XLXN_582(1));
   
   XLXI_142_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(2),
                D1=>i2c_mem_douta(2),
                S0=>extractktaparametersmux,
                O=>XLXN_582(2));
   
   XLXI_142_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(3),
                D1=>i2c_mem_douta(3),
                S0=>extractktaparametersmux,
                O=>XLXN_582(3));
   
   XLXI_142_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(4),
                D1=>i2c_mem_douta(4),
                S0=>extractktaparametersmux,
                O=>XLXN_582(4));
   
   XLXI_142_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(5),
                D1=>i2c_mem_douta(5),
                S0=>extractktaparametersmux,
                O=>XLXN_582(5));
   
   XLXI_142_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(6),
                D1=>i2c_mem_douta(6),
                S0=>extractktaparametersmux,
                O=>XLXN_582(6));
   
   XLXI_142_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(7),
                D1=>i2c_mem_douta(7),
                S0=>extractktaparametersmux,
                O=>XLXN_582(7));
   
   XLXI_143_0 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(0),
                D1=>i2c_mem_douta(0),
                S0=>extractkvparametersmux,
                O=>XLXN_583(0));
   
   XLXI_143_1 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(1),
                D1=>i2c_mem_douta(1),
                S0=>extractkvparametersmux,
                O=>XLXN_583(1));
   
   XLXI_143_2 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(2),
                D1=>i2c_mem_douta(2),
                S0=>extractkvparametersmux,
                O=>XLXN_583(2));
   
   XLXI_143_3 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(3),
                D1=>i2c_mem_douta(3),
                S0=>extractkvparametersmux,
                O=>XLXN_583(3));
   
   XLXI_143_4 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(4),
                D1=>i2c_mem_douta(4),
                S0=>extractkvparametersmux,
                O=>XLXN_583(4));
   
   XLXI_143_5 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(5),
                D1=>i2c_mem_douta(5),
                S0=>extractkvparametersmux,
                O=>XLXN_583(5));
   
   XLXI_143_6 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(6),
                D1=>i2c_mem_douta(6),
                S0=>extractkvparametersmux,
                O=>XLXN_583(6));
   
   XLXI_143_7 : M2_1_MXILINX_CalculatePixOS
      port map (D0=>XLXN_589(7),
                D1=>i2c_mem_douta(7),
                S0=>extractkvparametersmux,
                O=>XLXN_583(7));
   
end BEHAVIORAL;


