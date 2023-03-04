----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:07 01/12/2023 
-- Design Name: 
-- Module Name:    test1 - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test1 is
port (
i_clock,i_reset : in std_logic;
vga_hsync : out std_logic;
vga_vsync : out std_logic;
vga_clock : out std_logic;
vga_r : out std_logic_vector (7 downto 0);
vga_g : out std_logic_vector (7 downto 0);
vga_b : out std_logic_vector (7 downto 0)
);
end test1;

architecture Behavioral of test1 is

constant PIXELS : integer := 768;
constant ADDRESS1 : integer := 10;
constant BITS : integer := 24;

component test_fixed_melexis is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_rdy : out std_logic;
i_addr : in std_logic_vector(9 downto 0);
o_do : out std_logic_vector(31 downto 0)
);
end component test_fixed_melexis;
signal test_fixed_melexis_clock : std_logic;
signal test_fixed_melexis_reset : std_logic;
signal test_fixed_melexis_run : std_logic;
signal test_fixed_melexis_i2c_mem_ena : STD_LOGIC;
signal test_fixed_melexis_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal test_fixed_melexis_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal test_fixed_melexis_rdy : std_logic;
signal test_fixed_melexis_addr : std_logic_vector(9 downto 0);
signal test_fixed_melexis_do : std_logic_vector(31 downto 0);

COMPONENT tb_i2c_mem
PORT (
clka : IN STD_LOGIC;
ena : IN STD_LOGIC;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;
signal tb_i2c_mem_clka : STD_LOGIC;
signal tb_i2c_mem_ena : STD_LOGIC;
signal tb_i2c_mem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal tb_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal tb_i2c_mem_dina : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal tb_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);

component address_generator is
Generic (
PIXELS : integer := PIXELS;
ADDRESS1 : integer := ADDRESS1
);
Port ( 
reset : in std_logic;
clk25 : in STD_LOGIC;
enable : in STD_LOGIC;
vsync : in STD_LOGIC;
activeh : in STD_LOGIC;
address : out STD_LOGIC_VECTOR (ADDRESS1-1 downto 0)
);  
end component address_generator;
signal address_generator_reset : std_logic;
signal address_generator_clk25 : STD_LOGIC;
signal address_generator_enable : STD_LOGIC;
signal address_generator_vsync : STD_LOGIC;
signal address_generator_activeh : STD_LOGIC;
signal address_generator_address : STD_LOGIC_VECTOR (ADDRESS1-1 downto 0);

component VGA_timing_synch is
Port (
reset : in std_logic;
clk25 : in  STD_LOGIC;
Hsync : out  STD_LOGIC;
Vsync : out  STD_LOGIC;
activeArea1 : out  STD_LOGIC;
activehaaddrgen : out STD_LOGIC;
activeRender1 : out  STD_LOGIC;
blank : out STD_LOGIC
);
end component VGA_timing_synch;
signal VGA_timing_synch_reset : std_logic;
signal VGA_timing_synch_clk25 : STD_LOGIC;
signal VGA_timing_synch_Hsync : STD_LOGIC;
signal VGA_timing_synch_Vsync : STD_LOGIC;
signal VGA_timing_synch_activeArea1 : STD_LOGIC;
signal VGA_timing_synch_activehaaddrgen : STD_LOGIC;
signal VGA_timing_synch_activeRender1 : STD_LOGIC;
signal VGA_timing_synch_blank : STD_LOGIC;

component vga_imagegenerator is
generic (BITS : integer := BITS);
Port (
reset : in std_logic;
clk : std_logic;
Data_in1 : in STD_LOGIC_VECTOR (BITS-1 downto 0);
active_area1 : in  STD_LOGIC;
RGB_out : out  STD_LOGIC_VECTOR (BITS-1 downto 0)
);
end component vga_imagegenerator;
signal vga_imagegenerator_reset : std_logic;
signal vga_imagegenerator_clk : std_logic;
signal vga_imagegenerator_Data_in1 : STD_LOGIC_VECTOR (BITS-1 downto 0);
signal vga_imagegenerator_active_area1 : STD_LOGIC;
signal vga_imagegenerator_RGB_out : STD_LOGIC_VECTOR (BITS-1 downto 0);

signal clk25 : std_logic;

begin

pvgaclk : process (i_clock) is
	constant CMAX : integer := 4; -- 25
	variable vmax : integer range 0 to CMAX-1;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			clk25 <= '0';
			vmax := 0;
		else
			if (vmax = CMAX-1) then
				clk25 <= not clk25;
				vmax := 0;
			else
				clk25 <= clk25;
				vmax := vmax + 1;
			end if;
		end if;
	end if;
end process pvgaclk;

p0 : process (i_clock) is
	type states is (idle,
	s1,
	ending);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			test_fixed_melexis_run <= '0';
			address_generator_enable <= '0';
		else
			case (state) is
				when idle => state := s1;
					test_fixed_melexis_run <= '1';
				when s1 => state := ending;
					test_fixed_melexis_run <= '0';
					if (test_fixed_melexis_rdy = '1') then
						state := ending;
					else
						state := s1;
					end if;
				when ending => state := ending;
					address_generator_enable <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

test_fixed_melexis_clock <= i_clock;
test_fixed_melexis_reset <= i_reset;
test_fixed_melexis_addr <= address_generator_address;
tfm_inst : test_fixed_melexis port map (
i_clock => test_fixed_melexis_clock,
i_reset => test_fixed_melexis_reset,
i_run => test_fixed_melexis_run,
i2c_mem_ena => test_fixed_melexis_i2c_mem_ena,
i2c_mem_addra => test_fixed_melexis_i2c_mem_addra,
i2c_mem_douta => test_fixed_melexis_i2c_mem_douta,
o_rdy => test_fixed_melexis_rdy,
i_addr => test_fixed_melexis_addr,
o_do => test_fixed_melexis_do
);

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => test_fixed_melexis_clock,
ena => test_fixed_melexis_i2c_mem_ena,
wea => "0",
addra => test_fixed_melexis_i2c_mem_addra,
dina => (others => '0'),
douta => test_fixed_melexis_i2c_mem_douta
);

address_generator_clk25 <= clk25;
address_generator_reset <= i_reset;
address_generator_vsync <= VGA_timing_synch_Vsync;
address_generator_activeh <= VGA_timing_synch_activehaaddrgen;
ag_inst : address_generator port map (
reset => address_generator_reset,
clk25 => address_generator_clk25,
enable => address_generator_enable,
vsync => address_generator_vsync,
activeh => address_generator_activeh,
address => address_generator_address
);

vga_clock <= VGA_timing_synch_clk25;
vga_hsync <= VGA_timing_synch_Hsync;
vga_vsync <= VGA_timing_synch_Vsync;
VGA_timing_synch_clk25 <= clk25;
VGA_timing_synch_reset <= i_reset;
vts_inst : VGA_timing_synch port map (
reset => VGA_timing_synch_reset,
clk25 => VGA_timing_synch_clk25,
Hsync => VGA_timing_synch_Hsync,
Vsync => VGA_timing_synch_Vsync,
activeArea1 => VGA_timing_synch_activeArea1,
activehaaddrgen => VGA_timing_synch_activehaaddrgen,
activeRender1 => VGA_timing_synch_activeRender1,
blank => VGA_timing_synch_blank
);

vga_r <= vga_imagegenerator_RGB_out (7 downto 0);
vga_g <= vga_imagegenerator_RGB_out (15 downto 8);
vga_b <= vga_imagegenerator_RGB_out (23 downto 16);
vga_imagegenerator_clk <= clk25;
vga_imagegenerator_reset <= i_reset;
vig_inst : vga_imagegenerator port map (
reset => vga_imagegenerator_reset,
clk => vga_imagegenerator_clk,
Data_in1 => vga_imagegenerator_Data_in1,
active_area1 => vga_imagegenerator_active_area1,
RGB_out => vga_imagegenerator_RGB_out
);

end Behavioral;

