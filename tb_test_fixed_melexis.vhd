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
	type states is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20);
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
				when s3 => state := s4;      report_error (vout, 32.0); -- 2**5
				when s4 => state := s5;      report_error (vout, 8192.0); -- 2**13
				when s5 => state := s6;      report_error (vout, 104.0); -- vdd25
				when s6 => state := s7;      report_error (vout, -152.0); -- vdd25
				when s7 => state := s8;      report_error (vout, -4864.0); -- vdd25
				when s8 => state := s9;      report_error (vout, -13056.0); -- vdd25
				when s9 => state := s10;     report_error (vout, 4.0); -- resee
				when s10 => state := s11;    report_error (vout, 4.0); -- resreg
				when s11 => state := s12;    report_error (vout, 1.0); -- rescorr
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
