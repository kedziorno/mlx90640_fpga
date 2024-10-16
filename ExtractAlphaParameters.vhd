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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use ieee_proposed.fixed_pkg.all;

--use work.p_fphdl_package1.all;
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
o_rdy : out std_logic;

signal o_signed4bit_ena : out std_logic;
signal o_signed4bit_adr : out std_logic_vector (3 downto 0);
signal o_signed6bit_ena : out std_logic;
signal o_signed6bit_adr : out std_logic_vector (5 downto 0);
signal o_alphascale_1_ena : out std_logic;
signal o_alphascale_1_adr : out std_logic_vector (3 downto 0);
signal o_2powx_4bit_ena : out std_logic;
signal o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);

signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
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
signal addfprdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC

);
end ExtractAlphaParameters;

architecture Behavioral of ExtractAlphaParameters is

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


signal out_nibble3 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;

signal rdy : std_logic;

constant C_COL : integer := 32;
constant C_ROW : integer := 24;

signal fixed2floata_internal : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond_internal : STD_LOGIC;
signal fixed2floatsclr_internal : STD_LOGIC;
signal fixed2floatce_internal : STD_LOGIC;
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

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;

begin

fixed2floata <= fixed2floata_internal;
fixed2floatond <= fixed2floatond_internal;
fixed2floatsclr <= fixed2floatsclr_internal;
fixed2floatce <= fixed2floatce_internal;
fixed2floatr_internal <= fixed2floatr;
fixed2floatrdy_internal <= fixed2floatrdy;

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

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else std_logic_vector (to_unsigned (to_integer(unsigned (i_addr))+C_COL+C_ROW,10))  when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

p0 : process (i_clock) is
	type states is (idle,
	acc15,acc16,acc17,acc18,acc19,
	acc20,acc21,acc22,acc23,
  pow3,
	s0,s1,s2,s3,s4,s7,s8,s11,s13,s14,s16,s17,s19,s20,s22,s25);
	variable state : states;

	variable valphaRef : std_logic_vector (7 downto 0);
	variable vAlphaPixel : std_logic_vector (1 downto 0);

	variable col : integer range 0 to C_COL-1;
	variable row : integer range 0 to C_ROW-1;
	variable i : integer range 0 to (C_ROW*C_COL)-1;
  variable m : integer range 0 to 31 := 0;
  variable n : integer range 0 to 55 := 0;
  variable j : integer range 0 to 13 := 0;
  
  variable tmp1 : std_logic_vector (3 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			write_enable <= '0';
			rdy <= '0';
			addfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			divfpsclr_internal <= '1';
			fixed2floatsclr_internal <= '1';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			divfpa_internal <= (others => '0');
			divfpb_internal <= (others => '0');
      fixed2floata_internal <= (others => '0');
			addfpond_internal <= '0';
			mulfpond_internal <= '0';
			divfpond_internal <= '0';
			fixed2floatond_internal <= '0';
			addfpce_internal <= '0';
			mulfpce_internal <= '0';
			divfpce_internal <= '0';
      fixed2floatce_internal <= '0';
			addra <= (others => '0');
      --mux_addr <= (others => '0');
			dia <= (others => '0');
			o_done <= '0';
			i2c_mem_ena <= '0';
      i2c_mem_addra <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := acc15;
						i2c_mem_ena <= '1';
            i := 2;
            j := 0;
					else
						state := idle;
						i2c_mem_ena <= '0';
					end if;
					addfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
					fixed2floatsclr_internal <= '0';
          write_enable <= '0';

        when acc15 => state := acc16;
          m := 2*i;
          n := j*4;
          i2c_mem_ena <= '1';
          o_signed4bit_ena <= '1';
          write_enable <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+m+1, 12)); -- 2422 MSB -- accrow B,A
        when acc16 => state := acc17;
          i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+m+0, 12)); -- 2422 LSB -- accrow D,C
        when acc17 => state := acc18;
          i2c_mem_ena <= '0';
          o_signed4bit_adr <= i2c_mem_douta (3 downto 0); -- accrowA
          tmp1 := i2c_mem_douta (7 downto 4); -- accrowB
        when acc18 => state := acc19;
          o_signed4bit_adr <= tmp1; -- accrowB
          tmp1 := i2c_mem_douta (3 downto 0); -- accrowC
        when acc19 => state := acc20;
          o_signed4bit_adr <= tmp1; -- accrowC
          dia <= i_rom_constants_float; -- out accrowA
          addra <= std_logic_vector (to_unsigned (n+0, 10));
        when acc20 => state := acc21;
          o_signed4bit_adr <= i2c_mem_douta (7 downto 4); -- accrowD
          dia <= i_rom_constants_float; -- out accrowB
          addra <= std_logic_vector (to_unsigned (n+1, 10));
        when acc21 => state := acc22;
          dia <= i_rom_constants_float; -- out accrowC
          addra <= std_logic_vector (to_unsigned (n+2, 10));
        when acc22 => state := acc23;
          dia <= i_rom_constants_float; -- out accrowD
          addra <= std_logic_vector (to_unsigned (n+3, 10));
        when acc23 =>
          o_signed4bit_ena <= '0';
          write_enable <= '0';
          if j = 13 then
            j := 0;
            i := 0;
            state := pow3;
          else
            j := j + 1;
            i := i + 1;
            state := acc15;
          end if;

				when pow3 => state := s0;
          row := 0;
          col := 0;
          i := 0;
       when s0 => state := s1; 	--1
          addfpsclr_internal <= '0';
          mulfpsclr_internal <= '0';
          divfpsclr_internal <= '0';
          fixed2floatsclr_internal <= '0';
          i2c_mem_ena <= '1';
          i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+0, 12)); -- offset LSB 0
        when s1 => state := s2;	--2
          i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- offset MSB 1
        when s2 => state := s3;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+2, 12)); -- 2421 LSB
          vAlphaPixel := i2c_mem_douta (1 downto 0); -- offset LSB 0
        when s3 => state := s4; 	--3
          i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+3, 12)); -- 2421 MSB
          o_signed6bit_ena <= '1';
          o_signed6bit_adr <= vAlphaPixel & i2c_mem_douta (7 downto 4);  -- offset MSB 1
          --report_error("alphaPixel", vAlphaPixel, 0.0);
        when s4 => state := s7;
          valphaRef := i2c_mem_douta; -- alpharef LSB
          addra <= (others => '0');
        when s7 =>
          out_nibble3 <= i_rom_constants_float;
          i2c_mem_addra <= (others => '0');
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <=
          valphaRef (7 downto 0) & i2c_mem_douta; -- alpharef MSB
          i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+1, 12)); -- 2420 LSB
          o_signed6bit_ena <= '0';
          if (fixed2floatrdy_internal = '1') then state := s8;
						--report_error("alphaReference", fixed2floatr_internal, 0.0);
						fixed2floatce_internal <= '0';
						fixed2floatond_internal <= '0';
						fixed2floatsclr_internal <= '1';
            addra <= std_logic_vector (to_unsigned (col+C_ROW, 10)); -- accColumnJ
            o_2powx_4bit_ena <= '1';
            o_2powx_4bit_adr <= i2c_mem_douta (7 downto 4); -- acc scale column for 2^x
					else state := s7; end if;
        when s8 => 			--8
          fixed2floatsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= doa; -- vaccColumnJ
          mulfpb_internal <= i_rom_constants_float; --vaccColumnScale;
          mulfpond_internal <= '1';
          --report_error("accColumnJ", doa, 0.0);
          --report_error("accColumnScale", vaccColumnScale, 0.0);
          if (mulfprdy_internal = '1') then state := s11;
            --report_error ("mulfpa 2 : ",   mulfpa_internal,0.0);
            --report_error ("mulfpb 2 : ",   mulfpb_internal,0.0);
            --report_error ("* mulfpr 2 : ", mulfpr_internal,0.0);
--            vaccColumnJ := mulfpr_internal;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s8; end if;
        when s11 => -- XXX empty calculate/state for rm vaccColumnJ reg
          i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+1, 12)); -- 2420 LSB
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= mulfpr_internal; -- vaccColumnJ
          addfpb_internal <= x"00000000";
          addfpond_internal <= '1';
          if (addfprdy_internal = '1') then state := s13;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            o_2powx_4bit_adr <= i2c_mem_douta (3 downto 0); -- acc scale remnant for 2^x
          else state := s11; end if;
        when s13 =>
          addfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= out_nibble3;
          mulfpb_internal <= i_rom_constants_float; -- 2^accscaleremnant vaccRemScale;
          mulfpond_internal <= '1';
          --report_error("AlphaPixel", out_nibble3, 0.0);
          --report_error("accRemScale", vaccRemScale, 0.0);
          if (mulfprdy_internal = '1') then state := s14;
            --report_error ("mulfpa 1 : ",   mulfpa_internal,0.0);
            --report_error ("mulfpb 1 : ",   mulfpb_internal,0.0);
            --report_error ("* mulfpr 1 : ", mulfpr_internal,0.0);
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s13; end if;
        when s14 => 			--14
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= mulfpr_internal;
          addfpb_internal <= addfpr_internal; -- vaccColumnJ
          addfpond_internal <= '1';
          --report_error("AlphaPixel", vAlphaPixel_ft, 0.0);
          --report_error("accColumnJ", vaccColumnJ, 0.0);
          addra <= std_logic_vector (to_unsigned (row, 10)); -- accrowI
          i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+0, 12)); -- 2420 LSB
          if (addfprdy_internal = '1') then state := s16;
            --report_error ("addfpa 1 : ",   addfpa_internal,0.0);
            --report_error ("addfpb 1 : ",   addfpb_internal,0.0);
            --report_error ("* addfpr 1 : ", addfpr_internal,0.0);
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            o_2powx_4bit_adr <= i2c_mem_douta (3 downto 0); -- acc scale row for 2^x
          else state := s14; end if;
        when s16 =>
          addfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= doa; -- vaccRowI
          mulfpb_internal <= i_rom_constants_float; -- 2^accscalerow vaccRowScale;
          mulfpond_internal <= '1';
          --report_error("accRowI", doa, 0.0);
          --report_error("accRowScale", vaccRowScale, 0.0);
          if (mulfprdy_internal = '1') then state := s17;
            --report_error ("mulfpa 3 : ",   mulfpa_internal,0.0);
            --report_error ("mulfpb 3 : ",   mulfpb_internal,0.0);
            --report_error ("* mulfpr 3 : ", mulfpr_internal,0.0);
            --vaccRowI := mulfpr_internal;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s16; end if;
        when s17 => 			--17
          o_2powx_4bit_ena <= '0';
          mulfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= mulfpr_internal; -- vaccRowI
          addfpond_internal <= '1';
          --report_error("AlphaPixel", vAlphaPixel_ft, 0.0);
          --report_error("accRowI", vaccRowI, 0.0);
          if (addfprdy_internal = '1') then state := s19;
            --report_error ("addfpa 2 : ",   addfpa_internal,0.0);
            --report_error ("addfpb 2 : ",   addfpb_internal,0.0);
            --report_error ("* addfpr 2 : ", addfpr_internal,0.0);
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := s17; end if;
        when s19 => state := s20;
          addfpsclr_internal <= '0';
        when s20 => 			--20
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= fixed2floatr_internal;
          addfpond_internal <= '1';
          --report_error("AlphaPixel", vAlphaPixel_ft, 0.0);
          --report_error("alphaReference", fixed2floatr_internal, 0.0);
          if (addfprdy_internal = '1') then state := s22;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            o_alphascale_1_ena <= '1';
            o_alphascale_1_adr <= i2c_mem_douta (7 downto 4); -- alpha scale
          else state := s20; end if;
        when s22 =>
          addfpsclr_internal <= '0';
          divfpce_internal <= '1';
          divfpa_internal <= addfpr_internal;
          divfpb_internal <= i_rom_constants_float;
          o_alphascale_1_ena <= '0';
          divfpond_internal <= '1';
          --report_error("AlphaPixel", vAlphaPixel_ft, 0.0);
          --report_error("out_nibble5", out_nibble5, 0.0);
          if (divfprdy_internal = '1') then state := s25;
            --report_error ("divfpa 1 : ",   divfpa_internal,0.0);
            --report_error ("divfpb 1 : ",   divfpb_internal,0.0);
            --report_error ("* divfpr 1 : ", divfpr_internal,0.0);
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
            write_enable <= '1';
            addra <= std_logic_vector (to_unsigned (C_ROW+C_COL+i, 10)); -- vAlphaPixel_ft
            dia <= divfpr_internal;
            --synthesis translate_off
            report_error("================vAlphaPixel_ft " & integer'image(i), divfpr_internal, 0.0);
            --synthesis translate_on
          else state := s22; end if;
        when s25 =>
          i := i + 1;
          write_enable <= '0';
          i2c_mem_ena <= '0';
          if (col = C_COL-1) then
            col := 0;
            if (row = C_ROW-1) then
              row := 0;
              state := idle;
              rdy <= '1';
            else
              row := row + 1;
              state := s0;
            end if;
          else
            col := col + 1;
            state := s0;
          end if;
      end case;
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

end architecture Behavioral;
