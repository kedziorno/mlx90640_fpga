--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ExtractAlphaPTATParameter.vhf
-- /___/   /\     Timestamp : 09/03/2023 19:01:53
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/mlx90640_fpga/ipcore_dir -intstyle ise -family spartan3e -flat -suppress -vhdl /home/user/workspace/mlx90640_fpga/ExtractAlphaPTATParameter.vhf -w /home/user/workspace/mlx90640_fpga/ExtractAlphaPTATParameter.sch
--Design Name: ExtractAlphaPTATParameter
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

entity ExtractAlphaPTATParameter is
   port ( i_clock     : in    std_logic; 
          i_ee0x2410  : in    std_logic_vector (15 downto 0); 
          i_reset     : in    std_logic; 
          o_alphaptat : out   std_logic_vector (31 downto 0));
end ExtractAlphaPTATParameter;

architecture BEHAVIORAL of ExtractAlphaPTATParameter is
   attribute BOX_TYPE      : string ;
   attribute INIT_00       : string ;
   attribute INIT_01       : string ;
   attribute WRITE_WIDTH_B : string ;
   attribute WRITE_WIDTH_A : string ;
   attribute WRITE_MODE_B  : string ;
   attribute WRITE_MODE_A  : string ;
   attribute READ_WIDTH_B  : string ;
   attribute READ_WIDTH_A  : string ;
   signal XLXN_1                              : std_logic_vector (14 downto 0);
   signal XLXN_10                             : std_logic;
   signal ROM_ALPHAPTAT_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal ROM_ALPHAPTAT_CASCADEINA_openSignal : std_logic;
   signal ROM_ALPHAPTAT_CASCADEINB_openSignal : std_logic;
   signal ROM_ALPHAPTAT_CLKB_openSignal       : std_logic;
   signal ROM_ALPHAPTAT_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_ALPHAPTAT_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_ALPHAPTAT_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_ALPHAPTAT_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_ALPHAPTAT_ENB_openSignal        : std_logic;
   signal ROM_ALPHAPTAT_REGCEA_openSignal     : std_logic;
   signal ROM_ALPHAPTAT_REGCEB_openSignal     : std_logic;
   signal ROM_ALPHAPTAT_SSRB_openSignal       : std_logic;
   signal ROM_ALPHAPTAT_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal ROM_ALPHAPTAT_WEB_openSignal        : std_logic_vector (3 downto 0);
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
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
   
   attribute INIT_00 of ROM_ALPHAPTAT : label is 
         "411c0000411800004114000041100000410c0000410800004104000041000000";
   attribute INIT_01 of ROM_ALPHAPTAT : label is 
         "413c0000413800004134000041300000412c0000412800004124000041200000";
   attribute WRITE_WIDTH_B of ROM_ALPHAPTAT : label is "36";
   attribute WRITE_WIDTH_A of ROM_ALPHAPTAT : label is "36";
   attribute WRITE_MODE_B of ROM_ALPHAPTAT : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_ALPHAPTAT : label is "READ_FIRST";
   attribute READ_WIDTH_B of ROM_ALPHAPTAT : label is "36";
   attribute READ_WIDTH_A of ROM_ALPHAPTAT : label is "36";
begin
   BUF_0 : BUF
      port map (I=>i_ee0x2410(12),
                O=>XLXN_1(5));
   
   BUF_1 : BUF
      port map (I=>i_ee0x2410(13),
                O=>XLXN_1(6));
   
   BUF_2 : BUF
      port map (I=>i_ee0x2410(14),
                O=>XLXN_1(7));
   
   BUF_3 : BUF
      port map (I=>i_ee0x2410(15),
                O=>XLXN_1(8));
   
   ROM_ALPHAPTAT : RAMB16
   -- synopsys translate_off
   generic map( INIT_00 => 
         x"411c0000411800004114000041100000410c0000410800004104000041000000",
            INIT_01 => 
         x"413c0000413800004134000041300000412c0000412800004124000041200000",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_1(14 downto 0),
                ADDRB(14 downto 0)=>ROM_ALPHAPTAT_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>ROM_ALPHAPTAT_CASCADEINA_openSignal,
                CASCADEINB=>ROM_ALPHAPTAT_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>ROM_ALPHAPTAT_CLKB_openSignal,
                DIA(31 downto 0)=>ROM_ALPHAPTAT_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>ROM_ALPHAPTAT_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>ROM_ALPHAPTAT_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>ROM_ALPHAPTAT_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_10,
                ENB=>ROM_ALPHAPTAT_ENB_openSignal,
                REGCEA=>ROM_ALPHAPTAT_REGCEA_openSignal,
                REGCEB=>ROM_ALPHAPTAT_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>ROM_ALPHAPTAT_SSRB_openSignal,
                WEA(3 downto 0)=>ROM_ALPHAPTAT_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>ROM_ALPHAPTAT_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>o_alphaptat(31 downto 0),
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


