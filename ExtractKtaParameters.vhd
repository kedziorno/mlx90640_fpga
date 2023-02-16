----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:15 02/07/2023 
-- Design Name: 
-- Module Name:    ExtractKtaParameters - Behavioral 
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

entity ExtractKtaParameters is
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
end ExtractKtaParameters;

architecture Behavioral of ExtractKtaParameters is

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
signal nibble3 : std_logic_vector (2 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4,out_nibble5 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;

signal rdy : std_logic;

signal stemp1 : std_logic_vector (15 downto 0);

component mem_signed256 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_value : in std_logic_vector (7 downto 0); -- input hex from 0 to 255
o_value : out std_logic_vector (31 downto 0) -- output signed -128 to 127 in SP float
);
end component mem_signed256;

signal mem_signed256_clock : std_logic;
signal mem_signed256_reset : std_logic;
signal mem_signed256_ivalue : std_logic_vector (7 downto 0); -- input hex from 0 to 255
signal mem_signed256_ovalue : std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float

constant C_COL : integer := 32;
constant C_ROW : integer := 24;
signal col : integer range 0 to C_COL-1;
signal row : integer range 0 to C_ROW-1;

signal colo,cole : std_logic;
signal rowo,rowe : std_logic;

signal ktarcee_oo,ktarcee_eo,ktarcee_oe,ktarcee_ee,ktarcee : std_logic_vector (7 downto 0);

begin

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else i_addr when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

--INIT_01 => X"4b000000 4a800000 4a000000 49800000 49000000 48800000 48000000 47800000",
--INIT_00 => X"47000000 46800000 46000000 45800000 45000000 44800000 44000000 43800000",
with nibble1 select out_nibble1 <= -- 2^(x+8) unsigned 0-15 - ktascale1
x"43800000" when x"0", x"44000000" when x"1", x"44800000" when x"2", x"45000000" when x"3",
x"45800000" when x"4", x"46000000" when x"5", x"46800000" when x"6", x"47000000" when x"7",
x"47800000" when x"8", x"48000000" when x"9", x"48800000" when x"a", x"49000000" when x"b",
x"49800000" when x"c", x"4a000000" when x"d", x"4a800000" when x"e", x"4b000000" when x"f",
x"00000000" when others;

--INIT_01 => X"47000000 46800000 46000000 45800000 45000000 44800000 44000000 43800000",
--INIT_00 => X"43000000 42800000 42000000 41800000 41000000 40800000 40000000 3f800000",
with nibble2 select out_nibble2 <= -- 2^x unsigned 0-15 - ktascale2
x"3f800000" when x"0", x"40000000" when x"1", x"40800000" when x"2", x"41000000" when x"3",
x"41800000" when x"4", x"42000000" when x"5", x"42800000" when x"6", x"43000000" when x"7",
x"43800000" when x"8", x"44000000" when x"9", x"44800000" when x"a", x"45000000" when x"b",
x"45800000" when x"c", x"46000000" when x"d", x"46800000" when x"e", x"47000000" when x"f",
x"00000000" when others;

--INIT_01 => X"40e00000 40c00000 40a00000 40800000 40400000 40000000 3f800000 00000000",
--INIT_00 => X"bf800000 c0000000 c0400000 c0800000 40400000 40000000 3f800000 00000000",
with nibble3 select out_nibble3 <= -- x signed (000e / 2) 0-7, >3,-8 - kta(i,j)_ee
x"00000000" when "000", x"3f800000" when "001", x"40000000" when "010", x"40400000" when "011",
x"c0800000" when "100", x"c0400000" when "101", x"c0000000" when "110", x"bf800000" when "111",
x"00000000" when others;

cole <= '1' when (col mod 2) = 0 else '0' when (col mod 2) = 1; -- column even
rowe <= '1' when (row mod 2) = 0 else '0' when (row mod 2) = 1; -- row even

p1 : process (cole,rowe,ktarcee_oo,ktarcee_eo,ktarcee_oe,ktarcee_ee) is
	variable a : std_logic_vector (1 downto 0);
begin
	a := rowe&cole;
case (a) is
	when "00" => ktarcee <= ktarcee_oo;
	when "10" => ktarcee <= ktarcee_eo;
	when "01" => ktarcee <= ktarcee_oe;
	when "11" => ktarcee <= ktarcee_ee;
	when others => ktarcee <= (others => '0');
end case;

end process p1;


p0 : process (i_clock) is

	type states is (idle,
	kta0,kta1,kta2,kta3,kta4,
	kta5,kta6,kta7,kta8,kta9,
	kta10,kta11,kta12,kta13,kta14,
	kta15,kta16,kta17,kta18,kta19,
	kta20,kta21,kta22,kta23,kta24,
	kta25,kta26,kta27,kta28,kta29,
	kta30,kta31,kta32,kta33,kta34,
	kta35,kta36,kta37,kta38,kta39,
	kta40,kta41,kta42,kta43,kta44,
	kta45,kta46,kta47,kta48,kta49,
	kta50,kta51,kta52,kta53,kta54,
	kta55,kta56,kta57,kta58,kta59,
	
	kta60,kta61,kta62,kta63,kta64,
	kta65,kta66,kta67,kta68,kta69,
	kta70,kta71,kta72,kta73,kta74,
	kta75,kta76,kta77,kta78,kta79,
	kta80,kta81,kta82,kta83,kta84,
	kta85,kta86,kta87,kta88,kta89,
	kta90,kta91,kta92,kta93,kta94,
	kta95,kta96,kta97,kta98,kta99,
	kta100,kta101,kta102,kta103,kta104,
	kta105,kta106,kta107,kta108,kta109,
	
	kta110,kta111,kta112,kta113,kta114,
	kta115,kta116,kta117,kta118,kta119,
	kta120,kta121,kta122,kta123,kta124,
	kta0a,kta1a,kta2a,kta3a,kta4a,
kta5a,kta6a,kta7a,kta8a,kta9a,
kta10a,kta11a,kta12a,kta13a,kta14a,
kta15a,kta16a,kta17a,kta18a,kta19a,
kta20a,kta21a,kta22a,kta23a,kta24a,
kta25a,kta26a,kta27a,kta28a,kta29a,
kta30a,kta31a,kta32a,kta33a,kta34a,
kta35a,kta36a,kta37a,kta38a,kta39a,
kta40a,kta41a,kta42a,kta43a,kta44a,
kta45a,kta46a,kta47a,kta48a,kta49a,
kta50a,kta51a,kta52a,kta53a,kta54a,
kta55a,kta56a,kta57a,kta58a,kta59a,
kta60a,kta61a,kta62a,kta63a,kta64a,
kta65a,kta66a,kta67a,kta68a,kta69a,
kta70a,kta71a,kta72a,kta73a,kta74a,
kta75a,kta76a,kta77a,kta78a,kta79a,
kta80a,kta81a,kta82a,kta83a,kta84a,
kta85a,kta86a,kta87a,kta88a,kta89a,
kta90a,kta91a,kta92a,kta93a,kta94a,
kta95a,kta96a,kta97a,kta98a,kta99a,
kta100a,kta101a,kta102a,kta103a,kta104a,
kta105a,kta106a,kta107a,kta108a,kta109a,
kta110a,kta111a,kta112a,kta113a,kta114a,
kta115a,kta116a,kta117a,kta118a,kta119a,
kta120a,kta121a,kta122a,kta123a,kta124a,
	pow0,pow1,pow2,pow3,pow4,pow5,pow6,
	a1,b1,c1,d1,kta9b,kta10b,
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
	variable vktaRemScale : std_logic_vector (31 downto 0);
	variable vktaColumnScale : std_logic_vector (31 downto 0);
	variable vktaRowScale : std_logic_vector (31 downto 0);

	variable vktaRemScale1 : std_logic_vector (3 downto 0);
	variable vktaColumnScale1 : std_logic_vector (3 downto 0);
	variable vktaRowScale1 : std_logic_vector (3 downto 0);

	variable valphaRef1: std_logic_vector (15 downto 0);
	variable valphaRef : std_logic_vector (15 downto 0);
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable vktacolumnj,ktarowi,vktarowi,valphaReference_ft,vAlphaPixel_ft,ktarcee_ft,kta_ft : std_logic_vector (31 downto 0);
	variable temp1,vAlphaPixel : std_logic_vector (15 downto 0);

	variable fracas : fracas;
	variable fracbs : fracbs;
	variable fracau : fracau;
	variable fracbu : fracbu;
	variable vAlphaPixel_sf,valphaRef_sf : st_sfixed_max;
	variable eeprom16slv,ram16slv : slv16;
	variable eeprom16sf,ram16sf : sfixed16;
	variable eeprom16uf,ram16uf : ufixed16;

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
			i := 0;
			col <= 0;
			row <= 0;
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := kta0;
						i2c_mem_ena <= '1';
						write_enable <= '1';
						ena_mux1 <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
						write_enable <= '0';
						ena_mux1 <= '0';
					end if;
				when kta0 => state := kta1;
					addfpsclr <= '0';
					mulfpsclr <= '0';
					divfpsclr <= '0';
					fixed2floatsclr <= '0';
					rdy <= '0';


				when kta1 => state := kta2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (54*2+0, 12)); -- 2436 LSB - ktarcee_oo
				when kta2 => state := kta3;
				when kta3 => state := kta4;
					i2c_mem_addra <= std_logic_vector (to_unsigned (54*2+1, 12)); -- 2436 MSB - ktarcee_eo
					ktarcee_oo <= i2c_mem_douta;
				when kta4 => state := kta5;
				when kta5 => state := kta6;
					i2c_mem_addra <= std_logic_vector (to_unsigned (54*2+2, 12)); -- 2437 LSB - ktarcee_oe
					ktarcee_eo <= i2c_mem_douta;
				when kta6 => state := kta7;
				when kta7 => state := kta8;
					i2c_mem_addra <= std_logic_vector (to_unsigned (54*2+3, 12)); -- 2437 MSB - ktarcee_ee
					ktarcee_oe <= i2c_mem_douta;
				when kta8 => state := kta9;
				when kta9 => state := kta10;
					ktarcee_ee <= i2c_mem_douta;
				when kta10 => state := kta11;
					mem_signed256_ivalue <= ktarcee;
				when kta11 => state := kta12;
				when kta12 => state := kta13;
					ktarcee_ft := mem_signed256_ovalue;
				when kta13 => state := kta14;
					i2c_mem_addra <= std_logic_vector (to_unsigned (54*2+5, 12)); -- 2438 LSB - ktascale1/ktascale2				
				when kta14 => state := kta15;
				when kta15 => state := kta16;
					nibble1 <= i2c_mem_douta (7 downto 4); -- ktascale1
					nibble2 <= i2c_mem_douta (3 downto 0); -- ktascale2
				
				when kta16 => state := kta17;
					i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- kta LSB 1
				when kta17 => state := kta18;
				when kta18 => state := kta19;
					nibble3 <= i2c_mem_douta (3 downto 1); -- kta_ee 3bit
				when kta19 => state := kta20;
	mulfpce <= '1';
	mulfpa <= out_nibble3; -- kta_ee
	mulfpb <= out_nibble2; -- 2^ktascale2
	mulfpond <= '1';
--	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
--	--report "vktaRemScale : " & real'image (ap_slv2fp (vktaRemScale));
when kta20 => 			--6
	if (mulfprdy = '1') then state := kta21;
		kta_ft := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := kta20; end if;
when kta21 => state := kta22; 	--7
	mulfpsclr <= '0';

	addfpce <= '1';
	addfpa <= kta_ft; -- kta_ee*2^ktascale2
	addfpb <= ktarcee_ft; -- ktarcee
	addfpond <= '1';
--	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
--	--report "vktaRemScale : " & real'image (ap_slv2fp (vktaRemScale));
when kta22 => 			--6
	if (addfprdy = '1') then state := kta23;
		kta_ft := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := kta22; end if;
when kta23 => state := kta24; 	--7
	addfpsclr <= '0';


	divfpce <= '1';
	divfpa <= kta_ft; -- ktarcee+kta_ee*2^ktascale2
	divfpb <= out_nibble1; -- 2^ktascale1
	divfpond <= '1';
--	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
--	--report "vktaRemScale : " & real'image (ap_slv2fp (vktaRemScale));
when kta24 => 			--6
	if (divfprdy = '1') then state := kta25;
		kta_ft := divfpr;
		divfpce <= '0';
		divfpond <= '0';
		divfpsclr <= '1';
	else state := kta24; end if;
when kta25 => state := kta26; 	--7
	divfpsclr <= '0';

when kta26 => state := kta27; 	--22
	write_enable <= '1';
	addra <= std_logic_vector (to_unsigned (i, 10)); -- kta
	dia <= kta_ft;
--	report "================kta_ft : " & real'image (ap_slv2fp (kta_ft));
--	report_error (kta_ft,0.0);
when kta27 =>
	i := i + 1;
	write_enable <= '0';
	if (col = C_COL-1) then
		col <= 0;
		state := kta28;
	else
		col <= col + 1;
		state := kta10;
	end if;
when kta28 =>
	write_enable <= '0';
	if (row = C_ROW-1) then
		row <= 0;
		state := ending;
	else
		row <= row + 1;
		state := kta10;
	end if;

				when ending => state := idle;
					rdy <= '1';
				when others => null;
			end case;
--			stemp1 <= temp1;
		end if;
	end if;
end process p0;


--					nibble1 <= temp1 (3 downto 0); -- kta scale remnant
--				when kta5 => state := kta6;
--				
--					vktaRemScale := out_nibble1; -- out kta scale remnant signed
--					vktaRemScale1 := temp1 (3 downto 0); -- kta scale remnant for 2^x
--					
--					nibble1 <= temp1 (7 downto 4); -- kta scale column
--				when kta6 => state := kta7;
--				
--					vktaColumnScale := out_nibble1; -- out kta scale column signed
--					vktaColumnScale1 := temp1 (7 downto 4); -- kta scale column for 2^x
--
--					nibble1 <= temp1 (11 downto 8); -- kta scale row
--					nibble5 <= temp1 (15 downto 12); -- alpha scale
--				when kta7 => state := kta8;
--
--					vktaRowScale := out_nibble1; -- out kta row column signed
--					vktaRowScale1 := temp1 (11 downto 8); -- kta scale row for 2^x
----					vAlphaScale := out_nibble5;

--				when kta8 => state := kta9a;
--					
--				when kta9a => state := kta9;
--				when kta9 => state := kta10a;
--					
--					
--				when kta10a => state := kta10;
--				when kta10 => state := kta11;
--					
--				
--					
--				when kta11 => state := kta12;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+4, 12)); -- 2422 LSB -- ktarow1-4
--				when kta12 => state := kta13a;
--				when kta13a => state := kta13;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+5, 12)); -- 2422 MSB -- ktarow1-4
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta13 => state := kta14a;
--				when kta14a => state := kta14;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					--------report_error (temp1, 0.0);
--					nibble2 <= temp1 (3 downto 0); -- ktarowA
--				when kta14 => state := kta15;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (0, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktarowB
--				when kta15 => state := kta16;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (1, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktarowC
--				when kta16 => state := kta17;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (2, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktarowD
--				when kta17 => state := kta19;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (3, 10));
--
--
--
--
--				when kta19 => state := kta20;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+6, 12)); -- 2423 LSB -- ktarow5-8
--				when kta20 => state := kta20a;
--				when kta20a => state := kta21;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+7, 12)); -- 2423 MSB -- ktarow5-8
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta21 => state := kta22a;
--				when kta22a => state := kta22;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					--------report_error (temp1, 0.0);
--					nibble2 <= temp1 (3 downto 0); -- ktarowA
--				when kta22 => state := kta23;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (4, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktarowB
--				when kta23 => state := kta24;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (5, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktarowC
--				when kta24 => state := kta25;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (6, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktarowD
--				when kta25 => state := kta27;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (7, 10));
--
--
--				when kta27 => state := kta28;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+8, 12)); -- 2424 LSB -- ktarow9-12
--				when kta28 => state := kta28a;
--				when kta28a => state := kta29;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+9, 12)); -- 2424 MSB -- ktarow9-12
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta29 => state := kta29a;
--				when kta29a => state := kta30;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktarowA
--				when kta30 => state := kta31;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (8, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktarowB
--				when kta31 => state := kta32;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (9, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktarowC
--				when kta32 => state := kta33;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (10, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktarowD
--				when kta33 => state := kta35;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (11, 10));
--
--
--
--				when kta35 => state := kta36;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+10, 12)); -- 2425 LSB -- ktarow13-16
--				when kta36 => state := kta36a;
--				when kta36a => state := kta37;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+11, 12)); -- 2425 MSB -- ktarow13-16
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta37 => state := kta37a;
--				when kta37a => state := kta38;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktarowA
--				when kta38 => state := kta39;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (12, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktarowB
--				when kta39 => state := kta40;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (13, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktarowC
--				when kta40 => state := kta41;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (14, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktarowD
--				when kta41 => state := kta43;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (15, 10));
--
--
--
--				when kta43 => state := kta44;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+12, 12)); -- 2426 LSB -- ktarow17-20
--				when kta44 => state := kta44a;
--				when kta44a => state := kta45;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+13, 12)); -- 2426 MSB -- ktarow17-20
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta45 => state := kta45a;
--				when kta45a => state := kta46;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktarowA
--				when kta46 => state := kta47;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (32, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktarowB
--				when kta47 => state := kta48;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (17, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktarowC
--				when kta48 => state := kta49;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (18, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktarowD
--				when kta49 => state := kta51;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (19, 10));
--
--
--				when kta51 => state := kta52;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+14, 12)); -- 2427 LSB -- ktarow21-24
--				when kta52 => state := kta52a;
--				when kta52a => state := kta53;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+15, 12)); -- 2427 MSB -- ktarow21-24
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta53 => state := kta53a;
--				when kta53a => state := kta54;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktarowA
--				when kta54 => state := kta55;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (20, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktarowB
--				when kta55 => state := kta56;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (21, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktarowC
--				when kta56 => state := kta57;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (22, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktarowD
--				when kta57 => state := kta59;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (23, 10));
--
--
--				when kta59 => state := kta60;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+16, 12)); -- 2428 LSB -- ktacol1-4
--				when kta60 => state := kta60a;
--				when kta60a => state := kta61;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+17, 12)); -- 2428 MSB -- ktacol1-4
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta61 => state := kta61a;
--				when kta61a => state := kta62;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktacolA
--				when kta62 => state := kta63;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (24, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktacolB
--				when kta63 => state := kta64;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (25, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktacolC
--				when kta64 => state := kta65;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (26, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktacolD
--				when kta65 => state := kta67;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (27, 10));
--
--
--				when kta67 => state := kta68;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+18, 12)); -- 2429 LSB -- ktacol5-8
--				when kta68 => state := kta68a;
--				when kta68a => state := kta69;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+19, 12)); -- 2429 MSB -- ktacol5-8
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta69 => state := kta69a;
--				when kta69a => state := kta70;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktacolA
--				when kta70 => state := kta71;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (28, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktacolB
--				when kta71 => state := kta72;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (29, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktacolC
--				when kta72 => state := kta73;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (30, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktacolD
--				when kta73 => state := kta75;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (31, 10));
--
--
--				when kta75 => state := kta76;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+20, 12)); -- 242a LSB -- ktacol9-12
--				when kta76 => state := kta76a;
--				when kta76a => state := kta77;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+21, 12)); -- 242a MSB -- ktacol9-12
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta77 => state := kta77a;
--				when kta77a => state := kta78;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktacolA
--				when kta78 => state := kta79;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (32, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktacolB
--				when kta79 => state := kta80;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (33, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktacolC
--				when kta80 => state := kta81;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (34, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktacolD
--				when kta81 => state := kta83;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (35, 10));
--
--
--				when kta83 => state := kta84;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+22, 12)); -- 242b LSB -- ktacol13-16
--				when kta84 => state := kta84a;
--				when kta84a => state := kta85;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+23, 12)); -- 242b MSB -- ktacol13-16
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta85 => state := kta85a;
--				when kta85a => state := kta86;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktacolA
--				when kta86 => state := kta87;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (36, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktacolB
--				when kta87 => state := kta88;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (37, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktacolC
--				when kta88 => state := kta89;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (38, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktacolD
--				when kta89 => state := kta91;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (39, 10));
--
--
--				when kta91 => state := kta92;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+24, 12)); -- 242c LSB -- ktacol17-20
--				when kta92 => state := kta92a;
--				when kta92a => state := kta93;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+25, 12)); -- 242c MSB -- ktacol17-20
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta93 => state := kta93a;
--				when kta93a => state := kta94;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktacolA
--				when kta94 => state := kta95;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (40, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktacolB
--				when kta95 => state := kta96;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (41, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktacolC
--				when kta96 => state := kta97;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (42, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktacolD
--				when kta97 => state := kta99;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (43, 10));
--
--
--
--				when kta99 => state := kta100;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+26, 12)); -- 242d LSB -- ktacol21-24
--				when kta100 => state := kta100a;
--				when kta100a => state := kta101;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+27, 12)); -- 242d MSB -- ktacol21-24
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta101 => state := kta101a;
--				when kta101a => state := kta102;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktacolA
--				when kta102 => state := kta103;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (44, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktacolB
--				when kta103 => state := kta104;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (45, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktacolC
--				when kta104 => state := kta105;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (46, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktacolD
--				when kta105 => state := kta107;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (47, 10));
--
--
--
--				when kta107 => state := kta108;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+28, 12)); -- 242e LSB -- ktacol25-28
--				when kta108 => state := kta108a;
--				when kta108a => state := kta109;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+29, 12)); -- 242e MSB -- ktacol25-28
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta109 => state := kta109a;
--				when kta109a => state := kta110;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- ktacolA
--				when kta110 => state := kta111;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (48, 10));
--					nibble2 <= temp1 (7 downto 4); -- ktacolB
--				when kta111 => state := kta112;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (49, 10));
--					nibble2 <= temp1 (11 downto 8); -- ktacolC
--				when kta112 => state := kta113;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (50, 10));
--					nibble2 <= temp1 (15 downto 12); -- ktacolD
--				when kta113 => state := kta115;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (51, 10));
--
--
--
--				when kta115 => state := kta116;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+30, 12)); -- 242f LSB -- ktacol29-32
--				when kta116 => state := kta116a;
--				when kta116a => state := kta117;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+31, 12)); -- 242f MSB -- ktacol29-32
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kta117 => state := kta117a;
--				when kta117a => state := kta118;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					--------report_error (temp1, 0.0);
--					nibble2 <= temp1 (3 downto 0); -- ktacolA
--				when kta118 => state := kta119;
--					nibble2 <= temp1 (7 downto 4); -- ktacolB
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (52, 10));
--				when kta119 => state := kta120;
--					nibble2 <= temp1 (11 downto 8); -- ktacolC
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (53, 10));
--				when kta120 => state := kta121;
--					nibble2 <= temp1 (15 downto 12); -- ktacolD
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (54, 10));
--				when kta121 => state := kta122;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (55, 10));
--				when kta122 => state := pow0;
--					write_enable <= '0';
--
--
--				when pow0 => state := pow1;
--					addra <= (others => '0');
--					nibble4 <= vktaRemScale1;
--				when pow1 => state := pow2;
--					nibble4 <= vktaColumnScale1;
--					vktaRemScale := out_nibble4; -- 2^ktascaleremnant
--					--report "vktaRemScale : " & real'image (ap_slv2fp (vktaRemScale));
--				when pow2 => state := pow3;
--					nibble4 <= vktaRowScale1;
--					vktaColumnScale := out_nibble4; -- 2^ktascalecolumn
--					--report "vktaColumnScale : " & real'image (ap_slv2fp (vktaColumnScale));
--				when pow3 => state := pow4;
--					vktaRowScale := out_nibble4; -- 2^ktascalerow
--					--report "vktaRowScale : " & real'image (ap_slv2fp (vktaRowScale));
--					valphaRef_sf := resize (to_sfixed (valphaRef, eeprom16sf), valphaRef_sf);
--					--------report_error (valphaRef, 0.0);
--					fixed2floatce <= '1';
--					fixed2floatond <= '1';
--					fixed2floata <= 
--					to_slv (to_sfixed (to_slv (valphaRef_sf (fracas'high downto fracas'low)), fracas))&
--					to_slv (to_sfixed (to_slv (valphaRef_sf (fracbs'high downto fracbs'low)), fracbs));
--				when pow4 =>
--					if (fixed2floatrdy = '1') then state := pow5;
--						valphaReference_ft := fixed2floatr;
--						--report "valphaReference_ft : " & real'image (ap_slv2fp (valphaReference_ft));
--						fixed2floatce <= '0';
--						fixed2floatond <= '0';
--						fixed2floatsclr <= '1';
--					else state := pow4; end if;
--				when pow5 => state := s0;
--					fixed2floatsclr <= '0';
--	row := 0;
--	col := 0;
--	i := 0;
--when s0 => state := s1; 	--1
--	----report "====================";
--	vAlphaPixel_ft := (others => '0');
--	write_enable <= '0';
--	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i), 12)); -- offset LSB 0
--	addra <= std_logic_vector (to_unsigned (col+C_ROW, 10)); -- ktaColumnJ
--when s1 => state := s1a;	--2
--	i2c_mem_addra <= (others => '0');
--	addra <= (others => '0');
--when s1a => state := s2;	--2
--	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- offset MSB 1
--	addra <= std_logic_vector (to_unsigned (row, 10)); -- ktarowI
--	vktaColumnJ := doa;
----	--report "vktaColumnJ : " & real'image (ap_slv2fp (vktaColumnJ));
--	vAlphaPixel (15 downto 8) := i2c_mem_douta;
--when s2 => state := s2a; 	--3
--	i2c_mem_addra <= (others => '0');
--	addra <= (others => '0');
--when s2a => state := s4; 	--3
--	vktaRowI := doa;
----	--report "vktaRowI : " & real'image (ap_slv2fp (vktaRowI));
--	vAlphaPixel (7 downto 0) := i2c_mem_douta;
----	----report_error (vAlphaPixel, 0.0);
--	nibble3 <= vAlphaPixel (9 downto 4);
--when s4 => state := s5; 	--5
--	mulfpce <= '1';
--	mulfpa <= out_nibble3;
--	mulfpb <= vktaRemScale;
--	mulfpond <= '1';
----	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
----	--report "vktaRemScale : " & real'image (ap_slv2fp (vktaRemScale));
--when s5 => 			--6
--	if (mulfprdy = '1') then state := s6;
--		vAlphaPixel_ft := mulfpr;
--		mulfpce <= '0';
--		mulfpond <= '0';
--		mulfpsclr <= '1';
--	else state := s5; end if;
--when s6 => state := s7; 	--7
--	mulfpsclr <= '0';
--	mulfpce <= '1';
--	mulfpa <= vktaColumnJ;
--	mulfpb <= vktaColumnScale;
--	mulfpond <= '1';
----	--report "vktaColumnJ : " & real'image (ap_slv2fp (vktaColumnJ));
----	--report "vktaColumnScale : " & real'image (ap_slv2fp (vktaColumnScale));
--when s7 => 			--8
--	if (mulfprdy = '1') then state := s8;
--		vktaColumnJ := mulfpr;
--		mulfpce <= '0';
--		mulfpond <= '0';
--		mulfpsclr <= '1';
--	else state := s7; end if;
--when s8 => state := s9; 	--9
--	mulfpsclr <= '0';
--when s9 => state := s10; 	--10
--	mulfpsclr <= '0';
--	mulfpce <= '1';
--	mulfpa <= vktaRowI;
--	mulfpb <= vktaRowScale;
--	mulfpond <= '1';
----	--report "vktaRowI : " & real'image (ap_slv2fp (vktaRowI));
----	--report "vktaRowScale : " & real'image (ap_slv2fp (vktaRowScale));
--when s10 => 			--11
--	if (mulfprdy = '1') then state := s11;
--		vktaRowI := mulfpr;
--		mulfpce <= '0';
--		mulfpond <= '0';
--		mulfpsclr <= '1';
--	else state := s10; end if;
--when s11 => state := s12; 	--12
--	mulfpsclr <= '0';
--when s12 => state := s13; 	--13
--	addfpsclr <= '0';
--	addfpce <= '1';
--	addfpa <= vAlphaPixel_ft;
--	addfpb <= vktaColumnJ;
--	addfpond <= '1';
----	--report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
----	--report "vktaColumnJ : " & real'image (ap_slv2fp (vktaColumnJ));
--when s13 => 			--14
--	if (addfprdy = '1') then state := s14;
--		vAlphaPixel_ft := addfpr;
--		addfpce <= '0';
--		addfpond <= '0';
--		addfpsclr <= '1';
--	else state := s13; end if;
--when s14 => state := s15; 	--15
--	addfpsclr <= '0';
--when s15 => state := s16; 	--16
--	addfpsclr <= '0';
--	addfpce <= '1';
--	addfpa <= vAlphaPixel_ft;
--	addfpb <= vktaRowI;
--	addfpond <= '1';
----	--report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
----	--report "vktaRowI : " & real'image (ap_slv2fp (vktaRowI));
--when s16 => 			--17
--	if (addfprdy = '1') then state := s17;
--		vAlphaPixel_ft := addfpr;
--		addfpce <= '0';
--		addfpond <= '0';
--		addfpsclr <= '1';
--	else state := s16; end if;
--when s17 => state := s18; 	--18
--	addfpsclr <= '0';
--when s18 => state := s19; 	--19
--	addfpsclr <= '0';
--	addfpce <= '1';
--	addfpa <= vAlphaPixel_ft;
--	addfpb <= valphaReference_ft;
--	addfpond <= '1';
----	--report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
----	--report "valphaReference_ft : " & real'image (ap_slv2fp (valphaReference_ft));
--when s19 => 			--20
--	if (addfprdy = '1') then state := s20;
--		vAlphaPixel_ft := addfpr;
--		addfpce <= '0';
--		addfpond <= '0';
--		addfpsclr <= '1';
--	else state := s19; end if;
--when s20 => state := s21; 	--21
--	addfpsclr <= '0';
--	divfpce <= '1';
--	divfpa <= vAlphaPixel_ft;
--	divfpb <= out_nibble5;
--	divfpond <= '1';
----	--report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
----	--report "out_nibble5 : " & real'image (ap_slv2fp (out_nibble5));
--when s21 =>
--	if (divfprdy = '1') then state := s22;
--		vAlphaPixel_ft := divfpr;
--		divfpce <= '0';
--		divfpond <= '0';
--		divfpsclr <= '1';
--	else state := s21; end if;
--when s22 => state := s23;
--	divfpsclr <= '0';
--when s23 => state := s24; 	--22
--	write_enable <= '1';
--	addra <= std_logic_vector (to_unsigned (C_ROW+C_COL+i, 10)); -- vAlphaPixel_ft
--	dia <= vAlphaPixel_ft;
----	--report "================vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	----report_error (vAlphaPixel_ft,0.0);
--	i := i + 1;
--when s24 =>
--	if (col = C_COL-1) then
--		col := 0;
--		state := s25;
--	else
--		col := col + 1;
--		state := s0;
--	end if;
--when s25 =>
--	if (row = C_ROW-1) then
--		row := 0;
--		state := ending;
--	else
--		row := row + 1;
--		state := s0;
--	end if;
--
--				when ending => state := idle;
--					rdy <= '1';
--				when others => null;
--			end case;
----			stemp1 <= temp1;
--		end if;
--	end if;
--end process p0;

inst_mem_kta : mem_ramb16_s36_x2
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
inst_mulfp_kta : mulfp
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
inst_addfp_kta : addfp
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

----INIT_7f => X"41700000 41600000 41500000 41400000 41300000 41200000 41100000 41000000", -- unsigned 0-15 for ktaremscale,ktarowscale,ktacolscale
----INIT_7e => X"40e00000 40c00000 40a00000 40800000 40400000 40000000 3f800000 22000000",
--with nibble1 select out_nibble1 <= -- x - ktaremscale,ktarowscale,ktacolscale unsigned 4bit
--x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
--x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
--x"41000000" when x"8", x"41100000" when x"9", x"41200000" when x"a", x"41300000" when x"b",
--x"41400000" when x"c", x"41500000" when x"d", x"41600000" when x"e", x"41700000" when x"f",
--x"00000000" when others;
--
--with nibble2 select out_nibble2 <= -- >7,-16 - rows1-24,cols1-32 signed 4bit
--x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
--x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
--x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
--x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
--x"00000000" when others;
--
--with nibble3 select out_nibble3 <= -- >31,-64 - alphapixel raw
--x"40e00000" when "000111",x"40c00000" when "000110",x"40a00000" when "000101",x"40800000" when "000100",x"40400000" when "000011",x"40000000" when "000010",x"3f800000" when "000001",x"00000000" when "000000",
--x"41700000" when "001111",x"41600000" when "001110",x"41500000" when "001101",x"41400000" when "001100",x"41300000" when "001011",x"41200000" when "001010",x"41100000" when "001001",x"41000000" when "001000",
--x"41b80000" when "010111",x"41b00000" when "010110",x"41a80000" when "010101",x"41a00000" when "010100",x"41980000" when "010011",x"41900000" when "010010",x"41880000" when "010001",x"41800000" when "010000",
--x"41f80000" when "011111",x"41f00000" when "011110",x"41e80000" when "011101",x"41e00000" when "011100",x"41d80000" when "011011",x"41d00000" when "011010",x"41c80000" when "011001",x"41c00000" when "011000",
--x"c1c80000" when "100111",x"c1d00000" when "100110",x"c1d80000" when "100101",x"c1e00000" when "100100",x"c1e80000" when "100011",x"c1f00000" when "100010",x"c1f80000" when "100001",x"c2000000" when "100000",
--x"c1880000" when "101111",x"c1900000" when "101110",x"c1980000" when "101101",x"c1a00000" when "101100",x"c1a80000" when "101011",x"c1b00000" when "101010",x"c1b80000" when "101001",x"c1c00000" when "101000",
--x"c1100000" when "110111",x"c1200000" when "110110",x"c1300000" when "110101",x"c1400000" when "110100",x"c1500000" when "110011",x"c1600000" when "110010",x"c1700000" when "110001",x"c1800000" when "110000",
--x"bf800000" when "111111",x"c0000000" when "111110",x"c0400000" when "111101",x"c0800000" when "111100",x"c0a00000" when "111011",x"c0c00000" when "111010",x"c0e00000" when "111001",x"c1000000" when "111000",
--x"00000000" when others;
--
----INIT_01 => X"56000000 55800000 55000000 54800000 54000000 53800000 53000000 52800000", -- unsigned 0-15 - 2^(x+30)
----INIT_00 => X"52000000 51800000 51000000 50800000 50000000 4f800000 4f000000 4e800000", 
--with nibble5 select out_nibble5 <= -- 2^(x+30) - 2^alphascale
--x"4e800000" when x"0", x"4f000000" when x"1", x"4f800000" when x"2", x"50000000" when x"3",
--x"50800000" when x"4", x"51000000" when x"5", x"51800000" when x"6", x"52000000" when x"7",
--x"52800000" when x"8", x"53000000" when x"9", x"53800000" when x"a", x"54000000" when x"b",
--x"54800000" when x"c", x"55000000" when x"d", x"55800000" when x"e", x"56000000" when x"f",
--x"00000000" when others;
--
----INIT_01 => X"47000000 46800000 46000000 45800000 45000000 44800000 44000000 43800000",
----INIT_00 => X"43000000 42800000 42000000 41800000 41000000 40800000 40000000 3f800000",
--with nibble4 select out_nibble4 <= -- 2^x unsigned 0-15
--x"3f800000" when x"0", x"40000000" when x"1", x"40800000" when x"2", x"41000000" when x"3",
--x"41800000" when x"4", x"42000000" when x"5", x"42800000" when x"6", x"43000000" when x"7",
--x"43800000" when x"8", x"44000000" when x"9", x"44800000" when x"a", x"45000000" when x"b",
--x"45800000" when x"c", x"46000000" when x"d", x"46800000" when x"e", x"47000000" when x"f",
--x"00000000" when others;

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
inst_divfp_kta : divfp
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

mem_signed256_clock <= i_clock;
mem_signed256_reset <= i_reset;
inst_mem_signed256_ktarcee : mem_signed256 port map (
i_clock => mem_signed256_clock,
i_reset => mem_signed256_reset,
i_value => mem_signed256_ivalue,
o_value => mem_signed256_ovalue
);

end Behavioral;

