----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:14 01/24/2023 
-- Design Name: 
-- Module Name:    ExtractTGCParameters - Behavioral 
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

use work.p_fphdl_package1.all;
use work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ExtractTGCParameters is
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
end ExtractTGCParameters;

architecture Behavioral of ExtractTGCParameters is

signal odata_tgc : std_logic_vector (31 downto 0);
signal address_N : std_logic_vector (8 downto 0);

signal rdy : std_logic;

begin

o_rdy <= rdy;

p0 : process (i_clock) is
	type states is (idle,
	s1,s2,s3,s4,s5,
	ending);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			rdy <= '0';
			i2c_mem_ena <= '0';
			i2c_mem_addra <= (others => '0');
			address_N <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
						i2c_mem_ena <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
					end if;
				when s1 => state := s2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (60*2+1, 12)); -- ee243c LSB - tgcee
				when s2 => state := s3;
				when s3 => state := s4;
					address_N <= "0"&i2c_mem_douta;
				when s4 => state := s5;
				when s5 => state := ending;
					o_tgc  <= odata_tgc;
--					report "================ extractTGCparameters tgc : " & real'image (ap_slv2fp (odata_tgc));
				when ending => state := idle;
					rdy <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

inst_mem_tgc : RAMB16_S36
generic map (
INIT => X"0", -- Value of output RAM registers at startup
SRVAL => X"0", -- Output value upon SSR assertion
WRITE_MODE => "WRITE_FIRST", -- WRITE_FIRST, READ_FIRST or NO_CHANGE
-- The following INIT_xx declarations specify the intial contents of the RAM
-- Address 0 to 4095
-- TGC_EE -128 - 127 , out TGC_EE/2^5 Single FP
INIT_00 => X"3e6000003e4000003e2000003e0000003dc000003d8000003d00000000000000",
INIT_01 => X"3ef000003ee000003ed000003ec000003eb000003ea000003e9000003e800000",
INIT_02 => X"3f3800003f3000003f2800003f2000003f1800003f1000003f0800003f000000",
INIT_03 => X"3f7800003f7000003f6800003f6000003f5800003f5000003f4800003f400000",
INIT_04 => X"3f9c00003f9800003f9400003f9000003f8c00003f8800003f8400003f800000",
INIT_05 => X"3fbc00003fb800003fb400003fb000003fac00003fa800003fa400003fa00000",
INIT_06 => X"3fdc00003fd800003fd400003fd000003fcc00003fc800003fc400003fc00000",
INIT_07 => X"3ffc00003ff800003ff400003ff000003fec00003fe800003fe400003fe00000",
INIT_08 => X"400e0000400c0000400a00004008000040060000400400004002000040000000",
INIT_09 => X"401e0000401c0000401a00004018000040160000401400004012000040100000",
INIT_0a => X"402e0000402c0000402a00004028000040260000402400004022000040200000",
INIT_0b => X"403e0000403c0000403a00004038000040360000403400004032000040300000",
INIT_0c => X"404e0000404c0000404a00004048000040460000404400004042000040400000",
INIT_0d => X"405e0000405c0000405a00004058000040560000405400004052000040500000",
INIT_0e => X"406e0000406c0000406a00004068000040660000406400004062000040600000",
INIT_0f => X"407e0000407c0000407a00004078000040760000407400004072000040700000",
INIT_10 => X"c0720000c0740000c0760000c0780000c07a0000c07c0000c07e0000c0800000",
INIT_11 => X"c0620000c0640000c0660000c0680000c06a0000c06c0000c06e0000c0700000",
INIT_12 => X"c0520000c0540000c0560000c0580000c05a0000c05c0000c05e0000c0600000",
INIT_13 => X"c0420000c0440000c0460000c0480000c04a0000c04c0000c04e0000c0500000",
INIT_14 => X"c0320000c0340000c0360000c0380000c03a0000c03c0000c03e0000c0400000",
INIT_15 => X"c0220000c0240000c0260000c0280000c02a0000c02c0000c02e0000c0300000",
INIT_16 => X"c0120000c0140000c0160000c0180000c01a0000c01c0000c01e0000c0200000",
INIT_17 => X"c0020000c0040000c0060000c0080000c00a0000c00c0000c00e0000c0100000",
INIT_18 => X"bfe40000bfe80000bfec0000bff00000bff40000bff80000bffc0000c0000000",
INIT_19 => X"bfc40000bfc80000bfcc0000bfd00000bfd40000bfd80000bfdc0000bfe00000",
INIT_1a => X"bfa40000bfa80000bfac0000bfb00000bfb40000bfb80000bfbc0000bfc00000",
INIT_1b => X"bf840000bf880000bf8c0000bf900000bf940000bf980000bf9c0000bfa00000",
INIT_1c => X"bf480000bf500000bf580000bf600000bf680000bf700000bf780000bf800000",
INIT_1d => X"bf080000bf100000bf180000bf200000bf280000bf300000bf380000bf400000",
INIT_1e => X"be900000bea00000beb00000bec00000bed00000bee00000bef00000bf000000",
INIT_1f => X"bd000000bd800000bdc00000be000000be200000be400000be600000be800000",
-- Address 8192 to 12287
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
-- Address 12288 to 16383
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
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
port map (
DO => odata_tgc, -- 1-bit Data Output
DOP => open, -- 1-bit Data Output
ADDR => address_N, -- 14-bit Address Input
CLK => i_clock, -- Clock
DI => (others => '0'), -- 1-bit Data Input
DIP => (others => '0'), -- 1-bit Data Input
EN => '1', -- RAM Enable Input
SSR => i_reset, -- Synchronous Set/Reset Input
WE => '0' -- Write Enable Input
);
-- End of RAMB16_S1_inst instantiation

end Behavioral;

