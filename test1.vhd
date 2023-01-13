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

component fixed_synth_add is
port (
	in1, in2   : in  std_logic_vector (FP_BITS-1 downto 0);
	out1       : out std_logic_vector (FP_BITS-1 downto 0);
	clk, rst_n : in  std_ulogic
);
end component fixed_synth_add;

component fixed_synth_sub is
port (
	in1, in2   : in  std_logic_vector (FP_BITS-1 downto 0);
	out1       : out std_logic_vector (FP_BITS-1 downto 0);
	clk, rst_n : in  std_ulogic
);
end component fixed_synth_sub;

component fixed_synth_mul is
port (
	in1, in2   : in  std_logic_vector (FP_BITS-1 downto 0);
	out1       : out std_logic_vector (FP_BITS-1 downto 0);
	clk, rst_n : in  std_ulogic
);
end component fixed_synth_mul;

component fixed_synth_div is
port (
	in1, in2   : in  std_logic_vector (FP_BITS-1 downto 0);
	out1       : out std_logic_vector (FP_BITS-1 downto 0);
	clk, rst_n : in  std_ulogic
);
end component fixed_synth_div;

signal in1slvadd, in2slvadd, outslvadd : std_logic_vector(FP_BITS-1 downto 0);
signal in1slvsub, in2slvsub, outslvsub : std_logic_vector(FP_BITS-1 downto 0);
signal in1slvdiv, in2slvdiv, outslvdiv : std_logic_vector(FP_BITS-1 downto 0);
signal in1slvmul, in2slvmul, outslvmul : std_logic_vector(FP_BITS-1 downto 0);
signal in1add,in1sub,in1div,in1mul : st_sfixed_max;
signal in2add,in2sub,in2div,in2mul : st_sfixed_max;
signal out1add,out1sub,out1div,out1mul : st_sfixed_max;

constant C_WAIT1 : integer := 32;

begin

out1add <= to_sfixed(outslvadd, st_sfixed_max'high, st_sfixed_max'low);
out1sub <= to_sfixed(outslvsub, st_sfixed_max'high, st_sfixed_max'low);
out1div <= to_sfixed(outslvdiv, st_sfixed_max'high, st_sfixed_max'low);
out1mul <= to_sfixed(outslvmul, st_sfixed_max'high, st_sfixed_max'low);

in1slvadd <= to_slv(in1add);
in1slvsub <= to_slv(in1sub);
in1slvdiv <= to_slv(in1div);
in1slvmul <= to_slv(in1mul);
in2slvadd <= to_slv(in2add);
in2slvsub <= to_slv(in2sub);
in2slvdiv <= to_slv(in2div);
in2slvmul <= to_slv(in2mul);

DUTadd : fixed_synth_add port map (in1 => in1slvadd, in2 => in2slvadd, out1 => outslvadd, clk => clock, rst_n => reset);
DUTsub : fixed_synth_sub port map (in1 => in1slvsub, in2 => in2slvsub, out1 => outslvsub, clk => clock, rst_n => reset);
DUTdiv : fixed_synth_div port map (in1 => in1slvdiv, in2 => in2slvdiv, out1 => outslvdiv, clk => clock, rst_n => reset);
DUTmul : fixed_synth_mul port map (in1 => in1slvmul, in2 => in2slvmul, out1 => outslvmul, clk => clock, rst_n => reset);

pr : process is
begin
	reset <= '1';
	wait for clock_period*0.501;
	reset <= '0';
	report "fp_add_hi : " & integer'image(st_sfixed_add'high);
	report "fp_add_lo : " & integer'image(st_sfixed_add'low);
	report "fp_sub_hi : " & integer'image(st_sfixed_sub'high);
	report "fp_sub_lo : " & integer'image(st_sfixed_sub'low);
	report "fp_mul_hi : " & integer'image(st_sfixed_mul'high);
	report "fp_mul_lo : " & integer'image(st_sfixed_mul'low);
	report "fp_div_hi : " & integer'image(st_sfixed_div'high);
	report "fp_div_lo : " & integer'image(st_sfixed_div'low);
	wait;
end process pr;

pc : process is
begin
	clock <= '0';
	wait for clock_period/2;
	clock <= '1';
	wait for clock_period/2;
end process pc;

p0 : process (clock) is
	variable v_wait1 : integer range 0 to C_WAIT1-1 := 0;
	type st is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20);
	variable s : st := s0;
	subtype stsf_max is st_sfixed_max;
	subtype stsf_h1 is st_sfixed_h1;
	subtype stsf_h2 is st_sfixed_h2;
	variable a : stsf_max := (others => '0');
	constant acomp_const : stsf_max := to_sfixed (0.00000011876487360496, a);
	constant acomp_pow3_const : stsf_max := to_sfixed (0.0000000000000000000016751898488992162, a);
	constant acomp_pow4_const : stsf_max := to_sfixed (0.00000000000000000000000000019895371066882747, a);
	constant vircomp_const : stsf_max := to_sfixed (679.250909123826, a);
	constant ta_const : stsf_max := to_sfixed (9516495632.56, a);
	constant ksto2_const : stsf_max := to_sfixed (-0.00080108642578125, a);
	constant h1_0 : stsf_h1 := (others => '0');
	constant h2_0 : stsf_h2 := (others => '0');
	variable acomp1,acomp2,acomp3 : stsf_h1 := (others => '0');
	variable acomp5,acomp6 : stsf_h2 := (others => '0');
	variable acomp4 : stsf_max := (others => '0');
	variable fpout,fptmp1,fptmp2 : stsf_max := (others => '0');
	variable ta,vircomp,tavircomp : stsf_max := (others => '0');
begin
	if rising_edge (clock) then
		case s is
			when s0 => s := s1;
				in1add <= (others => '0');
				in2add <= (others => '0');
				in1sub <= (others => '0');
				in2sub <= (others => '0');
				in1div <= (others => '0');
				in2div <= (others => '0');
				in1mul <= (others => '0');
				in2mul <= (others => '0');
			when s1 => s := s2;
				acomp1 := reciprocal (acomp_const);
				acomp1 := resize (acomp1 (FP_BITS/2 downto 0), acomp1);
				in1mul <= acomp1&h2_0;
				in2mul <= acomp1&h2_0;
			when s2 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s3; else v_wait1 := v_wait1 + 1; s := s2; end if;
			when s3 => s := s4;
				fpout := to_sfixed (to_slv (out1mul), fpout);
				acomp2 := resize (fpout, acomp2);
				in1mul <= acomp2;
				in2mul <= acomp1&h2_0;
			when s4 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s5; else v_wait1 := v_wait1 + 1; s := s4; end if;
			when s5 => s := s6;
				fpout := to_sfixed (to_slv (out1mul), fpout);
				acomp3 := resize (fpout, acomp3);
				report_fixed_value ("acomp**3 1", acomp3);
				report_fixed_value ("acomp**3 2", reciprocal (acomp3));
				in1mul <= acomp3;
				in2mul <= acomp1&h2_0;
			when s6 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s7; else v_wait1 := v_wait1 + 1; s := s6; end if;
			when s7 => s := s8;
				fpout := to_sfixed (to_slv (out1mul), fpout);
				acomp4 := resize (fpout, acomp4);
				report_fixed_value ("acomp**4 1", acomp4);
				report_fixed_value ("acomp**4 2", reciprocal (acomp4));
--				report_error ("fail acomp**4", reciprocal (acomp4), acomp_pow4_const);
				in1mul <= acomp4;
				in2mul <= resize (reciprocal (ta_const), in2mul);
			when s8 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s9; else v_wait1 := v_wait1 + 1; s := s8; end if;
			when s9 => s := s10;
				fpout := to_sfixed (to_slv (out1mul), fpout);
				ta := resize (fpout, ta);
				report_fixed_value ("ta 1", ta);
				in1mul <= acomp3;
				in2mul <= resize (reciprocal (vircomp_const), in2mul);
			when s10 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s11; else v_wait1 := v_wait1 + 1; s := s10; end if;
			when s11 => s := s12;
				fpout := to_sfixed (to_slv (out1mul), fpout);
				vircomp := resize (fpout, vircomp);
				report_fixed_value ("vircomp 1", vircomp);
				in1add <= resize (reciprocal (ta), in1add);
				in2add <= resize (reciprocal (vircomp), in2add);
			when s12 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s13; else v_wait1 := v_wait1 + 1; s := s12; end if;
			when s13 =>
				fpout := to_sfixed (to_slv (out1add), fpout);
				tavircomp := resize (fpout, tavircomp);
				report_fixed_value ("vircomp+ta 1", tavircomp);
				report_fixed_value ("vircomp+ta 2", resize (reciprocal (tavircomp), tavircomp));
			report "done" severity failure;
			when others => null;
		end case;
	end if;
end process p0;

end Behavioral;

