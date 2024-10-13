----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:25:31 02/09/2023 
-- Design Name: 
-- Module Name:    CalculateAlphaCP - Behavioral 
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

--use work.p_fphdl_package1.all;
use work.p_fphdl_package3.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CalculateAlphaCP is
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
end CalculateAlphaCP;

architecture Behavioral of CalculateAlphaCP is

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;

signal mulfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond_internal : STD_LOGIC;
signal mulfpsclr_internal : STD_LOGIC;
signal mulfpce_internal : STD_LOGIC;
signal mulfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy_internal : STD_LOGIC;

signal fixed2floata_internal : STD_LOGIC_VECTOR(63 DOWNTO 0);
signal fixed2floatond_internal : STD_LOGIC;
signal fixed2floatce_internal : STD_LOGIC;
signal fixed2floatsclr_internal : STD_LOGIC;
signal fixed2floatr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy_internal : STD_LOGIC;

begin

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

mulfpa <= mulfpa_internal;
mulfpb <= mulfpb_internal;
mulfpond <= mulfpond_internal;
mulfpsclr <= mulfpsclr_internal;
mulfpce <= mulfpce_internal;
mulfpr_internal <= mulfpr;
mulfprdy_internal <= mulfprdy;

fixed2floata <= fixed2floata_internal;
fixed2floatond <= fixed2floatond_internal;
fixed2floatsclr <= fixed2floatsclr_internal;
fixed2floatce <= fixed2floatce_internal;
fixed2floatr_internal <= fixed2floatr;
fixed2floatrdy_internal <= fixed2floatrdy;

p0 : process (i_clock,i_reset) is
	type states is (idle,
	s2,s3,s4,s5,s6,s9,s11);
	variable state : states;
  variable acpsp0 : std_logic_vector (1 downto 0); -- Acpsubpage0 10bit
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			mulfpsclr_internal <= '1';
			divfpsclr_internal <= '1';
			fixed2floatsclr_internal <= '1';
			o_acpsubpage0 <= (others => '0');
			o_acpsubpage1 <= (others => '0');
			o_rdy <= '0';
			divfpa_internal <= (others => '0');
			divfpb_internal <= (others => '0');
			divfpce_internal <= '0';
			divfpond_internal <= '0';
			mulfpa_internal <= (others => '0');
			mulfpb_internal <= (others => '0');
			mulfpce_internal <= '0';
			mulfpond_internal <= '0';
			i2c_mem_ena <= '0';
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s2;
						i2c_mem_ena <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
					end if;
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
					fixed2floatsclr_internal <= '0';
				when s2 => state := s3;
					i2c_mem_addra <= std_logic_vector (to_unsigned (57*2+0, 12)); -- 2439 MSB Acpsubpage0 10bit/CP_P12P0_ratio 6bit
				when s3 => state := s4;
					i2c_mem_addra <= std_logic_vector (to_unsigned (57*2+1, 12)); -- 2439 LSB Acpsubpage0 10bit/CP_P12P0_ratio 6bit
				when s4 => state := s5;
          acpsp0 := i2c_mem_douta (1 downto 0); -- Acpsubpage0 MSB 10-8bit
				when s5 =>
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <=
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 (1) & 
          acpsp0 (1) & acpsp0 & i2c_mem_douta (7 downto 0) & "00000000000000000000000000000";
          if (fixed2floatrdy_internal = '1') then state := s6; -- Acpsubpage0 MSB 10-8 & LSB 7-0
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
            --synthesis translate_off
            report_error("================ CalulateAlphaCP acpsp0", fixed2floatr_internal, 0.0);
            --synthesis translate_on      
            i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+0, 12)); -- 2420 MSB Ascalecp 4bit
          else state := s5; end if;
        when s6 => state := s9;
          fixed2floatsclr_internal <= '0';
					o_alphascale_2_ena <= '1';
					o_alphascale_2_adr <= i2c_mem_douta (7 downto 4); -- 2420 MSB Ascalecp 4bit
          i2c_mem_addra <= std_logic_vector (to_unsigned (57*2+0, 12)); -- 2439 MSB Acpsubpage0 10bit/CP_P12P0_ratio 6bit
        when s9 =>
					divfpce_internal <= '1';
					divfpa_internal <= fixed2floatr_internal; -- Acpsubpage0
					divfpb_internal <= i_rom_constants_float; -- 2^(Ascalecp+27)
					divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := s11;
            o_alphascale_2_ena <= '0';
            o_cpratio_ena <= '1';
            o_cpratio_adr <= i2c_mem_douta (7 downto 2); -- CP_P12P0_ratio 6bit
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
						o_acpsubpage0 <= divfpr_internal;
            --synthesis translate_off
						report_error("================ calculateAlphaCP o_acpsubpage0", divfpr_internal, 0.0);
            --synthesis translate_on
					else state := s9; end if;
				when s11 =>
					divfpsclr_internal <= '0'; -- xxx to s9
					mulfpce_internal <= '1';
					mulfpa_internal <= divfpr_internal; -- Acpsubpage0/(2^(Ascalecp+27))
					mulfpb_internal <= i_rom_constants_float; -- (1 + (CP_P12P0_ratio/2^7))
          mulfpond_internal <= '1';
          if (mulfprdy_internal = '1') then state := idle;
            o_cpratio_ena <= '0';
            mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
						o_acpsubpage1 <= mulfpr_internal;
            --synthesis translate_off
						report_error("================ calculateAlphaCP o_acpsubpage1", mulfpr_internal, 0.0);
            --synthesis translate_on
            o_rdy <= '1';
					else state := s11; end if;
			end case;
		end if;
	end if;
end process p0;

end architecture Behavioral;
