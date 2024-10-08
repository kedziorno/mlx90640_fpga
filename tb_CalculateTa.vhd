-- TestBench Template 
-- calculateTa

LIBRARY ieee,ieee_proposed;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.numeric_std_additions.all;
use ieee_proposed.standard_additions.all;
--use ieee_proposed.standard_textio_additions.all;
use ieee_proposed.std_logic_1164_additions.all;

--use work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

ENTITY tb_CalculateTa IS
END tb_CalculateTa;

ARCHITECTURE tb OF tb_CalculateTa IS 

COMPONENT fixed2float
PORT (
a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
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

COMPONENT CalculateTa
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
fixed2floata	:	OUT	STD_LOGIC_VECTOR (63 DOWNTO 0); 
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
i_kvptat_val : in std_logic_vector (31 downto 0));
END COMPONENT;
signal CalculateTa_clock : std_logic;
signal CalculateTa_reset : std_logic;
signal CalculateTa_run : std_logic;
signal CalculateTa_i2c_mem_ena : STD_LOGIC;
signal CalculateTa_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculateTa_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculateTa_Vdd : std_logic_vector (31 downto 0);
signal CalculateTa_Ta : std_logic_vector (31 downto 0); -- output Ta
signal CalculateTa_rdy : std_logic;
signal CalculateTa_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculateTa_fixed2floatond : STD_LOGIC;
signal CalculateTa_fixed2floatce : STD_LOGIC;
signal CalculateTa_fixed2floatsclr : STD_LOGIC;
signal CalculateTa_fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_fixed2floatrdy : STD_LOGIC;
signal CalculateTa_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_divfpond : STD_LOGIC;
signal CalculateTa_divfpce : STD_LOGIC;
signal CalculateTa_divfpsclr : STD_LOGIC;
signal CalculateTa_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_divfprdy : STD_LOGIC;
signal CalculateTa_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_mulfpond : STD_LOGIC;
signal CalculateTa_mulfpce : STD_LOGIC;
signal CalculateTa_mulfpsclr : STD_LOGIC;
signal CalculateTa_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_mulfprdy : STD_LOGIC;
signal CalculateTa_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_addfpond : STD_LOGIC;
signal CalculateTa_addfpce : STD_LOGIC;
signal CalculateTa_addfpsclr : STD_LOGIC;
signal CalculateTa_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_addfprdy : STD_LOGIC;
signal CalculateTa_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_subfpond : STD_LOGIC;
signal CalculateTa_subfpce : STD_LOGIC;
signal CalculateTa_subfpsclr : STD_LOGIC;
signal CalculateTa_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_subfprdy : STD_LOGIC;
signal CalculateTa_kvptat_ena : STD_LOGIC;
signal CalculateTa_kvptat_adr : std_logic_vector (5 downto 0);
signal CalculateTa_kvptat_val : std_logic_vector (31 downto 0);

signal CalculateTa_fixed2floatclk : std_logic;
signal CalculateTa_addfpclk : std_logic;
signal CalculateTa_subfpclk : std_logic;
signal CalculateTa_mulfpclk : std_logic;
signal CalculateTa_divfpclk : std_logic;

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

out1r <= ap_slv2fp (calculateTa_Ta);

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => calculateTa_clock,
ena => calculateTa_i2c_mem_ena,
wea => "0",
addra => calculateTa_i2c_mem_addra,
dina => (others => '0'),
douta => calculateTa_i2c_mem_douta
);

cp : process
begin
	calculateTa_clock <= '0';
	wait for clock_period/2;
	calculateTa_clock <= '1';
	wait for clock_period/2;
end process cp;

-- Component Instantiation
uut : calculateTa port map (
i_clock => CalculateTa_clock,
i_reset => CalculateTa_reset,
i_run => CalculateTa_run,

i2c_mem_ena => CalculateTa_i2c_mem_ena,
i2c_mem_addra => CalculateTa_i2c_mem_addra,
i2c_mem_douta => CalculateTa_i2c_mem_douta,

i_Vdd => CalculateTa_Vdd,

o_Ta => CalculateTa_Ta, -- output Ta
o_rdy => CalculateTa_rdy,

fixed2floata => CalculateTa_fixed2floata,
fixed2floatond => CalculateTa_fixed2floatond,
fixed2floatce => CalculateTa_fixed2floatce,
fixed2floatsclr => CalculateTa_fixed2floatsclr,
fixed2floatr => CalculateTa_fixed2floatr,
fixed2floatrdy => CalculateTa_fixed2floatrdy,

divfpa => CalculateTa_divfpa,
divfpb => CalculateTa_divfpb,
divfpond => CalculateTa_divfpond,
divfpce => CalculateTa_divfpce,
divfpsclr => CalculateTa_divfpsclr,
divfpr => CalculateTa_divfpr,
divfprdy => CalculateTa_divfprdy,

mulfpa => CalculateTa_mulfpa,
mulfpb => CalculateTa_mulfpb,
mulfpond => CalculateTa_mulfpond,
mulfpce => CalculateTa_mulfpce,
mulfpsclr => CalculateTa_mulfpsclr,
mulfpr => CalculateTa_mulfpr,
mulfprdy => CalculateTa_mulfprdy,

addfpa => CalculateTa_addfpa,
addfpb => CalculateTa_addfpb,
addfpond => CalculateTa_addfpond,
addfpce => CalculateTa_addfpce,
addfpsclr => CalculateTa_addfpsclr,
addfpr => CalculateTa_addfpr,
addfprdy => CalculateTa_addfprdy,

subfpa => CalculateTa_subfpa,
subfpb => CalculateTa_subfpb,
subfpond => CalculateTa_subfpond,
subfpce => CalculateTa_subfpce,
subfpsclr => CalculateTa_subfpsclr,
subfpr => CalculateTa_subfpr,
subfprdy => CalculateTa_subfprdy,

o_kvptat_ena => CalculateTa_kvptat_ena,
o_kvptat_adr => CalculateTa_kvptat_adr,
i_kvptat_val => CalculateTa_kvptat_val
);

tbprocess : PROCESS
BEGIN
calculateTa_reset <= '1';
wait for 254.3 ns; -- wait until global set/reset completes
calculateTa_reset <= '0';
wait for clock_period*10;
-- Add user defined stimulus here
calculateTa_Vdd <= x"4052B852"; -- 3.292500
calculateTa_run <= '1'; wait for clock_period; calculateTa_run <= '0';
wait until calculateTa_rdy = '1';
warning_neq_fp (calculateTa_Ta, x"4207f54d", "Ta");
--report "rdy at 2.965us";
--report "rdy at 2.845us";
report "rdy at 2.915us - less regs";
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

CalculateTa_fixed2floatclk <= CalculateTa_clock;
CalculateTa_addfpclk <= CalculateTa_clock;
CalculateTa_subfpclk <= CalculateTa_clock;
CalculateTa_mulfpclk <= CalculateTa_clock;
CalculateTa_divfpclk <= CalculateTa_clock;

inst_fixed2float : fixed2float
PORT MAP (
a => CalculateTa_fixed2floata,
operation_nd => CalculateTa_fixed2floatond,
clk => CalculateTa_fixed2floatclk,
sclr => CalculateTa_fixed2floatsclr,
ce => CalculateTa_fixed2floatce,
result => CalculateTa_fixed2floatr,
rdy => CalculateTa_fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => CalculateTa_divfpa,
b => CalculateTa_divfpb,
operation_nd => CalculateTa_divfpond,
clk => CalculateTa_divfpclk,
sclr => CalculateTa_divfpsclr,
ce => CalculateTa_divfpce,
result => CalculateTa_divfpr,
rdy => CalculateTa_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => CalculateTa_mulfpa,
b => CalculateTa_mulfpb,
operation_nd => CalculateTa_mulfpond,
clk => CalculateTa_mulfpclk,
sclr => CalculateTa_mulfpsclr,
ce => CalculateTa_mulfpce,
result => CalculateTa_mulfpr,
rdy => CalculateTa_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => CalculateTa_addfpa,
b => CalculateTa_addfpb,
operation_nd => CalculateTa_addfpond,
clk => CalculateTa_addfpclk,
sclr => CalculateTa_addfpsclr,
ce => CalculateTa_addfpce,
result => CalculateTa_addfpr,
rdy => CalculateTa_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => CalculateTa_subfpa,
b => CalculateTa_subfpb,
operation_nd => CalculateTa_subfpond,
clk => CalculateTa_subfpclk,
sclr => CalculateTa_subfpsclr,
ce => CalculateTa_subfpce,
result => CalculateTa_subfpr,
rdy => CalculateTa_subfprdy
);

inst_rom_constants : rom_constants PORT MAP (
i_clock => CalculateTa_clock,
i_reset => CalculateTa_reset,
i_kvptat_en => CalculateTa_kvptat_ena,
i_kvptat_adr => CalculateTa_kvptat_adr,
i_alphaptat_en => i_alphaptat_en,
i_alphaptat_adr => i_alphaptat_adr,
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
o_float => CalculateTa_kvptat_val
);

END tb;
