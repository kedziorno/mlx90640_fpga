-- Synthesis test for the fixed point math package
-- This test is designed to be synthesizable and exercise much of the package.
-- Created for vhdl-200x by David Bishop (dbishop@vhdl.org)
-- --------------------------------------------------------------------
--   modification history : Last Modified $Date: 2006-06-08 10:49:35-04 $
--   Version $Id: fixed_synth.vhdl,v 1.1 2006-06-08 10:49:35-04 l435385 Exp $
-- --------------------------------------------------------------------


library ieee, ieee_proposed;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use work.p_fphdl_package1.all;

entity fixed_synth_add is
  
  port (
    in1, in2   : in  STD_LOGIC_VECTOR (FP_BITS-1 downto 0);  -- inputs
    out1       : out STD_LOGIC_VECTOR (FP_BITS-1 downto 0);  -- output
    clk, rst_n : in  STD_ULOGIC);                     -- clk and reset

end entity fixed_synth_add;

architecture rtl of fixed_synth_add is
begin  -- architecture rtl

  cmd0reg : process (clk, rst_n) is
		subtype sf_integer is integer range -256 to 255;
		subtype sfixed_subtype is st_sfixed_max;
    variable in1array, in2array : sfixed_subtype;  -- array for input
    variable sfh : sf_integer := SFixed_high (in1array, '+', in2array);
		variable sfl : sf_integer := SFixed_low  (in1array, '+', in2array);
    variable in1pin2 : sfixed (sfh downto sfl);
  begin  -- process cmd0reg
    if rst_n = '1' then                      -- asynchronous reset (active low)
      out1 <= (others => '0');
    elsif rising_edge(clk) then              -- rising clock edge
			in1array := to_sfixed (in1, in1array);
			in2array := to_sfixed (in2, in2array);
      in1pin2  := in1array + in2array;
      out1 <= to_slv (resize (in1pin2, in1array));
    end if;
  end process cmd0reg;

end architecture rtl;
