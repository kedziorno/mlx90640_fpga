-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   12:10:35 08/09/2025
-- Design Name:   mlx90640_fpga
-- Module Name:   melexis_mlx90640_i2c
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Communication module with Melexis MLX90640 over I2C standard.
--                Tested on Digilent Nexys-2 (xc3s1200e) using 7seg LCD.
--                For now version for device MLX90640 works and be tested,
--                whereas rest configuration must be set in global_package.vhd.
--                How it works:
--                  Lets assume address device is 0x33 (p. 9, Table 5).
--                  When enable only one mode available in entity (i_mode0,
--                  i_mode1, i_mode2) and set dependent address/data, module
--                  use I2C line (SCL,SDA) for communicate with Melexis device
--                  and catch data from SDA line in each rising edge SCL.
--                  This three steps must be done to communicate with device
--                  and retrieve data. In points 2 and 3, rising/falling edge
--                  of o_mode2_ready and i_mode2 signals can be used to
--                  manipulate write to RAM.
--                    1) Set internal registers for device
--                      - Set Control Register 1 (p. 17, Figure 12)
--                        - i_mode0          - 1 (Write 4 bytes)
--                        - i_memory_address - 0x800d (Control Register 1)
--                        - i_memory_data    - 0x1981
--                          (Chess pattern, ADC 18bit, IR refresh 4Hz,
--                           Subpage 0 first, Subpage mode)
--                        - i_enable         - 1 (Enable module)
--                      - Wait some cycles
--                        (to be sure > 100 and depend from SCL clock speed)
--                        and when o_busy is set, disable module (i_enable = 0)
--                    2) Read EEPROM data
--                      - Read from address map (p. 16, Figure 10)
--                        - i_mode2          - 1
--                          (Read N two-bytes data, 0x2400 - 0x273F)
--                        - i_memory_address - 0x2400 (EEPROM)
--                        - i_enable         - 1 (Enable module)
--                      - In loop, read each packet available in
--                        o_bytes_to_recv when o_mode2_ready is set
--                      - When finish and end, signal o_mode2_ready_all is set
--                        (so all data is collected and stored in some memory)
--                      - Wait some cycles
--                        (to be sure > 100 and depend from SCL clock speed)
--                        and when o_busy is set, disable module (i_enable = 0)
--                    2) Read RAM data
--                      - Read from address map (p. 16, Figure 10)
--                        - i_mode2          - 1
--                          (Read N-more two-bytes data, 0x0400 - 0x07FF)
--                        - i_memory_address - 0x0400 (RAM)
--                        - i_enable         - 1 (Enable module)
--                      - In loop, read each packet available in
--                        o_bytes_to_recv when o_mode2_ready is set
--                      - When finish and end, signal o_mode2_ready_all is set
--                        (so all data is collected and stored in some memory)
--                      - Wait some cycles
--                        (to be sure > 100 and depend from SCL clock speed)
--                        and when o_busy is set, disable module (i_enable = 0)
--                  Extra steps:
--                    1) Check if internal registers is setted properly
--                      - Read Control Register 1 (p. 19, Table 8)
--                        - i_mode1          - 1
--                          (Read 2 bytes from 2 byte register)
--                        - i_memory_address - 0x800d (Control Register 1)
--                        - i_enable         - 1 (Enable module)
--                      - Wait some cycles
--                        (to be sure > 100 and depend from SCL clock speed)
--                        and when o_busy is set, disable module (i_enable = 0)
--                      - Read from o_bytes_to_recv (this can be checked)
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    global_package.vhd
--  - Modules: -
--
--  Revision:
--   - Revision 0.01 - File Created, fork from my_i2c module (vhdl_projects/) (10:40:17 08/03/2025).
--    - Files: -
--    - Modules: -
--    - Processes (Architecture: -): -
--   - Revision 0.02 - Reimplement to melexis_mlx90640_i2c module, RW timing ok.
--    - Files: -
--    - Modules: -
--    - Processes (Architecture: -): -
--   - Revision 0.03 - Module with 3 modes and flags.
--    - Files: -
--    - Modules: -
--    - Processes (Architecture: rtl): p_i_scl_synchro, p_output_bytes,
--      p_synchro_sda, p_i2c_catch_bytes_to_recv, p_i2c_send_sequence_fsm,
--      p_i2c_clock_ctr, p_i2c_clock_generator_fsm, p_i2c_scl_generator_com
--
-- Important objects:
--  - Entity signals:
--    - i_mode0, i_mode1, i_mode2 - use mode described as is:
--      Data formats in each modes:
--      (ST/SP/W/R/A/NA - Start/Stop/Write/Read/Ack/NotAck)
--       - mode 0 - write 4 bytes
--         ST,Write(A),Byte1(A),Byte2(A),Byte3(A),Byte4(A),SP
--       - mode 1 - read 2 bytes from 16 bit register
--         ST,Write(A),Byte1(A),Byte2(A),ST,Read(A),Byte1(A),Byte2(NA),SP
--       - mode 2 - read 832 packets (2 bytes each), equal 1664 bytes all from 16bit register
--         ST,Write(A),Byte1(A),Byte2(A),ST,Read(A),Byte_1_HI(A),Byte_1_LO(A),...,Byte_832_HI(A),Byte_832_LO(NA),SP
--    - i_slave_address - of course, with what are we talking to (7 bit)
--    - i_memory_address, i_memory_data - 16bit signals
--    - o_mode2_ready, o_mode2_ready_all - ready packet/ready all data
--    - i_enable, o_busy - titled as is
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos: -
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones:
--  - Core works for device model MLX90640, and tested on 7 segment LCD
--    on Digilent Nexys 2 (xc3s1200e). All data, firstly, was stored in
--    Block RAM and next was displayed on LCD. Just to be sure, readed data
--    was overlapped/covered with data readed by logic analyzer.
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.global_package.all;

entity melexis_mlx90640_i2c is
generic (
  c_board_clock : integer := c_clock_board_frequency;
  c_bus_clock : integer := c_clock_i2c_frequency
);
port (
  i_clock : in std_logic;
  i_reset : in std_logic;
  i_slave_address : in std_logic_vector (c_i2c_address_bits - 1 downto 0);
  i_mode0 : in std_logic; -- W(A)/4b(A)
  i_mode1 : in std_logic; -- W(A)/2b(A),ST,R(A)/2b(NA)
  i_mode2 : in std_logic; -- W(A)/2b(A),ST,R(A)/2*N(NA)
  o_mode2_ready : out std_logic;
  o_mode2_ready_all : out std_logic;
  i_memory_address : in std_logic_vector (0 to 15);
  i_memory_data : in std_logic_vector (0 to 15);
  o_bytes_to_recv : out std_logic_vector (15 downto 0);
  i_enable : in std_logic;
  o_busy : out std_logic;
  io_sda_o : out std_logic;
  io_sda_i : in std_logic;
  io_scl_o : out std_logic;
  io_scl_i : in std_logic
);
end entity melexis_mlx90640_i2c;

architecture rtl of melexis_mlx90640_i2c is

  type state is (
  idle,
-- i2c start
  start,
  sda_start,
-- mode0
  mode0_write_slave_address,
  mode0_write_slave_address_lastbit,
  mode0_write_slave_write,
  mode0_write_slave_ack,
  mode0_write_data1,
  mode0_write_data_lastbit1,
  mode0_write_data_ack1,
  mode0_write_data2,
  mode0_write_data_lastbit2,
  mode0_write_data_ack2,
  mode0_write_data3,
  mode0_write_data_lastbit3,
  mode0_write_data_ack3,
  mode0_write_data4,
  mode0_write_data_lastbit4,
  mode0_write_data_ack4,
  mode0_empty,
-- mode1
  mode1_write_slave_address,
  mode1_write_slave_address_lastbit,
  mode1_write_slave_write,
  mode1_write_slave_ack,
  mode1_write_data1,
  mode1_write_data_lastbit1,
  mode1_write_data_ack1,
  mode1_write_data2,
  mode1_write_data_lastbit2,
  mode1_write_data_ack2,
  mode1_write_data_ack2_empty,
  mode1_read_start,
  mode1_read_sda_start,
  mode1_read_slave_address,
  mode1_read_slave_address_lastbit,
  mode1_read_slave_read,
  mode1_read_slave_ack,
  mode1_read_data1,
  mode1_read_data_lastbit1,
  mode1_read_data_ack,
  mode1_read_data2,
  mode1_read_data_lastbit2,
  mode1_read_data_nak,
  mode1_read_data_nak_empty,
-- mode2
state1,
  mode2_write_slave_address,
  mode2_write_slave_address_lastbit,
  mode2_write_slave_write,
  mode2_write_slave_ack,
  mode2_write_data1,
  mode2_write_data_lastbit1,
  mode2_write_data_ack1,
  mode2_write_data2,
  mode2_write_data_lastbit2,
  mode2_write_data_ack2,
  mode2_write_data_ack2_empty,
  mode2_read_start,
  mode2_read_sda_start,
  mode2_read_slave_address,
  mode2_read_slave_address_lastbit,
  mode2_read_slave_read,
  mode2_read_slave_ack,
  mode2_read_data1,
  mode2_read_data_lastbit1,
  mode2_read_data_ack1,
  mode2_read_data2,
  mode2_read_data_lastbit2,
  mode2_read_data_ack2,
  mode2_read_data_nak,
-- i2c stop
  sda_stop,
  stop
  );
  type clock_mode is (c0,c1,c2,c3);
  constant c_i2c_counter_max : integer := (c_board_clock / c_bus_clock / 4) / 8;
  signal c_state : state;
  signal c_cmode : clock_mode;
  signal slave_index_ctr : integer range c_i2c_address_bits - 1 downto 0;
  signal data_index_ctr : integer range 0 to c_i2c_data_bits - 1;
  signal bytes_to_recv_sr : std_logic_vector (16 downto 0); -- XXX plus first ack, second ack omit
  signal clock : std_logic;
  signal temp_sck : std_logic;
  signal temp_sda : std_logic;
  constant c_mode2_read_data_index : integer := 832;
  signal mode2_read_data_index_ctr : integer range 0 to c_mode2_read_data_index - 1;
  signal mode2_ready_i : std_logic;
  signal mode2_ready_all_i : std_logic;
  signal io_scl_ii, io_scl_ii_i, io_sda_ii, io_sda_ii_i : std_logic;
  signal io_scl_ii_z : std_logic;
  constant c_scl_stretch : integer := c_i2c_counter_max * 4;
  signal tcount : integer range 0 to c_scl_stretch - 1;

begin

--  io_scl_ii <= io_scl_i;
  p_i_scl_synchro : process (i_clock) is
  begin
    if (rising_edge (i_clock)) then
      io_scl_ii_i <= io_scl_i;
      io_scl_ii <= io_scl_ii_i;
    end if;
  end process p_i_scl_synchro;

  o_mode2_ready <= mode2_ready_i;
  o_mode2_ready_all <= mode2_ready_all_i;

  p_output_bytes : process (i_clock, i_reset) is
  begin
    if (i_reset = '1') then
      o_bytes_to_recv <= (others => '0');
    elsif (rising_edge (i_clock)) then
      if (mode2_ready_i = '1') then
        o_bytes_to_recv <=
        bytes_to_recv_sr (16 downto 9) & bytes_to_recv_sr (7 downto 0); -- test1
        --bytes_to_recv_sr (7 downto 0) & bytes_to_recv_sr (16 downto 9); -- test2
      end if;
    end if;
  end process p_output_bytes;

  io_sda_o <=
    '0' when temp_sda = '0'
    else
    '1' when c_state = idle
    else
    '1';

  io_scl_o <=
    '1' when (c_state = idle or c_state = start or c_state = stop or c_state = sda_start or c_state = sda_stop)
--    else
--    '1' when (c_state = mode2_read_data1 or
--      c_state = mode2_read_data_lastbit1 or
--      c_state = mode2_read_data_ack1 or
--      c_state = mode2_read_data2 or
--      c_state = mode2_read_data_lastbit2 or
--      c_state = mode2_read_data_ack2 or
--      c_state = mode2_read_data_nak)
    else
    temp_sck;

  p_synchro_sda : process (i_clock) is
  begin
    if (rising_edge (i_clock)) then
      if (      (c_state = mode1_read_data1 or
      c_state = mode1_read_data_lastbit1 or
      c_state = mode1_read_data_ack or
      c_state = mode1_read_data2 or
      c_state = mode1_read_data_lastbit2 or
      c_state = mode1_read_data_nak or
      c_state = mode1_read_data_nak_empty)
      or
      (c_state = mode2_read_data1 or
      c_state = mode2_read_data_lastbit1 or
      c_state = mode2_read_data_ack1 or
      c_state = mode2_read_data2 or
      c_state = mode2_read_data_lastbit2 or
      c_state = mode2_read_data_ack2 or
      c_state = mode2_read_data_nak)) then
        io_sda_ii_i <= io_sda_i;
        io_sda_ii <= io_sda_ii_i;
      else
      io_sda_ii <= 'Z';
      end if;
    end if;
  end process p_synchro_sda;

  io_scl_ii_z <= '0' when io_scl_ii = '0' else '1';
  p_i2c_catch_bytes_to_recv : process (io_scl_ii_z, i_reset) is
  begin
    if (i_reset = '1') then
      bytes_to_recv_sr <= (others => '0');
    elsif (rising_edge (io_scl_ii_z)) then
--      if (c_state = mode2_read_data2 and c_cmode = c2 and data_index_ctr = 7) then
      if (c_state = mode2_read_data2 and c_cmode = c3 and data_index_ctr = 7) then
        bytes_to_recv_sr <= (others => '0');
      else
--        bytes_to_recv_sr <= io_sda_ii & bytes_to_recv_sr (16 downto 1); -- test1
        bytes_to_recv_sr <= bytes_to_recv_sr (15 downto 0) & io_sda_ii; -- test2
      end if;
    end if;
  end process p_i2c_catch_bytes_to_recv;

  p_i2c_send_sequence_fsm : process (clock, i_reset) is
  begin
    if (i_reset = '1') then
      c_state <= idle;
      data_index_ctr <= 0;
      slave_index_ctr <= c_i2c_address_bits - 1;
      mode2_read_data_index_ctr <= 0;
      temp_sda <= '1';
      mode2_ready_i <= '0';
      mode2_ready_all_i <= '0';
      o_busy <= '0';
    elsif (rising_edge (clock)) then
      case c_state is
        when idle =>
          if (i_enable = '1') then
            if (c_cmode = c3) then
              temp_sda <= '1';
              o_busy <= '1';
              c_state <= start;
              data_index_ctr <= 0;
              slave_index_ctr <= c_i2c_address_bits - 1;
            end if;
          end if;
        when start =>
          if (c_cmode = c3) then
            c_state <= sda_start;
            temp_sda <= '0';
          end if;
        when sda_start =>
          if (i_mode0 = '1') then
            c_state <= mode0_write_slave_address;
          end if;
          if (i_mode1 = '1') then
            c_state <= mode1_write_slave_address;
          end if;
          if (i_mode2 = '1') then
            c_state <= mode2_write_slave_address;
          end if;
          if (c_cmode = c3) then
            temp_sda <= '0';
            slave_index_ctr <= c_i2c_address_bits - 1;
          end if;
-- XXX mode0
        when mode0_write_slave_address =>
          if (slave_index_ctr = 0) then
            c_state <= mode0_write_slave_address_lastbit;
          else
            if (c_cmode = c3) then
              slave_index_ctr <= slave_index_ctr - 1;
              if (i_slave_address (slave_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode0_write_slave_address_lastbit =>
          if (c_cmode = c3) then
            c_state <= mode0_write_slave_write;
            if (i_slave_address (0) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode0_write_slave_write =>
          if (c_cmode = c3) then
            c_state <= mode0_write_slave_ack;
            temp_sda <= '0';
          end if;
        when mode0_write_slave_ack =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data1;
            temp_sda <= '1';
            data_index_ctr <= 0;
          end if;
        when mode0_write_data1 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode0_write_data_lastbit1;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_address (data_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode0_write_data_lastbit1 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data_ack1;
            if (i_memory_address (7) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode0_write_data_ack1 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data2;
            data_index_ctr <= 0;
            temp_sda <= '1';
          end if;
        when mode0_write_data2 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode0_write_data_lastbit2;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_address (8 + data_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode0_write_data_lastbit2 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data_ack2;
            if (i_memory_address (15) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode0_write_data_ack2 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data3;
            temp_sda <= '1';
            data_index_ctr <= 0;
          end if;
        when mode0_write_data3 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode0_write_data_lastbit3;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_data (data_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode0_write_data_lastbit3 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data_ack3;
            if (i_memory_data (7) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode0_write_data_ack3 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data4;
            temp_sda <= '1';
          end if;
        when mode0_write_data4 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode0_write_data_lastbit4;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_data (8 + data_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode0_write_data_lastbit4 =>
          if (c_cmode = c3) then
            c_state <= mode0_write_data_ack4;
            if (i_memory_data (15) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode0_write_data_ack4 =>
          if (c_cmode = c3) then
            c_state <= mode0_empty;
            temp_sda <= '1';
          end if;
        when mode0_empty  =>
          if (c_cmode = c3) then
            temp_sda <= '0';
            c_state <= sda_stop;
          end if;
-- XXX mode1
        when mode1_write_slave_address =>
            if (c_cmode = c3) then
              if (slave_index_ctr = 0) then
--                c_state <= mode1_write_slave_address_lastbit;
                c_state <= mode1_write_slave_write;
              else
                slave_index_ctr <= slave_index_ctr - 1;
                if (i_slave_address (slave_index_ctr) = '1') then
                  temp_sda <= '1';
                else
                  temp_sda <= '0';
                end if;
              end if;
            end if;
        when mode1_write_slave_address_lastbit =>
          if (c_cmode = c3) then
            c_state <= mode1_write_slave_write;
            if (i_slave_address (0) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode1_write_slave_write =>
          if (c_cmode = c3) then
            c_state <= mode1_write_slave_ack;
            temp_sda <= '0';
          end if;
        when mode1_write_slave_ack =>
          if (c_cmode = c3) then
            c_state <= mode1_write_data1;
            temp_sda <= '1';
            data_index_ctr <= 0;
          end if;
        when mode1_write_data1 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode1_write_data_lastbit1;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_address (data_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode1_write_data_lastbit1 =>
          if (c_cmode = c3) then
            c_state <= mode1_write_data_ack1;
            if (i_memory_address (7) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode1_write_data_ack1 =>
          if (c_cmode = c3) then
            c_state <= mode1_write_data2;
            data_index_ctr <= 0;
            temp_sda <= '1';
          end if;
        when mode1_write_data2 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode1_write_data_lastbit2;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_address (8 + data_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode1_write_data_lastbit2 =>
          if (c_cmode = c3) then
            c_state <= mode1_write_data_ack2;
            if (i_memory_address (15) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode1_write_data_ack2 =>
          if (c_cmode = c3) then
            c_state <= mode1_write_data_ack2_empty;
            temp_sda <= '1';
            data_index_ctr <= 0;
          end if;
        when mode1_write_data_ack2_empty =>
          if (c_cmode = c3) then
            c_state <= mode1_read_start;
            temp_sda <= '1';
            data_index_ctr <= 0;
          end if;
        when mode1_read_start =>
          c_state <= mode1_read_sda_start;
          temp_sda <= '1';
          slave_index_ctr <= c_i2c_address_bits - 1;
        when mode1_read_sda_start =>
          c_state <= mode1_read_slave_address;
          temp_sda <= '0';
        when mode1_read_slave_address =>
          if (slave_index_ctr = 0) then
            c_state <= mode1_read_slave_address_lastbit;
          else
            if (c_cmode = c3) then
              slave_index_ctr <= slave_index_ctr - 1;
              if (i_slave_address (slave_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode1_read_slave_address_lastbit =>
          if (c_cmode = c3) then
            c_state <= mode1_read_slave_read;
            if (i_slave_address (0) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode1_read_slave_read =>
          if (c_cmode = c3) then
            c_state <= mode1_read_slave_ack;
            temp_sda <= '1';
          end if;
        when mode1_read_slave_ack =>
          if (c_cmode = c3) then
            c_state <= mode1_read_data1;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
        when mode1_read_data1 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode1_read_data_lastbit1;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              temp_sda <= '1';
            end if;
          end if;
        when mode1_read_data_lastbit1 =>
          if (c_cmode = c0) then -- XXX
            c_state <= mode1_read_data_ack;
          end if;
        when mode1_read_data_ack =>
          if (c_cmode = c0) then -- XXX
            c_state <= mode1_read_data2;
            temp_sda <= '0';
          end if;
        when mode1_read_data2 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode1_read_data_lastbit2;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              temp_sda <= '1';
            end if;
          end if;
        when mode1_read_data_lastbit2 =>
          if (c_cmode = c0) then
            c_state <= mode1_read_data_nak;
          end if;
        when mode1_read_data_nak =>
          if (c_cmode = c1) then
            mode2_ready_i <= '1';
          end if;
          if (c_cmode = c0) then
            mode2_ready_i <= '0';
            c_state <= mode1_read_data_nak_empty;
            temp_sda <= '1';
          end if;
        when mode1_read_data_nak_empty =>
          if (c_cmode = c1) then
            mode2_ready_i <= '0';
          end if;
          if (c_cmode = c0) then
            c_state <= stop;
            temp_sda <= '0'; -- 'X';
          end if;
-- XXX mode2 i2c slave address write
        when mode2_write_slave_address =>
          if (slave_index_ctr = 0) then
            c_state <= mode2_write_slave_address_lastbit;
          else
            if (c_cmode = c3) then
              slave_index_ctr <= slave_index_ctr - 1;
              if (i_slave_address (slave_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode2_write_slave_address_lastbit =>
          if (c_cmode = c3) then
            c_state <= mode2_write_slave_write;
            if (i_slave_address (0) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode2_write_slave_write =>
          if (c_cmode = c3) then
            c_state <= mode2_write_slave_ack;
            temp_sda <= '0';
          end if;
        when mode2_write_slave_ack =>
          if (c_cmode = c3) then
            c_state <= mode2_write_data1;
            temp_sda <= '1';
            data_index_ctr <= 0;
          end if;
-- XXX mode2 i2c write data 2b
        when mode2_write_data1 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode2_write_data_lastbit1;
          else
            if (c_cmode = c3) then
              if (i_memory_address (data_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
              data_index_ctr <= data_index_ctr + 1;
            end if;
          end if;
        when mode2_write_data_lastbit1 =>
          if (c_cmode = c3) then
            c_state <= mode2_write_data_ack1;
            if (i_memory_address (7) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode2_write_data_ack1 =>
          if (c_cmode = c3) then
            c_state <= mode2_write_data2;
            temp_sda <= '1';
            data_index_ctr <= 0;
          end if;
        when mode2_write_data2 =>
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode2_write_data_lastbit2;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              if (i_memory_address (8 + data_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode2_write_data_lastbit2 =>
          if (c_cmode = c3) then
            c_state <= mode2_write_data_ack2;
            if (i_memory_address (15) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode2_write_data_ack2 =>
          if (c_cmode = c3) then
            c_state <= mode2_write_data_ack2_empty;
            temp_sda <= '1';
            data_index_ctr <= 0;
          end if;
        when mode2_write_data_ack2_empty => -- XXX empty
          if (c_cmode = c3) then
            c_state <= mode2_read_start;
            temp_sda <= '1';
            data_index_ctr <= 0;
          end if;
-- XXX mode2 i2c start
        when mode2_read_start =>
          c_state <= mode2_read_sda_start;
          temp_sda <= '1';
          slave_index_ctr <= c_i2c_address_bits - 1;
        when mode2_read_sda_start =>
          c_state <= mode2_read_slave_address;
          temp_sda <= '0';
-- XXX mode2 i2c slave address read
        when mode2_read_slave_address =>
          if (c_cmode = c3) then
            if (slave_index_ctr = 0) then
              c_state <= mode2_read_slave_read; --mode2_read_slave_address_lastbit;
            else
              slave_index_ctr <= slave_index_ctr - 1;
              if (i_slave_address (slave_index_ctr) = '1') then
                temp_sda <= '1';
              else
                temp_sda <= '0';
              end if;
            end if;
          end if;
        when mode2_read_slave_address_lastbit =>
          if (c_cmode = c3) then
            c_state <= mode2_read_slave_read;
            if (i_slave_address (0) = '1') then
              temp_sda <= '1';
            else
              temp_sda <= '0';
            end if;
          end if;
        when mode2_read_slave_read =>
          if (c_cmode = c3) then
            c_state <= mode2_read_slave_ack;
            temp_sda <= '1';
          end if;
        when mode2_read_slave_ack =>
          if (c_cmode = c3) then
            c_state <= mode2_read_data1; --state1;
            temp_sda <= '0';
            data_index_ctr <= 0;
          end if;
        when state1 =>
          if (c_cmode = c3) then
            c_state <= mode2_read_data1;
            temp_sda <= '0';
          end if;
-- XXX mode2 i2c slave data read 1 - N
        when mode2_read_data1 =>
          if (c_cmode = c0) then
            mode2_ready_i <= '0';
          end if;
          if (data_index_ctr = c_i2c_data_bits - 1) then
            c_state <= mode2_read_data_lastbit1;
            data_index_ctr <= 0;
          else
            if (c_cmode = c3) then
              data_index_ctr <= data_index_ctr + 1;
              temp_sda <= '1';
            end if;
          end if;
        when mode2_read_data_lastbit1 =>
          if (c_cmode = c3) then -- XXX
            c_state <= mode2_read_data_ack1;
          end if;
        when mode2_read_data_ack1 =>
          if (c_cmode = c3) then
            temp_sda <= '0';
            c_state <= mode2_read_data2;
            data_index_ctr <= 0;
          end if;
-- XXX mode2 i2c slave data read 2 - N
        when mode2_read_data2 =>
          if (c_cmode = c1 and data_index_ctr = 7) then
            mode2_ready_i <= '1';
          end if;
            if (data_index_ctr = c_i2c_data_bits - 1) then
              c_state <= mode2_read_data_lastbit2;
              data_index_ctr <= 0;
            else
              if (c_cmode = c3) then
                data_index_ctr <= data_index_ctr + 1;
                temp_sda <= '1';
                mode2_ready_i <= '0';
              end if;
            end if;
        when mode2_read_data_lastbit2 =>
          if (c_cmode = c3) then
            c_state <= mode2_read_data_ack2;
          end if;
        when mode2_read_data_ack2 =>
          if (c_cmode = c0) then
            --mode2_ready_i <= '1';
          end if;
          if (c_cmode = c1) then
            --mode2_ready_all_i <= '1';
            mode2_ready_i <= '0';
          end if;
--          if (c_cmode = c2) then
--            mode2_ready_all_i <= '0';
--          end if;
          if (c_cmode = c3) then
            if (mode2_read_data_index_ctr = c_mode2_read_data_index - 1) then
              c_state <= mode2_read_data_nak; --sda_stop;
              mode2_read_data_index_ctr <= 0;
              mode2_ready_all_i <= '0';
              temp_sda <= '1';
            else
              c_state <= mode2_read_data1;
              mode2_read_data_index_ctr <= mode2_read_data_index_ctr + 1;
              data_index_ctr <= 0;
              temp_sda <= '0';
              mode2_ready_i <= '1';
            end if;
          end if;
-- XXX mode2 i2c slave data read - end
        when mode2_read_data_nak =>
          if (c_cmode = c0) then
            mode2_ready_i <= '1';
          end if;
          if (c_cmode = c1) then
            mode2_ready_all_i <= '1';
            mode2_ready_i <= '0';
            o_busy <= '0';
          end if;
          if (c_cmode = c2) then
            mode2_ready_all_i <= '0';
          end if;
          if (c_cmode = c3) then
            c_state <= stop;
            temp_sda <= '1';
          end if;

        when sda_stop =>
          if (c_cmode = c3) then
            c_state <= stop;
            temp_sda <= '0';
          end if;
        when stop =>
          if (c_cmode = c3) then
            mode2_ready_i <= '0';
            c_state <= idle;
            temp_sda <= '1';
            o_busy <= '0';
          end if;
      end case;
    end if;
  end process p_i2c_send_sequence_fsm;

  p_i2c_clock_ctr : process (i_clock, i_reset) is
    variable count : integer range 0 to c_scl_stretch - 1;
    type states is (a, b);
    variable state : states;
  begin
    if (i_reset = '1') then
      clock <= '0';
      count := 0;
      state := a;
    elsif (rising_edge (i_clock)) then
      case (state) is
        when a =>
          if (i_enable = '1') then
            state := b;
          end if;
        when b =>
          if (i_enable = '0') then
            state := a;
          else
            if (count = c_scl_stretch - 1) then
              clock <= not clock;
              count := 0;
            else
              count := count + 1;
            end if;
          end if;
      end case;
      --synthesis translate_off
      tcount <= count;
      --synthesis translate_on
    end if;
  end process p_i2c_clock_ctr;

  p_i2c_clock_generator_fsm : process (clock, i_reset) is
    type states is (a, b);
    variable state : states;
  begin
    if (i_reset = '1') then
      c_cmode <= c0;
    elsif (rising_edge (clock)) then
      case c_cmode is
        when c0 =>
          c_cmode <= c1;
        when c1 =>
          c_cmode <= c2;
        when c2 =>
          c_cmode <= c3;
        when c3 =>
          c_cmode <= c0;
      end case;
    end if;
  end process p_i2c_clock_generator_fsm;

--  p_i2c_scl_generator_com : process (c_cmode, c_state) is
  p_i2c_scl_generator_com : process (c_cmode) is
  begin
    if (c_cmode /= c1 and c_cmode /= c2 and (c_cmode = c0 or c_cmode = c3)) then
      temp_sck <= '0';
    else
      temp_sck <= '1';
    end if;
  end process p_i2c_scl_generator_com;

end architecture rtl;
