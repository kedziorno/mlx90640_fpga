----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:18:24 10/08/2024 
-- Design Name: 
-- Module Name:    rom_constants - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

-- ROM constants

entity rom_constants is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_kvptat_en : in std_logic;
i_kvptat_adr : in std_logic_vector (5 downto 0);
i_alphaptat_en : in std_logic;
i_alphaptat_adr : in std_logic_vector (3 downto 0);
i_signed4bit_en : in std_logic;
i_signed4bit_adr : in std_logic_vector (3 downto 0);
i_signed6bit_en : in std_logic;
i_signed6bit_adr : in std_logic_vector (5 downto 0);
i_alphascale_1_en : in std_logic;
i_alphascale_1_adr : in std_logic_vector (3 downto 0);
i_2powx_4bit_en : in std_logic;
i_2powx_4bit_adr : in std_logic_vector (3 downto 0);
i_cpratio_en : in std_logic;
i_cpratio_adr : in std_logic_vector (5 downto 0);
i_alphascale_2_en : in std_logic;
i_alphascale_2_adr : in std_logic_vector (3 downto 0);
i_2powx_p8_4bit_en : in std_logic;
i_2powx_p8_4bit_adr : in std_logic_vector (3 downto 0);
i_signed3bit_en : in std_logic;
i_signed3bit_adr : in std_logic_vector (2 downto 0);
o_float : out std_logic_vector (31 downto 0)
);
end entity rom_constants;

architecture Behavioral of rom_constants is

signal address : std_logic_vector (8 downto 0) := (others => '0');

begin

p0 : process (
i_kvptat_en,i_kvptat_adr,
i_alphaptat_en,i_alphaptat_adr,
i_signed4bit_en,i_signed4bit_adr,
i_signed6bit_en,i_signed6bit_adr,
i_alphascale_1_en,i_alphascale_1_adr,
i_2powx_4bit_en,i_2powx_4bit_adr,
i_cpratio_en,i_cpratio_adr,
i_alphascale_2_en,i_alphascale_2_adr,
i_2powx_p8_4bit_en,i_2powx_p8_4bit_adr,
i_signed3bit_en,i_signed3bit_adr
) is
begin
  address <= (others => '0');
  if (i_kvptat_en = '1') then
    address <= std_logic_vector (to_unsigned (to_integer (unsigned (i_kvptat_adr))          + 0,    9));
  elsif (i_alphaptat_en = '1') then
    address <= std_logic_vector (to_unsigned (to_integer (unsigned (i_alphaptat_adr))       + 64,   9));
  elsif (i_signed4bit_en = '1') then
    address <= std_logic_vector (to_unsigned (to_integer (unsigned (i_signed4bit_adr))      + 64 + 16,   9));
  elsif (i_signed6bit_en = '1') then
    address <= std_logic_vector (to_unsigned (to_integer (unsigned (i_signed6bit_adr))      + 64 + 16 + 16,   9));
  elsif (i_alphascale_1_en = '1') then
    address <= std_logic_vector (to_unsigned (to_integer (unsigned (i_alphascale_1_adr))    + 128 + 32,  9));
  elsif (i_2powx_4bit_en = '1') then
    address <= std_logic_vector (to_unsigned (to_integer (unsigned (i_2powx_4bit_adr))      + 128 + 48,  9));
  elsif (i_cpratio_en = '1') then
    address <= std_logic_vector (to_unsigned (to_integer (unsigned (i_cpratio_adr))         + 128 + 64,  9));
  elsif (i_alphascale_2_en = '1') then
    address <= std_logic_vector (to_unsigned (to_integer (unsigned (i_alphascale_2_adr))    + 256,  9));
  elsif (i_2powx_p8_4bit_en = '1') then
    address <= std_logic_vector (to_unsigned (to_integer (unsigned (i_2powx_p8_4bit_adr))   + 256 + 16,  9));
  elsif (i_signed3bit_en = '1') then
    address <= std_logic_vector (to_unsigned (to_integer (unsigned (i_signed3bit_adr))      + 256 + 16 + 16,  9));
  end if;
end process p0;

inst_rom_constants : RAMB16_S36
generic map (
INIT => X"000000000",
SRVAL => X"000000000",
WRITE_MODE => "READ_FIRST",
INIT_00 => X"3ae000003ac000003aa000003a8000003a4000003a0000003980000000000000", -- kvptat signed 6bit >31,-64 kvptat/2^12
INIT_01 => X"3b7000003b6000003b5000003b4000003b3000003b2000003b1000003b000000",
INIT_02 => X"3bb800003bb000003ba800003ba000003b9800003b9000003b8800003b800000",
INIT_03 => X"3bf800003bf000003be800003be000003bd800003bd000003bc800003bc00000",
INIT_04 => X"bbc80000bbd00000bbd80000bbe00000bbe80000bbf00000bbf80000bc000000",
INIT_05 => X"bb880000bb900000bb980000bba00000bba80000bbb00000bbb80000bbc00000",
INIT_06 => X"bb100000bb200000bb300000bb400000bb500000bb600000bb700000bb800000",
INIT_07 => X"b9800000ba000000ba400000ba800000baa00000bac00000bae00000bb000000", -- 64

INIT_08 => X"411c0000411800004114000041100000410c0000410800004104000041000000", -- alphaptat unsigned 4bit 0-15 (alphaptat/2^2)+8
INIT_09 => X"413c0000413800004134000041300000412c0000412800004124000041200000", -- 80

INIT_0a => X"40e0000040c0000040a000004080000040400000400000003f80000000000000", -- >7,-16 signed 4bit
INIT_0b => X"bf800000c0000000c0400000c0800000c0a00000c0c00000c0e00000c1000000", -- 96

INIT_0c => X"40e0000040c0000040a000004080000040400000400000003f80000000000000", -- >31,-64 signed 6bit
INIT_0d => X"4170000041600000415000004140000041300000412000004110000041000000",
INIT_0e => X"41b8000041b0000041a8000041a0000041980000419000004188000041800000",
INIT_0f => X"41f8000041f0000041e8000041e0000041d8000041d0000041c8000041c00000",
INIT_10 => X"c1c80000c1d00000c1d80000c1e00000c1e80000c1f00000c1f80000c2000000",
INIT_11 => X"c1880000c1900000c1980000c1a00000c1a80000c1b00000c1b80000c1c00000",
INIT_12 => X"c1100000c1200000c1300000c1400000c1500000c1600000c1700000c1800000",
INIT_13 => X"bf800000c0000000c0400000c0800000c0a00000c0c00000c0e00000c1000000", -- 160

INIT_14 => X"52000000518000005100000050800000500000004f8000004f0000004e800000", -- alphascale unsigned 4bit 0-15 2^(x+30)
INIT_15 => X"5600000055800000550000005480000054000000538000005300000052800000", -- 176

INIT_16 => X"430000004280000042000000418000004100000040800000400000003f800000", -- unsigned 4bit 0-15 2^x
INIT_17 => X"4700000046800000460000004580000045000000448000004400000043800000", -- 192

INIT_18 => X"3f8700003f8600003f8500003f8400003f8300003f8200003f8100003f800000", -- CP_P12P0_ratio signed 6bit -32-+31 (1 + (CP_P12P0_ratio/2^7))
INIT_19 => X"3f8f00003f8e00003f8d00003f8c00003f8b00003f8a00003f8900003f880000",
INIT_1a => X"3f9700003f9600003f9500003f9400003f9300003f9200003f9100003f900000",
INIT_1b => X"3f9f00003f9e00003f9d00003f9c00003f9b00003f9a00003f9900003f980000",
INIT_1c => X"3f4e00003f4c00003f4a00003f4800003f4600003f4400003f4200003f400000",
INIT_1d => X"3f5e00003f5c00003f5a00003f5800003f5600003f5400003f5200003f500000",
INIT_1e => X"3f6e00003f6c00003f6a00003f6800003f6600003f6400003f6200003f600000",
INIT_1f => X"3f7e00003f7c00003f7a00003f7800003f7600003f7400003f7200003f700000", -- 256

INIT_20 => X"50800000500000004f8000004f0000004e8000004e0000004d8000004d000000", -- alphascale unsigned 4bit 0-15 2^(x+27)
INIT_21 => X"5480000054000000538000005300000052800000520000005180000051000000", -- 272

INIT_22 => X"4700000046800000460000004580000045000000448000004400000043800000", -- ktascale1,kstoscale unsigned 4bit 0-15 2^(x+8)
INIT_23 => X"4b0000004a8000004a0000004980000049000000488000004800000047800000", -- 288

INIT_24 => X"bf800000c0000000c0400000c080000040400000400000003f80000000000000", -- >3,-8 signed 3bit -- 296 

INIT_25 => X"4700000046800000460000004580000045000000448000004400000043800000", -- kstoscale unsigned 4bit 0-15 2^(x+8) -- 303
INIT_26 => X"4b0000004a8000004a0000004980000049000000488000004800000047800000"
)
port map (
DO => o_float,
DOP => open,
ADDR => address,
CLK => i_clock,
DI => (others => '0'),
DIP => (others => '0'),
EN => i_clock,
SSR => i_reset,
WE => '0'
);

end architecture Behavioral;
