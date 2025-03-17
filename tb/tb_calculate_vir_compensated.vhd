-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   20:33:32 02/17/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_calculate_vir_compensated
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
--      divfp, mulfp, addfp, subfp
--    - Processes (Architecture: tb):
--      p_clock_generator, p_tb
--
-- Important objects:
--  - tb_i2c_mem
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
USE ieee.numeric_std.ALL;

USE work.global_package.all;

ENTITY tb_calculate_vir_compensated IS
END tb_calculate_vir_compensated;

ARCHITECTURE tb OF tb_calculate_vir_compensated IS 

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

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT calculate_vir_compensated
PORT(
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_pixoscpsp0 : in std_logic_vector (31 downto 0);
i_pixoscpsp1 : in std_logic_vector (31 downto 0);
i_tgc : in std_logic_vector (31 downto 0);

i_pixos_do : in std_logic_vector (31 downto 0);
o_pixos_addr : out std_logic_vector (9 downto 0); -- 10bit-1024

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

signal i2c_mem_ena : out STD_LOGIC;
signal i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

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
signal subfprdy : in STD_LOGIC
);
END COMPONENT;
signal calculate_vir_compensated_clock : std_logic;
signal calculate_vir_compensated_reset : std_logic;
signal calculate_vir_compensated_run : std_logic;
signal calculate_vir_compensated_pixoscpsp0 : std_logic_vector(31 downto 0) := x"BEF58000"; -- -4.794922e-01
signal calculate_vir_compensated_pixoscpsp1 : std_logic_vector(31 downto 0) := x"3FBA7EC0"; -- 1.456993e+00
signal calculate_vir_compensated_tgc : std_logic_vector(31 downto 0) := x"00000000"; -- 0
signal calculate_vir_compensated_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal calculate_vir_compensated_pixos_do : std_logic_vector(31 downto 0) := (others => '0');
signal calculate_vir_compensated_addr : std_logic_vector(9 downto 0) := (others => '0');
signal calculate_vir_compensated_i2c_mem_ena : std_logic;
signal calculate_vir_compensated_i2c_mem_addra : std_logic_vector(11 downto 0) := (others => '0');
signal calculate_vir_compensated_pixos_addr : std_logic_vector(9 downto 0) := (others => '0');
signal calculate_vir_compensated_do : std_logic_vector(31 downto 0) := (others => '0');
signal calculate_vir_compensated_rdy : std_logic;
signal calculate_vir_compensated_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_divfpond : STD_LOGIC;
signal calculate_vir_compensated_divfpsclr : STD_LOGIC;
signal calculate_vir_compensated_divfpce : STD_LOGIC;
signal calculate_vir_compensated_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_divfprdy : STD_LOGIC;
signal calculate_vir_compensated_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_mulfpond : STD_LOGIC;
signal calculate_vir_compensated_mulfpsclr : STD_LOGIC;
signal calculate_vir_compensated_mulfpce : STD_LOGIC;
signal calculate_vir_compensated_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_mulfprdy : STD_LOGIC;
signal calculate_vir_compensated_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_addfpond : STD_LOGIC;
signal calculate_vir_compensated_addfpsclr : STD_LOGIC;
signal calculate_vir_compensated_addfpce : STD_LOGIC;
signal calculate_vir_compensated_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_addfprdy : STD_LOGIC;
signal calculate_vir_compensated_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_subfpond : STD_LOGIC;
signal calculate_vir_compensated_subfpsclr : STD_LOGIC;
signal calculate_vir_compensated_subfpce : STD_LOGIC;
signal calculate_vir_compensated_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_vir_compensated_subfprdy : STD_LOGIC;

signal calculate_vir_compensated_addfpclk : std_logic;
signal calculate_vir_compensated_subfpclk : std_logic;
signal calculate_vir_compensated_mulfpclk : std_logic;
signal calculate_vir_compensated_divfpclk : std_logic;

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

-- Clock period definitions
constant i_clock_period : time := 10 ns;

signal out1r : real;

BEGIN

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => calculate_vir_compensated_clock,
ena => calculate_vir_compensated_i2c_mem_ena,
wea => "0",
addra => calculate_vir_compensated_i2c_mem_addra,
dina => (others => '0'),
douta => calculate_vir_compensated_i2c_mem_douta
);

out1r <= ap_slv2fp (calculate_vir_compensated_do); -- output data

-- Instantiate the Unit Under Test (UUT)
calculate_vir_compensated_uut: calculate_vir_compensated PORT MAP (
i_clock => calculate_vir_compensated_clock,
i_reset => calculate_vir_compensated_reset,
i_run => calculate_vir_compensated_run,
i_pixoscpsp0 => calculate_vir_compensated_pixoscpsp0,
i_pixoscpsp1 => calculate_vir_compensated_pixoscpsp1,
i_tgc => calculate_vir_compensated_tgc,
i_pixos_do => calculate_vir_compensated_pixos_do,
o_pixos_addr => calculate_vir_compensated_pixos_addr,
o_do => calculate_vir_compensated_do,
i_addr => calculate_vir_compensated_addr,
o_rdy => calculate_vir_compensated_rdy,

i2c_mem_ena => calculate_vir_compensated_i2c_mem_ena,
i2c_mem_addra => calculate_vir_compensated_i2c_mem_addra,
i2c_mem_douta => calculate_vir_compensated_i2c_mem_douta,

divfpa => calculate_vir_compensated_divfpa,
divfpb => calculate_vir_compensated_divfpb,
divfpond => calculate_vir_compensated_divfpond,
divfpsclr => calculate_vir_compensated_divfpsclr,
divfpce => calculate_vir_compensated_divfpce,
divfpr => calculate_vir_compensated_divfpr,
divfprdy => calculate_vir_compensated_divfprdy,

mulfpa => calculate_vir_compensated_mulfpa,
mulfpb => calculate_vir_compensated_mulfpb,
mulfpond => calculate_vir_compensated_mulfpond,
mulfpsclr => calculate_vir_compensated_mulfpsclr,
mulfpce => calculate_vir_compensated_mulfpce,
mulfpr => calculate_vir_compensated_mulfpr,
mulfprdy => calculate_vir_compensated_mulfprdy,

addfpa => calculate_vir_compensated_addfpa,
addfpb => calculate_vir_compensated_addfpb,
addfpond => calculate_vir_compensated_addfpond,
addfpsclr => calculate_vir_compensated_addfpsclr,
addfpce => calculate_vir_compensated_addfpce,
addfpr => calculate_vir_compensated_addfpr,
addfprdy => calculate_vir_compensated_addfprdy,

subfpa => calculate_vir_compensated_subfpa,
subfpb => calculate_vir_compensated_subfpb,
subfpond => calculate_vir_compensated_subfpond,
subfpsclr => calculate_vir_compensated_subfpsclr,
subfpce => calculate_vir_compensated_subfpce,
subfpr => calculate_vir_compensated_subfpr,
subfprdy => calculate_vir_compensated_subfprdy
);

-- Clock process definitions
p_clock_generator :process
begin
calculate_vir_compensated_clock <= '0';
wait for i_clock_period/2;
calculate_vir_compensated_clock <= '1';
wait for i_clock_period/2;
end process p_clock_generator;

-- Stimulus process
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
-- XXX data from CalculatePixOS
constant data : datar := (
first => (
(a => x"438B7B48", b => 0),
(a => x"C1C87294", b => 1),
(a => x"C1C08FA0", b => 2),
(a => x"C1C121AA", b => 3),
(a => x"C1CA6A9C", b => 4),
(a => x"C1CA6898", b => 5),
(a => x"C1C2F7D8", b => 6),
(a => x"C1D15736", b => 7),
(a => x"C1DAF426", b => 8),
(a => x"C1E26DDE", b => 9)
),
middle => (
(a => x"C1AC8638", b => 382),
(a => x"C1CE1D6C", b => 384)
),
last => (
(a => x"C1C66134", b => 758),
(a => x"C1C6B538", b => 759),
(a => x"C12667C8", b => 760),
(a => x"C184E308", b => 761),
(a => x"C0B19230", b => 762),
(a => x"C0ADA230", b => 763),
(a => x"C05D6F40", b => 764),
(a => x"C0ADA230", b => 765),
(a => x"C1199F48", b => 766),
(a => x"C0CA1D30", b => 767)
)
);
-- XXX data from CalculateVirCompensated
constant datao : datar := ( -- XXX data appears at addr+1 TODO FIX
first => (
(a => x"438B7B48", b => 1),
(a => x"C1C87294", b => 2),
(a => x"C1C08FA0", b => 3),
(a => x"C1C121AA", b => 4),
(a => x"C1CA6A9C", b => 5),
(a => x"C1CA6898", b => 6),
(a => x"C1C2F7D8", b => 7),
(a => x"C1D15736", b => 8),
(a => x"C1DAF426", b => 9),
(a => x"C1E26DDE", b => 10)
),
middle => (
(a => x"C1AC8638", b => 383),
(a => x"C1CE1D6C", b => 385)
),
last => (
(a => x"C1C66134", b => 759),
(a => x"C1C6B538", b => 760),
(a => x"C12667C8", b => 761),
(a => x"C184E308", b => 762),
(a => x"C0B19230", b => 763),
(a => x"C0ADA230", b => 764),
(a => x"C05D6F40", b => 765),
(a => x"C0ADA230", b => 766),
(a => x"C1199F48", b => 767),
(a => x"C0CA1D30", b => 768) -- XXX index out of range
)
);
begin
-- hold reset state for 100 ns.
calculate_vir_compensated_reset <= '1';
wait for 100 ns;
calculate_vir_compensated_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
calculate_vir_compensated_run <= '1'; wait for i_clock_period; calculate_vir_compensated_run <= '0';
report "before loop";
  for i in 0 to 767 loop
    for k in 0 to 9 loop
      if calculate_vir_compensated_pixos_addr = std_logic_vector (to_unsigned (data.first(k).b, 10)) then
        calculate_vir_compensated_pixos_do <= data.first(k).a;
      end if;
    end loop;
    for k in 0 to 1 loop
      if calculate_vir_compensated_pixos_addr = std_logic_vector (to_unsigned (data.middle(k).b, 10)) then
        calculate_vir_compensated_pixos_do <= data.middle(k).a;
      end if;
    end loop;
    for k in 0 to 9 loop
      if calculate_vir_compensated_pixos_addr = std_logic_vector (to_unsigned (data.last(k).b, 10)) then
        calculate_vir_compensated_pixos_do <= data.last(k).a;
      end if;
    end loop;
    wait for 1.140us; -- XXX the same as CalculateVirCompensated wait for data from CalculatePixOS MEM
  end loop;
report "after loop";
--wait until calculate_vir_compensated_rdy = '1'; -- fix it
--report "rdy at 806.665us";
--report "rdy at 798.975us";
--report "rdy at 683.765us";
--report "rdy at 883.445us - rm tmp regs";
report "rdy at 875.765us - rm tmp regs";
  calculate_vir_compensated_addr <= std_logic_vector (to_unsigned (0, 10)); -- XXX data start at addr 1 TODO FIX
  wait until rising_edge (calculate_vir_compensated_clock);
  wait until rising_edge (calculate_vir_compensated_clock);
  warning_neq_fp (calculate_vir_compensated_do, x"00000000", "omit first 0");
  for i in 0 to 9 loop
    calculate_vir_compensated_addr <= std_logic_vector (to_unsigned (datao.first(i).b, 10));
    wait until rising_edge (calculate_vir_compensated_clock);
    wait until rising_edge (calculate_vir_compensated_clock);
    warning_neq_fp (calculate_vir_compensated_do, datao.first(i).a, "first " & integer'image (datao.first(i).b));
    wait until rising_edge (calculate_vir_compensated_clock);
  end loop;
  for i in 0 to 1 loop
    calculate_vir_compensated_addr <= std_logic_vector (to_unsigned (datao.middle(i).b, 10));
    wait until rising_edge (calculate_vir_compensated_clock);
    wait until rising_edge (calculate_vir_compensated_clock);
    warning_neq_fp (calculate_vir_compensated_do, datao.middle(i).a, "middle " & integer'image (datao.middle(i).b));
    wait until rising_edge (calculate_vir_compensated_clock);
  end loop;
  for i in 0 to 9 loop
    calculate_vir_compensated_addr <= std_logic_vector (to_unsigned (datao.last(i).b, 10));
    wait until rising_edge (calculate_vir_compensated_clock);
    wait until rising_edge (calculate_vir_compensated_clock);
    warning_neq_fp (calculate_vir_compensated_do, datao.last(i).a, "last " & integer'image (datao.last(i).b));
    wait until rising_edge (calculate_vir_compensated_clock);
    calculate_vir_compensated_addr <= (others => '0');
  end loop;
--report "done at 807.345us";
--report "done at 799.655us";
--report "done at 684.445us";
--report "done at 912.215us - rm tmp regs";
report "done at 876.385us - rm tmp regs";
wait for 1 ps;
report "done" severity failure;
end process p_tb;

calculate_vir_compensated_addfpclk <= calculate_vir_compensated_clock;
calculate_vir_compensated_subfpclk <= calculate_vir_compensated_clock;
calculate_vir_compensated_mulfpclk <= calculate_vir_compensated_clock;
calculate_vir_compensated_divfpclk <= calculate_vir_compensated_clock;

divfp_i0 : divfp
PORT MAP (
a => calculate_vir_compensated_divfpa,
b => calculate_vir_compensated_divfpb,
operation_nd => calculate_vir_compensated_divfpond,
clk => calculate_vir_compensated_divfpclk,
sclr => calculate_vir_compensated_divfpsclr,
ce => calculate_vir_compensated_divfpce,
result => calculate_vir_compensated_divfpr,
rdy => calculate_vir_compensated_divfprdy
);

mulfp_i0 : mulfp
PORT MAP (
a => calculate_vir_compensated_mulfpa,
b => calculate_vir_compensated_mulfpb,
operation_nd => calculate_vir_compensated_mulfpond,
clk => calculate_vir_compensated_mulfpclk,
sclr => calculate_vir_compensated_mulfpsclr,
ce => calculate_vir_compensated_mulfpce,
result => calculate_vir_compensated_mulfpr,
rdy => calculate_vir_compensated_mulfprdy
);

addfp_i0 : addfp
PORT MAP (
a => calculate_vir_compensated_addfpa,
b => calculate_vir_compensated_addfpb,
operation_nd => calculate_vir_compensated_addfpond,
clk => calculate_vir_compensated_addfpclk,
sclr => calculate_vir_compensated_addfpsclr,
ce => calculate_vir_compensated_addfpce,
result => calculate_vir_compensated_addfpr,
rdy => calculate_vir_compensated_addfprdy
);

subfp_i0 : subfp
PORT MAP (
a => calculate_vir_compensated_subfpa,
b => calculate_vir_compensated_subfpb,
operation_nd => calculate_vir_compensated_subfpond,
clk => calculate_vir_compensated_subfpclk,
sclr => calculate_vir_compensated_subfpsclr,
ce => calculate_vir_compensated_subfpce,
result => calculate_vir_compensated_subfpr,
rdy => calculate_vir_compensated_subfprdy
);

END ARCHITECTURE tb;

