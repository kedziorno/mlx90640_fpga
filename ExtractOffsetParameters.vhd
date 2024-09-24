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

--use ieee_proposed.fixed_pkg.all;

use work.p_fphdl_package2.all;
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
end ExtractOffsetParameters;

architecture Behavioral of ExtractOffsetParameters is

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

-- xxx nibbles must out in next clock cycle
signal nibble1,nibble2,nibble4 : std_logic_vector (3 downto 0);
signal nibble3 : std_logic_vector (5 downto 0);
signal out_nibble1,out_nibble2,out_nibble3,out_nibble4 : std_logic_vector (31 downto 0);

signal write_enable : std_logic;

signal rdy : std_logic;

signal stemp1 : std_logic_vector (15 downto 0);

constant C_COL : integer := 32;
constant C_ROW : integer := 24;

signal fixed2floata_internal : STD_LOGIC_VECTOR(63 DOWNTO 0);
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

o_rdy <= rdy;
o_do <= doa when rdy = '1' else (others => '0');
mux_addr <= addra when rdy = '0' else std_logic_vector (to_unsigned (to_integer(unsigned (i_addr))+C_COL+C_ROW,10)) when rdy = '1' else (others => '0');
mux_dia <= dia when rdy = '0' else (others => '0');

p0 : process (i_clock) is
	type states is (idle,
	occ1,occ2,occ3,occ4,
	occ5,occ6,occ19,
	occ20,occ21,occ22,occ23,occ24,
	occ25,occ26,occ27,occ28,occ29,
	occ30,occ31,occ139,
	pow0,pow1,pow2,pow4,
	s0,s1,s2,s3,s6,s7,s8,s9,s11,s14,s15,s17,s18,s20,s23);
	variable state : states;
	variable voccRemScale : std_logic_vector (31 downto 0);
	variable voccColumnScale : std_logic_vector (31 downto 0);
	variable voccRowScale : std_logic_vector (31 downto 0);
	variable voccRemScale1 : std_logic_vector (3 downto 0);
	variable voccColumnScale1 : std_logic_vector (3 downto 0);
	variable voccRowScale1 : std_logic_vector (3 downto 0);
	variable voffsetRef1: std_logic_vector (15 downto 0);
	variable voffsetRef : std_logic_vector (15 downto 0);
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable vocccolumnj,occrowi,voccrowi,pix_os_average,voffset_ft : std_logic_vector (31 downto 0);
	variable temp1,voffset : std_logic_vector (15 downto 0);
	variable col : integer range 0 to C_COL-1;
	variable row : integer range 0 to C_ROW-1;
	variable i : integer range 0 to (C_ROW*C_COL)-1 := 1;
  variable m : integer range 0 to 31 := 0;
  variable n : integer range 0 to 55 := 0;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			nibble1 <= (others => '0');
			nibble2 <= (others => '0');
			nibble3 <= (others => '0');
			write_enable <= '0';
			rdy <= '0';
			addfpsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			fixed2floatsclr_internal <= '1';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			addfpa_internal <= (others => '0');
			addfpb_internal <= (others => '0');
			addfpond_internal <= '0';
			mulfpond_internal <= '0';
			addfpce_internal <= '0';
			mulfpce_internal <= '0';
			addra <= (others => '0');
			dia <= (others => '0');
			i2c_mem_ena <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := occ1;
						i2c_mem_ena <= '1';
						-- XXX check LSB/MSB order
						-- XXX rewrite temp1 var for each reads - parallel
            i2c_mem_addra <= std_logic_vector (to_unsigned (32+0, 12)); -- 2410 LSB k_ptat,scale_occ_row,[scale_occ_column,scale_occ_remnand] 0x2410
					else
						state := idle;
						i2c_mem_ena <= '0';
					end if;
					addfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					fixed2floatsclr_internal <= '0';
				when occ1 => state := occ2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+1, 12)); -- 2410 MSB [k_ptat,scale_occ_row],scale_occ_column,scale_occ_remnand 0x2410
        when occ2 => state := occ3;
          i2c_mem_addra <= std_logic_vector (to_unsigned (32+2, 12)); -- 2411 LSB pix_os_average
          temp1 (15 downto 8) := i2c_mem_douta; -- out 2410 LSB [scale_occ_column,scale_occ_remnand]
				when occ3 => state := occ4;
          i2c_mem_addra <= std_logic_vector (to_unsigned (32+3, 12)); -- 2411 MSB pix_os_average
					temp1 (7 downto 0) := i2c_mem_douta; -- out 2410 MSB [k_ptat,scale_occ_row]
					nibble1 <= temp1 (3 downto 0); -- 2410 LSB scale_occ_remnand
				when occ4 => state := occ5;
          i2c_mem_addra <= std_logic_vector (to_unsigned (32+5, 12)); -- 2412 MSB [occ_rows_04,occ_rows_03],occ_rows_02,occ_rows_01
					voffsetRef (15 downto 8) := i2c_mem_douta; -- 2411 LSB offsetref
					voccRemScale := out_nibble1; -- out 2410 LSB scale_occ_remnand signed
					voccRemScale1 := temp1 (3 downto 0); -- out 2410 LSB scale_occ_remnand for 2^x
					nibble1 <= temp1 (7 downto 4); -- 2410 LSB scale_occ_column
				when occ5 => state := occ6;
          i2c_mem_addra <= std_logic_vector (to_unsigned (32+4, 12)); -- 2412 LSB occ_rows_04,occ_rows_03,[occ_rows_02,occ_rows_01]
          voffsetRef (7 downto 0) := i2c_mem_douta; -- 2411 MSB offsetref
					voccColumnScale := out_nibble1; -- out 2410 LSB scale_occ_column signed
					voccColumnScale1 := temp1 (7 downto 4); -- 2410 LSB scale_occ_column for 2^x
					nibble1 <= temp1 (11 downto 8); -- 2410 MSB scale_occ_row
				when occ6 => state := occ19;
					temp1 (7 downto 0) := i2c_mem_douta; -- 2412 MSB [occ_rows_04,occ_rows_03]
					voccRowScale := out_nibble1; -- out 2410 MSB scale_occ_row signed
					voccRowScale1 := temp1 (11 downto 8); -- 2410 MSB scale_occ_row for 2^x
				when occ19 => state := occ20;
          temp1 (15 downto 8) := i2c_mem_douta; -- 2412 LSB [occ_rows_02,occ_rows_01]
					nibble2 <= temp1 (3 downto 0); -- 2412 LSB occ_rows_01
				when occ20 => state := occ21;
					dia <= out_nibble2; -- out 2412 LSB occ_rows_01 signed
					addra <= std_logic_vector (to_unsigned (0, 10));
          write_enable <= '1';
					nibble2 <= temp1 (7 downto 4); -- 2412 LSB occ_rows_02
				when occ21 => state := occ22;
					dia <= out_nibble2; -- out 2412 LSB occ_rows_02 signed
					addra <= std_logic_vector (to_unsigned (1, 10));
					nibble2 <= temp1 (11 downto 8); -- 2412 MSB occ_rows_03
				when occ22 => state := occ23;
					dia <= out_nibble2; -- out 2412 MSB occ_rows_03 signed
					addra <= std_logic_vector (to_unsigned (2, 10));
					nibble2 <= temp1 (15 downto 12); -- 2412 MSB occ_rows_04
				when occ23 => state := occ24;
					dia <= out_nibble2; -- out 2412 MSB occ_rows_04 signed
					addra <= std_logic_vector (to_unsigned (3, 10));
					i := 1;
        when occ24 => state := occ25;
          m := 2*i;
          i2c_mem_addra <= std_logic_vector (to_unsigned (32+m+4+1, 12)); -- 2413 MSB -- occrow5-8
        when occ25 => state := occ26;
          i2c_mem_addra <= std_logic_vector (to_unsigned (32+m+4, 12)); -- 2413 LSB -- occrow5-8
        when occ26 => state := occ27;
          temp1 (7 downto 0) := i2c_mem_douta;
          nibble2 <= temp1 (3 downto 0); -- occrowA
        when occ27 => state := occ28;
          n := i*4;
          temp1 (15 downto 8) := i2c_mem_douta;
          dia <= out_nibble2;
          addra <= std_logic_vector (to_unsigned (n+0, 10));
          nibble2 <= temp1 (7 downto 4); -- occrowB
        when occ28 => state := occ29;
          dia <= out_nibble2;
          addra <= std_logic_vector (to_unsigned (n+1, 10));
          nibble2 <= temp1 (11 downto 8); -- occrowC
        when occ29 => state := occ30;
          dia <= out_nibble2;
          addra <= std_logic_vector (to_unsigned (n+2, 10));
          nibble2 <= temp1 (15 downto 12); -- occrowD
        when occ30 => state := occ31;
          dia <= out_nibble2;
          addra <= std_logic_vector (to_unsigned (n+3, 10));
        when occ31 =>
          if i = 13 then
            i := 0;
            state := occ139;
          else
            i := i + 1;
            state := occ24;
          end if;
				when occ139 => state := pow0;
					write_enable <= '0';
          i := 0;
				when pow0 => state := pow1;
					addra <= (others => '0');
					nibble4 <= voccRemScale1;
				when pow1 => state := pow2;
					voccRemScale := out_nibble4; -- 2^occscaleremnant
					--report "voccRemScale : " & real'image (ap_slv2fp (voccRemScale));
					nibble4 <= voccColumnScale1;
				when pow2 => state := pow4;
					voccColumnScale := out_nibble4; -- 2^occscalecolumn
					--report "voccColumnScale : " & real'image (ap_slv2fp (voccColumnScale));
					nibble4 <= voccRowScale1;
				when pow4 =>
					voccRowScale := out_nibble4; -- 2^occscalerow
					--report "voccRowScale : " & real'image (ap_slv2fp (voccRowScale));
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <=
          voffsetRef (15) & voffsetRef (15) & 
          voffsetRef (15) & voffsetRef (15) & 
          voffsetRef (15) & voffsetRef (15) & 
          voffsetRef (15) & voffsetRef (15) & 
          voffsetRef (15) & voffsetRef (15) & 
          voffsetRef (15) & voffsetRef (15) & 
          voffsetRef (15) & voffsetRef (15) & 
          voffsetRef (15) & voffsetRef (15) & 
          voffsetRef (15) & voffsetRef (15) & 
          voffsetRef (15) & voffsetRef & "00000000000000000000000000000";
					if (fixed2floatrdy_internal = '1') then state := s0;
						pix_os_average := fixed2floatr_internal;
						--report "pix_os_average : " & real'image (ap_slv2fp (pix_os_average));
						fixed2floatce_internal <= '0';
						fixed2floatond_internal <= '0';
						fixed2floatsclr_internal <= '1';
					else state := pow4; end if;
        when s0 => state := s1;
          addfpsclr_internal <= '0';
          mulfpsclr_internal <= '0';
          fixed2floatsclr_internal <= '0';
          vOffset_ft := (others => '0'); -- XXX var must be as tmp, used between mul/add
          i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+0, 12)); -- offset LSB 0
          addra <= std_logic_vector (to_unsigned (col+C_ROW, 10)); -- OCCColumnJ
        when s1 => state := s2;
          i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- offset MSB 1
          addra <= std_logic_vector (to_unsigned (row, 10)); -- OCCrowI
        when s2 => state := s3;
          vOCCColumnJ := doa;
          vOffset (15 downto 8) := i2c_mem_douta;
          --report "vOCCColumnJ : " & real'image (ap_slv2fp (vOCCColumnJ));
        when s3 => state := s6;
          vOCCRowI := doa;
          vOffset (7 downto 0) := i2c_mem_douta;
          --report "vOCCRowI : " & real'image (ap_slv2fp (vOCCRowI));
        when s6 =>
          nibble3 <= vOffset (15 downto 10); -- XXX comb, maybe in independent state (check syn)
          mulfpce_internal <= '1';
          mulfpa_internal <= out_nibble3;
          mulfpb_internal <= voccRemScale;
          mulfpond_internal <= '1';
          --report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
          --report "voccRemScale : " & real'image (ap_slv2fp (voccRemScale));
          if (mulfprdy_internal = '1') then state := s7; -- XXX wait 2 cycles between mul's
            vOffset_ft := mulfpr_internal;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s6; end if;
        when s7 => state := s8;
          mulfpsclr_internal <= '0';
        when s8 =>
          mulfpce_internal <= '1';
          mulfpa_internal <= vOCCColumnJ;
          mulfpb_internal <= voccColumnScale;
          mulfpond_internal <= '1';
          --report "vOCCColumnJ : " & real'image (ap_slv2fp (vOCCColumnJ));
          --report "voccColumnScale : " & real'image (ap_slv2fp (voccColumnScale));
          if (mulfprdy_internal = '1') then state := s9;
            vOCCColumnJ := mulfpr_internal;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s8; end if;
        when s9 => state := s11;
          mulfpsclr_internal <= '0';
        when s11 =>
          mulfpsclr_internal <= '0';
          mulfpce_internal <= '1';
          mulfpa_internal <= vOCCRowI;
          mulfpb_internal <= voccRowScale;
          mulfpond_internal <= '1';
          --report "vOCCRowI : " & real'image (ap_slv2fp (vOCCRowI));
          --report "voccRowScale : " & real'image (ap_slv2fp (voccRowScale));
          if (mulfprdy_internal = '1') then state := s14;
            vOCCRowI := mulfpr_internal;
            mulfpce_internal <= '0';
            mulfpond_internal <= '0';
            mulfpsclr_internal <= '1';
          else state := s11; end if;
        when s14 =>
          mulfpsclr_internal <= '0';
          addfpsclr_internal <= '0';
          addfpce_internal <= '1';
          addfpa_internal <= vOffset_ft;
          addfpb_internal <= vOCCColumnJ;
          addfpond_internal <= '1';
          --report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
          --report "vOCCColumnJ : " & real'image (ap_slv2fp (vOCCColumnJ));
          if (addfprdy_internal = '1') then state := s15;
            vOffset_ft := addfpr_internal;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := s14; end if;
        when s15 => state := s17;
          addfpsclr_internal <= '0';
        when s17 =>
          addfpce_internal <= '1';
          addfpa_internal <= vOffset_ft;
          addfpb_internal <= vOCCRowI;
          addfpond_internal <= '1';
          --report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
          --report "vOCCRowI : " & real'image (ap_slv2fp (vOCCRowI));
          if (addfprdy_internal = '1') then state := s18; -- XXX must wait 2 ticks between add's
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
          else state := s17; end if;
        when s18 => state := s20;
          addfpsclr_internal <= '0';
        when s20 =>
          addfpce_internal <= '1';
          addfpa_internal <= addfpr_internal;
          addfpb_internal <= pix_os_average;
          addfpond_internal <= '1';
          --report "vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
          --report "pix_os_average : " & real'image (ap_slv2fp (pix_os_average));
          if (addfprdy_internal = '1') then state := s23;
            vOffset_ft := addfpr_internal;
            addfpce_internal <= '0';
            addfpond_internal <= '0';
            addfpsclr_internal <= '1';
            write_enable <= '1';
            addra <= std_logic_vector (to_unsigned (C_ROW+C_COL+i, 10)); -- vOffset_ft
            dia <= vOffset_ft;
            --synthesis translate_off
            report "================vOffset_ft : " & real'image (ap_slv2fp (vOffset_ft));
            --synthesis translate_on
            i := i + 1;
          else state := s20; end if;
        when s23 =>
          write_enable <= '0';
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

inst_mem_occ : mem_ramb16_s36_x2
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

--INIT_7f => X"41700000 41600000 41500000 41400000 41300000 41200000 41100000 41000000", -- unsigned 0-15 for accremscale,accrowscale,acccolscale
--INIT_7e => X"40e00000 40c00000 40a00000 40800000 40400000 40000000 3f800000 22000000",
with nibble1 select out_nibble1 <= -- x - occremscale,occrowscale,occcolscale unsigned 4bit
x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"41000000" when x"8", x"41100000" when x"9", x"41200000" when x"a", x"41300000" when x"b",
x"41400000" when x"c", x"41500000" when x"d", x"41600000" when x"e", x"41700000" when x"f",
x"00000000" when others;

with nibble2 select out_nibble2 <= -- >7,-16 - rows1-24,cols1-32 signed 4bit
x"00000000" when x"0", x"3f800000" when x"1", x"40000000" when x"2", x"40400000" when x"3",
x"40800000" when x"4", x"40a00000" when x"5", x"40c00000" when x"6", x"40e00000" when x"7",
x"c1000000" when x"8", x"c0e00000" when x"9", x"c0c00000" when x"a", x"c0a00000" when x"b",
x"c0800000" when x"c", x"c0400000" when x"d", x"c0000000" when x"e", x"bf800000" when x"f",
x"00000000" when others;

with nibble3 select out_nibble3 <= -- >31,-64 - offset raw
x"40e00000" when "000111",x"40c00000" when "000110",x"40a00000" when "000101",x"40800000" when "000100",x"40400000" when "000011",x"40000000" when "000010",x"3f800000" when "000001",x"00000000" when "000000",
x"41700000" when "001111",x"41600000" when "001110",x"41500000" when "001101",x"41400000" when "001100",x"41300000" when "001011",x"41200000" when "001010",x"41100000" when "001001",x"41000000" when "001000",
x"41b80000" when "010111",x"41b00000" when "010110",x"41a80000" when "010101",x"41a00000" when "010100",x"41980000" when "010011",x"41900000" when "010010",x"41880000" when "010001",x"41800000" when "010000",
x"41f80000" when "011111",x"41f00000" when "011110",x"41e80000" when "011101",x"41e00000" when "011100",x"41d80000" when "011011",x"41d00000" when "011010",x"41c80000" when "011001",x"41c00000" when "011000",
x"c1c80000" when "100111",x"c1d00000" when "100110",x"c1d80000" when "100101",x"c1e00000" when "100100",x"c1e80000" when "100011",x"c1f00000" when "100010",x"c1f80000" when "100001",x"c2000000" when "100000",
x"c1880000" when "101111",x"c1900000" when "101110",x"c1980000" when "101101",x"c1a00000" when "101100",x"c1a80000" when "101011",x"c1b00000" when "101010",x"c1b80000" when "101001",x"c1c00000" when "101000",
x"c1100000" when "110111",x"c1200000" when "110110",x"c1300000" when "110101",x"c1400000" when "110100",x"c1500000" when "110011",x"c1600000" when "110010",x"c1700000" when "110001",x"c1800000" when "110000",
x"bf800000" when "111111",x"c0000000" when "111110",x"c0400000" when "111101",x"c0800000" when "111100",x"c0a00000" when "111011",x"c0c00000" when "111010",x"c0e00000" when "111001",x"c1000000" when "111000",
x"00000000" when others;

--INIT_01 => X"47000000 46800000 46000000 45800000 45000000 44800000 44000000 43800000",
--INIT_00 => X"43000000 42800000 42000000 41800000 41000000 40800000 40000000 3f800000",
with nibble4 select out_nibble4 <= -- 2^x unsigned 0-15
x"3f800000" when x"0", x"40000000" when x"1", x"40800000" when x"2", x"41000000" when x"3",
x"41800000" when x"4", x"42000000" when x"5", x"42800000" when x"6", x"43000000" when x"7",
x"43800000" when x"8", x"44000000" when x"9", x"44800000" when x"a", x"45000000" when x"b",
x"45800000" when x"c", x"46000000" when x"d", x"46800000" when x"e", x"47000000" when x"f",
x"00000000" when others;

end Behavioral;
