----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:05:01 02/05/2023 
-- Design Name: 
-- Module Name:    ExtractKsTo1234Parameters - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee, ieee_proposed;
--library ieee;
use ieee.std_logic_1164.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;

use work.p_fphdl_package1.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ExtractKsTo1234Parameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x243f : in slv16; -- kstoscale
i_ee0x243d : in slv16; -- ksto1ee,ksto2ee
i_ee0x243e : in slv16; -- ksto3ee,ksto4ee
o_ksto1 : out fd2ft;
o_ksto2 : out fd2ft;
o_ksto3 : out fd2ft;
o_ksto4 : out fd2ft
);
end ExtractKsTo1234Parameters;

architecture Behavioral of ExtractKsTo1234Parameters is

COMPONENT ExtractKsToScaleParameter -- 2^kstoscale float
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x243f : IN  std_logic_vector (15 downto 0);
o_kstoscale : OUT  std_logic_vector (31 downto 0)
);
END COMPONENT;

signal ExtractKsToScaleParameter_clock : std_logic;
signal ExtractKsToScaleParameter_reset : std_logic;
signal ExtractKsToScaleParameter_ee0x243f : std_logic_vector (15 downto 0);
signal ExtractKsToScaleParameter_kstoscale : std_logic_vector (31 downto 0);

--COMPONENT mem_float2powerN -- for ksto1234ee
--PORT(
--i_clock : IN  std_logic;
--i_reset : IN  std_logic;
--i_N : IN  std_logic_vector (5 downto 0);
--o_2powerN : OUT  std_logic_vector (31 downto 0)
--);
--END COMPONENT;
--
--signal mem_float2powerN_ksto1234_clock : std_logic;
--signal mem_float2powerN_ksto1234_reset : std_logic;
--signal mem_float2powerN_ksto1234_N : std_logic_vector (5 downto 0);
--signal mem_float2powerN_ksto1234_2powerN : std_logic_vector (31 downto 0);

component mem_signedFF is -- for ksto1234ee
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_value : in std_logic_vector (7 downto 0); -- input hex from 0 to 255
o_value : out std_logic_vector (31 downto 0) -- output signed -128 to 127 in SP float
);
end component mem_signedFF;

signal mem_signedFF_clock : std_logic;
signal mem_signedFF_reset : std_logic;
signal mem_signedFF_ivalue : std_logic_vector (7 downto 0);
signal mem_signedFF_ovalue : std_logic_vector (31 downto 0);

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
signal divfpclk : STD_LOGIC;
signal divfpsclr : STD_LOGIC;
signal divfpce : STD_LOGIC;
signal divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : STD_LOGIC;

begin

p0 : process (i_clock) is
	type states is (idle,s1,s2,s3,s4,s5,s6,s7,ending);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			divfpsclr <= '1';
			o_ksto1 <= (others => '0');
			o_ksto2 <= (others => '0');
			o_ksto3 <= (others => '0');
			o_ksto4 <= (others => '0');
			ExtractKsToScaleParameter_ee0x243f <= (others => '0');
			mem_signedFF_ivalue <= (others => '0');
			divfpa <= (others => '0');
			divfpb <= (others => '0');
			divfpce <= '0';
			divfpond <= '0';
			state := idle;
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
					else
						state := idle;
					end if;
					divfpsclr <= '0';
				when s1 => state := s2;
					ExtractKsToScaleParameter_ee0x243f <= i_ee0x243f;
				when s2 => state := s3;
					mem_signedFF_ivalue <= i_ee0x243d (7 downto 0);
				when s3 => state := s4;
				when s4 => state := s5;
					divfpce <= '1';
					divfpa <= mem_signedFF_ovalue;
					divfpb <= ExtractKsToScaleParameter_kstoscale;
					divfpond <= '1';
				when s5 =>
					if (divfprdy = '1') then state := s6;
						o_ksto1 <= divfpr;
						divfpce <= '0';
						divfpond <= '0';
						divfpsclr <= '1';
					else state := s5; end if;
				when s6 => state := ending;
					divfpsclr <= '0';
				when ending =>
				when others => null;
			end case;
		end if;
	end if;
end process p0;

ExtractKsToScaleParameter_clock <= i_clock;
ExtractKsToScaleParameter_reset <= i_reset;
inst_mem_kstoscale : ExtractKsToScaleParameter PORT MAP (
i_clock => ExtractKsToScaleParameter_clock,
i_reset => ExtractKsToScaleParameter_reset,
i_ee0x243f => ExtractKsToScaleParameter_ee0x243f,
o_kstoscale => ExtractKsToScaleParameter_kstoscale
);

--mem_float2powerN_ksto1234_clock <= i_clock;
--mem_float2powerN_ksto1234_reset <= i_reset;
--inst_mem_ksto1234ee : mem_float2powerN PORT MAP (
--i_clock => mem_float2powerN_ksto1234_clock,
--i_reset => mem_float2powerN_ksto1234_reset,
--i_N => mem_float2powerN_ksto1234_N,
--o_2powerN => mem_float2powerN_ksto1234_2powerN
--);

mem_signedFF_clock <= i_clock;
mem_signedFF_reset <= i_reset;
inst_mem_signedFF : mem_signedFF
port map (
i_clock => mem_signedFF_clock,
i_reset => mem_signedFF_reset,
i_value => mem_signedFF_ivalue,
o_value => mem_signedFF_ovalue
);

divfpclk <= i_clock;
inst_divfp : divfp
PORT MAP (
a => divfpa,
b => divfpb,
operation_nd => divfpond,
clk => divfpclk,
sclr => divfpsclr,
ce => divfpce,
result => divfpr,
rdy => divfprdy
);

end Behavioral;

