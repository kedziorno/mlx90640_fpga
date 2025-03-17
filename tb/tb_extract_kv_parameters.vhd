-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   16:57:28 01/29/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_extract_kv_parameters
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
--      tb_i2c_mem, divfp
--    - Processes (Architecture: tb):
--      p_clock_process, p_tb
--
-- Important objects:
--  - tb_i2c_mem, rom_constants
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos: -
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones:
-- (...)
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

use work.global_package.all;

ENTITY tb_extract_kv_parameters IS
END tb_extract_kv_parameters;

ARCHITECTURE tb OF tb_extract_kv_parameters IS 

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
component extract_kv_parameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

signal i2c_mem_ena : out STD_LOGIC;
signal i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

signal o_2powx_4bit_ena : out std_logic;
signal o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
signal o_signed4bit_ena : out std_logic;
signal o_signed4bit_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC
);
end component extract_kv_parameters;
signal extract_kv_parameters_clock : std_logic;
signal extract_kv_parameters_reset : std_logic;
signal extract_kv_parameters_run : std_logic;
signal extract_kv_parameters_i2c_mem_ena : STD_LOGIC;
signal extract_kv_parameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal extract_kv_parameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal extract_kv_parameters_do : std_logic_vector (31 downto 0);
signal extract_kv_parameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal extract_kv_parameters_rdy : std_logic;
signal extract_kv_parameters_2powx_4bit_ena : std_logic;
signal extract_kv_parameters_2powx_4bit_adr : std_logic_vector (3 downto 0);
signal extract_kv_parameters_signed4bit_ena : std_logic;
signal extract_kv_parameters_signed4bit_adr : std_logic_vector (3 downto 0);
signal extract_kv_parameters_rom_constants_float : std_logic_vector (31 downto 0);
signal extract_kv_parameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_kv_parameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_kv_parameters_divfpond : STD_LOGIC;
signal extract_kv_parameters_divfpsclr : STD_LOGIC;
signal extract_kv_parameters_divfpce : STD_LOGIC;
signal extract_kv_parameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal extract_kv_parameters_divfprdy : STD_LOGIC;

signal extract_kv_parameters_divfpclk : std_logic;

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

out1r <= ap_slv2fp (extract_kv_parameters_do); -- output data

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => extract_kv_parameters_clock,
ena => extract_kv_parameters_i2c_mem_ena,
wea => "0",
addra => extract_kv_parameters_i2c_mem_addra,
dina => (others => '0'),
douta => extract_kv_parameters_i2c_mem_douta
);

-- Instantiate the Unit Under Test (UUT)
extract_kv_parameters_uut: extract_kv_parameters PORT MAP (
i_clock => extract_kv_parameters_clock,
i_reset => extract_kv_parameters_reset,
i_run => extract_kv_parameters_run,

o_do => extract_kv_parameters_do,
i_addr => extract_kv_parameters_addr,
o_rdy => extract_kv_parameters_rdy,

i2c_mem_ena => extract_kv_parameters_i2c_mem_ena,
i2c_mem_addra => extract_kv_parameters_i2c_mem_addra,
i2c_mem_douta => extract_kv_parameters_i2c_mem_douta,

o_2powx_4bit_ena => extract_kv_parameters_2powx_4bit_ena,
o_2powx_4bit_adr => extract_kv_parameters_2powx_4bit_adr,
o_signed4bit_ena => extract_kv_parameters_signed4bit_ena,
o_signed4bit_adr => extract_kv_parameters_signed4bit_adr,
i_rom_constants_float => extract_kv_parameters_rom_constants_float,

divfpa => extract_kv_parameters_divfpa,
divfpb => extract_kv_parameters_divfpb,
divfpond => extract_kv_parameters_divfpond,
divfpsclr => extract_kv_parameters_divfpsclr,
divfpce => extract_kv_parameters_divfpce,
divfpr => extract_kv_parameters_divfpr,
divfprdy => extract_kv_parameters_divfprdy
);

-- Clock process definitions
p_clock_process :process
begin
extract_kv_parameters_clock <= '0';
wait for i_clock_period/2;
extract_kv_parameters_clock <= '1';
wait for i_clock_period/2;
end process p_clock_process;

extract_kv_parameters_reset <= '1', '0' after 100 ns ;	

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
-- XXX data from ExtractKvParameters
constant datao : datar := (
first => ( -- XXX beginig from 0x3ec00000
(a => x"3ec00000", b => 30),
(a => x"3ec00000", b => 31),
(a => x"3ec00000", b => 32),
(a => x"3ee00000", b => 33),
(a => x"3ec00000", b => 34),
(a => x"3ee00000", b => 35),
(a => x"3ec00000", b => 36),
(a => x"3ee00000", b => 37),
(a => x"3ec00000", b => 38),
(a => x"3ee00000", b => 39)
),
middle => (
(a => x"3ec00000", b => 382),
(a => x"3ee00000", b => 383)
),
last => (
(a => x"3ec00000", b => 758),
(a => x"3ee00000", b => 759),
(a => x"3ec00000", b => 760),
(a => x"3ee00000", b => 761),
(a => x"3ec00000", b => 762),
(a => x"3ee00000", b => 763),
(a => x"3ec00000", b => 764),
(a => x"3ee00000", b => 765),
(a => x"3ec00000", b => 766),
(a => x"3ee00000", b => 767)
)
);
begin
-- hold reset state for 100 ns.
wait for 105 ns;
-- insert stimulus here
extract_kv_parameters_run <= '1'; wait for i_clock_period; extract_kv_parameters_run <= '0';
wait until extract_kv_parameters_rdy = '1';
--report "rdy at 315.235us";
--report "rdy at 261.515us";
report "rdy at 261.285us";
for i in 0 to 9 loop
extract_kv_parameters_addr <= std_logic_vector (to_unsigned (datao.first(i).b, 10));
wait until rising_edge (extract_kv_parameters_clock);
wait until rising_edge (extract_kv_parameters_clock);
warning_neq_fp (extract_kv_parameters_do, datao.first(i).a, "first " & integer'image (datao.first(i).b));
wait until rising_edge (extract_kv_parameters_clock);
end loop;
for i in 0 to 1 loop
extract_kv_parameters_addr <= std_logic_vector (to_unsigned (datao.middle(i).b, 10));
wait until rising_edge (extract_kv_parameters_clock);
wait until rising_edge (extract_kv_parameters_clock);
warning_neq_fp (extract_kv_parameters_do, datao.middle(i).a, "middle " & integer'image (datao.middle(i).b));
wait until rising_edge (extract_kv_parameters_clock);
end loop;
for i in 0 to 9 loop -- XXX last_9 is OK here (tb_CalculateAlphaComp)
extract_kv_parameters_addr <= std_logic_vector (to_unsigned (datao.last(i).b, 10));
wait until rising_edge (extract_kv_parameters_clock);
wait until rising_edge (extract_kv_parameters_clock);
warning_neq_fp (extract_kv_parameters_do, datao.last(i).a, "last " & integer'image (datao.last(i).b));
wait until rising_edge (extract_kv_parameters_clock);
end loop;
wait for 1 ps; -- must be for write
--report "end at 336.385us";
--report "end at 282.665us";
report "end at 261.945us";
report "done" severity failure;
end process p_tb;

extract_kv_parameters_divfpclk <= extract_kv_parameters_clock;
divfp_i0 : divfp
PORT MAP (
a => extract_kv_parameters_divfpa,
b => extract_kv_parameters_divfpb,
operation_nd => extract_kv_parameters_divfpond,
clk => extract_kv_parameters_divfpclk,
sclr => extract_kv_parameters_divfpsclr,
ce => extract_kv_parameters_divfpce,
result => extract_kv_parameters_divfpr,
rdy => extract_kv_parameters_divfprdy
);

rom_constants_i0 : rom_constants PORT MAP (
i_clock => extract_kv_parameters_clock,
i_reset => extract_kv_parameters_reset,
i_kvptat_en => '0',
i_kvptat_adr => (others => '0'),
i_alphaptat_en => '0',
i_alphaptat_adr => (others => '0'),
i_signed4bit_en => extract_kv_parameters_signed4bit_ena,
i_signed4bit_adr => extract_kv_parameters_signed4bit_adr,
i_signed6bit_en => '0',
i_signed6bit_adr => (others => '0'),
i_alphascale_1_en => '0',
i_alphascale_1_adr => (others => '0'),
i_2powx_4bit_en => extract_kv_parameters_2powx_4bit_ena,
i_2powx_4bit_adr => extract_kv_parameters_2powx_4bit_adr,
i_cpratio_en => '0',
i_cpratio_adr => (others => '0'),
i_alphascale_2_en => '0',
i_alphascale_2_adr => (others => '0'),
i_2powx_p8_4bit_en => '0',
i_2powx_p8_4bit_adr => (others => '0'),
i_signed3bit_en => '0',
i_signed3bit_adr => (others => '0'),
o_float => extract_kv_parameters_rom_constants_float
);

end architecture tb;

