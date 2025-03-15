----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:17:08 09/28/2024 
-- Design Name: 
-- Module Name:    mlx90640_core - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.p_fphdl_package1.all;

entity mlx90640_core is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);
o_rdy : out std_logic;
data_addr : in std_logic_vector(9 downto 0);
data_out : out std_logic_vector(31 downto 0);
a : out std_logic_vector (31 downto 0);
b : out std_logic_vector (31 downto 0);
a63 : out std_logic_vector (63 downto 0);
ce : out std_logic;
sclr : out std_logic;
ond : out std_logic;
rfd : in std_logic;
r : in std_logic_vector (31 downto 0);
rdy : in std_logic;
t : out t_fpop
);
end mlx90640_core;

architecture Behavioral of mlx90640_core is

component test_fixed_melexis is
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

fixed2floata : out STD_LOGIC_VECTOR(63 DOWNTO 0);
fixed2floatond : out STD_LOGIC;
fixed2floatsclr : out STD_LOGIC;
fixed2floatce : out STD_LOGIC;
fixed2floatr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : in STD_LOGIC;

divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : out STD_LOGIC;
divfpsclr : out STD_LOGIC;
divfpce : out STD_LOGIC;
divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : in STD_LOGIC;

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

sqrtfp2a : out STD_LOGIC_VECTOR(31 DOWNTO 0);
sqrtfp2ond : out STD_LOGIC;
sqrtfp2sclr : out STD_LOGIC;
sqrtfp2ce : out STD_LOGIC;
sqrtfp2r : in STD_LOGIC_VECTOR(31 DOWNTO 0);
sqrtfp2rdy : in STD_LOGIC

);
end component test_fixed_melexis;

component fp_mux is
port (
i_clock : in std_logic;
i_reset : in std_logic;
a : out std_logic_vector (31 downto 0);
b : out std_logic_vector (31 downto 0);
a63 : out std_logic_vector (63 downto 0);
ce : out std_logic;
sclr : out std_logic;
ond : out std_logic;
rfd : in std_logic;
r : in std_logic_vector (31 downto 0);
rdy : in std_logic;
t : out t_fpop;

fixed2floata : in STD_LOGIC_VECTOR(63 DOWNTO 0);
fixed2floatond : in STD_LOGIC;
fixed2floatsclr : in STD_LOGIC;
fixed2floatce : in STD_LOGIC;
fixed2floatr : out STD_LOGIC_VECTOR(31 DOWNTO 0);
fixed2floatrdy : out STD_LOGIC;

divfpa : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpb : in STD_LOGIC_VECTOR(31 DOWNTO 0);
divfpond : in STD_LOGIC;
divfpsclr : in STD_LOGIC;
divfpce : in STD_LOGIC;
divfpr : out STD_LOGIC_VECTOR(31 DOWNTO 0);
divfprdy : out STD_LOGIC;

mulfpa : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpb : in STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfpond : in STD_LOGIC;
mulfpsclr : in STD_LOGIC;
mulfpce : in STD_LOGIC;
mulfpr : out STD_LOGIC_VECTOR(31 DOWNTO 0);
mulfprdy : out STD_LOGIC;

addfpa : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpb : in STD_LOGIC_VECTOR(31 DOWNTO 0);
addfpond : in STD_LOGIC;
addfpsclr : in STD_LOGIC;
addfpce : in STD_LOGIC;
addfpr : out STD_LOGIC_VECTOR(31 DOWNTO 0);
addfprdy : out STD_LOGIC;

subfpa : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpb : in STD_LOGIC_VECTOR(31 DOWNTO 0);
subfpond : in STD_LOGIC;
subfpsclr : in STD_LOGIC;
subfpce : in STD_LOGIC;
subfpr : out STD_LOGIC_VECTOR(31 DOWNTO 0);
subfprdy : out STD_LOGIC;

sqrtfp2a : in STD_LOGIC_VECTOR(31 DOWNTO 0);
sqrtfp2ond : in STD_LOGIC;
sqrtfp2sclr : in STD_LOGIC;
sqrtfp2ce : in STD_LOGIC;
sqrtfp2r : out STD_LOGIC_VECTOR(31 DOWNTO 0);
sqrtfp2rdy : out STD_LOGIC

);
end component fp_mux;

signal addfpa,addfpb,addfpr,subfpa,subfpb,subfpr,mulfpa,mulfpb,mulfpr,divfpa,divfpb,divfpr,sqrtfp2a,sqrtfp2r,fixed2floatr : std_logic_vector (31 downto 0);
signal addfpond,addfpsclr,addfpce,addfprdy,subfpond,subfpsclr,subfpce,subfprdy,mulfpond,mulfpsclr,mulfpce,mulfprdy,divfpond,divfpsclr,divfpce,divfprdy,sqrtfp2ond,sqrtfp2sclr,sqrtfp2ce,sqrtfp2rdy,fixed2floatond,fixed2floatsclr,fixed2floatce,fixed2floatrdy : std_logic;
signal fixed2floata : std_logic_vector (63 downto 0);

begin

inst_test_fixed_melexis : test_fixed_melexis port map (
i_clock => i_clock,
i_reset => i_reset,
i_run => i_run,

i2c_mem_ena => i2c_mem_ena,
i2c_mem_addra => i2c_mem_addra,
i2c_mem_douta => i2c_mem_douta,

o_rdy => o_rdy,

i_addr => data_addr,
o_do => data_out,

fixed2floata => fixed2floata,
fixed2floatond => fixed2floatond,
fixed2floatsclr => fixed2floatsclr,
fixed2floatce => fixed2floatce,
fixed2floatr => fixed2floatr,
fixed2floatrdy => fixed2floatrdy,

divfpa => divfpa,
divfpb => divfpb,
divfpond => divfpond,
divfpsclr => divfpsclr,
divfpce => divfpce,
divfpr => divfpr,
divfprdy => divfprdy,

mulfpa => mulfpa,
mulfpb => mulfpb,
mulfpond => mulfpond,
mulfpsclr => mulfpsclr,
mulfpce => mulfpce,
mulfpr => mulfpr,
mulfprdy => mulfprdy,

addfpa => addfpa,
addfpb => addfpb,
addfpond => addfpond,
addfpsclr => addfpsclr,
addfpce => addfpce,
addfpr => addfpr,
addfprdy => addfprdy,

subfpa => subfpa,
subfpb => subfpb,
subfpond => subfpond,
subfpsclr => subfpsclr,
subfpce => subfpce,
subfpr => subfpr,
subfprdy => subfprdy,

sqrtfp2a => sqrtfp2a,
sqrtfp2ond => sqrtfp2ond,
sqrtfp2sclr => sqrtfp2sclr,
sqrtfp2ce => sqrtfp2ce,
sqrtfp2r => sqrtfp2r,
sqrtfp2rdy => sqrtfp2rdy
);

inst_fp_mux : fp_mux port map (
i_clock => i_clock,
i_reset => i_reset,
a => a,
b => b,
a63 => a63,
ce => ce,
sclr => sclr,
ond => ond,
rfd => rfd,
r => r,
rdy => rdy,
t => t,

fixed2floata => fixed2floata,
fixed2floatond => fixed2floatond,
fixed2floatsclr => fixed2floatsclr,
fixed2floatce => fixed2floatce,
fixed2floatr => fixed2floatr,
fixed2floatrdy => fixed2floatrdy,

divfpa => divfpa,
divfpb => divfpb,
divfpond => divfpond,
divfpsclr => divfpsclr,
divfpce => divfpce,
divfpr => divfpr,
divfprdy => divfprdy,

mulfpa => mulfpa,
mulfpb => mulfpb,
mulfpond => mulfpond,
mulfpsclr => mulfpsclr,
mulfpce => mulfpce,
mulfpr => mulfpr,
mulfprdy => mulfprdy,

addfpa => addfpa,
addfpb => addfpb,
addfpond => addfpond,
addfpsclr => addfpsclr,
addfpce => addfpce,
addfpr => addfpr,
addfprdy => addfprdy,

subfpa => subfpa,
subfpb => subfpb,
subfpond => subfpond,
subfpsclr => subfpsclr,
subfpce => subfpce,
subfpr => subfpr,
subfprdy => subfprdy,

sqrtfp2a => sqrtfp2a,
sqrtfp2ond => sqrtfp2ond,
sqrtfp2sclr => sqrtfp2sclr,
sqrtfp2ce => sqrtfp2ce,
sqrtfp2r => sqrtfp2r,
sqrtfp2rdy => sqrtfp2rdy
);

end architecture Behavioral;

