----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:51:51 12/19/2022 
-- Design Name: 
-- Module Name:    mem_16bit_address - Behavioral 
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

entity mem_ramb16_16bit_address_single is
port (
O_DO          : out std_logic_vector (31 downto 0);
O_DOP         : out std_logic_vector (3 downto 0);
I_ADDR        : in  std_logic_vector (15 downto 0); -- 16bit
I_CLK         : in  std_ulogic;
I_DI          : in  std_logic_vector (31 downto 0);
I_DIP         : in  std_logic_vector (3 downto 0);
I_EN          : in  std_ulogic;
I_REGCE       : in  std_ulogic;
I_SSR         : in  std_ulogic;
I_WE          : in  std_logic_vector (3 downto 0)
);
end entity mem_ramb16_16bit_address_single;

architecture Behavioral of mem_ramb16_16bit_address_single is

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

signal mux : std_logic;

signal CLKA_single,CLKB_single,ENA_single,ENB_single,REGCEA_single,REGCEB_single,SSRA_single,SSRB_single : std_logic;
signal DOA_single,DOB_single,DIA_single,DIB_single : std_logic_vector(31 downto 0);
signal DOPA_single,DOPB_single,DIPA_single,DIPB_single,WEA_single,WEB_single : std_logic_vector(3 downto 0);
signal ADDRA_single,ADDRB_single : std_logic_vector(14 downto 0);
signal DO_reg : std_logic_vector(31 downto 0);
signal DOP_reg : std_logic_vector(3 downto 0);
signal A_reg : std_logic;

begin

-- XXX ramb16 two ports share the same x/16bit address
--p1 : process (I_CLK,I_SSR) is
--begin
--	if (rising_edge(I_CLK)) then
--		if (I_SSR = '1') then
--			A_reg <= '0';
--		else
--			A_reg <= I_ADDR(15);
--		end if;
--	end if;
--end process p1;

--mux <= '1' when (A_reg = '1') else '0' when (A_reg = '0') else '0';
mux <= '1' when (I_ADDR(15) = '1') else '0' when (I_ADDR(15) = '0') else '0';

O_DO <= DOA_single when (ENA_single = '1' and ENB_single = '0') else DOB_single when (ENA_single = '0' and ENB_single = '1') else (others => '0');
O_DOP <= DOPA_single when (ENA_single = '1' and ENB_single = '0') else DOPB_single when (ENA_single = '0' and ENB_single = '1') else (others => '0');

--p0 : process (I_CLK,I_SSR) is
--begin
--	if (rising_edge(I_CLK)) then
--		if (I_SSR = '1') then
--			O_DO <= (others => '0');
--			O_DOP <= (others => '0');
--		else
--			O_DO <= DO_reg;
--			O_DOP <= DOP_reg;
--		end if;
--	end if;
--end process p0;

--p2 : process (I_CLK,I_SSR) is
--begin
--	if (rising_edge(I_CLK)) then
--		if (I_SSR = '1') then
--			DO_reg <= (others => '0');
--			DOP_reg <= (others => '0');
--		else
--			if (ENA_single = '1' and ENB_single = '0') then
--				DO_reg <= DOA_single;
--				DOP_reg <= DOPA_single;
--			end if;
--			if (ENA_single = '0' and ENB_single = '1') then
--				DO_reg <= DOB_single;
--				DOP_reg <= DOPB_single;
--			end if;
--			if (ENA_single = '1' or ENB_single = '1') then
--				if (mux = '0') then
--					DO_reg <= DOA_single;
--					DOP_reg <= DOPA_single;
--				elsif (mux = '1') then
--					DO_reg <= DOB_single;
--					DOP_reg <= DOPB_single;
--				end if;
--			else
--				DO_reg <= DO_reg;
--				DOP_reg <= DOP_reg;
--			end if;
--		end if;
--	end if;
--end process p2;

--DO_reg <= DOA_single when (mux = '0' and (ENA_single = '1' and ENB_single = '0')) else DOB_single when (mux = '1' and (ENA_single = '0' and ENB_single = '1')) else (others => '0');
--DOP_reg <= DOPA_single when (mux = '0' and (ENA_single = '1' and ENB_single = '0')) else DOPB_single when (mux = '1' and (ENA_single = '0' and ENB_single = '1')) else (others => '0');

CLKA_single <= I_CLK;
CLKB_single <= I_CLK;

SSRA_single <= I_SSR;
SSRB_single <= I_SSR;

ADDRA_single <= I_ADDR(14 downto 0) when mux = '0' else (others => '0');
ADDRB_single <= I_ADDR(14 downto 0) when mux = '1' else (others => '0');

DIA_single <= I_DI when mux = '0' else (others => '0');
DIB_single <= I_DI when mux = '1' else (others => '0');

DIPA_single <= I_DIP when mux = '0' else (others => '0');
DIPB_single <= I_DIP when mux = '1' else (others => '0');

ENA_single <= I_EN when mux = '0' else '0';
ENB_single <= I_EN when mux = '1' else '0';

REGCEA_single <= I_REGCE when mux = '0' else '0';
REGCEB_single <= I_REGCE when mux = '1' else '0';

WEA_single <= I_WE when mux = '0' else (others => '0');
WEB_single <= I_WE when mux = '1' else (others => '0');

inst_ramb16_single : RAMB16
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
INIT_00 => X"3ae000003ac000003aa000003a8000003a4000003a0000003980000000000000",
INIT_01 => X"3b7000003b6000003b5000003b4000003b3000003b2000003b1000003b000000",
INIT_02 => X"3bb800003bb000003ba800003ba000003b9800003b9000003b8800003b800000",
INIT_03 => X"3bf800003bf000003be800003be000003bd800003bd000003bc800003bc00000",
INIT_04 => X"bbc80000bbd00000bbd80000bbe00000bbe80000bbf00000bbf80000bc000000",
INIT_05 => X"bb880000bb900000bb980000bba00000bba80000bbb00000bbb80000bbc00000",
INIT_06 => X"bb100000bb200000bb300000bb400000bb500000bb600000bb700000bb800000",
INIT_07 => X"b9800000ba000000ba400000ba800000baa00000bac00000bae00000bb000000",
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
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
CASCADEOUTA => open, -- 1-bit cascade output
CASCADEOUTB => open, -- 1-bit cascade output
DOA => DOA_single, -- 32-bit A port Data Output
DOB => DOB_single, -- 32-bit B port Data Output
DOPA => DOPA_single, -- 4-bit A port Parity Output
DOPB => DOPB_single, -- 4-bit B port Parity Output
ADDRA => ADDRA_single, -- 15-bit A port Address Input
ADDRB => ADDRB_single, -- 15-bit B port Address Input
CASCADEINA => '0', -- 1-bit cascade A input
CASCADEINB => '0', -- 1-bit cascade B input
CLKA => CLKA_single, -- Port A Clock
CLKB => CLKB_single, -- Port B Clock
DIA => DIA_single, -- 32-bit A port Data Input
DIB => DIB_single, -- 32-bit B port Data Input
DIPA => DIPA_single, -- 4-bit A port parity Input
DIPB => DIPB_single, -- 4-bit B port parity Input
ENA => ENA_single, -- 1-bit A port Enable Input
ENB => ENB_single, -- 1-bit B port Enable Input
REGCEA => REGCEA_single, -- 1-bit A port register enable input
REGCEB => REGCEB_single, -- 1-bit B port register enable input
SSRA => SSRA_single, -- 1-bit A port Synchronous Set/Reset Input
SSRB => SSRB_single, -- 1-bit B port Synchronous Set/Reset Input
WEA => WEA_single, -- 4-bit A port Write Enable Input
WEB => WEB_single -- 4-bit B port Write Enable Input
);

end Behavioral;
