-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   09:00:00 03/15/2025
-- Design Name:   mlx90640_fpga
-- Module Name:   global_package
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Package with all constants, used in ALL modules
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    ieee_proposed library (fphdl)
--  - Modules: -
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules: -
--
-- Imporant objects:
--  - For tests:
--    - ap_slv2fp - convert std_logic_vector to float in tb 
--    - report_error - display when current /= expected values
--                      or for dump value when expected equal zero 
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos: -
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones: -
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
--synthesis translate_off
USE IEEE.math_real.all;
--synthesis translate_on

--synthesis translate_off
library ieee_proposed;
use ieee_proposed.float_pkg.all;
use ieee_proposed.numeric_std_additions.all;
use ieee_proposed.standard_additions.all;
use ieee_proposed.std_logic_1164_additions.all;
--synthesis translate_on

package global_package is

  -- Color map - XXX TODO make more universal (MSB bit as sign)
  constant C_COLOR_MAP_RANGE_MIN_SIGNED : integer := -256;
  constant C_COLOR_MAP_RANGE_MAX_SIGNED : integer := 256;
  constant C_COLOR_MAP_RANGE_MIN_UNSIGNED : integer := 0;
  constant C_COLOR_MAP_RANGE_MAX_UNSIGNED : integer := 512;
  constant C_COLOR_MAP_COLOR_BITS : integer := 24;
  subtype color_bits is std_logic_vector (C_COLOR_MAP_COLOR_BITS - 1 downto 0);
  type t_color_map_rom_type_signed is array (C_COLOR_MAP_RANGE_MIN_SIGNED to C_COLOR_MAP_RANGE_MAX_SIGNED-1) of color_bits;
  type t_color_map_rom_type_unsigned is array (C_COLOR_MAP_RANGE_MIN_UNSIGNED to C_COLOR_MAP_RANGE_MAX_UNSIGNED-1) of color_bits;

  subtype constant_float is std_logic_vector (31 downto 0); -- Floating Point 32

  -- mem_ramb16_s36_s36_x2
  constant c_mode_com : integer := 0;
  constant c_mode_seq : integer := 1;

  -- mem_switchpattern
  constant c_type_lut : integer := 0;
  constant c_type_rom1 : integer := 1;
  constant c_type_rom2 : integer := 2;

  -- calculate_vdd
  constant c_3dot3_ft : std_logic_vector (31 downto 0) := x"40533333";
	constant c_2pow5_ft : std_logic_vector (31 downto 0) := x"42000000";
	constant c_2pow13_ft : std_logic_vector (31 downto 0) := x"46000000";
	constant c_256_ft : std_logic_vector (31 downto 0) := x"43800000";
	constant resreg : std_logic_vector (15 downto 0) := x"1901" and x"0c00";

  -- CalcualteAcc
	constant const2 : std_logic_vector (31 downto 0) := x"40000000";
	constant SCALEALPHA : std_logic_vector (31 downto 0) := x"358637BD"; -- 0.000001

	-- calculate_alpha_compensation
	constant C_ROWS : integer := 24; -- Matrix Pixels Y
	constant C_COLS : integer := 32; -- Matrix Pixels X
	constant C_MATRIX_PIXELS : integer := C_ROWS * C_COLS;
	constant C_P1 : std_logic_vector (31 downto 0) := x"3F800000"; -- +1
  constant C_M1 : std_logic_vector (31 downto 0) := x"BF800000"; -- -1
  constant C_2POW13 : std_logic_vector (31 downto 0) := x"46000000"; -- 2^13
  constant C_TA0 : std_logic_vector (31 downto 0) := x"41C80000"; -- Temperature ambient ~25st C
  constant C_ZERO : std_logic_vector (31 downto 0) := x"00000000";

  --constant C_TB_DATA_FILE : string := "tb_data";
  --file fptr : text;
  constant GLOBAL_BOARD_FREQUENCY : natural := 100_000_000;
  constant GLOBAL_I2C_FREQUENCY : natural := 400_000;
  constant I2C_STRETCH : natural := GLOBAL_BOARD_FREQUENCY/GLOBAL_I2C_FREQUENCY;
  constant I2C_CLOCK_DIVIDER : natural := 4;
  constant I2C_ADDRESS_BITS : natural := 7;
  constant I2C_DATA_BITS : natural := 8;
  constant I2C_ADDRESS_READ : boolean := TRUE;
  constant I2C_ADDRESS_WRITE : boolean := FALSE;
  constant I2C_DATA_ACK : boolean := FALSE;
  constant I2C_DATA_NAK : boolean := TRUE;
  constant I2C_BITS_LENGTH : natural := 9;
  constant C_DATA_SIZE : integer := 3340; -- number bytes from i2c

--synthesis translate_off
  -- XXX https://comp.lang.vhdl.narkive.com/B8UInWjr/convert-boolean-to-std-logic
  function To_Std_Logic (L : BOOLEAN)   return std_ulogic;
  function To_Std_Logic (L : character) return boolean;
  function int2hex      (L : character) return natural;

	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2Fraytrac%2Fbranches%2Ffp%2Farithpack.vhd&rev=163
	function ap_slv2fp (sl:std_logic_vector) return real;
	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2Fraytrac%2Fbranches%2Ffp%2Farithpack.vhd&rev=163
	function ap_slv2int (sl:std_logic_vector) return integer;
	function to_string_1 ( s : std_logic_vector ) return string;
	procedure report_error (constant str : string; sl : std_logic_vector; constant ec : real);
  procedure warning_neq_fp (a, b : in float32; info : in string := ""; use_epsilon : boolean := false);
  procedure warning_neq_fp (a : in std_logic_vector (31 downto 0); b : in real; info : in string := ""; use_epsilon : boolean := false);
  procedure warning_neq_fp (a, b : in std_logic_vector (31 downto 0); info : in string := ""; use_epsilon : boolean := false);
  procedure assertEpsilon (x, y : in real; epsilon : in real := 1.0E-5; message : in string := "");

  procedure wait_idle(signal idle : out std_logic;constant n : natural;constant clock_period : in time);
  procedure sda_start(signal sda_data : out std_logic;constant clock_period : in time);
  procedure sda_stop(signal sda_data : out std_logic;constant clock_period : in time);
  procedure sda_address_7bit(signal sda_data : out std_logic;constant address : in std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);constant address_rw : in boolean;conclock_period : in time);
  procedure sda_data_8bit(signal sda_data : out std_logic;constant data : in std_logic_vector(I2C_DATA_BITS - 1 downto 0);constant data_ack : in boolean;constant clock_period : in time);
--synthesis translate_on

end package global_package;

package body global_package is

--synthesis translate_off
	procedure report_error (constant str : string; sl : std_logic_vector; constant ec : real) is
		variable a : float32;
		variable b : float32 := to_float (ec, a);
		variable actual : real := ap_slv2fp (sl);
		variable expected : real := to_real (b);
		variable actuals,expecteds : string (1 to 13);
	begin
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
	end procedure report_error;

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
    variable frc:integer;
    alias s: std_logic_vector(31 downto 0) is sl;
    variable f,expo: real;
  begin
    expo:=real(ap_slv2int(s(30 downto 23)) - 127);
    expo:=(2.0)**(expo);
    frc:=ap_slv2int('1'&s(22 downto 0));
    f:=real(frc)*(2.0**(-23.0));
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

  procedure assertEpsilon (x, y : in real; epsilon : in real := 1.0E-5; message : in string := "") is
    variable vabs : real := 0.0;
  begin
    vabs := abs (x - y);
    assert     (vabs < epsilon) report message & " " & real'image (epsilon) & " <  " & real'image (vabs) severity note;
    assert not (vabs < epsilon) report message & " " & real'image (epsilon) & " >= " & real'image (vabs) severity warning;
  end procedure assertEpsilon;

  procedure warning_neq_fp (a, b : in float32; info : in string := ""; use_epsilon : boolean := false) is
    variable src : float32 := a;
    variable dst : float32 := b;
    variable dif : float32;
    constant epsilon : real := 1.0E-02;
  begin
    dif := abs (dst - src);
    if (use_epsilon = true) then
      if (dif >= epsilon) then
        assert not (src = dst) report info & HT & " current == expected " & HT & real'image (to_real(src)) & " == " & real'image (to_real(dst)) & HT & to_hex_string(src) & " == " & (to_hex_string(dst)) severity note;
        assert     (src = dst) report info & HT & " current /= expected " & HT & real'image (to_real(src)) & " /= " & real'image (to_real(dst)) & HT & to_hex_string(src) & " /= " & (to_hex_string(dst)) & HT & "differ > epsilon : " & real'image (to_real(dif)) & " > " & real'image (epsilon) severity warning;
      end if;
    else
      assert not (src = dst) report info & HT & " current == expected " & HT & real'image (to_real(src)) & " == " & real'image (to_real(dst)) & HT & to_hex_string(src) & " == " & (to_hex_string(dst)) severity note;
      assert     (src = dst) report info & HT & " current /= expected " & HT & real'image (to_real(src)) & " /= " & real'image (to_real(dst)) & HT & to_hex_string(src) & " /= " & (to_hex_string(dst)) & HT & "differ : " & real'image (to_real(dif)) severity warning;
    end if;
    --assert not (ieee.math_real.round(to_real(src)) = ieee.math_real.round(to_real(dst))) report info & HT & " current == expected " & HT & real'image (to_real(src)) & " == " & real'image (to_real(dst)) & HT & to_hex_string(src) & " == " & (to_hex_string(dst)) severity note;
    --assert     (ieee.math_real.round(to_real(src)) = ieee.math_real.round(to_real(dst))) report info & HT & " current /= expected " & HT & real'image (to_real(src)) & " /= " & real'image (to_real(dst)) & HT & to_hex_string(src) & " /= " & (to_hex_string(dst)) severity warning;
    --assertEpsilon (to_real(src), to_real(dst), 1.0E-2, info);
  end procedure;

  procedure warning_neq_fp (a : in std_logic_vector (31 downto 0); b : in real; info : in string := ""; use_epsilon : boolean := false) is
  begin
    warning_neq_fp (to_float (a), to_float (b), info, use_epsilon);
  end procedure;

  procedure warning_neq_fp (a, b : in std_logic_vector (31 downto 0); info : in string := ""; use_epsilon : boolean := false) is
  begin
    warning_neq_fp (to_float (a), to_float (b), info, use_epsilon);
  end procedure;
--synthesis translate_on

--synthesis translate_off
procedure wait_idle(
	signal idle : out std_logic;
	constant n : natural;
	constant clock_period : in time
) is
begin
	idle <= '1';
	wait for n * clock_period * I2C_STRETCH;
	idle <= '0';
end wait_idle;

procedure sda_start(
	signal sda_data : out std_logic;
	constant clock_period : in time
) is
	variable scl_clock_period : time := clock_period / I2C_CLOCK_DIVIDER;
begin
	sda_data <= '0'; wait for 2 * scl_clock_period * I2C_STRETCH;
end procedure sda_start;

procedure sda_stop(
	signal sda_data : out std_logic;
	constant clock_period : in time
) is
	variable scl_clock_period : time := clock_period / I2C_CLOCK_DIVIDER;
begin
	sda_data <= '0'; wait for 2 * scl_clock_period * I2C_STRETCH;
end procedure sda_stop;

procedure sda_address_7bit(
	signal sda_data : out std_logic;
	constant address : in std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
	constant address_rw : in boolean;
	constant clock_period : in time
) is
	variable index : natural range 0 to I2C_ADDRESS_BITS - 1 := 0;
begin
	l0 : for i in address'range loop
		sda_data <= address(i); wait for clock_period * I2C_STRETCH;
	end loop l0;
	-- 1bit write
	sda_data <= To_Std_Logic(address_rw); wait for clock_period * I2C_STRETCH;
	-- 1bit ack
	sda_data <= '0'; wait for clock_period * I2C_STRETCH;
end procedure sda_address_7bit;

procedure sda_data_8bit(
	signal sda_data : out std_logic;
	constant data : in std_logic_vector(I2C_DATA_BITS - 1 downto 0);
	constant data_ack : in boolean;
	constant clock_period : in time
) is
	variable index : natural range 0 to I2C_DATA_BITS - 1 := 0;
begin
	l0 : for i in data'range loop
		sda_data <= data(i); wait for clock_period * I2C_STRETCH;
	end loop l0;
	-- 1bit ack
	sda_data <= To_Std_Logic(data_ack); wait for clock_period * I2C_STRETCH;
end procedure sda_data_8bit;

function To_Std_Logic(L: BOOLEAN) return std_ulogic is
begin
	if L then
		return('1');
	else
		return('0');
	end if;
end function To_Std_Logic;

function To_Std_Logic(L: character) return boolean is
begin
	if character'pos(L) = 49 then -- L '1'
		return true;
	end if;
	if character'pos(L) = 48 then -- L '0'
		return false;
	end if;
	return false;
end function To_Std_Logic;

function int2hex(L: character) return natural is
	constant value : natural := character'pos(L);
begin
	if (value >= character'pos('0') and value <= character'pos('9')) then
		return value - character'pos('0');
	end if;
	if (value >= character'pos('A') and value <= character'pos('F')) then
		return value - character'pos('A') + 10;
	end if;
	if (value >= character'pos('a') and value <= character'pos('f')) then
		return value - character'pos('a') + 10;
	end if;
	return 0;
end function int2hex;
--synthesis translate_on

end package body global_package;

