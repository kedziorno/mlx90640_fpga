----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:47 06/13/2023 
-- Design Name: 
-- Module Name:    ExtractKtaParameters_process_p0 - Behavioral 
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

entity ExtractKtaParameters_process_p0 is
generic (
constant C_COL : integer := 32;
constant C_ROW : integer := 24
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

nibble_out1,nibble_out2 : out std_logic_vector (3 downto 0);
nibble_out3 : out std_logic_vector (2 downto 0);
nibble_in1,nibble_in2,nibble_in3 : in std_logic_vector (31 downto 0);

o_dia : out std_logic_vector (31 downto 0);
o_addra : out std_logic_vector (9 downto 0);
o_write_enable : out std_logic;

ktarcee_oo,ktarcee_eo,ktarcee_oe,ktarcee_ee : out std_logic_vector (7 downto 0);

ktarcee : in std_logic_vector (7 downto 0);

mem_signed256_ivalue : out std_logic_vector (7 downto 0); -- input hex from 0 to 255
mem_signed256_ovalue : in std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float

o_rdy : out std_logic;

o_col : out std_logic_vector (0 to 4);
o_row : out std_logic_vector (0 to 4);

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
end ExtractKtaParameters_process_p0;

architecture Behavioral of ExtractKtaParameters_process_p0 is

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

signal col : integer range 0 to C_COL-1;
signal row : integer range 0 to C_ROW-1;

signal divfp_wait : integer range 0 to C_DIVFP_WAIT-1;
signal addfp_wait : integer range 0 to C_ADDFP_WAIT-1;
signal mulfp_wait : integer range 0 to C_MULFP_WAIT-1;
signal divfp_run,divfp_rdy : std_logic;
signal addfp_run,addfp_rdy : std_logic;
signal mulfp_run,mulfp_rdy : std_logic;

begin

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

p0 : process (i_clock) is
	type states is (idle,
	kta0,kta1,kta2,kta3,kta4,
	kta5,kta6,kta7,kta8,kta9,
	kta10,kta11,kta12,kta13,kta14,
	kta15,kta16,kta17,kta18,kta19,
	kta20,kta21,kta22,kta23,kta24,
	kta25,kta26,kta27,kta28,
	ending);
	variable state : states;
	variable vktaRemScale : std_logic_vector (31 downto 0);
	variable vktaColumnScale : std_logic_vector (31 downto 0);
	variable vktaRowScale : std_logic_vector (31 downto 0);

	variable vktaRemScale1 : std_logic_vector (3 downto 0);
	variable vktaColumnScale1 : std_logic_vector (3 downto 0);
	variable vktaRowScale1 : std_logic_vector (3 downto 0);

	variable valphaRef1: std_logic_vector (15 downto 0);
	variable valphaRef : std_logic_vector (15 downto 0);
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable vktacolumnj,ktarowi,vktarowi,valphaReference_ft,vAlphaPixel_ft,ktarcee_ft,kta_ft : std_logic_vector (31 downto 0);
	variable temp1,vAlphaPixel : std_logic_vector (15 downto 0);

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
			divfpsclr_internal <= '1';
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
			i2c_mem_ena <= '0';
			i2c_mem_addra <= (others => '0');
			i := 0;
			o_col <= (others => '0');
			o_row <= (others => '0');
      divfp_run <= '0';
      divfp_rdy <= '0';
      mulfp_run <= '0';
      mulfp_rdy <= '0';
      addfp_run <= '0';
      addfp_rdy <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := kta0;
						i2c_mem_ena <= '1';
						o_write_enable <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
						o_write_enable <= '0';
					end if;

				when kta0 => state := kta1;
					addfpsclr_internal <= '0';
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
					o_rdy <= '0';
				when kta1 => state := kta2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (108, 12)); -- 2436 LSB - ktarcee_oo 54*2+0
				when kta2 => state := kta3;
				when kta3 => state := kta4;
					i2c_mem_addra <= std_logic_vector (to_unsigned (109, 12)); -- 2436 MSB - ktarcee_eo 54*2+1
					ktarcee_oo <= i2c_mem_douta;
				when kta4 => state := kta5;
				when kta5 => state := kta6;
					i2c_mem_addra <= std_logic_vector (to_unsigned (110, 12)); -- 2437 LSB - ktarcee_oe 54*2+2
					ktarcee_eo <= i2c_mem_douta;
				when kta6 => state := kta7;
				when kta7 => state := kta8;
					i2c_mem_addra <= std_logic_vector (to_unsigned (111, 12)); -- 2437 MSB - ktarcee_ee 54*2+3
					ktarcee_oe <= i2c_mem_douta;
				when kta8 => state := kta9;
				when kta9 => state := kta10;
					ktarcee_ee <= i2c_mem_douta;
				when kta10 => state := kta11;
					mem_signed256_ivalue <= ktarcee;
				when kta11 => state := kta12;
				when kta12 => state := kta13;
					ktarcee_ft := mem_signed256_ovalue;
				when kta13 => state := kta14;
					i2c_mem_addra <= std_logic_vector (to_unsigned (113, 12)); -- 2438 LSB - ktascale1/ktascale2	54*2+5
				when kta14 => state := kta15;
				when kta15 => state := kta16;
					nibble_out1 <= i2c_mem_douta (7 downto 4); -- ktascale1
					nibble_out2 <= i2c_mem_douta (3 downto 0); -- ktascale2
				
				when kta16 => state := kta17;
					i2c_mem_addra <= std_logic_vector (to_unsigned (129+(2*i), 12)); -- kta LSB 1
				when kta17 => state := kta18;
				when kta18 => state := kta19;
					nibble_out3 <= i2c_mem_douta (3 downto 1); -- kta_ee 3bit
when kta19 => state := kta20;
	mulfpce_internal <= '1';
	mulfpa_internal <= nibble_in3; -- kta_ee
	mulfpb_internal <= nibble_in2; -- 2^ktascale2
	mulfpond_internal <= '1';
--	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
--	--report "vktaRemScale : " & real'image (ap_slv2fp (vktaRemScale));
when kta20 => 			--6
if (mulfp_wait = C_MULFP_WAIT-1) then
kta_ft := mulfpr_internal;
mulfpce_internal <= '0';
mulfpond_internal <= '0';
mulfpsclr_internal <= '1';
state := kta21;
mulfp_run <= '0';
mulfp_rdy <= '1';
else
state := kta20;
mulfp_run <= '1';
end if;
--if (mulfprdy_internal = '1') then state := kta21;
--kta_ft := mulfpr_internal;
--mulfpce_internal <= '0';
--mulfpond_internal <= '0';
--mulfpsclr_internal <= '1';
--else state := kta20; end if;
when kta21 => state := kta22; 	--7
mulfp_rdy <= '0';
	mulfpsclr_internal <= '0';

	addfpce_internal <= '1';
	addfpa_internal <= kta_ft; -- kta_ee*2^ktascale2
	addfpb_internal <= ktarcee_ft; -- ktarcee
	addfpond_internal <= '1';
--	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
--	--report "vktaRemScale : " & real'image (ap_slv2fp (vktaRemScale));
when kta22 => 			--6
if (addfp_wait = C_ADDFP_WAIT-1) then
kta_ft := addfpr_internal;
addfpce_internal <= '0';
addfpond_internal <= '0';
addfpsclr_internal <= '1';
state := kta23;
addfp_run <= '0';
addfp_rdy <= '1';
else
state := kta22;
addfp_run <= '1';
end if;
--if (addfprdy_internal = '1') then state := kta23;
--kta_ft := addfpr_internal;
--addfpce_internal <= '0';
--addfpond_internal <= '0';
--addfpsclr_internal <= '1';
--else state := kta22; end if;
when kta23 => state := kta24; 	--7
addfp_rdy <= '0';
	addfpsclr_internal <= '0';


	divfpce_internal <= '1';
	divfpa_internal <= kta_ft; -- ktarcee+kta_ee*2^ktascale2
	divfpb_internal <= nibble_in1; -- 2^ktascale1
	divfpond_internal <= '1';
--	--report "vAlphaPixel : " & real'image (ap_slv2fp (out_nibble3));
--	--report "vktaRemScale : " & real'image (ap_slv2fp (vktaRemScale));
when kta24 => 			--6
if (divfp_wait = C_DIVFP_WAIT-1) then
kta_ft := divfpr_internal;
divfpce_internal <= '0';
divfpond_internal <= '0';
divfpsclr_internal <= '1';
state := kta25;
divfp_run <= '0';
divfp_rdy <= '1';
else
state := kta24;
divfp_run <= '1';
end if;
--if (divfprdy_internal = '1') then state := kta25;
--kta_ft := divfpr_internal;
--divfpce_internal <= '0';
--divfpond_internal <= '0';
--divfpsclr_internal <= '1';
--else state := kta24; end if;
when kta25 => state := kta26; 	--7
divfp_rdy <= '0';
	divfpsclr_internal <= '0';

when kta26 => state := kta27; 	--22
	o_write_enable <= '1';
	o_addra <= std_logic_vector (to_unsigned (i, 10)); -- kta
	o_dia <= kta_ft;
--     report_error ("================kta_ft "&integer'image(i)&" ",kta_ft,0.0);
when kta27 =>
	i := i + 1;
	o_write_enable <= '0';
	if (col = C_COL-1) then
		col <= 0;
		state := kta28;
	else
		col <= col + 1;
		state := kta10;
	end if;
  o_col <= std_logic_vector (to_unsigned (col, 5));
when kta28 =>
	o_write_enable <= '0';
	if (row = C_ROW-1) then
		row <= 0;
		state := ending;
	else
		row <= row + 1;
		state := kta10;
	end if;
  o_row <= std_logic_vector (to_unsigned (row, 5));

				when ending => state := idle;
					o_rdy <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

end Behavioral;

