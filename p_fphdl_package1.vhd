library IEEE,ieee_proposed;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.numeric_std_additions.all;
--use ieee_proposed.standard_additions.all;
--use ieee_proposed.standard_textio_additions.all;
--use ieee_proposed.std_logic_1164_additions.all;

package p_fphdl_package1 is

	constant FP_INTEGER : integer := 35; -- FP_INTEGER-1 to 0
	constant FP_FRACTION : integer := 29; -- -1 to -FP_FRACTION
	constant FP_INTEGER_EXPECTED : integer := 35; -- FP_INTEGER_EXPECTED-1 to 0
	constant FP_FRACTION_EXPECTED : integer := 64; -- -1 to -FP_FRACTION_EXPECTED
	constant FP_BITS : integer := FP_INTEGER + FP_FRACTION;
	subtype st_in1_slv is std_logic_vector (FP_BITS-1 downto 0);
	subtype st_in2_slv is std_logic_vector (FP_BITS-1 downto 0);
	subtype st_out_slv is std_logic_vector (FP_BITS-1 downto 0);
	subtype st_in1_sfixed is sfixed (FP_INTEGER-1 downto -FP_FRACTION);
	subtype st_in2_sfixed is sfixed (FP_INTEGER-1 downto -FP_FRACTION);
	subtype st_out_sfixed is sfixed (FP_INTEGER-1 downto -FP_FRACTION);
--	shared variable a : st_in1_sfixed;
--	shared variable b : st_in2_sfixed;
--	shared variable c : st_out_sfixed;
--	constant sfixed_add_hi : integer := sfixed_high (a,'+',b);
--	constant sfixed_add_lo : integer := sfixed_low  (a,'+',b);
--	constant sfixed_sub_hi : integer := sfixed_high (a,'-',b);
--	constant sfixed_sub_lo : integer := sfixed_low  (a,'-',b);
--	constant sfixed_mul_hi : integer := sfixed_high (a,'*',b);
--	constant sfixed_mul_lo : integer := sfixed_low  (a,'*',b);
--	constant sfixed_div_hi : integer := sfixed_high (a,'/',b);
--	constant sfixed_div_lo : integer := sfixed_low  (a,'/',b);

--	subtype st_sfixed_add is sfixed (sfixed_high(a,'+',b) downto sfixed_low(a,'+',b));
--	subtype st_sfixed_sub is sfixed (sfixed_high(a,'-',b) downto sfixed_low(a,'-',b));
--	subtype st_sfixed_mul is sfixed (sfixed_high(a,'*',b) downto sfixed_low(a,'*',b));
--	subtype st_sfixed_div is sfixed (sfixed_high(a,'/',b) downto sfixed_low(a,'/',b));

	subtype st_sfixed_max is sfixed (FP_INTEGER-1 downto -FP_FRACTION);
	subtype st_ufixed_max is ufixed (FP_INTEGER-1 downto -FP_FRACTION);
	subtype fracas is sfixed (FP_INTEGER-1 downto 0);
	subtype fracbs is sfixed (-1 downto -FP_FRACTION);
	subtype fracau is ufixed (FP_INTEGER-1 downto 0);
	subtype fracbu is ufixed (-1 downto -FP_FRACTION);
	constant fracas_const0 : fracas := (others => '0');
	constant fracbs_const0 : fracbs := (others => '0');

	subtype st_sfixed_max_expected is sfixed (FP_INTEGER_EXPECTED-1 downto -FP_FRACTION_EXPECTED);
	subtype st_ufixed_max_expected is ufixed (FP_INTEGER_EXPECTED-1 downto -FP_FRACTION_EXPECTED);
	subtype st_sfixed_h1 is sfixed (FP_BITS/2 downto 1);
	subtype st_sfixed_h2 is sfixed (0 downto -FP_BITS/2+1);
	subtype sfixed1 is sfixed (0 downto 0);
	subtype ufixed1 is ufixed (0 downto 0);
	subtype sfixed2 is sfixed (1 downto 0);
	subtype ufixed2 is ufixed (1 downto 0);
	subtype sfixed3 is sfixed (2 downto 0);
	subtype ufixed3 is ufixed (2 downto 0);
	subtype sfixed4 is sfixed (3 downto 0);
	subtype ufixed4 is ufixed (3 downto 0);
	subtype sfixed5 is sfixed (4 downto 0);
	subtype ufixed5 is ufixed (4 downto 0);
	subtype sfixed6 is sfixed (5 downto 0);
	subtype ufixed6 is ufixed (5 downto 0);
	subtype sfixed7 is sfixed (6 downto 0);
	subtype ufixed7 is ufixed (6 downto 0);
	subtype sfixed8 is sfixed (7 downto 0);
	subtype ufixed8 is ufixed (7 downto 0);
	subtype sfixed9 is sfixed (8 downto 0);
	subtype ufixed9 is ufixed (8 downto 0);
	subtype sfixed10 is sfixed (9 downto 0);
	subtype ufixed10 is ufixed (9 downto 0);
	subtype sfixed11 is sfixed (10 downto 0);
	subtype ufixed11 is ufixed (10 downto 0);
	subtype sfixed12 is sfixed (11 downto 0);
	subtype ufixed12 is ufixed (11 downto 0);
	subtype sfixed13 is sfixed (12 downto 0);
	subtype ufixed13 is ufixed (12 downto 0);
	subtype sfixed14 is sfixed (13 downto 0);
	subtype ufixed14 is ufixed (13 downto 0);
	subtype sfixed15 is sfixed (14 downto 0);
	subtype ufixed15 is ufixed (14 downto 0);
	subtype sfixed16 is sfixed (15 downto 0); 
	subtype ufixed16 is ufixed (15 downto 0);
	subtype slv1 is std_logic_vector (0 downto 0);
	subtype slv2 is std_logic_vector (1 downto 0);
	subtype slv3 is std_logic_vector (2 downto 0);
	subtype slv4 is std_logic_vector (3 downto 0);
	subtype slv5 is std_logic_vector (4 downto 0);
	subtype slv6 is std_logic_vector (5 downto 0);
	subtype slv7 is std_logic_vector (6 downto 0);
	subtype slv8 is std_logic_vector (7 downto 0);
	subtype slv9 is std_logic_vector (8 downto 0);
	subtype slv10 is std_logic_vector (9 downto 0);
	subtype slv11 is std_logic_vector (10 downto 0);
	subtype slv12 is std_logic_vector (11 downto 0);
	subtype slv13 is std_logic_vector (12 downto 0);
	subtype slv14 is std_logic_vector (13 downto 0);
	subtype slv15 is std_logic_vector (14 downto 0);
	subtype slv16 is std_logic_vector (15 downto 0);
	subtype fd2ft is std_logic_vector (31 downto 0);

end p_fphdl_package1;

package body p_fphdl_package1 is
end p_fphdl_package1;
