-- TestBench Template 
-- calculateTa

LIBRARY ieee,ieee_proposed;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.numeric_std_additions.all;
use ieee_proposed.standard_additions.all;
--use ieee_proposed.standard_textio_additions.all;
use ieee_proposed.std_logic_1164_additions.all;

USE work.p_fphdl_package1.all;
USE work.p_fphdl_package3.all;

ENTITY tb_calculateTa IS
END tb_calculateTa;

ARCHITECTURE tb OF tb_calculateTa IS 

-- Component Declaration
component calculateTa is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x2432 : in slv16; -- kvptat,ktptat-6/10
i_ee0x2431 : in slv16; -- vptat25
i_ram0x0720 : in slv16; -- vptat
i_ram0x0700 : in slv16; -- vbe
i_ee0x2410 : in slv16; -- (alphaptatee),kptat,scaleoccrow,scaleocccolumn,scaleoccremnant
i_ram0x072a : in fd2ft; -- from VDD bram
i_kvdd : in fd2ft; -- from VDD bram
i_vdd25 : in fd2ft; -- from VDD bram
o_Ta : out fd2ft; -- output Ta
o_rdy : out std_logic
);
end component calculateTa;

signal i_clock : std_logic;
signal i_reset : std_logic;
signal i_run : std_logic;
signal o_Ta : fd2ft; -- output Ta
signal o_rdy : std_logic;

constant clock_period : time := 10 ns;
constant G_C_WAIT1 : integer := 16;

signal out1r : real;

BEGIN

out1r <= ap_slv2fp (o_Ta);

cp : process
begin
	i_clock <= '0';
	wait for clock_period/2;
	i_clock <= '1';
	wait for clock_period/2;
end process cp;

-- Component Instantiation
uut : calculateTa port map (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,
i_ee0x2432 => x"5952",
i_ee0x2431 => x"2ff1",
i_ee0x2410 => x"4210",
i_kvdd => x"c5460000",
i_vdd25 => x"c64c0000",
i_ram0x072a => x"c64cec00",
i_ram0x0720 => x"06af",
i_ram0x0700 => x"4bf2",
o_Ta => o_Ta,
o_rdy => o_rdy
);

tbprocess : PROCESS
BEGIN
i_reset <= '1';
wait for 254.3 ns; -- wait until global set/reset completes
i_reset <= '0';
wait for clock_period*10;
-- Add user defined stimulus here
i_run <= '1'; wait for clock_period; i_run <= '0';
wait for clock_period*10;
wait for 100 us;
report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

END tb;
