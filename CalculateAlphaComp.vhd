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

entity CalculateAlphaComp is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_acpsubpage0 : in std_logic_vector (31 downto 0);
i_acpsubpage1 : in std_logic_vector (31 downto 0);
i_const1 : in std_logic_vector (31 downto 0);

i_alpha_do : in std_logic_vector (31 downto 0);
o_alpha_addr : out std_logic_vector (9 downto 0); -- 10bit-1024

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic
);
end CalculateAlphaComp;

architecture Behavioral of CalculateAlphaComp is

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

COMPONENT mem_switchpattern
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_pixel : IN  std_logic_vector(13 downto 0);
o_pattern : OUT  std_logic
);
END COMPONENT;

signal mem_switchpattern_clock : std_logic;
signal mem_switchpattern_reset : std_logic;
signal mem_switchpattern_pixel : std_logic_vector(13 downto 0);
signal mem_switchpattern_pattern : std_logic;

component ExtractTGCParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_tgc : out std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
end component ExtractTGCParameters;

signal ExtractTGCParameters_clock : std_logic;
signal ExtractTGCParameters_reset : std_logic;
signal ExtractTGCParameters_run : std_logic;
signal ExtractTGCParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractTGCParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractTGCParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractTGCParameters_tgc : std_logic_vector (31 downto 0);
signal ExtractTGCParameters_rdy : std_logic;

COMPONENT ExtractKsTaParameters
PORT(
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_ksta : out std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
END COMPONENT;

signal ExtractKsTaParameters_clock : std_logic;
signal ExtractKsTaParameters_reset : std_logic;
signal ExtractKsTaParameters_run : std_logic;
signal ExtractKsTaParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractKsTaParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKsTaParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKsTaParameters_ksta : std_logic_vector (31 downto 0);
signal ExtractKsTaParameters_rdy : std_logic;

signal ExtractTGCParameters_mux,ExtractKsTaParameters_mux : std_logic;

signal addra,mux_addr : std_logic_vector (9 downto 0);
signal doa,dia,mux_dia : std_logic_vector (31 downto 0);

signal rdy,write_enable : std_logic;

signal pattern_ft,pattern_neg_ft : std_logic_vector (31 downto 0);

begin

o_rdy <= rdy;

i2c_mem_ena <=
ExtractTGCParameters_i2c_mem_ena when ExtractTGCParameters_mux = '1'
else
ExtractKsTaParameters_i2c_mem_ena when ExtractKsTaParameters_mux = '1'
else '0';

i2c_mem_addra <=
ExtractTGCParameters_i2c_mem_addra when ExtractTGCParameters_mux = '1'
else
ExtractKsTaParameters_i2c_mem_addra when ExtractKsTaParameters_mux = '1'
else (others => '0');

ExtractTGCParameters_i2c_mem_douta <= i2c_mem_douta;
ExtractKsTaParameters_i2c_mem_douta <= i2c_mem_douta;

with mem_switchpattern_pattern select pattern_ft <=
x"3f800000" when '1',
x"00000000" when others;

with mem_switchpattern_pattern select pattern_neg_ft <=
x"00000000" when '1',
x"3f800000" when others;

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else i_addr when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,
	s31,
	ending);
	variable state : states;
	variable fptmp1,fptmp2,fptmp3 : std_logic_vector (31 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			addfpsclr <= '1';
			subfpsclr <= '1';
			mulfpsclr <= '1';
			rdy <= '0';
			mulfpa <= (others => '0');
			mulfpb <= (others => '0');
			addfpa <= (others => '0');
			addfpb <= (others => '0');
			subfpa <= (others => '0');
			subfpb <= (others => '0');
			mulfpond <= '0';
			addfpond <= '0';
			subfpond <= '0';
			mulfpce <= '0';
			addfpce <= '0';
			subfpce <= '0';
			write_enable <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
					else
						state := idle;
					end if;
					i := 0;
					addfpsclr <= '0';
					subfpsclr <= '0';
					mulfpsclr <= '0';
				when s1 => state := s2;
					ExtractTGCParameters_run <= '1';
					ExtractTGCParameters_mux <= '1';
				when s2 => 
					ExtractTGCParameters_run <= '0';
					if (ExtractTGCParameters_rdy = '1') then
						state := s3;
						ExtractTGCParameters_mux <= '0';
					else
						state := s2;
						ExtractTGCParameters_mux <= '1';
					end if;
				when s3 => state := s4;
					ExtractKsTaParameters_run <= '1';
					ExtractKsTaParameters_mux <= '1';
				when s4 => 
					ExtractKsTaParameters_run <= '0';
					if (ExtractKsTaParameters_rdy = '1') then
						state := s5;
						ExtractKsTaParameters_mux <= '0';
					else
						state := s4;
						ExtractKsTaParameters_mux <= '1';
					end if;
				when s5 => state := s6;
					subfpce <= '1';
					subfpa <= i_Ta;
					subfpb <= i_Ta0;
					subfpond <= '1';
				when s6 =>
					if (subfprdy = '1') then state := s7;
						fptmp1 := subfpr;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else state := s6; end if;
				when s7 => state := s8;
					subfpsclr <= '0';

					mulfpce <= '1';
					mulfpa <= fptmp1;
					mulfpb <= ExtractKsTaParameters_ksta;
					mulfpond <= '1';
				when s8 =>
					if (mulfprdy = '1') then state := s9;
						fptmp1 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s8; end if;
				when s9 => state := s10;
					mulfpsclr <= '0';

					addfpce <= '1';
					addfpa <= fptmp1;
					addfpb <= i_const1;
					addfpond <= '1';
				when s10 =>
					if (addfprdy = '1') then state := s11;
						fptmp3 := addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s10; end if;
				when s11 => state := s12;
					addfpsclr <= '0';

				when s12 => state := s13;
					o_alpha_addr <= std_logic_vector (to_unsigned (i, 10));
					mem_switchpattern_pixel <= std_logic_vector (to_unsigned (i, 14));
				when s13 => state := s14;
				when s14 => state := s15;
					
					mulfpce <= '1';
					mulfpa <= pattern_ft;
					mulfpb <= i_acpsubpage1;
					mulfpond <= '1';
				when s15 =>
					if (mulfprdy = '1') then state := s16;
						fptmp1 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s15; end if;
				when s16 => state := s17;
					mulfpsclr <= '0';

					mulfpce <= '1';
					mulfpa <= pattern_neg_ft;
					mulfpb <= i_acpsubpage0;
					mulfpond <= '1';
				when s17 =>
					if (mulfprdy = '1') then state := s18;
						fptmp2 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s17; end if;
				when s18 => state := s19;
					mulfpsclr <= '0';

				when s19 => state := s20;
					addfpce <= '1';
					addfpa <= fptmp1;
					addfpb <= fptmp2;
					addfpond <= '1';
				when s20 =>
					if (addfprdy = '1') then state := s21;
						fptmp1 := addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s20; end if;
				when s21 => state := s22;
					addfpsclr <= '0';

				when s22 => state := s23;
					mulfpce <= '1';
					mulfpa <= ExtractTGCParameters_tgc;
					mulfpb <= fptmp1;
					mulfpond <= '1';
				when s23 =>
					if (mulfprdy = '1') then state := s24;
						fptmp1 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s23; end if;
				when s24 => state := s25;
					mulfpsclr <= '0';

				when s25 => state := s26;
					subfpce <= '1';
					subfpa <= i_alpha_do;
					subfpb <= fptmp1;
					subfpond <= '1';
				when s26 =>
					if (subfprdy = '1') then state := s27;
						fptmp1 := subfpr;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else state := s26; end if;
				when s27 => state := s28;
					subfpsclr <= '0';

				when s28 => state := s29;
					mulfpce <= '1';
					mulfpa <= fptmp1;
					mulfpb <= fptmp3;
					mulfpond <= '1';
				when s29 =>
					if (mulfprdy = '1') then state := s30;
						fptmp1 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s29; end if;
				when s30 => state := s31;
					mulfpsclr <= '0';
					write_enable <= '1';
					addra <= std_logic_vector (to_unsigned (i, 10)); -- alphacomp
					dia <= fptmp1;
					--report "================alphacomp : " & real'image (ap_slv2fp (fptmp1));
				when s31 =>
					write_enable <= '0';
					if (i = (C_ROW*C_COL)-1) then
						state := ending;
						i := 0;
					else
						state := s12;
						i := i + 1;
					end if;

				when ending => state := idle;
					rdy <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

ExtractTGCParameters_clock <= i_clock;
ExtractTGCParameters_reset <= i_reset;
inst_ExtractTGCParameters : ExtractTGCParameters port map (
i_clock => ExtractTGCParameters_clock,
i_reset => ExtractTGCParameters_reset,
i_run => ExtractTGCParameters_run,
i2c_mem_ena => ExtractTGCParameters_i2c_mem_ena,
i2c_mem_addra => ExtractTGCParameters_i2c_mem_addra,
i2c_mem_douta => ExtractTGCParameters_i2c_mem_douta,
o_tgc => ExtractTGCParameters_tgc,
o_rdy => ExtractTGCParameters_rdy
);

ExtractKsTaParameters_clock <= i_clock;
ExtractKsTaParameters_reset <= i_reset;
inst_ExtractKsTaParameters : ExtractKsTaParameters PORT MAP (
i_clock => ExtractKsTaParameters_clock,
i_reset => ExtractKsTaParameters_reset,
i_run => ExtractKsTaParameters_run,
i2c_mem_ena => ExtractKsTaParameters_i2c_mem_ena,
i2c_mem_addra => ExtractKsTaParameters_i2c_mem_addra,
i2c_mem_douta => ExtractKsTaParameters_i2c_mem_douta,
o_ksta => ExtractKsTaParameters_ksta,
o_rdy => ExtractKsTaParameters_rdy
);

mulfpclk <= i_clock;
inst_mulfp : mulfp
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
inst_addfp : addfp
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
inst_subfp : subfp
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

mem_switchpattern_clock <= i_clock;
mem_switchpattern_reset <= i_reset;
inst_mem_switchpattern : mem_switchpattern PORT MAP (
i_clock => mem_switchpattern_clock,
i_reset => mem_switchpattern_reset,
i_pixel => mem_switchpattern_pixel,
o_pattern => mem_switchpattern_pattern
);

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

end Behavioral;

