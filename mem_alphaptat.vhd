----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:17:52 12/25/2022 
-- Design Name: 
-- Module Name:    mem_alphaptat - Behavioral 
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

entity mem_alphaptat is
port (
	i_clock : in std_logic;
	i_reset : in std_logic;
	i_address : in std_logic_vector(15 downto 0);
	o_data_alphaptat : out std_logic_vector(31 downto 0)
);
end mem_alphaptat;

architecture Behavioral of mem_alphaptat is

component RAMB16 is
generic (
DOA_REG : integer := 0 ;
DOB_REG : integer := 0 ;
INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_A : bit_vector := X"000000000";
INIT_B : bit_vector := X"000000000";
INIT_FILE : string := "NONE";
INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INVERT_CLK_DOA_REG : boolean := false;
INVERT_CLK_DOB_REG : boolean := false;
RAM_EXTENSION_A : string := "NONE";
RAM_EXTENSION_B : string := "NONE";
READ_WIDTH_A : integer := 0;
READ_WIDTH_B : integer := 0;
SIM_COLLISION_CHECK : string := "ALL";
SRVAL_A  : bit_vector := X"000000000";
SRVAL_B  : bit_vector := X"000000000";
WRITE_MODE_A : string := "WRITE_FIRST";
WRITE_MODE_B : string := "WRITE_FIRST";
WRITE_WIDTH_A : integer := 0;
WRITE_WIDTH_B : integer := 0
);
port(
CASCADEOUTA  : out  std_ulogic;
CASCADEOUTB  : out  std_ulogic;
DOA          : out std_logic_vector (31 downto 0);
DOB          : out std_logic_vector (31 downto 0);
DOPA         : out std_logic_vector (3 downto 0);
DOPB         : out std_logic_vector (3 downto 0);
ADDRA        : in  std_logic_vector (14 downto 0);
ADDRB        : in  std_logic_vector (14 downto 0);
CASCADEINA   : in  std_ulogic;
CASCADEINB   : in  std_ulogic;
CLKA         : in  std_ulogic;
CLKB         : in  std_ulogic;
DIA          : in  std_logic_vector (31 downto 0);
DIB          : in  std_logic_vector (31 downto 0);
DIPA         : in  std_logic_vector (3 downto 0);
DIPB         : in  std_logic_vector (3 downto 0);
ENA          : in  std_ulogic;
ENB          : in  std_ulogic;
REGCEA       : in  std_ulogic;
REGCEB       : in  std_ulogic;
SSRA         : in  std_ulogic;
SSRB         : in  std_ulogic;
WEA          : in  std_logic_vector (3 downto 0);
WEB          : in  std_logic_vector (3 downto 0)
);
end component RAMB16;

signal CLKA_single,CLKB_single,ENA_single,ENB_single,REGCEA_single,REGCEB_single,SSRA_single,SSRB_single : std_logic;
signal DOA_single,DOB_single,DIA_single,DIB_single : std_logic_vector(31 downto 0);
signal DOPA_single,DOPB_single,DIPA_single,DIPB_single,WEA_single,WEB_single : std_logic_vector(3 downto 0);
signal ADDRA_single,ADDRB_single : std_logic_vector(14 downto 0);
signal I_ADDR : std_logic_vector(14 downto 0);
signal DO_reg : std_logic_vector(31 downto 0);
signal DOP_reg : std_logic_vector(3 downto 0);
signal mux : std_logic;
signal address_alphaptat : std_logic_vector(15 downto 0);

begin

p0 : process (i_address) is
begin
	address_alphaptat <= std_logic_vector(to_unsigned(to_integer(unsigned(i_address)) * 32,16));
end process p0;

mux <= '1' when (address_alphaptat(15) = '1') else '0' when (address_alphaptat(15) = '0') else '0';
ADDRA_single <= address_alphaptat(14 downto 0) when mux = '0' else (others => '0');
ADDRB_single <= address_alphaptat(14 downto 0) when mux = '1' else (others => '0');

inst_ramb16_alphaptat : RAMB16
generic map (
DOA_REG => 0, -- Optional output registers on the A port (0 or 1)
DOB_REG => 0, -- Optional output registers on the B port (0 or 1)
INIT_A => X"000000000", -- Initial values on A output port
INIT_B => X"000000000", -- Initial values on B output port
INVERT_CLK_DOA_REG => FALSE, -- Invert clock on A port output registers (TRUE or FALSE)
INVERT_CLK_DOB_REG => FALSE, -- Invert clock on B port output registers (TRUE or FALSE)
RAM_EXTENSION_A => "NONE", -- "UPPER", "LOWER" or "NONE" when cascaded
RAM_EXTENSION_B => "NONE", -- "UPPER", "LOWER" or "NONE" when cascaded
READ_WIDTH_A => 36, -- Valid values are 1,2,4,9,18 or 36
READ_WIDTH_B => 36, -- Valid values are 1,2,4,9,18 or 36
SRVAL_A => X"000000000", -- Port A ouput value upon SSR assertion
SRVAL_B => X"000000000", -- Port B ouput value upon SSR assertion
WRITE_MODE_A => "NO_CHANGE", -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE"
WRITE_MODE_B => "NO_CHANGE", -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE"
WRITE_WIDTH_A => 36, -- Valid values are 1,2,4,9,18 or 36
WRITE_WIDTH_B => 36, -- Valid values are 1,2,4,9,18 or 36
INIT_00 => X"411c0000411800004114000041100000410c0000410800004104000041000000",
INIT_01 => X"413c0000413800004134000041300000412c0000412800004124000041200000",
INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
CASCADEOUTA => open, -- 1-bit cascade output
CASCADEOUTB => open, -- 1-bit cascade output
DOA => o_data_alphaptat, -- 32-bit A port Data Output
DOB => open, -- 32-bit B port Data Output
DOPA => open, -- 4-bit A port Parity Output
DOPB => open, -- 4-bit B port Parity Output
ADDRA => ADDRA_single, -- 15-bit A port Address Input
ADDRB => ADDRB_single, -- 15-bit B port Address Input
CASCADEINA => '0', -- 1-bit cascade A input
CASCADEINB => '0', -- 1-bit cascade B input
CLKA => i_clock, -- Port A Clock
CLKB => i_clock, -- Port B Clock
DIA => (others => '0'), -- 32-bit A port Data Input
DIB => (others => '0'), -- 32-bit B port Data Input
DIPA => (others => '0'), -- 4-bit A port parity Input
DIPB => (others => '0'), -- 4-bit B port parity Input
ENA => '1', -- 1-bit A port Enable Input
ENB => '1', -- 1-bit B port Enable Input
REGCEA => '0', -- 1-bit A port register enable input
REGCEB => '0', -- 1-bit B port register enable input
SSRA => i_reset, -- 1-bit A port Synchronous Set/Reset Input
SSRB => i_reset, -- 1-bit B port Synchronous Set/Reset Input
WEA => (others => '0'), -- 4-bit A port Write Enable Input
WEB => (others => '0') -- 4-bit B port Write Enable Input
);

end Behavioral;
