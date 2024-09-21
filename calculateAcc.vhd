----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:35 01/29/2023 
-- Design Name: 
-- Module Name:    calculateacc - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity calculateAcc is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_start0x2422 : in std_logic_vector (15 downto 0); -- accrow
i_start0x2423 : in std_logic_vector (15 downto 0);
i_start0x2424 : in std_logic_vector (15 downto 0);
i_start0x2425 : in std_logic_vector (15 downto 0);
i_start0x2426 : in std_logic_vector (15 downto 0);
i_start0x2427 : in std_logic_vector (15 downto 0);
i_start0x2428 : in std_logic_vector (15 downto 0); -- acccol
i_start0x2429 : in std_logic_vector (15 downto 0);
i_start0x242a : in std_logic_vector (15 downto 0);
i_start0x242b : in std_logic_vector (15 downto 0);
i_start0x242c : in std_logic_vector (15 downto 0);
i_start0x242d : in std_logic_vector (15 downto 0);
i_start0x242e : in std_logic_vector (15 downto 0);
i_start0x242f : in std_logic_vector (15 downto 0);
i_start0x2440 : in std_logic_vector (15 downto 0); -- alphatemp ROWS*COLS
i_start0x2420 : in std_logic_vector (15 downto 0); -- n1-accremscale,n2-acccolscale,n3-accrowscale,n4-alphascale
i_alphaRef : in std_logic_vector (31 downto 0); -- alpharef from fixed2float
i_tgc : in std_logic_vector (31 downto 0); -- tgc from fixed2float
i_cpalpha0 : in std_logic_vector (31 downto 0);
i_cpalpha1 : in std_logic_vector (31 downto 0);
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_done : out std_logic;
o_rdy : out std_logic
);
end calculateAcc;

architecture Behavioral of calculateAcc is

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

COMPONENT subfp
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

signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfpclk : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : STD_LOGIC;

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
signal nibble1,nibble2,nibble4,nibble5,nibble6 : std_logic_vector (3 downto 0);
signal nibble3 : std_logic_vector (5 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4,out_nibble5,out_nibble6 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;
signal rdy : std_logic;

begin

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else i_addr when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

with nibble1 select out_nibble1 <= -- >7,-16 - rows1-24
x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"22000000" when others;

with nibble2 select out_nibble2 <= -- >7,-16 - cols1-32
x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"22000000" when others;

with nibble3 select out_nibble3 <= -- >31,-64 - alphatemp
x"40e00000" when "000111",x"40c00000" when "000110",x"40a00000" when "000101",x"40800000" when "000100",x"40400000" when "000011",x"40000000" when "000010",x"3f800000" when "000001",x"22000000" when "000000",
x"41700000" when "001111",x"41600000" when "001110",x"41500000" when "001101",x"41400000" when "001100",x"41300000" when "001011",x"41200000" when "001010",x"41100000" when "001001",x"41000000" when "001000",
x"41b80000" when "010111",x"41b00000" when "010110",x"41a80000" when "010101",x"41a00000" when "010100",x"41980000" when "010011",x"41900000" when "010010",x"41880000" when "010001",x"41800000" when "010000",
x"41f80000" when "011111",x"41f00000" when "011110",x"41e80000" when "011101",x"41e00000" when "011100",x"41d80000" when "011011",x"41d00000" when "011010",x"41c80000" when "011001",x"41c00000" when "011000",
x"c1c80000" when "100111",x"c1d00000" when "100110",x"c1d80000" when "100101",x"c1e00000" when "100100",x"c1e80000" when "100011",x"c1f00000" when "100010",x"c1f80000" when "100001",x"c2000000" when "100000",
x"c1880000" when "101111",x"c1900000" when "101110",x"c1980000" when "101101",x"c1a00000" when "101100",x"c1a80000" when "101011",x"c1b00000" when "101010",x"c1b80000" when "101001",x"c1c00000" when "101000",
x"c1100000" when "110111",x"c1200000" when "110110",x"c1300000" when "110101",x"c1400000" when "110100",x"c1500000" when "110011",x"c1600000" when "110010",x"c1700000" when "110001",x"c1800000" when "110000",
x"bf800000" when "111111",x"c0000000" when "111110",x"c0400000" when "111101",x"c0800000" when "111100",x"c0a00000" when "111011",x"c0c00000" when "111010",x"c0e00000" when "111001",x"c1000000" when "111000",
x"22000000" when others;

--INIT_7d => X"42340000 42300000 422c0000 42280000 42240000 42200000 421c0000 42180000", -- unsigned 0-15 +30 for alphascale
--INIT_7c => X"42140000 42100000 420c0000 42080000 42040000 42000000 41f80000 41f00000",
with nibble4 select out_nibble4 <= -- x+30 - alphascale
x"41f00000" when x"0", x"41f80000" when x"1", x"42000000" when x"2", x"42040000" when x"3",
x"42080000" when x"4", x"420c0000" when x"5", x"42100000" when x"6", x"42140000" when x"7",
x"42180000" when x"8", x"421c0000" when x"9", x"42200000" when x"a", x"42240000" when x"b",
x"42280000" when x"c", x"422c0000" when x"d", x"42300000" when x"e", x"42340000" when x"f",
x"22000000" when others;

--INIT_7f => X"41700000 41600000 41500000 41400000 41300000 41200000 41100000 41000000", -- unsigned 0-15 for accremscale,accrowscale,acccolscale
--INIT_7e => X"40e00000 40c00000 40a00000 40800000 40400000 40000000 3f800000 22000000",
with nibble5 select out_nibble5 <= -- x - accremscale,accrowscale,acccolscale
x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"41000000" when x"8", x"41100000" when x"9", x"41200000" when x"a", x"41300000" when x"b",
x"41400000" when x"c", x"41500000" when x"d", x"41600000" when x"e", x"41700000" when x"f",
x"22000000" when others;

--INIT_01 => X"56000000 55800000 55000000 54800000 54000000 53800000 53000000 52800000", -- unsigned 0-15 - 2^(x+30)
--INIT_00 => X"52000000 51800000 51000000 50800000 50000000 4f800000 4f000000 4e800000", 
with nibble6 select out_nibble6 <= -- 2^(x+30) - 2^alphascale
x"4e800000" when x"0", x"4f000000" when x"1", x"4f800000" when x"2", x"50000000" when x"3",
x"50800000" when x"4", x"51000000" when x"5", x"51800000" when x"6", x"52000000" when x"7",
x"52800000" when x"8", x"53000000" when x"9", x"53800000" when x"a", x"54000000" when x"b",
x"54800000" when x"c", x"55000000" when x"d", x"55800000" when x"e", x"56000000" when x"f",
x"22000000" when others;

p0 : process (i_clock, i_reset) is
	constant N_COLS : integer := 32;
	constant N_ROWS : integer := 24;
	constant const2 : std_logic_vector (31 downto 0) := x"40000000";
	constant SCALEALPHA : std_logic_vector (31 downto 0) := x"358637BD"; -- 0.000001
	variable i : integer range 0 to N_ROWS-1;
	variable j : integer range 0 to N_COLS-1;
	variable index : integer range 0 to 15;
	variable k : integer range 0 to N_COLS*N_ROWS-1;
	variable vaccRemScale : std_logic_vector (31 downto 0); -- = MLX90640_NIBBLE1(eeData[32]);
	variable vaccColumnScale : std_logic_vector (31 downto 0); -- = MLX90640_NIBBLE2(eeData[32]);
	variable vaccRowScale : std_logic_vector (31 downto 0); -- = MLX90640_NIBBLE3(eeData[32]);
	variable valphaScale : std_logic_vector (31 downto 0); -- = MLX90640_NIBBLE4(eeData[32]) + 30;
	variable valphaRef : std_logic_vector (31 downto 0); -- = eeData[33];
	variable vaccRemScale1 : std_logic_vector (3 downto 0); -- = MLX90640_NIBBLE1(eeData[32]);
	variable vaccColumnScale1 : std_logic_vector (3 downto 0); -- = MLX90640_NIBBLE2(eeData[32]);
	variable vaccRowScale1 : std_logic_vector (3 downto 0); -- = MLX90640_NIBBLE3(eeData[32]);
	variable valphaScale1 : std_logic_vector (3 downto 0); -- = MLX90640_NIBBLE4(eeData[32]) + 30;
	variable valphaRef1 : std_logic_vector (15 downto 0); -- = eeData[33];
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable row,col : std_logic_vector (31 downto 0);
	type states is (idle,
	acc0,acc1,acc2,acc3,acc4,
	acc5,
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
	calculate21,calculate22,calculate23,calculate24,calculate25,
	calculate26,calculate27,calculate28,
	ending0,ending1,ending2,ending);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			nibble1 <= (others => '0');
			nibble2 <= (others => '0');
			nibble3 <= (others => '0');
			nibble4 <= (others => '0');
			nibble5 <= (others => '0');
			nibble6 <= (others => '0');
			state := idle;
			i := 0;
			j := 0;
			write_enable <= '0';
			ena_mux1 <= '0';
			rdy <= '0';
			addfpsclr <= '1';
			subfpsclr <= '1';
			mulfpsclr <= '1';
			divfpsclr <= '1';
			addfpce <= '0';
			subfpce <= '0';
			mulfpce <= '0';
			divfpce <= '0';
			addfpond <= '0';
			subfpond <= '0';
			mulfpond <= '0';
			divfpond <= '0';
			divfpa <= (others => '0');
			divfpb <= (others => '0');
			subfpa <= (others => '0');
			subfpb <= (others => '0');
			mulfpa <= (others => '0');
			mulfpb <= (others => '0');
			addfpa <= (others => '0');
			addfpb <= (others => '0');
			addra <= (others => '0');
			dia <= (others => '0');
			o_done <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := acc0;
					else
						state := idle;
					end if;
----
				when acc0 => state := acc1;
					write_enable <= '1';
					ena_mux1 <= '1';
					rdy <= '0';
					i := 0; j := 0;
					addfpsclr <= '0';
					subfpsclr <= '0';
					mulfpsclr <= '0';
					divfpsclr <= '0';

				when acc1 => state := acc2;
					vaccRemScale1 := i_start0x2420 (3 downto 0);
					nibble5 <= i_start0x2420 (3 downto 0); -- remnant
					vaccRemScale := out_nibble5;

				when acc2 => state := acc3;
					vaccColumnScale1 := i_start0x2420 (7 downto 4);
					nibble5 <= i_start0x2420 (7 downto 4); -- column
					vaccColumnScale := out_nibble5;

				when acc3 => state := acc4;
					vaccRowScale1 := i_start0x2420 (11 downto 8);
					nibble5 <= i_start0x2420 (11 downto 8); -- row
					vaccRowScale := out_nibble5;

				when acc4 => state := acc5;
					valphaScale1 := i_start0x2420 (15 downto 12); -- alphascale
					nibble6 <= i_start0x2420 (15 downto 12); -- alphascale
----
				when acc5 => state := a1; -- alpharef from fixed2float
					valphaRef := i_alphaRef;
					valphaRef := i_alphaRef;
					valphaScale := out_nibble6; -- 2^(alphascale+30)
----
				when a1 => state := ab1;
					nibble1 <= i_start0x2422 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (0, 10));
				when ab1 => state := b1;
					nibble2 <= i_start0x2428 (3 downto 0);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (0+24, 10));

				when b1 => state := ab2;
					nibble1 <= i_start0x2422 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (1, 10));
				when ab2 => state := c1;				
					nibble2 <= i_start0x2428 (7 downto 4);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (1+24, 10));

				when c1 => state := ab3;
					nibble1 <= i_start0x2422 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (2, 10));
				when ab3 => state := d1;
					nibble2 <= i_start0x2428 (11 downto 8);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (2+24, 10));

				when d1 => state := ab4;
					nibble1 <= i_start0x2422 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (3, 10));
				when ab4 => state := a2;
					nibble2 <= i_start0x2428 (15 downto 12);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (3+24, 10));


				when a2 => state := ab5;
					nibble1 <= i_start0x2423 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (4, 10));
				when ab5 => state := b2;
					nibble2 <= i_start0x2429 (3 downto 0);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (4+24, 10));

				when b2 => state := ab6;
					nibble1 <= i_start0x2423 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (5, 10));
				when ab6 => state := c2;
					nibble2 <= i_start0x2429 (7 downto 4);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (5+24, 10));

				when c2 => state := ab7;
					nibble1 <= i_start0x2423 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (6, 10));
				when ab7 => state := d2;
					nibble2 <= i_start0x2429 (11 downto 8);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (6+24, 10));

				when d2 => state := ab8;
					nibble1 <= i_start0x2423 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (7, 10));
				when ab8 => state := a3;
					nibble2 <= i_start0x2429 (15 downto 12);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (7+24, 10));


				when a3 => state := ab9;
					nibble1 <= i_start0x2424 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (8, 10));
				when ab9 => state := b3;
					nibble2 <= i_start0x242a (3 downto 0);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (8+24, 10));

				when b3 => state := ab10;
					nibble1 <= i_start0x2424 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (9, 10));
				when ab10 => state := c3;
					nibble2 <= i_start0x242a (7 downto 4);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (9+24, 10));

				when c3 => state := ab11;
					nibble1 <= i_start0x2424 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (10, 10));
				when ab11 => state := d3;
					nibble2 <= i_start0x242a (11 downto 8);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (10+24, 10));

				when d3 => state := ab12;
					nibble1 <= i_start0x2424 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (11, 10));
				when ab12 => state := a4;
					nibble2 <= i_start0x242a (15 downto 12);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (11+24, 10));


				when a4 => state := ab13;
					nibble1 <= i_start0x2425 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (12, 10));
				when ab13 => state := b4;
					nibble2 <= i_start0x242b (3 downto 0);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (12+24, 10));

				when b4 => state := ab14;
					nibble1 <= i_start0x2425 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (13, 10));
				when ab14 => state := c4;
					nibble2 <= i_start0x242b (7 downto 4);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (13+24, 10));

				when c4 => state := ab15;
					nibble1 <= i_start0x2425 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (14, 10));
				when ab15 => state := d4;
					nibble2 <= i_start0x242b (11 downto 8);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (14+24, 10));

				when d4 => state := ab16;
					nibble1 <= i_start0x2425 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (15, 10));
				when ab16 => state := a5;
					nibble2 <= i_start0x242b (15 downto 12);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (15+24, 10));


				when a5 => state := ab17;
					nibble1 <= i_start0x2426 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (16, 10));
				when ab17 => state := b5;
					nibble2 <= i_start0x242c (3 downto 0);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (16+24, 10));

				when b5 => state := ab18;
					nibble1 <= i_start0x2426 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (17, 10));
				when ab18 => state := c5;
					nibble2 <= i_start0x242c (7 downto 4);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (17+24, 10));

				when c5 => state := ab19;
					nibble1 <= i_start0x2426 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (18, 10));
				when ab19 => state := d5;
					nibble2 <= i_start0x242c (11 downto 8);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (18+24, 10));

				when d5 => state := ab20;
					nibble1 <= i_start0x2426 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (19, 10));
				when ab20 => state := a6;
					nibble2 <= i_start0x242c (15 downto 12);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (19+24, 10));


				when a6 => state := ab21;
					nibble1 <= i_start0x2427 (3 downto 0);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (20, 10));
				when ab21 => state := b6;
					nibble2 <= i_start0x242d (3 downto 0);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (20+24, 10));

				when b6 => state := ab22;
					nibble1 <= i_start0x2427 (7 downto 4);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (21, 10));
				when ab22 => state := c6;
					nibble2 <= i_start0x242d (7 downto 4);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (21+24, 10));

				when c6 => state := ab23;
					nibble1 <= i_start0x2427 (11 downto 8);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (22, 10));
				when ab23 => state := d6;
					nibble2 <= i_start0x242d (11 downto 8);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (22+24, 10));

				when d6 => state := ab24;
					nibble1 <= i_start0x2427 (15 downto 12);
					dia <= out_nibble1;
					addra <= std_logic_vector (to_unsigned (23, 10));
				when ab24 => state := a7;
					nibble2 <= i_start0x242d (15 downto 12);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (23+24, 10));
---- rest col 24-32
				when a7 => state := b7;
					nibble2 <= i_start0x242e (3 downto 0);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (24+24, 10));

				when b7 => state := c7;
					nibble2 <= i_start0x242e (7 downto 4);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (25+24, 10));

				when c7 => state := d7;
					nibble2 <= i_start0x242e (11 downto 8);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (26+24, 10));

				when d7 => state := a8;
					nibble2 <= i_start0x242e (15 downto 12);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (27+24, 10));

---
				when a8 => state := b8;
					nibble2 <= i_start0x242f (3 downto 0);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (28+24, 10));

				when b8 => state := c8;
					nibble2 <= i_start0x242f (7 downto 4);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (29+24, 10));

				when c8 => state := d8;
					nibble2 <= i_start0x242f (11 downto 8);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (30+24, 10));

				when d8 => state := calculate;
					nibble2 <= i_start0x242f (15 downto 12);
					dia <= out_nibble2;
					addra <= std_logic_vector (to_unsigned (31+24, 10));

---
when calculate => state := calculate00;
	write_enable <= '0';
	k := (32 * i) + j;
	o_done <= '0';
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
---
when calculate1 => state := calculate2;
	nibble3 <= i_start0x2440 (9 downto 4); -- (eeData[64 + p] & 0x03F0) >> 4; , alphatemp raw
when calculate2 => state := calculate3;
	fptmp1 := out_nibble3; -- alphatemp after signed
when calculate3 => state := calculate4;
	mulfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= fptmp1; -- alphatemp
	mulfpb <= x"40000000"; -- *2
	mulfpond <= '1';
when calculate4 =>
	if (mulfprdy = '1') then
		if (index = to_integer (unsigned (vaccRemScale1))) then
			state := calculate5;
			vaccRemScale := fptmp1;
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
	mulfpa <= col; -- acccol
	mulfpb <= x"40000000"; -- *2
	mulfpond <= '1';
when calculate6 =>
	if (mulfprdy = '1') then
		if (index = to_integer (unsigned (vaccColumnScale1))) then
			state := calculate7;
			vaccColumnScale := fptmp2;
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
	mulfpa <= fptmp1; -- accrow
	mulfpb <= x"40000000"; -- *2
	mulfpond <= '1';
when calculate8 =>
	if (mulfprdy = '1') then
		if (index = to_integer (unsigned (vaccRowScale1))) then
			state := calculate9;
			vaccRowScale := fptmp1;
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
	mulfpsclr <= '0';
	addfpce <= '1';
	addfpa <= vaccRemScale; -- remnant
	addfpb <= vaccColumnScale; -- column
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
	addfpb <= vaccRowScale; -- row
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
	addfpb <= i_alphaRef; -- alpharef
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
	divfpce <= '1';
	divfpa <= fptmp1; -- alpharef+row+column+remnant
	divfpb <= valphaScale; -- 2^30+x - alphascale
	divfpond <= '1';
when calculate16 =>
	if (divfprdy = '1') then
		state := calculate17;
		fptmp1 := divfpr;
		divfpce <= '0';
		divfpond <= '0';
		divfpsclr <= '1';
	else state := calculate16; end if;
when calculate17 => state := calculate18;
	divfpsclr <= '0';
	addfpce <= '1';
	addfpa <= i_cpAlpha0; -- cpAlpha0
	addfpb <= i_cpAlpha1; -- cpAlpha1
	addfpond <= '1';
when calculate18 =>
	if (addfprdy = '1') then
		state := calculate19;
		fptmp2 := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := calculate18; end if;
when calculate19 => state := calculate20;
	addfpsclr <= '0';
	divfpce <= '1';
	divfpa <= fptmp2; -- cpAlpha0+cpAlpha1
	divfpb <= const2; -- 2
	divfpond <= '1';
when calculate20 =>
	if (divfprdy = '1') then
		state := calculate21;
		fptmp2 := divfpr;
		divfpce <= '0';
		divfpond <= '0';
		divfpsclr <= '1';
	else state := calculate20; end if;
when calculate21 => state := calculate22;
	divfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= fptmp2; -- (cpAlpha0+cpAlpha1)/2
	mulfpb <= i_tgc; -- tgc
	mulfpond <= '1';
when calculate22 =>
	if (mulfprdy = '1') then
		state := calculate23;
		fptmp2 := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := calculate22; end if;
when calculate23 => state := calculate24;
	mulfpsclr <= '0';
	subfpce <= '1';
	subfpa <= fptmp1; -- (alpharef+row+column+remnant)/(2^30+x)
	subfpb <= fptmp2; -- tgc*(cpAlpha0+cpAlpha1)/2
	subfpond <= '1';
when calculate24 =>
	if (subfprdy = '1') then
		state := calculate25;
		fptmp1 := subfpr;
		subfpce <= '0';
		subfpond <= '0';
		subfpsclr <= '1';
	else state := calculate24; end if;
when calculate25 => state := calculate26;
	subfpsclr <= '0';
	divfpce <= '1';
	divfpa <= SCALEALPHA; -- 0.000001
	divfpb <= fptmp1; -- ((alpharef+row+column+remnant)/(2^30+x))-(tgc*(cpAlpha0+cpAlpha1)/2)
	divfpond <= '1';
when calculate26 =>
	if (divfprdy = '1') then
		state := calculate27;
		fptmp1 := divfpr;
		divfpce <= '0';
		divfpond <= '0';
		divfpsclr <= '1';
	else state := calculate26; end if;
when calculate27 => state := ending0;
	divfpsclr <= '0';
	write_enable <= '1';
	dia <= fptmp1;
	addra <= std_logic_vector (to_unsigned (k+24+32, 10));
when ending0 => state := ending1;
	write_enable <= '0';
when ending1 =>
	o_done <= '1';
	if (j = N_COLS-1) then
		j := 0;
		state := ending2;
	else
		j := j + 1;
		state := calculate;
	end if;
when ending2 =>
	o_done <= '1';
	if (i = N_ROWS-1) then
		i := 0;
		state := ending;
	else
		i := i + 1;
		state := calculate;
	end if;
when ending => state := idle;
	rdy <= '1';
when others => null;
end case;
end if;
end if;
end process p0;

inst_mem_acc : mem_ramb16_s36_x2
GENERIC MAP (
--INIT_7f => X"4170000041600000415000004140000041300000412000004110000041000000", -- unsigned 0-15 for accremscale,accrowscale,acccolscale
--INIT_7e => X"40e0000040c0000040a000004080000040400000400000003f80000022000000",
--INIT_7d => X"4234000042300000422c0000422800004224000042200000421c000042180000", -- unsigned 0-15 +30 for alphascale
--INIT_7c => X"4214000042100000420c000042080000420400004200000041f8000041f00000",
INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000" -- start 0's
)
PORT MAP (
DO => doa,
DOP => open,
ADDR => mux_addr,
CLK => i_clock,
DI => mux_dia,
DIP => (others => '0'),
EN => i_clock,
SSR => i_reset,
WE => write_enable
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

subfpclk <= i_clock;
inst_subfp_acc : subfp
PORT MAP (
a => subfpa,
b => subfpb,
operation_nd => subfpond,
clk => subfpclk,
sclr => subfpsclr,
ce => subfpce,
result => subfpr,
rdy => subfprdy
);

end Behavioral;

