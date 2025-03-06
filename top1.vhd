----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:25:15 12/08/2022 
-- Design Name: 
-- Module Name:    top1 - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top1 is
  Port ( SCL : in  STD_LOGIC;
         SDA : in  STD_LOGIC;
         ADDR : in  STD_LOGIC_VECTOR (6 downto 0);
         DATA : out  STD_LOGIC_VECTOR (7 downto 0);
         EN : in  STD_LOGIC;
         ACK : out  STD_LOGIC);
end top1;

architecture Behavioral of top1 is
  signal ADDR_int : STD_LOGIC_VECTOR (6 downto 0);
  signal DATA_int : STD_LOGIC_VECTOR (7 downto 0);
  signal ACK_int : STD_LOGIC;
begin
  process (SCL, EN, SDA)
  begin
    if EN = '1' then
      ADDR_int <= ADDR;
      DATA_int <= DATA;
      ACK_int <= '1';
    end if;
  end process;
  ADDR <= ADDR_int;
  DATA <= DATA_int;
  ACK <= ACK_int;
end Behavioral;

