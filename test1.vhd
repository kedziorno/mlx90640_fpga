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
	type st is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10);
	variable s : st := s0;
	subtype stsf_max is st_sfixed_max;
	subtype stsf_h1 is st_sfixed_h1;
	subtype stsf_h2 is st_sfixed_h2;
	variable a : stsf_max := (others => '0');
	variable fpout,fptmp1,fptmp2 : stsf_max := (others => '0');
	variable acomp : stsf_max := to_sfixed (0.00000011876487360496, a);
	variable acomp_pow3 : stsf_max := to_sfixed (0.0000000000000000000016751898488992162, a);
	variable acomp_pow4 : stsf_max := to_sfixed (0.00000000000000000000000000019895371066882747, a);
	variable acomp1,acomp2,acomp3 : stsf_h1 := (others => '0');
	variable acomp5,acomp6 : stsf_h2 := (others => '0');
	variable acomp4 : stsf_max := (others => '0');
	variable vircomp : stsf_max := to_sfixed (679.250909123826, a);
	variable ta : stsf_max := to_sfixed (9516495632.56, a);
	variable ksto2 : stsf_max := to_sfixed (-0.00080108642578125, a);
	constant h1_0 : stsf_h1 := (others => '0');
	constant h2_0 : stsf_h2 := (others => '0');
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
				report_fixed_value ("acomp 1", acomp);
				acomp := reciprocal (acomp);
				report_fixed_value ("acomp 2", acomp);
				acomp2 := resize (acomp (FP_BITS/2 downto 0), acomp2);
				report_fixed_value ("acomp 3", acomp2);
				in1mul <= acomp2&h2_0;
				in2mul <= acomp2&h2_0;
			when s2 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s3; else v_wait1 := v_wait1 + 1; s := s2; end if;
			when s3 => s := s4;
				report_fixed_value ("in1mul", in1mul);
				report_fixed_value ("in2mul", in2mul);
				fpout := to_sfixed (to_slv (out1mul), fpout);
				fptmp1 := resize (fpout, fptmp1);
				report_fixed_value ("acomp**2", fptmp1);
				in1mul <= fptmp1;
				in2mul <= acomp2;
			when s4 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s5; else v_wait1 := v_wait1 + 1; s := s4; end if;
			when s5 => s := s6;
				fpout := to_sfixed (to_slv (out1mul), fpout);
				fptmp1 := resize (fpout, fptmp1);
				report_fixed_value ("acomp**3", fptmp1);
				in1mul <= fptmp1;
				in2mul <= acomp2;
			when s6 => if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; s := s7; else v_wait1 := v_wait1 + 1; s := s6; end if;
			when s7 => s := s8;
				fpout := to_sfixed (to_slv (out1mul), fpout);
				fptmp1 := resize (fpout, fptmp1);
				report_fixed_value ("acomp**4 1", fptmp1);
				acomp4 := reciprocal (fptmp1);
				report_fixed_value ("acomp**4 2", acomp4);
				report_error ("fail acomp**4", acomp4, to_sfixed (0.0000000000000000000000000001989537106685565816142312285483516132993630991389094443493566755076784602351835928857326507568359375, acomp4));
			when s8 => s := s9;
			when s9 => s := s10;
			when s10 => s := s10;
			report "done" severity failure;
			when others => null;
		end case;
	end if;
end process p0;

end Behavioral;

