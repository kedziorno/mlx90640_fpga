--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:33:32 02/17/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_CalculateVirCompensated.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CalculateVirCompensated
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

USE work.p_fphdl_package3.all;

ENTITY tb_CalculateVirCompensated IS
END tb_CalculateVirCompensated;

ARCHITECTURE behavior OF tb_CalculateVirCompensated IS 

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
COMPONENT CalculateVirCompensated
PORT(
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_Emissivity : in std_logic_vector (31 downto 0);
i_pixoscpsp0 : in std_logic_vector (31 downto 0);
i_pixoscpsp1 : in std_logic_vector (31 downto 0);

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_pixos_do : in std_logic_vector (31 downto 0);
o_pixos_addr : out std_logic_vector (9 downto 0); -- 10bit-1024

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

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
signal CalculateVirCompensated_clock : std_logic;
signal CalculateVirCompensated_reset : std_logic;
signal CalculateVirCompensated_run : std_logic;
signal CalculateVirCompensated_Emissivity : std_logic_vector(31 downto 0) := x"3f800000"; -- 1
signal CalculateVirCompensated_pixoscpsp0 : std_logic_vector(31 downto 0) := x"41CD5551"; -- 25.6666575059956
signal CalculateVirCompensated_pixoscpsp1 : std_logic_vector(31 downto 0) := x"41AD0D7D"; -- 21.6315865670509
signal CalculateVirCompensated_i2c_mem_douta : std_logic_vector(7 downto 0);
signal CalculateVirCompensated_pixos_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateVirCompensated_addr : std_logic_vector(9 downto 0);
signal CalculateVirCompensated_i2c_mem_ena : std_logic;
signal CalculateVirCompensated_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateVirCompensated_pixos_addr : std_logic_vector(9 downto 0);
signal CalculateVirCompensated_do : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_rdy : std_logic;
signal CalculateVirCompensated_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_divfpond : STD_LOGIC;
signal CalculateVirCompensated_divfpsclr : STD_LOGIC;
signal CalculateVirCompensated_divfpce : STD_LOGIC;
signal CalculateVirCompensated_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_divfprdy : STD_LOGIC;
signal CalculateVirCompensated_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_mulfpond : STD_LOGIC;
signal CalculateVirCompensated_mulfpsclr : STD_LOGIC;
signal CalculateVirCompensated_mulfpce : STD_LOGIC;
signal CalculateVirCompensated_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_mulfprdy : STD_LOGIC;
signal CalculateVirCompensated_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_addfpond : STD_LOGIC;
signal CalculateVirCompensated_addfpsclr : STD_LOGIC;
signal CalculateVirCompensated_addfpce : STD_LOGIC;
signal CalculateVirCompensated_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_addfprdy : STD_LOGIC;
signal CalculateVirCompensated_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_subfpond : STD_LOGIC;
signal CalculateVirCompensated_subfpsclr : STD_LOGIC;
signal CalculateVirCompensated_subfpce : STD_LOGIC;
signal CalculateVirCompensated_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_subfprdy : STD_LOGIC;

signal CalculateVirCompensated_addfpclk : std_logic;
signal CalculateVirCompensated_subfpclk : std_logic;
signal CalculateVirCompensated_mulfpclk : std_logic;
signal CalculateVirCompensated_divfpclk : std_logic;

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

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculateVirCompensated_clock,
ena => CalculateVirCompensated_i2c_mem_ena,
wea => "0",
addra => CalculateVirCompensated_i2c_mem_addra,
dina => (others => '0'),
douta => CalculateVirCompensated_i2c_mem_douta
);

out1r <= ap_slv2fp (CalculateVirCompensated_do); -- output data

-- Instantiate the Unit Under Test (UUT)
uut: CalculateVirCompensated PORT MAP (
i_clock => CalculateVirCompensated_clock,
i_reset => CalculateVirCompensated_reset,
i_run => CalculateVirCompensated_run,
i_Emissivity => CalculateVirCompensated_Emissivity,
i_pixoscpsp0 => CalculateVirCompensated_pixoscpsp0,
i_pixoscpsp1 => CalculateVirCompensated_pixoscpsp1,
i2c_mem_ena => CalculateVirCompensated_i2c_mem_ena,
i2c_mem_addra => CalculateVirCompensated_i2c_mem_addra,
i2c_mem_douta => CalculateVirCompensated_i2c_mem_douta,
i_pixos_do => CalculateVirCompensated_pixos_do,
o_pixos_addr => CalculateVirCompensated_pixos_addr,
o_do => CalculateVirCompensated_do,
i_addr => CalculateVirCompensated_addr,
o_rdy => CalculateVirCompensated_rdy,

divfpa => CalculateVirCompensated_divfpa,
divfpb => CalculateVirCompensated_divfpb,
divfpond => CalculateVirCompensated_divfpond,
divfpsclr => CalculateVirCompensated_divfpsclr,
divfpce => CalculateVirCompensated_divfpce,
divfpr => CalculateVirCompensated_divfpr,
divfprdy => CalculateVirCompensated_divfprdy,

mulfpa => CalculateVirCompensated_mulfpa,
mulfpb => CalculateVirCompensated_mulfpb,
mulfpond => CalculateVirCompensated_mulfpond,
mulfpsclr => CalculateVirCompensated_mulfpsclr,
mulfpce => CalculateVirCompensated_mulfpce,
mulfpr => CalculateVirCompensated_mulfpr,
mulfprdy => CalculateVirCompensated_mulfprdy,

addfpa => CalculateVirCompensated_addfpa,
addfpb => CalculateVirCompensated_addfpb,
addfpond => CalculateVirCompensated_addfpond,
addfpsclr => CalculateVirCompensated_addfpsclr,
addfpce => CalculateVirCompensated_addfpce,
addfpr => CalculateVirCompensated_addfpr,
addfprdy => CalculateVirCompensated_addfprdy,

subfpa => CalculateVirCompensated_subfpa,
subfpb => CalculateVirCompensated_subfpb,
subfpond => CalculateVirCompensated_subfpond,
subfpsclr => CalculateVirCompensated_subfpsclr,
subfpce => CalculateVirCompensated_subfpce,
subfpr => CalculateVirCompensated_subfpr,
subfprdy => CalculateVirCompensated_subfprdy

);

-- Clock process definitions
i_clock_process :process
begin
CalculateVirCompensated_clock <= '0';
wait for i_clock_period/2;
CalculateVirCompensated_clock <= '1';
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
CalculateVirCompensated_reset <= '1';
wait for 100 ns;
CalculateVirCompensated_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
CalculateVirCompensated_run <= '1'; wait for i_clock_period; CalculateVirCompensated_run <= '0';
report "before loop";
for i in 0 to 767 loop
wait for 1.04us; -- XXX the same as CalculateVirCompensated wait for data from CalculatePixOS MEM
for k in 0 to 9 loop
if CalculateVirCompensated_pixos_addr = std_logic_vector (to_unsigned (data.first(k).b, 10)) then
CalculateVirCompensated_pixos_do <= data.first(k).a;
end if;
end loop;
for k in 0 to 1 loop
if CalculateVirCompensated_pixos_addr = std_logic_vector (to_unsigned (data.middle(k).b, 10)) then
CalculateVirCompensated_pixos_do <= data.middle(k).a;
end if;
end loop;
for k in 0 to 9 loop
if CalculateVirCompensated_pixos_addr = std_logic_vector (to_unsigned (data.last(k).b, 10)) then
CalculateVirCompensated_pixos_do <= data.last(k).a;
end if;
end loop;
end loop;
report "after loop";
wait until CalculateVirCompensated_rdy = '1';
--report "rdy at 806.665us";
report "rdy at 798.975us";
CalculateVirCompensated_addr <= std_logic_vector (to_unsigned (0, 10)); -- XXX data start at addr 1 TODO FIX
wait until rising_edge (CalculateVirCompensated_clock);
wait until rising_edge (CalculateVirCompensated_clock);
warning_neq_fp (CalculateVirCompensated_do, x"00000000", "omit first 0");
for i in 0 to 9 loop
CalculateVirCompensated_addr <= std_logic_vector (to_unsigned (datao.first(i).b, 10));
wait until rising_edge (CalculateVirCompensated_clock);
wait until rising_edge (CalculateVirCompensated_clock);
warning_neq_fp (CalculateVirCompensated_do, datao.first(i).a, "first " & integer'image (datao.first(i).b));
wait until rising_edge (CalculateVirCompensated_clock);
end loop;
for i in 0 to 1 loop
CalculateVirCompensated_addr <= std_logic_vector (to_unsigned (datao.middle(i).b, 10));
wait until rising_edge (CalculateVirCompensated_clock);
wait until rising_edge (CalculateVirCompensated_clock);
warning_neq_fp (CalculateVirCompensated_do, datao.middle(i).a, "middle " & integer'image (datao.middle(i).b));
wait until rising_edge (CalculateVirCompensated_clock);
end loop;
for i in 0 to 9 loop
CalculateVirCompensated_addr <= std_logic_vector (to_unsigned (datao.last(i).b, 10));
wait until rising_edge (CalculateVirCompensated_clock);
wait until rising_edge (CalculateVirCompensated_clock);
warning_neq_fp (CalculateVirCompensated_do, datao.last(i).a, "last " & integer'image (datao.last(i).b));
wait until rising_edge (CalculateVirCompensated_clock);
end loop;
--report "done at 807.345us";
report "done at 799.655us";
wait for 1 ps;
report "done" severity failure;
end process stim_proc;

CalculateVirCompensated_addfpclk <= CalculateVirCompensated_clock;
CalculateVirCompensated_subfpclk <= CalculateVirCompensated_clock;
CalculateVirCompensated_mulfpclk <= CalculateVirCompensated_clock;
CalculateVirCompensated_divfpclk <= CalculateVirCompensated_clock;

inst_divfp : divfp
PORT MAP (
a => CalculateVirCompensated_divfpa,
b => CalculateVirCompensated_divfpb,
operation_nd => CalculateVirCompensated_divfpond,
clk => CalculateVirCompensated_divfpclk,
sclr => CalculateVirCompensated_divfpsclr,
ce => CalculateVirCompensated_divfpce,
result => CalculateVirCompensated_divfpr,
rdy => CalculateVirCompensated_divfprdy
);

inst_mulfp : mulfp
PORT MAP (
a => CalculateVirCompensated_mulfpa,
b => CalculateVirCompensated_mulfpb,
operation_nd => CalculateVirCompensated_mulfpond,
clk => CalculateVirCompensated_mulfpclk,
sclr => CalculateVirCompensated_mulfpsclr,
ce => CalculateVirCompensated_mulfpce,
result => CalculateVirCompensated_mulfpr,
rdy => CalculateVirCompensated_mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => CalculateVirCompensated_addfpa,
b => CalculateVirCompensated_addfpb,
operation_nd => CalculateVirCompensated_addfpond,
clk => CalculateVirCompensated_addfpclk,
sclr => CalculateVirCompensated_addfpsclr,
ce => CalculateVirCompensated_addfpce,
result => CalculateVirCompensated_addfpr,
rdy => CalculateVirCompensated_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => CalculateVirCompensated_subfpa,
b => CalculateVirCompensated_subfpb,
operation_nd => CalculateVirCompensated_subfpond,
clk => CalculateVirCompensated_subfpclk,
sclr => CalculateVirCompensated_subfpsclr,
ce => CalculateVirCompensated_subfpce,
result => CalculateVirCompensated_subfpr,
rdy => CalculateVirCompensated_subfprdy
);

END ARCHITECTURE behavior;
