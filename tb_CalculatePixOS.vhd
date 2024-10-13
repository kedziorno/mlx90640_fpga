-- TestBench Template 
-- CalculatePixOS

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

--use work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

ENTITY tb_CalculatePixOS IS
END tb_CalculatePixOS;

ARCHITECTURE behavior OF tb_CalculatePixOS IS 

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

signal fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;
signal divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpsclr : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : STD_LOGIC;
signal mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : STD_LOGIC;
signal mulfpce : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : STD_LOGIC;
signal addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : STD_LOGIC;
signal addfpce : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : STD_LOGIC;
signal subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : STD_LOGIC;

signal fixed2floatclk : std_logic;
signal addfpclk : std_logic;
signal subfpclk : std_logic;
signal mulfpclk : std_logic;
signal divfpclk : std_logic;

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

component CalculatePixOS is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_Ta : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_KGain : in std_logic_vector (31 downto 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

o_mem_signed256_ivalue : out std_logic_vector (7 downto 0); -- input hex from 0 to 255
i_mem_signed256_ovalue : in std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float

o_signed4bit_ena : out std_logic;
o_signed4bit_adr : out std_logic_vector (3 downto 0);
o_signed6bit_ena : out std_logic;
o_signed6bit_adr : out std_logic_vector (5 downto 0);
o_2powx_4bit_ena : out std_logic;
o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
o_2powx_p8_4bit_ena : out std_logic;
o_2powx_p8_4bit_adr : out std_logic_vector (3 downto 0);
o_signed3bit_ena : out std_logic;
o_signed3bit_adr : out std_logic_vector (2 downto 0);
i_rom_constants_float : in std_logic_vector (31 downto 0);

fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;

mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;

addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : out STD_LOGIC;
addfpsclr : out STD_LOGIC;
addfpce : out STD_LOGIC;
addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : in STD_LOGIC;

subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : out STD_LOGIC;
subfpsclr : out STD_LOGIC;
subfpce : out STD_LOGIC;
subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : in STD_LOGIC;

divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : out STD_LOGIC;
divfpsclr : out STD_LOGIC;
divfpce : out STD_LOGIC;
divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : in STD_LOGIC
);
end component CalculatePixOS;

signal CalculatePixOS_clock : std_logic;
signal CalculatePixOS_reset : std_logic;
signal CalculatePixOS_run : std_logic;
signal CalculatePixOS_i2c_mem_ena : STD_LOGIC;
signal CalculatePixOS_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixOS_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixOS_const1 : std_logic_vector (31 downto 0);
signal CalculatePixOS_Ta : std_logic_vector (31 downto 0);
signal CalculatePixOS_Ta0 : std_logic_vector (31 downto 0);
signal CalculatePixOS_Vdd : std_logic_vector (31 downto 0);
signal CalculatePixOS_VddV0 : std_logic_vector (31 downto 0);
signal CalculatePixOS_KGain : std_logic_vector (31 downto 0);
signal CalculatePixOS_do : std_logic_vector (31 downto 0);
signal CalculatePixOS_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal CalculatePixOS_rdy : std_logic;
signal CalculatePixOS_signed4bit_ena : std_logic := '0';
signal CalculatePixOS_signed4bit_adr : std_logic_vector (3 downto 0) := (others => '0');
signal CalculatePixOS_signed6bit_ena : std_logic := '0';
signal CalculatePixOS_signed6bit_adr : std_logic_vector (5 downto 0) := (others => '0');
signal CalculatePixOS_2powx_4bit_ena : std_logic := '0';
signal CalculatePixOS_2powx_4bit_adr : std_logic_vector (3 downto 0) := (others => '0');
signal CalculatePixOS_2powx_p8_4bit_ena : std_logic := '0';
signal CalculatePixOS_2powx_p8_4bit_adr : std_logic_vector (3 downto 0) := (others => '0');
signal CalculatePixOS_signed3bit_ena : std_logic := '0';
signal CalculatePixOS_signed3bit_adr : std_logic_vector (2 downto 0) := (others => '0');
signal CalculatePixOS_rom_constants_float : std_logic_vector (31 downto 0) := (others => '0');
signal CalculatePixOS_mem_signed256_ivalue : std_logic_vector (7 downto 0); -- input hex from 0 to 255
signal CalculatePixOS_mem_signed256_ovalue : std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float
signal CalculatePixOS_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculatePixOS_fixed2floatond : STD_LOGIC;
signal CalculatePixOS_fixed2floatce : STD_LOGIC;
signal CalculatePixOS_fixed2floatsclr : STD_LOGIC;
signal CalculatePixOS_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_fixed2floatrdy : STD_LOGIC;
signal CalculatePixOS_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_mulfpond : STD_LOGIC;
signal CalculatePixOS_mulfpsclr : STD_LOGIC;
signal CalculatePixOS_mulfpce : STD_LOGIC;
signal CalculatePixOS_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_mulfprdy : STD_LOGIC;
signal CalculatePixOS_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_divfpond : STD_LOGIC;
signal CalculatePixOS_divfpsclr : STD_LOGIC;
signal CalculatePixOS_divfpce : STD_LOGIC;
signal CalculatePixOS_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_divfprdy : STD_LOGIC;
signal CalculatePixOS_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_addfpond : STD_LOGIC;
signal CalculatePixOS_addfpsclr : STD_LOGIC;
signal CalculatePixOS_addfpce : STD_LOGIC;
signal CalculatePixOS_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_addfprdy : STD_LOGIC;
signal CalculatePixOS_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_subfpond : STD_LOGIC;
signal CalculatePixOS_subfpsclr : STD_LOGIC;
signal CalculatePixOS_subfpce : STD_LOGIC;
signal CalculatePixOS_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_subfprdy : STD_LOGIC;

signal CalculatePixOS_fixed2floatclk : std_logic;
signal CalculatePixOS_addfpclk : std_logic;
signal CalculatePixOS_subfpclk : std_logic;
signal CalculatePixOS_mulfpclk : std_logic;
signal CalculatePixOS_divfpclk : std_logic;

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

component mem_signed256 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_value : in std_logic_vector (7 downto 0); -- input hex from 0 to 255
o_value : out std_logic_vector (31 downto 0) -- output signed -128 to 127 in SP float
);
end component mem_signed256;
signal mem_signed256_clock : std_logic;
signal mem_signed256_reset : std_logic;
signal mem_signed256_ivalue : std_logic_vector (7 downto 0); -- input hex from 0 to 255
signal mem_signed256_ovalue : std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float

constant i_clock_period : time := 10 ns;
signal i_clock : std_logic;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (CalculatePixOS_do); -- output data

CalculatePixOS_KGain <= x"3F81AC57";
i_signed4bit_en <= CalculatePixOS_signed4bit_ena;
i_signed4bit_adr <= CalculatePixOS_signed4bit_adr;
i_signed6bit_en <= CalculatePixOS_signed6bit_ena;
i_signed6bit_adr <= CalculatePixOS_signed6bit_adr;
i_2powx_4bit_en <= CalculatePixOS_2powx_4bit_ena;
i_2powx_4bit_adr <= CalculatePixOS_2powx_4bit_adr;
i_2powx_p8_4bit_en <= CalculatePixOS_2powx_p8_4bit_ena;
i_2powx_p8_4bit_adr <= CalculatePixOS_2powx_p8_4bit_adr;
i_signed3bit_en <= CalculatePixOS_signed3bit_ena;
i_signed3bit_adr <= CalculatePixOS_signed3bit_adr;
uut : CalculatePixOS port map (
i_clock => CalculatePixOS_clock,
i_reset => CalculatePixOS_reset,
i_run => CalculatePixOS_run,
i2c_mem_ena => CalculatePixOS_i2c_mem_ena,
i2c_mem_addra => CalculatePixOS_i2c_mem_addra,
i2c_mem_douta => CalculatePixOS_i2c_mem_douta,
i_Ta => CalculatePixOS_Ta,
i_Vdd => CalculatePixOS_Vdd,
i_KGain => CalculatePixOS_KGain,
o_do => CalculatePixOS_do,
i_addr => CalculatePixOS_addr,
o_rdy => CalculatePixOS_rdy,
o_signed4bit_ena => CalculatePixOS_signed4bit_ena,
o_signed4bit_adr => CalculatePixOS_signed4bit_adr,
o_signed6bit_ena => CalculatePixOS_signed6bit_ena,
o_signed6bit_adr => CalculatePixOS_signed6bit_adr,
o_2powx_4bit_ena => CalculatePixOS_2powx_4bit_ena,
o_2powx_4bit_adr => CalculatePixOS_2powx_4bit_adr,
o_2powx_p8_4bit_ena => CalculatePixOS_2powx_p8_4bit_ena,
o_2powx_p8_4bit_adr => CalculatePixOS_2powx_p8_4bit_adr,
o_signed3bit_ena => CalculatePixOS_signed3bit_ena,
o_signed3bit_adr => CalculatePixOS_signed3bit_adr,
i_rom_constants_float => CalculatePixOS_rom_constants_float,
o_mem_signed256_ivalue => CalculatePixOS_mem_signed256_ivalue,
i_mem_signed256_ovalue => CalculatePixOS_mem_signed256_ovalue,
fixed2floata => CalculatePixOS_fixed2floata,
fixed2floatond => CalculatePixOS_fixed2floatond,
fixed2floatce => CalculatePixOS_fixed2floatce,
fixed2floatsclr => CalculatePixOS_fixed2floatsclr,
fixed2floatr => CalculatePixOS_fixed2floatr,
fixed2floatrdy => CalculatePixOS_fixed2floatrdy,
mulfpa => CalculatePixOS_mulfpa,
mulfpb => CalculatePixOS_mulfpb,
mulfpond => CalculatePixOS_mulfpond,
mulfpsclr => CalculatePixOS_mulfpsclr,
mulfpce => CalculatePixOS_mulfpce,
mulfpr => CalculatePixOS_mulfpr,
mulfprdy => CalculatePixOS_mulfprdy,
addfpa => CalculatePixOS_addfpa,
addfpb => CalculatePixOS_addfpb,
addfpond => CalculatePixOS_addfpond,
addfpsclr => CalculatePixOS_addfpsclr,
addfpce => CalculatePixOS_addfpce,
addfpr => CalculatePixOS_addfpr,
addfprdy => CalculatePixOS_addfprdy,
subfpa => CalculatePixOS_subfpa,
subfpb => CalculatePixOS_subfpb,
subfpond => CalculatePixOS_subfpond,
subfpsclr => CalculatePixOS_subfpsclr,
subfpce => CalculatePixOS_subfpce,
subfpr => CalculatePixOS_subfpr,
subfprdy => CalculatePixOS_subfprdy,
divfpa => CalculatePixOS_divfpa,
divfpb => CalculatePixOS_divfpb,
divfpond => CalculatePixOS_divfpond,
divfpsclr => CalculatePixOS_divfpsclr,
divfpce => CalculatePixOS_divfpce,
divfpr => CalculatePixOS_divfpr,
divfprdy => CalculatePixOS_divfprdy
);

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => i_clock,
ena => CalculatePixOS_i2c_mem_ena,
wea => "0",
addra => CalculatePixOS_i2c_mem_addra,
dina => (others => '0'),
douta => CalculatePixOS_i2c_mem_douta
);

CalculatePixOS_clock <= i_clock;

i_clock_process :process
begin
i_clock <= '0';
wait for i_clock_period/2;
i_clock <= '1';
wait for i_clock_period/2;
end process;

tb : PROCESS IS
type itemr is record
a : std_logic_vector (31 downto 0);
b : integer;
end record; 
type ten_items is array (0 to 9) of itemr;
type mid_items is array (0 to 1) of itemr;
type datar is record
first : ten_items;
middle : mid_items;
last : ten_items;
end record;
-- XXX data from CalculatePixOS
constant datao : datar := (
first => (
(a => x"436E2F29", b => 0),
(a => x"C1C67C98", b => 1),
(a => x"C1C24FD4", b => 2),
(a => x"C1BF07CA", b => 3),
(a => x"C1CC2AD6", b => 4),
(a => x"C1C87294", b => 5),
(a => x"C1C4A626", b => 6),
(a => x"C1CF3D56", b => 7),
(a => x"C1DCAB6A", b => 8),
(a => x"C1E06EE2", b => 9)
),
middle => (
(a => x"C1AE48B0", b => 382),
(a => x"C1D1355A", b => 384)
),
last => (
(a => x"C1C8AA24", b => 758),
(a => x"C1C1C800", b => 759),
(a => x"C12A65C0", b => 760),
(a => x"C17F93A8", b => 761),
(a => x"C0BAB5F0", b => 762),
(a => x"C09902B0", b => 763),
(a => x"C06E3E20", b => 764),
(a => x"C09902B0", b => 765),
(a => x"C11E3128", b => 766),
(a => x"C0B4CDC0", b => 767)
)
);
BEGIN
CalculatePixOS_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
CalculatePixOS_reset <= '0';
wait for i_clock_period*10;
CalculatePixOS_const1 <= x"3F800000"; -- 1
CalculatePixOS_Ta <= x"4207F54D"; -- 3.398955e+01
--CalculatePixOS_Ta0 <= x"41C80000"; -- 25
CalculatePixOS_Vdd <= x"4052B852"; -- 3.292500e+00
--CalculatePixOS_VddV0 <= x"40533333"; -- 3.3
CalculatePixOS_run <= '1'; wait for i_clock_period; CalculatePixOS_run <= '0';
wait until CalculatePixOS_rdy = '1';
--report "rdy at 2597.975us";
--report "rdy at 2352.505us";
--report "rdy at 2506.635us - rewrite submodules";
--report "rdy at 2629.515us - rewrite submodules, rm fptmp1";
--report "rdy at 2882.625us - rewrite submodules, rm fptmp1, rm vddDiff reg";
report "rdy at 3113.025us - rewrite submodules, rm fptmp1, rm vddDiff reg, rm taDiff reg";
for i in 0 to 9 loop
CalculatePixOS_addr <= std_logic_vector (to_unsigned (datao.first(i).b, 10));
wait until rising_edge (CalculatePixOS_clock);
wait until rising_edge (CalculatePixOS_clock);
warning_neq_fp (CalculatePixOS_do, datao.first(i).a, "first " & integer'image (datao.first(i).b));
--wait until rising_edge (CalculatePixOS_clock);
end loop;
for i in 0 to 1 loop
CalculatePixOS_addr <= std_logic_vector (to_unsigned (datao.middle(i).b, 10));
wait until rising_edge (CalculatePixOS_clock);
wait until rising_edge (CalculatePixOS_clock);
warning_neq_fp (CalculatePixOS_do, datao.middle(i).a, "middle " & integer'image (datao.middle(i).b));
--wait until rising_edge (CalculatePixOS_clock);
end loop;
for i in 0 to 8 loop -- XXX last_9 is OK here (tb_CalculateAlphaComp)
CalculatePixOS_addr <= std_logic_vector (to_unsigned (datao.last(i).b, 10));
wait until rising_edge (CalculatePixOS_clock);
wait until rising_edge (CalculatePixOS_clock);
warning_neq_fp (CalculatePixOS_do, datao.last(i).a, "last " & integer'image (datao.last(i).b));
--wait until rising_edge (CalculatePixOS_clock);
end loop;
CalculatePixOS_addr <= std_logic_vector (to_unsigned (datao.last(9).b, 10));
wait until rising_edge (CalculatePixOS_clock);
wait until rising_edge (CalculatePixOS_clock);
wait until rising_edge (CalculatePixOS_clock);
warning_neq_fp (CalculatePixOS_do, datao.last(9).a, "last " & integer'image (datao.last(9).b));
wait until rising_edge (CalculatePixOS_clock);
wait until rising_edge (CalculatePixOS_clock);
wait until rising_edge (CalculatePixOS_clock);
--report "end at 2618.475us";
--report "end at 2352.945us";
--report "end at 2507.115us - rewrite submodules";
--report "end at 2629.995us - rewrite submodules, rm fptmp1";
--report "end at 2883.105us - rewrite submodules, rm fptmp1, rm vddDiff reg";
report "end at 3113.505us - rewrite submodules, rm fptmp1, rm vddDiff reg, rm taDiff reg";
wait for 1 ps; -- must be for write
report "done" severity failure;
END PROCESS tb;

CalculatePixOS_fixed2floatclk <= i_clock;
CalculatePixOS_addfpclk <= i_clock;
CalculatePixOS_subfpclk <= i_clock;
CalculatePixOS_mulfpclk <= i_clock;
CalculatePixOS_divfpclk <= i_clock;

inst_fixed2float : fixed2float
PORT MAP (
a => CalculatePixOS_fixed2floata,
operation_nd => CalculatePixOS_fixed2floatond,
clk => CalculatePixOS_fixed2floatclk,
sclr => CalculatePixOS_fixed2floatsclr,
ce => CalculatePixOS_fixed2floatce,
result => CalculatePixOS_fixed2floatr,
rdy => CalculatePixOS_fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => CalculatePixOS_divfpa,
b => CalculatePixOS_divfpb,
operation_nd => CalculatePixOS_divfpond,
clk => CalculatePixOS_divfpclk,
sclr => CalculatePixOS_divfpsclr,
ce => CalculatePixOS_divfpce,
result => CalculatePixOS_divfpr,
rdy => CalculatePixOS_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => CalculatePixOS_mulfpa,
b => CalculatePixOS_mulfpb,
operation_nd => CalculatePixOS_mulfpond,
clk => CalculatePixOS_mulfpclk,
sclr => CalculatePixOS_mulfpsclr,
ce => CalculatePixOS_mulfpce,
result => CalculatePixOS_mulfpr,
rdy => CalculatePixOS_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => CalculatePixOS_addfpa,
b => CalculatePixOS_addfpb,
operation_nd => CalculatePixOS_addfpond,
clk => CalculatePixOS_addfpclk,
sclr => CalculatePixOS_addfpsclr,
ce => CalculatePixOS_addfpce,
result => CalculatePixOS_addfpr,
rdy => CalculatePixOS_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => CalculatePixOS_subfpa,
b => CalculatePixOS_subfpb,
operation_nd => CalculatePixOS_subfpond,
clk => CalculatePixOS_subfpclk,
sclr => CalculatePixOS_subfpsclr,
ce => CalculatePixOS_subfpce,
result => CalculatePixOS_subfpr,
rdy => CalculatePixOS_subfprdy
);

inst_rom_constants : rom_constants PORT MAP (
i_clock => CalculatePixOS_clock,
i_reset => CalculatePixOS_reset,
i_kvptat_en => '0',
i_kvptat_adr => (others => '0'),
i_alphaptat_en => '0',
i_alphaptat_adr => (others => '0'),
i_signed4bit_en => CalculatePixOS_signed4bit_ena,
i_signed4bit_adr => CalculatePixOS_signed4bit_adr,
i_signed6bit_en => CalculatePixOS_signed6bit_ena,
i_signed6bit_adr => CalculatePixOS_signed6bit_adr,
i_alphascale_1_en => '0',
i_alphascale_1_adr => (others => '0'),
i_2powx_4bit_en => CalculatePixOS_2powx_4bit_ena,
i_2powx_4bit_adr => CalculatePixOS_2powx_4bit_adr,
i_cpratio_en => '0',
i_cpratio_adr => (others => '0'),
i_alphascale_2_en => '0',
i_alphascale_2_adr => (others => '0'),
i_2powx_p8_4bit_en => CalculatePixOS_2powx_p8_4bit_ena,
i_2powx_p8_4bit_adr => CalculatePixOS_2powx_p8_4bit_adr,
i_signed3bit_en => CalculatePixOS_signed3bit_ena,
i_signed3bit_adr => CalculatePixOS_signed3bit_adr,
o_float => CalculatePixOS_rom_constants_float
);

inst_mem_signed256_ktarcee : mem_signed256 port map (
i_clock => CalculatePixOS_clock,
i_reset => CalculatePixOS_reset,
i_value => CalculatePixOS_mem_signed256_ivalue,
o_value => CalculatePixOS_mem_signed256_ovalue
);

END ARCHITECTURE behavior;
