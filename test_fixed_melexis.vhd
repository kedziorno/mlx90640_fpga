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

entity test_fixed_melexis is
generic (
G_C_WAIT1 : integer := 0
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
o_out1,o_in1,o_in2 : out sfixed (17 downto -16)
);
end test_fixed_melexis;

architecture testbench of test_fixed_melexis is

	procedure report_fixed_value (
		constant mes : in string;
		actual : in sfixed
	) is
	begin
		report mes & CR
		& real'image(to_real(actual))
		& " ( "
		& to_string(actual)
		& " "
		& to_hstring(actual)
		& " ) "
		severity note;
	return;
	end procedure report_fixed_value;

	procedure report_fixed_value (
		constant mes : in string;
		actual : in ufixed
	) is
	begin
		report mes & CR
		& real'image(to_real(actual))
		& " ( "
		& to_string(actual)
		& " "
		& to_hstring(actual)
		& " ) "
		severity note;
	return;
	end procedure report_fixed_value;

	procedure report_fixed_value (
		constant mes : in string;
		actual : in sfixed;
		hi : in integer;
		lo : in integer
	) is
		subtype sta is sfixed (hi downto lo);
		variable a : sta;
	begin
		report mes & CR
		& real'image(to_real(resize(actual,hi,lo)))
		& " ( "
		& to_string(actual)
		& " "
		& to_hstring(actual)
		& " ) "
		severity note;
	return;
	end procedure report_fixed_value;

	procedure report_error (constant errmes : in string; actual : in sfixed; constant expected : in sfixed) is
	begin
		assert actual = expected
		report errmes & CR
		& "Actual: " & to_string(actual)
		& " (" & real'image(to_real(actual)) & ")" & CR
		& "     /= " & to_string(expected)
		& " (" & real'image(to_real(expected)) & ")"
		severity note;
	return;
	end procedure report_error;

	component fixed_synth is
	port (
		in1, in2   : in  std_logic_vector (33 downto 0);
		out1       : out std_logic_vector (33 downto 0);
		cmd        : in  std_logic_vector (3 downto 0);
		clk, rst_n : in  std_ulogic
	);
	end component fixed_synth;
	for all : fixed_synth use entity work.fixed_synth(rtl);

	constant clock_period : time := 500 ns;
--	subtype sfixed7 is sfixed (3 downto -3);
	subtype sfixed4 is sfixed (3 downto -16);
	subtype sfixed5 is sfixed (5 downto -16);
	subtype sfixed7 is sfixed (7 downto -16);
	subtype ufixed6 is ufixed (6 downto 0); --32/64
	subtype sfixed6 is sfixed (6 downto 0); --32/64
	subtype ufixed8 is ufixed (8 downto 0); --128/256
	subtype sfixed8 is sfixed (8 downto 0); --128/256
	subtype ufixed9 is ufixed (9 downto 0); --512/1024
	subtype sfixed9 is sfixed (9 downto 0); --512/1024
	subtype ufixed15 is ufixed (16 downto 0); -- 
	subtype sfixed15 is sfixed (16 downto 0); --
	subtype sfixed16 is sfixed (15 downto -16);
	subtype sfixed18 is sfixed (17 downto -16);
	subtype sfixed18a is sfixed (18 downto -16);
	subtype ufixed18 is ufixed (17 downto -16);
	signal stop_clock : boolean := false;
	signal clk, rst_n : std_ulogic;
	signal in1slv, in2slv, out1slv : std_logic_vector(33 downto 0);
	signal in1, in2 : sfixed18;
	signal out1 : sfixed18;
	signal cmd : std_logic_vector (3 downto 0);
--	signal in1r,in2r,out1r : real;
	type states is (
	idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,
	s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,
	s33,s34,s35,s36,s37,s38,s39,s40,s41,s42,s43,s44,s45,s46,s47,s48,
	s49,s50,s51,s52,s53,s54,s55,s56,s57,s58,s59,s60,s61,s62,s63,s64,
	s65,s66,s67,s68,s69,s70,s71,s72,s73,s74,s75,s76,s77,s78,s79,s80,
	s81,s82,s83,s84,s85,s86,s87,s88,s89,s90,s91,s92,s93,s94,s95,s96,s97,s98,s99,s100,
	w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,
	w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,
	w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43,w44,w45,w46,w47,w48,
	w49,w50,w51,w52,w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,w63,w64,
	w65,w66,w67,w68,w69,w70,w71,w72,w73,w74,w75,w76,w77,w78,w79,w80,
	w81,w82,w83,w84,w85,w86,w87,w88,w89,w90,w91,w92,w93,w94,w95,w96,w97,w98,w99,w100,
	ending
	);
	signal state : states;
	signal stmp_slv16 : std_logic_vector(31 downto 0);
	signal stmp_slv18 : std_logic_vector(33 downto 0);

begin

	out1 <= to_sfixed(out1slv, sfixed18'high, sfixed18'low);
	o_out1 <= out1;
	o_in1 <= to_sfixed(in1slv, sfixed18'high, sfixed18'low);
	o_in2 <= to_sfixed(in2slv, sfixed18'high, sfixed18'low);

	in1slv <= to_slv(in1);
	in2slv <= to_slv(in2);

	DUT : fixed_synth port map (
		in1 => in1slv,
		in2 => in2slv,
		out1 => out1slv,
		cmd => cmd,
		clk => i_clock,
		rst_n => i_reset
	);

--	clkprc : process is
--	begin
--		if (not stop_clock) then
--			clk <= '0';
--			-- wait for clock_period/2.0;
--			clk <= '1';
--			-- wait for clock_period/2.0;
--		else
--			wait;
--		end if;
--	end process clkprc;

--	reset_proc : process is
--	begin
--		rst_n <= '0';
--		-- wait for clock_period * 2.0;
--		rst_n <= '1';
--		report "sfixed16'high : " & integer'image(sfixed16'high);
--		report "sfixed16'low  : " & integer'image(sfixed16'low );
--		wait;
--	end process reset_proc;

	-- purpose: main test loop
	tester : process (i_clock,i_reset) is
		variable tmp_slv16 : std_logic_vector(31 downto 0);
		variable tmp_slv18 : std_logic_vector(33 downto 0);
		variable f16tmp1,f16tmp2,f16out : sfixed18;
		variable kvdd,vdd25 : sfixed16;
		variable kvptat,ktptat : sfixed16;
		variable vdd,vddv0,deltaV : sfixed18;
		variable vptat,vbe : sfixed16;
		variable vptat25 : sfixed16;
		variable vptatart : sfixed18;
		variable alphaptatee : sfixed16;
		variable alphaptat : sfixed16;
		variable h1,h2 : sfixed16;
		variable pow2_18 : sfixed(18 downto 0);
		variable f8tmp1 : ufixed8;
		variable f8tmp2 : sfixed8;
		variable f6tmp1 : ufixed6;
		variable f6tmp2 : sfixed6;
		variable f9tmp1 : ufixed9;
		variable f9tmp2 : sfixed9;
		variable f15tmp1 : ufixed15;
		variable f15tmp2 : sfixed15;
		variable pow2to18 : sfixed18;
		constant C_WAIT1 : integer := G_C_WAIT1;
		variable v_wait1 : integer range 0 to C_WAIT1-1;
		variable Ta,Ta0 : sfixed16;
		variable Kgain : sfixed16;
		variable pixgain12_16 : sfixed16; -- xxx for all pixels
		variable offset12_16 : sfixed16; -- xxx for all pixels
		variable offsetaverage : sfixed16;
		variable occscalerow : sfixed16;
		variable occscalecolumn : sfixed16;
		variable kv12_16 : sfixed16;
		variable occrow12 : sfixed16;
		variable occcolumn16 : sfixed16;
		variable occscaleremnant : sfixed16;
		variable tmps4 : sfixed4;
		variable tmps5 : sfixed5;
		variable tmps6 : sfixed6;
		variable tmps7 : sfixed7;
		variable tmps8 : sfixed8;
		variable tmps9 : sfixed9;
		variable occsro,occsc,occsre : sfixed18;
		variable occsror,occscr,occsrer : sfixed18;
		variable pixosref12_16 : sfixed16;
		variable kta12_16 : sfixed16;
		variable kta_rc_ee : sfixed16;
		variable kta_scale_1 : sfixed16;
		variable kta_scale_2 : sfixed16;
		variable kvscale : sfixed16;
		variable pixos12_16 : sfixed16;
		variable tad,v0d : sfixed16;
		variable vir12_16_emissitivy_componsated : sfixed16;
		variable pixgain_cp_sp0 : sfixed16;
		variable pixgain_cp_sp1 : sfixed16;
		variable off_cpsubpage_0 : sfixed16;
		variable off_cpsubpage_1 : sfixed16;
		variable off_cpsubpage_1_delta : sfixed16;
		variable kta_cp_ee : sfixed16;
		variable kta_cp : sfixed16;
		variable kv_scale : sfixed16;
		variable kv_cp_ee : sfixed16;
		variable kv_cp : sfixed16;
		variable ktacp_kvcp_mul,ilchessc1ee,ilchessc1,pixos_cp_sp0,pixos_cp_sp1,ch_pattern_12_16,tgcee,tgc,vir_12_16_compensated : sfixed16;
	begin
		if (rising_edge(i_clock)) then
		if (i_reset = '1') then
		report "sfixed16'high : "&integer'image(sfixed16'high);
		report "sfixed16'low  : "&integer'image(sfixed16'low);
		report "sfixed18'high : "&integer'image(sfixed18'high);
		report "sfixed18'low  : "&integer'image(sfixed18'low);
		v_wait1 := 0;
		state <= idle;
		stmp_slv16 <= (others => '0');
		stmp_slv18 <= (others => '0');
		-- reset
		tmp_slv16 := (others => '0');
		tmp_slv18 := (others => '0');
		cmd <= "0000";
		in1 <= (others => '0');
		in2 <= (others => '0');
		f16tmp1 := (others => '0');
		f16tmp2 := (others => '0');
		f16out := (others => '0');
		else
--		-- wait for clock_period*20;

		-- 11.2.2.2
		-- kvdd,vdd25
		-- ee[0x2433] = 0x9d68
		-- ram[0x072a] = 0xccc5
		case (state) is
when idle =>
--			o_out1 <= (others => '0');
			if (i_run = '1') then
				state <= s1;
			else
				state <= idle;
			end if;
when s1 =>
		--
		-- kvdd
		tmp_slv18 := "00"&x"0000"&x"9d68" and "00"&x"0000"&x"ff00"; -- 0x9d00
		f16tmp1 := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
--		-- report_fixed_value ("raw val", f16tmp1); -- -25344/40192
		tmp_slv18 := "00"&"0000000100000000" & "0000000000000000"; -- 2**8
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
--		-- report_fixed_value ("divider", f16tmp2); -- 256
		cmd <= "0011"; -- /
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w1;
when w1 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s2;
		else
			v_wait1 := v_wait1 + 1;
			state <= w1;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s2 =>
--		-- report_fixed_value ("div out", f16out); -- -99/157/65437
		--aaa := to_sfixed(to_slv(f16out)(23 downto 0),7,-16);
		---- report_fixed_value ("div out 8bit", aaa); --
		--if (aaa > 127.0) then -- signed
		--	aaa := 256.0 - aaa;
		--	aaa := -aaa;
		--end if;
		---- report_fixed_value ("sign", aaa); -- -99
		--f16tmp1 := to_sfixed("0000000000"&to_slv(aaa),f16tmp1); -- -99
		--f16tmp1 := resize(aaa,f16tmp1); -- -99
--		-- report_fixed_value ("127", to_ufixed(127.0,f8tmp1'high,f8tmp1'low));
--		-- report_fixed_value ("256", to_ufixed(256.0,f8tmp1'high,f8tmp1'low));
		--f8tmp1 := to_ufixed(-77.0,f8tmp1);
		--f8tmp1 := to_ufixed(77.0,f8tmp1);
		--f8tmp1 := to_ufixed(-154.0,f8tmp1);
		--f8tmp1 := to_ufixed(154.0,f8tmp1);
		f8tmp1 := to_ufixed("0"&to_slv(f16out(7 downto 0)),f8tmp1); -- xxx fix ufixed to sfixed and test above vals
--		-- report_fixed_value ("f8tmp1", f8tmp1);
		if (f8tmp1 > 127.0) then -- signed
			f8tmp2 := to_sfixed(to_slv(resize(256.0-f8tmp1,f8tmp1)),f8tmp2);
			f8tmp2 := -f8tmp2(7 downto 0);
--			-- report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(f8tmp1) - to_sfixed(256.0,f8tmp2)),f8tmp2));
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f8tmp1),7,0) - to_sfixed(256.0,7,0),7,0);
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f16out(7 downto 0)),7,0) - to_sfixed(256.0,7,0),f8tmp2'high,f8tmp2'low);
----			f8tmp2 := to_sfixed(to_slv(f16out(7 downto 0)),f8tmp2'high,f8tmp2'low) - to_sfixed(256.0,7,0);
			---- report_fixed_value ("-------------------", f8tmp2);
--			f8tmp2 := to_sfixed(to_slv(f8tmp1),f8tmp2'high,f8tmp2'low);
		else
			f8tmp2 := to_sfixed(to_slv(f8tmp1),f8tmp2);
		end if;
		---- report_fixed_value ("sign8bit", f8tmp2); -- -99
--		f16tmp1 := to_sfixed("0"&x"00"&to_slv(f8tmp2)&x"0000",f16tmp1'high,f16tmp1'low);
		f16tmp1 := resize(f8tmp2,f16tmp1);
--		-- report_fixed_value ("sign", f16tmp1); -- -99
		tmp_slv18 := "00"&"0000000000100000" & "0000000000000000"; -- 2**5
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
--		-- report_fixed_value ("mul32", f16tmp2); -- 32
		cmd <= "0010"; -- *
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w2;
when w2 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s3;
		else
			v_wait1 := v_wait1 + 1;
			state <= w2;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
--		tmp_slv16 := to_slv (out1);
		kvdd := resize(f16out,kvdd);
--		kvdd := f16out(15 downto -16);
--		-- report_fixed_value ("kvdd", kvdd); -- -3168
when s3 =>
		--report_error("fail kvdd", kvdd, to_sfixed(-3168.0,kvdd));
		--
		-- vdd25
		tmp_slv18 := "00"&x"0000"&x"9d68" and "00"&x"0000"&x"00ff"; -- 0x0068
		f16tmp1 := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		---- report_fixed_value ("raw val", f16tmp1); -- 104
		tmp_slv18 := "00"&"0000000100000000" & "0000000000000000"; -- 2**8
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("sub2**8", f16tmp2); -- 256
		cmd <= "0001"; -- -
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w3;
when w3 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s4;
		else
			v_wait1 := v_wait1 + 1;
			state <= w3;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s4 =>
		---- report_fixed_value ("after sub2**8", f16out); -- -152
		f16tmp1 := f16out; -- -152
		tmp_slv18 := "00"&"0000000000100000" & "0000000000000000"; -- 2**5
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("mul2**5", f16tmp2); -- 32
		cmd <= "0010"; -- *
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w4;
when w4 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s5;
		else
			v_wait1 := v_wait1 + 1;
			state <= w4;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s5 =>
		---- report_fixed_value ("after mul2**5", f16out); -- -4864
		f16tmp1 := f16out; -- -4864
		tmp_slv18 := "00"&"0010000000000000" & "0000000000000000"; -- 2**13
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("sub2**13", f16tmp2); -- -2**13
		cmd <= "0001"; -- -
		in1 <= f16tmp1;
		---- report_fixed_value ("f16tmp1", f16tmp1); --
		in2 <= f16tmp2;
		---- report_fixed_value ("f16tmp2", f16tmp2); --
		state <= w5;
when w5 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s6;
		else
			v_wait1 := v_wait1 + 1;
			state <= w5;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		vdd25 := resize(f16out,vdd25);
when s6 =>
		--vdd25 := f16out;
--		-- report_fixed_value ("vdd25", vdd25); -- -13056
		--report_error("fail vdd25", vdd25, to_sfixed(-13056.0,vdd25));

--
--		-- 11.2.2.3
--		-- kvptat,ktptat
--		-- ee[0x2432] = 0x5952
--		-- ee[0x2431] = 0x2ff1
--		-- ee[0x2410] = 0x4210
--		-- ram[0x072a] = 0xccc5
--		-- ram[0x0720] = 0x06af
--		-- ram[0x0700] = 0x4bf2

		-- 
		-- kvptat
		tmp_slv18 := "00"&x"0000"&x"5952" and "00"&x"0000"&x"fc00"; -- 0x5800
		f16tmp1 := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		tmp_slv18 := "00"&"0000010000000000" & "0000000000000000"; -- 2**10
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		cmd <= "0011"; -- /
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w6;
when w6 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s7;
		else
			v_wait1 := v_wait1 + 1;
			state <= w6;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s7 =>
		---- report_fixed_value ("raw val", out1); -- 22
		--f6tmp1 := to_ufixed(-44.0,f6tmp1);
		--f6tmp1 := to_ufixed(44.0,f6tmp1);
		--f6tmp1 := to_ufixed(-11.0,f6tmp1);
		--f6tmp1 := to_ufixed(11.0,f6tmp1);
		f6tmp1 := to_ufixed("0"&to_slv(f16out(5 downto 0)),f6tmp1); -- xxx fix ufixed to sfixed and test above vals
		---- report_fixed_value ("f6tmp1", f6tmp1);
		if (f6tmp1 > 31.0) then -- signed
			f6tmp2 := to_sfixed(to_slv(resize(64.0-f6tmp1,f6tmp1)),f6tmp2);
			f6tmp2 := -f6tmp2(5 downto 0);
--			-- report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(f8tmp1) - to_sfixed(256.0,f8tmp2)),f8tmp2));
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f8tmp1),7,0) - to_sfixed(256.0,7,0),7,0);
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f16out(7 downto 0)),7,0) - to_sfixed(256.0,7,0),f8tmp2'high,f8tmp2'low);
----			f8tmp2 := to_sfixed(to_slv(f16out(7 downto 0)),f8tmp2'high,f8tmp2'low) - to_sfixed(256.0,7,0);
			---- report_fixed_value ("-------------------", f8tmp2);
--			f8tmp2 := to_sfixed(to_slv(f8tmp1),f8tmp2'high,f8tmp2'low);
		else
			f6tmp2 := to_sfixed(to_slv(f6tmp1),f6tmp2);
		end if;
		---- report_fixed_value ("sign6bit", f6tmp2); -- -99
		--tmp_slv18 := to_slv (out1); -- 22
		f16tmp1 := resize (f6tmp2, f16tmp1);
		--f16tmp1 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		tmp_slv18 := "00"&"0001000000000000" & "0000000000000000"; -- 2**12
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w7;
when w7 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s8;
		else
			v_wait1 := v_wait1 + 1;
			state <= w7;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("aaaaaaaaa", f16out); --
		kvptat := resize(f16out,kvptat);
when s8 =>
		-- report_fixed_value ("kvptat", kvptat); -- 5.371094e-03
		--report_error("fail kvptat", kvptat, to_sfixed(0.005371094,kvptat));

		-- 
		-- ktptat
		cmd <= "0011"; -- /
		tmp_slv18 := "00"&x"0000"&x"5952" and "00"&x"0000"&x"03ff"; -- 0x0152
		f16out := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		---- report_fixed_value ("raw val", f16out); -- 338
		--if (f16out > 511.0) then -- signed
		--	f16out := f16out - 1024.0;
		--end if;
		---- report_fixed_value ("sign", f16out); --
		--tmp_slv16 := to_slv (f16out); -- 338
--		f16tmp1 := to_sfixed ("00"&tmp_slv16, sfixed18'high, sfixed18'low);
		--f16tmp1 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		---- report_fixed_value ("aaaaaaaa", f16tmp1); --
		--f9tmp1 := to_ufixed(-777.0,f9tmp1);
		--f9tmp1 := to_ufixed(777.0,f9tmp1);
		--f9tmp1 := to_ufixed(-154.0,f9tmp1);
		--f9tmp1 := to_ufixed(154.0,f9tmp1);
		f9tmp1 := to_ufixed("0"&to_slv(f16out(8 downto 0)),f9tmp1); -- xxx fix ufixed to sfixed and test above vals
		---- report_fixed_value ("f9tmp1", f9tmp1);
		if (f9tmp1 > 511.0) then -- signed
			f9tmp2 := to_sfixed(to_slv(resize(1024.0-f9tmp1,f9tmp1)),f9tmp2);
			f9tmp2 := -f9tmp2(8 downto 0);
--			-- report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(f8tmp1) - to_sfixed(256.0,f8tmp2)),f8tmp2));
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f8tmp1),7,0) - to_sfixed(256.0,7,0),7,0);
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f16out(7 downto 0)),7,0) - to_sfixed(256.0,7,0),f8tmp2'high,f8tmp2'low);
----			f8tmp2 := to_sfixed(to_slv(f16out(7 downto 0)),f8tmp2'high,f8tmp2'low) - to_sfixed(256.0,7,0);
			---- report_fixed_value ("-------------------", f8tmp2);
--			f8tmp2 := to_sfixed(to_slv(f8tmp1),f8tmp2'high,f8tmp2'low);
		else
			f9tmp2 := to_sfixed(to_slv(f9tmp1),f9tmp2);
		end if;
		---- report_fixed_value ("sign9bit", f9tmp2); --
--		f16tmp1 := to_sfixed("0"&x"00"&to_slv(f8tmp2)&x"0000",f16tmp1'high,f16tmp1'low);
		f16tmp1 := resize(f9tmp2,f16tmp1);
--		-- report_fixed_value ("sign", f16tmp1); -- -99
		tmp_slv18 := "00"&"0000000000001000" & "0000000000000000"; -- 2**3
--		f16tmp2 := to_sfixed ("00"&tmp_slv16, sfixed18'high, sfixed18'low);
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("bbbbbbbb", f16tmp2); --
		in1 <= f16tmp1;
		---- report_fixed_value ("f16tmp1", f16tmp1); --
		in2 <= f16tmp2;
		---- report_fixed_value ("f16tmp2", f16tmp2); --
		state <= w8;
when w8 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s9;
		else
			v_wait1 := v_wait1 + 1;
			state <= w8;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		ktptat := resize(f16out,ktptat);
when s9 =>
		---- report_fixed_value ("return", out1); --
		-- report_fixed_value ("ktptat", ktptat); -- 42.25
		--report_error("fail ktptat", ktptat, to_sfixed(42.25,ktptat));

--		--
--		-- deltaV = (ram[0x072a] - vdd25) / kvdd
		tmp_slv18 := "00"&x"0000"&x"ccc5" and "00"&x"0000"&x"ffff"; -- 52421
		f16out := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		---- report_fixed_value ("ram[0x072a]", f16out); -- 52421
--		if (f16out > 32767.0) then -- signed
--			f16out := 65536.0 - f16out;
--			f16out := -f16out;
--		end if;
--		-- report_fixed_value ("ram[0x072a]", f16out); -- -13115
		--f15tmp1 := to_ufixed(-38000.0,f15tmp1);
		--f15tmp1 := to_ufixed(38000.0,f15tmp1);
		--f15tmp1 := to_ufixed(-26000.0,f15tmp1);
		--f15tmp1 := to_ufixed(26000.0,f15tmp1);
		f15tmp1 := to_ufixed("0"&to_slv(f16out(15 downto 0)),f15tmp1); -- xxx fix ufixed to sfixed and test above vals
		---- report_fixed_value ("f15tmp1", f15tmp1);
		if (f15tmp1 > 32767.0) then -- signed
			f15tmp2 := to_sfixed(to_slv(resize(65536.0-f15tmp1,f15tmp1)),f15tmp2);
			f15tmp2 := -f15tmp2(15 downto 0);
--			-- report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(f8tmp1) - to_sfixed(256.0,f8tmp2)),f8tmp2));
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f8tmp1),7,0) - to_sfixed(256.0,7,0),7,0);
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f16out(7 downto 0)),7,0) - to_sfixed(256.0,7,0),f8tmp2'high,f8tmp2'low);
----			f8tmp2 := to_sfixed(to_slv(f16out(7 downto 0)),f8tmp2'high,f8tmp2'low) - to_sfixed(256.0,7,0);
			---- report_fixed_value ("-------------------", f8tmp2);
--			f8tmp2 := to_sfixed(to_slv(f8tmp1),f8tmp2'high,f8tmp2'low);
		else
			f15tmp2 := to_sfixed(to_slv(f15tmp1),f15tmp2);
		end if;
		---- report_fixed_value ("sign15bit", f15tmp2); --
--		f16tmp1 := to_sfixed("0"&x"00"&to_slv(f8tmp2)&x"0000",f16tmp1'high,f16tmp1'low);
		f16tmp1 := resize(f15tmp2,f16tmp1);
		---- report_fixed_value ("sign", f16tmp1); -- -13115

		tmp_slv18 := to_slv (f16tmp1);
		f16tmp1 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("sign", f16tmp1); -- -13115

		tmp_slv18 := to_slv(resize (vdd25,f16tmp2));
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("vdd25", f16tmp2); -- -13056

		cmd <= "0001"; -- -
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w9;
when w9 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s10;
		else
			v_wait1 := v_wait1 + 1;
			state <= w9;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s10 =>
		---- report_fixed_value ("out1", f16out); -- -59

		tmp_slv18 := to_slv (f16out);
		f16tmp1 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("f16tmp1", f16tmp1); -- -59
		tmp_slv18 := to_slv (resize(kvdd,f16tmp2));
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("f16tmp2", f16tmp2); -- -3168

		cmd <= "0011"; -- /
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w10;
when w10 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s11;
		else
			v_wait1 := v_wait1 + 1;
			state <= w10;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("deltaV", f16out); -- 1.861572e-02
		deltaV := f16out;
when s11 =>
		tmp_slv18 := to_slv (deltaV);
		f16tmp1 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
--		-- report_fixed_value (" ", f16tmp1); -- 1.861572e-02
		tmp_slv18 := "00"&"0000000000000011" & "0100110011001101"; -- 3.3
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
--		-- report_fixed_value (" ", f16tmp2); -- 3.300003e+00
		cmd <= "0000"; -- +
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w11;
when w11 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s12;
		else
			v_wait1 := v_wait1 + 1;
			state <= w11;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		vdd := f16out;
when s12 =>
		-- report_fixed_value ("deltaV", vdd); -- 3.318619e+00 ~3.319		
		--report_error("fail deltaV", vdd, to_sfixed(3.318619,vdd));
		--
		-- vptat25
		tmp_slv18 := "00"&x"0000"&x"2ff1" and "00"&x"0000"&x"ffff"; -- 12273
		f16out := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		---- report_fixed_value ("ee[0x2431]", f16out); -- 12273
		--if (f16out > 32767.0) then -- signed
		--	f16out := 65536.0 - f16out;
		--	f16out := -f16out;
		--end if;
		--f15tmp1 := to_ufixed(-38000.0,f15tmp1);
		--f15tmp1 := to_ufixed(38000.0,f15tmp1);
		--f15tmp1 := to_ufixed(-26000.0,f15tmp1);
		--f15tmp1 := to_ufixed(26000.0,f15tmp1);
		f15tmp1 := to_ufixed("0"&to_slv(f16out(15 downto 0)),f15tmp1); -- xxx fix ufixed to sfixed and test above vals
		---- report_fixed_value ("f15tmp1", f15tmp1);
		if (f15tmp1 > 32767.0) then -- signed
			f15tmp2 := to_sfixed(to_slv(resize(65536.0-f15tmp1,f15tmp1)),f15tmp2);
			f15tmp2 := -f15tmp2(15 downto 0);
--			-- report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(f8tmp1) - to_sfixed(256.0,f8tmp2)),f8tmp2));
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f8tmp1),7,0) - to_sfixed(256.0,7,0),7,0);
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f16out(7 downto 0)),7,0) - to_sfixed(256.0,7,0),f8tmp2'high,f8tmp2'low);
----			f8tmp2 := to_sfixed(to_slv(f16out(7 downto 0)),f8tmp2'high,f8tmp2'low) - to_sfixed(256.0,7,0);
			---- report_fixed_value ("-------------------", f8tmp2);
--			f8tmp2 := to_sfixed(to_slv(f8tmp1),f8tmp2'high,f8tmp2'low);
		else
			f15tmp2 := to_sfixed(to_slv(f15tmp1),f15tmp2);
		end if;
		---- report_fixed_value ("sign15bit", f15tmp2); --
--		f16tmp1 := to_sfixed("0"&x"00"&to_slv(f8tmp2)&x"0000",f16tmp1'high,f16tmp1'low);
		f16tmp1 := resize(f15tmp2,f16tmp1);
		---- report_fixed_value ("sign", f16tmp1); --
		vptat25 := resize(f16tmp1,vptat25);
		-- report_fixed_value ("vptat25", vptat25); -- 12273
		--report_error("fail vptat25", vptat25, to_sfixed(12273,vptat25));

		--
		-- vptat
		tmp_slv18 := "00"&x"0000"&x"06af" and "00"&x"0000"&x"ffff"; -- 1711
		f16out := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		---- report_fixed_value ("ram[0x0720]", f16out); -- 1711
		--if (f16out > 32767.0) then -- signed
		--	f16out := 65536.0 - f16out;
		--	f16out := -f16out;
		--end if;
		--f15tmp1 := to_ufixed(-38000.0,f15tmp1);
		--f15tmp1 := to_ufixed(38000.0,f15tmp1);
		--f15tmp1 := to_ufixed(-26000.0,f15tmp1);
		--f15tmp1 := to_ufixed(26000.0,f15tmp1);
		f15tmp1 := to_ufixed("0"&to_slv(f16out(15 downto 0)),f15tmp1); -- xxx fix ufixed to sfixed and test above vals
		---- report_fixed_value ("f15tmp1", f15tmp1);
		if (f15tmp1 > 32767.0) then -- signed
			f15tmp2 := to_sfixed(to_slv(resize(65536.0-f15tmp1,f15tmp1)),f15tmp2);
			f15tmp2 := -f15tmp2(15 downto 0);
--			-- report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(f8tmp1) - to_sfixed(256.0,f8tmp2)),f8tmp2));
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f8tmp1),7,0) - to_sfixed(256.0,7,0),7,0);
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f16out(7 downto 0)),7,0) - to_sfixed(256.0,7,0),f8tmp2'high,f8tmp2'low);
----			f8tmp2 := to_sfixed(to_slv(f16out(7 downto 0)),f8tmp2'high,f8tmp2'low) - to_sfixed(256.0,7,0);
			---- report_fixed_value ("-------------------", f8tmp2);
--			f8tmp2 := to_sfixed(to_slv(f8tmp1),f8tmp2'high,f8tmp2'low);
		else
			f15tmp2 := to_sfixed(to_slv(f15tmp1),f15tmp2);
		end if;
		---- report_fixed_value ("sign15bit", f15tmp2); --
		f16tmp1 := resize(f15tmp2,f16tmp1);
		---- report_fixed_value ("sign", f16tmp1); --
		vptat := resize(f16tmp1,vptat);
		-- report_fixed_value ("vptat", vptat); -- 1711
		--report_error("fail vptat", vptat, to_sfixed(1711,vptat));

		--
		-- vbe
		tmp_slv18 := "00"&x"0000"&x"4bf2" and "00"&x"0000"&x"ffff"; -- 19442
		f16out := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		---- report_fixed_value ("ram[0x0700]", f16out); -- 19442
--		if (f16out > 32767.0) then -- signed
--			f16out := 65536.0 - f16out;
--			f16out := -f16out;
--		end if;
		--f15tmp1 := to_ufixed(-38000.0,f15tmp1);
		--f15tmp1 := to_ufixed(38000.0,f15tmp1);
		--f15tmp1 := to_ufixed(-26000.0,f15tmp1);
		--f15tmp1 := to_ufixed(26000.0,f15tmp1);
		f15tmp1 := to_ufixed("0"&to_slv(f16out(15 downto 0)),f15tmp1); -- xxx fix ufixed to sfixed and test above vals
		---- report_fixed_value ("f15tmp1", f15tmp1);
		if (f15tmp1 > 32767.0) then -- signed
			f15tmp2 := to_sfixed(to_slv(resize(65536.0-f15tmp1,f15tmp1)),f15tmp2);
			f15tmp2 := -f15tmp2(15 downto 0);
--			-- report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(f8tmp1) - to_sfixed(256.0,f8tmp2)),f8tmp2));
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f8tmp1),7,0) - to_sfixed(256.0,7,0),7,0);
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f16out(7 downto 0)),7,0) - to_sfixed(256.0,7,0),f8tmp2'high,f8tmp2'low);
----			f8tmp2 := to_sfixed(to_slv(f16out(7 downto 0)),f8tmp2'high,f8tmp2'low) - to_sfixed(256.0,7,0);
			---- report_fixed_value ("-------------------", f8tmp2);
--			f8tmp2 := to_sfixed(to_slv(f8tmp1),f8tmp2'high,f8tmp2'low);
		else
			f15tmp2 := to_sfixed(to_slv(f15tmp1),f15tmp2);
		end if;
		---- report_fixed_value ("sign15bit", f15tmp2); --
		f16tmp1 := resize(f15tmp2,f16tmp1);
		---- report_fixed_value ("sign", f16tmp1); --
		vbe := resize(f16tmp1,vbe);
		-- report_fixed_value ("vbe", vbe); -- 19442
		--report_error("fail vbe", vbe, to_sfixed(19442,vbe));

		--
		-- alphaptatee
		tmp_slv18 := "00"&x"0000"&x"4210" and "00"&x"0000"&x"f000"; -- 16384
		f16out := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		---- report_fixed_value ("ee[0x2410]", f16out); -- 16384
		tmp_slv18 := to_slv (f16out);
		f16tmp1 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("f16tmp1", f16tmp1); -- 16384
		tmp_slv18 := "00"&"0001000000000000" & "0000000000000000"; -- 2**12
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("f16tmp2", f16tmp2); -- 4096

		cmd <= "0011"; -- /
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w12;
when w12 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s13;
		else
			v_wait1 := v_wait1 + 1;
			state <= w12;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		alphaptatee := resize(f16out,alphaptatee);
when s13 =>
		-- report_fixed_value ("alphaptatee", alphaptatee); -- 4
		--report_error("fail alphaptatee", alphaptatee, to_sfixed(4,alphaptatee));		
		
		--
		-- alphaptat
		tmp_slv18 := to_slv(resize (alphaptatee,f16out)); -- 4
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("raw val", f16out); -- 4
		tmp_slv18 := to_slv (f16out);
		f16tmp1 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("raw val", f16tmp1); -- 4
		tmp_slv18 := "00"&"0000000000000100" & "0000000000000000"; -- 2**2
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("pow2**2", f16tmp2); -- 4
		cmd <= "0011"; -- /
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w13;
when w13 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s14;
		else
			v_wait1 := v_wait1 + 1;
			state <= w13;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s14 =>
		---- report_fixed_value ("div ", f16out); -- 1

		tmp_slv18 := to_slv (f16out); -- 1
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("div ", f16out); -- 1
		f16tmp1 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("f16tmp1", f16tmp1); -- 1
		tmp_slv18 := "00"&"0000000000001000" & "0000000000000000"; -- 2**3
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("f16tmp2", f16tmp2); -- 8

		cmd <= "0000"; -- +
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		state <= w14;
when w14 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s15;
		else
			v_wait1 := v_wait1 + 1;
			state <= w14;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		alphaptat := resize(f16out,alphaptat);

when s15 =>
		-- report_fixed_value ("alphaptat", alphaptat); -- 9
		--report_error("fail alphaptat", alphaptat, to_sfixed(9,alphaptat));

		--
		-- vptatart
		
		cmd <= "0010"; -- *
		---- report_fixed_value ("vptat", resize(vptat,f16tmp1)); --
		in1 <= resize(vptat,f16tmp1);
		---- report_fixed_value ("alphaptat", resize(alphaptat,f16tmp2)); --
		in2 <= resize(alphaptat,f16tmp2);
		state <= w15;
when w15 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s16;
		else
			v_wait1 := v_wait1 + 1;
			state <= w15;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);

when s16 =>
		---- report_fixed_value ("vptat*alphaptat", f16out); --

		cmd <= "0000"; -- +
		in1 <= f16out;
		---- report_fixed_value ("vptat*alphaptat", out1); --
		in2 <= resize(vbe,f16tmp2);
		---- report_fixed_value ("vbe", resize(vbe,f16tmp2)); --
		state <= w16;
when w16 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s17;
		else
			v_wait1 := v_wait1 + 1;
			state <= w16;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);

when s17 =>
		---- report_fixed_value ("vptat*alphaptat+vbe", f16out); --

		cmd <= "0011"; -- /
		in1 <= resize(vptat,f16tmp1);
		---- report_fixed_value ("vptat", resize(vptat,f16tmp1)); --
		in2 <= f16out;
		---- report_fixed_value ("vptat*alphaptat+vbe", out1); --
		state <= w17;
when w17 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s18;
		else
			v_wait1 := v_wait1 + 1;
			state <= w17;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		
when s18 =>
		---- report_fixed_value ("vptat/(vptat*alphaptat+vbe)", f16out); --

		tmp_slv18 := "01"&x"ffff"&x"0000"; -- 2**18
		pow2to18 := to_sfixed (tmp_slv18, sfixed18'high,sfixed18'low);
		---- report_fixed_value ("pow2**18", pow2to18); --
 		---- report_fixed_value ("pow2**18signed", to_sfixed(to_slv(pow2to18),f16tmp1)); --

		cmd <= "0010"; -- *
		in1 <= pow2to18;
		---- report_fixed_value ("pow2**18", pow2to18); --
		in2 <= f16out;
		---- report_fixed_value ("vptat/(vptat*alphaptat+vbe)", out1); --
		state <= w18;
when w18 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s19;
		else
			v_wait1 := v_wait1 + 1;
			state <= w18;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);

when s19 =>
		---- report_fixed_value ("(vptat/(vptat*alphaptat+vbe))*pow2**18", f16out); --
		--h1 := f16out;

		tmp_slv18 := "00"&"0000000000000010" & "0000000000000000"; -- 2**2
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		---- report_fixed_value ("pow2**2", f16tmp2); -- 
		cmd <= "0010"; -- *
		in1 <= f16tmp2;
		---- report_fixed_value ("pow2**2", f16tmp2); --
		in2 <= f16out;
		---- report_fixed_value ("(vptat/(vptat*alphaptat+vbe))*pow2**18", f16out); --
		state <= w19;
when w19 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s20;
		else
			v_wait1 := v_wait1 + 1;
			state <= w19;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		vptatart := f16out;
when s20 =>
		---- report_fixed_value ("((vptat/(vptat*alphaptat+vbe))*pow2**18)*pow2**2", f16out); --
		-- report_fixed_value ("vptatart", f16out); --

		--pow2to18 := to_ufixed (262144.0, ufixed18'high,ufixed18'low);
		---- report_fixed_value ("2**18", pow2to18); -- 
		--report_error("fail vptatart (ok,almost)", vptatart, to_sfixed(12873.57952,vptatart)); -- ok, almost
		--
		-- Ta
		cmd <= "0010"; -- * a=deltaV*kvptat
		in1 <= resize(deltaV,f16tmp1);
		in2 <= resize(kvptat,f16tmp2);
		-- report_fixed_value ("in1", resize(deltaV,f16tmp1)); --
		-- report_fixed_value ("in2", resize(kvptat,f16tmp2)); --
		state <= w20;
when w20 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s21;
		else
			v_wait1 := v_wait1 + 1;
			state <= w20;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s21 =>
		-- report_fixed_value ("out a*", out1); --

		cmd <= "0000"; -- + b=a+1
		in1 <= f16out;
		in2 <= to_sfixed(1.0,f16tmp2);
		-- report_fixed_value ("in1", out1); --
		-- report_fixed_value ("in2", to_sfixed(1.0,f16tmp2)); --
		state <= w21;
when w21 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s22;
		else
			v_wait1 := v_wait1 + 1;
			state <= w21;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s22 =>
		-- report_fixed_value ("out b+", out1); --

		cmd <= "0011"; -- / c=vptatart/b
		in1 <= resize(vptatart,f16tmp1); --vptatart
		in2 <= f16out;
		-- report_fixed_value ("in1", resize(f16out,f16tmp1)); --
		-- report_fixed_value ("in2", out1); --
		state <= w22;
when w22 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s23;
		else
			v_wait1 := v_wait1 + 1;
			state <= w22;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s23 =>
		-- report_fixed_value ("out c/", out1); --

		cmd <= "0001"; -- - d=c-vptat25
		in1 <= f16out;
		in2 <= resize(vptat25,f16tmp2);
		-- report_fixed_value ("in1", out1); --
		-- report_fixed_value ("in2", resize(vptat25,f16tmp2)); --
		state <= w23;
when w23 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s24;
		else
			v_wait1 := v_wait1 + 1;
			state <= w23;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s24 =>
		-- report_fixed_value ("out d-", out1); --

		cmd <= "0011"; -- / e=d/ktptat
		in1 <= f16out;
		in2 <= resize(ktptat,f16tmp2);
		-- report_fixed_value ("in1", out1); --
		-- report_fixed_value ("in2", resize(ktptat,f16tmp2)); --
		state <= w24;
when w24 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s25;
		else
			v_wait1 := v_wait1 + 1;
			state <= w24;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
when s25 =>
		-- report_fixed_value ("out e/", out1); --
		cmd <= "0000"; -- + f=e+25.0
		in1 <= f16out;
		in2 <= to_sfixed(25.0,f16tmp2);
		-- report_fixed_value ("in1", out1); --
		-- report_fixed_value ("in2", to_sfixed(25.0,f16tmp2)); --
		state <= w25;
when w25 =>
		-- wait for clock_period*20;
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s26;
		else
			v_wait1 := v_wait1 + 1;
			state <= w25;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		Ta := resize(f16out,Ta);
when s26 =>
		--report_error("fail Ta (ok,almost)", Ta, to_sfixed(39.184,Ta));
		--
		tmp_slv18 := "00"&x"0000"&x"1881" and "00"&x"0000"&x"ffff"; -- 6273
		f16out := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		-- report_fixed_value ("ram[0x070a]", f16out); -- 6273
		tmp_slv18 := to_slv (f16out);
		f16tmp1 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		-- report_fixed_value ("f16tmp1", f16tmp1); -- 6273
		--report_error("fail ram[0x070a]", f16tmp1, to_sfixed(6273.0,f16tmp1));
		--
		tmp_slv18 := "00"&x"0000"&x"18ef" and "00"&x"0000"&x"ffff"; -- 6383
		f16out := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		-- report_fixed_value ("ee[0x2430]", f16out); -- 6383
		tmp_slv18 := to_slv (f16out);
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		-- report_fixed_value ("f16tmp1", f16tmp1); -- 6383
		--report_error("fail gain", f16tmp2, to_sfixed(6383.0,f16tmp1));
		--
		cmd <= "0011"; -- /
		in1 <= f16tmp2;
		in2 <= f16tmp1;
		state <= w26;
when w26 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s27;
		else
			v_wait1 := v_wait1 + 1;
			state <= w26;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		Kgain := resize(f16out,Kgain);
when s27 =>
--	 report_fixed_value ("gain", out1); --
		--report_error("fail Kgain (ok,almost)", Kgain, to_sfixed(1.01753546947234,Kgain)); -- ok, almost
		-- xxx pixdata 12,16 0x056f
		tmp_slv18 := "00"&x"0000"&x"0261" and "00"&x"0000"&x"ffff"; -- 609
		f16out := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		tmp_slv18 := to_slv (f16out);
		f16tmp1 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		--report_error("fail pixgain(12,16) ram[0x056f]", f16tmp1, to_sfixed(609.0,f16tmp1));
		cmd <= "0010"; -- *
		in1 <= f16tmp1;
		in2 <= resize(Kgain,f16tmp2);
		state <= w27;
when w27 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s28;
		else
			v_wait1 := v_wait1 + 1;
			state <= w27;
		end if;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		pixgain12_16 := resize(f16out,pixgain12_16); --xxx pix gain 12,16
when s28 =>
		--report_error("fail pixgain12_16 (ok,almost)", pixgain12_16, to_sfixed(619.679100908656,pixgain12_16)); -- ok, almost

		tmp_slv16 := x"0000"&x"ffbb" and x"0000"&x"ffff"; -- 65467
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		-- report_fixed_value ("ee[0x2410]", f16out); -- 65467
		tmp_slv16 := to_slv (f16out);
		offsetaverage := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		--report_error("fail offsetaverage", offsetaverage, to_sfixed(-69.0,offsetaverage));

		tmp_slv16 := x"0000"&x"4210" and x"0000"&x"0f00"; -- 2
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := x"00"&tmp_slv16(31 downto 24)&x"0000";
		occscalerow := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tmps4 := resize(occscalerow,tmps4);
		occscalerow := resize(tmps4,occscalerow);
--		report_fixed_value("occscalerow",occscalerow);
		--report_error("fail occscalerow", occscalerow, to_sfixed(2.0,occscalerow));

		tmp_slv16 := x"0000"&x"4210" and x"0000"&x"00f0"; -- 1
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		report_fixed_value("asd",f16out);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := x"000"&tmp_slv16(23 downto 20)&x"0000";
		occscalecolumn := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tmps4 := resize(occscalecolumn,tmps4);
		occscalecolumn := resize(tmps4,occscalecolumn);
		--report_error("fail occscalecolumn", occscalecolumn, to_sfixed(1.0,occscalecolumn));

		tmp_slv16 := x"0000"&x"f2f2" and x"0000"&x"f000"; -- ee[0x2414]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := x"000"&tmp_slv16(31 downto 28)&x"0000";
		occrow12 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tmps4 := resize(occrow12,tmps4);
		occrow12 := resize(tmps4,occrow12);
		--report_error("fail occrow12", occrow12, to_sfixed(-1.0,occrow12));

		tmp_slv16 := x"0000"&x"e0ef" and x"0000"&x"f000"; -- ee[0x241b]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := x"000"&tmp_slv16(31 downto 28)&x"0000";
		occcolumn16 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tmps4 := resize(occcolumn16,tmps4);
		occcolumn16 := resize(tmps4,occcolumn16);
		--report_error("fail occcolumn16", occcolumn16, to_sfixed(-2.0,occcolumn16));

		tmp_slv16 := x"0000"&x"08a8" and x"0000"&x"fc00"; -- ee[0x25af]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "0000000000"&tmp_slv16(31 downto 26)&x"0000";
		offset12_16 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tmps6 := resize(offset12_16,tmps6);
		offset12_16 := resize(tmps6,offset12_16);
		--report_error("fail offset12_16", offset12_16, to_sfixed(2.0,offset12_16));

		tmp_slv16 := x"0000"&x"4210" and x"0000"&x"000f"; -- ee[0x2410]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "000000000000"&tmp_slv16(19 downto 16)&x"0000";
		occscaleremnant := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tmps4 := resize(occscaleremnant,tmps4);
		occscaleremnant := resize(tmps4,occscaleremnant);
		--report_error("fail occscaleremnant", occscaleremnant, to_sfixed(0.0,occscaleremnant));

		occsre := to_sfixed(1.0,occsre) sll to_integer(occscaleremnant); -- 1.0
		occsro := to_sfixed(1.0,occsro) sll to_integer(occscalerow); -- 4.0
		occsc := to_sfixed(1.0,occsc) sll to_integer(occscalecolumn); -- 2.0

--		report_fixed_value("occsre",occsre);
--		report_fixed_value("occsro",occsro);
--		reporct_fixed_value("occsc",occsc);
		cmd <= "0010"; -- * occrow12*2^occscalerow
		in1 <= resize(occrow12,f16tmp1);
--		report_fixed_value("occrow12",resize(occrow12,f16tmp1));
		in2 <= resize(occsro,f16tmp2); -- 2^x
--		report_fixed_value("occsro",resize(occsro,f16tmp2));
		state <= w28;
when w28 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s29;
		else
			v_wait1 := v_wait1 + 1;
			state <= w28;
		end if;
when s29 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		occsro := resize(f16out,occsro);
--		report_fixed_value("occrow12*2^occscalerow",occsro);
		cmd <= "0010"; -- * occcolumn16*2^occcolumn16
		in1 <= resize(occcolumn16,f16tmp1);
--		report_fixed_value("occcolumn16",resize(occcolumn16,f16tmp1));
		in2 <= resize(occsc,f16tmp2); -- 2^x
--		report_fixed_value("occsc",resize(occsc,f16tmp2));
		state <= w29;
when w29 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s30;
		else
			v_wait1 := v_wait1 + 1;
			state <= w29;
		end if;
when s30 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		occsc := resize(f16out,occsc);
--		report_fixed_value("occcolumn16*2^occsc",occsc);

		cmd <= "0010"; -- * occremnant*2^occscaleremnant
		in1 <= resize(offset12_16,f16tmp1);
--		report_fixed_value("offset12_16",resize(offset12_16,f16tmp1));
		in2 <= resize(occsre,f16tmp2); -- 2^x
--		report_fixed_value("occsre",resize(occsre,f16tmp2));
		state <= w30;
when w30 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s31;
		else
			v_wait1 := v_wait1 + 1;
			state <= w30;
		end if;
when s31 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		occsre := resize(f16out,occsre);
--		report_fixed_value("occremnant*2^occscaleremnant",occsre);

		cmd <= "0000"; -- + occsre+occsc
		in1 <= resize(occsre,f16tmp1);
--		report_fixed_value("occsre",resize(occsre,f16tmp1));
		in2 <= resize(occsc,f16tmp2);
--		report_fixed_value("occsc",resize(occsc,f16tmp2));
		state <= w31;
when w31 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s32;
		else
			v_wait1 := v_wait1 + 1;
			state <= w31;
		end if;
when s32 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		occsre := resize(f16out,occsre); -- occsre+occsc
--		report_fixed_value("occsre+occsc",occsre);

		cmd <= "0000"; -- + occsre+occsc+occsro
		in1 <= resize(occsre,f16tmp1);
--		report_fixed_value("occsre",resize(occsre,f16tmp1));
		in2 <= resize(occsro,f16tmp2);
--		report_fixed_value("occsro",resize(occsro,f16tmp2));
		state <= w32;
when w32 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s33;
		else
			v_wait1 := v_wait1 + 1;
			state <= w32;
		end if;
when s33 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		occsro := resize(f16out,occsro); -- occsre+occsc+occsro
--		report_fixed_value("occsre+occsc+occsro",occsro);

		cmd <= "0000"; -- + occsre+occsc+occsro+offsetaverage
		in1 <= resize(occsro,f16tmp1);
--		report_fixed_value("occsro",resize(occsro,f16tmp1));
		in2 <= resize(offsetaverage,f16tmp2);
--		report_fixed_value("offsetaverage",resize(offsetaverage,f16tmp2));
		state <= w33;
when w33 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s34;
		else
			v_wait1 := v_wait1 + 1;
			state <= w33;
		end if;
when s34 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		pixosref12_16 := resize(f16out,pixosref12_16);
--		report_fixed_value("pixosref12_16=occsre+occsc+occsro+offsetaverage",pixosref12_16);
		--report_error("fail pixosref12_16 (ok,almost)", pixosref12_16, to_sfixed(-75.0,pixosref12_16)); -- ok,almost

		tmp_slv16 := x"0000"&x"08a0" and x"0000"&x"000e"; -- ee[0x25af]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "00000000000"&tmp_slv16(19 downto 17)&"0"&x"0000";
		kta12_16 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta12_16 := kta12_16 srl 1;
		tmps4 := resize(kta12_16,tmps4);
		kta12_16 := resize(tmps4,kta12_16);
--		report_fixed_value("kta12_16",kta12_16);
		--report_error("fail kta12_16", kta12_16, to_sfixed(0.0,kta12_16));

		tmp_slv16 := x"0000"&x"5354" and x"0000"&x"00ff"; -- ee[0x2437]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "00000000"&tmp_slv16(23 downto 16)&x"0000";
		kta_rc_ee := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
--		tmps4 := resize(kta_rc_ee,tmps4);
--		kta_rc_ee := resize(tmps4,kta_rc_ee);
--		report_fixed_value("kta_rc_ee",kta_rc_ee);
		--report_error("fail kta_rc_ee", kta_rc_ee, to_sfixed(84.0,kta_rc_ee));

		tmp_slv16 := x"0000"&x"2363" and x"0000"&x"000f"; -- ee[0x2438]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "000000000000"&tmp_slv16(19 downto 16)&x"0000";
		kta_scale_2 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta_scale_2 := resize(kta_scale_2,kta_scale_2);
--		report_fixed_value("kta_rc_ee",kta_rc_ee);
		--report_error("fail kta_scale_2", kta_scale_2, to_sfixed(3.0,kta_scale_2));

		tmp_slv16 := x"0000"&x"2363" and x"0000"&x"00f0"; -- ee[0x2438]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "000000000000"&tmp_slv16(23 downto 20)&x"0000";
		kta_scale_1 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta_scale_1 := resize(kta_scale_1,kta_scale_1);
--		report_fixed_value("kta_rc_ee",kta_rc_ee);
		--report_error("fail kta_scale_1", kta_scale_1, to_sfixed(6.0,kta_scale_1));
		state <= w34;
		cmd <= "0000"; -- + kta_scale_1+8
		in1 <= resize(kta_scale_1,f16tmp1);
		in2 <= to_sfixed(8.0,f16tmp2);
		state <= w34;
when w34 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s35;
		else
			v_wait1 := v_wait1 + 1;
			state <= w34;
		end if;
when s35 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta_scale_1 := resize(f16out,kta_scale_1); -- kta_scale_1+8
		--report_error("fail kta_scale_1+8 (ok,almost)", kta_scale_1, to_sfixed(14.0,kta_scale_1)); -- ok,almost

		tmp_slv16 := x"0000"&x"5454" and x"0000"&x"000f"; -- ee[0x2434]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "000000000000"&tmp_slv16(19 downto 16)&x"0000";
		kv12_16 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kv12_16 := resize(kv12_16,kv12_16);
--		report_fixed_value("kv12_16",kv12_16);
		--report_error("fail kv12_16", kv12_16, to_sfixed(4.0,kv12_16));

		kta_scale_2 := to_sfixed(1.0,kta_scale_2) sll to_integer(kta_scale_2);
--		report_fixed_value("2^kta_scale_2",kta_scale_2);

		cmd <= "0010"; -- * kta(12,16)*2^Kta_scale_2
		in1 <= resize(kta_scale_2,f16tmp1);
		in2 <= resize(kta12_16,f16tmp2);
		state <= w35;

when w35 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s36;
		else
			v_wait1 := v_wait1 + 1;
			state <= w35;
		end if;

when s36 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta12_16 := resize(f16out,kta12_16);
		--report_error("fail kta12_16*2^kta_scale_2 (ok,almost) ~0.0", kta12_16, to_sfixed(0.0,kta12_16)); -- ok,almost
		cmd <= "0000"; -- + kta_rc_ee+kta12_16*2^kta_scale_2
		in1 <= resize(kta12_16,f16tmp1);
		in2 <= resize(kta_rc_ee,f16tmp2);
		state <= w36;
when w36 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s37;
		else
			v_wait1 := v_wait1 + 1;
			state <= w36;
		end if;
when s37 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta12_16 := resize(f16out,kta12_16);
		kta_scale_1 := to_sfixed(1.0,kta_scale_1) sll to_integer(kta_scale_1);
		--report_error("fail kta_rc_ee+kta12_16*2^kta_scale_2 (ok,almost)", kta12_16, to_sfixed(84.0,kta12_16)); -- ok,almost
		cmd <= "0011"; -- (kta_rc_ee+kta12_16*2^kta_scale_2)/2^kta_scale_1
		in1 <= resize(kta12_16,f16tmp1);
		in2 <= resize(kta_scale_1,f16tmp2);
		state <= w37;
when w37 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s38;
		else
			v_wait1 := v_wait1 + 1;
			state <= w37;
		end if;
when s38 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta12_16 := resize(f16out,kta12_16);
		--report_error("fail kta12_16 (ok,almost)", kta12_16, to_sfixed(0.005126953125,kta12_16)); -- ok,almost
		state <= w38;
when w38 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s39;
		else
			v_wait1 := v_wait1 + 1;
			state <= w38;
		end if;
when s39 =>
		tmp_slv16 := x"0000"&x"2363" and x"0000"&x"0f00"; -- ee[0x2438]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "000000000000"&tmp_slv16(27 downto 24)&x"0000";
		kvscale := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kvscale := resize(kvscale,kvscale);
--		report_fixed_value("kv12_16",kv12_16);
		--report_error("fail kvscale", kvscale, to_sfixed(3.0,kv12_16));
		kvscale := to_sfixed(1.0,kvscale) sll to_integer(kvscale);
		--report_error("fail 2^kvscale", kvscale, to_sfixed(8.0,kv12_16));
		cmd <= "0011"; -- / kv12_16/2^kvscale
		in1 <= resize(kv12_16,f16tmp1);
		in2 <= resize(kvscale,f16tmp2); -- 2^kvscale
		state <= w39;
when w39 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s40;
		else
			v_wait1 := v_wait1 + 1;
			state <= w39;
		end if;
when s40 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kv12_16 := resize(f16out,kv12_16);
		--report_error("fail kv12_16 (ok,almost)", kv12_16, to_sfixed(0.5,kv12_16)); -- ok,almost
		state <= w40;
when w40 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s41;
		else
			v_wait1 := v_wait1 + 1;
			state <= w40;
		end if;
when s41 =>
		cmd <= "0001"; -- - Ta-Ta0 Ta-25
		in1 <= resize(Ta,f16tmp1);
		in2 <= to_sfixed(25.0,f16tmp2);
		state <= w41;
when w41 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s42;
		else
			v_wait1 := v_wait1 + 1;
			state <= w41;
		end if;
when s42 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tad := resize(f16out,kv12_16);
		--report_error("fail tad (ok,almost)", tad, to_sfixed(39.184-25.0,tad)); -- ok,almost
		state <= w42;
when w42 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s43;
		else
			v_wait1 := v_wait1 + 1;
			state <= w42;
		end if;
when s43 =>
		cmd <= "0001"; -- - Vdd-VddV0 Vdd-3.3
		in1 <= resize(Vdd,f16tmp1);
		in2 <= to_sfixed(3.3,f16tmp2);
		state <= w43;
when w43 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s44;
		else
			v_wait1 := v_wait1 + 1;
			state <= w43;
		end if;
when s44 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		v0d := resize(f16out,v0d);
		--report_error("fail v0d (ok,almost)", v0d, to_sfixed(3.319-3.3,v0d)); -- ok,almost
		state <= w44;
when w44 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s45;
		else
			v_wait1 := v_wait1 + 1;
			state <= w44;
		end if;
when s45 =>
		cmd <= "0010"; -- * Kv12_16*v0d
		in1 <= resize(kv12_16,f16tmp1);
		in2 <= resize(v0d,f16tmp2);
		state <= w45;
when w45 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s46;
		else
			v_wait1 := v_wait1 + 1;
			state <= w45;
		end if;
when s46 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kv12_16 := resize(f16out,kv12_16);
		--report_error("fail kv12_16*v0d (ok,almost)", kv12_16, to_sfixed(0.5*(3.319-3.3),kv12_16)); -- ok,almost
		state <= w46;
when w46 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s47;
		else
			v_wait1 := v_wait1 + 1;
			state <= w46;
		end if;
when s47 =>
		cmd <= "0000"; -- + 1+kv12_16*v0d
		in1 <= to_sfixed(1.0,f16tmp1);
		in2 <= resize(kv12_16,f16tmp2);
		state <= w47;
when w47 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s48;
		else
			v_wait1 := v_wait1 + 1;
			state <= w47;
		end if;
when s48 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kv12_16 := resize(f16out,kv12_16);
		--report_error("fail 1+kv12_16*v0d (ok,almost)", kv12_16, to_sfixed(1.0+(0.5*(3.319-3.3)),kv12_16)); -- ok,almost
		state <= w48;
when w48 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s49;
		else
			v_wait1 := v_wait1 + 1;
			state <= w48;
		end if;
when s49 =>
		cmd <= "0010"; -- * kta12_16*tad
		in1 <= resize(kta12_16,f16tmp1);
		in2 <= resize(tad,f16tmp2);
		state <= w49;
when w49 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s50;
		else
			v_wait1 := v_wait1 + 1;
			state <= w49;
		end if;
when s50 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta12_16 := resize(f16out,kta12_16);
		--report_error("fail kta12_16*tad (ok,almost)", kta12_16, to_sfixed(0.005126953125*(39.184-25.0),kta12_16)); -- ok,almost
		state <= w50;
when w50 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s51;
		else
			v_wait1 := v_wait1 + 1;
			state <= w50;
		end if;
when s51 =>
		cmd <= "0000"; -- + 1+kta12_16*tad
		in1 <= to_sfixed(1.0,f16tmp1);
		in2 <= resize(kta12_16,f16tmp2);
		state <= w51;
when w51 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s52;
		else
			v_wait1 := v_wait1 + 1;
			state <= w51;
		end if;
when s52 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta12_16 := resize(f16out,kta12_16);
		--report_error("fail 1+kta12_16*tad (ok,almost)", kta12_16, to_sfixed(1.0+(0.005126953125*(39.184-25.0)),kta12_16)); -- ok,almost
		state <= w52;
when w52 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s53;
		else
			v_wait1 := v_wait1 + 1;
			state <= w52;
		end if;
when s53 =>
		cmd <= "0010"; -- * pixosref*(1+KTa(12,16)*(Ta-Ta0))
		in1 <= resize(pixosref12_16,f16tmp1);
		in2 <= resize(kta12_16,f16tmp2);
		state <= w53;
when w53 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s54;
		else
			v_wait1 := v_wait1 + 1;
			state <= w53;
		end if;
when s54 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta12_16 := resize(f16out,kta12_16);
		--report_error("fail pixosref*(1+kta12_16*tad) (ok,almost)", kta12_16, to_sfixed((-75.0)*(1.0+(0.005126953125*(39.184-25.0))),kta12_16)); -- ok,almost
		state <= w54;
when w54 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s55;
		else
			v_wait1 := v_wait1 + 1;
			state <= w54;
		end if;
when s55 =>
		cmd <= "0010"; -- * PIXosref*(1+KTa(12,16)*(Ta-Ta0))*(1+Kv(12,16)*(Vdd-VddV0))
		in1 <= resize(kta12_16,f16tmp1);
		in2 <= resize(kv12_16,f16tmp2);
		state <= w55;
when w55 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s56;
		else
			v_wait1 := v_wait1 + 1;
			state <= w55;
		end if;
when s56 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta12_16 := resize(f16out,kta12_16);
		--report_error("fail pixosref*(1+kta12_16*tad)*(1+kv12_16*v0d) (ok,almost)", kta12_16, to_sfixed((-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3)),kta12_16)); -- ok,almost
		state <= w56;
when w56 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s57;
		else
			v_wait1 := v_wait1 + 1;
			state <= w56;
		end if;
when s57 =>
		cmd <= "0001"; -- - pixgain-PIXosref*(1+KTa(12,16)*(Ta-Ta0))*(1+Kv(12,16)*(Vdd-VddV0))
		in1 <= resize(pixgain12_16,f16tmp1);
		in2 <= resize(kta12_16,f16tmp2);
		state <= w57;
when w57 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s58;
		else
			v_wait1 := v_wait1 + 1;
			state <= w57;
		end if;
when s58 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		pixos12_16 := resize(f16out,pixos12_16);
--		--report_error("fail pixgain-pixosref*(1+kta12_16*tad)*(1+kv12_16*v0d) (ok,almost)", pixos12_16, to_sfixed(619.679100908656-(-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3)),pixos12_16)); -- ok,almost
		--report_error("fail pixgain-pixosref*(1+kta12_16*tad)*(1+kv12_16*v0d) (ok,almost)", pixos12_16, to_sfixed(700.882495690877,pixos12_16)); -- ok,almost
		state <= w58;
when w58 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s59;
		else
			v_wait1 := v_wait1 + 1;
			state <= w58;
		end if;
when s59 =>
		cmd <= "0011"; -- / VIR(12,16)Emissivity_COMPOENSATED=pixos12_16/E E=1
		in1 <= resize(pixos12_16,f16tmp1);
		in2 <= to_sfixed(1.0,f16tmp2);
		state <= w59;
when w59 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s60;
		else
			v_wait1 := v_wait1 + 1;
			state <= w59;
		end if;
when s60 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		vir12_16_emissitivy_componsated := resize(f16out,vir12_16_emissitivy_componsated);
		--report_error("fail vir12_16_emissitivy_componsated (ok,almost)", vir12_16_emissitivy_componsated, to_sfixed(700.882495690877,vir12_16_emissitivy_componsated)); -- ok,almost
		state <= w60;
when w60 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s61;
		else
			v_wait1 := v_wait1 + 1;
			state <= w60;
		end if;
when s61 =>
		tmp_slv16 := x"0000"&x"ffca" and x"0000"&x"ffff"; -- ram[0x0708]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
--		tmp_slv16 := "000000000000"&tmp_slv16(27 downto 24)&x"0000";
		pixgain_cp_sp0 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		pixgain_cp_sp0 := resize(pixgain_cp_sp0,pixgain_cp_sp0);
--		report_fixed_value("pixgain_cp_sp0",pixgain_cp_sp0);
		--report_error("fail pixgain_cp_sp0", pixgain_cp_sp0, to_sfixed(-54.0,pixgain_cp_sp0));
		cmd <= "0010"; -- * pixgain_cp_sp0*Kgain
		in1 <= resize(pixgain_cp_sp0,f16tmp1);
		in2 <= resize(kgain,f16tmp2);
		state <= w61;
when w61 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s62;
		else
			v_wait1 := v_wait1 + 1;
			state <= w61;
		end if;
when s62 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		pixgain_cp_sp0 := resize(f16out,pixgain_cp_sp0);
		--report_error("fail pixgain_cp_sp0 (ok,almost)", pixgain_cp_sp0, to_sfixed(-54.9469153515065,pixgain_cp_sp0)); -- ok,almost
		state <= w62;
when w62 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s63;
		else
			v_wait1 := v_wait1 + 1;
			state <= w62;
		end if;
when s63 =>
		tmp_slv16 := x"0000"&x"ffc8" and x"0000"&x"ffff"; -- ram[0x0728]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
--		tmp_slv16 := "000000000000"&tmp_slv16(27 downto 24)&x"0000";
		pixgain_cp_sp1 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		pixgain_cp_sp1 := resize(pixgain_cp_sp1,pixgain_cp_sp1);
--		report_fixed_value("pixgain_cp_sp1",pixgain_cp_sp1);
		--report_error("fail pixgain_cp_sp1", pixgain_cp_sp1, to_sfixed(-56.0,pixgain_cp_sp1));
		cmd <= "0010"; -- * pixgain_cp_sp1*Kgain
		in1 <= resize(pixgain_cp_sp1,f16tmp1);
		in2 <= resize(kgain,f16tmp2);
		state <= w63;
when w63 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s64;
		else
			v_wait1 := v_wait1 + 1;
			state <= w63;
		end if;
when s64 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		pixgain_cp_sp1 := resize(f16out,pixgain_cp_sp1);
		--report_error("fail pixgain_cp_sp1 (ok,almost)", pixgain_cp_sp1, to_sfixed(-56.9819862904511,pixgain_cp_sp1)); -- ok,almost
		state <= w64;
when w64 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s65;
		else
			v_wait1 := v_wait1 + 1;
			state <= w64;
		end if;
when s65 =>
		tmp_slv16 := x"0000"&x"fbb5" and x"0000"&x"03ff"; -- ee[0x243a]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "000000"&tmp_slv16(25 downto 16)&x"0000";
		off_cpsubpage_0 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tmps9 := resize(off_cpsubpage_0,tmps9);
		off_cpsubpage_0 := resize(tmps9,off_cpsubpage_0);
--		report_fixed_value("off_cpsubpage_0",off_cpsubpage_0);
		--report_error("fail off_cpsubpage_0", off_cpsubpage_0, to_sfixed(-75.0,off_cpsubpage_0));
		state <= w65;
when w65 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s66;
		else
			v_wait1 := v_wait1 + 1;
			state <= w65;
		end if;
when s66 =>
		tmp_slv16 := x"0000"&x"fbb5" and x"0000"&x"fc00"; -- ee[0x243a]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "0000000000"&tmp_slv16(31 downto 26)&x"0000";
		off_cpsubpage_1_delta := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tmps5 := resize(off_cpsubpage_1_delta,tmps5);
		off_cpsubpage_1_delta := resize(tmps5,off_cpsubpage_1_delta);
--		report_fixed_value("off_cpsubpage_1_delta",off_cpsubpage_1_delta);
		--report_error("fail off_cpsubpage_1_delta", off_cpsubpage_1_delta, to_sfixed(-2.0,off_cpsubpage_1_delta));
		cmd <= "0000"; -- + OFF_CPsubpage_0+OFF_CPsubpage_1_delta
		in1 <= resize(off_cpsubpage_0,f16tmp1);
		in2 <= resize(off_cpsubpage_1_delta,f16tmp2);
		state <= w66;
when w66 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s67;
		else
			v_wait1 := v_wait1 + 1;
			state <= w66;
		end if;
when s67 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		off_cpsubpage_1 := resize(f16out,off_cpsubpage_1);
		--report_error("fail off_cpsubpage_1 (ok,almost)", off_cpsubpage_1, to_sfixed(-77.0,off_cpsubpage_1)); -- ok,almost
		state <= w67;
when w67 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s68;
		else
			v_wait1 := v_wait1 + 1;
			state <= w67;
		end if;
when s68 =>
		tmp_slv16 := x"0000"&x"044b" and x"0000"&x"00ff"; -- ee[0x24eb]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "00000000"&tmp_slv16(23 downto 16)&x"0000";
		kta_cp_ee := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tmps7 := resize(kta_cp_ee,tmps7);
		kta_cp_ee := resize(tmps7,kta_cp_ee);
--		report_fixed_value("kta_cp_ee",kta_cp_ee);
		--report_error("fail kta_cp_ee", kta_cp_ee, to_sfixed(75.0,kta_cp_ee));
--		report_fixed_value("kta_scale_1",kta_scale_1);
		cmd <= "0011"; -- / KTa_cp_ee/2^KTa_scale_1
		in1 <= resize(kta_cp_ee,f16tmp1);
		in2 <= resize(kta_scale_1,f16tmp2);
		state <= w68;
when w68 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s69;
		else
			v_wait1 := v_wait1 + 1;
			state <= w68;
		end if;
when s69 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta_cp := resize(f16out,kta_cp);
		--report_error("fail kta_cp (ok,almost)", kta_cp, to_sfixed(0.00457763671875,kta_cp)); -- ok,almost
		state <= w69;
when w69 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s70;
		else
			v_wait1 := v_wait1 + 1;
			state <= w69;
		end if;
when s70 =>
		tmp_slv16 := x"0000"&x"2363" and x"0000"&x"0f00"; -- ee[0x2438]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "000000000000"&tmp_slv16(27 downto 24)&x"0000";
		kv_scale := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		--report_fixed_value("kv_scale",kv_scale);
		--report_error("fail kv_scale", kv_scale, to_sfixed(3.0,kv_scale));
		kv_scale := to_sfixed(1.0,kv_scale) sll to_integer(kv_scale);
		--report_error("fail 2^kv_scale", kv_scale, to_sfixed(8.0,kv_scale));
		state <= w70;
when w70 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s71;
		else
			v_wait1 := v_wait1 + 1;
			state <= w70;
		end if;
when s71 =>
		tmp_slv16 := x"0000"&x"044b" and x"0000"&x"ff00"; -- ee[0x243b]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "00000000"&tmp_slv16(31 downto 24)&x"0000";
		kv_cp_ee := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		tmps7 := resize(kv_cp_ee,tmps7);
		kv_cp_ee := resize(tmps7,kv_cp_ee);
		--report_fixed_value("kv_cp_ee",kv_cp_ee);
		--report_error("fail kv_cp_ee", kv_cp_ee, to_sfixed(4.0,kv_cp_ee));
		state <= w71;
when w71 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s72;
		else
			v_wait1 := v_wait1 + 1;
			state <= w71;
		end if;
when s72 =>
		cmd <= "0011"; -- / kv_cp_ee/2^kv_scale
		in1 <= resize(kv_cp_ee,f16tmp1);
--		report_fixed_value("f16tmp1",kv_cp_ee);
		in2 <= resize(kv_scale,f16tmp2); -- 2^kv_scale
--		report_fixed_value("f16tmp2",kv_scale);
		state <= w72;
when w72 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s73;
		else
			v_wait1 := v_wait1 + 1;
			state <= w72;
		end if;
when s73 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kv_cp := resize(f16out,kta_cp);
		--report_error("fail kv_cp (ok,almost)", kv_cp, to_sfixed(0.5,kv_cp)); -- ok,almost
		state <= w73;
when w73 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s74;
		else
			v_wait1 := v_wait1 + 1;
			state <= w73;
		end if;
when s74 =>
--0x2435 0x0994 
--IL_CHESS_C3 - 5 bits
--IL_CHESS_C2 - 5 bits
--IL_CHESS_C1 - 6 bits
--IL_CHESS_C3 = 0.125
--IL_CHESS_C2 = 3
--IL_CHESS_C1 = 1.25
		tmp_slv16 := x"0000"&x"0994" and x"0000"&x"003f"; -- ee[0x2435]
		f16out := to_sfixed (tmp_slv16(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
		tmp_slv16 := to_slv(f16out);
		tmp_slv16 := "0000000000"&tmp_slv16(21 downto 16)&x"0000";
		ilchessc1ee := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
--		report_fixed_value("ilchessc1ee",ilchessc1ee);
		tmps6 := resize(ilchessc1ee,tmps6);
		ilchessc1ee := resize(tmps6,ilchessc1ee);
--		report_fixed_value("ilchessc1ee",ilchessc1ee);
--		report_error("fail ilchessc1ee", ilchessc1ee, to_sfixed(1.25,ilchessc1ee));
		ilchessc1ee := ilchessc1ee srl 4;
--		report_fixed_value("ilchessc1ee",ilchessc1ee);
--		report_error("fail ilchessc1ee/2^4", ilchessc1ee, to_sfixed(1.25,ilchessc1ee));
		state <= w74;
when w74 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s75;
		else
			v_wait1 := v_wait1 + 1;
			state <= w74;
		end if;
when s75 =>
		cmd <= "0010"; -- * kta_cp*(ta-ta0)
		in1 <= resize(kta_cp,f16tmp1);
		in2 <= resize(tad,f16tmp2);
		state <= w75;
when w75 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s76;
		else
			v_wait1 := v_wait1 + 1;
			state <= w75;
		end if;
when s76 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta_cp := resize(f16out,kta_cp);
--		--report_error("fail kta_cp*(Ta-Ta0) (ok,almost)", kta_cp, to_sfixed(0.00457763671875*(39.184-25.0),kta_cp)); -- ok,almost
		state <= w76;
when w76 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s77;
		else
			v_wait1 := v_wait1 + 1;
			state <= w76;
		end if;
when s77 =>
		cmd <= "0000"; -- 1+kta_cp*(Ta-Ta0)
		in1 <= to_sfixed(1.0,f16tmp1);
		in2 <= resize(kta_cp,f16tmp2);
		state <= w77;
when w77 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s78;
		else
			v_wait1 := v_wait1 + 1;
			state <= w77;
		end if;
when s78 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kta_cp := resize(f16out,kta_cp);
--		--report_error("fail 1+kta_cp*(Ta-Ta0) (ok,almost)", kta_cp, to_sfixed(1.0+(0.00457763671875*(39.184-25.0)),kta_cp)); -- ok,almost
		state <= w78;
when w78 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s79;
		else
			v_wait1 := v_wait1 + 1;
			state <= w78;
		end if;
when s79 =>
		cmd <= "0010"; -- * kv_cp*(vdd-vdd0)
		in1 <= resize(kv_cp,f16tmp1);
		in2 <= resize(v0d,f16tmp2);
		state <= w79;
when w79 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s80;
		else
			v_wait1 := v_wait1 + 1;
			state <= w79;
		end if;
when s80 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kv_cp := resize(f16out,kv_cp);
--		--report_error("fail kv_cp*(vdd-vdd0) (ok,almost)", kv_cp, to_sfixed(0.5*(3.319-3.3),kv_cp)); -- ok,almost
		state <= w80;
when w80 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s81;
		else
			v_wait1 := v_wait1 + 1;
			state <= w80;
		end if;
when s81 =>
		cmd <= "0000"; -- 1+kv_cp*(vdd-vdd0)
		in1 <= to_sfixed(1.0,f16tmp1);
		in2 <= resize(kv_cp,f16tmp2);
		state <= w81;
when w81 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s82;
		else
			v_wait1 := v_wait1 + 1;
			state <= w81;
		end if;
when s82 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kv_cp := resize(f16out,kv_cp);
--		--report_error("fail 1+kv_cp*(vdd-vdd0) (ok,almost)", kv_cp, to_sfixed(1.0+(0.5*(3.319-3.3)),kv_cp)); -- ok,almost
		state <= w82;
when w82 =>
		if (v_wait1 = C_WAIT1-1) then
			v_wait1 := 0;
			state <= s83;
		else
			v_wait1 := v_wait1 + 1;
			state <= w82;
		end if;
when s83 =>
		cmd <= "0010"; -- * (1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
		in1 <= resize(kta_cp,f16tmp1);
		in2 <= resize(kv_cp,f16tmp2);
		state <= w83;
when w83 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s84; else v_wait1 := v_wait1 + 1; state <= w83; end if;
when s84 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		ktacp_kvcp_mul := resize(f16out,ktacp_kvcp_mul);
--		--report_error("fail (1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", ktacp_kvcp_mul, to_sfixed((1.0+(0.00457763671875*(39.184-25.0)))*(1.0+(0.5*(3.319-3.3))),ktacp_kvcp_mul)); -- ok,almost
		state <= w84;
when w84 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s85; else v_wait1 := v_wait1 + 1; state <= w84; end if;
when s85 =>
		cmd <= "0010"; -- * OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
		in1 <= resize(ktacp_kvcp_mul,f16tmp1);
		in2 <= resize(off_cpsubpage_0,f16tmp2);
		state <= w85;
when w85 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s86; else v_wait1 := v_wait1 + 1; state <= w85; end if;
when s86 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		pixos_cp_sp0 := resize(f16out,pixos_cp_sp0);
--		--report_error("fail OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp0, to_sfixed((-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)),pixos_cp_sp0)); -- ok,almost
		state <= w86;
when w86 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s87; else v_wait1 := v_wait1 + 1; state <= w86; end if;
when s87 =>
		cmd <= "0001"; -- - PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
		in1 <= resize(pixgain_cp_sp0,f16tmp1);
		in2 <= resize(pixos_cp_sp0,f16tmp2);
		state <= w87;
when w87 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s88; else v_wait1 := v_wait1 + 1; state <= w87; end if;
when s88 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		pixos_cp_sp0 := resize(f16out,pixos_cp_sp0);
--		report_fixed_value("PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp0);
--		--report_error("fail PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp0, to_sfixed((-54.9469153515065)-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)),pixos_cp_sp0)); -- ok,almost
--		report_error("fail PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp0, to_sfixed(25.6666575059956,pixos_cp_sp0)); -- ok,almost
		state <= w88;
when w88 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s89; else v_wait1 := v_wait1 + 1; state <= w88; end if;
when s89 =>
		cmd <= "0010"; -- * OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
		in1 <= resize(ktacp_kvcp_mul,f16tmp1);
--		report_fixed_value("ktacp_kvcp_mul",ktacp_kvcp_mul);
		in2 <= resize(off_cpsubpage_1,f16tmp2);
--		report_fixed_value("off_cpsubpage_1",off_cpsubpage_1);
		state <= w89;
when w89 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s90; else v_wait1 := v_wait1 + 1; state <= w89; end if;
when s90 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		pixos_cp_sp1 := resize(f16out,pixos_cp_sp1);
--		report_error("fail OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp1, to_sfixed((-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)),pixos_cp_sp1)); -- ok,almost
		state <= w90;
when w90 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s91; else v_wait1 := v_wait1 + 1; state <= w90; end if;
when s91 =>
		cmd <= "0001"; -- - PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
		in1 <= resize(pixgain_cp_sp1,f16tmp1);
--		report_fixed_value("pixgain_cp_sp1",pixgain_cp_sp1);
		in2 <= resize(pixos_cp_sp1,f16tmp2);
--		report_fixed_value("pixos_cp_sp1",pixos_cp_sp1);
		state <= w91;
when w91 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s92; else v_wait1 := v_wait1 + 1; state <= w91; end if;
when s92 =>
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		pixos_cp_sp1 := resize(f16out,pixos_cp_sp1);
--		report_fixed_value("PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp1);
--		report_error("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp1, to_sfixed((-56.9819862904511)-(-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)),pixos_cp_sp1)); -- ok,almost
--		report_error("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp1, to_sfixed(21.63158656770509,pixos_cp_sp1)); -- ok,almost -- xxx ??? ERROR on page 41 ??? xxx
		report_error("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost), error ? on page 41 => pixos_cp_sp1 = 21.63158656770509", pixos_cp_sp1, to_sfixed(25.79655775862116562500,pixos_cp_sp1)); -- ok,almost -- xxx from bc calculator
		state <= w92;
when w92 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s93; else v_wait1 := v_wait1 + 1; state <= w92; end if;

report "done" severity failure;

when ending =>

when others => null;
end case; end if; end if;
--stmp_slv16 <= tmp_slv16;
end process tester;
end architecture testbench;

