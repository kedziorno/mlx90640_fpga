--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:59:32 01/25/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/melexis_mlx90641/tb_ExtractKsToScaleParameter.vhd
-- Project Name:  melexis_mlx90641
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtractKsToScaleParameter
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
--USE ieee.numeric_std.ALL;

use work.p_fphdl_package3.all;

ENTITY tb_ExtractKsToScaleParameter IS
END tb_ExtractKsToScaleParameter;

ARCHITECTURE behavior OF tb_ExtractKsToScaleParameter IS

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
COMPONENT ExtractKsToScaleParameter
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_2powx_p8_ena : out std_logic;
o_2powx_p8_adr : out std_logic_vector (3 downto 0);
i_rom_constants_float : in std_logic_vector (31 downto 0);
o_kstoscale : OUT  std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
END COMPONENT;
signal ExtractKsToScaleParameter_clock : std_logic;
signal ExtractKsToScaleParameter_reset : std_logic;
signal ExtractKsToScaleParameter_run : std_logic;
signal ExtractKsToScaleParameter_i2c_mem_ena : STD_LOGIC;
signal ExtractKsToScaleParameter_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractKsToScaleParameter_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractKsToScaleParameter_2powx_p8_ena : std_logic;
signal ExtractKsToScaleParameter_2powx_p8_adr : std_logic_vector (3 downto 0);
signal ExtractKsToScaleParameter_rom_constants_float : std_logic_vector (31 downto 0);
signal ExtractKsToScaleParameter_kstoscale : std_logic_vector (31 downto 0);
signal ExtractKsToScaleParameter_rdy : std_logic;

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

BEGIN

inst_tb_i2c_mem : tb_i2c_mem
PORT MAP (
clka => ExtractKsToScaleParameter_clock,
ena => ExtractKsToScaleParameter_i2c_mem_ena,
wea => "0",
addra => ExtractKsToScaleParameter_i2c_mem_addra,
dina => (others => '0'),
douta => ExtractKsToScaleParameter_i2c_mem_douta
);

-- Instantiate the Unit Under Test (UUT)
uut: ExtractKsToScaleParameter port map (
i_clock => ExtractKsToScaleParameter_clock,
i_reset => ExtractKsToScaleParameter_reset,
i_run => ExtractKsToScaleParameter_run,
i2c_mem_ena => ExtractKsToScaleParameter_i2c_mem_ena,
i2c_mem_addra => ExtractKsToScaleParameter_i2c_mem_addra,
i2c_mem_douta => ExtractKsToScaleParameter_i2c_mem_douta,
o_2powx_p8_ena => ExtractKsToScaleParameter_2powx_p8_ena,
o_2powx_p8_adr => ExtractKsToScaleParameter_2powx_p8_adr,
i_rom_constants_float => ExtractKsToScaleParameter_rom_constants_float,
o_kstoscale => ExtractKsToScaleParameter_kstoscale,
o_rdy => ExtractKsToScaleParameter_rdy
);

-- Clock process definitions
i_clock_process :process
begin
ExtractKsToScaleParameter_clock <= '0';
wait for i_clock_period/2;
ExtractKsToScaleParameter_clock <= '1';
wait for i_clock_period/2;
end process;


-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
ExtractKsToScaleParameter_reset <= '1';
wait for 100 ns;
ExtractKsToScaleParameter_reset <= '0';
wait for i_clock_period*10;
-- insert stimulus here
ExtractKsToScaleParameter_run <= '1'; wait for i_clock_period; ExtractKsToScaleParameter_run <= '0';
wait until ExtractKsToScaleParameter_rdy = '1';
--report "rdy at 0.265us";
report "rdy at 0.245us";
warning_neq_fp (ExtractKsToScaleParameter_kstoscale, x"49000000", "kstoscale");
wait for 1 ps;
report "done" severity failure;
end process;

inst_rom_constants : rom_constants PORT MAP (
i_clock => ExtractKsToScaleParameter_clock,
i_reset => ExtractKsToScaleParameter_reset,
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
i_2powx_p8_4bit_en => ExtractKsToScaleParameter_2powx_p8_ena,
i_2powx_p8_4bit_adr => ExtractKsToScaleParameter_2powx_p8_adr,
i_signed3bit_en => '0',
i_signed3bit_adr => (others => '0'),
o_float => ExtractKsToScaleParameter_rom_constants_float
);

END;
