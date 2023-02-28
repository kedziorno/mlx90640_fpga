--library IEEE,ieee_proposed;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
USE IEEE.math_real.all;
--use ieee_proposed.float_pkg.all;
--use ieee_proposed.numeric_std_additions.all;
--use ieee_proposed.standard_additions.all;
--use ieee_proposed.std_logic_1164_additions.all;

package p_fphdl_package3 is

	function ap_slv2fp (sl:std_logic_vector) return real;
	function ap_slv2int (sl:std_logic_vector) return integer;

--	function to_string_1 ( s : std_logic_vector ) return string;

--	procedure report_error (sl : std_logic_vector; constant ec : real);

end p_fphdl_package3;

package body p_fphdl_package3 is

--	procedure report_error (sl : std_logic_vector; constant ec : real) is
--		variable a : float32;
--		variable b : float32 := to_float (ec, a);
--		variable actual : real := ap_slv2fp (sl);
--		variable expected : real := to_real (b);
--		variable actuals,expecteds : string (1 to 13);
--	begin
--		if actual >= real(0.0) then
--			actuals := " " & real'image (actual);
--		else
--			actuals := real'image (actual);
--		end if;
--		if expected >= real(0.0) then
--			expecteds := " " & real'image (expected);
--		else
--			expecteds := real'image (expected);
--		end if;
--		assert actual = expected report "actual = expected : " & CR & actuals & CR & expecteds & CR & to_hex_string (sl) & CR & to_hex_string (b) & CR & to_string_1 (sl) & CR & to_string_1 (to_slv (b)) severity note;
--		report "actual = expected : " & actuals & " = " & expecteds & " " & to_hex_string (sl) & " " & to_hex_string (b) & " " & to_string_1 (sl) & " " & to_string_1 (to_slv (b)) severity note;
--		return;
--	end procedure report_error;

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
  function ap_slv2fp(sl:std_logic_vector) return real is
--	 variable frc:integer;
--	 alias s: std_logic_vector(31 downto 0) is sl;
--	 variable f,expo: real;
  begin
--	 expo:=real(ap_slv2int(s(30 downto 23)) - 127);
--	 expo:=2.0**expo;
--	 frc:=ap_slv2int('1'&s(22 downto 0));
--	 f:=real(frc)*(2.0**real(-23.0));
--	 f:=f*real(expo);
--	 if s(31)='1' then
--		return -f;
--	 else
--		return f;
--	 end if;
	return 0.0;
  end function;

--	function to_string_1 ( s : std_logic_vector )
--		return string
--	is
--		variable r : string ( s'length downto 1 ) ;
--	begin
--		for i in s'range  loop
--			r(i+1) := std_logic'image (s(i))(2);
--		end loop ;
--		return r ;
--		return 0.0;
--	end function ;

end p_fphdl_package3;
