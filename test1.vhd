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
constant C_WAIT1 : integer := 32;

COMPONENT float2fixed
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
overflow : OUT STD_LOGIC;
invalid_op : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal float2fixeda : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal float2fixedond : STD_LOGIC;
signal float2fixedorfd : STD_LOGIC;
signal float2fixedclk : STD_LOGIC;
signal float2fixedsclr : STD_LOGIC;
signal float2fixedce : STD_LOGIC;
signal float2fixedr : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal float2fixedof : STD_LOGIC;
signal float2fixediop : STD_LOGIC;
signal float2fixedrdy : STD_LOGIC;

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatorfd : STD_LOGIC;
signal fixed2floatclk : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;

COMPONENT divfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
underflow : OUT STD_LOGIC;
overflow : OUT STD_LOGIC;
invalid_op : OUT STD_LOGIC;
divide_by_zero : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfporfd : STD_LOGIC;
signal divfpclk : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpuf : STD_LOGIC;
signal divfpof : STD_LOGIC;
signal divfpiop : STD_LOGIC;
signal divfpdz : STD_LOGIC;
signal divfprdy : STD_LOGIC;

COMPONENT mulfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
underflow : OUT STD_LOGIC;
overflow : OUT STD_LOGIC;
invalid_op : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfporfd : STD_LOGIC;
signal mulfpclk : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpuf : STD_LOGIC;
signal mulfpof : STD_LOGIC;
signal mulfpiop : STD_LOGIC;
signal mulfprdy : STD_LOGIC;

COMPONENT addfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
underflow : OUT STD_LOGIC;
overflow : OUT STD_LOGIC;
invalid_op : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfporfd : STD_LOGIC;
signal addfpclk : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpuf : STD_LOGIC;
signal addfpof : STD_LOGIC;
signal addfpiop : STD_LOGIC;
signal addfprdy : STD_LOGIC;

COMPONENT subfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
underflow : OUT STD_LOGIC;
overflow : OUT STD_LOGIC;
invalid_op : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfporfd : STD_LOGIC;
signal subfpclk : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpuf : STD_LOGIC;
signal subfpof : STD_LOGIC;
signal subfpiop : STD_LOGIC;
signal subfprdy : STD_LOGIC;

COMPONENT sqrtfp2
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
operation_rfd : OUT STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
invalid_op : OUT STD_LOGIC;
rdy : OUT STD_LOGIC
);
END COMPONENT;

signal sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : STD_LOGIC;
signal sqrtfp2orfd : STD_LOGIC;
signal sqrtfp2clk : STD_LOGIC;
signal sqrtfp2sclr : STD_LOGIC;
signal sqrtfp2ce : STD_LOGIC;
signal sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2iop : STD_LOGIC;
signal sqrtfp2rdy : STD_LOGIC;

begin


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
	variable sqrt2_1,sqrt2_2 : sfixed (24 downto 0);
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
				ce <= '0';
				sclr <= '1';
				x_in <= (others => '0');
			when s1 => s := s2;
				sclr <= '0';
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
			when s13 => s := s14;
				fpout := to_sfixed (to_slv (out1add), fpout);
				tavircomp := resize (fpout, tavircomp);
				report_fixed_value ("vircomp+ta 1", tavircomp);
				report_fixed_value ("vircomp+ta 2", resize (reciprocal (tavircomp), tavircomp));
				ce <= '1';
--				x_in <= to_slv (tavircomp)(47 downto 0);
				x_in <= to_slv (resize (reciprocal (tavircomp), tavircomp))(47 downto 0);
			when s14 =>
				if (rdy = '1') then
					s := s15;
					sclr <= '1';
				else
					s := s14;
				end if;
			when s15 => s := s16;
				sclr <= '0';
				report_fixed_value ("sqrt2 1", to_sfixed (x_out, sqrt2_1));
				x_in <= "00000000000000000000000" & x_out;
			when s16 =>
				if (rdy = '1') then
					s := s17;
				else
					s := s16;
				end if;
			when s17 =>
				report_fixed_value ("sqrt2 2", to_sfixed (x_out, sqrt2_2));
				report_fixed_value ("sqrt2 3", resize (reciprocal (to_sfixed (x_out, sqrt2_2)), fptmp1));
				report "done" severity failure;
			when others => null;
		end case;
	end if;
end process p0;

inst_ff1 : float2fixed
PORT MAP (
a => float2fixeda,
operation_nd => float2fixedond,
operation_rfd => float2fixedorfd,
clk => float2fixedclk,
sclr => float2fixedsclr,
ce => float2fixedce,
result => float2fixedr,
overflow => float2fixedof,
invalid_op => float2fixediop,
rdy => float2fixedrdy
);

inst_ff2 : fixed2float
PORT MAP (
a => fixed2floata,
operation_nd => fixed2floatond,
operation_rfd => fixed2floatorfd,
clk => fixed2floatclk,
sclr => fixed2floatsclr,
ce => fixed2floatce,
result => fixed2floatr,
rdy => fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => divfpa,
b => divfpb,
operation_nd => divfpond,
operation_rfd => divfporfd,
clk => divfpclk,
ce => divfpce,
result => divfpr,
underflow => divfpuf,
overflow => divfpof,
invalid_op => divfpiop,
divide_by_zero => divfpdz,
rdy => divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => mulfpa,
b => mulfpb,
operation_nd => mulfpond,
operation_rfd => mulfporfd,
clk => mulfpclk,
sclr => mulfpsclr,
ce => mulfpce,
result => mulfpr,
underflow => mulfpuf,
overflow => mulfpof,
invalid_op => mulfpiop,
rdy => mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => addfpa,
b => addfpb,
operation_nd => addfpond,
operation_rfd => addfporfd,
clk => addfpclk,
sclr => addfpsclr,
ce => addfpce,
result => addfpr,
underflow => addfpuf,
overflow => addfpof,
invalid_op => addfpiop,
rdy => addfprdy
);

inst_subfp : subfp
PORT MAP (
a => subfpa,
b => subfpb,
operation_nd => subfpond,
operation_rfd => subfporfd,
clk => subfpclk,
sclr => subfpsclr,
ce => subfpce,
result => subfpr,
underflow => subfpuf,
overflow => subfpof,
invalid_op => subfpiop,
rdy => subfprdy
);

inst_sqrtfp2 : sqrtfp2
PORT MAP (
a => sqrtfp2a,
operation_nd => sqrtfp2ond,
operation_rfd => sqrtfp2orfd,
clk => sqrtfp2clk,
sclr => sqrtfp2sclr,
ce => sqrtfp2ce,
result => sqrtfp2r,
invalid_op => sqrtfp2iop,
rdy => sqrtfp2rdy
);
end Behavioral;

