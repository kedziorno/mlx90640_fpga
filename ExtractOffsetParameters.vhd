----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:15 02/07/2023 
-- Design Name: 
-- Module Name:    ExtractOffsetParameters - Behavioral 
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
library IEEE,ieee_proposed;
use IEEE.STD_LOGIC_1164.ALL;

use ieee_proposed.fixed_pkg.all;

USE work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ExtractOffsetParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

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
signal addfprdy : in STD_LOGIC

);
end ExtractOffsetParameters;

architecture Behavioral of ExtractOffsetParameters is

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
signal nibble1,nibble2,nibble4 : std_logic_vector (3 downto 0);
signal nibble3 : std_logic_vector (5 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;

signal rdy : std_logic;

signal stemp1 : std_logic_vector (15 downto 0);

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

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else std_logic_vector (to_unsigned (to_integer(unsigned (i_addr))+C_COL+C_ROW,10)) when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

p0 : process (i_clock) is
	type states is (idle,
	occ0,occ1,occ2,occ3,occ4,
	occ5,occ6,occ7,occ8,occ9,
	occ10,occ11,occ12,occ13,occ14,
	occ15,occ16,occ17,occ18,occ19,
	occ20,occ21,occ22,occ23,occ24,
	occ25,occ26,occ27,occ28,occ29,
	occ30,occ31,occ32,occ33,occ34,
	occ35,occ36,occ37,occ38,occ39,
	occ40,occ41,occ42,occ43,occ44,
	occ45,occ46,occ47,occ48,occ49,
	occ50,occ51,occ52,occ53,occ54,
	occ55,occ56,occ57,occ58,occ59,
	occ60,occ61,occ62,occ63,occ64,
	occ65,occ66,occ67,occ68,occ69,
	occ70,occ71,occ72,occ73,occ74,
	occ75,occ76,occ77,occ78,occ79,
	occ80,occ81,occ82,occ83,occ84,
	occ85,occ86,occ87,occ88,occ89,
	occ90,occ91,occ92,occ93,occ94,
	occ95,occ96,occ97,occ98,occ99,
	occ100,occ101,occ102,occ103,occ104,
	occ105,occ106,occ107,occ108,occ109,
	occ110,occ111,occ112,occ113,occ114,
	occ115,occ116,occ117,occ118,occ119,
	occ120,occ121,occ122,occ123,occ124,
	occ125,occ126,occ127,occ128,occ129,
	occ130,occ131,occ132,occ133,occ134,
	occ135,occ136,occ137,occ138,occ139,
	occ140,occ141,
	pow0,pow1,pow2,pow3,pow4,pow5,
	s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,
	ending);
	variable state : states;
	variable voccRemScale : std_logic_vector (31 downto 0);
	variable voccColumnScale : std_logic_vector (31 downto 0);
	variable voccRowScale : std_logic_vector (31 downto 0);

	variable voccRemScale1 : std_logic_vector (3 downto 0);
	variable voccColumnScale1 : std_logic_vector (3 downto 0);
	variable voccRowScale1 : std_logic_vector (3 downto 0);

	variable voffsetRef1: std_logic_vector (15 downto 0);
	variable voffsetRef : std_logic_vector (15 downto 0);
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable vocccolumnj,occrowi,voccrowi,vOffsetAverage,voffset_ft : std_logic_vector (31 downto 0);
	variable temp1,voffset : std_logic_vector (15 downto 0);

	variable fracas : fracas;
	variable fracbs : fracbs;
	variable fracau : fracau;
	variable fracbu : fracbu;
	variable vOffset_sf,voffsetRef_sf : st_sfixed_max;
	variable eeprom16slv,ram16slv : slv16;
	variable eeprom16sf,ram16sf : sfixed16;
	variable eeprom16uf,ram16uf : ufixed16;

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
			fixed2floatsclr_internal <= '1';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			addfpond_internal <= '0';
			mulfpond_internal <= '0';
			addfpce_internal <= '0';
			mulfpce_internal <= '0';
			addra <= (others => '0');
			dia <= (others => '0');
			i2c_mem_ena <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := occ0;
						i2c_mem_ena <= '1';
						write_enable <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
						write_enable <= '0';
					end if;
				when occ0 => state := occ1;
					addfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					fixed2floatsclr_internal <= '0';
					rdy <= '0';
					
				when occ1 => state := occ2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+0, 12)); -- 2410 LSB
				when occ2 => state := occ3;
				when occ3 => state := occ4;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+1, 12)); -- 2410 MSB
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ4 => state := occ5;
				when occ5 => state := occ6;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
				when occ6 => state := occ7;
					nibble1 <= temp1 (3 downto 0); -- occ scale remnant
				when occ7 => state := occ8;
				
					voccRemScale := out_nibble1; -- out occ scale remnant signed
					voccRemScale1 := temp1 (3 downto 0); -- occ scale remnant for 2^x
					
					nibble1 <= temp1 (7 downto 4); -- occ scale column
				when occ8 => state := occ9;
				
					voccColumnScale := out_nibble1; -- out occ scale column signed
					voccColumnScale1 := temp1 (7 downto 4); -- occ scale column for 2^x

					nibble1 <= temp1 (11 downto 8); -- occ scale row
				when occ9 => state := occ10;
					
					voccRowScale := out_nibble1; -- out occ row column signed
					voccRowScale1 := temp1 (11 downto 8); -- occ scale row for 2^x

				when occ10 => state := occ11;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+2, 12)); -- 2411 LSB
				when occ11 => state := occ12;
				when occ12 => state := occ13;
					voffsetRef (15 downto 8) := i2c_mem_douta; -- offsetref LSB
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+3, 12)); -- 2411 MSB
				when occ13 => state := occ14;
				when occ14 => state := occ15;
					voffsetRef (7 downto 0) := i2c_mem_douta; -- offsetref MSB
					----report_error (voffsetRef, 0.0);
				
					
				when occ15 => state := occ16;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+4, 12)); -- 2412 LSB -- occrow1-4
				when occ16 => state := occ17;
				when occ17 => state := occ18;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+5, 12)); -- 2412 MSB -- occrow1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ18 => state := occ19;
				when occ19 => state := occ20;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ20 => state := occ21;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (0, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ21 => state := occ22;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (1, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ22 => state := occ23;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (2, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ23 => state := occ24;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (3, 10));




				when occ24 => state := occ25;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+6, 12)); -- 2413 LSB -- occrow5-8
				when occ25 => state := occ26;
				when occ26 => state := occ27;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+7, 12)); -- 2413 MSB -- occrow5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ27 => state := occ28;
				when occ28 => state := occ29;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ29 => state := occ30;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (4, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ30 => state := occ31;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (5, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ31 => state := occ32;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (6, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ32 => state := occ33;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (7, 10));


				when occ33 => state := occ34;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+8, 12)); -- 2414 LSB -- occrow9-12
				when occ34 => state := occ35;
				when occ35 => state := occ36;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+9, 12)); -- 2414 MSB -- occrow9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ36 => state := occ37;
				when occ37 => state := occ38;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ38 => state := occ39;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (8, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ39 => state := occ40;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (9, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ40 => state := occ41;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (10, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ41 => state := occ42;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (11, 10));



				when occ42 => state := occ43;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+10, 12)); -- 2415 LSB -- occrow13-16
				when occ43 => state := occ44;
				when occ44 => state := occ45;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+11, 12)); -- 2415 MSB -- occrow13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ45 => state := occ46;
				when occ46 => state := occ47;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ47 => state := occ48;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (12, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ48 => state := occ49;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (13, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ49 => state := occ50;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (14, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ50 => state := occ51;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (15, 10));



				when occ51 => state := occ52;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+12, 12)); -- 2416 LSB -- occrow17-20
				when occ52 => state := occ53;
				when occ53 => state := occ54;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+13, 12)); -- 2416 MSB -- occrow17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ54 => state := occ55;
				when occ55 => state := occ56;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ56 => state := occ57;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (32, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ57 => state := occ58;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (17, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ58 => state := occ59;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (18, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ59 => state := occ60;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (19, 10));


				when occ60 => state := occ61;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+14, 12)); -- 2417 LSB -- occrow21-24
				when occ61 => state := occ62;
				when occ62 => state := occ63;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+15, 12)); -- 2417 MSB -- occrow21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ63 => state := occ64;
				when occ64 => state := occ65;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ65 => state := occ66;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (20, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ66 => state := occ67;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (21, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ67 => state := occ68;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (22, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ68 => state := occ69;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (23, 10));


				when occ69 => state := occ70;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+16, 12)); -- 2418 LSB -- occcol1-4
				when occ70 => state := occ71;
				when occ71 => state := occ72;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+17, 12)); -- 2418 MSB -- occcol1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ72 => state := occ73;
				when occ73 => state := occ74;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ74 => state := occ75;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (24, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ75 => state := occ76;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (25, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ76 => state := occ77;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (26, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ77 => state := occ78;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (27, 10));


				when occ78 => state := occ79;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+18, 12)); -- 2419 LSB -- occcol5-8
				when occ79 => state := occ80;
				when occ80 => state := occ81;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+19, 12)); -- 2419 MSB -- occcol5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ81 => state := occ82;
				when occ82 => state := occ83;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ83 => state := occ84;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (28, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ84 => state := occ85;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (29, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ85 => state := occ86;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (30, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ86 => state := occ87;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (31, 10));


				when occ87 => state := occ88;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+20, 12)); -- 241a LSB -- occcol9-12
				when occ88 => state := occ89;
				when occ89 => state := occ90;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+21, 12)); -- 241a MSB -- occcol9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ90 => state := occ91;
				when occ91 => state := occ92;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ92 => state := occ93;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (32, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ93 => state := occ94;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (33, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ94 => state := occ95;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (34, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ95 => state := occ96;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (35, 10));


				when occ96 => state := occ97;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+22, 12)); -- 241b LSB -- occcol13-16
				when occ97 => state := occ98;
				when occ98 => state := occ99;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+23, 12)); -- 241b MSB -- occcol13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ99 => state := occ100;
				when occ100 => state := occ101;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ101 => state := occ102;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (36, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ102 => state := occ103;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (37, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ103 => state := occ104;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (38, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ104 => state := occ105;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (39, 10));


				when occ105 => state := occ106;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+24, 12)); -- 241c LSB -- occcol17-20
				when occ106 => state := occ107;
				when occ107 => state := occ108;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+25, 12)); -- 241c MSB -- occcol17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ108 => state := occ109;
				when occ109 => state := occ110;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ110 => state := occ111;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (40, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ111 => state := occ112;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (41, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ112 => state := occ113;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (42, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ113 => state := occ114;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (43, 10));



				when occ114 => state := occ115;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+26, 12)); -- 241d LSB -- occcol21-24
				when occ115 => state := occ116;
				when occ116 => state := occ117;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+27, 12)); -- 241d MSB -- occcol21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ117 => state := occ118;
				when occ118 => state := occ119;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ119 => state := occ120;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (44, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ120 => state := occ121;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (45, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ121 => state := occ122;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (46, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ122 => state := occ123;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (47, 10));



				when occ123 => state := occ124;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+28, 12)); -- 241e LSB -- occcol25-28
				when occ124 => state := occ125;
				when occ125 => state := occ126;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+29, 12)); -- 241e MSB -- occcol25-28
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ126 => state := occ127;
				when occ127 => state := occ128;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ128 => state := occ129;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (48, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ129 => state := occ130;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (49, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ130 => state := occ131;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (50, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ131 => state := occ132;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (51, 10));



				when occ132 => state := occ133;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+30, 12)); -- 241f LSB -- occcol29-32
				when occ133 => state := occ134;
				when occ134 => state := occ135;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+31, 12)); -- 241f MSB -- occcol29-32
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ135 => state := occ136;
				when occ136 => state := occ137;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ137 => state := occ138;
					nibble2 <= temp1 (7 downto 4); -- occcolB
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (52, 10));
				when occ138 => state := occ139;
					nibble2 <= temp1 (11 downto 8); -- occcolC
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (53, 10));
				when occ139 => state := occ140;
					nibble2 <= temp1 (15 downto 12); -- occcolD
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (54, 10));
				when occ140 => state := occ141;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (55, 10));
				when occ141 => state := pow0;
					write_enable <= '0';


				when pow0 => state := pow1;
					addra <= (others => '0');
					nibble4 <= voccRemScale1;
				when pow1 => state := pow2;
					nibble4 <= voccColumnScale1;
					voccRemScale := out_nibble4; -- 2^occscaleremnant
					--report "voccRemScale : " & real'image (ap_slv2fp (voccRemScale));
				when pow2 => state := pow3;
					nibble4 <= voccRowScale1;
					voccColumnScale := out_nibble4; -- 2^occscalecolumn
					--report "voccColumnScale : " & real'image (ap_slv2fp (voccColumnScale));
				when pow3 => state := pow4;
					voccRowScale := out_nibble4; -- 2^occscalerow
					--report "voccRowScale : " & real'image (ap_slv2fp (voccRowScale));
--					voffsetRef_sf := resize (to_sfixed (voffsetRef, eeprom16sf), voffsetRef_sf);
--					----report_error (voffsetRef, 0.0);
--					fixed2floatce_internal <= '1';
--					fixed2floatond_internal <= '1';
--					fixed2floata_internal <= 
--					to_slv (to_sfixed (to_slv (voffsetRef_sf (fracas'high downto fracas'low)), fracas))&
--					to_slv (to_sfixed (to_slv (voffsetRef_sf (fracbs'high downto fracbs'low)), fracbs));
fixed2floatce_internal <= '1';
fixed2floatond_internal <= '1';
fixed2floata_internal <=
voffsetRef (15) & voffsetRef (15) & 
voffsetRef (15) & voffsetRef (15) & 
voffsetRef (15) & voffsetRef (15) & 
voffsetRef (15) & voffsetRef (15) & 
voffsetRef (15) & voffsetRef (15) & 
voffsetRef (15) & voffsetRef (15) & 
voffsetRef (15) & voffsetRef (15) & 
voffsetRef (15) & voffsetRef (15) & 
voffsetRef (15) & voffsetRef (15) & 
voffsetRef (15) & voffsetRef & "00000000000000000000000000000";
				when pow4 =>
					if (fixed2floatrdy_internal = '1') then state := pow5;
						vOffsetAverage := fixed2floatr_internal;
						--report "vOffsetAverage : " & real'image (ap_slv2fp (vOffsetAverage));
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
	--report "====================";
	vOffset_ft := (others => '0');
	write_enable <= '0';
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+0, 12)); -- offset LSB 0
	addra <= std_logic_vector (to_unsigned (col+C_ROW, 10)); -- OCCColumnJ
when s1 => state := s2;	--2
	i2c_mem_addra <= (others => '0');
	addra <= (others => '0');
when s2 => state := s3;	--2
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- offset MSB 1
	addra <= std_logic_vector (to_unsigned (row, 10)); -- OCCrowI
	vOCCColumnJ := doa;
	--report "vOCCColumnJ : " & real'image (ap_slv2fp (vOCCColumnJ));
	vOffset (15 downto 8) := i2c_mem_douta;
when s3 => state := s4; 	--3
	i2c_mem_addra <= (others => '0');
	addra <= (others => '0');
when s4 => state := s5; 	--3
	vOCCRowI := doa;
	--report "vOCCRowI : " & real'image (ap_slv2fp (vOCCRowI));
	vOffset (7 downto 0) := i2c_mem_douta;
	--report_error (vOffset, 0.0);
	nibble3 <= vOffset (15 downto 10);
when s5 => state := s6; 	--5
	mulfpce_internal <= '1';
	mulfpa_internal <= out_nibble3;
	mulfpb_internal <= voccRemScale;
	mulfpond_internal <= '1';
	--report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
	--report "voccRemScale : " & real'image (ap_slv2fp (voccRemScale));
when s6 => 			--6
	if (mulfprdy_internal = '1') then state := s7;
		vOffset_ft := mulfpr_internal;
		mulfpce_internal <= '0';
		mulfpond_internal <= '0';
		mulfpsclr_internal <= '1';
	else state := s6; end if;
when s7 => state := s8; 	--7
	mulfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= vOCCColumnJ;
	mulfpb_internal <= voccColumnScale;
	mulfpond_internal <= '1';
	--report "vOCCColumnJ : " & real'image (ap_slv2fp (vOCCColumnJ));
	--report "voccColumnScale : " & real'image (ap_slv2fp (voccColumnScale));
when s8 => 			--8
	if (mulfprdy_internal = '1') then state := s9;
		vOCCColumnJ := mulfpr_internal;
		mulfpce_internal <= '0';
		mulfpond_internal <= '0';
		mulfpsclr_internal <= '1';
	else state := s8; end if;
when s9 => state := s10; 	--9
	mulfpsclr_internal <= '0';
when s10 => state := s11; 	--10
	mulfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= vOCCRowI;
	mulfpb_internal <= voccRowScale;
	mulfpond_internal <= '1';
	--report "vOCCRowI : " & real'image (ap_slv2fp (vOCCRowI));
	--report "voccRowScale : " & real'image (ap_slv2fp (voccRowScale));
when s11 => 			--11
	if (mulfprdy_internal = '1') then state := s12;
		vOCCRowI := mulfpr_internal;
		mulfpce_internal <= '0';
		mulfpond_internal <= '0';
		mulfpsclr_internal <= '1';
	else state := s11; end if;
when s12 => state := s13; 	--12
	mulfpsclr_internal <= '0';
when s13 => state := s14; 	--13
	addfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= vOffset_ft;
	addfpb_internal <= vOCCColumnJ;
	addfpond_internal <= '1';
	--report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
	--report "vOCCColumnJ : " & real'image (ap_slv2fp (vOCCColumnJ));
when s14 => 			--14
	if (addfprdy_internal = '1') then state := s15;
		vOffset_ft := addfpr_internal;
		addfpce_internal <= '0';
		addfpond_internal <= '0';
		addfpsclr_internal <= '1';
	else state := s14; end if;
when s15 => state := s16; 	--15
	addfpsclr_internal <= '0';
when s16 => state := s17; 	--16
	addfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= vOffset_ft;
	addfpb_internal <= vOCCRowI;
	addfpond_internal <= '1';
	--report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
	--report "vOCCRowI : " & real'image (ap_slv2fp (vOCCRowI));
when s17 => 			--17
	if (addfprdy_internal = '1') then state := s18;
		vOffset_ft := addfpr_internal;
		addfpce_internal <= '0';
		addfpond_internal <= '0';
		addfpsclr_internal <= '1';
	else state := s17; end if;
when s18 => state := s19; 	--18
	addfpsclr_internal <= '0';
when s19 => state := s20; 	--19
	addfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= vOffset_ft;
	addfpb_internal <= vOffsetAverage;
	addfpond_internal <= '1';
	--report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
	--report "vOffsetAverage : " & real'image (ap_slv2fp (vOffsetAverage));
when s20 => 			--20
	if (addfprdy_internal = '1') then state := s21;
		vOffset_ft := addfpr_internal;
		addfpce_internal <= '0';
		addfpond_internal <= '0';
		addfpsclr_internal <= '1';
	else state := s20; end if;
when s21 => state := s22; 	--21
	addfpsclr_internal <= '0';
when s22 => state := s23; 	--22
	write_enable <= '1';
	addra <= std_logic_vector (to_unsigned (C_ROW+C_COL+i, 10)); -- vOffset_ft
	dia <= vOffset_ft;
	--report "================vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
	i := i + 1;
when s23 =>
	if (col = C_COL-1) then
		col := 0;
		state := s24;
	else
		col := col + 1;
		state := s0;
	end if;
when s24 =>
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

inst_mem_occ : mem_ramb16_s36_x2
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
with nibble1 select out_nibble1 <= -- x - occremscale,occrowscale,occcolscale unsigned 4bit
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

with nibble3 select out_nibble3 <= -- >31,-64 - offset raw
x"40e00000" when "000111",x"40c00000" when "000110",x"40a00000" when "000101",x"40800000" when "000100",x"40400000" when "000011",x"40000000" when "000010",x"3f800000" when "000001",x"00000000" when "000000",
x"41700000" when "001111",x"41600000" when "001110",x"41500000" when "001101",x"41400000" when "001100",x"41300000" when "001011",x"41200000" when "001010",x"41100000" when "001001",x"41000000" when "001000",
x"41b80000" when "010111",x"41b00000" when "010110",x"41a80000" when "010101",x"41a00000" when "010100",x"41980000" when "010011",x"41900000" when "010010",x"41880000" when "010001",x"41800000" when "010000",
x"41f80000" when "011111",x"41f00000" when "011110",x"41e80000" when "011101",x"41e00000" when "011100",x"41d80000" when "011011",x"41d00000" when "011010",x"41c80000" when "011001",x"41c00000" when "011000",
x"c1c80000" when "100111",x"c1d00000" when "100110",x"c1d80000" when "100101",x"c1e00000" when "100100",x"c1e80000" when "100011",x"c1f00000" when "100010",x"c1f80000" when "100001",x"c2000000" when "100000",
x"c1880000" when "101111",x"c1900000" when "101110",x"c1980000" when "101101",x"c1a00000" when "101100",x"c1a80000" when "101011",x"c1b00000" when "101010",x"c1b80000" when "101001",x"c1c00000" when "101000",
x"c1100000" when "110111",x"c1200000" when "110110",x"c1300000" when "110101",x"c1400000" when "110100",x"c1500000" when "110011",x"c1600000" when "110010",x"c1700000" when "110001",x"c1800000" when "110000",
x"bf800000" when "111111",x"c0000000" when "111110",x"c0400000" when "111101",x"c0800000" when "111100",x"c0a00000" when "111011",x"c0c00000" when "111010",x"c0e00000" when "111001",x"c1000000" when "111000",
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

