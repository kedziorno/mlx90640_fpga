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
use work.p_fphdl_package3.all;

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

o_rdy : out std_logic;

fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;

mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;

addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : out STD_LOGIC;
addfpsclr : out STD_LOGIC;
addfpce : out STD_LOGIC;
addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : in STD_LOGIC;

subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : out STD_LOGIC;
subfpsclr : out STD_LOGIC;
subfpce : out STD_LOGIC;
subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : in STD_LOGIC;

divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : out STD_LOGIC;
divfpsclr : out STD_LOGIC;
divfpce : out STD_LOGIC;
divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : in STD_LOGIC

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
end component ExtractOffsetParameters;
signal ExtractOffsetParameters_clock : std_logic;
signal ExtractOffsetParameters_reset : std_logic;
signal ExtractOffsetParameters_run : std_logic;
signal ExtractOffsetParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractOffsetParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractOffsetParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractOffsetParameters_do : std_logic_vector (31 downto 0);
signal ExtractOffsetParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractOffsetParameters_rdy : std_logic;
signal ExtractOffsetParameters_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal ExtractOffsetParameters_fixed2floatond : STD_LOGIC;
signal ExtractOffsetParameters_fixed2floatsclr : STD_LOGIC;
signal ExtractOffsetParameters_fixed2floatce : STD_LOGIC;
signal ExtractOffsetParameters_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_fixed2floatrdy : STD_LOGIC;
signal ExtractOffsetParameters_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_mulfpond : STD_LOGIC;
signal ExtractOffsetParameters_mulfpsclr : STD_LOGIC;
signal ExtractOffsetParameters_mulfpce : STD_LOGIC;
signal ExtractOffsetParameters_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_mulfprdy : STD_LOGIC;
signal ExtractOffsetParameters_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_addfpond : STD_LOGIC;
signal ExtractOffsetParameters_addfpsclr : STD_LOGIC;
signal ExtractOffsetParameters_addfpce : STD_LOGIC;
signal ExtractOffsetParameters_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_addfprdy : STD_LOGIC;
signal ExtractOffsetParameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_divfpond : STD_LOGIC;
signal ExtractOffsetParameters_divfpsclr : STD_LOGIC;
signal ExtractOffsetParameters_divfpce : STD_LOGIC;
signal ExtractOffsetParameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractOffsetParameters_divfprdy : STD_LOGIC;

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

o_rdy : out std_logic;

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
signal addfprdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC
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
signal ExtractKtaParameters_rdy : std_logic;
signal ExtractKtaParameters_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_mulfpond : STD_LOGIC;
signal ExtractKtaParameters_mulfpsclr : STD_LOGIC;
signal ExtractKtaParameters_mulfpce : STD_LOGIC;
signal ExtractKtaParameters_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_mulfprdy : STD_LOGIC;
signal ExtractKtaParameters_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_addfpond : STD_LOGIC;
signal ExtractKtaParameters_addfpsclr : STD_LOGIC;
signal ExtractKtaParameters_addfpce : STD_LOGIC;
signal ExtractKtaParameters_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_addfprdy : STD_LOGIC;
signal ExtractKtaParameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_divfpond : STD_LOGIC;
signal ExtractKtaParameters_divfpsclr : STD_LOGIC;
signal ExtractKtaParameters_divfpce : STD_LOGIC;
signal ExtractKtaParameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKtaParameters_divfprdy : STD_LOGIC;

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

o_rdy : out std_logic;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC
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
signal ExtractKvParameters_rdy : std_logic;
signal ExtractKvParameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKvParameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKvParameters_divfpond : STD_LOGIC;
signal ExtractKvParameters_divfpsclr : STD_LOGIC;
signal ExtractKvParameters_divfpce : STD_LOGIC;
signal ExtractKvParameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKvParameters_divfprdy : STD_LOGIC;

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
o_rdy : out std_logic;
fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;
mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;
signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC
);
end component CalculatePixGain;
signal CalculatePixGain_clock : std_logic;
signal CalculatePixGain_reset : std_logic;
signal CalculatePixGain_run : std_logic;
signal CalculatePixGain_i2c_mem_ena : STD_LOGIC;
signal CalculatePixGain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixGain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixGain_do : std_logic_vector (31 downto 0);
signal CalculatePixGain_addr : std_logic_vector (9 downto 0);
signal CalculatePixGain_rdy : std_logic;
signal CalculatePixGain_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculatePixGain_fixed2floatond : STD_LOGIC;
signal CalculatePixGain_fixed2floatce : STD_LOGIC;
signal CalculatePixGain_fixed2floatsclr : STD_LOGIC;
signal CalculatePixGain_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_fixed2floatrdy : STD_LOGIC;
signal CalculatePixGain_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_mulfpond : STD_LOGIC;
signal CalculatePixGain_mulfpce : STD_LOGIC;
signal CalculatePixGain_mulfpsclr : STD_LOGIC;
signal CalculatePixGain_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_mulfprdy : STD_LOGIC;
signal CalculatePixGain_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_divfpond : STD_LOGIC;
signal CalculatePixGain_divfpce : STD_LOGIC;
signal CalculatePixGain_divfpsclr : STD_LOGIC;
signal CalculatePixGain_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixGain_divfprdy : STD_LOGIC;
signal CalculatePixGain_fixed2floatclk : std_logic;
signal CalculatePixGain_mulfpclk : std_logic;
signal CalculatePixGain_divfpclk : std_logic;

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

signal fixed2floata_internal : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond_internal : STD_LOGIC;
signal fixed2floatce_internal : STD_LOGIC;
signal fixed2floatsclr_internal : STD_LOGIC;
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

signal subfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond_internal : STD_LOGIC;
signal subfpsclr_internal : STD_LOGIC;
signal subfpce_internal : STD_LOGIC;
signal subfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy_internal : STD_LOGIC;

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;

begin

fixed2floata <=
CalculatePixGain_fixed2floata when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_fixed2floata when ExtractOffsetParameters_mux = '1'
else (others => '0');

fixed2floatond <=
CalculatePixGain_fixed2floatond when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_fixed2floatond when ExtractOffsetParameters_mux = '1'
else '0';

fixed2floatce <=
CalculatePixGain_fixed2floatce when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_fixed2floatce when ExtractOffsetParameters_mux = '1'
else '0';

fixed2floatsclr <=
CalculatePixGain_fixed2floatsclr when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_fixed2floatsclr when ExtractOffsetParameters_mux = '1'
else '0';

mulfpa <=
CalculatePixGain_mulfpa when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_mulfpa when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_mulfpa when ExtractKtaParameters_mux = '1'
else mulfpa_internal;

mulfpb <=
CalculatePixGain_mulfpb when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_mulfpb when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_mulfpb when ExtractKtaParameters_mux = '1'
else mulfpb_internal;

mulfpond <=
CalculatePixGain_mulfpond when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_mulfpond when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_mulfpond when ExtractKtaParameters_mux = '1'
else mulfpond_internal;

mulfpsclr <=
CalculatePixGain_mulfpsclr when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_mulfpsclr when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_mulfpsclr when ExtractKtaParameters_mux = '1'
else mulfpsclr_internal;

mulfpce <=
CalculatePixGain_mulfpce when CalculatePixGain_mux = '1'
else
ExtractOffsetParameters_mulfpce when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_mulfpce when ExtractKtaParameters_mux = '1'
else mulfpce_internal;

divfpa <=
CalculatePixGain_divfpa when CalculatePixGain_mux = '1'
else
--ExtractOffsetParameters_divfpa when ExtractOffsetParameters_mux = '1'
--else
ExtractKtaParameters_divfpa when ExtractKtaParameters_mux = '1'
else
ExtractKvParameters_divfpa when ExtractKvParameters_mux = '1'
else divfpa_internal;

divfpb <=
CalculatePixGain_divfpb when CalculatePixGain_mux = '1'
else
--ExtractOffsetParameters_divfpb when ExtractOffsetParameters_mux = '1'
--else
ExtractKtaParameters_divfpb when ExtractKtaParameters_mux = '1'
else
ExtractKvParameters_divfpb when ExtractKvParameters_mux = '1'
else divfpb_internal;

divfpond <=
CalculatePixGain_divfpond when CalculatePixGain_mux = '1'
else
--ExtractOffsetParameters_divfpond when ExtractOffsetParameters_mux = '1'
--else
ExtractKtaParameters_divfpond when ExtractKtaParameters_mux = '1'
else
ExtractKvParameters_divfpond when ExtractKvParameters_mux = '1'
else divfpond_internal;

divfpsclr <=
CalculatePixGain_divfpsclr when CalculatePixGain_mux = '1'
else
--ExtractOffsetParameters_divfpsclr when ExtractOffsetParameters_mux = '1'
--else
ExtractKtaParameters_divfpsclr when ExtractKtaParameters_mux = '1'
else
ExtractKvParameters_divfpsclr when ExtractKvParameters_mux = '1'
else divfpsclr_internal;

divfpce <=
CalculatePixGain_divfpce when CalculatePixGain_mux = '1'
else
--ExtractOffsetParameters_divfpce when ExtractOffsetParameters_mux = '1'
--else
ExtractKtaParameters_divfpce when ExtractKtaParameters_mux = '1'
else
ExtractKvParameters_divfpce when ExtractKvParameters_mux = '1'
else divfpce_internal;

addfpa <=
ExtractOffsetParameters_addfpa when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_addfpa when ExtractKtaParameters_mux = '1'
else addfpa_internal;

addfpb <=
ExtractOffsetParameters_addfpb when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_addfpb when ExtractKtaParameters_mux = '1'
else addfpb_internal;

addfpond <=
ExtractOffsetParameters_addfpond when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_addfpond when ExtractKtaParameters_mux = '1'
else addfpond_internal;

addfpsclr <=
ExtractOffsetParameters_addfpsclr when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_addfpsclr when ExtractKtaParameters_mux = '1'
else addfpsclr_internal;

addfpce <=
ExtractOffsetParameters_addfpce when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_addfpce when ExtractKtaParameters_mux = '1'
else addfpce_internal;

addfpr_internal <=
ExtractOffsetParameters_addfpr when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_addfpr when ExtractKtaParameters_mux = '1'
else addfpr;

addfprdy_internal <=
ExtractOffsetParameters_addfprdy when ExtractOffsetParameters_mux = '1'
else
ExtractKtaParameters_addfprdy when ExtractKtaParameters_mux = '1'
else addfprdy;

subfpa <= subfpa_internal;
subfpb <= subfpb_internal;
subfpond <= subfpond_internal;
subfpsclr <= subfpsclr_internal;
subfpce <= subfpce_internal;
subfpr_internal <= subfpr;
subfprdy_internal <= subfprdy;

--addfpa <= CalculatePixGain_addfpa when CalculatePixGain_mux = '1' else (others => '0');
--addfpb <= CalculatePixGain_addfpb when CalculatePixGain_mux = '1' else (others => '0');
--addfpond <= CalculatePixGain_addfpond when CalculatePixGain_mux = '1' else '0';
--addfpsclr <= CalculatePixGain_addfpsclr when CalculatePixGain_mux = '1' else '0';
--addfpce <= CalculatePixGain_addfpce when CalculatePixGain_mux = '1' else '0';
--subfpa <= CalculatePixGain_subfpa when CalculatePixGain_mux = '1' else (others => '0');
--subfpb <= CalculatePixGain_subfpb when CalculatePixGain_mux = '1' else (others => '0');
--subfpond <= CalculatePixGain_subfpond when CalculatePixGain_mux = '1' else '0';
--subfpsclr <= CalculatePixGain_subfpsclr when CalculatePixGain_mux = '1' else '0';
--subfpce <= CalculatePixGain_subfpce when CalculatePixGain_mux = '1' else '0';

CalculatePixGain_fixed2floatr <= fixed2floatr when CalculatePixGain_mux = '1' else (others => '0');
CalculatePixGain_fixed2floatrdy <= fixed2floatrdy when CalculatePixGain_mux = '1' else '0';
CalculatePixGain_mulfpr <= mulfpr when CalculatePixGain_mux = '1' else (others => '0');
CalculatePixGain_mulfprdy <= mulfprdy when CalculatePixGain_mux = '1' else '0';
CalculatePixGain_divfpr <= divfpr when CalculatePixGain_mux = '1' else (others => '0');
CalculatePixGain_divfprdy <= divfprdy when CalculatePixGain_mux = '1' else '0';

ExtractOffsetParameters_fixed2floatr <= fixed2floatr when ExtractOffsetParameters_mux = '1' else (others => '0');
ExtractOffsetParameters_fixed2floatrdy <= fixed2floatrdy when ExtractOffsetParameters_mux = '1' else '0';
ExtractOffsetParameters_mulfpr <= mulfpr when ExtractOffsetParameters_mux = '1' else (others => '0');
ExtractOffsetParameters_mulfprdy <= mulfprdy when ExtractOffsetParameters_mux = '1' else '0';
ExtractOffsetParameters_addfpr <= addfpr when ExtractOffsetParameters_mux = '1' else (others => '0');
ExtractOffsetParameters_addfprdy <= addfprdy when ExtractOffsetParameters_mux = '1' else '0';

ExtractKtaParameters_divfpr <= divfpr when ExtractKtaParameters_mux = '1' else (others => '0');
ExtractKtaParameters_divfprdy <= divfprdy when ExtractKtaParameters_mux = '1' else '0';
ExtractKtaParameters_mulfpr <= mulfpr when ExtractKtaParameters_mux = '1' else (others => '0');
ExtractKtaParameters_mulfprdy <= mulfprdy when ExtractKtaParameters_mux = '1' else '0';
ExtractKtaParameters_addfpr <= addfpr when ExtractKtaParameters_mux = '1' else (others => '0');
ExtractKtaParameters_addfprdy <= addfprdy when ExtractKtaParameters_mux = '1' else '0';

ExtractKvParameters_divfpr <= divfpr when ExtractKvParameters_mux = '1' else (others => '0');
ExtractKvParameters_divfprdy <= divfprdy when ExtractKvParameters_mux = '1' else '0';

mulfpr_internal <= mulfpr;
mulfprdy_internal <= mulfprdy;

--CalculatePixGain_addfpr <= addfpr when CalculatePixGain_mux = '1' else (others => '0');
--CalculatePixGain_addfprdy <= addfprdy when CalculatePixGain_mux = '1' else '0';
--CalculatePixGain_subfpr <= subfpr when CalculatePixGain_mux = '1' else (others => '0');
--CalculatePixGain_subfprdy <= subfprdy when CalculatePixGain_mux = '1' else '0';

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	type states is (idle,
	s2,s3,s4,s5,s6,s7,s8,s9,s10,
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
			addfpsclr_internal <= '1';
			subfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
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
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			subfpa_internal <= (others => '0');
			subfpb_internal <= (others => '0');
			mulfpond_internal <= '0';
			addfpond_internal <= '0';
			subfpond_internal <= '0';
			mulfpce_internal <= '0';
			addfpce_internal <= '0';
			subfpce_internal <= '0';
			dia <= (others => '0');
			write_enable <= '0';
--			fixed2floata_internal <= (others => '0');
--			fixed2floatond_internal <= '0';
--			fixed2floatce_internal <= '0';
--			fixed2floatsclr_internal <= '0';
			divfpa_internal <= (others => '0');
			divfpb_internal <= (others => '0');
			divfpond_internal <= '0';
			divfpsclr_internal <= '0';
			divfpce_internal <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s2;
					else
						state := idle;
					end if;
					i := 0;
					addfpsclr_internal <= '0';
					subfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';

	when s2 => state := s3;		
		CalculatePixGain_run <= '1';
		CalculatePixGain_mux <= '1';
	when s3 => 
		CalculatePixGain_run <= '0';
		if (CalculatePixGain_rdy = '1') then
			state := s4;
			CalculatePixGain_mux <= '0';
		else
			state := s3;
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
		subfpce_internal <= '1';
		subfpa_internal <= i_Vdd;
		subfpb_internal <= i_VddV0;
		subfpond_internal <= '1';
when s12 =>
	if (subfprdy_internal = '1') then state := s13;
		fptmp1 := subfpr_internal;
		subfpce_internal <= '0';
		subfpond_internal <= '0';
		subfpsclr_internal <= '1';
	else state := s12; end if;
when s13 => state := s14;
	subfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= fptmp1;
	mulfpb_internal <= ExtractKvParameters_do;
	mulfpond_internal <= '1';
when s14 =>
	if (mulfprdy_internal = '1') then state := s15;
		fptmp1 := mulfpr_internal;
		mulfpce_internal <= '0';
		mulfpond_internal <= '0';
		mulfpsclr_internal <= '1';
	else state := s14; end if;
when s15 => state := s16;
	mulfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= fptmp1;
	addfpb_internal <= i_const1;
	addfpond_internal <= '1';
when s16 =>
	if (addfprdy_internal = '1') then state := s17;
		fptmp1 := addfpr_internal;
		addfpce_internal <= '0';
		addfpond_internal <= '0';
		addfpsclr_internal <= '1';
	else state := s16; end if;
when s17 => state := s18;
	addfpsclr_internal <= '0';
	subfpce_internal <= '1';
	subfpa_internal <= i_Ta;
	subfpb_internal <= i_Ta0;
	subfpond_internal <= '1';
when s18 =>
	if (subfprdy_internal = '1') then state := s19;
		fptmp2 := subfpr_internal;
		subfpce_internal <= '0';
		subfpond_internal <= '0';
		subfpsclr_internal <= '1';
	else state := s18; end if;
when s19 => state := s20;
	subfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= fptmp2;
	mulfpb_internal <= ExtractKtaParameters_do;
	mulfpond_internal <= '1';
when s20 =>
	if (mulfprdy_internal = '1') then state := s21;
		fptmp2 := mulfpr_internal;
		mulfpce_internal <= '0';
		mulfpond_internal <= '0';
		mulfpsclr_internal <= '1';
	else state := s20; end if;
when s21 => state := s22;
	mulfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= fptmp2;
	addfpb_internal <= i_const1;
	addfpond_internal <= '1';
when s22 =>
	if (addfprdy_internal = '1') then state := s23;
		fptmp2 := addfpr_internal;
		addfpce_internal <= '0';
		addfpond_internal <= '0';
		addfpsclr_internal <= '1';
	else state := s22; end if;
when s23 => state := s24;
	addfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= fptmp1;
	mulfpb_internal <= fptmp2;
	mulfpond_internal <= '1';
when s24 =>
	if (mulfprdy_internal = '1') then state := s25;
		fptmp1 := mulfpr_internal;
		mulfpce_internal <= '0';
		mulfpond_internal <= '0';
		mulfpsclr_internal <= '1';
	else state := s24; end if;
when s25 => state := s26;
	mulfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= fptmp1;
	mulfpb_internal <= ExtractOffsetParameters_do;
	mulfpond_internal <= '1';
when s26 =>
	if (mulfprdy_internal = '1') then state := s27;
		fptmp1 := mulfpr_internal;
		mulfpce_internal <= '0';
		mulfpond_internal <= '0';
		mulfpsclr_internal <= '1';
	else state := s26; end if;
when s27 => state := s28;
	mulfpsclr_internal <= '0';
	subfpce_internal <= '1';
	subfpa_internal <= CalculatePixGain_do;
	subfpb_internal <= fptmp1;
	subfpond_internal <= '1';
when s28 =>
	if (subfprdy_internal = '1') then state := s29;
		fptmp1 := subfpr_internal;
		subfpce_internal <= '0';
		subfpond_internal <= '0';
		subfpsclr_internal <= '1';
	else state := s28; end if;
when s29 => state := s30;
	subfpsclr_internal <= '0';
	write_enable <= '1';
	addra <= std_logic_vector (to_unsigned (i, 10)); -- pixos
	dia <= fptmp1;
	report "================pixos : " & real'image (ap_slv2fp (fptmp1));
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

CalculatePixGain_i2c_mem_douta <= i2c_mem_douta when CalculatePixGain_mux = '1' else (others => '0');
ExtractOffsetParameters_i2c_mem_douta <= i2c_mem_douta when ExtractOffsetParameters_mux = '1' else (others => '0');
ExtractKtaParameters_i2c_mem_douta <= i2c_mem_douta when ExtractKtaParameters_mux = '1' else (others => '0');
ExtractKvParameters_i2c_mem_douta <= i2c_mem_douta when ExtractKvParameters_mux = '1' else (others => '0');

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
o_rdy => CalculatePixGain_rdy,

fixed2floata => CalculatePixGain_fixed2floata,
fixed2floatond => CalculatePixGain_fixed2floatond,
fixed2floatce => CalculatePixGain_fixed2floatce,
fixed2floatsclr => CalculatePixGain_fixed2floatsclr,
fixed2floatr => CalculatePixGain_fixed2floatr,
fixed2floatrdy => CalculatePixGain_fixed2floatrdy,

mulfpa => CalculatePixGain_mulfpa,
mulfpb => CalculatePixGain_mulfpb,
mulfpond => CalculatePixGain_mulfpond,
mulfpce => CalculatePixGain_mulfpce,
mulfpsclr => CalculatePixGain_mulfpsclr,
mulfpr => CalculatePixGain_mulfpr,
mulfprdy => CalculatePixGain_mulfprdy,

divfpa => CalculatePixGain_divfpa,
divfpb => CalculatePixGain_divfpb,
divfpond => CalculatePixGain_divfpond,
divfpce => CalculatePixGain_divfpce,
divfpsclr => CalculatePixGain_divfpsclr,
divfpr => CalculatePixGain_divfpr,
divfprdy => CalculatePixGain_divfprdy
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
i_addr => ExtractOffsetParameters_addr, -- 10bit-1024

o_rdy => ExtractOffsetParameters_rdy,

fixed2floata => ExtractOffsetParameters_fixed2floata,
fixed2floatond => ExtractOffsetParameters_fixed2floatond,
fixed2floatsclr => ExtractOffsetParameters_fixed2floatsclr,
fixed2floatce => ExtractOffsetParameters_fixed2floatce,
fixed2floatr => ExtractOffsetParameters_fixed2floatr,
fixed2floatrdy => ExtractOffsetParameters_fixed2floatrdy,

mulfpa => ExtractOffsetParameters_mulfpa,
mulfpb => ExtractOffsetParameters_mulfpb,
mulfpond => ExtractOffsetParameters_mulfpond,
mulfpsclr => ExtractOffsetParameters_mulfpsclr,
mulfpce => ExtractOffsetParameters_mulfpce,
mulfpr => ExtractOffsetParameters_mulfpr,
mulfprdy => ExtractOffsetParameters_mulfprdy,

addfpa => ExtractOffsetParameters_addfpa,
addfpb => ExtractOffsetParameters_addfpb,
addfpond => ExtractOffsetParameters_addfpond,
addfpsclr => ExtractOffsetParameters_addfpsclr,
addfpce => ExtractOffsetParameters_addfpce,
addfpr => ExtractOffsetParameters_addfpr,
addfprdy => ExtractOffsetParameters_addfprdy
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
i_addr => ExtractKtaParameters_addr, -- 10bit-1024

o_rdy => ExtractKtaParameters_rdy,

mulfpa => ExtractKtaParameters_mulfpa,
mulfpb => ExtractKtaParameters_mulfpb,
mulfpond => ExtractKtaParameters_mulfpond,
mulfpsclr => ExtractKtaParameters_mulfpsclr,
mulfpce => ExtractKtaParameters_mulfpce,
mulfpr => ExtractKtaParameters_mulfpr,
mulfprdy => ExtractKtaParameters_mulfprdy,

addfpa => ExtractKtaParameters_addfpa,
addfpb => ExtractKtaParameters_addfpb,
addfpond => ExtractKtaParameters_addfpond,
addfpsclr => ExtractKtaParameters_addfpsclr,
addfpce => ExtractKtaParameters_addfpce,
addfpr => ExtractKtaParameters_addfpr,
addfprdy => ExtractKtaParameters_addfprdy,

divfpa => ExtractKtaParameters_divfpa,
divfpb => ExtractKtaParameters_divfpb,
divfpond => ExtractKtaParameters_divfpond,
divfpsclr => ExtractKtaParameters_divfpsclr,
divfpce => ExtractKtaParameters_divfpce,
divfpr => ExtractKtaParameters_divfpr,
divfprdy => ExtractKtaParameters_divfprdy
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
o_rdy => ExtractKvParameters_rdy,

divfpa => ExtractKvParameters_divfpa,
divfpb => ExtractKvParameters_divfpb,
divfpond => ExtractKvParameters_divfpond,
divfpsclr => ExtractKvParameters_divfpsclr,
divfpce => ExtractKvParameters_divfpce,
divfpr => ExtractKvParameters_divfpr,
divfprdy => ExtractKvParameters_divfprdy
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

end Behavioral;

