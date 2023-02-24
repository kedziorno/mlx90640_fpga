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
o_rdy : out std_logic
);
end ExtractAlphaParameters;

architecture Behavioral of ExtractAlphaParameters is

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

COMPONENT divfp
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

signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfpclk : STD_LOGIC;
signal divfpsclr : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : STD_LOGIC;

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
signal nibble1,nibble2,nibble5,nibble4 : std_logic_vector (3 downto 0);
signal nibble3 : std_logic_vector (5 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4,out_nibble5 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;

signal rdy : std_logic;

signal stemp1 : std_logic_vector (15 downto 0);

constant C_COL : integer := 32;
constant C_ROW : integer := 24;

begin

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
	acc0a,acc1a,acc2a,acc3a,acc4a,
acc5a,acc6a,acc7a,acc8a,acc9a,
acc10a,acc11a,acc12a,acc13a,acc14a,
acc15a,acc16a,acc17a,acc18a,acc19a,
acc20a,acc21a,acc22a,acc23a,acc24a,
acc25a,acc26a,acc27a,acc28a,acc29a,
acc30a,acc31a,acc32a,acc33a,acc34a,
acc35a,acc36a,acc37a,acc38a,acc39a,
acc40a,acc41a,acc42a,acc43a,acc44a,
acc45a,acc46a,acc47a,acc48a,acc49a,
acc50a,acc51a,acc52a,acc53a,acc54a,
acc55a,acc56a,acc57a,acc58a,acc59a,
acc60a,acc61a,acc62a,acc63a,acc64a,
acc65a,acc66a,acc67a,acc68a,acc69a,
acc70a,acc71a,acc72a,acc73a,acc74a,
acc75a,acc76a,acc77a,acc78a,acc79a,
acc80a,acc81a,acc82a,acc83a,acc84a,
acc85a,acc86a,acc87a,acc88a,acc89a,
acc90a,acc91a,acc92a,acc93a,acc94a,
acc95a,acc96a,acc97a,acc98a,acc99a,
acc100a,acc101a,acc102a,acc103a,acc104a,
acc105a,acc106a,acc107a,acc108a,acc109a,
acc110a,acc111a,acc112a,acc113a,acc114a,
acc115a,acc116a,acc117a,acc118a,acc119a,
acc120a,acc121a,acc122a,acc123a,acc124a,
	pow0,pow1,pow2,pow3,pow4,pow5,pow6,
	a1,b1,c1,d1,acc9b,acc10b,
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
	s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,
	ending0,ending1,ending2,ending,s1a,s2a);
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

	variable fracas : fracas;
	variable fracbs : fracbs;
	variable fracau : fracau;
	variable fracbu : fracbu;
	variable vAlphaPixel_sf,valphaRef_sf : st_sfixed_max;
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
			divfpsclr <= '1';
			fixed2floatsclr <= '1';
			mulfpa <= (others => '0');
			mulfpb <= (others => '0');
			addfpa <= (others => '0');
			addfpb <= (others => '0');
			divfpa <= (others => '0');
			divfpb <= (others => '0');
			addfpond <= '0';
			mulfpond <= '0';
			divfpond <= '0';
			addfpce <= '0';
			mulfpce <= '0';
			divfpce <= '0';
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
						ena_mux1 <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
						write_enable <= '0';
						ena_mux1 <= '0';
					end if;
				when acc0 => state := acc1;
					addfpsclr <= '0';
					mulfpsclr <= '0';
					divfpsclr <= '0';
					fixed2floatsclr <= '0';
					rdy <= '0';
					
				when acc1 => state := acc2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+0, 12)); -- 2420 LSB
				when acc2 => state := acc2a;
				when acc2a => state := acc3;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+1, 12)); -- 2420 MSB
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc3 => state := acc3a;
				when acc3a => state := acc4;
					temp1 (7 downto 0) := i2c_mem_douta;
					--------report_error (temp1, 0.0);
				when acc4 => state := acc5;
					nibble1 <= temp1 (3 downto 0); -- acc scale remnant
				when acc5 => state := acc6;
				
					vaccRemScale := out_nibble1; -- out acc scale remnant signed
					vaccRemScale1 := temp1 (3 downto 0); -- acc scale remnant for 2^x
					
					nibble1 <= temp1 (7 downto 4); -- acc scale column
				when acc6 => state := acc7;
				
					vaccColumnScale := out_nibble1; -- out acc scale column signed
					vaccColumnScale1 := temp1 (7 downto 4); -- acc scale column for 2^x

					nibble1 <= temp1 (11 downto 8); -- acc scale row
					nibble5 <= temp1 (15 downto 12); -- alpha scale
				when acc7 => state := acc8;

					vaccRowScale := out_nibble1; -- out acc row column signed
					vaccRowScale1 := temp1 (11 downto 8); -- acc scale row for 2^x
--					vAlphaScale := out_nibble5;

				when acc8 => state := acc9a;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+2, 12)); -- 2421 LSB
				when acc9a => state := acc9;
				when acc9 => state := acc10a;
					valphaRef (15 downto 8) := i2c_mem_douta; -- alpharef LSB
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+3, 12)); -- 2422 MSB
				when acc10a => state := acc10;
				when acc10 => state := acc11;
					valphaRef (7 downto 0) := i2c_mem_douta; -- alpharef MSB
					----report_error (valphaRef, 0.0);
				
					
				when acc11 => state := acc12;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+4, 12)); -- 2422 LSB -- accrow1-4
				when acc12 => state := acc13a;
				when acc13a => state := acc13;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+5, 12)); -- 2422 MSB -- accrow1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc13 => state := acc14a;
				when acc14a => state := acc14;
					temp1 (7 downto 0) := i2c_mem_douta;
					--------report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc14 => state := acc15;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (0, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc15 => state := acc16;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (1, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc16 => state := acc17;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (2, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc17 => state := acc19;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (3, 10));




				when acc19 => state := acc20;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+6, 12)); -- 2423 LSB -- accrow5-8
				when acc20 => state := acc20a;
				when acc20a => state := acc21;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+7, 12)); -- 2423 MSB -- accrow5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc21 => state := acc22a;
				when acc22a => state := acc22;
					temp1 (7 downto 0) := i2c_mem_douta;
					--------report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc22 => state := acc23;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (4, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc23 => state := acc24;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (5, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc24 => state := acc25;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (6, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc25 => state := acc27;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (7, 10));


				when acc27 => state := acc28;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+8, 12)); -- 2424 LSB -- accrow9-12
				when acc28 => state := acc28a;
				when acc28a => state := acc29;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+9, 12)); -- 2424 MSB -- accrow9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc29 => state := acc29a;
				when acc29a => state := acc30;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc30 => state := acc31;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (8, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc31 => state := acc32;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (9, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc32 => state := acc33;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (10, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc33 => state := acc35;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (11, 10));



				when acc35 => state := acc36;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+10, 12)); -- 2425 LSB -- accrow13-16
				when acc36 => state := acc36a;
				when acc36a => state := acc37;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+11, 12)); -- 2425 MSB -- accrow13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc37 => state := acc37a;
				when acc37a => state := acc38;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc38 => state := acc39;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (12, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc39 => state := acc40;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (13, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc40 => state := acc41;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (14, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc41 => state := acc43;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (15, 10));



				when acc43 => state := acc44;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+12, 12)); -- 2426 LSB -- accrow17-20
				when acc44 => state := acc44a;
				when acc44a => state := acc45;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+13, 12)); -- 2426 MSB -- accrow17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc45 => state := acc45a;
				when acc45a => state := acc46;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc46 => state := acc47;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (32, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc47 => state := acc48;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (17, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc48 => state := acc49;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (18, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc49 => state := acc51;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (19, 10));


				when acc51 => state := acc52;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+14, 12)); -- 2427 LSB -- accrow21-24
				when acc52 => state := acc52a;
				when acc52a => state := acc53;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+15, 12)); -- 2427 MSB -- accrow21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc53 => state := acc53a;
				when acc53a => state := acc54;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- accrowA
				when acc54 => state := acc55;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (20, 10));
					nibble2 <= temp1 (7 downto 4); -- accrowB
				when acc55 => state := acc56;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (21, 10));
					nibble2 <= temp1 (11 downto 8); -- accrowC
				when acc56 => state := acc57;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (22, 10));
					nibble2 <= temp1 (15 downto 12); -- accrowD
				when acc57 => state := acc59;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (23, 10));


				when acc59 => state := acc60;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+16, 12)); -- 2428 LSB -- acccol1-4
				when acc60 => state := acc60a;
				when acc60a => state := acc61;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+17, 12)); -- 2428 MSB -- acccol1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc61 => state := acc61a;
				when acc61a => state := acc62;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc62 => state := acc63;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (24, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc63 => state := acc64;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (25, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc64 => state := acc65;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (26, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc65 => state := acc67;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (27, 10));


				when acc67 => state := acc68;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+18, 12)); -- 2429 LSB -- acccol5-8
				when acc68 => state := acc68a;
				when acc68a => state := acc69;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+19, 12)); -- 2429 MSB -- acccol5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc69 => state := acc69a;
				when acc69a => state := acc70;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc70 => state := acc71;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (28, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc71 => state := acc72;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (29, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc72 => state := acc73;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (30, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc73 => state := acc75;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (31, 10));


				when acc75 => state := acc76;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+20, 12)); -- 242a LSB -- acccol9-12
				when acc76 => state := acc76a;
				when acc76a => state := acc77;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+21, 12)); -- 242a MSB -- acccol9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc77 => state := acc77a;
				when acc77a => state := acc78;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc78 => state := acc79;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (32, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc79 => state := acc80;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (33, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc80 => state := acc81;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (34, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc81 => state := acc83;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (35, 10));


				when acc83 => state := acc84;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+22, 12)); -- 242b LSB -- acccol13-16
				when acc84 => state := acc84a;
				when acc84a => state := acc85;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+23, 12)); -- 242b MSB -- acccol13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc85 => state := acc85a;
				when acc85a => state := acc86;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc86 => state := acc87;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (36, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc87 => state := acc88;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (37, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc88 => state := acc89;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (38, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc89 => state := acc91;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (39, 10));


				when acc91 => state := acc92;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+24, 12)); -- 242c LSB -- acccol17-20
				when acc92 => state := acc92a;
				when acc92a => state := acc93;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+25, 12)); -- 242c MSB -- acccol17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc93 => state := acc93a;
				when acc93a => state := acc94;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc94 => state := acc95;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (40, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc95 => state := acc96;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (41, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc96 => state := acc97;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (42, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc97 => state := acc99;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (43, 10));



				when acc99 => state := acc100;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+26, 12)); -- 242d LSB -- acccol21-24
				when acc100 => state := acc100a;
				when acc100a => state := acc101;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+27, 12)); -- 242d MSB -- acccol21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc101 => state := acc101a;
				when acc101a => state := acc102;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc102 => state := acc103;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (44, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc103 => state := acc104;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (45, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc104 => state := acc105;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (46, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc105 => state := acc107;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (47, 10));



				when acc107 => state := acc108;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+28, 12)); -- 242e LSB -- acccol25-28
				when acc108 => state := acc108a;
				when acc108a => state := acc109;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+29, 12)); -- 242e MSB -- acccol25-28
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc109 => state := acc109a;
				when acc109a => state := acc110;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc110 => state := acc111;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (48, 10));
					nibble2 <= temp1 (7 downto 4); -- acccolB
				when acc111 => state := acc112;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (49, 10));
					nibble2 <= temp1 (11 downto 8); -- acccolC
				when acc112 => state := acc113;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (50, 10));
					nibble2 <= temp1 (15 downto 12); -- acccolD
				when acc113 => state := acc115;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (51, 10));



				when acc115 => state := acc116;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+30, 12)); -- 242f LSB -- acccol29-32
				when acc116 => state := acc116a;
				when acc116a => state := acc117;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+31, 12)); -- 242f MSB -- acccol29-32
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc117 => state := acc117a;
				when acc117a => state := acc118;
					temp1 (7 downto 0) := i2c_mem_douta;
					--------report_error (temp1, 0.0);
					nibble2 <= temp1 (3 downto 0); -- acccolA
				when acc118 => state := acc119;
					nibble2 <= temp1 (7 downto 4); -- acccolB
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (52, 10));
				when acc119 => state := acc120;
					nibble2 <= temp1 (11 downto 8); -- acccolC
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (53, 10));
				when acc120 => state := acc121;
					nibble2 <= temp1 (15 downto 12); -- acccolD
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (54, 10));
				when acc121 => state := acc122;
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (55, 10));
				when acc122 => state := pow0;
					write_enable <= '0';


				when pow0 => state := pow1;
					addra <= (others => '0');
					nibble4 <= vaccRemScale1;
				when pow1 => state := pow2;
					nibble4 <= vaccColumnScale1;
					vaccRemScale := out_nibble4; -- 2^accscaleremnant
					--report "vaccRemScale : " & real'image (ap_slv2fp (vaccRemScale));
				when pow2 => state := pow3;
					nibble4 <= vaccRowScale1;
					vaccColumnScale := out_nibble4; -- 2^accscalecolumn
					--report "vaccColumnScale : " & real'image (ap_slv2fp (vaccColumnScale));
				when pow3 => state := pow4;
					vaccRowScale := out_nibble4; -- 2^accscalerow
					--report "vaccRowScale : " & real'image (ap_slv2fp (vaccRowScale));
					valphaRef_sf := resize (to_sfixed (valphaRef, eeprom16sf), valphaRef_sf);
					--------report_error (valphaRef, 0.0);
					fixed2floatce <= '1';
					fixed2floatond <= '1';
					fixed2floata <= 
					to_slv (to_sfixed (to_slv (valphaRef_sf (fracas'high downto fracas'low)), fracas))&
					to_slv (to_sfixed (to_slv (valphaRef_sf (fracbs'high downto fracbs'low)), fracbs));
				when pow4 =>
					if (fixed2floatrdy = '1') then state := pow5;
						valphaReference_ft := fixed2floatr;
						--report "valphaReference_ft : " & real'image (ap_slv2fp (valphaReference_ft));
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
	----report "====================";
	vAlphaPixel_ft := (others => '0');
	write_enable <= '0';
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i), 12)); -- offset LSB 0
	addra <= std_logic_vector (to_unsigned (col+C_ROW, 10)); -- accColumnJ
when s1 => state := s1a;	--2
	i2c_mem_addra <= (others => '0');
	addra <= (others => '0');
when s1a => state := s2;	--2
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- offset MSB 1
	addra <= std_logic_vector (to_unsigned (row, 10)); -- accrowI
	vaccColumnJ := doa;
--	--report "vaccColumnJ : " & real'image (ap_slv2fp (vaccColumnJ));
	vAlphaPixel (15 downto 8) := i2c_mem_douta;
when s2 => state := s2a; 	--3
	i2c_mem_addra <= (others => '0');
	addra <= (others => '0');
when s2a => state := s4; 	--3
	vaccRowI := doa;
--	--report "vaccRowI : " & real'image (ap_slv2fp (vaccRowI));
	vAlphaPixel (7 downto 0) := i2c_mem_douta;
--	----report_error (vAlphaPixel, 0.0);
	nibble3 <= vAlphaPixel (9 downto 4);
when s4 => state := s5; 	--5
	mulfpce <= '1';
	mulfpa <= out_nibble3;
	mulfpb <= vaccRemScale;
	mulfpond <= '1';
--	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
--	--report "vaccRemScale : " & real'image (ap_slv2fp (vaccRemScale));
when s5 => 			--6
	if (mulfprdy = '1') then state := s6;
		vAlphaPixel_ft := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := s5; end if;
when s6 => state := s7; 	--7
	mulfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= vaccColumnJ;
	mulfpb <= vaccColumnScale;
	mulfpond <= '1';
--	--report "vaccColumnJ : " & real'image (ap_slv2fp (vaccColumnJ));
--	--report "vaccColumnScale : " & real'image (ap_slv2fp (vaccColumnScale));
when s7 => 			--8
	if (mulfprdy = '1') then state := s8;
		vaccColumnJ := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := s7; end if;
when s8 => state := s9; 	--9
	mulfpsclr <= '0';
when s9 => state := s10; 	--10
	mulfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= vaccRowI;
	mulfpb <= vaccRowScale;
	mulfpond <= '1';
--	--report "vaccRowI : " & real'image (ap_slv2fp (vaccRowI));
--	--report "vaccRowScale : " & real'image (ap_slv2fp (vaccRowScale));
when s10 => 			--11
	if (mulfprdy = '1') then state := s11;
		vaccRowI := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := s10; end if;
when s11 => state := s12; 	--12
	mulfpsclr <= '0';
when s12 => state := s13; 	--13
	addfpsclr <= '0';
	addfpce <= '1';
	addfpa <= vAlphaPixel_ft;
	addfpb <= vaccColumnJ;
	addfpond <= '1';
--	--report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	--report "vaccColumnJ : " & real'image (ap_slv2fp (vaccColumnJ));
when s13 => 			--14
	if (addfprdy = '1') then state := s14;
		vAlphaPixel_ft := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := s13; end if;
when s14 => state := s15; 	--15
	addfpsclr <= '0';
when s15 => state := s16; 	--16
	addfpsclr <= '0';
	addfpce <= '1';
	addfpa <= vAlphaPixel_ft;
	addfpb <= vaccRowI;
	addfpond <= '1';
--	--report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	--report "vaccRowI : " & real'image (ap_slv2fp (vaccRowI));
when s16 => 			--17
	if (addfprdy = '1') then state := s17;
		vAlphaPixel_ft := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := s16; end if;
when s17 => state := s18; 	--18
	addfpsclr <= '0';
when s18 => state := s19; 	--19
	addfpsclr <= '0';
	addfpce <= '1';
	addfpa <= vAlphaPixel_ft;
	addfpb <= valphaReference_ft;
	addfpond <= '1';
--	--report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	--report "valphaReference_ft : " & real'image (ap_slv2fp (valphaReference_ft));
when s19 => 			--20
	if (addfprdy = '1') then state := s20;
		vAlphaPixel_ft := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := s19; end if;
when s20 => state := s21; 	--21
	addfpsclr <= '0';
	divfpce <= '1';
	divfpa <= vAlphaPixel_ft;
	divfpb <= out_nibble5;
	divfpond <= '1';
--	--report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	--report "out_nibble5 : " & real'image (ap_slv2fp (out_nibble5));
when s21 =>
	if (divfprdy = '1') then state := s22;
		vAlphaPixel_ft := divfpr;
		divfpce <= '0';
		divfpond <= '0';
		divfpsclr <= '1';
	else state := s21; end if;
when s22 => state := s23;
	divfpsclr <= '0';
when s23 => state := s24; 	--22
	write_enable <= '1';
	addra <= std_logic_vector (to_unsigned (C_ROW+C_COL+i, 10)); -- vAlphaPixel_ft
	dia <= vAlphaPixel_ft;
--	--report "================vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
	----report_error (vAlphaPixel_ft,0.0);
	i := i + 1;
when s24 =>
	if (col = C_COL-1) then
		col := 0;
		state := s25;
	else
		col := col + 1;
		state := s0;
	end if;
when s25 =>
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

divfpclk <= i_clock;
inst_divfp_acc : divfp
PORT MAP (
a => divfpa,
b => divfpb,
operation_nd => divfpond,
clk => divfpclk,
sclr => divfpsclr,
ce => divfpce,
result => divfpr,
rdy => divfprdy
);

end Behavioral;

