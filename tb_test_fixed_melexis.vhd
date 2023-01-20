-- TestBench Template 

LIBRARY ieee,ieee_proposed;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.numeric_std_additions.all;
use ieee_proposed.standard_additions.all;
--use ieee_proposed.standard_textio_additions.all;
use ieee_proposed.std_logic_1164_additions.all;

USE work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

ENTITY tb_test_fixed_melexis IS
END tb_test_fixed_melexis;

ARCHITECTURE arch OF tb_test_fixed_melexis IS

-- Component Declaration
component test_fixed_melexis is
generic (
G_C_WAIT1 : integer := 0
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2433 : in slv16;
i_ram0x072a : in slv16;
i_ee0x2438 : in slv16;
i_ram0x800d : in slv16;
i_ee0x2432 : in slv16;
i_ee0x2431 : in slv16;
i_ee0x2410 : in slv16;
i_ram0x0720 : in slv16;
i_ram0x0700 : in slv16;
i_ram0x070a : in slv16;
i_ee0x2430 : in slv16;
i_ram0x056f : in slv16; -- pxdata12,16
i_ee0x2411 : in slv16;
i_ee0x2414 : in slv16;
i_ee0x241b : in slv16;
i_ee0x25af : in slv16;
i_ee0x2437 : in slv16;
i_ee0x2434 : in slv16;
i_ram0x0708 : in slv16;
i_ram0x0728 : in slv16;
i_ee0x243a : in slv16;
i_ee0x243b : in slv16;
i_ee0x243c : in slv16;
i_ee0x2439 : in slv16;
i_ee0x2420 : in slv16;
i_ee0x2421 : in slv16;
i_ee0x2424 : in slv16;
i_ee0x242b : in slv16;
i_ee0x258f : in slv16;
i_ee0x243d : in slv16;
i_ee0x243f : in slv16;
i_pixelpattern : in slv10;
o_out1 : out fd2ft;
o_rdy : out std_logic;
o_out2 : out st_sfixed_max;
o_out3 : out st_ufixed_max
);
end component test_fixed_melexis;

SIGNAL i_clock :  std_logic;
SIGNAL i_reset :  std_logic;
SIGNAL i_run :  std_logic;
SIGNAL o_out1 :  fd2ft;
SIGNAL o_rdy,o_rdyp :  std_logic;
SIGNAL o_out2 : st_sfixed_max;
SIGNAL o_out3 : st_ufixed_max;

constant clock_period : time := 500 ns;
constant G_C_WAIT1 : integer := 16;

signal out1r : real;
signal out2r_s,out2r_u : real;

BEGIN

out1r <= ap_slv2fp (o_out1);
out2r_s <= to_real (o_out2);
out2r_u <= to_real (o_out3);

-- Component Instantiation
uut : test_fixed_melexis 
generic map (
G_C_WAIT1 => G_C_WAIT1
)
port map (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
i_ee0x2433 => x"9d68",
i_ee0x2438 => x"2363",
i_ram0x072a => x"ccc5",
i_ram0x800d => x"1901",
i_ee0x2432 => x"5952",
i_ee0x2431 => x"2ff1",
i_ee0x2410 => x"4210",
i_ram0x0720 => x"06af",
i_ram0x0700 => x"4bf2",
i_ram0x070a => x"1881",
i_ee0x2430 => x"18ef",
i_ram0x056f => x"0261",
i_ee0x2411 => x"ffbb",
i_ee0x2414 => x"f2f2",
i_ee0x241b => x"e0ef",
i_ee0x25af => x"08a0",
i_ee0x2437 => x"5354",
i_ee0x2434 => x"5454",
i_ram0x0708 => x"ffca",
i_ram0x0728 => x"ffc8",
i_ee0x243a => x"fbb5",
i_ee0x243b => x"044b",
i_ee0x243c => x"f020",
i_ee0x2439 => x"e446",
i_ee0x2420 => x"79a6",
i_ee0x2421 => x"2f44",
i_ee0x2424 => x"3333",
i_ee0x242b => x"3333",
i_ee0x258f => x"08a0",
i_ee0x243d => x"9797",
i_ee0x243f => x"2889",
i_pixelpattern => std_logic_vector (to_unsigned (368, 10)), -- px 12,16
o_out1 => o_out1,
o_rdy => o_rdy,
o_out2 => o_out2
);

cp : process
begin
	i_clock <= '0';
	wait for clock_period/2;
	i_clock <= '1';
	wait for clock_period/2;
end process cp;

tb1 : process (i_clock) is
	type states is (
	s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37,s38,s39,s40,
	s41,s42,s43,s44,s45,s46,s47,s48,s49,s50,s51,s52,s53,s54,s55,s56,s57,s58,s59,s60,
	s61,s62,s63,s64,s65,s66,s67,s68,s69,s70,s71,s72,s73,s74,s75,s76,s77,s78,s79,s80,
	s81,s82,s83,s84,s85,s86,s87,s88,s89,s90,s91,s92,s93,s94,s95,s96,s97,s98,s99,s100,
	s101,s102,s103,s104,s105,s106,s107,s108,s109,s110,s111,s112,s113,s114,s115,s116,s117,s118,s119,s120);
	variable state : states;
	variable vout : fd2ft;
begin
	if (i_reset = '1') then
		state := s0;
		vout := (others => '0');
	elsif rising_edge(i_clock) then
		o_rdyp <= o_rdy;
		vout := o_out1;
		if (o_rdyp = '0' and o_rdy = '1') then
--			report_error_normalize ("sfixed", o_out2, to_sfixed (0.0, st_sfixed_max_expected'high, st_sfixed_max_expected'low));
			case (state) is
				when s0 => state := s1;      report_error (vout, 0.0);
				when s1 => state := s2;      report_error (vout, -3168.0); -- kvdd
				when s2 => state := s3;      report_error (vout, 256.0); -- const
				when s3 => state := s4;      report_error (vout, 32.0); -- const
				when s4 => state := s5;      report_error (vout, 8192.0); -- const
				when s5 => state := s6;      report_error (vout, 104.0); -- vdd25
				when s6 => state := s7;      report_error (vout, -152.0); -- vdd25
				when s7 => state := s8;      report_error (vout, -4864.0); -- vdd25
				when s8 => state := s9;      report_error (vout, -13056.0); -- vdd25
				when s9 => state := s10;     report_error (vout, 4.0); -- resee
				when s10 => state := s11;    report_error (vout, 4.0); -- resreg
				when s11 => state := s12;    report_error (vout, 1.0); -- rescorr
				when s12 => state := s13;    report_error (vout, 22.0); -- kvptat
				when s13 => state := s14;    report_error (vout, 4096.0); -- const
				when s14 => state := s15;    report_error (vout, 0.00537109375); -- kvptat 0.005371094
				when s15 => state := s16;    report_error (vout, 338.0); -- ktptat
				when s16 => state := s17;    report_error (vout, 8.0); -- const
				when s17 => state := s18;    report_error (vout, 42.25); -- ktptat
				when s18 => state := s19;    report_error (vout, -13115.0); -- ram0x072a
				when s19 => state := s20;    report_error (vout, -59.0); -- deltaV
				when s20 => state := s21;    report_error (vout, 0.01862373761832714); -- deltaV 0.018623737
				when s21 => state := s22;    report_error (vout, 3.299999952316284); -- 3.3v
				when s22 => state := s23;    report_error (vout, 3.3186237812042236); -- vdd 3.31862373761832714
				when s23 => state := s24;    report_error (vout, 12273.0); -- vptat25
				when s24 => state := s25;    report_error (vout, 1711.0); -- vptat
				when s25 => state := s26;    report_error (vout, 19442.0); -- vbe
				when s26 => state := s27;    report_error (vout, 4.0); -- alphaptatee
				when s27 => state := s28;    report_error (vout, 4.0); -- const
				when s28 => state := s29;    report_error (vout, 8.0); -- const
				when s29 => state := s30;    report_error (vout, 1.0); -- alphaptatee
				when s30 => state := s31;    report_error (vout, 9.0); -- alphaptat
				when s31 => state := s32;    report_error (vout, 2.0**18); -- const
				when s32 => state := s33;    report_error (vout, 1711.0*9.0); -- vptatart
				when s33 => state := s34;    report_error (vout, (1711.0*9.0)+19442.0); -- vptatart
				when s34 => state := s35;    report_error (vout, 0.04910880699753761); -- vptatart (1711.0/((1711.0*9.0)+19442.0))
				when s35 => state := s36;    report_error (vout, 12873.5791015625); -- vptatart 12873.57952 = (1711.0/((1711.0*9.0)+19442.0))*2.0**18
				when s36 => state := s37;    report_error (vout, 1.0); -- const
				when s37 => state := s38;    report_error (vout, 25.0); -- const
				when s38 => state := s39;    report_error (vout, 0.0001000298434519209); -- Ta 0.00537109375*0.01862373761832714
				when s39 => state := s40;    report_error (vout, 1.000100016593933); -- Ta 1.0+(0.00537109375*0.01862373761832714)
				when s40 => state := s41;    report_error (vout, 12872.2919921875); -- Ta 12873.57952/(1.0+(0.00537109375*0.01862373761832714))
				when s41 => state := s42;    report_error (vout, 599.2919921875); -- Ta (12873.57952/(1.0+(0.00537109375*0.01862373761832714)))-12273.0
				when s42 => state := s43;    report_error (vout, 14.184426307678223); -- Ta (((12873.57952/(1.0+(0.00537109375*0.01862373761832714)))-12273.0)/42.25)
				when s43 => state := s44;    report_error (vout, 39.184425354003906); -- Ta ~39.184 = (((12873.57952/(1.0+(0.00537109375*0.01862373761832714)))-12273.0)/42.25)+25.0
				when s44 => state := s45;    report_error (vout, 6273.0); -- ram0x070a
				when s45 => state := s46;    report_error (vout, 6383.0); -- ee0x2430
				when s46 => state := s47;    report_error (vout, 1.0175354480743408); -- Kgain 1.01753546947234
				when s47 => state := s48;    report_error (vout, 609.0); -- ram0x056f pxdata1216
				when s48 => state := s49;    report_error (vout, 619.6790771484375); -- pixgain1216 619.679100908656
				when s49 => state := s50;    report_error (vout, -69.0); -- offsetaverage
				when s50 => state := s51;    report_error (vout, -1.0); -- occrow12
				when s51 => state := s52;    report_error (vout, 4.0); -- 2^occscalerow
				when s52 => state := s53;    report_error (vout, -2.0); -- occcolumn16
				when s53 => state := s54;    report_error (vout, 2.0); -- 2^occscalecolumn
				when s54 => state := s55;    report_error (vout, 2.0); -- offset1216
				when s55 => state := s56;    report_error (vout, 1.0); -- 2^occscaleremnant
				when s56 => state := s57;    report_error (vout, 2.0); -- offset1216*2^occscaleremnant
				when s57 => state := s58;    report_error (vout, -4.0); -- occcolumn16*2^occscalecolumn
				when s58 => state := s59;    report_error (vout, -4.0); -- occrow12*2^occscalerow
				when s59 => state := s60;    report_error (vout, -2.0); -- offset1216*2^occscaleremnant+occcolumn16*2^occscalecolumn
				when s60 => state := s61;    report_error (vout, -6.0); -- offset1216*2^occscaleremnant+occcolumn16*2^occscalecolumn+occrow12*2^occscalerow
				when s61 => state := s62;    report_error (vout, -75.0); -- offsetaverage+offset1216*2^occscaleremnant+occcolumn16*2^occscalecolumn+occrow12*2^occscalerow
				when s62 => state := s63;    report_error (vout, 0.0); -- kta1216ee
				when s63 => state := s64;    report_error (vout, 84.0); -- ktarcee
				when s64 => state := s65;    report_error (vout, 6.0); -- ktascale1
				when s65 => state := s66;    report_error (vout, 14.0); -- ktascale1+8
				when s66 => state := s67;    report_error (vout, 3.0); -- ktascale2
				when s67 => state := s68;    report_error (vout, 2.0**14); -- 2^ktascale1+8, disappear because get from mem
				when s68 => state := s69;    report_error (vout, 2.0**3); -- 2^ktascale2, disappear because get from mem
				when s69 => state := s70;    report_error (vout, 0.0); -- kta1216ee*2^ktascale2
				when s70 => state := s71;    report_error (vout, 84.0); -- ktarcee+kta1216ee*2^ktascale2
				when s71 => state := s72;    report_error (vout, 0.005126953125); -- (ktarcee+kta1216ee*2^ktascale2)/2^ktascale1
				when s72 => state := s73;    report_error (vout, 4.0); -- kv1216ee
				when s73 => state := s74;    report_error (vout, 8.0); -- 2^kvscale, disappear because get from mem
				when s74 => state := s75;    report_error (vout, 0.5); -- kv1216
				when s75 => state := s76;    report_error (vout, (3.318623828887939453-3.3)); -- (Vdd-VddV0)
				when s76 => state := s77;    report_error (vout, 0.5*(3.318623828887939453-3.3)); -- kv1216*(Vdd-VddV0)
				when s77 => state := s78;    report_error (vout, 1.0+(0.5*(3.318623828887939453-3.3))); -- 1+(kv1216*(Vdd-VddV0))
				when s78 => state := s79;    report_error (vout, (39.184425354003906-25.0)); -- (Ta-Ta0)
				when s79 => state := s80;    report_error (vout, (0.005126953125*(39.184425354003906-25.0))); -- kta1216*(Ta-Ta0)
				when s80 => state := s81;    report_error (vout, 1.0+(0.005126953125*(39.184425354003906-25.0))); -- 1+kta1216*(Ta-Ta0)
				when s81 => state := s82;    report_error (vout, (1.0+(0.005126953125*(39.184425354003906-25.0)))*(1.0+(0.5*(3.318623828887939453-3.3)))); -- (1+kta1216*(Ta-Ta0))*(1+(kv1216*(Vdd-VddV0)))
				when s82 => state := s83;    report_error (vout, (-75.0)*(1.0+(0.005126953125*(39.18442535400390625-25.0)))*(1.0+(0.5*(3.318623828887939453-3.3)))); -- pixosref*(1+kta1216*(Ta-Ta0))*(1+(kv1216*(Vdd-VddV0)))
				when s83 => state := s84;    report_error (vout, 619.679100908656-(-75.0)*(1.0+(0.005126953125*(39.18442535400390625-25.0)))*(1.0+(0.5*(3.318623828887939453-3.3)))); -- 700.882495690877 pixgain-pixosref*(1+kta1216*(Ta-Ta0))*(1+(kv1216*(Vdd-VddV0)))
				when others => report_error (vout, 0.0);
			end case;
		end if;
	end if;
end process tb1;

--  Test Bench Statements
tb_run: PROCESS
BEGIN
i_reset <= '1';
wait for 600 ns; -- wait until global set/reset completes
i_reset <= '0';
-- Add user defined stimulus here
i_run <= '1';
wait for clock_period*100;
i_run <= '0';
wait; -- will wait forever
END PROCESS tb_run;
--  End Test Bench

tb_wait : PROCESS
BEGIN
wait for 20 ms;
report "tb - done simulation - tb" severity failure;
END PROCESS tb_wait;

END ARCHITECTURE arch;
