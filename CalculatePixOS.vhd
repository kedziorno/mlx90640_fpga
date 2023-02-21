----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:58:15 02/16/2023 
-- Design Name: 
-- Module Name:    CalculatePixOS - Behavioral 
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

use work.p_fphdl_package1.all;

entity CalculatePixOS is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_const1 : in std_logic_vector (31 downto 0);
i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_VddV0 : in std_logic_vector (31 downto 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic
);
end CalculatePixOS;

architecture Behavioral of CalculatePixOS is

component ExtractOffsetParameters is
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
end component ExtractOffsetParameters;

signal ExtractOffsetParameters_clock : std_logic;
signal ExtractOffsetParameters_reset : std_logic;
signal ExtractOffsetParameters_run : std_logic;
signal ExtractOffsetParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractOffsetParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractOffsetParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractOffsetParameters_do : std_logic_vector (31 downto 0);
signal ExtractOffsetParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractOffsetParameters_done : std_logic;
signal ExtractOffsetParameters_rdy : std_logic;

component ExtractKtaParameters is
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
end component ExtractKtaParameters;

signal ExtractKtaParameters_clock : std_logic;
signal ExtractKtaParameters_reset : std_logic;
signal ExtractKtaParameters_run : std_logic;
signal ExtractKtaParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractKtaParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKtaParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKtaParameters_do : std_logic_vector (31 downto 0);
signal ExtractKtaParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractKtaParameters_done : std_logic;
signal ExtractKtaParameters_rdy : std_logic;

component ExtractKvParameters is
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
end component ExtractKvParameters;

signal ExtractKvParameters_clock : std_logic;
signal ExtractKvParameters_reset : std_logic;
signal ExtractKvParameters_run : std_logic;
signal ExtractKvParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractKvParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKvParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKvParameters_do : std_logic_vector (31 downto 0);
signal ExtractKvParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractKvParameters_done : std_logic;
signal ExtractKvParameters_rdy : std_logic;

component CalculatePixGain is
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
end component CalculatePixGain;

signal CalculatePixGain_clock : std_logic;
signal CalculatePixGain_reset : std_logic;
signal CalculatePixGain_run : std_logic;
signal CalculatePixGain_i2c_mem_ena : STD_LOGIC;
signal CalculatePixGain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixGain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixGain_do : std_logic_vector (31 downto 0);
signal CalculatePixGain_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal CalculatePixGain_done : std_logic;
signal CalculatePixGain_rdy : std_logic;

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

signal rdy,write_enable : std_logic;

signal CalculatePixGain_mux,ExtractOffsetParameters_mux,ExtractKtaParameters_mux,ExtractKvParameters_mux : std_logic;

begin

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,
	ending);
	variable state : states;
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			i := 0;
			addfpsclr <= '1';
			subfpsclr <= '1';
			mulfpsclr <= '1';
			rdy <= '0';
			CalculatePixGain_run <= '0';
			ExtractOffsetParameters_run <= '0';
			ExtractKtaParameters_run <= '0';
			ExtractKvParameters_run <= '0';
			CalculatePixGain_mux <= '0';
			ExtractOffsetParameters_mux <= '0';
			ExtractKtaParameters_mux <= '0';
			ExtractKvParameters_mux <= '0';
			CalculatePixGain_addr <= (others => '0');
			ExtractOffsetParameters_addr <= (others => '0');
			ExtractKtaParameters_addr <= (others => '0');
			ExtractKvParameters_addr <= (others => '0');
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
			dia <= (others => '0');
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
		CalculatePixGain_run <= '1';
		CalculatePixGain_mux <= '1';
	when s2 => 
		CalculatePixGain_run <= '0';
		if (CalculatePixGain_rdy = '1') then
			state := s4;
			CalculatePixGain_mux <= '0';
		else
			state := s2;
			CalculatePixGain_mux <= '1';
		end if;

	when s4 => state := s5;
		ExtractOffsetParameters_run <= '1';
		ExtractOffsetParameters_mux <= '1';
	when s5 => 
		ExtractOffsetParameters_run <= '0';
		if (ExtractOffsetParameters_rdy = '1') then
			state := s6;
			ExtractOffsetParameters_mux <= '0';
		else
			state := s5;
			ExtractOffsetParameters_mux <= '1';
		end if;


	when s6 => state := s7;
		ExtractKtaParameters_run <= '1';
		ExtractKtaParameters_mux <= '1';
	when s7 => 
		ExtractKtaParameters_run <= '0';
		if (ExtractKtaParameters_rdy = '1') then
			state := s8;
			ExtractKtaParameters_mux <= '0';
		else
			state := s7;
			ExtractKtaParameters_mux <= '1';
		end if;


	when s8 => state := s9;
		ExtractKvParameters_run <= '1';
		ExtractKvParameters_mux <= '1';
	when s9 => 
		ExtractKvParameters_run <= '0';
		if (ExtractKvParameters_rdy = '1') then
			state := s10;
			ExtractKvParameters_mux <= '0';
		else
			state := s9;
			ExtractKvParameters_mux <= '1';
		end if;
	when s10 => state := s11;
		CalculatePixGain_addr <= std_logic_vector (to_unsigned (i, 10));
		ExtractOffsetParameters_addr <= std_logic_vector (to_unsigned (i, 10));
		ExtractKtaParameters_addr <= std_logic_vector (to_unsigned (i, 10));
		ExtractKvParameters_addr <= std_logic_vector (to_unsigned (i, 10));
					

when s11 => state := s12;
		subfpce <= '1';
		subfpa <= i_Vdd;
		subfpb <= i_VddV0;
		subfpond <= '1';
when s12 =>
	if (subfprdy = '1') then state := s13;
		fptmp1 := subfpr;
		subfpce <= '0';
		subfpond <= '0';
		subfpsclr <= '1';
	else state := s12; end if;
when s13 => state := s14;
	subfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= fptmp1;
	mulfpb <= ExtractKvParameters_do;
	mulfpond <= '1';
when s14 =>
	if (mulfprdy = '1') then state := s15;
		fptmp1 := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := s14; end if;
when s15 => state := s16;
	mulfpsclr <= '0';
	addfpce <= '1';
	addfpa <= fptmp1;
	addfpb <= i_const1;
	addfpond <= '1';
when s16 =>
	if (addfprdy = '1') then state := s17;
		fptmp1 := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := s16; end if;
when s17 => state := s18;
	addfpsclr <= '0';
	subfpce <= '1';
	subfpa <= i_Ta;
	subfpb <= i_Ta0;
	subfpond <= '1';
when s18 =>
	if (subfprdy = '1') then state := s19;
		fptmp2 := subfpr;
		subfpce <= '0';
		subfpond <= '0';
		subfpsclr <= '1';
	else state := s18; end if;
when s19 => state := s20;
	subfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= fptmp2;
	mulfpb <= ExtractKtaParameters_do;
	mulfpond <= '1';
when s20 =>
	if (mulfprdy = '1') then state := s21;
		fptmp2 := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := s20; end if;
when s21 => state := s22;
	mulfpsclr <= '0';
	addfpce <= '1';
	addfpa <= fptmp2;
	addfpb <= i_const1;
	addfpond <= '1';
when s22 =>
	if (addfprdy = '1') then state := s23;
		fptmp2 := addfpr;
		addfpce <= '0';
		addfpond <= '0';
		addfpsclr <= '1';
	else state := s22; end if;
when s23 => state := s24;
	addfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= fptmp1;
	mulfpb <= fptmp2;
	mulfpond <= '1';
when s24 =>
	if (mulfprdy = '1') then state := s25;
		fptmp1 := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := s24; end if;
when s25 => state := s26;
	mulfpsclr <= '0';
	mulfpce <= '1';
	mulfpa <= fptmp1;
	mulfpb <= ExtractOffsetParameters_do;
	mulfpond <= '1';
when s26 =>
	if (mulfprdy = '1') then state := s27;
		fptmp1 := mulfpr;
		mulfpce <= '0';
		mulfpond <= '0';
		mulfpsclr <= '1';
	else state := s26; end if;
when s27 => state := s28;
	mulfpsclr <= '0';
	subfpce <= '1';
	subfpa <= CalculatePixGain_do;
	subfpb <= fptmp1;
	subfpond <= '1';
when s28 =>
	if (subfprdy = '1') then state := s29;
		fptmp1 := subfpr;
		subfpce <= '0';
		subfpond <= '0';
		subfpsclr <= '1';
	else state := s28; end if;
when s29 => state := s30;
	subfpsclr <= '0';
	write_enable <= '1';
	addra <= std_logic_vector (to_unsigned (i, 10)); -- pixos
	dia <= fptmp1;
	--report "================pixos : " & real'image (ap_slv2fp (fptmp1));
when s30 =>
	write_enable <= '0';
	if (i = (C_ROW*C_COL)-1) then
		state := ending;
		i := 0;
	else
		state := s10;
		i := i + 1;
	end if;
when ending => state := idle;
			rdy <= '1';
	when others => null;
	end case;
	end if;
	end if;
	end process p0;

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else i_addr when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

i2c_mem_ena <=
CalculatePixGain_i2c_mem_ena when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_i2c_mem_ena when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_i2c_mem_ena when ExtractKtaParameters_mux = '1'
else
ExtractKvParameters_i2c_mem_ena when ExtractKvParameters_mux = '1'
else '0';

i2c_mem_addra <=
CalculatePixGain_i2c_mem_addra when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_i2c_mem_addra when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_i2c_mem_addra when ExtractKtaParameters_mux = '1'
else
ExtractKvParameters_i2c_mem_addra when ExtractKvParameters_mux = '1'
else (others => '0');

CalculatePixGain_i2c_mem_douta <= i2c_mem_douta;
ExtractOffsetParameters_i2c_mem_douta <= i2c_mem_douta;
ExtractKtaParameters_i2c_mem_douta <= i2c_mem_douta;
ExtractKvParameters_i2c_mem_douta <= i2c_mem_douta;

CalculatePixGain_clock <= i_clock;
CalculatePixGain_reset <= i_reset;
inst_CalculatePixGain : CalculatePixGain port map (
i_clock => CalculatePixGain_clock,
i_reset => CalculatePixGain_reset,
i_run => CalculatePixGain_run,
i2c_mem_ena => CalculatePixGain_i2c_mem_ena,
i2c_mem_addra => CalculatePixGain_i2c_mem_addra,
i2c_mem_douta => CalculatePixGain_i2c_mem_douta,
o_do => CalculatePixGain_do,
i_addr => CalculatePixGain_addr,
o_done => CalculatePixGain_done,
o_rdy => CalculatePixGain_rdy
);

ExtractOffsetParameters_clock <= i_clock;
ExtractOffsetParameters_reset <= i_reset;
inst_ExtractOffsetParameters : ExtractOffsetParameters port map (
i_clock => ExtractOffsetParameters_clock,
i_reset => ExtractOffsetParameters_reset,
i_run => ExtractOffsetParameters_run,
i2c_mem_ena => ExtractOffsetParameters_i2c_mem_ena,
i2c_mem_addra => ExtractOffsetParameters_i2c_mem_addra,
i2c_mem_douta => ExtractOffsetParameters_i2c_mem_douta,
o_do => ExtractOffsetParameters_do,
i_addr => ExtractOffsetParameters_addr,
o_done => ExtractOffsetParameters_done,
o_rdy => ExtractOffsetParameters_rdy
);

ExtractKtaParameters_clock <= i_clock;
ExtractKtaParameters_reset <= i_reset;
inst_ExtractKtaParameters : ExtractKtaParameters port map (
i_clock => ExtractKtaParameters_clock,
i_reset => ExtractKtaParameters_reset,
i_run => ExtractKtaParameters_run,
i2c_mem_ena => ExtractKtaParameters_i2c_mem_ena,
i2c_mem_addra => ExtractKtaParameters_i2c_mem_addra,
i2c_mem_douta => ExtractKtaParameters_i2c_mem_douta,
o_do => ExtractKtaParameters_do,
i_addr => ExtractKtaParameters_addr,
o_done => ExtractKtaParameters_done,
o_rdy => ExtractKtaParameters_rdy
);

ExtractKvParameters_clock <= i_clock;
ExtractKvParameters_reset <= i_reset;
inst_ExtractKvParameters : ExtractKvParameters port map (
i_clock => ExtractKvParameters_clock,
i_reset => ExtractKvParameters_reset,
i_run => ExtractKvParameters_run,
i2c_mem_ena => ExtractKvParameters_i2c_mem_ena,
i2c_mem_addra => ExtractKvParameters_i2c_mem_addra,
i2c_mem_douta => ExtractKvParameters_i2c_mem_douta,
o_do => ExtractKvParameters_do,
i_addr => ExtractKvParameters_addr,
o_done => ExtractKvParameters_done,
o_rdy => ExtractKvParameters_rdy
);

inst_mem_pixos : mem_ramb16_s36_x2
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
inst_mulfp_pixos : mulfp
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
inst_addfp_pixos : addfp
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
inst_subfp_pixos : subfp
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

