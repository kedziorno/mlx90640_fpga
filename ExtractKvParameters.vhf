--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ExtractKvParameters.vhf
-- /___/   /\     Timestamp : 09/03/2023 19:10:45
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family spartan3e -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/ExtractKvParameters.vhf -w /home/user/workspace/mlx90640_fpga/ExtractKvParameters.sch
--Design Name: ExtractKvParameters
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
   attribute HU_SET        : string ;
   attribute WRITE_WIDTH_B : string ;
   attribute WRITE_WIDTH_A : string ;
   attribute WRITE_MODE_B  : string ;
   attribute WRITE_MODE_A  : string ;
   attribute READ_WIDTH_B  : string ;
   attribute READ_WIDTH_A  : string ;
   attribute BOX_TYPE      : string ;
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
         "extractkvparameters_MUX_ADDR_0_83";
   attribute HU_SET of extractkvparameters_MUX_ADDR_1 : label is 
         "extractkvparameters_MUX_ADDR_1_82";
   attribute HU_SET of extractkvparameters_MUX_ADDR_2 : label is 
         "extractkvparameters_MUX_ADDR_2_81";
   attribute HU_SET of extractkvparameters_MUX_ADDR_3 : label is 
         "extractkvparameters_MUX_ADDR_3_80";
   attribute HU_SET of extractkvparameters_MUX_ADDR_4 : label is 
         "extractkvparameters_MUX_ADDR_4_79";
   attribute HU_SET of extractkvparameters_MUX_ADDR_5 : label is 
         "extractkvparameters_MUX_ADDR_5_78";
   attribute HU_SET of extractkvparameters_MUX_ADDR_6 : label is 
         "extractkvparameters_MUX_ADDR_6_77";
   attribute HU_SET of extractkvparameters_MUX_ADDR_7 : label is 
         "extractkvparameters_MUX_ADDR_7_76";
   attribute HU_SET of extractkvparameters_MUX_ADDR_8 : label is 
         "extractkvparameters_MUX_ADDR_8_75";
   attribute HU_SET of extractkvparameters_MUX_ADDR_9 : label is 
         "extractkvparameters_MUX_ADDR_9_74";
   attribute HU_SET of extractkvparameters_MUX_DO_0 : label is 
         "extractkvparameters_MUX_DO_0_73";
   attribute HU_SET of extractkvparameters_MUX_DO_1 : label is 
         "extractkvparameters_MUX_DO_1_72";
   attribute HU_SET of extractkvparameters_MUX_DO_2 : label is 
         "extractkvparameters_MUX_DO_2_71";
   attribute HU_SET of extractkvparameters_MUX_DO_3 : label is 
         "extractkvparameters_MUX_DO_3_70";
   attribute HU_SET of extractkvparameters_MUX_DO_4 : label is 
         "extractkvparameters_MUX_DO_4_69";
   attribute HU_SET of extractkvparameters_MUX_DO_5 : label is 
         "extractkvparameters_MUX_DO_5_68";
   attribute HU_SET of extractkvparameters_MUX_DO_6 : label is 
         "extractkvparameters_MUX_DO_6_67";
   attribute HU_SET of extractkvparameters_MUX_DO_7 : label is 
         "extractkvparameters_MUX_DO_7_66";
   attribute HU_SET of extractkvparameters_MUX_DO_8 : label is 
         "extractkvparameters_MUX_DO_8_65";
   attribute HU_SET of extractkvparameters_MUX_DO_9 : label is 
         "extractkvparameters_MUX_DO_9_64";
   attribute HU_SET of extractkvparameters_MUX_DO_10 : label is 
         "extractkvparameters_MUX_DO_10_63";
   attribute HU_SET of extractkvparameters_MUX_DO_11 : label is 
         "extractkvparameters_MUX_DO_11_62";
   attribute HU_SET of extractkvparameters_MUX_DO_12 : label is 
         "extractkvparameters_MUX_DO_12_61";
   attribute HU_SET of extractkvparameters_MUX_DO_13 : label is 
         "extractkvparameters_MUX_DO_13_60";
   attribute HU_SET of extractkvparameters_MUX_DO_14 : label is 
         "extractkvparameters_MUX_DO_14_59";
   attribute HU_SET of extractkvparameters_MUX_DO_15 : label is 
         "extractkvparameters_MUX_DO_15_58";
   attribute HU_SET of extractkvparameters_MUX_DO_16 : label is 
         "extractkvparameters_MUX_DO_16_57";
   attribute HU_SET of extractkvparameters_MUX_DO_17 : label is 
         "extractkvparameters_MUX_DO_17_56";
   attribute HU_SET of extractkvparameters_MUX_DO_18 : label is 
         "extractkvparameters_MUX_DO_18_55";
   attribute HU_SET of extractkvparameters_MUX_DO_19 : label is 
         "extractkvparameters_MUX_DO_19_54";
   attribute HU_SET of extractkvparameters_MUX_DO_20 : label is 
         "extractkvparameters_MUX_DO_20_53";
   attribute HU_SET of extractkvparameters_MUX_DO_21 : label is 
         "extractkvparameters_MUX_DO_21_52";
   attribute HU_SET of extractkvparameters_MUX_DO_22 : label is 
         "extractkvparameters_MUX_DO_22_51";
   attribute HU_SET of extractkvparameters_MUX_DO_23 : label is 
         "extractkvparameters_MUX_DO_23_50";
   attribute HU_SET of extractkvparameters_MUX_DO_24 : label is 
         "extractkvparameters_MUX_DO_24_49";
   attribute HU_SET of extractkvparameters_MUX_DO_25 : label is 
         "extractkvparameters_MUX_DO_25_48";
   attribute HU_SET of extractkvparameters_MUX_DO_26 : label is 
         "extractkvparameters_MUX_DO_26_47";
   attribute HU_SET of extractkvparameters_MUX_DO_27 : label is 
         "extractkvparameters_MUX_DO_27_46";
   attribute HU_SET of extractkvparameters_MUX_DO_28 : label is 
         "extractkvparameters_MUX_DO_28_45";
   attribute HU_SET of extractkvparameters_MUX_DO_29 : label is 
         "extractkvparameters_MUX_DO_29_44";
   attribute HU_SET of extractkvparameters_MUX_DO_30 : label is 
         "extractkvparameters_MUX_DO_30_43";
   attribute HU_SET of extractkvparameters_MUX_DO_31 : label is 
         "extractkvparameters_MUX_DO_31_42";
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


