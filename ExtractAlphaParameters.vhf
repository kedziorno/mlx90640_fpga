--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ExtractAlphaParameters.vhf
-- /___/   /\     Timestamp : 09/16/2023 16:10:28
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/ExtractAlphaParameters.vhf -w /home/user/workspace/mlx90640_fpga/ExtractAlphaParameters.sch
--Design Name: ExtractAlphaParameters
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

entity M2_1_MXILINX_ExtractAlphaParameters is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_ExtractAlphaParameters;

architecture BEHAVIORAL of M2_1_MXILINX_ExtractAlphaParameters is
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

entity ExtractAlphaParameters is
   port ( addfpr          : in    std_logic_vector (31 downto 0); 
          addfprdy        : in    std_logic; 
          divfpr          : in    std_logic_vector (31 downto 0); 
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
          o_doa           : out   std_logic_vector (31 downto 0); 
          o_done          : out   std_logic; 
          o_rdy           : out   std_logic);
end ExtractAlphaParameters;

architecture BEHAVIORAL of ExtractAlphaParameters is
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
   signal o_write_enable                      : std_logic;
   signal XLXN_1                              : std_logic_vector (31 downto 0);
   signal XLXN_2                              : std_logic_vector (31 downto 0);
   signal XLXN_3                              : std_logic_vector (31 downto 0);
   signal XLXN_6                              : std_logic_vector (3 downto 0);
   signal XLXN_7                              : std_logic_vector (3 downto 0);
   signal XLXN_8                              : std_logic_vector (3 downto 0);
   signal XLXN_9                              : std_logic_vector (3 downto 0);
   signal XLXN_10                             : std_logic_vector (5 downto 0);
   signal XLXN_20                             : std_logic_vector (31 downto 0);
   signal XLXN_21                             : std_logic_vector (31 downto 0);
   signal XLXN_26                             : std_logic_vector (9 downto 0);
   signal XLXN_35                             : std_logic_vector (31 downto 0);
   signal XLXN_37                             : std_logic;
   signal XLXN_38                             : std_logic_vector (31 downto 0);
   signal XLXN_78                             : std_logic_vector (3 downto 0);
   signal XLXN_94                             : std_logic_vector (9 downto 0);
   signal XLXN_98                             : std_logic;
   signal XLXN_108                            : std_logic_vector (14 downto 0);
   signal XLXN_110                            : std_logic_vector (14 downto 0);
   signal XLXN_114                            : std_logic_vector (31 downto 0);
   signal XLXN_116                            : std_logic;
   signal XLXN_117                            : std_logic_vector (31 downto 0);
   signal XLXN_118                            : std_logic_vector (31 downto 0);
   signal XLXN_119                            : std_logic_vector (31 downto 0);
   signal XLXN_141                            : std_logic_vector (31 downto 0);
   signal XLXN_142                            : std_logic_vector (31 downto 0);
   signal o_rdy_DUMMY                         : std_logic;
   signal inst_mem_acc1_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal inst_mem_acc1_CASCADEINA_openSignal : std_logic;
   signal inst_mem_acc1_CASCADEINB_openSignal : std_logic;
   signal inst_mem_acc1_CLKB_openSignal       : std_logic;
   signal inst_mem_acc1_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal inst_mem_acc1_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal inst_mem_acc1_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal inst_mem_acc1_ENB_openSignal        : std_logic;
   signal inst_mem_acc1_REGCEA_openSignal     : std_logic;
   signal inst_mem_acc1_REGCEB_openSignal     : std_logic;
   signal inst_mem_acc1_SSRB_openSignal       : std_logic;
   signal inst_mem_acc1_WEB_openSignal        : std_logic_vector (3 downto 0);
   signal inst_mem_acc2_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal inst_mem_acc2_CASCADEINA_openSignal : std_logic;
   signal inst_mem_acc2_CASCADEINB_openSignal : std_logic;
   signal inst_mem_acc2_CLKB_openSignal       : std_logic;
   signal inst_mem_acc2_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal inst_mem_acc2_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal inst_mem_acc2_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal inst_mem_acc2_ENB_openSignal        : std_logic;
   signal inst_mem_acc2_REGCEA_openSignal     : std_logic;
   signal inst_mem_acc2_REGCEB_openSignal     : std_logic;
   signal inst_mem_acc2_SSRB_openSignal       : std_logic;
   signal inst_mem_acc2_WEB_openSignal        : std_logic_vector (3 downto 0);
   component mux_addr
      port ( rdy      : in    std_logic; 
             addra    : in    std_logic_vector (9 downto 0); 
             i_addr   : in    std_logic_vector (9 downto 0); 
             mux_addr : out   std_logic_vector (9 downto 0));
   end component;
   
   component M2_1_MXILINX_ExtractAlphaParameters
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component ExtractAlphaParameters_process_p0
      port ( i_clock         : in    std_logic; 
             i_reset         : in    std_logic; 
             i_run           : in    std_logic; 
             fixed2floatrdy  : in    std_logic; 
             mulfprdy        : in    std_logic; 
             addfprdy        : in    std_logic; 
             divfprdy        : in    std_logic; 
             i2c_mem_douta   : in    std_logic_vector (7 downto 0); 
             i_doa           : in    std_logic_vector (31 downto 0); 
             i_addr          : in    std_logic_vector (9 downto 0); 
             nibble1_in      : in    std_logic_vector (31 downto 0); 
             nibble2_in      : in    std_logic_vector (31 downto 0); 
             nibble3_in      : in    std_logic_vector (31 downto 0); 
             nibble4_in      : in    std_logic_vector (31 downto 0); 
             nibble5_in      : in    std_logic_vector (31 downto 0); 
             fixed2floatr    : in    std_logic_vector (31 downto 0); 
             mulfpr          : in    std_logic_vector (31 downto 0); 
             addfpr          : in    std_logic_vector (31 downto 0); 
             divfpr          : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena     : out   std_logic; 
             o_done          : out   std_logic; 
             o_rdy           : out   std_logic; 
             o_write_enable  : out   std_logic; 
             fixed2floatond  : out   std_logic; 
             fixed2floatsclr : out   std_logic; 
             fixed2floatce   : out   std_logic; 
             mulfpond        : out   std_logic; 
             mulfpsclr       : out   std_logic; 
             mulfpce         : out   std_logic; 
             addfpond        : out   std_logic; 
             addfpsclr       : out   std_logic; 
             addfpce         : out   std_logic; 
             divfpond        : out   std_logic; 
             divfpsclr       : out   std_logic; 
             divfpce         : out   std_logic; 
             i2c_mem_addra   : out   std_logic_vector (11 downto 0); 
             o_dia           : out   std_logic_vector (31 downto 0); 
             o_do            : out   std_logic_vector (31 downto 0); 
             o_addra         : out   std_logic_vector (9 downto 0); 
             nibble1_out     : out   std_logic_vector (3 downto 0); 
             nibble2_out     : out   std_logic_vector (3 downto 0); 
             nibble4_out     : out   std_logic_vector (3 downto 0); 
             nibble5_out     : out   std_logic_vector (3 downto 0); 
             nibble3_out     : out   std_logic_vector (5 downto 0); 
             fixed2floata    : out   std_logic_vector (63 downto 0); 
             mulfpa          : out   std_logic_vector (31 downto 0); 
             mulfpb          : out   std_logic_vector (31 downto 0); 
             addfpa          : out   std_logic_vector (31 downto 0); 
             addfpb          : out   std_logic_vector (31 downto 0); 
             divfpa          : out   std_logic_vector (31 downto 0); 
             divfpb          : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_alphascale
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
   
   component rom_unsigned4bit
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_unsigned4bit_2powx
      port ( nibble_in  : in    std_logic_vector (3 downto 0); 
             nibble_out : out   std_logic_vector (31 downto 0));
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
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of extractalphaparameters_MUX_DIA_0 : label is 
         "extractalphaparameters_MUX_DIA_0_1292";
   attribute HU_SET of extractalphaparameters_MUX_DIA_1 : label is 
         "extractalphaparameters_MUX_DIA_1_1291";
   attribute HU_SET of extractalphaparameters_MUX_DIA_2 : label is 
         "extractalphaparameters_MUX_DIA_2_1290";
   attribute HU_SET of extractalphaparameters_MUX_DIA_3 : label is 
         "extractalphaparameters_MUX_DIA_3_1289";
   attribute HU_SET of extractalphaparameters_MUX_DIA_4 : label is 
         "extractalphaparameters_MUX_DIA_4_1288";
   attribute HU_SET of extractalphaparameters_MUX_DIA_5 : label is 
         "extractalphaparameters_MUX_DIA_5_1287";
   attribute HU_SET of extractalphaparameters_MUX_DIA_6 : label is 
         "extractalphaparameters_MUX_DIA_6_1286";
   attribute HU_SET of extractalphaparameters_MUX_DIA_7 : label is 
         "extractalphaparameters_MUX_DIA_7_1285";
   attribute HU_SET of extractalphaparameters_MUX_DIA_8 : label is 
         "extractalphaparameters_MUX_DIA_8_1284";
   attribute HU_SET of extractalphaparameters_MUX_DIA_9 : label is 
         "extractalphaparameters_MUX_DIA_9_1283";
   attribute HU_SET of extractalphaparameters_MUX_DIA_10 : label is 
         "extractalphaparameters_MUX_DIA_10_1282";
   attribute HU_SET of extractalphaparameters_MUX_DIA_11 : label is 
         "extractalphaparameters_MUX_DIA_11_1281";
   attribute HU_SET of extractalphaparameters_MUX_DIA_12 : label is 
         "extractalphaparameters_MUX_DIA_12_1280";
   attribute HU_SET of extractalphaparameters_MUX_DIA_13 : label is 
         "extractalphaparameters_MUX_DIA_13_1279";
   attribute HU_SET of extractalphaparameters_MUX_DIA_14 : label is 
         "extractalphaparameters_MUX_DIA_14_1278";
   attribute HU_SET of extractalphaparameters_MUX_DIA_15 : label is 
         "extractalphaparameters_MUX_DIA_15_1277";
   attribute HU_SET of extractalphaparameters_MUX_DIA_16 : label is 
         "extractalphaparameters_MUX_DIA_16_1276";
   attribute HU_SET of extractalphaparameters_MUX_DIA_17 : label is 
         "extractalphaparameters_MUX_DIA_17_1275";
   attribute HU_SET of extractalphaparameters_MUX_DIA_18 : label is 
         "extractalphaparameters_MUX_DIA_18_1274";
   attribute HU_SET of extractalphaparameters_MUX_DIA_19 : label is 
         "extractalphaparameters_MUX_DIA_19_1273";
   attribute HU_SET of extractalphaparameters_MUX_DIA_20 : label is 
         "extractalphaparameters_MUX_DIA_20_1272";
   attribute HU_SET of extractalphaparameters_MUX_DIA_21 : label is 
         "extractalphaparameters_MUX_DIA_21_1271";
   attribute HU_SET of extractalphaparameters_MUX_DIA_22 : label is 
         "extractalphaparameters_MUX_DIA_22_1270";
   attribute HU_SET of extractalphaparameters_MUX_DIA_23 : label is 
         "extractalphaparameters_MUX_DIA_23_1269";
   attribute HU_SET of extractalphaparameters_MUX_DIA_24 : label is 
         "extractalphaparameters_MUX_DIA_24_1268";
   attribute HU_SET of extractalphaparameters_MUX_DIA_25 : label is 
         "extractalphaparameters_MUX_DIA_25_1267";
   attribute HU_SET of extractalphaparameters_MUX_DIA_26 : label is 
         "extractalphaparameters_MUX_DIA_26_1266";
   attribute HU_SET of extractalphaparameters_MUX_DIA_27 : label is 
         "extractalphaparameters_MUX_DIA_27_1265";
   attribute HU_SET of extractalphaparameters_MUX_DIA_28 : label is 
         "extractalphaparameters_MUX_DIA_28_1264";
   attribute HU_SET of extractalphaparameters_MUX_DIA_29 : label is 
         "extractalphaparameters_MUX_DIA_29_1263";
   attribute HU_SET of extractalphaparameters_MUX_DIA_30 : label is 
         "extractalphaparameters_MUX_DIA_30_1262";
   attribute HU_SET of extractalphaparameters_MUX_DIA_31 : label is 
         "extractalphaparameters_MUX_DIA_31_1261";
   attribute HU_SET of extractalphaparameters_MUX_DOA_0 : label is 
         "extractalphaparameters_MUX_DOA_0_1356";
   attribute HU_SET of extractalphaparameters_MUX_DOA_1 : label is 
         "extractalphaparameters_MUX_DOA_1_1355";
   attribute HU_SET of extractalphaparameters_MUX_DOA_2 : label is 
         "extractalphaparameters_MUX_DOA_2_1354";
   attribute HU_SET of extractalphaparameters_MUX_DOA_3 : label is 
         "extractalphaparameters_MUX_DOA_3_1353";
   attribute HU_SET of extractalphaparameters_MUX_DOA_4 : label is 
         "extractalphaparameters_MUX_DOA_4_1352";
   attribute HU_SET of extractalphaparameters_MUX_DOA_5 : label is 
         "extractalphaparameters_MUX_DOA_5_1351";
   attribute HU_SET of extractalphaparameters_MUX_DOA_6 : label is 
         "extractalphaparameters_MUX_DOA_6_1350";
   attribute HU_SET of extractalphaparameters_MUX_DOA_7 : label is 
         "extractalphaparameters_MUX_DOA_7_1349";
   attribute HU_SET of extractalphaparameters_MUX_DOA_8 : label is 
         "extractalphaparameters_MUX_DOA_8_1348";
   attribute HU_SET of extractalphaparameters_MUX_DOA_9 : label is 
         "extractalphaparameters_MUX_DOA_9_1347";
   attribute HU_SET of extractalphaparameters_MUX_DOA_10 : label is 
         "extractalphaparameters_MUX_DOA_10_1346";
   attribute HU_SET of extractalphaparameters_MUX_DOA_11 : label is 
         "extractalphaparameters_MUX_DOA_11_1345";
   attribute HU_SET of extractalphaparameters_MUX_DOA_12 : label is 
         "extractalphaparameters_MUX_DOA_12_1344";
   attribute HU_SET of extractalphaparameters_MUX_DOA_13 : label is 
         "extractalphaparameters_MUX_DOA_13_1343";
   attribute HU_SET of extractalphaparameters_MUX_DOA_14 : label is 
         "extractalphaparameters_MUX_DOA_14_1342";
   attribute HU_SET of extractalphaparameters_MUX_DOA_15 : label is 
         "extractalphaparameters_MUX_DOA_15_1341";
   attribute HU_SET of extractalphaparameters_MUX_DOA_16 : label is 
         "extractalphaparameters_MUX_DOA_16_1340";
   attribute HU_SET of extractalphaparameters_MUX_DOA_17 : label is 
         "extractalphaparameters_MUX_DOA_17_1339";
   attribute HU_SET of extractalphaparameters_MUX_DOA_18 : label is 
         "extractalphaparameters_MUX_DOA_18_1338";
   attribute HU_SET of extractalphaparameters_MUX_DOA_19 : label is 
         "extractalphaparameters_MUX_DOA_19_1337";
   attribute HU_SET of extractalphaparameters_MUX_DOA_20 : label is 
         "extractalphaparameters_MUX_DOA_20_1336";
   attribute HU_SET of extractalphaparameters_MUX_DOA_21 : label is 
         "extractalphaparameters_MUX_DOA_21_1335";
   attribute HU_SET of extractalphaparameters_MUX_DOA_22 : label is 
         "extractalphaparameters_MUX_DOA_22_1334";
   attribute HU_SET of extractalphaparameters_MUX_DOA_23 : label is 
         "extractalphaparameters_MUX_DOA_23_1333";
   attribute HU_SET of extractalphaparameters_MUX_DOA_24 : label is 
         "extractalphaparameters_MUX_DOA_24_1332";
   attribute HU_SET of extractalphaparameters_MUX_DOA_25 : label is 
         "extractalphaparameters_MUX_DOA_25_1331";
   attribute HU_SET of extractalphaparameters_MUX_DOA_26 : label is 
         "extractalphaparameters_MUX_DOA_26_1330";
   attribute HU_SET of extractalphaparameters_MUX_DOA_27 : label is 
         "extractalphaparameters_MUX_DOA_27_1329";
   attribute HU_SET of extractalphaparameters_MUX_DOA_28 : label is 
         "extractalphaparameters_MUX_DOA_28_1328";
   attribute HU_SET of extractalphaparameters_MUX_DOA_29 : label is 
         "extractalphaparameters_MUX_DOA_29_1327";
   attribute HU_SET of extractalphaparameters_MUX_DOA_30 : label is 
         "extractalphaparameters_MUX_DOA_30_1326";
   attribute HU_SET of extractalphaparameters_MUX_DOA_31 : label is 
         "extractalphaparameters_MUX_DOA_31_1325";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_0 : label is 
         "extractalphaparameters_MUX_DO_half1_0_1324";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_1 : label is 
         "extractalphaparameters_MUX_DO_half1_1_1323";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_2 : label is 
         "extractalphaparameters_MUX_DO_half1_2_1322";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_3 : label is 
         "extractalphaparameters_MUX_DO_half1_3_1321";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_4 : label is 
         "extractalphaparameters_MUX_DO_half1_4_1320";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_5 : label is 
         "extractalphaparameters_MUX_DO_half1_5_1319";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_6 : label is 
         "extractalphaparameters_MUX_DO_half1_6_1318";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_7 : label is 
         "extractalphaparameters_MUX_DO_half1_7_1317";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_8 : label is 
         "extractalphaparameters_MUX_DO_half1_8_1316";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_9 : label is 
         "extractalphaparameters_MUX_DO_half1_9_1315";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_10 : label is 
         "extractalphaparameters_MUX_DO_half1_10_1314";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_11 : label is 
         "extractalphaparameters_MUX_DO_half1_11_1313";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_12 : label is 
         "extractalphaparameters_MUX_DO_half1_12_1312";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_13 : label is 
         "extractalphaparameters_MUX_DO_half1_13_1311";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_14 : label is 
         "extractalphaparameters_MUX_DO_half1_14_1310";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_15 : label is 
         "extractalphaparameters_MUX_DO_half1_15_1309";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_16 : label is 
         "extractalphaparameters_MUX_DO_half1_16_1308";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_17 : label is 
         "extractalphaparameters_MUX_DO_half1_17_1307";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_18 : label is 
         "extractalphaparameters_MUX_DO_half1_18_1306";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_19 : label is 
         "extractalphaparameters_MUX_DO_half1_19_1305";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_20 : label is 
         "extractalphaparameters_MUX_DO_half1_20_1304";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_21 : label is 
         "extractalphaparameters_MUX_DO_half1_21_1303";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_22 : label is 
         "extractalphaparameters_MUX_DO_half1_22_1302";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_23 : label is 
         "extractalphaparameters_MUX_DO_half1_23_1301";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_24 : label is 
         "extractalphaparameters_MUX_DO_half1_24_1300";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_25 : label is 
         "extractalphaparameters_MUX_DO_half1_25_1299";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_26 : label is 
         "extractalphaparameters_MUX_DO_half1_26_1298";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_27 : label is 
         "extractalphaparameters_MUX_DO_half1_27_1297";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_28 : label is 
         "extractalphaparameters_MUX_DO_half1_28_1296";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_29 : label is 
         "extractalphaparameters_MUX_DO_half1_29_1295";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_30 : label is 
         "extractalphaparameters_MUX_DO_half1_30_1294";
   attribute HU_SET of extractalphaparameters_MUX_DO_half1_31 : label is 
         "extractalphaparameters_MUX_DO_half1_31_1293";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_0 : label is 
         "extractalphaparameters_MUX_DO_half2_0_1388";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_1 : label is 
         "extractalphaparameters_MUX_DO_half2_1_1387";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_2 : label is 
         "extractalphaparameters_MUX_DO_half2_2_1386";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_3 : label is 
         "extractalphaparameters_MUX_DO_half2_3_1385";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_4 : label is 
         "extractalphaparameters_MUX_DO_half2_4_1384";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_5 : label is 
         "extractalphaparameters_MUX_DO_half2_5_1383";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_6 : label is 
         "extractalphaparameters_MUX_DO_half2_6_1382";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_7 : label is 
         "extractalphaparameters_MUX_DO_half2_7_1381";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_8 : label is 
         "extractalphaparameters_MUX_DO_half2_8_1380";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_9 : label is 
         "extractalphaparameters_MUX_DO_half2_9_1379";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_10 : label is 
         "extractalphaparameters_MUX_DO_half2_10_1378";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_11 : label is 
         "extractalphaparameters_MUX_DO_half2_11_1377";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_12 : label is 
         "extractalphaparameters_MUX_DO_half2_12_1376";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_13 : label is 
         "extractalphaparameters_MUX_DO_half2_13_1375";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_14 : label is 
         "extractalphaparameters_MUX_DO_half2_14_1374";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_15 : label is 
         "extractalphaparameters_MUX_DO_half2_15_1373";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_16 : label is 
         "extractalphaparameters_MUX_DO_half2_16_1372";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_17 : label is 
         "extractalphaparameters_MUX_DO_half2_17_1371";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_18 : label is 
         "extractalphaparameters_MUX_DO_half2_18_1370";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_19 : label is 
         "extractalphaparameters_MUX_DO_half2_19_1369";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_20 : label is 
         "extractalphaparameters_MUX_DO_half2_20_1368";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_21 : label is 
         "extractalphaparameters_MUX_DO_half2_21_1367";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_22 : label is 
         "extractalphaparameters_MUX_DO_half2_22_1366";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_23 : label is 
         "extractalphaparameters_MUX_DO_half2_23_1365";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_24 : label is 
         "extractalphaparameters_MUX_DO_half2_24_1364";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_25 : label is 
         "extractalphaparameters_MUX_DO_half2_25_1363";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_26 : label is 
         "extractalphaparameters_MUX_DO_half2_26_1362";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_27 : label is 
         "extractalphaparameters_MUX_DO_half2_27_1361";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_28 : label is 
         "extractalphaparameters_MUX_DO_half2_28_1360";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_29 : label is 
         "extractalphaparameters_MUX_DO_half2_29_1359";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_30 : label is 
         "extractalphaparameters_MUX_DO_half2_30_1358";
   attribute HU_SET of extractalphaparameters_MUX_DO_half2_31 : label is 
         "extractalphaparameters_MUX_DO_half2_31_1357";
   attribute HU_SET of extractalphaparameters_MUX_DO_0 : label is 
         "extractalphaparameters_MUX_DO_0_1420";
   attribute HU_SET of extractalphaparameters_MUX_DO_1 : label is 
         "extractalphaparameters_MUX_DO_1_1419";
   attribute HU_SET of extractalphaparameters_MUX_DO_2 : label is 
         "extractalphaparameters_MUX_DO_2_1418";
   attribute HU_SET of extractalphaparameters_MUX_DO_3 : label is 
         "extractalphaparameters_MUX_DO_3_1417";
   attribute HU_SET of extractalphaparameters_MUX_DO_4 : label is 
         "extractalphaparameters_MUX_DO_4_1416";
   attribute HU_SET of extractalphaparameters_MUX_DO_5 : label is 
         "extractalphaparameters_MUX_DO_5_1415";
   attribute HU_SET of extractalphaparameters_MUX_DO_6 : label is 
         "extractalphaparameters_MUX_DO_6_1414";
   attribute HU_SET of extractalphaparameters_MUX_DO_7 : label is 
         "extractalphaparameters_MUX_DO_7_1413";
   attribute HU_SET of extractalphaparameters_MUX_DO_8 : label is 
         "extractalphaparameters_MUX_DO_8_1412";
   attribute HU_SET of extractalphaparameters_MUX_DO_9 : label is 
         "extractalphaparameters_MUX_DO_9_1411";
   attribute HU_SET of extractalphaparameters_MUX_DO_10 : label is 
         "extractalphaparameters_MUX_DO_10_1410";
   attribute HU_SET of extractalphaparameters_MUX_DO_11 : label is 
         "extractalphaparameters_MUX_DO_11_1409";
   attribute HU_SET of extractalphaparameters_MUX_DO_12 : label is 
         "extractalphaparameters_MUX_DO_12_1408";
   attribute HU_SET of extractalphaparameters_MUX_DO_13 : label is 
         "extractalphaparameters_MUX_DO_13_1407";
   attribute HU_SET of extractalphaparameters_MUX_DO_14 : label is 
         "extractalphaparameters_MUX_DO_14_1406";
   attribute HU_SET of extractalphaparameters_MUX_DO_15 : label is 
         "extractalphaparameters_MUX_DO_15_1405";
   attribute HU_SET of extractalphaparameters_MUX_DO_16 : label is 
         "extractalphaparameters_MUX_DO_16_1404";
   attribute HU_SET of extractalphaparameters_MUX_DO_17 : label is 
         "extractalphaparameters_MUX_DO_17_1403";
   attribute HU_SET of extractalphaparameters_MUX_DO_18 : label is 
         "extractalphaparameters_MUX_DO_18_1402";
   attribute HU_SET of extractalphaparameters_MUX_DO_19 : label is 
         "extractalphaparameters_MUX_DO_19_1401";
   attribute HU_SET of extractalphaparameters_MUX_DO_20 : label is 
         "extractalphaparameters_MUX_DO_20_1400";
   attribute HU_SET of extractalphaparameters_MUX_DO_21 : label is 
         "extractalphaparameters_MUX_DO_21_1399";
   attribute HU_SET of extractalphaparameters_MUX_DO_22 : label is 
         "extractalphaparameters_MUX_DO_22_1398";
   attribute HU_SET of extractalphaparameters_MUX_DO_23 : label is 
         "extractalphaparameters_MUX_DO_23_1397";
   attribute HU_SET of extractalphaparameters_MUX_DO_24 : label is 
         "extractalphaparameters_MUX_DO_24_1396";
   attribute HU_SET of extractalphaparameters_MUX_DO_25 : label is 
         "extractalphaparameters_MUX_DO_25_1395";
   attribute HU_SET of extractalphaparameters_MUX_DO_26 : label is 
         "extractalphaparameters_MUX_DO_26_1394";
   attribute HU_SET of extractalphaparameters_MUX_DO_27 : label is 
         "extractalphaparameters_MUX_DO_27_1393";
   attribute HU_SET of extractalphaparameters_MUX_DO_28 : label is 
         "extractalphaparameters_MUX_DO_28_1392";
   attribute HU_SET of extractalphaparameters_MUX_DO_29 : label is 
         "extractalphaparameters_MUX_DO_29_1391";
   attribute HU_SET of extractalphaparameters_MUX_DO_30 : label is 
         "extractalphaparameters_MUX_DO_30_1390";
   attribute HU_SET of extractalphaparameters_MUX_DO_31 : label is 
         "extractalphaparameters_MUX_DO_31_1389";
   attribute WRITE_WIDTH_B of inst_mem_acc1 : label is "36";
   attribute WRITE_WIDTH_A of inst_mem_acc1 : label is "36";
   attribute WRITE_MODE_B of inst_mem_acc1 : label is "READ_FIRST";
   attribute WRITE_MODE_A of inst_mem_acc1 : label is "READ_FIRST";
   attribute READ_WIDTH_B of inst_mem_acc1 : label is "36";
   attribute READ_WIDTH_A of inst_mem_acc1 : label is "36";
   attribute WRITE_WIDTH_B of inst_mem_acc2 : label is "36";
   attribute WRITE_WIDTH_A of inst_mem_acc2 : label is "36";
   attribute WRITE_MODE_B of inst_mem_acc2 : label is "READ_FIRST";
   attribute WRITE_MODE_A of inst_mem_acc2 : label is "READ_FIRST";
   attribute READ_WIDTH_B of inst_mem_acc2 : label is "36";
   attribute READ_WIDTH_A of inst_mem_acc2 : label is "36";
begin
   XLXN_20(31 downto 0) <= x"22000000";
   XLXN_37 <= '0';
   XLXN_116 <= '0';
   o_rdy <= o_rdy_DUMMY;
   extractalphaparameters_MUX_ADDR : mux_addr
      port map (addra(9 downto 0)=>XLXN_26(9 downto 0),
                i_addr(9 downto 0)=>i_addr(9 downto 0),
                rdy=>o_rdy_DUMMY,
                mux_addr(9 downto 0)=>XLXN_94(9 downto 0));
   
   extractalphaparameters_MUX_DIA_0 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(0),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(0));
   
   extractalphaparameters_MUX_DIA_1 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(1),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(1));
   
   extractalphaparameters_MUX_DIA_2 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(2),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(2));
   
   extractalphaparameters_MUX_DIA_3 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(3),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(3));
   
   extractalphaparameters_MUX_DIA_4 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(4),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(4));
   
   extractalphaparameters_MUX_DIA_5 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(5),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(5));
   
   extractalphaparameters_MUX_DIA_6 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(6),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(6));
   
   extractalphaparameters_MUX_DIA_7 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(7),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(7));
   
   extractalphaparameters_MUX_DIA_8 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(8),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(8));
   
   extractalphaparameters_MUX_DIA_9 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(9),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(9));
   
   extractalphaparameters_MUX_DIA_10 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(10),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(10));
   
   extractalphaparameters_MUX_DIA_11 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(11),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(11));
   
   extractalphaparameters_MUX_DIA_12 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(12),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(12));
   
   extractalphaparameters_MUX_DIA_13 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(13),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(13));
   
   extractalphaparameters_MUX_DIA_14 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(14),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(14));
   
   extractalphaparameters_MUX_DIA_15 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(15),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(15));
   
   extractalphaparameters_MUX_DIA_16 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(16),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(16));
   
   extractalphaparameters_MUX_DIA_17 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(17),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(17));
   
   extractalphaparameters_MUX_DIA_18 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(18),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(18));
   
   extractalphaparameters_MUX_DIA_19 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(19),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(19));
   
   extractalphaparameters_MUX_DIA_20 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(20),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(20));
   
   extractalphaparameters_MUX_DIA_21 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(21),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(21));
   
   extractalphaparameters_MUX_DIA_22 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(22),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(22));
   
   extractalphaparameters_MUX_DIA_23 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(23),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(23));
   
   extractalphaparameters_MUX_DIA_24 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(24),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(24));
   
   extractalphaparameters_MUX_DIA_25 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(25),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(25));
   
   extractalphaparameters_MUX_DIA_26 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(26),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(26));
   
   extractalphaparameters_MUX_DIA_27 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(27),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(27));
   
   extractalphaparameters_MUX_DIA_28 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(28),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(28));
   
   extractalphaparameters_MUX_DIA_29 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(29),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(29));
   
   extractalphaparameters_MUX_DIA_30 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(30),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(30));
   
   extractalphaparameters_MUX_DIA_31 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_38(31),
                D1=>XLXN_37,
                S0=>o_rdy_DUMMY,
                O=>XLXN_35(31));
   
   extractalphaparameters_MUX_DOA_0 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(0),
                D1=>XLXN_117(0),
                S0=>XLXN_94(9),
                O=>XLXN_21(0));
   
   extractalphaparameters_MUX_DOA_1 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(1),
                D1=>XLXN_117(1),
                S0=>XLXN_94(9),
                O=>XLXN_21(1));
   
   extractalphaparameters_MUX_DOA_2 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(2),
                D1=>XLXN_117(2),
                S0=>XLXN_94(9),
                O=>XLXN_21(2));
   
   extractalphaparameters_MUX_DOA_3 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(3),
                D1=>XLXN_117(3),
                S0=>XLXN_94(9),
                O=>XLXN_21(3));
   
   extractalphaparameters_MUX_DOA_4 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(4),
                D1=>XLXN_117(4),
                S0=>XLXN_94(9),
                O=>XLXN_21(4));
   
   extractalphaparameters_MUX_DOA_5 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(5),
                D1=>XLXN_117(5),
                S0=>XLXN_94(9),
                O=>XLXN_21(5));
   
   extractalphaparameters_MUX_DOA_6 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(6),
                D1=>XLXN_117(6),
                S0=>XLXN_94(9),
                O=>XLXN_21(6));
   
   extractalphaparameters_MUX_DOA_7 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(7),
                D1=>XLXN_117(7),
                S0=>XLXN_94(9),
                O=>XLXN_21(7));
   
   extractalphaparameters_MUX_DOA_8 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(8),
                D1=>XLXN_117(8),
                S0=>XLXN_94(9),
                O=>XLXN_21(8));
   
   extractalphaparameters_MUX_DOA_9 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(9),
                D1=>XLXN_117(9),
                S0=>XLXN_94(9),
                O=>XLXN_21(9));
   
   extractalphaparameters_MUX_DOA_10 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(10),
                D1=>XLXN_117(10),
                S0=>XLXN_94(9),
                O=>XLXN_21(10));
   
   extractalphaparameters_MUX_DOA_11 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(11),
                D1=>XLXN_117(11),
                S0=>XLXN_94(9),
                O=>XLXN_21(11));
   
   extractalphaparameters_MUX_DOA_12 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(12),
                D1=>XLXN_117(12),
                S0=>XLXN_94(9),
                O=>XLXN_21(12));
   
   extractalphaparameters_MUX_DOA_13 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(13),
                D1=>XLXN_117(13),
                S0=>XLXN_94(9),
                O=>XLXN_21(13));
   
   extractalphaparameters_MUX_DOA_14 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(14),
                D1=>XLXN_117(14),
                S0=>XLXN_94(9),
                O=>XLXN_21(14));
   
   extractalphaparameters_MUX_DOA_15 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(15),
                D1=>XLXN_117(15),
                S0=>XLXN_94(9),
                O=>XLXN_21(15));
   
   extractalphaparameters_MUX_DOA_16 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(16),
                D1=>XLXN_117(16),
                S0=>XLXN_94(9),
                O=>XLXN_21(16));
   
   extractalphaparameters_MUX_DOA_17 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(17),
                D1=>XLXN_117(17),
                S0=>XLXN_94(9),
                O=>XLXN_21(17));
   
   extractalphaparameters_MUX_DOA_18 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(18),
                D1=>XLXN_117(18),
                S0=>XLXN_94(9),
                O=>XLXN_21(18));
   
   extractalphaparameters_MUX_DOA_19 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(19),
                D1=>XLXN_117(19),
                S0=>XLXN_94(9),
                O=>XLXN_21(19));
   
   extractalphaparameters_MUX_DOA_20 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(20),
                D1=>XLXN_117(20),
                S0=>XLXN_94(9),
                O=>XLXN_21(20));
   
   extractalphaparameters_MUX_DOA_21 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(21),
                D1=>XLXN_117(21),
                S0=>XLXN_94(9),
                O=>XLXN_21(21));
   
   extractalphaparameters_MUX_DOA_22 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(22),
                D1=>XLXN_117(22),
                S0=>XLXN_94(9),
                O=>XLXN_21(22));
   
   extractalphaparameters_MUX_DOA_23 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(23),
                D1=>XLXN_117(23),
                S0=>XLXN_94(9),
                O=>XLXN_21(23));
   
   extractalphaparameters_MUX_DOA_24 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(24),
                D1=>XLXN_117(24),
                S0=>XLXN_94(9),
                O=>XLXN_21(24));
   
   extractalphaparameters_MUX_DOA_25 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(25),
                D1=>XLXN_117(25),
                S0=>XLXN_94(9),
                O=>XLXN_21(25));
   
   extractalphaparameters_MUX_DOA_26 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(26),
                D1=>XLXN_117(26),
                S0=>XLXN_94(9),
                O=>XLXN_21(26));
   
   extractalphaparameters_MUX_DOA_27 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(27),
                D1=>XLXN_117(27),
                S0=>XLXN_94(9),
                O=>XLXN_21(27));
   
   extractalphaparameters_MUX_DOA_28 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(28),
                D1=>XLXN_117(28),
                S0=>XLXN_94(9),
                O=>XLXN_21(28));
   
   extractalphaparameters_MUX_DOA_29 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(29),
                D1=>XLXN_117(29),
                S0=>XLXN_94(9),
                O=>XLXN_21(29));
   
   extractalphaparameters_MUX_DOA_30 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(30),
                D1=>XLXN_117(30),
                S0=>XLXN_94(9),
                O=>XLXN_21(30));
   
   extractalphaparameters_MUX_DOA_31 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_114(31),
                D1=>XLXN_117(31),
                S0=>XLXN_94(9),
                O=>XLXN_21(31));
   
   extractalphaparameters_MUX_DO_half1_0 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(0),
                D1=>XLXN_114(0),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(0));
   
   extractalphaparameters_MUX_DO_half1_1 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(1),
                D1=>XLXN_114(1),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(1));
   
   extractalphaparameters_MUX_DO_half1_2 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(2),
                D1=>XLXN_114(2),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(2));
   
   extractalphaparameters_MUX_DO_half1_3 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(3),
                D1=>XLXN_114(3),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(3));
   
   extractalphaparameters_MUX_DO_half1_4 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(4),
                D1=>XLXN_114(4),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(4));
   
   extractalphaparameters_MUX_DO_half1_5 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(5),
                D1=>XLXN_114(5),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(5));
   
   extractalphaparameters_MUX_DO_half1_6 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(6),
                D1=>XLXN_114(6),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(6));
   
   extractalphaparameters_MUX_DO_half1_7 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(7),
                D1=>XLXN_114(7),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(7));
   
   extractalphaparameters_MUX_DO_half1_8 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(8),
                D1=>XLXN_114(8),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(8));
   
   extractalphaparameters_MUX_DO_half1_9 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(9),
                D1=>XLXN_114(9),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(9));
   
   extractalphaparameters_MUX_DO_half1_10 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(10),
                D1=>XLXN_114(10),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(10));
   
   extractalphaparameters_MUX_DO_half1_11 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(11),
                D1=>XLXN_114(11),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(11));
   
   extractalphaparameters_MUX_DO_half1_12 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(12),
                D1=>XLXN_114(12),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(12));
   
   extractalphaparameters_MUX_DO_half1_13 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(13),
                D1=>XLXN_114(13),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(13));
   
   extractalphaparameters_MUX_DO_half1_14 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(14),
                D1=>XLXN_114(14),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(14));
   
   extractalphaparameters_MUX_DO_half1_15 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(15),
                D1=>XLXN_114(15),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(15));
   
   extractalphaparameters_MUX_DO_half1_16 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(16),
                D1=>XLXN_114(16),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(16));
   
   extractalphaparameters_MUX_DO_half1_17 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(17),
                D1=>XLXN_114(17),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(17));
   
   extractalphaparameters_MUX_DO_half1_18 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(18),
                D1=>XLXN_114(18),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(18));
   
   extractalphaparameters_MUX_DO_half1_19 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(19),
                D1=>XLXN_114(19),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(19));
   
   extractalphaparameters_MUX_DO_half1_20 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(20),
                D1=>XLXN_114(20),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(20));
   
   extractalphaparameters_MUX_DO_half1_21 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(21),
                D1=>XLXN_114(21),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(21));
   
   extractalphaparameters_MUX_DO_half1_22 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(22),
                D1=>XLXN_114(22),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(22));
   
   extractalphaparameters_MUX_DO_half1_23 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(23),
                D1=>XLXN_114(23),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(23));
   
   extractalphaparameters_MUX_DO_half1_24 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(24),
                D1=>XLXN_114(24),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(24));
   
   extractalphaparameters_MUX_DO_half1_25 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(25),
                D1=>XLXN_114(25),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(25));
   
   extractalphaparameters_MUX_DO_half1_26 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(26),
                D1=>XLXN_114(26),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(26));
   
   extractalphaparameters_MUX_DO_half1_27 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(27),
                D1=>XLXN_114(27),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(27));
   
   extractalphaparameters_MUX_DO_half1_28 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(28),
                D1=>XLXN_114(28),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(28));
   
   extractalphaparameters_MUX_DO_half1_29 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(29),
                D1=>XLXN_114(29),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(29));
   
   extractalphaparameters_MUX_DO_half1_30 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(30),
                D1=>XLXN_114(30),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(30));
   
   extractalphaparameters_MUX_DO_half1_31 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_20(31),
                D1=>XLXN_114(31),
                S0=>o_rdy_DUMMY,
                O=>XLXN_118(31));
   
   extractalphaparameters_MUX_DO_half2_0 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(0),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(0));
   
   extractalphaparameters_MUX_DO_half2_1 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(1),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(1));
   
   extractalphaparameters_MUX_DO_half2_2 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(2),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(2));
   
   extractalphaparameters_MUX_DO_half2_3 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(3),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(3));
   
   extractalphaparameters_MUX_DO_half2_4 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(4),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(4));
   
   extractalphaparameters_MUX_DO_half2_5 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(5),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(5));
   
   extractalphaparameters_MUX_DO_half2_6 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(6),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(6));
   
   extractalphaparameters_MUX_DO_half2_7 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(7),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(7));
   
   extractalphaparameters_MUX_DO_half2_8 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(8),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(8));
   
   extractalphaparameters_MUX_DO_half2_9 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(9),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(9));
   
   extractalphaparameters_MUX_DO_half2_10 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(10),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(10));
   
   extractalphaparameters_MUX_DO_half2_11 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(11),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(11));
   
   extractalphaparameters_MUX_DO_half2_12 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(12),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(12));
   
   extractalphaparameters_MUX_DO_half2_13 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(13),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(13));
   
   extractalphaparameters_MUX_DO_half2_14 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(14),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(14));
   
   extractalphaparameters_MUX_DO_half2_15 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(15),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(15));
   
   extractalphaparameters_MUX_DO_half2_16 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(16),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(16));
   
   extractalphaparameters_MUX_DO_half2_17 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(17),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(17));
   
   extractalphaparameters_MUX_DO_half2_18 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(18),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(18));
   
   extractalphaparameters_MUX_DO_half2_19 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(19),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(19));
   
   extractalphaparameters_MUX_DO_half2_20 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(20),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(20));
   
   extractalphaparameters_MUX_DO_half2_21 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(21),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(21));
   
   extractalphaparameters_MUX_DO_half2_22 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(22),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(22));
   
   extractalphaparameters_MUX_DO_half2_23 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(23),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(23));
   
   extractalphaparameters_MUX_DO_half2_24 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(24),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(24));
   
   extractalphaparameters_MUX_DO_half2_25 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(25),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(25));
   
   extractalphaparameters_MUX_DO_half2_26 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(26),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(26));
   
   extractalphaparameters_MUX_DO_half2_27 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(27),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(27));
   
   extractalphaparameters_MUX_DO_half2_28 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(28),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(28));
   
   extractalphaparameters_MUX_DO_half2_29 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(29),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(29));
   
   extractalphaparameters_MUX_DO_half2_30 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(30),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(30));
   
   extractalphaparameters_MUX_DO_half2_31 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_116,
                D1=>XLXN_117(31),
                S0=>o_rdy_DUMMY,
                O=>XLXN_119(31));
   
   extractalphaparameters_MUX_DO_0 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(0),
                D1=>XLXN_119(0),
                S0=>XLXN_94(9),
                O=>o_do(0));
   
   extractalphaparameters_MUX_DO_1 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(1),
                D1=>XLXN_119(1),
                S0=>XLXN_94(9),
                O=>o_do(1));
   
   extractalphaparameters_MUX_DO_2 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(2),
                D1=>XLXN_119(2),
                S0=>XLXN_94(9),
                O=>o_do(2));
   
   extractalphaparameters_MUX_DO_3 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(3),
                D1=>XLXN_119(3),
                S0=>XLXN_94(9),
                O=>o_do(3));
   
   extractalphaparameters_MUX_DO_4 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(4),
                D1=>XLXN_119(4),
                S0=>XLXN_94(9),
                O=>o_do(4));
   
   extractalphaparameters_MUX_DO_5 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(5),
                D1=>XLXN_119(5),
                S0=>XLXN_94(9),
                O=>o_do(5));
   
   extractalphaparameters_MUX_DO_6 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(6),
                D1=>XLXN_119(6),
                S0=>XLXN_94(9),
                O=>o_do(6));
   
   extractalphaparameters_MUX_DO_7 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(7),
                D1=>XLXN_119(7),
                S0=>XLXN_94(9),
                O=>o_do(7));
   
   extractalphaparameters_MUX_DO_8 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(8),
                D1=>XLXN_119(8),
                S0=>XLXN_94(9),
                O=>o_do(8));
   
   extractalphaparameters_MUX_DO_9 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(9),
                D1=>XLXN_119(9),
                S0=>XLXN_94(9),
                O=>o_do(9));
   
   extractalphaparameters_MUX_DO_10 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(10),
                D1=>XLXN_119(10),
                S0=>XLXN_94(9),
                O=>o_do(10));
   
   extractalphaparameters_MUX_DO_11 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(11),
                D1=>XLXN_119(11),
                S0=>XLXN_94(9),
                O=>o_do(11));
   
   extractalphaparameters_MUX_DO_12 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(12),
                D1=>XLXN_119(12),
                S0=>XLXN_94(9),
                O=>o_do(12));
   
   extractalphaparameters_MUX_DO_13 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(13),
                D1=>XLXN_119(13),
                S0=>XLXN_94(9),
                O=>o_do(13));
   
   extractalphaparameters_MUX_DO_14 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(14),
                D1=>XLXN_119(14),
                S0=>XLXN_94(9),
                O=>o_do(14));
   
   extractalphaparameters_MUX_DO_15 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(15),
                D1=>XLXN_119(15),
                S0=>XLXN_94(9),
                O=>o_do(15));
   
   extractalphaparameters_MUX_DO_16 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(16),
                D1=>XLXN_119(16),
                S0=>XLXN_94(9),
                O=>o_do(16));
   
   extractalphaparameters_MUX_DO_17 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(17),
                D1=>XLXN_119(17),
                S0=>XLXN_94(9),
                O=>o_do(17));
   
   extractalphaparameters_MUX_DO_18 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(18),
                D1=>XLXN_119(18),
                S0=>XLXN_94(9),
                O=>o_do(18));
   
   extractalphaparameters_MUX_DO_19 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(19),
                D1=>XLXN_119(19),
                S0=>XLXN_94(9),
                O=>o_do(19));
   
   extractalphaparameters_MUX_DO_20 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(20),
                D1=>XLXN_119(20),
                S0=>XLXN_94(9),
                O=>o_do(20));
   
   extractalphaparameters_MUX_DO_21 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(21),
                D1=>XLXN_119(21),
                S0=>XLXN_94(9),
                O=>o_do(21));
   
   extractalphaparameters_MUX_DO_22 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(22),
                D1=>XLXN_119(22),
                S0=>XLXN_94(9),
                O=>o_do(22));
   
   extractalphaparameters_MUX_DO_23 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(23),
                D1=>XLXN_119(23),
                S0=>XLXN_94(9),
                O=>o_do(23));
   
   extractalphaparameters_MUX_DO_24 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(24),
                D1=>XLXN_119(24),
                S0=>XLXN_94(9),
                O=>o_do(24));
   
   extractalphaparameters_MUX_DO_25 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(25),
                D1=>XLXN_119(25),
                S0=>XLXN_94(9),
                O=>o_do(25));
   
   extractalphaparameters_MUX_DO_26 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(26),
                D1=>XLXN_119(26),
                S0=>XLXN_94(9),
                O=>o_do(26));
   
   extractalphaparameters_MUX_DO_27 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(27),
                D1=>XLXN_119(27),
                S0=>XLXN_94(9),
                O=>o_do(27));
   
   extractalphaparameters_MUX_DO_28 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(28),
                D1=>XLXN_119(28),
                S0=>XLXN_94(9),
                O=>o_do(28));
   
   extractalphaparameters_MUX_DO_29 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(29),
                D1=>XLXN_119(29),
                S0=>XLXN_94(9),
                O=>o_do(29));
   
   extractalphaparameters_MUX_DO_30 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(30),
                D1=>XLXN_119(30),
                S0=>XLXN_94(9),
                O=>o_do(30));
   
   extractalphaparameters_MUX_DO_31 : M2_1_MXILINX_ExtractAlphaParameters
      port map (D0=>XLXN_118(31),
                D1=>XLXN_119(31),
                S0=>XLXN_94(9),
                O=>o_do(31));
   
   extractalphaparameters_process_p0_inst : ExtractAlphaParameters_process_p0
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                fixed2floatr(31 downto 0)=>fixed2floatr(31 downto 0),
                fixed2floatrdy=>fixed2floatrdy,
                i_addr(9 downto 0)=>i_addr(9 downto 0),
                i_clock=>i_clock,
                i_doa(31 downto 0)=>XLXN_21(31 downto 0),
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                nibble1_in(31 downto 0)=>XLXN_1(31 downto 0),
                nibble2_in(31 downto 0)=>XLXN_2(31 downto 0),
                nibble3_in(31 downto 0)=>XLXN_3(31 downto 0),
                nibble4_in(31 downto 0)=>XLXN_141(31 downto 0),
                nibble5_in(31 downto 0)=>XLXN_142(31 downto 0),
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
                nibble1_out(3 downto 0)=>XLXN_6(3 downto 0),
                nibble2_out(3 downto 0)=>XLXN_7(3 downto 0),
                nibble3_out(5 downto 0)=>XLXN_10(5 downto 0),
                nibble4_out(3 downto 0)=>XLXN_8(3 downto 0),
                nibble5_out(3 downto 0)=>XLXN_9(3 downto 0),
                o_addra(9 downto 0)=>XLXN_26(9 downto 0),
                o_dia(31 downto 0)=>XLXN_38(31 downto 0),
                o_do(31 downto 0)=>o_doa(31 downto 0),
                o_done=>o_done,
                o_rdy=>o_rdy_DUMMY,
                o_write_enable=>o_write_enable);
   
   extractalphaparameters_rom_alphascale : rom_alphascale
      port map (nibble_in(3 downto 0)=>XLXN_9(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_142(31 downto 0));
   
   extractalphaparameters_rom_signed4bit : rom_signed4bit
      port map (nibble_in(3 downto 0)=>XLXN_7(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_2(31 downto 0));
   
   extractalphaparameters_rom_signed6bit : rom_signed6bit
      port map (nibble_in(5 downto 0)=>XLXN_10(5 downto 0),
                nibble_out(31 downto 0)=>XLXN_3(31 downto 0));
   
   extractalphaparameters_rom_unsigned4bit : rom_unsigned4bit
      port map (nibble_in(3 downto 0)=>XLXN_6(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_1(31 downto 0));
   
   extractalphaparameters_rom_unsigned4bit_2powx : rom_unsigned4bit_2powx
      port map (nibble_in(3 downto 0)=>XLXN_8(3 downto 0),
                nibble_out(31 downto 0)=>XLXN_141(31 downto 0));
   
   inst_mem_acc1 : ramb16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_110(14 downto 0),
                ADDRB(14 downto 0)=>inst_mem_acc1_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>inst_mem_acc1_CASCADEINA_openSignal,
                CASCADEINB=>inst_mem_acc1_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>inst_mem_acc1_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_35(31 downto 0),
                DIB(31 downto 0)=>inst_mem_acc1_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>inst_mem_acc1_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>inst_mem_acc1_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_98,
                ENB=>inst_mem_acc1_ENB_openSignal,
                REGCEA=>inst_mem_acc1_REGCEA_openSignal,
                REGCEB=>inst_mem_acc1_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>inst_mem_acc1_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_78(3 downto 0),
                WEB(3 downto 0)=>inst_mem_acc1_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_114(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   inst_mem_acc2 : ramb16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_108(14 downto 0),
                ADDRB(14 downto 0)=>inst_mem_acc2_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>inst_mem_acc2_CASCADEINA_openSignal,
                CASCADEINB=>inst_mem_acc2_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>inst_mem_acc2_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_35(31 downto 0),
                DIB(31 downto 0)=>inst_mem_acc2_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>inst_mem_acc2_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>inst_mem_acc2_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_94(9),
                ENB=>inst_mem_acc2_ENB_openSignal,
                REGCEA=>inst_mem_acc2_REGCEA_openSignal,
                REGCEB=>inst_mem_acc2_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>inst_mem_acc2_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_78(3 downto 0),
                WEB(3 downto 0)=>inst_mem_acc2_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_117(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_22_0 : BUF
      port map (I=>o_write_enable,
                O=>XLXN_78(0));
   
   XLXI_22_1 : BUF
      port map (I=>o_write_enable,
                O=>XLXN_78(1));
   
   XLXI_22_2 : BUF
      port map (I=>o_write_enable,
                O=>XLXN_78(2));
   
   XLXI_22_3 : BUF
      port map (I=>o_write_enable,
                O=>XLXN_78(3));
   
   XLXI_34_0 : BUF
      port map (I=>XLXN_94(0),
                O=>XLXN_110(5));
   
   XLXI_34_1 : BUF
      port map (I=>XLXN_94(1),
                O=>XLXN_110(6));
   
   XLXI_34_2 : BUF
      port map (I=>XLXN_94(2),
                O=>XLXN_110(7));
   
   XLXI_34_3 : BUF
      port map (I=>XLXN_94(3),
                O=>XLXN_110(8));
   
   XLXI_34_4 : BUF
      port map (I=>XLXN_94(4),
                O=>XLXN_110(9));
   
   XLXI_34_5 : BUF
      port map (I=>XLXN_94(5),
                O=>XLXN_110(10));
   
   XLXI_34_6 : BUF
      port map (I=>XLXN_94(6),
                O=>XLXN_110(11));
   
   XLXI_34_7 : BUF
      port map (I=>XLXN_94(7),
                O=>XLXN_110(12));
   
   XLXI_34_8 : BUF
      port map (I=>XLXN_94(8),
                O=>XLXN_110(13));
   
   XLXI_35 : INV
      port map (I=>XLXN_94(9),
                O=>XLXN_98);
   
   XLXI_36_0 : GND
      port map (G=>XLXN_110(0));
   
   XLXI_36_1 : GND
      port map (G=>XLXN_110(1));
   
   XLXI_36_2 : GND
      port map (G=>XLXN_110(2));
   
   XLXI_36_3 : GND
      port map (G=>XLXN_110(3));
   
   XLXI_36_4 : GND
      port map (G=>XLXN_110(4));
   
   XLXI_37_0 : GND
      port map (G=>XLXN_108(0));
   
   XLXI_37_1 : GND
      port map (G=>XLXN_108(1));
   
   XLXI_37_2 : GND
      port map (G=>XLXN_108(2));
   
   XLXI_37_3 : GND
      port map (G=>XLXN_108(3));
   
   XLXI_37_4 : GND
      port map (G=>XLXN_108(4));
   
   XLXI_38_0 : BUF
      port map (I=>XLXN_94(0),
                O=>XLXN_108(5));
   
   XLXI_38_1 : BUF
      port map (I=>XLXN_94(1),
                O=>XLXN_108(6));
   
   XLXI_38_2 : BUF
      port map (I=>XLXN_94(2),
                O=>XLXN_108(7));
   
   XLXI_38_3 : BUF
      port map (I=>XLXN_94(3),
                O=>XLXN_108(8));
   
   XLXI_38_4 : BUF
      port map (I=>XLXN_94(4),
                O=>XLXN_108(9));
   
   XLXI_38_5 : BUF
      port map (I=>XLXN_94(5),
                O=>XLXN_108(10));
   
   XLXI_38_6 : BUF
      port map (I=>XLXN_94(6),
                O=>XLXN_108(11));
   
   XLXI_38_7 : BUF
      port map (I=>XLXN_94(7),
                O=>XLXN_108(12));
   
   XLXI_38_8 : BUF
      port map (I=>XLXN_94(8),
                O=>XLXN_108(13));
   
   XLXI_43 : GND
      port map (G=>XLXN_110(14));
   
   XLXI_44 : GND
      port map (G=>XLXN_108(14));
   
end BEHAVIORAL;


