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

--library ieee, ieee_proposed;
library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--use ieee_proposed.fixed_pkg.all;
--use ieee_proposed.fixed_synth.all;


--library UNISIM;
--use UNISIM.VComponents.all;

--use work.p_fphdl_package1.all;

entity test_fixed_melexis is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_rdy : out std_logic;

i_addr : in std_logic_vector(9 downto 0);
o_do : out std_logic_vector(31 downto 0);

signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;

signal addfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfpond : out STD_LOGIC;
signal addfpce : out STD_LOGIC;
signal addfpsclr : out STD_LOGIC;
signal addfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal addfprdy : in STD_LOGIC;

signal subfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond : out STD_LOGIC;
signal subfpce : out STD_LOGIC;
signal subfpsclr : out STD_LOGIC;
signal subfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy : in STD_LOGIC;

signal sqrtfp2a : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : out STD_LOGIC;
signal sqrtfp2sclr : out STD_LOGIC;
signal sqrtfp2ce : out STD_LOGIC;
signal sqrtfp2r : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : in STD_LOGIC

);
end entity test_fixed_melexis;

architecture testbench of test_fixed_melexis is

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
END COMPONENT rom_constants;
signal rom_constants_clock : std_logic;
signal rom_constants_reset : std_logic;
signal rom_constants_kvptat_en : std_logic;
signal rom_constants_kvptat_adr : std_logic_vector(5 downto 0);
signal rom_constants_alphaptat_en : std_logic;
signal rom_constants_alphaptat_adr : std_logic_vector(3 downto 0);
signal rom_constants_signed4bit_en : std_logic;
signal rom_constants_signed4bit_adr : std_logic_vector(3 downto 0);
signal rom_constants_signed6bit_en : std_logic;
signal rom_constants_signed6bit_adr : std_logic_vector(5 downto 0);
signal rom_constants_alphascale_1_en : std_logic;
signal rom_constants_alphascale_1_adr : std_logic_vector(3 downto 0);
signal rom_constants_2powx_4bit_en : std_logic;
signal rom_constants_2powx_4bit_adr : std_logic_vector(3 downto 0);
signal rom_constants_cpratio_en : std_logic;
signal rom_constants_cpratio_adr : std_logic_vector(5 downto 0);
signal rom_constants_alphascale_2_en : std_logic;
signal rom_constants_alphascale_2_adr : std_logic_vector(3 downto 0);
signal rom_constants_2powx_p8_4bit_en : std_logic;
signal rom_constants_2powx_p8_4bit_adr : std_logic_vector(3 downto 0);
signal rom_constants_signed3bit_en : std_logic;
signal rom_constants_signed3bit_adr : std_logic_vector(2 downto 0);
signal rom_constants_float : std_logic_vector(31 downto 0);

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

component CalculateVdd is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_Vdd : out std_logic_vector (31 downto 0); -- output Vdd
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
end component CalculateVdd;
signal CalculateVdd_clock : std_logic;
signal CalculateVdd_reset : std_logic;
signal CalculateVdd_run : std_logic;
signal CalculateVdd_i2c_mem_ena : STD_LOGIC;
signal CalculateVdd_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculateVdd_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculateVdd_Vdd : std_logic_vector (31 downto 0); -- output Vdd
signal CalculateVdd_rdy : std_logic;
signal CalculateVdd_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculateVdd_fixed2floatond : STD_LOGIC;
signal CalculateVdd_fixed2floatce : STD_LOGIC;
signal CalculateVdd_fixed2floatsclr : STD_LOGIC;
signal CalculateVdd_fixed2floatr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_fixed2floatrdy : STD_LOGIC;
signal CalculateVdd_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_divfpond : STD_LOGIC;
signal CalculateVdd_divfpce : STD_LOGIC;
signal CalculateVdd_divfpsclr : STD_LOGIC;
signal CalculateVdd_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_divfprdy : STD_LOGIC;
signal CalculateVdd_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_mulfpond : STD_LOGIC;
signal CalculateVdd_mulfpce : STD_LOGIC;
signal CalculateVdd_mulfpsclr : STD_LOGIC;
signal CalculateVdd_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_mulfprdy : STD_LOGIC;
signal CalculateVdd_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_addfpond : STD_LOGIC;
signal CalculateVdd_addfpce : STD_LOGIC;
signal CalculateVdd_addfpsclr : STD_LOGIC;
signal CalculateVdd_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_addfprdy : STD_LOGIC;
signal CalculateVdd_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_subfpond : STD_LOGIC;
signal CalculateVdd_subfpce : STD_LOGIC;
signal CalculateVdd_subfpsclr : STD_LOGIC;
signal CalculateVdd_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVdd_subfprdy : STD_LOGIC;
signal CalculateVdd_fixed2floatclk : std_logic;
signal CalculateVdd_addfpclk : std_logic;
signal CalculateVdd_subfpclk : std_logic;
signal CalculateVdd_mulfpclk : std_logic;
signal CalculateVdd_divfpclk : std_logic;

component CalculateTa is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
i_Vdd : in std_logic_vector (31 downto 0);
o_Ta : out std_logic_vector (31 downto 0); -- output Ta
o_rdy : out std_logic;
o_kvptat_ena : out std_logic;
o_kvptat_adr : out std_logic_vector (5 downto 0);
o_alphaptat_ena : out std_logic;
o_alphaptat_adr : out std_logic_vector (3 downto 0);
i_rom_constants_float : in std_logic_vector (31 downto 0);
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
end component CalculateTa;
signal CalculateTa_clock : std_logic;
signal CalculateTa_reset : std_logic;
signal CalculateTa_run : std_logic;
signal CalculateTa_i2c_mem_ena : STD_LOGIC;
signal CalculateTa_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculateTa_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculateTa_rdy : std_logic;
signal CalculateTa_kvptat_ena : std_logic;
signal CalculateTa_kvptat_adr : std_logic_vector (5 downto 0);
signal CalculateTa_alphaptat_ena : std_logic;
signal CalculateTa_alphaptat_adr : std_logic_vector (3 downto 0);
signal CalculateTa_rom_constants_float : std_logic_vector (31 downto 0);
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
signal CalculateTa_Vdd : std_logic_vector (31 downto 0); -- from VDD
signal CalculateTa_Ta : std_logic_vector (31 downto 0); -- output Ta

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
signal o_signed4bit_ena : out std_logic;
signal o_signed4bit_adr : out std_logic_vector (3 downto 0);
signal o_signed6bit_ena : out std_logic;
signal o_signed6bit_adr : out std_logic_vector (5 downto 0);
signal o_alphascale_1_ena : out std_logic;
signal o_alphascale_1_adr : out std_logic_vector (3 downto 0);
signal o_2powx_4bit_ena : out std_logic;
signal o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);
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
signal ExtractAlphaParameters_signed4bit_ena : std_logic;
signal ExtractAlphaParameters_signed4bit_adr : std_logic_vector (3 downto 0);
signal ExtractAlphaParameters_signed6bit_ena : std_logic;
signal ExtractAlphaParameters_signed6bit_adr : std_logic_vector (5 downto 0);
signal ExtractAlphaParameters_alphascale_1_ena : std_logic;
signal ExtractAlphaParameters_alphascale_1_adr : std_logic_vector (3 downto 0);
signal ExtractAlphaParameters_2powx_4bit_ena : std_logic;
signal ExtractAlphaParameters_2powx_4bit_adr : std_logic_vector (3 downto 0);
signal ExtractAlphaParameters_rom_constants_float : std_logic_vector (31 downto 0);
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
o_acpsubpage0 : out std_logic_vector (31 downto 0);
o_acpsubpage1 : out std_logic_vector (31 downto 0);
o_rdy : out std_logic;
signal o_cpratio_ena : out std_logic;
signal o_cpratio_adr : out std_logic_vector (5 downto 0);
signal o_alphascale_2_ena : out std_logic;
signal o_alphascale_2_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);
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
signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC
);
end component CalculateAlphaCP;
signal CalculateAlphaCP_clock : std_logic;
signal CalculateAlphaCP_reset : std_logic;
signal CalculateAlphaCP_run : std_logic;
signal CalculateAlphaCP_i2c_mem_ena : STD_LOGIC;
signal CalculateAlphaCP_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculateAlphaCP_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculateAlphaCP_acpsubpage0 : std_logic_vector (31 downto 0);
signal CalculateAlphaCP_acpsubpage1 : std_logic_vector (31 downto 0);
signal CalculateAlphaCP_rdy : std_logic;
signal CalculateAlphaCP_cpratio_ena : std_logic;
signal CalculateAlphaCP_cpratio_adr : std_logic_vector (5 downto 0);
signal CalculateAlphaCP_alphascale_2_ena : std_logic;
signal CalculateAlphaCP_alphascale_2_adr : std_logic_vector (3 downto 0);
signal CalculateAlphaCP_rom_constants_float : std_logic_vector (31 downto 0);
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
signal CalculateAlphaCP_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculateAlphaCP_fixed2floatond : STD_LOGIC;
signal CalculateAlphaCP_fixed2floatce : STD_LOGIC;
signal CalculateAlphaCP_fixed2floatsclr : STD_LOGIC;
signal CalculateAlphaCP_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaCP_fixed2floatrdy : STD_LOGIC;

component CalculateKGain is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_KGain : out std_logic_vector (31 downto 0);
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
signal divfprdy : in STD_LOGIC

);
end component CalculateKGain;
signal CalculateKGain_clock : std_logic;
signal CalculateKGain_reset : std_logic;
signal CalculateKGain_run : std_logic;
signal CalculateKGain_i2c_mem_ena : STD_LOGIC;
signal CalculateKGain_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculateKGain_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculateKGain_KGain : std_logic_vector (31 downto 0);
signal CalculateKGain_rdy : std_logic;

signal CalculateKGain_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculateKGain_fixed2floatond : STD_LOGIC;
signal CalculateKGain_fixed2floatsclr : STD_LOGIC;
signal CalculateKGain_fixed2floatce : STD_LOGIC;
signal CalculateKGain_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateKGain_fixed2floatrdy : STD_LOGIC;

signal CalculateKGain_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateKGain_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateKGain_divfpond : STD_LOGIC;
signal CalculateKGain_divfpsclr : STD_LOGIC;
signal CalculateKGain_divfpce : STD_LOGIC;
signal CalculateKGain_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateKGain_divfprdy : STD_LOGIC;

component CalculatePixOS is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
i_Ta : in std_logic_vector (31 downto 0);
i_Vdd : in std_logic_vector (31 downto 0);
i_KGain : in std_logic_vector (31 downto 0);
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
o_rdy : out std_logic;
o_signed4bit_ena : out std_logic;
o_signed4bit_adr : out std_logic_vector (3 downto 0);
o_signed6bit_ena : out std_logic;
o_signed6bit_adr : out std_logic_vector (5 downto 0);
o_2powx_4bit_ena : out std_logic;
o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
o_2powx_p8_4bit_ena : out std_logic;
o_2powx_p8_4bit_adr : out std_logic_vector (3 downto 0);
o_signed3bit_ena : out std_logic;
o_signed3bit_adr : out std_logic_vector (2 downto 0);
i_rom_constants_float : in std_logic_vector (31 downto 0);
o_mem_signed256_ivalue : out std_logic_vector (7 downto 0); -- input hex from 0 to 255
i_mem_signed256_ovalue : in std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float
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
signal CalculatePixOS_Ta : std_logic_vector (31 downto 0);
signal CalculatePixOS_Vdd : std_logic_vector (31 downto 0);
signal CalculatePixOS_KGain : std_logic_vector (31 downto 0);
signal CalculatePixOS_do : std_logic_vector (31 downto 0);
signal CalculatePixOS_addr : std_logic_vector (9 downto 0); -- 10bit-1024
signal CalculatePixOS_rdy : std_logic;
signal CalculatePixOS_signed4bit_ena : std_logic;
signal CalculatePixOS_signed4bit_adr : std_logic_vector (3 downto 0);
signal CalculatePixOS_signed6bit_ena : std_logic;
signal CalculatePixOS_signed6bit_adr : std_logic_vector (5 downto 0);
signal CalculatePixOS_2powx_4bit_ena : std_logic;
signal CalculatePixOS_2powx_4bit_adr : std_logic_vector (3 downto 0);
signal CalculatePixOS_2powx_p8_4bit_ena : std_logic;
signal CalculatePixOS_2powx_p8_4bit_adr : std_logic_vector (3 downto 0);
signal CalculatePixOS_signed3bit_ena : std_logic;
signal CalculatePixOS_signed3bit_adr : std_logic_vector (2 downto 0);
signal CalculatePixOS_rom_constants_float : std_logic_vector (31 downto 0);
signal CalculatePixOS_mem_signed256_ivalue : std_logic_vector (7 downto 0); -- input hex from 0 to 255
signal CalculatePixOS_mem_signed256_ovalue : std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float
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
i_Vdd : in std_logic_vector (31 downto 0);
i_KGain : in std_logic_vector (31 downto 0);
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_pixoscpsp0 : out std_logic_vector (31 downto 0);
o_pixoscpsp1 : out std_logic_vector (31 downto 0);
o_rdy : out std_logic;
signal o_signed6bit_ena : out std_logic;
signal o_signed6bit_adr : out std_logic_vector (5 downto 0);
signal o_2powx_p8_4bit_ena : out std_logic;
signal o_2powx_p8_4bit_adr : out std_logic_vector (3 downto 0);
signal o_2powx_4bit_ena : out std_logic;
signal o_2powx_4bit_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);
signal o_mem_signed256_ivalue : out std_logic_vector (7 downto 0);
signal i_mem_signed256_ovalue : in std_logic_vector (31 downto 0);
signal o_mem_signed1024_ivalue : out std_logic_vector(9 downto 0);
signal i_mem_signed1024_ovalue : in std_logic_vector(31 downto 0);
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
signal CalculatePixOsCPSP_Vdd : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_KGain : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_i2c_mem_ena : STD_LOGIC;
signal CalculatePixOsCPSP_i2c_mem_addra : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal CalculatePixOsCPSP_i2c_mem_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CalculatePixOsCPSP_pixoscpsp0 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_pixoscpsp1 : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_rdy : std_logic;
signal CalculatePixOsCPSP_signed6bit_ena : std_logic;
signal CalculatePixOsCPSP_signed6bit_adr : std_logic_vector (5 downto 0);
signal CalculatePixOsCPSP_2powx_p8_4bit_ena : std_logic;
signal CalculatePixOsCPSP_2powx_p8_4bit_adr : std_logic_vector (3 downto 0);
signal CalculatePixOsCPSP_2powx_4bit_ena : std_logic;
signal CalculatePixOsCPSP_2powx_4bit_adr : std_logic_vector (3 downto 0);
signal CalculatePixOsCPSP_rom_constants_float : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_mem_signed256_ivalue : std_logic_vector (7 downto 0);
signal CalculatePixOsCPSP_mem_signed256_ovalue : std_logic_vector (31 downto 0);
signal CalculatePixOsCPSP_mem_signed1024_ivalue : std_logic_vector(9 downto 0);
signal CalculatePixOsCPSP_mem_signed1024_ovalue : std_logic_vector(31 downto 0);
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
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_pixoscpsp0 : in std_logic_vector (31 downto 0);
i_pixoscpsp1 : in std_logic_vector (31 downto 0);
i_tgc : in std_logic_vector (31 downto 0);
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
i_pixos_do : in std_logic_vector (31 downto 0);
o_pixos_addr : out std_logic_vector (9 downto 0); -- 10bit-1024
o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024
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
END COMPONENT;
signal CalculateVirCompensated_clock : std_logic;
signal CalculateVirCompensated_reset : std_logic;
signal CalculateVirCompensated_run : std_logic;
signal CalculateVirCompensated_pixoscpsp0 : std_logic_vector(31 downto 0) := x"41CD5551"; -- 25.6666575059956
signal CalculateVirCompensated_pixoscpsp1 : std_logic_vector(31 downto 0) := x"41AD0D7D"; -- 21.6315865670509
signal CalculateVirCompensated_tgc : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_i2c_mem_douta : std_logic_vector(7 downto 0);
signal CalculateVirCompensated_pixos_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateVirCompensated_addr : std_logic_vector(9 downto 0);
signal CalculateVirCompensated_i2c_mem_ena : std_logic;
signal CalculateVirCompensated_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateVirCompensated_pixos_addr : std_logic_vector(9 downto 0);
signal CalculateVirCompensated_do : std_logic_vector(31 downto 0);
signal CalculateVirCompensated_rdy : std_logic;
signal CalculateVirCompensated_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_divfpond : STD_LOGIC;
signal CalculateVirCompensated_divfpsclr : STD_LOGIC;
signal CalculateVirCompensated_divfpce : STD_LOGIC;
signal CalculateVirCompensated_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_divfprdy : STD_LOGIC;
signal CalculateVirCompensated_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_mulfpond : STD_LOGIC;
signal CalculateVirCompensated_mulfpsclr : STD_LOGIC;
signal CalculateVirCompensated_mulfpce : STD_LOGIC;
signal CalculateVirCompensated_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_mulfprdy : STD_LOGIC;
signal CalculateVirCompensated_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_addfpond : STD_LOGIC;
signal CalculateVirCompensated_addfpsclr : STD_LOGIC;
signal CalculateVirCompensated_addfpce : STD_LOGIC;
signal CalculateVirCompensated_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_addfprdy : STD_LOGIC;
signal CalculateVirCompensated_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_subfpond : STD_LOGIC;
signal CalculateVirCompensated_subfpsclr : STD_LOGIC;
signal CalculateVirCompensated_subfpce : STD_LOGIC;
signal CalculateVirCompensated_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateVirCompensated_subfprdy : STD_LOGIC;

component ExtractTGCParameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_tgc : out std_logic_vector (31 downto 0);
o_rdy : out std_logic;
signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC;
signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC
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
signal ExtractTGCParameters_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal ExtractTGCParameters_fixed2floatond : STD_LOGIC;
signal ExtractTGCParameters_fixed2floatsclr : STD_LOGIC;
signal ExtractTGCParameters_fixed2floatce : STD_LOGIC;
signal ExtractTGCParameters_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractTGCParameters_fixed2floatrdy : STD_LOGIC;
signal ExtractTGCParameters_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractTGCParameters_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractTGCParameters_divfpond : STD_LOGIC;
signal ExtractTGCParameters_divfpsclr : STD_LOGIC;
signal ExtractTGCParameters_divfpce : STD_LOGIC;
signal ExtractTGCParameters_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal ExtractTGCParameters_divfprdy : STD_LOGIC;

COMPONENT CalculateAlphaComp
PORT(
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

i_Ta : in std_logic_vector (31 downto 0);
i_acpsubpage0 : in std_logic_vector (31 downto 0);
i_acpsubpage1 : in std_logic_vector (31 downto 0);
i_tgc : in std_logic_vector (31 downto 0);

i_alpha_do : in std_logic_vector (31 downto 0);
o_alpha_addr : out std_logic_vector (9 downto 0); -- 10bit-1024

o_do : out std_logic_vector (31 downto 0);
i_addr : in std_logic_vector (9 downto 0); -- 10bit-1024

o_rdy : out std_logic;

signal mulfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond : out STD_LOGIC;
signal mulfpsclr : out STD_LOGIC;
signal mulfpce : out STD_LOGIC;
signal mulfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy : in STD_LOGIC;

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC;

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
signal subfprdy : in STD_LOGIC;

signal fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond : out STD_LOGIC;
signal fixed2floatsclr : out STD_LOGIC;
signal fixed2floatce : out STD_LOGIC;
signal fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy : in STD_LOGIC
);
END COMPONENT;
signal CalculateAlphaComp_clock : std_logic := '0';
signal CalculateAlphaComp_reset : std_logic := '0';
signal CalculateAlphaComp_run : std_logic := '0';
signal CalculateAlphaComp_i2c_mem_douta : std_logic_vector(7 downto 0) := (others => '0');
signal CalculateAlphaComp_Ta : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage0 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_acpsubpage1 : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_tgc : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_alpha_do : std_logic_vector(31 downto 0) := (others => '0');
signal CalculateAlphaComp_addr : std_logic_vector(9 downto 0) := (others => '0');
signal CalculateAlphaComp_i2c_mem_ena : std_logic;
signal CalculateAlphaComp_i2c_mem_addra : std_logic_vector(11 downto 0);
signal CalculateAlphaComp_alpha_addr : std_logic_vector(9 downto 0);
signal CalculateAlphaComp_do : std_logic_vector(31 downto 0);
signal CalculateAlphaComp_rdy : std_logic;
signal CalculateAlphaComp_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_mulfpond : STD_LOGIC;
signal CalculateAlphaComp_mulfpsclr : STD_LOGIC;
signal CalculateAlphaComp_mulfpce : STD_LOGIC;
signal CalculateAlphaComp_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_mulfprdy : STD_LOGIC;
signal CalculateAlphaComp_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_divfpond : STD_LOGIC;
signal CalculateAlphaComp_divfpsclr : STD_LOGIC;
signal CalculateAlphaComp_divfpce : STD_LOGIC;
signal CalculateAlphaComp_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_divfprdy : STD_LOGIC;
signal CalculateAlphaComp_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_addfpond : STD_LOGIC;
signal CalculateAlphaComp_addfpsclr : STD_LOGIC;
signal CalculateAlphaComp_addfpce : STD_LOGIC;
signal CalculateAlphaComp_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_addfprdy : STD_LOGIC;
signal CalculateAlphaComp_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_subfpond : STD_LOGIC;
signal CalculateAlphaComp_subfpsclr : STD_LOGIC;
signal CalculateAlphaComp_subfpce : STD_LOGIC;
signal CalculateAlphaComp_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_subfprdy : STD_LOGIC;
signal CalculateAlphaComp_fixed2floata : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal CalculateAlphaComp_fixed2floatond : STD_LOGIC;
signal CalculateAlphaComp_fixed2floatsclr : STD_LOGIC;
signal CalculateAlphaComp_fixed2floatce : STD_LOGIC;
signal CalculateAlphaComp_fixed2floatr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateAlphaComp_fixed2floatrdy : STD_LOGIC;

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
o_rdy : OUT  std_logic;

signal o_2powx_p8_ena : out std_logic;
signal o_2powx_p8_adr : out std_logic_vector (3 downto 0);
signal i_rom_constants_float : in std_logic_vector (31 downto 0);

signal o_mem_signed256_ivalue : out std_logic_vector (7 downto 0); -- input hex from 0 to 255
signal i_mem_signed256_ovalue : in std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float

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
signal subfprdy : in STD_LOGIC;

signal sqrtfp2a : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2ond : out STD_LOGIC;
signal sqrtfp2sclr : out STD_LOGIC;
signal sqrtfp2ce : out STD_LOGIC;
signal sqrtfp2r : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sqrtfp2rdy : in STD_LOGIC

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

signal CalculateTo_2powx_p8_ena : std_logic;
signal CalculateTo_2powx_p8_adr : std_logic_vector (3 downto 0);
signal CalculateTo_rom_constants_float : std_logic_vector (31 downto 0);

signal CalculateTo_mem_signed256_ivalue : std_logic_vector (7 downto 0); -- input hex from 0 to 255
signal CalculateTo_mem_signed256_ovalue : std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float

signal CalculateTo_divfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_divfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_divfpond : STD_LOGIC;
signal CalculateTo_divfpsclr : STD_LOGIC;
signal CalculateTo_divfpce : STD_LOGIC;
signal CalculateTo_divfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_divfprdy : STD_LOGIC;

signal CalculateTo_mulfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_mulfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_mulfpond : STD_LOGIC;
signal CalculateTo_mulfpsclr : STD_LOGIC;
signal CalculateTo_mulfpce : STD_LOGIC;
signal CalculateTo_mulfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_mulfprdy : STD_LOGIC;

signal CalculateTo_addfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_addfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_addfpond : STD_LOGIC;
signal CalculateTo_addfpsclr : STD_LOGIC;
signal CalculateTo_addfpce : STD_LOGIC;
signal CalculateTo_addfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_addfprdy : STD_LOGIC;

signal CalculateTo_subfpa : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_subfpb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_subfpond : STD_LOGIC;
signal CalculateTo_subfpsclr : STD_LOGIC;
signal CalculateTo_subfpce : STD_LOGIC;
signal CalculateTo_subfpr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_subfprdy : STD_LOGIC;

signal CalculateTo_sqrtfp2a : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_sqrtfp2ond : STD_LOGIC;
signal CalculateTo_sqrtfp2sclr : STD_LOGIC;
signal CalculateTo_sqrtfp2ce : STD_LOGIC;
signal CalculateTo_sqrtfp2r : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CalculateTo_sqrtfp2rdy : STD_LOGIC;

signal CalculateKGain_mux : std_logic;
signal ExtractTGCParameters_mux : std_logic;

signal CalculatePixOS_mux,CalculatePixOsCPSP_mux,CalculateVirCompensated_mux,ExtractOffsetParameters_mux : std_logic;
signal ExtractAlphaParameters_mux,CalculateAlphaComp_mux,CalculateAlphaCP_mux : std_logic;
signal CalculateVdd_mux,CalculateTa_mux,CalculateTo_mux : std_logic;

component mem_signed1024 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_value : in std_logic_vector (9 downto 0); -- input hex from 0 to 1024
o_value : out std_logic_vector (31 downto 0) -- output signed 0 to 1024 in SP float
);
end component mem_signed1024;
signal mem_signed1024_clock : std_logic;
signal mem_signed1024_reset : std_logic;
signal mem_signed1024_ivalue : std_logic_vector (9 downto 0); -- input hex from 0 to 1024
signal mem_signed1024_ovalue : std_logic_vector (31 downto 0); -- output signed 0 to 1024 in SP float

component mem_signed256 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_value : in std_logic_vector (7 downto 0); -- input hex from 0 to 255
o_value : out std_logic_vector (31 downto 0) -- output signed -128 to 127 in SP float
);
end component mem_signed256;
signal mem_signed256_clock : std_logic;
signal mem_signed256_reset : std_logic;
signal mem_signed256_ivalue : std_logic_vector (7 downto 0); -- input hex from 0 to 255
signal mem_signed256_ovalue : std_logic_vector (31 downto 0); -- output signed -128 to 127 in SP float

begin

fixed2floata <=
CalculateAlphaCP_fixed2floata when CalculateAlphaCP_mux = '1'
else
CalculateAlphaComp_fixed2floata when CalculateAlphaComp_mux = '1'
else
ExtractTGCParameters_fixed2floata when ExtractTGCParameters_mux = '1'
else
CalculateKGain_fixed2floata when CalculateKGain_mux = '1'
else
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
CalculateAlphaCP_fixed2floatond when CalculateAlphaCP_mux = '1'
else
CalculateAlphaComp_fixed2floatond when CalculateAlphaComp_mux = '1'
else
ExtractTGCParameters_fixed2floatond when ExtractTGCParameters_mux = '1'
else
CalculateKGain_fixed2floatond when CalculateKGain_mux = '1'
else
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
CalculateAlphaCP_fixed2floatce when CalculateAlphaCP_mux = '1'
else
CalculateAlphaComp_fixed2floatce when CalculateAlphaComp_mux = '1'
else
ExtractTGCParameters_fixed2floatce when ExtractTGCParameters_mux = '1'
else
CalculateKGain_fixed2floatce when CalculateKGain_mux = '1'
else
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
CalculateAlphaCP_fixed2floatsclr when CalculateAlphaCP_mux = '1'
else
CalculateAlphaComp_fixed2floatsclr when CalculateAlphaComp_mux = '1'
else
ExtractTGCParameters_fixed2floatsclr when ExtractTGCParameters_mux = '1'
else
CalculateKGain_fixed2floatsclr when CalculateKGain_mux = '1'
else
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
CalculateAlphaComp_divfpa when CalculateAlphaComp_mux = '1'
else
ExtractTGCParameters_divfpa when ExtractTGCParameters_mux = '1'
else
CalculateKGain_divfpa when CalculateKGain_mux = '1'
else
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
else
CalculateVirCompensated_divfpa when CalculateVirCompensated_mux = '1' 
else
CalculateTo_divfpa when CalculateTo_mux = '1' 
else (others => '0');

divfpb <=
CalculateAlphaComp_divfpb when CalculateAlphaComp_mux = '1'
else
ExtractTGCParameters_divfpb when ExtractTGCParameters_mux = '1'
else
CalculateKGain_divfpb when CalculateKGain_mux = '1'
else
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
else
CalculateVirCompensated_divfpb when CalculateVirCompensated_mux = '1' 
else
CalculateTo_divfpb when CalculateTo_mux = '1' 
else (others => '0');

divfpond <=
CalculateAlphaComp_divfpond when CalculateAlphaComp_mux = '1'
else
ExtractTGCParameters_divfpond when ExtractTGCParameters_mux = '1'
else
CalculateKGain_divfpond when CalculateKGain_mux = '1'
else
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
else
CalculateVirCompensated_divfpond when CalculateVirCompensated_mux = '1' 
else
CalculateTo_divfpond when CalculateTo_mux = '1' 
else '0';

divfpce <=
CalculateAlphaComp_divfpce when CalculateAlphaComp_mux = '1'
else
ExtractTGCParameters_divfpce when ExtractTGCParameters_mux = '1'
else
CalculateKGain_divfpce when CalculateKGain_mux = '1'
else
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
else
CalculateVirCompensated_divfpce when CalculateVirCompensated_mux = '1' 
else
CalculateTo_divfpce when CalculateTo_mux = '1' 
else '0';

divfpsclr <=
CalculateAlphaComp_divfpsclr when CalculateAlphaComp_mux = '1'
else
ExtractTGCParameters_divfpsclr when ExtractTGCParameters_mux = '1'
else
CalculateKGain_divfpsclr when CalculateKGain_mux = '1'
else
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
else
CalculateVirCompensated_divfpsclr when CalculateVirCompensated_mux = '1' 
else
CalculateTo_divfpsclr when CalculateTo_mux = '1' 
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
else
CalculateVirCompensated_mulfpa when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_mulfpa when CalculateAlphaComp_mux = '1' 
else
CalculateTo_mulfpa when CalculateTo_mux = '1' 
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
else
CalculateVirCompensated_mulfpb when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_mulfpb when CalculateAlphaComp_mux = '1' 
else
CalculateTo_mulfpb when CalculateTo_mux = '1' 
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
else
CalculateVirCompensated_mulfpond when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_mulfpond when CalculateAlphaComp_mux = '1' 
else
CalculateTo_mulfpond when CalculateTo_mux = '1' 
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
else
CalculateVirCompensated_mulfpce when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_mulfpce when CalculateAlphaComp_mux = '1' 
else
CalculateTo_mulfpce when CalculateTo_mux = '1' 
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
else
CalculateVirCompensated_mulfpsclr when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_mulfpsclr when CalculateAlphaComp_mux = '1' 
else
CalculateTo_mulfpsclr when CalculateTo_mux = '1' 
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
else
CalculateVirCompensated_addfpa when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_addfpa when CalculateAlphaComp_mux = '1' 
else
CalculateTo_addfpa when CalculateTo_mux = '1' 
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
else
CalculateVirCompensated_addfpb when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_addfpb when CalculateAlphaComp_mux = '1' 
else
CalculateTo_addfpb when CalculateTo_mux = '1' 
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
else
CalculateVirCompensated_addfpond when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_addfpond when CalculateAlphaComp_mux = '1' 
else
CalculateTo_addfpond when CalculateTo_mux = '1' 
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
else
CalculateVirCompensated_addfpce when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_addfpce when CalculateAlphaComp_mux = '1' 
else
CalculateTo_addfpce when CalculateTo_mux = '1' 
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
else
CalculateVirCompensated_addfpsclr when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_addfpsclr when CalculateAlphaComp_mux = '1' 
else
CalculateTo_addfpsclr when CalculateTo_mux = '1' 
else '0';

subfpa <=
CalculateVdd_subfpa when CalculateVdd_mux = '1' 
else
CalculateTa_subfpa when CalculateTa_mux = '1' 
else
CalculatePixOS_subfpa when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_subfpa when CalculatePixOSCPSP_mux = '1' 
else
CalculateVirCompensated_subfpa when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_subfpa when CalculateAlphaComp_mux = '1' 
else
CalculateTo_subfpa when CalculateTo_mux = '1' 
else (others => '0');

subfpb <=
CalculateVdd_subfpb when CalculateVdd_mux = '1' 
else
CalculateTa_subfpb when CalculateTa_mux = '1' 
else
CalculatePixOS_subfpb when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_subfpb when CalculatePixOSCPSP_mux = '1' 
else
CalculateVirCompensated_subfpb when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_subfpb when CalculateAlphaComp_mux = '1' 
else
CalculateTo_subfpb when CalculateTo_mux = '1' 
else (others => '0');

subfpond <=
CalculateVdd_subfpond when CalculateVdd_mux = '1' 
else
CalculateTa_subfpond when CalculateTa_mux = '1' 
else
CalculatePixOS_subfpond when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_subfpond when CalculatePixOSCPSP_mux = '1' 
else
CalculateVirCompensated_subfpond when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_subfpond when CalculateAlphaComp_mux = '1' 
else
CalculateTo_subfpond when CalculateTo_mux = '1' 
else '0';

subfpce <=
CalculateVdd_subfpce when CalculateVdd_mux = '1' 
else
CalculateTa_subfpce when CalculateTa_mux = '1' 
else
CalculatePixOS_subfpce when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_subfpce when CalculatePixOSCPSP_mux = '1' 
else
CalculateVirCompensated_subfpce when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_subfpce when CalculateAlphaComp_mux = '1' 
else
CalculateTo_subfpce when CalculateTo_mux = '1' 
else '0';

subfpsclr <=
CalculateVdd_subfpsclr when CalculateVdd_mux = '1' 
else
CalculateTa_subfpsclr when CalculateTa_mux = '1' 
else
CalculatePixOS_subfpsclr when CalculatePixOS_mux = '1' 
else
CalculatePixOSCPSP_subfpsclr when CalculatePixOSCPSP_mux = '1' 
else
CalculateVirCompensated_subfpsclr when CalculateVirCompensated_mux = '1' 
else
CalculateAlphaComp_subfpsclr when CalculateAlphaComp_mux = '1' 
else
CalculateTo_subfpsclr when CalculateTo_mux = '1' 
else '0';

sqrtfp2a <= CalculateTo_sqrtfp2a when CalculateTo_mux = '1' else (others => '0');
sqrtfp2ond <= CalculateTo_sqrtfp2ond when CalculateTo_mux = '1' else '0';
sqrtfp2sclr <= CalculateTo_sqrtfp2sclr when CalculateTo_mux = '1' else '0';
sqrtfp2ce <= CalculateTo_sqrtfp2ce when CalculateTo_mux = '1' else '0';

ExtractTGCParameters_fixed2floatr <= fixed2floatr when ExtractTGCParameters_mux = '1' else (others => '0');
ExtractTGCParameters_fixed2floatrdy <= fixed2floatrdy when ExtractTGCParameters_mux = '1' else '0';
ExtractTGCParameters_divfpr <= divfpr when ExtractTGCParameters_mux = '1' else (others => '0');
ExtractTGCParameters_divfprdy <= divfprdy when ExtractTGCParameters_mux = '1' else '0';

CalculateKGain_fixed2floatr <= fixed2floatr when CalculateKGain_mux = '1' else (others => '0');
CalculateKGain_fixed2floatrdy <= fixed2floatrdy when CalculateKGain_mux = '1' else '0';
CalculateKGain_divfpr <= divfpr when CalculateKGain_mux = '1' else (others => '0');
CalculateKGain_divfprdy <= divfprdy when CalculateKGain_mux = '1' else '0';

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
CalculateAlphaCP_fixed2floatr <= fixed2floatr when CalculateAlphaCP_mux = '1' else (others => '0');
CalculateAlphaCP_fixed2floatrdy <= fixed2floatrdy when CalculateAlphaCP_mux = '1' else '0';

ExtractAlphaParameters_fixed2floatr <= fixed2floatr when ExtractAlphaParameters_mux = '1' else (others => '0');
ExtractAlphaParameters_fixed2floatrdy <= fixed2floatrdy when ExtractAlphaParameters_mux = '1' else '0';
ExtractAlphaParameters_divfpr <= divfpr when ExtractAlphaParameters_mux = '1' else (others => '0');
ExtractAlphaParameters_divfprdy <= divfprdy when ExtractAlphaParameters_mux = '1' else '0';
ExtractAlphaParameters_mulfpr <= mulfpr when ExtractAlphaParameters_mux = '1' else (others => '0');
ExtractAlphaParameters_mulfprdy <= mulfprdy when ExtractAlphaParameters_mux = '1' else '0';
ExtractAlphaParameters_addfpr <= addfpr when ExtractAlphaParameters_mux = '1' else (others => '0');
ExtractAlphaParameters_addfprdy <= addfprdy when ExtractAlphaParameters_mux = '1' else '0';

CalculateVirCompensated_divfpr <= divfpr when CalculateVirCompensated_mux = '1' else (others => '0');
CalculateVirCompensated_divfprdy <= divfprdy when CalculateVirCompensated_mux = '1' else '0';
CalculateVirCompensated_mulfpr <= mulfpr when CalculateVirCompensated_mux = '1' else (others => '0');
CalculateVirCompensated_mulfprdy <= mulfprdy when CalculateVirCompensated_mux = '1' else '0';
CalculateVirCompensated_addfpr <= addfpr when CalculateVirCompensated_mux = '1' else (others => '0');
CalculateVirCompensated_addfprdy <= addfprdy when CalculateVirCompensated_mux = '1' else '0';
CalculateVirCompensated_subfpr <= subfpr when CalculateVirCompensated_mux = '1' else (others => '0');
CalculateVirCompensated_subfprdy <= subfprdy when CalculateVirCompensated_mux = '1' else '0';

CalculateAlphaComp_mulfpr <= mulfpr when CalculateAlphaComp_mux = '1' else (others => '0');
CalculateAlphaComp_mulfprdy <= mulfprdy when CalculateAlphaComp_mux = '1' else '0';
CalculateAlphaComp_addfpr <= addfpr when CalculateAlphaComp_mux = '1' else (others => '0');
CalculateAlphaComp_addfprdy <= addfprdy when CalculateAlphaComp_mux = '1' else '0';
CalculateAlphaComp_subfpr <= subfpr when CalculateAlphaComp_mux = '1' else (others => '0');
CalculateAlphaComp_subfprdy <= subfprdy when CalculateAlphaComp_mux = '1' else '0';

CalculateAlphaComp_divfpr <= divfpr when CalculateAlphaComp_mux = '1' else (others => '0');
CalculateAlphaComp_divfprdy <= divfprdy when CalculateAlphaComp_mux = '1' else '0';
CalculateAlphaComp_fixed2floatr <= fixed2floatr when CalculateAlphaComp_mux = '1' else (others => '0');
CalculateAlphaComp_fixed2floatrdy <= fixed2floatrdy when CalculateAlphaComp_mux = '1' else '0';

CalculateTo_divfpr <= divfpr when CalculateTo_mux = '1' else (others => '0');
CalculateTo_divfprdy <= divfprdy when CalculateTo_mux = '1' else '0';
CalculateTo_mulfpr <= mulfpr when CalculateTo_mux = '1' else (others => '0');
CalculateTo_mulfprdy <= mulfprdy when CalculateTo_mux = '1' else '0';
CalculateTo_addfpr <= addfpr when CalculateTo_mux = '1' else (others => '0');
CalculateTo_addfprdy <= addfprdy when CalculateTo_mux = '1' else '0';
CalculateTo_subfpr <= subfpr when CalculateTo_mux = '1' else (others => '0');
CalculateTo_subfprdy <= subfprdy when CalculateTo_mux = '1' else '0';
CalculateTo_sqrtfp2r <= sqrtfp2r when CalculateTo_mux = '1' else (others => '0');
CalculateTo_sqrtfp2rdy <= sqrtfp2rdy when CalculateTo_mux = '1' else '0';

i2c_mem_ena <=
ExtractTGCParameters_i2c_mem_ena when ExtractTGCParameters_mux = '1'
else
CalculateKGain_i2c_mem_ena when CalculateKGain_mux = '1'
else
CalculatePixOS_i2c_mem_ena when CalculatePixOS_mux = '1'
else
CalculatePixOsCPSP_i2c_mem_ena when CalculatePixOsCPSP_mux = '1'
else
CalculateVirCompensated_i2c_mem_ena when CalculateVirCompensated_mux = '1'
else
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
ExtractTGCParameters_i2c_mem_addra when ExtractTGCParameters_mux = '1'
else
CalculateKGain_i2c_mem_addra when CalculateKGain_mux = '1'
else
CalculatePixOS_i2c_mem_addra when CalculatePixOS_mux = '1'
else
CalculatePixOsCPSP_i2c_mem_addra when CalculatePixOsCPSP_mux = '1'
else
CalculateVirCompensated_i2c_mem_addra when CalculateVirCompensated_mux = '1'
else
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

ExtractTGCParameters_i2c_mem_douta <= i2c_mem_douta when ExtractTGCParameters_mux = '1' else (others => '0');
CalculateKGain_i2c_mem_douta <= i2c_mem_douta when CalculateKGain_mux = '1' else (others => '0');
CalculatePixOS_i2c_mem_douta <= i2c_mem_douta when CalculatePixOS_mux = '1' else (others => '0');
CalculatePixOsCPSP_i2c_mem_douta <= i2c_mem_douta when CalculatePixOsCPSP_mux = '1' else (others => '0');
CalculateVirCompensated_i2c_mem_douta <= i2c_mem_douta when CalculateVirCompensated_mux = '1' else (others => '0');
CalculateAlphaCP_i2c_mem_douta <= i2c_mem_douta when CalculateAlphaCP_mux = '1' else (others => '0');
ExtractAlphaParameters_i2c_mem_douta <= i2c_mem_douta when ExtractAlphaParameters_mux = '1' else (others => '0');
CalculateAlphaComp_i2c_mem_douta <= i2c_mem_douta when CalculateAlphaComp_mux = '1' else (others => '0');
CalculateVdd_i2c_mem_douta <= i2c_mem_douta when CalculateVdd_mux = '1' else (others => '0');
CalculateTa_i2c_mem_douta <= i2c_mem_douta when CalculateTa_mux = '1' else (others => '0');
CalculateTo_i2c_mem_douta <= i2c_mem_douta when CalculateTo_mux = '1' else (others => '0');

rom_constants_2powx_4bit_en <=
CalculatePixOS_2powx_4bit_ena when CalculatePixOS_mux = '1' else
CalculatePixOSCPSP_2powx_4bit_ena when CalculatePixOSCPSP_mux = '1' else
ExtractAlphaParameters_2powx_4bit_ena when ExtractAlphaParameters_mux = '1' else
'0';
rom_constants_2powx_4bit_adr <=
CalculatePixOS_2powx_4bit_adr when CalculatePixOS_mux = '1' else
CalculatePixOSCPSP_2powx_4bit_adr when CalculatePixOSCPSP_mux = '1' else
ExtractAlphaParameters_2powx_4bit_adr when ExtractAlphaParameters_mux = '1' else
(others => '0');

rom_constants_signed4bit_en <=
CalculatePixOS_signed4bit_ena when CalculatePixOS_mux = '1' else
ExtractAlphaParameters_signed4bit_ena when ExtractAlphaParameters_mux = '1' else
'0';
rom_constants_signed4bit_adr <=
CalculatePixOS_signed4bit_adr when CalculatePixOS_mux = '1' else
ExtractAlphaParameters_signed4bit_adr when ExtractAlphaParameters_mux = '1' else
(others => '0');

rom_constants_signed6bit_en <=
CalculatePixOS_signed6bit_ena when CalculatePixOS_mux = '1' else
CalculatePixOSCPSP_signed6bit_ena when CalculatePixOSCPSP_mux = '1' else
ExtractAlphaParameters_signed6bit_ena when ExtractAlphaParameters_mux = '1' else
'0';
rom_constants_signed6bit_adr <=
CalculatePixOS_signed6bit_adr when CalculatePixOS_mux = '1' else
CalculatePixOSCPSP_signed6bit_adr when CalculatePixOSCPSP_mux = '1' else
ExtractAlphaParameters_signed6bit_adr when ExtractAlphaParameters_mux = '1' else
(others => '0');

rom_constants_alphascale_1_en <=
ExtractAlphaParameters_alphascale_1_ena when ExtractAlphaParameters_mux = '1' else
'0';
rom_constants_alphascale_1_adr <=
ExtractAlphaParameters_alphascale_1_adr when ExtractAlphaParameters_mux = '1' else
(others => '0');

rom_constants_2powx_p8_4bit_en <=
CalculatePixOS_2powx_p8_4bit_ena when CalculatePixOS_mux = '1' else
CalculatePixOSCPSP_2powx_p8_4bit_ena when CalculatePixOSCPSP_mux = '1' else
CalculateTo_2powx_p8_ena when CalculateTo_mux = '1' else
'0';
rom_constants_2powx_p8_4bit_adr <=
CalculatePixOS_2powx_p8_4bit_adr when CalculatePixOS_mux = '1' else
CalculatePixOSCPSP_2powx_p8_4bit_adr when CalculatePixOSCPSP_mux = '1' else
CalculateTo_2powx_p8_adr when CalculateTo_mux = '1' else
(others => '0');

CalculatePixOS_rom_constants_float <= rom_constants_float;
CalculatePixOSCPSP_rom_constants_float <= rom_constants_float;
ExtractAlphaParameters_rom_constants_float <= rom_constants_float;
CalculateTo_rom_constants_float <= rom_constants_float;

mem_signed256_ivalue <=
CalculatePixOS_mem_signed256_ivalue when CalculatePixOS_mux = '1' else
CalculatePixOSCPSP_mem_signed256_ivalue when CalculatePixOSCPSP_mux = '1' else
CalculateTo_mem_signed256_ivalue when CalculateTo_mux = '1' else
(others => '0');
CalculatePixOS_mem_signed256_ovalue <= mem_signed256_ovalue;
CalculatePixOSCPSP_mem_signed256_ovalue <= mem_signed256_ovalue;
CalculateTo_mem_signed256_ovalue <= mem_signed256_ovalue;

mem_signed1024_ivalue <=
CalculatePixOSCPSP_mem_signed1024_ivalue when CalculatePixOSCPSP_mux = '1' else
(others => '0');
CalculatePixOSCPSP_mem_signed1024_ovalue <= mem_signed1024_ovalue;

	-- purpose: main test loop
	tester : process (i_clock,i_reset) is
		type states is (idle,s0,s0a,s0b,s0c,
		s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,
		ending);
		variable state : states;
	begin
		if (rising_edge(i_clock)) then
			if (i_reset = '1') then
				state := idle;
				-- reset
				o_rdy <= '0';
			else
  case (state) is
	
  when idle =>
			if (i_run = '1') then
				state := s0;
			else
				state := idle;
			end if;

	when s0 => state := s0a;
		CalculateKGain_run <= '1';
		CalculateKGain_mux <= '1';
	when s0a => 
		CalculateKGain_run <= '0';
		if (CalculateKGain_rdy = '1') then
			state := s0b;
			CalculateKGain_mux <= '0';
		else
			state := s0a;
			CalculateKGain_mux <= '1';
		end if;

	when s0b => state := s0c;
		ExtractTGCParameters_run <= '1';
		ExtractTGCParameters_mux <= '1';
	when s0c => 
		ExtractTGCParameters_run <= '0';
		if (ExtractTGCParameters_rdy = '1') then
			state := s1;
			ExtractTGCParameters_mux <= '0';
		else
			state := s0c;
			ExtractTGCParameters_mux <= '1';
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
	when s4 =>
		CalculateTa_run <= '0';
		if (CalculateTa_rdy = '1') then
			state := s5;
			CalculateTa_mux <= '0';
		else
			state := s4;
			CalculateTa_mux <= '1';
		end if;		
		
	when s5 => state := s6;
		CalculatePixOS_run <= '1';
		CalculatePixOS_mux <= '1';
	when s6 => 
		CalculatePixOS_run <= '0';
		if (CalculatePixOS_rdy = '1') then
			state := s7;
			CalculatePixOS_mux <= '0';
		else
			state := s6;
			CalculatePixOS_mux <= '1';
		end if;

	when s7 => state := s8;
		CalculatePixOsCPSP_run <= '1';
		CalculatePixOsCPSP_mux <= '1';
	when s8 => 
		CalculatePixOsCPSP_run <= '0';
		if (CalculatePixOsCPSP_rdy = '1') then
			state := s9;
			CalculatePixOsCPSP_mux <= '0';
		else
			state := s8;
			CalculatePixOsCPSP_mux <= '1';
		end if;

	when s9 => state := s10;
		CalculateVirCompensated_run <= '1';
		CalculateVirCompensated_mux <= '1';
	when s10 => 
		CalculateVirCompensated_run <= '0';
		if (CalculateVirCompensated_rdy = '1') then
			state := s11;
			CalculateVirCompensated_mux <= '0';
		else
			state := s10;
			CalculateVirCompensated_mux <= '1';
		end if;

	when s11 => state := s12;
		CalculateAlphaCP_run <= '1';
		CalculateAlphaCP_mux <= '1';
	when s12 => 
		CalculateAlphaCP_run <= '0';
		if (CalculateAlphaCP_rdy = '1') then
			state := s13;
			CalculateAlphaCP_mux <= '0';
		else
			state := s12;
			CalculateAlphaCP_mux <= '1';
		end if;

	when s13 => state := s14;
		ExtractAlphaParameters_run <= '1';
		ExtractAlphaParameters_mux <= '1';
	when s14 => 
		ExtractAlphaParameters_run <= '0';
		if (ExtractAlphaParameters_rdy = '1') then
			state := s15;
			ExtractAlphaParameters_mux <= '0';
		else
			state := s14;
			ExtractAlphaParameters_mux <= '1';
		end if;

	when s15 => state := s16;
		CalculateAlphaComp_run <= '1';
		CalculateAlphaComp_mux <= '1';
	when s16 => 
		CalculateAlphaComp_run <= '0';
		if (CalculateAlphaComp_rdy = '1') then
			state := s17;
			CalculateAlphaComp_mux <= '0';
		else
			state := s16;
			CalculateAlphaComp_mux <= '1';
		end if;

	when s17 => state := s18;
		CalculateTo_run <= '1';
		CalculateTo_mux <= '1';
	when s18 => 
		CalculateTo_run <= '0';
		if (CalculateTo_rdy = '1') then
			state := ending;
			CalculateTo_mux <= '0';
		else
			state := s18;
			CalculateTo_mux <= '1';
		end if;

	when ending => state := idle;
		o_rdy <= '1';

	when others => null;
end case;
end if;
end if;
end process tester;

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
o_rdy => ExtractTGCParameters_rdy,
fixed2floata => ExtractTGCParameters_fixed2floata,
fixed2floatond => ExtractTGCParameters_fixed2floatond,
fixed2floatsclr => ExtractTGCParameters_fixed2floatsclr,
fixed2floatce => ExtractTGCParameters_fixed2floatce,
fixed2floatr => ExtractTGCParameters_fixed2floatr,
fixed2floatrdy => ExtractTGCParameters_fixed2floatrdy,
divfpa => ExtractTGCParameters_divfpa,
divfpb => ExtractTGCParameters_divfpb,
divfpond => ExtractTGCParameters_divfpond,
divfpsclr => ExtractTGCParameters_divfpsclr,
divfpce => ExtractTGCParameters_divfpce,
divfpr => ExtractTGCParameters_divfpr,
divfprdy => ExtractTGCParameters_divfprdy
);

CalculateKGain_clock <= i_clock;
CalculateKGain_reset <= i_reset;
inst_CalculateKGain : CalculateKGain port map (
i_clock => CalculateKGain_clock,
i_reset => CalculateKGain_reset,
i_run => CalculateKGain_run,
i2c_mem_ena => CalculateKGain_i2c_mem_ena,
i2c_mem_addra => CalculateKGain_i2c_mem_addra,
i2c_mem_douta => CalculateKGain_i2c_mem_douta,
o_KGain => CalculateKGain_KGain,
o_rdy => CalculateKGain_rdy,

fixed2floata => CalculateKGain_fixed2floata,
fixed2floatond => CalculateKGain_fixed2floatond,
fixed2floatsclr => CalculateKGain_fixed2floatsclr,
fixed2floatce => CalculateKGain_fixed2floatce,
fixed2floatr => CalculateKGain_fixed2floatr,
fixed2floatrdy => CalculateKGain_fixed2floatrdy,

divfpa => CalculateKGain_divfpa,
divfpb => CalculateKGain_divfpb,
divfpond => CalculateKGain_divfpond,
divfpsclr => CalculateKGain_divfpsclr,
divfpce => CalculateKGain_divfpce,
divfpr => CalculateKGain_divfpr,
divfprdy => CalculateKGain_divfprdy
);

CalculateVdd_clock <= i_clock;
CalculateVdd_reset <= i_reset;
inst_CalculateVdd : CalculateVdd port map (
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

CalculateTa_clock <= i_clock;
CalculateTa_reset <= i_reset;
CalculateTa_Vdd <= CalculateVdd_Vdd;
rom_constants_kvptat_en <= CalculateTa_kvptat_ena;
rom_constants_kvptat_adr <= CalculateTa_kvptat_adr;
rom_constants_alphaptat_en <= CalculateTa_alphaptat_ena;
rom_constants_alphaptat_adr <= CalculateTa_alphaptat_adr;
CalculateTa_rom_constants_float <= rom_constants_float;
inst_CalculateTa : CalculateTa port map (
i_clock => CalculateTa_clock,
i_reset => CalculateTa_reset,
i_run => CalculateTa_run,
i2c_mem_ena => CalculateTa_i2c_mem_ena,
i2c_mem_addra => CalculateTa_i2c_mem_addra,
i2c_mem_douta => CalculateTa_i2c_mem_douta,
i_Vdd => CalculateTa_Vdd, -- output Vdd
o_Ta => CalculateTa_Ta, -- output Ta
o_rdy => CalculateTa_rdy,
o_kvptat_ena => CalculateTa_kvptat_ena,
o_kvptat_adr => CalculateTa_kvptat_adr,
o_alphaptat_ena => CalculateTa_alphaptat_ena,
o_alphaptat_adr => CalculateTa_alphaptat_adr,
i_rom_constants_float => CalculateTa_rom_constants_float,
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

o_signed4bit_ena => ExtractAlphaParameters_signed4bit_ena,
o_signed4bit_adr => ExtractAlphaParameters_signed4bit_adr,
o_signed6bit_ena => ExtractAlphaParameters_signed6bit_ena,
o_signed6bit_adr => ExtractAlphaParameters_signed6bit_adr,
o_alphascale_1_ena => ExtractAlphaParameters_alphascale_1_ena,
o_alphascale_1_adr => ExtractAlphaParameters_alphascale_1_adr,
o_2powx_4bit_ena => ExtractAlphaParameters_2powx_4bit_ena,
o_2powx_4bit_adr => ExtractAlphaParameters_2powx_4bit_adr,
i_rom_constants_float => ExtractAlphaParameters_rom_constants_float,

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
rom_constants_cpratio_en <= CalculateAlphaCP_cpratio_ena;
rom_constants_cpratio_adr <= CalculateAlphaCP_cpratio_adr;
rom_constants_alphascale_2_en <= CalculateAlphaCP_alphascale_2_ena;
rom_constants_alphascale_2_adr <= CalculateAlphaCP_alphascale_2_adr;
CalculateAlphaCP_rom_constants_float <= rom_constants_float;
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

o_cpratio_ena => CalculateAlphaCP_cpratio_ena,
o_cpratio_adr => CalculateAlphaCP_cpratio_adr,
o_alphascale_2_ena => CalculateAlphaCP_alphascale_2_ena,
o_alphascale_2_adr => CalculateAlphaCP_alphascale_2_adr,
i_rom_constants_float => CalculateAlphaCP_rom_constants_float,

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
mulfprdy => CalculateAlphaCP_mulfprdy,

fixed2floata => CalculateAlphaCP_fixed2floata,
fixed2floatond => CalculateAlphaCP_fixed2floatond,
fixed2floatsclr => CalculateAlphaCP_fixed2floatsclr,
fixed2floatce => CalculateAlphaCP_fixed2floatce,
fixed2floatr => CalculateAlphaCP_fixed2floatr,
fixed2floatrdy => CalculateAlphaCP_fixed2floatrdy
);

CalculatePixOS_clock <= i_clock;
CalculatePixOS_reset <= i_reset;
CalculatePixOS_Ta <= CalculateTa_Ta; -- xxx
CalculatePixOS_Vdd <= CalculateVdd_Vdd; -- xxx
CalculatePixOS_KGain <= CalculateKGain_KGain;
rom_constants_signed3bit_en <= CalculatePixOS_signed3bit_ena;
rom_constants_signed3bit_adr <= CalculatePixOS_signed3bit_adr;
CalculatePixOS_rom_constants_float <= rom_constants_float;
inst_CalculatePixOS : CalculatePixOS port map (
i_clock => CalculatePixOS_clock,
i_reset => CalculatePixOS_reset,
i_run => CalculatePixOS_run,
i2c_mem_ena => CalculatePixOS_i2c_mem_ena,
i2c_mem_addra => CalculatePixOS_i2c_mem_addra,
i2c_mem_douta => CalculatePixOS_i2c_mem_douta,
i_Ta => CalculatePixOS_Ta,
i_Vdd => CalculatePixOS_Vdd,
i_KGain => CalculatePixOS_KGain,
o_do => CalculatePixOS_do,
i_addr => CalculatePixOS_addr,
o_rdy => CalculatePixOS_rdy,
o_signed4bit_ena => CalculatePixOS_signed4bit_ena,
o_signed4bit_adr => CalculatePixOS_signed4bit_adr,
o_signed6bit_ena => CalculatePixOS_signed6bit_ena,
o_signed6bit_adr => CalculatePixOS_signed6bit_adr,
o_2powx_4bit_ena => CalculatePixOS_2powx_4bit_ena,
o_2powx_4bit_adr => CalculatePixOS_2powx_4bit_adr,
o_2powx_p8_4bit_ena => CalculatePixOS_2powx_p8_4bit_ena,
o_2powx_p8_4bit_adr => CalculatePixOS_2powx_p8_4bit_adr,
o_signed3bit_ena => CalculatePixOS_signed3bit_ena,
o_signed3bit_adr => CalculatePixOS_signed3bit_adr,
i_rom_constants_float => CalculatePixOS_rom_constants_float,
o_mem_signed256_ivalue => CalculatePixOS_mem_signed256_ivalue,
i_mem_signed256_ovalue => CalculatePixOS_mem_signed256_ovalue,
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
CalculatePixOsCPSP_Vdd <= CalculateVdd_Vdd; -- xxx
CalculatePixOsCPSP_KGain <= CalculateKGain_KGain;
inst_CalculatePixOsCPSP : CalculatePixOsCPSP port map (
i_clock => CalculatePixOsCPSP_clock,
i_reset => CalculatePixOsCPSP_reset,
i_run => CalculatePixOsCPSP_run,
i_Ta => CalculatePixOsCPSP_Ta,
i_Vdd => CalculatePixOsCPSP_Vdd,
i_KGain => CalculatePixOsCPSP_KGain,
i2c_mem_ena => CalculatePixOsCPSP_i2c_mem_ena,
i2c_mem_addra => CalculatePixOsCPSP_i2c_mem_addra,
i2c_mem_douta => CalculatePixOsCPSP_i2c_mem_douta,
o_pixoscpsp0 => CalculatePixOsCPSP_pixoscpsp0,
o_pixoscpsp1 => CalculatePixOsCPSP_pixoscpsp1,
o_rdy => CalculatePixOsCPSP_rdy,

o_signed6bit_ena => CalculatePixOsCPSP_signed6bit_ena,
o_signed6bit_adr => CalculatePixOsCPSP_signed6bit_adr,
o_2powx_p8_4bit_ena => CalculatePixOsCPSP_2powx_p8_4bit_ena,
o_2powx_p8_4bit_adr => CalculatePixOsCPSP_2powx_p8_4bit_adr,
o_2powx_4bit_ena => CalculatePixOsCPSP_2powx_4bit_ena,
o_2powx_4bit_adr => CalculatePixOsCPSP_2powx_4bit_adr,
i_rom_constants_float => CalculatePixOsCPSP_rom_constants_float,

o_mem_signed256_ivalue => CalculatePixOsCPSP_mem_signed256_ivalue,
i_mem_signed256_ovalue => CalculatePixOsCPSP_mem_signed256_ovalue,
o_mem_signed1024_ivalue => CalculatePixOsCPSP_mem_signed1024_ivalue,
i_mem_signed1024_ovalue => CalculatePixOsCPSP_mem_signed1024_ovalue,

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

CalculateVirCompensated_pixoscpsp0 <= CalculatePixOsCPSP_pixoscpsp0;
CalculateVirCompensated_pixoscpsp1 <= CalculatePixOsCPSP_pixoscpsp1;
CalculateVirCompensated_tgc <= ExtractTGCParameters_tgc;
CalculateVirCompensated_clock <= i_clock;
CalculateVirCompensated_reset <= i_reset;
CalculateVirCompensated_pixos_do <= CalculatePixOS_do;
CalculatePixOS_addr <= CalculateVirCompensated_pixos_addr;
inst_CalculateVirCompensated : CalculateVirCompensated PORT MAP (
i_clock => CalculateVirCompensated_clock,
i_reset => CalculateVirCompensated_reset,
i_run => CalculateVirCompensated_run,
i_pixoscpsp0 => CalculateVirCompensated_pixoscpsp0,
i_pixoscpsp1 => CalculateVirCompensated_pixoscpsp1,
i_tgc => CalculateVirCompensated_tgc,
i2c_mem_ena => CalculateVirCompensated_i2c_mem_ena,
i2c_mem_addra => CalculateVirCompensated_i2c_mem_addra,
i2c_mem_douta => CalculateVirCompensated_i2c_mem_douta,
i_pixos_do => CalculateVirCompensated_pixos_do,
o_pixos_addr => CalculateVirCompensated_pixos_addr,
o_do => CalculateVirCompensated_do,
i_addr => CalculateVirCompensated_addr,
o_rdy => CalculateVirCompensated_rdy,

divfpa => CalculateVirCompensated_divfpa,
divfpb => CalculateVirCompensated_divfpb,
divfpond => CalculateVirCompensated_divfpond,
divfpsclr => CalculateVirCompensated_divfpsclr,
divfpce => CalculateVirCompensated_divfpce,
divfpr => CalculateVirCompensated_divfpr,
divfprdy => CalculateVirCompensated_divfprdy,

mulfpa => CalculateVirCompensated_mulfpa,
mulfpb => CalculateVirCompensated_mulfpb,
mulfpond => CalculateVirCompensated_mulfpond,
mulfpsclr => CalculateVirCompensated_mulfpsclr,
mulfpce => CalculateVirCompensated_mulfpce,
mulfpr => CalculateVirCompensated_mulfpr,
mulfprdy => CalculateVirCompensated_mulfprdy,

addfpa => CalculateVirCompensated_addfpa,
addfpb => CalculateVirCompensated_addfpb,
addfpond => CalculateVirCompensated_addfpond,
addfpsclr => CalculateVirCompensated_addfpsclr,
addfpce => CalculateVirCompensated_addfpce,
addfpr => CalculateVirCompensated_addfpr,
addfprdy => CalculateVirCompensated_addfprdy,

subfpa => CalculateVirCompensated_subfpa,
subfpb => CalculateVirCompensated_subfpb,
subfpond => CalculateVirCompensated_subfpond,
subfpsclr => CalculateVirCompensated_subfpsclr,
subfpce => CalculateVirCompensated_subfpce,
subfpr => CalculateVirCompensated_subfpr,
subfprdy => CalculateVirCompensated_subfprdy
);

CalculateAlphaComp_clock <= i_clock;
CalculateAlphaComp_reset <= i_reset;
CalculateAlphaComp_Ta <= CalculateTa_Ta;
CalculateAlphaComp_acpsubpage0 <= CalculateAlphaCP_acpsubpage0;
CalculateAlphaComp_acpsubpage1 <= CalculateAlphaCP_acpsubpage1;
CalculateAlphaComp_tgc <= ExtractTGCParameters_tgc;
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
i_acpsubpage0 => CalculateAlphaComp_acpsubpage0,
i_acpsubpage1 => CalculateAlphaComp_acpsubpage1,
i_tgc => CalculateAlphaComp_tgc,
i_alpha_do => CalculateAlphaComp_alpha_do,
o_alpha_addr => CalculateAlphaComp_alpha_addr,
o_do => CalculateAlphaComp_do,
i_addr => CalculateAlphaComp_addr,
o_rdy => CalculateAlphaComp_rdy,

mulfpa => CalculateAlphaComp_mulfpa,
mulfpb => CalculateAlphaComp_mulfpb,
mulfpond => CalculateAlphaComp_mulfpond,
mulfpsclr => CalculateAlphaComp_mulfpsclr,
mulfpce => CalculateAlphaComp_mulfpce,
mulfpr => CalculateAlphaComp_mulfpr,
mulfprdy => CalculateAlphaComp_mulfprdy,

divfpa => CalculateAlphaComp_divfpa,
divfpb => CalculateAlphaComp_divfpb,
divfpond => CalculateAlphaComp_divfpond,
divfpsclr => CalculateAlphaComp_divfpsclr,
divfpce => CalculateAlphaComp_divfpce,
divfpr => CalculateAlphaComp_divfpr,
divfprdy => CalculateAlphaComp_divfprdy,

addfpa => CalculateAlphaComp_addfpa,
addfpb => CalculateAlphaComp_addfpb,
addfpond => CalculateAlphaComp_addfpond,
addfpsclr => CalculateAlphaComp_addfpsclr,
addfpce => CalculateAlphaComp_addfpce,
addfpr => CalculateAlphaComp_addfpr,
addfprdy => CalculateAlphaComp_addfprdy,

subfpa => CalculateAlphaComp_subfpa,
subfpb => CalculateAlphaComp_subfpb,
subfpond => CalculateAlphaComp_subfpond,
subfpsclr => CalculateAlphaComp_subfpsclr,
subfpce => CalculateAlphaComp_subfpce,
subfpr => CalculateAlphaComp_subfpr,
subfprdy => CalculateAlphaComp_subfprdy,

fixed2floata => CalculateAlphaComp_fixed2floata,
fixed2floatond => CalculateAlphaComp_fixed2floatond,
fixed2floatsclr => CalculateAlphaComp_fixed2floatsclr,
fixed2floatce => CalculateAlphaComp_fixed2floatce,
fixed2floatr => CalculateAlphaComp_fixed2floatr,
fixed2floatrdy => CalculateAlphaComp_fixed2floatrdy
);

CalculateTo_clock <= i_clock;
CalculateTo_reset <= i_reset;
CalculateTo_vircompensated_do <= CalculateVirCompensated_do;
CalculateVirCompensated_addr <= CalculateTo_vircompensated_addr;
CalculateTo_alphacomp_do <= CalculateAlphaComp_do;
CalculateAlphaComp_addr <= CalculateTo_alphacomp_addr;
CalculateTo_Ta <= CalculateTa_Ta;
CalculateTo_addr <= i_addr;
o_do <= CalculateTo_do;
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
o_rdy => CalculateTo_rdy,

o_2powx_p8_ena => CalculateTo_2powx_p8_ena,
o_2powx_p8_adr => CalculateTo_2powx_p8_adr,
i_rom_constants_float => CalculateTo_rom_constants_float,

o_mem_signed256_ivalue => CalculateTo_mem_signed256_ivalue,
i_mem_signed256_ovalue => CalculateTo_mem_signed256_ovalue,

divfpa => CalculateTo_divfpa,
divfpb => CalculateTo_divfpb,
divfpond => CalculateTo_divfpond,
divfpsclr => CalculateTo_divfpsclr,
divfpce => CalculateTo_divfpce,
divfpr => CalculateTo_divfpr,
divfprdy => CalculateTo_divfprdy,

mulfpa => CalculateTo_mulfpa,
mulfpb => CalculateTo_mulfpb,
mulfpond => CalculateTo_mulfpond,
mulfpsclr => CalculateTo_mulfpsclr,
mulfpce => CalculateTo_mulfpce,
mulfpr => CalculateTo_mulfpr,
mulfprdy => CalculateTo_mulfprdy,

addfpa => CalculateTo_addfpa,
addfpb => CalculateTo_addfpb,
addfpond => CalculateTo_addfpond,
addfpsclr => CalculateTo_addfpsclr,
addfpce => CalculateTo_addfpce,
addfpr => CalculateTo_addfpr,
addfprdy => CalculateTo_addfprdy,

subfpa => CalculateTo_subfpa,
subfpb => CalculateTo_subfpb,
subfpond => CalculateTo_subfpond,
subfpsclr => CalculateTo_subfpsclr,
subfpce => CalculateTo_subfpce,
subfpr => CalculateTo_subfpr,
subfprdy => CalculateTo_subfprdy,

sqrtfp2a => CalculateTo_sqrtfp2a,
sqrtfp2ond => CalculateTo_sqrtfp2ond,
sqrtfp2sclr => CalculateTo_sqrtfp2sclr,
sqrtfp2ce => CalculateTo_sqrtfp2ce,
sqrtfp2r => CalculateTo_sqrtfp2r,
sqrtfp2rdy => CalculateTo_sqrtfp2rdy
);

rom_constants_clock <= i_clock;
rom_constants_reset <= i_reset;
inst_rom_constants : rom_constants port map (
i_clock => rom_constants_clock,
i_reset => rom_constants_reset,
i_kvptat_en => rom_constants_kvptat_en,
i_kvptat_adr => rom_constants_kvptat_adr,
i_alphaptat_en => rom_constants_alphaptat_en,
i_alphaptat_adr => rom_constants_alphaptat_adr,
i_signed4bit_en => rom_constants_signed4bit_en,
i_signed4bit_adr => rom_constants_signed4bit_adr,
i_signed6bit_en => rom_constants_signed6bit_en,
i_signed6bit_adr => rom_constants_signed6bit_adr,
i_alphascale_1_en => rom_constants_alphascale_1_en,
i_alphascale_1_adr => rom_constants_alphascale_1_adr,
i_2powx_4bit_en => rom_constants_2powx_4bit_en,
i_2powx_4bit_adr => rom_constants_2powx_4bit_adr,
i_cpratio_en => rom_constants_cpratio_en,
i_cpratio_adr => rom_constants_cpratio_adr,
i_alphascale_2_en => rom_constants_alphascale_2_en,
i_alphascale_2_adr => rom_constants_alphascale_2_adr,
i_2powx_p8_4bit_en => rom_constants_2powx_p8_4bit_en,
i_2powx_p8_4bit_adr => rom_constants_2powx_p8_4bit_adr,
i_signed3bit_en => rom_constants_signed3bit_en,
i_signed3bit_adr => rom_constants_signed3bit_adr,
o_float => rom_constants_float
);

mem_signed1024_clock <= i_clock;
mem_signed1024_reset <= i_reset;
inst_mem_signed1024_fp32 : mem_signed1024
port map (
i_clock => mem_signed1024_clock,
i_reset => mem_signed1024_reset,
i_value => mem_signed1024_ivalue,
o_value => mem_signed1024_ovalue
);

mem_signed256_clock <= i_clock;
mem_signed256_reset <= i_reset;
inst_mem_signed256_fp32 : mem_signed256 port map (
i_clock => mem_signed256_clock,
i_reset => mem_signed256_reset,
i_value => mem_signed256_ivalue,
o_value => mem_signed256_ovalue
);

end architecture testbench;
