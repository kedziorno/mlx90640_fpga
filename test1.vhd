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

--use work.p_fphdl_package3.all;

entity test1 is
port (
i_clock,i_reset : in std_logic;
vga_hsync : out std_logic;
vga_vsync : out std_logic;
vga_clock : out std_logic;
vga_r : out std_logic_vector (7 downto 0);
vga_g : out std_logic_vector (7 downto 0);
vga_b : out std_logic_vector (7 downto 0);
vga_syncn : out std_logic;
vga_blankn: out std_logic;
vga_psave: out std_logic
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

--COMPONENT tb_data_calculateTo
--PORT (
--clka : IN STD_LOGIC;
--ena : IN STD_LOGIC;
--addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
--douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
--);
--END COMPONENT;
--signal tb_data_calculateTo_clka : STD_LOGIC;
--signal tb_data_calculateTo_ena : STD_LOGIC;
--signal tb_data_calculateTo_addra : STD_LOGIC_VECTOR(9 DOWNTO 0);
--signal tb_data_calculateTo_douta : STD_LOGIC_VECTOR(31 DOWNTO 0);

component address_generator is
Generic (
PIXELS : integer := PIXELS;
ADDRESS1 : integer := ADDRESS1
);
Port ( 
reset : in std_logic;
clk : in STD_LOGIC;
clk25 : in STD_LOGIC;
enable : in STD_LOGIC;
vsync : in STD_LOGIC;
activeh : in STD_LOGIC;
address : out STD_LOGIC_VECTOR (ADDRESS1-1 downto 0)
);  
end component address_generator;
signal address_generator_reset : std_logic;
signal address_generator_clk : STD_LOGIC;
signal address_generator_clk25 : STD_LOGIC;
signal address_generator_enable : STD_LOGIC;
signal address_generator_vsync : STD_LOGIC;
signal address_generator_activeh : STD_LOGIC;
signal address_generator_address : STD_LOGIC_VECTOR (ADDRESS1-1 downto 0);

component VGA_timing_synch is
Port (
reset : in std_logic;
vgaclk25 : in  STD_LOGIC;
Hsync : out  STD_LOGIC;
Vsync : out  STD_LOGIC;
activeArea1 : out  STD_LOGIC;
activehaaddrgen : out STD_LOGIC;
activeRender1 : out  STD_LOGIC;
blank : out STD_LOGIC
);
end component VGA_timing_synch;
signal VGA_timing_synch_reset : std_logic;
signal VGA_timing_synch_vgaclk25 : STD_LOGIC;
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
vgaclk25 : std_logic;
Data_in1 : in STD_LOGIC_VECTOR (BITS-1 downto 0);
active_area1 : in  STD_LOGIC;
RGB_out : out  STD_LOGIC_VECTOR (BITS-1 downto 0)
);
end component vga_imagegenerator;
signal vga_imagegenerator_reset : std_logic;
signal vga_imagegenerator_vgaclk25 : std_logic;
signal vga_imagegenerator_Data_in1 : STD_LOGIC_VECTOR (BITS-1 downto 0);
signal vga_imagegenerator_active_area1 : STD_LOGIC;
signal vga_imagegenerator_RGB_out : STD_LOGIC_VECTOR (BITS-1 downto 0);

signal vgaclk25,agclk : std_logic;

COMPONENT float2fixed
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal float2fixeda : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal float2fixedond : STD_LOGIC;
signal float2fixedclk : STD_LOGIC;
signal float2fixedsclr : STD_LOGIC;
signal float2fixedce : STD_LOGIC;
signal float2fixedr : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal float2fixedrdy : STD_LOGIC;

COMPONENT dualmem
PORT (
clka : IN STD_LOGIC;
ena : IN STD_LOGIC;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
clkb : IN STD_LOGIC;
enb : IN STD_LOGIC;
addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END COMPONENT;
signal dualmem_clka : STD_LOGIC;
signal dualmem_ena : STD_LOGIC;
signal dualmem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal dualmem_addra : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal dualmem_dina : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal dualmem_clkb : STD_LOGIC;
signal dualmem_enb : STD_LOGIC;
signal dualmem_addrb : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal dualmem_doutb : STD_LOGIC_VECTOR(31 DOWNTO 0);

begin

vga_syncn <= '1';
vga_blankn <= VGA_timing_synch_blank;
--vga_blankn <= '1';
vga_psave <= '1';

pTo : process (i_clock) is
	variable i : integer range 0 to PIXELS-1;
	variable tout : std_logic_vector (31 downto 0);
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			float2fixedsclr <= '1';
			i := 0;
			dualmem_ena <= '0';
			dualmem_enb <= '0';
			tout := (others => '0');
		else
			case (state) is
				when idle => state := s1;
					test_fixed_melexis_run <= '1';
				when s1 =>
					test_fixed_melexis_run <= '0';
					if (test_fixed_melexis_rdy = '1') then
						state := s2;
					else
						state := s1;
					end if;
				when s2 => state := s3;
					float2fixedsclr <= '0';
					i := 0;
					tout := (others => '0');
				when s3 => state := s4;
				when s4 => state := s5;
					test_fixed_melexis_addr <= std_logic_vector (to_unsigned (i, 10));
				when s5 => state := s6;
				when s6 => state := s7;
					float2fixedond <= '1';
					float2fixedce <= '1';
					float2fixeda <= test_fixed_melexis_do;
				when s7 =>
					if (float2fixedrdy = '1') then state := s8;
--						tout := "00000000000000000000000"&float2fixedr (36 downto 28) ; -- 35 29
--						tout := "00000000000000000000000"&float2fixedr (34 downto 26) ; -- 35 29
--						report_error ("float2fixedr", float2fixedr, 0.0);
						tout := "0000000000"&float2fixedr (34 downto 13); -- 35 29
--						tout := "0000000000"&float2fixedr (35 downto 14); -- 35 29
						float2fixedond <= '0';
						float2fixedce <= '0';
						float2fixedsclr <= '1';
					else state := s7; end if;
				when s8 => state := s9;
					float2fixedsclr <= '0';
					dualmem_wea <= "1";
					dualmem_addra <= std_logic_vector (to_unsigned (i, 10));
					dualmem_dina <= tout;
					dualmem_ena <= '1';
				when s9 =>
					dualmem_wea <= "0";
					dualmem_ena <= '0';
					if (i = PIXELS-1) then
						i := 0;
						state := s10;
					else
						state := s4;
						i := i + 1;
					end if;
				when s10 =>
					dualmem_enb <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process pTo;

pvgaclk : process (i_clock) is
	constant CMAX : integer := 2; -- 25
	variable vmax : integer range 0 to CMAX-1;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			vgaclk25 <= '0';
			vmax := 0;
		else
			if (vmax = CMAX-1) then
				vgaclk25 <= not vgaclk25;
				vmax := 0;
			else
				vgaclk25 <= vgaclk25;
				vmax := vmax + 1;
			end if;
		end if;
	end if;
end process pvgaclk;

pagclk : process (i_clock) is
	constant CMAX : integer := 40; -- 1.25
--	constant CMAX : integer := 63; -- 1260ns
	variable vmax : integer range 0 to CMAX-1;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			agclk <= '0';
			vmax := 0;
		else
			if (vmax = CMAX-1) then
				agclk <= not agclk;
				vmax := 0;
			else
				agclk <= agclk;
				vmax := vmax + 1;
			end if;
		end if;
	end if;
end process pagclk;

--p0 : process (i_clock) is
--	type states is (idle,
--	s1,
--	ending);
--	variable state : states;
--begin
--	if (rising_edge (i_clock)) then
--		if (i_reset = '1') then
--			state := idle;
--			test_fixed_melexis_run <= '0';
--		else
--			case (state) is
--				when idle => state := s1;
--					test_fixed_melexis_run <= '1';
--				when s1 =>
--					test_fixed_melexis_run <= '0';
--					if (test_fixed_melexis_rdy = '1') then
--						state := ending;
--					else
--						state := s1;
--					end if;
--				when ending => state := ending;
--				when others => null;
--			end case;
--		end if;
--	end if;
--end process p0;

test_fixed_melexis_clock <= i_clock;
test_fixed_melexis_reset <= i_reset;
--test_fixed_melexis_addr <= address_generator_address;
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

address_generator_clk <= agclk;
address_generator_clk25 <= vgaclk25;
address_generator_reset <= i_reset;
address_generator_vsync <= VGA_timing_synch_Vsync;
address_generator_activeh <= VGA_timing_synch_activehaaddrgen;
address_generator_enable <= VGA_timing_synch_activeRender1;
--address_generator_enable <= VGA_timing_synch_Hsync;
ag_inst : address_generator port map (
reset => address_generator_reset,
clk => address_generator_clk,
clk25 => address_generator_clk25,
enable => address_generator_enable,
vsync => address_generator_vsync,
activeh => address_generator_activeh,
address => address_generator_address
);

VGA_timing_synch_vgaclk25 <= vgaclk25;
vga_clock <= VGA_timing_synch_vgaclk25;
vga_hsync <= VGA_timing_synch_Hsync;
vga_vsync <= VGA_timing_synch_Vsync;
VGA_timing_synch_reset <= i_reset;
vts_inst : VGA_timing_synch port map (
reset => VGA_timing_synch_reset,
vgaclk25 => VGA_timing_synch_vgaclk25,
Hsync => VGA_timing_synch_Hsync,
Vsync => VGA_timing_synch_Vsync,
activeArea1 => VGA_timing_synch_activeArea1,
activehaaddrgen => VGA_timing_synch_activehaaddrgen,
activeRender1 => VGA_timing_synch_activeRender1,
blank => VGA_timing_synch_blank
);

--vga_r <= vga_imagegenerator_RGB_out (7 downto 0);
--vga_g <= vga_imagegenerator_RGB_out (15 downto 8);
--vga_b <= vga_imagegenerator_RGB_out (23 downto 16);

--vga_r <= vga_imagegenerator_RGB_out (23 downto 16);
--vga_g <= vga_imagegenerator_RGB_out (23 downto 16);
--vga_b <= vga_imagegenerator_RGB_out (23 downto 16);

--vga_r <= vga_imagegenerator_RGB_out (23 downto 21) & vga_imagegenerator_RGB_out (15 downto 13) & vga_imagegenerator_RGB_out (7 downto 6);
--vga_g <= vga_imagegenerator_RGB_out (23 downto 21) & vga_imagegenerator_RGB_out (15 downto 13) & vga_imagegenerator_RGB_out (7 downto 6);
--vga_b <= vga_imagegenerator_RGB_out (23 downto 21) & vga_imagegenerator_RGB_out (15 downto 13) & vga_imagegenerator_RGB_out (7 downto 6);

vga_r <= vga_imagegenerator_RGB_out (18 downto 16) & vga_imagegenerator_RGB_out (10 downto 8) & vga_imagegenerator_RGB_out (1 downto 0);
vga_g <= vga_imagegenerator_RGB_out (18 downto 16) & vga_imagegenerator_RGB_out (10 downto 8) & vga_imagegenerator_RGB_out (1 downto 0);
vga_b <= vga_imagegenerator_RGB_out (18 downto 16) & vga_imagegenerator_RGB_out (10 downto 8) & vga_imagegenerator_RGB_out (1 downto 0);

vga_imagegenerator_active_area1 <= VGA_timing_synch_activeArea1;
--vga_imagegenerator_Data_in1 <= test_fixed_melexis_do (BITS-1 downto 0);
vga_imagegenerator_Data_in1 <= dualmem_doutb (BITS-1 downto 0);
vga_imagegenerator_vgaclk25 <= vgaclk25;
vga_imagegenerator_reset <= i_reset;
vig_inst : vga_imagegenerator port map (
reset => vga_imagegenerator_reset,
vgaclk25 => vga_imagegenerator_vgaclk25,
Data_in1 => vga_imagegenerator_Data_in1,
active_area1 => vga_imagegenerator_active_area1,
RGB_out => vga_imagegenerator_RGB_out
);

--tb_data_calculateTo_clka <= i_clock;
--tb_data_calculateTo_ena <= '1';
----tb_data_calculateTo_addra <= address_generator_address;
--tb_data_calculateTo_inst : tb_data_calculateTo PORT MAP (
--clka => tb_data_calculateTo_clka,
--ena => tb_data_calculateTo_ena,
--addra => tb_data_calculateTo_addra,
--douta => tb_data_calculateTo_douta
--);

float2fixedclk <= i_clock;
inst_float2fixed : float2fixed PORT MAP (
a => float2fixeda,
operation_nd => float2fixedond,
clk => float2fixedclk,
sclr => float2fixedsclr,
ce => float2fixedce,
result => float2fixedr,
rdy => float2fixedrdy
);

dualmem_clka <= i_clock;
dualmem_clkb <= agclk;
dualmem_addrb <= address_generator_address;
dualmem_inst : dualmem PORT MAP (
clka => dualmem_clka,
ena => dualmem_ena,
wea => dualmem_wea,
addra => dualmem_addra,
dina => dualmem_dina,
clkb => dualmem_clkb,
enb => dualmem_enb,
addrb => dualmem_addrb,
doutb => dualmem_doutb
);

end Behavioral;

