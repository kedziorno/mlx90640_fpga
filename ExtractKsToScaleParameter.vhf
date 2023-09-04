--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ExtractKsToScaleParameter.vhf
-- /___/   /\     Timestamp : 09/03/2023 19:09:14
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family spartan3e -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/ExtractKsToScaleParameter.vhf -w /home/user/workspace/mlx90640_fpga/ExtractKsToScaleParameter.sch
--Design Name: ExtractKsToScaleParameter
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

entity ExtractKsToScaleParameter is
   port ( i_clock       : in    std_logic; 
          i_reset       : in    std_logic; 
          i_run         : in    std_logic; 
          i2c_mem_douta : in    std_logic_vector (7 downto 0); 
          i2c_mem_addra : out   std_logic_vector (11 downto 0); 
          i2c_mem_ena   : out   std_logic; 
          o_kstoscale   : out   std_logic_vector (31 downto 0); 
          o_rdy         : out   std_logic);
end ExtractKsToScaleParameter;

architecture BEHAVIORAL of ExtractKsToScaleParameter is
   attribute INIT_00       : string ;
   attribute INIT_01       : string ;
   attribute WRITE_WIDTH_B : string ;
   attribute WRITE_WIDTH_A : string ;
   attribute WRITE_MODE_B  : string ;
   attribute WRITE_MODE_A  : string ;
   attribute READ_WIDTH_B  : string ;
   attribute READ_WIDTH_A  : string ;
   attribute BOX_TYPE      : string ;
   signal XLXN_1                              : std_logic_vector (14 downto 0);
   signal XLXN_10                             : std_logic;
   signal XLXN_20                             : std_logic_vector (31 downto 0);
   signal ROM_KSTOSCALE_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal ROM_KSTOSCALE_CASCADEINA_openSignal : std_logic;
   signal ROM_KSTOSCALE_CASCADEINB_openSignal : std_logic;
   signal ROM_KSTOSCALE_CLKB_openSignal       : std_logic;
   signal ROM_KSTOSCALE_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_KSTOSCALE_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_KSTOSCALE_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_KSTOSCALE_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_KSTOSCALE_ENB_openSignal        : std_logic;
   signal ROM_KSTOSCALE_REGCEA_openSignal     : std_logic;
   signal ROM_KSTOSCALE_REGCEB_openSignal     : std_logic;
   signal ROM_KSTOSCALE_SSRB_openSignal       : std_logic;
   signal ROM_KSTOSCALE_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal ROM_KSTOSCALE_WEB_openSignal        : std_logic_vector (3 downto 0);
   component ExtractKsToScaleParameter_process_p0
      port ( i_clock           : in    std_logic; 
             i_reset           : in    std_logic; 
             i_run             : in    std_logic; 
             i2c_mem_douta     : in    std_logic_vector (7 downto 0); 
             odata_kstoscale   : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena       : out   std_logic; 
             o_rdy             : out   std_logic; 
             i2c_mem_addra     : out   std_logic_vector (11 downto 0); 
             address_kstoscale : out   std_logic_vector (3 downto 0); 
             o_kstoscale       : out   std_logic_vector (31 downto 0));
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
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute INIT_00 of ROM_KSTOSCALE : label is 
         "4700000046800000460000004580000045000000448000004400000043800000";
   attribute INIT_01 of ROM_KSTOSCALE : label is 
         "4b0000004a8000004a0000004980000049000000488000004800000047800000";
   attribute WRITE_WIDTH_B of ROM_KSTOSCALE : label is "36";
   attribute WRITE_WIDTH_A of ROM_KSTOSCALE : label is "36";
   attribute WRITE_MODE_B of ROM_KSTOSCALE : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_KSTOSCALE : label is "READ_FIRST";
   attribute READ_WIDTH_B of ROM_KSTOSCALE : label is "36";
   attribute READ_WIDTH_A of ROM_KSTOSCALE : label is "36";
begin
   Extractkstoscaleparameter_process_p0_inst : 
         ExtractKsToScaleParameter_process_p0
      port map (i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                odata_kstoscale(31 downto 0)=>XLXN_20(31 downto 0),
                address_kstoscale(3 downto 0)=>XLXN_1(8 downto 5),
                i2c_mem_addra(11 downto 0)=>i2c_mem_addra(11 downto 0),
                i2c_mem_ena=>i2c_mem_ena,
                o_kstoscale(31 downto 0)=>o_kstoscale(31 downto 0),
                o_rdy=>o_rdy);
   
   ROM_KSTOSCALE : RAMB16
   -- synopsys translate_off
   generic map( INIT_00 => 
         x"4700000046800000460000004580000045000000448000004400000043800000",
            INIT_01 => 
         x"4b0000004a8000004a0000004980000049000000488000004800000047800000",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_1(14 downto 0),
                ADDRB(14 downto 0)=>ROM_KSTOSCALE_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>ROM_KSTOSCALE_CASCADEINA_openSignal,
                CASCADEINB=>ROM_KSTOSCALE_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>ROM_KSTOSCALE_CLKB_openSignal,
                DIA(31 downto 0)=>ROM_KSTOSCALE_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>ROM_KSTOSCALE_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>ROM_KSTOSCALE_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>ROM_KSTOSCALE_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_10,
                ENB=>ROM_KSTOSCALE_ENB_openSignal,
                REGCEA=>ROM_KSTOSCALE_REGCEA_openSignal,
                REGCEB=>ROM_KSTOSCALE_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>ROM_KSTOSCALE_SSRB_openSignal,
                WEA(3 downto 0)=>ROM_KSTOSCALE_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>ROM_KSTOSCALE_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_20(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_3_0 : GND
      port map (G=>XLXN_1(0));
   
   XLXI_3_1 : GND
      port map (G=>XLXN_1(1));
   
   XLXI_3_2 : GND
      port map (G=>XLXN_1(2));
   
   XLXI_3_3 : GND
      port map (G=>XLXN_1(3));
   
   XLXI_3_4 : GND
      port map (G=>XLXN_1(4));
   
   XLXI_4_0 : GND
      port map (G=>XLXN_1(9));
   
   XLXI_4_1 : GND
      port map (G=>XLXN_1(10));
   
   XLXI_4_2 : GND
      port map (G=>XLXN_1(11));
   
   XLXI_4_3 : GND
      port map (G=>XLXN_1(12));
   
   XLXI_4_4 : GND
      port map (G=>XLXN_1(13));
   
   XLXI_4_5 : GND
      port map (G=>XLXN_1(14));
   
   XLXI_5 : VCC
      port map (P=>XLXN_10);
   
end BEHAVIORAL;


