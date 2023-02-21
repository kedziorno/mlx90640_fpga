----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:58 02/19/2023 
-- Design Name: 
-- Module Name:    CalculateTo - Behavioral 
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

entity CalculateTo is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_Ta : IN  std_logic_vector(31 downto 0);

i_vircompensated_do : IN  std_logic_vector(31 downto 0);
o_vircompensated_addr : OUT  std_logic_vector(9 downto 0);

i_alphacomp_do : IN  std_logic_vector(31 downto 0);
o_alphacomp_addr : OUT  std_logic_vector(9 downto 0);

o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);

o_rdy : out std_logic
);
end CalculateTo;

architecture Behavioral of CalculateTo is

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

COMPONENT sqrtfp2
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : STD_LOGIC;
signal sqrtfp2clk : STD_LOGIC;
signal sqrtfp2sclr : STD_LOGIC;
signal sqrtfp2ce : STD_LOGIC;
signal sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : STD_LOGIC;

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

COMPONENT ExtractKsToScaleParameter
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_kstoscale : OUT  std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
END COMPONENT;
signal ExtractKsToScaleParameter_clock : std_logic;
signal ExtractKsToScaleParameter_reset : std_logic;
signal ExtractKsToScaleParameter_run : std_logic;
signal ExtractKsToScaleParameter_i2c_mem_ena : STD_LOGIC;
signal ExtractKsToScaleParameter_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKsToScaleParameter_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKsToScaleParameter_kstoscale : std_logic_vector (31 downto 0);
signal ExtractKsToScaleParameter_rdy : std_logic;

signal ExtractKsToScaleParameter_mux : std_logic;

signal addra,mux_addr : std_logic_vector (9 downto 0);
signal doa,dia,mux_dia : std_logic_vector (31 downto 0);

signal rdy,write_enable : std_logic;

signal i2c_mem_ena_internal : STD_LOGIC;
signal i2c_mem_addra_internal : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta_internal : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

i2c_mem_ena <= ExtractKsToScaleParameter_i2c_mem_ena when ExtractKsToScaleParameter_mux = '1'
else i2c_mem_ena_internal;

i2c_mem_addra <= ExtractKsToScaleParameter_i2c_mem_addra when ExtractKsToScaleParameter_mux = '1'
else i2c_mem_addra_internal;

ExtractKsToScaleParameter_i2c_mem_douta <= i2c_mem_douta when ExtractKsToScaleParameter_mux = '1'
else (others => '0');

i2c_mem_douta_internal <= i2c_mem_douta;

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else i_addr when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	constant constTr : std_logic_vector (31 downto 0) := x"41000000"; -- 8
	constant const27315 : std_logic_vector (31 downto 0) := x"43889333"; -- 273.15
	constant constEmissivity : std_logic_vector (31 downto 0) := x"3f800000"; -- 1
	constant const1 : std_logic_vector (31 downto 0) := x"3f800000"; -- 1
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s10a,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,
	s31,s32,s33,s34,s35,s36,s37,s38,s39,s40,
	s41,s42,s43,s44,s45,s46,s47,s48,s49,s50,
	s51,s52,s53,s54,s55,s56,s57,s58,s59,s60,
	s61,s62,s63,s64,s65,s66,s67,s68,s69,s70,
	s71,
	ending);
	variable state : states;
	variable fttmp1,fttmp2,ksto2,tak4,trk4,tar,sx,acomp_pow3,acomp_pow4,tr : std_logic_vector (31 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			i := 0;
			i2c_mem_ena_internal <= '0';
			rdy <= '0';
			addfpsclr <= '1';
			subfpsclr <= '1';
			mulfpsclr <= '1';
			divfpsclr <= '1';
			sqrtfp2sclr <= '1';
			rdy <= '0';
			mulfpa <= (others => '0');
			mulfpb <= (others => '0');
			addfpa <= (others => '0');
			addfpb <= (others => '0');
			subfpa <= (others => '0');
			subfpb <= (others => '0');
			divfpa <= (others => '0');
			divfpb <= (others => '0');
			sqrtfp2a <= (others => '0');
			mulfpond <= '0';
			addfpond <= '0';
			subfpond <= '0';
			divfpond <= '0';
			sqrtfp2ond <= '0';
			mulfpce <= '0';
			addfpce <= '0';
			subfpce <= '0';
			divfpce <= '0';
			sqrtfp2ce <= '0';
			o_vircompensated_addr <= (others => '0');
			o_alphacomp_addr <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
						i2c_mem_ena_internal <= '1';
					else
						state := idle;
						i2c_mem_ena_internal <= '0';
					end if;
					i := 0;
					addfpsclr <= '0';
					subfpsclr <= '0';
					mulfpsclr <= '0';
					divfpsclr <= '0';
					sqrtfp2sclr <= '0';
				when s1 => state := s2;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (61*2+0, 12)); -- ee243d MSB ksto2ee 0xff00
				when s2 => state := s3;
				when s3 => state := s4;
					mem_signed256_ivalue <= i2c_mem_douta_internal; -- ksto2ee

	when s4 => state := s5;
		ExtractKsToScaleParameter_run <= '1';
		ExtractKsToScaleParameter_mux <= '1';
	when s5 => 
		ExtractKsToScaleParameter_run <= '0';
		if (ExtractKsToScaleParameter_rdy = '1') then
			state := s6;
			ExtractKsToScaleParameter_mux <= '0';
		else
			state := s5;
			ExtractKsToScaleParameter_mux <= '1';
		end if;

	when s6 => state := s7;
		divfpce <= '1';
		divfpa <= mem_signed256_ovalue;
		divfpb <= ExtractKsToScaleParameter_kstoscale;
		divfpond <= '1';
	when s7 =>
		if (divfprdy = '1') then state := s8;
			ksto2 := divfpr;
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s7; end if;
	when s8 => state := s9;
		divfpsclr <= '0';
		report "================ To ksto2 : " & real'image (ap_slv2fp (ksto2));

		subfpce <= '1';
		subfpa <= i_Ta;
		subfpb <= constTr;
		subfpond <= '1';
	when s9 =>
		if (subfprdy = '1') then state := s10;
			Tr := subfpr; -- Tr~=Ta-8
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s9; end if;
	when s10 => state := s10a;
		subfpsclr <= '0';

		addfpce <= '1';
		addfpa <= i_Ta;
		addfpb <= const27315;
		addfpond <= '1';
	when s10a =>
		if (addfprdy = '1') then state := s11;
			fttmp1 := addfpr; -- Ta + 273.15
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s10; end if;
	when s11 => state := s12;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s12 =>
		if (mulfprdy = '1') then state := s13;
			fttmp2 := mulfpr; -- (Ta + 273.15)^2
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s12; end if;
	when s13 => state := s14;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp2;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s14 =>
		if (mulfprdy = '1') then state := s15;
			fttmp2 := mulfpr; -- (Ta + 273.15)^3
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s14; end if;
	when s15 => state := s16;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp2;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s16 =>
		if (mulfprdy = '1') then state := s17;
			tak4 := mulfpr; -- TaK4=(Ta + 273.15)^4
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s16; end if;
	when s17 => state := s18;
		mulfpsclr <= '0';

		addfpce <= '1';
		addfpa <= Tr;
		addfpb <= const27315;
		addfpond <= '1';
	when s18 =>
		if (addfprdy = '1') then state := s19;
			fttmp1 := addfpr; -- Tr + 273.15
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s18; end if;
	when s19 => state := s20;
		addfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s20 =>
		if (mulfprdy = '1') then state := s21;
			fttmp2 := mulfpr; -- (Tr + 273.15)^2
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s20; end if;
	when s21 => state := s22;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp2;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s22 =>
		if (mulfprdy = '1') then state := s23;
			fttmp2 := mulfpr; -- (Tr + 273.15)^3
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s22; end if;
	when s23 => state := s24;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp2;
		mulfpb <= fttmp1;
		mulfpond <= '1';
	when s24 =>
		if (mulfprdy = '1') then state := s25;
			trk4 := mulfpr; -- TrK4=(Tr + 273.15)^4
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s24; end if;
	when s25 => state := s26;
		mulfpsclr <= '0';

		subfpce <= '1';
		subfpa <= trk4;
		subfpb <= tak4;
		subfpond <= '1';
	when s26 =>
		if (subfprdy = '1') then state := s27;
			fttmp1 := subfpr; -- TrK4-TaK4
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s26; end if;
	when s27 => state := s28;
		subfpsclr <= '0';

		divfpce <= '1';
		divfpa <= fttmp1; -- TrK4-TaK4
		divfpb <= constEmissivity; -- Emissivity
		divfpond <= '1';
	when s28 =>
		if (divfprdy = '1') then state := s29;
			fttmp1 := divfpr; -- (TrK4-TaK4)/Emissivity
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s28; end if;
	when s29 => state := s30;
		divfpsclr <= '0';

		subfpce <= '1';
		subfpa <= trk4;
		subfpb <= fttmp1;
		subfpond <= '1';
	when s30 =>
		if (subfprdy = '1') then state := s31;
			tar := subfpr; -- TrK4-((TrK4-TaK4)/Emissivity)
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s30; end if;
	when s31 => state := s32;
		subfpsclr <= '0';
	when s32 => state := s33;
		o_vircompensated_addr <= std_logic_vector (to_unsigned (i, 10));
		o_alphacomp_addr <= std_logic_vector (to_unsigned (i, 10));
	when s33 => state := s34;
	when s34 => state := s35;
		mulfpa <= i_alphacomp_do;
		mulfpb <= i_alphacomp_do;
		mulfpce <= '1';
		mulfpond <= '1';
	when s35 =>
		if (mulfprdy = '1') then state := s36;
			fttmp1 := mulfpr; -- alphacomp^2
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s35; end if;
	when s36 => state := s37;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= fttmp1;
		mulfpb <= i_alphacomp_do;
		mulfpond <= '1';
	when s37 =>
		if (mulfprdy = '1') then state := s38;
			acomp_pow3 := mulfpr; -- alphacomp^3
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s37; end if;
	when s38 => state := s39;
		mulfpsclr <= '0';
		mulfpce <= '1';
		mulfpa <= acomp_pow3;
		mulfpb <= i_alphacomp_do;
		mulfpond <= '1';
	when s39 =>
		if (mulfprdy = '1') then state := s40;
			acomp_pow4 := mulfpr; -- alphacomp^4
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s39; end if;
	when s40 => state := s41;
		mulfpsclr <= '0';

		mulfpce <= '1';
		mulfpa <= acomp_pow3;
		mulfpb <= i_vircompensated_do;
		mulfpond <= '1';
	when s41 =>
		if (mulfprdy = '1') then state := s42;
			fttmp1 := mulfpr; -- alphacomp^3*vircompensated
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s41; end if;
	when s42 => state := s43;
		mulfpsclr <= '0';

		mulfpce <= '1';
		mulfpa <= acomp_pow4;
		mulfpb <= tar;
		mulfpond <= '1';
	when s43 =>
		if (mulfprdy = '1') then state := s44;
			fttmp2 := mulfpr; -- alphacomp^4*Tar
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s43; end if;
	when s44 => state := s45;
		mulfpsclr <= '0';

		addfpce <= '1';
		addfpa <= fttmp1; -- alphacomp^3*vircompensated 
		addfpb <= fttmp2; -- alphacomp^4*Tar
		addfpond <= '1';
	when s45 =>
		if (addfprdy = '1') then state := s46;
			fttmp1 := addfpr; -- (alphacomp^3*vircompensated)+(alphacomp^4*Tar)
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s45; end if;
	when s46 => state := s47;
		addfpsclr <= '0';

		sqrtfp2ce <= '1';
		sqrtfp2a <= fttmp1;
		sqrtfp2ond <= '1';
	when s47 =>
		if (sqrtfp2rdy = '1') then state := s48;
			fttmp1 := sqrtfp2r; -- sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar))
			sqrtfp2ce <= '0';
			sqrtfp2ond <= '0';
			sqrtfp2sclr <= '1';
		else state := s47; end if;
	when s48 => state := s49;
		sqrtfp2sclr <= '0';

		sqrtfp2ce <= '1';
		sqrtfp2a <= fttmp1;
		sqrtfp2ond <= '1';
	when s49 =>
		if (sqrtfp2rdy = '1') then state := s50;
			sx := sqrtfp2r; -- sqrt2(sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar)))
			sqrtfp2ce <= '0';
			sqrtfp2ond <= '0';
			sqrtfp2sclr <= '1';
		else state := s49; end if;
	when s50 => state := s51;
		sqrtfp2sclr <= '0';

		mulfpce <= '1';
		mulfpa <= sx;
		mulfpb <= ksto2;
		mulfpond <= '1';
	when s51 =>
		if (mulfprdy = '1') then state := s52;
			sx := mulfpr; -- ksto2*sqrt2(sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar)))
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s51; end if;
	when s52 => state := s53;
		mulfpsclr <= '0';

		mulfpce <= '1';
		mulfpa <= ksto2;
		mulfpb <= const27315;
		mulfpond <= '1';
	when s53 =>
		if (mulfprdy = '1') then state := s54;
			fttmp2 := mulfpr; -- ksto2*273.15
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s53; end if;
	when s54 => state := s55;
		mulfpsclr <= '0';

		subfpce <= '1';
		subfpa <= const1;
		subfpb <= fttmp2;
		subfpond <= '1';
	when s55 =>
		if (subfprdy = '1') then state := s56;
			fttmp2 := subfpr; -- 1-ksto2*273.15
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s55; end if;
	when s56 => state := s57;
		subfpsclr <= '0';

		mulfpce <= '1';
		mulfpa <= i_alphacomp_do;
		mulfpb <= fttmp2;
		mulfpond <= '1';
	when s57 =>
		if (mulfprdy = '1') then state := s58;
			fttmp2 := mulfpr; -- alphacomp*(1-ksto2*273.15)
			mulfpce <= '0';
			mulfpond <= '0';
			mulfpsclr <= '1';
		else state := s57; end if;
	when s58 => state := s59;
		mulfpsclr <= '0';

		addfpce <= '1';
		addfpa <= fttmp2;
		addfpb <= sx;
		addfpond <= '1';
	when s59 =>
		if (addfprdy = '1') then state := s60;
			fttmp1 := addfpr; -- alphacomp*(1-ksto2*273.15)+sx
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s59; end if;
	when s60 => state := s61;
		addfpsclr <= '0';

		divfpce <= '1';
		divfpa <= i_vircompensated_do;
		divfpb <= fttmp1;
		divfpond <= '1';
	when s61 =>
		if (divfprdy = '1') then state := s62;
			fttmp1 := divfpr; -- vircompensated/(alphacomp*(1-ksto2*273.15)+sx)
			divfpce <= '0';
			divfpond <= '0';
			divfpsclr <= '1';
		else state := s61; end if;
	when s62 => state := s63;
		divfpsclr <= '0';

		addfpce <= '1';
		addfpa <= fttmp1;
		addfpb <= tar;
		addfpond <= '1';
	when s63 =>
		if (addfprdy = '1') then state := s64;
			fttmp1 := addfpr; -- (vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar
			addfpce <= '0';
			addfpond <= '0';
			addfpsclr <= '1';
		else state := s63; end if;
	when s64 => state := s65;
		addfpsclr <= '0';

		sqrtfp2ce <= '1';
		sqrtfp2a <= fttmp1;
		sqrtfp2ond <= '1';
	when s65 =>
		if (sqrtfp2rdy = '1') then state := s66;
			fttmp1 := sqrtfp2r; -- sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar)
			sqrtfp2ce <= '0';
			sqrtfp2ond <= '0';
			sqrtfp2sclr <= '1';
		else state := s65; end if;
	when s66 => state := s67;
		sqrtfp2sclr <= '0';

		sqrtfp2ce <= '1';
		sqrtfp2a <= fttmp1;
		sqrtfp2ond <= '1';
	when s67 =>
		if (sqrtfp2rdy = '1') then state := s68;
			fttmp1 := sqrtfp2r; -- sqrt2(sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar))
			sqrtfp2ce <= '0';
			sqrtfp2ond <= '0';
			sqrtfp2sclr <= '1';
		else state := s67; end if;
	when s68 => state := s69;
		sqrtfp2sclr <= '0';

		subfpce <= '1';
		subfpa <= fttmp1;
		subfpb <= const27315;
		subfpond <= '1';
	when s69 =>
		if (subfprdy = '1') then state := s70;
			fttmp1 := subfpr; -- To = (sqrt2(sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar)))-273.15
			subfpce <= '0';
			subfpond <= '0';
			subfpsclr <= '1';
		else state := s69; end if;
	when s70 => state := s71;
		subfpsclr <= '0';

		write_enable <= '1';
		addra <= std_logic_vector (to_unsigned (i, 10)); -- To
		dia <= fttmp1;
		report "================ To " & integer'image (i) & " : " & real'image (ap_slv2fp (fttmp1));
	when s71 =>
		write_enable <= '0';
		if (i = (C_ROW*C_COL)-1) then
			state := ending;
			i := 0;
		else
			state := s32;
			i := i + 1;
		end if;

	when ending => state := idle;
		rdy <= '1';

				when others => null;
			end case;
		end if;
	end if;
end process p0;

mem_signed256_clock <= i_clock;
mem_signed256_reset <= i_reset;
inst_mem_signed256 : mem_signed256 port map (
i_clock => mem_signed256_clock,
i_reset => mem_signed256_reset,
i_value => mem_signed256_ivalue,
o_value => mem_signed256_ovalue
);

ExtractKsToScaleParameter_clock <= i_clock;
ExtractKsToScaleParameter_reset <= i_reset;
inst_ExtractKsToScaleParameter : ExtractKsToScaleParameter port map (
i_clock => ExtractKsToScaleParameter_clock,
i_reset => ExtractKsToScaleParameter_reset,
i_run => ExtractKsToScaleParameter_run,
i2c_mem_ena => ExtractKsToScaleParameter_i2c_mem_ena,
i2c_mem_addra => ExtractKsToScaleParameter_i2c_mem_addra,
i2c_mem_douta => ExtractKsToScaleParameter_i2c_mem_douta,
o_kstoscale => ExtractKsToScaleParameter_kstoscale,
o_rdy => ExtractKsToScaleParameter_rdy
);

sqrtfp2clk <= i_clock;
addfpclk <= i_clock;
subfpclk <= i_clock;
mulfpclk <= i_clock;
divfpclk <= i_clock;

inst_divfp : divfp
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

inst_sqrtfp2 : sqrtfp2
PORT MAP (
a => sqrtfp2a,
operation_nd => sqrtfp2ond,
clk => sqrtfp2clk,
sclr => sqrtfp2sclr,
ce => sqrtfp2ce,
result => sqrtfp2r,
rdy => sqrtfp2rdy
);

inst_mem_To : mem_ramb16_s36_x2
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
