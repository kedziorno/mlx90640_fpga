--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:03:00 12/06/2022
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_top.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE STD.TEXTIO.ALL;
USE work.p_package1_constants.all;
USE work.p_package1.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY tb_top IS
END tb_top;

ARCHITECTURE behavior OF tb_top IS

-- Component Declaration for the Unit Under Test (UUT)

component top is
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
	o_done_address : out std_logic
);
end component top;

--Inputs
signal sda : std_logic := '1';
signal scl : std_logic := '1';

signal reset : std_logic := '0';
signal clock : std_logic := '1';
signal scl_clock : std_logic := '0';
constant clock_period : time := 10 ns;
constant scl_clock_period : time := clock_period / 4;

signal idle : std_logic := '0';
signal sda_data : std_logic := '0';

signal address : std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
signal address_rw : std_logic;
signal address_ack : std_logic;
signal data : std_logic_vector(I2C_DATA_BITS - 1 downto 0);
signal data_ack : std_logic;
signal done_data : std_logic;
signal done_address : std_logic;

signal signal_idle_number : natural;
signal signal_address_value : std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
signal signal_address_value_lo : std_logic_vector(3 downto 0);
signal signal_address_value_hi : std_logic_vector(2 downto 0);
signal signal_address_rw : boolean;
signal signal_data_value : std_logic_vector(I2C_DATA_BITS - 1 downto 0);
signal signal_data_value_lo : std_logic_vector(3 downto 0);
signal signal_data_value_hi : std_logic_vector(3 downto 0);
signal signal_data_ack : boolean;

BEGIN

-- MLX90641 16x12 IR array
-- REVISION 3 - DECEMBER 9, 2019
-- 3901090641
-- page11 10.2.1.4. I2C command format

-- Instantiate the Unit Under Test (UUT)
uut: top PORT MAP (
i_clock => clock,
i_reset => reset,
i_sda => sda,
i_scl => scl,
o_i2c_address => address,
o_i2c_address_rw => address_rw,
o_i2c_address_ack => address_ack,
o_i2c_data => data,
o_i2c_data_ack => data_ack,
o_done_data => done_data,
o_done_address => done_address
);

-- Clock process definitions
clock_process : process
begin
clock <= not clock;
wait for clock_period/2;
end process clock_process;

scl_clock_process : process
begin
	if (idle = '1') then
		scl_clock <= '1';
		wait for scl_clock_period * I2C_STRETCH;
	elsif (idle = '0') then
		scl_clock <= '0';
		wait for scl_clock_period * I2C_STRETCH;
		scl_clock <= '0';
		wait for scl_clock_period * I2C_STRETCH;
		scl_clock <= '1';
		wait for scl_clock_period * I2C_STRETCH;
		scl_clock <= '1';
		wait for scl_clock_period * I2C_STRETCH;
	end if;
end process scl_clock_process;

scl <= scl_clock when idle = '0' else '1' when idle = '1';
sda <= sda_data when idle = '0' else '1' when idle = '1';

-- reset
reset <= '1','0' after clock_period;

-- Stimulus process
stim_proc : process is

file test_vector : text open read_mode is "tb_data.txt";
variable row : line;

variable string_separator : string(1 to 1) := ",";
variable string_type : string(1 to 1) := "X";

variable string_idle : string(1 to 1) := "I";
variable string_address : string(1 to 1) := "A";
variable string_data : string(1 to 1) := "D";

variable string_idle_number : string(1 to 2) := "XX";
variable string_address_value : string(1 to 2) := "XX";
variable string_address_rw : string(1 to 1) := "X";
variable string_data_value : string(1 to 2) := "XX";
variable string_data_ack : string(1 to 1) := "X";

variable variable_idle_number : natural;
variable variable_address_value : std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
variable variable_address_value_lo : std_logic_vector(3 downto 0);
variable variable_address_value_hi : std_logic_vector(2 downto 0);
variable variable_address_rw : boolean;
variable variable_data_value : std_logic_vector(I2C_DATA_BITS - 1 downto 0);
variable variable_data_value_lo : std_logic_vector(3 downto 0);
variable variable_data_value_hi : std_logic_vector(3 downto 0);
variable variable_data_ack : boolean;

begin

-- insert stimulus here
if (reset = '1') then

string_separator := ",";
string_type := "X";

string_idle := "I";
string_address := "A";
string_data := "D";

string_idle_number := "XX";
string_address_value := "XX";
string_address_rw := "X";
string_data_value := "XX";
string_data_ack := "X";

else

	while (not endfile(test_vector)) loop

		readline (test_vector, row);
		read (row, string_type);

		if (string_type = "I") then

			read (row, string_separator);
			read (row, string_idle_number);

			variable_idle_number := natural'value(string_idle_number);

			report "idle " & natural'image(variable_idle_number);

			if variable_idle_number > 0 then
				sda_stop(sda_data, clock_period);
				wait_idle(idle,variable_idle_number,clock_period);
				sda_start(sda_data, clock_period);
			end if;

		elsif (string_type = "A") then

			read (row, string_separator);
			read (row, string_address_value);
			read (row, string_separator);
			read (row, string_address_rw);

			variable_address_value_lo := std_logic_vector(to_unsigned(int2hex(string_address_value(2)),4));
			variable_address_value_hi := std_logic_vector(to_unsigned(int2hex(string_address_value(1)),3));
			variable_address_value := variable_address_value_hi & variable_address_value_lo;
			variable_address_rw := To_Std_Logic(string_address_rw(1));

			report "address " & string_address_value & " " & 
			integer'image(to_integer(unsigned(variable_address_value_hi))) & " " &
			integer'image(to_integer(unsigned(variable_address_value_lo)));

			sda_address_7bit(sda_data, variable_address_value, variable_address_rw, clock_period);
			signal_address_value <= variable_address_value;
			assert (variable_address_value = address)
			report
			"fail address (1) : " &
			integer'image(to_integer(unsigned(variable_address_value))) & " " &
			integer'image(to_integer(unsigned(address)))
			severity warning;

		elsif (string_type = "D") then

			read (row, string_separator);
			read (row, string_data_value);
			read (row, string_separator);
			read (row, string_data_ack);

			variable_data_value_lo := std_logic_vector(to_unsigned(int2hex(string_data_value(2)),4));
			variable_data_value_hi := std_logic_vector(to_unsigned(int2hex(string_data_value(1)),4));
			variable_data_value := variable_data_value_hi & variable_data_value_lo;
			variable_data_ack := To_Std_Logic(string_data_ack(1));

			report "data " & string_data_value & " " & 
			integer'image(to_integer(unsigned(variable_data_value_hi))) & " " &
			integer'image(to_integer(unsigned(variable_data_value_lo)));

			sda_data_8bit(sda_data, variable_data_value, variable_data_ack, clock_period);
			signal_data_value <= variable_data_value;
			assert (variable_data_value = data)
			report "fail data (1) : " &
			integer'image(to_integer(unsigned(variable_data_value))) & " " &
			integer'image(to_integer(unsigned(data)))
			severity warning;


		end if;
	end loop;

	report "done" severity failure;
end if;
end process;

p1 : process (scl_clock) is
begin
	if (rising_edge(scl_clock)) then
		if (done_address = '1') then
			assert (signal_address_value = address)
			report
			"fail address (2) : " &
			integer'image(to_integer(unsigned(signal_address_value))) & " " &
			integer'image(to_integer(unsigned(address)))
			severity warning;
		end if;
	end if;
end process p1;

p2 : process (scl_clock) is
begin
	if (rising_edge(scl_clock)) then
		if (done_data = '1') then
			assert (signal_data_value = data)
			report "fail data (2) : " &
			integer'image(to_integer(unsigned(signal_data_value))) & " " &
			integer'image(to_integer(unsigned(data)))
			severity warning;
		end if;
	end if;
end process p2;

END;
