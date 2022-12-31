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
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
o_out1 : out sfixed (17 downto -16)
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
	subtype sfixed7 is sfixed (11 downto 4);
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
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,
	w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26
	);
	signal state : states;
begin

--	in1r <= to_real(in1);
--	in2r <= to_real(in2);

	out1 <= to_sfixed(out1slv, sfixed18'high, sfixed18'low);
--	out1r <= to_real(out1);
	o_out1 <= out1;

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
		variable vdd,deltaV : sfixed18;
		variable vptat,vbe : sfixed16;
		variable vptat25 : sfixed16;
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
		constant C_WAIT1 : integer := 2000;
		variable v_wait1 : integer range 0 to C_WAIT1-1;
	begin
		if (rising_edge(i_clock)) then
		if (i_reset = '1') then
		v_wait1 := 0;
		state <= idle;
--		o_out1 <= (others => '0');
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
		report_error("fail kvdd", kvdd, to_sfixed(-3168.0,kvdd));
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
		report_error("fail vdd25", vdd25, to_sfixed(-13056.0,vdd25));

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
		report_error("fail kvptat", kvptat, to_sfixed(0.005371094,kvptat));

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
		report_error("fail ktptat", ktptat, to_sfixed(42.25,ktptat));

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
		report_error("fail deltaV", vdd, to_sfixed(3.318619,vdd));

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
		report_error("fail vptat25", vptat25, to_sfixed(12273,vptat25));

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
		report_error("fail vptat", vptat, to_sfixed(1711,vptat));

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
		report_error("fail vbe", vbe, to_sfixed(19442,vbe));

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
		report_error("fail alphaptatee", alphaptatee, to_sfixed(4,alphaptatee));		
		
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
		report_error("fail alphaptat", alphaptat, to_sfixed(9,alphaptat));

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

		when s20 =>
		---- report_fixed_value ("((vptat/(vptat*alphaptat+vbe))*pow2**18)*pow2**2", f16out); --
		-- report_fixed_value ("vptatart", f16out); --

		--pow2to18 := to_ufixed (262144.0, ufixed18'high,ufixed18'low);
		---- report_fixed_value ("2**18", pow2to18); -- 
		report_error("fail vptatart (see comment -> 1.287190e+04 ( 000011001001000111.1110011011011100 03247.E6DC ))", f16out, to_sfixed(12873.57952,f16out)); -- ok, lets assume 1.287190e+04 ( 000011001001000111.1110011011011100 03247.E6DC ) because math in "vptat/(vptat*alphaptat+vbe)" after dot(.) have 16bit and not 32bit

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
		in1 <= resize(f16out,f16tmp1); --vptatart
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

		cmd <= "0000"; -- / f=e+25.0
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
		when s26 =>
		-- report_fixed_value ("out f+", out1); --
		-- report_fixed_value ("Ta", out1); --
		report_error("fail Ta (see comment -> 3.914729e+01 ( 000000000000100111.0010010110110101 00027.25B5 ))", out1, to_sfixed(39.184,out1)); -- ok, lets assume 3.914729e+01 ( 000000000000100111.0010010110110101 00027.25B5 ) because math after dot(.) have 16bit and not 32bit
state <= w26;
when w26 =>
		if (v_wait1 = C_WAIT1-1) then
--			o_out1 <= out1;
			v_wait1 := 0;
			state <= idle;
		else
			v_wait1 := v_wait1 + 1;
			state <= w26;
		end if;
--report "done" severity failure;


--		cmd <= "0010"; -- *
--		in1 <= out1;
--		in2 <= pow2_18 & "000000000000000";
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
--		-- report_fixed_value ("aaaaaaaaaaa ", f16out); --
--
----		cmd <= "0010"; -- *
----		in1 <= out1;
----		in2 <= vbe;
----		-- wait for clock_period*20;
--
--
--
----		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		-- report_fixed_value ("ktptat", f16out); -- 338
----		if (f16out > 511.0) then -- signed
----			f16out := f16out - 1024.0;
----		end if;
----		tmp_slv := to_slv (f16out); -- 338
----		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		tmp_slv := "0000000000001000" & "0000000000000000"; -- 2**3
----		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		in1 <= f16tmp1;
----		in2 <= f16tmp2;
----		-- wait for clock_period*20;
----		-- report_fixed_value ("ktptat", out1); -- 42.25
----		
----		cmd <= "0011"; -- /
----		tmp_slv := x"5952" and x"03ff"; -- 0x0152
----		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		-- report_fixed_value ("ktptat", f16out); -- 338
----		if (f16out > 511.0) then -- signed
----			f16out := f16out - 1024.0;
----		end if;
----		tmp_slv := to_slv (f16out); -- 338
----		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		tmp_slv := "0000000000001000" & "0000000000000000"; -- 2**3
----		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		in1 <= f16tmp1;
----		in2 <= f16tmp2;
----		-- wait for clock_period*20;
----		-- report_fixed_value ("ktptat", out1); -- 42.25
--		
--		
----		tmp_slv := to_slv(out1);
----		f16out := to_sfixed(tmp_slv, sfixed16'high, sfixed16'low);
----		if (f16out > 31.0) then -- x>31 then x-64 else x
----			f16out := f16out - 64.0;
----		end if;
----		tmp_slv := to_slv(out1); -- 0x16
----		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		tmp_slv := "0001000000000000" & x"0000"; -- 2**12
----		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		in1 <= f16tmp1;
----		in2 <= f16tmp2;
----		-- wait for clock_period*20;
----		-- report_fixed_value ("kvptat", out1);
--
----		-- kvptat - ee[0x2432] = 0x5952
----		tmp_slv := x"5952" and x"fc00";
----		chks16 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----    report_error ( "kvptat = ((ee[0x2432]&0xfc00)/2^10)/2^12", out1, chks16);
----    chks16 := to_sfixed (((22.0)/(4096.0)), sfixed16'high, sfixed16'low); -- kvptat
----    report_error ( "kvptat = ((ee[0x2432]&0xfc00)/2^10)/2^12", out1, chks16);
----    chks16 := to_sfixed (((338.0)/(8.0)), sfixed16'high, sfixed16'low); -- ktptat
----    report_error ( "div", out1, chks16);
----    chks16 := to_sfixed (((-13115.0)-(-13056.0)), sfixed16'high, sfixed16'low); -- deltaV = (ram[0x072a] - vdd25)
----    report_error ( "sub", out1, chks16);
----    chks16 := to_sfixed (((-59.0)/(-3168.0)), sfixed16'high, sfixed16'low); -- deltaV = ((ram[0x072a] - vdd25) / kvdd)
----    report_error ( "div", out1, chks16);

--		report "done" severity failure;
	when others => null;
	end case;
	end if;
	end if;
	end process tester;

end architecture testbench;
