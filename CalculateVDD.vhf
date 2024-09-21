--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CalculateVDD.vhf
-- /___/   /\     Timestamp : 06/19/2023 15:05:23
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/user/workspace/melexis_mlx90641/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl /home/user/workspace/melexis_mlx90641/CalculateVDD.vhf -w /home/user/workspace/melexis_mlx90641/CalculateVDD.sch
--Design Name: CalculateVDD
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

entity M2_1_MXILINX_CalculateVDD is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_CalculateVDD;

architecture BEHAVIORAL of M2_1_MXILINX_CalculateVDD is
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

entity ExtractVDDParameters_MUSER_CalculateVDD is
   port ( i_clock       : in    std_logic; 
          i_reset       : in    std_logic; 
          i_run         : in    std_logic; 
          i2c_mem_douta : in    std_logic_vector (7 downto 0); 
          i2c_mem_addra : out   std_logic_vector (11 downto 0); 
          i2c_mem_ena   : out   std_logic; 
          o_kvdd        : out   std_logic_vector (31 downto 0); 
          o_rdy         : out   std_logic; 
          o_vdd25       : out   std_logic_vector (31 downto 0));
end ExtractVDDParameters_MUSER_CalculateVDD;

architecture BEHAVIORAL of ExtractVDDParameters_MUSER_CalculateVDD is
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
   signal ADDRA         : std_logic_vector (14 downto 0);
   signal ADDRB         : std_logic_vector (14 downto 0);
   signal XLXN_605      : std_logic_vector (31 downto 0);
   signal XLXN_606      : std_logic_vector (31 downto 0);
   signal XLXN_614      : std_logic_vector (14 downto 0);
   signal XLXN_615      : std_logic_vector (14 downto 0);
   signal XLXN_630      : std_logic_vector (3 downto 0);
   signal XLXN_631      : std_logic;
   signal XLXN_632      : std_logic;
   signal XLXN_633      : std_logic_vector (3 downto 0);
   signal XLXN_634      : std_logic_vector (3 downto 0);
   signal XLXN_635      : std_logic_vector (3 downto 0);
   signal XLXN_636      : std_logic_vector (31 downto 0);
   signal XLXN_637      : std_logic_vector (31 downto 0);
   signal XLXN_638      : std_logic;
   signal XLXN_639      : std_logic;
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
   
   component ExtractVDDParameters_process_p0
      port ( i_clock       : in    std_logic; 
             i_reset       : in    std_logic; 
             i_run         : in    std_logic; 
             i2c_mem_douta : in    std_logic_vector (7 downto 0); 
             data_kvdd     : in    std_logic_vector (31 downto 0); 
             data_vdd25    : in    std_logic_vector (31 downto 0); 
             i2c_mem_ena   : out   std_logic; 
             o_rdy         : out   std_logic; 
             i2c_mem_addra : out   std_logic_vector (11 downto 0); 
             address_kvdd  : out   std_logic_vector (14 downto 0); 
             address_vdd25 : out   std_logic_vector (14 downto 0); 
             o_kvdd        : out   std_logic_vector (31 downto 0); 
             o_vdd25       : out   std_logic_vector (31 downto 0));
   end component;
   
   attribute INIT_10 of MEM_KVDD_VDD25 : label is 
         "c5720000c5740000c5760000c5780000c57a0000c57c0000c57e0000c5800000";
   attribute INIT_0F of MEM_KVDD_VDD25 : label is 
         "457e0000457c0000457a00004578000045760000457400004572000045700000";
   attribute INIT_0E of MEM_KVDD_VDD25 : label is 
         "456e0000456c0000456a00004568000045660000456400004562000045600000";
   attribute INIT_0D of MEM_KVDD_VDD25 : label is 
         "455e0000455c0000455a00004558000045560000455400004552000045500000";
   attribute INIT_0C of MEM_KVDD_VDD25 : label is 
         "454e0000454c0000454a00004548000045460000454400004542000045400000";
   attribute INIT_0B of MEM_KVDD_VDD25 : label is 
         "453e0000453c0000453a00004538000045360000453400004532000045300000";
   attribute INIT_0A of MEM_KVDD_VDD25 : label is 
         "452e0000452c0000452a00004528000045260000452400004522000045200000";
   attribute INIT_09 of MEM_KVDD_VDD25 : label is 
         "451e0000451c0000451a00004518000045160000451400004512000045100000";
   attribute INIT_08 of MEM_KVDD_VDD25 : label is 
         "450e0000450c0000450a00004508000045060000450400004502000045000000";
   attribute INIT_07 of MEM_KVDD_VDD25 : label is 
         "44fc000044f8000044f4000044f0000044ec000044e8000044e4000044e00000";
   attribute INIT_06 of MEM_KVDD_VDD25 : label is 
         "44dc000044d8000044d4000044d0000044cc000044c8000044c4000044c00000";
   attribute INIT_05 of MEM_KVDD_VDD25 : label is 
         "44bc000044b8000044b4000044b0000044ac000044a8000044a4000044a00000";
   attribute INIT_04 of MEM_KVDD_VDD25 : label is 
         "449c0000449800004494000044900000448c0000448800004484000044800000";
   attribute INIT_03 of MEM_KVDD_VDD25 : label is 
         "4478000044700000446800004460000044580000445000004448000044400000";
   attribute INIT_02 of MEM_KVDD_VDD25 : label is 
         "4438000044300000442800004420000044180000441000004408000044000000";
   attribute INIT_01 of MEM_KVDD_VDD25 : label is 
         "43f0000043e0000043d0000043c0000043b0000043a000004390000043800000";
   attribute INIT_00 of MEM_KVDD_VDD25 : label is 
         "4360000043400000432000004300000042c00000428000004200000000000000";
   attribute INIT_1F of MEM_KVDD_VDD25 : label is 
         "c2000000c2800000c2c00000c3000000c3200000c3400000c3600000c3800000";
   attribute INIT_1E of MEM_KVDD_VDD25 : label is 
         "c3900000c3a00000c3b00000c3c00000c3d00000c3e00000c3f00000c4000000";
   attribute INIT_1D of MEM_KVDD_VDD25 : label is 
         "c4080000c4100000c4180000c4200000c4280000c4300000c4380000c4400000";
   attribute INIT_1C of MEM_KVDD_VDD25 : label is 
         "c4480000c4500000c4580000c4600000c4680000c4700000c4780000c4800000";
   attribute INIT_1B of MEM_KVDD_VDD25 : label is 
         "c4840000c4880000c48c0000c4900000c4940000c4980000c49c0000c4a00000";
   attribute INIT_1A of MEM_KVDD_VDD25 : label is 
         "c4a40000c4a80000c4ac0000c4b00000c4b40000c4b80000c4bc0000c4c00000";
   attribute INIT_19 of MEM_KVDD_VDD25 : label is 
         "c4c40000c4c80000c4cc0000c4d00000c4d40000c4d80000c4dc0000c4e00000";
   attribute INIT_18 of MEM_KVDD_VDD25 : label is 
         "c4e40000c4e80000c4ec0000c4f00000c4f40000c4f80000c4fc0000c5000000";
   attribute INIT_17 of MEM_KVDD_VDD25 : label is 
         "c5020000c5040000c5060000c5080000c50a0000c50c0000c50e0000c5100000";
   attribute INIT_16 of MEM_KVDD_VDD25 : label is 
         "c5120000c5140000c5160000c5180000c51a0000c51c0000c51e0000c5200000";
   attribute INIT_15 of MEM_KVDD_VDD25 : label is 
         "c5220000c5240000c5260000c5280000c52a0000c52c0000c52e0000c5300000";
   attribute INIT_14 of MEM_KVDD_VDD25 : label is 
         "c5320000c5340000c5360000c5380000c53a0000c53c0000c53e0000c5400000";
   attribute INIT_13 of MEM_KVDD_VDD25 : label is 
         "c5420000c5440000c5460000c5480000c54a0000c54c0000c54e0000c5500000";
   attribute INIT_12 of MEM_KVDD_VDD25 : label is 
         "c5520000c5540000c5560000c5580000c55a0000c55c0000c55e0000c5600000";
   attribute INIT_11 of MEM_KVDD_VDD25 : label is 
         "c5620000c5640000c5660000c5680000c56a0000c56c0000c56e0000c5700000";
   attribute INIT_3F of MEM_KVDD_VDD25 : label is 
         "c6008000c6010000c6018000c6020000c6028000c6030000c6038000c6040000";
   attribute INIT_3E of MEM_KVDD_VDD25 : label is 
         "c6048000c6050000c6058000c6060000c6068000c6070000c6078000c6080000";
   attribute INIT_3D of MEM_KVDD_VDD25 : label is 
         "c6088000c6090000c6098000c60a0000c60a8000c60b0000c60b8000c60c0000";
   attribute INIT_3C of MEM_KVDD_VDD25 : label is 
         "c60c8000c60d0000c60d8000c60e0000c60e8000c60f0000c60f8000c6100000";
   attribute INIT_3B of MEM_KVDD_VDD25 : label is 
         "c6108000c6110000c6118000c6120000c6128000c6130000c6138000c6140000";
   attribute INIT_3A of MEM_KVDD_VDD25 : label is 
         "c6148000c6150000c6158000c6160000c6168000c6170000c6178000c6180000";
   attribute INIT_39 of MEM_KVDD_VDD25 : label is 
         "c6188000c6190000c6198000c61a0000c61a8000c61b0000c61b8000c61c0000";
   attribute INIT_38 of MEM_KVDD_VDD25 : label is 
         "c61c8000c61d0000c61d8000c61e0000c61e8000c61f0000c61f8000c6200000";
   attribute INIT_37 of MEM_KVDD_VDD25 : label is 
         "c6208000c6210000c6218000c6220000c6228000c6230000c6238000c6240000";
   attribute INIT_36 of MEM_KVDD_VDD25 : label is 
         "c6248000c6250000c6258000c6260000c6268000c6270000c6278000c6280000";
   attribute INIT_35 of MEM_KVDD_VDD25 : label is 
         "c6288000c6290000c6298000c62a0000c62a8000c62b0000c62b8000c62c0000";
   attribute INIT_34 of MEM_KVDD_VDD25 : label is 
         "c62c8000c62d0000c62d8000c62e0000c62e8000c62f0000c62f8000c6300000";
   attribute INIT_33 of MEM_KVDD_VDD25 : label is 
         "c6308000c6310000c6318000c6320000c6328000c6330000c6338000c6340000";
   attribute INIT_32 of MEM_KVDD_VDD25 : label is 
         "c6348000c6350000c6358000c6360000c6368000c6370000c6378000c6380000";
   attribute INIT_31 of MEM_KVDD_VDD25 : label is 
         "c6388000c6390000c6398000c63a0000c63a8000c63b0000c63b8000c63c0000";
   attribute INIT_30 of MEM_KVDD_VDD25 : label is 
         "c63c8000c63d0000c63d8000c63e0000c63e8000c63f0000c63f8000c6400000";
   attribute INIT_2F of MEM_KVDD_VDD25 : label is 
         "c6408000c6410000c6418000c6420000c6428000c6430000c6438000c6440000";
   attribute INIT_2E of MEM_KVDD_VDD25 : label is 
         "c6448000c6450000c6458000c6460000c6468000c6470000c6478000c6480000";
   attribute INIT_2D of MEM_KVDD_VDD25 : label is 
         "c6488000c6490000c6498000c64a0000c64a8000c64b0000c64b8000c64c0000";
   attribute INIT_2C of MEM_KVDD_VDD25 : label is 
         "c64c8000c64d0000c64d8000c64e0000c64e8000c64f0000c64f8000c6500000";
   attribute INIT_2B of MEM_KVDD_VDD25 : label is 
         "c6508000c6510000c6518000c6520000c6528000c6530000c6538000c6540000";
   attribute INIT_2A of MEM_KVDD_VDD25 : label is 
         "c6548000c6550000c6558000c6560000c6568000c6570000c6578000c6580000";
   attribute INIT_29 of MEM_KVDD_VDD25 : label is 
         "c6588000c6590000c6598000c65a0000c65a8000c65b0000c65b8000c65c0000";
   attribute INIT_28 of MEM_KVDD_VDD25 : label is 
         "c65c8000c65d0000c65d8000c65e0000c65e8000c65f0000c65f8000c6600000";
   attribute INIT_27 of MEM_KVDD_VDD25 : label is 
         "c6608000c6610000c6618000c6620000c6628000c6630000c6638000c6640000";
   attribute INIT_26 of MEM_KVDD_VDD25 : label is 
         "c6648000c6650000c6658000c6660000c6668000c6670000c6678000c6680000";
   attribute INIT_25 of MEM_KVDD_VDD25 : label is 
         "c6688000c6690000c6698000c66a0000c66a8000c66b0000c66b8000c66c0000";
   attribute INIT_24 of MEM_KVDD_VDD25 : label is 
         "c66c8000c66d0000c66d8000c66e0000c66e8000c66f0000c66f8000c6700000";
   attribute INIT_23 of MEM_KVDD_VDD25 : label is 
         "c6708000c6710000c6718000c6720000c6728000c6730000c6738000c6740000";
   attribute INIT_22 of MEM_KVDD_VDD25 : label is 
         "c6748000c6750000c6758000c6760000c6768000c6770000c6778000c6780000";
   attribute INIT_21 of MEM_KVDD_VDD25 : label is 
         "c6788000c6790000c6798000c67a0000c67a8000c67b0000c67b8000c67c0000";
   attribute INIT_20 of MEM_KVDD_VDD25 : label is 
         "c67c8000c67d0000c67d8000c67e0000c67e8000c67f0000c67f8000c6800000";
   attribute SIM_COLLISION_CHECK of MEM_KVDD_VDD25 : label is "NONE";
   attribute READ_WIDTH_B of MEM_KVDD_VDD25 : label is "36";
   attribute READ_WIDTH_A of MEM_KVDD_VDD25 : label is "36";
begin
   BUF_kvdd_0 : BUF
      port map (I=>XLXN_614(0),
                O=>ADDRA(0));
   
   BUF_kvdd_1 : BUF
      port map (I=>XLXN_614(1),
                O=>ADDRA(1));
   
   BUF_kvdd_2 : BUF
      port map (I=>XLXN_614(2),
                O=>ADDRA(2));
   
   BUF_kvdd_3 : BUF
      port map (I=>XLXN_614(3),
                O=>ADDRA(3));
   
   BUF_kvdd_4 : BUF
      port map (I=>XLXN_614(4),
                O=>ADDRA(4));
   
   BUF_kvdd_5 : BUF
      port map (I=>XLXN_614(5),
                O=>ADDRA(5));
   
   BUF_kvdd_6 : BUF
      port map (I=>XLXN_614(6),
                O=>ADDRA(6));
   
   BUF_kvdd_7 : BUF
      port map (I=>XLXN_614(7),
                O=>ADDRA(7));
   
   BUF_kvdd_8 : BUF
      port map (I=>XLXN_614(8),
                O=>ADDRA(8));
   
   BUF_kvdd_9 : BUF
      port map (I=>XLXN_614(9),
                O=>ADDRA(9));
   
   BUF_kvdd_10 : BUF
      port map (I=>XLXN_614(10),
                O=>ADDRA(10));
   
   BUF_kvdd_11 : BUF
      port map (I=>XLXN_614(11),
                O=>ADDRA(11));
   
   BUF_kvdd_12 : BUF
      port map (I=>XLXN_614(12),
                O=>ADDRA(12));
   
   BUF_kvdd_13 : BUF
      port map (I=>XLXN_614(13),
                O=>ADDRA(13));
   
   BUF_kvdd_14 : BUF
      port map (I=>XLXN_614(14),
                O=>ADDRA(14));
   
   BUF_vdd25_0 : BUF
      port map (I=>XLXN_615(0),
                O=>ADDRB(0));
   
   BUF_vdd25_1 : BUF
      port map (I=>XLXN_615(1),
                O=>ADDRB(1));
   
   BUF_vdd25_2 : BUF
      port map (I=>XLXN_615(2),
                O=>ADDRB(2));
   
   BUF_vdd25_3 : BUF
      port map (I=>XLXN_615(3),
                O=>ADDRB(3));
   
   BUF_vdd25_4 : BUF
      port map (I=>XLXN_615(4),
                O=>ADDRB(4));
   
   BUF_vdd25_5 : BUF
      port map (I=>XLXN_615(5),
                O=>ADDRB(5));
   
   BUF_vdd25_6 : BUF
      port map (I=>XLXN_615(6),
                O=>ADDRB(6));
   
   BUF_vdd25_7 : BUF
      port map (I=>XLXN_615(7),
                O=>ADDRB(7));
   
   BUF_vdd25_8 : BUF
      port map (I=>XLXN_615(8),
                O=>ADDRB(8));
   
   BUF_vdd25_9 : BUF
      port map (I=>XLXN_615(9),
                O=>ADDRB(9));
   
   BUF_vdd25_10 : BUF
      port map (I=>XLXN_615(10),
                O=>ADDRB(10));
   
   BUF_vdd25_11 : BUF
      port map (I=>XLXN_615(11),
                O=>ADDRB(11));
   
   BUF_vdd25_12 : BUF
      port map (I=>XLXN_615(12),
                O=>ADDRB(12));
   
   BUF_vdd25_13 : BUF
      port map (I=>XLXN_615(13),
                O=>ADDRB(13));
   
   BUF_vdd25_14 : BUF
      port map (I=>XLXN_615(14),
                O=>ADDRB(14));
   
   MEM_KVDD_VDD25 : RAMB16
   -- synopsys translate_off
   generic map( INIT_10 => 
         x"c5720000c5740000c5760000c5780000c57a0000c57c0000c57e0000c5800000",
            INIT_0F => 
         x"457e0000457c0000457a00004578000045760000457400004572000045700000",
            INIT_0E => 
         x"456e0000456c0000456a00004568000045660000456400004562000045600000",
            INIT_0D => 
         x"455e0000455c0000455a00004558000045560000455400004552000045500000",
            INIT_0C => 
         x"454e0000454c0000454a00004548000045460000454400004542000045400000",
            INIT_0B => 
         x"453e0000453c0000453a00004538000045360000453400004532000045300000",
            INIT_0A => 
         x"452e0000452c0000452a00004528000045260000452400004522000045200000",
            INIT_09 => 
         x"451e0000451c0000451a00004518000045160000451400004512000045100000",
            INIT_08 => 
         x"450e0000450c0000450a00004508000045060000450400004502000045000000",
            INIT_07 => 
         x"44fc000044f8000044f4000044f0000044ec000044e8000044e4000044e00000",
            INIT_06 => 
         x"44dc000044d8000044d4000044d0000044cc000044c8000044c4000044c00000",
            INIT_05 => 
         x"44bc000044b8000044b4000044b0000044ac000044a8000044a4000044a00000",
            INIT_04 => 
         x"449c0000449800004494000044900000448c0000448800004484000044800000",
            INIT_03 => 
         x"4478000044700000446800004460000044580000445000004448000044400000",
            INIT_02 => 
         x"4438000044300000442800004420000044180000441000004408000044000000",
            INIT_01 => 
         x"43f0000043e0000043d0000043c0000043b0000043a000004390000043800000",
            INIT_00 => 
         x"4360000043400000432000004300000042c00000428000004200000000000000",
            INIT_1F => 
         x"c2000000c2800000c2c00000c3000000c3200000c3400000c3600000c3800000",
            INIT_1E => 
         x"c3900000c3a00000c3b00000c3c00000c3d00000c3e00000c3f00000c4000000",
            INIT_1D => 
         x"c4080000c4100000c4180000c4200000c4280000c4300000c4380000c4400000",
            INIT_1C => 
         x"c4480000c4500000c4580000c4600000c4680000c4700000c4780000c4800000",
            INIT_1B => 
         x"c4840000c4880000c48c0000c4900000c4940000c4980000c49c0000c4a00000",
            INIT_1A => 
         x"c4a40000c4a80000c4ac0000c4b00000c4b40000c4b80000c4bc0000c4c00000",
            INIT_19 => 
         x"c4c40000c4c80000c4cc0000c4d00000c4d40000c4d80000c4dc0000c4e00000",
            INIT_18 => 
         x"c4e40000c4e80000c4ec0000c4f00000c4f40000c4f80000c4fc0000c5000000",
            INIT_17 => 
         x"c5020000c5040000c5060000c5080000c50a0000c50c0000c50e0000c5100000",
            INIT_16 => 
         x"c5120000c5140000c5160000c5180000c51a0000c51c0000c51e0000c5200000",
            INIT_15 => 
         x"c5220000c5240000c5260000c5280000c52a0000c52c0000c52e0000c5300000",
            INIT_14 => 
         x"c5320000c5340000c5360000c5380000c53a0000c53c0000c53e0000c5400000",
            INIT_13 => 
         x"c5420000c5440000c5460000c5480000c54a0000c54c0000c54e0000c5500000",
            INIT_12 => 
         x"c5520000c5540000c5560000c5580000c55a0000c55c0000c55e0000c5600000",
            INIT_11 => 
         x"c5620000c5640000c5660000c5680000c56a0000c56c0000c56e0000c5700000",
            INIT_3F => 
         x"c6008000c6010000c6018000c6020000c6028000c6030000c6038000c6040000",
            INIT_3E => 
         x"c6048000c6050000c6058000c6060000c6068000c6070000c6078000c6080000",
            INIT_3D => 
         x"c6088000c6090000c6098000c60a0000c60a8000c60b0000c60b8000c60c0000",
            INIT_3C => 
         x"c60c8000c60d0000c60d8000c60e0000c60e8000c60f0000c60f8000c6100000",
            INIT_3B => 
         x"c6108000c6110000c6118000c6120000c6128000c6130000c6138000c6140000",
            INIT_3A => 
         x"c6148000c6150000c6158000c6160000c6168000c6170000c6178000c6180000",
            INIT_39 => 
         x"c6188000c6190000c6198000c61a0000c61a8000c61b0000c61b8000c61c0000",
            INIT_38 => 
         x"c61c8000c61d0000c61d8000c61e0000c61e8000c61f0000c61f8000c6200000",
            INIT_37 => 
         x"c6208000c6210000c6218000c6220000c6228000c6230000c6238000c6240000",
            INIT_36 => 
         x"c6248000c6250000c6258000c6260000c6268000c6270000c6278000c6280000",
            INIT_35 => 
         x"c6288000c6290000c6298000c62a0000c62a8000c62b0000c62b8000c62c0000",
            INIT_34 => 
         x"c62c8000c62d0000c62d8000c62e0000c62e8000c62f0000c62f8000c6300000",
            INIT_33 => 
         x"c6308000c6310000c6318000c6320000c6328000c6330000c6338000c6340000",
            INIT_32 => 
         x"c6348000c6350000c6358000c6360000c6368000c6370000c6378000c6380000",
            INIT_31 => 
         x"c6388000c6390000c6398000c63a0000c63a8000c63b0000c63b8000c63c0000",
            INIT_30 => 
         x"c63c8000c63d0000c63d8000c63e0000c63e8000c63f0000c63f8000c6400000",
            INIT_2F => 
         x"c6408000c6410000c6418000c6420000c6428000c6430000c6438000c6440000",
            INIT_2E => 
         x"c6448000c6450000c6458000c6460000c6468000c6470000c6478000c6480000",
            INIT_2D => 
         x"c6488000c6490000c6498000c64a0000c64a8000c64b0000c64b8000c64c0000",
            INIT_2C => 
         x"c64c8000c64d0000c64d8000c64e0000c64e8000c64f0000c64f8000c6500000",
            INIT_2B => 
         x"c6508000c6510000c6518000c6520000c6528000c6530000c6538000c6540000",
            INIT_2A => 
         x"c6548000c6550000c6558000c6560000c6568000c6570000c6578000c6580000",
            INIT_29 => 
         x"c6588000c6590000c6598000c65a0000c65a8000c65b0000c65b8000c65c0000",
            INIT_28 => 
         x"c65c8000c65d0000c65d8000c65e0000c65e8000c65f0000c65f8000c6600000",
            INIT_27 => 
         x"c6608000c6610000c6618000c6620000c6628000c6630000c6638000c6640000",
            INIT_26 => 
         x"c6648000c6650000c6658000c6660000c6668000c6670000c6678000c6680000",
            INIT_25 => 
         x"c6688000c6690000c6698000c66a0000c66a8000c66b0000c66b8000c66c0000",
            INIT_24 => 
         x"c66c8000c66d0000c66d8000c66e0000c66e8000c66f0000c66f8000c6700000",
            INIT_23 => 
         x"c6708000c6710000c6718000c6720000c6728000c6730000c6738000c6740000",
            INIT_22 => 
         x"c6748000c6750000c6758000c6760000c6768000c6770000c6778000c6780000",
            INIT_21 => 
         x"c6788000c6790000c6798000c67a0000c67a8000c67b0000c67b8000c67c0000",
            INIT_20 => 
         x"c67c8000c67d0000c67d8000c67e0000c67e8000c67f0000c67f8000c6800000",
            SIM_COLLISION_CHECK => "NONE",
            READ_WIDTH_B => 36,
            READ_WIDTH_A => 36)
   -- synopsys translate_on
      port map (ADDRA(14 downto 0)=>ADDRA(14 downto 0),
                ADDRB(14 downto 0)=>ADDRB(14 downto 0),
                CASCADEINA=>XLXN_638,
                CASCADEINB=>XLXN_639,
                CLKA=>i_clock,
                CLKB=>i_clock,
                DIA(31 downto 0)=>XLXN_637(31 downto 0),
                DIB(31 downto 0)=>XLXN_636(31 downto 0),
                DIPA(3 downto 0)=>XLXN_635(3 downto 0),
                DIPB(3 downto 0)=>XLXN_634(3 downto 0),
                ENA=>i_clock,
                ENB=>i_clock,
                REGCEA=>XLXN_631,
                REGCEB=>XLXN_632,
                SSRA=>i_reset,
                SSRB=>i_reset,
                WEA(3 downto 0)=>XLXN_633(3 downto 0),
                WEB(3 downto 0)=>XLXN_630(3 downto 0),
                CASCADEOUTA=>open,
                CASCADEOUTB=>open,
                DOA(31 downto 0)=>XLXN_605(31 downto 0),
                DOB(31 downto 0)=>XLXN_606(31 downto 0),
                DOPA=>open,
                DOPB=>open);
   
   XLXI_186 : GND
      port map (G=>XLXN_632);
   
   XLXI_187 : GND
      port map (G=>XLXN_631);
   
   XLXI_188_0 : GND
      port map (G=>XLXN_630(0));
   
   XLXI_188_1 : GND
      port map (G=>XLXN_630(1));
   
   XLXI_188_2 : GND
      port map (G=>XLXN_630(2));
   
   XLXI_188_3 : GND
      port map (G=>XLXN_630(3));
   
   XLXI_189_0 : GND
      port map (G=>XLXN_633(0));
   
   XLXI_189_1 : GND
      port map (G=>XLXN_633(1));
   
   XLXI_189_2 : GND
      port map (G=>XLXN_633(2));
   
   XLXI_189_3 : GND
      port map (G=>XLXN_633(3));
   
   XLXI_190_0 : GND
      port map (G=>XLXN_634(0));
   
   XLXI_190_1 : GND
      port map (G=>XLXN_634(1));
   
   XLXI_190_2 : GND
      port map (G=>XLXN_634(2));
   
   XLXI_190_3 : GND
      port map (G=>XLXN_634(3));
   
   XLXI_191_0 : GND
      port map (G=>XLXN_635(0));
   
   XLXI_191_1 : GND
      port map (G=>XLXN_635(1));
   
   XLXI_191_2 : GND
      port map (G=>XLXN_635(2));
   
   XLXI_191_3 : GND
      port map (G=>XLXN_635(3));
   
   XLXI_192_0 : GND
      port map (G=>XLXN_636(0));
   
   XLXI_192_1 : GND
      port map (G=>XLXN_636(1));
   
   XLXI_192_2 : GND
      port map (G=>XLXN_636(2));
   
   XLXI_192_3 : GND
      port map (G=>XLXN_636(3));
   
   XLXI_192_4 : GND
      port map (G=>XLXN_636(4));
   
   XLXI_192_5 : GND
      port map (G=>XLXN_636(5));
   
   XLXI_192_6 : GND
      port map (G=>XLXN_636(6));
   
   XLXI_192_7 : GND
      port map (G=>XLXN_636(7));
   
   XLXI_192_8 : GND
      port map (G=>XLXN_636(8));
   
   XLXI_192_9 : GND
      port map (G=>XLXN_636(9));
   
   XLXI_192_10 : GND
      port map (G=>XLXN_636(10));
   
   XLXI_192_11 : GND
      port map (G=>XLXN_636(11));
   
   XLXI_192_12 : GND
      port map (G=>XLXN_636(12));
   
   XLXI_192_13 : GND
      port map (G=>XLXN_636(13));
   
   XLXI_192_14 : GND
      port map (G=>XLXN_636(14));
   
   XLXI_192_15 : GND
      port map (G=>XLXN_636(15));
   
   XLXI_192_16 : GND
      port map (G=>XLXN_636(16));
   
   XLXI_192_17 : GND
      port map (G=>XLXN_636(17));
   
   XLXI_192_18 : GND
      port map (G=>XLXN_636(18));
   
   XLXI_192_19 : GND
      port map (G=>XLXN_636(19));
   
   XLXI_192_20 : GND
      port map (G=>XLXN_636(20));
   
   XLXI_192_21 : GND
      port map (G=>XLXN_636(21));
   
   XLXI_192_22 : GND
      port map (G=>XLXN_636(22));
   
   XLXI_192_23 : GND
      port map (G=>XLXN_636(23));
   
   XLXI_192_24 : GND
      port map (G=>XLXN_636(24));
   
   XLXI_192_25 : GND
      port map (G=>XLXN_636(25));
   
   XLXI_192_26 : GND
      port map (G=>XLXN_636(26));
   
   XLXI_192_27 : GND
      port map (G=>XLXN_636(27));
   
   XLXI_192_28 : GND
      port map (G=>XLXN_636(28));
   
   XLXI_192_29 : GND
      port map (G=>XLXN_636(29));
   
   XLXI_192_30 : GND
      port map (G=>XLXN_636(30));
   
   XLXI_192_31 : GND
      port map (G=>XLXN_636(31));
   
   XLXI_193_0 : GND
      port map (G=>XLXN_637(0));
   
   XLXI_193_1 : GND
      port map (G=>XLXN_637(1));
   
   XLXI_193_2 : GND
      port map (G=>XLXN_637(2));
   
   XLXI_193_3 : GND
      port map (G=>XLXN_637(3));
   
   XLXI_193_4 : GND
      port map (G=>XLXN_637(4));
   
   XLXI_193_5 : GND
      port map (G=>XLXN_637(5));
   
   XLXI_193_6 : GND
      port map (G=>XLXN_637(6));
   
   XLXI_193_7 : GND
      port map (G=>XLXN_637(7));
   
   XLXI_193_8 : GND
      port map (G=>XLXN_637(8));
   
   XLXI_193_9 : GND
      port map (G=>XLXN_637(9));
   
   XLXI_193_10 : GND
      port map (G=>XLXN_637(10));
   
   XLXI_193_11 : GND
      port map (G=>XLXN_637(11));
   
   XLXI_193_12 : GND
      port map (G=>XLXN_637(12));
   
   XLXI_193_13 : GND
      port map (G=>XLXN_637(13));
   
   XLXI_193_14 : GND
      port map (G=>XLXN_637(14));
   
   XLXI_193_15 : GND
      port map (G=>XLXN_637(15));
   
   XLXI_193_16 : GND
      port map (G=>XLXN_637(16));
   
   XLXI_193_17 : GND
      port map (G=>XLXN_637(17));
   
   XLXI_193_18 : GND
      port map (G=>XLXN_637(18));
   
   XLXI_193_19 : GND
      port map (G=>XLXN_637(19));
   
   XLXI_193_20 : GND
      port map (G=>XLXN_637(20));
   
   XLXI_193_21 : GND
      port map (G=>XLXN_637(21));
   
   XLXI_193_22 : GND
      port map (G=>XLXN_637(22));
   
   XLXI_193_23 : GND
      port map (G=>XLXN_637(23));
   
   XLXI_193_24 : GND
      port map (G=>XLXN_637(24));
   
   XLXI_193_25 : GND
      port map (G=>XLXN_637(25));
   
   XLXI_193_26 : GND
      port map (G=>XLXN_637(26));
   
   XLXI_193_27 : GND
      port map (G=>XLXN_637(27));
   
   XLXI_193_28 : GND
      port map (G=>XLXN_637(28));
   
   XLXI_193_29 : GND
      port map (G=>XLXN_637(29));
   
   XLXI_193_30 : GND
      port map (G=>XLXN_637(30));
   
   XLXI_193_31 : GND
      port map (G=>XLXN_637(31));
   
   XLXI_194 : GND
      port map (G=>XLXN_639);
   
   XLXI_195 : GND
      port map (G=>XLXN_638);
   
   XLXI_197 : ExtractVDDParameters_process_p0
      port map (data_kvdd(31 downto 0)=>XLXN_605(31 downto 0),
                data_vdd25(31 downto 0)=>XLXN_606(31 downto 0),
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                address_kvdd(14 downto 0)=>XLXN_614(14 downto 0),
                address_vdd25(14 downto 0)=>XLXN_615(14 downto 0),
                i2c_mem_addra(11 downto 0)=>i2c_mem_addra(11 downto 0),
                i2c_mem_ena=>i2c_mem_ena,
                o_kvdd(31 downto 0)=>o_kvdd(31 downto 0),
                o_rdy=>o_rdy,
                o_vdd25(31 downto 0)=>o_vdd25(31 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CalculateVDD is
   port ( addfpr          : in    std_logic_vector (31 downto 0); 
          addfprdy        : in    std_logic; 
          divfpr          : in    std_logic_vector (31 downto 0); 
          divfprdy        : in    std_logic; 
          fixed2floatr    : in    std_logic_vector (31 downto 0); 
          fixed2floatrdy  : in    std_logic; 
          i_clock         : in    std_logic; 
          i_reset         : in    std_logic; 
          i_run           : in    std_logic; 
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
          o_rdy           : out   std_logic; 
          o_Vdd           : out   std_logic_vector (31 downto 0); 
          subfpa          : out   std_logic_vector (31 downto 0); 
          subfpb          : out   std_logic_vector (31 downto 0); 
          subfpce         : out   std_logic; 
          subfpond        : out   std_logic; 
          subfpsclr       : out   std_logic);
end CalculateVDD;

architecture BEHAVIORAL of CalculateVDD is
   attribute HU_SET     : string ;
   signal CONST0                     : std_logic_vector (7 downto 0);
   signal ExractVDDParameters_rdy    : std_logic;
   signal ExtractVDDParameters_kvdd  : std_logic_vector (31 downto 0);
   signal ExtractVDDParameters_vdd25 : std_logic_vector (31 downto 0);
   signal XLXN_3                     : std_logic_vector (1 downto 0);
   signal XLXN_6                     : std_logic_vector (1 downto 0);
   signal XLXN_9                     : std_logic;
   signal XLXN_11                    : std_logic;
   signal XLXN_15                    : std_logic_vector (31 downto 0);
   signal XLXN_16                    : std_logic_vector (31 downto 0);
   signal XLXN_17                    : std_logic_vector (7 downto 0);
   signal XLXN_22                    : std_logic;
   signal XLXN_23                    : std_logic_vector (11 downto 0);
   signal XLXN_24                    : std_logic_vector (11 downto 0);
   signal XLXN_27                    : std_logic;
   component M2_1_MXILINX_CalculateVDD
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component CalculateVDD_process_p0
      port ( i_clock                    : in    std_logic; 
             i_reset                    : in    std_logic; 
             i_run                      : in    std_logic; 
             ExtractVDDParameters_rdy   : in    std_logic; 
             fixed2floatrdy             : in    std_logic; 
             divfprdy                   : in    std_logic; 
             mulfprdy                   : in    std_logic; 
             addfprdy                   : in    std_logic; 
             subfprdy                   : in    std_logic; 
             ExtractVDDParameters_kvdd  : in    std_logic_vector (31 downto 0); 
             ExtractVDDParameters_vdd25 : in    std_logic_vector (31 downto 0); 
             in_resolutionee            : in    std_logic_vector (31 downto 0); 
             in_resolutionreg           : in    std_logic_vector (31 downto 0); 
             i2c_mem_douta              : in    std_logic_vector (7 downto 0); 
             fixed2floatr               : in    std_logic_vector (31 downto 0); 
             divfpr                     : in    std_logic_vector (31 downto 0); 
             mulfpr                     : in    std_logic_vector (31 downto 0); 
             addfpr                     : in    std_logic_vector (31 downto 0); 
             subfpr                     : in    std_logic_vector (31 downto 0); 
             o_rdy                      : out   std_logic; 
             ExtractVDDParameters_run   : out   std_logic; 
             ExtractVDDParameters_mux   : out   std_logic; 
             i2c_mem_ena                : out   std_logic; 
             fixed2floatond             : out   std_logic; 
             fixed2floatce              : out   std_logic; 
             fixed2floatsclr            : out   std_logic; 
             divfpond                   : out   std_logic; 
             divfpce                    : out   std_logic; 
             divfpsclr                  : out   std_logic; 
             mulfpond                   : out   std_logic; 
             mulfpce                    : out   std_logic; 
             mulfpsclr                  : out   std_logic; 
             addfpond                   : out   std_logic; 
             addfpce                    : out   std_logic; 
             addfpsclr                  : out   std_logic; 
             subfpond                   : out   std_logic; 
             subfpce                    : out   std_logic; 
             subfpsclr                  : out   std_logic; 
             o_Vdd                      : out   std_logic_vector (31 downto 0); 
             out_resolutionee           : out   std_logic_vector (1 downto 0); 
             out_resolutionreg          : out   std_logic_vector (1 downto 0); 
             i2c_mem_addra              : out   std_logic_vector (11 downto 0); 
             fixed2floata               : out   std_logic_vector (63 downto 0); 
             divfpa                     : out   std_logic_vector (31 downto 0); 
             divfpb                     : out   std_logic_vector (31 downto 0); 
             mulfpa                     : out   std_logic_vector (31 downto 0); 
             mulfpb                     : out   std_logic_vector (31 downto 0); 
             addfpa                     : out   std_logic_vector (31 downto 0); 
             addfpb                     : out   std_logic_vector (31 downto 0); 
             subfpa                     : out   std_logic_vector (31 downto 0); 
             subfpb                     : out   std_logic_vector (31 downto 0));
   end component;
   
   component CalculateVDD_pow2_2bit
      port ( x     : in    std_logic_vector (1 downto 0); 
             pow2x : out   std_logic_vector (31 downto 0));
   end component;
   
   component ExtractVDDParameters_MUSER_CalculateVDD
      port ( i_clock       : in    std_logic; 
             i_reset       : in    std_logic; 
             i_run         : in    std_logic; 
             i2c_mem_douta : in    std_logic_vector (7 downto 0); 
             i2c_mem_ena   : out   std_logic; 
             o_rdy         : out   std_logic; 
             i2c_mem_addra : out   std_logic_vector (11 downto 0); 
             o_kvdd        : out   std_logic_vector (31 downto 0); 
             o_vdd25       : out   std_logic_vector (31 downto 0));
   end component;
   
   attribute HU_SET of MUX_i2c_ena : label is "MUX_i2c_ena_1325";
   attribute HU_SET of XLXI_14_0 : label is "XLXI_14_0_1312";
   attribute HU_SET of XLXI_14_1 : label is "XLXI_14_1_1311";
   attribute HU_SET of XLXI_14_2 : label is "XLXI_14_2_1310";
   attribute HU_SET of XLXI_14_3 : label is "XLXI_14_3_1309";
   attribute HU_SET of XLXI_14_4 : label is "XLXI_14_4_1308";
   attribute HU_SET of XLXI_14_5 : label is "XLXI_14_5_1307";
   attribute HU_SET of XLXI_14_6 : label is "XLXI_14_6_1306";
   attribute HU_SET of XLXI_14_7 : label is "XLXI_14_7_1305";
   attribute HU_SET of XLXI_16_0 : label is "XLXI_16_0_1324";
   attribute HU_SET of XLXI_16_1 : label is "XLXI_16_1_1323";
   attribute HU_SET of XLXI_16_2 : label is "XLXI_16_2_1322";
   attribute HU_SET of XLXI_16_3 : label is "XLXI_16_3_1321";
   attribute HU_SET of XLXI_16_4 : label is "XLXI_16_4_1320";
   attribute HU_SET of XLXI_16_5 : label is "XLXI_16_5_1319";
   attribute HU_SET of XLXI_16_6 : label is "XLXI_16_6_1318";
   attribute HU_SET of XLXI_16_7 : label is "XLXI_16_7_1317";
   attribute HU_SET of XLXI_16_8 : label is "XLXI_16_8_1316";
   attribute HU_SET of XLXI_16_9 : label is "XLXI_16_9_1315";
   attribute HU_SET of XLXI_16_10 : label is "XLXI_16_10_1314";
   attribute HU_SET of XLXI_16_11 : label is "XLXI_16_11_1313";
begin
   CONST0(7 downto 0) <= x"00";
   MUX_i2c_ena : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_22,
                D1=>XLXN_11,
                S0=>XLXN_9,
                O=>i2c_mem_ena);
   
   XLXI_1 : CalculateVDD_process_p0
      port map (addfpr(31 downto 0)=>addfpr(31 downto 0),
                addfprdy=>addfprdy,
                divfpr(31 downto 0)=>divfpr(31 downto 0),
                divfprdy=>divfprdy,
                ExtractVDDParameters_kvdd(31 downto 
            0)=>ExtractVDDParameters_kvdd(31 downto 0),
                ExtractVDDParameters_rdy=>ExractVDDParameters_rdy,
                ExtractVDDParameters_vdd25(31 downto 
            0)=>ExtractVDDParameters_vdd25(31 downto 0),
                fixed2floatr(31 downto 0)=>fixed2floatr(31 downto 0),
                fixed2floatrdy=>fixed2floatrdy,
                in_resolutionee(31 downto 0)=>XLXN_15(31 downto 0),
                in_resolutionreg(31 downto 0)=>XLXN_16(31 downto 0),
                i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>i_run,
                i2c_mem_douta(7 downto 0)=>XLXN_17(7 downto 0),
                mulfpr(31 downto 0)=>mulfpr(31 downto 0),
                mulfprdy=>mulfprdy,
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
                ExtractVDDParameters_mux=>XLXN_9,
                ExtractVDDParameters_run=>XLXN_27,
                fixed2floata(63 downto 0)=>fixed2floata(63 downto 0),
                fixed2floatce=>fixed2floatce,
                fixed2floatond=>fixed2floatond,
                fixed2floatsclr=>fixed2floatsclr,
                i2c_mem_addra(11 downto 0)=>XLXN_23(11 downto 0),
                i2c_mem_ena=>XLXN_22,
                mulfpa(31 downto 0)=>mulfpa(31 downto 0),
                mulfpb(31 downto 0)=>mulfpb(31 downto 0),
                mulfpce=>mulfpce,
                mulfpond=>mulfpond,
                mulfpsclr=>mulfpsclr,
                out_resolutionee(1 downto 0)=>XLXN_3(1 downto 0),
                out_resolutionreg(1 downto 0)=>XLXN_6(1 downto 0),
                o_rdy=>o_rdy,
                o_Vdd(31 downto 0)=>o_Vdd(31 downto 0),
                subfpa(31 downto 0)=>subfpa(31 downto 0),
                subfpb(31 downto 0)=>subfpb(31 downto 0),
                subfpce=>subfpce,
                subfpond=>subfpond,
                subfpsclr=>subfpsclr);
   
   XLXI_2 : CalculateVDD_pow2_2bit
      port map (x(1 downto 0)=>XLXN_6(1 downto 0),
                pow2x(31 downto 0)=>XLXN_15(31 downto 0));
   
   XLXI_3 : CalculateVDD_pow2_2bit
      port map (x(1 downto 0)=>XLXN_3(1 downto 0),
                pow2x(31 downto 0)=>XLXN_16(31 downto 0));
   
   XLXI_6 : ExtractVDDParameters_MUSER_CalculateVDD
      port map (i_clock=>i_clock,
                i_reset=>i_reset,
                i_run=>XLXN_27,
                i2c_mem_douta(7 downto 0)=>i2c_mem_douta(7 downto 0),
                i2c_mem_addra(11 downto 0)=>XLXN_24(11 downto 0),
                i2c_mem_ena=>XLXN_11,
                o_kvdd(31 downto 0)=>ExtractVDDParameters_kvdd(31 downto 0),
                o_rdy=>ExractVDDParameters_rdy,
                o_vdd25(31 downto 0)=>ExtractVDDParameters_vdd25(31 downto 0));
   
   XLXI_14_0 : M2_1_MXILINX_CalculateVDD
      port map (D0=>i2c_mem_douta(0),
                D1=>CONST0(0),
                S0=>XLXN_9,
                O=>XLXN_17(0));
   
   XLXI_14_1 : M2_1_MXILINX_CalculateVDD
      port map (D0=>i2c_mem_douta(1),
                D1=>CONST0(1),
                S0=>XLXN_9,
                O=>XLXN_17(1));
   
   XLXI_14_2 : M2_1_MXILINX_CalculateVDD
      port map (D0=>i2c_mem_douta(2),
                D1=>CONST0(2),
                S0=>XLXN_9,
                O=>XLXN_17(2));
   
   XLXI_14_3 : M2_1_MXILINX_CalculateVDD
      port map (D0=>i2c_mem_douta(3),
                D1=>CONST0(3),
                S0=>XLXN_9,
                O=>XLXN_17(3));
   
   XLXI_14_4 : M2_1_MXILINX_CalculateVDD
      port map (D0=>i2c_mem_douta(4),
                D1=>CONST0(4),
                S0=>XLXN_9,
                O=>XLXN_17(4));
   
   XLXI_14_5 : M2_1_MXILINX_CalculateVDD
      port map (D0=>i2c_mem_douta(5),
                D1=>CONST0(5),
                S0=>XLXN_9,
                O=>XLXN_17(5));
   
   XLXI_14_6 : M2_1_MXILINX_CalculateVDD
      port map (D0=>i2c_mem_douta(6),
                D1=>CONST0(6),
                S0=>XLXN_9,
                O=>XLXN_17(6));
   
   XLXI_14_7 : M2_1_MXILINX_CalculateVDD
      port map (D0=>i2c_mem_douta(7),
                D1=>CONST0(7),
                S0=>XLXN_9,
                O=>XLXN_17(7));
   
   XLXI_16_0 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(0),
                D1=>XLXN_24(0),
                S0=>XLXN_9,
                O=>i2c_mem_addra(0));
   
   XLXI_16_1 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(1),
                D1=>XLXN_24(1),
                S0=>XLXN_9,
                O=>i2c_mem_addra(1));
   
   XLXI_16_2 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(2),
                D1=>XLXN_24(2),
                S0=>XLXN_9,
                O=>i2c_mem_addra(2));
   
   XLXI_16_3 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(3),
                D1=>XLXN_24(3),
                S0=>XLXN_9,
                O=>i2c_mem_addra(3));
   
   XLXI_16_4 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(4),
                D1=>XLXN_24(4),
                S0=>XLXN_9,
                O=>i2c_mem_addra(4));
   
   XLXI_16_5 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(5),
                D1=>XLXN_24(5),
                S0=>XLXN_9,
                O=>i2c_mem_addra(5));
   
   XLXI_16_6 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(6),
                D1=>XLXN_24(6),
                S0=>XLXN_9,
                O=>i2c_mem_addra(6));
   
   XLXI_16_7 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(7),
                D1=>XLXN_24(7),
                S0=>XLXN_9,
                O=>i2c_mem_addra(7));
   
   XLXI_16_8 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(8),
                D1=>XLXN_24(8),
                S0=>XLXN_9,
                O=>i2c_mem_addra(8));
   
   XLXI_16_9 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(9),
                D1=>XLXN_24(9),
                S0=>XLXN_9,
                O=>i2c_mem_addra(9));
   
   XLXI_16_10 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(10),
                D1=>XLXN_24(10),
                S0=>XLXN_9,
                O=>i2c_mem_addra(10));
   
   XLXI_16_11 : M2_1_MXILINX_CalculateVDD
      port map (D0=>XLXN_23(11),
                D1=>XLXN_24(11),
                S0=>XLXN_9,
                O=>i2c_mem_addra(11));
   
end BEHAVIORAL;


