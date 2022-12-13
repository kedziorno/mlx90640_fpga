library IEEE;
use IEEE.STD_LOGIC_1164.all;

package p_package1_constants is

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
constant C_DATA_SIZE : integer := 1664; -- number bytes from i2c

-- XXX https://comp.lang.vhdl.narkive.com/B8UInWjr/convert-boolean-to-std-logic
function To_Std_Logic(L: BOOLEAN) return std_ulogic;

function To_Std_Logic(L: character) return boolean;

function int2hex(L: character) return natural;

end p_package1_constants;

package body p_package1_constants is

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

end p_package1_constants;
