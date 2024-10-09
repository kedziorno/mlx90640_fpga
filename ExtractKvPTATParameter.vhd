----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:53:33 01/25/2023 
-- Design Name: 
-- Module Name:    ExtractKvPTATParameter - Behavioral 
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

entity ExtractKvPTATParameter is
port (
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x2432 : IN  std_logic_vector (15 downto 0);
o_kvptat_ena : out std_logic;
o_kvptat_adr : out std_logic_vector (5 downto 0);
i_kvptat_val : in std_logic_vector (31 downto 0);
o_kvptat : OUT  std_logic_vector (31 downto 0)
);

end ExtractKvPTATParameter;

architecture Behavioral of ExtractKvPTATParameter is

signal odata_kvptat : std_logic_vector (31 downto 0);
signal address_kvptat : std_logic_vector (8 downto 0);

begin

--o_kvptat  <= odata_kvptat;
--
--p0 : process (i_ee0x2432) is
--begin
--	address_kvptat <= std_logic_vector (to_unsigned (to_integer (unsigned ("000"&i_ee0x2432 (15 downto 10))),9));
--end process p0;
--
--inst_mem_kvptat : RAMB16_S36
--generic map (
--INIT => X"000000000",
--SRVAL => X"000000000",
--WRITE_MODE => "WRITE_FIRST",
--INIT_00 => X"3ae000003ac000003aa000003a8000003a4000003a0000003980000000000000",
--INIT_01 => X"3b7000003b6000003b5000003b4000003b3000003b2000003b1000003b000000",
--INIT_02 => X"3bb800003bb000003ba800003ba000003b9800003b9000003b8800003b800000",
--INIT_03 => X"3bf800003bf000003be800003be000003bd800003bd000003bc800003bc00000",
--INIT_04 => X"bbc80000bbd00000bbd80000bbe00000bbe80000bbf00000bbf80000bc000000",
--INIT_05 => X"bb880000bb900000bb980000bba00000bba80000bbb00000bbb80000bbc00000",
--INIT_06 => X"bb100000bb200000bb300000bb400000bb500000bb600000bb700000bb800000",
--INIT_07 => X"b9800000ba000000ba400000ba800000baa00000bac00000bae00000bb000000"
--)
--port map (
--DO => odata_kvptat,
--DOP => open,
--ADDR => address_kvptat,
--CLK => i_clock,
--DI => (others => '0'),
--DIP => (others => '0'),
--EN => '1',
--SSR => i_reset,
--WE => '0'
--);

end Behavioral;

