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

signal fixed2floatclk : std_logic;
signal addfpclk : std_logic;
signal subfpclk : std_logic;
signal mulfpclk : std_logic;
signal divfpclk : std_logic;

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

component calculateVdd is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_Vdd : out fd2ft; -- output Vdd
o_rdy : out std_logic;
fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr :  in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;
divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : out STD_LOGIC;
divfpce : out STD_LOGIC;
divfpsclr : out STD_LOGIC;
divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : in STD_LOGIC;
mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;
addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : out STD_LOGIC;
addfpce : out STD_LOGIC;
addfpsclr : out STD_LOGIC;
addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : in STD_LOGIC;
subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : out STD_LOGIC;
subfpce : out STD_LOGIC;
subfpsclr : out STD_LOGIC;
subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : in STD_LOGIC
);
end component calculateVdd;
signal calculateVdd_clock : std_logic;
signal calculateVdd_reset : std_logic;
signal calculateVdd_run : std_logic;
signal calculateVdd_i2c_mem_ena : STD_LOGIC;
signal calculateVdd_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal calculateVdd_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal calculateVdd_Vdd : fd2ft; -- output Vdd
signal calculateVdd_rdy : std_logic;
signal calculateVdd_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal calculateVdd_fixed2floatond : STD_LOGIC;
signal calculateVdd_fixed2floatce : STD_LOGIC;
signal calculateVdd_fixed2floatsclr : STD_LOGIC;
signal calculateVdd_fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_fixed2floatrdy : STD_LOGIC;
signal calculateVdd_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_divfpond : STD_LOGIC;
signal calculateVdd_divfpce : STD_LOGIC;
signal calculateVdd_divfpsclr : STD_LOGIC;
signal calculateVdd_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_divfprdy : STD_LOGIC;
signal calculateVdd_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_mulfpond : STD_LOGIC;
signal calculateVdd_mulfpce : STD_LOGIC;
signal calculateVdd_mulfpsclr : STD_LOGIC;
signal calculateVdd_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_mulfprdy : STD_LOGIC;
signal calculateVdd_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_addfpond : STD_LOGIC;
signal calculateVdd_addfpce : STD_LOGIC;
signal calculateVdd_addfpsclr : STD_LOGIC;
signal calculateVdd_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_addfprdy : STD_LOGIC;
signal calculateVdd_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_subfpond : STD_LOGIC;
signal calculateVdd_subfpce : STD_LOGIC;
signal calculateVdd_subfpsclr : STD_LOGIC;
signal calculateVdd_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal calculateVdd_subfprdy : STD_LOGIC;
signal CalculateVdd_fixed2floatclk : std_logic;
signal CalculateVdd_addfpclk : std_logic;
signal CalculateVdd_subfpclk : std_logic;
signal CalculateVdd_mulfpclk : std_logic;
signal CalculateVdd_divfpclk : std_logic;

component calculateTa is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
i_Vdd : in fd2ft;
o_Ta : out fd2ft; -- output Ta
o_rdy : out std_logic;
fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr :  in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;
divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : out STD_LOGIC;
divfpce : out STD_LOGIC;
divfpsclr : out STD_LOGIC;
divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : in STD_LOGIC;
mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;
addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : out STD_LOGIC;
addfpce : out STD_LOGIC;
addfpsclr : out STD_LOGIC;
addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : in STD_LOGIC;
subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : out STD_LOGIC;
subfpce : out STD_LOGIC;
subfpsclr : out STD_LOGIC;
subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : in STD_LOGIC
);
end component calculateTa;
signal CalculateTa_clock : std_logic;
signal CalculateTa_reset : std_logic;
signal CalculateTa_run : std_logic;
signal CalculateTa_i2c_mem_ena : STD_LOGIC;
signal CalculateTa_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculateTa_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculateTa_rdy : std_logic;
signal CalculateTa_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculateTa_fixed2floatond : STD_LOGIC;
signal CalculateTa_fixed2floatce : STD_LOGIC;
signal CalculateTa_fixed2floatsclr : STD_LOGIC;
signal CalculateTa_fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_fixed2floatrdy : STD_LOGIC;
signal CalculateTa_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_divfpond : STD_LOGIC;
signal CalculateTa_divfpce : STD_LOGIC;
signal CalculateTa_divfpsclr : STD_LOGIC;
signal CalculateTa_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_divfprdy : STD_LOGIC;
signal CalculateTa_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_mulfpond : STD_LOGIC;
signal CalculateTa_mulfpce : STD_LOGIC;
signal CalculateTa_mulfpsclr : STD_LOGIC;
signal CalculateTa_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_mulfprdy : STD_LOGIC;
signal CalculateTa_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_addfpond : STD_LOGIC;
signal CalculateTa_addfpce : STD_LOGIC;
signal CalculateTa_addfpsclr : STD_LOGIC;
signal CalculateTa_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_addfprdy : STD_LOGIC;
signal CalculateTa_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_subfpond : STD_LOGIC;
signal CalculateTa_subfpce : STD_LOGIC;
signal CalculateTa_subfpsclr : STD_LOGIC;
signal CalculateTa_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTa_subfprdy : STD_LOGIC;
signal CalculateTa_fixed2floatclk : std_logic;
signal CalculateTa_addfpclk : std_logic;
signal CalculateTa_subfpclk : std_logic;
signal CalculateTa_mulfpclk : std_logic;
signal CalculateTa_divfpclk : std_logic;
signal calculateTa_Vdd : fd2ft; -- from VDD
signal calculateTa_Ta : fd2ft; -- output Ta

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
o_rdy : out std_logic;
signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;
signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;
signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC;
signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC
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
signal ExtractAlphaParameters_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal ExtractAlphaParameters_fixed2floatond : STD_LOGIC;
signal ExtractAlphaParameters_fixed2floatsclr : STD_LOGIC;
signal ExtractAlphaParameters_fixed2floatce : STD_LOGIC;
signal ExtractAlphaParameters_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_fixed2floatrdy : STD_LOGIC;
signal ExtractAlphaParameters_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_mulfpond : STD_LOGIC;
signal ExtractAlphaParameters_mulfpsclr : STD_LOGIC;
signal ExtractAlphaParameters_mulfpce : STD_LOGIC;
signal ExtractAlphaParameters_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_mulfprdy : STD_LOGIC;
signal ExtractAlphaParameters_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_addfpond : STD_LOGIC;
signal ExtractAlphaParameters_addfpsclr : STD_LOGIC;
signal ExtractAlphaParameters_addfpce : STD_LOGIC;
signal ExtractAlphaParameters_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_addfprdy : STD_LOGIC;
signal ExtractAlphaParameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_divfpond : STD_LOGIC;
signal ExtractAlphaParameters_divfpsclr : STD_LOGIC;
signal ExtractAlphaParameters_divfpce : STD_LOGIC;
signal ExtractAlphaParameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractAlphaParameters_divfprdy : STD_LOGIC;

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
o_rdy : out std_logic;
signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;
signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC
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
signal CalculateAlphaCP_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_divfpond : STD_LOGIC;
signal CalculateAlphaCP_divfpsclr : STD_LOGIC;
signal CalculateAlphaCP_divfpce : STD_LOGIC;
signal CalculateAlphaCP_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_divfprdy : STD_LOGIC;
signal CalculateAlphaCP_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_mulfpond : STD_LOGIC;
signal CalculateAlphaCP_mulfpsclr : STD_LOGIC;
signal CalculateAlphaCP_mulfpce : STD_LOGIC;
signal CalculateAlphaCP_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_mulfprdy : STD_LOGIC;

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
o_rdy : out std_logic;
fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;
mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : out STD_LOGIC;
mulfpsclr : out STD_LOGIC;
mulfpce : out STD_LOGIC;
mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : in STD_LOGIC;
addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : out STD_LOGIC;
addfpsclr : out STD_LOGIC;
addfpce : out STD_LOGIC;
addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : in STD_LOGIC;
subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : out STD_LOGIC;
subfpsclr : out STD_LOGIC;
subfpce : out STD_LOGIC;
subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : in STD_LOGIC;
divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : out STD_LOGIC;
divfpsclr : out STD_LOGIC;
divfpce : out STD_LOGIC;
divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : in STD_LOGIC
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
signal CalculatePixOS_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculatePixOS_fixed2floatond : STD_LOGIC;
signal CalculatePixOS_fixed2floatce : STD_LOGIC;
signal CalculatePixOS_fixed2floatsclr : STD_LOGIC;
signal CalculatePixOS_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_fixed2floatrdy : STD_LOGIC;
signal CalculatePixOS_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_mulfpond : STD_LOGIC;
signal CalculatePixOS_mulfpsclr : STD_LOGIC;
signal CalculatePixOS_mulfpce : STD_LOGIC;
signal CalculatePixOS_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_mulfprdy : STD_LOGIC;
signal CalculatePixOS_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_divfpond : STD_LOGIC;
signal CalculatePixOS_divfpsclr : STD_LOGIC;
signal CalculatePixOS_divfpce : STD_LOGIC;
signal CalculatePixOS_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_divfprdy : STD_LOGIC;
signal CalculatePixOS_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_addfpond : STD_LOGIC;
signal CalculatePixOS_addfpsclr : STD_LOGIC;
signal CalculatePixOS_addfpce : STD_LOGIC;
signal CalculatePixOS_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_addfprdy : STD_LOGIC;
signal CalculatePixOS_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_subfpond : STD_LOGIC;
signal CalculatePixOS_subfpsclr : STD_LOGIC;
signal CalculatePixOS_subfpce : STD_LOGIC;
signal CalculatePixOS_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOS_subfprdy : STD_LOGIC;
signal CalculatePixOS_fixed2floatclk : std_logic;
signal CalculatePixOS_addfpclk : std_logic;
signal CalculatePixOS_subfpclk : std_logic;
signal CalculatePixOS_mulfpclk : std_logic;
signal CalculatePixOS_divfpclk : std_logic;

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
o_rdy : out std_logic;
signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;
signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;
signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;
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
signal subfprdy : in STD_LOGIC
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
signal CalculatePixOsCPSP_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculatePixOsCPSP_fixed2floatond : STD_LOGIC;
signal CalculatePixOsCPSP_fixed2floatsclr : STD_LOGIC;
signal CalculatePixOsCPSP_fixed2floatce : STD_LOGIC;
signal CalculatePixOsCPSP_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_fixed2floatrdy : STD_LOGIC;
signal CalculatePixOsCPSP_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_divfpond : STD_LOGIC;
signal CalculatePixOsCPSP_divfpsclr : STD_LOGIC;
signal CalculatePixOsCPSP_divfpce : STD_LOGIC;
signal CalculatePixOsCPSP_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_divfprdy : STD_LOGIC;
signal CalculatePixOsCPSP_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_mulfpond : STD_LOGIC;
signal CalculatePixOsCPSP_mulfpsclr : STD_LOGIC;
signal CalculatePixOsCPSP_mulfpce : STD_LOGIC;
signal CalculatePixOsCPSP_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_mulfprdy : STD_LOGIC;
signal CalculatePixOsCPSP_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_addfpond : STD_LOGIC;
signal CalculatePixOsCPSP_addfpsclr : STD_LOGIC;
signal CalculatePixOsCPSP_addfpce : STD_LOGIC;
signal CalculatePixOsCPSP_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_addfprdy : STD_LOGIC;
signal CalculatePixOsCPSP_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_subfpond : STD_LOGIC;
signal CalculatePixOsCPSP_subfpsclr : STD_LOGIC;
signal CalculatePixOsCPSP_subfpce : STD_LOGIC;
signal CalculatePixOsCPSP_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculatePixOsCPSP_subfprdy : STD_LOGIC;
signal CalculatePixOsCPSP_fixed2floatclk : STD_LOGIC;
signal CalculatePixOsCPSP_addfpclk : STD_LOGIC;
signal CalculatePixOsCPSP_subfpclk : STD_LOGIC;
signal CalculatePixOsCPSP_mulfpclk : STD_LOGIC;
signal CalculatePixOsCPSP_divfpclk : STD_LOGIC;

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

fixed2floata <=
CalculateVdd_fixed2floata when CalculateVdd_mux = '1'
else
CalculateTa_fixed2floata when CalculateTa_mux = '1'
else
CalculatePixOS_fixed2floata when CalculatePixOS_mux = '1'
else
CalculatePixOSCPSP_fixed2floata when CalculatePixOSCPSP_mux = '1'
else
ExtractAlphaParameters_fixed2floata when ExtractAlphaParameters_mux = '1'
else (others => '0');

fixed2floatond <=
CalculateVdd_fixed2floatond when CalculateVdd_mux = '1' 
else
CalculateTa_fixed2floatond when CalculateTa_mux = '1' 
else
CalculatePixOS_fixed2floatond when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_fixed2floatond when CalculatePixOSCPSP_mux = '1' 
else
ExtractAlphaParameters_fixed2floatond when ExtractAlphaParameters_mux = '1' 
else '0';

fixed2floatce <=
CalculateVdd_fixed2floatce when CalculateVdd_mux = '1' 
else
CalculateTa_fixed2floatce when CalculateTa_mux = '1' 
else
CalculatePixOS_fixed2floatce when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_fixed2floatce when CalculatePixOSCPSP_mux = '1' 
else
ExtractAlphaParameters_fixed2floatce when ExtractAlphaParameters_mux = '1' 
else '0';

fixed2floatsclr <=
CalculateVdd_fixed2floatsclr when CalculateVdd_mux = '1' 
else
CalculateTa_fixed2floatsclr when CalculateTa_mux = '1' 
else
CalculatePixOS_fixed2floatsclr when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_fixed2floatsclr when CalculatePixOSCPSP_mux = '1' 
else
ExtractAlphaParameters_fixed2floatsclr when ExtractAlphaParameters_mux = '1' 
else '0';

divfpa <=
CalculateVdd_divfpa when CalculateVdd_mux = '1' 
else
CalculateTa_divfpa when CalculateTa_mux = '1' 
else
CalculatePixOS_divfpa when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_divfpa when CalculatePixOSCPSP_mux = '1' 
else
CalculateAlphaCP_divfpa when CalculateAlphaCP_mux = '1' 
else
ExtractAlphaParameters_divfpa when ExtractAlphaParameters_mux = '1' 
else (others => '0');

divfpb <=
CalculateVdd_divfpb when CalculateVdd_mux = '1' 
else
CalculateTa_divfpb when CalculateTa_mux = '1' 
else
CalculatePixOS_divfpb when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_divfpb when CalculatePixOSCPSP_mux = '1' 
else
CalculateAlphaCP_divfpb when CalculateAlphaCP_mux = '1' 
else
ExtractAlphaParameters_divfpb when ExtractAlphaParameters_mux = '1' 
else (others => '0');

divfpond <=
CalculateVdd_divfpond when CalculateVdd_mux = '1' 
else
CalculateTa_divfpond when CalculateTa_mux = '1' 
else
CalculatePixOS_divfpond when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_divfpond when CalculatePixOSCPSP_mux = '1' 
else
CalculateAlphaCP_divfpond when CalculateAlphaCP_mux = '1' 
else
ExtractAlphaParameters_divfpond when ExtractAlphaParameters_mux = '1' 
else '0';

divfpce <=
CalculateVdd_divfpce when CalculateVdd_mux = '1' 
else
CalculateTa_divfpce when CalculateTa_mux = '1' 
else
CalculatePixOS_divfpce when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_divfpce when CalculatePixOSCPSP_mux = '1' 
else
CalculateAlphaCP_divfpce when CalculateAlphaCP_mux = '1' 
else
ExtractAlphaParameters_divfpce when ExtractAlphaParameters_mux = '1' 
else '0';

divfpsclr <=
CalculateVdd_divfpsclr when CalculateVdd_mux = '1' 
else
CalculateTa_divfpsclr when CalculateTa_mux = '1' 
else
CalculatePixOS_divfpsclr when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_divfpsclr when CalculatePixOSCPSP_mux = '1' 
else
CalculateAlphaCP_divfpsclr when CalculateAlphaCP_mux = '1' 
else
ExtractAlphaParameters_divfpsclr when ExtractAlphaParameters_mux = '1' 
else '0';

mulfpa <=
CalculateVdd_mulfpa when CalculateVdd_mux = '1' 
else
CalculateTa_mulfpa when CalculateTa_mux = '1' 
else
CalculatePixOS_mulfpa when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_mulfpa when CalculatePixOSCPSP_mux = '1' 
else
CalculateAlphaCP_mulfpa when CalculateAlphaCP_mux = '1' 
else
ExtractAlphaParameters_mulfpa when ExtractAlphaParameters_mux = '1' 
else (others => '0');

mulfpb <=
CalculateVdd_mulfpb when CalculateVdd_mux = '1' 
else
CalculateTa_mulfpb when CalculateTa_mux = '1' 
else
CalculatePixOS_mulfpb when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_mulfpb when CalculatePixOSCPSP_mux = '1' 
else
CalculateAlphaCP_mulfpb when CalculateAlphaCP_mux = '1' 
else
ExtractAlphaParameters_mulfpb when ExtractAlphaParameters_mux = '1' 
else (others => '0');

mulfpond <=
CalculateVdd_mulfpond when CalculateVdd_mux = '1' 
else
CalculateTa_mulfpond when CalculateTa_mux = '1' 
else
CalculatePixOS_mulfpond when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_mulfpond when CalculatePixOSCPSP_mux = '1' 
else
CalculateAlphaCP_mulfpond when CalculateAlphaCP_mux = '1' 
else
ExtractAlphaParameters_mulfpond when ExtractAlphaParameters_mux = '1' 
else '0';

mulfpce <=
CalculateVdd_mulfpce when CalculateVdd_mux = '1' 
else
CalculateTa_mulfpce when CalculateTa_mux = '1' 
else
CalculatePixOS_mulfpce when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_mulfpce when CalculatePixOSCPSP_mux = '1' 
else
CalculateAlphaCP_mulfpce when CalculateAlphaCP_mux = '1' 
else
ExtractAlphaParameters_mulfpce when ExtractAlphaParameters_mux = '1' 
else '0';

mulfpsclr <=
CalculateVdd_mulfpsclr when CalculateVdd_mux = '1' 
else
CalculateTa_mulfpsclr when CalculateTa_mux = '1' 
else
CalculatePixOS_mulfpsclr when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_mulfpsclr when CalculatePixOSCPSP_mux = '1' 
else
CalculateAlphaCP_mulfpsclr when CalculateAlphaCP_mux = '1' 
else
ExtractAlphaParameters_mulfpsclr when ExtractAlphaParameters_mux = '1' 
else '0';

addfpa <=
CalculateVdd_addfpa when CalculateVdd_mux = '1' 
else
CalculateTa_addfpa when CalculateTa_mux = '1' 
else
CalculatePixOS_addfpa when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_addfpa when CalculatePixOSCPSP_mux = '1' 
else
ExtractAlphaParameters_addfpa when ExtractAlphaParameters_mux = '1' 
else (others => '0');

addfpb <=
CalculateVdd_addfpb when CalculateVdd_mux = '1' 
else
CalculateTa_addfpb when CalculateTa_mux = '1' 
else
CalculatePixOS_addfpb when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_addfpb when CalculatePixOSCPSP_mux = '1' 
else
ExtractAlphaParameters_addfpb when ExtractAlphaParameters_mux = '1' 
else (others => '0');

addfpond <=
CalculateVdd_addfpond when CalculateVdd_mux = '1' 
else
CalculateTa_addfpond when CalculateTa_mux = '1' 
else
CalculatePixOS_addfpond when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_addfpond when CalculatePixOSCPSP_mux = '1' 
else
ExtractAlphaParameters_addfpond when ExtractAlphaParameters_mux = '1' 
else '0';

addfpce <=
CalculateVdd_addfpce when CalculateVdd_mux = '1' 
else
CalculateTa_addfpce when CalculateTa_mux = '1' 
else
CalculatePixOS_addfpce when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_addfpce when CalculatePixOSCPSP_mux = '1' 
else
ExtractAlphaParameters_addfpce when ExtractAlphaParameters_mux = '1' 
else '0';

addfpsclr <=
CalculateVdd_addfpsclr when CalculateVdd_mux = '1' 
else
CalculateTa_addfpsclr when CalculateTa_mux = '1' 
else
CalculatePixOS_addfpsclr when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_addfpsclr when CalculatePixOSCPSP_mux = '1' 
else
ExtractAlphaParameters_addfpsclr when ExtractAlphaParameters_mux = '1' 
else '0';

subfpa <=
CalculateVdd_subfpa when CalculateVdd_mux = '1' 
else
CalculateTa_subfpa when CalculateTa_mux = '1' 
else
CalculatePixOS_subfpa when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_subfpa when CalculatePixOSCPSP_mux = '1' 
else (others => '0');

subfpb <=
CalculateVdd_subfpb when CalculateVdd_mux = '1' 
else
CalculateTa_subfpb when CalculateTa_mux = '1' 
else
CalculatePixOS_subfpb when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_subfpb when CalculatePixOSCPSP_mux = '1' 
else (others => '0');

subfpond <=
CalculateVdd_subfpond when CalculateVdd_mux = '1' 
else
CalculateTa_subfpond when CalculateTa_mux = '1' 
else
CalculatePixOS_subfpond when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_subfpond when CalculatePixOSCPSP_mux = '1' 
else '0';

subfpce <=
CalculateVdd_subfpce when CalculateVdd_mux = '1' 
else
CalculateTa_subfpce when CalculateTa_mux = '1' 
else
CalculatePixOS_subfpce when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_subfpce when CalculatePixOSCPSP_mux = '1' 
else '0';

subfpsclr <=
CalculateVdd_subfpsclr when CalculateVdd_mux = '1' 
else
CalculateTa_subfpsclr when CalculateTa_mux = '1' 
else
CalculatePixOS_subfpsclr when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_subfpsclr when CalculatePixOSCPSP_mux = '1' 
else '0';

CalculateVdd_fixed2floatr <= fixed2floatr when CalculateVdd_mux = '1' else (others => '0');
CalculateVdd_fixed2floatrdy <= fixed2floatrdy when CalculateVdd_mux = '1' else '0';
CalculateVdd_divfpr <= divfpr when CalculateVdd_mux = '1' else (others => '0');
CalculateVdd_divfprdy <= divfprdy when CalculateVdd_mux = '1' else '0';
CalculateVdd_mulfpr <= mulfpr when CalculateVdd_mux = '1' else (others => '0');
CalculateVdd_mulfprdy <= mulfprdy when CalculateVdd_mux = '1' else '0';
CalculateVdd_addfpr <= addfpr when CalculateVdd_mux = '1' else (others => '0');
CalculateVdd_addfprdy <= addfprdy when CalculateVdd_mux = '1' else '0';
CalculateVdd_subfpr <= subfpr when CalculateVdd_mux = '1' else (others => '0');
CalculateVdd_subfprdy <= subfprdy when CalculateVdd_mux = '1' else '0';

CalculateTa_fixed2floatr <= fixed2floatr when CalculateTa_mux = '1' else (others => '0');
CalculateTa_fixed2floatrdy <= fixed2floatrdy when CalculateTa_mux = '1' else '0';
CalculateTa_divfpr <= divfpr when CalculateTa_mux = '1' else (others => '0');
CalculateTa_divfprdy <= divfprdy when CalculateTa_mux = '1' else '0';
CalculateTa_mulfpr <= mulfpr when CalculateTa_mux = '1' else (others => '0');
CalculateTa_mulfprdy <= mulfprdy when CalculateTa_mux = '1' else '0';
CalculateTa_addfpr <= addfpr when CalculateTa_mux = '1' else (others => '0');
CalculateTa_addfprdy <= addfprdy when CalculateTa_mux = '1' else '0';
CalculateTa_subfpr <= subfpr when CalculateTa_mux = '1' else (others => '0');
CalculateTa_subfprdy <= subfprdy when CalculateTa_mux = '1' else '0';

CalculatePixOS_fixed2floatr <= fixed2floatr when CalculatePixOS_mux = '1' else (others => '0');
CalculatePixOS_fixed2floatrdy <= fixed2floatrdy when CalculatePixOS_mux = '1' else '0';
CalculatePixOS_divfpr <= divfpr when CalculatePixOS_mux = '1' else (others => '0');
CalculatePixOS_divfprdy <= divfprdy when CalculatePixOS_mux = '1' else '0';
CalculatePixOS_mulfpr <= mulfpr when CalculatePixOS_mux = '1' else (others => '0');
CalculatePixOS_mulfprdy <= mulfprdy when CalculatePixOS_mux = '1' else '0';
CalculatePixOS_addfpr <= addfpr when CalculatePixOS_mux = '1' else (others => '0');
CalculatePixOS_addfprdy <= addfprdy when CalculatePixOS_mux = '1' else '0';
CalculatePixOS_subfpr <= subfpr when CalculatePixOS_mux = '1' else (others => '0');
CalculatePixOS_subfprdy <= subfprdy when CalculatePixOS_mux = '1' else '0';

CalculatePixOSCPSP_fixed2floatr <= fixed2floatr when CalculatePixOSCPSP_mux = '1' else (others => '0');
CalculatePixOSCPSP_fixed2floatrdy <= fixed2floatrdy when CalculatePixOSCPSP_mux = '1' else '0';
CalculatePixOSCPSP_divfpr <= divfpr when CalculatePixOSCPSP_mux = '1' else (others => '0');
CalculatePixOSCPSP_divfprdy <= divfprdy when CalculatePixOSCPSP_mux = '1' else '0';
CalculatePixOSCPSP_mulfpr <= mulfpr when CalculatePixOSCPSP_mux = '1' else (others => '0');
CalculatePixOSCPSP_mulfprdy <= mulfprdy when CalculatePixOSCPSP_mux = '1' else '0';
CalculatePixOSCPSP_addfpr <= addfpr when CalculatePixOSCPSP_mux = '1' else (others => '0');
CalculatePixOSCPSP_addfprdy <= addfprdy when CalculatePixOSCPSP_mux = '1' else '0';
CalculatePixOSCPSP_subfpr <= subfpr when CalculatePixOSCPSP_mux = '1' else (others => '0');
CalculatePixOSCPSP_subfprdy <= subfprdy when CalculatePixOSCPSP_mux = '1' else '0';

CalculateAlphaCP_divfpr <= divfpr when CalculateAlphaCP_mux = '1' else (others => '0');
CalculateAlphaCP_divfprdy <= divfprdy when CalculateAlphaCP_mux = '1' else '0';
CalculateAlphaCP_mulfpr <= mulfpr when CalculateAlphaCP_mux = '1' else (others => '0');
CalculateAlphaCP_mulfprdy <= mulfprdy when CalculateAlphaCP_mux = '1' else '0';

ExtractAlphaParameters_fixed2floatr <= fixed2floatr when ExtractAlphaParameters_mux = '1' else (others => '0');
ExtractAlphaParameters_fixed2floatrdy <= fixed2floatrdy when ExtractAlphaParameters_mux = '1' else '0';
ExtractAlphaParameters_divfpr <= divfpr when ExtractAlphaParameters_mux = '1' else (others => '0');
ExtractAlphaParameters_divfprdy <= divfprdy when ExtractAlphaParameters_mux = '1' else '0';
ExtractAlphaParameters_mulfpr <= mulfpr when ExtractAlphaParameters_mux = '1' else (others => '0');
ExtractAlphaParameters_mulfprdy <= mulfprdy when ExtractAlphaParameters_mux = '1' else '0';
ExtractAlphaParameters_addfpr <= addfpr when ExtractAlphaParameters_mux = '1' else (others => '0');
ExtractAlphaParameters_addfprdy <= addfprdy when ExtractAlphaParameters_mux = '1' else '0';

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
--		CalculateTa_ram0x072a <= CalculateVdd_ram0x072a;
--		CalculateTa_kvdd <= CalculateVdd_kvdd;
--		CalculateTa_vdd25 <= CalculateVdd_vdd25;
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
i_clock => CalculateVdd_clock,
i_reset => CalculateVdd_reset,
i_run => CalculateVdd_run,
i2c_mem_ena => CalculateVdd_i2c_mem_ena,
i2c_mem_addra => CalculateVdd_i2c_mem_addra,
i2c_mem_douta => CalculateVdd_i2c_mem_douta,
o_Vdd => CalculateVdd_Vdd, -- output Vdd
o_rdy => CalculateVdd_rdy,
fixed2floata => CalculateVdd_fixed2floata,
fixed2floatond => CalculateVdd_fixed2floatond,
fixed2floatce => CalculateVdd_fixed2floatce,
fixed2floatsclr => CalculateVdd_fixed2floatsclr,
fixed2floatr => CalculateVdd_fixed2floatr,
fixed2floatrdy => CalculateVdd_fixed2floatrdy,
divfpa => CalculateVdd_divfpa,
divfpb => CalculateVdd_divfpb,
divfpond => CalculateVdd_divfpond,
divfpce => CalculateVdd_divfpce,
divfpsclr => CalculateVdd_divfpsclr,
divfpr => CalculateVdd_divfpr,
divfprdy => CalculateVdd_divfprdy,
mulfpa => CalculateVdd_mulfpa,
mulfpb => CalculateVdd_mulfpb,
mulfpond => CalculateVdd_mulfpond,
mulfpce => CalculateVdd_mulfpce,
mulfpsclr => CalculateVdd_mulfpsclr,
mulfpr => CalculateVdd_mulfpr,
mulfprdy => CalculateVdd_mulfprdy,
addfpa => CalculateVdd_addfpa,
addfpb => CalculateVdd_addfpb,
addfpond => CalculateVdd_addfpond,
addfpce => CalculateVdd_addfpce,
addfpsclr => CalculateVdd_addfpsclr,
addfpr => CalculateVdd_addfpr,
addfprdy => CalculateVdd_addfprdy,
subfpa => CalculateVdd_subfpa,
subfpb => CalculateVdd_subfpb,
subfpond => CalculateVdd_subfpond,
subfpce => CalculateVdd_subfpce,
subfpsclr => CalculateVdd_subfpsclr,
subfpr => CalculateVdd_subfpr,
subfprdy  => CalculateVdd_subfprdy
);

calculateTa_clock <= i_clock;
calculateTa_reset <= i_reset;
calculateTa_Vdd <= calculateVdd_Vdd;
inst_calculateTa : calculateTa port map (
i_clock => CalculateTa_clock,
i_reset => CalculateTa_reset,
i_run => CalculateTa_run,
i2c_mem_ena => CalculateTa_i2c_mem_ena,
i2c_mem_addra => CalculateTa_i2c_mem_addra,
i2c_mem_douta => CalculateTa_i2c_mem_douta,
i_Vdd => CalculateTa_Vdd, -- output Vdd
o_Ta => CalculateTa_Ta, -- output Ta
o_rdy => CalculateTa_rdy,
fixed2floata => CalculateTa_fixed2floata,
fixed2floatond => CalculateTa_fixed2floatond,
fixed2floatce => CalculateTa_fixed2floatce,
fixed2floatsclr => CalculateTa_fixed2floatsclr,
fixed2floatr => CalculateTa_fixed2floatr,
fixed2floatrdy => CalculateTa_fixed2floatrdy,
divfpa => CalculateTa_divfpa,
divfpb => CalculateTa_divfpb,
divfpond => CalculateTa_divfpond,
divfpce => CalculateTa_divfpce,
divfpsclr => CalculateTa_divfpsclr,
divfpr => CalculateTa_divfpr,
divfprdy => CalculateTa_divfprdy,
mulfpa => CalculateTa_mulfpa,
mulfpb => CalculateTa_mulfpb,
mulfpond => CalculateTa_mulfpond,
mulfpce => CalculateTa_mulfpce,
mulfpsclr => CalculateTa_mulfpsclr,
mulfpr => CalculateTa_mulfpr,
mulfprdy => CalculateTa_mulfprdy,
addfpa => CalculateTa_addfpa,
addfpb => CalculateTa_addfpb,
addfpond => CalculateTa_addfpond,
addfpce => CalculateTa_addfpce,
addfpsclr => CalculateTa_addfpsclr,
addfpr => CalculateTa_addfpr,
addfprdy => CalculateTa_addfprdy,
subfpa => CalculateTa_subfpa,
subfpb => CalculateTa_subfpb,
subfpond => CalculateTa_subfpond,
subfpce => CalculateTa_subfpce,
subfpsclr => CalculateTa_subfpsclr,
subfpr => CalculateTa_subfpr,
subfprdy  => CalculateTa_subfprdy
);

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
o_rdy => ExtractAlphaParameters_rdy,

fixed2floata => ExtractAlphaParameters_fixed2floata,
fixed2floatond => ExtractAlphaParameters_fixed2floatond,
fixed2floatsclr => ExtractAlphaParameters_fixed2floatsclr,
fixed2floatce => ExtractAlphaParameters_fixed2floatce,
fixed2floatr => ExtractAlphaParameters_fixed2floatr,
fixed2floatrdy => ExtractAlphaParameters_fixed2floatrdy,

mulfpa => ExtractAlphaParameters_mulfpa,
mulfpb => ExtractAlphaParameters_mulfpb,
mulfpond => ExtractAlphaParameters_mulfpond,
mulfpsclr => ExtractAlphaParameters_mulfpsclr,
mulfpce => ExtractAlphaParameters_mulfpce,
mulfpr => ExtractAlphaParameters_mulfpr,
mulfprdy => ExtractAlphaParameters_mulfprdy,

addfpa => ExtractAlphaParameters_addfpa,
addfpb => ExtractAlphaParameters_addfpb,
addfpond => ExtractAlphaParameters_addfpond,
addfpsclr => ExtractAlphaParameters_addfpsclr,
addfpce => ExtractAlphaParameters_addfpce,
addfpr => ExtractAlphaParameters_addfpr,
addfprdy => ExtractAlphaParameters_addfprdy,

divfpa => ExtractAlphaParameters_divfpa,
divfpb => ExtractAlphaParameters_divfpb,
divfpond => ExtractAlphaParameters_divfpond,
divfpsclr => ExtractAlphaParameters_divfpsclr,
divfpce => ExtractAlphaParameters_divfpce,
divfpr => ExtractAlphaParameters_divfpr,
divfprdy => ExtractAlphaParameters_divfprdy
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
o_rdy => CalculateAlphaCP_rdy,

divfpa => CalculateAlphaCP_divfpa,
divfpb => CalculateAlphaCP_divfpb,
divfpond => CalculateAlphaCP_divfpond,
divfpsclr => CalculateAlphaCP_divfpsclr,
divfpce => CalculateAlphaCP_divfpce,
divfpr => CalculateAlphaCP_divfpr,
divfprdy => CalculateAlphaCP_divfprdy,

mulfpa => CalculateAlphaCP_mulfpa,
mulfpb => CalculateAlphaCP_mulfpb,
mulfpond => CalculateAlphaCP_mulfpond,
mulfpsclr => CalculateAlphaCP_mulfpsclr,
mulfpce => CalculateAlphaCP_mulfpce,
mulfpr => CalculateAlphaCP_mulfpr,
mulfprdy => CalculateAlphaCP_mulfprdy
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
o_rdy => CalculatePixOS_rdy,
fixed2floata => CalculatePixOS_fixed2floata,
fixed2floatond => CalculatePixOS_fixed2floatond,
fixed2floatce => CalculatePixOS_fixed2floatce,
fixed2floatsclr => CalculatePixOS_fixed2floatsclr,
fixed2floatr => CalculatePixOS_fixed2floatr,
fixed2floatrdy => CalculatePixOS_fixed2floatrdy,
mulfpa => CalculatePixOS_mulfpa,
mulfpb => CalculatePixOS_mulfpb,
mulfpond => CalculatePixOS_mulfpond,
mulfpsclr => CalculatePixOS_mulfpsclr,
mulfpce => CalculatePixOS_mulfpce,
mulfpr => CalculatePixOS_mulfpr,
mulfprdy => CalculatePixOS_mulfprdy,
addfpa => CalculatePixOS_addfpa,
addfpb => CalculatePixOS_addfpb,
addfpond => CalculatePixOS_addfpond,
addfpsclr => CalculatePixOS_addfpsclr,
addfpce => CalculatePixOS_addfpce,
addfpr => CalculatePixOS_addfpr,
addfprdy => CalculatePixOS_addfprdy,
subfpa => CalculatePixOS_subfpa,
subfpb => CalculatePixOS_subfpb,
subfpond => CalculatePixOS_subfpond,
subfpsclr => CalculatePixOS_subfpsclr,
subfpce => CalculatePixOS_subfpce,
subfpr => CalculatePixOS_subfpr,
subfprdy => CalculatePixOS_subfprdy,
divfpa => CalculatePixOS_divfpa,
divfpb => CalculatePixOS_divfpb,
divfpond => CalculatePixOS_divfpond,
divfpsclr => CalculatePixOS_divfpsclr,
divfpce => CalculatePixOS_divfpce,
divfpr => CalculatePixOS_divfpr,
divfprdy => CalculatePixOS_divfprdy
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
o_rdy => CalculatePixOsCPSP_rdy,

fixed2floata => CalculatePixOSCPSP_fixed2floata,
fixed2floatond => CalculatePixOSCPSP_fixed2floatond,
fixed2floatsclr => CalculatePixOSCPSP_fixed2floatsclr,
fixed2floatce => CalculatePixOSCPSP_fixed2floatce,
fixed2floatr => CalculatePixOSCPSP_fixed2floatr,
fixed2floatrdy => CalculatePixOSCPSP_fixed2floatrdy,

divfpa => CalculatePixOSCPSP_divfpa,
divfpb => CalculatePixOSCPSP_divfpb,
divfpond => CalculatePixOSCPSP_divfpond,
divfpsclr => CalculatePixOSCPSP_divfpsclr,
divfpce => CalculatePixOSCPSP_divfpce,
divfpr => CalculatePixOSCPSP_divfpr,
divfprdy => CalculatePixOSCPSP_divfprdy,

mulfpa => CalculatePixOSCPSP_mulfpa,
mulfpb => CalculatePixOSCPSP_mulfpb,
mulfpond => CalculatePixOSCPSP_mulfpond,
mulfpsclr => CalculatePixOSCPSP_mulfpsclr,
mulfpce => CalculatePixOSCPSP_mulfpce,
mulfpr => CalculatePixOSCPSP_mulfpr,
mulfprdy => CalculatePixOSCPSP_mulfprdy,

addfpa => CalculatePixOSCPSP_addfpa,
addfpb => CalculatePixOSCPSP_addfpb,
addfpond => CalculatePixOSCPSP_addfpond,
addfpsclr => CalculatePixOSCPSP_addfpsclr,
addfpce => CalculatePixOSCPSP_addfpce,
addfpr => CalculatePixOSCPSP_addfpr,
addfprdy => CalculatePixOSCPSP_addfprdy,

subfpa => CalculatePixOSCPSP_subfpa,
subfpb => CalculatePixOSCPSP_subfpb,
subfpond => CalculatePixOSCPSP_subfpond,
subfpsclr => CalculatePixOSCPSP_subfpsclr,
subfpce => CalculatePixOSCPSP_subfpce,
subfpr => CalculatePixOSCPSP_subfpr,
subfprdy => CalculatePixOSCPSP_subfprdy
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

fixed2floatclk <= i_clock;
addfpclk <= i_clock;
subfpclk <= i_clock;
mulfpclk <= i_clock;
divfpclk <= i_clock;

inst_fixed2float : fixed2float
PORT MAP (
a => fixed2floata,
operation_nd => fixed2floatond,
clk => fixed2floatclk,
sclr => fixed2floatsclr,
ce => fixed2floatce,
result => fixed2floatr,
rdy => fixed2floatrdy
);

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

end architecture testbench;

