----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:47 06/13/2023 
-- Design Name: 
-- Module Name:    CalculatePixGain_process_p0 - Behavioral 
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

use work.p_fphdl_package3.all;

entity CalculatePixGain_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

CalculateKGain_run : out std_logic;
CalculateKGain_mux : out std_logic;
CalculateKGain_rdy : in std_logic;
CalculateKGain_KGain : in std_logic_vector (31 downto 0);

o_rdy : out std_logic;

o_write_enable : out std_logic;
o_addra : out std_logic_vector (9 downto 0);
o_dia : out std_logic_vector (31 downto 0);

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
signal mulfprdy : in STD_LOGIC

);
end CalculatePixGain_process_p0;

architecture Behavioral of CalculatePixGain_process_p0 is

signal i2c_mem_ena_internal : STD_LOGIC;
signal i2c_mem_addra_internal : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta_internal : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal fixed2floata_internal : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond_internal : STD_LOGIC;
signal fixed2floatce_internal : STD_LOGIC;
signal fixed2floatsclr_internal : STD_LOGIC;
signal fixed2floatr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy_internal : STD_LOGIC;

signal mulfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond_internal : STD_LOGIC;
signal mulfpce_internal : STD_LOGIC;
signal mulfpsclr_internal : STD_LOGIC;
signal mulfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy_internal : STD_LOGIC;

begin

fixed2floata <= fixed2floata_internal;
fixed2floatond <= fixed2floatond_internal;
fixed2floatce <= fixed2floatce_internal;
fixed2floatsclr <= fixed2floatsclr_internal;
fixed2floatr_internal <= fixed2floatr;
fixed2floatrdy_internal <= fixed2floatrdy;

mulfpa <= mulfpa_internal;
mulfpb <= mulfpb_internal;
mulfpond <= mulfpond_internal;
mulfpce <= mulfpce_internal;
mulfpsclr <= mulfpsclr_internal;
mulfpr_internal <= mulfpr;
mulfprdy_internal <= mulfprdy;

i2c_mem_ena <= i2c_mem_ena_internal;
i2c_mem_addra <= i2c_mem_addra_internal;
i2c_mem_douta_internal <= i2c_mem_douta;

p0 : process (i_clock) is
	constant PIXGAIN_ST : integer := 1665; -- pixgain start - eeprom max + 1
	constant PIXGAIN_SZ : integer := 24*32; -- pixgain size
	variable pixgain_index : integer range 0 to PIXGAIN_SZ - 1;
	type states is (idle,s0,s0a,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,
	ending);
	variable state : states;
	variable eeprom16slv,ram16slv : std_logic_vector (15 downto 0);
	variable pixgain_ft : std_logic_vector (31 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			pixgain_index := 0;
			fixed2floatsclr_internal <= '1';
			mulfpsclr_internal <= '1';
			o_rdy <= '0';
			fixed2floata_internal <= (others => '0');
			fixed2floatce_internal <= '0';
			fixed2floatond_internal <= '0';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			o_addra <= (others => '0');
			o_dia <= (others => '0');
			o_write_enable <= '0';
			CalculateKGain_mux <= '0';
			i2c_mem_ena_internal <= '0';
			i2c_mem_addra_internal <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s0;
						i2c_mem_ena_internal <= '1';
					else
						state := idle;
						i2c_mem_ena_internal <= '0';
					end if;
					fixed2floatsclr_internal <= '0';
					mulfpsclr_internal <= '0';

				when s0 => state := s0a;
					CalculateKGain_run <= '1';
					CalculateKGain_mux <= '1';
				when s0a => 
					CalculateKGain_run <= '0';
					if (CalculateKGain_rdy = '1') then
						state := s1;
						CalculateKGain_mux <= '0';
					else
						state := s0a;
						CalculateKGain_mux <= '1';
					end if;

				when s1 => state := s2;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (PIXGAIN_ST+(pixgain_index*2)+0, 12)); -- MSB
				when s2 => state := s3;
					i2c_mem_addra_internal <= std_logic_vector (to_unsigned (PIXGAIN_ST+(pixgain_index*2)+1, 12)); -- LSB
					eeprom16slv (15 downto 8) := i2c_mem_douta_internal; -- pixgain MSB
				when s3 => state := s4;
					eeprom16slv (7 downto 0) := i2c_mem_douta_internal; -- pixgain LSB
				when s4 => state := s5;

		fixed2floatce_internal <= '1';
		fixed2floatond_internal <= '1';
		fixed2floata_internal <=
		eeprom16slv (15) & eeprom16slv (15) & 
		eeprom16slv (15) & eeprom16slv (15) & 
		eeprom16slv (15) & eeprom16slv (15) & 
		eeprom16slv (15) & eeprom16slv (15) & 
		eeprom16slv (15) & eeprom16slv (15) & 
		eeprom16slv (15) & eeprom16slv (15) & 
		eeprom16slv (15) & eeprom16slv (15) & 
		eeprom16slv (15) & eeprom16slv (15) & 
		eeprom16slv (15) & eeprom16slv (15) & 
		eeprom16slv (15) & eeprom16slv & "00000000000000000000000000000";

				when s5 =>
					if (fixed2floatrdy_internal = '1') then state := s6;
						pixgain_ft := fixed2floatr;
						fixed2floatce_internal <= '0';
						fixed2floatond_internal <= '0';
						fixed2floatsclr_internal <= '1';
					else state := s5; end if;
				when s6 => state := s7;
					fixed2floatsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= pixgain_ft;
					mulfpb_internal <= CalculateKGain_KGain;
					mulfpond_internal <= '1';
				when s7 =>
					if (mulfprdy_internal = '1') then state := s8;
						o_addra <= std_logic_vector (to_unsigned (pixgain_index, 10));
						o_dia <= mulfpr;
						o_write_enable <= '1';
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
					else state := s7; end if;
				when s8 => state := s9;
					mulfpsclr_internal <= '0';
					o_write_enable <= '0';
          report_error ("================ CalculatePixGain PixGain " & integer'image (pixgain_index) & " : ",mulfpr,0.0);
				when s9 =>
					if (pixgain_index = PIXGAIN_SZ - 1) then
						state := ending;
						pixgain_index := 0;
					else
						state := s1;
						pixgain_index := pixgain_index + 1;
					end if;
				when ending => state := idle;
					o_rdy <= '1';
			end case;
		end if;
	end if;
end process p0;

end Behavioral;

