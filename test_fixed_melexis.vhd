----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:07 12/26/2022 
-- Design Name: 
-- Module Name:    test_fixed_melexis - Behavioral 
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
-- Test vectors for the synthesis test for the fixed point math package
-- This test is designed to test fixed_synth and exercise much of the entity.
-- For fphdl vhdl-200x created by David Bishop (dbishop@vhdl.org)
----------------------------------------------------------------------------------

library ieee, ieee_proposed;
--library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;


--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package1.all;

entity test_fixed_melexis is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_rdy : out std_logic
);
end test_fixed_melexis;

architecture testbench of test_fixed_melexis is

component calculateVdd is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_Vdd : out fd2ft; -- output Vdd
o_kvdd : out fd2ft;
o_vdd25 : out fd2ft;
o_ram0x072a : out fd2ft;
o_rdy : out std_logic
);
end component calculateVdd;
signal calculateVdd_clock : std_logic;
signal calculateVdd_reset : std_logic;
signal calculateVdd_run : std_logic;
signal calculateVdd_i2c_mem_ena : STD_LOGIC;
signal calculateVdd_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateVdd_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculateVdd_Vdd : fd2ft; -- output Vdd
signal calculateVdd_kvdd : fd2ft;
signal calculateVdd_vdd25 : fd2ft;
signal calculateVdd_ram0x072a : fd2ft;
signal calculateVdd_rdy : std_logic;

component calculateTa is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
i_ram0x072a : in fd2ft; -- from VDD bram
i_kvdd : in fd2ft; -- from VDD bram
i_vdd25 : in fd2ft; -- from VDD bram
o_Ta : out fd2ft; -- output Ta
o_rdy : out std_logic
);
end component calculateTa;
signal calculateTa_clock : std_logic;
signal calculateTa_reset : std_logic;
signal calculateTa_run : std_logic;
signal calculateTa_i2c_mem_ena : STD_LOGIC;
signal calculateTa_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateTa_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculateTa_ram0x072a : fd2ft; -- from VDD bram
signal calculateTa_kvdd : fd2ft; -- from VDD bram
signal calculateTa_vdd25 : fd2ft; -- from VDD bram
signal calculateTa_Ta : fd2ft; -- output Ta
signal calculateTa_rdy : std_logic;

--component ExtractOffsetParameters is
--port (
--i_clock : in std_logic;
--i_reset : in std_logic;
--i_run : in std_logic;
--i2c_mem_ena : out STD_LOGIC;
--i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
--i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
--o_do : out std_logic_vector (31 downto 0);
--i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
--o_done : out std_logic;
--o_rdy : out std_logic
--);
--end component ExtractOffsetParameters;
--signal ExtractOffsetParameters_clock : std_logic;
--signal ExtractOffsetParameters_reset : std_logic;
--signal ExtractOffsetParameters_run : std_logic;
--signal ExtractOffsetParameters_i2c_mem_ena : STD_LOGIC;
--signal ExtractOffsetParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
--signal ExtractOffsetParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
--signal ExtractOffsetParameters_do : std_logic_vector (31 downto 0);
--signal ExtractOffsetParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
--signal ExtractOffsetParameters_done : std_logic;
--signal ExtractOffsetParameters_rdy : std_logic;

component ExtractAlphaParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_done : out std_logic;
o_rdy : out std_logic
);
end component ExtractAlphaParameters;
signal ExtractAlphaParameters_clock : std_logic;
signal ExtractAlphaParameters_reset : std_logic;
signal ExtractAlphaParameters_run : std_logic;
signal ExtractAlphaParameters_i2c_mem_ena : STD_LOGIC;
signal ExtractAlphaParameters_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ExtractAlphaParameters_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal ExtractAlphaParameters_do : std_logic_vector (31 downto 0);
signal ExtractAlphaParameters_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal ExtractAlphaParameters_done : std_logic;
signal ExtractAlphaParameters_rdy : std_logic;

component CalculateAlphaCP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_acpsubpage0 : out fd2ft;
o_acpsubpage1 : out fd2ft;
o_rdy : out std_logic
);
end component CalculateAlphaCP;
signal CalculateAlphaCP_clock : std_logic;
signal CalculateAlphaCP_reset : std_logic;
signal CalculateAlphaCP_run : std_logic;
signal CalculateAlphaCP_i2c_mem_ena : STD_LOGIC;
signal CalculateAlphaCP_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculateAlphaCP_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculateAlphaCP_acpsubpage0 : fd2ft;
signal CalculateAlphaCP_acpsubpage1 : fd2ft;
signal CalculateAlphaCP_rdy : std_logic;

component CalculatePixOS is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
i_const1 : in std_logic_vector (31 downto 0);
i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_VddV0 : in std_logic_vector (31 downto 0);
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_rdy : out std_logic
);
end component CalculatePixOS;
signal CalculatePixOS_clock : std_logic;
signal CalculatePixOS_reset : std_logic;
signal CalculatePixOS_run : std_logic;
signal CalculatePixOS_i2c_mem_ena : STD_LOGIC;
signal CalculatePixOS_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixOS_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixOS_const1 : std_logic_vector (31 downto 0);
signal CalculatePixOS_Ta : std_logic_vector (31 downto 0);
signal CalculatePixOS_Ta0 : std_logic_vector (31 downto 0);
signal CalculatePixOS_Vdd : std_logic_vector (31 downto 0);
signal CalculatePixOS_VddV0 : std_logic_vector (31 downto 0);
signal CalculatePixOS_do : std_logic_vector (31 downto 0);
signal CalculatePixOS_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal CalculatePixOS_rdy : std_logic;

component CalculatePixOsCPSP is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_Ta : in std_logic_vector (31 downto 0);
i_Ta0 : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_VddV0 : in std_logic_vector (31 downto 0);
i_const1 : in std_logic_vector (31 downto 0);
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_pixoscpsp0 : out std_logic_vector (31 downto 0);
o_pixoscpsp1 : out std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
end component CalculatePixOsCPSP;
signal CalculatePixOsCPSP_clock : std_logic;
signal CalculatePixOsCPSP_reset : std_logic;
signal CalculatePixOsCPSP_run : std_logic;
signal CalculatePixOsCPSP_Ta : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_Ta0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_Vdd : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_VddV0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_const1 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_i2c_mem_ena : STD_LOGIC;
signal CalculatePixOsCPSP_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixOsCPSP_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixOsCPSP_pixoscpsp0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_pixoscpsp1 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_rdy : std_logic;

COMPONENT CalculateVirCompensated
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i_Emissivity : IN  std_logic_vector(31 downto 0);
i_pixoscpsp0 : IN  std_logic_vector(31 downto 0);
i_pixoscpsp1 : IN  std_logic_vector(31 downto 0);
i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);
i_pixos_do : IN  std_logic_vector(31 downto 0);
o_pixos_addr : OUT  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);
o_rdy : OUT  std_logic
);
END COMPONENT;
signal CalculateVirCompensated_clock : std_logic;
signal CalculateVirCompensated_reset : std_logic;
signal CalculateVirCompensated_run : std_logic;
signal CalculateVirCompensated_Emissivity : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_pixoscpsp0 : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_pixoscpsp1 : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_pixos_do : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_addr : std_logic_vector(9 downto 0);
signal CalculateVirCompensated_i2c_mem_ena : std_logic;
signal CalculateVirCompensated_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateVirCompensated_i2c_mem_douta : std_logic_vector(7 downto 0);
signal CalculateVirCompensated_pixos_addr : std_logic_vector(9 downto 0);
signal CalculateVirCompensated_do : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_rdy : std_logic;

COMPONENT CalculateAlphaComp
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);
i_Ta : IN  std_logic_vector(31 downto 0);
i_Ta0 : IN  std_logic_vector(31 downto 0);
i_acpsubpage0 : IN  std_logic_vector(31 downto 0);
i_acpsubpage1 : IN  std_logic_vector(31 downto 0);
i_const1 : IN  std_logic_vector(31 downto 0);
i_alpha_do : IN  std_logic_vector(31 downto 0);
o_alpha_addr : OUT  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);
o_rdy : OUT  std_logic
);
END COMPONENT;
signal CalculateAlphaComp_clock : std_logic := '0';
signal CalculateAlphaComp_reset : std_logic := '0';
signal CalculateAlphaComp_run : std_logic := '0';
signal CalculateAlphaComp_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateAlphaComp_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_Ta0 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage0 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage1 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_const1 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_alpha_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_addr : std_logic_vector(9 downto 0) := (others => '0');
signal CalculateAlphaComp_i2c_mem_ena : std_logic;
signal CalculateAlphaComp_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateAlphaComp_alpha_addr : std_logic_vector(9 downto 0);
signal CalculateAlphaComp_do : std_logic_vector(31 downto 0);
signal CalculateAlphaComp_rdy : std_logic;

COMPONENT CalculateTo
PORT(
i_clock : IN  std_logic;
i_reset : IN  std_logic;
i_run : IN  std_logic;
i2c_mem_ena : OUT  std_logic;
i2c_mem_addra : OUT  std_logic_vector(11 downto 0);
i2c_mem_douta : IN  std_logic_vector(7 downto 0);
i_Ta : IN  std_logic_vector(31 downto 0);
i_vircompensated_do : IN  std_logic_vector(31 downto 0);
o_vircompensated_addr : OUT  std_logic_vector(9 downto 0);
i_alphacomp_do : IN  std_logic_vector(31 downto 0);
o_alphacomp_addr : OUT  std_logic_vector(9 downto 0);
o_do : OUT  std_logic_vector(31 downto 0);
i_addr : IN  std_logic_vector(9 downto 0);
o_rdy : OUT  std_logic
);
END COMPONENT;
signal CalculateTo_clock : std_logic := '0';
signal CalculateTo_reset : std_logic := '0';
signal CalculateTo_run : std_logic := '0';
signal CalculateTo_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateTo_vircompensated_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_alphacomp_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateTo_addr : std_logic_vector(9 downto 0) := (others => '0');
signal CalculateTo_i2c_mem_ena : std_logic;
signal CalculateTo_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateTo_vircompensated_addr : std_logic_vector(9 downto 0);
signal CalculateTo_alphacomp_addr : std_logic_vector(9 downto 0);
signal CalculateTo_do : std_logic_vector(31 downto 0);
signal CalculateTo_rdy : std_logic;

signal rdyrecover : std_logic; -- signal for tb when rdy not appear

signal CalculatePixOS_mux,CalculatePixOsCPSP_mux,CalculateVirCompensated_mux,ExtractOffsetParameters_mux : std_logic;
signal ExtractAlphaParameters_mux,CalculateAlphaComp_mux,CalculateAlphaCP_mux : std_logic;
signal CalculateVdd_mux,CalculateTa_mux,CalculateTo_mux : std_logic;

begin

i2c_mem_ena <=
CalculatePixOS_i2c_mem_ena when CalculatePixOS_mux = '1'
else
CalculatePixOsCPSP_i2c_mem_ena when CalculatePixOsCPSP_mux = '1'
else
CalculateVirCompensated_i2c_mem_ena when CalculateVirCompensated_mux = '1'
else
--ExtractOffsetParameters_i2c_mem_ena when ExtractOffsetParameters_mux = '1'
--else
CalculateAlphaCP_i2c_mem_ena when CalculateAlphaCP_mux = '1'
else
ExtractAlphaParameters_i2c_mem_ena when ExtractAlphaParameters_mux = '1'
else
CalculateAlphaComp_i2c_mem_ena when CalculateAlphaComp_mux = '1'
else
CalculateVdd_i2c_mem_ena when CalculateVdd_mux = '1'
else
CalculateTa_i2c_mem_ena when CalculateTa_mux = '1'
else
CalculateTo_i2c_mem_ena when CalculateTo_mux = '1'
else '0';

i2c_mem_addra <=
CalculatePixOS_i2c_mem_addra when CalculatePixOS_mux = '1'
else
CalculatePixOsCPSP_i2c_mem_addra when CalculatePixOsCPSP_mux = '1'
else
CalculateVirCompensated_i2c_mem_addra when CalculateVirCompensated_mux = '1'
else
--ExtractOffsetParameters_i2c_mem_addra when ExtractOffsetParameters_mux = '1'
--else
CalculateAlphaCP_i2c_mem_addra when CalculateAlphaCP_mux = '1'
else
ExtractAlphaParameters_i2c_mem_addra when ExtractAlphaParameters_mux = '1'
else
CalculateAlphaComp_i2c_mem_addra when CalculateAlphaComp_mux = '1'
else
CalculateVdd_i2c_mem_addra when CalculateVdd_mux = '1'
else
CalculateTa_i2c_mem_addra when CalculateTa_mux = '1'
else
CalculateTo_i2c_mem_addra when CalculateTo_mux = '1'
else (others => '0');

CalculatePixOS_i2c_mem_douta <= i2c_mem_douta when CalculatePixOS_mux = '1' else (others => '0');
CalculatePixOsCPSP_i2c_mem_douta <= i2c_mem_douta when CalculatePixOsCPSP_mux = '1' else (others => '0');
CalculateVirCompensated_i2c_mem_douta <= i2c_mem_douta when CalculateVirCompensated_mux = '1' else (others => '0');
--ExtractOffsetParameters_i2c_mem_douta <= i2c_mem_douta when ExtractOffsetParameters_mux = '1' else (others => '0');
CalculateAlphaCP_i2c_mem_douta <= i2c_mem_douta when CalculateAlphaCP_mux = '1' else (others => '0');
ExtractAlphaParameters_i2c_mem_douta <= i2c_mem_douta when ExtractAlphaParameters_mux = '1' else (others => '0');
CalculateAlphaComp_i2c_mem_douta <= i2c_mem_douta when CalculateAlphaComp_mux = '1' else (others => '0');
CalculateVdd_i2c_mem_douta <= i2c_mem_douta when CalculateVdd_mux = '1' else (others => '0');
CalculateTa_i2c_mem_douta <= i2c_mem_douta when CalculateTa_mux = '1' else (others => '0');
CalculateTo_i2c_mem_douta <= i2c_mem_douta when CalculateTo_mux = '1' else (others => '0');

o_rdy <= rdyrecover;

	-- purpose: main test loop
	tester : process (i_clock,i_reset) is
		variable state : states;
	begin
		if (rising_edge(i_clock)) then
			if (i_reset = '1') then
				state := idle;
				-- reset
				rdyrecover <= '0';
			else
case (state) is
	when idle =>
			if (i_run = '1') then
				state := s1;
			else
				state := idle;
			end if;

	when s1 => state := s2;
		CalculateVdd_run <= '1';
		CalculateVdd_mux <= '1';
	when s2 => 
		CalculateVdd_run <= '0';
		if (CalculateVdd_rdy = '1') then
			state := s3;
			CalculateVdd_mux <= '0';
		else
			state := s2;
			CalculateVdd_mux <= '1';
		end if;

	when s3 => state := s4;
		CalculateTa_run <= '1';
		CalculateTa_mux <= '1';
		CalculateTa_ram0x072a <= CalculateVdd_ram0x072a;
		CalculateTa_kvdd <= CalculateVdd_kvdd;
		CalculateTa_vdd25 <= CalculateVdd_vdd25;
	when s4 =>
		calculateTa_run <= '0';
		if (calculateTa_rdy = '1') then
			state := s7;
			CalculateTa_mux <= '0';
		else
			state := s4;
			CalculateTa_mux <= '1';
		end if;		
		
	when s7 => state := s8;
		CalculatePixOS_run <= '1';
		CalculatePixOS_mux <= '1';
	when s8 => 
		CalculatePixOS_run <= '0';
		if (CalculatePixOS_rdy = '1') then
			state := s9;
			CalculatePixOS_mux <= '0';
		else
			state := s8;
			CalculatePixOS_mux <= '1';
		end if;

	when s9 => state := s10;
		CalculatePixOsCPSP_run <= '1';
		CalculatePixOsCPSP_mux <= '1';
	when s10 => 
		CalculatePixOsCPSP_run <= '0';
		if (CalculatePixOsCPSP_rdy = '1') then
			state := s11;
			CalculatePixOsCPSP_mux <= '0';
		else
			state := s10;
			CalculatePixOsCPSP_mux <= '1';
		end if;

	when s11 => state := s12;
		CalculateVirCompensated_run <= '1';
		CalculateVirCompensated_mux <= '1';
	when s12 => 
		CalculateVirCompensated_run <= '0';
		if (CalculateVirCompensated_rdy = '1') then
--			state := s13;
			state := s15;
			CalculateVirCompensated_mux <= '0';
		else
			state := s12;
			CalculateVirCompensated_mux <= '1';
		end if;

--	when s13 => state := s14;
--		ExtractOffsetParameters_run <= '1';
--		ExtractOffsetParameters_mux <= '1';
--	when s14 => 
--		ExtractOffsetParameters_run <= '0';
--		if (ExtractOffsetParameters_rdy = '1') then
--			state := s15;
--			ExtractOffsetParameters_mux <= '0';
--		else
--			state := s14;
--			ExtractOffsetParameters_mux <= '1';
--		end if;

	when s15 => state := s16;
		CalculateAlphaCP_run <= '1';
		CalculateAlphaCP_mux <= '1';
	when s16 => 
		CalculateAlphaCP_run <= '0';
		if (CalculateAlphaCP_rdy = '1') then
			state := s17;
			CalculateAlphaCP_mux <= '0';
		else
			state := s16;
			CalculateAlphaCP_mux <= '1';
		end if;

	when s17 => state := s18;
		ExtractAlphaParameters_run <= '1';
		ExtractAlphaParameters_mux <= '1';
	when s18 => 
		ExtractAlphaParameters_run <= '0';
		if (ExtractAlphaParameters_rdy = '1') then
			state := s19;
			ExtractAlphaParameters_mux <= '0';
		else
			state := s18;
			ExtractAlphaParameters_mux <= '1';
		end if;

	when s19 => state := s20;
		CalculateAlphaComp_run <= '1';
		CalculateAlphaComp_mux <= '1';
	when s20 => 
		CalculateAlphaComp_run <= '0';
		if (CalculateAlphaComp_rdy = '1') then
			state := s21;
			CalculateAlphaComp_mux <= '0';
		else
			state := s20;
			CalculateAlphaComp_mux <= '1';
		end if;

	when s21 => state := s22;
		CalculateTo_run <= '1';
		CalculateTo_mux <= '1';
	when s22 => 
		CalculateTo_run <= '0';
		if (CalculateTo_rdy = '1') then
			state := ending;
			CalculateTo_mux <= '0';
		else
			state := s22;
			CalculateTo_mux <= '1';
		end if;

	when ending => state := idle;
		rdyrecover <= '1';

	when others => null;
end case;
end if;
end if;
end process tester;

calculateVdd_clock <= i_clock;
calculateVdd_reset <= i_reset;
inst_calculateVdd : calculateVdd port map (
i_clock => calculateVdd_clock,
i_reset => calculateVdd_reset,
i_run => calculateVdd_run,
i2c_mem_ena => calculateVdd_i2c_mem_ena,
i2c_mem_addra => calculateVdd_i2c_mem_addra,
i2c_mem_douta => calculateVdd_i2c_mem_douta,
o_Vdd => calculateVdd_Vdd,
o_kvdd => calculateVdd_kvdd,
o_vdd25 => calculateVdd_vdd25,
o_ram0x072a => calculateVdd_ram0x072a,
o_rdy => calculateVdd_rdy
);

calculateTa_clock <= i_clock;
calculateTa_reset <= i_reset;
inst_calculateTa : calculateTa port map (
i_clock => calculateTa_clock,
i_reset => calculateTa_reset,
i_run => calculateTa_run,
i2c_mem_ena => calculateTa_i2c_mem_ena,
i2c_mem_addra => calculateTa_i2c_mem_addra,
i2c_mem_douta => calculateTa_i2c_mem_douta,
i_ram0x072a => calculateTa_ram0x072a,
i_kvdd => calculateTa_kvdd,
i_vdd25 => calculateTa_vdd25,
o_Ta => calculateTa_Ta,
o_rdy => calculateTa_rdy
);

--ExtractOffsetParameters_clock <= i_clock;
--ExtractOffsetParameters_reset <= i_reset;
--inst_ExtractOffsetParameters : ExtractOffsetParameters port map (
--i_clock => ExtractOffsetParameters_clock,
--i_reset => ExtractOffsetParameters_reset,
--i_run => ExtractOffsetParameters_run,
--i2c_mem_ena => ExtractOffsetParameters_i2c_mem_ena,
--i2c_mem_addra => ExtractOffsetParameters_i2c_mem_addra,
--i2c_mem_douta => ExtractOffsetParameters_i2c_mem_douta,
--o_do => ExtractOffsetParameters_do,
--i_addr => ExtractOffsetParameters_addr,
--o_done => ExtractOffsetParameters_done,
--o_rdy => ExtractOffsetParameters_rdy
--);

ExtractAlphaParameters_clock <= i_clock;
ExtractAlphaParameters_reset <= i_reset;
inst_ExtractAlphaParameters : ExtractAlphaParameters port map (
i_clock => ExtractAlphaParameters_clock,
i_reset => ExtractAlphaParameters_reset,
i_run => ExtractAlphaParameters_run,
i2c_mem_ena => ExtractAlphaParameters_i2c_mem_ena,
i2c_mem_addra => ExtractAlphaParameters_i2c_mem_addra,
i2c_mem_douta => ExtractAlphaParameters_i2c_mem_douta,
o_do => ExtractAlphaParameters_do,
i_addr => ExtractAlphaParameters_addr,
o_done => ExtractAlphaParameters_done,
o_rdy => ExtractAlphaParameters_rdy
);

CalculateAlphaCP_clock <= i_clock;
CalculateAlphaCP_reset <= i_reset;
inst_CalculateAlphaCP : CalculateAlphaCP
port map (
i_clock => CalculateAlphaCP_clock,
i_reset => CalculateAlphaCP_reset,
i_run => CalculateAlphaCP_run,
i2c_mem_ena => CalculateAlphaCP_i2c_mem_ena,
i2c_mem_addra => CalculateAlphaCP_i2c_mem_addra,
i2c_mem_douta => CalculateAlphaCP_i2c_mem_douta,
o_acpsubpage0 => CalculateAlphaCP_acpsubpage0,
o_acpsubpage1 => CalculateAlphaCP_acpsubpage1,
o_rdy => CalculateAlphaCP_rdy
);

CalculatePixOS_clock <= i_clock;
CalculatePixOS_reset <= i_reset;
CalculatePixOS_const1 <= x"3F800000"; -- 1
CalculatePixOS_Ta <= CalculateTa_Ta; -- xxx
CalculatePixOS_Ta0 <= x"41C80000"; -- 25
CalculatePixOS_Vdd <= CalculateVdd_Vdd; -- xxx
CalculatePixOS_VddV0 <= x"40533333"; -- 3.3
inst_CalculatePixOS : CalculatePixOS port map (
i_clock => CalculatePixOS_clock,
i_reset => CalculatePixOS_reset,
i_run => CalculatePixOS_run,
i2c_mem_ena => CalculatePixOS_i2c_mem_ena,
i2c_mem_addra => CalculatePixOS_i2c_mem_addra,
i2c_mem_douta => CalculatePixOS_i2c_mem_douta,
i_const1 => CalculatePixOS_const1,
i_Ta => CalculatePixOS_Ta,
i_Ta0 => CalculatePixOS_Ta0,
i_Vdd => CalculatePixOS_Vdd,
i_VddV0 => CalculatePixOS_VddV0,
o_do => CalculatePixOS_do,
i_addr => CalculatePixOS_addr,
o_rdy => CalculatePixOS_rdy
);

CalculatePixOsCPSP_clock <= i_clock;
CalculatePixOsCPSP_reset <= i_reset;
CalculatePixOsCPSP_Ta <= CalculateTa_Ta; -- xxx
CalculatePixOsCPSP_Ta0 <= x"41C80000"; -- 25
CalculatePixOsCPSP_Vdd <= CalculateVdd_Vdd; -- xxx
CalculatePixOsCPSP_VddV0 <= x"40533333"; -- 3.3
CalculatePixOsCPSP_const1 <= x"3F800000"; -- 1
inst_CalculatePixOsCPSP : CalculatePixOsCPSP port map (
i_clock => CalculatePixOsCPSP_clock,
i_reset => CalculatePixOsCPSP_reset,
i_run => CalculatePixOsCPSP_run,
i_Ta => CalculatePixOsCPSP_Ta,
i_Ta0 => CalculatePixOsCPSP_Ta0,
i_Vdd => CalculatePixOsCPSP_Vdd,
i_VddV0 => CalculatePixOsCPSP_VddV0,
i_const1 => CalculatePixOsCPSP_const1,
i2c_mem_ena => CalculatePixOsCPSP_i2c_mem_ena,
i2c_mem_addra => CalculatePixOsCPSP_i2c_mem_addra,
i2c_mem_douta => CalculatePixOsCPSP_i2c_mem_douta,
o_pixoscpsp0 => CalculatePixOsCPSP_pixoscpsp0,
o_pixoscpsp1 => CalculatePixOsCPSP_pixoscpsp1,
o_rdy => CalculatePixOsCPSP_rdy
);

CalculateVirCompensated_Emissivity <= x"3f800000"; -- 1
CalculateVirCompensated_pixoscpsp0 <= CalculatePixOsCPSP_pixoscpsp0;
CalculateVirCompensated_pixoscpsp1 <= CalculatePixOsCPSP_pixoscpsp1;
CalculateVirCompensated_clock <= i_clock;
CalculateVirCompensated_reset <= i_reset;
CalculateVirCompensated_pixos_do <= CalculatePixOS_do;
CalculatePixOS_addr <= CalculateVirCompensated_pixos_addr;
inst_CalculateVirCompensated : CalculateVirCompensated PORT MAP (
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
o_rdy => CalculateVirCompensated_rdy
);

CalculateAlphaComp_clock <= i_clock;
CalculateAlphaComp_reset <= i_reset;
CalculateAlphaComp_Ta <= CalculateTa_Ta;
CalculateAlphaComp_Ta0 <= x"41C80000"; -- 25
CalculateAlphaComp_acpsubpage0 <= CalculateAlphaCP_acpsubpage0;
CalculateAlphaComp_acpsubpage1 <= CalculateAlphaCP_acpsubpage1;
CalculateAlphaComp_const1 <= x"3f800000";
CalculateAlphaComp_alpha_do <= ExtractAlphaParameters_do;
ExtractAlphaParameters_addr <= CalculateAlphaComp_alpha_addr;
inst_CalculateAlphaComp : CalculateAlphaComp PORT MAP (
i_clock => CalculateAlphaComp_clock,
i_reset => CalculateAlphaComp_reset,
i_run => CalculateAlphaComp_run,
i2c_mem_ena => CalculateAlphaComp_i2c_mem_ena,
i2c_mem_addra => CalculateAlphaComp_i2c_mem_addra,
i2c_mem_douta => CalculateAlphaComp_i2c_mem_douta,
i_Ta => CalculateAlphaComp_Ta,
i_Ta0 => CalculateAlphaComp_Ta0,
i_acpsubpage0 => CalculateAlphaComp_acpsubpage0,
i_acpsubpage1 => CalculateAlphaComp_acpsubpage1,
i_const1 => CalculateAlphaComp_const1,
i_alpha_do => CalculateAlphaComp_alpha_do,
o_alpha_addr => CalculateAlphaComp_alpha_addr,
o_do => CalculateAlphaComp_do,
i_addr => CalculateAlphaComp_addr,
o_rdy => CalculateAlphaComp_rdy
);

CalculateTo_clock <= i_clock;
CalculateTo_reset <= i_reset;
CalculateTo_vircompensated_do <= CalculateVirCompensated_do;
CalculateVirCompensated_addr <= CalculateTo_vircompensated_addr;
CalculateTo_alphacomp_do <= CalculateAlphaComp_do;
CalculateAlphaComp_addr <= CalculateTo_alphacomp_addr;
CalculateTo_Ta <= CalculateTa_Ta;
inst_CalculateTo : CalculateTo PORT MAP (
i_clock => CalculateTo_clock,
i_reset => CalculateTo_reset,
i_run => CalculateTo_run,
i2c_mem_ena => CalculateTo_i2c_mem_ena,
i2c_mem_addra => CalculateTo_i2c_mem_addra,
i2c_mem_douta => CalculateTo_i2c_mem_douta,
i_Ta => CalculateTo_Ta,
i_vircompensated_do => CalculateTo_vircompensated_do,
o_vircompensated_addr => CalculateTo_vircompensated_addr,
i_alphacomp_do => CalculateTo_alphacomp_do,
o_alphacomp_addr => CalculateTo_alphacomp_addr,
o_do => CalculateTo_do,
i_addr => CalculateTo_addr,
o_rdy => CalculateTo_rdy
);
end architecture testbench;

