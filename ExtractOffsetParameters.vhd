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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
i_ee0x2410 : in slv16; -- 1-occremscale,2-occcolumnscale,3-occrowscale
i_offsetRef : in fd2ft; -- offsetref from fixed2float

i_ee0x2412 : in slv16; -- occrow1-4
i_ee0x2413 : in slv16; -- occrow5-8
i_ee0x2414 : in slv16; -- occrow9-12
i_ee0x2415 : in slv16; -- occrow13-16
i_ee0x2416 : in slv16; -- occrow17-20
i_ee0x2417 : in slv16; -- occrow21-24

i_ee0x2418 : in slv16; -- occcol1-4
i_ee0x2419 : in slv16; -- occcol5-8
i_ee0x241a : in slv16; -- occcol9-12
i_ee0x241b : in slv16; -- occcol13-16
i_ee0x241c : in slv16; -- occcol17-20
i_ee0x241d : in slv16; -- occcol21-24
i_ee0x241e : in slv16; -- occcol25-28
i_ee0x241f : in slv16; -- occcol29-32

i_ee0x2440 : in slv16; -- offset ROWS*COLS


o_rdy : out std_logic
);
end ExtractOffsetParameters;

architecture Behavioral of ExtractOffsetParameters is

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

signal addra : std_logic_vector (9 downto 0);
signal doa,dia : std_logic_vector (31 downto 0);

signal ena_mux1 : std_logic;

-- xxx nibbles must out in next clock xyxle
signal nibble1,nibble2,nibble4,nibble5,nibble6 : std_logic_vector (3 downto 0);
signal nibble3 : std_logic_vector (5 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4,out_nibble5,out_nibble6 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;

begin

--INIT_7f => X"41700000 41600000 41500000 41400000 41300000 41200000 41100000 41000000", -- unsigned 0-15 for accremscale,accrowscale,acccolscale
--INIT_7e => X"40e00000 40c00000 40a00000 40800000 40400000 40000000 3f800000 22000000",
with nibble1 select out_nibble1 <= -- x - occremscale,occrowscale,occcolscale
x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"41000000" when x"8", x"41100000" when x"9", x"41200000" when x"a", x"41300000" when x"b",
x"41400000" when x"c", x"41500000" when x"d", x"41600000" when x"e", x"41700000" when x"f",
x"00000000" when others;

with nibble2 select out_nibble2 <= -- >7,-16 - rows1-24,cols1-32
x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"00000000" when others;

with nibble3 select out_nibble3 <= -- >31,-64 - offset raw
x"40e00000" when "000111",x"40c00000" when "000110",x"40a00000" when "000101",x"40800000" when "000100",x"40400000" when "000011",x"40000000" when "000010",x"3f800000" when "000001",x"22000000" when "000000",
x"41700000" when "001111",x"41600000" when "001110",x"41500000" when "001101",x"41400000" when "001100",x"41300000" when "001011",x"41200000" when "001010",x"41100000" when "001001",x"41000000" when "001000",
x"41b80000" when "010111",x"41b00000" when "010110",x"41a80000" when "010101",x"41a00000" when "010100",x"41980000" when "010011",x"41900000" when "010010",x"41880000" when "010001",x"41800000" when "010000",
x"41f80000" when "011111",x"41f00000" when "011110",x"41e80000" when "011101",x"41e00000" when "011100",x"41d80000" when "011011",x"41d00000" when "011010",x"41c80000" when "011001",x"41c00000" when "011000",
x"c1c80000" when "100111",x"c1d00000" when "100110",x"c1d80000" when "100101",x"c1e00000" when "100100",x"c1e80000" when "100011",x"c1f00000" when "100010",x"c1f80000" when "100001",x"c2000000" when "100000",
x"c1880000" when "101111",x"c1900000" when "101110",x"c1980000" when "101101",x"c1a00000" when "101100",x"c1a80000" when "101011",x"c1b00000" when "101010",x"c1b80000" when "101001",x"c1c00000" when "101000",
x"c1100000" when "110111",x"c1200000" when "110110",x"c1300000" when "110101",x"c1400000" when "110100",x"c1500000" when "110011",x"c1600000" when "110010",x"c1700000" when "110001",x"c1800000" when "110000",
x"bf800000" when "111111",x"c0000000" when "111110",x"c0400000" when "111101",x"c0800000" when "111100",x"c0a00000" when "111011",x"c0c00000" when "111010",x"c0e00000" when "111001",x"c1000000" when "111000",
x"22000000" when others;


p0 : process (i_clock) is
	constant N_COLS : integer := 32;
	constant N_ROWS : integer := 24;
	variable i : integer range 0 to N_ROWS-1;
	variable j : integer range 0 to N_COLS-1;
	variable index : integer range 0 to 15;
	variable k : integer range 0 to N_COLS*N_ROWS-1;
	variable voccRemScale : std_logic_vector (31 downto 0); -- = MLX90640_NIBBLE1(eeData[32]);
	variable voccColumnScale : std_logic_vector (31 downto 0); -- = MLX90640_NIBBLE2(eeData[32]);
	variable voccRowScale : std_logic_vector (31 downto 0); -- = MLX90640_NIBBLE3(eeData[32]);
	variable volphaScale : std_logic_vector (31 downto 0); -- = MLX90640_NIBBLE4(eeData[32]) + 30;
	variable volphaRef : std_logic_vector (31 downto 0); -- = eeData[33];
	variable voccRemScale1 : std_logic_vector (3 downto 0); -- = MLX90640_NIBBLE1(eeData[32]);
	variable voccColumnScale1 : std_logic_vector (3 downto 0); -- = MLX90640_NIBBLE2(eeData[32]);
	variable voccRowScale1 : std_logic_vector (3 downto 0); -- = MLX90640_NIBBLE3(eeData[32]);
	variable valphaScale1 : std_logic_vector (3 downto 0); -- = MLX90640_NIBBLE4(eeData[32]) + 30;
	variable voffsetRef1: std_logic_vector (15 downto 0); -- = eeData[33];
	variable voffsetRef : fd2ft; -- = eeData[33];
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable row,col : std_logic_vector (31 downto 0);
	type states is (idle,
	occ1,occ2,occ3,occ4,
	occ5,
	a1,b1,c1,d1,
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
	ending0,ending1,ending2,ending);
	variable state : states;
begin

if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			nibble1 <= (others => '0');
			nibble2 <= (others => '0');
			nibble3 <= (others => '0');
			nibble4 <= (others => '0');
			state := idle;
			i := 0;
			j := 0;
			write_enable <= '0';
			ena_mux1 <= '0';
			o_rdy <= '0';
			addfpsclr <= '1';
			mulfpsclr <= '1';
		else
			case (state) is
when idle =>
	if (i_run = '1') then
		state := occ1;
	write_enable <= '1';
	ena_mux1 <= '1';
	o_rdy <= '0';
	i := 0; j := 0;
	addfpsclr <= '0';
	mulfpsclr <= '0';

	else
		state := idle;
	write_enable <= '0';
	ena_mux1 <= '0';
	o_rdy <= '0';
	i := 0; j := 0;
	addfpsclr <= '0';
	mulfpsclr <= '0';

	end if;


when occ1 => state := occ2;
	nibble1 <= i_ee0x2410 (3 downto 0); -- remnant
when occ2 => state := occ3;
	voccRemScale := out_nibble1; -- out remnant
	voccRemScale1 := i_ee0x2410 (3 downto 0); -- remnant
	nibble1 <= i_ee0x2410 (7 downto 4); -- column
when occ3 => state := occ4;
	voccColumnScale := out_nibble1; -- out column
	voccColumnScale1 := i_ee0x2410 (7 downto 4); -- column
	nibble1 <= i_ee0x2410 (11 downto 8); -- row
when occ4 => state := a1;
	voccRowScale := out_nibble1; -- out row
	voccRowScale1 := i_ee0x2410 (11 downto 8); -- row
	voffsetRef := i_offsetRef; -- offsetref

when a1 => state := ab1;
	nibble1 <= i_ee0x2412 (3 downto 0);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (0, 10));
when ab1 => state := b1;
	nibble2 <= i_ee0x2418 (3 downto 0);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (0+24, 10));

when b1 => state := ab2;
	nibble1 <= i_ee0x2412 (7 downto 4);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (1, 10));
when ab2 => state := c1;				
	nibble2 <= i_ee0x2418 (7 downto 4);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (1+24, 10));

when c1 => state := ab3;
	nibble1 <= i_ee0x2412 (11 downto 8);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (2, 10));
when ab3 => state := d1;
	nibble2 <= i_ee0x2418 (11 downto 8);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (2+24, 10));

when d1 => state := ab4;
	nibble1 <= i_ee0x2412 (15 downto 12);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (3, 10));
when ab4 => state := a2;
	nibble2 <= i_ee0x2418 (15 downto 12);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (3+24, 10));


when a2 => state := ab5;
	nibble1 <= i_ee0x2413 (3 downto 0);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (4, 10));
when ab5 => state := b2;
	nibble2 <= i_ee0x2419 (3 downto 0);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (4+24, 10));

when b2 => state := ab6;
	nibble1 <= i_ee0x2413 (7 downto 4);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (5, 10));
when ab6 => state := c2;
	nibble2 <= i_ee0x2419 (7 downto 4);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (5+24, 10));

when c2 => state := ab7;
	nibble1 <= i_ee0x2413 (11 downto 8);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (6, 10));
when ab7 => state := d2;
	nibble2 <= i_ee0x2419 (11 downto 8);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (6+24, 10));

when d2 => state := ab8;
	nibble1 <= i_ee0x2413 (15 downto 12);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (7, 10));
when ab8 => state := a3;
	nibble2 <= i_ee0x2419 (15 downto 12);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (7+24, 10));


when a3 => state := ab9;
	nibble1 <= i_ee0x2414 (3 downto 0);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (8, 10));
when ab9 => state := b3;
	nibble2 <= i_ee0x241a (3 downto 0);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (8+24, 10));

when b3 => state := ab10;
	nibble1 <= i_ee0x2414 (7 downto 4);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (9, 10));
when ab10 => state := c3;
	nibble2 <= i_ee0x241a (7 downto 4);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (9+24, 10));

when c3 => state := ab11;
	nibble1 <= i_ee0x2414 (11 downto 8);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (10, 10));
when ab11 => state := d3;
	nibble2 <= i_ee0x241a (11 downto 8);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (10+24, 10));

when d3 => state := ab12;
	nibble1 <= i_ee0x2414 (15 downto 12);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (11, 10));
when ab12 => state := a4;
	nibble2 <= i_ee0x241a (15 downto 12);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (11+24, 10));


when a4 => state := ab13;
	nibble1 <= i_ee0x2415 (3 downto 0);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (12, 10));
when ab13 => state := b4;
	nibble2 <= i_ee0x241b (3 downto 0);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (12+24, 10));

when b4 => state := ab14;
	nibble1 <= i_ee0x2415 (7 downto 4);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (13, 10));
when ab14 => state := c4;
	nibble2 <= i_ee0x241b (7 downto 4);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (13+24, 10));

when c4 => state := ab15;
	nibble1 <= i_ee0x2415 (11 downto 8);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (14, 10));
when ab15 => state := d4;
	nibble2 <= i_ee0x241b (11 downto 8);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (14+24, 10));

when d4 => state := ab16;
	nibble1 <= i_ee0x2415 (15 downto 12);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (15, 10));
when ab16 => state := a5;
	nibble2 <= i_ee0x241b (15 downto 12);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (15+24, 10));


when a5 => state := ab17;
	nibble1 <= i_ee0x2416 (3 downto 0);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (16, 10));
when ab17 => state := b5;
	nibble2 <= i_ee0x241c (3 downto 0);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (16+24, 10));

when b5 => state := ab18;
	nibble1 <= i_ee0x2416 (7 downto 4);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (17, 10));
when ab18 => state := c5;
	nibble2 <= i_ee0x241c (7 downto 4);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (17+24, 10));

when c5 => state := ab19;
	nibble1 <= i_ee0x2416 (11 downto 8);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (18, 10));
when ab19 => state := d5;
	nibble2 <= i_ee0x241c (11 downto 8);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (18+24, 10));

when d5 => state := ab20;
	nibble1 <= i_ee0x2416 (15 downto 12);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (19, 10));
when ab20 => state := a6;
	nibble2 <= i_ee0x241c (15 downto 12);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (19+24, 10));


when a6 => state := ab21;
	nibble1 <= i_ee0x2417 (3 downto 0);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (20, 10));
when ab21 => state := b6;
	nibble2 <= i_ee0x241d (3 downto 0);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (20+24, 10));

when b6 => state := ab22;
	nibble1 <= i_ee0x2417 (7 downto 4);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (21, 10));
when ab22 => state := c6;
	nibble2 <= i_ee0x241d (7 downto 4);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (21+24, 10));

when c6 => state := ab23;
	nibble1 <= i_ee0x2417 (11 downto 8);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (22, 10));
when ab23 => state := d6;
	nibble2 <= i_ee0x241d (11 downto 8);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (22+24, 10));

when d6 => state := ab24;
	nibble1 <= i_ee0x2417 (15 downto 12);
	dia <= out_nibble1;
	addra <= std_logic_vector (to_unsigned (23, 10));
when ab24 => state := a7;
	nibble2 <= i_ee0x241d (15 downto 12);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (23+24, 10));
---- rest col 24-32
when a7 => state := b7;
	nibble2 <= i_ee0x241e (3 downto 0);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (24+24, 10));

when b7 => state := c7;
	nibble2 <= i_ee0x241e (7 downto 4);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (25+24, 10));

when c7 => state := d7;
	nibble2 <= i_ee0x241e (11 downto 8);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (26+24, 10));

when d7 => state := a8;
	nibble2 <= i_ee0x241e (15 downto 12);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (27+24, 10));

---
when a8 => state := b8;
	nibble2 <= i_ee0x241f (3 downto 0);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (28+24, 10));

when b8 => state := c8;
	nibble2 <= i_ee0x241f (7 downto 4);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (29+24, 10));

when c8 => state := d8;
	nibble2 <= i_ee0x241f (11 downto 8);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (30+24, 10));

when d8 => state := calculate;
	nibble2 <= i_ee0x241f (15 downto 12);
	dia <= out_nibble2;
	addra <= std_logic_vector (to_unsigned (31+24, 10));



when calculate => state := calculate00;
	write_enable <= '0';
	k := (32 * i) + j;
when calculate00 => state := calculate01;
	addra <= std_logic_vector (to_unsigned (j+24, 10));
when calculate01 => state := calculate02;
when calculate02 => state := calculate03;
	col := doa;
when calculate03 => state := calculate04;
	addra <= std_logic_vector (to_unsigned (i, 10));
when calculate04 => state := calculate05;
when calculate05 => state := calculate1;
	row := doa;



when calculate1 => state := calculate2;
	nibble3 <= i_ee0x2440 (15 downto 10); -- (eeData[64 + p] & MLX90640_MSBITS_6_MASK) >> 10; , offset raw
when calculate2 => state := calculate3;
	fptmp1 := out_nibble3; -- offset after signed
when calculate3 => state := calculate4;
	mulfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= fptmp1; -- alphatemp
	mulfpb <= x"40000000"; -- *2
	mulfpond <= '1';
when calculate4 =>
	if (mulfprdy = '1') then
		if (index = to_integer (unsigned (voccRemScale1))) then
			state := calculate5;
			voccRemScale := fptmp1;
			index := 0;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else
			state := calculate3;
			fptmp1 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
			index := index + 1;
		end if;
	else state := calculate4; end if;
when calculate5 => state := calculate6;
	mulfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= col; -- occcol
	mulfpb <= x"40000000"; -- *2
	mulfpond <= '1';
when calculate6 =>
	if (mulfprdy = '1') then
		if (index = to_integer (unsigned (voccColumnScale1))) then
			state := calculate7;
			voccColumnScale := fptmp2;
			index := 0;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
			fptmp1 := row;
		else
			state := calculate5;
			fptmp2 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
			index := index + 1;
		end if;
	else state := calculate6; end if;
when calculate7 => state := calculate8;
	mulfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= fptmp1; -- occrow
	mulfpb <= x"40000000"; -- *2
	mulfpond <= '1';
when calculate8 =>
	if (mulfprdy = '1') then
		if (index = to_integer (unsigned (voccRowScale1))) then
			state := calculate9;
			voccRowScale := fptmp1;
			index := 0;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else
			state := calculate7;
			fptmp1 := mulfpr;
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
			index := index + 1;
		end if;
	else state := calculate8; end if;
when calculate9 => state := calculate10;
	addfpsclr <= '0';
	addfpce <= '1';
	addfpa <= voccRemScale; -- remnant
	addfpb <= voccColumnScale; -- column
	addfpond <= '1';
when calculate10 =>
	if (addfprdy = '1') then
		state := calculate11;
		fptmp1 := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := calculate10; end if;
when calculate11 => state := calculate12;
	addfpsclr <= '0';
	addfpce <= '1';
	addfpa <= fptmp1; -- column+remnant
	addfpb <= voccRowScale; -- row
	addfpond <= '1';
when calculate12 =>
	if (addfprdy = '1') then
		state := calculate13;
		fptmp1 := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := calculate12; end if;
when calculate13 => state := calculate14;
	addfpsclr <= '0';
	addfpce <= '1';
	addfpa <= fptmp1; -- row+column+remnant
	addfpb <= i_offsetRef; -- offsetref
	addfpond <= '1';
when calculate14 =>
	if (addfprdy = '1') then
		state := calculate15;
		fptmp1 := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := calculate14; end if;
when calculate15 => state := calculate16;
	addfpsclr <= '0';

when calculate17 => state := ending0;
	write_enable <= '1';
	dia <= fptmp1;
	addra <= std_logic_vector (to_unsigned (k+24+32, 10));
when ending0 => state := ending1;
	write_enable <= '0';
when ending1 =>
	if (j = N_COLS-1) then
		j := 0;
		state := ending2;
	else
		j := j + 1;
		state := calculate;
	end if;
when ending2 =>
	if (i = N_ROWS-1) then
		i := 0;
		state := ending;
	else
		i := i + 1;
		state := calculate;
	end if;
when ending =>
	o_rdy <= '1';
when others => null;
end case;
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
ADDR => addra,
CLK => i_clock,
DI => dia,
DIP => (others => '0'),
EN => ena_mux1,
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

end Behavioral;

