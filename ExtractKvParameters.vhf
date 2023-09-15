--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ExtractKvParameters.vhf
-- /___/   /\     Timestamp : 09/15/2023 17:58:36
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/ExtractKvParameters.vhf -w /home/user/workspace/mlx90640_fpga/ExtractKvParameters.sch
--Design Name: ExtractKvParameters
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

entity M2_1_MXILINX_ExtractKvParameters is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_ExtractKvParameters;

architecture BEHAVIORAL of M2_1_MXILINX_ExtractKvParameters is
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

entity ExtractKvParameters is
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
end ExtractKvParameters;

architecture BEHAVIORAL of ExtractKvParameters is
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
   component colrow_even
      port ( col  : in    std_logic_vector (0 to 4); 
             row  : in    std_logic_vector (0 to 4); 
             cole : out   std_logic; 
             rowe : out   std_logic);
   end component;
   
   component M2_1_MXILINX_ExtractKvParameters
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
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
   
   component rom_signed4bit
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_unsigned4bit_2powx
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
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
   
   attribute HU_SET of extractkvparameters_MUX_ADDR_0 : label is 
         "extractkvparameters_MUX_ADDR_0_610";
   attribute HU_SET of extractkvparameters_MUX_ADDR_1 : label is 
         "extractkvparameters_MUX_ADDR_1_609";
   attribute HU_SET of extractkvparameters_MUX_ADDR_2 : label is 
         "extractkvparameters_MUX_ADDR_2_608";
   attribute HU_SET of extractkvparameters_MUX_ADDR_3 : label is 
         "extractkvparameters_MUX_ADDR_3_607";
   attribute HU_SET of extractkvparameters_MUX_ADDR_4 : label is 
         "extractkvparameters_MUX_ADDR_4_606";
   attribute HU_SET of extractkvparameters_MUX_ADDR_5 : label is 
         "extractkvparameters_MUX_ADDR_5_605";
   attribute HU_SET of extractkvparameters_MUX_ADDR_6 : label is 
         "extractkvparameters_MUX_ADDR_6_604";
   attribute HU_SET of extractkvparameters_MUX_ADDR_7 : label is 
         "extractkvparameters_MUX_ADDR_7_603";
   attribute HU_SET of extractkvparameters_MUX_ADDR_8 : label is 
         "extractkvparameters_MUX_ADDR_8_602";
   attribute HU_SET of extractkvparameters_MUX_ADDR_9 : label is 
         "extractkvparameters_MUX_ADDR_9_601";
   attribute HU_SET of extractkvparameters_MUX_DO_0 : label is 
         "extractkvparameters_MUX_DO_0_600";
   attribute HU_SET of extractkvparameters_MUX_DO_1 : label is 
         "extractkvparameters_MUX_DO_1_599";
   attribute HU_SET of extractkvparameters_MUX_DO_2 : label is 
         "extractkvparameters_MUX_DO_2_598";
   attribute HU_SET of extractkvparameters_MUX_DO_3 : label is 
         "extractkvparameters_MUX_DO_3_597";
   attribute HU_SET of extractkvparameters_MUX_DO_4 : label is 
         "extractkvparameters_MUX_DO_4_596";
   attribute HU_SET of extractkvparameters_MUX_DO_5 : label is 
         "extractkvparameters_MUX_DO_5_595";
   attribute HU_SET of extractkvparameters_MUX_DO_6 : label is 
         "extractkvparameters_MUX_DO_6_594";
   attribute HU_SET of extractkvparameters_MUX_DO_7 : label is 
         "extractkvparameters_MUX_DO_7_593";
   attribute HU_SET of extractkvparameters_MUX_DO_8 : label is 
         "extractkvparameters_MUX_DO_8_592";
   attribute HU_SET of extractkvparameters_MUX_DO_9 : label is 
         "extractkvparameters_MUX_DO_9_591";
   attribute HU_SET of extractkvparameters_MUX_DO_10 : label is 
         "extractkvparameters_MUX_DO_10_590";
   attribute HU_SET of extractkvparameters_MUX_DO_11 : label is 
         "extractkvparameters_MUX_DO_11_589";
   attribute HU_SET of extractkvparameters_MUX_DO_12 : label is 
         "extractkvparameters_MUX_DO_12_588";
   attribute HU_SET of extractkvparameters_MUX_DO_13 : label is 
         "extractkvparameters_MUX_DO_13_587";
   attribute HU_SET of extractkvparameters_MUX_DO_14 : label is 
         "extractkvparameters_MUX_DO_14_586";
   attribute HU_SET of extractkvparameters_MUX_DO_15 : label is 
         "extractkvparameters_MUX_DO_15_585";
   attribute HU_SET of extractkvparameters_MUX_DO_16 : label is 
         "extractkvparameters_MUX_DO_16_584";
   attribute HU_SET of extractkvparameters_MUX_DO_17 : label is 
         "extractkvparameters_MUX_DO_17_583";
   attribute HU_SET of extractkvparameters_MUX_DO_18 : label is 
         "extractkvparameters_MUX_DO_18_582";
   attribute HU_SET of extractkvparameters_MUX_DO_19 : label is 
         "extractkvparameters_MUX_DO_19_581";
   attribute HU_SET of extractkvparameters_MUX_DO_20 : label is 
         "extractkvparameters_MUX_DO_20_580";
   attribute HU_SET of extractkvparameters_MUX_DO_21 : label is 
         "extractkvparameters_MUX_DO_21_579";
   attribute HU_SET of extractkvparameters_MUX_DO_22 : label is 
         "extractkvparameters_MUX_DO_22_578";
   attribute HU_SET of extractkvparameters_MUX_DO_23 : label is 
         "extractkvparameters_MUX_DO_23_577";
   attribute HU_SET of extractkvparameters_MUX_DO_24 : label is 
         "extractkvparameters_MUX_DO_24_576";
   attribute HU_SET of extractkvparameters_MUX_DO_25 : label is 
         "extractkvparameters_MUX_DO_25_575";
   attribute HU_SET of extractkvparameters_MUX_DO_26 : label is 
         "extractkvparameters_MUX_DO_26_574";
   attribute HU_SET of extractkvparameters_MUX_DO_27 : label is 
         "extractkvparameters_MUX_DO_27_573";
   attribute HU_SET of extractkvparameters_MUX_DO_28 : label is 
         "extractkvparameters_MUX_DO_28_572";
   attribute HU_SET of extractkvparameters_MUX_DO_29 : label is 
         "extractkvparameters_MUX_DO_29_571";
   attribute HU_SET of extractkvparameters_MUX_DO_30 : label is 
         "extractkvparameters_MUX_DO_30_570";
   attribute HU_SET of extractkvparameters_MUX_DO_31 : label is 
         "extractkvparameters_MUX_DO_31_569";
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
begin
   o_rdy <= o_rdy_DUMMY;
   extractkvparameters_colrow_even : colrow_even
      port map (col(0 to 4)=>XLXN_189(0 to 4),
                row(0 to 4)=>XLXN_188(0 to 4),
                cole=>XLXN_187,
                rowe=>XLXN_186);
   
   extractkvparameters_MUX_ADDR_0 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_210(0),
                D1=>i_addr(0),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(0));
   
   extractkvparameters_MUX_ADDR_1 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_210(1),
                D1=>i_addr(1),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(1));
   
   extractkvparameters_MUX_ADDR_2 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_210(2),
                D1=>i_addr(2),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(2));
   
   extractkvparameters_MUX_ADDR_3 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_210(3),
                D1=>i_addr(3),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(3));
   
   extractkvparameters_MUX_ADDR_4 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_210(4),
                D1=>i_addr(4),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(4));
   
   extractkvparameters_MUX_ADDR_5 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_210(5),
                D1=>i_addr(5),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(5));
   
   extractkvparameters_MUX_ADDR_6 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_210(6),
                D1=>i_addr(6),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(6));
   
   extractkvparameters_MUX_ADDR_7 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_210(7),
                D1=>i_addr(7),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(7));
   
   extractkvparameters_MUX_ADDR_8 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_210(8),
                D1=>i_addr(8),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(8));
   
   extractkvparameters_MUX_ADDR_9 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_210(9),
                D1=>i_addr(9),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(9));
   
   extractkvparameters_MUX_DO_0 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(0),
                D1=>XLXN_78(0),
                S0=>mux_addr1(9),
                O=>o_do(0));
   
   extractkvparameters_MUX_DO_1 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(1),
                D1=>XLXN_78(1),
                S0=>mux_addr1(9),
                O=>o_do(1));
   
   extractkvparameters_MUX_DO_2 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(2),
                D1=>XLXN_78(2),
                S0=>mux_addr1(9),
                O=>o_do(2));
   
   extractkvparameters_MUX_DO_3 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(3),
                D1=>XLXN_78(3),
                S0=>mux_addr1(9),
                O=>o_do(3));
   
   extractkvparameters_MUX_DO_4 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(4),
                D1=>XLXN_78(4),
                S0=>mux_addr1(9),
                O=>o_do(4));
   
   extractkvparameters_MUX_DO_5 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(5),
                D1=>XLXN_78(5),
                S0=>mux_addr1(9),
                O=>o_do(5));
   
   extractkvparameters_MUX_DO_6 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(6),
                D1=>XLXN_78(6),
                S0=>mux_addr1(9),
                O=>o_do(6));
   
   extractkvparameters_MUX_DO_7 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(7),
                D1=>XLXN_78(7),
                S0=>mux_addr1(9),
                O=>o_do(7));
   
   extractkvparameters_MUX_DO_8 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(8),
                D1=>XLXN_78(8),
                S0=>mux_addr1(9),
                O=>o_do(8));
   
   extractkvparameters_MUX_DO_9 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(9),
                D1=>XLXN_78(9),
                S0=>mux_addr1(9),
                O=>o_do(9));
   
   extractkvparameters_MUX_DO_10 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(10),
                D1=>XLXN_78(10),
                S0=>mux_addr1(9),
                O=>o_do(10));
   
   extractkvparameters_MUX_DO_11 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(11),
                D1=>XLXN_78(11),
                S0=>mux_addr1(9),
                O=>o_do(11));
   
   extractkvparameters_MUX_DO_12 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(12),
                D1=>XLXN_78(12),
                S0=>mux_addr1(9),
                O=>o_do(12));
   
   extractkvparameters_MUX_DO_13 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(13),
                D1=>XLXN_78(13),
                S0=>mux_addr1(9),
                O=>o_do(13));
   
   extractkvparameters_MUX_DO_14 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(14),
                D1=>XLXN_78(14),
                S0=>mux_addr1(9),
                O=>o_do(14));
   
   extractkvparameters_MUX_DO_15 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(15),
                D1=>XLXN_78(15),
                S0=>mux_addr1(9),
                O=>o_do(15));
   
   extractkvparameters_MUX_DO_16 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(16),
                D1=>XLXN_78(16),
                S0=>mux_addr1(9),
                O=>o_do(16));
   
   extractkvparameters_MUX_DO_17 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(17),
                D1=>XLXN_78(17),
                S0=>mux_addr1(9),
                O=>o_do(17));
   
   extractkvparameters_MUX_DO_18 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(18),
                D1=>XLXN_78(18),
                S0=>mux_addr1(9),
                O=>o_do(18));
   
   extractkvparameters_MUX_DO_19 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(19),
                D1=>XLXN_78(19),
                S0=>mux_addr1(9),
                O=>o_do(19));
   
   extractkvparameters_MUX_DO_20 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(20),
                D1=>XLXN_78(20),
                S0=>mux_addr1(9),
                O=>o_do(20));
   
   extractkvparameters_MUX_DO_21 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(21),
                D1=>XLXN_78(21),
                S0=>mux_addr1(9),
                O=>o_do(21));
   
   extractkvparameters_MUX_DO_22 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(22),
                D1=>XLXN_78(22),
                S0=>mux_addr1(9),
                O=>o_do(22));
   
   extractkvparameters_MUX_DO_23 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(23),
                D1=>XLXN_78(23),
                S0=>mux_addr1(9),
                O=>o_do(23));
   
   extractkvparameters_MUX_DO_24 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(24),
                D1=>XLXN_78(24),
                S0=>mux_addr1(9),
                O=>o_do(24));
   
   extractkvparameters_MUX_DO_25 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(25),
                D1=>XLXN_78(25),
                S0=>mux_addr1(9),
                O=>o_do(25));
   
   extractkvparameters_MUX_DO_26 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(26),
                D1=>XLXN_78(26),
                S0=>mux_addr1(9),
                O=>o_do(26));
   
   extractkvparameters_MUX_DO_27 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(27),
                D1=>XLXN_78(27),
                S0=>mux_addr1(9),
                O=>o_do(27));
   
   extractkvparameters_MUX_DO_28 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(28),
                D1=>XLXN_78(28),
                S0=>mux_addr1(9),
                O=>o_do(28));
   
   extractkvparameters_MUX_DO_29 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(29),
                D1=>XLXN_78(29),
                S0=>mux_addr1(9),
                O=>o_do(29));
   
   extractkvparameters_MUX_DO_30 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(30),
                D1=>XLXN_78(30),
                S0=>mux_addr1(9),
                O=>o_do(30));
   
   extractkvparameters_MUX_DO_31 : M2_1_MXILINX_ExtractKvParameters
      port map (D0=>XLXN_79(31),
                D1=>XLXN_78(31),
                S0=>mux_addr1(9),
                O=>o_do(31));
   
   extractkvparameters_process_p1_inst : ExtractKvParameters_process_p1
      port map (cole=>XLXN_187,
                kvijee_ee(3 downto 0)=>XLXN_202(3 downto 0),
                kvijee_eo(3 downto 0)=>XLXN_204(3 downto 0),
                kvijee_oe(3 downto 0)=>XLXN_203(3 downto 0),
                kvijee_oo(3 downto 0)=>XLXN_205(3 downto 0),
                rowe=>XLXN_186,
                kvijee(3 downto 0)=>XLXN_209(3 downto 0));
   
   extractkvparameters_rom_signed4bit : rom_signed4bit
      port map (nibble_in(3 downto 0)=>XLXN_195(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_201(31 downto 0));
   
   extractkvparameters_rom_unsigned4bit_2powx : rom_unsigned4bit_2powx
      port map (nibble_in(3 downto 0)=>XLXN_194(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_200(31 downto 0));
   
   inst_extrkvparam_proc0_inst : ExtractKvParameters_process_p0
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
   
   mem_extrkvparam_1 : ramb16
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
   
   mem_extrkvparam_2 : ramb16
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
   
end BEHAVIORAL;


