----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:07 12/26/2022 
-- Design Name: 
-- Module Name:    test_fixed_melexis - Behavioral 
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
-- Test vectors for the synthesis test for the fixed point math package
-- This test is designed to test fixed_synth and exercise much of the entity.
-- For fphdl vhdl-200x created by David Bishop (dbishop@vhdl.org)
----------------------------------------------------------------------------------

library ieee, ieee_proposed;
--library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;


--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package1.all;

entity test_fixed_melexis is
generic (
G_C_WAIT1 : integer := 16
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
o_out1 : out st_sfixed_max;
o_in1 : out st_sfixed_max;
o_in2 : out st_sfixed_max
);
end test_fixed_melexis;

architecture testbench of test_fixed_melexis is

	component fixed_synth is
	port (
		in1, in2   : in  std_logic_vector (2*FP_BITS-1 downto 0);
		out1       : out std_logic_vector (2*FP_BITS-1 downto 0);
		cmd        : in  std_logic_vector (3 downto 0);
		clk, rst_n : in  std_ulogic
	);
	end component fixed_synth;
	for all : fixed_synth use entity work.fixed_synth(rtl);

	signal clk, rst_n : std_ulogic;
	signal in1slv, in2slv, outslv : std_logic_vector(2*FP_BITS-1 downto 0);
	signal in1 : st_sfixed_max;
	signal in2 : st_sfixed_max;
	signal out1 : st_sfixed_max;
	signal cmd : std_logic_vector (3 downto 0);
	signal state : states;

begin

	out1 <= to_sfixed(outslv, st_sfixed_max'high, st_sfixed_max'low);
	o_out1 <= out1;
	o_in1 <= to_sfixed(in1slv, st_sfixed_max'high, st_sfixed_max'low);
	o_in2 <= to_sfixed(in2slv, st_sfixed_max'high, st_sfixed_max'low);

	in1slv <= to_slv(in1);
	in2slv <= to_slv(in2);

	DUT : fixed_synth port map (
		in1 => in1slv,
		in2 => in2slv,
		out1 => outslv,
		cmd => cmd,
		clk => i_clock,
		rst_n => i_reset
	);

	-- purpose: main test loop
	tester : process (i_clock,i_reset) is
		variable sftmp_slv_16 : std_logic_vector(15 downto 0);
		variable sftmp_sf_16 : sfixed15;
		variable sftmp_slv_fpbits : std_logic_vector(2*FP_BITS-1 downto 0);
		variable fptmp1,fptmp2,fpout : st_sfixed_max;
		variable kvdd,vdd25 : st_sfixed_max;
		variable kvptat,ktptat : st_sfixed_max;
		variable vdd,vddv0,deltaV : st_sfixed_max;
		variable vptat,vbe : st_sfixed_max;
		variable vptat25 : st_sfixed_max;
		variable vptatart : st_sfixed_max;
		variable alphaptatee : st_sfixed_max;
		variable alphaptat : st_sfixed_max;
		variable h1,h2 : st_sfixed_max;
		variable pow2_18 : st_sfixed_max;
		variable tmp_uf8 : ufixed8;
		variable tmp_sf8 : sfixed8;
		variable tmp_uf6 : ufixed6;
		variable tmp_sf6 : sfixed6;
		variable tmp_uf9 : ufixed9;
		variable tmp_sf9 : sfixed9;
		variable tmp_uf15 : ufixed15;
		variable tmp_sf15 : sfixed15;
		variable pow2to18 : st_sfixed_max;
		constant C_WAIT1 : integer := G_C_WAIT1;
		variable v_wait1 : integer range 0 to C_WAIT1-1;
		variable Ta,Ta0 : st_sfixed_max;
		variable Kgain : st_sfixed_max;
		variable pixgain12_16 : st_sfixed_max; -- xxx for all pixels
		variable offset12_16 : st_sfixed_max; -- xxx for all pixels
		variable offsetaverage : st_sfixed_max;
		variable occscalerow : st_sfixed_max;
		variable occscalecolumn : st_sfixed_max;
		variable kv12_16 : st_sfixed_max;
		variable occrow12 : st_sfixed_max;
		variable occcolumn16 : st_sfixed_max;
		variable occscaleremnant : st_sfixed_max;
		variable tmps4 : sfixed4;
		variable tmps5 : sfixed5;
		variable tmps6 : sfixed6;
		variable tmps7 : sfixed7;
		variable tmps8 : sfixed8;
		variable tmps9 : sfixed9;
		variable occsro,occsc,occsre : st_sfixed_max;
		variable occsror,occscr,occsrer : st_sfixed_max;
		variable pixosref12_16 : st_sfixed_max;
		variable kta12_16 : st_sfixed_max;
		variable kta_rc_ee : st_sfixed_max;
		variable kta_scale_1 : st_sfixed_max;
		variable kta_scale_2 : st_sfixed_max;
		variable kvscale : st_sfixed_max;
		variable pixos12_16 : st_sfixed_max;
		variable tad,v0d : st_sfixed_max;
		variable vir12_16_emissitivy_componsated : st_sfixed_max;
		variable pixgain_cp_sp0 : st_sfixed_max;
		variable pixgain_cp_sp1 : st_sfixed_max;
		variable off_cpsubpage_0 : st_sfixed_max;
		variable off_cpsubpage_1 : st_sfixed_max;
		variable off_cpsubpage_1_delta : st_sfixed_max;
		variable kta_cp_ee : st_sfixed_max;
		variable kta_cp : st_sfixed_max;
		variable kv_scale : st_sfixed_max;
		variable kv_cp_ee : st_sfixed_max;
		variable kv_cp : st_sfixed_max;
		variable ktacp_kvcp_mul,ilchessc1ee,ilchessc1,pixos_cp_sp0,pixos_cp_sp1,ch_pattern_12_16,tgcee,tgc,vir_12_16_compensated : st_sfixed_max;
		variable ch_pattern12_16 : st_sfixed_max;
		constant pixelnumber12_16 : integer := 368;
		variable pixospatt1,pixospatt2,pixospatt12,ch_pattern_12_16_minusone : st_sfixed_max;
	begin
		if (rising_edge(i_clock)) then
			if (i_reset = '1') then
				report "fp_add_hi : " & integer'image(st_sfixed_add'high);
				report "fp_add_lo : " & integer'image(st_sfixed_add'low);
				report "fp_sub_hi : " & integer'image(st_sfixed_sub'high);
				report "fp_sub_lo : " & integer'image(st_sfixed_sub'low);
				report "fp_mul_hi : " & integer'image(st_sfixed_mul'high);
				report "fp_mul_lo : " & integer'image(st_sfixed_mul'low);
				report "fp_div_hi : " & integer'image(st_sfixed_div'high);
				report "fp_div_lo : " & integer'image(st_sfixed_div'low);
				v_wait1 := 0;
				state <= idle;
				sftmp_slv_fpbits := (others => '0');
				-- reset
				cmd <= "0000";
				in1 <= (others => '0');
				in2 <= (others => '0');
				fptmp1 := (others => '0');
				fptmp2 := (others => '0');
				fpout := (others => '0');
			else
		case (state) is
when idle =>
		-- 11.2.2.2
		-- kvdd,vdd25
		-- ram[0x072a] = 0xccc5
		-- 11.2.2.3
		-- kvptat,ktptat
		-- ee[0x2432] = 0x5952 ee[0x2431] = 0x2ff1 ee[0x2410] = 0x4210 ram[0x072a] = 0xccc5 ram[0x0720] = 0x06af ram[0x0700] = 0x4bf2

			if (i_run = '1') then
				state <= s1;
			else
				state <= idle;
			end if;
when s1 =>
		--
		-- kvdd
		sftmp_slv_16 := x"9d68" and x"ff00"; -- ee[0x2433]
		kvdd := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kvdd);
		report_error ("fail kvdd 1", kvdd, to_sfixed (-25344.0, kvdd)); -- -25344
		fptmp2 := to_sfixed (2**8, fptmp2);
		report_error ("fail 2**8", fptmp2, to_sfixed (2**8, fptmp2)); -- 256
		cmd <= "0011"; -- / ee[0x2433]&0xff00/256
		in1 <= kvdd;
		in2 <= fptmp2;
		state <= w1;
when w1 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s2; else v_wait1 := v_wait1 + 1; state <= w1; end if;
when s2 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kvdd := resize (fpout, kvdd);
		report_error ("fail kvdd 2", kvdd, to_sfixed (-99.0, kvdd)); -- -99
		fptmp2 := to_sfixed (2**5, fptmp2);
		report_error ("fail 2**5", fptmp2, to_sfixed (2**5, fptmp2)); -- 32
		cmd <= "0010"; -- * kvdd*2^5
		in1 <= kvdd;
		in2 <= fptmp2;
		state <= w2;
when w2 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s3; else v_wait1 := v_wait1 + 1; state <= w2; end if;
when s3 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kvdd := resize (fpout, kvdd);
		report_error ("fail kvdd 3", kvdd, to_sfixed (-3168.0, kvdd)); -- -3168
		--
		-- vdd25
		sftmp_slv_16 := x"9d68" and x"00ff"; -- ee[0x2433]
		vdd25 := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), vdd25);
		report_error ("fail vdd25 1", vdd25, to_sfixed (104.0, vdd25)); -- 104
		fptmp2 := to_sfixed (2**8, fptmp2);
		report_error ("fail 2**8", fptmp2, to_sfixed (2**8, fptmp2)); -- 256
		cmd <= "0001"; -- - vdd25-256
		in1 <= vdd25;
		in2 <= fptmp2;
		state <= w3;
when w3 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s4; else v_wait1 := v_wait1 + 1; state <= w3; end if;
when s4 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vdd25 := resize (fpout, vdd25);
		report_error ("fail vdd25 2", vdd25, to_sfixed (-152.0, vdd25)); -- -152
		fptmp2 := to_sfixed (2**5, fptmp2);
		report_error ("fail 2**5", fptmp2, to_sfixed (2**5, fptmp2)); -- 32
		cmd <= "0010"; -- * (vdd25-256)*2^5
		in1 <= vdd25;
		in2 <= fptmp2;
		state <= w4;
when w4 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s5; else v_wait1 := v_wait1 + 1; state <= w4; end if;
when s5 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vdd25 := resize (fpout, vdd25);
		report_error ("fail vdd25 3", vdd25, to_sfixed (-4864.0, vdd25)); -- -4864
		fptmp2 := to_sfixed (2**13, fptmp2);
		report_error ("fail 2**13", fptmp2, to_sfixed (2**13, fptmp2)); -- 2**13
		cmd <= "0001"; -- - (vdd25-256)*2^5-2^13
		in1 <= vdd25;
		in2 <= fptmp2;
		state <= w5;
when w5 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s6; else v_wait1 := v_wait1 + 1; state <= w5; end if;
when s6 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vdd25 := resize (fpout, vdd25);
		report_error ("fail vdd25 4", vdd25, to_sfixed (-13056.0, vdd25)); -- -13056
		-- 
		-- kvptat
		sftmp_slv_16 := x"5952" and x"fc00"; -- ee[0x2432]
		kvptat := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), kvptat);
		report_error ("fail kvptat 1", kvptat, to_sfixed (22528.0, kvptat)); -- 22528
		fptmp2 := to_sfixed (2**10, fptmp2);
		report_error ("fail 2**10", fptmp2, to_sfixed (2**10, fptmp2)); -- 2**10
		cmd <= "0011"; -- / ee[0x2432]&0xfc00/2**10
		in1 <= kvptat;
		in2 <= fptmp2;
		state <= w6;
when w6 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s7; else v_wait1 := v_wait1 + 1; state <= w6; end if;
when s7 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kvptat := resize (fpout, kvptat);
		report_error ("fail kvptat 2", kvptat, to_sfixed (22.0, kvptat)); -- 22
		fptmp2 := to_sfixed (2**12, fptmp2);
		report_error ("fail 2**12", fptmp2, to_sfixed (2**12, fptmp2)); -- 2**12
		cmd <= "0011"; -- / kvptat/2**12
		in1 <= kvptat;
		in2 <= fptmp2;
		state <= w7;
when w7 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s8; else v_wait1 := v_wait1 + 1; state <= w7; end if;
when s8 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		kvptat := resize (fpout, kvptat);
		report_error ("fail kvptat 3", kvptat, to_sfixed (0.005371094, kvptat)); -- 5.371094e-03
		-- 
		-- ktptat
		sftmp_slv_16 := x"5952" and x"03ff"; -- ee[0x2432]
		ktptat := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), ktptat);
		report_error ("fail ktptat 1", ktptat, to_sfixed (338.0, ktptat)); -- 338
		fptmp2 := to_sfixed (2**3, fptmp2);
		report_error ("fail 2**3", fptmp2, to_sfixed (2**3, fptmp2)); -- 8
		cmd <= "0011"; -- / ktptat/2^3
		in1 <= ktptat;
		in2 <= fptmp2;
		state <= w8;
when w8 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s9; else v_wait1 := v_wait1 + 1; state <= w8; end if;
when s9 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		ktptat := resize (fpout, ktptat);
		report_error ("fail ktptat 2", ktptat, to_sfixed (42.25, ktptat)); -- 42.25
		--
		-- deltaV
		sftmp_slv_16 := x"ccc5" and x"ffff"; -- ram[0x072a]
		deltaV := resize (to_sfixed (sftmp_slv_16, sftmp_sf_16), deltaV);
		report_error ("fail deltaV 1", deltaV, to_sfixed (-13115.0, deltaV)); -- -13115
		cmd <= "0001"; -- - ram[0x072a]-vdd25
		in1 <= deltaV;
		in2 <= vdd25;
		state <= w9;
when w9 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s10; else v_wait1 := v_wait1 + 1; state <= w9; end if;
when s10 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		deltaV := resize (fpout, deltaV);
		report_error ("fail deltaV 2", deltaV, to_sfixed (-13115.0-(-13056.0), deltaV)); -- -59
		cmd <= "0011"; -- / (ram[0x072a]-vdd25)/kvdd
		in1 <= deltaV;
		in2 <= kvdd;
		state <= w10;
when w10 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s11; else v_wait1 := v_wait1 + 1; state <= w10; end if;
when s11 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		deltaV := resize (fpout, deltaV);
		report_error ("fail deltaV 3", deltaV, to_sfixed (0.018623737, deltaV)); -- 1.861572e-02
		fptmp2 := to_sfixed (3.3, fptmp2);
		report_error ("fail 3.3", fptmp2, to_sfixed (3.3, fptmp2)); -- 3.3
		cmd <= "0000"; -- +
		in1 <= deltaV;
		in2 <= fptmp2;
		state <= w11;
when w11 =>
		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s12; else v_wait1 := v_wait1 + 1; state <= w11; end if;
when s12 =>
		fpout := to_sfixed (to_slv (out1), fpout);
		vdd := resize (fpout, vdd);
		report_error ("fail vdd", vdd, to_sfixed (3.319, vdd)); -- 3.319
report "aaa" severity failure;
--		--
--		-- vptat25
--		sftmp_slv_fpbits := "000000000000"&x"0000"&x"2ff1" and "0000000000"&"00"&x"0000"&x"ffff"; -- 12273
--		fpout := to_sfixed (sftmp_slv_fpbits(st_sfixed_max'high downto 0)&x"0000", st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("ee[0x2431]", fpout); -- 12273
--		--if (fpout > 32767.0) then -- signed
--		--	fpout := 65536.0 - fpout;
--		--	fpout := -fpout;
--		--end if;
--		--tmp_uf15 := to_ufixed(-38000.0,tmp_uf15);
--		--tmp_uf15 := to_ufixed(38000.0,tmp_uf15);
--		--tmp_uf15 := to_ufixed(-26000.0,tmp_uf15);
--		--tmp_uf15 := to_ufixed(26000.0,tmp_uf15);
--		tmp_uf15 := to_ufixed("0"&to_slv(fpout(15 downto 0)),tmp_uf15); -- xxx fix ufixed to sfixed and test above vals
--report_fixed_value ("tmp_uf15", tmp_uf15);
--		if (tmp_uf15 > 32767.0) then -- signed
--			tmp_sf15 := to_sfixed(to_slv(resize(65536.0-tmp_uf15,tmp_uf15)),tmp_sf15);
--			tmp_sf15 := -tmp_sf15(15 downto 0);
--report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(tmp_uf8) - to_sfixed(256.0,tmp_sf8)),tmp_sf8));
----			tmp_sf8 := to_sfixed(to_sfixed(to_slv(tmp_uf8),7,0) - to_sfixed(256.0,7,0),7,0);
----			tmp_sf8 := to_sfixed(to_sfixed(to_slv(fpout(7 downto 0)),7,0) - to_sfixed(256.0,7,0),tmp_sf8'high,tmp_sf8'low);
------			tmp_sf8 := to_sfixed(to_slv(fpout(7 downto 0)),tmp_sf8'high,tmp_sf8'low) - to_sfixed(256.0,7,0);
--report_fixed_value ("-------------------", tmp_sf8);
----			tmp_sf8 := to_sfixed(to_slv(tmp_uf8),tmp_sf8'high,tmp_sf8'low);
--		else
--			tmp_sf15 := to_sfixed(to_slv(tmp_uf15),tmp_sf15);
--		end if;
--report_fixed_value ("sign15bit", tmp_sf15); --
----		fptmp1 := to_sfixed("0"&x"00"&to_slv(tmp_sf8)&x"0000",fptmp1'high,fptmp1'low);
--		fptmp1 := resize(tmp_sf15,fptmp1);
--report_fixed_value ("sign", fptmp1); --
--		vptat25 := resize(fptmp1,vptat25);
--report_fixed_value ("vptat25", vptat25); -- 12273
--report_error("fail vptat25", vptat25, to_sfixed(12273,vptat25));
--
--		--
--		-- vptat
--		sftmp_slv_fpbits := "000000000000"&x"0000"&x"06af" and "0000000000"&"00"&x"0000"&x"ffff"; -- 1711
--		fpout := to_sfixed (sftmp_slv_fpbits(st_sfixed_max'high downto 0)&x"0000", st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("ram[0x0720]", fpout); -- 1711
--		--if (fpout > 32767.0) then -- signed
--		--	fpout := 65536.0 - fpout;
--		--	fpout := -fpout;
--		--end if;
--		--tmp_uf15 := to_ufixed(-38000.0,tmp_uf15);
--		--tmp_uf15 := to_ufixed(38000.0,tmp_uf15);
--		--tmp_uf15 := to_ufixed(-26000.0,tmp_uf15);
--		--tmp_uf15 := to_ufixed(26000.0,tmp_uf15);
--		tmp_uf15 := to_ufixed("0"&to_slv(fpout(15 downto 0)),tmp_uf15); -- xxx fix ufixed to sfixed and test above vals
--report_fixed_value ("tmp_uf15", tmp_uf15);
--		if (tmp_uf15 > 32767.0) then -- signed
--			tmp_sf15 := to_sfixed(to_slv(resize(65536.0-tmp_uf15,tmp_uf15)),tmp_sf15);
--			tmp_sf15 := -tmp_sf15(15 downto 0);
--report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(tmp_uf8) - to_sfixed(256.0,tmp_sf8)),tmp_sf8));
----			tmp_sf8 := to_sfixed(to_sfixed(to_slv(tmp_uf8),7,0) - to_sfixed(256.0,7,0),7,0);
----			tmp_sf8 := to_sfixed(to_sfixed(to_slv(fpout(7 downto 0)),7,0) - to_sfixed(256.0,7,0),tmp_sf8'high,tmp_sf8'low);
------			tmp_sf8 := to_sfixed(to_slv(fpout(7 downto 0)),tmp_sf8'high,tmp_sf8'low) - to_sfixed(256.0,7,0);
--report_fixed_value ("-------------------", tmp_sf8);
----			tmp_sf8 := to_sfixed(to_slv(tmp_uf8),tmp_sf8'high,tmp_sf8'low);
--		else
--			tmp_sf15 := to_sfixed(to_slv(tmp_uf15),tmp_sf15);
--		end if;
--report_fixed_value ("sign15bit", tmp_sf15); --
--		fptmp1 := resize(tmp_sf15,fptmp1);
--report_fixed_value ("sign", fptmp1); --
--		vptat := resize(fptmp1,vptat);
--report_fixed_value ("vptat", vptat); -- 1711
--report_error("fail vptat", vptat, to_sfixed(1711,vptat));
--
--		--
--		-- vbe
--		sftmp_slv_fpbits := "000000000000"&x"0000"&x"4bf2" and "0000000000"&"00"&x"0000"&x"ffff"; -- 19442
--		fpout := to_sfixed (sftmp_slv_fpbits(st_sfixed_max'high downto 0)&x"0000", st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("ram[0x0700]", fpout); -- 19442
----		if (fpout > 32767.0) then -- signed
----			fpout := 65536.0 - fpout;
----			fpout := -fpout;
----		end if;
--		--tmp_uf15 := to_ufixed(-38000.0,tmp_uf15);
--		--tmp_uf15 := to_ufixed(38000.0,tmp_uf15);
--		--tmp_uf15 := to_ufixed(-26000.0,tmp_uf15);
--		--tmp_uf15 := to_ufixed(26000.0,tmp_uf15);
--		tmp_uf15 := to_ufixed("0"&to_slv(fpout(15 downto 0)),tmp_uf15); -- xxx fix ufixed to sfixed and test above vals
--report_fixed_value ("tmp_uf15", tmp_uf15);
--		if (tmp_uf15 > 32767.0) then -- signed
--			tmp_sf15 := to_sfixed(to_slv(resize(65536.0-tmp_uf15,tmp_uf15)),tmp_sf15);
--			tmp_sf15 := -tmp_sf15(15 downto 0);
--report_fixed_value ("kurwa", to_sfixed(to_slv(to_sfixed(tmp_uf8) - to_sfixed(256.0,tmp_sf8)),tmp_sf8));
----			tmp_sf8 := to_sfixed(to_sfixed(to_slv(tmp_uf8),7,0) - to_sfixed(256.0,7,0),7,0);
----			tmp_sf8 := to_sfixed(to_sfixed(to_slv(fpout(7 downto 0)),7,0) - to_sfixed(256.0,7,0),tmp_sf8'high,tmp_sf8'low);
------			tmp_sf8 := to_sfixed(to_slv(fpout(7 downto 0)),tmp_sf8'high,tmp_sf8'low) - to_sfixed(256.0,7,0);
--report_fixed_value ("-------------------", tmp_sf8);
----			tmp_sf8 := to_sfixed(to_slv(tmp_uf8),tmp_sf8'high,tmp_sf8'low);
--		else
--			tmp_sf15 := to_sfixed(to_slv(tmp_uf15),tmp_sf15);
--		end if;
--report_fixed_value ("sign15bit", tmp_sf15); --
--		fptmp1 := resize(tmp_sf15,fptmp1);
--report_fixed_value ("sign", fptmp1); --
--		vbe := resize(fptmp1,vbe);
--report_fixed_value ("vbe", vbe); -- 19442
--report_error("fail vbe", vbe, to_sfixed(19442,vbe));
--
--		--
--		-- alphaptatee
--		sftmp_slv_fpbits := "000000000000"&x"0000"&x"4210" and "0000000000"&"00"&x"0000"&x"f000"; -- 16384
--		fpout := to_sfixed (sftmp_slv_fpbits(st_sfixed_max'high downto 0)&x"0000", st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("ee[0x2410]", fpout); -- 16384
--		sftmp_slv_fpbits := to_slv (fpout);
--		fptmp1 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("fptmp1", fptmp1); -- 16384
--		sftmp_slv_fpbits := "000000000000"&"0001000000000000" & "0000000000000000"; -- 2**12
--		fptmp2 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("fptmp2", fptmp2); -- 4096
--
--		cmd <= "0011"; -- /
--		in1 <= fptmp1;
--		in2 <= fptmp2;
--		state <= w12;
--when w12 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s13;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w12;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--		alphaptatee := resize(fpout,alphaptatee);
--when s13 =>
--report_fixed_value ("alphaptatee", alphaptatee); -- 4
--report_error("fail alphaptatee", alphaptatee, to_sfixed(4,alphaptatee));		
--		
--		--
--		-- alphaptat
--		sftmp_slv_fpbits := to_slv(resize (alphaptatee,fpout)); -- 4
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("raw val", fpout); -- 4
--		sftmp_slv_fpbits := to_slv (fpout);
--		fptmp1 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("raw val", fptmp1); -- 4
--		sftmp_slv_fpbits := "000000000000"&"0000000000000100" & "0000000000000000"; -- 2**2
--		fptmp2 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("pow2**2", fptmp2); -- 4
--		cmd <= "0011"; -- /
--		in1 <= fptmp1;
--		in2 <= fptmp2;
--		state <= w13;
--when w13 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s14;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w13;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--when s14 =>
--report_fixed_value ("div ", fpout); -- 1
--
--		sftmp_slv_fpbits := to_slv (fpout); -- 1
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("div ", fpout); -- 1
--		fptmp1 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("fptmp1", fptmp1); -- 1
--		sftmp_slv_fpbits := "000000000000"&"0000000000001000" & "0000000000000000"; -- 2**3
--		fptmp2 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("fptmp2", fptmp2); -- 8
--
--		cmd <= "0000"; -- +
--		in1 <= fptmp1;
--		in2 <= fptmp2;
--		state <= w14;
--when w14 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s15;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w14;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--		alphaptat := resize(fpout,alphaptat);
--
--when s15 =>
--report_fixed_value ("alphaptat", alphaptat); -- 9
--report_error("fail alphaptat", alphaptat, to_sfixed(9,alphaptat));
--
--		--
--		-- vptatart
--		
--		cmd <= "0010"; -- *
--report_fixed_value ("vptat", resize(vptat,fptmp1)); --
--		in1 <= resize(vptat,fptmp1);
--report_fixed_value ("alphaptat", resize(alphaptat,fptmp2)); --
--		in2 <= resize(alphaptat,fptmp2);
--		state <= w15;
--when w15 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s16;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w15;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--
--when s16 =>
--report_fixed_value ("vptat*alphaptat", fpout); --
--
--		cmd <= "0000"; -- +
--		in1 <= fpout;
--report_fixed_value ("vptat*alphaptat", out1); --
--		in2 <= resize(vbe,fptmp2);
--report_fixed_value ("vbe", resize(vbe,fptmp2)); --
--		state <= w16;
--when w16 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s17;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w16;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--
--when s17 =>
--report_fixed_value ("vptat*alphaptat+vbe", fpout); --
--
--		cmd <= "0011"; -- /
--		in1 <= resize(vptat,fptmp1);
--report_fixed_value ("vptat", resize(vptat,fptmp1)); --
--		in2 <= fpout;
--report_fixed_value ("vptat*alphaptat+vbe", out1); --
--		state <= w17;
--when w17 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s18;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w17;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--		
--when s18 =>
--report_fixed_value ("vptat/(vptat*alphaptat+vbe)", fpout); --
--
--		sftmp_slv_fpbits := "000000000001"&x"ffff"&x"0000"; -- 2**18
--		pow2to18 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high,st_sfixed_max'low);
--report_fixed_value ("pow2**18", pow2to18); --
--report_fixed_value ("pow2**18signed", to_sfixed(to_slv(pow2to18),fptmp1)); --
--
--		cmd <= "0010"; -- *
--		in1 <= pow2to18;
--report_fixed_value ("pow2**18", pow2to18); --
--		in2 <= fpout;
--report_fixed_value ("vptat/(vptat*alphaptat+vbe)", out1); --
--		state <= w18;
--when w18 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s19;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w18;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--
--when s19 =>
--report_fixed_value ("(vptat/(vptat*alphaptat+vbe))*pow2**18", fpout); --
--		--h1 := fpout;
--
--		sftmp_slv_fpbits := "000000000000"&"0000000000000010" & "0000000000000000"; -- 2**2
--		fptmp2 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("pow2**2", fptmp2); -- 
--		cmd <= "0010"; -- *
--		in1 <= fptmp2;
--report_fixed_value ("pow2**2", fptmp2); --
--		in2 <= fpout;
--report_fixed_value ("(vptat/(vptat*alphaptat+vbe))*pow2**18", fpout); --
--		state <= w19;
--when w19 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s20;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w19;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--		vptatart := fpout;
--when s20 =>
--report_fixed_value ("((vptat/(vptat*alphaptat+vbe))*pow2**18)*pow2**2", fpout); --
--report_fixed_value ("vptatart", fpout); --
--
--		--pow2to18 := to_ufixed (262144.0, ufixed18'high,ufixed18'low);
--report_fixed_value ("2**18", pow2to18); -- 
--report_error("fail vptatart (ok,almost)", vptatart, to_sfixed(12873.57952,vptatart)); -- ok, almost
--		--
--		-- Ta
--		cmd <= "0010"; -- * a=deltaV*kvptat
--		in1 <= resize(deltaV,fptmp1);
--		in2 <= resize(kvptat,fptmp2);
--report_fixed_value ("in1", resize(deltaV,fptmp1)); --
--report_fixed_value ("in2", resize(kvptat,fptmp2)); --
--		state <= w20;
--when w20 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s21;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w20;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--when s21 =>
--report_fixed_value ("out a*", out1); --
--
--		cmd <= "0000"; -- + b=a+1
--		in1 <= fpout;
--		in2 <= to_sfixed(1.0,fptmp2);
--report_fixed_value ("in1", out1); --
--report_fixed_value ("in2", to_sfixed(1.0,fptmp2)); --
--		state <= w21;
--when w21 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s22;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w21;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--when s22 =>
--report_fixed_value ("out b+", out1); --
--
--		cmd <= "0011"; -- / c=vptatart/b
--		in1 <= resize(vptatart,fptmp1); --vptatart
--		in2 <= fpout;
--report_fixed_value ("in1", resize(fpout,fptmp1)); --
--report_fixed_value ("in2", out1); --
--		state <= w22;
--when w22 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s23;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w22;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--when s23 =>
--report_fixed_value ("out c/", out1); --
--
--		cmd <= "0001"; -- - d=c-vptat25
--		in1 <= fpout;
--		in2 <= resize(vptat25,fptmp2);
--report_fixed_value ("in1", out1); --
--report_fixed_value ("in2", resize(vptat25,fptmp2)); --
--		state <= w23;
--when w23 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s24;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w23;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--when s24 =>
--report_fixed_value ("out d-", out1); --
--
--		cmd <= "0011"; -- / e=d/ktptat
--		in1 <= fpout;
--		in2 <= resize(ktptat,fptmp2);
--report_fixed_value ("in1", out1); --
--report_fixed_value ("in2", resize(ktptat,fptmp2)); --
--		state <= w24;
--when w24 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s25;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w24;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--when s25 =>
--report_fixed_value ("out e/", out1); --
--		cmd <= "0000"; -- + f=e+25.0
--		in1 <= fpout;
--		in2 <= to_sfixed(25.0,fptmp2);
--report_fixed_value ("in1", out1); --
--report_fixed_value ("in2", to_sfixed(25.0,fptmp2)); --
--		state <= w25;
--when w25 =>
--		-- wait for clock_period*20;
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s26;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w25;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--		Ta := resize(fpout,Ta);
--when s26 =>
--report_error("fail Ta (ok,almost)", Ta, to_sfixed(39.184,Ta));
--		--
--		sftmp_slv_fpbits := "000000000000"&x"0000"&x"1881" and "0000000000"&"00"&x"0000"&x"ffff"; -- 6273
--		fpout := to_sfixed (sftmp_slv_fpbits(st_sfixed_max'high downto 0)&x"0000", st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("ram[0x070a]", fpout); -- 6273
--		sftmp_slv_fpbits := to_slv (fpout);
--		fptmp1 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("fptmp1", fptmp1); -- 6273
--report_error("fail ram[0x070a]", fptmp1, to_sfixed(6273.0,fptmp1));
--		--
--		sftmp_slv_fpbits := "000000000000"&x"0000"&x"18ef" and "0000000000"&"00"&x"0000"&x"ffff"; -- 6383
--		fpout := to_sfixed (sftmp_slv_fpbits(st_sfixed_max'high downto 0)&x"0000", st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("ee[0x2430]", fpout); -- 6383
--		sftmp_slv_fpbits := to_slv (fpout);
--		fptmp2 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_fixed_value ("fptmp1", fptmp1); -- 6383
--report_error("fail gain", fptmp2, to_sfixed(6383.0,fptmp1));
--		--
--		cmd <= "0011"; -- /
--		in1 <= fptmp2;
--		in2 <= fptmp1;
--		state <= w26;
--when w26 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s27;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w26;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--		Kgain := resize(fpout,Kgain);
--when s27 =>
--report_fixed_value ("gain", out1); --
--report_error("fail Kgain (ok,almost)", Kgain, to_sfixed(1.01753546947234,Kgain)); -- ok, almost
--		-- xxx pixdata 12,16 0x056f
--		sftmp_slv_fpbits := "000000000000"&x"0000"&x"0261" and "0000000000"&"00"&x"0000"&x"ffff"; -- 609
--		fpout := to_sfixed (sftmp_slv_fpbits(st_sfixed_max'high downto 0)&x"0000", st_sfixed_max'high, st_sfixed_max'low);
--		sftmp_slv_fpbits := to_slv (fpout);
--		fptmp1 := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--report_error("fail pixgain(12,16) ram[0x056f]", fptmp1, to_sfixed(609.0,fptmp1));
--		cmd <= "0010"; -- *
--		in1 <= fptmp1;
--		in2 <= resize(Kgain,fptmp2);
--		state <= w27;
--when w27 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s28;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w27;
--		end if;
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, st_sfixed_max'high, st_sfixed_max'low);
--		pixgain12_16 := resize(fpout,pixgain12_16); --xxx pix gain 12,16
--when s28 =>
--report_error("fail pixgain12_16 (ok,almost)", pixgain12_16, to_sfixed(619.679100908656,pixgain12_16)); -- ok, almost
--
--		sftmp_slv_fpbits := x"0000"&x"ffbb" and x"0000"&x"ffff"; -- 65467
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--report_fixed_value ("ee[0x2410]", fpout); -- 65467
--		sftmp_slv_fpbits := to_slv (fpout);
--		offsetaverage := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--report_error("fail offsetaverage", offsetaverage, to_sfixed(-69.0,offsetaverage));
--
--		sftmp_slv_fpbits := x"0000"&x"4210" and x"0000"&x"0f00"; -- 2
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := x"00"&sftmp_slv_fpbits(31 downto 24)&x"0000";
--		occscalerow := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tmps4 := resize(occscalerow,tmps4);
--		occscalerow := resize(tmps4,occscalerow);
--report_fixed_value("occscalerow",occscalerow);
--report_error("fail occscalerow", occscalerow, to_sfixed(2.0,occscalerow));
--
--		sftmp_slv_fpbits := x"0000"&x"4210" and x"0000"&x"00f0"; -- 1
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--report_fixed_value("asd",fpout);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := x"000"&sftmp_slv_fpbits(23 downto 20)&x"0000";
--		occscalecolumn := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tmps4 := resize(occscalecolumn,tmps4);
--		occscalecolumn := resize(tmps4,occscalecolumn);
--report_error("fail occscalecolumn", occscalecolumn, to_sfixed(1.0,occscalecolumn));
--
--		sftmp_slv_fpbits := x"0000"&x"f2f2" and x"0000"&x"f000"; -- ee[0x2414]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := x"000"&sftmp_slv_fpbits(31 downto 28)&x"0000";
--		occrow12 := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tmps4 := resize(occrow12,tmps4);
--		occrow12 := resize(tmps4,occrow12);
--report_error("fail occrow12", occrow12, to_sfixed(-1.0,occrow12));
--
--		sftmp_slv_fpbits := x"0000"&x"e0ef" and x"0000"&x"f000"; -- ee[0x241b]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := x"000"&sftmp_slv_fpbits(31 downto 28)&x"0000";
--		occcolumn16 := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tmps4 := resize(occcolumn16,tmps4);
--		occcolumn16 := resize(tmps4,occcolumn16);
--report_error("fail occcolumn16", occcolumn16, to_sfixed(-2.0,occcolumn16));
--
--		sftmp_slv_fpbits := x"0000"&x"08a8" and x"0000"&x"fc00"; -- ee[0x25af]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "0000000000"&sftmp_slv_fpbits(31 downto 26)&x"0000";
--		offset12_16 := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tmps6 := resize(offset12_16,tmps6);
--		offset12_16 := resize(tmps6,offset12_16);
--report_error("fail offset12_16", offset12_16, to_sfixed(2.0,offset12_16));
--
--		sftmp_slv_fpbits := x"0000"&x"4210" and x"0000"&x"000f"; -- ee[0x2410]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "000000000000"&sftmp_slv_fpbits(19 downto 16)&x"0000";
--		occscaleremnant := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tmps4 := resize(occscaleremnant,tmps4);
--		occscaleremnant := resize(tmps4,occscaleremnant);
--report_error("fail occscaleremnant", occscaleremnant, to_sfixed(0.0,occscaleremnant));
--
--		occsre := to_sfixed(1.0,occsre) sll to_integer(occscaleremnant); -- 1.0
--		occsro := to_sfixed(1.0,occsro) sll to_integer(occscalerow); -- 4.0
--		occsc := to_sfixed(1.0,occsc) sll to_integer(occscalecolumn); -- 2.0
--
--report_fixed_value("occsre",occsre);
--report_fixed_value("occsro",occsro);
----		reporct_fixed_value("occsc",occsc);
--		cmd <= "0010"; -- * occrow12*2^occscalerow
--		in1 <= resize(occrow12,fptmp1);
--report_fixed_value("occrow12",resize(occrow12,fptmp1));
--		in2 <= resize(occsro,fptmp2); -- 2^x
--report_fixed_value("occsro",resize(occsro,fptmp2));
--		state <= w28;
--when w28 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s29;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w28;
--		end if;
--when s29 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		occsro := resize(fpout,occsro);
--report_fixed_value("occrow12*2^occscalerow",occsro);
--		cmd <= "0010"; -- * occcolumn16*2^occcolumn16
--		in1 <= resize(occcolumn16,fptmp1);
--report_fixed_value("occcolumn16",resize(occcolumn16,fptmp1));
--		in2 <= resize(occsc,fptmp2); -- 2^x
--report_fixed_value("occsc",resize(occsc,fptmp2));
--		state <= w29;
--when w29 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s30;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w29;
--		end if;
--when s30 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		occsc := resize(fpout,occsc);
--report_fixed_value("occcolumn16*2^occsc",occsc);
--
--		cmd <= "0010"; -- * occremnant*2^occscaleremnant
--		in1 <= resize(offset12_16,fptmp1);
--report_fixed_value("offset12_16",resize(offset12_16,fptmp1));
--		in2 <= resize(occsre,fptmp2); -- 2^x
--report_fixed_value("occsre",resize(occsre,fptmp2));
--		state <= w30;
--when w30 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s31;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w30;
--		end if;
--when s31 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		occsre := resize(fpout,occsre);
--report_fixed_value("occremnant*2^occscaleremnant",occsre);
--
--		cmd <= "0000"; -- + occsre+occsc
--		in1 <= resize(occsre,fptmp1);
--report_fixed_value("occsre",resize(occsre,fptmp1));
--		in2 <= resize(occsc,fptmp2);
--report_fixed_value("occsc",resize(occsc,fptmp2));
--		state <= w31;
--when w31 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s32;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w31;
--		end if;
--when s32 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		occsre := resize(fpout,occsre); -- occsre+occsc
--report_fixed_value("occsre+occsc",occsre);
--
--		cmd <= "0000"; -- + occsre+occsc+occsro
--		in1 <= resize(occsre,fptmp1);
--report_fixed_value("occsre",resize(occsre,fptmp1));
--		in2 <= resize(occsro,fptmp2);
--report_fixed_value("occsro",resize(occsro,fptmp2));
--		state <= w32;
--when w32 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s33;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w32;
--		end if;
--when s33 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		occsro := resize(fpout,occsro); -- occsre+occsc+occsro
--report_fixed_value("occsre+occsc+occsro",occsro);
--
--		cmd <= "0000"; -- + occsre+occsc+occsro+offsetaverage
--		in1 <= resize(occsro,fptmp1);
--report_fixed_value("occsro",resize(occsro,fptmp1));
--		in2 <= resize(offsetaverage,fptmp2);
--report_fixed_value("offsetaverage",resize(offsetaverage,fptmp2));
--		state <= w33;
--when w33 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s34;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w33;
--		end if;
--when s34 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixosref12_16 := resize(fpout,pixosref12_16);
--report_fixed_value("pixosref12_16=occsre+occsc+occsro+offsetaverage",pixosref12_16);
--report_error("fail pixosref12_16 (ok,almost)", pixosref12_16, to_sfixed(-75.0,pixosref12_16)); -- ok,almost
--
--		sftmp_slv_fpbits := x"0000"&x"08a0" and x"0000"&x"000e"; -- ee[0x25af]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "00000000000"&sftmp_slv_fpbits(19 downto 17)&"0"&x"0000";
--		kta12_16 := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta12_16 := kta12_16 srl 1;
--		tmps4 := resize(kta12_16,tmps4);
--		kta12_16 := resize(tmps4,kta12_16);
--report_fixed_value("kta12_16",kta12_16);
--report_error("fail kta12_16", kta12_16, to_sfixed(0.0,kta12_16));
--
--		sftmp_slv_fpbits := x"0000"&x"5354" and x"0000"&x"00ff"; -- ee[0x2437]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "00000000"&sftmp_slv_fpbits(23 downto 16)&x"0000";
--		kta_rc_ee := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
----		tmps4 := resize(kta_rc_ee,tmps4);
----		kta_rc_ee := resize(tmps4,kta_rc_ee);
--report_fixed_value("kta_rc_ee",kta_rc_ee);
--report_error("fail kta_rc_ee", kta_rc_ee, to_sfixed(84.0,kta_rc_ee));
--
--		sftmp_slv_fpbits := x"0000"&x"2363" and x"0000"&x"000f"; -- ee[0x2438]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "000000000000"&sftmp_slv_fpbits(19 downto 16)&x"0000";
--		kta_scale_2 := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta_scale_2 := resize(kta_scale_2,kta_scale_2);
--report_fixed_value("kta_rc_ee",kta_rc_ee);
--report_error("fail kta_scale_2", kta_scale_2, to_sfixed(3.0,kta_scale_2));
--
--		sftmp_slv_fpbits := x"0000"&x"2363" and x"0000"&x"00f0"; -- ee[0x2438]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "000000000000"&sftmp_slv_fpbits(23 downto 20)&x"0000";
--		kta_scale_1 := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta_scale_1 := resize(kta_scale_1,kta_scale_1);
--report_fixed_value("kta_rc_ee",kta_rc_ee);
--report_error("fail kta_scale_1", kta_scale_1, to_sfixed(6.0,kta_scale_1));
--		state <= w34;
--		cmd <= "0000"; -- + kta_scale_1+8
--		in1 <= resize(kta_scale_1,fptmp1);
--		in2 <= to_sfixed(8.0,fptmp2);
--		state <= w34;
--when w34 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s35;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w34;
--		end if;
--when s35 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta_scale_1 := resize(fpout,kta_scale_1); -- kta_scale_1+8
--report_error("fail kta_scale_1+8 (ok,almost)", kta_scale_1, to_sfixed(14.0,kta_scale_1)); -- ok,almost
--
--		sftmp_slv_fpbits := x"0000"&x"5454" and x"0000"&x"000f"; -- ee[0x2434]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "000000000000"&sftmp_slv_fpbits(19 downto 16)&x"0000";
--		kv12_16 := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kv12_16 := resize(kv12_16,kv12_16);
--report_fixed_value("kv12_16",kv12_16);
--report_error("fail kv12_16", kv12_16, to_sfixed(4.0,kv12_16));
--
--		kta_scale_2 := to_sfixed(1.0,kta_scale_2) sll to_integer(kta_scale_2);
--report_fixed_value("2^kta_scale_2",kta_scale_2);
--
--		cmd <= "0010"; -- * kta(12,16)*2^Kta_scale_2
--		in1 <= resize(kta_scale_2,fptmp1);
--		in2 <= resize(kta12_16,fptmp2);
--		state <= w35;
--
--when w35 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s36;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w35;
--		end if;
--
--when s36 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta12_16 := resize(fpout,kta12_16);
--report_error("fail kta12_16*2^kta_scale_2 (ok,almost) ~0.0", kta12_16, to_sfixed(0.0,kta12_16)); -- ok,almost
--		cmd <= "0000"; -- + kta_rc_ee+kta12_16*2^kta_scale_2
--		in1 <= resize(kta12_16,fptmp1);
--		in2 <= resize(kta_rc_ee,fptmp2);
--		state <= w36;
--when w36 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s37;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w36;
--		end if;
--when s37 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta12_16 := resize(fpout,kta12_16);
--		kta_scale_1 := to_sfixed(1.0,kta_scale_1) sll to_integer(kta_scale_1);
--report_error("fail kta_rc_ee+kta12_16*2^kta_scale_2 (ok,almost)", kta12_16, to_sfixed(84.0,kta12_16)); -- ok,almost
--		cmd <= "0011"; -- (kta_rc_ee+kta12_16*2^kta_scale_2)/2^kta_scale_1
--		in1 <= resize(kta12_16,fptmp1);
--		in2 <= resize(kta_scale_1,fptmp2);
--		state <= w37;
--when w37 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s38;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w37;
--		end if;
--when s38 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta12_16 := resize(fpout,kta12_16);
--report_error("fail kta12_16 (ok,almost)", kta12_16, to_sfixed(0.005126953125,kta12_16)); -- ok,almost
--		state <= w38;
--when w38 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s39;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w38;
--		end if;
--when s39 =>
--		sftmp_slv_fpbits := x"0000"&x"2363" and x"0000"&x"0f00"; -- ee[0x2438]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "000000000000"&sftmp_slv_fpbits(27 downto 24)&x"0000";
--		kvscale := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kvscale := resize(kvscale,kvscale);
--report_fixed_value("kv12_16",kv12_16);
--report_error("fail kvscale", kvscale, to_sfixed(3.0,kv12_16));
--		kvscale := to_sfixed(1.0,kvscale) sll to_integer(kvscale);
--report_error("fail 2^kvscale", kvscale, to_sfixed(8.0,kv12_16));
--		cmd <= "0011"; -- / kv12_16/2^kvscale
--		in1 <= resize(kv12_16,fptmp1);
--		in2 <= resize(kvscale,fptmp2); -- 2^kvscale
--		state <= w39;
--when w39 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s40;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w39;
--		end if;
--when s40 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kv12_16 := resize(fpout,kv12_16);
--report_error("fail kv12_16 (ok,almost)", kv12_16, to_sfixed(0.5,kv12_16)); -- ok,almost
--		state <= w40;
--when w40 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s41;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w40;
--		end if;
--when s41 =>
--		cmd <= "0001"; -- - Ta-Ta0 Ta-25
--		in1 <= resize(Ta,fptmp1);
--		in2 <= to_sfixed(25.0,fptmp2);
--		state <= w41;
--when w41 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s42;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w41;
--		end if;
--when s42 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tad := resize(fpout,kv12_16);
--report_error("fail tad (ok,almost)", tad, to_sfixed(39.184-25.0,tad)); -- ok,almost
--		state <= w42;
--when w42 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s43;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w42;
--		end if;
--when s43 =>
--		cmd <= "0001"; -- - Vdd-VddV0 Vdd-3.3
--		in1 <= resize(Vdd,fptmp1);
--		in2 <= to_sfixed(3.3,fptmp2);
--		state <= w43;
--when w43 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s44;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w43;
--		end if;
--when s44 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		v0d := resize(fpout,v0d);
--report_error("fail v0d (ok,almost)", v0d, to_sfixed(3.319-3.3,v0d)); -- ok,almost
--		state <= w44;
--when w44 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s45;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w44;
--		end if;
--when s45 =>
--		cmd <= "0010"; -- * Kv12_16*v0d
--		in1 <= resize(kv12_16,fptmp1);
--		in2 <= resize(v0d,fptmp2);
--		state <= w45;
--when w45 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s46;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w45;
--		end if;
--when s46 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kv12_16 := resize(fpout,kv12_16);
--report_error("fail kv12_16*v0d (ok,almost)", kv12_16, to_sfixed(0.5*(3.319-3.3),kv12_16)); -- ok,almost
--		state <= w46;
--when w46 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s47;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w46;
--		end if;
--when s47 =>
--		cmd <= "0000"; -- + 1+kv12_16*v0d
--		in1 <= to_sfixed(1.0,fptmp1);
--		in2 <= resize(kv12_16,fptmp2);
--		state <= w47;
--when w47 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s48;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w47;
--		end if;
--when s48 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kv12_16 := resize(fpout,kv12_16);
--report_error("fail 1+kv12_16*v0d (ok,almost)", kv12_16, to_sfixed(1.0+(0.5*(3.319-3.3)),kv12_16)); -- ok,almost
--		state <= w48;
--when w48 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s49;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w48;
--		end if;
--when s49 =>
--		cmd <= "0010"; -- * kta12_16*tad
--		in1 <= resize(kta12_16,fptmp1);
--		in2 <= resize(tad,fptmp2);
--		state <= w49;
--when w49 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s50;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w49;
--		end if;
--when s50 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta12_16 := resize(fpout,kta12_16);
--report_error("fail kta12_16*tad (ok,almost)", kta12_16, to_sfixed(0.005126953125*(39.184-25.0),kta12_16)); -- ok,almost
--		state <= w50;
--when w50 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s51;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w50;
--		end if;
--when s51 =>
--		cmd <= "0000"; -- + 1+kta12_16*tad
--		in1 <= to_sfixed(1.0,fptmp1);
--		in2 <= resize(kta12_16,fptmp2);
--		state <= w51;
--when w51 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s52;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w51;
--		end if;
--when s52 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta12_16 := resize(fpout,kta12_16);
--report_error("fail 1+kta12_16*tad (ok,almost)", kta12_16, to_sfixed(1.0+(0.005126953125*(39.184-25.0)),kta12_16)); -- ok,almost
--		state <= w52;
--when w52 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s53;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w52;
--		end if;
--when s53 =>
--		cmd <= "0010"; -- * pixosref*(1+KTa(12,16)*(Ta-Ta0))
--		in1 <= resize(pixosref12_16,fptmp1);
--		in2 <= resize(kta12_16,fptmp2);
--		state <= w53;
--when w53 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s54;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w53;
--		end if;
--when s54 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta12_16 := resize(fpout,kta12_16);
--report_error("fail pixosref*(1+kta12_16*tad) (ok,almost)", kta12_16, to_sfixed((-75.0)*(1.0+(0.005126953125*(39.184-25.0))),kta12_16)); -- ok,almost
--		state <= w54;
--when w54 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s55;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w54;
--		end if;
--when s55 =>
--		cmd <= "0010"; -- * PIXosref*(1+KTa(12,16)*(Ta-Ta0))*(1+Kv(12,16)*(Vdd-VddV0))
--		in1 <= resize(kta12_16,fptmp1);
--		in2 <= resize(kv12_16,fptmp2);
--		state <= w55;
--when w55 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s56;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w55;
--		end if;
--when s56 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta12_16 := resize(fpout,kta12_16);
--report_error("fail pixosref*(1+kta12_16*tad)*(1+kv12_16*v0d) (ok,almost)", kta12_16, to_sfixed((-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3)),kta12_16)); -- ok,almost
--		state <= w56;
--when w56 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s57;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w56;
--		end if;
--when s57 =>
--		cmd <= "0001"; -- - pixgain-PIXosref*(1+KTa(12,16)*(Ta-Ta0))*(1+Kv(12,16)*(Vdd-VddV0))
--		in1 <= resize(pixgain12_16,fptmp1);
--		in2 <= resize(kta12_16,fptmp2);
--		state <= w57;
--when w57 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s58;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w57;
--		end if;
--when s58 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixos12_16 := resize(fpout,pixos12_16);
--report_error("fail pixgain-pixosref*(1+kta12_16*tad)*(1+kv12_16*v0d) (ok,almost)", pixos12_16, to_sfixed(619.679100908656-(-75.0)*(1.0+(0.005126953125*(39.184-25.0)))*(1.0+0.5*(3.319-3.3)),pixos12_16)); -- ok,almost
--report_error("fail pixgain-pixosref*(1+kta12_16*tad)*(1+kv12_16*v0d) (ok,almost)", pixos12_16, to_sfixed(700.882495690877,pixos12_16)); -- ok,almost
--		state <= w58;
--when w58 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s59;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w58;
--		end if;
--when s59 =>
--		cmd <= "0011"; -- / VIR(12,16)Emissivity_COMPOENSATED=pixos12_16/E E=1
--		in1 <= resize(pixos12_16,fptmp1);
--		in2 <= to_sfixed(1.0,fptmp2);
--		state <= w59;
--when w59 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s60;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w59;
--		end if;
--when s60 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		vir12_16_emissitivy_componsated := resize(fpout,vir12_16_emissitivy_componsated);
--report_error("fail vir12_16_emissitivy_componsated (ok,almost)", vir12_16_emissitivy_componsated, to_sfixed(700.882495690877,vir12_16_emissitivy_componsated)); -- ok,almost
--		state <= w60;
--when w60 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s61;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w60;
--		end if;
--when s61 =>
--		sftmp_slv_fpbits := x"0000"&x"ffca" and x"0000"&x"ffff"; -- ram[0x0708]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
----		sftmp_slv_fpbits := "000000000000"&sftmp_slv_fpbits(27 downto 24)&x"0000";
--		pixgain_cp_sp0 := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixgain_cp_sp0 := resize(pixgain_cp_sp0,pixgain_cp_sp0);
--report_fixed_value("pixgain_cp_sp0",pixgain_cp_sp0);
--report_error("fail pixgain_cp_sp0", pixgain_cp_sp0, to_sfixed(-54.0,pixgain_cp_sp0));
--		cmd <= "0010"; -- * pixgain_cp_sp0*Kgain
--		in1 <= resize(pixgain_cp_sp0,fptmp1);
--		in2 <= resize(kgain,fptmp2);
--		state <= w61;
--when w61 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s62;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w61;
--		end if;
--when s62 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixgain_cp_sp0 := resize(fpout,pixgain_cp_sp0);
--report_error("fail pixgain_cp_sp0 (ok,almost)", pixgain_cp_sp0, to_sfixed(-54.9469153515065,pixgain_cp_sp0)); -- ok,almost
--		state <= w62;
--when w62 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s63;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w62;
--		end if;
--when s63 =>
--		sftmp_slv_fpbits := x"0000"&x"ffc8" and x"0000"&x"ffff"; -- ram[0x0728]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
----		sftmp_slv_fpbits := "000000000000"&sftmp_slv_fpbits(27 downto 24)&x"0000";
--		pixgain_cp_sp1 := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixgain_cp_sp1 := resize(pixgain_cp_sp1,pixgain_cp_sp1);
--report_fixed_value("pixgain_cp_sp1",pixgain_cp_sp1);
--report_error("fail pixgain_cp_sp1", pixgain_cp_sp1, to_sfixed(-56.0,pixgain_cp_sp1));
--		cmd <= "0010"; -- * pixgain_cp_sp1*Kgain
--		in1 <= resize(pixgain_cp_sp1,fptmp1);
--		in2 <= resize(kgain,fptmp2);
--		state <= w63;
--when w63 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s64;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w63;
--		end if;
--when s64 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixgain_cp_sp1 := resize(fpout,pixgain_cp_sp1);
--report_error("fail pixgain_cp_sp1 (ok,almost)", pixgain_cp_sp1, to_sfixed(-56.9819862904511,pixgain_cp_sp1)); -- ok,almost
--		state <= w64;
--when w64 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s65;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w64;
--		end if;
--when s65 =>
--		sftmp_slv_fpbits := x"0000"&x"fbb5" and x"0000"&x"03ff"; -- ee[0x243a]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "000000"&sftmp_slv_fpbits(25 downto 16)&x"0000";
--		off_cpsubpage_0 := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tmps9 := resize(off_cpsubpage_0,tmps9);
--		off_cpsubpage_0 := resize(tmps9,off_cpsubpage_0);
--report_fixed_value("off_cpsubpage_0",off_cpsubpage_0);
--report_error("fail off_cpsubpage_0", off_cpsubpage_0, to_sfixed(-75.0,off_cpsubpage_0));
--		state <= w65;
--when w65 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s66;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w65;
--		end if;
--when s66 =>
--		sftmp_slv_fpbits := x"0000"&x"fbb5" and x"0000"&x"fc00"; -- ee[0x243a]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "0000000000"&sftmp_slv_fpbits(31 downto 26)&x"0000";
--		off_cpsubpage_1_delta := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tmps5 := resize(off_cpsubpage_1_delta,tmps5);
--		off_cpsubpage_1_delta := resize(tmps5,off_cpsubpage_1_delta);
--report_fixed_value("off_cpsubpage_1_delta",off_cpsubpage_1_delta);
--report_error("fail off_cpsubpage_1_delta", off_cpsubpage_1_delta, to_sfixed(-2.0,off_cpsubpage_1_delta));
--		cmd <= "0000"; -- + OFF_CPsubpage_0+OFF_CPsubpage_1_delta
--		in1 <= resize(off_cpsubpage_0,fptmp1);
--		in2 <= resize(off_cpsubpage_1_delta,fptmp2);
--		state <= w66;
--when w66 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s67;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w66;
--		end if;
--when s67 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		off_cpsubpage_1 := resize(fpout,off_cpsubpage_1);
--report_error("fail off_cpsubpage_1 (ok,almost)", off_cpsubpage_1, to_sfixed(-77.0,off_cpsubpage_1)); -- ok,almost
--		state <= w67;
--when w67 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s68;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w67;
--		end if;
--when s68 =>
--		sftmp_slv_fpbits := x"0000"&x"044b" and x"0000"&x"00ff"; -- ee[0x24eb]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "00000000"&sftmp_slv_fpbits(23 downto 16)&x"0000";
--		kta_cp_ee := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tmps7 := resize(kta_cp_ee,tmps7);
--		kta_cp_ee := resize(tmps7,kta_cp_ee);
--report_fixed_value("kta_cp_ee",kta_cp_ee);
--report_error("fail kta_cp_ee", kta_cp_ee, to_sfixed(75.0,kta_cp_ee));
--report_fixed_value("kta_scale_1",kta_scale_1);
--		cmd <= "0011"; -- / KTa_cp_ee/2^KTa_scale_1
--		in1 <= resize(kta_cp_ee,fptmp1);
--		in2 <= resize(kta_scale_1,fptmp2);
--		state <= w68;
--when w68 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s69;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w68;
--		end if;
--when s69 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta_cp := resize(fpout,kta_cp);
--report_error("fail kta_cp (ok,almost)", kta_cp, to_sfixed(0.00457763671875,kta_cp)); -- ok,almost
--		state <= w69;
--when w69 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s70;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w69;
--		end if;
--when s70 =>
--		sftmp_slv_fpbits := x"0000"&x"2363" and x"0000"&x"0f00"; -- ee[0x2438]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "000000000000"&sftmp_slv_fpbits(27 downto 24)&x"0000";
--		kv_scale := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--report_fixed_value("kv_scale",kv_scale);
--report_error("fail kv_scale", kv_scale, to_sfixed(3.0,kv_scale));
--		kv_scale := to_sfixed(1.0,kv_scale) sll to_integer(kv_scale);
--report_error("fail 2^kv_scale", kv_scale, to_sfixed(8.0,kv_scale));
--		state <= w70;
--when w70 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s71;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w70;
--		end if;
--when s71 =>
--		sftmp_slv_fpbits := x"0000"&x"044b" and x"0000"&x"ff00"; -- ee[0x243b]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "00000000"&sftmp_slv_fpbits(31 downto 24)&x"0000";
--		kv_cp_ee := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		tmps7 := resize(kv_cp_ee,tmps7);
--		kv_cp_ee := resize(tmps7,kv_cp_ee);
--report_fixed_value("kv_cp_ee",kv_cp_ee);
--report_error("fail kv_cp_ee", kv_cp_ee, to_sfixed(4.0,kv_cp_ee));
--		state <= w71;
--when w71 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s72;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w71;
--		end if;
--when s72 =>
--		cmd <= "0011"; -- / kv_cp_ee/2^kv_scale
--		in1 <= resize(kv_cp_ee,fptmp1);
--report_fixed_value("fptmp1",kv_cp_ee);
--		in2 <= resize(kv_scale,fptmp2); -- 2^kv_scale
--report_fixed_value("fptmp2",kv_scale);
--		state <= w72;
--when w72 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s73;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w72;
--		end if;
--when s73 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kv_cp := resize(fpout,kta_cp);
--report_error("fail kv_cp (ok,almost)", kv_cp, to_sfixed(0.5,kv_cp)); -- ok,almost
--		state <= w73;
--when w73 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s74;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w73;
--		end if;
--when s74 =>
----0x2435 0x0994 
----IL_CHESS_C3 - 5 bits
----IL_CHESS_C2 - 5 bits
----IL_CHESS_C1 - 6 bits
----IL_CHESS_C3 = 0.125
----IL_CHESS_C2 = 3
----IL_CHESS_C1 = 1.25
--		sftmp_slv_fpbits := x"0000"&x"0994" and x"0000"&x"003f"; -- ee[0x2435]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "0000000000"&sftmp_slv_fpbits(21 downto 16)&x"0000";
--		ilchessc1ee := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--report_fixed_value("ilchessc1ee",ilchessc1ee);
--		tmps6 := resize(ilchessc1ee,tmps6);
--		ilchessc1ee := resize(tmps6,ilchessc1ee);
--report_fixed_value("ilchessc1ee",ilchessc1ee);
--report_error("fail ilchessc1ee", ilchessc1ee, to_sfixed(1.25,ilchessc1ee));
--		ilchessc1ee := ilchessc1ee srl 4;
--report_fixed_value("ilchessc1ee",ilchessc1ee);
--report_error("fail ilchessc1ee/2^4", ilchessc1ee, to_sfixed(1.25,ilchessc1ee));
--		state <= w74;
--when w74 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s75;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w74;
--		end if;
--when s75 =>
--		cmd <= "0010"; -- * kta_cp*(ta-ta0)
--		in1 <= resize(kta_cp,fptmp1);
--		in2 <= resize(tad,fptmp2);
--		state <= w75;
--when w75 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s76;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w75;
--		end if;
--when s76 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta_cp := resize(fpout,kta_cp);
--report_error("fail kta_cp*(Ta-Ta0) (ok,almost)", kta_cp, to_sfixed(0.00457763671875*(39.184-25.0),kta_cp)); -- ok,almost
--		state <= w76;
--when w76 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s77;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w76;
--		end if;
--when s77 =>
--		cmd <= "0000"; -- 1+kta_cp*(Ta-Ta0)
--		in1 <= to_sfixed(1.0,fptmp1);
--		in2 <= resize(kta_cp,fptmp2);
--		state <= w77;
--when w77 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s78;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w77;
--		end if;
--when s78 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kta_cp := resize(fpout,kta_cp);
--report_error("fail 1+kta_cp*(Ta-Ta0) (ok,almost)", kta_cp, to_sfixed(1.0+(0.00457763671875*(39.184-25.0)),kta_cp)); -- ok,almost
--		state <= w78;
--when w78 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s79;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w78;
--		end if;
--when s79 =>
--		cmd <= "0010"; -- * kv_cp*(vdd-vdd0)
--		in1 <= resize(kv_cp,fptmp1);
--		in2 <= resize(v0d,fptmp2);
--		state <= w79;
--when w79 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s80;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w79;
--		end if;
--when s80 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kv_cp := resize(fpout,kv_cp);
--report_error("fail kv_cp*(vdd-vdd0) (ok,almost)", kv_cp, to_sfixed(0.5*(3.319-3.3),kv_cp)); -- ok,almost
--		state <= w80;
--when w80 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s81;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w80;
--		end if;
--when s81 =>
--		cmd <= "0000"; -- 1+kv_cp*(vdd-vdd0)
--		in1 <= to_sfixed(1.0,fptmp1);
--		in2 <= resize(kv_cp,fptmp2);
--		state <= w81;
--when w81 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s82;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w81;
--		end if;
--when s82 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		kv_cp := resize(fpout,kv_cp);
--report_error("fail 1+kv_cp*(vdd-vdd0) (ok,almost)", kv_cp, to_sfixed(1.0+(0.5*(3.319-3.3)),kv_cp)); -- ok,almost
--		state <= w82;
--when w82 =>
--		if (v_wait1 = C_WAIT1-1) then
--			v_wait1 := 0;
--			state <= s83;
--		else
--			v_wait1 := v_wait1 + 1;
--			state <= w82;
--		end if;
--when s83 =>
--		cmd <= "0010"; -- * (1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
--		in1 <= resize(kta_cp,fptmp1);
--		in2 <= resize(kv_cp,fptmp2);
--		state <= w83;
--when w83 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s84; else v_wait1 := v_wait1 + 1; state <= w83; end if;
--when s84 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		ktacp_kvcp_mul := resize(fpout,ktacp_kvcp_mul);
--report_error("fail (1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", ktacp_kvcp_mul, to_sfixed((1.0+(0.00457763671875*(39.184-25.0)))*(1.0+(0.5*(3.319-3.3))),ktacp_kvcp_mul)); -- ok,almost
--		state <= w84;
--when w84 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s85; else v_wait1 := v_wait1 + 1; state <= w84; end if;
--when s85 =>
--		cmd <= "0010"; -- * OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
--		in1 <= resize(ktacp_kvcp_mul,fptmp1);
--		in2 <= resize(off_cpsubpage_0,fptmp2);
--		state <= w85;
--when w85 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s86; else v_wait1 := v_wait1 + 1; state <= w85; end if;
--when s86 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixos_cp_sp0 := resize(fpout,pixos_cp_sp0);
--report_error("fail OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp0, to_sfixed((-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)),pixos_cp_sp0)); -- ok,almost
--		state <= w86;
--when w86 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s87; else v_wait1 := v_wait1 + 1; state <= w86; end if;
--when s87 =>
--		cmd <= "0001"; -- - PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
--		in1 <= resize(pixgain_cp_sp0,fptmp1);
--		in2 <= resize(pixos_cp_sp0,fptmp2);
--		state <= w87;
--when w87 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s88; else v_wait1 := v_wait1 + 1; state <= w87; end if;
--when s88 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixos_cp_sp0 := resize(fpout,pixos_cp_sp0);
--report_fixed_value("PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp0);
--report_error("fail PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp0, to_sfixed((-54.9469153515065)-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)),pixos_cp_sp0)); -- ok,almost
--report_error("fail PIXgain_cp_sp0-OFF_CPsubpage_0*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp0, to_sfixed(25.6666575059956,pixos_cp_sp0)); -- ok,almost
--		state <= w88;
--when w88 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s89; else v_wait1 := v_wait1 + 1; state <= w88; end if;
--when s89 =>
--		cmd <= "0010"; -- * OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
--		in1 <= resize(ktacp_kvcp_mul,fptmp1);
--report_fixed_value("ktacp_kvcp_mul",ktacp_kvcp_mul);
--		in2 <= resize(off_cpsubpage_1,fptmp2);
--report_fixed_value("off_cpsubpage_1",off_cpsubpage_1);
--		state <= w89;
--when w89 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s90; else v_wait1 := v_wait1 + 1; state <= w89; end if;
--when s90 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixos_cp_sp1 := resize(fpout,pixos_cp_sp1);
--report_error("fail OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp1, to_sfixed((-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)),pixos_cp_sp1)); -- ok,almost
--		state <= w90;
--when w90 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s91; else v_wait1 := v_wait1 + 1; state <= w90; end if;
--when s91 =>
--		cmd <= "0001"; -- - PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))
--		in1 <= resize(pixgain_cp_sp1,fptmp1);
--report_fixed_value("pixgain_cp_sp1",pixgain_cp_sp1);
--		in2 <= resize(pixos_cp_sp1,fptmp2);
--report_fixed_value("pixos_cp_sp1",pixos_cp_sp1);
--		state <= w91;
--when w91 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s92; else v_wait1 := v_wait1 + 1; state <= w91; end if;
--when s92 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixos_cp_sp1 := resize(fpout,pixos_cp_sp1);
--report_fixed_value("PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0))", pixos_cp_sp1);
--report_error("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp1, to_sfixed((-56.9819862904511)-(-77.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)),pixos_cp_sp1)); -- ok,almost
--report_error("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost)", pixos_cp_sp1, to_sfixed(21.63158656770509,pixos_cp_sp1)); -- ok,almost -- xxx ??? ERROR on page 41 ??? xxx
--report_error("fail PIXgain_cp_sp1-OFF_CPsubpage_1*(1+KTa_CP*(Ta-Ta0))*(1+Kv_CP*(Vdd-VddV0)) (ok,almost), error ? on page 41 => pixos_cp_sp1 = 21.63158656770509", pixos_cp_sp1, to_sfixed(25.79655775862116562500,pixos_cp_sp1)); -- ok,almost -- xxx from bc calculator
--		state <= w92;
--when w92 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s93; else v_wait1 := v_wait1 + 1; state <= w92; end if;
--when s93 =>
---- ch_pattern
--		ch_pattern_12_16 := to_sfixed("000000000000000"&
--		std_logic_vector(
--		to_unsigned((integer((pixelnumber12_16-1)/32)-integer(integer((pixelnumber12_16-1)/32)/2)*2),1)
--		xor
--		to_unsigned((integer(pixelnumber12_16-1)-integer((pixelnumber12_16-1)/2)*2),1)
--		)&x"0000",ch_pattern_12_16
--		);
--report_fixed_value("ch_pattern_12_16",ch_pattern_12_16);
--		sftmp_slv_fpbits := x"0000"&x"f020" and x"0000"&x"003f"; -- ee[0x243c]
--		fpout := to_sfixed (sftmp_slv_fpbits(sfixed16'high downto 0)&x"0000", sfixed16'high, sfixed16'low);
--		sftmp_slv_fpbits := to_slv(fpout);
--		sftmp_slv_fpbits := "0000000000"&sftmp_slv_fpbits(21 downto 16)&x"0000";
--		tgcee := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--report_fixed_value("tgcee",tgcee);
--		tmps8 := resize(tgcee,tmps8);
--		tgcee := resize(tmps8,tgcee);
--report_fixed_value("tgcee",tgcee);
--		tgcee := tgcee srl 5;
--report_error("fail tgcee>/2^5", tgcee, to_sfixed(1.0,tgcee));
--		state <= w93;
--when w93 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s94; else v_wait1 := v_wait1 + 1; state <= w93; end if;
--when s94 =>
--		cmd <= "0010"; -- * CHIL_pattern*PIXos_cp_sp1
--		in1 <= resize(ch_pattern_12_16,fptmp1);
--report_fixed_value("ch_pattern_12_16",ch_pattern_12_16);
--		in2 <= resize(pixos_cp_sp1,fptmp2);
--report_fixed_value("pixos_cp_sp1",pixos_cp_sp1);
--		state <= w94;
--when w94 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s95; else v_wait1 := v_wait1 + 1; state <= w94; end if;
--when s95 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixospatt1 := resize(fpout,pixospatt1);
--		state <= w95;
--when w95 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s96; else v_wait1 := v_wait1 + 1; state <= w95; end if;
--when s96 =>
--		cmd <= "0001"; -- - (1-CHIL_pattern)
--		in1 <= to_sfixed(1.0,fptmp1);
--		in2 <= resize(ch_pattern_12_16,fptmp2);
--		state <= w96;
--when w96 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s97; else v_wait1 := v_wait1 + 1; state <= w96; end if;
--when s97 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		ch_pattern_12_16_minusone := resize(fpout,ch_pattern_12_16_minusone);
--		state <= w97;
--when w97 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s98; else v_wait1 := v_wait1 + 1; state <= w97; end if;
--when s98 =>
--		cmd <= "0010"; -- * (1-CHIL_pattern)*PIXos_cp_sp0
--		in1 <= resize(ch_pattern_12_16_minusone,fptmp1);
--report_fixed_value("ch_pattern_12_16_minusone",ch_pattern_12_16_minusone);
--		in2 <= resize(pixos_cp_sp0,fptmp2);
--report_fixed_value("pixos_cp_sp0",pixos_cp_sp0);
--		state <= w98;
--when w98 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s99; else v_wait1 := v_wait1 + 1; state <= w98; end if;
--when s99 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixospatt2 := resize(fpout,pixospatt2);
--		state <= w99;
--when w99 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s100; else v_wait1 := v_wait1 + 1; state <= w99; end if;
--when s100 =>
--		cmd <= "0000"; -- + ((1-CHIL_pattern)*PIXos_cp_sp0)+(CHIL_pattern*PIXos_cp_sp1)
--		in1 <= resize(pixospatt1,fptmp1);
--report_fixed_value("pixospatt1",pixospatt1);
--		in2 <= resize(pixospatt2,fptmp2);
--report_fixed_value("pixospatt2",pixospatt2);
--		state <= w100;
--when w100 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s101; else v_wait1 := v_wait1 + 1; state <= w100; end if;
--when s101 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixospatt12 := resize(fpout,pixospatt12);
--report_fixed_value("pixospatt12", pixospatt12);
--report_error("fail ((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) (ok,almost)", pixospatt12, 
--		to_sfixed(((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))
--		+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)))),pixospatt12)); -- ok,almost
----		to_sfixed(21.6315865670509,pixospatt12)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
--		state <= w101;
--when w101 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s102; else v_wait1 := v_wait1 + 1; state <= w101; end if;
--when s102 =>
--		cmd <= "0010"; -- * TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)
--		in1 <= resize(tgcee,fptmp1);
--		in2 <= resize(pixospatt12,fptmp2);
--		state <= w102;
--when w102 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s103; else v_wait1 := v_wait1 + 1; state <= w102; end if;
--when s103 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		pixospatt12 := resize(fpout,pixospatt12);
--report_fixed_value("TGC*pixospatt12", pixospatt12);
--report_error("fail TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) (ok,almost)", pixospatt12, 
--		to_sfixed((1.0*((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))
--		+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))),pixospatt12)); -- ok,almost
----		to_sfixed(21.6315865670509,pixospatt12)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
--		state <= w103;
--when w103 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s104; else v_wait1 := v_wait1 + 1; state <= w103; end if;
--when s104 =>
--		cmd <= "0001"; -- - VIR(12,16)EMISSIVITY_COMPENSATED-TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1)
--		in1 <= resize(vir12_16_emissitivy_componsated,fptmp1);
--		in2 <= resize(pixospatt12,fptmp2);
--		state <= w104;
--when w104 =>
--		if (v_wait1 = C_WAIT1-1) then v_wait1 := 0; state <= s105; else v_wait1 := v_wait1 + 1; state <= w104; end if;
--when s105 =>
--		sftmp_slv_fpbits := to_slv (out1);
--		fpout := to_sfixed (sftmp_slv_fpbits, sfixed16'high, sfixed16'low);
--		vir_12_16_compensated := resize(fpout,vir_12_16_compensated);
--report_fixed_value("vir_exmissivity_compensated-TGC*pixospatt12", vir_12_16_compensated);
--report_error("fail VIR(12,16)EMISSIVITY_COMPENSATED-TGC*((1-CHIL_pattern)*PIXos_cp_sp0+CHIL_pattern*PIXos_cp_sp1) (ok,almost)", vir_12_16_compensated, 
--		to_sfixed((700.882495690877-(1.0*((1.0-to_real(ch_pattern_12_16))*(-54.9469153515065-(-75.0)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3))))
--		+(to_real(ch_pattern_12_16)*(-56.9819862904511-(-77)*(1.0+0.00457763671875*(39.184-25.0))*(1.0+0.5*(3.319-3.3)))))),vir_12_16_compensated)); -- ok,almost
----		to_sfixed(679.250909123826,pixospatt12)); -- xxx ??? error on page 42 : right side vir_12_16_compensated
--		state <= w105;
--when w105 =>

when ending =>

when others => null;
end case; end if; end if;
--sftmp_slv_fpbits := sftmp_slv_fpbits;
end process tester;
end architecture testbench;

