----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:36:52 06/11/2023 
-- Design Name: 
-- Module Name:    ExtractAlphaParameters_process_p0 - Behavioral 
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

entity ExtractAlphaParameters_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_doa : in std_logic_vector (31 downto 0);
o_dia : out std_logic_vector (31 downto 0);
o_do : out std_logic_vector (31 downto 0); -- xxx dont exists
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024 xxx dont exists

o_done : out std_logic;
o_rdy : out std_logic;

o_write_enable : out std_logic;

o_addra : out std_logic_vector (9 downto 0);

-- xxx nibbles must out in next clock xyxle
nibble1_out,nibble2_out,nibble4_out,nibble5_out : out std_logic_vector (3 downto 0);
nibble3_out : out std_logic_vector (5 downto 0);
nibble1_in,nibble2_in,nibble3_in,nibble4_in,nibble5_in : in std_logic_vector (31 downto 0);

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
end ExtractAlphaParameters_process_p0;

architecture Behavioral of ExtractAlphaParameters_process_p0 is

signal fixed2floata_internal : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond_internal : STD_LOGIC;
signal fixed2floatsclr_internal : STD_LOGIC;
signal fixed2floatce_internal : STD_LOGIC;
signal fixed2floatr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal fixed2floatrdy_internal : STD_LOGIC;

signal mulfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond_internal : STD_LOGIC;
signal mulfpsclr_internal : STD_LOGIC;
signal mulfpce_internal : STD_LOGIC;
signal mulfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal mulfprdy_internal : STD_LOGIC;

signal addfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond_internal : STD_LOGIC;
signal addfpsclr_internal : STD_LOGIC;
signal addfpce_internal : STD_LOGIC;
signal addfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal addfprdy_internal : STD_LOGIC;

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal divfprdy_internal : STD_LOGIC;

signal divfp_wait : integer range 0 to C_DIVFP_WAIT-1;
signal addfp_wait : integer range 0 to C_ADDFP_WAIT-1;
signal mulfp_wait : integer range 0 to C_MULFP_WAIT-1;
signal fi2fl_wait : integer range 0 to C_FI2FL_WAIT-1;
signal divfp_run,divfp_rdy : std_logic;
signal addfp_run,addfp_rdy : std_logic;
signal mulfp_run,mulfp_rdy : std_logic;
signal fi2fl_run,fi2fl_rdy : std_logic;

begin

fixed2floata <= fixed2floata_internal;
fixed2floatond <= fixed2floatond_internal;
fixed2floatsclr <= fixed2floatsclr_internal;
fixed2floatce <= fixed2floatce_internal;
fixed2floatr_internal <= fixed2floatr;
--fixed2floatrdy_internal <= fixed2floatrdy;

mulfpa <= mulfpa_internal;
mulfpb <= mulfpb_internal;
mulfpond <= mulfpond_internal;
mulfpsclr <= mulfpsclr_internal;
mulfpce <= mulfpce_internal;
mulfpr_internal <= mulfpr;
--mulfprdy_internal <= mulfprdy;

addfpa <= addfpa_internal;
addfpb <= addfpb_internal;
addfpond <= addfpond_internal;
addfpsclr <= addfpsclr_internal;
addfpce <= addfpce_internal;
addfpr_internal <= addfpr;
--addfprdy_internal <= addfprdy;

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
--divfprdy_internal <= divfprdy;

p1_counter_divfp : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      divfp_wait <= 0;
    elsif (divfp_rdy = '1') then
      divfp_wait <= 0;
    elsif (divfp_run = '1') then
      divfp_wait <= divfp_wait + 1;
    end if;
  end if;
end process p1_counter_divfp;

p1_counter_mulfp : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      mulfp_wait <= 0;
    elsif (mulfp_rdy = '1') then
      mulfp_wait <= 0;
    elsif (mulfp_run = '1') then
      mulfp_wait <= mulfp_wait + 1;
    end if;
  end if;
end process p1_counter_mulfp;

p1_counter_addfp : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      addfp_wait <= 0;
    elsif (addfp_rdy = '1') then
      addfp_wait <= 0;
    elsif (addfp_run = '1') then
      addfp_wait <= addfp_wait + 1;
    end if;
  end if;
end process p1_counter_addfp;

p1_counter_fi2fl : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      fi2fl_wait <= 0;
    elsif (fi2fl_rdy = '1') then
      fi2fl_wait <= 0;
    elsif (fi2fl_run = '1') then
      fi2fl_wait <= fi2fl_wait + 1;
    end if;
  end if;
end process p1_counter_fi2fl;

p0 : process (i_clock) is
	type states is (idle,
	acc0,acc1,acc2,acc3,acc4,
	acc5,acc6,acc7,acc8,acc9,
	acc10,acc11,acc12,acc13,acc14,
	acc15,acc16,acc17,acc18,acc19,
	acc20,acc21,acc22,acc23,acc24,
	acc25,acc26,acc27,acc28,acc29,
	acc30,acc31,acc32,acc33,acc34,
	acc35,acc36,acc37,acc38,acc39,
	acc40,acc41,acc42,acc43,acc44,
	acc45,acc46,acc47,acc48,acc49,
	acc50,acc51,acc52,acc53,acc54,
	acc55,acc56,acc57,acc58,acc59,	
	acc60,acc61,acc62,acc63,acc64,
	acc65,acc66,acc67,acc68,acc69,
	acc70,acc71,acc72,acc73,acc74,
	acc75,acc76,acc77,acc78,acc79,
	acc80,acc81,acc82,acc83,acc84,
	acc85,acc86,acc87,acc88,acc89,
	acc90,acc91,acc92,acc93,acc94,
	acc95,acc96,acc97,acc98,acc99,
	acc100,acc101,acc102,acc103,acc104,
	acc105,acc106,acc107,acc108,acc109,
	acc110,acc111,acc112,acc113,acc114,
	acc115,acc116,acc117,acc118,acc119,
	acc120,acc121,acc122,acc123,acc124,
	acc125,acc126,acc127,acc128,acc129,
	acc130,acc131,acc132,acc133,acc134,
	acc135,acc136,acc137,acc138,acc139,
	acc140,acc141,
	pow0,pow1,pow2,pow3,pow4,pow5,
	s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,
	ending);
	variable state : states;
	variable vaccRemScale : std_logic_vector (31 downto 0);
	variable vaccColumnScale : std_logic_vector (31 downto 0);
	variable vaccRowScale : std_logic_vector (31 downto 0);

	variable vaccRemScale1 : std_logic_vector (3 downto 0);
	variable vaccColumnScale1 : std_logic_vector (3 downto 0);
	variable vaccRowScale1 : std_logic_vector (3 downto 0);

	variable valphaRef1: std_logic_vector (15 downto 0);
	variable valphaRef : std_logic_vector (15 downto 0);
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable vacccolumnj,accrowi,vaccrowi,valphaReference_ft,vAlphaPixel_ft : std_logic_vector (31 downto 0);
	variable temp1,vAlphaPixel : std_logic_vector (15 downto 0);

  constant C_COL : integer := 32;
  constant C_ROW : integer := 24;
	variable col : integer range 0 to C_COL-1;
	variable row : integer range 0 to C_ROW-1;
	variable i : integer range 0 to (C_ROW*C_COL)-1;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			nibble1_out <= (others => '0');
			nibble2_out <= (others => '0');
			nibble3_out <= (others => '0');
			o_write_enable <= '0';
			o_rdy <= '0';
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
			addfpond_internal <= '0';
			mulfpond_internal <= '0';
			divfpond_internal <= '0';
			addfpce_internal <= '0';
			mulfpce_internal <= '0';
			divfpce_internal <= '0';
			o_addra <= (others => '0');
			o_dia <= (others => '0');
			o_done <= '0';
			i2c_mem_ena <= '0';
      divfp_run <= '0';
      divfp_rdy <= '0';
      mulfp_run <= '0';
      mulfp_rdy <= '0';
      addfp_run <= '0';
      addfp_rdy <= '0';
      fi2fl_run <= '0';
      fi2fl_rdy <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := acc0;
						i2c_mem_ena <= '1';
						o_write_enable <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
						o_write_enable <= '0';
					end if;
				when acc0 => state := acc1;
					addfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
					fixed2floatsclr_internal <= '0';
					o_rdy <= '0';
					
				when acc1 => state := acc2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+0, 12)); -- 2420 LSB
				when acc2 => state := acc3;
				when acc3 => state := acc4;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+1, 12)); -- 2420 MSB
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc4 => state := acc5;
				when acc5 => state := acc6;
					temp1 (7 downto 0) := i2c_mem_douta;
					----------report_error (temp1, 0.0);
				when acc6 => state := acc7;
					nibble1_out <= temp1 (3 downto 0); -- acc scale remnant
				when acc7 => state := acc8;
				
					vaccRemScale := nibble1_in; -- out acc scale remnant signed
					vaccRemScale1 := temp1 (3 downto 0); -- acc scale remnant for 2^x
					
					nibble1_out <= temp1 (7 downto 4); -- acc scale column
				when acc8 => state := acc9;
				
					vaccColumnScale := nibble1_in; -- out acc scale column signed
					vaccColumnScale1 := temp1 (7 downto 4); -- acc scale column for 2^x

					nibble1_out <= temp1 (11 downto 8); -- acc scale row
					nibble5_out <= temp1 (15 downto 12); -- alpha scale
				when acc9 => state := acc10;

					vaccRowScale := nibble1_in; -- out acc row column signed
					vaccRowScale1 := temp1 (11 downto 8); -- acc scale row for 2^x
--					vAlphaScale := nibble5_in;

				when acc10 => state := acc11;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+2, 12)); -- 2421 LSB
				when acc11 => state := acc12;
				when acc12 => state := acc13;
					valphaRef (15 downto 8) := i2c_mem_douta; -- alpharef LSB
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+3, 12)); -- 2422 MSB
				when acc13 => state := acc14;
				when acc14 => state := acc15;
					valphaRef (7 downto 0) := i2c_mem_douta; -- alpharef MSB
					------report_error (valphaRef, 0.0);
				
					
				when acc15 => state := acc16;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+4, 12)); -- 2422 LSB -- accrow1-4
				when acc16 => state := acc17;
				when acc17 => state := acc18;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+5, 12)); -- 2422 MSB -- accrow1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc18 => state := acc19;
				when acc19 => state := acc20;
					temp1 (7 downto 0) := i2c_mem_douta;
					----------report_error (temp1, 0.0);
					nibble2_out <= temp1 (3 downto 0); -- accrowA
				when acc20 => state := acc21;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (0, 10));
					nibble2_out <= temp1 (7 downto 4); -- accrowB
				when acc21 => state := acc22;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (1, 10));
					nibble2_out <= temp1 (11 downto 8); -- accrowC
				when acc22 => state := acc23;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (2, 10));
					nibble2_out <= temp1 (15 downto 12); -- accrowD
				when acc23 => state := acc24;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (3, 10));




				when acc24 => state := acc25;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+6, 12)); -- 2423 LSB -- accrow5-8
				when acc25 => state := acc26;
				when acc26 => state := acc27;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+7, 12)); -- 2423 MSB -- accrow5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc27 => state := acc28;
				when acc28 => state := acc29;
					temp1 (7 downto 0) := i2c_mem_douta;
					----------report_error (temp1, 0.0);
					nibble2_out <= temp1 (3 downto 0); -- accrowA
				when acc29 => state := acc30;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (4, 10));
					nibble2_out <= temp1 (7 downto 4); -- accrowB
				when acc30 => state := acc31;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (5, 10));
					nibble2_out <= temp1 (11 downto 8); -- accrowC
				when acc31 => state := acc32;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (6, 10));
					nibble2_out <= temp1 (15 downto 12); -- accrowD
				when acc32 => state := acc33;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (7, 10));


				when acc33 => state := acc34;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+8, 12)); -- 2424 LSB -- accrow9-12
				when acc34 => state := acc35;
				when acc35 => state := acc36;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+9, 12)); -- 2424 MSB -- accrow9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc36 => state := acc37;
				when acc37 => state := acc38;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- accrowA
				when acc38 => state := acc39;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (8, 10));
					nibble2_out <= temp1 (7 downto 4); -- accrowB
				when acc39 => state := acc40;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (9, 10));
					nibble2_out <= temp1 (11 downto 8); -- accrowC
				when acc40 => state := acc41;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (10, 10));
					nibble2_out <= temp1 (15 downto 12); -- accrowD
				when acc41 => state := acc42;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (11, 10));



				when acc42 => state := acc43;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+10, 12)); -- 2425 LSB -- accrow13-16
				when acc43 => state := acc44;
				when acc44 => state := acc45;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+11, 12)); -- 2425 MSB -- accrow13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc45 => state := acc46;
				when acc46 => state := acc47;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- accrowA
				when acc47 => state := acc48;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (12, 10));
					nibble2_out <= temp1 (7 downto 4); -- accrowB
				when acc48 => state := acc49;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (13, 10));
					nibble2_out <= temp1 (11 downto 8); -- accrowC
				when acc49 => state := acc50;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (14, 10));
					nibble2_out <= temp1 (15 downto 12); -- accrowD
				when acc50 => state := acc51;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (15, 10));



				when acc51 => state := acc52;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+12, 12)); -- 2426 LSB -- accrow17-20
				when acc52 => state := acc53;
				when acc53 => state := acc54;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+13, 12)); -- 2426 MSB -- accrow17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc54 => state := acc55;
				when acc55 => state := acc56;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- accrowA
				when acc56 => state := acc57;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (32, 10));
					nibble2_out <= temp1 (7 downto 4); -- accrowB
				when acc57 => state := acc58;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (17, 10));
					nibble2_out <= temp1 (11 downto 8); -- accrowC
				when acc58 => state := acc59;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (18, 10));
					nibble2_out <= temp1 (15 downto 12); -- accrowD
				when acc59 => state := acc60;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (19, 10));


				when acc60 => state := acc61;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+14, 12)); -- 2427 LSB -- accrow21-24
				when acc61 => state := acc62;
				when acc62 => state := acc63;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+15, 12)); -- 2427 MSB -- accrow21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc63 => state := acc64;
				when acc64 => state := acc65;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- accrowA
				when acc65 => state := acc66;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (20, 10));
					nibble2_out <= temp1 (7 downto 4); -- accrowB
				when acc66 => state := acc67;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (21, 10));
					nibble2_out <= temp1 (11 downto 8); -- accrowC
				when acc67 => state := acc68;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (22, 10));
					nibble2_out <= temp1 (15 downto 12); -- accrowD
				when acc68 => state := acc69;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (23, 10));


				when acc69 => state := acc70;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+16, 12)); -- 2428 LSB -- acccol1-4
				when acc70 => state := acc71;
				when acc71 => state := acc72;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+17, 12)); -- 2428 MSB -- acccol1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc72 => state := acc73;
				when acc73 => state := acc74;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- acccolA
				when acc74 => state := acc75;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (24, 10));
					nibble2_out <= temp1 (7 downto 4); -- acccolB
				when acc75 => state := acc76;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (25, 10));
					nibble2_out <= temp1 (11 downto 8); -- acccolC
				when acc76 => state := acc77;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (26, 10));
					nibble2_out <= temp1 (15 downto 12); -- acccolD
				when acc77 => state := acc78;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (27, 10));


				when acc78 => state := acc79;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+18, 12)); -- 2429 LSB -- acccol5-8
				when acc79 => state := acc80;
				when acc80 => state := acc81;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+19, 12)); -- 2429 MSB -- acccol5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc81 => state := acc82;
				when acc82 => state := acc83;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- acccolA
				when acc83 => state := acc84;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (28, 10));
					nibble2_out <= temp1 (7 downto 4); -- acccolB
				when acc84 => state := acc85;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (29, 10));
					nibble2_out <= temp1 (11 downto 8); -- acccolC
				when acc85 => state := acc86;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (30, 10));
					nibble2_out <= temp1 (15 downto 12); -- acccolD
				when acc86 => state := acc87;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (31, 10));


				when acc87 => state := acc88;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+20, 12)); -- 242a LSB -- acccol9-12
				when acc88 => state := acc89;
				when acc89 => state := acc90;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+21, 12)); -- 242a MSB -- acccol9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc90 => state := acc91;
				when acc91 => state := acc92;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- acccolA
				when acc92 => state := acc93;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (32, 10));
					nibble2_out <= temp1 (7 downto 4); -- acccolB
				when acc93 => state := acc94;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (33, 10));
					nibble2_out <= temp1 (11 downto 8); -- acccolC
				when acc94 => state := acc95;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (34, 10));
					nibble2_out <= temp1 (15 downto 12); -- acccolD
				when acc95 => state := acc96;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (35, 10));


				when acc96 => state := acc97;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+22, 12)); -- 242b LSB -- acccol13-16
				when acc97 => state := acc98;
				when acc98 => state := acc99;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+23, 12)); -- 242b MSB -- acccol13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc99 => state := acc100;
				when acc100 => state := acc101;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- acccolA
				when acc101 => state := acc102;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (36, 10));
					nibble2_out <= temp1 (7 downto 4); -- acccolB
				when acc102 => state := acc103;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (37, 10));
					nibble2_out <= temp1 (11 downto 8); -- acccolC
				when acc103 => state := acc104;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (38, 10));
					nibble2_out <= temp1 (15 downto 12); -- acccolD
				when acc104 => state := acc105;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (39, 10));


				when acc105 => state := acc106;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+24, 12)); -- 242c LSB -- acccol17-20
				when acc106 => state := acc107;
				when acc107 => state := acc108;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+25, 12)); -- 242c MSB -- acccol17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc108 => state := acc109;
				when acc109 => state := acc110;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- acccolA
				when acc110 => state := acc111;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (40, 10));
					nibble2_out <= temp1 (7 downto 4); -- acccolB
				when acc111 => state := acc112;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (41, 10));
					nibble2_out <= temp1 (11 downto 8); -- acccolC
				when acc112 => state := acc113;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (42, 10));
					nibble2_out <= temp1 (15 downto 12); -- acccolD
				when acc113 => state := acc114;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (43, 10));



				when acc114 => state := acc115;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+26, 12)); -- 242d LSB -- acccol21-24
				when acc115 => state := acc116;
				when acc116 => state := acc117;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+27, 12)); -- 242d MSB -- acccol21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc117 => state := acc118;
				when acc118 => state := acc119;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- acccolA
				when acc119 => state := acc120;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (44, 10));
					nibble2_out <= temp1 (7 downto 4); -- acccolB
				when acc120 => state := acc121;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (45, 10));
					nibble2_out <= temp1 (11 downto 8); -- acccolC
				when acc121 => state := acc122;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (46, 10));
					nibble2_out <= temp1 (15 downto 12); -- acccolD
				when acc122 => state := acc123;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (47, 10));



				when acc123 => state := acc124;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+28, 12)); -- 242e LSB -- acccol25-28
				when acc124 => state := acc125;
				when acc125 => state := acc126;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+29, 12)); -- 242e MSB -- acccol25-28
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc126 => state := acc127;
				when acc127 => state := acc128;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble2_out <= temp1 (3 downto 0); -- acccolA
				when acc128 => state := acc129;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (48, 10));
					nibble2_out <= temp1 (7 downto 4); -- acccolB
				when acc129 => state := acc130;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (49, 10));
					nibble2_out <= temp1 (11 downto 8); -- acccolC
				when acc130 => state := acc131;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (50, 10));
					nibble2_out <= temp1 (15 downto 12); -- acccolD
				when acc131 => state := acc132;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (51, 10));



				when acc132 => state := acc133;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+30, 12)); -- 242f LSB -- acccol29-32
				when acc133 => state := acc134;
				when acc134 => state := acc135;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+31, 12)); -- 242f MSB -- acccol29-32
					temp1 (15 downto 8) := i2c_mem_douta;
				when acc135 => state := acc136;
				when acc136 => state := acc137;
					temp1 (7 downto 0) := i2c_mem_douta;
					----------report_error (temp1, 0.0);
					nibble2_out <= temp1 (3 downto 0); -- acccolA
				when acc137 => state := acc138;
					nibble2_out <= temp1 (7 downto 4); -- acccolB
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (52, 10));
				when acc138 => state := acc139;
					nibble2_out <= temp1 (11 downto 8); -- acccolC
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (53, 10));
				when acc139 => state := acc140;
					nibble2_out <= temp1 (15 downto 12); -- acccolD
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (54, 10));
				when acc140 => state := acc141;
					o_dia <= nibble2_in;
					o_addra <= std_logic_vector (to_unsigned (55, 10));
				when acc141 => state := pow0;
					o_write_enable <= '0';


				when pow0 => state := pow1;
					o_addra <= (others => '0');
					nibble4_out <= vaccRemScale1;
				when pow1 => state := pow2;
					nibble4_out <= vaccColumnScale1;
					vaccRemScale := nibble4_in; -- 2^accscaleremnant
--                                     report_error ("vaccRemScale : ",vaccRemScale,0.0);
				when pow2 => state := pow3;
					nibble4_out <= vaccRowScale1;
					vaccColumnScale := nibble4_in; -- 2^accscalecolumn
--                                     report_error ("vaccColumnScale : ",vaccColumnScale,0.0);
				when pow3 => state := pow4;
					vaccRowScale := nibble4_in; -- 2^accscalerow
--                                     report_error ("vaccRowScale : ",vaccRowScale,0.0);
--					valphaRef_sf := resize (to_sfixed (valphaRef, eeprom16sf), valphaRef_sf);
--					----------report_error (valphaRef, 0.0);
--					fixed2floatce_internal <= '1';
--					fixed2floatond_internal <= '1';
--					fixed2floata_internal <= 
--					to_slv (to_sfixed (to_slv (valphaRef_sf (fracas'high downto fracas'low)), fracas))&
--					to_slv (to_sfixed (to_slv (valphaRef_sf (fracbs'high downto fracbs'low)), fracbs));
fixed2floatce_internal <= '1';
fixed2floatond_internal <= '1';
fixed2floata_internal <= valphaRef;
				when pow4 =>
if (fi2fl_wait = C_FI2FL_WAIT-1) then
valphaReference_ft := fixed2floatr_internal;
--report_error ("valphaReference_ft : ",valphaReference_ft,0.0);
fixed2floatce_internal <= '0';
fixed2floatond_internal <= '0';
fixed2floatsclr_internal <= '1';
state := pow5;
fi2fl_run <= '0';
fi2fl_rdy <= '1';
else
fi2fl_run <= '1';
state := pow4;
end if;
--if (fixed2floatrdy_internal = '1') then state := pow5;
--valphaReference_ft := fixed2floatr_internal;
--report_error ("valphaReference_ft : ",valphaReference_ft,0.0);
--fixed2floatce_internal <= '0';
--fixed2floatond_internal <= '0';
--fixed2floatsclr_internal <= '1';
--else state := pow4; end if;
				when pow5 => state := s0;
fi2fl_rdy <= '0';
					fixed2floatsclr_internal <= '0';
	row := 0;
	col := 0;
	i := 0;
when s0 => state := s1; 	--1
	------report "====================";
	vAlphaPixel_ft := (others => '0');
	o_write_enable <= '0';
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i), 12)); -- offset LSB 0
	o_addra <= std_logic_vector (to_unsigned (col+C_ROW, 10)); -- accColumnJ
when s1 => state := s2;	--2
	i2c_mem_addra <= (others => '0');
	o_addra <= (others => '0');
when s2 => state := s3;	--2
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- offset MSB 1
	o_addra <= std_logic_vector (to_unsigned (row, 10)); -- accrowI
	vaccColumnJ := i_doa;
--	----report "vaccColumnJ : " & real'image (ap_slv2fp (vaccColumnJ));
	vAlphaPixel (15 downto 8) := i2c_mem_douta;
when s3 => state := s4; 	--3
	i2c_mem_addra <= (others => '0');
	o_addra <= (others => '0');
when s4 => state := s5; 	--3
	vaccRowI := i_doa;
--	----report "vaccRowI : " & real'image (ap_slv2fp (vaccRowI));
	vAlphaPixel (7 downto 0) := i2c_mem_douta;
--	------report_error (vAlphaPixel, 0.0);
	nibble3_out <= vAlphaPixel (9 downto 4);
when s5 => state := s6; 	--5
	mulfpce_internal <= '1';
	mulfpa_internal <= nibble3_in;
	mulfpb_internal <= vaccRemScale;
	mulfpond_internal <= '1';
--	----report "vAlphaPixel : " & real'image (ap_slv2fp (nibble3_in));
--	----report "vaccRemScale : " & real'image (ap_slv2fp (vaccRemScale));
when s6 => 			--6
if (mulfp_wait = C_MULFP_WAIT-1) then
--    report_error ("mulfpa 1 : ",   mulfpa_internal,0.0);
--    report_error ("mulfpb 1 : ",   mulfpb_internal,0.0);
--    report_error ("* mulfpr 1 : ", mulfpr_internal,0.0);
vAlphaPixel_ft := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s7;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
mulfp_run <= '1';
state := s6;
end if;
--if (mulfprdy_internal = '1') then state := s7;
----    report_error ("mulfpa 1 : ",   mulfpa_internal,0.0);
----    report_error ("mulfpb 1 : ",   mulfpb_internal,0.0);
----    report_error ("* mulfpr 1 : ", mulfpr_internal,0.0);
--vAlphaPixel_ft := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s6; end if;
when s7 => state := s8; 	--7
mulfp_rdy <= '0';
	mulfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= vaccColumnJ;
	mulfpb_internal <= vaccColumnScale;
	mulfpond_internal <= '1';
--	----report "vaccColumnJ : " & real'image (ap_slv2fp (vaccColumnJ));
--	----report "vaccColumnScale : " & real'image (ap_slv2fp (vaccColumnScale));
when s8 => 			--8
if (mulfp_wait = C_MULFP_WAIT-1) then
--    report_error ("mulfpa 2 : ",   mulfpa_internal,0.0);
--    report_error ("mulfpb 2 : ",   mulfpb_internal,0.0);
--    report_error ("* mulfpr 2 : ", mulfpr_internal,0.0);
vaccColumnJ := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s9;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s8;
mulfp_run <= '1';
end if;
--	if (mulfprdy_internal = '1') then state := s9;
----    report_error ("mulfpa 2 : ",   mulfpa_internal,0.0);
----    report_error ("mulfpb 2 : ",   mulfpb_internal,0.0);
----    report_error ("* mulfpr 2 : ", mulfpr_internal,0.0);
--		vaccColumnJ := mulfpr_internal;
--		mulfpce_internal <= '0';
--		mulfpond_internal <= '0';
--		mulfpsclr_internal <= '1';
--	else state := s8; end if;
when s9 => state := s10; 	--9
	mulfpsclr_internal <= '0';
mulfp_rdy <= '0';
when s10 => state := s11; 	--10
	mulfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= vaccRowI;
	mulfpb_internal <= vaccRowScale;
	mulfpond_internal <= '1';
--	----report "vaccRowI : " & real'image (ap_slv2fp (vaccRowI));
--	----report "vaccRowScale : " & real'image (ap_slv2fp (vaccRowScale));
when s11 => 			--11
if (mulfp_wait = C_MULFP_WAIT-1) then
--    report_error ("mulfpa 3 : ",   mulfpa_internal,0.0);
--    report_error ("mulfpb 3 : ",   mulfpb_internal,0.0);
--    report_error ("* mulfpr 3 : ", mulfpr_internal,0.0);
vaccRowI := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s12;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
mulfp_run <= '1';
state := s11;
end if;
--if (mulfprdy_internal = '1') then state := s12;
----    report_error ("mulfpa 3 : ",   mulfpa_internal,0.0);
----    report_error ("mulfpb 3 : ",   mulfpb_internal,0.0);
----    report_error ("* mulfpr 3 : ", mulfpr_internal,0.0);
--vaccRowI := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s11; end if;
when s12 => state := s13; 	--12
	mulfpsclr_internal <= '0';
mulfp_rdy <= '0';
when s13 => state := s14; 	--13
	addfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= vAlphaPixel_ft;
	addfpb_internal <= vaccColumnJ;
	addfpond_internal <= '1';
--	----report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	----report "vaccColumnJ : " & real'image (ap_slv2fp (vaccColumnJ));
when s14 => 			--14
if (addfp_wait = C_ADDFP_WAIT-1) then
--    report_error ("addfpa 1 : ",   addfpa_internal,0.0);
--    report_error ("addfpb 1 : ",   addfpb_internal,0.0);
--    report_error ("* addfpr 1 : ", addfpr_internal,0.0);
vAlphaPixel_ft := addfpr_internal;
addfpce_internal <= '0';
addfpond_internal <= '0';
addfpsclr_internal <= '1';
state := s15;
addfp_run <= '0';
addfp_rdy <= '1';
else
state := s14;
addfp_run <= '1';
end if;
--if (addfprdy_internal = '1') then state := s15;
----    report_error ("addfpa 1 : ",   addfpa_internal,0.0);
----    report_error ("addfpb 1 : ",   addfpb_internal,0.0);
----    report_error ("* addfpr 1 : ", addfpr_internal,0.0);
--vAlphaPixel_ft := addfpr_internal;
--addfpce_internal <= '0';
--addfpond_internal <= '0';
--addfpsclr_internal <= '1';
--else state := s14; end if;
when s15 => state := s16; 	--15
addfp_rdy <= '0';
	addfpsclr_internal <= '0';
when s16 => state := s17; 	--16
	addfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= vAlphaPixel_ft;
	addfpb_internal <= vaccRowI;
	addfpond_internal <= '1';
--	----report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	----report "vaccRowI : " & real'image (ap_slv2fp (vaccRowI));
when s17 => 			--17
if (addfp_wait = C_ADDFP_WAIT-1) then
--    report_error ("addfpa 2 : ",   addfpa_internal,0.0);
--    report_error ("addfpb 2 : ",   addfpb_internal,0.0);
--    report_error ("* addfpr 2 : ", addfpr_internal,0.0);
vAlphaPixel_ft := addfpr_internal;
addfpce_internal <= '0';
addfpond_internal <= '0';
addfpsclr_internal <= '1';
state := s18;
addfp_run <= '0';
addfp_rdy <= '1';
else
state := s17;
addfp_run <= '1';
end if;
--if (addfprdy_internal = '1') then state := s18;
----    report_error ("addfpa 2 : ",   addfpa_internal,0.0);
----    report_error ("addfpb 2 : ",   addfpb_internal,0.0);
----    report_error ("* addfpr 2 : ", addfpr_internal,0.0);
--vAlphaPixel_ft := addfpr_internal;
--addfpce_internal <= '0';
--addfpond_internal <= '0';
--addfpsclr_internal <= '1';
--else state := s17; end if;
when s18 => state := s19; 	--18
  addfp_rdy <= '0';
	addfpsclr_internal <= '0';
when s19 => state := s20; 	--19
	addfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= vAlphaPixel_ft;
	addfpb_internal <= valphaReference_ft;
	addfpond_internal <= '1';
--	----report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	----report "valphaReference_ft : " & real'image (ap_slv2fp (valphaReference_ft));
when s20 => 			--20
if (addfp_wait = C_ADDFP_WAIT-1) then
--    report_error ("addfpa 3 : ",   addfpa_internal,0.0);
--    report_error ("addfpb 3 : ",   addfpb_internal,0.0);
--    report_error ("* addfpr 3 : ", addfpr_internal,0.0);
vAlphaPixel_ft := addfpr_internal;
addfpce_internal <= '0';
addfpond_internal <= '0';
addfpsclr_internal <= '1';
state := s21;
addfp_run <= '0';
addfp_rdy <= '1';
else
state := s20;
addfp_run <= '1';
end if;
--if (addfprdy_internal = '1') then state := s21;
----    report_error ("addfpa 3 : ",   addfpa_internal,0.0);
----    report_error ("addfpb 3 : ",   addfpb_internal,0.0);
----    report_error ("* addfpr 3 : ", addfpr_internal,0.0);
--vAlphaPixel_ft := addfpr_internal;
--addfpce_internal <= '0';
--addfpond_internal <= '0';
--addfpsclr_internal <= '1';
--else state := s20; end if;
when s21 => state := s22; 	--21
addfp_rdy <= '0';
	addfpsclr_internal <= '0';
	divfpce_internal <= '1';
	divfpa_internal <= vAlphaPixel_ft;
	divfpb_internal <= nibble5_in;
	divfpond_internal <= '1';
--	----report "vAlphaPixel_ft : " & real'image (ap_slv2fp (vAlphaPixel_ft));
--	----report "nibble5_in : " & real'image (ap_slv2fp (nibble5_in));
when s22 =>
if (divfp_wait = C_DIVFP_WAIT-1) then
--    report_error ("divfpa 1 : ",   divfpa_internal,0.0);
--    report_error ("divfpb 1 : ",   divfpb_internal,0.0);
--    report_error ("* divfpr 1 : ", divfpr_internal,0.0);
vAlphaPixel_ft := divfpr_internal;
divfpce_internal <= '0';
divfpond_internal <= '0';
divfpsclr_internal <= '1';
state := s23;
divfp_run <= '0';
divfp_rdy <= '1';
else
state := s22;
divfp_run <= '1';
end if;
--if (divfprdy_internal = '1') then state := s23;
----    report_error ("divfpa 1 : ",   divfpa_internal,0.0);
----    report_error ("divfpb 1 : ",   divfpb_internal,0.0);
----    report_error ("* divfpr 1 : ", divfpr_internal,0.0);
--vAlphaPixel_ft := divfpr_internal;
--divfpce_internal <= '0';
--divfpond_internal <= '0';
--divfpsclr_internal <= '1';
--else state := s22; end if;
when s23 => state := s24;
divfp_rdy <= '0';
	divfpsclr_internal <= '0';
when s24 => state := s25; 	--22
	o_write_enable <= '1';
	o_addra <= std_logic_vector (to_unsigned (C_ROW+C_COL+i, 10)); -- vAlphaPixel_ft
	o_dia <= vAlphaPixel_ft;
--       report_error ("================vAlphaPixel_ft : ",vAlphaPixel_ft,0.0);
	i := i + 1;
when s25 =>
	if (col = C_COL-1) then
		col := 0;
		state := s26;
	else
		col := col + 1;
		state := s0;
	end if;
when s26 =>
	if (row = C_ROW-1) then
		row := 0;
		state := ending;
	else
		row := row + 1;
		state := s0;
	end if;

				when ending => state := idle;
					o_rdy <= '1';
				when others => null;
			end case;
--			stemp1 <= temp1;
		end if;
	end if;
end process p0;

end Behavioral;

