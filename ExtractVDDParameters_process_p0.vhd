----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:58 06/07/2023 
-- Design Name: 
-- Module Name:    ExtractVDDParameters_process_p0 - Behavioral 
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

entity ExtractVDDParameters_process_p0 is
port (
signal i_clock : in std_logic;
signal i_reset : in std_logic;
signal i_run : in std_logic;
signal i2c_mem_ena : out std_logic;
signal i2c_mem_addra : out std_logic_vector (11 downto 0);
signal i2c_mem_douta : in std_logic_vector (7 downto 0);
signal address_kvdd : out std_logic_vector (14 downto 0);
signal address_vdd25 : out std_logic_vector (14 downto 0);
signal data_kvdd : in std_logic_vector (31 downto 0);
signal data_vdd25 : in std_logic_vector (31 downto 0);
signal o_kvdd : out std_logic_vector (31 downto 0);
signal o_vdd25 : out std_logic_vector (31 downto 0);
signal o_rdy : out std_logic
);
end ExtractVDDParameters_process_p0;

architecture Behavioral of ExtractVDDParameters_process_p0 is

begin

p0 : process (i_clock) is
	variable ee2433 : std_logic_vector (15 downto 0);
	type states is (idle,s1,s2,s3,s4,s5,s6,s7,ending);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			i2c_mem_ena <= '0';
			o_rdy <= '0';
      address_kvdd <= (others => '0');
      address_vdd25 <= (others => '0');
      o_kvdd <= (others => '0');
      o_vdd25 <= (others => '0');
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
					i2c_mem_addra <= std_logic_vector (to_unsigned (51*2+0, 12)); -- 2433 MSB kvdd
				when s2 => state := s3;
					i2c_mem_addra <= std_logic_vector (to_unsigned (51*2+1, 12)); -- 2433 LSB vdd25
				when s3 => state := s4;
					ee2433 (15 downto 8) := i2c_mem_douta;
				when s4 => state := s5;
					ee2433 (7 downto 0) := i2c_mem_douta;
				when s5 => state := s6;
					address_kvdd <= std_logic_vector (to_unsigned (to_integer (unsigned ("0"&ee2433 (15 downto 8))) * 32, 15));
					address_vdd25 <= std_logic_vector (to_unsigned (to_integer (unsigned ("1"&ee2433 (7 downto 0))) * 32, 15));
				when s6 => state := s7;
				when s7 => state := ending;
					o_kvdd <= data_kvdd;
					o_vdd25 <= data_vdd25;
          report_error ("======================= kvdd : ",data_kvdd,0.0);
          report_error ("======================= vdd25 : ",data_vdd25,0.0);
				when ending => state := idle;
					o_rdy <= '1';
			end case;
		end if;
	end if;
end process p0;

end Behavioral;

