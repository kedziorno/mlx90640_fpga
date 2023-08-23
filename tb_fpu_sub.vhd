-------------------------------------------------------------------------------
--
-- Project:	<Floating Point Unit Core>
--  	
-- Description: test bench for the FPU core
-------------------------------------------------------------------------------
--
--				100101011010011100100
--				110000111011100100000
--				100000111011000101101
--				100010111100101111001
--				110000111011101101001
--				010000001011101001010
--				110100111001001100001
--				110111010000001100111
--				110110111110001011101
--				101110110010111101000
--				100000010111000000000
--
-- 	Author:		 Jidan Al-eryani 
-- 	E-mail: 	 jidan@gmx.net
--
--  Copyright (C) 2006
--
--	This source file may be used and distributed without        
--	restriction provided that this copyright statement is not   
--	removed from the file and that any derivative work contains 
--	the original copyright notice and the associated disclaimer.
--                                                           
--		THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     
--	EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   
--	TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   
--	FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      
--	OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         
--	INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    
--	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   
--	GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        
--	BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  
--	LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  
--	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  
--	OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         
--	POSSIBILITY OF SUCH DAMAGE. 
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_misc.all;
use std.textio.all;
use work.txt_util.all;

        -- fpu operations (fpu_op_i):
		-- ========================
		-- 000 = add, 
		-- 001 = substract, 
		-- 010 = multiply, 
		-- 011 = divide,
		-- 100 = square root
		-- 101 = unused
		-- 110 = unused
		-- 111 = unused
		
        -- Rounding Mode: 
        -- ==============
        -- 00 = round to nearest even(default), 
        -- 01 = round to zero, 
        -- 10 = round up, 
        -- 11 = round down


entity tb_fpu_sub is
end tb_fpu_sub;

architecture rtl of tb_fpu_sub is

component fpu_sub
    port (
        clk_i       	: in std_logic;
        opa_i       	: in std_logic_vector(31 downto 0);   
        opb_i       	: in std_logic_vector(31 downto 0);
        output_o    	: out std_logic_vector(31 downto 0);
		    start_i	  		: in  std_logic;
        ready_o 		: out std_logic	
	);   
end component;


signal clk_i : std_logic:= '1';
signal opa_i, opb_i : std_logic_vector(31 downto 0);
signal fpu_op_i		: std_logic_vector(2 downto 0);
signal rmode_i : std_logic_vector(1 downto 0);
signal output_o : std_logic_vector(31 downto 0);
signal start_i, ready_o : std_logic ; 
signal ine_o, overflow_o, underflow_o, div_zero_o, inf_o, zero_o, qnan_o, snan_o: std_logic;



signal slv_out : std_logic_vector(31 downto 0);

constant CLK_PERIOD :time := 10 ns; -- period of clk period


begin

    -- instantiate fpu
    i_fpu_sub : fpu_sub port map (
			clk_i => clk_i,
			opa_i => opa_i,
			opb_i => opb_i,
			output_o => output_o,  
        	start_i => start_i,
        	ready_o => ready_o);		
			

    ---------------------------------------------------------------------------
    -- toggle clock
    ---------------------------------------------------------------------------
    clk_i <= not(clk_i) after 5 ns;


    verify : process 
		--The operands and results are in Hex format. The test vectors must be placed in a strict order for the verfication to work.
		file testcases_file: TEXT open read_mode is "test_bench/testcases_sub.txt"; --Name of the file containing the test cases. 

		variable file_line: line;
		variable str_in: string(8 downto 1);
		variable str_fpu_op: string(3 downto 1);
		variable str_rmode: string(2 downto 1);
		
			-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2Fraytrac%2Fbranches%2Ffp%2Farithpack.vhd&rev=163
	function ap_slv2int (sl:std_logic_vector) return integer is
		alias s : std_logic_vector (sl'high downto sl'low) is sl;
		variable i : integer; 
	begin
		i:=0;
		for index in s'high downto s'low loop
			if s(index)='1' then
				i:=i*2+1;
			else
				i:=i*2;
			end if;
		end loop;
		return i;
 
	end function;
	
	function ap_slv2fp(sl:std_logic_vector) return real is
		variable frc:integer;
		alias s: std_logic_vector(31 downto 0) is sl;
		variable f,expo: real;
	begin
		expo:=real(ap_slv2int(s(30 downto 23)) - 127);
		expo:=(2.0)**(expo);
		frc:=ap_slv2int('1'&s(22 downto 0));
		f:=real(frc)*(2.0**(-23.0));
		f:=f*real(expo);
 
		if s(31)='1' then
			return -f;
		else
			return f;
		end if;
	end function;

    begin


		---------------------------------------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------SoftFloat test vectors (10000 test cases for each operation) --------------------------------------------------------------------
		start_i <= '0';
		while not endfile(testcases_file) loop

			wait for CLK_PERIOD; start_i <= '1';
			
			str_read(testcases_file,str_in);
			opa_i <= strhex_to_slv(str_in);
			
			str_read(testcases_file,str_in);
			opb_i <= strhex_to_slv(str_in);

			str_read(testcases_file,str_fpu_op);
			fpu_op_i <= to_std_logic_vector(str_fpu_op);
			
			str_read(testcases_file,str_rmode);
			rmode_i <= to_std_logic_vector(str_rmode);
			
			str_read(testcases_file,str_in);
			slv_out <= strhex_to_slv(str_in);
			
			wait for CLK_PERIOD; start_i <= '0'; wait until ready_o='1';

	assert
	output_o = slv_out
	report
	"Bad!!! " &
	real'image(ap_slv2fp(opa_i)) & " - " & real'image(ap_slv2fp(opb_i)) &
	" => " & real'image(ap_slv2fp(output_o)) & ", file = " & real'image(ap_slv2fp(slv_out))
	severity note;

			str_read(testcases_file,str_in);
			
		end loop;		

		-------- Boundary values-----
		
		start_i <= '0';
		--		  seeeeeeeefffffffffffffffffffffff
		--infinity
		wait for CLK_PERIOD; start_i <= '1'; 
		opa_i <= "01111111011111111111111111111111";  
		opb_i <= "01111111011111111111111111111111"; 
		fpu_op_i <= "001";
		rmode_i <= "01";
		wait for CLK_PERIOD; start_i <= '0'; wait until ready_o='1';
		assert output_o="01111111100000000000000000000000"
		report "Error1!!!"
		severity note;
		
		--		  seeeeeeeefffffffffffffffffffffff
		-- 1 x1.001 - 1x1.000 = 0x0.001
		wait for CLK_PERIOD; start_i <= '1'; 
		opa_i <= "00000000100100000000000000000000";  
		opb_i <= "10000000100000000000000000000000"; 
		fpu_op_i <= "001";
		rmode_i <= "01";
		wait for CLK_PERIOD; start_i <= '0'; wait until ready_o='1';
		assert output_o="00000000000100000000000000000000"
		report "Error2!!!"
		severity note;	

		--		  seeeeeeeefffffffffffffffffffffff
		-- 10 x 1.0001 - 10 x 1.0000 = 
		wait for CLK_PERIOD; start_i <= '1'; 
		opa_i <= "00000001000010000000000000000000";  
		opb_i <= "10000001000000000000000000000000"; 
		fpu_op_i <= "001";
		rmode_i <= "01";
		wait for CLK_PERIOD; start_i <= '0'; wait until ready_o='1';
		assert output_o="00000000000100000000000000000000"
		report "Error3!!!"
		severity note;
		

		--		  seeeeeeeefffffffffffffffffffffff
		-- -0 -0 = -0  
		wait for CLK_PERIOD; start_i <= '1'; 
		opa_i <= "10000000000000000000000000000000";  
		opb_i <= "10000000000000000000000000000000"; 
		fpu_op_i <= "001";
		rmode_i <= "01";
		wait for CLK_PERIOD; start_i <= '0'; wait until ready_o='1';
		assert output_o="10000000000000000000000000000000"
		report "Error4!!!"
		severity note;
		
		--		  seeeeeeeefffffffffffffffffffffff
		-- 0 + x = x 
		wait for CLK_PERIOD; start_i <= '1'; 
		opa_i <= "00000000000000000000000000000000";  
		opb_i <= "01000010001000001000000000100000"; 
		fpu_op_i <= "001";
		rmode_i <= "01";
		wait for CLK_PERIOD; start_i <= '0'; wait until ready_o='1';
		assert output_o="01000010001000001000000000100000"
		report "Error5!!!"
		severity note;
		

		----------------------------------------------------------------------------------------------------------------------------------------------------
		assert false
		report "Success!!!.......Yahoooooooooooooo"
		severity failure;	
				
    	wait;

    end process verify;

end rtl;