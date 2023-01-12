----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:07 01/12/2023 
-- Design Name: 
-- Module Name:    test1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee, ieee_proposed;
--library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;
use work.p_fphdl_package1.all;


entity tb_test1 is
end tb_test1;

architecture Behavioral of tb_test1 is

signal reset : std_logic := '1';
signal clock : std_logic := '0';
constant clock_period : time := 500 ns;

component fixed_synth is
port (
	in1, in2   : in  std_logic_vector (2*FP_BITS-1 downto 0);
	out1       : out std_logic_vector (2*FP_BITS-1 downto 0);
	cmd        : in  std_logic_vector (3 downto 0);
	clk, rst_n : in  std_ulogic
);
end component fixed_synth;
for all : fixed_synth use entity work.fixed_synth(rtl);

signal in1slv, in2slv, outslv : std_logic_vector(2*FP_BITS-1 downto 0);
signal in1 : st_sfixed_max;
signal in2 : st_sfixed_max;
signal out1 : st_sfixed_max;
signal cmd : std_logic_vector (3 downto 0);

begin

out1 <= to_sfixed(outslv, st_sfixed_max'high, st_sfixed_max'low);
in1slv <= to_slv(in1);
in2slv <= to_slv(in2);

DUT : fixed_synth port map (
	in1 => in1slv,
	in2 => in2slv,
	out1 => outslv,
	cmd => cmd,
	clk => clock,
	rst_n => reset
);

pc : process is
begin
	clock <= '0';
	wait for clock_period/2;
	clock <= '1';
	wait for clock_period/2;
end process pc;

p0 : process (clock) is
	constant C_WAIT1 : integer := 32;
	variable v_wait1 : integer range 0 to C_WAIT1-1 := 0;
	type st is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10);
	variable s : st := s0;
	subtype stsf is st_sfixed_max;
	variable a : stsf := (others => '0');
	variable fpout,fptmp1,fptmp2 : stsf := (others => '0');
	variable ksto2 : stsf := to_sfixed (-0.00080108642578125, a);
	variable acomp : stsf := to_sfixed (0.00000011876487360496, a);
	variable acomp_pow3 : stsf := to_sfixed (0.0000000000000000000016751898488992162, a);
	variable acomp_pow4 : stsf := to_sfixed (0.00000000000000000000000000019895371066882747, a);
	variable acomp1,acomp2,acomp3 : stsf := (others => '0');
	variable vircomp : stsf := to_sfixed (679.250909123826, a);
	variable ta : stsf := to_sfixed (9516495632.56, a);
begin
	if rising_edge (clock) then
		case s is
			when s0 => s := s1; reset <= '1'; if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s1; else v_wait1 := v_wait1 + 1; s := s0; end if;
			when s1 => s := s2; reset <= '0';
				report_fixed_value ("acomp 1", acomp);
				acomp := resize (scalb (acomp, 23), acomp);
				report_fixed_value ("acomp 2", acomp);
				cmd <= "0010";
				in1 <= acomp;
				in2 <= acomp;
			when s2 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s3; else v_wait1 := v_wait1 + 1; s := s2; end if;
			when s3 => s := s4;
				fpout := to_sfixed (to_slv (out1), fpout);
				fptmp1 := resize (fpout, fptmp1);
				report_fixed_value ("acomp**2", fptmp1);
				cmd <= "0010";
				in1 <= fptmp1;
				in2 <= acomp;
			when s4 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s5; else v_wait1 := v_wait1 + 1; s := s4; end if;
			when s5 => s := s6;
				fpout := to_sfixed (to_slv (out1), fpout);
				fptmp1 := resize (fpout, fptmp1);
				report_fixed_value ("acomp**3", fptmp1);
				cmd <= "0010";
				in1 <= fptmp1;
				in2 <= acomp;
			when s6 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s7; else v_wait1 := v_wait1 + 1; s := s6; end if;
			when s7 => s := s8;
				fpout := to_sfixed (to_slv (out1), fpout);
				fptmp1 := resize (fpout, fptmp1);
				report_fixed_value ("acomp**4 1", fptmp1);
				fptmp1 := resize (scalb (fptmp1, -23), fptmp1);
				report_fixed_value ("acomp**4 2", fptmp1);
			when s8 => s := s9;
			when s9 => s := s10;
			when s10 => s := s10;
			report "done" severity failure;
			when others => null;
		end case;
	end if;
end process p0;

end Behavioral;

