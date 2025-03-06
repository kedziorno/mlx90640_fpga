----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:40 02/06/2023 
-- Design Name: 
-- Module Name:    ExtractAlphaCorrRange1234 - Behavioral 
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
USE ieee.std_logic_1164.ALL;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;

use work.p_fphdl_package1.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

entity ExtractAlphaCorrRange1234 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x243d : in slv16; -- ksto1ee,ksto2ee
i_ee0x243e : in slv16; -- ksto3ee,ksto4ee
i_ee0x243f : in slv16; -- kstoscale,ct34param
o_alphacorrrange1 : out fd2ft;
o_alphacorrrange2 : out fd2ft;
o_alphacorrrange3 : out fd2ft;
o_alphacorrrange4 : out fd2ft;
o_rdy : out std_logic
);
end ExtractAlphaCorrRange1234;

architecture Behavioral of ExtractAlphaCorrRange1234 is

COMPONENT ExtractCT34Parameter
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_ee0x243f : IN  slv16;
o_ct3 : OUT  fd2ft;
o_ct4 : OUT  fd2ft
);
END COMPONENT;

signal ExtractCT34Parameter_clock : std_logic;
signal ExtractCT34Parameter_reset : std_logic;
signal ExtractCT34Parameter_ee0x243f : slv16;
signal ExtractCT34Parameter_ct3 : fd2ft;
signal ExtractCT34Parameter_ct4 : fd2ft;

component ExtractKsTo1234Parameters is
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
o_ksto4 : out fd2ft;
o_rdy : out std_logic
);
end component ExtractKsTo1234Parameters;

signal ExtractKsTo1234Parameters_clock : std_logic;
signal ExtractKsTo1234Parameters_reset : std_logic;
signal ExtractKsTo1234Parameters_run : std_logic;
signal ExtractKsTo1234Parameters_ee0x243f : slv16; -- kstoscale
signal ExtractKsTo1234Parameters_ee0x243d : slv16; -- ksto1ee,ksto2ee
signal ExtractKsTo1234Parameters_ee0x243e : slv16; -- ksto3ee,ksto4ee
signal ExtractKsTo1234Parameters_ksto1 : fd2ft;
signal ExtractKsTo1234Parameters_ksto2 : fd2ft;
signal ExtractKsTo1234Parameters_ksto3 : fd2ft;
signal ExtractKsTo1234Parameters_ksto4 : fd2ft;
signal ExtractKsTo1234Parameters_rdy : std_logic;

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
signal mulfpclk : STD_LOGIC;
signal mulfpsclr : STD_LOGIC;
signal mulfpce : STD_LOGIC;
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
signal addfpclk : STD_LOGIC;
signal addfpsclr : STD_LOGIC;
signal addfpce : STD_LOGIC;
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
signal subfpclk : STD_LOGIC;
signal subfpsclr : STD_LOGIC;
signal subfpce : STD_LOGIC;
signal subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : STD_LOGIC;

begin

p0 : process (i_clock) is
	variable const1 : fd2ft := x"3F800000";
	variable const40 : fd2ft := x"42200000";
	variable valphacorrrange1 : fd2ft;
	variable valphacorrrange2 : fd2ft;
	variable valphacorrrange3 : fd2ft;
	variable valphacorrrange4 : fd2ft;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,
	ending);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			addfpa <= (others => '0');
			addfpb <= (others => '0');
			subfpa <= (others => '0');
			subfpb <= (others => '0');
			mulfpa <= (others => '0');
			mulfpb <= (others => '0');
			divfpa <= (others => '0');
			divfpb <= (others => '0');
			addfpond <= '0';
			subfpond <= '0';
			mulfpond <= '0';
			divfpond <= '0';
			addfpce <= '0';
			subfpce <= '0';
			mulfpce <= '0';
			divfpce <= '0';
			addfpsclr <= '1';
			subfpsclr <= '1';
			mulfpsclr <= '1';
			divfpsclr <= '1';
			ExtractKsTo1234Parameters_run <= '0';
			ExtractCT34Parameter_ee0x243f <= (others => '0');
			ExtractKsTo1234Parameters_ee0x243f <= (others => '0');
			ExtractKsTo1234Parameters_ee0x243d <= (others => '0');
			ExtractKsTo1234Parameters_ee0x243e <= (others => '0');
			valphacorrrange1 := (others => '0');
			valphacorrrange2 := (others => '0');
			valphacorrrange3 := (others => '0');
			valphacorrrange4 := (others => '0');
			o_rdy <= '0';
			o_alphacorrrange1 <= (others => '0');
			o_alphacorrrange2 <= (others => '0');
			o_alphacorrrange3 <= (others => '0');
			o_alphacorrrange4 <= (others => '0');
			state := idle;
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
					else
						state := idle;
					end if;
					addfpsclr <= '0';
					subfpsclr <= '0';
					mulfpsclr <= '0';
					divfpsclr <= '0';
					ExtractCT34Parameter_ee0x243f <= i_ee0x243f;
					ExtractKsTo1234Parameters_ee0x243f <= i_ee0x243f;
					ExtractKsTo1234Parameters_ee0x243d <= i_ee0x243d;
					ExtractKsTo1234Parameters_ee0x243e <= i_ee0x243e;
				when s1 => state := s2;
					ExtractKsTo1234Parameters_run <= '1';
				when s2 =>
					ExtractKsTo1234Parameters_run <= '0';
					if (ExtractKsTo1234Parameters_rdy = '1') then
						state := s3;
					else
						state := s2;
					end if;
				when s3 => state := s4;
					mulfpce <= '1';
					mulfpa <= const40;
					mulfpb <= ExtractKsTo1234Parameters_ksto1;
					mulfpond <= '1';
				when s4 =>
					if (mulfprdy = '1') then state := s5;
						valphacorrrange1 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s4; end if;
				when s5 => state := s6;
					mulfpsclr <= '0';
					addfpce <= '1';
					addfpa <= valphacorrrange1;
					addfpb <= const1;
					addfpond <= '1';
				when s6 =>
					if (addfprdy = '1') then state := s7;
						valphacorrrange1 := addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s6; end if;
				when s7 => state := s8;
					addfpsclr <= '0';
					divfpce <= '1';
					divfpa <= const1;
					divfpb <= valphacorrrange1;
					divfpond <= '1';
				when s8 =>
					if (divfprdy = '1') then state := s9;
						valphacorrrange1 := divfpr;
						divfpce <= '0';
						divfpond <= '0';
						divfpsclr <= '1';
					else state := s8; end if;
				when s9 => state := s10;
					divfpsclr <= '0';
					mulfpce <= '1';
					mulfpa <= ExtractKsTo1234Parameters_ksto2;
					mulfpb <= ExtractCT34Parameter_ct3;
					mulfpond <= '1';
				when s10 =>
					if (mulfprdy = '1') then state := s11;
						valphacorrrange3 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s10; end if;
				when s11 => state := s12;
					mulfpsclr <= '0';
					addfpce <= '1';
					addfpa <= valphacorrrange3;
					addfpb <= const1;
					addfpond <= '1';
				when s12 =>
					if (addfprdy = '1') then state := s13;
						valphacorrrange3 := addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s12; end if;
				when s13 => state := s14;
					addfpsclr <= '0';
					subfpce <= '1';
					subfpa <= ExtractCT34Parameter_ct4;
					subfpb <= ExtractCT34Parameter_ct3;
					subfpond <= '1';
				when s14 =>
					if (subfprdy = '1') then state := s15;
						valphacorrrange4 := subfpr;
						subfpce <= '0';
						subfpond <= '0';
						subfpsclr <= '1';
					else state := s14; end if;
				when s15 => state := s16;
					subfpsclr <= '0';
					mulfpce <= '1';
					mulfpa <= valphacorrrange4;
					mulfpb <= ExtractKsTo1234Parameters_ksto3;
					mulfpond <= '1';
				when s16 =>
					if (mulfprdy = '1') then state := s17;
						valphacorrrange4 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s16; end if;
				when s17 => state := s18;
					mulfpsclr <= '0';
					addfpce <= '1';
					addfpa <= valphacorrrange4;
					addfpb <= const1;
					addfpond <= '1';
				when s18 =>
					if (addfprdy = '1') then state := s19;
						valphacorrrange4 := addfpr;
						addfpce <= '0';
						addfpond <= '0';
						addfpsclr <= '1';
					else state := s18; end if;
				when s19 => state := s20;
					addfpsclr <= '0';
					mulfpce <= '1';
					mulfpa <= valphacorrrange3;
					mulfpb <= valphacorrrange4;
					mulfpond <= '1';
				when s20 =>
					if (mulfprdy = '1') then state := s21;
						valphacorrrange4 := mulfpr;
						mulfpce <= '0';
						mulfpond <= '0';
						mulfpsclr <= '1';
					else state := s20; end if;
				when s21 => state := idle;
					mulfpsclr <= '0';
					o_alphacorrrange1 <= valphacorrrange1;
					o_alphacorrrange2 <= const1; -- ds p.27 11.1.11
					o_alphacorrrange3 <= valphacorrrange3;
					o_alphacorrrange4 <= valphacorrrange4;
					o_rdy <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

ExtractCT34Parameter_clock <= i_clock;
ExtractCT34Parameter_reset <= i_reset;
inst_ExtractCT34Parameter : ExtractCT34Parameter port map (
i_clock => ExtractCT34Parameter_clock,
i_reset => ExtractCT34Parameter_reset,
i_ee0x243f => ExtractCT34Parameter_ee0x243f,
o_ct3 => ExtractCT34Parameter_ct3,
o_ct4 => ExtractCT34Parameter_ct4
);

ExtractKsTo1234Parameters_clock <= i_clock;
ExtractKsTo1234Parameters_reset <= i_reset;
inst_ExtractKsTo1234Parameters : ExtractKsTo1234Parameters port map (
i_clock => ExtractKsTo1234Parameters_clock,
i_reset => ExtractKsTo1234Parameters_reset,
i_run => ExtractKsTo1234Parameters_run,
i_ee0x243f => ExtractKsTo1234Parameters_ee0x243f,
i_ee0x243d => ExtractKsTo1234Parameters_ee0x243d,
i_ee0x243e => ExtractKsTo1234Parameters_ee0x243e,
o_ksto1 => ExtractKsTo1234Parameters_ksto1,
o_ksto2 => ExtractKsTo1234Parameters_ksto2,
o_ksto3 => ExtractKsTo1234Parameters_ksto3,
o_ksto4 => ExtractKsTo1234Parameters_ksto4,
o_rdy => ExtractKsTo1234Parameters_rdy
);

addfpclk <= i_clock;
subfpclk <= i_clock;
mulfpclk <= i_clock;
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

inst_mulfp : mulfp
PORT MAP (
a => mulfpa,
b => mulfpb,
operation_nd => mulfpond,
clk => mulfpclk,
sclr => mulfpsclr,
ce => mulfpce,
result => mulfpr,
rdy => mulfprdy
);

inst_addfp : addfp
PORT MAP (
a => addfpa,
b => addfpb,
operation_nd => addfpond,
clk => addfpclk,
sclr => addfpsclr,
ce => addfpce,
result => addfpr,
rdy => addfprdy
);

inst_subfp : subfp
PORT MAP (
a => subfpa,
b => subfpb,
operation_nd => subfpond,
clk => subfpclk,
sclr => subfpsclr,
ce => subfpce,
result => subfpr,
rdy => subfprdy
);

end Behavioral;

