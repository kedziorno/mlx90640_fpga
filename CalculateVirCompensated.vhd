----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:05:04 02/17/2023 
-- Design Name: 
-- Module Name:    CalculateVirCompensated - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CalculateVirCompensated is
port (
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

o_rdy : out std_logic
);
end CalculateVirCompensated;

architecture Behavioral of CalculateVirCompensated is

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

component ExtractTGCParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_tgc : out std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
end component ExtractTGCParameters;

signal ExtractTGCParameters_clock : std_logic;
signal ExtractTGCParameters_reset : std_logic;
signal ExtractTGCParameters_run : std_logic;
signal ExtractTGCParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractTGCParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractTGCParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractTGCParameters_tgc : std_logic_vector (31 downto 0);
signal ExtractTGCParameters_rdy : std_logic;

signal ExtractTGCParameters_mux : std_logic;

signal rdy : std_logic;

begin

o_rdy <= rdy;

i2c_mem_ena <=
ExtractTGCParameters_i2c_mem_ena when ExtractTGCParameters_mux = '1'
else '0';

i2c_mem_addra <=
ExtractTGCParameters_i2c_mem_addra when ExtractTGCParameters_mux = '1'
else (others => '0');

ExtractTGCParameters_i2c_mem_douta <= i2c_mem_douta;

p0 : process (i_clock) is
	constant C_ROW : integer := 24;
	constant C_COL : integer := 32;
	variable i : integer range 0 to C_ROW*C_COL-1;
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,
	s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,
	s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,
	ending);
	variable state : states;
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			addfpsclr <= '1';
			subfpsclr <= '1';
			mulfpsclr <= '1';
			divfpsclr <= '1';
			rdy <= '0';
			mulfpa <= (others => '0');
			mulfpb <= (others => '0');
			addfpa <= (others => '0');
			addfpb <= (others => '0');
			subfpa <= (others => '0');
			subfpb <= (others => '0');
			divfpa <= (others => '0');
			divfpb <= (others => '0');
			mulfpond <= '0';
			addfpond <= '0';
			subfpond <= '0';
			divfpond <= '0';
			mulfpce <= '0';
			addfpce <= '0';
			subfpce <= '0';
			divfpce <= '0';
			ExtractTGCParameters_run <= '0';
			ExtractTGCParameters_mux <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
					else
						state := idle;
					end if;
					i := 0;
					addfpsclr <= '0';
					subfpsclr <= '0';
					mulfpsclr <= '0';
					divfpsclr <= '0';
				when s1 => state := s2;
					o_pixos_addr <= std_logic_vector (to_unsigned (i, 10));
				when s2 => state := s3;
				when s3 => state := s4;
					fptmp1 := i_pixos_do;

					divfpce <= '1';
					divfpa <= i_pixos_do;
					divfpb <= i_Emissivity;
					divfpond <= '1';
				when s4 =>
					if (divfprdy = '1') then state := s5;
						fptmp1 := divfpr;
						divfpce <= '0';
						divfpond <= '0';
						divfpsclr <= '1';
					else state := s4; end if;
				when s5 => state := s6;
					divfpsclr <= '0';

				when s6 => state := s7;
					ExtractTGCParameters_run <= '1';
					ExtractTGCParameters_mux <= '1';
				when s7 => 
					ExtractTGCParameters_run <= '0';
					if (ExtractTGCParameters_rdy = '1') then
						state := ending;
						ExtractTGCParameters_mux <= '0';
					else
						state := s7;
						ExtractTGCParameters_mux <= '1';
					end if;

				when ending => state := idle;
					rdy <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

ExtractTGCParameters_clock <= i_clock;
ExtractTGCParameters_reset <= i_reset;
inst_ExtractTGCParameters : ExtractTGCParameters port map (
i_clock => ExtractTGCParameters_clock,
i_reset => ExtractTGCParameters_reset,
i_run => ExtractTGCParameters_run,
i2c_mem_ena => ExtractTGCParameters_i2c_mem_ena,
i2c_mem_addra => ExtractTGCParameters_i2c_mem_addra,
i2c_mem_douta => ExtractTGCParameters_i2c_mem_douta,
o_tgc => ExtractTGCParameters_tgc,
o_rdy => ExtractTGCParameters_rdy
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

mulfpclk <= i_clock;
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

addfpclk <= i_clock;
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

subfpclk <= i_clock;
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

