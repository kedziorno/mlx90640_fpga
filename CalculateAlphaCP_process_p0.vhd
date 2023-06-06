----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:10 06/12/2023 
-- Design Name: 
-- Module Name:    CalculateAlphaCP_process_p0 - Behavioral 
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

entity CalculateAlphaCP_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_mem_address : out std_logic_vector (9 downto 0);
i_mem_data : in std_logic_vector (31 downto 0);

nibble_out1 : out std_logic_vector (5 downto 0);
nibble_out2 : out std_logic_vector (3 downto 0);

nibble_in1 : in std_logic_vector (31 downto 0);
nibble_in2 : in std_logic_vector (31 downto 0);

o_acpsubpage0 : out STD_LOGIC_VECTOR(31 DOWNTO 0);
o_acpsubpage1 : out STD_LOGIC_VECTOR(31 DOWNTO 0);
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
end CalculateAlphaCP_process_p0;

architecture Behavioral of CalculateAlphaCP_process_p0 is

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

p0 : process (i_clock,i_reset) is
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	type states is (idle,
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,
	ending);
	variable state : states;
	variable ee0x2439 : std_logic_vector (15 downto 0);
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			mulfpsclr_internal <= '1';
			divfpsclr_internal <= '1';
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
			o_mem_address <= (others => '0');
			nibble_out1 <= (others => '0');
			nibble_out2 <= (others => '0');
			i2c_mem_ena <= '0';
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
					mulfpsclr_internal <= '0';
					divfpsclr_internal <= '0';
				when s1 => state := s2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (32*2+0, 12)); -- 2420 MSB Ascalecp 4bit
				when s2 => state := s3;
					i2c_mem_addra <= std_logic_vector (to_unsigned (57*2+0, 12)); -- 2439 MSB Acpsubpage0 10bit/CP_P12P0_ratio 6bit
				when s3 => state := s4;
					nibble_out2 <= i2c_mem_douta (7 downto 4); -- Ascalecp 4bit
					i2c_mem_addra <= std_logic_vector (to_unsigned (57*2+1, 12)); -- 2439 LSB Acpsubpage0 10bit/CP_P12P0_ratio 6bit
				when s4 => state := s5;
					ee0x2439 (15 downto 8) := i2c_mem_douta;
				when s5 => state := s6;
					ee0x2439 (7 downto 0) := i2c_mem_douta;
				when s6 => state := s7;
					nibble_out1 <= ee0x2439 (15 downto 10); -- CP_P12P0_ratio 6bit
					o_mem_address <= ee0x2439 (9 downto 0); -- Acpsubpage0 10bit
				when s7 => state := s8;
				when s8 => state := s9;
					divfpce_internal <= '1';
					divfpa_internal <= i_mem_data; -- Acpsubpage0
					divfpb_internal <= nibble_in2; -- 2^(Ascalecp+27)
					divfpond_internal <= '1';
				when s9 =>
					if (divfprdy_internal = '1') then state := s10;
						fptmp1 := divfpr_internal;
						divfpce_internal <= '0';
						divfpond_internal <= '0';
						divfpsclr_internal <= '1';
						o_acpsubpage0 <= fptmp1;
            report_error ("================ calculateAlphaCP o_acpsubpage0 : ",fptmp1,0.0);
					else state := s9; end if;
				when s10 => state := s11;
					divfpsclr_internal <= '0';
					mulfpce_internal <= '1';
					mulfpa_internal <= fptmp1; -- Acpsubpage0/(2^(Ascalecp+27))
					mulfpb_internal <= nibble_in1; -- (1 + (CP_P12P0_ratio/2^7))
					mulfpond_internal <= '1';
				when s11 =>
					if (mulfprdy_internal = '1') then state := ending;
						fptmp1 := mulfpr_internal;
						mulfpce_internal <= '0';
						mulfpond_internal <= '0';
						mulfpsclr_internal <= '1';
						o_acpsubpage1 <= fptmp1;
            report_error ("================ calculateAlphaCP o_acpsubpage1 : ",fptmp1,0.0);
					else state := s11; end if;
				when ending => state := idle;
					mulfpsclr_internal <= '0';
					o_rdy <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

end Behavioral;

