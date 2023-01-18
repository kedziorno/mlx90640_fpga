library IEEE,ieee_proposed;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.numeric_std_additions.all;
use ieee_proposed.standard_additions.all;
--use ieee_proposed.standard_textio_additions.all;
use ieee_proposed.std_logic_1164_additions.all;

use work.p_fphdl_package1.all;

package p_fphdl_package2 is

	procedure report_fixed_value (constant mes : in string; actual : in sfixed);
	procedure report_fixed_value (constant mes : in string; actual : in ufixed);
	procedure report_fixed_value (constant mes : in string; actual : in sfixed; hi : in integer; lo : in integer);
	procedure report_error_normalize (constant errmes : in string; actual : in sfixed; constant expected : in sfixed);
	procedure report_error_normalize (constant errmes : in string; actual : in ufixed; constant expected : in ufixed);
	procedure report_error (constant errmes : in string; actual : in sfixed; constant expected : in sfixed);
	procedure report_error (constant errmes : in string; actual : in ufixed; constant expected : in ufixed);
	procedure report_all (constant errmes : in string; actual : in sfixed; constant expected : in sfixed);
	procedure report_error (sl : std_logic_vector; constant e : real);

	function ap_slv2fp (sl:std_logic_vector) return real;
	function ap_slv2int (sl:std_logic_vector) return integer;

	function to_string_1 ( s : std_logic_vector ) return string;

end p_fphdl_package2;

package body p_fphdl_package2 is

	procedure report_fixed_value (constant mes : in string; actual : in sfixed) is begin
		report mes & CR & real'image(to_real(actual)) & " ( " & to_string(actual) & " " & to_hstring(actual) & " ) " severity note;
		return;
	end procedure report_fixed_value;

	procedure report_fixed_value (constant mes : in string; actual : in ufixed) is
	begin
		report mes & CR & real'image(to_real(actual)) & " ( " & to_string(actual) & " " & to_hstring(actual) & " ) " severity note;
		return;
	end procedure report_fixed_value;

	procedure report_fixed_value (constant mes : in string; actual : in sfixed; hi : in integer; lo : in integer) is
		subtype sta is sfixed (hi downto lo);
		variable a : sta;
	begin
		report mes & CR & real'image(to_real(resize(actual,hi,lo))) & " ( " & to_string(actual) & " " & to_hstring(actual) & " ) " severity note;
		return;
	end procedure report_fixed_value;

	procedure report_error (constant errmes : in string; actual : in sfixed; constant expected : in sfixed) is
	begin
		assert actual /= expected report errmes & CR & "********* OK SFIXED ACTUAL = EXPECTED *********" & CR &  "Actual   : " & to_string(actual) & "  (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "Expected : " & to_string(expected) & " (" & real'image(to_real(expected)) & ")" & HT & "(" & to_hstring(expected) & ") " & CR & "-----------------------------------------------" & CR severity note;
		assert actual = expected report errmes & CR & "Actual: " & to_string(actual) & " (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "     /= " & to_string(expected) & " (" & real'image(to_real(expected)) & ")" & HT & "(" & to_hstring(expected) & ") " severity error;
		return;
	end procedure report_error;

	procedure report_error_normalize (constant errmes : in string; actual : in sfixed; constant expected : in sfixed) is
		subtype sta is sfixed (FP_INTEGER_EXPECTED-1 downto -FP_FRACTION_EXPECTED);
		variable a : sta := resize (expected, FP_INTEGER_EXPECTED-1, -FP_FRACTION_EXPECTED);
		constant L : integer := abs (abs(a'high-a'low) - abs(actual'high-actual'low));
		variable space : string (1 to L-1) := (others => character(' '));
	begin
		assert actual /= a report errmes & CR &  "********* OK SFIXED ACTUAL = EXPECTED *********" & CR & "Actual   : " & to_string(actual)  & space & "  (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "Expected : " & to_string(a) & " (" & real'image(to_real(a)) & ")" & HT & "(" & to_hstring(a) & ") " & CR & "-----------------------------------------------" & CR severity note;
		assert actual = a report errmes & CR & "Actual: " & to_string(actual)  & space & "  (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "     /= " & to_string(a) & " (" & real'image(to_real(a)) & ")" & HT & "(" & to_hstring(a) & ") " severity error;
		return;
	end procedure report_error_normalize;

	procedure report_error_normalize (constant errmes : in string; actual : in ufixed; constant expected : in ufixed) is
		subtype sta is ufixed (FP_INTEGER_EXPECTED-1 downto -FP_FRACTION_EXPECTED);
		variable a : sta := resize (expected, FP_INTEGER_EXPECTED-1, -FP_FRACTION_EXPECTED);
		constant L : integer := abs (abs(a'high-a'low) - abs(actual'high-actual'low));
		variable space : string (1 to L+1) := (others => character(' '));
	begin
		assert actual /= a report errmes & CR &  "********* OK SFIXED ACTUAL = EXPECTED *********" & CR & "Actual   : " & to_string(actual)  & space & " (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "Expected : " & to_string(a) & " (" & real'image(to_real(a)) & ")" & HT & "(" & to_hstring(a) & ") " & CR & "-----------------------------------------------" & CR severity note;
		assert actual = a report errmes & CR & "Actual: " & to_string(actual)  & space & " (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "     /= " & to_string(a) & " (" & real'image(to_real(a)) & ")" & HT & "(" & to_hstring(a) & ") " severity error;
		return;
	end procedure report_error_normalize;

	procedure report_error (constant errmes : in string; actual : in ufixed; constant expected : in ufixed) is
	begin
		assert actual /= expected report errmes & CR & "********* OK UFIXED ACTUAL = EXPECTED *********" severity note;
		assert actual = expected  report errmes & CR & "Actual: " & to_string(actual) & " (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "     /= " & to_string(expected) & " (" & real'image(to_real(expected)) & ")" & HT & "(" & to_hstring(expected) & ") " severity warning;
		return;
	end procedure report_error;

	procedure report_error (sl : std_logic_vector; constant e : real) is
	begin
		assert ap_slv2fp (sl) /= e report "OK : " & real'image (ap_slv2fp (sl)) & " = " & real'image (e) & " ( " & to_hex_string (sl) & " ) " & to_string_1 (sl) severity note;
		assert ap_slv2fp (sl) = e report "actual /= expected : " & real'image (ap_slv2fp (sl)) & " /= " & real'image (e) & " ( " & to_hex_string (sl) & " ) " & to_string_1 (sl) severity error;
		return;
	end procedure report_error;

	procedure report_all (constant errmes : in string; actual : in sfixed; constant expected : in sfixed) is
	begin
		report_fixed_value (errmes, actual);
		report_error (errmes, actual, expected);
		report errmes & " bin2str " & to_string_1 (to_slv (actual));
		return;
	end procedure report_all;

	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2Fraytrac%2Fbranches%2Ffp%2Farithpack.vhd&rev=163
	function ap_slv2int (sl:std_logic_vector) return integer is
		alias s : std_logic_vector (sl'high downto sl'low) is sl;
		variable i : integer; 
	begin
		i:=0;
		for index in s'high downto s'low loop
			if s(index)='1' then
				i:=i*2+1;
			else
				i:=i*2;
			end if;
		end loop;
		return i;
	end function;

	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2Fraytrac%2Fbranches%2Ffp%2Farithpack.vhd&rev=163
	function ap_slv2fp (sl:std_logic_vector) return real is
		variable frc:integer;
		alias s: std_logic_vector(31 downto 0) is sl;
		variable f,expo: real;
		variable expoint:integer;
	begin
		expoint:=(ap_slv2int(s(30 downto 23)) - 127);
		expo:=real(real(2.0)**expoint);
		frc:=ap_slv2int('1'&s(22 downto 0));
--		f:=real(frc)*real(0.00000011920928955078125); -- 2**-23 real
		f:=real(frc)*real(2.0**(-23)); -- 2**-23 real
		f:=f*real(expo);
		if s(31)='1' then
			return -f;
		else
			return f;
		end if;
	end function;

	function to_string_1 ( s : std_logic_vector )
		return string
	is
		variable r : string ( s'length downto 1 ) ;
	begin
		for i in s'range  loop
			r(i+1) := std_logic'image (s(i))(2);
		end loop ;
		return r ;
	end function ;

end p_fphdl_package2;
