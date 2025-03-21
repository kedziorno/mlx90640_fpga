----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:55 02/18/2023 
-- Design Name: 
-- Module Name:    CalculateAlphaComp - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package3.all;

entity CalculateAlphaComp is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_Ta : in std_logic_vector (31 downto 0);
i_acpsubpage0 : in std_logic_vector (31 downto 0);
i_acpsubpage1 : in std_logic_vector (31 downto 0);
i_tgc : in std_logic_vector (31 downto 0);

i_alpha_do : in std_logic_vector (31 downto 0);
o_alpha_addr : out std_logic_vector (9 downto 0); -- 10bit-1024

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC;

signal subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : out STD_LOGIC;
signal subfpsclr : out STD_LOGIC;
signal subfpce : out STD_LOGIC;
signal subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : in STD_LOGIC;

signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC

);
end CalculateAlphaComp;

architecture Behavioral of CalculateAlphaComp is

signal mulfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond_internal : STD_LOGIC;
signal mulfpsclr_internal : STD_LOGIC;
signal mulfpce_internal : STD_LOGIC;
signal mulfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy_internal : STD_LOGIC;

signal addfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond_internal : STD_LOGIC;
signal addfpsclr_internal : STD_LOGIC;
signal addfpce_internal : STD_LOGIC;
signal addfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy_internal : STD_LOGIC;

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;

signal subfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond_internal : STD_LOGIC;
signal subfpsclr_internal : STD_LOGIC;
signal subfpce_internal : STD_LOGIC;
signal subfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy_internal : STD_LOGIC;

signal fixed2floata_internal : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond_internal : STD_LOGIC;
signal fixed2floatsclr_internal : STD_LOGIC;
signal fixed2floatce_internal : STD_LOGIC;
signal fixed2floatr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy_internal : STD_LOGIC;

component mem_ramb16_s36_x2 is
generic (
INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

INIT_40 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_41 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_42 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_43 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_44 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_45 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_46 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_47 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_48 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_49 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_50 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_51 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_52 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_53 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_54 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_55 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_56 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_57 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_58 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_59 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_60 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_61 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_62 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_63 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_64 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_65 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_66 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_67 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_68 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_69 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_70 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_71 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_72 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_73 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_74 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_75 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_76 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_77 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_78 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_79 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

INITP_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0a : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0b : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0c : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0d : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0e : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0f : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
);
port (
signal DO : out std_logic_vector (31 downto 0);
signal DOP : out std_logic_vector (3 downto 0);
signal ADDR : in std_logic_vector (9 downto 0); -- 10bit-1024
signal CLK : in std_logic;
signal DI : in std_logic_vector (31 downto 0);
signal DIP : in std_logic_vector (3 downto 0);
signal EN : in std_logic;
signal SSR : in std_logic;
signal WE : in std_logic
);
end component mem_ramb16_s36_x2;

COMPONENT mem_switchpattern
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_pixel : IN  std_logic_vector(9 downto 0);
o_pattern : OUT  std_logic
);
END COMPONENT;

signal mem_switchpattern_clock : std_logic;
signal mem_switchpattern_reset : std_logic;
signal mem_switchpattern_pixel : std_logic_vector(9 downto 0);
signal mem_switchpattern_pattern : std_logic;

--COMPONENT ExtractKsTaParameters
--PORT(
--i_clock : in std_logic;
--i_reset : in std_logic;
--i_run : in std_logic;
--i2c_mem_ena : out STD_LOGIC;
--i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
--i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
--o_ksta : out std_logic_vector (31 downto 0);
--o_rdy : out std_logic
--);
--END COMPONENT;
--signal ExtractKsTaParameters_clock : std_logic;
--signal ExtractKsTaParameters_reset : std_logic;
--signal ExtractKsTaParameters_run : std_logic;
--signal ExtractKsTaParameters_i2c_mem_ena : STD_LOGIC;
--signal ExtractKsTaParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
--signal ExtractKsTaParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
--signal ExtractKsTaParameters_ksta : std_logic_vector (31 downto 0);
--signal ExtractKsTaParameters_rdy : std_logic;

--signal ExtractTGCParameters_mux,ExtractKsTaParameters_mux : std_logic;

signal addra,mux_addr : std_logic_vector (9 downto 0);
signal doa,dia,mux_dia : std_logic_vector (31 downto 0);

signal rdy,write_enable : std_logic;

signal pattern_ft,pattern_neg_ft : std_logic_vector (31 downto 0);

begin

mulfpa <= mulfpa_internal;
mulfpb <= mulfpb_internal;
mulfpond <= mulfpond_internal;
mulfpsclr <= mulfpsclr_internal;
mulfpce <= mulfpce_internal;
mulfpr_internal <= mulfpr;
mulfprdy_internal <= mulfprdy;

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

addfpa <= addfpa_internal;
addfpb <= addfpb_internal;
addfpond <= addfpond_internal;
addfpsclr <= addfpsclr_internal;
addfpce <= addfpce_internal;
addfpr_internal <= addfpr;
addfprdy_internal <= addfprdy;

subfpa <= subfpa_internal;
subfpb <= subfpb_internal;
subfpond <= subfpond_internal;
subfpsclr <= subfpsclr_internal;
subfpce <= subfpce_internal;
subfpr_internal <= subfpr;
subfprdy_internal <= subfprdy;

fixed2floata <= fixed2floata_internal;
fixed2floatond <= fixed2floatond_internal;
fixed2floatsclr <= fixed2floatsclr_internal;
fixed2floatce <= fixed2floatce_internal;
fixed2floatr_internal <= fixed2floatr;
fixed2floatrdy_internal <= fixed2floatrdy;

o_rdy <= rdy;

--i2c_mem_ena <= ExtractKsTaParameters_i2c_mem_ena when ExtractKsTaParameters_mux = '1'
--else '0';

--i2c_mem_addra <= ExtractKsTaParameters_i2c_mem_addra when ExtractKsTaParameters_mux = '1'
--else (others => '0');

--ExtractKsTaParameters_i2c_mem_douta <= i2c_mem_douta when ExtractKsTaParameters_mux = '1' else (others => '0');

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else i_addr when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	type states is (idle,s0,s1,s2,s3,
	s7,s8,s10,
	s15,s16,s17,s19,
	s22,s25,s25a,s26,s28,s31);
	variable state : states;
  constant const_plus1 : std_logic_vector (31 downto 0) := x"3F800000";
  constant const_minus1 : std_logic_vector (31 downto 0) := x"BF800000";
  constant const_2pow13 : std_logic_vector (31 downto 0) := x"46000000";
  constant const_Ta0 : std_logic_vector (31 downto 0) := x"41C80000"; -- 25
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			addfpsclr_internal <= '1';
			subfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			rdy <= '0';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			subfpa_internal <= (others => '0');
			subfpb_internal <= (others => '0');
			mulfpond_internal <= '0';
			addfpond_internal <= '0';
			subfpond_internal <= '0';
			mulfpce_internal <= '0';
			addfpce_internal <= '0';
			subfpce_internal <= '0';
			write_enable <= '0';
      i := 0;
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s0;
            --report "CalculateAlphaComp";
            rdy <= '0';
					else
						state := idle;
            i2c_mem_ena <= '0';
					end if;
					i := 0;
          addfpsclr_internal <= '0';
          subfpsclr_internal <= '0';
          mulfpsclr_internal <= '0';
          divfpsclr_internal <= '0';
          fixed2floatsclr_internal <= '0';
				when s0 => state := s1;
          i2c_mem_ena <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (60*2+0, 12)); -- 243c MSB kstaee 8bit
        when s1 => state := s2;
          addfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
					subfpsclr_internal <= '0';
          fixed2floatsclr_internal <= '0';
          mem_switchpattern_pixel <= std_logic_vector (to_unsigned (i, 10));
          o_alpha_addr <= std_logic_vector (to_unsigned (i, 10));
        when s2 =>
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <=
          i2c_mem_douta (7) & i2c_mem_douta (7) & 
          i2c_mem_douta (7) & i2c_mem_douta (7) & 
          i2c_mem_douta (7) & i2c_mem_douta (7) & 
          i2c_mem_douta (7) & i2c_mem_douta (7) & 
          i2c_mem_douta (7 downto 0);
          if (fixed2floatrdy_internal = '1') then state := s3;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
            --synthesis translate_off
            --report_error("================ KsTa fi2fl", fixed2floatr_internal, 0.0);
            --synthesis translate_on
          else state := s2; end if;
        when s3 =>
          fixed2floatsclr_internal <= '0';
          divfpce_internal <= '1';
          divfpa_internal <= fixed2floatr_internal;
          divfpb_internal <= const_2pow13;
          divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := s7;
            --synthesis translate_off
            --report_error("================ KsTa", divfpr_internal, 0.0);
            --synthesis translate_on
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
          else state := s3; end if;
        when s7 =>
          divfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= i_Ta;
          subfpb_internal <= const_Ta0;
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := s8;
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
          else state := s7; end if;
				when s8 =>
					subfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= subfpr_internal;
          mulfpb_internal <= divfpr_internal; -- ksta
          mulfpond_internal <= '1';
					if (mulfprdy_internal = '1') then state := s10;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s8; end if;
				when s10 =>
          mulfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= mulfpr_internal;
          subfpb_internal <= const_minus1;
          subfpond_internal <= '1';
					if (subfprdy_internal = '1') then state := s15;
--						fptmp3 := subfpr_internal;
						subfpce_internal <= '0';
						subfpond_internal <= '0';
						subfpsclr_internal <= '1';
					else state := s10; end if;
          
          
				when s15 =>
          subfpsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= pattern_ft;
					mulfpb_internal <= i_acpsubpage1;
					mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s16;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s15; end if;
        when s16 => -- XXX empty state for rm tmp reg
          mulfpsclr_internal <= '0';
					addfpce_internal <= '1';
					addfpa_internal <= mulfpr_internal;
					addfpb_internal <= x"00000000";
					addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s17;
						addfpce_internal <= '0';
						addfpond_internal <= '0';
						addfpsclr_internal <= '1';
					else state := s16; end if;
				when s17 =>
					addfpsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= pattern_neg_ft;
					mulfpb_internal <= i_acpsubpage0;
					mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s19;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s17; end if;
				when s19 =>
					mulfpsclr_internal <= '0';
					addfpce_internal <= '1';
					addfpa_internal <= mulfpr_internal;
					addfpb_internal <= addfpr_internal;
					addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s22;
						addfpce_internal <= '0';
						addfpond_internal <= '0';
						addfpsclr_internal <= '1';
					else state := s19; end if;
				when s22 =>
					addfpsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= i_tgc;
					mulfpb_internal <= addfpr_internal;
					mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s25;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s22; end if;
				when s25 => state := s25a;
					mulfpsclr_internal <= '0';
          
        when s25a =>
          mulfpce_internal <= '1';
					mulfpa_internal <= mulfpr_internal;
					mulfpb_internal <= const_minus1;
					mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s26;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s25a; end if;
				when s26 =>
					mulfpsclr_internal <= '0';
          
					addfpce_internal <= '1';
					addfpa_internal <= mulfpr_internal;
					addfpb_internal <= i_alpha_do;
					addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s28;
						addfpce_internal <= '0';
						addfpond_internal <= '0';
						addfpsclr_internal <= '1';
					else state := s26; end if;
          
				when s28 =>
					addfpsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= addfpr_internal;
					mulfpb_internal <= subfpr_internal;
					mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s31;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
            write_enable <= '1';
            addra <= std_logic_vector (to_unsigned (i, 10)); -- alphacomp
            dia <= mulfpr_internal;
            --synthesis translate_off
            report_error("================alphacomp " & integer'image(i), mulfpr_internal, 0.0);
            --warning_neq_fp(mulfpr_internal, 0.0, "================alphacomp " & integer'image(i));
            --synthesis translate_on
					else state := s28; end if;
				when s31 =>
					write_enable <= '0';
					if (i = (C_ROW*C_COL)-1) then
						i := 0;
            state := idle;
            rdy <= '1';
					else
						state := s0;
						i := i + 1;
					end if;
			end case;
		end if;
	end if;
end process p0;

--ExtractKsTaParameters_clock <= i_clock;
--ExtractKsTaParameters_reset <= i_reset;
--inst_ExtractKsTaParameters : ExtractKsTaParameters PORT MAP (
--i_clock => ExtractKsTaParameters_clock,
--i_reset => ExtractKsTaParameters_reset,
--i_run => ExtractKsTaParameters_run,
--i2c_mem_ena => ExtractKsTaParameters_i2c_mem_ena,
--i2c_mem_addra => ExtractKsTaParameters_i2c_mem_addra,
--i2c_mem_douta => ExtractKsTaParameters_i2c_mem_douta,
--o_ksta => ExtractKsTaParameters_ksta,
--o_rdy => ExtractKsTaParameters_rdy
--);

mem_switchpattern_clock <= i_clock;
mem_switchpattern_reset <= i_reset;
inst_mem_switchpattern : mem_switchpattern PORT MAP (
i_clock => mem_switchpattern_clock,
i_reset => mem_switchpattern_reset,
i_pixel => mem_switchpattern_pixel,
o_pattern => mem_switchpattern_pattern
);

with mem_switchpattern_pattern select pattern_ft <=
x"3f800000" when '1',
x"00000000" when others;

with mem_switchpattern_pattern select pattern_neg_ft <=
x"00000000" when '1',
x"3f800000" when others;

inst_mem_alphacomp : mem_ramb16_s36_x2
GENERIC MAP (
INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000" -- start 0's
)
PORT MAP (
DO => doa,
DOP => open,
ADDR => mux_addr,
CLK => i_clock,
DI => mux_dia,
DIP => (others => '0'),
EN => '1',
SSR => i_reset,
WE => write_enable
);

end architecture Behavioral;
