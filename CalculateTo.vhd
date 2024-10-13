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

o_rdy : out std_logic;

signal o_mem_signed256_ivalue : out std_logic_vector (7 downto 0); -- input hex from 0 to 255
signal i_mem_signed256_ovalue : in std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float

signal o_2powx_p8_ena : out std_logic;
signal o_2powx_p8_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

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

signal subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : out STD_LOGIC;
signal subfpsclr : out STD_LOGIC;
signal subfpce : out STD_LOGIC;
signal subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : in STD_LOGIC;

signal sqrtfp2a : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : out STD_LOGIC;
signal sqrtfp2sclr : out STD_LOGIC;
signal sqrtfp2ce : out STD_LOGIC;
signal sqrtfp2r : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : in STD_LOGIC

);
end CalculateTo;

architecture Behavioral of CalculateTo is

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;

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

signal sqrtfp2a_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond_internal : STD_LOGIC;
signal sqrtfp2sclr_internal : STD_LOGIC;
signal sqrtfp2ce_internal : STD_LOGIC;
signal sqrtfp2r_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy_internal : STD_LOGIC;

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

signal i2c_mem_ena_internal : STD_LOGIC;
signal i2c_mem_addra_internal : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta_internal : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

mulfpa <= mulfpa_internal;
mulfpb <= mulfpb_internal;
mulfpond <= mulfpond_internal;
mulfpsclr <= mulfpsclr_internal;
mulfpce <= mulfpce_internal;
mulfpr_internal <= mulfpr;
mulfprdy_internal <= mulfprdy;

addfpa <= addfpa_internal;
addfpb <= addfpb_internal;
addfpond <= addfpond_internal;
addfpsclr <= addfpsclr_internal;
addfpce <= addfpce_internal;
addfpr_internal <= addfpr;
addfprdy_internal <= addfprdy;

subfpa <= subfpa_internal;
subfpb <= subfpb_internal;
subfpond <= subfpond_internal;
subfpsclr <= subfpsclr_internal;
subfpce <= subfpce_internal;
subfpr_internal <= subfpr;
subfprdy_internal <= subfprdy;

sqrtfp2a <= sqrtfp2a_internal;
sqrtfp2ond <= sqrtfp2ond_internal;
sqrtfp2sclr <= sqrtfp2sclr_internal;
sqrtfp2ce <= sqrtfp2ce_internal;
sqrtfp2r_internal <= sqrtfp2r;
sqrtfp2rdy_internal <= sqrtfp2rdy;

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else i_addr when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

i2c_mem_ena <= i2c_mem_ena_internal;
i2c_mem_addra <= i2c_mem_addra_internal;
i2c_mem_douta_internal <= i2c_mem_douta;

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	constant constTr : std_logic_vector (31 downto 0) := x"41000000"; -- 8
	constant const27315 : std_logic_vector (31 downto 0) := x"43889333"; -- 273.15
	--constant constEmissivity : std_logic_vector (31 downto 0) := x"3f866666"; -- 1.05
	--constant constEmissivity : std_logic_vector (31 downto 0) := x"3f8147ae"; -- 1.01
	constant constEmissivity : std_logic_vector (31 downto 0) := x"3f800000"; -- 1
	--constant constEmissivity : std_logic_vector (31 downto 0) := x"3f733333"; -- 0.95
	--constant constEmissivity : std_logic_vector (31 downto 0) := x"3f7d70a4"; -- 0.99
	constant const1 : std_logic_vector (31 downto 0) := x"3f800000"; -- 1
  type states is (idle,
	s9,s10,s10a,s10b,
	s12,s13,s16,s17,s18,s20,
	s21,s24,s26,s28,s30,
	s35,s36,s37,s38,s39,s40,
	s41,s42,s43,s44,s45,s47,s48,s49,
	s51,s51a,s52,s53,s55,s57,s59,
	s61,s63,s65,s66,s67,s69,s71);
	variable state : states;
	variable tar : std_logic_vector (31 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			i := 0;
			i2c_mem_ena_internal <= '0';
			rdy <= '0';
			addfpsclr_internal <= '1';
			subfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			divfpsclr_internal <= '1';
			sqrtfp2sclr_internal <= '1';
			rdy <= '0';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			subfpa_internal <= (others => '0');
			subfpb_internal <= (others => '0');
			divfpa_internal <= (others => '0');
			divfpb_internal <= (others => '0');
			sqrtfp2a_internal <= (others => '0');
			mulfpond_internal <= '0';
			addfpond_internal <= '0';
			subfpond_internal <= '0';
			divfpond_internal <= '0';
			sqrtfp2ond_internal <= '0';
			mulfpce_internal <= '0';
			addfpce_internal <= '0';
			subfpce_internal <= '0';
			divfpce_internal <= '0';
			sqrtfp2ce_internal <= '0';
			o_vircompensated_addr <= (others => '0');
			o_alphacomp_addr <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s9;
						i2c_mem_ena_internal <= '1';
					else
						state := idle;
						i2c_mem_ena_internal <= '0';
					end if;
					i := 0;
					addfpsclr_internal <= '0';
					subfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
					sqrtfp2sclr_internal <= '0';
        when s9 => state := s10;
          o_vircompensated_addr <= std_logic_vector (to_unsigned (i, 10));
          o_alphacomp_addr <= std_logic_vector (to_unsigned (i, 10));
          addfpsclr_internal <= '0';
          subfpsclr_internal <= '0';
          divfpsclr_internal <= '0';
          mulfpsclr_internal <= '0';
          sqrtfp2sclr_internal <= '0';
        when s10 =>
          subfpce_internal <= '1';
          subfpa_internal <= i_Ta;
          subfpb_internal <= constTr;
          subfpond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (61*2+0, 12)); -- ee243d MSB ksto2ee 0xff00
          if (subfprdy_internal = '1') then state := s10a; -- Tr=Ta-8
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
            o_mem_signed256_ivalue <= i2c_mem_douta_internal; -- ksto2ee
          else state := s10; end if;
        when s10a =>
          subfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= i_Ta;
          addfpb_internal <= const27315;
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s10b; -- Ta+273.15
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := s10a; end if;
        when s10b =>
          addfpsclr_internal <= '0';
          
          divfpce_internal <= '1';
          divfpa_internal <= subfpr_internal; -- Tr=Ta-8 - s10
          divfpb_internal <= const1;
          divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := s12;
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
          else state := s10b; end if;
        
        
        when s12 =>
          divfpsclr_internal <= '0';

          mulfpce_internal <= '1';
          mulfpa_internal <= addfpr_internal; -- Ta + 273.15 - s10a
          mulfpb_internal <= addfpr_internal; -- Ta + 273.15 - s10a
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s13;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s12; end if;
        when s13 => state := s16;
          mulfpsclr_internal <= '0';
        when s16 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal; -- (Ta + 273.15)^2 - s12
          mulfpb_internal <= mulfpr_internal; -- (Ta + 273.15)^2 - s12
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s17;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s16; end if;
        when s17 => -- XXX empty state for rm tmp reg
          mulfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= mulfpr_internal;
          subfpb_internal <= x"00000000";
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := s18; -- (Ta + 273.15)^4 - s16
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
          else state := s17; end if;
        when s18 =>
          subfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= divfpr_internal; -- Tr=Ta-8 - s10b
          addfpb_internal <= const27315;
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s20; -- Tr + 273.15
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := s18; end if;
        when s20 =>
          addfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= addfpr_internal; -- Tr + 273.15 - s18
          mulfpb_internal <= addfpr_internal; -- Tr + 273.15 - s18
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s21;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s20; end if;
        when s21 => state := s24;
          mulfpsclr_internal <= '0';
        when s24 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal; -- (Tr + 273.15)^2 - s20
          mulfpb_internal <= mulfpr_internal; -- (Tr + 273.15)^2 - s20
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s26;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s24; end if;
        when s26 =>
          mulfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= mulfpr_internal; -- TrK4=(Tr + 273.15)^4 - s24
          subfpb_internal <= subfpr_internal; -- TaK4=(Ta + 273.15)^4 - s17
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := s28;
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
          else state := s26; end if;
        when s28 =>
          subfpsclr_internal <= '0';
          divfpce_internal <= '1';
          divfpa_internal <= subfpr_internal; -- TrK4-TaK4 - s26
          divfpb_internal <= constEmissivity; -- Emissivity
          divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := s30;
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
          else state := s28; end if;
        when s30 =>
          divfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= mulfpr_internal; -- TrK4=(Tr + 273.15)^4 - s20
          subfpb_internal <= divfpr_internal; -- (TrK4-TaK4)/Emissivity - s28
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := s35;
            tar := subfpr_internal; -- TrK4-((TrK4-TaK4)/Emissivity)
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
          else state := s30; end if;
        when s35 =>
          subfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= i_alphacomp_do;
          mulfpb_internal <= i_alphacomp_do;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s36; -- alphacomp^2
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s35; end if;
        when s36 => state := s37;
          mulfpsclr_internal <= '0';
        when s37 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal; -- alphacomp^2
          mulfpb_internal <= i_alphacomp_do;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s38; -- alphacomp^3
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s37; end if;
        when s38 => -- XXX empty state
          mulfpsclr_internal <= '0';
          
          subfpce_internal <= '1';
          subfpa_internal <= mulfpr_internal; -- alphacomp^3
          subfpb_internal <= x"00000000";
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := s39;
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
          else state := s38; end if;
          
        when s39 =>
          subfpsclr_internal <= '0';
        
          mulfpce_internal <= '1';
          mulfpa_internal <= mulfpr_internal; -- alphacomp^3
          mulfpb_internal <= i_alphacomp_do;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s40; -- alphacomp^4
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s39; end if;
        when s40 => -- XXX empty state
          mulfpsclr_internal <= '0';
          
          divfpce_internal <= '1';
          divfpa_internal <= mulfpr_internal; -- alphacomp^4
          divfpb_internal <= const1;
          divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := s41;
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
          else state := s40; end if;
          
        when s41 =>
          divfpsclr_internal <= '0';
          
          mulfpce_internal <= '1';
          mulfpa_internal <= subfpr_internal; -- alphacomp^3 - s38
          mulfpb_internal <= i_vircompensated_do;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s42; -- alphacomp^3*vircompensated
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s41; end if;
        when s42 =>
          mulfpsclr_internal <= '0';
          
          addfpce_internal <= '1';
          addfpa_internal <= mulfpr_internal; -- alphacomp^3*vircompensated
          addfpb_internal <= x"00000000";
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s43;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := s42; end if;
          
        when s43 =>
          addfpsclr_internal <= '0';
          
          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- alphacomp^4 - s40
          mulfpb_internal <= tar; -- tar
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s44; -- alphacomp^4*Tar
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s43; end if;
        when s44 => -- XXX empty state
          mulfpsclr_internal <= '0';

          subfpce_internal <= '1';
          subfpa_internal <= mulfpr_internal; -- alphacomp^4*Tar
          subfpb_internal <= x"00000000";
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := s45;
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
          else state := s44; end if;
          
        when s45 =>
          subfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= mulfpr_internal; -- alphacomp^3*vircompensated - s41
          addfpb_internal <= subfpr_internal; -- alphacomp^4*Tar - s44
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s47; -- (alphacomp^3*vircompensated)+(alphacomp^4*Tar)
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := s45; end if;
        when s47 =>
          addfpsclr_internal <= '0';
          sqrtfp2ce_internal <= '1';
          sqrtfp2a_internal <= addfpr_internal; -- (alphacomp^3*vircompensated)+(alphacomp^4*Tar)
          sqrtfp2ond_internal <= '1';
          if (sqrtfp2rdy_internal = '1') then state := s48; -- sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar))
            sqrtfp2ce_internal <= '0';
            sqrtfp2ond_internal <= '0';
            sqrtfp2sclr_internal <= '1';
          else state := s47; end if;
        when s48 => state := s49;
          sqrtfp2sclr_internal <= '0';
        when s49 =>
          sqrtfp2ce_internal <= '1';
          sqrtfp2a_internal <= sqrtfp2r_internal; -- sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar))
          sqrtfp2ond_internal <= '1';
          i2c_mem_addra_internal <= std_logic_vector (to_unsigned (63*2+1, 12)); -- ee243f LSB kstoscale 0x000f
          if (sqrtfp2rdy_internal = '1') then state := s51; -- sqrt2(sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar)))
            sqrtfp2ce_internal <= '0';
            sqrtfp2ond_internal <= '0';
            sqrtfp2sclr_internal <= '1';
            o_2powx_p8_ena <= '1';
            o_2powx_p8_adr <= i2c_mem_douta_internal (3 downto 0);
          else state := s49; end if;
        when s51 =>
          sqrtfp2sclr_internal <= '0';
          divfpce_internal <= '1';
          divfpa_internal <= i_mem_signed256_ovalue;
          divfpb_internal <= i_rom_constants_float; -- kstoscale
          divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := s51a;
            o_2powx_p8_ena <= '0';
            --report_error("================ To ksto2", divfprdy_internal, 0.0);
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
          else state := s51; end if;
        when s51a =>
          divfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= sqrtfp2r_internal; -- sqrt2(sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar))) - s49
          mulfpb_internal <= divfpr_internal; -- ksto2 - s51
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s52;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s51a; end if;
        when s52 => -- XXX empty state
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= mulfpr_internal;  -- ksto2*sqrt2(sqrt2((alphacomp^3*vircompensated)+(alphacomp^4*Tar)))
          addfpb_internal <= x"00000000";
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s53;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := s52; end if;
        when s53 =>
          addfpsclr_internal <= '0';

          mulfpce_internal <= '1';
          mulfpa_internal <= divfpr_internal; -- ksto2 - s51
          mulfpb_internal <= const27315;
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s55; -- ksto2*273.15
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s53; end if;
        when s55 =>
          mulfpsclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= const1;
          subfpb_internal <= mulfpr_internal;
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := s57; -- 1-ksto2*273.15
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
          else state := s55; end if;
        when s57 =>
          subfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= i_alphacomp_do;
          mulfpb_internal <= subfpr_internal; -- s55
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := s59; -- alphacomp*(1-ksto2*273.15)
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s57; end if;
        when s59 =>
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= mulfpr_internal; -- s57
          addfpb_internal <= addfpr_internal; -- s52
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s61; -- alphacomp*(1-ksto2*273.15)+sx
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := s59; end if;
        when s61 =>
          addfpsclr_internal <= '0';
          divfpce_internal <= '1';
          divfpa_internal <= i_vircompensated_do;
          divfpb_internal <= addfpr_internal; -- s59
          divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := s63; -- vircompensated/(alphacomp*(1-ksto2*273.15)+sx)
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
          else state := s61; end if;
        when s63 =>
          divfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= divfpr_internal; -- s63
          addfpb_internal <= tar;
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s65; -- (vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := s63; end if;
        when s65 =>
          addfpsclr_internal <= '0';
          sqrtfp2ce_internal <= '1';
          sqrtfp2a_internal <= addfpr_internal; -- (vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar
          sqrtfp2ond_internal <= '1';
          if (sqrtfp2rdy_internal = '1') then state := s66; -- sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar)
            sqrtfp2ce_internal <= '0';
            sqrtfp2ond_internal <= '0';
            sqrtfp2sclr_internal <= '1';
          else state := s65; end if;
        when s66 => state := s67;
          sqrtfp2sclr_internal <= '0';
        when s67 =>
          sqrtfp2ce_internal <= '1';
          sqrtfp2a_internal <= sqrtfp2r_internal; -- sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar)
          sqrtfp2ond_internal <= '1';
          if (sqrtfp2rdy_internal = '1') then state := s69; -- sqrt2(sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar))
            sqrtfp2ce_internal <= '0';
            sqrtfp2ond_internal <= '0';
            sqrtfp2sclr_internal <= '1';
          else state := s67; end if;
        when s69 =>
          sqrtfp2sclr_internal <= '0';
          subfpce_internal <= '1';
          subfpa_internal <= sqrtfp2r_internal; -- sqrt2(sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar))
          subfpb_internal <= const27315;
          subfpond_internal <= '1';
          if (subfprdy_internal = '1') then state := s71;
            subfpce_internal <= '0';
            subfpond_internal <= '0';
            subfpsclr_internal <= '1';
            write_enable <= '1';
            addra <= std_logic_vector (to_unsigned (i, 10)); -- To
            dia <= subfpr_internal; -- To = (sqrt2(sqrt2((vircompensated/(alphacomp*(1-ksto2*273.15)+sx))+Tar)))-273.15
            --synthesis translate_off
            report_error ("To " & integer'image (i), subfpr_internal, 0.0);
            --synthesis translate_on
          else state := s69; end if;
        when s71 =>
          write_enable <= '0';
          if (i = (C_ROW*C_COL)-1) then
            state := idle;
            rdy <= '1';
            i := 0;
          else
            state := s9;
            i := i + 1;
          end if;
			end case;
		end if;
	end if;
end process p0;

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
EN => i_clock,
SSR => i_reset,
WE => write_enable
);

end architecture Behavioral;
