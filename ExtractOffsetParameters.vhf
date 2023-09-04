--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ExtractOffsetParameters.vhf
-- /___/   /\     Timestamp : 09/03/2023 19:01:58
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family spartan3e -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/ExtractOffsetParameters.vhf -w /home/user/workspace/mlx90640_fpga/ExtractOffsetParameters.sch
--Design Name: ExtractOffsetParameters
--Device: spartan3e
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
   attribute HU_SET        : string ;
   attribute WRITE_WIDTH_B : string ;
   attribute WRITE_WIDTH_A : string ;
   attribute WRITE_MODE_B  : string ;
   attribute WRITE_MODE_A  : string ;
   attribute READ_WIDTH_B  : string ;
   attribute READ_WIDTH_A  : string ;
   attribute BOX_TYPE      : string ;
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
   component M2_1_MXILINX_ExtractOffsetParameters
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
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
   
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_0 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_0_875";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_1 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_1_874";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_2 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_2_873";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_3 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_3_872";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_4 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_4_871";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_5 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_5_870";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_6 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_6_869";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_7 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_7_868";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_8 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_8_867";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_9 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_9_866";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_10 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_10_865";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_11 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_11_864";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_12 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_12_863";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_13 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_13_862";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_14 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_14_861";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_15 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_15_860";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_16 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_16_859";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_17 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_17_858";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_18 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_18_857";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_19 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_19_856";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_20 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_20_855";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_21 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_21_854";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_22 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_22_853";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_23 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_23_852";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_24 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_24_851";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_25 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_25_850";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_26 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_26_849";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_27 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_27_848";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_28 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_28_847";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_29 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_29_846";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_30 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_30_845";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_MAIN_31 : label is 
         "ExtractOffsetParameters_MUX_DO_MAIN_31_844";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_0 : label is 
         "ExtractOffsetParameters_MUX_DO_0_843";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_1 : label is 
         "ExtractOffsetParameters_MUX_DO_1_842";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_2 : label is 
         "ExtractOffsetParameters_MUX_DO_2_841";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_3 : label is 
         "ExtractOffsetParameters_MUX_DO_3_840";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_4 : label is 
         "ExtractOffsetParameters_MUX_DO_4_839";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_5 : label is 
         "ExtractOffsetParameters_MUX_DO_5_838";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_6 : label is 
         "ExtractOffsetParameters_MUX_DO_6_837";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_7 : label is 
         "ExtractOffsetParameters_MUX_DO_7_836";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_8 : label is 
         "ExtractOffsetParameters_MUX_DO_8_835";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_9 : label is 
         "ExtractOffsetParameters_MUX_DO_9_834";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_10 : label is 
         "ExtractOffsetParameters_MUX_DO_10_833";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_11 : label is 
         "ExtractOffsetParameters_MUX_DO_11_832";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_12 : label is 
         "ExtractOffsetParameters_MUX_DO_12_831";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_13 : label is 
         "ExtractOffsetParameters_MUX_DO_13_830";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_14 : label is 
         "ExtractOffsetParameters_MUX_DO_14_829";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_15 : label is 
         "ExtractOffsetParameters_MUX_DO_15_828";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_16 : label is 
         "ExtractOffsetParameters_MUX_DO_16_827";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_17 : label is 
         "ExtractOffsetParameters_MUX_DO_17_826";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_18 : label is 
         "ExtractOffsetParameters_MUX_DO_18_825";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_19 : label is 
         "ExtractOffsetParameters_MUX_DO_19_824";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_20 : label is 
         "ExtractOffsetParameters_MUX_DO_20_823";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_21 : label is 
         "ExtractOffsetParameters_MUX_DO_21_822";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_22 : label is 
         "ExtractOffsetParameters_MUX_DO_22_821";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_23 : label is 
         "ExtractOffsetParameters_MUX_DO_23_820";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_24 : label is 
         "ExtractOffsetParameters_MUX_DO_24_819";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_25 : label is 
         "ExtractOffsetParameters_MUX_DO_25_818";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_26 : label is 
         "ExtractOffsetParameters_MUX_DO_26_817";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_27 : label is 
         "ExtractOffsetParameters_MUX_DO_27_816";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_28 : label is 
         "ExtractOffsetParameters_MUX_DO_28_815";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_29 : label is 
         "ExtractOffsetParameters_MUX_DO_29_814";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_30 : label is 
         "ExtractOffsetParameters_MUX_DO_30_813";
   attribute HU_SET of ExtractOffsetParameters_MUX_DO_31 : label is 
         "ExtractOffsetParameters_MUX_DO_31_812";
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
begin
   XLXN_179(31 downto 0) <= x"00000000";
   o_rdy <= o_rdy_DUMMY;
   ExtractOffsetParameters_MUX_DO_MAIN_0 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(0),
                D1=>XLXN_180(0),
                S0=>o_rdy_DUMMY,
                O=>o_do(0));
   
   ExtractOffsetParameters_MUX_DO_MAIN_1 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(1),
                D1=>XLXN_180(1),
                S0=>o_rdy_DUMMY,
                O=>o_do(1));
   
   ExtractOffsetParameters_MUX_DO_MAIN_2 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(2),
                D1=>XLXN_180(2),
                S0=>o_rdy_DUMMY,
                O=>o_do(2));
   
   ExtractOffsetParameters_MUX_DO_MAIN_3 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(3),
                D1=>XLXN_180(3),
                S0=>o_rdy_DUMMY,
                O=>o_do(3));
   
   ExtractOffsetParameters_MUX_DO_MAIN_4 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(4),
                D1=>XLXN_180(4),
                S0=>o_rdy_DUMMY,
                O=>o_do(4));
   
   ExtractOffsetParameters_MUX_DO_MAIN_5 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(5),
                D1=>XLXN_180(5),
                S0=>o_rdy_DUMMY,
                O=>o_do(5));
   
   ExtractOffsetParameters_MUX_DO_MAIN_6 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(6),
                D1=>XLXN_180(6),
                S0=>o_rdy_DUMMY,
                O=>o_do(6));
   
   ExtractOffsetParameters_MUX_DO_MAIN_7 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(7),
                D1=>XLXN_180(7),
                S0=>o_rdy_DUMMY,
                O=>o_do(7));
   
   ExtractOffsetParameters_MUX_DO_MAIN_8 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(8),
                D1=>XLXN_180(8),
                S0=>o_rdy_DUMMY,
                O=>o_do(8));
   
   ExtractOffsetParameters_MUX_DO_MAIN_9 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(9),
                D1=>XLXN_180(9),
                S0=>o_rdy_DUMMY,
                O=>o_do(9));
   
   ExtractOffsetParameters_MUX_DO_MAIN_10 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(10),
                D1=>XLXN_180(10),
                S0=>o_rdy_DUMMY,
                O=>o_do(10));
   
   ExtractOffsetParameters_MUX_DO_MAIN_11 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(11),
                D1=>XLXN_180(11),
                S0=>o_rdy_DUMMY,
                O=>o_do(11));
   
   ExtractOffsetParameters_MUX_DO_MAIN_12 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(12),
                D1=>XLXN_180(12),
                S0=>o_rdy_DUMMY,
                O=>o_do(12));
   
   ExtractOffsetParameters_MUX_DO_MAIN_13 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(13),
                D1=>XLXN_180(13),
                S0=>o_rdy_DUMMY,
                O=>o_do(13));
   
   ExtractOffsetParameters_MUX_DO_MAIN_14 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(14),
                D1=>XLXN_180(14),
                S0=>o_rdy_DUMMY,
                O=>o_do(14));
   
   ExtractOffsetParameters_MUX_DO_MAIN_15 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(15),
                D1=>XLXN_180(15),
                S0=>o_rdy_DUMMY,
                O=>o_do(15));
   
   ExtractOffsetParameters_MUX_DO_MAIN_16 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(16),
                D1=>XLXN_180(16),
                S0=>o_rdy_DUMMY,
                O=>o_do(16));
   
   ExtractOffsetParameters_MUX_DO_MAIN_17 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(17),
                D1=>XLXN_180(17),
                S0=>o_rdy_DUMMY,
                O=>o_do(17));
   
   ExtractOffsetParameters_MUX_DO_MAIN_18 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(18),
                D1=>XLXN_180(18),
                S0=>o_rdy_DUMMY,
                O=>o_do(18));
   
   ExtractOffsetParameters_MUX_DO_MAIN_19 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(19),
                D1=>XLXN_180(19),
                S0=>o_rdy_DUMMY,
                O=>o_do(19));
   
   ExtractOffsetParameters_MUX_DO_MAIN_20 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(20),
                D1=>XLXN_180(20),
                S0=>o_rdy_DUMMY,
                O=>o_do(20));
   
   ExtractOffsetParameters_MUX_DO_MAIN_21 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(21),
                D1=>XLXN_180(21),
                S0=>o_rdy_DUMMY,
                O=>o_do(21));
   
   ExtractOffsetParameters_MUX_DO_MAIN_22 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(22),
                D1=>XLXN_180(22),
                S0=>o_rdy_DUMMY,
                O=>o_do(22));
   
   ExtractOffsetParameters_MUX_DO_MAIN_23 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(23),
                D1=>XLXN_180(23),
                S0=>o_rdy_DUMMY,
                O=>o_do(23));
   
   ExtractOffsetParameters_MUX_DO_MAIN_24 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(24),
                D1=>XLXN_180(24),
                S0=>o_rdy_DUMMY,
                O=>o_do(24));
   
   ExtractOffsetParameters_MUX_DO_MAIN_25 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(25),
                D1=>XLXN_180(25),
                S0=>o_rdy_DUMMY,
                O=>o_do(25));
   
   ExtractOffsetParameters_MUX_DO_MAIN_26 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(26),
                D1=>XLXN_180(26),
                S0=>o_rdy_DUMMY,
                O=>o_do(26));
   
   ExtractOffsetParameters_MUX_DO_MAIN_27 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(27),
                D1=>XLXN_180(27),
                S0=>o_rdy_DUMMY,
                O=>o_do(27));
   
   ExtractOffsetParameters_MUX_DO_MAIN_28 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(28),
                D1=>XLXN_180(28),
                S0=>o_rdy_DUMMY,
                O=>o_do(28));
   
   ExtractOffsetParameters_MUX_DO_MAIN_29 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(29),
                D1=>XLXN_180(29),
                S0=>o_rdy_DUMMY,
                O=>o_do(29));
   
   ExtractOffsetParameters_MUX_DO_MAIN_30 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(30),
                D1=>XLXN_180(30),
                S0=>o_rdy_DUMMY,
                O=>o_do(30));
   
   ExtractOffsetParameters_MUX_DO_MAIN_31 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>XLXN_179(31),
                D1=>XLXN_180(31),
                S0=>o_rdy_DUMMY,
                O=>o_do(31));
   
   ExtractOffsetParameters_MUX_DO_0 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(0),
                D1=>doa2(0),
                S0=>mux_addr1(9),
                O=>XLXN_180(0));
   
   ExtractOffsetParameters_MUX_DO_1 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(1),
                D1=>doa2(1),
                S0=>mux_addr1(9),
                O=>XLXN_180(1));
   
   ExtractOffsetParameters_MUX_DO_2 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(2),
                D1=>doa2(2),
                S0=>mux_addr1(9),
                O=>XLXN_180(2));
   
   ExtractOffsetParameters_MUX_DO_3 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(3),
                D1=>doa2(3),
                S0=>mux_addr1(9),
                O=>XLXN_180(3));
   
   ExtractOffsetParameters_MUX_DO_4 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(4),
                D1=>doa2(4),
                S0=>mux_addr1(9),
                O=>XLXN_180(4));
   
   ExtractOffsetParameters_MUX_DO_5 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(5),
                D1=>doa2(5),
                S0=>mux_addr1(9),
                O=>XLXN_180(5));
   
   ExtractOffsetParameters_MUX_DO_6 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(6),
                D1=>doa2(6),
                S0=>mux_addr1(9),
                O=>XLXN_180(6));
   
   ExtractOffsetParameters_MUX_DO_7 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(7),
                D1=>doa2(7),
                S0=>mux_addr1(9),
                O=>XLXN_180(7));
   
   ExtractOffsetParameters_MUX_DO_8 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(8),
                D1=>doa2(8),
                S0=>mux_addr1(9),
                O=>XLXN_180(8));
   
   ExtractOffsetParameters_MUX_DO_9 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(9),
                D1=>doa2(9),
                S0=>mux_addr1(9),
                O=>XLXN_180(9));
   
   ExtractOffsetParameters_MUX_DO_10 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(10),
                D1=>doa2(10),
                S0=>mux_addr1(9),
                O=>XLXN_180(10));
   
   ExtractOffsetParameters_MUX_DO_11 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(11),
                D1=>doa2(11),
                S0=>mux_addr1(9),
                O=>XLXN_180(11));
   
   ExtractOffsetParameters_MUX_DO_12 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(12),
                D1=>doa2(12),
                S0=>mux_addr1(9),
                O=>XLXN_180(12));
   
   ExtractOffsetParameters_MUX_DO_13 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(13),
                D1=>doa2(13),
                S0=>mux_addr1(9),
                O=>XLXN_180(13));
   
   ExtractOffsetParameters_MUX_DO_14 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(14),
                D1=>doa2(14),
                S0=>mux_addr1(9),
                O=>XLXN_180(14));
   
   ExtractOffsetParameters_MUX_DO_15 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(15),
                D1=>doa2(15),
                S0=>mux_addr1(9),
                O=>XLXN_180(15));
   
   ExtractOffsetParameters_MUX_DO_16 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(16),
                D1=>doa2(16),
                S0=>mux_addr1(9),
                O=>XLXN_180(16));
   
   ExtractOffsetParameters_MUX_DO_17 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(17),
                D1=>doa2(17),
                S0=>mux_addr1(9),
                O=>XLXN_180(17));
   
   ExtractOffsetParameters_MUX_DO_18 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(18),
                D1=>doa2(18),
                S0=>mux_addr1(9),
                O=>XLXN_180(18));
   
   ExtractOffsetParameters_MUX_DO_19 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(19),
                D1=>doa2(19),
                S0=>mux_addr1(9),
                O=>XLXN_180(19));
   
   ExtractOffsetParameters_MUX_DO_20 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(20),
                D1=>doa2(20),
                S0=>mux_addr1(9),
                O=>XLXN_180(20));
   
   ExtractOffsetParameters_MUX_DO_21 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(21),
                D1=>doa2(21),
                S0=>mux_addr1(9),
                O=>XLXN_180(21));
   
   ExtractOffsetParameters_MUX_DO_22 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(22),
                D1=>doa2(22),
                S0=>mux_addr1(9),
                O=>XLXN_180(22));
   
   ExtractOffsetParameters_MUX_DO_23 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(23),
                D1=>doa2(23),
                S0=>mux_addr1(9),
                O=>XLXN_180(23));
   
   ExtractOffsetParameters_MUX_DO_24 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(24),
                D1=>doa2(24),
                S0=>mux_addr1(9),
                O=>XLXN_180(24));
   
   ExtractOffsetParameters_MUX_DO_25 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(25),
                D1=>doa2(25),
                S0=>mux_addr1(9),
                O=>XLXN_180(25));
   
   ExtractOffsetParameters_MUX_DO_26 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(26),
                D1=>doa2(26),
                S0=>mux_addr1(9),
                O=>XLXN_180(26));
   
   ExtractOffsetParameters_MUX_DO_27 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(27),
                D1=>doa2(27),
                S0=>mux_addr1(9),
                O=>XLXN_180(27));
   
   ExtractOffsetParameters_MUX_DO_28 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(28),
                D1=>doa2(28),
                S0=>mux_addr1(9),
                O=>XLXN_180(28));
   
   ExtractOffsetParameters_MUX_DO_29 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(29),
                D1=>doa2(29),
                S0=>mux_addr1(9),
                O=>XLXN_180(29));
   
   ExtractOffsetParameters_MUX_DO_30 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(30),
                D1=>doa2(30),
                S0=>mux_addr1(9),
                O=>XLXN_180(30));
   
   ExtractOffsetParameters_MUX_DO_31 : M2_1_MXILINX_ExtractOffsetParameters
      port map (D0=>doa1(31),
                D1=>doa2(31),
                S0=>mux_addr1(9),
                O=>XLXN_180(31));
   
   extractoffsetparameters_rom_signed4bit : rom_signed4bit
      port map (nibble_in(3 downto 0)=>nibble_out2(3 downto 0),
                nibble_out(31 downto 0)=>nibble_in2(31 downto 0));
   
   extractoffsetparameters_rom_signed6bit : rom_signed6bit
      port map (nibble_in(5 downto 0)=>nibble_out3(5 downto 0),
                nibble_out(31 downto 0)=>nibble_in3(31 downto 0));
   
   extractoffsetparameters_rom_unsigned4bit : rom_unsigned4bit
      port map (nibble_in(3 downto 0)=>nibble_out1(3 downto 0),
                nibble_out(31 downto 0)=>nibble_in1(31 downto 0));
   
   extractoffsetparameters_rom_unsigned4bit_2powx : rom_unsigned4bit_2powx
      port map (nibble_in(3 downto 0)=>nibble_out4(3 downto 0),
                nibble_out(31 downto 0)=>nibble_in4(31 downto 0));
   
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


