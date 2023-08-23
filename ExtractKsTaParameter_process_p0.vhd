----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:45 06/16/2023 
-- Design Name: 
-- Module Name:    ExtractKsTaParameter_process_p0 - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package3.all;

entity ExtractKsTaParameter_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

address_ksta : out std_logic_vector (7 downto 0);
odata_ksta : in std_logic_vector (31 downto 0);

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_ksta : out std_logic_vector (31 downto 0);
o_rdy : out std_logic

);
end ExtractKsTaParameter_process_p0;

architecture Behavioral of ExtractKsTaParameter_process_p0 is

begin

p0 : process (i_clock) is
	type states is (idle,
	s1,s2,s3,s4,s5,
	ending);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			i2c_mem_ena <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
						i2c_mem_ena <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
					end if;
				when s1 => state := s2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (60*2+0, 12)); -- 243c MSB kstaee 8bit
				when s2 => state := s3;
				when s3 => state := s4;
					address_ksta <= i2c_mem_douta; -- kstaee
				when s4 => state := s5;
				when s5 => state := ending;
					o_ksta <= odata_ksta;
                                    report_error ("================ extractKsTaParameters ksta : ",odata_ksta,0.0);
				when ending => state := idle;
					o_rdy <= '1';
			end case;
		end if;
	end if;
end process p0;

end Behavioral;

