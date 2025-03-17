-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   12:56:11 02/03/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_calculate_ta
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Testbench
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    global_package.vhd
--  - Modules: -
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules:
--      fixed2float, addfp, subfp, mulfp, divfp, tb_i2c_mem, rom_constants
--    - Processes (Architecture: tb):
--      p_clock_generator, p_tb
--
-- Important objects: -
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos: -
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones: -
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

LIBRARY ieee,ieee_proposed;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.global_package.all;

ENTITY tb_calculate_ta IS
END tb_calculate_ta;

ARCHITECTURE tb OF tb_calculate_ta IS 

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

COMPONENT calculate_ta
PORT(
i_clock	:	IN	STD_LOGIC; 
i_reset	:	IN	STD_LOGIC; 
i_run	:	IN	STD_LOGIC; 
fixed2floatrdy	:	IN	STD_LOGIC; 
divfprdy	:	IN	STD_LOGIC; 
mulfprdy	:	IN	STD_LOGIC; 
addfprdy	:	IN	STD_LOGIC; 
subfprdy	:	IN	STD_LOGIC; 
i2c_mem_douta	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
i_Vdd	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
fixed2floatr	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
divfpr	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
mulfpr	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
addfpr	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
subfpr	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
i2c_mem_ena	:	OUT	STD_LOGIC; 
o_rdy	:	OUT	STD_LOGIC; 
fixed2floatond	:	OUT	STD_LOGIC; 
fixed2floatce	:	OUT	STD_LOGIC; 
fixed2floatsclr	:	OUT	STD_LOGIC; 
divfpond	:	OUT	STD_LOGIC; 
divfpce	:	OUT	STD_LOGIC; 
divfpsclr	:	OUT	STD_LOGIC; 
mulfpond	:	OUT	STD_LOGIC; 
mulfpce	:	OUT	STD_LOGIC; 
mulfpsclr	:	OUT	STD_LOGIC; 
addfpond	:	OUT	STD_LOGIC; 
addfpce	:	OUT	STD_LOGIC; 
addfpsclr	:	OUT	STD_LOGIC; 
subfpond	:	OUT	STD_LOGIC; 
subfpce	:	OUT	STD_LOGIC; 
subfpsclr	:	OUT	STD_LOGIC; 
i2c_mem_addra	:	OUT	STD_LOGIC_VECTOR (11 DOWNTO 0); 
o_Ta	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
fixed2floata	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
divfpa	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
divfpb	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
mulfpa	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
mulfpb	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
addfpa	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
addfpb	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
subfpa	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
subfpb	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0);
o_kvptat_ena : out std_logic;
o_kvptat_adr : out std_logic_vector (5 downto 0);
o_alphaptat_ena : out std_logic;
o_alphaptat_adr : out std_logic_vector (3 downto 0);
i_rom_constants_float : in std_logic_vector (31 downto 0)
);
END COMPONENT calculate_ta;
signal calculate_ta_clock : std_logic;
signal calculate_ta_reset : std_logic;
signal calculate_ta_run : std_logic;
signal calculate_ta_i2c_mem_ena : STD_LOGIC;
signal calculate_ta_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculate_ta_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculate_ta_Vdd : std_logic_vector (31 downto 0);
signal calculate_ta_Ta : std_logic_vector (31 downto 0); -- output Ta
signal calculate_ta_rdy : std_logic;
signal calculate_ta_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal calculate_ta_fixed2floatond : STD_LOGIC;
signal calculate_ta_fixed2floatce : STD_LOGIC;
signal calculate_ta_fixed2floatsclr : STD_LOGIC;
signal calculate_ta_fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_fixed2floatrdy : STD_LOGIC;
signal calculate_ta_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_divfpond : STD_LOGIC;
signal calculate_ta_divfpce : STD_LOGIC;
signal calculate_ta_divfpsclr : STD_LOGIC;
signal calculate_ta_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_divfprdy : STD_LOGIC;
signal calculate_ta_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_mulfpond : STD_LOGIC;
signal calculate_ta_mulfpce : STD_LOGIC;
signal calculate_ta_mulfpsclr : STD_LOGIC;
signal calculate_ta_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_mulfprdy : STD_LOGIC;
signal calculate_ta_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_addfpond : STD_LOGIC;
signal calculate_ta_addfpce : STD_LOGIC;
signal calculate_ta_addfpsclr : STD_LOGIC;
signal calculate_ta_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_addfprdy : STD_LOGIC;
signal calculate_ta_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_subfpond : STD_LOGIC;
signal calculate_ta_subfpce : STD_LOGIC;
signal calculate_ta_subfpsclr : STD_LOGIC;
signal calculate_ta_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_ta_subfprdy : STD_LOGIC;
signal calculate_ta_kvptat_ena : STD_LOGIC;
signal calculate_ta_kvptat_adr : std_logic_vector (5 downto 0);
signal calculate_ta_alphaptat_ena : STD_LOGIC;
signal calculate_ta_alphaptat_adr : std_logic_vector (3 downto 0);
signal calculate_ta_rom_constants_float : std_logic_vector (31 downto 0);

signal calculate_ta_fixed2floatclk : std_logic;
signal calculate_ta_addfpclk : std_logic;
signal calculate_ta_subfpclk : std_logic;
signal calculate_ta_mulfpclk : std_logic;
signal calculate_ta_divfpclk : std_logic;

COMPONENT rom_constants
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_kvptat_en : IN  std_logic;
i_kvptat_adr : IN  std_logic_vector(5 downto 0);
i_alphaptat_en : IN  std_logic;
i_alphaptat_adr : IN  std_logic_vector(3 downto 0);
i_signed4bit_en : IN  std_logic;
i_signed4bit_adr : IN  std_logic_vector(3 downto 0);
i_signed6bit_en : IN  std_logic;
i_signed6bit_adr : IN  std_logic_vector(5 downto 0);
i_alphascale_1_en : IN  std_logic;
i_alphascale_1_adr : IN  std_logic_vector(3 downto 0);
i_2powx_4bit_en : IN  std_logic;
i_2powx_4bit_adr : IN  std_logic_vector(3 downto 0);
i_cpratio_en : IN  std_logic;
i_cpratio_adr : IN  std_logic_vector(5 downto 0);
i_alphascale_2_en : IN  std_logic;
i_alphascale_2_adr : IN  std_logic_vector(3 downto 0);
i_2powx_p8_4bit_en : IN  std_logic;
i_2powx_p8_4bit_adr : IN  std_logic_vector(3 downto 0);
i_signed3bit_en : IN  std_logic;
i_signed3bit_adr : IN  std_logic_vector(2 downto 0);
o_float : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT rom_constants;

signal i_clock : std_logic;
signal i_reset : std_logic;
signal i_kvptat_en : std_logic;
signal i_kvptat_adr : std_logic_vector(5 downto 0);
signal i_alphaptat_en : std_logic;
signal i_alphaptat_adr : std_logic_vector(3 downto 0);
signal i_signed4bit_en : std_logic;
signal i_signed4bit_adr : std_logic_vector(3 downto 0);
signal i_signed6bit_en : std_logic;
signal i_signed6bit_adr : std_logic_vector(5 downto 0);
signal i_alphascale_1_en : std_logic;
signal i_alphascale_1_adr : std_logic_vector(3 downto 0);
signal i_2powx_4bit_en : std_logic;
signal i_2powx_4bit_adr : std_logic_vector(3 downto 0);
signal i_cpratio_en : std_logic;
signal i_cpratio_adr : std_logic_vector(5 downto 0);
signal i_alphascale_2_en : std_logic;
signal i_alphascale_2_adr : std_logic_vector(3 downto 0);
signal i_2powx_p8_4bit_en : std_logic;
signal i_2powx_p8_4bit_adr : std_logic_vector(3 downto 0);
signal i_signed3bit_en : std_logic;
signal i_signed3bit_adr : std_logic_vector(2 downto 0);
signal o_float : std_logic_vector(31 downto 0);

constant clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (calculate_ta_Ta);

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => calculate_ta_clock,
ena => calculate_ta_i2c_mem_ena,
wea => "0",
addra => calculate_ta_i2c_mem_addra,
dina => (others => '0'),
douta => calculate_ta_i2c_mem_douta
);

p_clock_generator : process
begin
	calculate_ta_clock <= '0';
	wait for clock_period/2;
	calculate_ta_clock <= '1';
	wait for clock_period/2;
end process p_clock_generator;

-- Component Instantiation
calculate_ta_uut : calculate_ta port map (
i_clock => calculate_ta_clock,
i_reset => calculate_ta_reset,
i_run => calculate_ta_run,

i2c_mem_ena => calculate_ta_i2c_mem_ena,
i2c_mem_addra => calculate_ta_i2c_mem_addra,
i2c_mem_douta => calculate_ta_i2c_mem_douta,

i_Vdd => calculate_ta_Vdd,

o_Ta => calculate_ta_Ta, -- output Ta
o_rdy => calculate_ta_rdy,

fixed2floata => calculate_ta_fixed2floata,
fixed2floatond => calculate_ta_fixed2floatond,
fixed2floatce => calculate_ta_fixed2floatce,
fixed2floatsclr => calculate_ta_fixed2floatsclr,
fixed2floatr => calculate_ta_fixed2floatr,
fixed2floatrdy => calculate_ta_fixed2floatrdy,

divfpa => calculate_ta_divfpa,
divfpb => calculate_ta_divfpb,
divfpond => calculate_ta_divfpond,
divfpce => calculate_ta_divfpce,
divfpsclr => calculate_ta_divfpsclr,
divfpr => calculate_ta_divfpr,
divfprdy => calculate_ta_divfprdy,

mulfpa => calculate_ta_mulfpa,
mulfpb => calculate_ta_mulfpb,
mulfpond => calculate_ta_mulfpond,
mulfpce => calculate_ta_mulfpce,
mulfpsclr => calculate_ta_mulfpsclr,
mulfpr => calculate_ta_mulfpr,
mulfprdy => calculate_ta_mulfprdy,

addfpa => calculate_ta_addfpa,
addfpb => calculate_ta_addfpb,
addfpond => calculate_ta_addfpond,
addfpce => calculate_ta_addfpce,
addfpsclr => calculate_ta_addfpsclr,
addfpr => calculate_ta_addfpr,
addfprdy => calculate_ta_addfprdy,

subfpa => calculate_ta_subfpa,
subfpb => calculate_ta_subfpb,
subfpond => calculate_ta_subfpond,
subfpce => calculate_ta_subfpce,
subfpsclr => calculate_ta_subfpsclr,
subfpr => calculate_ta_subfpr,
subfprdy => calculate_ta_subfprdy,

o_kvptat_ena => calculate_ta_kvptat_ena,
o_kvptat_adr => calculate_ta_kvptat_adr,
o_alphaptat_ena => calculate_ta_alphaptat_ena,
o_alphaptat_adr => calculate_ta_alphaptat_adr,
i_rom_constants_float => calculate_ta_rom_constants_float
);

calculate_ta_rom_constants_float <= o_float;

p_tb : PROCESS
BEGIN
calculate_ta_reset <= '1';
wait for 254.3 ns; -- wait until global set/reset completes
calculate_ta_reset <= '0';
wait for clock_period*10;
-- Add user defined stimulus here
calculate_ta_Vdd <= x"4052B852"; -- 3.292500
calculate_ta_run <= '1'; wait for clock_period; calculate_ta_run <= '0';
wait until calculate_ta_rdy = '1';
warning_neq_fp (calculate_ta_Ta, x"4207f54d", "Ta"); -- 33.98955
--report "rdy at 2.965us";
--report "rdy at 2.845us";
report "rdy at 2.915us - less regs";
report "done" severity failure;
END PROCESS p_tb;
--  End Test Bench 

calculate_ta_fixed2floatclk <= calculate_ta_clock;
calculate_ta_addfpclk <= calculate_ta_clock;
calculate_ta_subfpclk <= calculate_ta_clock;
calculate_ta_mulfpclk <= calculate_ta_clock;
calculate_ta_divfpclk <= calculate_ta_clock;

fixed2float_i0 : fixed2float
PORT MAP (
a => calculate_ta_fixed2floata,
operation_nd => calculate_ta_fixed2floatond,
clk => calculate_ta_fixed2floatclk,
sclr => calculate_ta_fixed2floatsclr,
ce => calculate_ta_fixed2floatce,
result => calculate_ta_fixed2floatr,
rdy => calculate_ta_fixed2floatrdy
);

divfp_i0 : divfp
PORT MAP (
a => calculate_ta_divfpa,
b => calculate_ta_divfpb,
operation_nd => calculate_ta_divfpond,
clk => calculate_ta_divfpclk,
sclr => calculate_ta_divfpsclr,
ce => calculate_ta_divfpce,
result => calculate_ta_divfpr,
rdy => calculate_ta_divfprdy
);

mulfp_i0 : mulfp
PORT MAP (
a => calculate_ta_mulfpa,
b => calculate_ta_mulfpb,
operation_nd => calculate_ta_mulfpond,
clk => calculate_ta_mulfpclk,
sclr => calculate_ta_mulfpsclr,
ce => calculate_ta_mulfpce,
result => calculate_ta_mulfpr,
rdy => calculate_ta_mulfprdy
);

addfp_i0 : addfp
PORT MAP (
a => calculate_ta_addfpa,
b => calculate_ta_addfpb,
operation_nd => calculate_ta_addfpond,
clk => calculate_ta_addfpclk,
sclr => calculate_ta_addfpsclr,
ce => calculate_ta_addfpce,
result => calculate_ta_addfpr,
rdy => calculate_ta_addfprdy
);

subfp_i0 : subfp
PORT MAP (
a => calculate_ta_subfpa,
b => calculate_ta_subfpb,
operation_nd => calculate_ta_subfpond,
clk => calculate_ta_subfpclk,
sclr => calculate_ta_subfpsclr,
ce => calculate_ta_subfpce,
result => calculate_ta_subfpr,
rdy => calculate_ta_subfprdy
);

rom_constants_i0 : rom_constants PORT MAP (
i_clock => calculate_ta_clock,
i_reset => calculate_ta_reset,
i_kvptat_en => calculate_ta_kvptat_ena,
i_kvptat_adr => calculate_ta_kvptat_adr,
i_alphaptat_en => calculate_ta_alphaptat_ena,
i_alphaptat_adr => calculate_ta_alphaptat_adr,
i_signed4bit_en => i_signed4bit_en,
i_signed4bit_adr => i_signed4bit_adr,
i_signed6bit_en => i_signed6bit_en,
i_signed6bit_adr => i_signed6bit_adr,
i_alphascale_1_en => i_alphascale_1_en,
i_alphascale_1_adr => i_alphascale_1_adr,
i_2powx_4bit_en => i_2powx_4bit_en,
i_2powx_4bit_adr => i_2powx_4bit_adr,
i_cpratio_en => i_cpratio_en,
i_cpratio_adr => i_cpratio_adr,
i_alphascale_2_en => i_alphascale_2_en,
i_alphascale_2_adr => i_alphascale_2_adr,
i_2powx_p8_4bit_en => i_2powx_p8_4bit_en,
i_2powx_p8_4bit_adr => i_2powx_p8_4bit_adr,
i_signed3bit_en => i_signed3bit_en,
i_signed3bit_adr => i_signed3bit_adr,
o_float => o_float
);

end architecture tb;

