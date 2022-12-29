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

--library ieee, ieee_proposed;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

--library UNISIM;
--use UNISIM.VComponents.all;

entity test_fixed_melexis is
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

	constant clock_period : time := 500 ns;
--	subtype sfixed7 is sfixed (3 downto -3);
	subtype sfixed7 is sfixed (11 downto 4);
	subtype ufixed8 is ufixed (8 downto 0);
	subtype sfixed8 is sfixed (8 downto 0);
	subtype sfixed16 is sfixed (15 downto -16);
	subtype sfixed18 is sfixed (17 downto -16);
	signal stop_clock : boolean := false;
	signal clk, rst_n : std_ulogic;
	signal in1slv, in2slv, out1slv : std_logic_vector(33 downto 0);
	signal in1, in2 : sfixed18;
	signal out1 : sfixed18;
	signal cmd : std_logic_vector (3 downto 0);
	signal in1r,in2r,out1r : real;

begin

	in1r <= to_real(in1);
	in2r <= to_real(in2);

	out1 <= to_sfixed(out1slv, sfixed18'high, sfixed18'low);
	out1r <= to_real(out1);

	in1slv <= to_slv(in1);
	in2slv <= to_slv(in2);

	DUT : fixed_synth port map (
		in1 => in1slv,
		in2 => in2slv,
		out1 => out1slv,
		cmd => cmd,
		clk => clk,
		rst_n => rst_n
	);

	clkprc : process is
	begin
		if (not stop_clock) then
			clk <= '0';
			wait for clock_period/2.0;
			clk <= '1';
			wait for clock_period/2.0;
		else
			wait;
		end if;
	end process clkprc;

	reset_proc : process is
	begin
		rst_n <= '0';
		wait for clock_period * 2.0;
		rst_n <= '1';
		report "sfixed16'high : " & integer'image(sfixed16'high);
		report "sfixed16'low  : " & integer'image(sfixed16'low );
		wait;
	end process reset_proc;

	-- purpose: main test loop
	tester : process is
		variable tmp_slv16 : std_logic_vector(31 downto 0);
		variable tmp_slv18 : std_logic_vector(33 downto 0);
		variable f16tmp1,f16tmp2,f16out : sfixed18;
		variable kvdd,vdd25 : sfixed16;
		variable kvptat,ktptat : sfixed16;
		variable vdd,deltaV : sfixed16;
		variable vptat,vbe : sfixed16;
		variable vptat25 : sfixed16;
		variable alphaptatee : sfixed16;
		variable alphaptat : sfixed16;
		variable h1,h2 : sfixed16;
		variable pow2_18 : sfixed(18 downto 0);
		variable f8tmp1 : ufixed8;
		variable f8tmp2 : sfixed8;
	begin
		-- reset
		tmp_slv16 := (others => '0');
		tmp_slv18 := (others => '0');
		cmd <= "0000";
		in1 <= (others => '0');
		in2 <= (others => '0');
		f16tmp1 := (others => '0');
		f16tmp2 := (others => '0');
		f16out := (others => '0');
		wait for clock_period*20;

		-- 11.2.2.2
		-- kvdd,vdd25
		-- ee[0x2433] = 0x9d68
		-- ram[0x072a] = 0xccc5

		--
		-- kvdd
		tmp_slv18 := "00"&x"0000"&x"9d68" and "00"&x"0000"&x"ff00"; -- 0x9d00
		f16tmp1 := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
--		report_fixed_value ("raw val", f16tmp1); -- -25344/40192
		tmp_slv18 := "00"&"0000000100000000" & "0000000000000000"; -- 2**8
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
--		report_fixed_value ("divider", f16tmp2); -- 256
		cmd <= "0011"; -- /
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		wait for clock_period*20;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
--		report_fixed_value ("div out", f16out); -- -99/157/65437
		--aaa := to_sfixed(to_slv(f16out)(23 downto 0),7,-16);
		--report_fixed_value ("div out 8bit", aaa); --
		--if (aaa > 127.0) then -- signed
		--	aaa := 256.0 - aaa;
		--	aaa := -aaa;
		--end if;
		--report_fixed_value ("sign", aaa); -- -99
		--f16tmp1 := to_sfixed("0000000000"&to_slv(aaa),f16tmp1); -- -99
		--f16tmp1 := resize(aaa,f16tmp1); -- -99
--		report_fixed_value ("127", to_ufixed(127.0,f8tmp1'high,f8tmp1'low));
--		report_fixed_value ("256", to_ufixed(256.0,f8tmp1'high,f8tmp1'low));
		--f8tmp1 := to_ufixed(77.0,f8tmp1);
		f8tmp1 := to_ufixed("0"&to_slv(f16out(7 downto 0)),f8tmp1);
--		report_fixed_value ("f8tmp1", f8tmp1);
		if (f8tmp1 > 127.0) then -- signed
			f8tmp2 := to_sfixed(to_slv(resize(256.0-f8tmp1,f8tmp1)),f8tmp2);
			f8tmp2 := -f8tmp2(7 downto 0);
--			report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(f8tmp1) - to_sfixed(256.0,f8tmp2)),f8tmp2));
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f8tmp1),7,0) - to_sfixed(256.0,7,0),7,0);
--			f8tmp2 := to_sfixed(to_sfixed(to_slv(f16out(7 downto 0)),7,0) - to_sfixed(256.0,7,0),f8tmp2'high,f8tmp2'low);
----			f8tmp2 := to_sfixed(to_slv(f16out(7 downto 0)),f8tmp2'high,f8tmp2'low) - to_sfixed(256.0,7,0);
			--report_fixed_value ("-------------------", f8tmp2);
--			f8tmp2 := to_sfixed(to_slv(f8tmp1),f8tmp2'high,f8tmp2'low);
		end if;
--		report_fixed_value ("sign8bit", f8tmp2); -- -99
--		f16tmp1 := to_sfixed("0"&x"00"&to_slv(f8tmp2)&x"0000",f16tmp1'high,f16tmp1'low);
		f16tmp1 := resize(f8tmp2,f16tmp1);
--		report_fixed_value ("sign", f16tmp1); -- -99
		tmp_slv18 := "00"&"0000000000100000" & "0000000000000000"; -- 2**5
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
--		report_fixed_value ("mul32", f16tmp2); -- 32
		cmd <= "0010"; -- *
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		wait for clock_period*20;
--		tmp_slv16 := to_slv (out1);
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		--kvdd := resize(f16out,kvdd);
		kvdd := f16out(15 downto -16);
		report_fixed_value ("kvdd", kvdd); -- -3168
		report_error("fail kvdd", kvdd, to_sfixed(-3168.0,kvdd));

		--
		-- vdd25
		tmp_slv18 := "00"&x"0000"&x"9d68" and "00"&x"0000"&x"00ff"; -- 0x0068
		f16tmp1 := to_sfixed (tmp_slv18(sfixed18'high downto 0)&x"0000", sfixed18'high, sfixed18'low);
		--report_fixed_value ("raw val", f16tmp1); -- 104
		tmp_slv18 := "00"&"0000000100000000" & "0000000000000000"; -- 2**8
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		report_fixed_value ("sub2**8", f16tmp2); -- 256
		cmd <= "0001"; -- -
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		wait for clock_period*20;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		--report_fixed_value ("after sub2**8", f16out); -- -152
		f16tmp1 := f16out; -- -152
		tmp_slv18 := "00"&"0000000000100000" & "0000000000000000"; -- 2**5
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		--report_fixed_value ("mul2**5", f16tmp2); -- 32
		cmd <= "0010"; -- *
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		wait for clock_period*20;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		--report_fixed_value ("after mul2**5", f16out); -- -4864
		f16tmp1 := f16out; -- -4864
		tmp_slv18 := "00"&"0010000000000000" & "0000000000000000"; -- 2**13
		f16tmp2 := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		--report_fixed_value ("sub2**13", f16tmp2); -- -2**13
		cmd <= "0001"; -- -
		in1 <= f16tmp1;
		--report_fixed_value ("f16tmp1", f16tmp1); --
		in2 <= f16tmp2;
		--report_fixed_value ("f16tmp2", f16tmp2); --
		wait for clock_period*20;
		tmp_slv18 := to_slv (out1);
		f16out := to_sfixed (tmp_slv18, sfixed18'high, sfixed18'low);
		vdd25 := resize(f16out,vdd25);
		--vdd25 := f16out;
		report_fixed_value ("vdd25", vdd25); -- -13056
		report_error("fail vdd25", vdd25, to_sfixed(-13056.0,vdd25));
report "done" severity failure;

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
		tmp_slv16 := x"0000"&x"5952" and x"0000"&x"fc00"; -- 0x5800
		f16tmp1 := to_sfixed ("00"&tmp_slv16, sfixed18'high, sfixed18'low);
		tmp_slv16 := "0000010000000000" & "0000000000000000"; -- 2**10
		f16tmp2 := to_sfixed ("00"&tmp_slv16, sfixed18'high, sfixed18'low);
		cmd <= "0011"; -- /
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		wait for clock_period*20;
--		report_fixed_value ("kvptat", out1); -- 22
		tmp_slv16 := to_slv (out1(15 downto -16));
		f16out := to_sfixed ("00"&tmp_slv16, sfixed18'high, sfixed18'low);
		if (f16out > 31.0) then -- signed
			f16out := f16out - 64.0;
		end if;
		tmp_slv16 := to_slv (out1(15 downto -16)); -- 22
		f16tmp1 := to_sfixed ("00"&tmp_slv16, sfixed18'high, sfixed18'low);
		tmp_slv16 := "0001000000000000" & "0000000000000000"; -- 2**12
		f16tmp2 := to_sfixed ("00"&tmp_slv16, sfixed18'high, sfixed18'low);
		in1 <= f16tmp1;
		in2 <= f16tmp2;
		wait for clock_period*20;
		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		kvptat := resize(f16out,kvptat);
		report_fixed_value ("kvptat", kvptat); -- 5.371094e-03
		report_error("fail kvptat", kvptat, to_sfixed(0.005371094,kvptat));

		-- 
		-- ktptat
		cmd <= "0011"; -- /
		tmp_slv16 := x"0000"&x"5952" and x"0000"&x"03ff"; -- 0x0152
--		f16out := to_sfixed ("00"&tmp_slv16, sfixed18'high, sfixed18'low);
		f16out := "00"&to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		report_fixed_value ("raw val", f16out); -- 338
		if (f16out > 511.0) then -- signed
			f16out := f16out - 1024.0;
		end if;
		report_fixed_value ("sign", f16out); --
		tmp_slv16 := to_slv (f16out); -- 338
--		f16tmp1 := to_sfixed ("00"&tmp_slv16, sfixed18'high, sfixed18'low);
		f16tmp1 := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		report_fixed_value ("aaaaaaaa", f16tmp1); --
		tmp_slv16 := "0000000000001000" & "0000000000000000"; -- 2**3
--		f16tmp2 := to_sfixed ("00"&tmp_slv16, sfixed18'high, sfixed18'low);
		f16tmp2 := "00"&to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		report_fixed_value ("bbbbbbbb", f16tmp2); --
		in1 <= f16tmp1;
		report_fixed_value ("f16tmp1", f16tmp1); --
		in2 <= f16tmp2;
		report_fixed_value ("f16tmp2", f16tmp2); --
		wait for clock_period*20;
		report_fixed_value ("return", out1); --

		tmp_slv16 := to_slv (out1);
		f16out := to_sfixed (tmp_slv16, sfixed16'high, sfixed16'low);
		ktptat := resize(f16out,ktptat);
		report_fixed_value ("ktptat", ktptat); -- 42.25
		report_error("fail ktptat", ktptat, to_sfixed(42.25,ktptat));

report "" severity failure;

--		--
--		-- deltaV = (ram[0x072a] - vdd25) / kvdd
--		tmp_slv := x"ccc5" and x"ffff"; -- 52421
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
--		report_fixed_value ("ram[0x072a]", f16out); -- 52421
--		if (f16out > 32767.0) then -- signed
--			f16out := 65536.0 - f16out;
--			f16out := -f16out;
--		end if;
--		report_fixed_value ("ram[0x072a]", f16out); -- -13115
--
--		tmp_slv := to_slv (f16out);
--		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp1); -- -13115
--
--		tmp_slv := to_slv (vdd25);
--		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp2); -- -13056
--
--		cmd <= "0001"; -- -
--		in1 <= f16tmp1;
--		in2 <= f16tmp2;
--		wait for clock_period*20;
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16out); -- -59
--
--		tmp_slv := to_slv (f16out);
--		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp1); -- -59
--		tmp_slv := to_slv (kvdd);
--		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp2); -- -3168
--
--		cmd <= "0011"; -- /
--		in1 <= f16tmp1;
--		in2 <= f16tmp2;
--		wait for clock_period*20;
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
--		report_fixed_value ("deltaV", f16out); -- 1.861572e-02
--		deltaV := f16out;
--
--		tmp_slv := to_slv (deltaV);
--		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp1); -- 1.861572e-02
--		tmp_slv := "000000000000000011" & "0100110011001101"; -- 3.3
--		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp2); -- 3.300003e+00
--
--		cmd <= "0000"; -- +
--		in1 <= f16tmp1;
--		in2 <= f16tmp2;
--		wait for clock_period*20;
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
--		report_fixed_value ("vdd", f16out); -- 3.318619e+00 ~3.319
--		vdd := f16out;
--
--		--
--		-- vptat25
--		tmp_slv := x"2ff1" and x"ffff"; -- 12273
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value ("ee[0x2431]", f16out); -- 12273
--		if (f16out > 32767.0) then -- signed
--			f16out := 65536.0 - f16out;
--			f16out := -f16out;
--		end if;
--		report_fixed_value ("vptat25", f16out); -- 1711
--		vptat25 := f16out;
--
--		--
--		-- vptat
--		tmp_slv := x"06af" and x"ffff"; -- 1711
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value ("ram[0x0720]", f16out); -- 1711
--		if (f16out > 32767.0) then -- signed
--			f16out := 65536.0 - f16out;
--			f16out := -f16out;
--		end if;
--		report_fixed_value ("vptat", f16out); -- 1711
--		vptat := f16out;
--
--		--
--		-- vbe
--		tmp_slv := x"4bf2" and x"ffff"; -- 19422
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value ("ram[0x0700]", f16out); -- 19422
--		if (f16out > 32767.0) then -- signed
--			f16out := 65536.0 - f16out;
--			f16out := -f16out;
--		end if;
--		report_fixed_value ("vbe", f16out); -- 19422
--		vbe := f16out;
--
--		--
--		-- alphaptatee
--		tmp_slv := x"4210" and x"f000"; -- 16384
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value ("ee[0x2410]", f16out); -- 16384
--		tmp_slv := to_slv (f16out);
--		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp1); -- 16384
--		tmp_slv := "00000100000000000" & "00000000000000000"; -- 2**12
--		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp2); -- 4096
--
--		cmd <= "0011"; -- /
--		in1 <= f16tmp1;
--		in2 <= f16tmp2;
--		wait for clock_period*20;
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
--		report_fixed_value ("alphaptatee", f16out); -- 4.000076e+00
--		alphaptatee := f16out;
--
--		--
--		-- alphaptat
--		tmp_slv := to_slv (alphaptatee); -- 4
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16out); -- 4
--		tmp_slv := to_slv (f16out);
--		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp1); -- 4
--		tmp_slv := "00000000000000010" & "00000000000000000"; -- 2**2
--		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp2); -- 4
--
--		cmd <= "0011"; -- /
--		in1 <= f16tmp1;
--		in2 <= f16tmp2;
--		wait for clock_period*20;
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16out); -- 1
--
--		tmp_slv := to_slv (f16out); -- 1
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16out); -- 1
--		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp1); -- 1
--		tmp_slv := "00000000000000100" & "00000000000000000"; -- 2**3
--		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp2); -- 8
--
--		cmd <= "0000"; -- +
--		in1 <= f16tmp1;
--		in2 <= f16tmp2;
--		wait for clock_period*20;
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
--		report_fixed_value ("alphaptat", f16out); -- 9
--		alphaptat := f16out;
--
--		--
--		-- vptatart
--		
--		cmd <= "0010"; -- *
--		in1 <= vptat;
--		in2 <= alphaptat;
--		wait for clock_period*20;
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
--		report_fixed_value ("vptat*alphaptat", f16out); --
--
--		cmd <= "0000"; -- +
--		in1 <= out1;
--		in2 <= vbe;
--		wait for clock_period*20;
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
--		report_fixed_value ("vptat*alphaptat+vbe", f16out); --
--
--		cmd <= "0011"; -- /
--		in1 <= vptat;
--		in2 <= out1;
--		wait for clock_period*20;
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
--		report_fixed_value ("vptat/(vptat*alphaptat+vbe)", f16out); --
--
--
----		tmp_slv := "100000000000000" & "00000000000000000"; -- 2**16
----		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp2); -- 
----		cmd <= "0010"; -- *
----		in1 <= out1;
----		in2 <= f16tmp2;
----		wait for clock_period*20;
----		tmp_slv := to_slv (out1);
----		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value ("h1", f16out); --
----		h1 := f16out;
----	
----		tmp_slv := "000000000000010" & "00000000000000000"; -- 2**2
----		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value (" ", f16tmp2); -- 
----		cmd <= "0010"; -- *
----		in1 <= out1;
----		in2 <= f16tmp2;
----		wait for clock_period*20;
----		tmp_slv := to_slv (out1);
----		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value ("h2", f16out); --
----		h2 := f16out;
----
----		cmd <= "0000"; -- +
----		in1 <= h1;
----		in2 <= h2;
--
--		pow2_18 := to_sfixed (262144.0, 18, 0);
--		report_fixed_value ("2**18", pow2_18); -- 
--
--		cmd <= "0010"; -- *
--		in1 <= out1;
--		in2 <= pow2_18 & "000000000000000";
--
--		tmp_slv := to_slv (out1);
--		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
--		report_fixed_value ("aaaaaaaaaaa ", f16out); --
--
----		cmd <= "0010"; -- *
----		in1 <= out1;
----		in2 <= vbe;
----		wait for clock_period*20;
--
--
--
----		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value ("ktptat", f16out); -- 338
----		if (f16out > 511.0) then -- signed
----			f16out := f16out - 1024.0;
----		end if;
----		tmp_slv := to_slv (f16out); -- 338
----		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		tmp_slv := "0000000000001000" & "0000000000000000"; -- 2**3
----		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		in1 <= f16tmp1;
----		in2 <= f16tmp2;
----		wait for clock_period*20;
----		report_fixed_value ("ktptat", out1); -- 42.25
----		
----		cmd <= "0011"; -- /
----		tmp_slv := x"5952" and x"03ff"; -- 0x0152
----		f16out := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		report_fixed_value ("ktptat", f16out); -- 338
----		if (f16out > 511.0) then -- signed
----			f16out := f16out - 1024.0;
----		end if;
----		tmp_slv := to_slv (f16out); -- 338
----		f16tmp1 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		tmp_slv := "0000000000001000" & "0000000000000000"; -- 2**3
----		f16tmp2 := to_sfixed (tmp_slv, sfixed16'high, sfixed16'low);
----		in1 <= f16tmp1;
----		in2 <= f16tmp2;
----		wait for clock_period*20;
----		report_fixed_value ("ktptat", out1); -- 42.25
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
----		wait for clock_period*20;
----		report_fixed_value ("kvptat", out1);
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

		report "done" severity failure;
	end process tester;

end architecture testbench;
