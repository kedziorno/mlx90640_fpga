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
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

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
	o_data : out std_logic_vector(7 downto 0)
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

component fpu_sub
port (
clk_i       	: in std_logic;
opa_i       	: in std_logic_vector(FP_WIDTH-1 downto 0);   
opb_i       	: in std_logic_vector(FP_WIDTH-1 downto 0);
output_o    	: out std_logic_vector(FP_WIDTH-1 downto 0);
start_i	  		: in  std_logic;
ready_o 		: out std_logic	
);   
end component;

signal fpu_sub_clk_i,fpu_sub_start_i,fpu_sub_ready_o : std_logic;
signal fpu_sub_opa_i,fpu_sub_opb_i,fpu_sub_output_o : std_logic_vector(FP_WIDTH-1 downto 0);

component fpu_div
port (
clk_i       	: in std_logic;
opa_i       	: in std_logic_vector(31 downto 0);   
opb_i       	: in std_logic_vector(31 downto 0);
output_o    	: out std_logic_vector(31 downto 0);
start_i	  		: in  std_logic;
ready_o 		: out std_logic	
);   
end component;

signal fpu_div_clk_i,fpu_div_start_i,fpu_div_ready_o : std_logic;
signal fpu_div_opa_i,fpu_div_opb_i,fpu_div_output_o : std_logic_vector(31 downto 0);

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

subtype sfixed16 is sfixed (7 downto -8);

signal f32_data_kvdd,f32_data_vdd25 : float32;
--signal f32_data_kvdd,f32_data_vdd25 : sfixed16;
signal slv_data_kvdd,slv_data_vdd25 : std_logic_vector(31 downto 0);
--signal slv_data_kvdd,slv_data_vdd25 : std_logic_vector(15 downto 0);

signal signal_i2c_mem_addra_index : std_logic_vector(10 downto 0);
signal signal_i2c_mem_data_available : std_logic;

signal i2c_r_done_address_prev : std_logic;
signal i2c_r_done_data_prev : std_logic;

signal kvdd,vdd25 : std_logic_vector(I2C_DATA_BITS - 1 downto 0);
signal i2c_mem_rw_flag : std_logic;
signal i2c_mem_kvdd_vdd25_address : std_logic_vector(10 downto 0);

signal aaa : std_logic; -- xxx

signal return_sub : std_logic_vector(15 downto 0);

begin

o_data <= fpu_div_output_o(7 downto 0);

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

--i2c_mem_clka <= i2c_r_done_data;
i2c_mem_clka <= i_clock;
i2c_mem_addra <= signal_i2c_mem_addra_index when i2c_mem_rw_flag = '0' else i2c_mem_kvdd_vdd25_address when i2c_mem_rw_flag = '1' else (others => '0');
i2c_mem_dina <= i2c_r_data;
--i2c_mem_wea <= "1" when signal_i2c_mem_data_available = '0' else "0";
i2c_mem_wea <= "1" when i2c_r_counter_enable = '1' else "0";
--signal_i2c_mem_data_available <= '1' when (i2c_r_done_data_prev = '0' and i2c_r_done_data = '1' and to_integer(unsigned(signal_i2c_mem_addra_index)) = C_DATA_SIZE - 1) else '0';
signal_i2c_mem_data_available <= '1' when (i2c_r_done_data_prev = '0' and i2c_r_done_data = '1' and (signal_i2c_mem_addra_index = std_logic_vector(conv_unsigned(C_DATA_SIZE - 1,11)))) else '0';
--signal_i2c_mem_data_available <= '1' when (i2c_r_sto = '1') else '0';

inst_mem_kvdd_vdd25 : mem_kvdd_vdd25
port map (
i_clock => mem_kvdd_vdd25_clock,
i_reset => mem_kvdd_vdd25_reset,
i_address => mem_kvdd_vdd25_address,
o_data_kvdd => mem_kvdd_vdd25_data_kvdd,
o_data_vdd25 => mem_kvdd_vdd25_data_vdd25
);

--mem_kvdd_vdd25_clock <= i2c_r_done_data;
mem_kvdd_vdd25_clock <= i_clock;
mem_kvdd_vdd25_reset <= i_reset;
--mem_kvdd_vdd25_address <= x"68"; -- xxx datasheet p.33 0x2433-0x2410 = 0x23 * 2 = 0x70 -> kvdd/vdd25 = 0x9d68

inst_fpu_sub : fpu_sub
port map (
clk_i => fpu_sub_clk_i,
opa_i => fpu_sub_opa_i,
opb_i => fpu_sub_opb_i,
output_o => fpu_sub_output_o,  
start_i => fpu_sub_start_i,
ready_o => fpu_sub_ready_o
);

inst_fpu_div : fpu_div
port map (
clk_i => fpu_div_clk_i,
opa_i => fpu_div_opa_i,
opb_i => fpu_div_opb_i,
output_o => fpu_div_output_o,  
start_i => fpu_div_start_i,
ready_o => fpu_div_ready_o
);

--f32_data_kvdd <= to_float(x"0000" & mem_kvdd_vdd25_data_kvdd);
--f32_data_vdd25 <= to_float(x"0000" & mem_kvdd_vdd25_data_vdd25);
--slv_data_kvdd <= to_slv(f32_data_kvdd);
--slv_data_vdd25 <= to_slv(f32_data_vdd25);

fpu_sub_clk_i <= i_clock;
fpu_div_clk_i <= i_clock;

-- xxx datasheet p.33 0x2433-0x2410 = 0x23 * 2 = 0x70 -> kvdd/vdd25 = 0x9d68
p1 : process (i_clock, i_reset) is
	type states is (a,b,c,d,e,f,g,h,i,j,k,l,m);
	variable state : states;
	constant C_WAIT1 : integer := 2;
	variable v_wait1 : integer range 0 to C_WAIT1 - 1;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			state := a;
			kvdd <= (others => '0');
			vdd25 <= (others => '0');
			i2c_mem_rw_flag <= '0';
			v_wait1 := 0;
			aaa <= '0';
		else
			case (state) is
				when a =>
					aaa <= '0';
					v_wait1 := 0;
					if (i2c_r_sto = '1') then
						state := b;
						i2c_mem_rw_flag <= '1';
					else
						state := a;
						i2c_mem_rw_flag <= '0';
					end if;
				when b =>
					state := c;
					i2c_mem_kvdd_vdd25_address <= std_logic_vector(conv_unsigned(70,11));
				when c =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := d;
						v_wait1 := 0;
						kvdd <= i2c_mem_douta;
					else
						state := c;
						v_wait1 := v_wait1 + 1;
					end if;
				when d =>
					state := e;
					i2c_mem_kvdd_vdd25_address <= std_logic_vector(conv_unsigned(71,11));
				when e =>
					if (v_wait1 = C_WAIT1 - 1) then
						state := f;
						v_wait1 := 0;
						vdd25 <= i2c_mem_douta;
					else
						state := e;
						v_wait1 := v_wait1 + 1;
					end if;
				when f =>
					mem_kvdd_vdd25_address <= kvdd;
					if (v_wait1 = C_WAIT1 - 1) then
						state := g;
						v_wait1 := 0;
					else
						state := f;
						v_wait1 := v_wait1 + 1;
					end if;
				when g =>
					state := h;
					f32_data_kvdd <= to_float(x"0000" & mem_kvdd_vdd25_data_kvdd);
--					f32_data_kvdd <= to_sfixed(mem_kvdd_vdd25_data_kvdd,sfixed16'high,sfixed16'low);
				when h =>
					state := i;
					slv_data_kvdd <= to_slv(f32_data_kvdd); -- xxx 0xf3a0
				when i =>
					mem_kvdd_vdd25_address <= vdd25;
					if (v_wait1 = C_WAIT1 - 1) then
						state := j;
						v_wait1 := 0;
					else
						state := i;
						v_wait1 := v_wait1 + 1;
					end if;
				when j =>
					state := k;
					f32_data_vdd25 <= to_float(x"0000" & mem_kvdd_vdd25_data_vdd25);
--					f32_data_vdd25 <= to_sfixed(mem_kvdd_vdd25_data_vdd25,sfixed16'high,sfixed16'low);
				when k =>
					state := l;
					slv_data_vdd25 <= to_slv(f32_data_vdd25); -- xxx 0xcd00
				when l =>
					state := m;
				when m =>
					aaa <= '1';
--					report "" severity failure;
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
--			i2c_r_done_address_prev <= '0';
		else
			i2c_r_done_data_prev <= i2c_r_done_data;
--			i2c_r_done_address_prev <= i2c_r_done_address;
			if (i2c_r_sto = '1') then
				variable_i2c_mem_addra_index := 0;
			elsif (i2c_r_done_data_prev = '0' and i2c_r_done_data = '1') then
--				if (variable_i2c_mem_addra_index = C_DATA_SIZE - 1) then
--					variable_i2c_mem_addra_index := 0;
--				else
					variable_i2c_mem_addra_index := variable_i2c_mem_addra_index + 1;
--				end if;
			end if;
		end if;
		signal_i2c_mem_addra_index <= std_logic_vector(conv_unsigned(variable_i2c_mem_addra_index,11));
	end if;
end process p0;

p0_fpu_sub : process (i_clock,i_reset) is
	type states_fpu_sub is (fpu_sub_state_idle,fpu_sub_state_a,fpu_sub_state_b);
	variable state_fpu_sub : states_fpu_sub;
--	variable qwe : std_logic_vector(31 downto 0);
	variable qwe : std_logic_vector(31 downto 0) := x"0000ccc5";
	variable asd : unsigned(31 downto 0) := x"0000ccc5";
	variable zxc : signed(31 downto 0) := (others => '0');
	variable rty : float32;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			fpu_sub_opa_i <= (others => '0');
			fpu_sub_opb_i <= (others => '0');
			fpu_sub_start_i <= '0';
			state_fpu_sub := fpu_sub_state_idle;
		else
			case (state_fpu_sub) is
				when fpu_sub_state_idle =>
--					if (signal_i2c_mem_data_available = '1') then
					if (aaa = '1') then
						state_fpu_sub := fpu_sub_state_a;
						asd := unsigned(qwe);
						zxc := conv_signed(asd,32);
						qwe := std_logic_vector(zxc);
						rty := to_float(qwe,float32'high,-float32'low);
						fpu_sub_opa_i <= x"8000" & to_slv(rty)(15 downto 0); -- xxx
						fpu_sub_opb_i <= x"8000" & slv_data_vdd25(15 downto 0);
--						fpu_sub_opb_i <= mem_kvdd_vdd25_data_kvdd;
					else
						state_fpu_sub := fpu_sub_state_idle;
					end if;
				when fpu_sub_state_a =>
					state_fpu_sub := fpu_sub_state_b;
					fpu_sub_start_i <= '1';
				when fpu_sub_state_b =>
					fpu_sub_start_i <= '0';
					if(fpu_sub_ready_o = '1') then
						return_sub <= fpu_sub_output_o(15 downto 0);
						state_fpu_sub := fpu_sub_state_idle;
					else
						state_fpu_sub := fpu_sub_state_b;
					end if;
				when others =>
					null;
			end case;
		end if;
	end if;
end process p0_fpu_sub;

p0_fpu_div : process (i_clock,i_reset) is
	type states_fpu_div is (fpu_div_state_idle,fpu_div_state_a,fpu_div_state_b);
	variable state_fpu_div : states_fpu_div;
begin
	if (rising_edge(i_clock)) then
		if (i_reset = '1') then
			fpu_div_opa_i <= (others => '0');
			fpu_div_opb_i <= (others => '0');
			fpu_div_start_i <= '0';
			state_fpu_div := fpu_div_state_idle;
		else
			case (state_fpu_div) is
				when fpu_div_state_idle =>
					if (fpu_sub_ready_o = '1') then
						state_fpu_div := fpu_div_state_a;
						fpu_div_opa_i <= x"0000" & fpu_sub_output_o(15 downto 0);
						fpu_div_opb_i <= x"ffff" & slv_data_kvdd(15 downto 0);
--						fpu_div_opb_i <= mem_kvdd_vdd25_data_vdd25;
					else
						state_fpu_div := fpu_div_state_idle;
					end if;
				when fpu_div_state_a =>
					state_fpu_div := fpu_div_state_b;
					fpu_div_start_i <= '1';
				when fpu_div_state_b =>
					fpu_div_start_i <= '0';
					if(fpu_div_ready_o = '1') then
						state_fpu_div := fpu_div_state_idle;
						report "div : " & real'image(to_real(float32(fpu_div_output_o))) severity failure;
					else
						state_fpu_div := fpu_div_state_b;
					end if;
				when others =>
					null;
			end case;
		end if;
	end if;
end process p0_fpu_div;

end Behavioral;
