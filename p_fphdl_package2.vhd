library IEEE,ieee_proposed;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.numeric_std_additions.all;
use ieee_proposed.standard_additions.all;
use ieee_proposed.standard_textio_additions.all;
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

end p_fphdl_package2;

package body p_fphdl_package2 is

	procedure report_fixed_value (constant mes : in string; actual : in sfixed) is begin
--		report mes & CR & real'image(to_real(actual)) & " ( " & to_string(actual) & " " & to_hstring(actual) & " ) " severity note;
		return;
	end procedure report_fixed_value;

	procedure report_fixed_value (constant mes : in string; actual : in ufixed) is
	begin
--		report mes & CR & real'image(to_real(actual)) & " ( " & to_string(actual) & " " & to_hstring(actual) & " ) " severity note;
		return;
	end procedure report_fixed_value;

	procedure report_fixed_value (constant mes : in string; actual : in sfixed; hi : in integer; lo : in integer) is
--		subtype sta is sfixed (hi downto lo);
--		variable a : sta;
	begin
--		report mes & CR & real'image(to_real(resize(actual,hi,lo))) & " ( " & to_string(actual) & " " & to_hstring(actual) & " ) " severity note;
		return;
	end procedure report_fixed_value;

	procedure report_error (constant errmes : in string; actual : in sfixed; constant expected : in sfixed) is
	begin
--		assert actual /= expected report errmes & CR & "********* OK SFIXED ACTUAL = EXPECTED *********" & CR &  "Actual   : " & to_string(actual) & "  (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "Expected : " & to_string(expected) & " (" & real'image(to_real(expected)) & ")" & HT & "(" & to_hstring(expected) & ") " & CR & "-----------------------------------------------" & CR severity note;
--		assert actual = expected report errmes & CR & "Actual: " & to_string(actual) & " (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "     /= " & to_string(expected) & " (" & real'image(to_real(expected)) & ")" & HT & "(" & to_hstring(expected) & ") " severity error;
		return;
	end procedure report_error;

	procedure report_error_normalize (constant errmes : in string; actual : in sfixed; constant expected : in sfixed) is
--		subtype sta is sfixed (FP_INTEGER_EXPECTED-1 downto -FP_FRACTION_EXPECTED);
--		variable a : sta := resize (expected, FP_INTEGER_EXPECTED-1, -FP_FRACTION_EXPECTED);
--		constant L : integer := abs (abs(a'high-a'low) - abs(actual'high-actual'low));
--		variable space : string (1 to L-1) := (others => character(' '));
	begin
--		assert actual /= a report errmes & CR &  "********* OK SFIXED ACTUAL = EXPECTED *********" & CR & "Actual   : " & to_string(actual)  & space & "  (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "Expected : " & to_string(a) & " (" & real'image(to_real(a)) & ")" & HT & "(" & to_hstring(a) & ") " & CR & "-----------------------------------------------" & CR severity note;
--		assert actual = a report errmes & CR & "Actual: " & to_string(actual)  & space & "  (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "     /= " & to_string(a) & " (" & real'image(to_real(a)) & ")" & HT & "(" & to_hstring(a) & ") " severity error;
		return;
	end procedure report_error_normalize;

	procedure report_error_normalize (constant errmes : in string; actual : in ufixed; constant expected : in ufixed) is
--		subtype sta is ufixed (FP_INTEGER_EXPECTED-1 downto -FP_FRACTION_EXPECTED);
--		variable a : sta := resize (expected, FP_INTEGER_EXPECTED-1, -FP_FRACTION_EXPECTED);
--		constant L : integer := abs (abs(a'high-a'low) - abs(actual'high-actual'low));
--		variable space : string (1 to L+1) := (others => character(' '));
	begin
--		assert actual /= a report errmes & CR &  "********* OK SFIXED ACTUAL = EXPECTED *********" & CR & "Actual   : " & to_string(actual)  & space & " (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "Expected : " & to_string(a) & " (" & real'image(to_real(a)) & ")" & HT & "(" & to_hstring(a) & ") " & CR & "-----------------------------------------------" & CR severity note;
--		assert actual = a report errmes & CR & "Actual: " & to_string(actual)  & space & " (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "     /= " & to_string(a) & " (" & real'image(to_real(a)) & ")" & HT & "(" & to_hstring(a) & ") " severity error;
		return;
	end procedure report_error_normalize;

	procedure report_error (constant errmes : in string; actual : in ufixed; constant expected : in ufixed) is
	begin
--		assert actual /= expected report errmes & CR & "********* OK UFIXED ACTUAL = EXPECTED *********" severity note;
--		assert actual = expected  report errmes & CR & "Actual: " & to_string(actual) & " (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR & "     /= " & to_string(expected) & " (" & real'image(to_real(expected)) & ")" & HT & "(" & to_hstring(expected) & ") " severity warning;
		return;
	end procedure report_error;

	procedure report_all (constant errmes : in string; actual : in sfixed; constant expected : in sfixed) is
	begin
--		report_fixed_value (errmes, actual);
--		report_error (errmes, actual, expected);
--		report errmes & " bin2str " & to_string_1 (to_slv (actual));
		return;
	end procedure report_all;

end p_fphdl_package2;
