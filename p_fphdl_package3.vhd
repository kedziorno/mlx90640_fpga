library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
USE IEEE.math_real.all;

--synthesis translate_off
library ieee_proposed;
use ieee_proposed.float_pkg.all;
use ieee_proposed.numeric_std_additions.all; -- xxx 64bit
use ieee_proposed.standard_additions.all; -- xxx 64bit
use ieee_proposed.std_logic_1164_additions.all; -- xxx 64bit
--synthesis translate_on

package p_fphdl_package3 is

  constant fiexp : integer := 35;
  constant fifra : integer := 29;
  constant flexp : integer := 8;
  constant flfra : integer := 24;
  constant fl16exp : integer := 6;
  constant fl16fra : integer := 10;

  constant C_ADDFP_WAIT : integer := 32;
  constant C_SUBFP_WAIT : integer := 32;
  constant C_MULFP_WAIT : integer := 32;
  constant C_DIVFP_WAIT : integer := 64;
  constant C_SQRTFP2_WAIT : integer := 64;
  constant C_FI2FL_WAIT : integer := 16;
  constant C_FL2FI_WAIT : integer := 16;

	function ap_slv2fp (sl:std_logic_vector) return real;
	function ap_slv2int (sl:std_logic_vector) return integer;
	function to_string_1 ( s : std_logic_vector ) return string;
	procedure report_error (constant str : string; sl : std_logic_vector; constant ec : real);
  function ap_slv2fpem (constant exp:integer:=0;constant fra:integer:=0;constant sl:std_logic_vector) return real;
	procedure report_errorem (constant exp:integer:=0;constant fra:integer:=0; constant str : string; sl : std_logic_vector; constant ec : real);

end p_fphdl_package3;

package body p_fphdl_package3 is

	procedure report_error (constant str : string; sl : std_logic_vector; constant ec : real) is
--synthesis translate_off  
		variable a : float32;
		variable b : float32 := to_float (ec, a);
		variable actual : real := ap_slv2fp (sl);
		variable expected : real := to_real (b);
		variable actuals,expecteds : string (1 to 13);
--synthesis translate_on
	begin
--synthesis translate_off
		if actual >= real(0.0) then
			actuals := " " & real'image (actual);
		else
			actuals := real'image (actual);
		end if;
		if expected >= real(0.0) then
			expecteds := " " & real'image (expected);
		else
			expecteds := real'image (expected);
		end if;
--		assert actual = expected report "actual = expected : " & CR & actuals & CR & expecteds & CR & to_hex_string (sl) & CR & to_hex_string (b) & CR & to_string_1 (sl) & CR & to_string_1 (to_slv (b)) severity note;
		report str & " : " & actuals & " = " & expecteds & " " & to_hex_string (sl) & " " & to_hex_string (b) & " " & to_string_1 (sl) & " " & to_string_1 (to_slv (b)) severity note;
		return;
--synthesis translate_on
	end procedure report_error;

	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2Fraytrac%2Fbranches%2Ffp%2Farithpack.vhd&rev=163
	function ap_slv2int (sl:std_logic_vector) return integer is
		alias s : std_logic_vector (sl'high downto sl'low) is sl;
		variable i : integer; 
	begin
--synthesis translate_off
		i:=0;
		for index in s'high downto s'low loop
			if s(index)='1' then
				i:=i*2+1;
			else
				i:=i*2;
			end if;
		end loop;
		return i;
--synthesis translate_on
	end function;

	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2Fraytrac%2Fbranches%2Ffp%2Farithpack.vhd&rev=163
  function ap_slv2fp(sl:std_logic_vector) return real is
	 variable frc:integer;
	 alias s: std_logic_vector(31 downto 0) is sl;
	 variable f,expo: real;
  begin
--synthesis translate_off
	 expo:=real(ap_slv2int(s(30 downto 23)) - 127);
	 expo:=2.0**expo;
	 frc:=ap_slv2int('1'&s(22 downto 0));
	 f:=real(frc)*(2.0**real(-23.0));
	 f:=f*real(expo);
	 if s(31)='1' then
		return -f;
	 else
		return f;
	 end if;
--synthesis translate_on
	return 0.0;
  end function;

  function ap_slv2fpem (constant exp:integer:=0;constant fra:integer:=0;constant sl:std_logic_vector) return real is
	 variable frc:integer;
	 alias s: std_logic_vector(sl'range) is sl;
	 variable f,expo: real;
  begin
	 expo:=real(ap_slv2int(s(exp+fra-2 downto fra-1)) - (2**integer((exp+fra-2)-(fra-1))-1)); -- sign
   report "expo1 : "&real'image (expo);
	 expo:=2.0**expo;
   report "expo2 : "&real'image (expo);
	 frc:=ap_slv2int('1'&s(fra-2 downto 0));
   report "frc : "&integer'image (frc);
	 f:=real(frc)*(2.0**real(-(fra-1)));
   report "f : "&real'image (f);
	 f:=f*real(expo);
   report "f : "&real'image (f);
	 if s(exp+fra-1)='1' then
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
--synthesis translate_off
		for i in s'range  loop
			r(i+1) := std_logic'image (s(i))(2);
		end loop ;
		return r ;
--synthesis translate_on
	end function ;

	procedure report_errorem (constant exp:integer:=0;constant fra:integer:=0; constant str : string; sl : std_logic_vector; constant ec : real) is
    -- synthesis translate_off
		variable a : float32;
		variable b : float32 := to_float (ec, a);
		variable actual : real := ap_slv2fpem (exp,fra,sl);
		variable expected : real := to_real (b);
		variable actuals,expecteds : string (1 to 13);
    -- synthesis translate_on
	begin
    -- synthesis translate_off
		if actual >= real(0.0) then
			actuals := " " & real'image (actual);
		else
			actuals := real'image (actual);
		end if;
		if expected >= real(0.0) then
			expecteds := " " & real'image (expected);
		else
			expecteds := real'image (expected);
		end if;
--		assert actual = expected report "actual = expected : " & CR & actuals & CR & expecteds & CR & to_hex_string (sl) & CR & to_hex_string (b) & CR & to_string_1 (sl) & CR & to_string_1 (to_slv (b)) severity note;
		report str & " : " & actuals & " = " & expecteds & " " & to_hex_string (sl) & " " & to_hex_string (b) & " " & to_string_1 (sl) & " " & to_string_1 (to_slv (b)) severity note;
		return;
    -- synthesis translate_on
	end procedure report_errorem;

end p_fphdl_package3;
