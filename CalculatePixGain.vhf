--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CalculatePixGain.vhf
-- /___/   /\     Timestamp : 09/03/2023 19:01:58
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family spartan3e -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/CalculatePixGain.vhf -w /home/user/workspace/mlx90640_fpga/CalculatePixGain.sch
--Design Name: CalculatePixGain
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
   attribute HU_SET        : string ;
   attribute WRITE_WIDTH_B : string ;
   attribute WRITE_WIDTH_A : string ;
   attribute WRITE_MODE_B  : string ;
   attribute WRITE_MODE_A  : string ;
   attribute READ_WIDTH_B  : string ;
   attribute READ_WIDTH_A  : string ;
   attribute BOX_TYPE      : string ;
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
   
   component M2_1_MXILINX_CalculatePixGain
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
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
   
   attribute HU_SET of CalculatePixGain_MUX_DIA_0 : label is 
         "CalculatePixGain_MUX_DIA_0_731";
   attribute HU_SET of CalculatePixGain_MUX_DIA_1 : label is 
         "CalculatePixGain_MUX_DIA_1_730";
   attribute HU_SET of CalculatePixGain_MUX_DIA_2 : label is 
         "CalculatePixGain_MUX_DIA_2_729";
   attribute HU_SET of CalculatePixGain_MUX_DIA_3 : label is 
         "CalculatePixGain_MUX_DIA_3_728";
   attribute HU_SET of CalculatePixGain_MUX_DIA_4 : label is 
         "CalculatePixGain_MUX_DIA_4_727";
   attribute HU_SET of CalculatePixGain_MUX_DIA_5 : label is 
         "CalculatePixGain_MUX_DIA_5_726";
   attribute HU_SET of CalculatePixGain_MUX_DIA_6 : label is 
         "CalculatePixGain_MUX_DIA_6_725";
   attribute HU_SET of CalculatePixGain_MUX_DIA_7 : label is 
         "CalculatePixGain_MUX_DIA_7_724";
   attribute HU_SET of CalculatePixGain_MUX_DIA_8 : label is 
         "CalculatePixGain_MUX_DIA_8_723";
   attribute HU_SET of CalculatePixGain_MUX_DIA_9 : label is 
         "CalculatePixGain_MUX_DIA_9_722";
   attribute HU_SET of CalculatePixGain_MUX_DIA_10 : label is 
         "CalculatePixGain_MUX_DIA_10_721";
   attribute HU_SET of CalculatePixGain_MUX_DIA_11 : label is 
         "CalculatePixGain_MUX_DIA_11_720";
   attribute HU_SET of CalculatePixGain_MUX_DIA_12 : label is 
         "CalculatePixGain_MUX_DIA_12_719";
   attribute HU_SET of CalculatePixGain_MUX_DIA_13 : label is 
         "CalculatePixGain_MUX_DIA_13_718";
   attribute HU_SET of CalculatePixGain_MUX_DIA_14 : label is 
         "CalculatePixGain_MUX_DIA_14_717";
   attribute HU_SET of CalculatePixGain_MUX_DIA_15 : label is 
         "CalculatePixGain_MUX_DIA_15_716";
   attribute HU_SET of CalculatePixGain_MUX_DIA_16 : label is 
         "CalculatePixGain_MUX_DIA_16_715";
   attribute HU_SET of CalculatePixGain_MUX_DIA_17 : label is 
         "CalculatePixGain_MUX_DIA_17_714";
   attribute HU_SET of CalculatePixGain_MUX_DIA_18 : label is 
         "CalculatePixGain_MUX_DIA_18_713";
   attribute HU_SET of CalculatePixGain_MUX_DIA_19 : label is 
         "CalculatePixGain_MUX_DIA_19_712";
   attribute HU_SET of CalculatePixGain_MUX_DIA_20 : label is 
         "CalculatePixGain_MUX_DIA_20_711";
   attribute HU_SET of CalculatePixGain_MUX_DIA_21 : label is 
         "CalculatePixGain_MUX_DIA_21_710";
   attribute HU_SET of CalculatePixGain_MUX_DIA_22 : label is 
         "CalculatePixGain_MUX_DIA_22_709";
   attribute HU_SET of CalculatePixGain_MUX_DIA_23 : label is 
         "CalculatePixGain_MUX_DIA_23_708";
   attribute HU_SET of CalculatePixGain_MUX_DIA_24 : label is 
         "CalculatePixGain_MUX_DIA_24_707";
   attribute HU_SET of CalculatePixGain_MUX_DIA_25 : label is 
         "CalculatePixGain_MUX_DIA_25_706";
   attribute HU_SET of CalculatePixGain_MUX_DIA_26 : label is 
         "CalculatePixGain_MUX_DIA_26_705";
   attribute HU_SET of CalculatePixGain_MUX_DIA_27 : label is 
         "CalculatePixGain_MUX_DIA_27_704";
   attribute HU_SET of CalculatePixGain_MUX_DIA_28 : label is 
         "CalculatePixGain_MUX_DIA_28_703";
   attribute HU_SET of CalculatePixGain_MUX_DIA_29 : label is 
         "CalculatePixGain_MUX_DIA_29_702";
   attribute HU_SET of CalculatePixGain_MUX_DIA_30 : label is 
         "CalculatePixGain_MUX_DIA_30_701";
   attribute HU_SET of CalculatePixGain_MUX_DIA_31 : label is 
         "CalculatePixGain_MUX_DIA_31_700";
   attribute HU_SET of CalculatePixGain_MUX_DO_0 : label is 
         "CalculatePixGain_MUX_DO_0_689";
   attribute HU_SET of CalculatePixGain_MUX_DO_1 : label is 
         "CalculatePixGain_MUX_DO_1_688";
   attribute HU_SET of CalculatePixGain_MUX_DO_2 : label is 
         "CalculatePixGain_MUX_DO_2_687";
   attribute HU_SET of CalculatePixGain_MUX_DO_3 : label is 
         "CalculatePixGain_MUX_DO_3_686";
   attribute HU_SET of CalculatePixGain_MUX_DO_4 : label is 
         "CalculatePixGain_MUX_DO_4_685";
   attribute HU_SET of CalculatePixGain_MUX_DO_5 : label is 
         "CalculatePixGain_MUX_DO_5_684";
   attribute HU_SET of CalculatePixGain_MUX_DO_6 : label is 
         "CalculatePixGain_MUX_DO_6_683";
   attribute HU_SET of CalculatePixGain_MUX_DO_7 : label is 
         "CalculatePixGain_MUX_DO_7_682";
   attribute HU_SET of CalculatePixGain_MUX_DO_8 : label is 
         "CalculatePixGain_MUX_DO_8_681";
   attribute HU_SET of CalculatePixGain_MUX_DO_9 : label is 
         "CalculatePixGain_MUX_DO_9_680";
   attribute HU_SET of CalculatePixGain_MUX_DO_10 : label is 
         "CalculatePixGain_MUX_DO_10_679";
   attribute HU_SET of CalculatePixGain_MUX_DO_11 : label is 
         "CalculatePixGain_MUX_DO_11_678";
   attribute HU_SET of CalculatePixGain_MUX_DO_12 : label is 
         "CalculatePixGain_MUX_DO_12_677";
   attribute HU_SET of CalculatePixGain_MUX_DO_13 : label is 
         "CalculatePixGain_MUX_DO_13_676";
   attribute HU_SET of CalculatePixGain_MUX_DO_14 : label is 
         "CalculatePixGain_MUX_DO_14_675";
   attribute HU_SET of CalculatePixGain_MUX_DO_15 : label is 
         "CalculatePixGain_MUX_DO_15_674";
   attribute HU_SET of CalculatePixGain_MUX_DO_16 : label is 
         "CalculatePixGain_MUX_DO_16_673";
   attribute HU_SET of CalculatePixGain_MUX_DO_17 : label is 
         "CalculatePixGain_MUX_DO_17_672";
   attribute HU_SET of CalculatePixGain_MUX_DO_18 : label is 
         "CalculatePixGain_MUX_DO_18_671";
   attribute HU_SET of CalculatePixGain_MUX_DO_19 : label is 
         "CalculatePixGain_MUX_DO_19_670";
   attribute HU_SET of CalculatePixGain_MUX_DO_20 : label is 
         "CalculatePixGain_MUX_DO_20_669";
   attribute HU_SET of CalculatePixGain_MUX_DO_21 : label is 
         "CalculatePixGain_MUX_DO_21_668";
   attribute HU_SET of CalculatePixGain_MUX_DO_22 : label is 
         "CalculatePixGain_MUX_DO_22_667";
   attribute HU_SET of CalculatePixGain_MUX_DO_23 : label is 
         "CalculatePixGain_MUX_DO_23_666";
   attribute HU_SET of CalculatePixGain_MUX_DO_24 : label is 
         "CalculatePixGain_MUX_DO_24_665";
   attribute HU_SET of CalculatePixGain_MUX_DO_25 : label is 
         "CalculatePixGain_MUX_DO_25_664";
   attribute HU_SET of CalculatePixGain_MUX_DO_26 : label is 
         "CalculatePixGain_MUX_DO_26_663";
   attribute HU_SET of CalculatePixGain_MUX_DO_27 : label is 
         "CalculatePixGain_MUX_DO_27_662";
   attribute HU_SET of CalculatePixGain_MUX_DO_28 : label is 
         "CalculatePixGain_MUX_DO_28_661";
   attribute HU_SET of CalculatePixGain_MUX_DO_29 : label is 
         "CalculatePixGain_MUX_DO_29_660";
   attribute HU_SET of CalculatePixGain_MUX_DO_30 : label is 
         "CalculatePixGain_MUX_DO_30_659";
   attribute HU_SET of CalculatePixGain_MUX_DO_31 : label is 
         "CalculatePixGain_MUX_DO_31_658";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_0 : label is 
         "CalculatePixGain_MUX_fi2fl_a_0_808";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_1 : label is 
         "CalculatePixGain_MUX_fi2fl_a_1_807";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_2 : label is 
         "CalculatePixGain_MUX_fi2fl_a_2_806";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_3 : label is 
         "CalculatePixGain_MUX_fi2fl_a_3_805";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_4 : label is 
         "CalculatePixGain_MUX_fi2fl_a_4_804";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_5 : label is 
         "CalculatePixGain_MUX_fi2fl_a_5_803";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_6 : label is 
         "CalculatePixGain_MUX_fi2fl_a_6_802";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_7 : label is 
         "CalculatePixGain_MUX_fi2fl_a_7_801";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_8 : label is 
         "CalculatePixGain_MUX_fi2fl_a_8_800";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_9 : label is 
         "CalculatePixGain_MUX_fi2fl_a_9_799";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_10 : label is 
         "CalculatePixGain_MUX_fi2fl_a_10_798";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_11 : label is 
         "CalculatePixGain_MUX_fi2fl_a_11_797";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_12 : label is 
         "CalculatePixGain_MUX_fi2fl_a_12_796";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_13 : label is 
         "CalculatePixGain_MUX_fi2fl_a_13_795";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_14 : label is 
         "CalculatePixGain_MUX_fi2fl_a_14_794";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_15 : label is 
         "CalculatePixGain_MUX_fi2fl_a_15_793";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_16 : label is 
         "CalculatePixGain_MUX_fi2fl_a_16_792";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_17 : label is 
         "CalculatePixGain_MUX_fi2fl_a_17_791";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_18 : label is 
         "CalculatePixGain_MUX_fi2fl_a_18_790";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_19 : label is 
         "CalculatePixGain_MUX_fi2fl_a_19_789";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_20 : label is 
         "CalculatePixGain_MUX_fi2fl_a_20_788";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_21 : label is 
         "CalculatePixGain_MUX_fi2fl_a_21_787";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_22 : label is 
         "CalculatePixGain_MUX_fi2fl_a_22_786";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_23 : label is 
         "CalculatePixGain_MUX_fi2fl_a_23_785";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_24 : label is 
         "CalculatePixGain_MUX_fi2fl_a_24_784";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_25 : label is 
         "CalculatePixGain_MUX_fi2fl_a_25_783";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_26 : label is 
         "CalculatePixGain_MUX_fi2fl_a_26_782";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_27 : label is 
         "CalculatePixGain_MUX_fi2fl_a_27_781";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_28 : label is 
         "CalculatePixGain_MUX_fi2fl_a_28_780";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_29 : label is 
         "CalculatePixGain_MUX_fi2fl_a_29_779";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_30 : label is 
         "CalculatePixGain_MUX_fi2fl_a_30_778";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_31 : label is 
         "CalculatePixGain_MUX_fi2fl_a_31_777";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_32 : label is 
         "CalculatePixGain_MUX_fi2fl_a_32_776";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_33 : label is 
         "CalculatePixGain_MUX_fi2fl_a_33_775";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_34 : label is 
         "CalculatePixGain_MUX_fi2fl_a_34_774";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_35 : label is 
         "CalculatePixGain_MUX_fi2fl_a_35_773";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_36 : label is 
         "CalculatePixGain_MUX_fi2fl_a_36_772";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_37 : label is 
         "CalculatePixGain_MUX_fi2fl_a_37_771";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_38 : label is 
         "CalculatePixGain_MUX_fi2fl_a_38_770";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_39 : label is 
         "CalculatePixGain_MUX_fi2fl_a_39_769";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_40 : label is 
         "CalculatePixGain_MUX_fi2fl_a_40_768";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_41 : label is 
         "CalculatePixGain_MUX_fi2fl_a_41_767";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_42 : label is 
         "CalculatePixGain_MUX_fi2fl_a_42_766";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_43 : label is 
         "CalculatePixGain_MUX_fi2fl_a_43_765";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_44 : label is 
         "CalculatePixGain_MUX_fi2fl_a_44_764";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_45 : label is 
         "CalculatePixGain_MUX_fi2fl_a_45_763";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_46 : label is 
         "CalculatePixGain_MUX_fi2fl_a_46_762";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_47 : label is 
         "CalculatePixGain_MUX_fi2fl_a_47_761";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_48 : label is 
         "CalculatePixGain_MUX_fi2fl_a_48_760";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_49 : label is 
         "CalculatePixGain_MUX_fi2fl_a_49_759";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_50 : label is 
         "CalculatePixGain_MUX_fi2fl_a_50_758";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_51 : label is 
         "CalculatePixGain_MUX_fi2fl_a_51_757";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_52 : label is 
         "CalculatePixGain_MUX_fi2fl_a_52_756";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_53 : label is 
         "CalculatePixGain_MUX_fi2fl_a_53_755";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_54 : label is 
         "CalculatePixGain_MUX_fi2fl_a_54_754";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_55 : label is 
         "CalculatePixGain_MUX_fi2fl_a_55_753";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_56 : label is 
         "CalculatePixGain_MUX_fi2fl_a_56_752";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_57 : label is 
         "CalculatePixGain_MUX_fi2fl_a_57_751";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_58 : label is 
         "CalculatePixGain_MUX_fi2fl_a_58_750";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_59 : label is 
         "CalculatePixGain_MUX_fi2fl_a_59_749";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_60 : label is 
         "CalculatePixGain_MUX_fi2fl_a_60_748";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_61 : label is 
         "CalculatePixGain_MUX_fi2fl_a_61_747";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_62 : label is 
         "CalculatePixGain_MUX_fi2fl_a_62_746";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_a_63 : label is 
         "CalculatePixGain_MUX_fi2fl_a_63_745";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_ce : label is 
         "CalculatePixGain_MUX_fi2fl_ce_811";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_ond : label is 
         "CalculatePixGain_MUX_fi2fl_ond_809";
   attribute HU_SET of CalculatePixGain_MUX_fi2fl_sclr : label is 
         "CalculatePixGain_MUX_fi2fl_sclr_810";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_0 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_0_744";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_1 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_1_743";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_2 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_2_742";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_3 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_3_741";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_4 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_4_740";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_5 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_5_739";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_6 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_6_738";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_7 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_7_737";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_8 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_8_736";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_9 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_9_735";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_10 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_10_734";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_addra_11 : label is 
         "CalculatePixGain_MUX_i2c_mem_addra_11_733";
   attribute HU_SET of CalculatePixGain_MUX_i2c_mem_ena : label is 
         "CalculatePixGain_MUX_i2c_mem_ena_732";
   attribute HU_SET of CalculatePixGain_mux2_addra_0 : label is 
         "CalculatePixGain_mux2_addra_0_699";
   attribute HU_SET of CalculatePixGain_mux2_addra_1 : label is 
         "CalculatePixGain_mux2_addra_1_698";
   attribute HU_SET of CalculatePixGain_mux2_addra_2 : label is 
         "CalculatePixGain_mux2_addra_2_697";
   attribute HU_SET of CalculatePixGain_mux2_addra_3 : label is 
         "CalculatePixGain_mux2_addra_3_696";
   attribute HU_SET of CalculatePixGain_mux2_addra_4 : label is 
         "CalculatePixGain_mux2_addra_4_695";
   attribute HU_SET of CalculatePixGain_mux2_addra_5 : label is 
         "CalculatePixGain_mux2_addra_5_694";
   attribute HU_SET of CalculatePixGain_mux2_addra_6 : label is 
         "CalculatePixGain_mux2_addra_6_693";
   attribute HU_SET of CalculatePixGain_mux2_addra_7 : label is 
         "CalculatePixGain_mux2_addra_7_692";
   attribute HU_SET of CalculatePixGain_mux2_addra_8 : label is 
         "CalculatePixGain_mux2_addra_8_691";
   attribute HU_SET of CalculatePixGain_mux2_addra_9 : label is 
         "CalculatePixGain_mux2_addra_9_690";
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
   XLXN_158(31 downto 0) <= x"00000000";
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
                fixed2floata(63 downto 0)=>XLXN_119(63 downto 0),
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
   
   CalculatePixGain_MUX_fi2fl_a_16 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(16),
                D1=>XLXN_119(16),
                S0=>XLXN_113,
                O=>fixed2floata(16));
   
   CalculatePixGain_MUX_fi2fl_a_17 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(17),
                D1=>XLXN_119(17),
                S0=>XLXN_113,
                O=>fixed2floata(17));
   
   CalculatePixGain_MUX_fi2fl_a_18 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(18),
                D1=>XLXN_119(18),
                S0=>XLXN_113,
                O=>fixed2floata(18));
   
   CalculatePixGain_MUX_fi2fl_a_19 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(19),
                D1=>XLXN_119(19),
                S0=>XLXN_113,
                O=>fixed2floata(19));
   
   CalculatePixGain_MUX_fi2fl_a_20 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(20),
                D1=>XLXN_119(20),
                S0=>XLXN_113,
                O=>fixed2floata(20));
   
   CalculatePixGain_MUX_fi2fl_a_21 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(21),
                D1=>XLXN_119(21),
                S0=>XLXN_113,
                O=>fixed2floata(21));
   
   CalculatePixGain_MUX_fi2fl_a_22 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(22),
                D1=>XLXN_119(22),
                S0=>XLXN_113,
                O=>fixed2floata(22));
   
   CalculatePixGain_MUX_fi2fl_a_23 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(23),
                D1=>XLXN_119(23),
                S0=>XLXN_113,
                O=>fixed2floata(23));
   
   CalculatePixGain_MUX_fi2fl_a_24 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(24),
                D1=>XLXN_119(24),
                S0=>XLXN_113,
                O=>fixed2floata(24));
   
   CalculatePixGain_MUX_fi2fl_a_25 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(25),
                D1=>XLXN_119(25),
                S0=>XLXN_113,
                O=>fixed2floata(25));
   
   CalculatePixGain_MUX_fi2fl_a_26 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(26),
                D1=>XLXN_119(26),
                S0=>XLXN_113,
                O=>fixed2floata(26));
   
   CalculatePixGain_MUX_fi2fl_a_27 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(27),
                D1=>XLXN_119(27),
                S0=>XLXN_113,
                O=>fixed2floata(27));
   
   CalculatePixGain_MUX_fi2fl_a_28 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(28),
                D1=>XLXN_119(28),
                S0=>XLXN_113,
                O=>fixed2floata(28));
   
   CalculatePixGain_MUX_fi2fl_a_29 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(29),
                D1=>XLXN_119(29),
                S0=>XLXN_113,
                O=>fixed2floata(29));
   
   CalculatePixGain_MUX_fi2fl_a_30 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(30),
                D1=>XLXN_119(30),
                S0=>XLXN_113,
                O=>fixed2floata(30));
   
   CalculatePixGain_MUX_fi2fl_a_31 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(31),
                D1=>XLXN_119(31),
                S0=>XLXN_113,
                O=>fixed2floata(31));
   
   CalculatePixGain_MUX_fi2fl_a_32 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(32),
                D1=>XLXN_119(32),
                S0=>XLXN_113,
                O=>fixed2floata(32));
   
   CalculatePixGain_MUX_fi2fl_a_33 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(33),
                D1=>XLXN_119(33),
                S0=>XLXN_113,
                O=>fixed2floata(33));
   
   CalculatePixGain_MUX_fi2fl_a_34 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(34),
                D1=>XLXN_119(34),
                S0=>XLXN_113,
                O=>fixed2floata(34));
   
   CalculatePixGain_MUX_fi2fl_a_35 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(35),
                D1=>XLXN_119(35),
                S0=>XLXN_113,
                O=>fixed2floata(35));
   
   CalculatePixGain_MUX_fi2fl_a_36 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(36),
                D1=>XLXN_119(36),
                S0=>XLXN_113,
                O=>fixed2floata(36));
   
   CalculatePixGain_MUX_fi2fl_a_37 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(37),
                D1=>XLXN_119(37),
                S0=>XLXN_113,
                O=>fixed2floata(37));
   
   CalculatePixGain_MUX_fi2fl_a_38 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(38),
                D1=>XLXN_119(38),
                S0=>XLXN_113,
                O=>fixed2floata(38));
   
   CalculatePixGain_MUX_fi2fl_a_39 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(39),
                D1=>XLXN_119(39),
                S0=>XLXN_113,
                O=>fixed2floata(39));
   
   CalculatePixGain_MUX_fi2fl_a_40 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(40),
                D1=>XLXN_119(40),
                S0=>XLXN_113,
                O=>fixed2floata(40));
   
   CalculatePixGain_MUX_fi2fl_a_41 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(41),
                D1=>XLXN_119(41),
                S0=>XLXN_113,
                O=>fixed2floata(41));
   
   CalculatePixGain_MUX_fi2fl_a_42 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(42),
                D1=>XLXN_119(42),
                S0=>XLXN_113,
                O=>fixed2floata(42));
   
   CalculatePixGain_MUX_fi2fl_a_43 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(43),
                D1=>XLXN_119(43),
                S0=>XLXN_113,
                O=>fixed2floata(43));
   
   CalculatePixGain_MUX_fi2fl_a_44 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(44),
                D1=>XLXN_119(44),
                S0=>XLXN_113,
                O=>fixed2floata(44));
   
   CalculatePixGain_MUX_fi2fl_a_45 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(45),
                D1=>XLXN_119(45),
                S0=>XLXN_113,
                O=>fixed2floata(45));
   
   CalculatePixGain_MUX_fi2fl_a_46 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(46),
                D1=>XLXN_119(46),
                S0=>XLXN_113,
                O=>fixed2floata(46));
   
   CalculatePixGain_MUX_fi2fl_a_47 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(47),
                D1=>XLXN_119(47),
                S0=>XLXN_113,
                O=>fixed2floata(47));
   
   CalculatePixGain_MUX_fi2fl_a_48 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(48),
                D1=>XLXN_119(48),
                S0=>XLXN_113,
                O=>fixed2floata(48));
   
   CalculatePixGain_MUX_fi2fl_a_49 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(49),
                D1=>XLXN_119(49),
                S0=>XLXN_113,
                O=>fixed2floata(49));
   
   CalculatePixGain_MUX_fi2fl_a_50 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(50),
                D1=>XLXN_119(50),
                S0=>XLXN_113,
                O=>fixed2floata(50));
   
   CalculatePixGain_MUX_fi2fl_a_51 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(51),
                D1=>XLXN_119(51),
                S0=>XLXN_113,
                O=>fixed2floata(51));
   
   CalculatePixGain_MUX_fi2fl_a_52 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(52),
                D1=>XLXN_119(52),
                S0=>XLXN_113,
                O=>fixed2floata(52));
   
   CalculatePixGain_MUX_fi2fl_a_53 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(53),
                D1=>XLXN_119(53),
                S0=>XLXN_113,
                O=>fixed2floata(53));
   
   CalculatePixGain_MUX_fi2fl_a_54 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(54),
                D1=>XLXN_119(54),
                S0=>XLXN_113,
                O=>fixed2floata(54));
   
   CalculatePixGain_MUX_fi2fl_a_55 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(55),
                D1=>XLXN_119(55),
                S0=>XLXN_113,
                O=>fixed2floata(55));
   
   CalculatePixGain_MUX_fi2fl_a_56 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(56),
                D1=>XLXN_119(56),
                S0=>XLXN_113,
                O=>fixed2floata(56));
   
   CalculatePixGain_MUX_fi2fl_a_57 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(57),
                D1=>XLXN_119(57),
                S0=>XLXN_113,
                O=>fixed2floata(57));
   
   CalculatePixGain_MUX_fi2fl_a_58 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(58),
                D1=>XLXN_119(58),
                S0=>XLXN_113,
                O=>fixed2floata(58));
   
   CalculatePixGain_MUX_fi2fl_a_59 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(59),
                D1=>XLXN_119(59),
                S0=>XLXN_113,
                O=>fixed2floata(59));
   
   CalculatePixGain_MUX_fi2fl_a_60 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(60),
                D1=>XLXN_119(60),
                S0=>XLXN_113,
                O=>fixed2floata(60));
   
   CalculatePixGain_MUX_fi2fl_a_61 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(61),
                D1=>XLXN_119(61),
                S0=>XLXN_113,
                O=>fixed2floata(61));
   
   CalculatePixGain_MUX_fi2fl_a_62 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(62),
                D1=>XLXN_119(62),
                S0=>XLXN_113,
                O=>fixed2floata(62));
   
   CalculatePixGain_MUX_fi2fl_a_63 : M2_1_MXILINX_CalculatePixGain
      port map (D0=>XLXN_118(63),
                D1=>XLXN_119(63),
                S0=>XLXN_113,
                O=>fixed2floata(63));
   
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


