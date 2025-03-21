--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:28 01/29/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractKvParameters.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractKvParameters
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

ENTITY tb_ExtractKvParameters IS
END tb_ExtractKvParameters;

ARCHITECTURE behavior OF tb_ExtractKvParameters IS 

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
component ExtractKvParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

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
end component ExtractKvParameters;
signal ExtractKvParameters_clock : std_logic;
signal ExtractKvParameters_reset : std_logic;
signal ExtractKvParameters_run : std_logic;
signal ExtractKvParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractKvParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKvParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKvParameters_do : std_logic_vector (31 downto 0);
signal ExtractKvParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractKvParameters_rdy : std_logic;
signal ExtractKvParameters_2powx_4bit_ena : std_logic;
signal ExtractKvParameters_2powx_4bit_adr : std_logic_vector (3 downto 0);
signal ExtractKvParameters_signed4bit_ena : std_logic;
signal ExtractKvParameters_signed4bit_adr : std_logic_vector (3 downto 0);
signal ExtractKvParameters_rom_constants_float : std_logic_vector (31 downto 0);
signal ExtractKvParameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKvParameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKvParameters_divfpond : STD_LOGIC;
signal ExtractKvParameters_divfpsclr : STD_LOGIC;
signal ExtractKvParameters_divfpce : STD_LOGIC;
signal ExtractKvParameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractKvParameters_divfprdy : STD_LOGIC;

signal ExtractKvParameters_divfpclk : std_logic;

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

out1r <= ap_slv2fp (ExtractKvParameters_do); -- output data

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => ExtractKvParameters_clock,
ena => ExtractKvParameters_i2c_mem_ena,
wea => "0",
addra => ExtractKvParameters_i2c_mem_addra,
dina => (others => '0'),
douta => ExtractKvParameters_i2c_mem_douta
);
-- Instantiate the Unit Under Test (UUT)
uut: ExtractKvParameters PORT MAP (
i_clock => ExtractKvParameters_clock,
i_reset => ExtractKvParameters_reset,
i_run => ExtractKvParameters_run,

i2c_mem_ena => ExtractKvParameters_i2c_mem_ena,
i2c_mem_addra => ExtractKvParameters_i2c_mem_addra,
i2c_mem_douta => ExtractKvParameters_i2c_mem_douta,

o_do => ExtractKvParameters_do,
i_addr => ExtractKvParameters_addr,
o_rdy => ExtractKvParameters_rdy,

o_2powx_4bit_ena => ExtractKvParameters_2powx_4bit_ena,
o_2powx_4bit_adr => ExtractKvParameters_2powx_4bit_adr,
o_signed4bit_ena => ExtractKvParameters_signed4bit_ena,
o_signed4bit_adr => ExtractKvParameters_signed4bit_adr,
i_rom_constants_float => ExtractKvParameters_rom_constants_float,

divfpa => ExtractKvParameters_divfpa,
divfpb => ExtractKvParameters_divfpb,
divfpond => ExtractKvParameters_divfpond,
divfpsclr => ExtractKvParameters_divfpsclr,
divfpce => ExtractKvParameters_divfpce,
divfpr => ExtractKvParameters_divfpr,
divfprdy => ExtractKvParameters_divfprdy

);

-- Clock process definitions
i_clock_process :process
begin
ExtractKvParameters_clock <= '0';
wait for i_clock_period/2;
ExtractKvParameters_clock <= '1';
wait for i_clock_period/2;
end process;

ExtractKvParameters_reset <= '1', '0' after 100 ns ;	

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
ExtractKvParameters_run <= '1'; wait for i_clock_period; ExtractKvParameters_run <= '0';
wait until ExtractKvParameters_rdy = '1';
--report "rdy at 315.235us";
--report "rdy at 261.515us";
report "rdy at 261.285us";
for i in 0 to 9 loop
ExtractKvParameters_addr <= std_logic_vector (to_unsigned (datao.first(i).b, 10));
wait until rising_edge (ExtractKvParameters_clock);
wait until rising_edge (ExtractKvParameters_clock);
warning_neq_fp (ExtractKvParameters_do, datao.first(i).a, "first " & integer'image (datao.first(i).b));
wait until rising_edge (ExtractKvParameters_clock);
end loop;
for i in 0 to 1 loop
ExtractKvParameters_addr <= std_logic_vector (to_unsigned (datao.middle(i).b, 10));
wait until rising_edge (ExtractKvParameters_clock);
wait until rising_edge (ExtractKvParameters_clock);
warning_neq_fp (ExtractKvParameters_do, datao.middle(i).a, "middle " & integer'image (datao.middle(i).b));
wait until rising_edge (ExtractKvParameters_clock);
end loop;
for i in 0 to 9 loop -- XXX last_9 is OK here (tb_CalculateAlphaComp)
ExtractKvParameters_addr <= std_logic_vector (to_unsigned (datao.last(i).b, 10));
wait until rising_edge (ExtractKvParameters_clock);
wait until rising_edge (ExtractKvParameters_clock);
warning_neq_fp (ExtractKvParameters_do, datao.last(i).a, "last " & integer'image (datao.last(i).b));
wait until rising_edge (ExtractKvParameters_clock);
end loop;
wait for 1 ps; -- must be for write
--report "end at 336.385us";
--report "end at 282.665us";
report "end at 261.945us";
report "done" severity failure;
end process;

ExtractKvParameters_divfpclk <= ExtractKvParameters_clock;
inst_divfp : divfp
PORT MAP (
a => ExtractKvParameters_divfpa,
b => ExtractKvParameters_divfpb,
operation_nd => ExtractKvParameters_divfpond,
clk => ExtractKvParameters_divfpclk,
sclr => ExtractKvParameters_divfpsclr,
ce => ExtractKvParameters_divfpce,
result => ExtractKvParameters_divfpr,
rdy => ExtractKvParameters_divfprdy
);

inst_rom_constants : rom_constants PORT MAP (
i_clock => ExtractKvParameters_clock,
i_reset => ExtractKvParameters_reset,
i_kvptat_en => '0',
i_kvptat_adr => (others => '0'),
i_alphaptat_en => '0',
i_alphaptat_adr => (others => '0'),
i_signed4bit_en => ExtractKvParameters_signed4bit_ena,
i_signed4bit_adr => ExtractKvParameters_signed4bit_adr,
i_signed6bit_en => '0',
i_signed6bit_adr => (others => '0'),
i_alphascale_1_en => '0',
i_alphascale_1_adr => (others => '0'),
i_2powx_4bit_en => ExtractKvParameters_2powx_4bit_ena,
i_2powx_4bit_adr => ExtractKvParameters_2powx_4bit_adr,
i_cpratio_en => '0',
i_cpratio_adr => (others => '0'),
i_alphascale_2_en => '0',
i_alphascale_2_adr => (others => '0'),
i_2powx_p8_4bit_en => '0',
i_2powx_p8_4bit_adr => (others => '0'),
i_signed3bit_en => '0',
i_signed3bit_adr => (others => '0'),
o_float => ExtractKvParameters_rom_constants_float
);

END;
