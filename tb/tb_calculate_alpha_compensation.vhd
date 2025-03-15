-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   16:36:12 02/18/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_calculate_alpha_compensation
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
--      tb_i2c_mem, mulfp, divfp, addfp, subfp, fixed2float
--    - Processes (Architecture: tb):
--      p_clock_process, p_tb
--
-- Imporant objects:
--  - tb_i2c_mem - raw data dla calculate
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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.global_package.all;

ENTITY tb_calculate_alpha_compensation IS
END tb_calculate_alpha_compensation;

ARCHITECTURE tb OF tb_calculate_alpha_compensation IS 

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

COMPONENT calculate_alpha_compensation
PORT(
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_Ta : in std_logic_vector (31 downto 0);
i_acpsubpage0 : in std_logic_vector (31 downto 0);
i_acpsubpage1 : in std_logic_vector (31 downto 0);
i_tgc : in std_logic_vector (31 downto 0);

i_alpha_do : in std_logic_vector (31 downto 0);
o_alpha_addr : out std_logic_vector (9 downto 0); -- 10bit-1024

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

signal i2c_mem_ena : out STD_LOGIC;
signal i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

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

signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC
);
END COMPONENT;
signal calculate_alpha_compensation_clock : std_logic := '0';
signal calculate_alpha_compensation_reset : std_logic := '0';
signal calculate_alpha_compensation_run : std_logic := '0';
signal calculate_alpha_compensation_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal calculate_alpha_compensation_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal calculate_alpha_compensation_acpsubpage0 : std_logic_vector(31 downto 0) := (others => '0');
signal calculate_alpha_compensation_acpsubpage1 : std_logic_vector(31 downto 0) := (others => '0');
signal calculate_alpha_compensation_tgc : std_logic_vector(31 downto 0) := (others => '0');
signal calculate_alpha_compensation_alpha_do : std_logic_vector(31 downto 0) := (others => '0');
signal calculate_alpha_compensation_addr : std_logic_vector(9 downto 0) := (others => '0');
signal calculate_alpha_compensation_i2c_mem_ena : std_logic;
signal calculate_alpha_compensation_i2c_mem_addra : std_logic_vector(11 downto 0);
signal calculate_alpha_compensation_alpha_addr : std_logic_vector(9 downto 0);
signal calculate_alpha_compensation_do : std_logic_vector(31 downto 0);
signal calculate_alpha_compensation_rdy : std_logic;
signal calculate_alpha_compensation_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_mulfpond : STD_LOGIC;
signal calculate_alpha_compensation_mulfpsclr : STD_LOGIC;
signal calculate_alpha_compensation_mulfpce : STD_LOGIC;
signal calculate_alpha_compensation_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_mulfprdy : STD_LOGIC;
signal calculate_alpha_compensation_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_divfpond : STD_LOGIC;
signal calculate_alpha_compensation_divfpsclr : STD_LOGIC;
signal calculate_alpha_compensation_divfpce : STD_LOGIC;
signal calculate_alpha_compensation_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_divfprdy : STD_LOGIC;
signal calculate_alpha_compensation_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_addfpond : STD_LOGIC;
signal calculate_alpha_compensation_addfpsclr : STD_LOGIC;
signal calculate_alpha_compensation_addfpce : STD_LOGIC;
signal calculate_alpha_compensation_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_addfprdy : STD_LOGIC;
signal calculate_alpha_compensation_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_subfpond : STD_LOGIC;
signal calculate_alpha_compensation_subfpsclr : STD_LOGIC;
signal calculate_alpha_compensation_subfpce : STD_LOGIC;
signal calculate_alpha_compensation_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_subfprdy : STD_LOGIC;
signal calculate_alpha_compensation_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal calculate_alpha_compensation_fixed2floatond : STD_LOGIC;
signal calculate_alpha_compensation_fixed2floatsclr : STD_LOGIC;
signal calculate_alpha_compensation_fixed2floatce : STD_LOGIC;
signal calculate_alpha_compensation_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_alpha_compensation_fixed2floatrdy : STD_LOGIC;

signal calculate_alpha_compensation_mulfpclk : std_logic;
signal calculate_alpha_compensation_divfpclk : std_logic;
signal calculate_alpha_compensation_addfpclk : std_logic;
signal calculate_alpha_compensation_subfpclk : std_logic;
signal calculate_alpha_compensation_fixed2floatclk : std_logic;

constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (calculate_alpha_compensation_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => calculate_alpha_compensation_clock,
ena => calculate_alpha_compensation_i2c_mem_ena,
wea => "0",
addra => calculate_alpha_compensation_i2c_mem_addra,
dina => (others => '0'),
douta => calculate_alpha_compensation_i2c_mem_douta
);

calculate_alpha_compensation_tgc <= x"00000000";
calculate_alpha_compensation_uut : calculate_alpha_compensation PORT MAP (
i_clock => calculate_alpha_compensation_clock,
i_reset => calculate_alpha_compensation_reset,

i_run => calculate_alpha_compensation_run,
i_Ta => calculate_alpha_compensation_Ta,
i_acpsubpage0 => calculate_alpha_compensation_acpsubpage0,
i_acpsubpage1 => calculate_alpha_compensation_acpsubpage1,
i_tgc => calculate_alpha_compensation_tgc,
i_alpha_do => calculate_alpha_compensation_alpha_do,
o_alpha_addr => calculate_alpha_compensation_alpha_addr,
o_do => calculate_alpha_compensation_do,
i_addr => calculate_alpha_compensation_addr,
o_rdy => calculate_alpha_compensation_rdy,

i2c_mem_ena => calculate_alpha_compensation_i2c_mem_ena,
i2c_mem_addra => calculate_alpha_compensation_i2c_mem_addra,
i2c_mem_douta => calculate_alpha_compensation_i2c_mem_douta,

mulfpa => calculate_alpha_compensation_mulfpa,
mulfpb => calculate_alpha_compensation_mulfpb,
mulfpond => calculate_alpha_compensation_mulfpond,
mulfpsclr => calculate_alpha_compensation_mulfpsclr,
mulfpce => calculate_alpha_compensation_mulfpce,
mulfpr => calculate_alpha_compensation_mulfpr,
mulfprdy => calculate_alpha_compensation_mulfprdy,

divfpa => calculate_alpha_compensation_divfpa,
divfpb => calculate_alpha_compensation_divfpb,
divfpond => calculate_alpha_compensation_divfpond,
divfpsclr => calculate_alpha_compensation_divfpsclr,
divfpce => calculate_alpha_compensation_divfpce,
divfpr => calculate_alpha_compensation_divfpr,
divfprdy => calculate_alpha_compensation_divfprdy,

addfpa => calculate_alpha_compensation_addfpa,
addfpb => calculate_alpha_compensation_addfpb,
addfpond => calculate_alpha_compensation_addfpond,
addfpsclr => calculate_alpha_compensation_addfpsclr,
addfpce => calculate_alpha_compensation_addfpce,
addfpr => calculate_alpha_compensation_addfpr,
addfprdy => calculate_alpha_compensation_addfprdy,

subfpa => calculate_alpha_compensation_subfpa,
subfpb => calculate_alpha_compensation_subfpb,
subfpond => calculate_alpha_compensation_subfpond,
subfpsclr => calculate_alpha_compensation_subfpsclr,
subfpce => calculate_alpha_compensation_subfpce,
subfpr => calculate_alpha_compensation_subfpr,
subfprdy => calculate_alpha_compensation_subfprdy,

fixed2floata => calculate_alpha_compensation_fixed2floata,
fixed2floatond => calculate_alpha_compensation_fixed2floatond,
fixed2floatsclr => calculate_alpha_compensation_fixed2floatsclr,
fixed2floatce => calculate_alpha_compensation_fixed2floatce,
fixed2floatr => calculate_alpha_compensation_fixed2floatr,
fixed2floatrdy => calculate_alpha_compensation_fixed2floatrdy
);

p_clock_process : process
begin
calculate_alpha_compensation_clock <= '0';
wait for i_clock_period/2;
calculate_alpha_compensation_clock <= '1';
wait for i_clock_period/2;
end process p_clock_process;

p_tb : process
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
constant data : datar := (
first => (
(a => x"331C6400", b => 0),
(a => x"331E6400", b => 1),
(a => x"3322E400", b => 2),
(a => x"3324E400", b => 3),
(a => x"332F6400", b => 4),
(a => x"33326400", b => 5),
(a => x"3332E400", b => 6),
(a => x"33356400", b => 7),
(a => x"333D6400", b => 8),
(a => x"333FE400", b => 9)
),
middle => (
(a => x"331EE400", b => 382),
(a => x"3337E400", b => 384)
),
last => (
(a => x"33326400", b => 758),
(a => x"332F6400", b => 759),
(a => x"332AE400", b => 760),
(a => x"3329E400", b => 761),
(a => x"331B6400", b => 762),
(a => x"33196400", b => 763),
(a => x"33126400", b => 764),
(a => x"330FE400", b => 765),
(a => x"32FFC800", b => 766),
(a => x"32F6C800", b => 767)
)
);
-- XXX data for output CalculateAlphaComp
constant datao : datar := (
first => (
(a => x"3318F553", b => 1), -- XXX good value, in project is 0, address from +1
(a => x"331AEA16", b => 2),
(a => x"331F50CE", b => 3),
(a => x"33214591", b => 4),
(a => x"332B8A93", b => 5),
(a => x"332E79B8", b => 6),
(a => x"332EF6E9", b => 7),
(a => x"333168DD", b => 8),
(a => x"33393BEA", b => 9),
(a => x"333BADDE", b => 10)
),
middle => (
(a => x"331B6747", b => 383),
(a => x"3333DAD1", b => 385)
),
last => (
(a => x"332E79B8", b => 759),
(a => x"332B8A93", b => 760),
(a => x"332723DB", b => 761),
(a => x"3326297A", b => 762),
(a => x"3317FAF1", b => 763),
(a => x"3316062E", b => 764),
(a => x"330F2D82", b => 765),
(a => x"330CBB8E", b => 766),
(a => x"32FA2AE7", b => 767),
(a => x"32F15D78", b => 768) -- XXX unreachable
)
);
begin
-- hold reset state for 100 ns.
calculate_alpha_compensation_reset <= '1';
wait for 100 ns;
calculate_alpha_compensation_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
calculate_alpha_compensation_Ta <= x"4207F54D";
calculate_alpha_compensation_acpsubpage0 <= x"31460000";
calculate_alpha_compensation_acpsubpage1 <= x"31478C00";
wait for i_clock_period;
calculate_alpha_compensation_run <= '1'; wait for i_clock_period; calculate_alpha_compensation_run <= '0';
report "before loop";
  for i in 0 to 768 loop
    for k in 0 to 9 loop
      if calculate_alpha_compensation_alpha_addr = std_logic_vector (to_unsigned (data.first(k).b, 10)) then
        calculate_alpha_compensation_alpha_do <= data.first(k).a;
      end if;
    end loop;
    for k in 0 to 1 loop
      if calculate_alpha_compensation_alpha_addr = std_logic_vector (to_unsigned (data.middle(k).b, 10)) then
        calculate_alpha_compensation_alpha_do <= data.middle(k).a;
      end if;
    end loop;
    for k in 0 to 9 loop
      if calculate_alpha_compensation_alpha_addr = std_logic_vector (to_unsigned (data.last(k).b, 10)) then
        calculate_alpha_compensation_alpha_do <= data.last(k).a;
      end if;
    end loop;
    wait for 1.900us; -- XXX the same as CalculateAlphaComp wait for data from ExtractAlphaParameters MEM
  end loop;
report "after loop";
--wait until calculate_alpha_compensation_rdy = '1';
--report "rdy at 645.945us";
--report "rdy at 599.795us";
--report "rdy at 599.815us";
--report "rdy at 599.755us";
report "rdy 767 at 1144.615us - rm all regs";
  for i in 0 to 9 loop
    calculate_alpha_compensation_addr <= std_logic_vector (to_unsigned (datao.first(i).b, 10));
    wait until rising_edge (calculate_alpha_compensation_clock);
    wait until rising_edge (calculate_alpha_compensation_clock);
    warning_neq_fp (calculate_alpha_compensation_do, datao.first(i).a, "first " & integer'image (datao.first(i).b));
    wait until rising_edge (calculate_alpha_compensation_clock);
  end loop;
  for i in 0 to 1 loop
    calculate_alpha_compensation_addr <= std_logic_vector (to_unsigned (datao.middle(i).b, 10));
    wait until rising_edge (calculate_alpha_compensation_clock);
    wait until rising_edge (calculate_alpha_compensation_clock);
    warning_neq_fp (calculate_alpha_compensation_do, datao.middle(i).a, "middle " & integer'image (datao.middle(i).b));
    wait until rising_edge (calculate_alpha_compensation_clock);
  end loop;
  for i in 0 to 8 loop -- XXX last_9 is not available, rest above values is OK
    calculate_alpha_compensation_addr <= std_logic_vector (to_unsigned (datao.last(i).b, 10));
    wait until rising_edge (calculate_alpha_compensation_clock);
    wait until rising_edge (calculate_alpha_compensation_clock);
    warning_neq_fp (calculate_alpha_compensation_do, datao.last(i).a, "last " & integer'image (datao.last(i).b));
    wait until rising_edge (calculate_alpha_compensation_clock);
  end loop;
  calculate_alpha_compensation_addr <= std_logic_vector (to_unsigned (datao.last(9).b, 10));
  wait until rising_edge (calculate_alpha_compensation_clock);
  wait until rising_edge (calculate_alpha_compensation_clock);
  warning_neq_fp (calculate_alpha_compensation_do, datao.last(9).a, "last " & integer'image (datao.last(9).b) & " not available - fix it");
wait for 1 ps;
-- XXX outputs differ around e-9 and e-10 (output have e-8)
--report "end at 666.445us";
--report "end at 620.295us";
--report "end at 600.465us";
--report "end at 600.405us";
report "end at 1403.745us - rm all regs";
report "done" severity failure;
end process p_tb;

calculate_alpha_compensation_mulfpclk <= calculate_alpha_compensation_clock;
calculate_alpha_compensation_divfpclk <= calculate_alpha_compensation_clock;
calculate_alpha_compensation_addfpclk <= calculate_alpha_compensation_clock;
calculate_alpha_compensation_subfpclk <= calculate_alpha_compensation_clock;
calculate_alpha_compensation_fixed2floatclk <= calculate_alpha_compensation_clock;

mulfp_i0 : mulfp
PORT MAP (
a => calculate_alpha_compensation_mulfpa,
b => calculate_alpha_compensation_mulfpb,
operation_nd => calculate_alpha_compensation_mulfpond,
clk => calculate_alpha_compensation_mulfpclk,
sclr => calculate_alpha_compensation_mulfpsclr,
ce => calculate_alpha_compensation_mulfpce,
result => calculate_alpha_compensation_mulfpr,
rdy => calculate_alpha_compensation_mulfprdy
);

divfp_i0 : divfp
PORT MAP (
a => calculate_alpha_compensation_divfpa,
b => calculate_alpha_compensation_divfpb,
operation_nd => calculate_alpha_compensation_divfpond,
clk => calculate_alpha_compensation_divfpclk,
sclr => calculate_alpha_compensation_divfpsclr,
ce => calculate_alpha_compensation_divfpce,
result => calculate_alpha_compensation_divfpr,
rdy => calculate_alpha_compensation_divfprdy
);

addfp_i0 : addfp
PORT MAP (
a => calculate_alpha_compensation_addfpa,
b => calculate_alpha_compensation_addfpb,
operation_nd => calculate_alpha_compensation_addfpond,
clk => calculate_alpha_compensation_addfpclk,
sclr => calculate_alpha_compensation_addfpsclr,
ce => calculate_alpha_compensation_addfpce,
result => calculate_alpha_compensation_addfpr,
rdy => calculate_alpha_compensation_addfprdy
);

subfp_i0 : subfp
PORT MAP (
a => calculate_alpha_compensation_subfpa,
b => calculate_alpha_compensation_subfpb,
operation_nd => calculate_alpha_compensation_subfpond,
clk => calculate_alpha_compensation_subfpclk,
sclr => calculate_alpha_compensation_subfpsclr,
ce => calculate_alpha_compensation_subfpce,
result => calculate_alpha_compensation_subfpr,
rdy => calculate_alpha_compensation_subfprdy
);

fixed2float_i0 : fixed2float
PORT MAP (
a => calculate_alpha_compensation_fixed2floata,
operation_nd => calculate_alpha_compensation_fixed2floatond,
clk => calculate_alpha_compensation_fixed2floatclk,
sclr => calculate_alpha_compensation_fixed2floatsclr,
ce => calculate_alpha_compensation_fixed2floatce,
result => calculate_alpha_compensation_fixed2floatr,
rdy => calculate_alpha_compensation_fixed2floatrdy
);

end architecture tb;

