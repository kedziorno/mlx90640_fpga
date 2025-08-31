----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:42:10 08/23/2025 
-- Design Name: 
-- Module Name:    test2 - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

use work.global_package_syn.all;
use work.pack.all;

entity test2 is
generic (
constant c_board_clock : integer := c_clock_board_frequency;
--constant c_bus_clock : integer := c_clock_i2c_frequency;
constant c_bus_clock : integer := 1_000_000;
constant c_sim : string (1 to 1) := "n";
constant c_cold_start : integer := 10_000_000/100000;
constant c_wait2 : integer := 10_000_000/100
);
port (
i_clock,i_reset : in std_logic;
io_sda_dd : inout std_logic;
io_scl_dd : inout std_logic;
io_sda_nl : inout std_logic;
io_scl_nl : out std_logic;
o_camera_read : out std_logic_vector (15 downto 0);
o_ready, o_ready_all : out std_logic;
o_an : out std_logic_vector (3 downto 0);
o_seg : out std_logic_vector (6 downto 0)
);
end test2;

architecture Behavioral of test2 is

type states is (
--idle4,idle5,idle6,
idle,
wr1,
idle0,
w1,
idle1,
wr2,
idle2,
r1,
idle3,
stop
--r1a,
--r2,r2a,
--w2,
--r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,
--s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14
);
signal t_state : states := idle;

component melexis_mlx90640_i2c is
generic (
  c_board_clock : integer := c_board_clock;
  c_bus_clock : integer := c_bus_clock
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
io_scl : out std_logic
);
end component melexis_mlx90640_i2c;
signal melexis_mlx90640_i2c_clock : std_logic;
signal melexis_mlx90640_i2c_reset : std_logic;
signal melexis_mlx90640_i2c_slave_address : std_logic_vector (c_i2c_address_bits - 1 downto 0);
signal melexis_mlx90640_i2c_mode0 : std_logic; -- W(A)/4b(A)
signal melexis_mlx90640_i2c_mode1 : std_logic; -- W(A)/2b(A),ST,R(A)/2b(NA)
signal melexis_mlx90640_i2c_mode2 : std_logic; -- W(A)/2b(A),ST,R(A)/2*N(NA)
signal melexis_mlx90640_i2c_mode2_ready : std_logic;
signal melexis_mlx90640_i2c_mode2_ready_all : std_logic;
signal melexis_mlx90640_i2c_memory_address : std_logic_vector (0 to 15);
signal melexis_mlx90640_i2c_memory_data : std_logic_vector (0 to 15);
signal melexis_mlx90640_i2c_bytes_to_recv : std_logic_vector (15 downto 0);
signal melexis_mlx90640_i2c_enable : std_logic;
signal melexis_mlx90640_i2c_busy : std_logic;
signal melexis_mlx90640_i2c_sda_o : std_logic;
signal melexis_mlx90640_i2c_sda_i : std_logic;
signal melexis_mlx90640_i2c_scl : std_logic;

--constant c_wait1 : integer := 25*1_000_000/10000;
constant c_wait1 : integer := 25;
signal wait1 : integer range 0 to c_wait1 - 1;

signal sda_i, scl_i : std_logic;

signal camera_read : std_logic_vector (15 downto 0);

component lcd_display is
Generic (
LCDClockDivider : integer := 200
);
Port (
i_clock : in std_logic;
i_LCDChar : LCDHex;
o_anode : out std_logic_vector(3 downto 0);
o_segment : out std_logic_vector(6 downto 0)
);
end component lcd_display;

signal LCDChar : LCDHex;

signal lcd_sck, sda_nl_o, sda_nl_i, scl_nl : std_logic;

begin

o_camera_read <= melexis_mlx90640_i2c_bytes_to_recv;

reset_BUFG_inst : BUFG
port map (
O => lcd_sck,     -- Clock buffer output
I => scl_nl      -- Clock buffer input
);

process (i_clock,i_reset) is
begin
if (i_reset = '1') then
lcdchar (0) <= (others => '0');
lcdchar (1) <= (others => '0');
lcdchar (2) <= (others => '0');
lcdchar (3) <= (others => '0');
elsif (rising_edge (i_clock)) then
if (melexis_mlx90640_i2c_mode2_ready = '1') then
--lcdchar (0)(0) <= '1';
--lcdchar (0)(1) <= '1';
--lcdchar (0)(2) <= '1';
--lcdchar (0)(3) <= '1';
--lcdchar (1)(0) <= '1';
--lcdchar (1)(1) <= '1';
--lcdchar (1)(2) <= '1';
--lcdchar (1)(3) <= '1';
--lcdchar (2)(0) <= '1';
--lcdchar (2)(1) <= '1';
--lcdchar (2)(2) <= '1';
--lcdchar (2)(3) <= '1';
--lcdchar (3)(0) <= '1';
--lcdchar (3)(1) <= '1';
--lcdchar (3)(2) <= '1';
--lcdchar (3)(3) <= '1';

lcdchar (0)(0) <= melexis_mlx90640_i2c_bytes_to_recv(15);
lcdchar (0)(1) <= melexis_mlx90640_i2c_bytes_to_recv(14);
lcdchar (0)(2) <= melexis_mlx90640_i2c_bytes_to_recv(13);
lcdchar (0)(3) <= melexis_mlx90640_i2c_bytes_to_recv(12);
lcdchar (1)(0) <= melexis_mlx90640_i2c_bytes_to_recv(11);
lcdchar (1)(1) <= melexis_mlx90640_i2c_bytes_to_recv(10);
lcdchar (1)(2) <= melexis_mlx90640_i2c_bytes_to_recv(9);
lcdchar (1)(3) <= melexis_mlx90640_i2c_bytes_to_recv(8);
lcdchar (2)(0) <= melexis_mlx90640_i2c_bytes_to_recv(7);
lcdchar (2)(1) <= melexis_mlx90640_i2c_bytes_to_recv(6);
lcdchar (2)(2) <= melexis_mlx90640_i2c_bytes_to_recv(5);
lcdchar (2)(3) <= melexis_mlx90640_i2c_bytes_to_recv(4);
lcdchar (3)(0) <= melexis_mlx90640_i2c_bytes_to_recv(3);
lcdchar (3)(1) <= melexis_mlx90640_i2c_bytes_to_recv(2);
lcdchar (3)(2) <= melexis_mlx90640_i2c_bytes_to_recv(1);
lcdchar (3)(3) <= melexis_mlx90640_i2c_bytes_to_recv(0);
end if;
end if;
end process;

p_i2c : process (i_clock,i_reset) is
	variable state : states;
  constant c_some_wait : integer := 2**20;
  variable some_wait : integer range 0 to c_some_wait-1;
  --synthesis translate_off
  variable first : boolean := false;
  --synthesis translate_on
  variable cold_start : integer range 0 to c_cold_start - 1;
  variable wait2 : integer range 0 to c_wait2 - 1;
begin
		if (i_reset = '1') then
			state := idle;
      camera_read <= (others => '0');
      wait1 <= 0;
      cold_start := 0;
      wait2 := 0;
      some_wait := 0;
      melexis_mlx90640_i2c_mode0 <= '0';
      melexis_mlx90640_i2c_mode1 <= '0';
      melexis_mlx90640_i2c_mode2 <= '0';
      melexis_mlx90640_i2c_enable <= '0';
      melexis_mlx90640_i2c_memory_address <= x"0000";
      melexis_mlx90640_i2c_memory_data <= x"0000";
		elsif (rising_edge (i_clock)) then
      t_state <= state;
			case (state) is
        when idle =>
          if (cold_start = c_cold_start - 1) then
            state := wr1;
--            state := w1;
            cold_start := 0;
          else
            cold_start := cold_start + 1;
          end if;
        when wr1 =>
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '1'; -- w800d/r1901
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"800d";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
--              if (camera_read = x"1981") then
                state := idle0;
                wait2 := 0;
--              else
--                state := stop;
--              end if;
              wait1 <= 0;
          end if;
          else
            wait1 <= wait1 + 1;
         end if;
        when idle0 =>
          if (wait2 = c_wait2 - 1) then
            state := w1;
--            state := idle;
            wait2 := 0;
          else
            wait2 := wait2 + 1;
          end if;
        when w1 =>
          melexis_mlx90640_i2c_mode0 <= '1'; -- w800d1981
          melexis_mlx90640_i2c_mode1 <= '0';
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"800d";
          melexis_mlx90640_i2c_memory_data <= x"1981";

--          melexis_mlx90640_i2c_memory_data <= x"1234";
--          melexis_mlx90640_i2c_memory_data <= x"4321";
--          melexis_mlx90640_i2c_memory_data <= x"0000";
--          melexis_mlx90640_i2c_memory_data <= x"ffff";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              wait1 <= 0;
              wait2 := 0;
              state := idle1;
          end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle1 =>
          if (wait2 = c_wait2 - 1) then
            state := wr2;
--            state := idle;
            wait2 := 0;
          else
            wait2 := wait2 + 1;
          end if;
        when wr2 =>
          melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '1';-- w800d/r1981
          melexis_mlx90640_i2c_mode2 <= '0';
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"800d";
          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state := idle2;
              wait1 <= 0;
            end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle2 =>
          if (wait2 = c_wait2 - 1) then
            state := r1;
            wait2 := 0;
            
          else
            wait2 := wait2 + 1;
          end if;
        when r1 =>
                  melexis_mlx90640_i2c_mode0 <= '0';
          melexis_mlx90640_i2c_mode1 <= '0';
          melexis_mlx90640_i2c_mode2 <= '1';-- w2400/rN
          melexis_mlx90640_i2c_enable <= '1';
          melexis_mlx90640_i2c_memory_address <= x"2400";

          if (wait1 = c_wait1 - 1) then
            if (melexis_mlx90640_i2c_busy = '0') then
              melexis_mlx90640_i2c_enable <= '0';
              state := idle3;
              wait1 <= 0;
            end if;
          else
            wait1 <= wait1 + 1;
          end if;
        when idle3 =>
          if (wait2 = c_wait2 - 1) then
            state := stop;
            wait2 := 0;
          else
            wait2 := wait2 + 1;
          end if;
        when stop =>
--          state := idle;



--        when w2 =>
----          if (wait1 = c_wait1 - 1) then
--            if (melexis_mlx90640_i2c_busy = '0') then
--              melexis_mlx90640_i2c_enable <= '0';
--              camera_read := melexis_mlx90640_i2c_bytes_to_recv;
----              if (camera_read = x"1901") then
--                state := idle1;
--                wait1 <= 0;
----              end if;
--            end if;
----          else
----            wait1 <= wait1 + 1;
----          end if;
----        when idle2 =>
----          if (wait1 = c_wait1 - 1) then
----            state := r1a;
----            wait1 <= 0;
----          else
----            wait1 <= wait1 + 1;
----          end if;
--        when idle5 =>
----          if (wait1 = c_wait1 - 1) then
--            if (melexis_mlx90640_i2c_busy = '0') then
--            melexis_mlx90640_i2c_enable <= '0';
--              state := idle3;
--              wait1 <= 0;
--            end if;
----          else
----            wait1 <= wait1 + 1;
----          end if;
----          if (wait2 = c_wait2 - 1) then
----            wait2 := 0;
----            state := idle3;
----          else
----            wait2 := wait2 + 1;
----          end if;
----        when idle3 =>
----          if (wait1 = c_wait1 - 1) then
----            state := r2;
----            wait1 <= 0;
----          else
----            wait1 <= wait1 + 1;
----          end if;
--        when r2 =>
--            melexis_mlx90640_i2c_mode0 <= '0';
--            melexis_mlx90640_i2c_mode1 <= '1';-- w800d/r1981
--            melexis_mlx90640_i2c_mode2 <= '0';
--            melexis_mlx90640_i2c_enable <= '1';
--            melexis_mlx90640_i2c_memory_address <= x"800d";
--            if (wait1 = c_wait1 - 1) then
--              if (melexis_mlx90640_i2c_busy = '0') then
--                camera_read := melexis_mlx90640_i2c_bytes_to_recv;
--                state := idle6;
--                wait1 <= 0;
--              end if;
--            else
--              wait1 <= wait1 + 1;
--            end if;
--        when idle6 =>
--            melexis_mlx90640_i2c_enable <= '0';
--          if (wait2 = c_wait2 - 1) then
--            wait2 := 0;
--            state := idle4;
--          else
--            wait2 := wait2 + 1;
--          end if;
--        when idle4 =>
--          if (wait1 = c_wait1 - 1) then
--            state := r2a;
--            wait1 <= 0;
--          else
--            wait1 <= wait1 + 1;
--          end if;
--        when r2a =>
--          melexis_mlx90640_i2c_mode0 <= '0';
--          melexis_mlx90640_i2c_mode1 <= '0';
--          melexis_mlx90640_i2c_mode2 <= '1';-- w2400/rN
--          melexis_mlx90640_i2c_enable <= '1';
--          melexis_mlx90640_i2c_memory_address <= x"2400";
--          if (wait1 = c_wait1 - 1) then
--            if (melexis_mlx90640_i2c_busy = '0') then
--              camera_read := melexis_mlx90640_i2c_bytes_to_recv;
--              state := r4;
--              melexis_mlx90640_i2c_enable <= '0';
--              wait1 <= 0;
--            end if;
--          else
--            wait1 <= wait1 + 1;
--          end if;
--        when r4 =>
--          melexis_mlx90640_i2c_mode0 <= '0';
--          melexis_mlx90640_i2c_mode1 <= '0';
--          melexis_mlx90640_i2c_mode2 <= '0';-- w2400/rN
--          melexis_mlx90640_i2c_enable <= '0';
--          melexis_mlx90640_i2c_memory_address <= x"0000";
--          melexis_mlx90640_i2c_memory_data <= x"0000";
--          if (melexis_mlx90640_i2c_busy = '0') then
----            state := r14; -- XXX next to display frame
--            camera_read := melexis_mlx90640_i2c_bytes_to_recv;
--            melexis_mlx90640_i2c_mode0 <= '0';
--            melexis_mlx90640_i2c_mode1 <= '0';
--            melexis_mlx90640_i2c_mode2 <= '0';
--          end if;
        when others => null;
			end case;
		end if;
end process p_i2c;

--melexis_mlx90640_i2c_clock <= clock_i;
--melexis_mlx90640_i2c_clock <= reset_i;
--io_scl <= melexis_mlx90640_i2c_scl;
--io_sda <= melexis_mlx90640_i2c_sda;
--melexis_mlx90640_i2c_sda <= io_sda;
o_ready <= melexis_mlx90640_i2c_mode2_ready;
o_ready_all <= melexis_mlx90640_i2c_mode2_ready_all;
melexis_mlx90640_i2c_slave_address <= "0110011";
melexis_mlx90640_i2c_i0 : melexis_mlx90640_i2c
port map (
i_clock => i_clock,
i_reset => i_reset,
i_slave_address => melexis_mlx90640_i2c_slave_address,
i_mode0 => melexis_mlx90640_i2c_mode0, -- W(A)/4b(A)
i_mode1 => melexis_mlx90640_i2c_mode1, -- W(A)/2b(A),ST,R(A)/2b(NA)
i_mode2 => melexis_mlx90640_i2c_mode2, -- W(A)/2b(A),ST,R(A)/2*N(NA)
o_mode2_ready => melexis_mlx90640_i2c_mode2_ready,
o_mode2_ready_all => melexis_mlx90640_i2c_mode2_ready_all,
i_memory_address => melexis_mlx90640_i2c_memory_address,
i_memory_data => melexis_mlx90640_i2c_memory_data,
o_bytes_to_recv => melexis_mlx90640_i2c_bytes_to_recv,
i_enable => melexis_mlx90640_i2c_enable,
o_busy => melexis_mlx90640_i2c_busy,
--io_sda => sda_i,
--io_scl => scl_i
io_sda_o => sda_nl_o,
io_sda_i => sda_nl_i,
io_scl => scl_nl
);

--io_sda_dd <= '0' when sda_i = '0' else 'Z';
--io_scl_dd <= '0' when scl_i = '0' else 'Z';
io_sda_nl <= '0' when sda_nl_o = '0' else 'Z';
sda_nl_i <= io_sda_nl;
io_scl_nl <= '0' when scl_nl = '0' else 'Z';
--io_sda_dd <= '0' when sda_i = '0' else 'Z';
--io_scl_dd <= '0' when scl_i = '0' else 'Z';
--io_sda_nl <= '0' when io_sda_dd = '0' else 'Z';
--io_scl_nl <= '0' when io_scl_dd = '0' else 'Z';
--io_sda_dd <= sda_i;
--io_scl_dd <= scl_i;
--io_sda_nl <= io_sda_dd;
--io_scl_nl <= io_scl_dd;

c_lcd_display : lcd_display
Port Map (
i_clock => i_clock,
i_LCDChar => LCDChar,
o_anode => o_an,
o_segment => o_seg
);

end Behavioral;

