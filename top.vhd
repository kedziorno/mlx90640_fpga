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

use work.p_fphdl_package1.all;

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
ena : IN STD_LOGIC;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

signal i2c_mem_clka : STD_LOGIC;
signal i2c_mem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal i2c_mem_ena : STD_LOGIC;
signal i2c_mem_addra : STD_LOGIC_VECTOR(10 DOWNTO 0);
signal i2c_mem_dina : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);

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

signal vptatart : float32;
signal ta : float32;

signal kvdd16,vdd2516 : std_logic_vector(15 downto 0);

component test_fixed_melexis is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2433 : in slv16;
i_ram0x072a : in slv16;
i_ee0x2438 : in slv16;
i_ram0x800d : in slv16;
i_ee0x2432 : in slv16;
i_ee0x2431 : in slv16;
i_ee0x2410 : in slv16;
i_ram0x0720 : in slv16;
i_ram0x0700 : in slv16;
i_ram0x070a : in slv16;
i_ee0x2430 : in slv16;
i_ram0x056f : in slv16; -- pxdata12,16
i_ee0x2411 : in slv16;
i_ee0x2414 : in slv16;
i_ee0x241b : in slv16;
i_ee0x25af : in slv16;
i_ee0x2437 : in slv16;
i_ee0x2434 : in slv16;
i_ram0x0708 : in slv16;
i_ram0x0728 : in slv16;
i_ee0x243a : in slv16;
i_ee0x243b : in slv16;
i_ee0x243c : in slv16;
i_ee0x2439 : in slv16;
i_ee0x2420 : in slv16;
i_ee0x2421 : in slv16;
i_ee0x2424 : in slv16;
i_ee0x242b : in slv16;
i_ee0x258f : in slv16;
i_ee0x243d : in slv16;
i_ee0x243f : in slv16;
i_pixelpattern : in slv14; -- 12x16
-----
o_To : out fd2ft; -- output Temp
o_rdy : out std_logic
);
end component test_fixed_melexis;

signal tfm_clock,tfm_reset,tfm_rdy,tfm_run : std_logic;
signal tfm_ee0x2433,tfm_ram0x072a,tfm_ee0x2438,tfm_ram0x800d,tfm_ee0x2432,tfm_ee0x2431,tfm_ee0x2410,tfm_ram0x0720,tfm_ram0x0700,tfm_ram0x070a,tfm_ee0x2430,tfm_ram0x056f,tfm_ee0x2411,tfm_ee0x2414,tfm_ee0x241b,tfm_ee0x25af,tfm_ee0x2437,tfm_ee0x2434,tfm_ram0x0708,tfm_ram0x0728,tfm_ee0x243a,tfm_ee0x243b,tfm_ee0x243c,tfm_ee0x2439,tfm_ee0x2420,tfm_ee0x2421,tfm_ee0x2424,tfm_ee0x242b,tfm_ee0x258f,tfm_ee0x243d,tfm_ee0x243f : slv16;
signal tfm_pixelpattern : slv14; 
signal tfm_to : fd2ft;

signal tfm_calculate : std_logic;
signal i2c_mem_addra_tfm : std_logic_vector (10 downto 0);
signal i2c_mem_ena_tfm : std_logic;

signal i2c_r_done_data_re : std_logic;
signal i2c_r_done_data_fe : std_logic;

begin

o_data <= ta;

i2c_mem_clka <= i_clock;
i2c_mem_dina <= i2c_r_data;
i2c_mem_addra <=
i2c_mem_addra_tfm when tfm_calculate = '1'
else signal_i2c_mem_addra_index;

signal_i2c_mem_data_available <= '1' when (i2c_r_done_data_re = '1' and (signal_i2c_mem_addra_index = std_logic_vector(to_unsigned(C_DATA_SIZE-1,11)))) else '0';

i2c_r_done_data_re <= '1' when (i2c_r_done_data = '1') and (i2c_r_done_data_prev = '0') else '0';
i2c_r_done_data_fe <= '1' when (i2c_r_done_data = '0') and (i2c_r_done_data_prev = '1') else '0';

i2c_mem_wea(0) <= '1' when i2c_r_done_data_re = '1' else '0';
i2c_mem_ena <= 
'1' when i2c_mem_ena_tfm = '1' else
'1' when i2c_r_done_data_re = '1' else 
'0';

p1 : process (i_clock, i_reset) is
	type states is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20);
	variable state : states;
	constant C_WAIT1 : integer := 2;
	variable v_wait1 : integer range 0 to C_WAIT1 - 1;
	variable tfmout : std_logic_vector (7 downto 0);
	procedure name1 (s1 : in states; address : in integer range 0 to 2**10-1) is
	begin
		state := s1;
		i2c_mem_addra_tfm <= std_logic_vector(to_unsigned(address,11));
		i2c_mem_ena_tfm <= '1';
		v_wait1 := 0;
	end procedure name1;
	procedure name2 (s1 : in states; s2 : in states; tfmout : out std_logic_vector (7 downto 0)) is
	begin
		if (v_wait1 = C_WAIT1 - 1) then
			state := s2;
			v_wait1 := 0;
			i2c_mem_ena_tfm <= '0';
			tfmout := i2c_mem_douta;
			return;
		else
			state := s1;
			v_wait1 := v_wait1 + 1;
		end if;
	end procedure name2;
begin
if (rising_edge(i_clock)) then
	if (i_reset = '1') then
		state := s0;
		v_wait1 := 0;
		tfm_run <= '0';
		tfm_ee0x2433 <= (others => '0');
		tfm_ram0x072a <= (others => '0');
		tfm_ee0x2438 <= (others => '0');
		tfm_ram0x800d <= (others => '0');
		tfm_ee0x2432 <= (others => '0');
		tfm_ee0x2431 <= (others => '0');
		tfm_ee0x2410 <= (others => '0');
		tfm_ram0x0720 <= (others => '0');
		tfm_ram0x0700 <= (others => '0');
		tfm_ram0x070a <= (others => '0');
		tfm_ee0x2430 <= (others => '0');
		tfm_ram0x056f <= (others => '0');
		tfm_ee0x2411 <= (others => '0');
		tfm_ee0x2414 <= (others => '0');
		tfm_ee0x241b <= (others => '0');
		tfm_ee0x25af <= (others => '0');
		tfm_ee0x2437 <= (others => '0');
		tfm_ee0x2434 <= (others => '0');
		tfm_ram0x0708 <= (others => '0');
		tfm_ram0x0728 <= (others => '0');
		tfm_ee0x243a <= (others => '0');
		tfm_ee0x243b <= (others => '0');
		tfm_ee0x243c <= (others => '0');
		tfm_ee0x2439 <= (others => '0');
		tfm_ee0x2420 <= (others => '0');
		tfm_ee0x2421 <= (others => '0');
		tfm_ee0x2424 <= (others => '0');
		tfm_ee0x242b <= (others => '0');
		tfm_ee0x258f <= (others => '0');
		tfm_ee0x243d <= (others => '0');
		tfm_ee0x243f <= (others => '0');
		tfm_pixelpattern <= (others => '0');
		tfm_calculate <= '0';
		i2c_mem_addra_tfm <= (others => '0');
	else
case (state) is
when s0 =>
	if (signal_i2c_mem_data_available = '1') then
		state := s1;
		tfm_calculate <= '1';
	else
		state := s0;
		tfm_calculate <= '0';
	end if;

when s1 => name1 (s2, 0);
when s2 => name2 (s2, s3, tfmout);  tfm_ee0x2410 (15 downto 8) <= tfmout;
when s3 => name1 (s4, 1);
when s4 => name2 (s4, s5, tfmout); tfm_ee0x2410 (7 downto 0) <= tfmout;

when s5 => name1 (s6, 2);
when s6 => name2 (s6, s7, tfmout); tfm_ee0x2411 (15 downto 8) <= tfmout;
when s7 => name1 (s8, 3);
when s8 => name2 (s8, s9, tfmout); tfm_ee0x2411 (7 downto 0) <= tfmout;

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
			if (i2c_r_counter_enable = '0') then
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
ena => i2c_mem_ena,
wea => i2c_mem_wea,
addra => i2c_mem_addra,
dina => i2c_mem_dina,
douta => i2c_mem_douta
);

tfm_clock <= i_clock;
tfm_reset <= i_reset;

inst_tfm : test_fixed_melexis
port map (
i_clock => tfm_clock,
i_reset => tfm_reset,
i_run => tfm_run,
i_ee0x2433 => tfm_ee0x2433,
i_ram0x072a => tfm_ram0x072a,
i_ee0x2438 => tfm_ee0x2438,
i_ram0x800d => tfm_ram0x800d,
i_ee0x2432 => tfm_ee0x2432,
i_ee0x2431 => tfm_ee0x2431,
i_ee0x2410 => tfm_ee0x2410,
i_ram0x0720 => tfm_ram0x0720,
i_ram0x0700 => tfm_ram0x0700,
i_ram0x070a => tfm_ram0x070a,
i_ee0x2430 => tfm_ee0x2430,
i_ram0x056f => tfm_ram0x056f,
i_ee0x2411 => tfm_ee0x2411,
i_ee0x2414 => tfm_ee0x2414,
i_ee0x241b => tfm_ee0x241b,
i_ee0x25af => tfm_ee0x25af,
i_ee0x2437 => tfm_ee0x2437,
i_ee0x2434 => tfm_ee0x2434,
i_ram0x0708 => tfm_ram0x0708,
i_ram0x0728 => tfm_ram0x0728,
i_ee0x243a => tfm_ee0x243a,
i_ee0x243b => tfm_ee0x243b,
i_ee0x243c => tfm_ee0x243c,
i_ee0x2439 => tfm_ee0x2439,
i_ee0x2420 => tfm_ee0x2420,
i_ee0x2421 => tfm_ee0x2421,
i_ee0x2424 => tfm_ee0x2424,
i_ee0x242b => tfm_ee0x242b,
i_ee0x258f => tfm_ee0x258f,
i_ee0x243d => tfm_ee0x243d,
i_ee0x243f => tfm_ee0x243f,
i_pixelpattern => tfm_pixelpattern,
o_To => tfm_to,
o_rdy => tfm_rdy
);

end Behavioral;
