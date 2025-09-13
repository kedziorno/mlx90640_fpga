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
use IEEE.NUMERIC_STD.ALL;

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
addra : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT;

signal clka : STD_LOGIC;
signal ena : STD_LOGIC;
signal addra : STD_LOGIC_VECTOR(14 DOWNTO 0);
signal douta : STD_LOGIC_VECTOR(15 DOWNTO 0);

type states is (idle, idle1, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);
signal state : states;
constant c_records : integer := 832;
signal v_records : integer range 0 to c_records - 1;
constant c_items : integer := 28 - 1; -- omit eeprom data at begining
signal v_items : integer range 0 to c_items - 1;
signal v_index : integer range 0 to c_items * c_records - 1;
signal v_addr : std_logic_vector (15 downto 0);
signal c_omit : integer := 37;
signal v_omit : integer range 0 to c_omit - 1;
constant c_data : integer := 8;
signal v_data : integer range 0 to c_data - 1;

begin

		addra <= std_logic_vector (to_unsigned (v_index + v_records, 16));

p0 : process (i_scl, i_reset) is
begin
  if (i_reset = '1') then
    state <= idle;
    v_data <= 0;
    v_items <= 0;
    v_index <= 0;
    v_omit <= 0;
    v_addr <= (others => '0');
  elsif (rising_edge (i_scl)) then
    case (state) is
      when idle =>
        if (i_enable = '1') then
        if (v_omit = c_omit - 1) then
          state <= s2;
          v_omit <= 0;
        else
          v_omit <= v_omit + 1;
        end if;
        end if;
      when idle1 =>
      when s1 => -- omit i2c set data
      when s2 =>
		if (i_addr = x"2400") then
		  v_index <= 0;
		end if;
		if (i_addr = x"0400") then
		  v_index <= c_records * v_items;
		end if;
        if (v_data = c_data - 1) then
          state <= s3;
        else
          o_sda <= douta (v_data);
          v_data <= v_data + 1;
        end if;
      when s3 => -- ack
        state <= s4;
          v_data <= 0;
		  o_sda <= '0';
      when s4 =>
        if (v_data = c_data - 1) then -- 8
          state <= s5;
          v_data <= 0;
        if (v_records = c_records - 1) then
          v_records <= 0;
			if (v_items = c_items - 1) then
			  v_items <= 0;
			  state <= idle;
			else
			  v_items <= v_items + 1; -- 28
          state <= s5;
			end if;
        else
          v_records <= v_records + 1; -- 832
          --state <= s5;
        end if;
        else
          o_sda <= douta (8 + v_data);
          v_data <= v_data + 1;
        end if;
      when s5 => -- ack
        state <= s2;
          v_data <= 0;
		  o_sda <= '0';
      when s6 =>
      when s7 =>
      when others => null;
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

