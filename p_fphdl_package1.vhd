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

	subtype st_sfixed_max is sfixed (FP_INTEGER-1 downto -FP_FRACTION);
	subtype st_ufixed_max is ufixed (FP_INTEGER-1 downto -FP_FRACTION);
	subtype fracas is sfixed (FP_INTEGER-1 downto 0);
	subtype fracbs is sfixed (-1 downto -FP_FRACTION);
	subtype fracau is ufixed (FP_INTEGER-1 downto 0);
	subtype fracbu is ufixed (-1 downto -FP_FRACTION);

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
	s151,s152,s153,s154,s155,s156,s157,s158,s159,s160,s161,s162,s163,s164,s165,s166,s167,s168,s169,s170,
	s171,s172,s173,s174,s175,s176,s177,s178,s179,s180,s181,s182,s183,s184,s185,s186,s187,s188,s189,s190,
	s191,s192,s193,s194,s195,s196,s197,s198,s199,s200,s201,s202,s203,s204,s205,s206,s207,s208,s209,s210,
	s211,s212,s213,s214,s215,s216,s217,s218,s219,s220,s221,s222,s223,s224,s225,s226,s227,s228,s229,s230,
	s231,s232,s233,s234,s235,s236,s237,s238,s239,s240,s241,s242,s243,s244,s245,s246,s247,s248,s249,s250,
	s251,s252,s253,s254,s255,s256,s257,s258,s259,s260,s261,s262,s263,s264,s265,s266,s267,s268,s269,s270,
	s271,s272,s273,s274,s275,s276,s277,s278,s279,s280,s281,s282,s283,s284,s285,s286,s287,s288,s289,s290,
	s291,s292,s293,s294,s295,s296,s297,s298,s299,s300,s301,s302,s303,s304,s305,s306,s307,s308,s309,s310,
	s311,s312,s313,s314,s315,s316,s317,s318,s319,s320,s321,s322,s323,s324,s325,s326,s327,s328,s329,s330,
	s331,s332,s333,s334,s335,s336,s337,s338,s339,s340,s341,s342,s343,s344,s345,s346,s347,s348,s349,s350,
	s351,s352,s353,s354,s355,s356,s357,s358,s359,s360,s361,s362,s363,s364,s365,s366,s367,s368,s369,s370,
	s371,s372,s373,s374,s375,s376,s377,s378,s379,s380,s381,s382,s383,s384,s385,s386,s387
	);

end p_fphdl_package1;

package body p_fphdl_package1 is
end p_fphdl_package1;
