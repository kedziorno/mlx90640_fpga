-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   21:46:29 09/12/2025
-- Design Name:   mlx90640_fpga
-- Module Name:   mlx90640_i2c_stream
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Module used in project for send example stream over i2c.
--                For now, module return data when receive addresses:
--                  - 2400 (eeprom)
--                  - 0400 (frame data)
--                Example data accomodate 21 RAMB16 on device.
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files: -
--  - Modules: -
--
-- Revision:
--  - Revision 0.01a - File created
--    - Files: -
--    - Modules: -
--    - Processes (Architecture: rtl):
--      - p4_reset_index_sr - reset counters and shift register
--      - p3_extract_i2c_bytes - extract address and two byte data
--      - p2_sda_data_sr - catch bits from data line
--      - p1_re_fe_i2c - rising/falling detection on scl
--      - p0_main
--
-- Important objects:
--  - Entity signals:
--    - o_data_debug - return current 16-bit value
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos: -
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones: -
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library unisim;
--use unisim.vcomponents.all;

entity mlx90640_i2c_stream is
generic (
  constant c_board_clock : integer := 1;
  constant c_bus_clock : integer := 1
);
port (
  i_clock : in std_logic;
  i_reset : in std_logic;
  -- i2c interface
  i_scl  : in    std_logic;
  io_sda : inout std_logic := 'Z';
  -- debug
  o_data_debug : out std_logic_vector (15 downto 0) -- XXX
);
end entity mlx90640_i2c_stream;

architecture rtl of mlx90640_i2c_stream is

component mem_i2c_stream
port (
  clka  : in  std_logic;
  ena   : in  std_logic;
  addra : in  std_logic_vector (14 downto 0);
  douta : out std_logic_vector (15 downto 0)
);
end component mem_i2c_stream;
signal addra : std_logic_vector (14 downto 0);
signal douta : std_logic_vector (15 downto 0);

constant c_i2c_address     : integer := 7;
constant c_data            : integer := 8;
constant c_records         : integer := 832;
constant c_items           : integer := 26 - 1; -- 832 * number frames (blocks) in memory, without eeprom data at begining
constant c_i2c_divider     : integer := (c_board_clock / c_bus_clock) / 1;
constant c_sda_recv_length : integer := c_i2c_address + 1 + 1 + (c_data + 1) * 2 + 1; -- XXX 2 or 4 bytes data, address and ack's
constant c_i2c_device      : std_logic_vector (c_i2c_address - 1 downto 0) := "0110011"; -- XXX 33h
constant c_eeprom_address  : std_logic_vector (15 downto 0) := x"2400";
constant c_frame_address   : std_logic_vector (15 downto 0) := x"0400";

signal index     : integer range 0 to c_sda_recv_length - 1;
signal v_records : integer range 0 to c_records - 1;
signal v_items   : integer range 0 to c_items - 1;
signal v_index   : integer range 0 to c_items * c_records - 1;
signal v_data    : integer range c_data - 1 downto 0;

signal scl_prev, scl_re, scl_fe : std_logic;
signal sda_o, sda_i             : std_logic;
signal reset_index              : std_logic;
signal sda_prev, sda_read_cond  : std_logic;

signal sda_data             : std_logic_vector (c_sda_recv_length - 1 downto 0);
signal i2c_address          : std_logic_vector (6 downto 0);
signal i2c_data0, i2c_data1 : std_logic_vector (7 downto 0);
signal reset_index_sr       : std_logic_vector (31 downto 0); -- XXX can be larger when scl slower

type states is (idle, idle1, idle2, idle3, s1, s2, s3, s4);
signal state : states;

begin

io_sda <= sda_o;
sda_i <= '1' when (io_sda = '1' or io_sda = 'Z') else '0';

addra <= std_logic_vector (to_unsigned (v_index + v_records, 15));

o_data_debug <= douta;

p4_reset_index_sr : process (i_clock, i_reset) is
begin
  if (i_reset = '1') then
    reset_index_sr <= (others => '0');
  elsif (rising_edge (i_clock)) then
    if (sda_i = '1' and i_scl = '1') then
      reset_index_sr <= '1' & reset_index_sr (reset_index_sr'left downto 1);
    else
      reset_index_sr <= (others => '0');
    end if;
  end if;
end process p4_reset_index_sr;
reset_index <= '1' when reset_index_sr = x"ffffffff" else '0';

p3_extract_i2c_bytes : process (i_scl) is
begin
  if (rising_edge (i_scl)) then
    if (index = 7) then
      i2c_address <= sda_data (6 downto 0);
    end if;
    if (index = 17) then
      i2c_data0 <= sda_data (7 downto 0);
    end if;
    if (index = 26) then
      i2c_data1 <= sda_data (7 downto 0);
    end if;
  end if;
end process p3_extract_i2c_bytes;

p2_sda_data_sr : process (i_clock, i_reset) is
begin
  if (i_reset = '1') then
    sda_data <= (others => '0');
    index <= 0;
  elsif (rising_edge (i_clock)) then
    if (scl_re = '1') then
      sda_data <= sda_data (sda_data'left-1 downto 0) & sda_i;
      if (index = c_sda_recv_length - 1 or sda_read_cond = '1') then
        index <= 0;
      else
        index <= index + 1;
      end if;
    end if;
    if (reset_index = '1') then
      index <= 0;
    end if;
  end if;
end process p2_sda_data_sr;

p1_re_fe_i2c : process (i_clock) is
begin
  if (rising_edge (i_clock)) then
    scl_prev <= i_scl;
    sda_prev <= sda_i;
  end if;
end process p1_re_fe_i2c;
scl_fe <= '1' when (scl_prev = '1' and i_scl = '0') else '0';
scl_re <= '1' when (scl_prev = '0' and i_scl = '1') else '0';
sda_read_cond <= '1' when ((sda_prev = '1' and sda_i = '0') and i_scl = '1') else '0';

p0_main : process (i_clock, i_reset) is
begin
  if (i_reset = '1') then
    state <= idle;
    v_data <= c_data - 1;
    v_items <= 1;
    v_index <= 0;
    sda_o <= 'Z';
  elsif (rising_edge (i_clock)) then
      case (state) is
        when idle =>
          if (scl_fe = '1') then
            state <= idle1;
          end if;
        when idle1 =>
          if (i2c_address = c_i2c_device and (
            (i2c_data0 & i2c_data1 = c_eeprom_address) or 
            (i2c_data0 & i2c_data1 = c_frame_address)
          )) then
            state <= idle2;
          end if;
          sda_o <= 'Z';
          v_records <= 0;
          v_data <= c_data - 1;
        when idle2 =>
          if (sda_read_cond = '1') then
            state <= idle3;
          end if;
          if ((i2c_address & i2c_data0 & i2c_data1) = c_i2c_device & c_eeprom_address) then -- eeprom data
            v_index <= 0;
          end if;
          if ((i2c_address & i2c_data0 & i2c_data1) = c_i2c_device & c_frame_address) then -- frame data
            v_index <= c_records * v_items;
          end if;
        when idle3 =>
          if (index = 9) then
            state <= s1;
          end if;
        when s1 =>
          if (scl_fe = '1') then
            if (v_data = 0) then
              state <= s2;
              v_data <= c_data - 1;
            else
              v_data <= v_data - 1;
            end if;
            sda_o <= douta (8 + v_data);
          end if;
        when s2 => -- ack
          if (scl_fe = '1') then
            state <= s3;
            sda_o <= '0';
          end if;
        when s3 =>
          if (scl_fe = '1') then
            if (v_data = 0) then
              state <= s4;
              v_data <= c_data - 1;
            else
              v_data <= v_data - 1;
            end if;
            sda_o <= douta (v_data);
          end if;
        when s4 => -- ack
          if (scl_fe = '1') then
            if (v_records = c_records - 1) then
              v_records <= 0;
              if (v_items = c_items - 1) then
                state <= idle;
                v_items <= 0;
                sda_o <= '1';
              else
                state <= idle;
                v_items <= v_items + 1;
                sda_o <= '1';
              end if;
            else
              state <= s1;
              v_records <= v_records + 1;
              sda_o <= '0';
            end if;
            v_data <= c_data - 1;
            sda_o <= '0';
          end if;
      end case;
    end if;
end process p0_main;

-- memory with i2c stream - can be more than one frame
-- each item have two byte
-- blocks accomodate based on pattern : from (X-1) * 832 to X * 832
-- eeprom - X = 1
-- data - X > 1
mem_i2c_stream_i0 : mem_i2c_stream
port map (
  clka => i_scl,
  ena => '1',
  addra => addra,
  douta => douta
);

end architecture rtl;

