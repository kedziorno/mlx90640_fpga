-- TestBench Template
-- p_fphdl_package1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.p_fphdl_package1.all;

ENTITY tb_p_fphdl_package1 IS
END tb_p_fphdl_package1;

ARCHITECTURE testbench OF tb_p_fphdl_package1 IS 

BEGIN

--  Test Bench Statements
tb : PROCESS
	variable fp_add : st_fp_add;
	variable fp_sub : st_fp_sub;
	variable fp_mul : st_fp_mul;
	variable fp_div : st_fp_div;
BEGIN
wait for 100 ns; -- wait until global set/reset completes
-- Add user defined stimulus here
report "fp_add_hi : " & integer'image(fp_add'high);
report "fp_add_lo : " & integer'image(fp_add'low);
report "fp_sub_hi : " & integer'image(fp_sub'high);
report "fp_sub_lo : " & integer'image(fp_sub'low);
report "fp_mul_hi : " & integer'image(fp_mul'high);
report "fp_mul_lo : " & integer'image(fp_mul'low);
report "fp_div_hi : " & integer'image(fp_div'high);
report "fp_div_lo : " & integer'image(fp_div'low);
report "done" severity failure;

wait; -- will wait forever
END PROCESS tb;
--  End Test Bench

END ARCHITECTURE testbench;
