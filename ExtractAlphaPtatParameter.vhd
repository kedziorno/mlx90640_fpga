----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:44 01/24/2023 
-- Design Name: 
-- Module Name:    ExtractAlphaPtatParameter - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity ExtractAlphaPtatParameter is
port (
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2410 : IN  std_logic_vector (15 downto 0);
o_alphaptat: OUT  std_logic_vector (31 downto 0)
);
end ExtractAlphaPtatParameter;

architecture Behavioral of ExtractAlphaPtatParameter is

signal odata_alphaptat : std_logic_vector (31 downto 0);
signal address_alphaptat : std_logic_vector (8 downto 0);

begin

--p0 : process (i_ee0x2410) is
--begin
--	address_alphaptat <= std_logic_vector(to_unsigned(to_integer(unsigned("000000000000"&i_ee0x2410 (15 downto 12))),9));
--end process p0;
--
--o_alphaptat <= odata_alphaptat;
--
--inst_mem_alphaptat : RAMB16_S36
--generic map (
--INIT => X"000000000",
--SRVAL => X"000000000",
--WRITE_MODE => "WRITE_FIRST",
--INIT_00 => X"411c0000411800004114000041100000410c0000410800004104000041000000",
--INIT_01 => X"413c0000413800004134000041300000412c0000412800004124000041200000"
--)
--port map (
--DO => odata_alphaptat,
--DOP => open,
--ADDR => address_alphaptat,
--CLK => i_clock,
--DI => (others => '0'),
--DIP => (others => '0'),
--EN => '1',
--SSR => i_reset,
--WE => '0'
--);

end Behavioral;

