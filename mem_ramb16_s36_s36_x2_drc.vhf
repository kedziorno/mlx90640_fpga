--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : mem_ramb16_s36_s36_x2_drc.vhf
-- /___/   /\     Timestamp : 06/09/2023 22:10:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: /home/user/.local/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -sympath /home/user/workspace/melexis_mlx90641/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl mem_ramb16_s36_s36_x2_drc.vhf -w /home/user/workspace/melexis_mlx90641/mem_ramb16_s36_s36_x2.sch
--Design Name: mem_ramb16_s36_s36_x2
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

entity M2_1_MXILINX_mem_ramb16_s36_s36_x2 is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_mem_ramb16_s36_s36_x2;

architecture BEHAVIORAL of M2_1_MXILINX_mem_ramb16_s36_s36_x2 is
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

entity D2_4E_MXILINX_mem_ramb16_s36_s36_x2 is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          E  : in    std_logic; 
          D0 : out   std_logic; 
          D1 : out   std_logic; 
          D2 : out   std_logic; 
          D3 : out   std_logic);
end D2_4E_MXILINX_mem_ramb16_s36_s36_x2;

architecture BEHAVIORAL of D2_4E_MXILINX_mem_ramb16_s36_s36_x2 is
   attribute BOX_TYPE   : string ;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
begin
   I_36_30 : AND3
      port map (I0=>A1,
                I1=>A0,
                I2=>E,
                O=>D3);
   
   I_36_31 : AND3B1
      port map (I0=>A0,
                I1=>A1,
                I2=>E,
                O=>D2);
   
   I_36_32 : AND3B1
      port map (I0=>A1,
                I1=>A0,
                I2=>E,
                O=>D1);
   
   I_36_33 : AND3B2
      port map (I0=>A0,
                I1=>A1,
                I2=>E,
                O=>D0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mem_ramb16_s36_s36_x2 is
   port ( ADDRA   : in    std_logic_vector (9 downto 0); 
          i_clock : in    std_logic; 
          i_reset : in    std_logic; 
          DOA     : out   std_logic_vector (31 downto 0));
end mem_ramb16_s36_s36_x2;

architecture BEHAVIORAL of mem_ramb16_s36_s36_x2 is
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
   attribute HU_SET              : string ;
   signal MEM1_ADDRA                    : std_logic_vector (14 downto 0);
   signal MEM2_ADDRA                    : std_logic_vector (14 downto 0);
   signal XLXN_41                       : std_logic_vector (9 downto 0);
   signal XLXN_44                       : std_logic_vector (9 downto 0);
   signal XLXN_53                       : std_logic;
   signal XLXN_56                       : std_logic;
   signal XLXN_57                       : std_logic;
   signal XLXN_58                       : std_logic_vector (31 downto 0);
   signal XLXN_59                       : std_logic_vector (31 downto 0);
   signal XLXI_26_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal XLXI_26_CASCADEINA_openSignal : std_logic;
   signal XLXI_26_CASCADEINB_openSignal : std_logic;
   signal XLXI_26_CLKB_openSignal       : std_logic;
   signal XLXI_26_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal XLXI_26_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal XLXI_26_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal XLXI_26_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal XLXI_26_ENB_openSignal        : std_logic;
   signal XLXI_26_REGCEA_openSignal     : std_logic;
   signal XLXI_26_REGCEB_openSignal     : std_logic;
   signal XLXI_26_SSRB_openSignal       : std_logic;
   signal XLXI_26_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal XLXI_26_WEB_openSignal        : std_logic_vector (3 downto 0);
   signal XLXI_35_ADDRB_openSignal      : std_logic_vector (14 downto 0);
   signal XLXI_35_CASCADEINA_openSignal : std_logic;
   signal XLXI_35_CASCADEINB_openSignal : std_logic;
   signal XLXI_35_CLKB_openSignal       : std_logic;
   signal XLXI_35_DIA_openSignal        : std_logic_vector (31 downto 0);
   signal XLXI_35_DIB_openSignal        : std_logic_vector (31 downto 0);
   signal XLXI_35_DIPA_openSignal       : std_logic_vector (3 downto 0);
   signal XLXI_35_DIPB_openSignal       : std_logic_vector (3 downto 0);
   signal XLXI_35_ENB_openSignal        : std_logic;
   signal XLXI_35_REGCEA_openSignal     : std_logic;
   signal XLXI_35_REGCEB_openSignal     : std_logic;
   signal XLXI_35_SSRB_openSignal       : std_logic;
   signal XLXI_35_WEA_openSignal        : std_logic_vector (3 downto 0);
   signal XLXI_35_WEB_openSignal        : std_logic_vector (3 downto 0);
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
   
   component D2_4E_MXILINX_mem_ramb16_s36_s36_x2
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute INIT_FILE of XLXI_26 : label is "mem_ktptat_1.txt";
   attribute INIT_FILE of XLXI_35 : label is "mem_ktptat_2.txt";
   attribute HU_SET of XLXI_38 : label is "XLXI_38_0";
   attribute HU_SET of XLXI_40_0 : label is "XLXI_40_0_32";
   attribute HU_SET of XLXI_40_1 : label is "XLXI_40_1_31";
   attribute HU_SET of XLXI_40_2 : label is "XLXI_40_2_30";
   attribute HU_SET of XLXI_40_3 : label is "XLXI_40_3_29";
   attribute HU_SET of XLXI_40_4 : label is "XLXI_40_4_28";
   attribute HU_SET of XLXI_40_5 : label is "XLXI_40_5_27";
   attribute HU_SET of XLXI_40_6 : label is "XLXI_40_6_26";
   attribute HU_SET of XLXI_40_7 : label is "XLXI_40_7_25";
   attribute HU_SET of XLXI_40_8 : label is "XLXI_40_8_24";
   attribute HU_SET of XLXI_40_9 : label is "XLXI_40_9_23";
   attribute HU_SET of XLXI_40_10 : label is "XLXI_40_10_22";
   attribute HU_SET of XLXI_40_11 : label is "XLXI_40_11_21";
   attribute HU_SET of XLXI_40_12 : label is "XLXI_40_12_20";
   attribute HU_SET of XLXI_40_13 : label is "XLXI_40_13_19";
   attribute HU_SET of XLXI_40_14 : label is "XLXI_40_14_18";
   attribute HU_SET of XLXI_40_15 : label is "XLXI_40_15_17";
   attribute HU_SET of XLXI_40_16 : label is "XLXI_40_16_16";
   attribute HU_SET of XLXI_40_17 : label is "XLXI_40_17_15";
   attribute HU_SET of XLXI_40_18 : label is "XLXI_40_18_14";
   attribute HU_SET of XLXI_40_19 : label is "XLXI_40_19_13";
   attribute HU_SET of XLXI_40_20 : label is "XLXI_40_20_12";
   attribute HU_SET of XLXI_40_21 : label is "XLXI_40_21_11";
   attribute HU_SET of XLXI_40_22 : label is "XLXI_40_22_10";
   attribute HU_SET of XLXI_40_23 : label is "XLXI_40_23_9";
   attribute HU_SET of XLXI_40_24 : label is "XLXI_40_24_8";
   attribute HU_SET of XLXI_40_25 : label is "XLXI_40_25_7";
   attribute HU_SET of XLXI_40_26 : label is "XLXI_40_26_6";
   attribute HU_SET of XLXI_40_27 : label is "XLXI_40_27_5";
   attribute HU_SET of XLXI_40_28 : label is "XLXI_40_28_4";
   attribute HU_SET of XLXI_40_29 : label is "XLXI_40_29_3";
   attribute HU_SET of XLXI_40_30 : label is "XLXI_40_30_2";
   attribute HU_SET of XLXI_40_31 : label is "XLXI_40_31_1";
begin
   BUF_MEM1_ADDRA_5 : BUF
      port map (I=>XLXN_41(0),
                O=>MEM1_ADDRA(5));
   
   BUF_MEM1_ADDRA_6 : BUF
      port map (I=>XLXN_41(1),
                O=>MEM1_ADDRA(6));
   
   BUF_MEM1_ADDRA_7 : BUF
      port map (I=>XLXN_41(2),
                O=>MEM1_ADDRA(7));
   
   BUF_MEM1_ADDRA_8 : BUF
      port map (I=>XLXN_41(3),
                O=>MEM1_ADDRA(8));
   
   BUF_MEM1_ADDRA_9 : BUF
      port map (I=>XLXN_41(4),
                O=>MEM1_ADDRA(9));
   
   BUF_MEM1_ADDRA_10 : BUF
      port map (I=>XLXN_41(5),
                O=>MEM1_ADDRA(10));
   
   BUF_MEM1_ADDRA_11 : BUF
      port map (I=>XLXN_41(6),
                O=>MEM1_ADDRA(11));
   
   BUF_MEM1_ADDRA_12 : BUF
      port map (I=>XLXN_41(7),
                O=>MEM1_ADDRA(12));
   
   BUF_MEM1_ADDRA_13 : BUF
      port map (I=>XLXN_41(8),
                O=>MEM1_ADDRA(13));
   
   BUF_MEM2_ADDRA_5 : BUF
      port map (I=>XLXN_44(0),
                O=>MEM2_ADDRA(5));
   
   BUF_MEM2_ADDRA_6 : BUF
      port map (I=>XLXN_44(1),
                O=>MEM2_ADDRA(6));
   
   BUF_MEM2_ADDRA_7 : BUF
      port map (I=>XLXN_44(2),
                O=>MEM2_ADDRA(7));
   
   BUF_MEM2_ADDRA_8 : BUF
      port map (I=>XLXN_44(3),
                O=>MEM2_ADDRA(8));
   
   BUF_MEM2_ADDRA_9 : BUF
      port map (I=>XLXN_44(4),
                O=>MEM2_ADDRA(9));
   
   BUF_MEM2_ADDRA_10 : BUF
      port map (I=>XLXN_44(5),
                O=>MEM2_ADDRA(10));
   
   BUF_MEM2_ADDRA_11 : BUF
      port map (I=>XLXN_44(6),
                O=>MEM2_ADDRA(11));
   
   BUF_MEM2_ADDRA_12 : BUF
      port map (I=>XLXN_44(7),
                O=>MEM2_ADDRA(12));
   
   BUF_MEM2_ADDRA_13 : BUF
      port map (I=>XLXN_44(8),
                O=>MEM2_ADDRA(13));
   
   BUF1_ADDRA_0 : BUF
      port map (I=>ADDRA(0),
                O=>XLXN_41(0));
   
   BUF1_ADDRA_1 : BUF
      port map (I=>ADDRA(1),
                O=>XLXN_41(1));
   
   BUF1_ADDRA_2 : BUF
      port map (I=>ADDRA(2),
                O=>XLXN_41(2));
   
   BUF1_ADDRA_3 : BUF
      port map (I=>ADDRA(3),
                O=>XLXN_41(3));
   
   BUF1_ADDRA_4 : BUF
      port map (I=>ADDRA(4),
                O=>XLXN_41(4));
   
   BUF1_ADDRA_5 : BUF
      port map (I=>ADDRA(5),
                O=>XLXN_41(5));
   
   BUF1_ADDRA_6 : BUF
      port map (I=>ADDRA(6),
                O=>XLXN_41(6));
   
   BUF1_ADDRA_7 : BUF
      port map (I=>ADDRA(7),
                O=>XLXN_41(7));
   
   BUF1_ADDRA_8 : BUF
      port map (I=>ADDRA(8),
                O=>XLXN_41(8));
   
   BUF1_ADDRA_9 : BUF
      port map (I=>ADDRA(9),
                O=>XLXN_41(9));
   
   BUF2_ADDRA_0 : BUF
      port map (I=>ADDRA(0),
                O=>XLXN_44(0));
   
   BUF2_ADDRA_1 : BUF
      port map (I=>ADDRA(1),
                O=>XLXN_44(1));
   
   BUF2_ADDRA_2 : BUF
      port map (I=>ADDRA(2),
                O=>XLXN_44(2));
   
   BUF2_ADDRA_3 : BUF
      port map (I=>ADDRA(3),
                O=>XLXN_44(3));
   
   BUF2_ADDRA_4 : BUF
      port map (I=>ADDRA(4),
                O=>XLXN_44(4));
   
   BUF2_ADDRA_5 : BUF
      port map (I=>ADDRA(5),
                O=>XLXN_44(5));
   
   BUF2_ADDRA_6 : BUF
      port map (I=>ADDRA(6),
                O=>XLXN_44(6));
   
   BUF2_ADDRA_7 : BUF
      port map (I=>ADDRA(7),
                O=>XLXN_44(7));
   
   BUF2_ADDRA_8 : BUF
      port map (I=>ADDRA(8),
                O=>XLXN_44(8));
   
   BUF2_ADDRA_9 : BUF
      port map (I=>ADDRA(9),
                O=>XLXN_44(9));
   
   XLXI_26 : RAMB16
   -- synopsys translate_off
   generic map( INIT_FILE => "mem_ktptat_1.txt")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>MEM1_ADDRA(14 downto 0),
                ADDRB(14 downto 0)=>XLXI_26_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>XLXI_26_CASCADEINA_openSignal,
                CASCADEINB=>XLXI_26_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>XLXI_26_CLKB_openSignal,
                DIA(31 downto 0)=>XLXI_26_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>XLXI_26_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>XLXI_26_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>XLXI_26_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_56,
                ENB=>XLXI_26_ENB_openSignal,
                REGCEA=>XLXI_26_REGCEA_openSignal,
                REGCEB=>XLXI_26_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>XLXI_26_SSRB_openSignal,
                WEA(3 downto 0)=>XLXI_26_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>XLXI_26_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_58(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_35 : RAMB16
   -- synopsys translate_off
   generic map( INIT_FILE => "mem_ktptat_2.txt")
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>MEM2_ADDRA(14 downto 0),
                ADDRB(14 downto 0)=>XLXI_35_ADDRB_openSignal(14 downto 0),
                CASCADEINA=>XLXI_35_CASCADEINA_openSignal,
                CASCADEINB=>XLXI_35_CASCADEINB_openSignal,
                CLKA=>i_clock,
                CLKB=>XLXI_35_CLKB_openSignal,
                DIA(31 downto 0)=>XLXI_35_DIA_openSignal(31 downto 0),
                DIB(31 downto 0)=>XLXI_35_DIB_openSignal(31 downto 0),
                DIPA(3 downto 0)=>XLXI_35_DIPA_openSignal(3 downto 0),
                DIPB(3 downto 0)=>XLXI_35_DIPB_openSignal(3 downto 0),
                ENA=>XLXN_57,
                ENB=>XLXI_35_ENB_openSignal,
                REGCEA=>XLXI_35_REGCEA_openSignal,
                REGCEB=>XLXI_35_REGCEB_openSignal,
                SSRA=>i_reset,
                SSRB=>XLXI_35_SSRB_openSignal,
                WEA(3 downto 0)=>XLXI_35_WEA_openSignal(3 downto 0),
                WEB(3 downto 0)=>XLXI_35_WEB_openSignal(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_59(31 downto 0),
                DOB=>open,
                DOPA=>open,
                DOPB=>open);
   
   XLXI_38 : D2_4E_MXILINX_mem_ramb16_s36_s36_x2
      port map (A0=>XLXN_41(9),
                A1=>XLXN_53,
                E=>i_clock,
                D0=>XLXN_56,
                D1=>open,
                D2=>XLXN_57,
                D3=>open);
   
   XLXI_39 : INV
      port map (I=>XLXN_41(9),
                O=>XLXN_53);
   
   XLXI_40_0 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(0),
                D1=>XLXN_59(0),
                S0=>XLXN_41(9),
                O=>DOA(0));
   
   XLXI_40_1 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(1),
                D1=>XLXN_59(1),
                S0=>XLXN_41(9),
                O=>DOA(1));
   
   XLXI_40_2 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(2),
                D1=>XLXN_59(2),
                S0=>XLXN_41(9),
                O=>DOA(2));
   
   XLXI_40_3 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(3),
                D1=>XLXN_59(3),
                S0=>XLXN_41(9),
                O=>DOA(3));
   
   XLXI_40_4 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(4),
                D1=>XLXN_59(4),
                S0=>XLXN_41(9),
                O=>DOA(4));
   
   XLXI_40_5 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(5),
                D1=>XLXN_59(5),
                S0=>XLXN_41(9),
                O=>DOA(5));
   
   XLXI_40_6 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(6),
                D1=>XLXN_59(6),
                S0=>XLXN_41(9),
                O=>DOA(6));
   
   XLXI_40_7 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(7),
                D1=>XLXN_59(7),
                S0=>XLXN_41(9),
                O=>DOA(7));
   
   XLXI_40_8 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(8),
                D1=>XLXN_59(8),
                S0=>XLXN_41(9),
                O=>DOA(8));
   
   XLXI_40_9 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(9),
                D1=>XLXN_59(9),
                S0=>XLXN_41(9),
                O=>DOA(9));
   
   XLXI_40_10 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(10),
                D1=>XLXN_59(10),
                S0=>XLXN_41(9),
                O=>DOA(10));
   
   XLXI_40_11 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(11),
                D1=>XLXN_59(11),
                S0=>XLXN_41(9),
                O=>DOA(11));
   
   XLXI_40_12 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(12),
                D1=>XLXN_59(12),
                S0=>XLXN_41(9),
                O=>DOA(12));
   
   XLXI_40_13 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(13),
                D1=>XLXN_59(13),
                S0=>XLXN_41(9),
                O=>DOA(13));
   
   XLXI_40_14 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(14),
                D1=>XLXN_59(14),
                S0=>XLXN_41(9),
                O=>DOA(14));
   
   XLXI_40_15 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(15),
                D1=>XLXN_59(15),
                S0=>XLXN_41(9),
                O=>DOA(15));
   
   XLXI_40_16 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(16),
                D1=>XLXN_59(16),
                S0=>XLXN_41(9),
                O=>DOA(16));
   
   XLXI_40_17 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(17),
                D1=>XLXN_59(17),
                S0=>XLXN_41(9),
                O=>DOA(17));
   
   XLXI_40_18 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(18),
                D1=>XLXN_59(18),
                S0=>XLXN_41(9),
                O=>DOA(18));
   
   XLXI_40_19 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(19),
                D1=>XLXN_59(19),
                S0=>XLXN_41(9),
                O=>DOA(19));
   
   XLXI_40_20 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(20),
                D1=>XLXN_59(20),
                S0=>XLXN_41(9),
                O=>DOA(20));
   
   XLXI_40_21 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(21),
                D1=>XLXN_59(21),
                S0=>XLXN_41(9),
                O=>DOA(21));
   
   XLXI_40_22 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(22),
                D1=>XLXN_59(22),
                S0=>XLXN_41(9),
                O=>DOA(22));
   
   XLXI_40_23 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(23),
                D1=>XLXN_59(23),
                S0=>XLXN_41(9),
                O=>DOA(23));
   
   XLXI_40_24 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(24),
                D1=>XLXN_59(24),
                S0=>XLXN_41(9),
                O=>DOA(24));
   
   XLXI_40_25 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(25),
                D1=>XLXN_59(25),
                S0=>XLXN_41(9),
                O=>DOA(25));
   
   XLXI_40_26 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(26),
                D1=>XLXN_59(26),
                S0=>XLXN_41(9),
                O=>DOA(26));
   
   XLXI_40_27 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(27),
                D1=>XLXN_59(27),
                S0=>XLXN_41(9),
                O=>DOA(27));
   
   XLXI_40_28 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(28),
                D1=>XLXN_59(28),
                S0=>XLXN_41(9),
                O=>DOA(28));
   
   XLXI_40_29 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(29),
                D1=>XLXN_59(29),
                S0=>XLXN_41(9),
                O=>DOA(29));
   
   XLXI_40_30 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(30),
                D1=>XLXN_59(30),
                S0=>XLXN_41(9),
                O=>DOA(30));
   
   XLXI_40_31 : M2_1_MXILINX_mem_ramb16_s36_s36_x2
      port map (D0=>XLXN_58(31),
                D1=>XLXN_59(31),
                S0=>XLXN_41(9),
                O=>DOA(31));
   
end BEHAVIORAL;


