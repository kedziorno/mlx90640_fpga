--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:28 01/29/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractOffsetParameters.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractOffsetParameters
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

--use work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY tb_ExtractAlphaParameters IS
END tb_ExtractAlphaParameters;

ARCHITECTURE behavior OF tb_ExtractAlphaParameters IS 

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
signal fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : STD_LOGIC;
signal fixed2floatce : STD_LOGIC;
signal fixed2floatsclr : STD_LOGIC;
signal fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : STD_LOGIC;

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

-- Component Declaration for the Unit Under Test (UUT)
component ExtractAlphaParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_done : out std_logic;
o_rdy : out std_logic;

signal o_signed4bit_ena : out std_logic;
signal o_signed4bit_adr : out std_logic_vector (3 downto 0);
signal o_signed6bit_ena : out std_logic;
signal o_signed6bit_adr : out std_logic_vector (5 downto 0);
signal o_alphascale_1_ena : out std_logic;
signal o_alphascale_1_adr : out std_logic_vector (3 downto 0);
signal o_2powx_4bit_ena : out std_logic;
signal o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);

signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;

signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC

);
end component ExtractAlphaParameters;
signal ExtractAlphaParameters_clock : std_logic;
signal ExtractAlphaParameters_reset : std_logic;
signal ExtractAlphaParameters_run : std_logic;
signal ExtractAlphaParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractAlphaParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractAlphaParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractAlphaParameters_do : std_logic_vector (31 downto 0);
signal ExtractAlphaParameters_addr : std_logic_vector (9 downto 0) := (others => '0'); -- 10bit-1024
signal ExtractAlphaParameters_done : std_logic;
signal ExtractAlphaParameters_rdy : std_logic;
signal ExtractAlphaParameters_signed4bit_ena : std_logic;
signal ExtractAlphaParameters_signed4bit_adr : std_logic_vector (3 downto 0);
signal ExtractAlphaParameters_signed6bit_ena : std_logic;
signal ExtractAlphaParameters_signed6bit_adr : std_logic_vector (5 downto 0);
signal ExtractAlphaParameters_alphascale_1_ena : std_logic;
signal ExtractAlphaParameters_alphascale_1_adr : std_logic_vector (3 downto 0);
signal ExtractAlphaParameters_2powx_4bit_ena : std_logic;
signal ExtractAlphaParameters_2powx_4bit_adr : std_logic_vector (3 downto 0);
signal ExtractAlphaParameters_rom_constants_float : std_logic_vector (31 downto 0);
signal ExtractAlphaParameters_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal ExtractAlphaParameters_fixed2floatond : STD_LOGIC;
signal ExtractAlphaParameters_fixed2floatsclr : STD_LOGIC;
signal ExtractAlphaParameters_fixed2floatce : STD_LOGIC;
signal ExtractAlphaParameters_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_fixed2floatrdy : STD_LOGIC;
signal ExtractAlphaParameters_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_mulfpond : STD_LOGIC;
signal ExtractAlphaParameters_mulfpsclr : STD_LOGIC;
signal ExtractAlphaParameters_mulfpce : STD_LOGIC;
signal ExtractAlphaParameters_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_mulfprdy : STD_LOGIC;
signal ExtractAlphaParameters_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_addfpond : STD_LOGIC;
signal ExtractAlphaParameters_addfpsclr : STD_LOGIC;
signal ExtractAlphaParameters_addfpce : STD_LOGIC;
signal ExtractAlphaParameters_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_addfprdy : STD_LOGIC;
signal ExtractAlphaParameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_divfpond : STD_LOGIC;
signal ExtractAlphaParameters_divfpsclr : STD_LOGIC;
signal ExtractAlphaParameters_divfpce : STD_LOGIC;
signal ExtractAlphaParameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_divfprdy : STD_LOGIC;

signal ExtractAlphaParameters_fixed2floatclk : std_logic;
signal ExtractAlphaParameters_addfpclk : std_logic;
signal ExtractAlphaParameters_mulfpclk : std_logic;
signal ExtractAlphaParameters_divfpclk : std_logic;

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
END COMPONENT;

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (ExtractAlphaParameters_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => ExtractAlphaParameters_clock,
ena => ExtractAlphaParameters_i2c_mem_ena,
wea => "0",
addra => ExtractAlphaParameters_i2c_mem_addra,
dina => (others => '0'),
douta => ExtractAlphaParameters_i2c_mem_douta
);
-- Instantiate the Unit Under Test (UUT)
uut: ExtractAlphaParameters PORT MAP (
i_clock => ExtractAlphaParameters_clock,
i_reset => ExtractAlphaParameters_reset,
i_run => ExtractAlphaParameters_run,

i2c_mem_ena => ExtractAlphaParameters_i2c_mem_ena,
i2c_mem_addra => ExtractAlphaParameters_i2c_mem_addra,
i2c_mem_douta => ExtractAlphaParameters_i2c_mem_douta,

o_do => ExtractAlphaParameters_do,
i_addr => ExtractAlphaParameters_addr,
o_done => ExtractAlphaParameters_done,
o_rdy => ExtractAlphaParameters_rdy,

o_signed4bit_ena => ExtractAlphaParameters_signed4bit_ena,
o_signed4bit_adr => ExtractAlphaParameters_signed4bit_adr,
o_signed6bit_ena => ExtractAlphaParameters_signed6bit_ena,
o_signed6bit_adr => ExtractAlphaParameters_signed6bit_adr,
o_alphascale_1_ena => ExtractAlphaParameters_alphascale_1_ena,
o_alphascale_1_adr => ExtractAlphaParameters_alphascale_1_adr,
o_2powx_4bit_ena => ExtractAlphaParameters_2powx_4bit_ena,
o_2powx_4bit_adr => ExtractAlphaParameters_2powx_4bit_adr,
i_rom_constants_float => ExtractAlphaParameters_rom_constants_float,

fixed2floata => ExtractAlphaParameters_fixed2floata,
fixed2floatond => ExtractAlphaParameters_fixed2floatond,
fixed2floatsclr => ExtractAlphaParameters_fixed2floatsclr,
fixed2floatce => ExtractAlphaParameters_fixed2floatce,
fixed2floatr => ExtractAlphaParameters_fixed2floatr,
fixed2floatrdy => ExtractAlphaParameters_fixed2floatrdy,

mulfpa => ExtractAlphaParameters_mulfpa,
mulfpb => ExtractAlphaParameters_mulfpb,
mulfpond => ExtractAlphaParameters_mulfpond,
mulfpsclr => ExtractAlphaParameters_mulfpsclr,
mulfpce => ExtractAlphaParameters_mulfpce,
mulfpr => ExtractAlphaParameters_mulfpr,
mulfprdy => ExtractAlphaParameters_mulfprdy,

addfpa => ExtractAlphaParameters_addfpa,
addfpb => ExtractAlphaParameters_addfpb,
addfpond => ExtractAlphaParameters_addfpond,
addfpsclr => ExtractAlphaParameters_addfpsclr,
addfpce => ExtractAlphaParameters_addfpce,
addfpr => ExtractAlphaParameters_addfpr,
addfprdy => ExtractAlphaParameters_addfprdy,

divfpa => ExtractAlphaParameters_divfpa,
divfpb => ExtractAlphaParameters_divfpb,
divfpond => ExtractAlphaParameters_divfpond,
divfpsclr => ExtractAlphaParameters_divfpsclr,
divfpce => ExtractAlphaParameters_divfpce,
divfpr => ExtractAlphaParameters_divfpr,
divfprdy => ExtractAlphaParameters_divfprdy

);

-- Clock process definitions
i_clock_process :process
begin
ExtractAlphaParameters_clock <= '0';
wait for i_clock_period/2;
ExtractAlphaParameters_clock <= '1';
wait for i_clock_period/2;
end process;

ExtractAlphaParameters_reset <= '1', '0' after 100 ns ;	

-- Stimulus process
stim_proc: process
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
-- XXX data from ExtractAlphaParameters
--constant datao : datar := ( -- XXX prev values
--first => (
--(a => x"331C6400", b => 0),
--(a => x"331E6400", b => 1),
--(a => x"3322E400", b => 2),
--(a => x"3324E400", b => 3),
--(a => x"332F6400", b => 4),
--(a => x"33326400", b => 5),
--(a => x"3332E400", b => 6),
--(a => x"33356400", b => 7),
--(a => x"333D6400", b => 8),
--(a => x"333FE400", b => 9)
--),
--middle => (
--(a => x"331EE400", b => 382),
--(a => x"3337E400", b => 384)
--),
--last => (
--(a => x"33326400", b => 758),
--(a => x"332F6400", b => 759),
--(a => x"332AE400", b => 760),
--(a => x"3329E400", b => 761),
--(a => x"331B6400", b => 762),
--(a => x"33196400", b => 763),
--(a => x"33126400", b => 764),
--(a => x"330FE400", b => 765),
--(a => x"32FFC800", b => 766),
--(a => x"32F6C800", b => 767)
--)
--);
constant datao : datar := ( -- XXX differ 2.473826e-10 after optimize reg
first => (
(a => x"331C6400", b => 0),
(a => x"331D5400", b => 1),
(a => x"3321D400", b => 2),
(a => x"3323D400", b => 3),
(a => x"332E5400", b => 4),
(a => x"33315400", b => 5),
(a => x"3331D400", b => 6),
(a => x"33345400", b => 7),
(a => x"333C5400", b => 8),
(a => x"333ED400", b => 9)
),
middle => (
(a => x"331DD400", b => 382),
(a => x"3336D400", b => 384)
),
last => (
(a => x"33315400", b => 758),
(a => x"332E5400", b => 759),
(a => x"3329D400", b => 760),
(a => x"3328D400", b => 761),
(a => x"331A5400", b => 762),
(a => x"33185400", b => 763),
(a => x"33115400", b => 764),
(a => x"330ED400", b => 765),
(a => x"32FDA800", b => 766),
(a => x"32F6C800", b => 767)
)
);
begin
-- hold reset state for 100 ns.
wait for 105 ns;
-- insert stimulus here
ExtractAlphaParameters_run <= '1'; wait for i_clock_period; ExtractAlphaParameters_run <= '0';
wait until ExtractAlphaParameters_rdy = '1';
--report "rdy at 954.235us";
--report "rdy at 930.805us - with acc loop";
--report "rdy at 930.945us";
--report "rdy at 930.795us";
--report "rdy at 930.705us";
--report "end at 1007.415us - move fi2fl, rm valphareference reg";
--report "end at 1007.415us - move fi2fl, rm valphareference reg";
--report "end at 1107.255us - rm valphareference reg, rm vaccrowi, rm vacccolumnj";
--report "end at 1114.935us - rm valphareference reg, rm vaccrowi, rm vacccolumnj, rm fixed reg";
report "end at 1114.835us - rm valphareference reg, rm vaccrowi, rm vacccolumnj, rm fixed reg, rm remnant,row,col reg, to differ by ~2.47e-10";
ExtractAlphaParameters_addr <= std_logic_vector (to_unsigned (datao.first(0).b, 10));
wait until rising_edge (ExtractAlphaParameters_clock);
wait until rising_edge (ExtractAlphaParameters_clock);
warning_neq_fp (ExtractAlphaParameters_do, datao.first(0).a, "first " & integer'image (datao.first(0).b) & " different 2.473826e-10 - compare with prev");
for i in 1 to 9 loop
ExtractAlphaParameters_addr <= std_logic_vector (to_unsigned (datao.first(i).b, 10));
wait until rising_edge (ExtractAlphaParameters_clock);
wait until rising_edge (ExtractAlphaParameters_clock);
warning_neq_fp (ExtractAlphaParameters_do, datao.first(i).a, "first " & integer'image (datao.first(i).b));
end loop;
for i in 0 to 1 loop
ExtractAlphaParameters_addr <= std_logic_vector (to_unsigned (datao.middle(i).b, 10));
wait until rising_edge (ExtractAlphaParameters_clock);
wait until rising_edge (ExtractAlphaParameters_clock);
warning_neq_fp (ExtractAlphaParameters_do, datao.middle(i).a, "middle " & integer'image (datao.middle(i).b));
end loop;
for i in 0 to 8 loop
ExtractAlphaParameters_addr <= std_logic_vector (to_unsigned (datao.last(i).b, 10));
wait until rising_edge (ExtractAlphaParameters_clock);
wait until rising_edge (ExtractAlphaParameters_clock);
warning_neq_fp (ExtractAlphaParameters_do, datao.last(i).a, "last " & integer'image (datao.last(i).b));
end loop;
ExtractAlphaParameters_addr <= std_logic_vector (to_unsigned (datao.last(9).b, 10));
wait until rising_edge (ExtractAlphaParameters_clock);
wait until rising_edge (ExtractAlphaParameters_clock);
warning_neq_fp (ExtractAlphaParameters_do, datao.last(9).a, "last " & integer'image (datao.last(9).b) & " different 2.473826e-10 - compare with prev", true);
--report "end at 974.735us";
--report "end at 954.675us";
--report "end at 931.245us - with acc loop";
--report "end at 931.385us";
--report "end at 931.235us";
--report "end at 931.145us";
--report "end at 1007.855us - move fi2fl, rm valphareference reg";
--report "end at 1107.695us - rm valphareference reg, rm vaccrowi, rm vacccolumnj";
--report "end at 1115.375us - rm valphareference reg, rm vaccrowi, rm vacccolumnj, rm fixed reg";
report "end at 1115.275us - rm valphareference reg, rm vaccrowi, rm vacccolumnj, rm fixed reg, rm remnant,row,col reg, to differ by ~2.47e-10";
wait for 1 ps; -- must be for write
report "done" severity failure;
--wait on o_done;
end process;

ExtractAlphaParameters_fixed2floatclk <= ExtractAlphaParameters_clock;
ExtractAlphaParameters_addfpclk <= ExtractAlphaParameters_clock;
ExtractAlphaParameters_mulfpclk <= ExtractAlphaParameters_clock;
ExtractAlphaParameters_divfpclk <= ExtractAlphaParameters_clock;

inst_fixed2float : fixed2float
PORT MAP (
a => ExtractAlphaParameters_fixed2floata,
operation_nd => ExtractAlphaParameters_fixed2floatond,
clk => ExtractAlphaParameters_fixed2floatclk,
sclr => ExtractAlphaParameters_fixed2floatsclr,
ce => ExtractAlphaParameters_fixed2floatce,
result => ExtractAlphaParameters_fixed2floatr,
rdy => ExtractAlphaParameters_fixed2floatrdy
);

inst_divfp : divfp
PORT MAP (
a => ExtractAlphaParameters_divfpa,
b => ExtractAlphaParameters_divfpb,
operation_nd => ExtractAlphaParameters_divfpond,
clk => ExtractAlphaParameters_divfpclk,
sclr => ExtractAlphaParameters_divfpsclr,
ce => ExtractAlphaParameters_divfpce,
result => ExtractAlphaParameters_divfpr,
rdy => ExtractAlphaParameters_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => ExtractAlphaParameters_mulfpa,
b => ExtractAlphaParameters_mulfpb,
operation_nd => ExtractAlphaParameters_mulfpond,
clk => ExtractAlphaParameters_mulfpclk,
sclr => ExtractAlphaParameters_mulfpsclr,
ce => ExtractAlphaParameters_mulfpce,
result => ExtractAlphaParameters_mulfpr,
rdy => ExtractAlphaParameters_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => ExtractAlphaParameters_addfpa,
b => ExtractAlphaParameters_addfpb,
operation_nd => ExtractAlphaParameters_addfpond,
clk => ExtractAlphaParameters_addfpclk,
sclr => ExtractAlphaParameters_addfpsclr,
ce => ExtractAlphaParameters_addfpce,
result => ExtractAlphaParameters_addfpr,
rdy => ExtractAlphaParameters_addfprdy
);

inst_rom_constants : rom_constants PORT MAP (
i_clock => ExtractAlphaParameters_clock,
i_reset => ExtractAlphaParameters_reset,
i_kvptat_en => '0',
i_kvptat_adr => (others => '0'),
i_alphaptat_en => '0',
i_alphaptat_adr => (others => '0'),
i_signed4bit_en => ExtractAlphaParameters_signed4bit_ena,
i_signed4bit_adr => ExtractAlphaParameters_signed4bit_adr,
i_signed6bit_en => ExtractAlphaParameters_signed6bit_ena,
i_signed6bit_adr => ExtractAlphaParameters_signed6bit_adr,
i_alphascale_1_en => ExtractAlphaParameters_alphascale_1_ena,
i_alphascale_1_adr => ExtractAlphaParameters_alphascale_1_adr,
i_2powx_4bit_en => ExtractAlphaParameters_2powx_4bit_ena,
i_2powx_4bit_adr => ExtractAlphaParameters_2powx_4bit_adr,
i_cpratio_en => '0',
i_cpratio_adr => (others => '0'),
i_alphascale_2_en => '0',
i_alphascale_2_adr => (others => '0'),
i_2powx_p8_4bit_en => '0',
i_2powx_p8_4bit_adr => (others => '0'),
i_signed3bit_en => '0',
i_signed3bit_adr => (others => '0'),
o_float => ExtractAlphaParameters_rom_constants_float
);

END;
