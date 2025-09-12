----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:46:29 09/12/2025 
-- Design Name: 
-- Module Name:    i2c_stream - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity i2c_stream is
port (
i_reset : in std_logic;
i_scl : in std_logic;
o_sda : out std_logic;
i_mode2 : in std_logic;
i_enable : in std_logic;
i_addr : in std_logic_vector (15 downto 0)
);
end i2c_stream;

architecture Behavioral of i2c_stream is

COMPONENT mem_i2c_stream
PORT (
clka : IN STD_LOGIC;
ena : IN STD_LOGIC;
addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

begin

p0 : process (i_scl, i_reset) is
  type states is (idle, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);
  constant c_records : integer := 832;
  constant c_items : integer := 28 - 1; -- omit eeprom data at begining
  variable v_items : integer range 0 to c_items - 1;
  variable v_index : integer range 0 to c_items * c_records - 1;
  variable v_addr : std_logic_vector (15 downto 0);
  variable c_omit : integer := 37;
  variable v_omit : integer range 0 to c_ommit - 1;
begin
  if (i_reset = '1') then
    state := idle;
    v_items := 0;
    v_index := 0;
    v_omit := 0;
    v_addr := (others => '0');
  elsif (rising_edge (i_scl)) then
    case (state) is
      when idle =>
        if (i_enable = '1') then
          state := s1;
          if (i_addr = x"2400") then
            v_index := 0;
          end if;
          if (i_addr = x"0400") then
            v_index := c_records * v_index;
          end if;
        end if;
      when s1 =>
        if (v_omit = c_omit - 1) then
          state := s2;
          v_omit := 0;
        else
          v_omit := v_omit + 1;
        end if;
      when s2 =>
        addra <= std_logic_vector (to_unsigned (v_index + i, 16));
        if (v_data = c_data - 1) then
          v_data := 0;
        else
          o_sda <= douta (v_data);
        end if;
      when s3 => -- ack
        state := s4;
      when s4 =>
        if (v_data = c_data - 1) then
          v_data := 0;
        else
          o_sda <= douta (8 + v_data);
        end if;
      when s5 => -- ack
        state := s6;
      when s6 =>
        state := idle;
    end case;
  end if;
end process p0;

mem_i2c_stream_i0 : mem_i2c_stream
PORT MAP (
clka => i_scl,
ena => i_enable,
addra => addra,
douta => douta
);

end Behavioral;

