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

use work.p_fphdl_package3.all;

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
o_do : out std_logic_vector(31 downto 0);

signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;

signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC;

signal subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : out STD_LOGIC;
signal subfpce : out STD_LOGIC;
signal subfpsclr : out STD_LOGIC;
signal subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : in STD_LOGIC;

signal sqrtfp2a : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : out STD_LOGIC;
signal sqrtfp2sclr : out STD_LOGIC;
signal sqrtfp2ce : out STD_LOGIC;
signal sqrtfp2r : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : in STD_LOGIC

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

--component vga_imagegenerator is
--generic (BITS : integer := BITS);
--Port (
--reset : in std_logic;
--vgaclk25 : std_logic;
--Data_in1 : in STD_LOGIC_VECTOR (BITS-1 downto 0);
--active_area1 : in  STD_LOGIC;
--RGB_out : out  STD_LOGIC_VECTOR (BITS-1 downto 0)
--);
--end component vga_imagegenerator;
--signal vga_imagegenerator_reset : std_logic;
--signal vga_imagegenerator_vgaclk25 : std_logic;
--signal vga_imagegenerator_Data_in1 : STD_LOGIC_VECTOR (BITS-1 downto 0);
--signal vga_imagegenerator_active_area1 : STD_LOGIC;
--signal vga_imagegenerator_RGB_out : STD_LOGIC_VECTOR (BITS-1 downto 0);

signal vgaclk25,agclk : std_logic;

COMPONENT float2fixed
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal float2fixeda : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal float2fixedond : STD_LOGIC;
signal float2fixedclk : STD_LOGIC;
signal float2fixedsclr : STD_LOGIC;
signal float2fixedce : STD_LOGIC;
signal float2fixedr : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal float2fixedrdy : STD_LOGIC;

COMPONENT dualmem
PORT (
clka : IN STD_LOGIC;
ena : IN STD_LOGIC;
wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
clkb : IN STD_LOGIC;
enb : IN STD_LOGIC;
addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
doutb : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT;
signal dualmem_clka : STD_LOGIC;
signal dualmem_ena : STD_LOGIC;
signal dualmem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal dualmem_addra : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal dualmem_dina : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal dualmem_clkb : STD_LOGIC;
signal dualmem_enb : STD_LOGIC;
signal dualmem_addrb : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal dualmem_doutb : STD_LOGIC_VECTOR(15 DOWNTO 0);

--attribute RlOC : string;

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;

--attribute RLOC of fixed2float : component is "SLICE_X40Y174:SLICE_X79Y191";

COMPONENT divfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpsclr : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : STD_LOGIC;

--attribute RLOC of divfp : component is "SLICE_X40Y112:SLICE_X79Y143";

COMPONENT mulfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : STD_LOGIC;

--attribute RLOC of mulfp : component is "SLICE_X40Y80:SLICE_X79Y111";

COMPONENT addfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : STD_LOGIC;

--attribute RLOC of addfp : component is "SLICE_X40Y144:SLICE_X79Y175";

COMPONENT subfp
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : STD_LOGIC;

--attribute RLOC of subfp : component is "SLICE_X40Y48:SLICE_X79Y79";

--COMPONENT sqrtfp2
--PORT (
--a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--operation_nd : IN STD_LOGIC;
--clk : IN STD_LOGIC;
--sclr : IN STD_LOGIC;
--ce : IN STD_LOGIC;
--result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
--rdy : OUT STD_LOGIC
--);
--END COMPONENT;
signal sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : STD_LOGIC;
signal sqrtfp2clk : STD_LOGIC;
signal sqrtfp2sclr : STD_LOGIC;
signal sqrtfp2ce : STD_LOGIC;
signal sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : STD_LOGIC;

signal fixed2floatclk : std_logic;
signal addfpclk : std_logic;
signal subfpclk : std_logic;
signal mulfpclk : std_logic;
signal divfpclk : std_logic;

begin

vga_syncn <= '1';
vga_blankn <= VGA_timing_synch_blank;
--vga_blankn <= '1';
vga_psave <= '1';

pTo : process (i_clock) is
	variable i : integer range 0 to PIXELS-1;
	variable tout : std_logic_vector (15 downto 0);
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10);
	variable state : states;
  constant c_some_wait : integer := 2**20;
  variable some_wait : integer range 0 to c_some_wait-1;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			float2fixedsclr <= '1';
			i := 0;
			dualmem_ena <= '0';
			dualmem_enb <= '0';
			tout := (others => '0');
      some_wait := 0;
		else
			case (state) is
				when idle => state := s1;
					test_fixed_melexis_run <= '1';
          float2fixedsclr <= '0';
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
--						tout := "0000000000"&float2fixedr (35 downto 14); -- 35 29
						tout := float2fixedr;
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
          --synthesis translate_off
          report_error ("tout", tout, 0.0);
          --synthesis translate_on
				when s9 =>
					dualmem_wea <= "0";
					dualmem_ena <= '0';
					if (i = PIXELS-1) then
						i := 0;
						state := s10;
            dualmem_enb <= '1';
					else
						state := s4;
						i := i + 1;
					end if;
				when s10 =>
--          if (some_wait = c_some_wait-1) then
--            some_wait := 0;
--            state := idle;
            state :=  s2;
--            float2fixedsclr <= '1';
--          else
--            some_wait := some_wait + 1;
--            state := s10;
--          end if;
			end case;
		end if;
	end if;
end process pTo;

pvgaclk : process (i_clock,i_reset) is
	constant CMAX : integer := 1; -- 50/25
--	constant CMAX : integer := 2; -- 100/25
	variable vmax : integer range 0 to CMAX-1;
begin
		if (i_reset = '1') then
			vgaclk25 <= '0';
			vmax := 0;
		elsif (rising_edge (i_clock)) then
			if (vmax = CMAX-1) then
				vgaclk25 <= not vgaclk25;
				vmax := 0;
			else
				vgaclk25 <= vgaclk25;
				vmax := vmax + 1;
			end if;
		end if;
end process pvgaclk;

pagclk : process (vgaclk25,i_reset) is
--	constant CMAX : integer := 40; -- 1.25
	constant CMAX : integer := 10; -- 1.25
--	constant CMAX : integer := 63; -- 1260ns
	variable vmax : integer range 0 to CMAX-1;
begin
		if (i_reset = '1') then
			agclk <= '0';
			vmax := 0;
		elsif (rising_edge (vgaclk25)) then
			if (vmax = CMAX-1) then
				agclk <= not agclk;
				vmax := 0;
			else
				agclk <= agclk;
				vmax := vmax + 1;
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
o_do => test_fixed_melexis_do,

fixed2floata => fixed2floata,
fixed2floatond => fixed2floatond,
fixed2floatce => fixed2floatce,
fixed2floatsclr => fixed2floatsclr,
fixed2floatr => fixed2floatr,
fixed2floatrdy => fixed2floatrdy,

divfpa => divfpa,
divfpb => divfpb,
divfpond => divfpond,
divfpce => divfpce,
divfpsclr => divfpsclr,
divfpr => divfpr,
divfprdy => divfprdy,

mulfpa => mulfpa,
mulfpb => mulfpb,
mulfpond => mulfpond,
mulfpce => mulfpce,
mulfpsclr => mulfpsclr,
mulfpr => mulfpr,
mulfprdy => mulfprdy,

addfpa => addfpa,
addfpb => addfpb,
addfpond => addfpond,
addfpce => addfpce,
addfpsclr => addfpsclr,
addfpr => addfpr,
addfprdy => addfprdy,

subfpa => subfpa,
subfpb => subfpb,
subfpond => subfpond,
subfpce => subfpce,
subfpsclr => subfpsclr,
subfpr => subfpr,
subfprdy => subfprdy,

sqrtfp2a => sqrtfp2a,
sqrtfp2ond => sqrtfp2ond,
sqrtfp2sclr => sqrtfp2sclr,
sqrtfp2ce => sqrtfp2ce,
sqrtfp2r => sqrtfp2r,
sqrtfp2rdy => sqrtfp2rdy
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

--vga_r <= vga_imagegenerator_RGB_out (18 downto 16) & vga_imagegenerator_RGB_out (10 downto 8) & vga_imagegenerator_RGB_out (1 downto 0);
--vga_g <= vga_imagegenerator_RGB_out (18 downto 16) & vga_imagegenerator_RGB_out (10 downto 8) & vga_imagegenerator_RGB_out (1 downto 0);
--vga_b <= vga_imagegenerator_RGB_out (18 downto 16) & vga_imagegenerator_RGB_out (10 downto 8) & vga_imagegenerator_RGB_out (1 downto 0);

vga_r <= dualmem_doutb (12 downto 8) & dualmem_doutb (8 downto 6) when VGA_timing_synch_activeArea1 = '1' else (others => '0');
vga_g <= dualmem_doutb (12 downto 8) & dualmem_doutb (8 downto 6) when VGA_timing_synch_activeArea1 = '1' else (others => '0');
vga_b <= dualmem_doutb (12 downto 8) & dualmem_doutb (8 downto 6) when VGA_timing_synch_activeArea1 = '1' else (others => '0');

----vga_imagegenerator_active_area1 <= VGA_timing_synch_activeArea1;
--vga_imagegenerator_active_area1 <= '1';
----vga_imagegenerator_Data_in1 <= test_fixed_melexis_do (BITS-1 downto 0);
--vga_imagegenerator_Data_in1 <= dualmem_doutb (7 downto 0)&dualmem_doutb (7 downto 0)&dualmem_doutb (7 downto 0);
--vga_imagegenerator_vgaclk25 <= vgaclk25;
--vga_imagegenerator_reset <= i_reset;
--vig_inst : vga_imagegenerator port map (
--reset => vga_imagegenerator_reset,
--vgaclk25 => vga_imagegenerator_vgaclk25,
--Data_in1 => vga_imagegenerator_Data_in1,
--active_area1 => vga_imagegenerator_active_area1,
--RGB_out => vga_imagegenerator_RGB_out
--);

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

fixed2floatclk <= i_clock;
addfpclk <= i_clock;
subfpclk <= i_clock;
mulfpclk <= i_clock;
divfpclk <= i_clock;
sqrtfp2clk <= i_clock;

b0 : block
attribute loc : string;
--attribute loc of inst_fixed2float : label is "SLICE_X40Y176:SLICE_X79Y191";
--attribute loc of inst_fixed2float : label is "SLICE_X40Y176:SLICE_X75Y191";
--attribute loc of inst_fixed2float : label is "SLICE_X40Y176:SLICE_X71Y191";

begin
inst_fixed2float : fixed2float
PORT MAP (
a => fixed2floata,
operation_nd => fixed2floatond,
clk => fixed2floatclk,
sclr => fixed2floatsclr,
ce => fixed2floatce,
result => fixed2floatr,
rdy => fixed2floatrdy
);
end block b0;

inst_divfp : divfp
PORT MAP (
a => divfpa,
b => divfpb,
operation_nd => divfpond,
clk => divfpclk,
sclr => divfpsclr,
ce => divfpce,
result => divfpr,
rdy => divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => mulfpa,
b => mulfpb,
operation_nd => mulfpond,
clk => mulfpclk,
sclr => mulfpsclr,
ce => mulfpce,
result => mulfpr,
rdy => mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => addfpa,
b => addfpb,
operation_nd => addfpond,
clk => addfpclk,
sclr => addfpsclr,
ce => addfpce,
result => addfpr,
rdy => addfprdy
);

inst_subfp : subfp
PORT MAP (
a => subfpa,
b => subfpb,
operation_nd => subfpond,
clk => subfpclk,
sclr => subfpsclr,
ce => subfpce,
result => subfpr,
rdy => subfprdy
);

--inst_sqrtfp2 : sqrtfp2
--PORT MAP (
--a => sqrtfp2a,
--operation_nd => sqrtfp2ond,
--clk => sqrtfp2clk,
--sclr => sqrtfp2sclr,
--ce => sqrtfp2ce,
--result => sqrtfp2r,
--rdy => sqrtfp2rdy
--);

end Behavioral;

