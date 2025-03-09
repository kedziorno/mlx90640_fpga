library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.float_pkg.all;
use work.p_fphdl_package1.all;

entity fixed2float is
    Port (
        clk     : in std_logic;
        x       : in  std_logic_vector(FP_BITS-1 downto 0);
        y       : out fd2ft
    );
end fixed2float;

architecture Behavioral of fixed2float is

begin


    set_c: process(clk)
	 variable sf : sfixed (FP_INTEGER-1 downto -FP_FRACTION);
    begin 
        if rising_edge(clk) then
           y <= to_slv(to_float (to_sfixed (x, sf), float32'high, -float32'low));
        end if;
    end process;

end Behavioral;
