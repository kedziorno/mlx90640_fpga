-- TestBench Template 

LIBRARY ieee,ieee_proposed;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.numeric_std_additions.all;
use ieee_proposed.standard_additions.all;
--use ieee_proposed.standard_textio_additions.all;
use ieee_proposed.std_logic_1164_additions.all;

USE work.p_fphdl_package1.all;
USE work.p_fphdl_package2.all;

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
o_out1 : out fd2ft;
o_rdy : out std_logic;
o_out2 : out st_sfixed_max
);
end component test_fixed_melexis;

SIGNAL i_clock :  std_logic;
SIGNAL i_reset :  std_logic;
SIGNAL i_run :  std_logic;
SIGNAL o_out1 :  fd2ft;
SIGNAL o_rdy,o_rdyp :  std_logic;
SIGNAL o_out2 : st_sfixed_max;

constant clock_period : time := 500 ns;
constant G_C_WAIT1 : integer := 16;

signal out1r : real;
signal out2r : real;

BEGIN

out1r <= ap_slv2fp (o_out1);
out2r <= to_real (o_out2);

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
	s41,s42,s43,s44,s45,s46,s47,s48,s49,s50,s51,s52,s53,s54,s55,s56,s57,s58,s59,s60);
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
				when s51 => state := s52;    report_error (vout, 2.0); -- occscalerow
				when s52 => state := s53;    report_error (vout, -2.0); -- occcolumn16
				when s53 => state := s54;    report_error (vout, 1.0); -- occscalecolumn
				when s54 => state := s55;    report_error (vout, 2.0); -- offset1216
				when s55 => state := s56;    report_error (vout, 0.0); -- occscaleremnant
				when s56 => state := s57;    report_error (vout, 0.0); -- 
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
wait for 0.5 ms;
report "done simulation" severity failure;
END PROCESS tb_wait;

END ARCHITECTURE arch;
