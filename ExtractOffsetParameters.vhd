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

o_done : out std_logic;
o_rdy : out std_logic
);
end ExtractOffsetParameters;

architecture Behavioral of ExtractOffsetParameters is

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatclk : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;

COMPONENT mulfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfpclk : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : STD_LOGIC;

COMPONENT addfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfpclk : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : STD_LOGIC;

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

signal ena_mux1 : std_logic;

-- xxx nibbles must out in next clock xyxle
signal nibble1,nibble2,nibble4 : std_logic_vector (3 downto 0);
signal nibble3 : std_logic_vector (5 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;

signal rdy : std_logic;

signal stemp1 : std_logic_vector (15 downto 0);

constant C_COL : integer := 32;
constant C_ROW : integer := 24;

begin

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
	occ0a,occ1a,occ2a,occ3a,occ4a,
occ5a,occ6a,occ7a,occ8a,occ9a,
occ10a,occ11a,occ12a,occ13a,occ14a,
occ15a,occ16a,occ17a,occ18a,occ19a,
occ20a,occ21a,occ22a,occ23a,occ24a,
occ25a,occ26a,occ27a,occ28a,occ29a,
occ30a,occ31a,occ32a,occ33a,occ34a,
occ35a,occ36a,occ37a,occ38a,occ39a,
occ40a,occ41a,occ42a,occ43a,occ44a,
occ45a,occ46a,occ47a,occ48a,occ49a,
occ50a,occ51a,occ52a,occ53a,occ54a,
occ55a,occ56a,occ57a,occ58a,occ59a,
occ60a,occ61a,occ62a,occ63a,occ64a,
occ65a,occ66a,occ67a,occ68a,occ69a,
occ70a,occ71a,occ72a,occ73a,occ74a,
occ75a,occ76a,occ77a,occ78a,occ79a,
occ80a,occ81a,occ82a,occ83a,occ84a,
occ85a,occ86a,occ87a,occ88a,occ89a,
occ90a,occ91a,occ92a,occ93a,occ94a,
occ95a,occ96a,occ97a,occ98a,occ99a,
occ100a,occ101a,occ102a,occ103a,occ104a,
occ105a,occ106a,occ107a,occ108a,occ109a,
occ110a,occ111a,occ112a,occ113a,occ114a,
occ115a,occ116a,occ117a,occ118a,occ119a,
occ120a,occ121a,occ122a,occ123a,occ124a,
	pow0,pow1,pow2,pow3,pow4,pow5,pow6,
	a1,b1,c1,d1,occ9b,occ10b,
	a2,b2,c2,d2,
	a3,b3,c3,d3,
	a4,b4,c4,d4,
	a5,b5,c5,d5,
	a6,b6,c6,d6,
	a7,b7,c7,d7,
	a8,b8,c8,d8,
	ab1,ab2,ab3,ab4,ab5,ab6,ab7,ab8,
	ab9,ab10,ab11,ab12,ab13,ab14,ab15,ab16,
	ab17,ab18,ab19,ab20,ab21,ab22,ab23,ab24,
	calculate,calculate0,
	calculate00,calculate01,calculate02,calculate03,
	calculate04,calculate05,calculate06,calculate07,
	calculate1,calculate2,calculate3,calculate4,calculate5,
	calculate6,calculate7,calculate8,calculate9,calculate10,
	calculate11,calculate12,calculate13,calculate14,calculate15,
	calculate16,calculate17,calculate18,calculate19,calculate20,
	s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,
	ending0,ending1,ending2,ending,s1a,s2a);
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
			ena_mux1 <= '0';
			rdy <= '0';
			addfpsclr <= '1';
			mulfpsclr <= '1';
			fixed2floatsclr <= '1';
			mulfpa <= (others => '0');
			mulfpb <= (others => '0');
			addfpa <= (others => '0');
			addfpb <= (others => '0');
			addfpond <= '0';
			mulfpond <= '0';
			addfpce <= '0';
			mulfpce <= '0';
			addra <= (others => '0');
			dia <= (others => '0');
			o_done <= '0';
			i2c_mem_ena <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := occ0;
						i2c_mem_ena <= '1';
						write_enable <= '1';
						ena_mux1 <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
						write_enable <= '0';
						ena_mux1 <= '0';
					end if;
				when occ0 => state := occ1;
					addfpsclr <= '0';
					mulfpsclr <= '0';
					fixed2floatsclr <= '0';
					rdy <= '0';
					
				when occ1 => state := occ2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+0, 12)); -- 2410 LSB
				when occ2 => state := occ2a;
				when occ2a => state := occ3;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+1, 12)); -- 2410 MSB
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ3 => state := occ3a;
				when occ3a => state := occ4;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
				when occ4 => state := occ5;
					nibble1 <= temp1 (3 downto 0); -- occ scale remnant
				when occ5 => state := occ6;
				
					voccRemScale := out_nibble1; -- out occ scale remnant signed
					voccRemScale1 := temp1 (3 downto 0); -- occ scale remnant for 2^x
					
					nibble1 <= temp1 (7 downto 4); -- occ scale column
				when occ6 => state := occ7;
				
					voccColumnScale := out_nibble1; -- out occ scale column signed
					voccColumnScale1 := temp1 (7 downto 4); -- occ scale column for 2^x

					nibble1 <= temp1 (11 downto 8); -- occ scale row
				when occ7 => state := occ8;
					
					voccRowScale := out_nibble1; -- out occ row column signed
					voccRowScale1 := temp1 (11 downto 8); -- occ scale row for 2^x

				when occ8 => state := occ9a;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+2, 12)); -- 2411 LSB
				when occ9a => state := occ9;
				when occ9 => state := occ10a;
					voffsetRef (15 downto 8) := i2c_mem_douta; -- offsetref LSB
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+3, 12)); -- 2411 MSB
				when occ10a => state := occ10;
				when occ10 => state := occ11;
					voffsetRef (7 downto 0) := i2c_mem_douta; -- offsetref MSB
					----report_error (voffsetRef, 0.0);
				
					
				when occ11 => state := occ12;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+4, 12)); -- 2412 LSB -- occrow1-4
				when occ12 => state := occ13a;
				when occ13a => state := occ13;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+5, 12)); -- 2412 MSB -- occrow1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ13 => state := occ14a;
				when occ14a => state := occ14;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ14 => state := occ15;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (0, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ15 => state := occ16;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (1, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ16 => state := occ17;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (2, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ17 => state := occ19;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (3, 10));




				when occ19 => state := occ20;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+6, 12)); -- 2413 LSB -- occrow5-8
				when occ20 => state := occ20a;
				when occ20a => state := occ21;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+7, 12)); -- 2413 MSB -- occrow5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ21 => state := occ22a;
				when occ22a => state := occ22;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ22 => state := occ23;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (4, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ23 => state := occ24;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (5, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ24 => state := occ25;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (6, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ25 => state := occ27;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (7, 10));


				when occ27 => state := occ28;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+8, 12)); -- 2414 LSB -- occrow9-12
				when occ28 => state := occ28a;
				when occ28a => state := occ29;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+9, 12)); -- 2414 MSB -- occrow9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ29 => state := occ29a;
				when occ29a => state := occ30;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ30 => state := occ31;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (8, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ31 => state := occ32;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (9, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ32 => state := occ33;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (10, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ33 => state := occ35;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (11, 10));



				when occ35 => state := occ36;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+10, 12)); -- 2415 LSB -- occrow13-16
				when occ36 => state := occ36a;
				when occ36a => state := occ37;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+11, 12)); -- 2415 MSB -- occrow13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ37 => state := occ37a;
				when occ37a => state := occ38;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ38 => state := occ39;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (12, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ39 => state := occ40;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (13, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ40 => state := occ41;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (14, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ41 => state := occ43;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (15, 10));



				when occ43 => state := occ44;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+12, 12)); -- 2416 LSB -- occrow17-20
				when occ44 => state := occ44a;
				when occ44a => state := occ45;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+13, 12)); -- 2416 MSB -- occrow17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ45 => state := occ45a;
				when occ45a => state := occ46;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ46 => state := occ47;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (32, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ47 => state := occ48;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (17, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ48 => state := occ49;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (18, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ49 => state := occ51;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (19, 10));


				when occ51 => state := occ52;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+14, 12)); -- 2417 LSB -- occrow21-24
				when occ52 => state := occ52a;
				when occ52a => state := occ53;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+15, 12)); -- 2417 MSB -- occrow21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ53 => state := occ53a;
				when occ53a => state := occ54;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occrowA
				when occ54 => state := occ55;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (20, 10));
					nibble2 <= temp1 (7 downto 4); -- occrowB
				when occ55 => state := occ56;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (21, 10));
					nibble2 <= temp1 (11 downto 8); -- occrowC
				when occ56 => state := occ57;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (22, 10));
					nibble2 <= temp1 (15 downto 12); -- occrowD
				when occ57 => state := occ59;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (23, 10));


				when occ59 => state := occ60;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+16, 12)); -- 2418 LSB -- occcol1-4
				when occ60 => state := occ60a;
				when occ60a => state := occ61;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+17, 12)); -- 2418 MSB -- occcol1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ61 => state := occ61a;
				when occ61a => state := occ62;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ62 => state := occ63;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (24, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ63 => state := occ64;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (25, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ64 => state := occ65;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (26, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ65 => state := occ67;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (27, 10));


				when occ67 => state := occ68;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+18, 12)); -- 2419 LSB -- occcol5-8
				when occ68 => state := occ68a;
				when occ68a => state := occ69;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+19, 12)); -- 2419 MSB -- occcol5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ69 => state := occ69a;
				when occ69a => state := occ70;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ70 => state := occ71;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (28, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ71 => state := occ72;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (29, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ72 => state := occ73;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (30, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ73 => state := occ75;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (31, 10));


				when occ75 => state := occ76;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+20, 12)); -- 241a LSB -- occcol9-12
				when occ76 => state := occ76a;
				when occ76a => state := occ77;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+21, 12)); -- 241a MSB -- occcol9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ77 => state := occ77a;
				when occ77a => state := occ78;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ78 => state := occ79;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (32, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ79 => state := occ80;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (33, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ80 => state := occ81;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (34, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ81 => state := occ83;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (35, 10));


				when occ83 => state := occ84;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+22, 12)); -- 241b LSB -- occcol13-16
				when occ84 => state := occ84a;
				when occ84a => state := occ85;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+23, 12)); -- 241b MSB -- occcol13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ85 => state := occ85a;
				when occ85a => state := occ86;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ86 => state := occ87;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (36, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ87 => state := occ88;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (37, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ88 => state := occ89;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (38, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ89 => state := occ91;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (39, 10));


				when occ91 => state := occ92;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+24, 12)); -- 241c LSB -- occcol17-20
				when occ92 => state := occ92a;
				when occ92a => state := occ93;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+25, 12)); -- 241c MSB -- occcol17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ93 => state := occ93a;
				when occ93a => state := occ94;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ94 => state := occ95;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (40, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ95 => state := occ96;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (41, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ96 => state := occ97;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (42, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ97 => state := occ99;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (43, 10));



				when occ99 => state := occ100;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+26, 12)); -- 241d LSB -- occcol21-24
				when occ100 => state := occ100a;
				when occ100a => state := occ101;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+27, 12)); -- 241d MSB -- occcol21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ101 => state := occ101a;
				when occ101a => state := occ102;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ102 => state := occ103;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (44, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ103 => state := occ104;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (45, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ104 => state := occ105;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (46, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ105 => state := occ107;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (47, 10));



				when occ107 => state := occ108;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+28, 12)); -- 241e LSB -- occcol25-28
				when occ108 => state := occ108a;
				when occ108a => state := occ109;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+29, 12)); -- 241e MSB -- occcol25-28
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ109 => state := occ109a;
				when occ109a => state := occ110;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ110 => state := occ111;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (48, 10));
					nibble2 <= temp1 (7 downto 4); -- occcolB
				when occ111 => state := occ112;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (49, 10));
					nibble2 <= temp1 (11 downto 8); -- occcolC
				when occ112 => state := occ113;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (50, 10));
					nibble2 <= temp1 (15 downto 12); -- occcolD
				when occ113 => state := occ115;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (51, 10));



				when occ115 => state := occ116;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+30, 12)); -- 241f LSB -- occcol29-32
				when occ116 => state := occ116a;
				when occ116a => state := occ117;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+31, 12)); -- 241f MSB -- occcol29-32
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ117 => state := occ117a;
				when occ117a => state := occ118;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- occcolA
				when occ118 => state := occ119;
					nibble2 <= temp1 (7 downto 4); -- occcolB
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (52, 10));
				when occ119 => state := occ120;
					nibble2 <= temp1 (11 downto 8); -- occcolC
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (53, 10));
				when occ120 => state := occ121;
					nibble2 <= temp1 (15 downto 12); -- occcolD
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (54, 10));
				when occ121 => state := occ122;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (55, 10));
				when occ122 => state := pow0;
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
					voffsetRef_sf := resize (to_sfixed (voffsetRef, eeprom16sf), voffsetRef_sf);
					----report_error (voffsetRef, 0.0);
					fixed2floatce <= '1';
					fixed2floatond <= '1';
					fixed2floata <= 
					to_slv (to_sfixed (to_slv (voffsetRef_sf (fracas'high downto fracas'low)), fracas))&
					to_slv (to_sfixed (to_slv (voffsetRef_sf (fracbs'high downto fracbs'low)), fracbs));
				when pow4 =>
					if (fixed2floatrdy = '1') then state := pow5;
						vOffsetAverage := fixed2floatr;
						--report "vOffsetAverage : " & real'image (ap_slv2fp (vOffsetAverage));
						fixed2floatce <= '0';
						fixed2floatond <= '0';
						fixed2floatsclr <= '1';
					else state := pow4; end if;
				when pow5 => state := s0;
					fixed2floatsclr <= '0';
	row := 0;
	col := 0;
	i := 0;
when s0 => state := s1; 	--1
	--report "====================";
	vOffset_ft := (others => '0');
	write_enable <= '0';
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i), 12)); -- offset LSB 0
	addra <= std_logic_vector (to_unsigned (col+C_ROW, 10)); -- OCCColumnJ
when s1 => state := s1a;	--2
	i2c_mem_addra <= (others => '0');
	addra <= (others => '0');
when s1a => state := s2;	--2
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- offset MSB 1
	addra <= std_logic_vector (to_unsigned (row, 10)); -- OCCrowI
	vOCCColumnJ := doa;
	--report "vOCCColumnJ : " & real'image (ap_slv2fp (vOCCColumnJ));
	vOffset (15 downto 8) := i2c_mem_douta;
when s2 => state := s2a; 	--3
	i2c_mem_addra <= (others => '0');
	addra <= (others => '0');
when s2a => state := s4; 	--3
	vOCCRowI := doa;
	--report "vOCCRowI : " & real'image (ap_slv2fp (vOCCRowI));
	vOffset (7 downto 0) := i2c_mem_douta;
	--report_error (vOffset, 0.0);
	nibble3 <= vOffset (15 downto 10);
when s4 => state := s5; 	--5
	mulfpce <= '1';
	mulfpa <= out_nibble3;
	mulfpb <= voccRemScale;
	mulfpond <= '1';
	--report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
	--report "voccRemScale : " & real'image (ap_slv2fp (voccRemScale));
when s5 => 			--6
	if (mulfprdy = '1') then state := s6;
		vOffset_ft := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := s5; end if;
when s6 => state := s7; 	--7
	mulfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= vOCCColumnJ;
	mulfpb <= voccColumnScale;
	mulfpond <= '1';
	--report "vOCCColumnJ : " & real'image (ap_slv2fp (vOCCColumnJ));
	--report "voccColumnScale : " & real'image (ap_slv2fp (voccColumnScale));
when s7 => 			--8
	if (mulfprdy = '1') then state := s8;
		vOCCColumnJ := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := s7; end if;
when s8 => state := s9; 	--9
	mulfpsclr <= '0';
when s9 => state := s10; 	--10
	mulfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= vOCCRowI;
	mulfpb <= voccRowScale;
	mulfpond <= '1';
	--report "vOCCRowI : " & real'image (ap_slv2fp (vOCCRowI));
	--report "voccRowScale : " & real'image (ap_slv2fp (voccRowScale));
when s10 => 			--11
	if (mulfprdy = '1') then state := s11;
		vOCCRowI := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := s10; end if;
when s11 => state := s12; 	--12
	mulfpsclr <= '0';
when s12 => state := s13; 	--13
	addfpsclr <= '0';
	addfpce <= '1';
	addfpa <= vOffset_ft;
	addfpb <= vOCCColumnJ;
	addfpond <= '1';
	--report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
	--report "vOCCColumnJ : " & real'image (ap_slv2fp (vOCCColumnJ));
when s13 => 			--14
	if (addfprdy = '1') then state := s14;
		vOffset_ft := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := s13; end if;
when s14 => state := s15; 	--15
	addfpsclr <= '0';
when s15 => state := s16; 	--16
	addfpsclr <= '0';
	addfpce <= '1';
	addfpa <= vOffset_ft;
	addfpb <= vOCCRowI;
	addfpond <= '1';
	--report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
	--report "vOCCRowI : " & real'image (ap_slv2fp (vOCCRowI));
when s16 => 			--17
	if (addfprdy = '1') then state := s17;
		vOffset_ft := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := s16; end if;
when s17 => state := s18; 	--18
	addfpsclr <= '0';
when s18 => state := s19; 	--19
	addfpsclr <= '0';
	addfpce <= '1';
	addfpa <= vOffset_ft;
	addfpb <= vOffsetAverage;
	addfpond <= '1';
	--report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
	--report "vOffsetAverage : " & real'image (ap_slv2fp (vOffsetAverage));
when s19 => 			--20
	if (addfprdy = '1') then state := s20;
		vOffset_ft := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := s19; end if;
when s20 => state := s21; 	--21
	addfpsclr <= '0';
when s21 => state := s22; 	--22
	write_enable <= '1';
	addra <= std_logic_vector (to_unsigned (C_ROW+C_COL+i, 10)); -- vOffset_ft
	dia <= vOffset_ft;
	--report "================vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
	i := i + 1;
when s22 =>
	if (col = C_COL-1) then
		col := 0;
		state := s23;
	else
		col := col + 1;
		state := s0;
	end if;
when s23 =>
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

mulfpclk <= i_clock;
inst_mulfp_acc : mulfp
PORT MAP (
a => mulfpa,
b => mulfpb,
operation_nd => mulfpond,
clk => mulfpclk,
sclr => mulfpsclr,
ce => mulfpce,
result => mulfpr,
rdy => mulfprdy
);

addfpclk <= i_clock;
inst_addfp_acc : addfp
PORT MAP (
a => addfpa,
b => addfpb,
operation_nd => addfpond,
clk => addfpclk,
sclr => addfpsclr,
ce => addfpce,
result => addfpr,
rdy => addfprdy
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

fixed2floatclk <= i_clock;
inst_ff2 : fixed2float
PORT MAP (
a => fixed2floata,
operation_nd => fixed2floatond,
clk => fixed2floatclk,
sclr => fixed2floatsclr,
ce => fixed2floatce,
result => fixed2floatr,
rdy => fixed2floatrdy
);

end Behavioral;

