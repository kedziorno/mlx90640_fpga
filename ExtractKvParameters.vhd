----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:15 02/07/2023 
-- Design Name: 
-- Module Name:    ExtractKvParameters - Behavioral 
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

entity ExtractKvParameters is
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
end ExtractKvParameters;

architecture Behavioral of ExtractKvParameters is

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

signal kvijee_oo,kvijee_eo,kvijee_oe,kvijee_ee,kvijee : std_logic_vector (3 downto 0);

begin

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else i_addr when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

--INIT_01 => X"47000000 46800000 46000000 45800000 45000000 44800000 44000000 43800000",
--INIT_00 => X"43000000 42800000 42000000 41800000 41000000 40800000 40000000 3f800000",
with nibble1 select out_nibble1 <= -- 2^x unsigned 0-15 - kvscale
x"3f800000" when x"0", x"40000000" when x"1", x"40800000" when x"2", x"41000000" when x"3",
x"41800000" when x"4", x"42000000" when x"5", x"42800000" when x"6", x"43000000" when x"7",
x"43800000" when x"8", x"44000000" when x"9", x"44800000" when x"a", x"45000000" when x"b",
x"45800000" when x"c", x"46000000" when x"d", x"46800000" when x"e", x"47000000" when x"f",
x"00000000" when others;

--INIT_01 => X"bf800000 c0000000 c0400000 c0800000 c0a00000 c0c00000 c0e00000 c1000000",
--INIT_00 => X"40e00000 40c00000 40a00000 40800000 40400000 40000000 3f800000 00000000",
with nibble2 select out_nibble2 <= -- x signed 0-15 - kv(i,j)
x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"00000000" when others;

cole <= '1' when (col mod 2) = 0 else '0' when (col mod 2) = 1; -- column even
rowe <= '1' when (row mod 2) = 0 else '0' when (row mod 2) = 1; -- row even

p1 : process (cole,rowe,kvijee_oo,kvijee_eo,kvijee_oe,kvijee_ee) is
	variable a : std_logic_vector (1 downto 0);
begin
	a := rowe&cole;
case (a) is
	when "00" => kvijee <= kvijee_oo;
	when "10" => kvijee <= kvijee_eo;
	when "01" => kvijee <= kvijee_oe;
	when "11" => kvijee <= kvijee_ee;
	when others => kvijee <= (others => '0');
end case;

end process p1;


p0 : process (i_clock) is

	type states is (idle,
	kv0,kv1,kv2,kv3,kv4,
	kv5,kv6,kv7,kv8,kv9,
	kv10,kv11,kv12,kv13,kv14,
	kv15,kv16,kv17,kv18,kv19,
	kv20,kv21,kv22,kv23,kv24,
	kv25,kv26,kv27,kv28,kv29,
	kv30,kv31,kv32,kv33,kv34,
	kv35,kv36,kv37,kv38,kv39,
	kv40,kv41,kv42,kv43,kv44,
	kv45,kv46,kv47,kv48,kv49,
	kv50,kv51,kv52,kv53,kv54,
	kv55,kv56,kv57,kv58,kv59,
	
	kv60,kv61,kv62,kv63,kv64,
	kv65,kv66,kv67,kv68,kv69,
	kv70,kv71,kv72,kv73,kv74,
	kv75,kv76,kv77,kv78,kv79,
	kv80,kv81,kv82,kv83,kv84,
	kv85,kv86,kv87,kv88,kv89,
	kv90,kv91,kv92,kv93,kv94,
	kv95,kv96,kv97,kv98,kv99,
	kv100,kv101,kv102,kv103,kv104,
	kv105,kv106,kv107,kv108,kv109,
	
	kv110,kv111,kv112,kv113,kv114,
	kv115,kv116,kv117,kv118,kv119,
	kv120,kv121,kv122,kv123,kv124,
	kv0a,kv1a,kv2a,kv3a,kv4a,
kv5a,kv6a,kv7a,kv8a,kv9a,
kv10a,kv11a,kv12a,kv13a,kv14a,
kv15a,kv16a,kv17a,kv18a,kv19a,
kv20a,kv21a,kv22a,kv23a,kv24a,
kv25a,kv26a,kv27a,kv28a,kv29a,
kv30a,kv31a,kv32a,kv33a,kv34a,
kv35a,kv36a,kv37a,kv38a,kv39a,
kv40a,kv41a,kv42a,kv43a,kv44a,
kv45a,kv46a,kv47a,kv48a,kv49a,
kv50a,kv51a,kv52a,kv53a,kv54a,
kv55a,kv56a,kv57a,kv58a,kv59a,
kv60a,kv61a,kv62a,kv63a,kv64a,
kv65a,kv66a,kv67a,kv68a,kv69a,
kv70a,kv71a,kv72a,kv73a,kv74a,
kv75a,kv76a,kv77a,kv78a,kv79a,
kv80a,kv81a,kv82a,kv83a,kv84a,
kv85a,kv86a,kv87a,kv88a,kv89a,
kv90a,kv91a,kv92a,kv93a,kv94a,
kv95a,kv96a,kv97a,kv98a,kv99a,
kv100a,kv101a,kv102a,kv103a,kv104a,
kv105a,kv106a,kv107a,kv108a,kv109a,
kv110a,kv111a,kv112a,kv113a,kv114a,
kv115a,kv116a,kv117a,kv118a,kv119a,
kv120a,kv121a,kv122a,kv123a,kv124a,
	pow0,pow1,pow2,pow3,pow4,pow5,pow6,
	a1,b1,c1,d1,kv9b,kv10b,
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
	variable vkvRemScale : std_logic_vector (31 downto 0);
	variable vkvColumnScale : std_logic_vector (31 downto 0);
	variable vkvRowScale : std_logic_vector (31 downto 0);

	variable vkvRemScale1 : std_logic_vector (3 downto 0);
	variable vkvColumnScale1 : std_logic_vector (3 downto 0);
	variable vkvRowScale1 : std_logic_vector (3 downto 0);

	variable valphaRef1: std_logic_vector (15 downto 0);
	variable valphaRef : std_logic_vector (15 downto 0);
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable vkvcolumnj,kvrowi,vkvrowi,valphaReference_ft,vAlphaPixel_ft,kvijee_ft,kv_ft : std_logic_vector (31 downto 0);
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
						state := kv0;
						i2c_mem_ena <= '1';
						write_enable <= '1';
						ena_mux1 <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
						write_enable <= '0';
						ena_mux1 <= '0';
					end if;
				when kv0 => state := kv1;
					addfpsclr <= '0';
					mulfpsclr <= '0';
					divfpsclr <= '0';
					fixed2floatsclr <= '0';
					rdy <= '0';


				when kv1 => state := kv2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (56*2+0, 12)); -- 2438 MSB - kvscale
				when kv2 => state := kv3;
				when kv3 => state := kv4;
					nibble1 <= i2c_mem_douta (3 downto 0);

				when kv4 => state := kv5;
					i2c_mem_addra <= std_logic_vector (to_unsigned (52*2+0, 12)); -- 2434 LSB - kvijee
				when kv5 => state := kv6;
					i2c_mem_addra <= std_logic_vector (to_unsigned (52*2+1, 12)); -- 2434 MSB - kvijee
				when kv6 => state := kv7;
					kvijee_oo <= i2c_mem_douta (7 downto 4);
					kvijee_eo <= i2c_mem_douta (3 downto 0);
				when kv7 => state := kv8;
					kvijee_oe <= i2c_mem_douta (7 downto 4);
					kvijee_ee <= i2c_mem_douta (3 downto 0);
				when kv8 => state := kv9;
					nibble2 <= kvijee;
					
--					i2c_mem_addra <= std_logic_vector (to_unsigned (54*2+1, 12)); -- 2436 MSB - kvijee_eo
--				
--					i2c_mem_addra <= std_logic_vector (to_unsigned (54*2+2, 12)); -- 2437 LSB - kvijee_oe
--					
--				when kv6 => state := kv7;
--				when kv7 => state := kv8;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (54*2+3, 12)); -- 2437 MSB - kvijee_ee
--					
--				when kv8 => state := kv9;
--				when kv9 => state := kv10;
--					
--				when kv10 => state := kv11;
--					mem_signed256_ivalue <= kvijee;
--				when kv11 => state := kv12;
--				when kv12 => state := kv13;
--					kvijee_ft := mem_signed256_ovalue;
--				when kv13 => state := kv14;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (54*2+5, 12)); -- 2438 LSB - kvscale1/kvscale2				
--				when kv14 => state := kv15;
--				when kv15 => state := kv16;
--					nibble1 <= i2c_mem_douta (7 downto 4); -- kvscale1
--					nibble2 <= i2c_mem_douta (3 downto 0); -- kvscale2
--				
--				when kv16 => state := kv17;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- kv LSB 1
--				when kv17 => state := kv18;
--				when kv18 => state := kv19;
--					nibble3 <= i2c_mem_douta (3 downto 1); -- kv_ee 3bit
--				when kv19 => state := kv20;
--	mulfpce <= '1';
--	mulfpa <= out_nibble3; -- kv_ee
--	mulfpb <= out_nibble2; -- 2^kvscale2
--	mulfpond <= '1';
----	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
----	--report "vkvRemScale : " & real'image (ap_slv2fp (vkvRemScale));
--when kv20 => 			--6
--	if (mulfprdy = '1') then state := kv21;
--		kv_ft := mulfpr;
--		mulfpce <= '0';
--		mulfpond <= '0';
--		mulfpsclr <= '1';
--	else state := kv20; end if;
--when kv21 => state := kv22; 	--7
--	mulfpsclr <= '0';
--
--	addfpce <= '1';
--	addfpa <= kv_ft; -- kv_ee*2^kvscale2
--	addfpb <= kvijee_ft; -- kvijee
--	addfpond <= '1';
----	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
----	--report "vkvRemScale : " & real'image (ap_slv2fp (vkvRemScale));
--when kv22 => 			--6
--	if (addfprdy = '1') then state := kv23;
--		kv_ft := addfpr;
--		addfpce <= '0';
--		addfpond <= '0';
--		addfpsclr <= '1';
--	else state := kv22; end if;
--when kv23 => state := kv24; 	--7
--	addfpsclr <= '0';

when kv9 => state := kv24;
	divfpce <= '1';
	divfpa <= out_nibble2; -- kvij 
	divfpb <= out_nibble1; -- 2^kvscale
	divfpond <= '1';
--	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
--	--report "vkvRemScale : " & real'image (ap_slv2fp (vkvRemScale));
when kv24 => 			--6
	if (divfprdy = '1') then state := kv25;
		kv_ft := divfpr;
		divfpce <= '0';
		divfpond <= '0';
		divfpsclr <= '1';
	else state := kv24; end if;
when kv25 => state := kv26; 	--7
	divfpsclr <= '0';

when kv26 => state := kv27; 	--22
	write_enable <= '1';
	addra <= std_logic_vector (to_unsigned (i, 10)); -- kv
	dia <= kv_ft;
--	report "================kv_ft : " & real'image (ap_slv2fp (kv_ft));
--	report_error (kv_ft,0.0);
when kv27 =>
	i := i + 1;
	write_enable <= '0';
	if (col = C_COL-1) then
		col <= 0;
		state := kv28;
	else
		col <= col + 1;
		state := kv1;
	end if;
when kv28 =>
	write_enable <= '0';
	if (row = C_ROW-1) then
		row <= 0;
		state := ending;
	else
		row <= row + 1;
		state := kv1;
	end if;

				when ending => state := idle;
					rdy <= '1';
				when others => null;
			end case;
--			stemp1 <= temp1;
		end if;
	end if;
end process p0;


--					nibble1 <= temp1 (3 downto 0); -- kv scale remnant
--				when kv5 => state := kv6;
--				
--					vkvRemScale := out_nibble1; -- out kv scale remnant signed
--					vkvRemScale1 := temp1 (3 downto 0); -- kv scale remnant for 2^x
--					
--					nibble1 <= temp1 (7 downto 4); -- kv scale column
--				when kv6 => state := kv7;
--				
--					vkvColumnScale := out_nibble1; -- out kv scale column signed
--					vkvColumnScale1 := temp1 (7 downto 4); -- kv scale column for 2^x
--
--					nibble1 <= temp1 (11 downto 8); -- kv scale row
--					nibble5 <= temp1 (15 downto 12); -- alpha scale
--				when kv7 => state := kv8;
--
--					vkvRowScale := out_nibble1; -- out kv row column signed
--					vkvRowScale1 := temp1 (11 downto 8); -- kv scale row for 2^x
----					vAlphaScale := out_nibble5;

--				when kv8 => state := kv9a;
--					
--				when kv9a => state := kv9;
--				when kv9 => state := kv10a;
--					
--					
--				when kv10a => state := kv10;
--				when kv10 => state := kv11;
--					
--				
--					
--				when kv11 => state := kv12;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+4, 12)); -- 2422 LSB -- kvrow1-4
--				when kv12 => state := kv13a;
--				when kv13a => state := kv13;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+5, 12)); -- 2422 MSB -- kvrow1-4
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv13 => state := kv14a;
--				when kv14a => state := kv14;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					--------report_error (temp1, 0.0);
--					nibble2 <= temp1 (3 downto 0); -- kvrowA
--				when kv14 => state := kv15;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (0, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvrowB
--				when kv15 => state := kv16;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (1, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvrowC
--				when kv16 => state := kv17;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (2, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvrowD
--				when kv17 => state := kv19;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (3, 10));
--
--
--
--
--				when kv19 => state := kv20;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+6, 12)); -- 2423 LSB -- kvrow5-8
--				when kv20 => state := kv20a;
--				when kv20a => state := kv21;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+7, 12)); -- 2423 MSB -- kvrow5-8
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv21 => state := kv22a;
--				when kv22a => state := kv22;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					--------report_error (temp1, 0.0);
--					nibble2 <= temp1 (3 downto 0); -- kvrowA
--				when kv22 => state := kv23;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (4, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvrowB
--				when kv23 => state := kv24;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (5, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvrowC
--				when kv24 => state := kv25;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (6, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvrowD
--				when kv25 => state := kv27;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (7, 10));
--
--
--				when kv27 => state := kv28;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+8, 12)); -- 2424 LSB -- kvrow9-12
--				when kv28 => state := kv28a;
--				when kv28a => state := kv29;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+9, 12)); -- 2424 MSB -- kvrow9-12
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv29 => state := kv29a;
--				when kv29a => state := kv30;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvrowA
--				when kv30 => state := kv31;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (8, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvrowB
--				when kv31 => state := kv32;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (9, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvrowC
--				when kv32 => state := kv33;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (10, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvrowD
--				when kv33 => state := kv35;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (11, 10));
--
--
--
--				when kv35 => state := kv36;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+10, 12)); -- 2425 LSB -- kvrow13-16
--				when kv36 => state := kv36a;
--				when kv36a => state := kv37;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+11, 12)); -- 2425 MSB -- kvrow13-16
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv37 => state := kv37a;
--				when kv37a => state := kv38;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvrowA
--				when kv38 => state := kv39;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (12, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvrowB
--				when kv39 => state := kv40;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (13, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvrowC
--				when kv40 => state := kv41;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (14, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvrowD
--				when kv41 => state := kv43;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (15, 10));
--
--
--
--				when kv43 => state := kv44;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+12, 12)); -- 2426 LSB -- kvrow17-20
--				when kv44 => state := kv44a;
--				when kv44a => state := kv45;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+13, 12)); -- 2426 MSB -- kvrow17-20
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv45 => state := kv45a;
--				when kv45a => state := kv46;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvrowA
--				when kv46 => state := kv47;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (32, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvrowB
--				when kv47 => state := kv48;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (17, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvrowC
--				when kv48 => state := kv49;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (18, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvrowD
--				when kv49 => state := kv51;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (19, 10));
--
--
--				when kv51 => state := kv52;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+14, 12)); -- 2427 LSB -- kvrow21-24
--				when kv52 => state := kv52a;
--				when kv52a => state := kv53;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+15, 12)); -- 2427 MSB -- kvrow21-24
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv53 => state := kv53a;
--				when kv53a => state := kv54;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvrowA
--				when kv54 => state := kv55;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (20, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvrowB
--				when kv55 => state := kv56;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (21, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvrowC
--				when kv56 => state := kv57;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (22, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvrowD
--				when kv57 => state := kv59;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (23, 10));
--
--
--				when kv59 => state := kv60;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+16, 12)); -- 2428 LSB -- kvcol1-4
--				when kv60 => state := kv60a;
--				when kv60a => state := kv61;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+17, 12)); -- 2428 MSB -- kvcol1-4
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv61 => state := kv61a;
--				when kv61a => state := kv62;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvcolA
--				when kv62 => state := kv63;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (24, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvcolB
--				when kv63 => state := kv64;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (25, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvcolC
--				when kv64 => state := kv65;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (26, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvcolD
--				when kv65 => state := kv67;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (27, 10));
--
--
--				when kv67 => state := kv68;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+18, 12)); -- 2429 LSB -- kvcol5-8
--				when kv68 => state := kv68a;
--				when kv68a => state := kv69;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+19, 12)); -- 2429 MSB -- kvcol5-8
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv69 => state := kv69a;
--				when kv69a => state := kv70;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvcolA
--				when kv70 => state := kv71;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (28, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvcolB
--				when kv71 => state := kv72;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (29, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvcolC
--				when kv72 => state := kv73;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (30, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvcolD
--				when kv73 => state := kv75;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (31, 10));
--
--
--				when kv75 => state := kv76;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+20, 12)); -- 242a LSB -- kvcol9-12
--				when kv76 => state := kv76a;
--				when kv76a => state := kv77;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+21, 12)); -- 242a MSB -- kvcol9-12
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv77 => state := kv77a;
--				when kv77a => state := kv78;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvcolA
--				when kv78 => state := kv79;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (32, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvcolB
--				when kv79 => state := kv80;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (33, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvcolC
--				when kv80 => state := kv81;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (34, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvcolD
--				when kv81 => state := kv83;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (35, 10));
--
--
--				when kv83 => state := kv84;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+22, 12)); -- 242b LSB -- kvcol13-16
--				when kv84 => state := kv84a;
--				when kv84a => state := kv85;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+23, 12)); -- 242b MSB -- kvcol13-16
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv85 => state := kv85a;
--				when kv85a => state := kv86;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvcolA
--				when kv86 => state := kv87;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (36, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvcolB
--				when kv87 => state := kv88;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (37, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvcolC
--				when kv88 => state := kv89;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (38, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvcolD
--				when kv89 => state := kv91;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (39, 10));
--
--
--				when kv91 => state := kv92;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+24, 12)); -- 242c LSB -- kvcol17-20
--				when kv92 => state := kv92a;
--				when kv92a => state := kv93;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+25, 12)); -- 242c MSB -- kvcol17-20
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv93 => state := kv93a;
--				when kv93a => state := kv94;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvcolA
--				when kv94 => state := kv95;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (40, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvcolB
--				when kv95 => state := kv96;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (41, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvcolC
--				when kv96 => state := kv97;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (42, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvcolD
--				when kv97 => state := kv99;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (43, 10));
--
--
--
--				when kv99 => state := kv100;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+26, 12)); -- 242d LSB -- kvcol21-24
--				when kv100 => state := kv100a;
--				when kv100a => state := kv101;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+27, 12)); -- 242d MSB -- kvcol21-24
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv101 => state := kv101a;
--				when kv101a => state := kv102;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvcolA
--				when kv102 => state := kv103;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (44, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvcolB
--				when kv103 => state := kv104;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (45, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvcolC
--				when kv104 => state := kv105;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (46, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvcolD
--				when kv105 => state := kv107;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (47, 10));
--
--
--
--				when kv107 => state := kv108;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+28, 12)); -- 242e LSB -- kvcol25-28
--				when kv108 => state := kv108a;
--				when kv108a => state := kv109;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+29, 12)); -- 242e MSB -- kvcol25-28
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv109 => state := kv109a;
--				when kv109a => state := kv110;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					nibble2 <= temp1 (3 downto 0); -- kvcolA
--				when kv110 => state := kv111;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (48, 10));
--					nibble2 <= temp1 (7 downto 4); -- kvcolB
--				when kv111 => state := kv112;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (49, 10));
--					nibble2 <= temp1 (11 downto 8); -- kvcolC
--				when kv112 => state := kv113;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (50, 10));
--					nibble2 <= temp1 (15 downto 12); -- kvcolD
--				when kv113 => state := kv115;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (51, 10));
--
--
--
--				when kv115 => state := kv116;
----					addra <= (others => '0');
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+30, 12)); -- 242f LSB -- kvcol29-32
--				when kv116 => state := kv116a;
--				when kv116a => state := kv117;
--					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+31, 12)); -- 242f MSB -- kvcol29-32
--					temp1 (15 downto 8) := i2c_mem_douta;
--				when kv117 => state := kv117a;
--				when kv117a => state := kv118;
--					temp1 (7 downto 0) := i2c_mem_douta;
--					--------report_error (temp1, 0.0);
--					nibble2 <= temp1 (3 downto 0); -- kvcolA
--				when kv118 => state := kv119;
--					nibble2 <= temp1 (7 downto 4); -- kvcolB
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (52, 10));
--				when kv119 => state := kv120;
--					nibble2 <= temp1 (11 downto 8); -- kvcolC
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (53, 10));
--				when kv120 => state := kv121;
--					nibble2 <= temp1 (15 downto 12); -- kvcolD
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (54, 10));
--				when kv121 => state := kv122;
--					dia <= out_nibble2;
--					addra <= std_logic_vector (to_unsigned (55, 10));
--				when kv122 => state := pow0;
--					write_enable <= '0';
--
--
--				when pow0 => state := pow1;
--					addra <= (others => '0');
--					nibble4 <= vkvRemScale1;
--				when pow1 => state := pow2;
--					nibble4 <= vkvColumnScale1;
--					vkvRemScale := out_nibble4; -- 2^kvscaleremnant
--					--report "vkvRemScale : " & real'image (ap_slv2fp (vkvRemScale));
--				when pow2 => state := pow3;
--					nibble4 <= vkvRowScale1;
--					vkvColumnScale := out_nibble4; -- 2^kvscalecolumn
--					--report "vkvColumnScale : " & real'image (ap_slv2fp (vkvColumnScale));
--				when pow3 => state := pow4;
--					vkvRowScale := out_nibble4; -- 2^kvscalerow
--					--report "vkvRowScale : " & real'image (ap_slv2fp (vkvRowScale));
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
--	addra <= std_logic_vector (to_unsigned (col+C_ROW, 10)); -- kvColumnJ
--when s1 => state := s1a;	--2
--	i2c_mem_addra <= (others => '0');
--	addra <= (others => '0');
--when s1a => state := s2;	--2
--	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- offset MSB 1
--	addra <= std_logic_vector (to_unsigned (row, 10)); -- kvrowI
--	vkvColumnJ := doa;
----	--report "vkvColumnJ : " & real'image (ap_slv2fp (vkvColumnJ));
--	vAlphaPixel (15 downto 8) := i2c_mem_douta;
--when s2 => state := s2a; 	--3
--	i2c_mem_addra <= (others => '0');
--	addra <= (others => '0');
--when s2a => state := s4; 	--3
--	vkvRowI := doa;
----	--report "vkvRowI : " & real'image (ap_slv2fp (vkvRowI));
--	vAlphaPixel (7 downto 0) := i2c_mem_douta;
----	----report_error (vAlphaPixel, 0.0);
--	nibble3 <= vAlphaPixel (9 downto 4);
--when s4 => state := s5; 	--5
--	mulfpce <= '1';
--	mulfpa <= out_nibble3;
--	mulfpb <= vkvRemScale;
--	mulfpond <= '1';
----	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
----	--report "vkvRemScale : " & real'image (ap_slv2fp (vkvRemScale));
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
--	mulfpa <= vkvColumnJ;
--	mulfpb <= vkvColumnScale;
--	mulfpond <= '1';
----	--report "vkvColumnJ : " & real'image (ap_slv2fp (vkvColumnJ));
----	--report "vkvColumnScale : " & real'image (ap_slv2fp (vkvColumnScale));
--when s7 => 			--8
--	if (mulfprdy = '1') then state := s8;
--		vkvColumnJ := mulfpr;
--		mulfpce <= '0';
--		mulfpond <= '0';
--		mulfpsclr <= '1';
--	else state := s7; end if;
--when s8 => state := s9; 	--9
--	mulfpsclr <= '0';
--when s9 => state := s10; 	--10
--	mulfpsclr <= '0';
--	mulfpce <= '1';
--	mulfpa <= vkvRowI;
--	mulfpb <= vkvRowScale;
--	mulfpond <= '1';
----	--report "vkvRowI : " & real'image (ap_slv2fp (vkvRowI));
----	--report "vkvRowScale : " & real'image (ap_slv2fp (vkvRowScale));
--when s10 => 			--11
--	if (mulfprdy = '1') then state := s11;
--		vkvRowI := mulfpr;
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
--	addfpb <= vkvColumnJ;
--	addfpond <= '1';
----	--report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
----	--report "vkvColumnJ : " & real'image (ap_slv2fp (vkvColumnJ));
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
--	addfpb <= vkvRowI;
--	addfpond <= '1';
----	--report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
----	--report "vkvRowI : " & real'image (ap_slv2fp (vkvRowI));
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

inst_mem_kv : mem_ramb16_s36_x2
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
inst_mulfp_kv : mulfp
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
inst_addfp_kv : addfp
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

----INIT_7f => X"41700000 41600000 41500000 41400000 41300000 41200000 41100000 41000000", -- unsigned 0-15 for kvremscale,kvrowscale,kvcolscale
----INIT_7e => X"40e00000 40c00000 40a00000 40800000 40400000 40000000 3f800000 22000000",
--with nibble1 select out_nibble1 <= -- x - kvremscale,kvrowscale,kvcolscale unsigned 4bit
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
inst_divfp_kv : divfp
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
inst_mem_signed256_kvijee : mem_signed256 port map (
i_clock => mem_signed256_clock,
i_reset => mem_signed256_reset,
i_value => mem_signed256_ivalue,
o_value => mem_signed256_ovalue
);

end Behavioral;

