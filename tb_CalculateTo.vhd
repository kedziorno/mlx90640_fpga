--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:22:17 02/19/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_CalculateTo.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CalculateTo
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

USE work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY tb_CalculateTo IS
END tb_CalculateTo;

ARCHITECTURE behavior OF tb_CalculateTo IS

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

COMPONENT sqrtfp2
PORT (
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
operation_nd : IN STD_LOGIC;
clk : IN STD_LOGIC;
sclr : IN STD_LOGIC;
ce : IN STD_LOGIC;
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
rdy : OUT STD_LOGIC
);
END COMPONENT;
signal sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : STD_LOGIC;
signal sqrtfp2clk : STD_LOGIC;
signal sqrtfp2sclr : STD_LOGIC;
signal sqrtfp2ce : STD_LOGIC;
signal sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : STD_LOGIC;

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
COMPONENT CalculateTo
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;

i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);

i_Ta : IN  std_logic_vector(31 downto 0);

i_vircompensated_do : IN  std_logic_vector(31 downto 0);
o_vircompensated_addr : OUT  std_logic_vector(9 downto 0);

i_alphacomp_do : IN  std_logic_vector(31 downto 0);
o_alphacomp_addr : OUT  std_logic_vector(9 downto 0);

o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);

o_rdy : OUT  std_logic;

signal o_2powx_p8_ena : out std_logic;
signal o_2powx_p8_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

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

signal subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : out STD_LOGIC;
signal subfpsclr : out STD_LOGIC;
signal subfpce : out STD_LOGIC;
signal subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : in STD_LOGIC;

signal sqrtfp2a : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : out STD_LOGIC;
signal sqrtfp2sclr : out STD_LOGIC;
signal sqrtfp2ce : out STD_LOGIC;
signal sqrtfp2r : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : in STD_LOGIC;

signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC

);
END COMPONENT;
signal CalculateTo_clock : std_logic := '0';
signal CalculateTo_reset : std_logic := '0';
signal CalculateTo_run : std_logic := '0';
signal CalculateTo_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateTo_vircompensated_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_alphacomp_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_addr : std_logic_vector(9 downto 0) := (others => '0');
signal CalculateTo_i2c_mem_ena : std_logic;
signal CalculateTo_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateTo_vircompensated_addr : std_logic_vector(9 downto 0);
signal CalculateTo_alphacomp_addr : std_logic_vector(9 downto 0);
signal CalculateTo_do : std_logic_vector(31 downto 0);
signal CalculateTo_rdy : std_logic;

signal CalculateTo_2powx_p8_ena : std_logic;
signal CalculateTo_2powx_p8_adr : std_logic_vector (3 downto 0);
signal CalculateTo_rom_constants_float : std_logic_vector (31 downto 0);

signal CalculateTo_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_divfpond : STD_LOGIC;
signal CalculateTo_divfpsclr : STD_LOGIC;
signal CalculateTo_divfpce : STD_LOGIC;
signal CalculateTo_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_divfprdy : STD_LOGIC;

signal CalculateTo_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_mulfpond : STD_LOGIC;
signal CalculateTo_mulfpsclr : STD_LOGIC;
signal CalculateTo_mulfpce : STD_LOGIC;
signal CalculateTo_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_mulfprdy : STD_LOGIC;

signal CalculateTo_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_addfpond : STD_LOGIC;
signal CalculateTo_addfpsclr : STD_LOGIC;
signal CalculateTo_addfpce : STD_LOGIC;
signal CalculateTo_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_addfprdy : STD_LOGIC;

signal CalculateTo_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_subfpond : STD_LOGIC;
signal CalculateTo_subfpsclr : STD_LOGIC;
signal CalculateTo_subfpce : STD_LOGIC;
signal CalculateTo_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_subfprdy : STD_LOGIC;

signal CalculateTo_sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_sqrtfp2ond : STD_LOGIC;
signal CalculateTo_sqrtfp2sclr : STD_LOGIC;
signal CalculateTo_sqrtfp2ce : STD_LOGIC;
signal CalculateTo_sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_sqrtfp2rdy : STD_LOGIC;

signal CalculateTo_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculateTo_fixed2floatond : STD_LOGIC;
signal CalculateTo_fixed2floatce : STD_LOGIC;
signal CalculateTo_fixed2floatsclr : STD_LOGIC;
signal CalculateTo_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_fixed2floatrdy : STD_LOGIC;

signal CalculateTo_sqrtfp2clk : std_logic;
signal CalculateTo_mulfpclk : std_logic;
signal CalculateTo_divfpclk : std_logic;
signal CalculateTo_addfpclk : std_logic;
signal CalculateTo_subfpclk : std_logic;
signal CalculateTo_fixed2floatclk : std_logic;

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

out1r <= ap_slv2fp (CalculateTo_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculateTo_clock,
ena => CalculateTo_i2c_mem_ena,
wea => "0",
addra => CalculateTo_i2c_mem_addra,
dina => (others => '0'),
douta => CalculateTo_i2c_mem_douta
);

-- Instantiate the Unit Under Test (UUT)
uut: CalculateTo PORT MAP (
i_clock => CalculateTo_clock,
i_reset => CalculateTo_reset,
i_run => CalculateTo_run,
i2c_mem_ena => CalculateTo_i2c_mem_ena,
i2c_mem_addra => CalculateTo_i2c_mem_addra,
i2c_mem_douta => CalculateTo_i2c_mem_douta,
i_Ta => CalculateTo_Ta,
i_vircompensated_do => CalculateTo_vircompensated_do,
o_vircompensated_addr => CalculateTo_vircompensated_addr,
i_alphacomp_do => CalculateTo_alphacomp_do,
o_alphacomp_addr => CalculateTo_alphacomp_addr,
o_do => CalculateTo_do,
i_addr => CalculateTo_addr,
o_rdy => CalculateTo_rdy,

o_2powx_p8_ena => CalculateTo_2powx_p8_ena,
o_2powx_p8_adr => CalculateTo_2powx_p8_adr,
i_rom_constants_float => CalculateTo_rom_constants_float,

divfpa => CalculateTo_divfpa,
divfpb => CalculateTo_divfpb,
divfpond => CalculateTo_divfpond,
divfpsclr => CalculateTo_divfpsclr,
divfpce => CalculateTo_divfpce,
divfpr => CalculateTo_divfpr,
divfprdy => CalculateTo_divfprdy,

mulfpa => CalculateTo_mulfpa,
mulfpb => CalculateTo_mulfpb,
mulfpond => CalculateTo_mulfpond,
mulfpsclr => CalculateTo_mulfpsclr,
mulfpce => CalculateTo_mulfpce,
mulfpr => CalculateTo_mulfpr,
mulfprdy => CalculateTo_mulfprdy,

addfpa => CalculateTo_addfpa,
addfpb => CalculateTo_addfpb,
addfpond => CalculateTo_addfpond,
addfpsclr => CalculateTo_addfpsclr,
addfpce => CalculateTo_addfpce,
addfpr => CalculateTo_addfpr,
addfprdy => CalculateTo_addfprdy,

subfpa => CalculateTo_subfpa,
subfpb => CalculateTo_subfpb,
subfpond => CalculateTo_subfpond,
subfpsclr => CalculateTo_subfpsclr,
subfpce => CalculateTo_subfpce,
subfpr => CalculateTo_subfpr,
subfprdy => CalculateTo_subfprdy,

sqrtfp2a => CalculateTo_sqrtfp2a,
sqrtfp2ond => CalculateTo_sqrtfp2ond,
sqrtfp2sclr => CalculateTo_sqrtfp2sclr,
sqrtfp2ce => CalculateTo_sqrtfp2ce,
sqrtfp2r => CalculateTo_sqrtfp2r,
sqrtfp2rdy => CalculateTo_sqrtfp2rdy,

fixed2floata => CalculateTo_fixed2floata,
fixed2floatond => CalculateTo_fixed2floatond,
fixed2floatsclr => CalculateTo_fixed2floatsclr,
fixed2floatce => CalculateTo_fixed2floatce,
fixed2floatr => CalculateTo_fixed2floatr,
fixed2floatrdy => CalculateTo_fixed2floatrdy

);

-- Clock process definitions
i_clock_process :process
begin
CalculateTo_clock <= '0';
wait for i_clock_period/2;
CalculateTo_clock <= '1';
wait for i_clock_period/2;
end process;

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
-- XXX data from CalculateVirCompensated
constant datao_vc : datar := (
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
-- XXX data from CalculateAlphaComp
constant datao_ac : datar := (
first => (
(a => x"3318F553", b => 0),
(a => x"331AEA16", b => 1),
(a => x"331F50CE", b => 2),
(a => x"33214591", b => 3),
(a => x"332B8A93", b => 4),
(a => x"332E79B8", b => 5),
(a => x"332EF6E9", b => 6),
(a => x"333168DD", b => 7),
(a => x"33393BEA", b => 8),
(a => x"333BADDE", b => 9)
),
middle => (
(a => x"331B6747", b => 382),
(a => x"3333DAD1", b => 384)
),
last => (
(a => x"332E79B8", b => 758),
(a => x"332B8A93", b => 759),
(a => x"332723DB", b => 760),
(a => x"3326297A", b => 761),
(a => x"3317FAF1", b => 762),
(a => x"3316062E", b => 763),
(a => x"330F2D82", b => 764),
(a => x"330CBB8E", b => 765),
(a => x"32FA2AE7", b => 766),
(a => x"32F15D78", b => 767)
)
);
-- XXX data from CalculateTo
constant datao_to : datar := (
first => (
(a => x"42A19C8C", b => 0),
(a => x"41DEB580", b => 1),
(a => x"41E12450", b => 2),
(a => x"41E286C0", b => 3),
(a => x"41E24DA0", b => 4),
(a => x"41E3EDF0", b => 5),
(a => x"41E4E880", b => 6),
(a => x"41E32BD0", b => 7),
(a => x"41E24270", b => 8),
(a => x"41E214C0", b => 9)
),
middle => (
(a => x"41E50110", b => 382),
(a => x"41E35D80", b => 384)
),
last => (
(a => x"41E3E160", b => 758),
(a => x"41E4AF20", b => 759),
(a => x"41FCAE50", b => 760),
(a => x"41F2B9C0", b => 761),
(a => x"42023080", b => 762),
(a => x"42032CB0", b => 763),
(a => x"42040F60", b => 764),
(a => x"4202DB58", b => 765),
(a => x"41F7FD20", b => 766),
(a => x"4200E9A8", b => 767)
)
);
begin
-- hold reset state for 100 ns.
CalculateTo_reset <= '1';
wait for 100 ns;
CalculateTo_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
CalculateTo_Ta <= x"4207F54D"; -- 3.398955e+01
CalculateTo_run <= '1'; wait for i_clock_period; CalculateTo_run <= '0';
report "before loop";
  for i in 1 to 767 loop -- XXX without first pix - fix it
    for k in 0 to 9 loop
      if CalculateTo_vircompensated_addr = std_logic_vector (to_unsigned (datao_vc.first(k).b, 10)) then
        wait until rising_edge (CalculateTo_clock);
        wait until rising_edge (CalculateTo_clock);
        CalculateTo_vircompensated_do <= datao_vc.first(k).a;
      end if;
      if CalculateTo_alphacomp_addr = std_logic_vector (to_unsigned (datao_ac.first(k).b, 10)) then
        wait until rising_edge (CalculateTo_clock);
        wait until rising_edge (CalculateTo_clock);
        CalculateTo_alphacomp_do <= datao_ac.first(k).a;
      end if;
    end loop;
    for k in 0 to 1 loop
      if CalculateTo_vircompensated_addr = std_logic_vector (to_unsigned (datao_vc.middle(k).b, 10)) then
        wait until rising_edge (CalculateTo_clock);
        wait until rising_edge (CalculateTo_clock);
        CalculateTo_vircompensated_do <= datao_vc.middle(k).a;
      end if;
      if CalculateTo_alphacomp_addr = std_logic_vector (to_unsigned (datao_ac.middle(k).b, 10)) then
        wait until rising_edge (CalculateTo_clock);
        wait until rising_edge (CalculateTo_clock);
        CalculateTo_alphacomp_do <= datao_ac.middle(k).a;
      end if;
    end loop;
    for k in 0 to 9 loop
      if CalculateTo_vircompensated_addr = std_logic_vector (to_unsigned (datao_vc.last(k).b, 10)) then
        wait until rising_edge (CalculateTo_clock);
        wait until rising_edge (CalculateTo_clock);
        CalculateTo_vircompensated_do <= datao_vc.last(k).a;
      end if;
      if CalculateTo_alphacomp_addr = std_logic_vector (to_unsigned (datao_ac.last(k).b, 10)) then
        wait until rising_edge (CalculateTo_clock);
        wait until rising_edge (CalculateTo_clock);
        CalculateTo_alphacomp_do <= datao_ac.last(k).a;
      end if;
    end loop;
    wait for 6.680us; -- XXX wait for AlphaComp and VirCompensated Addr MEM
  end loop;
report "after loop";
wait until CalculateTo_rdy = '1';
--report "rdy at 2513.755us";
report "rdy at 2475.335us";
  for i in 0 to 9 loop
    CalculateTo_addr <= std_logic_vector (to_unsigned (datao_to.first(i).b, 10));
    wait until rising_edge (CalculateTo_clock);
    wait until rising_edge (CalculateTo_clock);
    warning_neq_fp (CalculateTo_do, datao_to.first(i).a, "first " & integer'image (datao_to.first(i).b), true);
  end loop;
  for i in 0 to 1 loop
    CalculateTo_addr <= std_logic_vector (to_unsigned (datao_to.middle(i).b, 10));
    wait until rising_edge (CalculateTo_clock);
    wait until rising_edge (CalculateTo_clock);
    warning_neq_fp (CalculateTo_do, datao_to.middle(i).a, "middle " & integer'image (datao_to.middle(i).b));
  end loop;
  for i in 0 to 9 loop -- XXX last_9 is OK here (tb_CalculateAlphaComp)
    CalculateTo_addr <= std_logic_vector (to_unsigned (datao_to.last(i).b, 10));
    wait until rising_edge (CalculateTo_clock);
    wait until rising_edge (CalculateTo_clock);
    warning_neq_fp (CalculateTo_do, datao_to.last(i).a, "last " & integer'image (datao_to.last(i).b), true);
  end loop;
--report "end at 2534.255us";
report "end at 2475.775us";
wait for 1 ps;
report "done" severity failure;
end process;

CalculateTo_sqrtfp2clk <= CalculateTo_clock;
CalculateTo_mulfpclk <= CalculateTo_clock;
CalculateTo_divfpclk <= CalculateTo_clock;
CalculateTo_addfpclk <= CalculateTo_clock;
CalculateTo_subfpclk <= CalculateTo_clock;
CalculateTo_fixed2floatclk <= CalculateTo_clock;

inst_divfp : divfp
PORT MAP (
a => CalculateTo_divfpa,
b => CalculateTo_divfpb,
operation_nd => CalculateTo_divfpond,
clk => CalculateTo_divfpclk,
sclr => CalculateTo_divfpsclr,
ce => CalculateTo_divfpce,
result => CalculateTo_divfpr,
rdy => CalculateTo_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => CalculateTo_mulfpa,
b => CalculateTo_mulfpb,
operation_nd => CalculateTo_mulfpond,
clk => CalculateTo_mulfpclk,
sclr => CalculateTo_mulfpsclr,
ce => CalculateTo_mulfpce,
result => CalculateTo_mulfpr,
rdy => CalculateTo_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => CalculateTo_addfpa,
b => CalculateTo_addfpb,
operation_nd => CalculateTo_addfpond,
clk => CalculateTo_addfpclk,
sclr => CalculateTo_addfpsclr,
ce => CalculateTo_addfpce,
result => CalculateTo_addfpr,
rdy => CalculateTo_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => CalculateTo_subfpa,
b => CalculateTo_subfpb,
operation_nd => CalculateTo_subfpond,
clk => CalculateTo_subfpclk,
sclr => CalculateTo_subfpsclr,
ce => CalculateTo_subfpce,
result => CalculateTo_subfpr,
rdy => CalculateTo_subfprdy
);

inst_sqrtfp2 : sqrtfp2
PORT MAP (
a => CalculateTo_sqrtfp2a,
operation_nd => CalculateTo_sqrtfp2ond,
clk => CalculateTo_sqrtfp2clk,
sclr => CalculateTo_sqrtfp2sclr,
ce => CalculateTo_sqrtfp2ce,
result => CalculateTo_sqrtfp2r,
rdy => CalculateTo_sqrtfp2rdy
);

inst_fixed2float : fixed2float
PORT MAP (
a => CalculateTo_fixed2floata,
operation_nd => CalculateTo_fixed2floatond,
clk => CalculateTo_fixed2floatclk,
sclr => CalculateTo_fixed2floatsclr,
ce => CalculateTo_fixed2floatce,
result => CalculateTo_fixed2floatr,
rdy => CalculateTo_fixed2floatrdy
);

inst_rom_constants : rom_constants PORT MAP (
i_clock => CalculateTo_clock,
i_reset => CalculateTo_reset,
i_kvptat_en => '0',
i_kvptat_adr => (others => '0'),
i_alphaptat_en => '0',
i_alphaptat_adr => (others => '0'),
i_signed4bit_en => '0',
i_signed4bit_adr => (others => '0'),
i_signed6bit_en => '0',
i_signed6bit_adr => (others => '0'),
i_alphascale_1_en => '0',
i_alphascale_1_adr => (others => '0'),
i_2powx_4bit_en => '0',
i_2powx_4bit_adr => (others => '0'),
i_cpratio_en => '0',
i_cpratio_adr => (others => '0'),
i_alphascale_2_en => '0',
i_alphascale_2_adr => (others => '0'),
i_2powx_p8_4bit_en => CalculateTo_2powx_p8_ena,
i_2powx_p8_4bit_adr => CalculateTo_2powx_p8_adr,
i_signed3bit_en => '0',
i_signed3bit_adr => (others => '0'),
o_float => CalculateTo_rom_constants_float
);

END;
