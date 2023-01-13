library IEEE,ieee_proposed;
use IEEE.STD_LOGIC_1164.all;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.numeric_std_additions.all;
--use ieee_proposed.standard_additions.all;
--use ieee_proposed.standard_textio_additions.all;
--use ieee_proposed.std_logic_1164_additions.all;

package p_fphdl_package1 is

	procedure report_fixed_value (
		constant mes : in string;
		actual : in sfixed
	);

	procedure report_fixed_value (
		constant mes : in string;
		actual : in ufixed
	);

	procedure report_fixed_value (
		constant mes : in string;
		actual : in sfixed;
		hi : in integer;
		lo : in integer
	);

	procedure report_error (
		constant errmes : in string;
		actual : in sfixed;
		constant expected : in sfixed
	);

	procedure report_error (
		constant errmes : in string;
		actual : in ufixed;
		constant expected : in ufixed
	);

--	constant FP_BITS : integer := 19; -- xxx for synthesis
	constant FP_BITS : integer := 64; -- xxx for simulation
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

	subtype st_sfixed_add is sfixed (sfixed_high(a,'+',b) downto sfixed_low(a,'+',b));
	subtype st_sfixed_sub is sfixed (sfixed_high(a,'-',b) downto sfixed_low(a,'-',b));
	subtype st_sfixed_mul is sfixed (sfixed_high(a,'*',b) downto sfixed_low(a,'*',b));
	subtype st_sfixed_div is sfixed (sfixed_high(a,'/',b) downto sfixed_low(a,'/',b));

	subtype st_sfixed_max is sfixed (sfixed_div_hi/2 downto sfixed_div_lo/2);
	subtype st_ufixed_max is ufixed (sfixed_div_hi/2 downto sfixed_div_lo/2);
	subtype st_sfixed_h1 is sfixed (FP_BITS/2 downto 1);
	subtype st_sfixed_h2 is sfixed (0 downto -FP_BITS/2+1);
	subtype sfixed0 is sfixed (0 downto 0);
	subtype ufixed0 is ufixed (0 downto 0);
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
	s112,s113,s114,s115,s116,s117,s118,s119,s120,s121,s122,s123,s124,s125,s126,s127,s128,s129,s130,
	s131,s132,s133,s134,s135,s136,s137,s138,s139,s140,s141,s142,s143,s144,s145,s146,s147,s148,s149,s150,
	w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,
	w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,
	w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43,w44,w45,w46,w47,w48,
	w49,w50,w51,w52,w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,w63,w64,
	w65,w66,w67,w68,w69,w70,w71,w72,w73,w74,w75,w76,w77,w78,w79,w80,
	w81,w82,w83,w84,w85,w86,w87,w88,w89,w90,w91,w92,w93,w94,w95,w96,w97,w98,w99,w100,
	w101,w102,w103,w104,w105,w106,w107,w108,w109,w110,w111,
	w112,w113,w114,w115,w116,w117,w118,w119,w120,w121,w122,w123,w124,w125,w126,w127,w128,w129,w130,
	w131,w132,w133,w134,w135,w136,w137,w138,w139,w140,w141,w142,w143,w144,w145,w146,w147,w148,w149,w150,
	ending
	);

end p_fphdl_package1;

package body p_fphdl_package1 is

	procedure report_fixed_value (constant mes : in string; actual : in sfixed) is begin
--		report mes & CR &
--		real'image(to_real(actual)) &
--		" ( " &
--		to_string(actual) &
--		" " &
--		to_hstring(actual) &
--		" ) " severity note;
--		return;
	end procedure report_fixed_value;

	procedure report_fixed_value (
		constant mes : in string;
		actual : in ufixed
	) is
	begin
--		report mes & CR
--		& real'image(to_real(actual))
--		& " ( "
--		& to_string(actual)
--		& " "
--		& to_hstring(actual)
--		& " ) " severity note;
--		return;
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
--		report mes & CR
--		& real'image(to_real(resize(actual,hi,lo)))
--		& " ( "
--		& to_string(actual)
--		& " "
--		& to_hstring(actual)
--		& " ) " severity note;
--		return;
	end procedure report_fixed_value;

	procedure report_error (constant errmes : in string; actual : in sfixed; constant expected : in sfixed) is
	begin
--		assert actual = expected report errmes & CR
--		& "Actual: " & to_string(actual)
--		& " (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR
--		& "     /= " & to_string(expected)
--		& " (" & real'image(to_real(expected)) & ")" & HT & "(" & to_hstring(expected) & ") " severity note;
--		return;
	end procedure report_error;

	procedure report_error (constant errmes : in string; actual : in ufixed; constant expected : in ufixed) is
	begin
--		assert actual = expected report errmes & CR
--		& "Actual: " & to_string(actual)
--		& " (" & real'image(to_real(actual)) & ")" & HT & "(" & to_hstring(actual) & ") " & CR
--		& "     /= " & to_string(expected)
--		& " (" & real'image(to_real(expected)) & ")" & HT & "(" & to_hstring(expected) & ") " severity note;
--		return;
	end procedure report_error;

end p_fphdl_package1;
