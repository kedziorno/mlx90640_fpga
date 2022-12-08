library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.p_package1_constants.all;

package p_package1 is

procedure wait_idle(
	signal idle : out std_logic;
	constant n : natural;
	constant clock_period : in time
);

procedure sda_start(
	signal sda_data : out std_logic;
	constant clock_period : in time
);

procedure sda_stop(
	signal sda_data : out std_logic;
	constant clock_period : in time
);

procedure sda_address_7bit(
	signal sda_data : out std_logic;
	constant address : in std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
	constant address_rw : in boolean;
	constant clock_period : in time
);

procedure sda_data_8bit(
	signal sda_data : out std_logic;
	constant data : in std_logic_vector(I2C_DATA_BITS - 1 downto 0);
	constant data_ack : in boolean;
	constant clock_period : in time
);

end p_package1;

package body p_package1 is

procedure wait_idle(
	signal idle : out std_logic;
	constant n : natural;
	constant clock_period : in time
) is
begin
	idle <= '1';
	wait for n * clock_period * I2C_STRETCH;
	idle <= '0';
end wait_idle;

procedure sda_start(
	signal sda_data : out std_logic;
	constant clock_period : in time
) is
	variable scl_clock_period : time := clock_period / I2C_CLOCK_DIVIDER;
begin
	sda_data <= '0'; wait for 2 * scl_clock_period * I2C_STRETCH;
end procedure sda_start;

procedure sda_stop(
	signal sda_data : out std_logic;
	constant clock_period : in time
) is
	variable scl_clock_period : time := clock_period / I2C_CLOCK_DIVIDER;
begin
	sda_data <= '0'; wait for 2 * scl_clock_period * I2C_STRETCH;
end procedure sda_stop;

procedure sda_address_7bit(
	signal sda_data : out std_logic;
	constant address : in std_logic_vector(I2C_ADDRESS_BITS - 1 downto 0);
	constant address_rw : in boolean;
	constant clock_period : in time
) is
	variable index : natural range 0 to I2C_ADDRESS_BITS - 1 := 0;
begin
	l0 : for i in address'range loop
		sda_data <= address(i); wait for clock_period * I2C_STRETCH;
	end loop l0;
	-- 1bit write
	sda_data <= To_Std_Logic(address_rw); wait for clock_period * I2C_STRETCH;
	-- 1bit ack
	sda_data <= '0'; wait for clock_period * I2C_STRETCH;
end procedure sda_address_7bit;

procedure sda_data_8bit(
	signal sda_data : out std_logic;
	constant data : in std_logic_vector(I2C_DATA_BITS - 1 downto 0);
	constant data_ack : in boolean;
	constant clock_period : in time
) is
	variable index : natural range 0 to I2C_DATA_BITS - 1 := 0;
begin
	l0 : for i in data'range loop
		sda_data <= data(i); wait for clock_period * I2C_STRETCH;
	end loop l0;
	-- 1bit ack
	sda_data <= To_Std_Logic(data_ack); wait for clock_period * I2C_STRETCH;
end procedure sda_data_8bit;
 
end p_package1;
