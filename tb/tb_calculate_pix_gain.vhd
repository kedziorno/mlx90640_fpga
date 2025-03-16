-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   18:17:42 02/11/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_calculate_pix_gain
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
--      fixed2float, mulfp, tb_i2c_mem
--    - Processes (Architecture: tb):
--      p_clock_process, p_tb
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

use work.global_package.all;

ENTITY tb_calculate_pix_gain IS
END tb_calculate_pix_gain;

ARCHITECTURE tb OF tb_calculate_pix_gain IS 

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

-- Component Declaration
component calculate_pix_gain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i_KGain : in std_logic_vector (31 downto 0);

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;

mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC
);
end component calculate_pix_gain;

signal calculate_pix_gain_clock : std_logic;
signal calculate_pix_gain_reset : std_logic;
signal calculate_pix_gain_run : std_logic;
signal calculate_pix_gain_i2c_mem_ena : STD_LOGIC;
signal calculate_pix_gain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculate_pix_gain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculate_pix_gain_KGain : std_logic_vector (31 downto 0);
signal calculate_pix_gain_do : std_logic_vector (31 downto 0);
signal calculate_pix_gain_addr : std_logic_vector (9 downto 0);
signal calculate_pix_gain_rdy : std_logic;

signal calculate_pix_gain_fixed2floata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal calculate_pix_gain_fixed2floatond : STD_LOGIC;
signal calculate_pix_gain_fixed2floatce : STD_LOGIC;
signal calculate_pix_gain_fixed2floatsclr : STD_LOGIC;
signal calculate_pix_gain_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pix_gain_fixed2floatrdy : STD_LOGIC;

signal calculate_pix_gain_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pix_gain_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pix_gain_mulfpond : STD_LOGIC;
signal calculate_pix_gain_mulfpce : STD_LOGIC;
signal calculate_pix_gain_mulfpsclr : STD_LOGIC;
signal calculate_pix_gain_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculate_pix_gain_mulfprdy : STD_LOGIC;

signal calculate_pix_gain_fixed2floatclk : std_logic;
signal calculate_pix_gain_mulfpclk : std_logic;

constant clockperiod : time := 10 ns;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (calculate_pix_gain_do); -- output data

tb_i2c_mem_i0 : tb_i2c_mem
PORT MAP (
clka => calculate_pix_gain_clock,
ena => calculate_pix_gain_i2c_mem_ena,
wea => "0",
addra => calculate_pix_gain_i2c_mem_addra,
dina => (others => '0'),
douta => calculate_pix_gain_i2c_mem_douta
);

p_clock_process : process is
begin
calculate_pix_gain_clock <= '0';
wait for clockperiod/2;
calculate_pix_gain_clock <= '1';
wait for clockperiod/2;
end process p_clock_process;

calculate_pix_gain_KGain <= x"3F81AC57"; -- 1.0130719
-- Component Instantiation
calculate_pix_gain_uut : calculate_pix_gain port map (
i_clock => calculate_pix_gain_clock,
i_reset => calculate_pix_gain_reset,
i_run => calculate_pix_gain_run,
i2c_mem_ena => calculate_pix_gain_i2c_mem_ena,
i2c_mem_addra => calculate_pix_gain_i2c_mem_addra,
i2c_mem_douta => calculate_pix_gain_i2c_mem_douta,
i_KGain => calculate_pix_gain_KGain,
o_do => calculate_pix_gain_do,
i_addr => calculate_pix_gain_addr,
o_rdy => calculate_pix_gain_rdy,

fixed2floata => calculate_pix_gain_fixed2floata,
fixed2floatond => calculate_pix_gain_fixed2floatond,
fixed2floatce => calculate_pix_gain_fixed2floatce,
fixed2floatsclr => calculate_pix_gain_fixed2floatsclr,
fixed2floatr => calculate_pix_gain_fixed2floatr,
fixed2floatrdy => calculate_pix_gain_fixed2floatrdy,

mulfpa => calculate_pix_gain_mulfpa,
mulfpb => calculate_pix_gain_mulfpb,
mulfpond => calculate_pix_gain_mulfpond,
mulfpce => calculate_pix_gain_mulfpce,
mulfpsclr => calculate_pix_gain_mulfpsclr,
mulfpr => calculate_pix_gain_mulfpr,
mulfprdy => calculate_pix_gain_mulfprdy
);

--  Test Bench Statements
p_tb : PROCESS
BEGIN
calculate_pix_gain_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
calculate_pix_gain_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod*10;
calculate_pix_gain_run <= '1'; wait for clockperiod; calculate_pix_gain_run <= '0';
wait until calculate_pix_gain_rdy = '1';
--report "rdy at 200.515us";
--report "rdy at 192.815us";
--report "rdy at 200.465us";
report "rdy at 193.075us - rm states,rm reg";
for i in 0 to 1024 loop
	calculate_pix_gain_addr <= std_logic_vector (to_unsigned (i, 10));
-- DO after 2 cycles
-- +--------------------------------------------------------------------------------------------------------------------+
-- |                |-ADDRESS-------------------------------------------+                                               |
-- |                                          |-DATA----------------------------------------------+                     |
-- |___              ____________              ____________              ____________              ____________         |
-- |   \____________/            \____________/            \____________/            \____________/            \________|
-- |_______________   _________________________________________________   ______________________________________________|
-- |               \ /                                                 \ /                                              |
-- | PIXGAIN_ADDR-1 X                    PIXGAIN_ADDR                   X                   PIXGAIN_ADDR+1              |
-- |_______________/ \_________________________________________________/ \______________________________________________|
-- |_________________________________________   _________________________________________________   ____________________|
-- |                                         \ /                                                 \ /                    |
-- |            PIXGAIN_DO PREV               X                   PIXGAIN_DO CURR                 X     PIXGAIN_DO NEXT |
-- |_________________________________________/ \_________________________________________________/ \____________________|
-- +--------------------------------------------------------------------------------------------------------------------+
--
if (i = 0)   then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c2d0b15c", "pixgain do 0 - bad val for prj"); end if; -- XXX first pix have bad value
if (i = 2)   then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c299fca7", "pixgain do 2"); end if;
if (i = 4)   then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c29c0359", "pixgain do 4"); end if;
if (i = 6)   then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c295ef45", "pixgain do 6"); end if;
if (i = 8)   then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c29e0a0a", "pixgain do 8"); end if;
if (i = 10)  then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c299fca7", "pixgain do 10"); end if;
if (i = 383) then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c2ceaaab", "pixgain do 383 - mid pix"); end if; -- XXX middle pix
if (i = 384) then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c2a624cf", "pixgain do 384 - mid pix+1"); end if; -- XXX middle pix + 1
if (i = 759) then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c2e6fafb", "pixgain do 759"); end if;
if (i = 761) then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c2dcd984", "pixgain do 761"); end if;
if (i = 763) then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c2c89697", "pixgain do 763"); end if;
if (i = 765) then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c2c89697", "pixgain do 765"); end if;
if (i = 767) then wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); warning_neq_fp (calculate_pix_gain_do, x"c2d0b15c", "pixgain do 767 - last pix"); end if;
wait until rising_edge (calculate_pix_gain_clock); wait until rising_edge (calculate_pix_gain_clock); -- XXX can be disabled, then _addr depend on i condition and dont have slide
end loop;
wait for 1 ps; -- must be for write
--report "end at 210.765us";
--report "end at 767 is 208.385us";
--report "end at 767 is 216.045us";
report "end at 213.835us - rm states,rm reg";
report "done" severity failure;
END PROCESS p_tb;
--  End Test Bench 

calculate_pix_gain_fixed2floatclk <= calculate_pix_gain_clock;
calculate_pix_gain_mulfpclk <= calculate_pix_gain_clock;

fixed2float_i0 : fixed2float
PORT MAP (
a => calculate_pix_gain_fixed2floata,
operation_nd => calculate_pix_gain_fixed2floatond,
clk => calculate_pix_gain_fixed2floatclk,
sclr => calculate_pix_gain_fixed2floatsclr,
ce => calculate_pix_gain_fixed2floatce,
result => calculate_pix_gain_fixed2floatr,
rdy => calculate_pix_gain_fixed2floatrdy
);

mulfp_i0 : mulfp
PORT MAP (
a => calculate_pix_gain_mulfpa,
b => calculate_pix_gain_mulfpb,
operation_nd => calculate_pix_gain_mulfpond,
clk => calculate_pix_gain_mulfpclk,
sclr => calculate_pix_gain_mulfpsclr,
ce => calculate_pix_gain_mulfpce,
result => calculate_pix_gain_mulfpr,
rdy => calculate_pix_gain_mulfprdy
);

end architecture tb;

