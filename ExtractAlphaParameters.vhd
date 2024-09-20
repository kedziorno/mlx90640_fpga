----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:15 02/07/2023 
-- Design Name: 
-- Module Name:    ExtractAlphaParameters - Behavioral 
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

--use ieee_proposed.fixed_pkg.all;

USE work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ExtractAlphaParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_done : out std_logic;
o_rdy : out std_logic;

signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;

signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC

);
end ExtractAlphaParameters;

architecture Behavioral of ExtractAlphaParameters is

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

signal addra,mux_addr : std_logic_vector (9 downto 0);
signal doa,dia,mux_dia : std_logic_vector (31 downto 0);


-- xxx nibbles must out in next clock xyxle
signal nibble1,nibble2,nibble5,nibble4 : std_logic_vector (3 downto 0);
signal nibble3 : std_logic_vector (5 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4,out_nibble5 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;

signal rdy : std_logic;

constant C_COL : integer := 32;
constant C_ROW : integer := 24;

signal fixed2floata_internal : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond_internal : STD_LOGIC;
signal fixed2floatsclr_internal : STD_LOGIC;
signal fixed2floatce_internal : STD_LOGIC;
signal fixed2floatr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy_internal : STD_LOGIC;

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

begin

fixed2floata <= fixed2floata_internal;
fixed2floatond <= fixed2floatond_internal;
fixed2floatsclr <= fixed2floatsclr_internal;
fixed2floatce <= fixed2floatce_internal;
fixed2floatr_internal <= fixed2floatr;
fixed2floatrdy_internal <= fixed2floatrdy;

mulfpa <= mulfpa_internal;
mulfpb <= mulfpb_internal;
mulfpond <= mulfpond_internal;
mulfpsclr <= mulfpsclr_internal;
mulfpce <= mulfpce_internal;
mulfpr_internal <= mulfpr;
mulfprdy_internal <= mulfprdy;

addfpa <= addfpa_internal;
addfpb <= addfpb_internal;
addfpond <= addfpond_internal;
addfpsclr <= addfpsclr_internal;
addfpce <= addfpce_internal;
addfpr_internal <= addfpr;
addfprdy_internal <= addfprdy;

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else std_logic_vector (to_unsigned (to_integer(unsigned (i_addr))+C_COL+C_ROW,10))  when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

p0 : process (i_clock) is
	type states is (idle,
	acc0,acc1,acc2,acc3,acc4,
	acc5,acc6,acc7,acc8,acc9,
	acc10,acc11,acc12,acc13,acc14,
	acc15,acc16,acc17,acc18,acc19,
	acc20,acc21,acc22,acc23,acc24,
	acc25,acc26,acc27,acc28,acc29,
	acc30,acc31,acc32,acc33,acc34,
	acc35,acc36,acc37,acc38,acc39,
	acc40,acc41,acc42,acc43,acc44,
	acc45,acc46,acc47,acc48,acc49,
	acc50,acc51,acc52,acc53,acc54,
	acc55,acc56,acc57,acc58,acc59,	
	acc60,acc61,acc62,acc63,acc64,
	acc65,acc66,acc67,acc68,acc69,
	acc70,acc71,acc72,acc73,acc74,
	acc75,acc76,acc77,acc78,acc79,
	acc80,acc81,acc82,acc83,acc84,
	acc85,acc86,acc87,acc88,acc89,
	acc90,acc91,acc92,acc93,acc94,
	acc95,acc96,acc97,acc98,acc99,
	acc100,acc101,acc102,acc103,acc104,
	acc105,acc106,acc107,acc108,acc109,
	acc110,acc111,acc112,acc113,acc114,
	acc115,acc116,acc117,acc118,acc119,
	acc120,acc121,acc122,acc123,acc124,
	acc125,acc126,acc127,acc128,acc129,
	acc130,acc131,acc132,acc133,acc134,
	acc135,acc136,acc137,acc138,acc139,
	acc140,acc141,
	pow0,pow1,pow2,pow3,pow4,pow5,
	s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,
	ending);
	variable state : states;
	variable vaccRemScale : std_logic_vector (31 downto 0);
	variable vaccColumnScale : std_logic_vector (31 downto 0);
	variable vaccRowScale : std_logic_vector (31 downto 0);

	variable vaccRemScale1 : std_logic_vector (3 downto 0);
	variable vaccColumnScale1 : std_logic_vector (3 downto 0);
	variable vaccRowScale1 : std_logic_vector (3 downto 0);

	variable valphaRef1: std_logic_vector (15 downto 0);
	variable valphaRef : std_logic_vector (15 downto 0);
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable vacccolumnj,accrowi,vaccrowi,valphaReference_ft,vAlphaPixel_ft : std_logic_vector (31 downto 0);
	variable temp1,vAlphaPixel : std_logic_vector (15 downto 0);

--	variable fracas : fracas;
--	variable fracbs : fracbs;
--	variable fracau : fracau;
--	variable fracbu : fracbu;
--	variable vAlphaPixel_sf,valphaRef_sf : st_sfixed_max;
--	variable eeprom16slv,ram16slv : slv16;
--	variable eeprom16sf,ram16sf : sfixed16;
--	variable eeprom16uf,ram16uf : ufixed16;

	variable col : integer range 0 to C_COL-1;
	variable row : integer range 0 to C_ROW-1;
	variable i : integer range 0 to (C_ROW*C_COL)-1;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			nibble1 <= (others => '0');
			nibble2 <= (others => '0');
			nibble3 <= (others => '0');
			write_enable <= '0';
			rdy <= '0';
			addfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			divfpsclr_internal <= '1';
			fixed2floatsclr_internal <= '1';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			divfpa_internal <= (others => '0');
			divfpb_internal <= (others => '0');
			addfpond_internal <= '0';
			mulfpond_internal <= '0';
			divfpond_internal <= '0';
			addfpce_internal <= '0';
			mulfpce_internal <= '0';
			divfpce_internal <= '0';
			addra <= (others => '0');
			dia <= (others => '0');
			o_done <= '0';
			i2c_mem_ena <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := acc0;
						i2c_mem_ena <= '1';
						write_enable <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
						write_enable <= '0';
					end if;
				when acc0 => state := acc1;
					addfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
					fixed2floatsclr_internal <= '0';
					rdy <= '0';
					
				when acc1 => state := acc2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+0, 12)); -- 2420 LSB
				when acc2 => state := acc3;
				when acc3 => state := acc4;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+1, 12)); -- 2420 MSB
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc4 => state := acc5;
				when acc5 => state := acc6;
					temp1 (7 downto 0) := i2c_mem_douta;
					----------report_error (temp1, 0.0);
				when acc6 => state := acc7;
					nibble1 <= temp1 (3 downto 0); -- acc scale remnant
				when acc7 => state := acc8;
				
					vaccRemScale := out_nibble1; -- out acc scale remnant signed
					vaccRemScale1 := temp1 (3 downto 0); -- acc scale remnant for 2^x
					
					nibble1 <= temp1 (7 downto 4); -- acc scale column
				when acc8 => state := acc9;
				
					vaccColumnScale := out_nibble1; -- out acc scale column signed
					vaccColumnScale1 := temp1 (7 downto 4); -- acc scale column for 2^x

					nibble1 <= temp1 (11 downto 8); -- acc scale row
					nibble5 <= temp1 (15 downto 12); -- alpha scale
				when acc9 => state := acc10;

					vaccRowScale := out_nibble1; -- out acc row column signed
					vaccRowScale1 := temp1 (11 downto 8); -- acc scale row for 2^x
--					vAlphaScale := out_nibble5;

				when acc10 => state := acc11;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+2, 12)); -- 2421 LSB
				when acc11 => state := acc12;
				when acc12 => state := acc13;
					valphaRef (15 downto 8) := i2c_mem_douta; -- alpharef LSB
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+3, 12)); -- 2422 MSB
				when acc13 => state := acc14;
				when acc14 => state := acc15;
					valphaRef (7 downto 0) := i2c_mem_douta; -- alpharef MSB
					------report_error (valphaRef, 0.0);
				
					
				when acc15 => state := acc16;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+4, 12)); -- 2422 LSB -- accrow1-4
				when acc16 => state := acc17;
				when acc17 => state := acc18;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+5, 12)); -- 2422 MSB -- accrow1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc18 => state := acc19;
				when acc19 => state := acc20;
					temp1 (7 downto 0) := i2c_mem_douta;
					----------report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc20 => state := acc21;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (0, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc21 => state := acc22;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (1, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc22 => state := acc23;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (2, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc23 => state := acc24;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (3, 10));




				when acc24 => state := acc25;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+6, 12)); -- 2423 LSB -- accrow5-8
				when acc25 => state := acc26;
				when acc26 => state := acc27;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+7, 12)); -- 2423 MSB -- accrow5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc27 => state := acc28;
				when acc28 => state := acc29;
					temp1 (7 downto 0) := i2c_mem_douta;
					----------report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc29 => state := acc30;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (4, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc30 => state := acc31;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (5, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc31 => state := acc32;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (6, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc32 => state := acc33;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (7, 10));


				when acc33 => state := acc34;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+8, 12)); -- 2424 LSB -- accrow9-12
				when acc34 => state := acc35;
				when acc35 => state := acc36;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+9, 12)); -- 2424 MSB -- accrow9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc36 => state := acc37;
				when acc37 => state := acc38;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc38 => state := acc39;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (8, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc39 => state := acc40;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (9, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc40 => state := acc41;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (10, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc41 => state := acc42;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (11, 10));



				when acc42 => state := acc43;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+10, 12)); -- 2425 LSB -- accrow13-16
				when acc43 => state := acc44;
				when acc44 => state := acc45;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+11, 12)); -- 2425 MSB -- accrow13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc45 => state := acc46;
				when acc46 => state := acc47;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc47 => state := acc48;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (12, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc48 => state := acc49;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (13, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc49 => state := acc50;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (14, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc50 => state := acc51;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (15, 10));



				when acc51 => state := acc52;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+12, 12)); -- 2426 LSB -- accrow17-20
				when acc52 => state := acc53;
				when acc53 => state := acc54;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+13, 12)); -- 2426 MSB -- accrow17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc54 => state := acc55;
				when acc55 => state := acc56;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc56 => state := acc57;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (32, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc57 => state := acc58;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (17, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc58 => state := acc59;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (18, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc59 => state := acc60;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (19, 10));


				when acc60 => state := acc61;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+14, 12)); -- 2427 LSB -- accrow21-24
				when acc61 => state := acc62;
				when acc62 => state := acc63;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+15, 12)); -- 2427 MSB -- accrow21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc63 => state := acc64;
				when acc64 => state := acc65;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc65 => state := acc66;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (20, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc66 => state := acc67;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (21, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc67 => state := acc68;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (22, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc68 => state := acc69;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (23, 10));


				when acc69 => state := acc70;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+16, 12)); -- 2428 LSB -- acccol1-4
				when acc70 => state := acc71;
				when acc71 => state := acc72;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+17, 12)); -- 2428 MSB -- acccol1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc72 => state := acc73;
				when acc73 => state := acc74;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc74 => state := acc75;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (24, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc75 => state := acc76;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (25, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc76 => state := acc77;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (26, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc77 => state := acc78;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (27, 10));


				when acc78 => state := acc79;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+18, 12)); -- 2429 LSB -- acccol5-8
				when acc79 => state := acc80;
				when acc80 => state := acc81;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+19, 12)); -- 2429 MSB -- acccol5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc81 => state := acc82;
				when acc82 => state := acc83;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc83 => state := acc84;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (28, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc84 => state := acc85;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (29, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc85 => state := acc86;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (30, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc86 => state := acc87;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (31, 10));


				when acc87 => state := acc88;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+20, 12)); -- 242a LSB -- acccol9-12
				when acc88 => state := acc89;
				when acc89 => state := acc90;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+21, 12)); -- 242a MSB -- acccol9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc90 => state := acc91;
				when acc91 => state := acc92;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc92 => state := acc93;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (32, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc93 => state := acc94;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (33, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc94 => state := acc95;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (34, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc95 => state := acc96;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (35, 10));


				when acc96 => state := acc97;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+22, 12)); -- 242b LSB -- acccol13-16
				when acc97 => state := acc98;
				when acc98 => state := acc99;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+23, 12)); -- 242b MSB -- acccol13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc99 => state := acc100;
				when acc100 => state := acc101;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc101 => state := acc102;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (36, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc102 => state := acc103;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (37, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc103 => state := acc104;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (38, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc104 => state := acc105;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (39, 10));


				when acc105 => state := acc106;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+24, 12)); -- 242c LSB -- acccol17-20
				when acc106 => state := acc107;
				when acc107 => state := acc108;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+25, 12)); -- 242c MSB -- acccol17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc108 => state := acc109;
				when acc109 => state := acc110;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc110 => state := acc111;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (40, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc111 => state := acc112;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (41, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc112 => state := acc113;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (42, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc113 => state := acc114;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (43, 10));



				when acc114 => state := acc115;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+26, 12)); -- 242d LSB -- acccol21-24
				when acc115 => state := acc116;
				when acc116 => state := acc117;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+27, 12)); -- 242d MSB -- acccol21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc117 => state := acc118;
				when acc118 => state := acc119;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc119 => state := acc120;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (44, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc120 => state := acc121;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (45, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc121 => state := acc122;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (46, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc122 => state := acc123;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (47, 10));



				when acc123 => state := acc124;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+28, 12)); -- 242e LSB -- acccol25-28
				when acc124 => state := acc125;
				when acc125 => state := acc126;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+29, 12)); -- 242e MSB -- acccol25-28
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc126 => state := acc127;
				when acc127 => state := acc128;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc128 => state := acc129;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (48, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc129 => state := acc130;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (49, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc130 => state := acc131;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (50, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc131 => state := acc132;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (51, 10));



				when acc132 => state := acc133;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+30, 12)); -- 242f LSB -- acccol29-32
				when acc133 => state := acc134;
				when acc134 => state := acc135;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+31, 12)); -- 242f MSB -- acccol29-32
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc135 => state := acc136;
				when acc136 => state := acc137;
					temp1 (7 downto 0) := i2c_mem_douta;
					----------report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc137 => state := acc138;
					nibble2 <= temp1 (7 downto 4); -- acccolB
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (52, 10));
				when acc138 => state := acc139;
					nibble2 <= temp1 (11 downto 8); -- acccolC
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (53, 10));
				when acc139 => state := acc140;
					nibble2 <= temp1 (15 downto 12); -- acccolD
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (54, 10));
				when acc140 => state := acc141;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (55, 10));
				when acc141 => state := pow0;
					write_enable <= '0';


				when pow0 => state := pow1;
					addra <= (others => '0');
					nibble4 <= vaccRemScale1;
				when pow1 => state := pow2;
					nibble4 <= vaccColumnScale1;
					vaccRemScale := out_nibble4; -- 2^accscaleremnant
					----report "vaccRemScale : " & real'image (ap_slv2fp (vaccRemScale));
				when pow2 => state := pow3;
					nibble4 <= vaccRowScale1;
					vaccColumnScale := out_nibble4; -- 2^accscalecolumn
					----report "vaccColumnScale : " & real'image (ap_slv2fp (vaccColumnScale));
				when pow3 => state := pow4;
					vaccRowScale := out_nibble4; -- 2^accscalerow
					----report "vaccRowScale : " & real'image (ap_slv2fp (vaccRowScale));
--					valphaRef_sf := resize (to_sfixed (valphaRef, eeprom16sf), valphaRef_sf);
--					----------report_error (valphaRef, 0.0);
--					fixed2floatce_internal <= '1';
--					fixed2floatond_internal <= '1';
--					fixed2floata_internal <= 
--					to_slv (to_sfixed (to_slv (valphaRef_sf (fracas'high downto fracas'low)), fracas))&
--					to_slv (to_sfixed (to_slv (valphaRef_sf (fracbs'high downto fracbs'low)), fracbs));
fixed2floatce_internal <= '1';
fixed2floatond_internal <= '1';
fixed2floata_internal <=
valphaRef (15) & valphaRef (15) & 
valphaRef (15) & valphaRef (15) & 
valphaRef (15) & valphaRef (15) & 
valphaRef (15) & valphaRef (15) & 
valphaRef (15) & valphaRef (15) & 
valphaRef (15) & valphaRef (15) & 
valphaRef (15) & valphaRef (15) & 
valphaRef (15) & valphaRef (15) & 
valphaRef (15) & valphaRef (15) & 
valphaRef (15) & valphaRef & "00000000000000000000000000000";
				when pow4 =>
					if (fixed2floatrdy_internal = '1') then state := pow5;
						valphaReference_ft := fixed2floatr_internal;
						----report "valphaReference_ft : " & real'image (ap_slv2fp (valphaReference_ft));
						fixed2floatce_internal <= '0';
						fixed2floatond_internal <= '0';
						fixed2floatsclr_internal <= '1';
					else state := pow4; end if;
				when pow5 => state := s0;
					fixed2floatsclr_internal <= '0';
	row := 0;
	col := 0;
	i := 0;
when s0 => state := s1; 	--1
	------report "====================";
	vAlphaPixel_ft := (others => '0');
	write_enable <= '0';
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i), 12)); -- offset LSB 0
	addra <= std_logic_vector (to_unsigned (col+C_ROW, 10)); -- accColumnJ
when s1 => state := s2;	--2
	i2c_mem_addra <= (others => '0');
	addra <= (others => '0');
when s2 => state := s3;	--2
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- offset MSB 1
	addra <= std_logic_vector (to_unsigned (row, 10)); -- accrowI
	vaccColumnJ := doa;
--	----report "vaccColumnJ : " & real'image (ap_slv2fp (vaccColumnJ));
	vAlphaPixel (15 downto 8) := i2c_mem_douta;
when s3 => state := s4; 	--3
	i2c_mem_addra <= (others => '0');
	addra <= (others => '0');
when s4 => state := s5; 	--3
	vaccRowI := doa;
--	----report "vaccRowI : " & real'image (ap_slv2fp (vaccRowI));
	vAlphaPixel (7 downto 0) := i2c_mem_douta;
--	------report_error (vAlphaPixel, 0.0);
	nibble3 <= vAlphaPixel (9 downto 4);
when s5 => state := s6; 	--5
	mulfpce_internal <= '1';
	mulfpa_internal <= out_nibble3;
	mulfpb_internal <= vaccRemScale;
	mulfpond_internal <= '1';
--	----report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
--	----report "vaccRemScale : " & real'image (ap_slv2fp (vaccRemScale));
when s6 => 			--6
	if (mulfprdy_internal = '1') then state := s7;
		vAlphaPixel_ft := mulfpr_internal;
		mulfpce_internal <= '0';
		mulfpond_internal <= '0';
		mulfpsclr_internal <= '1';
	else state := s6; end if;
when s7 => state := s8; 	--7
	mulfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= vaccColumnJ;
	mulfpb_internal <= vaccColumnScale;
	mulfpond_internal <= '1';
--	----report "vaccColumnJ : " & real'image (ap_slv2fp (vaccColumnJ));
--	----report "vaccColumnScale : " & real'image (ap_slv2fp (vaccColumnScale));
when s8 => 			--8
	if (mulfprdy_internal = '1') then state := s9;
		vaccColumnJ := mulfpr_internal;
		mulfpce_internal <= '0';
		mulfpond_internal <= '0';
		mulfpsclr_internal <= '1';
	else state := s8; end if;
when s9 => state := s10; 	--9
	mulfpsclr_internal <= '0';
when s10 => state := s11; 	--10
	mulfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= vaccRowI;
	mulfpb_internal <= vaccRowScale;
	mulfpond_internal <= '1';
--	----report "vaccRowI : " & real'image (ap_slv2fp (vaccRowI));
--	----report "vaccRowScale : " & real'image (ap_slv2fp (vaccRowScale));
when s11 => 			--11
	if (mulfprdy_internal = '1') then state := s12;
		vaccRowI := mulfpr_internal;
		mulfpce_internal <= '0';
		mulfpond_internal <= '0';
		mulfpsclr_internal <= '1';
	else state := s11; end if;
when s12 => state := s13; 	--12
	mulfpsclr_internal <= '0';
when s13 => state := s14; 	--13
	addfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= vAlphaPixel_ft;
	addfpb_internal <= vaccColumnJ;
	addfpond_internal <= '1';
--	----report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	----report "vaccColumnJ : " & real'image (ap_slv2fp (vaccColumnJ));
when s14 => 			--14
	if (addfprdy_internal = '1') then state := s15;
		vAlphaPixel_ft := addfpr_internal;
		addfpce_internal <= '0';
		addfpond_internal <= '0';
		addfpsclr_internal <= '1';
	else state := s14; end if;
when s15 => state := s16; 	--15
	addfpsclr_internal <= '0';
when s16 => state := s17; 	--16
	addfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= vAlphaPixel_ft;
	addfpb_internal <= vaccRowI;
	addfpond_internal <= '1';
--	----report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	----report "vaccRowI : " & real'image (ap_slv2fp (vaccRowI));
when s17 => 			--17
	if (addfprdy_internal = '1') then state := s18;
		vAlphaPixel_ft := addfpr_internal;
		addfpce_internal <= '0';
		addfpond_internal <= '0';
		addfpsclr_internal <= '1';
	else state := s17; end if;
when s18 => state := s19; 	--18
	addfpsclr_internal <= '0';
when s19 => state := s20; 	--19
	addfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= vAlphaPixel_ft;
	addfpb_internal <= valphaReference_ft;
	addfpond_internal <= '1';
--	----report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	----report "valphaReference_ft : " & real'image (ap_slv2fp (valphaReference_ft));
when s20 => 			--20
	if (addfprdy_internal = '1') then state := s21;
		vAlphaPixel_ft := addfpr_internal;
		addfpce_internal <= '0';
		addfpond_internal <= '0';
		addfpsclr_internal <= '1';
	else state := s20; end if;
when s21 => state := s22; 	--21
	addfpsclr_internal <= '0';
	divfpce_internal <= '1';
	divfpa_internal <= vAlphaPixel_ft;
	divfpb_internal <= out_nibble5;
	divfpond_internal <= '1';
--	----report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	----report "out_nibble5 : " & real'image (ap_slv2fp (out_nibble5));
when s22 =>
	if (divfprdy_internal = '1') then state := s23;
		vAlphaPixel_ft := divfpr_internal;
		divfpce_internal <= '0';
		divfpond_internal <= '0';
		divfpsclr_internal <= '1';
	else state := s22; end if;
when s23 => state := s24;
	divfpsclr_internal <= '0';
when s24 => state := s25; 	--22
	write_enable <= '1';
	addra <= std_logic_vector (to_unsigned (C_ROW+C_COL+i, 10)); -- vAlphaPixel_ft
	dia <= vAlphaPixel_ft;
	--synthesis translate_off
  report "================vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
  --synthesis translate_on
	i := i + 1;
when s25 =>
	if (col = C_COL-1) then
		col := 0;
		state := s26;
	else
		col := col + 1;
		state := s0;
	end if;
when s26 =>
	if (row = C_ROW-1) then
		row := 0;
		state := ending;
	else
		row := row + 1;
		state := s0;
	end if;

				when ending => state := idle;
					rdy <= '1';
				when others => null;
			end case;
--			stemp1 <= temp1;
		end if;
	end if;
end process p0;

inst_mem_acc : mem_ramb16_s36_x2
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

--INIT_7f => X"41700000 41600000 41500000 41400000 41300000 41200000 41100000 41000000", -- unsigned 0-15 for accremscale,accrowscale,acccolscale
--INIT_7e => X"40e00000 40c00000 40a00000 40800000 40400000 40000000 3f800000 22000000",
with nibble1 select out_nibble1 <= -- x - accremscale,accrowscale,acccolscale unsigned 4bit
x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"41000000" when x"8", x"41100000" when x"9", x"41200000" when x"a", x"41300000" when x"b",
x"41400000" when x"c", x"41500000" when x"d", x"41600000" when x"e", x"41700000" when x"f",
x"00000000" when others;

with nibble2 select out_nibble2 <= -- >7,-16 - rows1-24,cols1-32 signed 4bit
x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"00000000" when others;

with nibble3 select out_nibble3 <= -- >31,-64 - alphapixel raw
x"40e00000" when "000111",x"40c00000" when "000110",x"40a00000" when "000101",x"40800000" when "000100",x"40400000" when "000011",x"40000000" when "000010",x"3f800000" when "000001",x"00000000" when "000000",
x"41700000" when "001111",x"41600000" when "001110",x"41500000" when "001101",x"41400000" when "001100",x"41300000" when "001011",x"41200000" when "001010",x"41100000" when "001001",x"41000000" when "001000",
x"41b80000" when "010111",x"41b00000" when "010110",x"41a80000" when "010101",x"41a00000" when "010100",x"41980000" when "010011",x"41900000" when "010010",x"41880000" when "010001",x"41800000" when "010000",
x"41f80000" when "011111",x"41f00000" when "011110",x"41e80000" when "011101",x"41e00000" when "011100",x"41d80000" when "011011",x"41d00000" when "011010",x"41c80000" when "011001",x"41c00000" when "011000",
x"c1c80000" when "100111",x"c1d00000" when "100110",x"c1d80000" when "100101",x"c1e00000" when "100100",x"c1e80000" when "100011",x"c1f00000" when "100010",x"c1f80000" when "100001",x"c2000000" when "100000",
x"c1880000" when "101111",x"c1900000" when "101110",x"c1980000" when "101101",x"c1a00000" when "101100",x"c1a80000" when "101011",x"c1b00000" when "101010",x"c1b80000" when "101001",x"c1c00000" when "101000",
x"c1100000" when "110111",x"c1200000" when "110110",x"c1300000" when "110101",x"c1400000" when "110100",x"c1500000" when "110011",x"c1600000" when "110010",x"c1700000" when "110001",x"c1800000" when "110000",
x"bf800000" when "111111",x"c0000000" when "111110",x"c0400000" when "111101",x"c0800000" when "111100",x"c0a00000" when "111011",x"c0c00000" when "111010",x"c0e00000" when "111001",x"c1000000" when "111000",
x"00000000" when others;

--INIT_01 => X"56000000 55800000 55000000 54800000 54000000 53800000 53000000 52800000", -- unsigned 0-15 - 2^(x+30)
--INIT_00 => X"52000000 51800000 51000000 50800000 50000000 4f800000 4f000000 4e800000", 
with nibble5 select out_nibble5 <= -- 2^(x+30) - 2^alphascale
x"4e800000" when x"0", x"4f000000" when x"1", x"4f800000" when x"2", x"50000000" when x"3",
x"50800000" when x"4", x"51000000" when x"5", x"51800000" when x"6", x"52000000" when x"7",
x"52800000" when x"8", x"53000000" when x"9", x"53800000" when x"a", x"54000000" when x"b",
x"54800000" when x"c", x"55000000" when x"d", x"55800000" when x"e", x"56000000" when x"f",
x"00000000" when others;

--INIT_01 => X"47000000 46800000 46000000 45800000 45000000 44800000 44000000 43800000",
--INIT_00 => X"43000000 42800000 42000000 41800000 41000000 40800000 40000000 3f800000",
with nibble4 select out_nibble4 <= -- 2^x unsigned 0-15
x"3f800000" when x"0", x"40000000" when x"1", x"40800000" when x"2", x"41000000" when x"3",
x"41800000" when x"4", x"42000000" when x"5", x"42800000" when x"6", x"43000000" when x"7",
x"43800000" when x"8", x"44000000" when x"9", x"44800000" when x"a", x"45000000" when x"b",
x"45800000" when x"c", x"46000000" when x"d", x"46800000" when x"e", x"47000000" when x"f",
x"00000000" when others;

end Behavioral;

