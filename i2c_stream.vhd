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
i_clock : in std_logic;
i_reset : in std_logic;
i_scl : in std_logic;
i_mode2 : in std_logic;
i_enable : in std_logic;
i_addr : in std_logic_vector (15 downto 0);
o_sda : out std_logic := 'Z';
o_done : out std_logic;
compare1 : in integer;
o_data : out std_logic_vector (15 downto 0)
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

signal addra : STD_LOGIC_VECTOR(14 DOWNTO 0);
signal douta : STD_LOGIC_VECTOR(15 DOWNTO 0);

type states is (idle, s1, s2, s3, s4);
signal state : states;
constant c_records : integer := 832;
signal v_records : integer range 0 to c_records - 1;
constant c_items : integer := 28 - 1; -- omit eeprom data at begining
signal v_items : integer range 0 to c_items - 1;
signal v_index : integer range 0 to c_items * c_records - 1;
signal v_addr : std_logic_vector (15 downto 0);
signal c_omit : integer := 37;
signal v_omit : integer;
constant c_data : integer := 8;
signal v_data : integer range c_data - 1 downto 0;

signal scl_prev, scl_re : std_logic;
signal sda : std_logic;

begin

o_sda <= sda when i_enable = '1' else 'Z';

addra <= std_logic_vector (to_unsigned (v_index + v_records, 15));

p1 : process (i_clock) is
begin
  if (falling_edge (i_clock)) then
    scl_prev <= i_scl;
  end if;
end process p1;

scl_re <= '1' when (scl_prev = '1' and i_scl = '0') else '0';

o_data <= douta;

p0 : process (i_clock, i_reset) is
begin
  if (i_reset = '1') then
    state <= idle;
    v_data <= c_data - 1;
    v_items <= 1;
    v_index <= 0;
    v_omit <= 0;
    v_addr <= (others => '0');
    sda <= 'Z';
    o_done <= '0';
  elsif (falling_edge (i_clock)) then
    if (scl_re = '1') then
      case (state) is
        when idle =>
          o_done <= '0';
          sda <= 'Z';
          v_records <= 0;
          v_data <= c_data - 1;
          if (i_enable = '1') then
            if (v_omit = compare1 - 1) then -- omit set address
--            if (v_omit = c_omit - 1) then -- omit set address
              state <= s1;
              v_omit <= 0;
            else
              v_omit <= v_omit + 1;
            end if;
          end if;
        when s1 =>
          sda <= douta (8 + v_data);
          if (i_enable = '0') then
            state <= idle;
          end if;
          if (i_addr = x"2400") then -- eeprom data
            v_index <= 0;
          end if;
          if (i_addr = x"0400") then -- frame data
            v_index <= c_records * v_items;
          end if;
          if (v_data = 0) then
            v_data <= c_data - 1;
            state <= s2;
          else
            v_data <= v_data - 1; -- 8
          end if;
        when s2 => -- ack
          state <= s3;
          sda <= 'Z';
        when s3 =>
          sda <= douta (v_data);
          if (v_data = 0) then
            state <= s4;
            v_data <= c_data - 1;
          else
            v_data <= v_data - 1; -- 8
          end if;
        when s4 => -- ack
          v_data <= c_data - 1;
          sda <= 'Z';
          if (v_records = c_records - 1) then
            v_records <= 0;
            if (v_items = c_items - 1) then
              state <= idle;
              v_items <= 0;
              o_done <= '1';
              sda <= 'Z';
            else
              state <= idle;
              if (i_addr = x"0400") then
                v_items <= v_items + 1; -- 28
              end if;
              o_done <= '1';
              sda <= 'Z';
            end if;
          else
            state <= s1;
            v_records <= v_records + 1; -- 832
            sda <= 'Z';
          end if;
      end case;
    end if;
  end if;
end process p0;

mem_i2c_stream_i0 : mem_i2c_stream
port map (
  clka => i_scl,
  ena => i_enable,
  addra => addra,
  douta => douta
);

end Behavioral;

