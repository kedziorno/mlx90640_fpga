----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:21:45 12/13/2022 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
library IEEE,ieee_proposed;
--use ieee.math_real.all;
--use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.float_pkg.all;
--use ieee_proposed.float_noround_pkg.all;
use work.p_package1_constants.all;
use work.fpupack.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity top is
port (
	i_clock : in std_logic;
	i_reset : in std_logic;
	i_sda : in std_logic;
	i_scl : in std_logic;
	o_data : out float32
);
end top;

architecture Behavioral of top is

COMPONENT i2c_mem
PORT (
clka : IN STD_LOGIC;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
clkb : IN STD_LOGIC;
web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
dinb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

signal i2c_mem_clka : STD_LOGIC;
signal i2c_mem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal i2c_mem_addra : STD_LOGIC_VECTOR(10 DOWNTO 0);
signal i2c_mem_dina : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal i2c_mem_clkb : STD_LOGIC;
signal i2c_mem_web : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal i2c_mem_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0);
signal i2c_mem_dinb : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal i2c_mem_doutb : STD_LOGIC_VECTOR(7 DOWNTO 0);

component i2c_r is
generic (
constant g_board_frequency : natural := GLOBAL_BOARD_FREQUENCY;
constant g_i2c_frequency : natural := GLOBAL_I2C_FREQUENCY;
constant zero : natural := 0
);
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_sda : in std_logic;
i_scl : in std_logic;
o_i2c_address : out std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
o_i2c_address_rw : out std_logic;
o_i2c_address_ack : out std_logic;
o_i2c_data : out std_logic_vector(I2C_DATA_BITS - 1 downto 0);
o_i2c_data_ack : out std_logic;
o_done_data : out std_logic;
o_done_address : out std_logic;
o_sta : out std_logic;
o_sto : out std_logic;
o_counter_enable : out std_logic
);
end component i2c_r;

signal i2c_r_address : std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
signal i2c_r_address_rw : std_logic;
signal i2c_r_address_ack : std_logic;
signal i2c_r_data : std_logic_vector(I2C_DATA_BITS - 1 downto 0);
signal i2c_r_data_ack : std_logic;
signal i2c_r_done_data : std_logic;
signal i2c_r_done_address : std_logic;
signal i2c_r_sta : std_logic;
signal i2c_r_sto : std_logic;
signal i2c_r_counter_enable : std_logic;

COMPONENT mem_kvdd_vdd25
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_address : IN  std_logic_vector(7 downto 0);
o_data_kvdd : OUT  std_logic_vector(15 downto 0);
o_data_vdd25 : OUT  std_logic_vector(15 downto 0)
);
END COMPONENT;

signal mem_kvdd_vdd25_clock : STD_LOGIC;
signal mem_kvdd_vdd25_reset : STD_LOGIC;
signal mem_kvdd_vdd25_address : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal mem_kvdd_vdd25_data_kvdd : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal mem_kvdd_vdd25_data_vdd25 : STD_LOGIC_VECTOR(15 DOWNTO 0);

component mem_kvptat_ktptat is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_address : in std_logic_vector(15 downto 0);
o_data_kvptat : out std_logic_vector(31 downto 0);
o_data_ktptat : out std_logic_vector(31 downto 0)
);
end component mem_kvptat_ktptat;

signal mem_kvptat_ktptat_clock : std_logic;
signal mem_kvptat_ktptat_reset : std_logic;
signal mem_kvptat_ktptat_address : std_logic_vector(15 downto 0);
signal mem_kvptat_ktptat_data_kvptat : std_logic_vector(31 downto 0);
signal mem_kvptat_ktptat_data_ktptat : std_logic_vector(31 downto 0);

component mem_alphaptat is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_address : in std_logic_vector(15 downto 0);
o_data_alphaptat : out std_logic_vector(31 downto 0)
);
end component mem_alphaptat;

signal mem_alphaptat_clock : std_logic;
signal mem_alphaptat_reset : std_logic;
signal mem_alphaptat_address : std_logic_vector(15 downto 0);
signal mem_alphaptat_data_alphaptat : std_logic_vector(31 downto 0);

signal f32_data_kvdd,f32_data_vdd25 : float32;
signal f32_data_kvptat,f32_data_ktptat : float32;

signal signal_i2c_mem_addra_index : std_logic_vector(10 downto 0);
signal signal_i2c_mem_data_available : std_logic;

signal i2c_r_done_address_prev : std_logic;
signal i2c_r_done_data_prev : std_logic;

signal kvdd_vdd25 : std_logic_vector(2*I2C_DATA_BITS - 1 downto 0); -- xxx 0xff/0xff
signal kvptat_ktptat : std_logic_vector(2*I2C_DATA_BITS - 1 downto 0); -- xxx 0xfc/0x03ff

signal i2c_mem_kvptat_ktptat_flag,i2c_mem_kvdd_vdd25_flag : std_logic;
signal i2c_mem_kvdd_vdd25_address : std_logic_vector(10 downto 0);
signal i2c_mem_kvptat_ktptat_address : std_logic_vector(10 downto 0);
signal done_kvdd_vdd25,done_kvptat_ktptat : std_logic;

signal vdd: float32;
signal return_vdd: float32;

signal i2c_mem_vptat25_flag : std_logic;
signal vptat25 : std_logic_vector(15 downto 0);
signal done_vptat25 : std_logic;
signal i2c_mem_vptat25_address : std_logic_vector(10 downto 0);
signal f32_data_vvptat25 : float32;

signal i2c_mem_vptat_flag : std_logic;
signal vptat : std_logic_vector(15 downto 0);
signal done_vptat : std_logic;
signal i2c_mem_vptat_address : std_logic_vector(10 downto 0);
signal f32_data_vvptat : float32;

signal i2c_mem_vbe_flag : std_logic;
signal vbe : std_logic_vector(15 downto 0);
signal done_vbe : std_logic;
signal i2c_mem_vbe_address : std_logic_vector(10 downto 0);
signal f32_data_vvbe : float32;

signal i2c_mem_alphaptat_flag : std_logic;
signal alphaptat : std_logic_vector(15 downto 0);
signal done_alphaptat : std_logic;
signal i2c_mem_alphaptat_address : std_logic_vector(10 downto 0);
signal f32_data_valphaptat : float32;

begin

o_data <= return_vdd;

mem_kvdd_vdd25_clock <= i_clock;
mem_kvdd_vdd25_reset <= i_reset;
mem_kvptat_ktptat_clock <= i_clock;
mem_kvptat_ktptat_reset <= i_reset;
mem_alphaptat_clock <= i_clock;
mem_alphaptat_reset <= i_reset;

i2c_mem_clka <= i_clock;
i2c_mem_dina <= i2c_r_data;
i2c_mem_addra <=
	i2c_mem_kvdd_vdd25_address when i2c_mem_kvdd_vdd25_flag = '1'
	else
	i2c_mem_kvptat_ktptat_address when i2c_mem_kvptat_ktptat_flag = '1'
	else
	i2c_mem_vptat25_address when i2c_mem_vptat25_flag = '1'
	else
	i2c_mem_vptat_address when i2c_mem_vptat_flag = '1'
	else
	i2c_mem_vbe_address when i2c_mem_vbe_flag = '1'
	else
	i2c_mem_alphaptat_address when i2c_mem_alphaptat_flag = '1'
	else
	signal_i2c_mem_addra_index;

p_i2c_mem_wr : process (i_clock,i_reset) is
	type states is (a,b);
	variable state : states;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			state := a;
		else
			case (state) is
				when a =>
					if (i2c_r_sta = '1') then
						state := b;
						i2c_mem_wea <= "1";
					else
						state := a;
						i2c_mem_wea <= "0";
					end if;
				when b =>
					if (i2c_r_sto = '1') then
						state := a;
						i2c_mem_wea <= "0";
					else
						state := b;
						i2c_mem_wea <= "1";
					end if;
				when others =>
					null;
			end case;
		end if;
	end if;
end process p_i2c_mem_wr;

signal_i2c_mem_data_available <=
	'1' when (
		i2c_r_done_data_prev = '0' and 
		i2c_r_done_data = '1' and 
		(signal_i2c_mem_addra_index = std_logic_vector(to_unsigned(C_DATA_SIZE - 1,11)))
	)
	else 
	'0';

vdd <= ((to_float(std_logic_vector'(x"0000ccc5"),float32'high,-float32'low) - f32_data_vdd25) / f32_data_kvdd) when done_kvdd_vdd25 = '1' else to_float(0.0,float32'high,-float32'low);
return_vdd <= vdd + to_float(3.3,float32'high,-float32'low) when done_kvdd_vdd25 = '1' else to_float(0.0,float32'high,-float32'low);

-- xxx 11.2.2.3,11.1.2 alphaptat
p6 : process (i_clock, i_reset) is
	type states is (a,b,c,d,e,f,g,h,i,j,k,l,m);
	variable state : states;
	constant C_WAIT1 : integer := 2;
	variable v_wait1 : integer range 0 to C_WAIT1 - 1;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			state := a;
			v_wait1 := 0;
			i2c_mem_alphaptat_flag <= '0';
			alphaptat <= (others => '0');
			done_alphaptat <= '0';
			f32_data_valphaptat <= (others => '0');
			i2c_mem_alphaptat_address <= (others => '0');
			mem_alphaptat_address <= (others => '0');
		else
			case (state) is
				when a =>
					v_wait1 := 0;
					if (done_vbe = '1') then
						state := b;
						i2c_mem_alphaptat_flag <= '1';
					else
						state := a;
						i2c_mem_alphaptat_flag <= '0';
					end if;
				when b =>
					state := c;
					i2c_mem_alphaptat_address <= std_logic_vector(to_unsigned(0,11)); -- xxx ee[0x2410]
				when c =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := d;
						v_wait1 := 0;
						alphaptat(15 downto 8) <= i2c_mem_douta;
					else
						state := c;
						v_wait1 := v_wait1 + 1;
					end if;
				when d =>
					state := e;
					i2c_mem_alphaptat_address <= std_logic_vector(to_unsigned(1,11)); -- xxx ee[0x2410]
				when e =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := f;
						v_wait1 := 0;
						alphaptat(7 downto 0) <= i2c_mem_douta;
					else
						state := e;
						v_wait1 := v_wait1 + 1;
					end if;
				when f =>
					mem_alphaptat_address <= x"000" & alphaptat(15 downto 12); -- xxx alphaptat 0xf000 - 4bit
					if (v_wait1 = C_WAIT1 - 1) then
						state := g;
						v_wait1 := 0;
					else
						state := f;
						v_wait1 := v_wait1 + 1;
					end if;
				when g =>
					state := h;
					f32_data_valphaptat <= to_float(mem_alphaptat_data_alphaptat,f32_data_valphaptat);
				when h =>
					state := i;
					i2c_mem_alphaptat_flag <= '0';
--					f32_data_valphaptat(-8 downto -23) <= (others => '0');
				when i =>
					state := j;
					done_alphaptat <= '1';
				when j =>
					report "valphaptat : " & real'image(to_real(f32_data_valphaptat,denormalize=>false)) severity note;
					report "alphaptat : " & integer'image(to_integer(unsigned(alphaptat)));
					report "done" severity failure;
				when others => null;
			end case;
		end if;
	end if;
end process p6;

-- xxx 11.2.2.3,11.1.2 vbe
p5 : process (i_clock, i_reset) is
	type states is (a,b,c,d,e,f,g,h,i,j,k,l,m);
	variable state : states;
	constant C_WAIT1 : integer := 2;
	variable v_wait1 : integer range 0 to C_WAIT1 - 1;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			state := a;
			v_wait1 := 0;
			i2c_mem_vbe_flag <= '0';
			vbe <= (others => '0');
			done_vbe <= '0';
			f32_data_vvbe <= (others => '0');
			i2c_mem_vbe_address <= (others => '0');
		else
			case (state) is
				when a =>
					v_wait1 := 0;
					if (done_vptat = '1') then
						state := b;
						i2c_mem_vbe_flag <= '1';
					else
						state := a;
						i2c_mem_vbe_flag <= '0';
					end if;
				when b =>
					state := c;
					i2c_mem_vbe_address <= std_logic_vector(to_unsigned(0,11)); -- xxx ram[0x0700]
				when c =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := d;
						v_wait1 := 0;
--						vbe(15 downto 8) <= i2c_mem_douta;
					else
						state := c;
						v_wait1 := v_wait1 + 1;
					end if;
				when d =>
					state := e;
					i2c_mem_vbe_address <= std_logic_vector(to_unsigned(0,11)); -- xxx ram[0x0700]
				when e =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := f;
						v_wait1 := 0;
--						vbe(7 downto 0) <= i2c_mem_douta;
						vbe <= x"4BF2"; -- xxx p.37 ds
					else
						state := e;
						v_wait1 := v_wait1 + 1;
					end if;
				when f =>
					state := g;
					f32_data_vvbe <= to_float(vbe,f32_data_vvbe);
				when g =>
					state := h;
					i2c_mem_vbe_flag <= '0';
--					f32_data_vvbe(-8 downto -23) <= (others => '0');
				when h =>
					state := i;
					done_vbe <= '1';
				when i =>
					report "vvbe : " & real'image(to_real(f32_data_vvbe,denormalize=>false)) severity note;
					report "vbe : " & integer'image(to_integer(unsigned(vbe)));
--					report "done" severity failure;
				when others => null;
			end case;
		end if;
	end if;
end process p5;

-- xxx 11.2.2.3,11.1.2 vptat
p4 : process (i_clock, i_reset) is
	type states is (a,b,c,d,e,f,g,h,i,j,k,l,m);
	variable state : states;
	constant C_WAIT1 : integer := 2;
	variable v_wait1 : integer range 0 to C_WAIT1 - 1;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			state := a;
			v_wait1 := 0;
			i2c_mem_vptat_flag <= '0';
			vptat <= (others => '0');
			done_vptat <= '0';
			f32_data_vvptat <= (others => '0');
			i2c_mem_vptat_address <= (others => '0');
		else
			case (state) is
				when a =>
					v_wait1 := 0;
					if (done_vptat25 = '1') then
						state := b;
						i2c_mem_vptat_flag <= '1';
					else
						state := a;
						i2c_mem_vptat_flag <= '0';
					end if;
				when b =>
					state := c;
					i2c_mem_vptat_address <= std_logic_vector(to_unsigned(0,11)); -- xxx ram[0x0720]
				when c =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := d;
						v_wait1 := 0;
--						vptat(15 downto 8) <= i2c_mem_douta;
					else
						state := c;
						v_wait1 := v_wait1 + 1;
					end if;
				when d =>
					state := e;
					i2c_mem_vptat_address <= std_logic_vector(to_unsigned(0,11)); -- xxx ram[0x0720]
				when e =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := f;
						v_wait1 := 0;
--						vptat(7 downto 0) <= i2c_mem_douta;
						vptat <= x"06AF"; -- xxx p.37 ds
					else
						state := e;
						v_wait1 := v_wait1 + 1;
					end if;
				when f =>
					state := g;
					f32_data_vvptat <= to_float(vptat,f32_data_vvptat);
				when g =>
					state := h;
					i2c_mem_vptat_flag <= '0';
--					f32_data_vvptat(-8 downto -23) <= (others => '0');
				when h =>
					state := i;
					done_vptat <= '1';
				when i =>
					report "vvptat : " & real'image(to_real(f32_data_vvptat,denormalize=>false)) severity note;
					report "vptat : " & integer'image(to_integer(unsigned(vptat)));
--					report "done" severity failure;
				when others => null;
			end case;
		end if;
	end if;
end process p4;

-- xxx 11.2.2.3,11.1.2 vptat25
p3 : process (i_clock, i_reset) is
	type states is (a,b,c,d,e,f,g,h,i,j,k,l,m);
	variable state : states;
	constant C_WAIT1 : integer := 2;
	variable v_wait1 : integer range 0 to C_WAIT1 - 1;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			state := a;
			v_wait1 := 0;
			i2c_mem_vptat25_flag <= '0';
			vptat25 <= (others => '0');
			done_vptat25 <= '0';
			f32_data_vvptat25 <= (others => '0');
			i2c_mem_vptat25_address <= (others => '0');
		else
			case (state) is
				when a =>
					v_wait1 := 0;
					if (done_kvptat_ktptat = '1') then
						state := b;
						i2c_mem_vptat25_flag <= '1';
					else
						state := a;
						i2c_mem_vptat25_flag <= '0';
					end if;
				when b =>
					state := c;
					i2c_mem_vptat25_address <= std_logic_vector(to_unsigned(66,11));
				when c =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := d;
						v_wait1 := 0;
						vptat25(15 downto 8) <= i2c_mem_douta;
					else
						state := c;
						v_wait1 := v_wait1 + 1;
					end if;
				when d =>
					state := e;
					i2c_mem_vptat25_address <= std_logic_vector(to_unsigned(67,11));
				when e =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := f;
						v_wait1 := 0;
						vptat25(7 downto 0) <= i2c_mem_douta;
					else
						state := e;
						v_wait1 := v_wait1 + 1;
					end if;
				when f =>
					state := g;
					f32_data_vvptat25 <= to_float(vptat25,f32_data_vvptat25);
				when g =>
					state := h;
					i2c_mem_vptat25_flag <= '0';
--					f32_data_vvptat25(-8 downto -23) <= (others => '0');
				when h =>
					state := i;
					done_vptat25 <= '1';
				when i =>
					report "vvptat25 : " & real'image(to_real(f32_data_vvptat25,denormalize=>false)) severity note;
					report "vptat25 : " & integer'image(to_integer(unsigned(vptat25)));
--					report "done" severity failure;
				when others => null;
			end case;
		end if;
	end if;
end process p3;

-- xxx 11.2.2.3,11.1.2 kvptat,ktptat
p2 : process (i_clock, i_reset) is
	type states is (a,b,c,d,e,f,g,h,i,j,k,l,m);
	variable state : states;
	constant C_WAIT1 : integer := 2;
	variable v_wait1 : integer range 0 to C_WAIT1 - 1;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			state := a;
			v_wait1 := 0;
			i2c_mem_kvptat_ktptat_flag <= '0';
			kvptat_ktptat <= (others => '0');
			done_kvptat_ktptat <= '0';
			f32_data_kvptat <= (others => '0');
			f32_data_ktptat <= (others => '0');
			i2c_mem_kvptat_ktptat_address <= (others => '0');
			mem_kvptat_ktptat_address <= (others => '0');
		else
			case (state) is
				when a =>
					v_wait1 := 0;
					if (done_kvdd_vdd25 = '1') then
						state := b;
						i2c_mem_kvptat_ktptat_flag <= '1';
					else
						state := a;
						i2c_mem_kvptat_ktptat_flag <= '0';
					end if;
				when b =>
					state := c;
					i2c_mem_kvptat_ktptat_address <= std_logic_vector(to_unsigned(68,11));
				when c =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := d;
						v_wait1 := 0;
						kvptat_ktptat(15 downto 8) <= i2c_mem_douta;
					else
						state := c;
						v_wait1 := v_wait1 + 1;
					end if;
				when d =>
					state := e;
					i2c_mem_kvptat_ktptat_address <= std_logic_vector(to_unsigned(69,11));
				when e =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := f;
						v_wait1 := 0;
						kvptat_ktptat(7 downto 0) <= i2c_mem_douta;
					else
						state := e;
						v_wait1 := v_wait1 + 1;
					end if;
				when f =>
					mem_kvptat_ktptat_address <= "0000000000" & kvptat_ktptat(15 downto 10); -- xxx kvptat 0xfc000 - 6bit
					if (v_wait1 = C_WAIT1 - 1) then
						state := g;
						v_wait1 := 0;
					else
						state := f;
						v_wait1 := v_wait1 + 1;
					end if;
				when g =>
					state := h;
					f32_data_kvptat <= to_float(mem_kvptat_ktptat_data_kvptat,f32_data_kvptat);
				when h =>
					state := i;
				when i =>
					mem_kvptat_ktptat_address <= "000000" & kvptat_ktptat(9 downto 0); -- xxx ktptat 0x03ff - 10bit
					if (v_wait1 = C_WAIT1 - 1) then
						state := j;
						v_wait1 := 0;
					else
						state := i;
						v_wait1 := v_wait1 + 1;
					end if;
				when j =>
					state := k;
					f32_data_ktptat <= to_float(mem_kvptat_ktptat_data_ktptat,f32_data_ktptat);
				when k =>
					state := l;
					i2c_mem_kvptat_ktptat_flag <= '0';
				when l =>
					state := m;
					done_kvptat_ktptat <= '1';
				when m =>
					report "kvptat : " & real'image(to_real(f32_data_kvptat,denormalize=>false)) severity note;
					report "ktptat : " & real'image(to_real(f32_data_ktptat,denormalize=>false)) severity note;
--					report "return vdd : " & real'image(to_real(return_vdd,denormalize=>false)) severity note;
--					report "done" severity failure;
				when others => null;
			end case;
		end if;
	end if;
end process p2;

--vdd <= ((to_float(std_logic_vector'(x"0000ccc5"),float32'high,-float32'low) - f32_data_vdd25) / f32_data_kvdd) when done_kvdd_vdd25 = '1' else to_float(0.0,float32'high,-float32'low);
--return_vdd <=  vdd + to_float(3.3,float32'high,-float32'low) when done_kvdd_vdd25 = '1' else to_float(0.0,float32'high,-float32'low);

-- xxx 11.2.2.2,11.1.1 datasheet p.33 0x2433-0x2410 = 0x23 * 2 = 0x70 -> kvdd/vdd25 = 0x9d68
p1 : process (i_clock, i_reset) is
	type states is (a,b,c,d,e,f,g,h,i,j,k,l,m);
	variable state : states;
	constant C_WAIT1 : integer := 2;
	variable v_wait1 : integer range 0 to C_WAIT1 - 1;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			state := a;
			kvdd_vdd25 <= (others => '0');
			v_wait1 := 0;
			done_kvdd_vdd25 <= '0';
			i2c_mem_kvdd_vdd25_flag <= '0';
			f32_data_kvdd <= (others => '0');
			f32_data_vdd25 <= (others => '0');
			i2c_mem_kvdd_vdd25_address <= (others => '0');
			mem_kvdd_vdd25_address <= (others => '0');
		else
			case (state) is
				when a =>
					done_kvdd_vdd25 <= '0';
					v_wait1 := 0;
					if (i2c_r_sto = '1') then
						state := b;
						i2c_mem_kvdd_vdd25_flag <= '1';
					else
						state := a;
						i2c_mem_kvdd_vdd25_flag <= '0';
					end if;
				when b =>
					state := c;
					i2c_mem_kvdd_vdd25_address <= std_logic_vector(to_unsigned(70,11));
				when c =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := d;
						v_wait1 := 0;
						kvdd_vdd25(15 downto 8) <= i2c_mem_douta;
					else
						state := c;
						v_wait1 := v_wait1 + 1;
					end if;
				when d =>
					state := e;
					i2c_mem_kvdd_vdd25_address <= std_logic_vector(to_unsigned(71,11));
				when e =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := f;
						v_wait1 := 0;
						kvdd_vdd25(7 downto 0) <= i2c_mem_douta;
					else
						state := e;
						v_wait1 := v_wait1 + 1;
					end if;
				when f =>
					mem_kvdd_vdd25_address <= kvdd_vdd25(15 downto 8);
					if (v_wait1 = C_WAIT1 - 1) then
						state := g;
						v_wait1 := 0;
					else
						state := f;
						v_wait1 := v_wait1 + 1;
					end if;
				when g =>
					state := h;
					f32_data_kvdd <= to_float(x"0000"&mem_kvdd_vdd25_data_kvdd,f32_data_kvdd);
				when h =>
					state := i;
				when i =>
					mem_kvdd_vdd25_address <= kvdd_vdd25(7 downto 0);
					if (v_wait1 = C_WAIT1 - 1) then
						state := j;
						v_wait1 := 0;
					else
						state := i;
						v_wait1 := v_wait1 + 1;
					end if;
				when j =>
					state := k;
					f32_data_vdd25 <= to_float(x"0000"&mem_kvdd_vdd25_data_vdd25,f32_data_vdd25);
				when k =>
					state := l;
					i2c_mem_kvdd_vdd25_flag <= '0';
				when l =>
					state := m;
					done_kvdd_vdd25 <= '1';
				when m =>
					report "kvdd : " & real'image(to_real(f32_data_kvdd,denormalize=>false)) severity note;
					report "vdd25 : " & real'image(to_real(f32_data_vdd25,denormalize=>false)) severity note;
					report "return vdd : " & real'image(to_real(return_vdd,denormalize=>false)) severity note;
--					report "done" severity failure;
				when others => null;
			end case;
		end if;
	end if;
end process p1;

p0 : process (i_clock, i_reset) is
	variable variable_i2c_mem_addra_index : integer range 0 to C_DATA_SIZE - 1;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			variable_i2c_mem_addra_index := 0;
			i2c_r_done_data_prev <= '0';
		else
			i2c_r_done_data_prev <= i2c_r_done_data;
			if (i2c_r_sto = '1') then
				variable_i2c_mem_addra_index := 0;
			elsif (i2c_r_done_data_prev = '0' and i2c_r_done_data = '1') then
					variable_i2c_mem_addra_index := variable_i2c_mem_addra_index + 1;
			end if;
		end if;
		signal_i2c_mem_addra_index <= std_logic_vector(to_unsigned(variable_i2c_mem_addra_index,11));
	end if;
end process p0;

inst_i2c_r : i2c_r
port map (
i_clock => i_clock,
i_reset => i_reset,
i_sda => i_sda,
i_scl => i_scl,
o_i2c_address => i2c_r_address,
o_i2c_address_rw => i2c_r_address_rw,
o_i2c_address_ack => i2c_r_address_ack,
o_i2c_data => i2c_r_data,
o_i2c_data_ack => i2c_r_data_ack,
o_done_data => i2c_r_done_data,
o_done_address => i2c_r_done_address,
o_sta => i2c_r_sta,
o_sto => i2c_r_sto,
o_counter_enable => i2c_r_counter_enable
);

inst_i2c_mem : i2c_mem
port map (
clka => i2c_mem_clka,
wea => i2c_mem_wea,
addra => i2c_mem_addra,
dina => i2c_mem_dina,
douta => i2c_mem_douta,
clkb => i2c_mem_clkb,
web => i2c_mem_web,
addrb => i2c_mem_addrb,
dinb => i2c_mem_dinb,
doutb => i2c_mem_doutb
);

inst_mem_kvdd_vdd25 : mem_kvdd_vdd25
port map (
i_clock => mem_kvdd_vdd25_clock,
i_reset => mem_kvdd_vdd25_reset,
i_address => mem_kvdd_vdd25_address,
o_data_kvdd => mem_kvdd_vdd25_data_kvdd,
o_data_vdd25 => mem_kvdd_vdd25_data_vdd25
);

inst_mem_kvptat_ktptat : mem_kvptat_ktptat
port map (
i_clock => mem_kvptat_ktptat_clock,
i_reset => mem_kvptat_ktptat_reset,
i_address => mem_kvptat_ktptat_address,
o_data_kvptat => mem_kvptat_ktptat_data_kvptat,
o_data_ktptat => mem_kvptat_ktptat_data_ktptat
);

inst_mem_alphaptat : mem_alphaptat
port map (
i_clock => mem_alphaptat_clock,
i_reset => mem_alphaptat_reset,
i_address => mem_alphaptat_address,
o_data_alphaptat => mem_alphaptat_data_alphaptat
);

end Behavioral;
