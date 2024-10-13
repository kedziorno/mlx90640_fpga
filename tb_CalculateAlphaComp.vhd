--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:36:12 02/18/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_CalculateAlphaComp.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CalculateAlphaComp
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

ENTITY tb_CalculateAlphaComp IS
END tb_CalculateAlphaComp;

ARCHITECTURE behavior OF tb_CalculateAlphaComp IS 

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

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT CalculateAlphaComp
PORT(
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_Ta : in std_logic_vector (31 downto 0);
i_acpsubpage0 : in std_logic_vector (31 downto 0);
i_acpsubpage1 : in std_logic_vector (31 downto 0);
i_tgc : in std_logic_vector (31 downto 0);

i_alpha_do : in std_logic_vector (31 downto 0);
o_alpha_addr : out std_logic_vector (9 downto 0); -- 10bit-1024

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

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

signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC
);
END COMPONENT;
signal CalculateAlphaComp_clock : std_logic := '0';
signal CalculateAlphaComp_reset : std_logic := '0';
signal CalculateAlphaComp_run : std_logic := '0';
signal CalculateAlphaComp_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateAlphaComp_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage0 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage1 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_tgc : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_alpha_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_addr : std_logic_vector(9 downto 0) := (others => '0');
signal CalculateAlphaComp_i2c_mem_ena : std_logic;
signal CalculateAlphaComp_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateAlphaComp_alpha_addr : std_logic_vector(9 downto 0);
signal CalculateAlphaComp_do : std_logic_vector(31 downto 0);
signal CalculateAlphaComp_rdy : std_logic;
signal CalculateAlphaComp_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_mulfpond : STD_LOGIC;
signal CalculateAlphaComp_mulfpsclr : STD_LOGIC;
signal CalculateAlphaComp_mulfpce : STD_LOGIC;
signal CalculateAlphaComp_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_mulfprdy : STD_LOGIC;
signal CalculateAlphaComp_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_divfpond : STD_LOGIC;
signal CalculateAlphaComp_divfpsclr : STD_LOGIC;
signal CalculateAlphaComp_divfpce : STD_LOGIC;
signal CalculateAlphaComp_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_divfprdy : STD_LOGIC;
signal CalculateAlphaComp_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_addfpond : STD_LOGIC;
signal CalculateAlphaComp_addfpsclr : STD_LOGIC;
signal CalculateAlphaComp_addfpce : STD_LOGIC;
signal CalculateAlphaComp_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_addfprdy : STD_LOGIC;
signal CalculateAlphaComp_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_subfpond : STD_LOGIC;
signal CalculateAlphaComp_subfpsclr : STD_LOGIC;
signal CalculateAlphaComp_subfpce : STD_LOGIC;
signal CalculateAlphaComp_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_subfprdy : STD_LOGIC;
signal CalculateAlphaComp_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculateAlphaComp_fixed2floatond : STD_LOGIC;
signal CalculateAlphaComp_fixed2floatsclr : STD_LOGIC;
signal CalculateAlphaComp_fixed2floatce : STD_LOGIC;
signal CalculateAlphaComp_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_fixed2floatrdy : STD_LOGIC;

signal CalculateAlphaComp_mulfpclk : std_logic;
signal CalculateAlphaComp_divfpclk : std_logic;
signal CalculateAlphaComp_addfpclk : std_logic;
signal CalculateAlphaComp_subfpclk : std_logic;
signal CalculateAlphaComp_fixed2floatclk : std_logic;

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

out1r <= ap_slv2fp (CalculateAlphaComp_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => CalculateAlphaComp_clock,
ena => CalculateAlphaComp_i2c_mem_ena,
wea => "0",
addra => CalculateAlphaComp_i2c_mem_addra,
dina => (others => '0'),
douta => CalculateAlphaComp_i2c_mem_douta
);

CalculateAlphaComp_tgc <= x"00000000";
-- Instantiate the Unit Under Test (UUT)
uut: CalculateAlphaComp PORT MAP (
i_clock => CalculateAlphaComp_clock,
i_reset => CalculateAlphaComp_reset,
i_run => CalculateAlphaComp_run,
i2c_mem_ena => CalculateAlphaComp_i2c_mem_ena,
i2c_mem_addra => CalculateAlphaComp_i2c_mem_addra,
i2c_mem_douta => CalculateAlphaComp_i2c_mem_douta,
i_Ta => CalculateAlphaComp_Ta,
i_acpsubpage0 => CalculateAlphaComp_acpsubpage0,
i_acpsubpage1 => CalculateAlphaComp_acpsubpage1,
i_tgc => CalculateAlphaComp_tgc,
i_alpha_do => CalculateAlphaComp_alpha_do,
o_alpha_addr => CalculateAlphaComp_alpha_addr,
o_do => CalculateAlphaComp_do,
i_addr => CalculateAlphaComp_addr,
o_rdy => CalculateAlphaComp_rdy,

mulfpa => CalculateAlphaComp_mulfpa,
mulfpb => CalculateAlphaComp_mulfpb,
mulfpond => CalculateAlphaComp_mulfpond,
mulfpsclr => CalculateAlphaComp_mulfpsclr,
mulfpce => CalculateAlphaComp_mulfpce,
mulfpr => CalculateAlphaComp_mulfpr,
mulfprdy => CalculateAlphaComp_mulfprdy,

divfpa => CalculateAlphaComp_divfpa,
divfpb => CalculateAlphaComp_divfpb,
divfpond => CalculateAlphaComp_divfpond,
divfpsclr => CalculateAlphaComp_divfpsclr,
divfpce => CalculateAlphaComp_divfpce,
divfpr => CalculateAlphaComp_divfpr,
divfprdy => CalculateAlphaComp_divfprdy,

addfpa => CalculateAlphaComp_addfpa,
addfpb => CalculateAlphaComp_addfpb,
addfpond => CalculateAlphaComp_addfpond,
addfpsclr => CalculateAlphaComp_addfpsclr,
addfpce => CalculateAlphaComp_addfpce,
addfpr => CalculateAlphaComp_addfpr,
addfprdy => CalculateAlphaComp_addfprdy,

subfpa => CalculateAlphaComp_subfpa,
subfpb => CalculateAlphaComp_subfpb,
subfpond => CalculateAlphaComp_subfpond,
subfpsclr => CalculateAlphaComp_subfpsclr,
subfpce => CalculateAlphaComp_subfpce,
subfpr => CalculateAlphaComp_subfpr,
subfprdy => CalculateAlphaComp_subfprdy,

fixed2floata => CalculateAlphaComp_fixed2floata,
fixed2floatond => CalculateAlphaComp_fixed2floatond,
fixed2floatsclr => CalculateAlphaComp_fixed2floatsclr,
fixed2floatce => CalculateAlphaComp_fixed2floatce,
fixed2floatr => CalculateAlphaComp_fixed2floatr,
fixed2floatrdy => CalculateAlphaComp_fixed2floatrdy

);

-- Clock process definitions
i_clock_process :process
begin
CalculateAlphaComp_clock <= '0';
wait for i_clock_period/2;
CalculateAlphaComp_clock <= '1';
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
CalculateAlphaComp_reset <= '1';
wait for 100 ns;
CalculateAlphaComp_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
CalculateAlphaComp_Ta <= x"4207F54D";
CalculateAlphaComp_acpsubpage0 <= x"31460000";
CalculateAlphaComp_acpsubpage1 <= x"31478C00";
wait for i_clock_period;
CalculateAlphaComp_run <= '1'; wait for i_clock_period; CalculateAlphaComp_run <= '0';
report "before loop";
  for i in 0 to 1023 loop
    for k in 0 to 9 loop
      if CalculateAlphaComp_alpha_addr = std_logic_vector (to_unsigned (data.first(k).b, 10)) then
        CalculateAlphaComp_alpha_do <= data.first(k).a;
      end if;
    end loop;
    for k in 0 to 1 loop
      if CalculateAlphaComp_alpha_addr = std_logic_vector (to_unsigned (data.middle(k).b, 10)) then
        CalculateAlphaComp_alpha_do <= data.middle(k).a;
      end if;
    end loop;
    for k in 0 to 9 loop
      if CalculateAlphaComp_alpha_addr = std_logic_vector (to_unsigned (data.last(k).b, 10)) then
        CalculateAlphaComp_alpha_do <= data.last(k).a;
      end if;
    end loop;
    wait for 1.910us; -- XXX the same as CalculateAlphaComp wait for data from ExtractAlphaParameters MEM
  end loop;
report "after loop";
--wait until CalculateAlphaComp_rdy = '1';
--report "rdy at 645.945us";
--report "rdy at 599.795us";
--report "rdy at 599.815us";
--report "rdy at 599.755us";
report "rdy 767 at 1144.615us - rm all regs";
  for i in 0 to 9 loop
    CalculateAlphaComp_addr <= std_logic_vector (to_unsigned (datao.first(i).b, 10));
    wait until rising_edge (CalculateAlphaComp_clock);
    wait until rising_edge (CalculateAlphaComp_clock);
    warning_neq_fp (CalculateAlphaComp_do, datao.first(i).a, "first " & integer'image (datao.first(i).b));
    wait until rising_edge (CalculateAlphaComp_clock);
  end loop;
  for i in 0 to 1 loop
    CalculateAlphaComp_addr <= std_logic_vector (to_unsigned (datao.middle(i).b, 10));
    wait until rising_edge (CalculateAlphaComp_clock);
    wait until rising_edge (CalculateAlphaComp_clock);
    warning_neq_fp (CalculateAlphaComp_do, datao.middle(i).a, "middle " & integer'image (datao.middle(i).b));
    wait until rising_edge (CalculateAlphaComp_clock);
  end loop;
  for i in 0 to 8 loop -- XXX last_9 is not available, rest above values is OK
    CalculateAlphaComp_addr <= std_logic_vector (to_unsigned (datao.last(i).b, 10));
    wait until rising_edge (CalculateAlphaComp_clock);
    wait until rising_edge (CalculateAlphaComp_clock);
    warning_neq_fp (CalculateAlphaComp_do, datao.last(i).a, "last " & integer'image (datao.last(i).b));
    wait until rising_edge (CalculateAlphaComp_clock);
  end loop;
  CalculateAlphaComp_addr <= std_logic_vector (to_unsigned (datao.last(9).b, 10));
  wait until rising_edge (CalculateAlphaComp_clock);
  wait until rising_edge (CalculateAlphaComp_clock);
  warning_neq_fp (CalculateAlphaComp_do, datao.last(9).a, "last " & integer'image (datao.last(9).b) & " not available - fix it");
wait for 1 ps;
-- XXX outputs differ around e-9 and e-10 (output have e-8)
--report "end at 666.445us";
--report "end at 620.295us";
--report "end at 600.465us";
--report "end at 600.405us";
report "end at 1403.745us - rm all regs";
report "done" severity failure;
end process;

CalculateAlphaComp_mulfpclk <= CalculateAlphaComp_clock;
CalculateAlphaComp_divfpclk <= CalculateAlphaComp_clock;
CalculateAlphaComp_addfpclk <= CalculateAlphaComp_clock;
CalculateAlphaComp_subfpclk <= CalculateAlphaComp_clock;
CalculateAlphaComp_fixed2floatclk <= CalculateAlphaComp_clock;

inst_mulfp : mulfp
PORT MAP (
a => CalculateAlphaComp_mulfpa,
b => CalculateAlphaComp_mulfpb,
operation_nd => CalculateAlphaComp_mulfpond,
clk => CalculateAlphaComp_mulfpclk,
sclr => CalculateAlphaComp_mulfpsclr,
ce => CalculateAlphaComp_mulfpce,
result => CalculateAlphaComp_mulfpr,
rdy => CalculateAlphaComp_mulfprdy
);

inst_divfp : divfp
PORT MAP (
a => CalculateAlphaComp_divfpa,
b => CalculateAlphaComp_divfpb,
operation_nd => CalculateAlphaComp_divfpond,
clk => CalculateAlphaComp_divfpclk,
sclr => CalculateAlphaComp_divfpsclr,
ce => CalculateAlphaComp_divfpce,
result => CalculateAlphaComp_divfpr,
rdy => CalculateAlphaComp_divfprdy
);

inst_addfp : addfp
PORT MAP (
a => CalculateAlphaComp_addfpa,
b => CalculateAlphaComp_addfpb,
operation_nd => CalculateAlphaComp_addfpond,
clk => CalculateAlphaComp_addfpclk,
sclr => CalculateAlphaComp_addfpsclr,
ce => CalculateAlphaComp_addfpce,
result => CalculateAlphaComp_addfpr,
rdy => CalculateAlphaComp_addfprdy
);

inst_subfp : subfp
PORT MAP (
a => CalculateAlphaComp_subfpa,
b => CalculateAlphaComp_subfpb,
operation_nd => CalculateAlphaComp_subfpond,
clk => CalculateAlphaComp_subfpclk,
sclr => CalculateAlphaComp_subfpsclr,
ce => CalculateAlphaComp_subfpce,
result => CalculateAlphaComp_subfpr,
rdy => CalculateAlphaComp_subfprdy
);

inst_fixed2float : fixed2float
PORT MAP (
a => CalculateAlphaComp_fixed2floata,
operation_nd => CalculateAlphaComp_fixed2floatond,
clk => CalculateAlphaComp_fixed2floatclk,
sclr => CalculateAlphaComp_fixed2floatsclr,
ce => CalculateAlphaComp_fixed2floatce,
result => CalculateAlphaComp_fixed2floatr,
rdy => CalculateAlphaComp_fixed2floatrdy
);

END;
