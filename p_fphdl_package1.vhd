library IEEE,ieee_proposed;
use IEEE.STD_LOGIC_1164.all;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;

package p_fphdl_package1 is

	procedure report_fixed_value (
		constant mes : in string;
		actual : in sfixed
	);

	procedure report_fixed_value (
		constant mes : in string;
		actual : in ufixed
	);

	procedure report_error (
		constant errmes : in string;
		actual : in sfixed;
		constant expected : in sfixed
	);

	procedure report_fixed_value (
		constant mes : in string;
		actual : in sfixed;
		hi : in integer;
		lo : in integer
	);

	constant FP_BITS : integer := 44;
	subtype st_in1_slv is std_logic_vector (FP_BITS-1 downto 0);
	subtype st_in2_slv is std_logic_vector (FP_BITS-1 downto 0);
	subtype st_out_slv is std_logic_vector (FP_BITS-1 downto 0);
	subtype st_in1_sfixed is sfixed (FP_BITS-1 downto 0);
	subtype st_in2_sfixed is sfixed (FP_BITS-1 downto 0);
	subtype st_out_sfixed is sfixed (FP_BITS-1 downto 0);
	shared variable a : st_in1_sfixed;
	shared variable b : st_in2_sfixed;
	shared variable c : st_out_sfixed;
	constant sfixed_add_hi : integer := sfixed_high (a,'+',b);
	constant sfixed_add_lo : integer := sfixed_low  (a,'+',b);
	constant sfixed_sub_hi : integer := sfixed_high (a,'-',b);
	constant sfixed_sub_lo : integer := sfixed_low  (a,'-',b);
	constant sfixed_mul_hi : integer := sfixed_high (a,'*',b);
	constant sfixed_mul_lo : integer := sfixed_low  (a,'*',b);
	constant sfixed_div_hi : integer := sfixed_high (a,'/',b);
	constant sfixed_div_lo : integer := sfixed_low  (a,'/',b);

--	at 100 ns: Note: fp_add_hi : 44 (/tb_p_fphdl_package1/).
--	at 100 ns: Note: fp_add_lo : 0 (/tb_p_fphdl_package1/).
--	at 100 ns: Note: fp_sub_hi : 44 (/tb_p_fphdl_package1/).
--	at 100 ns: Note: fp_sub_lo : 0 (/tb_p_fphdl_package1/).
--	at 100 ns: Note: fp_mul_hi : 87 (/tb_p_fphdl_package1/).
--	at 100 ns: Note: fp_mul_lo : 0 (/tb_p_fphdl_package1/).
--	at 100 ns: Note: fp_div_hi : 44 (/tb_p_fphdl_package1/).
--	at 100 ns: Note: fp_div_lo : -43 (/tb_p_fphdl_package1/).

	subtype st_sfixed_add is sfixed (sfixed_high(a,'+',b) downto sfixed_low(a,'+',b));
	subtype st_sfixed_sub is sfixed (sfixed_high(a,'-',b) downto sfixed_low(a,'-',b));
	subtype st_sfixed_mul is sfixed (sfixed_high(a,'*',b) downto sfixed_low(a,'*',b));
	subtype st_sfixed_div is sfixed (sfixed_high(a,'/',b) downto sfixed_low(a,'/',b));

	subtype st_sfixed_max is st_sfixed_div;
	subtype sfixed1 is sfixed (1 downto 0);
	subtype ufixed1 is ufixed (1 downto 0);
	subtype sfixed2 is sfixed (2 downto 0);
	subtype ufixed2 is ufixed (2 downto 0);
	subtype sfixed3 is sfixed (3 downto 0);
	subtype ufixed3 is ufixed (3 downto 0);
	subtype sfixed4 is sfixed (4 downto 0);
	subtype ufixed4 is ufixed (4 downto 0);
	subtype sfixed5 is sfixed (5 downto 0);
	subtype ufixed5 is ufixed (5 downto 0);
	subtype sfixed6 is sfixed (6 downto 0);
	subtype ufixed6 is ufixed (6 downto 0);
	subtype sfixed7 is sfixed (7 downto 0);
	subtype ufixed7 is ufixed (7 downto 0);
	subtype sfixed8 is sfixed (8 downto 0);
	subtype ufixed8 is ufixed (8 downto 0);
	subtype sfixed9 is sfixed (9 downto 0);
	subtype ufixed9 is ufixed (9 downto 0);
	subtype sfixed10 is sfixed (10 downto 0);
	subtype ufixed10 is ufixed (10 downto 0);
	subtype sfixed15 is sfixed (15 downto 0); 
	subtype ufixed15 is ufixed (15 downto 0);
	subtype sfixed16 is sfixed (16 downto 0); 
	subtype ufixed16 is ufixed (16 downto 0);

	type states is (
	idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,
	s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,
	s33,s34,s35,s36,s37,s38,s39,s40,s41,s42,s43,s44,s45,s46,s47,s48,
	s49,s50,s51,s52,s53,s54,s55,s56,s57,s58,s59,s60,s61,s62,s63,s64,
	s65,s66,s67,s68,s69,s70,s71,s72,s73,s74,s75,s76,s77,s78,s79,s80,
	s81,s82,s83,s84,s85,s86,s87,s88,s89,s90,s91,s92,s93,s94,s95,s96,s97,s98,s99,s100,
	s101,s102,s103,s104,s105,s106,s107,s108,s109,s110,s111,
	w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,
	w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,
	w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43,w44,w45,w46,w47,w48,
	w49,w50,w51,w52,w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,w63,w64,
	w65,w66,w67,w68,w69,w70,w71,w72,w73,w74,w75,w76,w77,w78,w79,w80,
	w81,w82,w83,w84,w85,w86,w87,w88,w89,w90,w91,w92,w93,w94,w95,w96,w97,w98,w99,w100,
	w101,w102,w103,w104,w105,w106,w107,w108,w109,w110,w111,
	ending
	);

end p_fphdl_package1;

package body p_fphdl_package1 is

	procedure report_fixed_value (constant mes : in string; actual : in sfixed) is begin
		report 
		mes &
		CR &
		real'image(to_real(actual)) &
		" ( " &
		to_string(actual) &
		" " &
		to_hstring(actual) &
		" ) " 
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

end p_fphdl_package1;
