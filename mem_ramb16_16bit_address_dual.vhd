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

entity mem_ramb16_16bit_address_dual is
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
end entity mem_ramb16_16bit_address_dual;

architecture Behavioral of mem_ramb16_16bit_address_dual is

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

signal CLKA_lo,CLKB_lo,ENA_lo,ENB_lo,REGCEA_lo,REGCEB_lo,SSRA_lo,SSRB_lo : std_logic;
signal DOA_lo,DOB_lo,DIA_lo,DIB_lo : std_logic_vector(31 downto 0);
signal DOPA_lo,DOPB_lo,DIPA_lo,DIPB_lo,WEA_lo,WEB_lo : std_logic_vector(3 downto 0);
signal ADDRA_lo,ADDRB_lo : std_logic_vector(14 downto 0);

signal CLKA_hi,CLKB_hi,ENA_hi,ENB_hi,REGCEA_hi,REGCEB_hi,SSRA_hi,SSRB_hi : std_logic;
signal DOA_hi,DOB_hi,DIA_hi,DIB_hi : std_logic_vector(31 downto 0);
signal DOPA_hi,DOPB_hi,DIPA_hi,DIPB_hi,WEA_hi,WEB_hi : std_logic_vector(3 downto 0);
signal ADDRA_hi,ADDRB_hi : std_logic_vector(14 downto 0);
signal DO_reg : std_logic_vector(31 downto 0);
signal DOP_reg : std_logic_vector(3 downto 0);
signal A_reg : std_logic;
signal ADDR_reg : std_logic_vector(15 downto 0);

begin

--p3 : process (I_CLK,I_SSR) is
--begin
--	if (rising_edge(I_CLK)) then
--		if (I_SSR = '1') then
--			ADDR_reg <= (others => '0');
--		else
--			ADDR_reg <= I_ADDR;
--		end if;
--	end if;
--end process p3;

--p1 : process (I_CLK,I_SSR) is
--begin
--	if (rising_edge(I_CLK)) then
--		if (I_SSR = '1') then
--			mux <= '0';
--		else
--			if (ADDR_reg(15) = '1') then
--				mux <= '1';
--			elsif (ADDR_reg(15) = '0') then
--				mux <= '0';
--			end if;
--		end if;
--	end if;
--end process p1;

--mux <= '1' when (ADDR_reg(15) = '1') else '0' when (ADDR_reg(15) = '0') else '0';
mux <= '1' when (I_ADDR(15) = '1') else '0' when (I_ADDR(15) = '0') else '0';

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
--			if (ENA_lo = '1' and ENA_hi = '0') then
--				DO_reg <= DOA_lo;
--				DOP_reg <= DOPA_lo;
--			end if;
--			if (ENA_lo = '0' and ENA_hi = '1') then
--				DO_reg <= DOA_hi;
--				DOP_reg <= DOPA_hi;
--			end if;
--		end if;
--	end if;
--end process p2;

O_DO <= DOA_lo when (ENA_lo = '1' and ENA_hi = '0') else DOA_hi when (ENA_lo = '0' and ENA_hi = '1') else (others => '0');
O_DOP <= DOPA_lo when (ENA_lo = '1' and ENA_hi = '0') else DOPA_hi when (ENA_lo = '0' and ENA_hi = '1') else (others => '0');

--ADDRA_lo <= ADDR_reg(14 downto 0) when mux = '0' else (others => '0');
--ADDRA_hi <= ADDR_reg(14 downto 0) when mux = '1' else (others => '0');
ADDRA_lo <= I_ADDR(14 downto 0) when mux = '0' else (others => '0');
ADDRA_hi <= I_ADDR(14 downto 0) when mux = '1' else (others => '0');
CLKA_lo <= I_CLK;
CLKA_hi <= I_CLK;
CLKB_lo <= '0';
CLKB_hi <= '0';
DIA_lo <= I_DI when mux = '0' else (others => '0');
DIA_hi <= I_DI when mux = '1' else (others => '0');
DIPA_lo <= I_DIP when mux = '0' else (others => '0');
DIPA_hi <= I_DIP when mux = '1' else (others => '0');
ENA_lo <= I_EN when mux = '0' else '0';
ENA_hi <= I_EN when mux = '1' else '0';
REGCEA_lo <= I_REGCE when mux = '0' else '0';
REGCEA_hi <= I_REGCE when mux = '1' else '0';
SSRA_lo <= I_SSR;
SSRA_hi <= I_SSR;
SSRB_lo <= '1';
SSRB_hi <= '1';
WEA_lo <= I_WE when mux = '0' else (others => '0');
WEA_hi <= I_WE when mux = '1' else (others => '0');

inst_ramb16_hi : RAMB16
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
INIT_00 => X"c27c8000c27d0000c27d8000c27e0000c27e8000c27f0000c27f8000c2800000",
INIT_01 => X"c2788000c2790000c2798000c27a0000c27a8000c27b0000c27b8000c27c0000",
INIT_02 => X"c2748000c2750000c2758000c2760000c2768000c2770000c2778000c2780000",
INIT_03 => X"c2708000c2710000c2718000c2720000c2728000c2730000c2738000c2740000",
INIT_04 => X"c26c8000c26d0000c26d8000c26e0000c26e8000c26f0000c26f8000c2700000",
INIT_05 => X"c2688000c2690000c2698000c26a0000c26a8000c26b0000c26b8000c26c0000",
INIT_06 => X"c2648000c2650000c2658000c2660000c2668000c2670000c2678000c2680000",
INIT_07 => X"c2608000c2610000c2618000c2620000c2628000c2630000c2638000c2640000",
INIT_08 => X"c25c8000c25d0000c25d8000c25e0000c25e8000c25f0000c25f8000c2600000",
INIT_09 => X"c2588000c2590000c2598000c25a0000c25a8000c25b0000c25b8000c25c0000",
INIT_0a => X"c2548000c2550000c2558000c2560000c2568000c2570000c2578000c2580000",
INIT_0b => X"c2508000c2510000c2518000c2520000c2528000c2530000c2538000c2540000",
INIT_0c => X"c24c8000c24d0000c24d8000c24e0000c24e8000c24f0000c24f8000c2500000",
INIT_0d => X"c2488000c2490000c2498000c24a0000c24a8000c24b0000c24b8000c24c0000",
INIT_0e => X"c2448000c2450000c2458000c2460000c2468000c2470000c2478000c2480000",
INIT_0f => X"c2408000c2410000c2418000c2420000c2428000c2430000c2438000c2440000",
INIT_10 => X"c23c8000c23d0000c23d8000c23e0000c23e8000c23f0000c23f8000c2400000",
INIT_11 => X"c2388000c2390000c2398000c23a0000c23a8000c23b0000c23b8000c23c0000",
INIT_12 => X"c2348000c2350000c2358000c2360000c2368000c2370000c2378000c2380000",
INIT_13 => X"c2308000c2310000c2318000c2320000c2328000c2330000c2338000c2340000",
INIT_14 => X"c22c8000c22d0000c22d8000c22e0000c22e8000c22f0000c22f8000c2300000",
INIT_15 => X"c2288000c2290000c2298000c22a0000c22a8000c22b0000c22b8000c22c0000",
INIT_16 => X"c2248000c2250000c2258000c2260000c2268000c2270000c2278000c2280000",
INIT_17 => X"c2208000c2210000c2218000c2220000c2228000c2230000c2238000c2240000",
INIT_18 => X"c21c8000c21d0000c21d8000c21e0000c21e8000c21f0000c21f8000c2200000",
INIT_19 => X"c2188000c2190000c2198000c21a0000c21a8000c21b0000c21b8000c21c0000",
INIT_1a => X"c2148000c2150000c2158000c2160000c2168000c2170000c2178000c2180000",
INIT_1b => X"c2108000c2110000c2118000c2120000c2128000c2130000c2138000c2140000",
INIT_1c => X"c20c8000c20d0000c20d8000c20e0000c20e8000c20f0000c20f8000c2100000",
INIT_1d => X"c2088000c2090000c2098000c20a0000c20a8000c20b0000c20b8000c20c0000",
INIT_1e => X"c2048000c2050000c2058000c2060000c2068000c2070000c2078000c2080000",
INIT_1f => X"c2008000c2010000c2018000c2020000c2028000c2030000c2038000c2040000",
INIT_20 => X"c1f90000c1fa0000c1fb0000c1fc0000c1fd0000c1fe0000c1ff0000c2000000",
INIT_21 => X"c1f10000c1f20000c1f30000c1f40000c1f50000c1f60000c1f70000c1f80000",
INIT_22 => X"c1e90000c1ea0000c1eb0000c1ec0000c1ed0000c1ee0000c1ef0000c1f00000",
INIT_23 => X"c1e10000c1e20000c1e30000c1e40000c1e50000c1e60000c1e70000c1e80000",
INIT_24 => X"c1d90000c1da0000c1db0000c1dc0000c1dd0000c1de0000c1df0000c1e00000",
INIT_25 => X"c1d10000c1d20000c1d30000c1d40000c1d50000c1d60000c1d70000c1d80000",
INIT_26 => X"c1c90000c1ca0000c1cb0000c1cc0000c1cd0000c1ce0000c1cf0000c1d00000",
INIT_27 => X"c1c10000c1c20000c1c30000c1c40000c1c50000c1c60000c1c70000c1c80000",
INIT_28 => X"c1b90000c1ba0000c1bb0000c1bc0000c1bd0000c1be0000c1bf0000c1c00000",
INIT_29 => X"c1b10000c1b20000c1b30000c1b40000c1b50000c1b60000c1b70000c1b80000",
INIT_2a => X"c1a90000c1aa0000c1ab0000c1ac0000c1ad0000c1ae0000c1af0000c1b00000",
INIT_2b => X"c1a10000c1a20000c1a30000c1a40000c1a50000c1a60000c1a70000c1a80000",
INIT_2c => X"c1990000c19a0000c19b0000c19c0000c19d0000c19e0000c19f0000c1a00000",
INIT_2d => X"c1910000c1920000c1930000c1940000c1950000c1960000c1970000c1980000",
INIT_2e => X"c1890000c18a0000c18b0000c18c0000c18d0000c18e0000c18f0000c1900000",
INIT_2f => X"c1810000c1820000c1830000c1840000c1850000c1860000c1870000c1880000",
INIT_30 => X"c1720000c1740000c1760000c1780000c17a0000c17c0000c17e0000c1800000",
INIT_31 => X"c1620000c1640000c1660000c1680000c16a0000c16c0000c16e0000c1700000",
INIT_32 => X"c1520000c1540000c1560000c1580000c15a0000c15c0000c15e0000c1600000",
INIT_33 => X"c1420000c1440000c1460000c1480000c14a0000c14c0000c14e0000c1500000",
INIT_34 => X"c1320000c1340000c1360000c1380000c13a0000c13c0000c13e0000c1400000",
INIT_35 => X"c1220000c1240000c1260000c1280000c12a0000c12c0000c12e0000c1300000",
INIT_36 => X"c1120000c1140000c1160000c1180000c11a0000c11c0000c11e0000c1200000",
INIT_37 => X"c1020000c1040000c1060000c1080000c10a0000c10c0000c10e0000c1100000",
INIT_38 => X"c0e40000c0e80000c0ec0000c0f00000c0f40000c0f80000c0fc0000c1000000",
INIT_39 => X"c0c40000c0c80000c0cc0000c0d00000c0d40000c0d80000c0dc0000c0e00000",
INIT_3a => X"c0a40000c0a80000c0ac0000c0b00000c0b40000c0b80000c0bc0000c0c00000",
INIT_3b => X"c0840000c0880000c08c0000c0900000c0940000c0980000c09c0000c0a00000",
INIT_3c => X"c0480000c0500000c0580000c0600000c0680000c0700000c0780000c0800000",
INIT_3d => X"c0080000c0100000c0180000c0200000c0280000c0300000c0380000c0400000",
INIT_3e => X"bf900000bfa00000bfb00000bfc00000bfd00000bfe00000bff00000c0000000",
INIT_3f => X"be000000be800000bec00000bf000000bf200000bf400000bf600000bf800000",

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
DOA => DOA_hi, -- 32-bit A port Data Output
DOB => open, -- 32-bit B port Data Output
DOPA => DOPA_hi, -- 4-bit A port Parity Output
DOPB => open, -- 4-bit B port Parity Output
ADDRA => ADDRA_hi, -- 15-bit A port Address Input
ADDRB => ADDRA_hi, -- 15-bit B port Address Input
CASCADEINA => '0', -- 1-bit cascade A input
CASCADEINB => '0', -- 1-bit cascade B input
CLKA => CLKA_hi, -- Port A Clock
CLKB => CLKA_hi, -- Port B Clock
DIA => DIA_hi, -- 32-bit A port Data Input
DIB => DIA_hi, -- 32-bit B port Data Input
DIPA => DIPA_hi, -- 4-bit A port parity Input
DIPB => DIPA_hi, -- 4-bit B port parity Input
ENA => ENA_hi, -- 1-bit A port Enable Input
ENB => not ENA_hi, -- 1-bit B port Enable Input
REGCEA => '0', -- 1-bit A port register enable input
REGCEB => '0', -- 1-bit B port register enable input
SSRA => SSRA_hi, -- 1-bit A port Synchronous Set/Reset Input
SSRB => SSRA_hi, -- 1-bit B port Synchronous Set/Reset Input
WEA => WEA_hi, -- 4-bit A port Write Enable Input
WEB => WEA_hi -- 4-bit B port Write Enable Input
);

inst_ramb16_lo : RAMB16
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
INIT_00 => X"3f6000003f4000003f2000003f0000003ec000003e8000003e00000000000000",
INIT_01 => X"3ff000003fe000003fd000003fc000003fb000003fa000003f9000003f800000",
INIT_02 => X"4038000040300000402800004020000040180000401000004008000040000000",
INIT_03 => X"4078000040700000406800004060000040580000405000004048000040400000",
INIT_04 => X"409c0000409800004094000040900000408c0000408800004084000040800000",
INIT_05 => X"40bc000040b8000040b4000040b0000040ac000040a8000040a4000040a00000",
INIT_06 => X"40dc000040d8000040d4000040d0000040cc000040c8000040c4000040c00000",
INIT_07 => X"40fc000040f8000040f4000040f0000040ec000040e8000040e4000040e00000",
INIT_08 => X"410e0000410c0000410a00004108000041060000410400004102000041000000",
INIT_09 => X"411e0000411c0000411a00004118000041160000411400004112000041100000",
INIT_0a => X"412e0000412c0000412a00004128000041260000412400004122000041200000",
INIT_0b => X"413e0000413c0000413a00004138000041360000413400004132000041300000",
INIT_0c => X"414e0000414c0000414a00004148000041460000414400004142000041400000",
INIT_0d => X"415e0000415c0000415a00004158000041560000415400004152000041500000",
INIT_0e => X"416e0000416c0000416a00004168000041660000416400004162000041600000",
INIT_0f => X"417e0000417c0000417a00004178000041760000417400004172000041700000",
INIT_10 => X"4187000041860000418500004184000041830000418200004181000041800000",
INIT_11 => X"418f0000418e0000418d0000418c0000418b0000418a00004189000041880000",
INIT_12 => X"4197000041960000419500004194000041930000419200004191000041900000",
INIT_13 => X"419f0000419e0000419d0000419c0000419b0000419a00004199000041980000",
INIT_14 => X"41a7000041a6000041a5000041a4000041a3000041a2000041a1000041a00000",
INIT_15 => X"41af000041ae000041ad000041ac000041ab000041aa000041a9000041a80000",
INIT_16 => X"41b7000041b6000041b5000041b4000041b3000041b2000041b1000041b00000",
INIT_17 => X"41bf000041be000041bd000041bc000041bb000041ba000041b9000041b80000",
INIT_18 => X"41c7000041c6000041c5000041c4000041c3000041c2000041c1000041c00000",
INIT_19 => X"41cf000041ce000041cd000041cc000041cb000041ca000041c9000041c80000",
INIT_1a => X"41d7000041d6000041d5000041d4000041d3000041d2000041d1000041d00000",
INIT_1b => X"41df000041de000041dd000041dc000041db000041da000041d9000041d80000",
INIT_1c => X"41e7000041e6000041e5000041e4000041e3000041e2000041e1000041e00000",
INIT_1d => X"41ef000041ee000041ed000041ec000041eb000041ea000041e9000041e80000",
INIT_1e => X"41f7000041f6000041f5000041f4000041f3000041f2000041f1000041f00000",
INIT_1f => X"41ff000041fe000041fd000041fc000041fb000041fa000041f9000041f80000",
INIT_20 => X"4203800042030000420280004202000042018000420100004200800042000000",
INIT_21 => X"4207800042070000420680004206000042058000420500004204800042040000",
INIT_22 => X"420b8000420b0000420a8000420a000042098000420900004208800042080000",
INIT_23 => X"420f8000420f0000420e8000420e0000420d8000420d0000420c8000420c0000",
INIT_24 => X"4213800042130000421280004212000042118000421100004210800042100000",
INIT_25 => X"4217800042170000421680004216000042158000421500004214800042140000",
INIT_26 => X"421b8000421b0000421a8000421a000042198000421900004218800042180000",
INIT_27 => X"421f8000421f0000421e8000421e0000421d8000421d0000421c8000421c0000",
INIT_28 => X"4223800042230000422280004222000042218000422100004220800042200000",
INIT_29 => X"4227800042270000422680004226000042258000422500004224800042240000",
INIT_2a => X"422b8000422b0000422a8000422a000042298000422900004228800042280000",
INIT_2b => X"422f8000422f0000422e8000422e0000422d8000422d0000422c8000422c0000",
INIT_2c => X"4233800042330000423280004232000042318000423100004230800042300000",
INIT_2d => X"4237800042370000423680004236000042358000423500004234800042340000",
INIT_2e => X"423b8000423b0000423a8000423a000042398000423900004238800042380000",
INIT_2f => X"423f8000423f0000423e8000423e0000423d8000423d0000423c8000423c0000",
INIT_30 => X"4243800042430000424280004242000042418000424100004240800042400000",
INIT_31 => X"4247800042470000424680004246000042458000424500004244800042440000",
INIT_32 => X"424b8000424b0000424a8000424a000042498000424900004248800042480000",
INIT_33 => X"424f8000424f0000424e8000424e0000424d8000424d0000424c8000424c0000",
INIT_34 => X"4253800042530000425280004252000042518000425100004250800042500000",
INIT_35 => X"4257800042570000425680004256000042558000425500004254800042540000",
INIT_36 => X"425b8000425b0000425a8000425a000042598000425900004258800042580000",
INIT_37 => X"425f8000425f0000425e8000425e0000425d8000425d0000425c8000425c0000",
INIT_38 => X"4263800042630000426280004262000042618000426100004260800042600000",
INIT_39 => X"4267800042670000426680004266000042658000426500004264800042640000",
INIT_3a => X"426b8000426b0000426a8000426a000042698000426900004268800042680000",
INIT_3b => X"426f8000426f0000426e8000426e0000426d8000426d0000426c8000426c0000",
INIT_3c => X"4273800042730000427280004272000042718000427100004270800042700000",
INIT_3d => X"4277800042770000427680004276000042758000427500004274800042740000",
INIT_3e => X"427b8000427b0000427a8000427a000042798000427900004278800042780000",
INIT_3f => X"427f8000427f0000427e8000427e0000427d8000427d0000427c8000427c0000",

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
DOA => DOA_lo, -- 32-bit A port Data Output
DOB => open, -- 32-bit B port Data Output
DOPA => DOPA_lo, -- 4-bit A port Parity Output
DOPB => open, -- 4-bit B port Parity Output
ADDRA => ADDRA_lo, -- 15-bit A port Address Input
ADDRB => ADDRA_lo, -- 15-bit B port Address Input
CASCADEINA => '0', -- 1-bit cascade A input
CASCADEINB => '0', -- 1-bit cascade B input
CLKA => CLKA_lo, -- Port A Clock
CLKB => CLKA_lo, -- Port B Clock
DIA => DIA_lo, -- 32-bit A port Data Input
DIB => DIA_lo, -- 32-bit B port Data Input
DIPA => DIPA_lo, -- 4-bit A port parity Input
DIPB => DIPA_lo, -- 4-bit B port parity Input
ENA => ENA_lo, -- 1-bit A port Enable Input
ENB => not ENA_lo, -- 1-bit B port Enable Input
REGCEA => '0', -- 1-bit A port register enable input
REGCEB => '0', -- 1-bit B port register enable input
SSRA => SSRA_lo, -- 1-bit A port Synchronous Set/Reset Input
SSRB => SSRA_lo, -- 1-bit B port Synchronous Set/Reset Input
WEA => WEA_lo, -- 4-bit A port Write Enable Input
WEB => WEA_lo -- 4-bit B port Write Enable Input
);

end Behavioral;
