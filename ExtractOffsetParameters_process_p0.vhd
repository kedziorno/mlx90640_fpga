----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:17 06/13/2023 
-- Design Name: 
-- Module Name:    ExtractOffsetParameters_process_p0 - Behavioral 
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

entity ExtractOffsetParameters_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

o_write_enable : out std_logic;
o_rdy : out std_logic;

i2c_mem_ena : out std_logic;
i2c_mem_addra : out std_logic_vector (11 downto 0);
i2c_mem_douta : in std_logic_vector (7 downto 0);

nibble_out1 : out std_logic_vector (3 downto 0);
nibble_out2 : out std_logic_vector (3 downto 0);
nibble_out4 : out std_logic_vector (3 downto 0);
nibble_out3 : out std_logic_vector (5 downto 0);
nibble_in1 : in std_logic_vector (31 downto 0);
nibble_in2 : in std_logic_vector (31 downto 0);
nibble_in4 : in std_logic_vector (31 downto 0);
nibble_in3 : in std_logic_vector (31 downto 0);

o_dia : out std_logic_vector (31 downto 0);
o_addra : out std_logic_vector (9 downto 0);
i_doa : in std_logic_vector (31 downto 0);

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
signal addfprdy : in STD_LOGIC

);
end ExtractOffsetParameters_process_p0;

architecture Behavioral of ExtractOffsetParameters_process_p0 is

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

signal addfp_wait : integer range 0 to C_ADDFP_WAIT-1;
signal mulfp_wait : integer range 0 to C_MULFP_WAIT-1;
signal fi2fl_wait : integer range 0 to C_FI2FL_WAIT-1;
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
	occ0,occ1,occ2,occ3,occ4,
	occ5,occ6,occ7,occ8,occ9,
	occ10,occ11,occ12,occ13,occ14,
	occ15,occ16,occ17,occ18,occ19,
	occ20,occ21,occ22,occ23,occ24,
	occ25,occ26,occ27,occ28,occ29,
	occ30,occ31,occ32,occ33,occ34,
	occ35,occ36,occ37,occ38,occ39,
	occ40,occ41,occ42,occ43,occ44,
	occ45,occ46,occ47,occ48,occ49,
	occ50,occ51,occ52,occ53,occ54,
	occ55,occ56,occ57,occ58,occ59,
	occ60,occ61,occ62,occ63,occ64,
	occ65,occ66,occ67,occ68,occ69,
	occ70,occ71,occ72,occ73,occ74,
	occ75,occ76,occ77,occ78,occ79,
	occ80,occ81,occ82,occ83,occ84,
	occ85,occ86,occ87,occ88,occ89,
	occ90,occ91,occ92,occ93,occ94,
	occ95,occ96,occ97,occ98,occ99,
	occ100,occ101,occ102,occ103,occ104,
	occ105,occ106,occ107,occ108,occ109,
	occ110,occ111,occ112,occ113,occ114,
	occ115,occ116,occ117,occ118,occ119,
	occ120,occ121,occ122,occ123,occ124,
	occ125,occ126,occ127,occ128,occ129,
	occ130,occ131,occ132,occ133,occ134,
	occ135,occ136,occ137,occ138,occ139,
	occ140,occ141,
	pow0,pow1,pow2,pow3,pow4,pow5,
	s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,
	ending);
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
	variable vocccolumnj,occrowi,voccrowi,vOffsetAverage,voffset_ft : std_logic_vector (31 downto 0);
	variable temp1,voffset : std_logic_vector (15 downto 0);

  constant C_COL : integer := 32;
  constant C_ROW : integer := 24;
	variable col : integer range 0 to C_COL-1;
	variable row : integer range 0 to C_ROW-1;
	variable i : integer range 0 to (C_ROW*C_COL)-1;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			nibble_out1 <= (others => '0');
			nibble_out2 <= (others => '0');
			nibble_out3 <= (others => '0');
			o_write_enable <= '0';
			o_rdy <= '0';
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
			o_addra <= (others => '0');
			o_dia <= (others => '0');
			i2c_mem_ena <= '0';
			i2c_mem_addra <= (others => '0');
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
						state := occ0;
						i2c_mem_ena <= '1';
						o_write_enable <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
						o_write_enable <= '0';
					end if;
				when occ0 => state := occ1;
					addfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					fixed2floatsclr_internal <= '0';
					o_rdy <= '0';
					
				when occ1 => state := occ2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+0, 12)); -- 2410 LSB
				when occ2 => state := occ3;
				when occ3 => state := occ4;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+1, 12)); -- 2410 MSB
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ4 => state := occ5;
				when occ5 => state := occ6;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
				when occ6 => state := occ7;
					nibble_out1 <= temp1 (3 downto 0); -- occ scale remnant
				when occ7 => state := occ8;
				
					voccRemScale := nibble_in1; -- out occ scale remnant signed
					voccRemScale1 := temp1 (3 downto 0); -- occ scale remnant for 2^x
					
					nibble_out1 <= temp1 (7 downto 4); -- occ scale column
				when occ8 => state := occ9;
				
					voccColumnScale := nibble_in1; -- out occ scale column signed
					voccColumnScale1 := temp1 (7 downto 4); -- occ scale column for 2^x

					nibble_out1 <= temp1 (11 downto 8); -- occ scale row
				when occ9 => state := occ10;
					
					voccRowScale := nibble_in1; -- out occ row column signed
					voccRowScale1 := temp1 (11 downto 8); -- occ scale row for 2^x

				when occ10 => state := occ11;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+2, 12)); -- 2411 LSB
				when occ11 => state := occ12;
				when occ12 => state := occ13;
					voffsetRef (15 downto 8) := i2c_mem_douta; -- offsetref LSB
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+3, 12)); -- 2411 MSB
				when occ13 => state := occ14;
				when occ14 => state := occ15;
					voffsetRef (7 downto 0) := i2c_mem_douta; -- offsetref MSB
					----report_error (voffsetRef, 0.0);
				
					
				when occ15 => state := occ16;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+4, 12)); -- 2412 LSB -- occrow1-4
				when occ16 => state := occ17;
				when occ17 => state := occ18;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+5, 12)); -- 2412 MSB -- occrow1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ18 => state := occ19;
				when occ19 => state := occ20;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
					nibble_out2 <= temp1 (3 downto 0); -- occrowA
				when occ20 => state := occ21;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (0, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occrowB
				when occ21 => state := occ22;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (1, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occrowC
				when occ22 => state := occ23;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (2, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occrowD
				when occ23 => state := occ24;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (3, 10));




				when occ24 => state := occ25;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+6, 12)); -- 2413 LSB -- occrow5-8
				when occ25 => state := occ26;
				when occ26 => state := occ27;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+7, 12)); -- 2413 MSB -- occrow5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ27 => state := occ28;
				when occ28 => state := occ29;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
					nibble_out2 <= temp1 (3 downto 0); -- occrowA
				when occ29 => state := occ30;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (4, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occrowB
				when occ30 => state := occ31;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (5, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occrowC
				when occ31 => state := occ32;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (6, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occrowD
				when occ32 => state := occ33;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (7, 10));


				when occ33 => state := occ34;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+8, 12)); -- 2414 LSB -- occrow9-12
				when occ34 => state := occ35;
				when occ35 => state := occ36;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+9, 12)); -- 2414 MSB -- occrow9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ36 => state := occ37;
				when occ37 => state := occ38;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occrowA
				when occ38 => state := occ39;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (8, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occrowB
				when occ39 => state := occ40;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (9, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occrowC
				when occ40 => state := occ41;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (10, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occrowD
				when occ41 => state := occ42;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (11, 10));



				when occ42 => state := occ43;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+10, 12)); -- 2415 LSB -- occrow13-16
				when occ43 => state := occ44;
				when occ44 => state := occ45;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+11, 12)); -- 2415 MSB -- occrow13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ45 => state := occ46;
				when occ46 => state := occ47;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occrowA
				when occ47 => state := occ48;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (12, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occrowB
				when occ48 => state := occ49;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (13, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occrowC
				when occ49 => state := occ50;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (14, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occrowD
				when occ50 => state := occ51;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (15, 10));



				when occ51 => state := occ52;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+12, 12)); -- 2416 LSB -- occrow17-20
				when occ52 => state := occ53;
				when occ53 => state := occ54;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+13, 12)); -- 2416 MSB -- occrow17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ54 => state := occ55;
				when occ55 => state := occ56;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occrowA
				when occ56 => state := occ57;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (32, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occrowB
				when occ57 => state := occ58;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (17, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occrowC
				when occ58 => state := occ59;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (18, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occrowD
				when occ59 => state := occ60;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (19, 10));


				when occ60 => state := occ61;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+14, 12)); -- 2417 LSB -- occrow21-24
				when occ61 => state := occ62;
				when occ62 => state := occ63;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+15, 12)); -- 2417 MSB -- occrow21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ63 => state := occ64;
				when occ64 => state := occ65;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occrowA
				when occ65 => state := occ66;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (20, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occrowB
				when occ66 => state := occ67;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (21, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occrowC
				when occ67 => state := occ68;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (22, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occrowD
				when occ68 => state := occ69;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (23, 10));


				when occ69 => state := occ70;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+16, 12)); -- 2418 LSB -- occcol1-4
				when occ70 => state := occ71;
				when occ71 => state := occ72;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+17, 12)); -- 2418 MSB -- occcol1-4
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ72 => state := occ73;
				when occ73 => state := occ74;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occcolA
				when occ74 => state := occ75;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (24, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occcolB
				when occ75 => state := occ76;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (25, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occcolC
				when occ76 => state := occ77;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (26, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occcolD
				when occ77 => state := occ78;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (27, 10));


				when occ78 => state := occ79;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+18, 12)); -- 2419 LSB -- occcol5-8
				when occ79 => state := occ80;
				when occ80 => state := occ81;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+19, 12)); -- 2419 MSB -- occcol5-8
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ81 => state := occ82;
				when occ82 => state := occ83;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occcolA
				when occ83 => state := occ84;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (28, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occcolB
				when occ84 => state := occ85;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (29, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occcolC
				when occ85 => state := occ86;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (30, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occcolD
				when occ86 => state := occ87;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (31, 10));


				when occ87 => state := occ88;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+20, 12)); -- 241a LSB -- occcol9-12
				when occ88 => state := occ89;
				when occ89 => state := occ90;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+21, 12)); -- 241a MSB -- occcol9-12
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ90 => state := occ91;
				when occ91 => state := occ92;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occcolA
				when occ92 => state := occ93;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (32, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occcolB
				when occ93 => state := occ94;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (33, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occcolC
				when occ94 => state := occ95;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (34, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occcolD
				when occ95 => state := occ96;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (35, 10));


				when occ96 => state := occ97;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+22, 12)); -- 241b LSB -- occcol13-16
				when occ97 => state := occ98;
				when occ98 => state := occ99;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+23, 12)); -- 241b MSB -- occcol13-16
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ99 => state := occ100;
				when occ100 => state := occ101;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occcolA
				when occ101 => state := occ102;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (36, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occcolB
				when occ102 => state := occ103;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (37, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occcolC
				when occ103 => state := occ104;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (38, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occcolD
				when occ104 => state := occ105;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (39, 10));


				when occ105 => state := occ106;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+24, 12)); -- 241c LSB -- occcol17-20
				when occ106 => state := occ107;
				when occ107 => state := occ108;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+25, 12)); -- 241c MSB -- occcol17-20
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ108 => state := occ109;
				when occ109 => state := occ110;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occcolA
				when occ110 => state := occ111;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (40, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occcolB
				when occ111 => state := occ112;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (41, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occcolC
				when occ112 => state := occ113;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (42, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occcolD
				when occ113 => state := occ114;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (43, 10));



				when occ114 => state := occ115;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+26, 12)); -- 241d LSB -- occcol21-24
				when occ115 => state := occ116;
				when occ116 => state := occ117;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+27, 12)); -- 241d MSB -- occcol21-24
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ117 => state := occ118;
				when occ118 => state := occ119;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occcolA
				when occ119 => state := occ120;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (44, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occcolB
				when occ120 => state := occ121;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (45, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occcolC
				when occ121 => state := occ122;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (46, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occcolD
				when occ122 => state := occ123;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (47, 10));



				when occ123 => state := occ124;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+28, 12)); -- 241e LSB -- occcol25-28
				when occ124 => state := occ125;
				when occ125 => state := occ126;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+29, 12)); -- 241e MSB -- occcol25-28
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ126 => state := occ127;
				when occ127 => state := occ128;
					temp1 (7 downto 0) := i2c_mem_douta;
					nibble_out2 <= temp1 (3 downto 0); -- occcolA
				when occ128 => state := occ129;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (48, 10));
					nibble_out2 <= temp1 (7 downto 4); -- occcolB
				when occ129 => state := occ130;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (49, 10));
					nibble_out2 <= temp1 (11 downto 8); -- occcolC
				when occ130 => state := occ131;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (50, 10));
					nibble_out2 <= temp1 (15 downto 12); -- occcolD
				when occ131 => state := occ132;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (51, 10));



				when occ132 => state := occ133;
--					addra <= (others => '0');
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+30, 12)); -- 241f LSB -- occcol29-32
				when occ133 => state := occ134;
				when occ134 => state := occ135;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32+31, 12)); -- 241f MSB -- occcol29-32
					temp1 (15 downto 8) := i2c_mem_douta;
				when occ135 => state := occ136;
				when occ136 => state := occ137;
					temp1 (7 downto 0) := i2c_mem_douta;
					----report_error (temp1, 0.0);
					nibble_out2 <= temp1 (3 downto 0); -- occcolA
				when occ137 => state := occ138;
					nibble_out2 <= temp1 (7 downto 4); -- occcolB
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (52, 10));
				when occ138 => state := occ139;
					nibble_out2 <= temp1 (11 downto 8); -- occcolC
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (53, 10));
				when occ139 => state := occ140;
					nibble_out2 <= temp1 (15 downto 12); -- occcolD
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (54, 10));
				when occ140 => state := occ141;
					o_dia <= nibble_in2;
					o_addra <= std_logic_vector (to_unsigned (55, 10));
				when occ141 => state := pow0;
					o_write_enable <= '0';


				when pow0 => state := pow1;
					o_addra <= (others => '0');
					nibble_out4 <= voccRemScale1;
				when pow1 => state := pow2;
					nibble_out4 <= voccColumnScale1;
					voccRemScale := nibble_in4; -- 2^occscaleremnant
					--report "voccRemScale : " & real'image (ap_slv2fp (voccRemScale));
				when pow2 => state := pow3;
					nibble_out4 <= voccRowScale1;
					voccColumnScale := nibble_in4; -- 2^occscalecolumn
					--report "voccColumnScale : " & real'image (ap_slv2fp (voccColumnScale));
				when pow3 => state := pow4;
					voccRowScale := nibble_in4; -- 2^occscalerow
					--report "voccRowScale : " & real'image (ap_slv2fp (voccRowScale));
fixed2floatce_internal <= '1';
fixed2floatond_internal <= '1';
fixed2floata_internal <= voffsetRef;
				when pow4 =>
if (fi2fl_wait = C_FI2FL_WAIT-1) then
vOffsetAverage := fixed2floatr_internal;
--report "vOffsetAverage : " & real'image (ap_slv2fp (vOffsetAverage));
fixed2floatce_internal <= '0';
fixed2floatond_internal <= '0';
fixed2floatsclr_internal <= '1';
state := pow5;
fi2fl_run <= '0';
fi2fl_rdy <= '1';
else
state := pow4;
fi2fl_run <= '1';
end if;
--if (fixed2floatrdy_internal = '1') then state := pow5;
--vOffsetAverage := fixed2floatr_internal;
----report "vOffsetAverage : " & real'image (ap_slv2fp (vOffsetAverage));
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
--	report "====================";
	vOffset_ft := (others => '0');
	o_write_enable <= '0';
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+0, 12)); -- offset LSB 0
	o_addra <= std_logic_vector (to_unsigned (col+C_ROW, 10)); -- OCCColumnJ
when s1 => state := s2;	--2
	i2c_mem_addra <= (others => '0');
	o_addra <= (others => '0');
when s2 => state := s3;	--2
	i2c_mem_addra <= std_logic_vector (to_unsigned (128+(2*i)+1, 12)); -- offset MSB 1
	o_addra <= std_logic_vector (to_unsigned (row, 10)); -- OCCrowI
	vOCCColumnJ := i_doa;
--	report_error ("vOCCColumnJ i="&integer'image(i)&",col="&integer'image(col+C_ROW),vOCCColumnJ,0.0);
	vOffset (15 downto 8) := i2c_mem_douta;
when s3 => state := s4; 	--3
	i2c_mem_addra <= (others => '0');
	o_addra <= (others => '0');
when s4 => state := s5; 	--3
	vOCCRowI := i_doa;
--	report_error ("vOCCRowI i="&integer'image(i)&",row="&integer'image(row),vOCCRowI,0.0);
	vOffset (7 downto 0) := i2c_mem_douta;
--	report_error ("vOffset i2c_addr "&integer'image(128+(2*i)),vOffset,0.0);
--	report_error ("vOffset i2c_addr "&integer'image(i),vOffset,0.0);
	nibble_out3 <= vOffset (15 downto 10);
when s5 => state := s6; 	--5
	mulfpce_internal <= '1';
	mulfpa_internal <= nibble_in3;
	mulfpb_internal <= voccRemScale;
	mulfpond_internal <= '1';
--	report_error ("voccRemScale "&integer'image(i),voccRemScale,0.0);
--	report_error ("nibble_in3 "&integer'image(i),nibble_in3,0.0);
when s6 => 			--6
if (mulfp_wait = C_MULFP_WAIT-1) then
vOffset_ft := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s7;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s6;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s7;
--vOffset_ft := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s6; end if;
when s7 => state := s8; 	--7
mulfp_rdy <= '0';
	mulfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= vOCCColumnJ;
	mulfpb_internal <= voccColumnScale;
	mulfpond_internal <= '1';
--	report_error ("voccColumnScale "&integer'image(i),voccColumnScale,0.0);
when s8 => 			--8
if (mulfp_wait = C_MULFP_WAIT-1) then
vOCCColumnJ := mulfpr_internal;
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
--if (mulfprdy_internal = '1') then state := s9;
--vOCCColumnJ := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s8; end if;
when s9 => state := s10; 	--9
mulfp_rdy <= '0';
	mulfpsclr_internal <= '0';
when s10 => state := s11; 	--10
	mulfpsclr_internal <= '0';
	mulfpce_internal <= '1';
	mulfpa_internal <= vOCCRowI;
	mulfpb_internal <= voccRowScale;
	mulfpond_internal <= '1';
--	report_error ("voccRowScale "&integer'image(i),voccRowScale,0.0);
when s11 => 			--11
if (mulfp_wait = C_MULFP_WAIT-1) then
vOCCRowI := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := s12;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := s11;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := s12;
--vOCCRowI := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := s11; end if;
when s12 => state := s13; 	--12
mulfp_rdy <= '0';
	mulfpsclr_internal <= '0';
when s13 => state := s14; 	--13
	addfpsclr_internal <= '0';
	addfpce_internal <= '1';
	addfpa_internal <= vOffset_ft;
	addfpb_internal <= vOCCColumnJ;
	addfpond_internal <= '1';
--	report_error ("vOffset_ft nibble_in3 * voccremscale",vOffset_ft,0.0);
--	report_error ("vOCCColumnJ vocccolumnj * vocccolumnscale",vOCCColumnJ,0.0);
when s14 => 			--14
if (addfp_wait = C_ADDFP_WAIT-1) then
vOffset_ft := addfpr_internal;
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
--vOffset_ft := addfpr_internal;
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
	addfpa_internal <= vOffset_ft;
	addfpb_internal <= vOCCRowI;
	addfpond_internal <= '1';
--	report_error ("vOffset_ft voffset_ft + vocccolumnj",vOffset_ft,0.0);
--	report_error ("vOCCRowI voccrowi * voccrowscale",vOCCRowI,0.0);
when s17 => 			--17
if (addfp_wait = C_MULFP_WAIT-1) then
vOffset_ft := addfpr_internal;
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
--vOffset_ft := addfpr_internal;
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
	addfpa_internal <= vOffset_ft;
	addfpb_internal <= vOffsetAverage;
	addfpond_internal <= '1';
--	report_error ("vOffset_ft after voffset_ft + voccrowi",vOffset_ft,0.0);
--	report_error ("vOffsetAverage fi2fl",vOffsetAverage,0.0);
when s20 => 			--20
if (addfp_wait = C_ADDFP_WAIT-1) then
vOffset_ft := addfpr_internal;
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
--vOffset_ft := addfpr_internal;
--addfpce_internal <= '0';
--addfpond_internal <= '0';
--addfpsclr_internal <= '1';
--else state := s20; end if;
when s21 => state := s22; 	--21
addfp_rdy <= '0';
	addfpsclr_internal <= '0';
when s22 => state := s23; 	--22
	o_write_enable <= '1';
	o_addra <= std_logic_vector (to_unsigned (C_ROW+C_COL+i, 10)); -- vOffset_ft
	o_dia <= vOffset_ft;
--    report_error ("================vOffset_ft voffset_ft + vOffsetAverage,param i="&integer'image(i)&",i+off="&integer'image(i+C_ROW+C_COL),vOffset_ft,0.0);
	i := i + 1;
when s23 =>
	if (col = C_COL-1) then
		col := 0;
		state := s24;
	else
		col := col + 1;
		state := s0;
	end if;
when s24 =>
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

