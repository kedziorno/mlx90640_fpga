----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:07 12/26/2022 
-- Design Name: 
-- Module Name:    test_fixed_melexis - Behavioral 
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
-- Test vectors for the synthesis test for the fixed point math package
-- This test is designed to test fixed_synth and exercise much of the entity.
-- For fphdl vhdl-200x created by David Bishop (dbishop@vhdl.org)
----------------------------------------------------------------------------------

library ieee, ieee_proposed;
--library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;


--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package1.all;

entity test_fixed_melexis is
generic (
G_C_WAIT1 : integer := 1 -- xxx wait between states to calculate, >= 1
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
o_out1 : out st_sfixed_max;
o_in1 : out st_sfixed_max;
o_in2 : out st_sfixed_max
);
end test_fixed_melexis;

architecture testbench of test_fixed_melexis is

	component fixed_synth is
	port (
		in1, in2   : in  std_logic_vector (2*FP_BITS-1 downto 0);
		out1       : out std_logic_vector (2*FP_BITS-1 downto 0);
		cmd        : in  std_logic_vector (3 downto 0);
		clk, rst_n : in  std_ulogic
	);
	end component fixed_synth;
	for all : fixed_synth use entity work.fixed_synth(rtl);

	signal clk, rst_n : std_ulogic;
	signal in1slv, in2slv, outslv : std_logic_vector(2*FP_BITS-1 downto 0);
	signal in1 : st_sfixed_max;
	signal in2 : st_sfixed_max;
	signal out1 : st_sfixed_max;
	signal cmd : std_logic_vector (3 downto 0);
	signal state : states;

begin

	out1 <= to_sfixed(outslv, st_sfixed_max'high, st_sfixed_max'low);
	o_out1 <= out1;
	o_in1 <= to_sfixed(in1slv, st_sfixed_max'high, st_sfixed_max'low);
	o_in2 <= to_sfixed(in2slv, st_sfixed_max'high, st_sfixed_max'low);

	in1slv <= to_slv(in1);
	in2slv <= to_slv(in2);

	DUT : fixed_synth port map (
		in1 => in1slv,
		in2 => in2slv,
		out1 => outslv,
		cmd => cmd,
		clk => i_clock,
		rst_n => i_reset
	);

	-- purpose: main test loop
	tester : process (i_clock,i_reset) is
		variable sftmp_slv_16 : std_logic_vector(15 downto 0);
		variable sftmp_sf_16 : sfixed15;
		variable sftmp_slv_fpbits : std_logic_vector(2*FP_BITS-1 downto 0);
		variable fptmp1,fptmp2,fpout : st_sfixed_max;
		variable kvdd,vdd25 : st_sfixed_max;
		variable kvptat,ktptat : st_sfixed_max;
		variable vdd,vddv0,deltaV : st_sfixed_max;
		variable vptat,vbe : st_sfixed_max;
		variable vptat25 : st_sfixed_max;
		variable vptatart : st_sfixed_max;
		variable alphaptatee : st_sfixed_max;
		variable alphaptat : st_sfixed_max;
		variable h1,h2 : st_sfixed_max;
		variable pow2_18 : st_sfixed_max;
		variable tmp_uf8 : ufixed8;
		variable tmp_sf8 : sfixed8;
		variable tmp_uf6 : ufixed6;
		variable tmp_sf6 : sfixed6;
		variable tmp_uf9 : ufixed9;
		variable tmp_sf9 : sfixed9;
		variable tmp_uf15 : ufixed15;
		variable tmp_sf15 : sfixed15;
		variable pow2to18 : st_sfixed_max;
		constant C_WAIT1 : integer := G_C_WAIT1;
		variable v_wait1 : integer range 0 to C_WAIT1-1;
		variable Ta,Ta0 : st_sfixed_max;
		variable Kgain : st_sfixed_max;
		variable pixgain12_16 : st_sfixed_max; -- xxx for all pixels
		variable offset12_16 : st_sfixed_max; -- xxx for all pixels
		variable offsetaverage : st_sfixed_max;
		variable occscalerow : st_sfixed_max;
		variable occscalecolumn : st_sfixed_max;
		variable kv12_16 : st_sfixed_max;
		variable occrow12 : st_sfixed_max;
		variable occcolumn16 : st_sfixed_max;
		variable occscaleremnant : st_sfixed_max;
		variable tmpuf1 : ufixed0;
		variable tmpulv1 : std_logic_vector(0 downto 0);
		variable tmpsf1 : sfixed0;
		variable tmpslv1 : std_logic_vector(0 downto 0);
		variable tmpsf2 : sfixed1;
		variable tmpslv2 : std_logic_vector(1 downto 0);
		variable tmpsf3 : sfixed2;
		variable tmpslv3 : std_logic_vector(2 downto 0);
		variable tmpsf4 : sfixed3;
		variable tmpslv4 : std_logic_vector(3 downto 0);
		variable tmpsf5 : sfixed4;
		variable tmpslv5 : std_logic_vector(4 downto 0);
		variable tmpsf6 : sfixed5;
		variable tmpslv6 : std_logic_vector(5 downto 0);
		variable tmpsf7 : sfixed6;
		variable tmpslv7 : std_logic_vector(6 downto 0);
		variable tmpsf8 : sfixed7;
		variable tmpslv8 : std_logic_vector(7 downto 0);
		variable tmpsf9 : sfixed8;
		variable tmpslv9 : std_logic_vector(8 downto 0);
		variable tmpsf10 : sfixed9;
		variable tmpslv10 : std_logic_vector(9 downto 0);
		variable occsro,occsc,occsre : st_sfixed_max;
		variable occsror,occscr,occsrer : st_sfixed_max;
		variable pixosref12_16 : st_sfixed_max;
		variable kta12_16 : st_sfixed_max;
		variable kta12_16_ee : st_sfixed_max;
		variable kta_rc_ee : st_sfixed_max;
		variable kta_scale_1 : st_sfixed_max;
		variable kta_scale_2 : st_sfixed_max;
		variable kvscale : st_sfixed_max;
		variable pixos12_16 : st_sfixed_max;
		variable tad,v0d : st_sfixed_max;
		variable vir12_16_emissitivy_componsated : st_sfixed_max;
		variable pixgain_cp_sp0 : st_sfixed_max;
		variable pixgain_cp_sp1 : st_sfixed_max;
		variable off_cpsubpage_0 : st_sfixed_max;
		variable off_cpsubpage_1 : st_sfixed_max;
		variable off_cpsubpage_1_delta : st_sfixed_max;
		variable kta_cp_ee : st_sfixed_max;
		variable kta_cp : st_sfixed_max;
		variable kv_scale : st_sfixed_max;
		variable kv_cp_ee : st_sfixed_max;
		variable kv_cp : st_sfixed_max;
		variable ktacp_kvcp_mul,ilchessc1ee,ilchessc1,pixos_cp_sp0,pixos_cp_sp1,ch_pattern_12_16_s,ch_pattern_12_16,tgcee,tgc,vir_12_16_compensated : st_sfixed_max;
		variable ch_pattern_12_16_u : st_ufixed_max; -- xxx for xor
		constant pixelnumber12_16 : integer := 368; -- xxx good val
--		constant pixelnumber12_16 : integer := 367; -- xxx bad val
		variable pixospatt1,pixospatt2,pixospatt12,ch_pattern_12_16_minusone : st_sfixed_max;
	begin
		if (rising_edge(i_clock)) then
			if (i_reset = '1') then
				report "fp_add_hi : " & integer'image(st_sfixed_add'high);
				report "fp_add_lo : " & integer'image(st_sfixed_add'low);
				report "fp_sub_hi : " & integer'image(st_sfixed_sub'high);
				report "fp_sub_lo : " & integer'image(st_sfixed_sub'low);
				report "fp_mul_hi : " & integer'image(st_sfixed_mul'high);
				report "fp_mul_lo : " & integer'image(st_sfixed_mul'low);
				report "fp_div_hi : " & integer'image(st_sfixed_div'high);
				report "fp_div_lo : " & integer'image(st_sfixed_div'low);
				v_wait1 := 0;
				state <= idle;
				sftmp_slv_fpbits := (others => '0');
				-- reset
				cmd <= "0000";
				in1 <= (others => '0');
				in2 <= (others => '0');
				fptmp1 := (others => '0');
				fptmp2 := (others => '0');
				fpout := (others => '0');
			else
		case (state) is
when idle =>
		-- 11.2.2.2
		-- kvdd,vdd25
		-- ram[0x072a] = 0xccc5
		-- 11.2.2.3
		-- kvptat,ktptat
		-- ee[0x2432] = 0x5952 ee[0x2431] = 0x2ff1 ee[0x2410] = 0x4210 ram[0x072a] = 0xccc5 ram[0x0720] = 0x06af ram[0x0700] = 0x4bf2

			if (i_run = '1') then
				state <= s1;
			else
				state <= idle;
			end if;
when s1 =>
		--
		-- kvdd
		sftmp_slv_16 := x"9d68" and x"ff00"; -- ee[0x2433]
		kvdd := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kvdd);
		report_error ("fail kvdd 1", kvdd, to_sfixed (-25344.0, kvdd)); -- -25344
		fptmp2 := to_sfixed (2**8, fptmp2);
		report_error ("fail 2**8", fptmp2, to_sfixed (2**8, fptmp2)); -- 256
		cmd <= "0011"; -- / ee[0x2433]&0xff00/256
		in1 <= kvdd;
		in2 <= fptmp2;
		state <= w1;
when w1 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s2; else v_wait1 := v_wait1 + 1; state <= w1; end if;
when s2 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kvdd := resize (fpout, kvdd);
		report_error ("fail kvdd 2", kvdd, to_sfixed (-99.0, kvdd)); -- -99
		fptmp2 := to_sfixed (2**5, fptmp2);
		report_error ("fail 2**5", fptmp2, to_sfixed (2**5, fptmp2)); -- 32
		cmd <= "0010"; -- * kvdd*2^5
		in1 <= kvdd;
		in2 <= fptmp2;
		state <= w2;
when w2 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s3; else v_wait1 := v_wait1 + 1; state <= w2; end if;
when s3 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kvdd := resize (fpout, kvdd);
		report_error ("fail kvdd 3", kvdd, to_sfixed (-3168.0, kvdd)); -- -3168
		--
		-- vdd25
		sftmp_slv_16 := x"9d68" and x"00ff"; -- ee[0x2433]
		vdd25 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), vdd25);
		report_error ("fail vdd25 1", vdd25, to_sfixed (104.0, vdd25)); -- 104
		fptmp2 := to_sfixed (2**8, fptmp2);
		report_error ("fail 2**8", fptmp2, to_sfixed (2**8, fptmp2)); -- 256
		cmd <= "0001"; -- - vdd25-256
		in1 <= vdd25;
		in2 <= fptmp2;
		state <= w3;
when w3 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s4; else v_wait1 := v_wait1 + 1; state <= w3; end if;
when s4 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vdd25 := resize (fpout, vdd25);
		report_error ("fail vdd25 2", vdd25, to_sfixed (-152.0, vdd25)); -- -152
		fptmp2 := to_sfixed (2**5, fptmp2);
		report_error ("fail 2**5", fptmp2, to_sfixed (2**5, fptmp2)); -- 32
		cmd <= "0010"; -- * (vdd25-256)*2^5
		in1 <= vdd25;
		in2 <= fptmp2;
		state <= w4;
when w4 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s5; else v_wait1 := v_wait1 + 1; state <= w4; end if;
when s5 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vdd25 := resize (fpout, vdd25);
		report_error ("fail vdd25 3", vdd25, to_sfixed (-4864.0, vdd25)); -- -4864
		fptmp2 := to_sfixed (2**13, fptmp2);
		report_error ("fail 2**13", fptmp2, to_sfixed (2**13, fptmp2)); -- 2**13
		cmd <= "0001"; -- - (vdd25-256)*2^5-2^13
		in1 <= vdd25;
		in2 <= fptmp2;
		state <= w5;
when w5 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s6; else v_wait1 := v_wait1 + 1; state <= w5; end if;
when s6 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vdd25 := resize (fpout, vdd25);
		report_error ("fail vdd25 4", vdd25, to_sfixed (-13056.0, vdd25)); -- -13056
		-- 
		-- kvptat
		sftmp_slv_16 := x"5952" and x"fc00"; -- ee[0x2432]
		kvptat := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kvptat);
		report_error ("fail kvptat 1", kvptat, to_sfixed (22528.0, kvptat)); -- 22528
		fptmp2 := to_sfixed (2**10, fptmp2);
		report_error ("fail 2**10", fptmp2, to_sfixed (2**10, fptmp2)); -- 2**10
		cmd <= "0011"; -- / ee[0x2432]&0xfc00/2**10
		in1 <= kvptat;
		in2 <= fptmp2;
		state <= w6;
when w6 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s7; else v_wait1 := v_wait1 + 1; state <= w6; end if;
when s7 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kvptat := resize (fpout, kvptat);
		report_error ("fail kvptat 2", kvptat, to_sfixed (22.0, kvptat)); -- 22
		fptmp2 := to_sfixed (2**12, fptmp2);
		report_error ("fail 2**12", fptmp2, to_sfixed (2**12, fptmp2)); -- 2**12
		cmd <= "0011"; -- / kvptat/2**12
		in1 <= kvptat;
		in2 <= fptmp2;
		state <= w7;
when w7 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s8; else v_wait1 := v_wait1 + 1; state <= w7; end if;
when s8 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kvptat := resize (fpout, kvptat);
		report_error ("fail kvptat 3", kvptat, to_sfixed (0.0053710939999973561498336493968963623046875, kvptat)); -- 5.371094e-03
		-- 
		-- ktptat
		sftmp_slv_16 := x"5952" and x"03ff"; -- ee[0x2432]
		ktptat := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), ktptat);
		report_error ("fail ktptat 1", ktptat, to_sfixed (338.0, ktptat)); -- 338
		fptmp2 := to_sfixed (2**3, fptmp2);
		report_error ("fail 2**3", fptmp2, to_sfixed (2**3, fptmp2)); -- 8
		cmd <= "0011"; -- / ktptat/2^3
		in1 <= ktptat;
		in2 <= fptmp2;
		state <= w8;
when w8 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s9; else v_wait1 := v_wait1 + 1; state <= w8; end if;
when s9 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		ktptat := resize (fpout, ktptat);
		report_error ("fail ktptat 2", ktptat, to_sfixed (42.25, ktptat)); -- 42.25
		--
		-- deltaV
		sftmp_slv_16 := x"ccc5" and x"ffff"; -- ram[0x072a]
		deltaV := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), deltaV);
		report_error ("fail deltaV 1", deltaV, to_sfixed (-13115.0, deltaV)); -- -13115
		cmd <= "0001"; -- - ram[0x072a]-vdd25
		in1 <= deltaV;
		in2 <= vdd25;
		state <= w9;
when w9 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s10; else v_wait1 := v_wait1 + 1; state <= w9; end if;
when s10 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		deltaV := resize (fpout, deltaV);
		report_error ("fail deltaV 2", deltaV, to_sfixed (-13115.0-(-13056.0), deltaV)); -- -59
		cmd <= "0011"; -- / (ram[0x072a]-vdd25)/kvdd
		in1 <= deltaV;
		in2 <= kvdd;
		state <= w10;
when w10 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s11; else v_wait1 := v_wait1 + 1; state <= w10; end if;
when s11 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		deltaV := resize (fpout, deltaV);
		report_error ("fail deltaV 3", deltaV, to_sfixed (0.018623737, deltaV)); -- 1.861572e-02
		fptmp2 := to_sfixed (3.3, fptmp2);
		report_error ("fail 3.3", fptmp2, to_sfixed (3.3, fptmp2)); -- 3.3
		cmd <= "0000"; -- +
		in1 <= deltaV;
		in2 <= fptmp2;
		state <= w11;
when w11 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s12; else v_wait1 := v_wait1 + 1; state <= w11; end if;
when s12 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vdd := resize (fpout, vdd);
		report_error ("fail vdd", vdd, to_sfixed (3.319, vdd)); -- 3.319
		--
		-- vptat25
		sftmp_slv_16 := x"2ff1" and x"ffff"; -- ee[0x2431]
		vptat25 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), vptat25);
		report_error ("fail vptat25", vptat25, to_sfixed (12273.0, vptat25)); -- 12273
		--
		-- vptat
		sftmp_slv_16 := x"06af" and x"ffff"; -- ram[0x0720]
		vptat := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), vptat);
		report_error ("fail vptat", vptat, to_sfixed (1711.0,vptat)); -- 1711
		--
		-- vbe
		sftmp_slv_16 := x"4bf2" and x"ffff"; -- ram[0x0700]
		vbe := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), vbe);
		report_error ("fail vbe", vbe, to_sfixed (19442.0,vbe)); -- 19442
		--
		-- alphaptatee
		sftmp_slv_16 := x"4210" and x"f000"; -- ee[0x2410]
		alphaptatee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), alphaptatee);
		report_error ("fail alphaptatee 1", alphaptatee, to_sfixed (16384.0,alphaptatee)); -- 16384
		fptmp2 := to_sfixed (2**12, fptmp2);
		report_error ("fail 2**12", fptmp2, to_sfixed (2**12, fptmp2)); -- 2**12
		cmd <= "0011"; -- / alphaptatee/2^12
		in1 <= alphaptatee;
		in2 <= fptmp2;
		state <= w12;
when w12 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s13; else v_wait1 := v_wait1 + 1; state <= w12; end if;
when s13 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		alphaptatee := resize (fpout, alphaptatee);
		report_error ("fail alphaptatee 2", alphaptatee, to_sfixed (4.0, alphaptatee)); -- 4
		--
		-- alphaptat
		fptmp2 := to_sfixed (2**2, fptmp2);
		report_error ("fail 2**2", fptmp2, to_sfixed (2**2, fptmp2)); -- 4
		cmd <= "0011"; -- / alphaptatee/2^2
		in1 <= alphaptatee;
		in2 <= fptmp2;
		state <= w13;
when w13 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s14; else v_wait1 := v_wait1 + 1; state <= w13; end if;
when s14 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		alphaptat := resize (fpout, alphaptat);
		report_error ("fail alphaptat 3", alphaptat, to_sfixed (1.0, alphaptat)); -- 1
		fptmp2 := to_sfixed (2**3, fptmp2);
		report_error ("fail 2**3", fptmp2, to_sfixed (2**3, fptmp2)); -- 2**3
		cmd <= "0000"; -- + (alphaptatee/2^2)+2^3
		in1 <= alphaptat;
		in2 <= fptmp2;
		state <= w14;
when w14 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s15; else v_wait1 := v_wait1 + 1; state <= w14; end if;
when s15 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		alphaptat := resize (fpout, alphaptat);
		report_error ("fail alphaptat 4", alphaptat, to_sfixed (9.0, alphaptat)); -- 9
		--
		-- vptatart
		cmd <= "0010"; -- * vptat*alphaptat
		in1 <= vptat;
		in2 <= alphaptat;
		state <= w15;
when w15 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s16; else v_wait1 := v_wait1 + 1; state <= w15; end if;
when s16 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vptatart := resize (fpout, vptatart);
		report_error ("fail vptatart 1", vptatart, to_sfixed (15399.0, vptatart)); -- 15399
		cmd <= "0000"; -- + (vptat*alphaptat)+vbe
		in1 <= vptatart;
		in2 <= vbe;
		state <= w16;
when w16 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s17; else v_wait1 := v_wait1 + 1; state <= w16; end if;
when s17 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vptatart := resize (fpout, vptatart);
		report_error ("fail vptatart 2", vptatart, to_sfixed (34841.0, vptatart)); -- 34841
		cmd <= "0011"; -- / vptat/((vptat*alphaptat)+vbe)
		in1 <= vptat;
		in2 <= vptatart;
		state <= w17;
when w17 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s18; else v_wait1 := v_wait1 + 1; state <= w17; end if;
when s18 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vptatart := resize (fpout, vptatart);
		report_error ("fail vptatart 3", vptatart, to_sfixed (0.049108808587561725289560854434967041015625, vptatart)); -- 0.049108808587561725289560854434967041015625
		fptmp2 := to_sfixed (2**18, fptmp2);
		report_error ("fail 2**18", fptmp2, to_sfixed (2**18, fptmp2)); -- 2**18
		cmd <= "0010"; -- * (vptat/((vptat*alphaptat)+vbe))*2^18
		in1 <= vptatart;
		in2 <= fptmp2;
		state <= w18;
when w18 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s19; else v_wait1 := v_wait1 + 1; state <= w18; end if;
when s19 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vptatart := resize (fpout, vptatart);
		report_error ("fail vptatart 4", vptatart, to_sfixed (12873.5792, vptatart)); -- 12873.5792
		--
		-- Ta
		cmd <= "0010"; -- * a=deltaV*kvptat
		in1 <= deltaV;
		in2 <= kvptat;
		state <= w20;
when w20 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s21; else v_wait1 := v_wait1 + 1; state <= w20; end if;
when s21 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		Ta := resize (fpout, Ta);
		report_error ("fail Ta 1", Ta, to_sfixed (0.00010002983935919473879039287567138671875, Ta)); -- 0.00010002983935919473879039287567138671875
		fptmp2 := to_sfixed (1.0, fptmp2);
		report_error ("fail 1.0", fptmp2, to_sfixed (1.0, fptmp2)); -- 1.0
		cmd <= "0000"; -- + b=1+a
		in1 <= fptmp2;
		in2 <= Ta;
		state <= w21;
when w21 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s22; else v_wait1 := v_wait1 + 1; state <= w21; end if;
when s22 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		Ta := resize (fpout, Ta);
		report_error ("fail Ta 2", Ta, to_sfixed (1.00010002983935919473879039287567138671875, Ta)); -- 1.00010002983935919473879039287567138671875
		cmd <= "0011"; -- / c=vptatart/b
		in1 <= vptatart;
		in2 <= Ta;
		state <= w22;
when w22 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s23; else v_wait1 := v_wait1 + 1; state <= w22; end if;
when s23 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		Ta := resize (fpout, Ta);
		report_error ("fail Ta 3", Ta, to_sfixed (12872.29190508633109857328236103057861328125, Ta)); -- 12872.29190508633109857328236103057861328125
		cmd <= "0001"; -- - d=c-vptat25
		in1 <= Ta;
		in2 <= vptat25;
		state <= w23;
when w23 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s24; else v_wait1 := v_wait1 + 1; state <= w23; end if;
when s24 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		Ta := resize (fpout, Ta);
		report_error ("fail Ta 4", Ta, to_sfixed (599.291905086330416452256031334400177001953125, Ta)); -- 599.291905086330416452256031334400177001953125
		cmd <= "0011"; -- / e=d/ktptat
		in1 <= Ta;
		in2 <= ktptat;
		state <= w24;
when w24 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s25; else v_wait1 := v_wait1 + 1; state <= w24; end if;
when s25 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		Ta := resize (fpout, Ta);
		report_error ("fail Ta 5", Ta, to_sfixed (14.1844237890254589729011058807373046875, Ta)); -- 14.1844237890254589729011058807373046875
		fptmp2 := to_sfixed (25.0, fptmp2);
		report_error ("fail 25.0", fptmp2, to_sfixed (25.0, fptmp2)); -- 25.0
		cmd <= "0000"; -- + f=e+25.0
		in1 <= Ta;
		in2 <= fptmp2;
		state <= w25;
when w25 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s26; else v_wait1 := v_wait1 + 1; state <= w25; end if;
when s26 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		Ta := resize (fpout, Ta);
		report_error ("fail Ta 6", Ta, to_sfixed (39.184, Ta)); -- 39.184
		--
		-- Kgain
		sftmp_slv_16 := x"1881" and x"ffff"; -- ram[0x070a]
		fptmp1 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), fptmp1);
		report_error ("fail ram[0x070a]", fptmp1, to_sfixed (6273.0, fptmp1)); -- 6273
		sftmp_slv_16 := x"18ef" and x"ffff"; -- ee[0x2430]
		fptmp2 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), fptmp2);
		report_error ("fail ee[0x2430]", fptmp2, to_sfixed (6383.0, fptmp2)); -- 6383
		cmd <= "0011"; -- / GAIN/ram[0x070a]
		in1 <= fptmp2;
		in2 <= fptmp1;
		state <= w26;
when w26 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s27; else v_wait1 := v_wait1 + 1; state <= w26; end if;
when s27 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		Kgain := resize (fpout, Kgain);
		report_error ("fail Kgain", Kgain, to_sfixed (1.01753546947234, Kgain)); -- 1.01753546947234
		-- xxx pixdata 12,16 ram[0x056f]
		sftmp_slv_16 := x"0261" and x"ffff"; -- ram[0x056f]
		pixgain12_16 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), pixgain12_16);
		report_error ("fail pixgain12_16", pixgain12_16, to_sfixed (609.0, pixgain12_16)); -- 609
		cmd <= "0010"; -- * ram[pixel_data]*Kgain
		in1 <= pixgain12_16;
		in2 <= Kgain;
		state <= w27;
when w27 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s28; else v_wait1 := v_wait1 + 1; state <= w27; end if;
when s28 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixgain12_16 := resize (fpout, pixgain12_16);
		report_error ("fail pixgain12_16", pixgain12_16, to_sfixed (619.679100908656, pixgain12_16)); -- 619.679100908656
		sftmp_slv_16 := x"ffbb" and x"ffff"; -- ee[0x2411]
		offsetaverage := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), offsetaverage);
		report_error ("fail offsetaverage", offsetaverage, to_sfixed (-69.0, offsetaverage)); -- -69
		sftmp_slv_16 := x"4210" and x"0f00"; -- ee[0x2410]
		occscalerow := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), occscalerow);
		occscalerow := occscalerow srl 8;
		report_error ("fail occscalerow", occscalerow, to_sfixed (2.0, occscalerow)); -- 2
		sftmp_slv_16 := x"4210" and x"00f0"; -- ee[0x2410]
		occscalecolumn := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), occscalecolumn);
		occscalecolumn := occscalecolumn srl 4;
		report_error ("fail occscalecolumn", occscalecolumn, to_sfixed (1.0, occscalecolumn)); -- 1
		sftmp_slv_16 := x"f2f2" and x"f000"; -- ee[0x2414]
		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
		tmpslv4 := sftmp_slv_16 (3 downto 0);
		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
		occrow12 := resize (tmpsf4, occrow12);
		report_error ("fail occrow12", occrow12, to_sfixed (-1.0, occrow12)); -- -1 / 0xf signed
		sftmp_slv_16 := x"e0ef" and x"f000"; -- ee[0x241b]
		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 12));
		tmpslv4 := sftmp_slv_16 (3 downto 0);
		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
		occcolumn16 := resize (tmpsf4, occcolumn16);
		report_error ("fail occcolumn16", occcolumn16, to_sfixed (-2.0, occcolumn16)); -- -2 / 0xe signed
		sftmp_slv_16 := x"08a0" and x"fc00"; -- ee[0x25af]
		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 10));
		tmpslv6 := sftmp_slv_16 (5 downto 0);
		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
		offset12_16 := resize (tmpsf6, offset12_16);
		report_error ("fail offset12_16", offset12_16, to_sfixed (2.0, offset12_16)); -- 2
		sftmp_slv_16 := x"4210" and x"000f"; -- ee[0x2410]
		occscaleremnant := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), occscaleremnant);
		report_error ("fail occscaleremnant", occscaleremnant, to_sfixed (0.0, occscaleremnant)); -- 0
		occsro := to_sfixed (1.0, occsro) sll to_integer (occscalerow); -- 2^occscalerow=2^2=4.0
		report_error ("fail occsro", occsro, to_sfixed (4.0, occsro)); -- 4
		occsc := to_sfixed (1.0, occsc) sll to_integer (occscalecolumn); -- 2^occscalecolumn=2^1=2.0
		report_error ("fail occsc", occsc, to_sfixed (2.0, occsc)); -- 2
		occsre := to_sfixed (1.0, occsre) sll to_integer (occscaleremnant); -- 2^occscaleremnant=2^0=1.0
		report_error ("fail occsre", occsre, to_sfixed (1.0, occsro)); -- 1
		cmd <= "0010"; -- * occrow12*2^occscalerow
		in1 <= occrow12;
		in2 <= occsro;
		state <= w28;
when w28 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s29; else v_wait1 := v_wait1 + 1; state <= w28; end if;
when s29 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		occsro := resize (fpout, occsro);
		report_error ("fail occsro 1", occsro, to_sfixed (-4.0, occsro)); -- -4
		cmd <= "0010"; -- * occcolumn16*2^occscalecolumn
		in1 <= occcolumn16;
		in2 <= occsc;
		state <= w29;
when w29 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s30; else v_wait1 := v_wait1 + 1; state <= w29; end if;
when s30 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		occsc := resize (fpout, occsc);
		report_error ("fail occsc 1", occsc, to_sfixed (-4.0, occsc)); -- -4
		cmd <= "0010"; -- * occremnant*2^occscaleremnant
		in1 <= offset12_16;
		in2 <= occsre;
		state <= w30;
when w30 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s31; else v_wait1 := v_wait1 + 1; state <= w30; end if;
when s31 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		occsre := resize (fpout, occsre);
		report_error ("fail occsre 1", occsre, to_sfixed (2.0, occsre)); -- 2
		cmd <= "0000"; -- + (occcolumn16*2^occscalecolumn)+(occremnant*2^occscaleremnant)
		in1 <= occsc;
		in2 <= occsre;
		state <= w31;
when w31 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s32; else v_wait1 := v_wait1 + 1; state <= w31; end if;
when s32 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		occsre := resize (fpout, occsre);
		report_error ("fail occsre 2", occsre, to_sfixed (-2.0, occsre)); -- -2
		cmd <= "0000"; -- + (occrow12*2^occscalerow)+(occcolumn16*2^occscalecolumn)+(occremnant*2^occscaleremnant)
		in1 <= occsre;
		in2 <= occsro;
		state <= w32;
when w32 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s33; else v_wait1 := v_wait1 + 1; state <= w32; end if;
when s33 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		occsre := resize (fpout, occsre);
		report_error ("fail occsre 3", occsre, to_sfixed (-6.0, occsre)); -- -6
		cmd <= "0000"; -- + offsetaverage+(occrow12*2^occscalerow)+(occcolumn16*2^occscalecolumn)+(occremnant*2^occscaleremnant)
		in1 <= occsre;
		in2 <= offsetaverage;
		state <= w33;
when w33 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s34; else v_wait1 := v_wait1 + 1; state <= w33; end if;
when s34 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixosref12_16 := resize (fpout, pixosref12_16);
		report_error ("fail pixosref12_16", pixosref12_16, to_sfixed (-75.0, pixosref12_16)); -- -75
		sftmp_slv_16 := x"08a0" and x"000e"; -- ee[0x25af]
		kta12_16_ee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kta12_16_ee);
		report_error ("fail kta12_16_ee", kta12_16_ee, to_sfixed (0.0, kta12_16_ee)); -- 0
		kta12_16_ee := kta12_16_ee srl 1;
		report_error ("fail kta12_16_ee", kta12_16_ee, to_sfixed (0.0, kta12_16_ee));
		sftmp_slv_16 := x"5354" and x"00ff"; -- ee[0x2437]
		kta_rc_ee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kta_rc_ee);
		report_error ("fail kta_rc_ee", kta_rc_ee, to_sfixed (84.0, kta_rc_ee)); -- 84
		sftmp_slv_16 := x"2363" and x"000f"; -- ee[0x2438]
		kta_scale_2 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kta_scale_2);
		report_error ("fail kta_scale_2", kta_scale_2, to_sfixed (3.0, kta_scale_2)); -- 3
		sftmp_slv_16 := x"2363" and x"00f0"; -- ee[0x2438]
		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 4));
		tmpslv4 := sftmp_slv_16 (3 downto 0);
		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
		kta_scale_1 := resize (tmpsf4, kta_scale_1);
		report_error ("fail kta_scale_1", kta_scale_1, to_sfixed (6.0, kta_scale_1)); -- 6
		fptmp2 := to_sfixed (8.0, fptmp2);
		report_error ("fail 8.0", fptmp2, to_sfixed (8.0, fptmp2)); -- 8.0
		cmd <= "0000"; -- + kta_scale_1+8
		in1 <= kta_scale_1;
		in2 <= fptmp2;
		state <= w34;
when w34 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s35; else v_wait1 := v_wait1 + 1; state <= w34; end if;
when s35 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta_scale_1 := resize (fpout, kta_scale_1);
		report_error ("fail kta_scale_1", kta_scale_1, to_sfixed (14.0, kta_scale_1)); -- 14
		sftmp_slv_16 := x"5454" and x"000f"; -- ee[0x2434]
		kv12_16 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kv12_16);
		report_error ("fail kv12_16", kv12_16, to_sfixed (4.0, kv12_16)); -- 4
		kta_scale_2 := to_sfixed(1.0, kta_scale_2) sll to_integer (kta_scale_2);
		report_error ("fail kta_scale_2", kta_scale_2, to_sfixed (2**3, kta_scale_2)); -- 2**3
		cmd <= "0010"; -- * kta(12,16)_ee*2^Kta_scale_2
		in1 <= kta12_16_ee;
		in2 <= kta_scale_2;
		state <= w35;
when w35 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s36; else v_wait1 := v_wait1 + 1; state <= w35; end if;
when s36 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta12_16 := resize (fpout, kta12_16);
		report_error ("fail kta12_16 1", kta12_16, to_sfixed (0.0, kta12_16)); -- 0
		cmd <= "0000"; -- + kta_rc_ee+kta12_16_ee*2^kta_scale_2
		in1 <= kta_rc_ee;
		in2 <= kta12_16;
		state <= w36;
when w36 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s37; else v_wait1 := v_wait1 + 1; state <= w36; end if;
when s37 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta12_16 := resize (fpout, kta12_16);
		report_error ("fail kta12_16 2", kta12_16, to_sfixed (84.0, kta12_16)); -- 84
		kta_scale_1 := to_sfixed (1.0, kta_scale_1) sll to_integer (kta_scale_1);
		report_error ("fail 2^kta_scale_1", kta_scale_1, to_sfixed (2**14, kta_scale_1)); -- 2**14
		cmd <= "0011"; -- (kta_rc_ee+kta12_16*2^kta_scale_2)/2^kta_scale_1
		in1 <= kta12_16;
		in2 <= kta_scale_1;
		state <= w37;
when w37 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s38; else v_wait1 := v_wait1 + 1; state <= w37; end if;
when s38 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta12_16 := resize (fpout, kta12_16);
		report_error ("fail kta12_16 3", kta12_16, to_sfixed (0.005126953125, kta12_16)); -- 0.005126953125
		state <= w38;
when w38 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s39; else v_wait1 := v_wait1 + 1; state <= w38; end if;
when s39 =>
		sftmp_slv_16 := x"2363" and x"0f00"; -- ee[0x2438]
		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
		tmpslv4 := sftmp_slv_16 (3 downto 0);
		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
		kvscale := resize (tmpsf4, kvscale);
		report_error ("fail kvscale", kvscale, to_sfixed (3.0, kvscale)); -- 3
		kvscale := to_sfixed (1.0,kvscale) sll to_integer (kvscale);
		report_error ("fail 2^kvscale", kvscale, to_sfixed(8.0, kvscale)); -- 8
		cmd <= "0011"; -- / kv12_16/2^kvscale
		in1 <= kv12_16;
		in2 <= kvscale;
		state <= w39;
when w39 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s40; else v_wait1 := v_wait1 + 1; state <= w39; end if;
when s40 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kv12_16 := resize (fpout, kv12_16);
		report_error ("fail kv12_16", kv12_16, to_sfixed (0.5, kv12_16)); -- 0.5
		state <= w40;
when w40 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s41; else v_wait1 := v_wait1 + 1; state <= w40; end if;
when s41 =>
		fptmp2 := to_sfixed (25.0, fptmp2);
		report_error ("fail 25.0", fptmp2, to_sfixed (25.0, fptmp2)); -- 25.0
		cmd <= "0001"; -- - Ta-Ta0 Ta-25
		in1 <= Ta;
		in2 <= fptmp2;
		state <= w41;
when w41 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s42; else v_wait1 := v_wait1 + 1; state <= w41; end if;
when s42 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		tad := resize (fpout, tad);
		report_error ("fail tad", tad, to_sfixed (39.184-25.0, tad)); -- 39.184-25.0
		state <= w42;
when w42 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s43; else v_wait1 := v_wait1 + 1; state <= w42; end if;
when s43 =>
		fptmp2 := to_sfixed (3.3, fptmp2);
		report_error ("fail 3.3", fptmp2, to_sfixed (3.3, fptmp2)); -- 3.3
		cmd <= "0001"; -- - Vdd-VddV0 Vdd-3.3
		in1 <= Vdd;
		in2 <= fptmp2;
		state <= w43;
when w43 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s44; else v_wait1 := v_wait1 + 1; state <= w43; end if;
when s44 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		v0d := resize (fpout, v0d);
		report_error ("fail v0d", v0d, to_sfixed (3.319-3.3, v0d)); -- 3.319-3.3
		state <= w44;
when w44 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s45; else v_wait1 := v_wait1 + 1; state <= w44; end if;
when s45 =>
		cmd <= "0010"; -- * Kv12_16*(Vdd-VddV0)
		in1 <= kv12_16;
		in2 <= v0d;
		state <= w45;
when w45 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s46; else v_wait1 := v_wait1 + 1; state <= w45; end if;
when s46 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kv12_16 := resize (fpout, kv12_16);
		report_error ("fail kv12_16", kv12_16, to_sfixed (0.5*(3.319-3.3), kv12_16)); -- 0.5*(3.319-3.3)
		state <= w46;
when w46 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s47; else v_wait1 := v_wait1 + 1; state <= w46; end if;
when s47 =>
		fptmp1 := to_sfixed (1.0, fptmp1);
		report_error ("fail 1.0", fptmp1, to_sfixed (1.0, fptmp1)); -- 1.0
		cmd <= "0000"; -- + 1+Kv12_16*(Vdd-VddV0)
		in1 <= fptmp1;
		in2 <= kv12_16;
		state <= w47;
when w47 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s48; else v_wait1 := v_wait1 + 1; state <= w47; end if;
when s48 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kv12_16 := resize (fpout, kv12_16);
		report_error ("fail kv12_16", kv12_16, to_sfixed (1.0+(0.5*(3.319-3.3)), kv12_16)); -- 1.0+(0.5*(3.319-3.3))
		state <= w48;
when w48 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s49; else v_wait1 := v_wait1 + 1; state <= w48; end if;
when s49 =>
		cmd <= "0010"; -- * KTa(12,16)*(Ta-Ta0)
		in1 <= kta12_16;
		in2 <= tad;
		state <= w49;
when w49 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s50; else v_wait1 := v_wait1 + 1; state <= w49; end if;
when s50 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta12_16 := resize (fpout, kta12_16);
		report_error ("fail kta12_16", kta12_16, to_sfixed (0.005126953125*(39.184-25.0), kta12_16)); -- 0.005126953125*(39.184-25.0)
		state <= w50;
when w50 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s51; else v_wait1 := v_wait1 + 1; state <= w50; end if;
when s51 =>
		fptmp1 := to_sfixed (1.0, fptmp1);
		report_error ("fail 1.0", fptmp1, to_sfixed (1.0, fptmp1)); -- 1.0
		cmd <= "0000"; -- + 1+KTa(12,16)*(Ta-Ta0)
		in1 <= fptmp1;
		in2 <= kta12_16;
		state <= w51;
when w51 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s52; else v_wait1 := v_wait1 + 1; state <= w51; end if;
when s52 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta12_16 := resize (fpout, kta12_16);
		report_error ("fail kta12_16", kta12_16, to_sfixed (1.0+(0.005126953125*(39.184-25.0)), kta12_16)); -- 1.0+(0.005126953125*(39.184-25.0))
		state <= w52;
when w52 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s53; else v_wait1 := v_wait1 + 1; state <= w52; end if;
when s53 =>
		cmd <= "0010"; -- * PIXosref*(1+KTa(12,16)*(Ta-Ta0))
		in1 <= pixosref12_16;
		in2 <= kta12_16;
		state <= w53;
when w53 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s54; else v_wait1 := v_wait1 + 1; state <= w53; end if;
when s54 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta12_16 := resize (fpout, kta12_16);
		report_error ("fail kta12_16", kta12_16, to_sfixed ((-75.0)*(1.0+(0.005126953125*(39.184-25.0))), kta12_16)); -- (-75.0)*(1.0+(0.005126953125*(39.184-25.0)))
		state <= w54;
when w54 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s55; else v_wait1 := v_wait1 + 1; state <= w54; end if;
when s55 =>
		cmd <= "0010"; -- * PIXosref*(1+KTa(12,16)*(Ta-Ta0))*(1+Kv(12,16)*(Vdd-VddV0))
		in1 <= kta12_16;
		in2 <= kv12_16;
		state <= w55;
when w55 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s56; else v_wait1 := v_wait1 + 1; state <= w55; end if;
when s56 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta12_16 := resize (fpout, kta12_16);
		report_error ("fail kta12_16", kta12_16, to_sfixed ((-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3)), kta12_16)); -- (-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3))
		state <= w56;
when w56 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s57; else v_wait1 := v_wait1 + 1; state <= w56; end if;
when s57 =>
		cmd <= "0001"; -- - PIXgain-PIXosref*(1+KTa(12,16)*(Ta-Ta0))*(1+Kv(12,16)*(Vdd-VddV0))
		in1 <= pixgain12_16;
		in2 <= kta12_16;
		state <= w57;
when w57 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s58; else v_wait1 := v_wait1 + 1; state <= w57; end if;
when s58 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixos12_16 := resize (fpout, pixos12_16);
		report_error ("fail pixos12_16", pixos12_16, to_sfixed (619.679100908656-(-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3)), pixos12_16)); -- 619.679100908656-(-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3))
		report_error ("fail pixos12_16 const", pixos12_16, to_sfixed (700.882495690877, pixos12_16)); -- 700.882495690877
		state <= w58;
when w58 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s59; else v_wait1 := v_wait1 + 1; state <= w58; end if;
when s59 =>
		fptmp2 := to_sfixed (1.0, fptmp2);
		report_error ("fail 1.0", fptmp2, to_sfixed (1.0, fptmp2)); -- 1.0
		cmd <= "0011"; -- / VIR(12,16)Emissivity_COMPOENSATED=pixos12_16/E E=1
		in1 <= pixos12_16;
		in2 <= fptmp2;
		state <= w59;
when w59 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s60; else v_wait1 := v_wait1 + 1; state <= w59; end if;
when s60 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vir12_16_emissitivy_componsated := resize (fpout, vir12_16_emissitivy_componsated);
		report_error ("fail vir12_16_emissitivy_componsated", vir12_16_emissitivy_componsated, to_sfixed (700.882495690877, vir12_16_emissitivy_componsated)); -- 700.882495690877
		state <= w60;
when w60 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s61; else v_wait1 := v_wait1 + 1; state <= w60; end if;
when s61 =>
		sftmp_slv_16 := x"ffca" and x"ffff"; -- ram[0x0708]
		pixgain_cp_sp0 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), pixgain_cp_sp0);
		report_error ("fail pixgain_cp_sp0", pixgain_cp_sp0, to_sfixed (-54.0, pixgain_cp_sp0)); -- -54
		cmd <= "0010"; -- * pixgain_cp_sp0*Kgain
		in1 <= pixgain_cp_sp0;
		in2 <= kgain;
		state <= w61;
when w61 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s62; else v_wait1 := v_wait1 + 1; state <= w61; end if;
when s62 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixgain_cp_sp0 := resize (fpout, pixgain_cp_sp0);
		report_error ("fail pixgain_cp_sp0", pixgain_cp_sp0, to_sfixed (-54.9469153515065, pixgain_cp_sp0)); -- -54.9469153515065
		state <= w62;
when w62 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s63; else v_wait1 := v_wait1 + 1; state <= w62; end if;
when s63 =>
		sftmp_slv_16 := x"ffc8" and x"ffff"; -- ram[0x0728]
		pixgain_cp_sp1 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), pixgain_cp_sp1);
		report_error ("fail pixgain_cp_sp1", pixgain_cp_sp1, to_sfixed (-56.0, pixgain_cp_sp1)); -- -56
		cmd <= "0010"; -- * pixgain_cp_sp1*Kgain
		in1 <= pixgain_cp_sp1;
		in2 <= kgain;
		state <= w63;
when w63 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s64; else v_wait1 := v_wait1 + 1; state <= w63; end if;
when s64 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixgain_cp_sp1 := resize (fpout, pixgain_cp_sp1);
		report_error ("fail pixgain_cp_sp1", pixgain_cp_sp1, to_sfixed (-56.9819862904511, pixgain_cp_sp1)); -- -56.9819862904511
		state <= w64;
when w64 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s65; else v_wait1 := v_wait1 + 1; state <= w64; end if;
when s65 =>
		sftmp_slv_16 := x"fbb5" and x"03ff"; -- ee[0x243a]
		tmpslv10 := sftmp_slv_16 (9 downto 0);
		tmpsf10 := to_sfixed (tmpslv10, tmpsf10);
		off_cpsubpage_0 := resize (tmpsf10, off_cpsubpage_0);
		report_error ("fail off_cpsubpage_0", off_cpsubpage_0, to_sfixed (-75.0, off_cpsubpage_0)); -- -75
		state <= w65;
when w65 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s66; else v_wait1 := v_wait1 + 1; state <= w65; end if;
when s66 =>
		sftmp_slv_16 := x"fbb5" and x"fc00"; -- ee[0x243a]
		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 10));
		tmpslv6 := sftmp_slv_16 (5 downto 0);
		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
		off_cpsubpage_1_delta := resize (tmpsf6, kvscale);
		report_error ("fail off_cpsubpage_1_delta", off_cpsubpage_1_delta, to_sfixed (-2.0, off_cpsubpage_1_delta)); -- -2
		cmd <= "0000"; -- + OFF_CPsubpage_0+OFF_CPsubpage_1_delta
		in1 <= off_cpsubpage_0;
		in2 <= off_cpsubpage_1_delta;
		state <= w66;
when w66 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s67; else v_wait1 := v_wait1 + 1; state <= w66; end if;
when s67 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		off_cpsubpage_1 := resize (fpout, off_cpsubpage_1);
		report_error ("fail off_cpsubpage_1", off_cpsubpage_1, to_sfixed (-77.0, off_cpsubpage_1)); -- -77.0
		state <= w67;
when w67 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s68; else v_wait1 := v_wait1 + 1; state <= w67; end if;
when s68 =>
		sftmp_slv_16 := x"044b" and x"00ff"; -- ee[0x243b]
		kta_cp_ee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kta_cp_ee);
		report_error ("fail kta_cp_ee", kta_cp_ee, to_sfixed (75.0, kta_cp_ee)); -- 75
		cmd <= "0011"; -- / KTa_cp_ee/2^KTa_scale_1
		in1 <= kta_cp_ee;
		in2 <= kta_scale_1;
		state <= w68;
when w68 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s69; else v_wait1 := v_wait1 + 1; state <= w68; end if;
when s69 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta_cp := resize (fpout, kta_cp);
		report_error ("fail kta_cp", kta_cp, to_sfixed (0.00457763671875, kta_cp)); -- 0.00457763671875
		state <= w69;
when w69 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s70; else v_wait1 := v_wait1 + 1; state <= w69; end if;
when s70 =>
		sftmp_slv_16 := x"2363" and x"0f00"; -- ee[0x2438]
		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
		tmpslv4 := sftmp_slv_16 (3 downto 0);
		tmpsf4 := to_sfixed (tmpslv4, tmpsf4);
		kv_scale := resize (tmpsf4, kv_scale);
		report_error("fail kv_scale", kv_scale, to_sfixed (3.0, kv_scale)); -- 3
		kv_scale := to_sfixed (1.0, kv_scale) sll to_integer (kv_scale);
		report_error("fail 2^kv_scale", kv_scale, to_sfixed (8.0, kv_scale)); -- 8
		state <= w70;
when w70 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s71; else v_wait1 := v_wait1 + 1; state <= w70; end if;
when s71 =>
		sftmp_slv_16 := x"044b" and x"ff00"; -- ee[0x243b]
		sftmp_slv_16 := std_logic_vector (shift_right (unsigned (sftmp_slv_16), 8));
		tmpslv8 := sftmp_slv_16 (7 downto 0);
		tmpsf8 := to_sfixed (tmpslv8, tmpsf8);
		kv_cp_ee := resize (tmpsf8, kv_cp_ee);
		report_error("fail kv_cp_ee", kv_cp_ee, to_sfixed (4.0, kv_cp_ee)); -- 4
		state <= w71;
when w71 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s72; else v_wait1 := v_wait1 + 1; state <= w71; end if;
when s72 =>
		cmd <= "0011"; -- / kv_cp_ee/2^kv_scale
		in1 <= kv_cp_ee;
		in2 <= kv_scale;
		state <= w72;
when w72 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s73; else v_wait1 := v_wait1 + 1; state <= w72; end if;
when s73 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kv_cp := resize (fpout, kv_cp);
		report_error ("fail kv_cp", kv_cp, to_sfixed (0.5, kv_cp)); -- 0.5
		state <= w73;
when w73 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s74; else v_wait1 := v_wait1 + 1; state <= w73; end if;
when s74 =>
----0x2435 0x0994 
----IL_CHESS_C3 - 5 bits
----IL_CHESS_C2 - 5 bits
----IL_CHESS_C1 - 6 bits
----IL_CHESS_C3 = 0.125
----IL_CHESS_C2 = 3
----IL_CHESS_C1 = 1.25
		sftmp_slv_16 := x"0994" and x"003f"; -- ee[0x2435]
		tmpslv6 := sftmp_slv_16 (5 downto 0);
		tmpsf6 := to_sfixed (tmpslv6, tmpsf6);
		ilchessc1ee := resize (tmpsf6, ilchessc1ee);
		report_error ("fail ilchessc1ee", ilchessc1ee, to_sfixed (20.0, ilchessc1ee)); -- 20.0
		ilchessc1ee := ilchessc1ee srl 4;
		report_error ("fail ilchessc1ee/2^4", ilchessc1ee, to_sfixed (1.25, ilchessc1ee)); -- 1.25
		state <= w74;
when w74 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s75; else v_wait1 := v_wait1 + 1; state <= w74; end if;
when s75 =>
		cmd <= "0010"; -- * KTa_cp*(Ta-Ta0)
		in1 <= kta_cp;
		in2 <= tad;
		state <= w75;
when w75 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s76; else v_wait1 := v_wait1 + 1; state <= w75; end if;
when s76 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta_cp := resize (fpout, kta_cp);
		report_error ("fail kta_cp*(Ta-Ta0)", kta_cp, to_sfixed (0.00457763671875*(39.184-25.0), kta_cp)); -- 0.00457763671875*(39.184-25.0)
		state <= w76;
when w76 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s77; else v_wait1 := v_wait1 + 1; state <= w76; end if;
when s77 =>
		fptmp1 := to_sfixed (1.0, fptmp1);
		report_error ("fail 1.0", fptmp1, to_sfixed (1.0, fptmp1)); -- 1.0
		cmd <= "0000"; -- 1+KTa_cp*(Ta-Ta0)
		in1 <= fptmp1;
		in2 <= kta_cp;
		state <= w77;
when w77 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s78; else v_wait1 := v_wait1 + 1; state <= w77; end if;
when s78 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kta_cp := resize (fpout, kta_cp);
		report_error("fail kta_cp", kta_cp, to_sfixed (1.0+(0.00457763671875*(39.184-25.0)), kta_cp)); -- 1.0+(0.00457763671875*(39.184-25.0))
		state <= w78;
when w78 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s79; else v_wait1 := v_wait1 + 1; state <= w78; end if;
when s79 =>
		cmd <= "0010"; -- * Kv_cp*(Vdd-Vdd0)
		in1 <= kv_cp;
		in2 <= v0d;
		state <= w79;
when w79 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s80; else v_wait1 := v_wait1 + 1; state <= w79; end if;
when s80 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kv_cp := resize (fpout, kv_cp);
		report_error ("fail Kv_cp*(Vdd-Vdd0)", kv_cp, to_sfixed (0.5*(3.319-3.3), kv_cp)); -- 0.5*(3.319-3.3)
		state <= w80;
when w80 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s81; else v_wait1 := v_wait1 + 1; state <= w80; end if;
when s81 =>
		fptmp1 := to_sfixed (1.0, fptmp1);
		report_error ("fail 1.0", fptmp1, to_sfixed (1.0, fptmp1)); -- 1.0
		cmd <= "0000"; -- 1+Kv_cp*(Vdd-Vdd0)
		in1 <= fptmp1;
		in2 <= kv_cp;
		state <= w81;
when w81 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s82; else v_wait1 := v_wait1 + 1; state <= w81; end if;
when s82 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kv_cp := resize (fpout, kv_cp);
		report_error ("fail 1+Kv_cp*(Vdd-Vdd0)", kv_cp, to_sfixed (1.0+(0.5*(3.319-3.3)), kv_cp)); -- 1.0+(0.5*(3.319-3.3))
		state <= w82;
when w82 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s83; else v_wait1 := v_wait1 + 1; state <= w82; end if;
when s83 =>
		cmd <= "0010"; -- * (1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
		in1 <= kta_cp;
		in2 <= kv_cp;
		state <= w83;
when w83 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s84; else v_wait1 := v_wait1 + 1; state <= w83; end if;
when s84 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		ktacp_kvcp_mul := resize (fpout, ktacp_kvcp_mul);
		report_error ("fail (1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", ktacp_kvcp_mul, to_sfixed ((1.0+(0.00457763671875*(39.184-25.0)))*(1.0+(0.5*(3.319-3.3))), ktacp_kvcp_mul)); -- (1.0+(0.00457763671875*(39.184-25.0)))*(1.0+(0.5*(3.319-3.3)))
		state <= w84;
when w84 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s85; else v_wait1 := v_wait1 + 1; state <= w84; end if;
when s85 =>
		cmd <= "0010"; -- * OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
		in1 <= ktacp_kvcp_mul;
		in2 <= off_cpsubpage_0;
		state <= w85;
when w85 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s86; else v_wait1 := v_wait1 + 1; state <= w85; end if;
when s86 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixos_cp_sp0 := resize (fpout, pixos_cp_sp0);
		report_error ("fail OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp0, to_sfixed((-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), pixos_cp_sp0)); -- (-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
		state <= w86;
when w86 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s87; else v_wait1 := v_wait1 + 1; state <= w86; end if;
when s87 =>
		cmd <= "0001"; -- - PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
		in1 <= pixgain_cp_sp0;
		in2 <= pixos_cp_sp0;
		state <= w87;
when w87 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s88; else v_wait1 := v_wait1 + 1; state <= w87; end if;
when s88 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixos_cp_sp0 := resize (fpout, pixos_cp_sp0);
		report_error ("fail PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp0, to_sfixed ((-54.9469153515065)-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), pixos_cp_sp0)); -- (-54.9469153515065)-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
		report_error ("fail PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) const", pixos_cp_sp0, to_sfixed (25.6666575059956, pixos_cp_sp0)); -- 25.6666575059956
		state <= w88;
when w88 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s89; else v_wait1 := v_wait1 + 1; state <= w88; end if;
when s89 =>
		cmd <= "0010"; -- * OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
		in1 <= ktacp_kvcp_mul;
		in2 <= off_cpsubpage_1;
		state <= w89;
when w89 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s90; else v_wait1 := v_wait1 + 1; state <= w89; end if;
when s90 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixos_cp_sp1 := resize (fpout, pixos_cp_sp1);
		report_error("fail OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp1, to_sfixed ((-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), pixos_cp_sp1)); -- (-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
		state <= w90;
when w90 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s91; else v_wait1 := v_wait1 + 1; state <= w90; end if;
when s91 =>
		cmd <= "0001"; -- - PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
		in1 <= pixgain_cp_sp1;
		in2 <= pixos_cp_sp1;
		state <= w91;
when w91 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s92; else v_wait1 := v_wait1 + 1; state <= w91; end if;
when s92 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixos_cp_sp1 := resize (fpout, pixos_cp_sp1);
		report_error ("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp1, to_sfixed ((-56.9819862904511)-(-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)), pixos_cp_sp1)); -- (-56.9819862904511)-(-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))
		report_error ("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) const", pixos_cp_sp1, to_sfixed (21.63158656770509, pixos_cp_sp1)); -- 21.63158656770509 -- xxx ??? ERROR on page 41 ??? xxx
		report_error ("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) const, error ? on page 41 => pixos_cp_sp1 = 21.63158656770509", pixos_cp_sp1, to_sfixed (25.79655775862116562500, pixos_cp_sp1)); -- 25.79655775862116562500 -- xxx from bc calculator
		state <= w92;
when w92 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s93; else v_wait1 := v_wait1 + 1; state <= w92; end if;
when s93 =>
-- ch_pattern
		tmpuf1 := to_ufixed(
		std_logic_vector(
		to_unsigned((integer((pixelnumber12_16-1)/32)-integer(integer((pixelnumber12_16-1)/32)/2)*2),1)
		xor
		to_unsigned((integer(pixelnumber12_16-1)-integer((pixelnumber12_16-1)/2)*2),1)
		),tmpuf1
		);
		report_error ("fail pixelnumber12_16 xor uf", tmpuf1, to_ufixed (0.0, tmpuf1));
		tmpsf1 := to_sfixed (tmpuf1);
		report_error ("fail pixelnumber12_16 xor sf", tmpsf1, to_sfixed (0.0, tmpsf1));
		ch_pattern_12_16_u := resize (tmpuf1, ch_pattern_12_16_u);
		report_error ("fail ch_pattern_12_16_u", ch_pattern_12_16_u, to_ufixed (0.0, ch_pattern_12_16_u)); -- 0
		ch_pattern_12_16_s := resize (to_sfixed (ch_pattern_12_16_u), ch_pattern_12_16_s);
		report_error ("fail ch_pattern_12_16_s", ch_pattern_12_16_s, to_sfixed (0.0, ch_pattern_12_16_s)); -- 0
		ch_pattern_12_16 := ch_pattern_12_16_s;
		report_error ("fail ch_pattern_12_16 after convert u->s", ch_pattern_12_16, to_sfixed (0.0, ch_pattern_12_16)); -- 0
		sftmp_slv_16 := x"f020" and x"003f"; -- ee[0x243c]
		tgcee := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), tgcee);
		report_error ("fail tgcee", tgcee, to_sfixed (32.0, tgcee)); -- 32
		tgcee := tgcee srl 5;
		report_error ("fail tgcee/2^5", tgcee, to_sfixed (1.0, tgcee)); -- 1
		tgc := tgcee;
		state <= w93;
when w93 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s94; else v_wait1 := v_wait1 + 1; state <= w93; end if;
when s94 =>
		cmd <= "0010"; -- * CHIL_pattern*PIXos_cp_sp1
		in1 <= ch_pattern_12_16;
		in2 <= pixos_cp_sp1;
		state <= w94;
when w94 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s95; else v_wait1 := v_wait1 + 1; state <= w94; end if;
when s95 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixospatt1 := resize (fpout, pixospatt1);
		report_error ("fail pixospatt1", pixospatt1, to_sfixed (to_real (ch_pattern_12_16)*to_real (pixos_cp_sp1), pixospatt1)); -- ch_pattern_12_16*pixos_cp_sp1
		state <= w95;
when w95 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s96; else v_wait1 := v_wait1 + 1; state <= w95; end if;
when s96 =>
		fptmp1 := to_sfixed (1.0, fptmp1);
		report_error ("fail 1.0", fptmp1, to_sfixed (1.0, fptmp1)); -- 1.0
		cmd <= "0001"; -- - (1-CHIL_pattern)
		in1 <= fptmp1;
		in2 <= ch_pattern_12_16;
		state <= w96;
when w96 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s97; else v_wait1 := v_wait1 + 1; state <= w96; end if;
when s97 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		ch_pattern_12_16_minusone := resize (fpout, ch_pattern_12_16_minusone);
		report_error ("fail ch_pattern_12_16_minusone", ch_pattern_12_16_minusone, to_sfixed (1.0-to_real (ch_pattern_12_16), ch_pattern_12_16_minusone)); -- 1.0-ch_pattern_12_16
		state <= w97;
when w97 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s98; else v_wait1 := v_wait1 + 1; state <= w97; end if;
when s98 =>
		cmd <= "0010"; -- * (1-CHIL_pattern)*PIXos_cp_sp0
		in1 <= ch_pattern_12_16_minusone;
		in2 <= pixos_cp_sp0;
		state <= w98;
when w98 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s99; else v_wait1 := v_wait1 + 1; state <= w98; end if;
when s99 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixospatt2 := resize (fpout, pixospatt2);
		report_error ("fail pixospatt2", pixospatt2, to_sfixed (to_real (ch_pattern_12_16_minusone)*to_real (pixos_cp_sp0), pixospatt2)); -- ch_pattern_12_16_minusone*pixos_cp_sp0
		state <= w99;
when w99 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s100; else v_wait1 := v_wait1 + 1; state <= w99; end if;
when s100 =>
		cmd <= "0000"; -- + ((1-CHIL_pattern)*PIXos_cp_sp0)+(CHIL_pattern*PIXos_cp_sp1)
		in1 <= pixospatt1;
		in2 <= pixospatt2;
		state <= w100;
when w100 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s101; else v_wait1 := v_wait1 + 1; state <= w100; end if;
when s101 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixospatt12 := resize (fpout, pixospatt12);
		report_error ("fail ((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)", pixospatt12, to_sfixed (((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)))), pixospatt12)); -- :E
		report_error ("fail ((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) const", pixospatt12, to_sfixed(21.6315865670509, pixospatt12)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
		state <= w101;
		-----------------------------
when w101 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s102; else v_wait1 := v_wait1 + 1; state <= w101; end if;
when s102 =>
		cmd <= "0010"; -- * TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)
		in1 <= tgc;
		in2 <= pixospatt12;
		state <= w102;
when w102 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s103; else v_wait1 := v_wait1 + 1; state <= w102; end if;
when s103 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		pixospatt12 := resize (fpout, pixospatt12);
		report_error ("fail TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)", pixospatt12, to_sfixed ((1.0*((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))), pixospatt12)); -- :E
		report_error ("fail TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) const", pixospatt12, to_sfixed (21.6315865670509, pixospatt12)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
		state <= w103;
when w103 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s104; else v_wait1 := v_wait1 + 1; state <= w103; end if;
when s104 =>
		cmd <= "0001"; -- - VIR(12,16)EMISSIVITY_COMPENSATED-TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)
		in1 <= vir12_16_emissitivy_componsated;
		in2 <= pixospatt12;
		state <= w104;
when w104 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s105; else v_wait1 := v_wait1 + 1; state <= w104; end if;
when s105 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vir_12_16_compensated := resize (fpout, vir_12_16_compensated);
		report_error ("fail VIR(12,16)EMISSIVITY_COMPENSATED-TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)", vir_12_16_compensated, to_sfixed ((700.882495690877-(1.0*((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)))))), vir_12_16_compensated)); -- :E
		report_error ("fail VIR(12,16)EMISSIVITY_COMPENSATED-TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) const", vir_12_16_compensated, to_sfixed (679.250909123826, pixospatt12)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
		state <= w105;
when w105 =>
report time'image(now) severity failure;

when ending =>

when others => null;
end case; end if; end if;
--sftmp_slv_fpbits := sftmp_slv_fpbits;
end process tester;
end architecture testbench;

