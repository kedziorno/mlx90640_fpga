--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CalculateVirCompensated.vhf
-- /___/   /\     Timestamp : 09/22/2024 19:44:39
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculateVirCompensated.vhf -w /home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculateVirCompensated.sch
--Design Name: CalculateVirCompensated
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

entity M2_1_MXILINX_CalculateVirCompensated is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_CalculateVirCompensated;

architecture BEHAVIORAL of M2_1_MXILINX_CalculateVirCompensated is
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

entity mem_switchpattern_MUSER_CalculateVirCompensated is
   port ( i_clock   : in    std_logic; 
          i_pixel   : in    std_logic_vector (11 downto 0); 
          i_reset   : in    std_logic; 
          o_pattern : out   std_logic);
end mem_switchpattern_MUSER_CalculateVirCompensated;

architecture BEHAVIORAL of mem_switchpattern_MUSER_CalculateVirCompensated is
   attribute BOX_TYPE    : string ;
   attribute INIT_00     : string ;
   attribute INIT_01     : string ;
   attribute INIT_02     : string ;
   attribute INIT_03     : string ;
   attribute INIT_04     : string ;
   attribute INIT_05     : string ;
   attribute INIT_06     : string ;
   attribute INIT_07     : string ;
   attribute INIT_08     : string ;
   attribute INIT_09     : string ;
   attribute INIT_0A     : string ;
   attribute INIT_0B     : string ;
   attribute INIT_0C     : string ;
   attribute INIT_0D     : string ;
   attribute INIT_0E     : string ;
   attribute INIT_0F     : string ;
   attribute INIT_10     : string ;
   attribute INIT_11     : string ;
   attribute INIT_12     : string ;
   attribute INIT_13     : string ;
   attribute INIT_14     : string ;
   attribute INIT_15     : string ;
   attribute INIT_16     : string ;
   attribute INIT_17     : string ;
   attribute INIT_18     : string ;
   attribute INIT_19     : string ;
   attribute INIT_1A     : string ;
   attribute INIT_1B     : string ;
   attribute INIT_1C     : string ;
   attribute INIT_1D     : string ;
   attribute INIT_1E     : string ;
   attribute INIT_1F     : string ;
   attribute INIT_20     : string ;
   attribute INIT_21     : string ;
   attribute INIT_22     : string ;
   attribute INIT_23     : string ;
   attribute INIT_24     : string ;
   attribute INIT_25     : string ;
   attribute INIT_26     : string ;
   attribute INIT_27     : string ;
   attribute INIT_28     : string ;
   attribute INIT_29     : string ;
   attribute INIT_2A     : string ;
   attribute INIT_2B     : string ;
   attribute INIT_2C     : string ;
   attribute INIT_2D     : string ;
   attribute INIT_2E     : string ;
   attribute INIT_2F     : string ;
   attribute INIT_30     : string ;
   attribute INIT_31     : string ;
   attribute INIT_32     : string ;
   attribute INIT_33     : string ;
   attribute INIT_34     : string ;
   attribute INIT_35     : string ;
   attribute INIT_36     : string ;
   attribute INIT_37     : string ;
   attribute INIT_38     : string ;
   attribute INIT_39     : string ;
   attribute INIT_3A     : string ;
   attribute INIT_3B     : string ;
   attribute INIT_3C     : string ;
   attribute INIT_3D     : string ;
   attribute INIT_3E     : string ;
   attribute INIT_3F     : string ;
   attribute INIT        : string ;
   attribute SRVAL       : string ;
   attribute WRITE_MODE  : string ;
   signal ADDR                  : std_logic_vector (13 downto 0);
   signal do                    : std_logic;
   signal XLXN_11               : std_logic;
   signal XLXN_44               : std_logic;
   signal XLXI_10_DI_openSignal : std_logic_vector (0 downto 0);
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component RAMB16_S1
      -- synopsys translate_off
      generic( INIT_00 : bit_vector :=  
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
               INIT : bit_vector :=  b"0";
               SRVAL : bit_vector :=  b"0";
               WRITE_MODE : string :=  "NO_CHANGE");
      -- synopsys translate_on
      port ( ADDR : in    std_logic_vector (13 downto 0); 
             CLK  : in    std_logic; 
             DI   : in    std_logic_vector (0 downto 0); 
             EN   : in    std_logic; 
             SSR  : in    std_logic; 
             WE   : in    std_logic; 
             DO   : out   std_logic_vector (0 downto 0));
   end component;
   attribute INIT_00 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_01 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_02 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_03 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_04 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_05 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_06 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_07 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_08 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_09 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0A of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0B of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0C of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0D of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0E of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_0F of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_10 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_11 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_12 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_13 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_14 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_15 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_16 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_17 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_18 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_19 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1A of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1B of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1C of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1D of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1E of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_1F of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_20 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_21 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_22 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_23 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_24 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_25 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_26 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_27 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_28 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_29 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2A of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2B of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2C of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2D of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2E of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_2F of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_30 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_31 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_32 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_33 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_34 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_35 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_36 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_37 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_38 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_39 of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3A of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3B of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3C of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3D of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3E of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT_3F of RAMB16_S1 : component is 
         "0000000000000000000000000000000000000000000000000000000000000000";
   attribute INIT of RAMB16_S1 : component is "0";
   attribute SRVAL of RAMB16_S1 : component is "0";
   attribute WRITE_MODE of RAMB16_S1 : component is "NO_CHANGE";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute INIT_0B of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_0A of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_09 of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_08 of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_07 of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_06 of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_05 of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_04 of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_03 of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_02 of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_01 of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
   attribute INIT_00 of XLXI_10 : label is 
         "0101010101010101010101010101010110101010101010101010101010101010";
begin
   XLXI_7 : VCC
      port map (P=>XLXN_11);
   
   XLXI_8 : BUF
      port map (I=>do,
                O=>o_pattern);
   
   XLXI_10 : RAMB16_S1
   -- synopsys translate_off
   generic map( INIT_0B => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_0A => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_09 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_08 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_07 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_06 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_05 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_04 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_03 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_02 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_01 => 
         x"0101010101010101010101010101010110101010101010101010101010101010",
            INIT_00 => 
         x"0101010101010101010101010101010110101010101010101010101010101010")
   -- synopsys translate_on
      port map (ADDR(13 downto 0)=>ADDR(13 downto 0),
                CLK=>i_clock,
                DI(0)=>XLXI_10_DI_openSignal(0),
                EN=>XLXN_11,
                SSR=>i_reset,
                WE=>XLXN_44,
                DO(0)=>do);
   
   XLXI_11 : GND
      port map (G=>XLXN_44);
   
   XLXI_12_0 : GND
      port map (G=>ADDR(0));
   
   XLXI_12_1 : GND
      port map (G=>ADDR(1));
   
   XLXI_13_0 : BUF
      port map (I=>i_pixel(0),
                O=>ADDR(2));
   
   XLXI_13_1 : BUF
      port map (I=>i_pixel(1),
                O=>ADDR(3));
   
   XLXI_13_2 : BUF
      port map (I=>i_pixel(2),
                O=>ADDR(4));
   
   XLXI_13_3 : BUF
      port map (I=>i_pixel(3),
                O=>ADDR(5));
   
   XLXI_13_4 : BUF
      port map (I=>i_pixel(4),
                O=>ADDR(6));
   
   XLXI_13_5 : BUF
      port map (I=>i_pixel(5),
                O=>ADDR(7));
   
   XLXI_13_6 : BUF
      port map (I=>i_pixel(6),
                O=>ADDR(8));
   
   XLXI_13_7 : BUF
      port map (I=>i_pixel(7),
                O=>ADDR(9));
   
   XLXI_13_8 : BUF
      port map (I=>i_pixel(8),
                O=>ADDR(10));
   
   XLXI_13_9 : BUF
      port map (I=>i_pixel(9),
                O=>ADDR(11));
   
   XLXI_13_10 : BUF
      port map (I=>i_pixel(10),
                O=>ADDR(12));
   
   XLXI_13_11 : BUF
      port map (I=>i_pixel(11),
                O=>ADDR(13));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ExtractTGCParameter_MUSER_CalculateVirCompensated is
   port ( i_clock       : in    std_logic; 
          i_reset       : in    std_logic; 
          i_run         : in    std_logic; 
          i2c_mem_douta : in    std_logic_vector (7 downto 0); 
          i2c_mem_addra : out   std_logic_vector (11 downto 0); 
          i2c_mem_ena   : out   std_logic; 
          o_rdy         : out   std_logic; 
          o_tgc         : out   std_logic_vector (31 downto 0));
end ExtractTGCParameter_MUSER_CalculateVirCompensated;

architecture BEHAVIORAL of ExtractTGCParameter_MUSER_CalculateVirCompensated is
   attribute BOX_TYPE            : string ;
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
   signal ADDRA                         : std_logic_vector (14 downto 0);
   signal XLXN_11                       : std_logic;
   signal XLXN_12                       : std_logic_vector (7 downto 0);
   signal XLXN_13                       : std_logic_vector (31 downto 0);
   signal ROM_TGC_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal ROM_TGC_CASCADEINA_openSignal : std_logic;
   signal ROM_TGC_CASCADEINB_openSignal : std_logic;
   signal ROM_TGC_CLKB_openSignal       : std_logic;
   signal ROM_TGC_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_TGC_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal ROM_TGC_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_TGC_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal ROM_TGC_ENB_openSignal        : std_logic;
   signal ROM_TGC_REGCEA_openSignal     : std_logic;
   signal ROM_TGC_REGCEB_openSignal     : std_logic;
   signal ROM_TGC_SSRB_openSignal       : std_logic;
   signal ROM_TGC_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal ROM_TGC_WEB_openSignal        : std_logic_vector (3 downto 0);
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
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
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component ExtractTGCParameter_process_p0
      port ( i_clock       : in    std_logic; 
             i_reset       : in    std_logic; 
             i_run         : in    std_logic; 
             i2c_mem_douta : in    std_logic_vector (7 downto 0); 
             i_data        : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena   : out   std_logic; 
             o_rdy         : out   std_logic; 
             i2c_mem_addra : out   std_logic_vector (11 downto 0); 
             o_address     : out   std_logic_vector (7 downto 0); 
             o_tgc         : out   std_logic_vector (31 downto 0));
   end component;
   
   attribute INIT_07 of ROM_TGC : label is 
         "3ffc00003ff800003ff400003ff000003fec00003fe800003fe400003fe00000";
   attribute INIT_06 of ROM_TGC : label is 
         "3fdc00003fd800003fd400003fd000003fcc00003fc800003fc400003fc00000";
   attribute INIT_05 of ROM_TGC : label is 
         "3fbc00003fb800003fb400003fb000003fac00003fa800003fa400003fa00000";
   attribute INIT_04 of ROM_TGC : label is 
         "3f9c00003f9800003f9400003f9000003f8c00003f8800003f8400003f800000";
   attribute INIT_03 of ROM_TGC : label is 
         "3f7800003f7000003f6800003f6000003f5800003f5000003f4800003f400000";
   attribute INIT_02 of ROM_TGC : label is 
         "3f3800003f3000003f2800003f2000003f1800003f1000003f0800003f000000";
   attribute INIT_01 of ROM_TGC : label is 
         "3ef000003ee000003ed000003ec000003eb000003ea000003e9000003e800000";
   attribute INIT_00 of ROM_TGC : label is 
         "3e6000003e4000003e2000003e0000003dc000003d8000003d00000000000000";
   attribute WRITE_WIDTH_B of ROM_TGC : label is "36";
   attribute WRITE_WIDTH_A of ROM_TGC : label is "36";
   attribute WRITE_MODE_B of ROM_TGC : label is "READ_FIRST";
   attribute WRITE_MODE_A of ROM_TGC : label is "READ_FIRST";
   attribute READ_WIDTH_B of ROM_TGC : label is "36";
   attribute READ_WIDTH_A of ROM_TGC : label is "36";
   attribute INIT_1F of ROM_TGC : label is 
         "bd000000bd800000bdc00000be000000be200000be400000be600000be800000";
   attribute INIT_1E of ROM_TGC : label is 
         "be900000bea00000beb00000bec00000bed00000bee00000bef00000bf000000";
   attribute INIT_1D of ROM_TGC : label is 
         "bf080000bf100000bf180000bf200000bf280000bf300000bf380000bf400000";
   attribute INIT_1C of ROM_TGC : label is 
         "bf480000bf500000bf580000bf600000bf680000bf700000bf780000bf800000";
   attribute INIT_1B of ROM_TGC : label is 
         "bf840000bf880000bf8c0000bf900000bf940000bf980000bf9c0000bfa00000";
   attribute INIT_1A of ROM_TGC : label is 
         "bfa40000bfa80000bfac0000bfb00000bfb40000bfb80000bfbc0000bfc00000";
   attribute INIT_19 of ROM_TGC : label is 
         "bfc40000bfc80000bfcc0000bfd00000bfd40000bfd80000bfdc0000bfe00000";
   attribute INIT_18 of ROM_TGC : label is 
         "bfe40000bfe80000bfec0000bff00000bff40000bff80000bffc0000c0000000";
   attribute INIT_17 of ROM_TGC : label is 
         "c0020000c0040000c0060000c0080000c00a0000c00c0000c00e0000c0100000";
   attribute INIT_16 of ROM_TGC : label is 
         "c0120000c0140000c0160000c0180000c01a0000c01c0000c01e0000c0200000";
   attribute INIT_15 of ROM_TGC : label is 
         "c0220000c0240000c0260000c0280000c02a0000c02c0000c02e0000c0300000";
   attribute INIT_14 of ROM_TGC : label is 
         "c0320000c0340000c0360000c0380000c03a0000c03c0000c03e0000c0400000";
   attribute INIT_13 of ROM_TGC : label is 
         "c0420000c0440000c0460000c0480000c04a0000c04c0000c04e0000c0500000";
   attribute INIT_12 of ROM_TGC : label is 
         "c0520000c0540000c0560000c0580000c05a0000c05c0000c05e0000c0600000";
   attribute INIT_11 of ROM_TGC : label is 
         "c0620000c0640000c0660000c0680000c06a0000c06c0000c06e0000c0700000";
   attribute INIT_10 of ROM_TGC : label is 
         "c0720000c0740000c0760000c0780000c07a0000c07c0000c07e0000c0800000";
   attribute INIT_0F of ROM_TGC : label is 
         "407e0000407c0000407a00004078000040760000407400004072000040700000";
   attribute INIT_0E of ROM_TGC : label is 
         "406e0000406c0000406a00004068000040660000406400004062000040600000";
   attribute INIT_0D of ROM_TGC : label is 
         "405e0000405c0000405a00004058000040560000405400004052000040500000";
   attribute INIT_0C of ROM_TGC : label is 
         "404e0000404c0000404a00004048000040460000404400004042000040400000";
   attribute INIT_0B of ROM_TGC : label is 
         "403e0000403c0000403a00004038000040360000403400004032000040300000";
   attribute INIT_0A of ROM_TGC : label is 
         "402e0000402c0000402a00004028000040260000402400004022000040200000";
   attribute INIT_09 of ROM_TGC : label is 
         "401e0000401c0000401a00004018000040160000401400004012000040100000";
   attribute INIT_08 of ROM_TGC : label is 
         "400e0000400c0000400a00004008000040060000400400004002000040000000";
begin
   BUF_0 : BUF
      port map (I=>XLXN_12(0),
                O=>ADDRA(5));
   
   BUF_1 : BUF
      port map (I=>XLXN_12(1),
                O=>ADDRA(6));
   
   BUF_2 : BUF
      port map (I=>XLXN_12(2),
                O=>ADDRA(7));
   
   BUF_3 : BUF
      port map (I=>XLXN_12(3),
                O=>ADDRA(8));
   
   BUF_4 : BUF
      port map (I=>XLXN_12(4),
                O=>ADDRA(9));
   
   BUF_5 : BUF
      port map (I=>XLXN_12(5),
                O=>ADDRA(10));
   
   BUF_6 : BUF
      port map (I=>XLXN_12(6),
                O=>ADDRA(11));
   
   BUF_7 : BUF
      port map (I=>XLXN_12(7),
                O=>ADDRA(12));
   
   ROM_TGC : RAMB16
   -- synopsys translate_off
   generic map( INIT_07 => 
         x"3ffc00003ff800003ff400003ff000003fec00003fe800003fe400003fe00000",
            INIT_06 => 
         x"3fdc00003fd800003fd400003fd000003fcc00003fc800003fc400003fc00000",
            INIT_05 => 
         x"3fbc00003fb800003fb400003fb000003fac00003fa800003fa400003fa00000",
            INIT_04 => 
         x"3f9c00003f9800003f9400003f9000003f8c00003f8800003f8400003f800000",
            INIT_03 => 
         x"3f7800003f7000003f6800003f6000003f5800003f5000003f4800003f400000",
            INIT_02 => 
         x"3f3800003f3000003f2800003f2000003f1800003f1000003f0800003f000000",
            INIT_01 => 
         x"3ef000003ee000003ed000003ec000003eb000003ea000003e9000003e800000",
            INIT_00 => 
         x"3e6000003e4000003e2000003e0000003dc000003d8000003d00000000000000",
            WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36,
            INIT_1F => 
         x"bd000000bd800000bdc00000be000000be200000be400000be600000be800000",
            INIT_1E => 
         x"be900000bea00000beb00000bec00000bed00000bee00000bef00000bf000000",
            INIT_1D => 
         x"bf080000bf100000bf180000bf200000bf280000bf300000bf380000bf400000",
            INIT_1C => 
         x"bf480000bf500000bf580000bf600000bf680000bf700000bf780000bf800000",
            INIT_1B => 
         x"bf840000bf880000bf8c0000bf900000bf940000bf980000bf9c0000bfa00000",
            INIT_1A => 
         x"bfa40000bfa80000bfac0000bfb00000bfb40000bfb80000bfbc0000bfc00000",
            INIT_19 => 
         x"bfc40000bfc80000bfcc0000bfd00000bfd40000bfd80000bfdc0000bfe00000",
            INIT_18 => 
         x"bfe40000bfe80000bfec0000bff00000bff40000bff80000bffc0000c0000000",
            INIT_17 => 
         x"c0020000c0040000c0060000c0080000c00a0000c00c0000c00e0000c0100000",
            INIT_16 => 
         x"c0120000c0140000c0160000c0180000c01a0000c01c0000c01e0000c0200000",
            INIT_15 => 
         x"c0220000c0240000c0260000c0280000c02a0000c02c0000c02e0000c0300000",
            INIT_14 => 
         x"c0320000c0340000c0360000c0380000c03a0000c03c0000c03e0000c0400000",
            INIT_13 => 
         x"c0420000c0440000c0460000c0480000c04a0000c04c0000c04e0000c0500000",
            INIT_12 => 
         x"c0520000c0540000c0560000c0580000c05a0000c05c0000c05e0000c0600000",
            INIT_11 => 
         x"c0620000c0640000c0660000c0680000c06a0000c06c0000c06e0000c0700000",
            INIT_10 => 
         x"c0720000c0740000c0760000c0780000c07a0000c07c0000c07e0000c0800000",
            INIT_0F => 
         x"407e0000407c0000407a00004078000040760000407400004072000040700000",
            INIT_0E => 
         x"406e0000406c0000406a00004068000040660000406400004062000040600000",
            INIT_0D => 
         x"405e0000405c0000405a00004058000040560000405400004052000040500000",
            INIT_0C => 
         x"404e0000404c0000404a00004048000040460000404400004042000040400000",
            INIT_0B => 
         x"403e0000403c0000403a00004038000040360000403400004032000040300000",
            INIT_0A => 
         x"402e0000402c0000402a00004028000040260000402400004022000040200000",
            INIT_09 => 
         x"401e0000401c0000401a00004018000040160000401400004012000040100000",
            INIT_08 => 
         x"400e0000400c0000400a00004008000040060000400400004002000040000000")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>ADDRA(14 downto 0),
                ADDRB(14 downto 0)=>ROM_TGC_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>ROM_TGC_CASCADEINA_openSignal,
                CASCADEINB=>ROM_TGC_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>ROM_TGC_CLKB_openSignal,
                DIA(31 downto 0)=>ROM_TGC_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>ROM_TGC_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>ROM_TGC_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>ROM_TGC_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_11,
                ENB=>ROM_TGC_ENB_openSignal,
                REGCEA=>ROM_TGC_REGCEA_openSignal,
                REGCEB=>ROM_TGC_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>ROM_TGC_SSRB_openSignal,
                WEA(3 downto 0)=>ROM_TGC_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>ROM_TGC_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_13(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_5_0 : GND
      port map (G=>ADDRA(13));
   
   XLXI_5_1 : GND
      port map (G=>ADDRA(14));
   
   XLXI_6_0 : GND
      port map (G=>ADDRA(0));
   
   XLXI_6_1 : GND
      port map (G=>ADDRA(1));
   
   XLXI_6_2 : GND
      port map (G=>ADDRA(2));
   
   XLXI_6_3 : GND
      port map (G=>ADDRA(3));
   
   XLXI_6_4 : GND
      port map (G=>ADDRA(4));
   
   XLXI_7 : VCC
      port map (P=>XLXN_11);
   
   XLXI_8 : ExtractTGCParameter_process_p0
      port map (i_clock=>i_clock,
                i_data(31 downto 0)=>XLXN_13(31 downto 0),
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                i2c_mem_addra(11 downto 0)=>i2c_mem_addra(11 downto 0),
                i2c_mem_ena=>i2c_mem_ena,
                o_address(7 downto 0)=>XLXN_12(7 downto 0),
                o_rdy=>o_rdy,
                o_tgc(31 downto 0)=>o_tgc(31 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CalculateVirCompensated is
   port ( addfpr        : in    std_logic_vector (31 downto 0); 
          addfprdy      : in    std_logic; 
          divfpr        : in    std_logic_vector (31 downto 0); 
          divfprdy      : in    std_logic; 
          i_addr        : in    std_logic_vector (9 downto 0); 
          i_clock       : in    std_logic; 
          i_Emissivity  : in    std_logic_vector (31 downto 0); 
          i_pixoscpsp0  : in    std_logic_vector (31 downto 0); 
          i_pixoscpsp1  : in    std_logic_vector (31 downto 0); 
          i_pixos_do    : in    std_logic_vector (31 downto 0); 
          i_reset       : in    std_logic; 
          i_run         : in    std_logic; 
          i2c_mem_douta : in    std_logic_vector (7 downto 0); 
          mulfpr        : in    std_logic_vector (31 downto 0); 
          mulfprdy      : in    std_logic; 
          subfpr        : in    std_logic_vector (31 downto 0); 
          subfprdy      : in    std_logic; 
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
          o_pixos_addr  : out   std_logic_vector (9 downto 0); 
          o_rdy         : out   std_logic; 
          subfpa        : out   std_logic_vector (31 downto 0); 
          subfpb        : out   std_logic_vector (31 downto 0); 
          subfpce       : out   std_logic; 
          subfpond      : out   std_logic; 
          subfpsclr     : out   std_logic);
end CalculateVirCompensated;

architecture BEHAVIORAL of CalculateVirCompensated is
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
   signal mux_addr1                                  : std_logic_vector (9 
         downto 0);
   signal XLXN_44                                    : std_logic_vector (14 
         downto 0);
   signal XLXN_45                                    : std_logic_vector (14 
         downto 0);
   signal XLXN_59                                    : std_logic;
   signal XLXN_78                                    : std_logic_vector (31 
         downto 0);
   signal XLXN_79                                    : std_logic_vector (31 
         downto 0);
   signal XLXN_139                                   : std_logic_vector (3 
         downto 0);
   signal XLXN_212                                   : std_logic;
   signal XLXN_213                                   : std_logic_vector (11 
         downto 0);
   signal XLXN_214                                   : std_logic_vector (31 
         downto 0);
   signal XLXN_215                                   : std_logic_vector (31 
         downto 0);
   signal XLXN_216                                   : std_logic_vector (31 
         downto 0);
   signal XLXN_217                                   : std_logic;
   signal XLXN_218                                   : std_logic;
   signal XLXN_236                                   : std_logic;
   signal XLXN_239                                   : std_logic_vector (31 
         downto 0);
   signal XLXN_241                                   : std_logic_vector (9 
         downto 0);
   signal o_rdy_DUMMY                                : std_logic;
   signal mem_vir_compensated1_ADDRB_openSignal      : std_logic_vector (14 
         downto 0);
   signal mem_vir_compensated1_CASCADEINA_openSignal : std_logic;
   signal mem_vir_compensated1_CASCADEINB_openSignal : std_logic;
   signal mem_vir_compensated1_CLKB_openSignal       : std_logic;
   signal mem_vir_compensated1_DIB_openSignal        : std_logic_vector (31 
         downto 0);
   signal mem_vir_compensated1_DIPA_openSignal       : std_logic_vector (3 
         downto 0);
   signal mem_vir_compensated1_DIPB_openSignal       : std_logic_vector (3 
         downto 0);
   signal mem_vir_compensated1_ENB_openSignal        : std_logic;
   signal mem_vir_compensated1_REGCEA_openSignal     : std_logic;
   signal mem_vir_compensated1_REGCEB_openSignal     : std_logic;
   signal mem_vir_compensated1_SSRB_openSignal       : std_logic;
   signal mem_vir_compensated1_WEB_openSignal        : std_logic_vector (3 
         downto 0);
   signal mem_vir_compensated2_ADDRB_openSignal      : std_logic_vector (14 
         downto 0);
   signal mem_vir_compensated2_CASCADEINA_openSignal : std_logic;
   signal mem_vir_compensated2_CASCADEINB_openSignal : std_logic;
   signal mem_vir_compensated2_CLKB_openSignal       : std_logic;
   signal mem_vir_compensated2_DIB_openSignal        : std_logic_vector (31 
         downto 0);
   signal mem_vir_compensated2_DIPA_openSignal       : std_logic_vector (3 
         downto 0);
   signal mem_vir_compensated2_DIPB_openSignal       : std_logic_vector (3 
         downto 0);
   signal mem_vir_compensated2_ENB_openSignal        : std_logic;
   signal mem_vir_compensated2_REGCEA_openSignal     : std_logic;
   signal mem_vir_compensated2_REGCEB_openSignal     : std_logic;
   signal mem_vir_compensated2_SSRB_openSignal       : std_logic;
   signal mem_vir_compensated2_WEB_openSignal        : std_logic_vector (3 
         downto 0);
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
   
   component M2_1_MXILINX_CalculateVirCompensated
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
   
   component ExtractTGCParameter_MUSER_CalculateVirCompensated
      port ( i_clock       : in    std_logic; 
             i_reset       : in    std_logic; 
             o_tgc         : out   std_logic_vector (31 downto 0); 
             i_run         : in    std_logic; 
             i2c_mem_douta : in    std_logic_vector (7 downto 0); 
             i2c_mem_ena   : out   std_logic; 
             o_rdy         : out   std_logic; 
             i2c_mem_addra : out   std_logic_vector (11 downto 0));
   end component;
   
   component mem_switchpattern_MUSER_CalculateVirCompensated
      port ( i_reset   : in    std_logic; 
             i_clock   : in    std_logic; 
             i_pixel   : in    std_logic_vector (11 downto 0); 
             o_pattern : out   std_logic);
   end component;
   
   component CalculateVirCompensated_process_p0
      port ( i_clock                  : in    std_logic; 
             i_reset                  : in    std_logic; 
             i_run                    : in    std_logic; 
             ExtractTGCParameters_rdy : in    std_logic; 
             divfprdy                 : in    std_logic; 
             mulfprdy                 : in    std_logic; 
             addfprdy                 : in    std_logic; 
             subfprdy                 : in    std_logic; 
             i_Emissivity             : in    std_logic_vector (31 downto 0); 
             i_pixoscpsp0             : in    std_logic_vector (31 downto 0); 
             i_pixoscpsp1             : in    std_logic_vector (31 downto 0); 
             i_pixos_do               : in    std_logic_vector (31 downto 0); 
             ExtractTGCParameters_tgc : in    std_logic_vector (31 downto 0); 
             pattern_neg_ft           : in    std_logic_vector (31 downto 0); 
             pattern_ft               : in    std_logic_vector (31 downto 0); 
             divfpr                   : in    std_logic_vector (31 downto 0); 
             mulfpr                   : in    std_logic_vector (31 downto 0); 
             addfpr                   : in    std_logic_vector (31 downto 0); 
             subfpr                   : in    std_logic_vector (31 downto 0); 
             o_rdy                    : out   std_logic; 
             ExtractTGCParameters_run : out   std_logic; 
             ExtractTGCParameters_mux : out   std_logic; 
             o_write_enable           : out   std_logic; 
             divfpond                 : out   std_logic; 
             divfpsclr                : out   std_logic; 
             divfpce                  : out   std_logic; 
             mulfpond                 : out   std_logic; 
             mulfpsclr                : out   std_logic; 
             mulfpce                  : out   std_logic; 
             addfpond                 : out   std_logic; 
             addfpsclr                : out   std_logic; 
             addfpce                  : out   std_logic; 
             subfpond                 : out   std_logic; 
             subfpsclr                : out   std_logic; 
             subfpce                  : out   std_logic; 
             o_pixos_addr             : out   std_logic_vector (9 downto 0); 
             o_addra                  : out   std_logic_vector (9 downto 0); 
             o_dia                    : out   std_logic_vector (31 downto 0); 
             mem_switchpattern_pixel  : out   std_logic_vector (11 downto 0); 
             divfpa                   : out   std_logic_vector (31 downto 0); 
             divfpb                   : out   std_logic_vector (31 downto 0); 
             mulfpa                   : out   std_logic_vector (31 downto 0); 
             mulfpb                   : out   std_logic_vector (31 downto 0); 
             addfpa                   : out   std_logic_vector (31 downto 0); 
             addfpb                   : out   std_logic_vector (31 downto 0); 
             subfpa                   : out   std_logic_vector (31 downto 0); 
             subfpb                   : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_switchpattern_neg
      port ( pattern_in  : in    std_logic; 
             pattern_out : out   std_logic_vector (31 downto 0));
   end component;
   
   component rom_switchpattern_pos
      port ( pattern_in  : in    std_logic; 
             pattern_out : out   std_logic_vector (31 downto 0));
   end component;
   
   attribute WRITE_WIDTH_B of mem_vir_compensated1 : label is "36";
   attribute WRITE_WIDTH_A of mem_vir_compensated1 : label is "36";
   attribute WRITE_MODE_B of mem_vir_compensated1 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_vir_compensated1 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_vir_compensated1 : label is "36";
   attribute READ_WIDTH_A of mem_vir_compensated1 : label is "36";
   attribute WRITE_WIDTH_B of mem_vir_compensated2 : label is "36";
   attribute WRITE_WIDTH_A of mem_vir_compensated2 : label is "36";
   attribute WRITE_MODE_B of mem_vir_compensated2 : label is "READ_FIRST";
   attribute WRITE_MODE_A of mem_vir_compensated2 : label is "READ_FIRST";
   attribute READ_WIDTH_B of mem_vir_compensated2 : label is "36";
   attribute READ_WIDTH_A of mem_vir_compensated2 : label is "36";
   attribute HU_SET of MUX_ADDR_0 : label is "MUX_ADDR_0_2448";
   attribute HU_SET of MUX_ADDR_1 : label is "MUX_ADDR_1_2447";
   attribute HU_SET of MUX_ADDR_2 : label is "MUX_ADDR_2_2446";
   attribute HU_SET of MUX_ADDR_3 : label is "MUX_ADDR_3_2445";
   attribute HU_SET of MUX_ADDR_4 : label is "MUX_ADDR_4_2444";
   attribute HU_SET of MUX_ADDR_5 : label is "MUX_ADDR_5_2443";
   attribute HU_SET of MUX_ADDR_6 : label is "MUX_ADDR_6_2442";
   attribute HU_SET of MUX_ADDR_7 : label is "MUX_ADDR_7_2441";
   attribute HU_SET of MUX_ADDR_8 : label is "MUX_ADDR_8_2440";
   attribute HU_SET of MUX_ADDR_9 : label is "MUX_ADDR_9_2439";
   attribute HU_SET of MUX_DO_0 : label is "MUX_DO_0_2438";
   attribute HU_SET of MUX_DO_1 : label is "MUX_DO_1_2437";
   attribute HU_SET of MUX_DO_2 : label is "MUX_DO_2_2436";
   attribute HU_SET of MUX_DO_3 : label is "MUX_DO_3_2435";
   attribute HU_SET of MUX_DO_4 : label is "MUX_DO_4_2434";
   attribute HU_SET of MUX_DO_5 : label is "MUX_DO_5_2433";
   attribute HU_SET of MUX_DO_6 : label is "MUX_DO_6_2432";
   attribute HU_SET of MUX_DO_7 : label is "MUX_DO_7_2431";
   attribute HU_SET of MUX_DO_8 : label is "MUX_DO_8_2430";
   attribute HU_SET of MUX_DO_9 : label is "MUX_DO_9_2429";
   attribute HU_SET of MUX_DO_10 : label is "MUX_DO_10_2428";
   attribute HU_SET of MUX_DO_11 : label is "MUX_DO_11_2427";
   attribute HU_SET of MUX_DO_12 : label is "MUX_DO_12_2426";
   attribute HU_SET of MUX_DO_13 : label is "MUX_DO_13_2425";
   attribute HU_SET of MUX_DO_14 : label is "MUX_DO_14_2424";
   attribute HU_SET of MUX_DO_15 : label is "MUX_DO_15_2423";
   attribute HU_SET of MUX_DO_16 : label is "MUX_DO_16_2422";
   attribute HU_SET of MUX_DO_17 : label is "MUX_DO_17_2421";
   attribute HU_SET of MUX_DO_18 : label is "MUX_DO_18_2420";
   attribute HU_SET of MUX_DO_19 : label is "MUX_DO_19_2419";
   attribute HU_SET of MUX_DO_20 : label is "MUX_DO_20_2418";
   attribute HU_SET of MUX_DO_21 : label is "MUX_DO_21_2417";
   attribute HU_SET of MUX_DO_22 : label is "MUX_DO_22_2416";
   attribute HU_SET of MUX_DO_23 : label is "MUX_DO_23_2415";
   attribute HU_SET of MUX_DO_24 : label is "MUX_DO_24_2414";
   attribute HU_SET of MUX_DO_25 : label is "MUX_DO_25_2413";
   attribute HU_SET of MUX_DO_26 : label is "MUX_DO_26_2412";
   attribute HU_SET of MUX_DO_27 : label is "MUX_DO_27_2411";
   attribute HU_SET of MUX_DO_28 : label is "MUX_DO_28_2410";
   attribute HU_SET of MUX_DO_29 : label is "MUX_DO_29_2409";
   attribute HU_SET of MUX_DO_30 : label is "MUX_DO_30_2408";
   attribute HU_SET of MUX_DO_31 : label is "MUX_DO_31_2407";
begin
   o_rdy <= o_rdy_DUMMY;
   mem_vir_compensated1 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_44(14 downto 0),
                ADDRB(14 downto 0)=>mem_vir_compensated1_ADDRB_openSignal(14 
            downto 0),
                CASCADEINA=>mem_vir_compensated1_CASCADEINA_openSignal,
                CASCADEINB=>mem_vir_compensated1_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_vir_compensated1_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_239(31 downto 0),
                DIB(31 downto 0)=>mem_vir_compensated1_DIB_openSignal(31 downto 
            0),
                DIPA(3 downto 0)=>mem_vir_compensated1_DIPA_openSignal(3 downto 
            0),
                DIPB(3 downto 0)=>mem_vir_compensated1_DIPB_openSignal(3 downto 
            0),
                ENA=>XLXN_59,
                ENB=>mem_vir_compensated1_ENB_openSignal,
                REGCEA=>mem_vir_compensated1_REGCEA_openSignal,
                REGCEB=>mem_vir_compensated1_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_vir_compensated1_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_vir_compensated1_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_79(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   mem_vir_compensated2 : RAMB16
   -- synopsys translate_off
   generic map( WRITE_WIDTH_B => 36,
            WRITE_WIDTH_A => 36,
            WRITE_MODE_B => "READ_FIRST",
            WRITE_MODE_A => "READ_FIRST",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>XLXN_45(14 downto 0),
                ADDRB(14 downto 0)=>mem_vir_compensated2_ADDRB_openSignal(14 
            downto 0),
                CASCADEINA=>mem_vir_compensated2_CASCADEINA_openSignal,
                CASCADEINB=>mem_vir_compensated2_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>mem_vir_compensated2_CLKB_openSignal,
                DIA(31 downto 0)=>XLXN_239(31 downto 0),
                DIB(31 downto 0)=>mem_vir_compensated2_DIB_openSignal(31 downto 
            0),
                DIPA(3 downto 0)=>mem_vir_compensated2_DIPA_openSignal(3 downto 
            0),
                DIPB(3 downto 0)=>mem_vir_compensated2_DIPB_openSignal(3 downto 
            0),
                ENA=>mux_addr1(9),
                ENB=>mem_vir_compensated2_ENB_openSignal,
                REGCEA=>mem_vir_compensated2_REGCEA_openSignal,
                REGCEB=>mem_vir_compensated2_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>mem_vir_compensated2_SSRB_openSignal,
                WEA(3 downto 0)=>XLXN_139(3 downto 0),
                WEB(3 downto 0)=>mem_vir_compensated2_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_78(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   MUX_ADDR_0 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_241(0),
                D1=>i_addr(0),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(0));
   
   MUX_ADDR_1 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_241(1),
                D1=>i_addr(1),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(1));
   
   MUX_ADDR_2 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_241(2),
                D1=>i_addr(2),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(2));
   
   MUX_ADDR_3 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_241(3),
                D1=>i_addr(3),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(3));
   
   MUX_ADDR_4 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_241(4),
                D1=>i_addr(4),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(4));
   
   MUX_ADDR_5 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_241(5),
                D1=>i_addr(5),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(5));
   
   MUX_ADDR_6 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_241(6),
                D1=>i_addr(6),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(6));
   
   MUX_ADDR_7 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_241(7),
                D1=>i_addr(7),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(7));
   
   MUX_ADDR_8 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_241(8),
                D1=>i_addr(8),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(8));
   
   MUX_ADDR_9 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_241(9),
                D1=>i_addr(9),
                S0=>o_rdy_DUMMY,
                O=>mux_addr1(9));
   
   MUX_DO_0 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(0),
                D1=>XLXN_78(0),
                S0=>mux_addr1(9),
                O=>o_do(0));
   
   MUX_DO_1 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(1),
                D1=>XLXN_78(1),
                S0=>mux_addr1(9),
                O=>o_do(1));
   
   MUX_DO_2 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(2),
                D1=>XLXN_78(2),
                S0=>mux_addr1(9),
                O=>o_do(2));
   
   MUX_DO_3 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(3),
                D1=>XLXN_78(3),
                S0=>mux_addr1(9),
                O=>o_do(3));
   
   MUX_DO_4 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(4),
                D1=>XLXN_78(4),
                S0=>mux_addr1(9),
                O=>o_do(4));
   
   MUX_DO_5 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(5),
                D1=>XLXN_78(5),
                S0=>mux_addr1(9),
                O=>o_do(5));
   
   MUX_DO_6 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(6),
                D1=>XLXN_78(6),
                S0=>mux_addr1(9),
                O=>o_do(6));
   
   MUX_DO_7 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(7),
                D1=>XLXN_78(7),
                S0=>mux_addr1(9),
                O=>o_do(7));
   
   MUX_DO_8 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(8),
                D1=>XLXN_78(8),
                S0=>mux_addr1(9),
                O=>o_do(8));
   
   MUX_DO_9 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(9),
                D1=>XLXN_78(9),
                S0=>mux_addr1(9),
                O=>o_do(9));
   
   MUX_DO_10 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(10),
                D1=>XLXN_78(10),
                S0=>mux_addr1(9),
                O=>o_do(10));
   
   MUX_DO_11 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(11),
                D1=>XLXN_78(11),
                S0=>mux_addr1(9),
                O=>o_do(11));
   
   MUX_DO_12 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(12),
                D1=>XLXN_78(12),
                S0=>mux_addr1(9),
                O=>o_do(12));
   
   MUX_DO_13 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(13),
                D1=>XLXN_78(13),
                S0=>mux_addr1(9),
                O=>o_do(13));
   
   MUX_DO_14 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(14),
                D1=>XLXN_78(14),
                S0=>mux_addr1(9),
                O=>o_do(14));
   
   MUX_DO_15 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(15),
                D1=>XLXN_78(15),
                S0=>mux_addr1(9),
                O=>o_do(15));
   
   MUX_DO_16 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(16),
                D1=>XLXN_78(16),
                S0=>mux_addr1(9),
                O=>o_do(16));
   
   MUX_DO_17 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(17),
                D1=>XLXN_78(17),
                S0=>mux_addr1(9),
                O=>o_do(17));
   
   MUX_DO_18 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(18),
                D1=>XLXN_78(18),
                S0=>mux_addr1(9),
                O=>o_do(18));
   
   MUX_DO_19 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(19),
                D1=>XLXN_78(19),
                S0=>mux_addr1(9),
                O=>o_do(19));
   
   MUX_DO_20 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(20),
                D1=>XLXN_78(20),
                S0=>mux_addr1(9),
                O=>o_do(20));
   
   MUX_DO_21 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(21),
                D1=>XLXN_78(21),
                S0=>mux_addr1(9),
                O=>o_do(21));
   
   MUX_DO_22 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(22),
                D1=>XLXN_78(22),
                S0=>mux_addr1(9),
                O=>o_do(22));
   
   MUX_DO_23 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(23),
                D1=>XLXN_78(23),
                S0=>mux_addr1(9),
                O=>o_do(23));
   
   MUX_DO_24 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(24),
                D1=>XLXN_78(24),
                S0=>mux_addr1(9),
                O=>o_do(24));
   
   MUX_DO_25 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(25),
                D1=>XLXN_78(25),
                S0=>mux_addr1(9),
                O=>o_do(25));
   
   MUX_DO_26 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(26),
                D1=>XLXN_78(26),
                S0=>mux_addr1(9),
                O=>o_do(26));
   
   MUX_DO_27 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(27),
                D1=>XLXN_78(27),
                S0=>mux_addr1(9),
                O=>o_do(27));
   
   MUX_DO_28 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(28),
                D1=>XLXN_78(28),
                S0=>mux_addr1(9),
                O=>o_do(28));
   
   MUX_DO_29 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(29),
                D1=>XLXN_78(29),
                S0=>mux_addr1(9),
                O=>o_do(29));
   
   MUX_DO_30 : M2_1_MXILINX_CalculateVirCompensated
      port map (D0=>XLXN_79(30),
                D1=>XLXN_78(30),
                S0=>mux_addr1(9),
                O=>o_do(30));
   
   MUX_DO_31 : M2_1_MXILINX_CalculateVirCompensated
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
      port map (I=>XLXN_236,
                O=>XLXN_139(0));
   
   XLXI_29_1 : BUF
      port map (I=>XLXN_236,
                O=>XLXN_139(1));
   
   XLXI_29_2 : BUF
      port map (I=>XLXN_236,
                O=>XLXN_139(2));
   
   XLXI_29_3 : BUF
      port map (I=>XLXN_236,
                O=>XLXN_139(3));
   
   XLXI_31 : ExtractTGCParameter_MUSER_CalculateVirCompensated
      port map (i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>XLXN_218,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                i2c_mem_addra(11 downto 0)=>i2c_mem_addra(11 downto 0),
                i2c_mem_ena=>i2c_mem_ena,
                o_rdy=>XLXN_217,
                o_tgc(31 downto 0)=>XLXN_216(31 downto 0));
   
   XLXI_32 : mem_switchpattern_MUSER_CalculateVirCompensated
      port map (i_clock=>i_clock,
                i_pixel(11 downto 0)=>XLXN_213(11 downto 0),
                i_reset=>i_reset,
                o_pattern=>XLXN_212);
   
   XLXI_33 : CalculateVirCompensated_process_p0
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                ExtractTGCParameters_rdy=>XLXN_217,
                ExtractTGCParameters_tgc(31 downto 0)=>XLXN_216(31 downto 0),
                i_clock=>i_clock,
                i_Emissivity(31 downto 0)=>i_Emissivity(31 downto 0),
                i_pixoscpsp0(31 downto 0)=>i_pixoscpsp0(31 downto 0),
                i_pixoscpsp1(31 downto 0)=>i_pixoscpsp1(31 downto 0),
                i_pixos_do(31 downto 0)=>i_pixos_do(31 downto 0),
                i_reset=>i_reset,
                i_run=>i_run,
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
                pattern_ft(31 downto 0)=>XLXN_215(31 downto 0),
                pattern_neg_ft(31 downto 0)=>XLXN_214(31 downto 0),
                subfpr(31 downto 0)=>subfpr(31 downto 0),
                subfprdy=>subfprdy,
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
                ExtractTGCParameters_mux=>open,
                ExtractTGCParameters_run=>XLXN_218,
                mem_switchpattern_pixel(11 downto 0)=>XLXN_213(11 downto 0),
                mulfpa(31 downto 0)=>mulfpa(31 downto 0),
                mulfpb(31 downto 0)=>mulfpb(31 downto 0),
                mulfpce=>mulfpce,
                mulfpond=>mulfpond,
                mulfpsclr=>mulfpsclr,
                o_addra(9 downto 0)=>XLXN_241(9 downto 0),
                o_dia(31 downto 0)=>XLXN_239(31 downto 0),
                o_pixos_addr(9 downto 0)=>o_pixos_addr(9 downto 0),
                o_rdy=>o_rdy_DUMMY,
                o_write_enable=>XLXN_236,
                subfpa(31 downto 0)=>subfpa(31 downto 0),
                subfpb(31 downto 0)=>subfpb(31 downto 0),
                subfpce=>subfpce,
                subfpond=>subfpond,
                subfpsclr=>subfpsclr);
   
   XLXI_76 : rom_switchpattern_neg
      port map (pattern_in=>XLXN_212,
                pattern_out(31 downto 0)=>XLXN_214(31 downto 0));
   
   XLXI_77 : rom_switchpattern_pos
      port map (pattern_in=>XLXN_212,
                pattern_out(31 downto 0)=>XLXN_215(31 downto 0));
   
end BEHAVIORAL;


