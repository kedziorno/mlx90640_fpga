-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   10:34:14 01/24/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   extract_tgc_parameters
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   11.1.16. Restoring the TGC coefficient (p. 29)
--                11.1.16. NOTE1,NOTE2 - set to "0"
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    global_package.vhd
--  - Modules: -
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files: -
--    - Modules:
--      fixed2float, divfp, tb_i2c_mem
--    - Processes (Architecture: rtl):
--      p0
--
-- Important objects: -
--
-- Information from the software vendor:
--  - Messeges: -
--  - Bugs: -
--  - Notices: -
--  - Infos: -
--  - Notes: -
--  - Criticals/Failures: -
--
-- Concepts/Milestones: -
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.global_package.all;

entity extract_tgc_parameters is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

o_tgc : out std_logic_vector (31 downto 0);
o_rdy : out std_logic;

signal i2c_mem_ena : out STD_LOGIC;
signal i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
signal i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

signal fixed2floata : out STD_LOGIC_VECTOR(15 DOWNTO 0);
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
end entity extract_tgc_parameters;

architecture rtl of extract_tgc_parameters is

signal fixed2floata_internal : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal fixed2floatond_internal : STD_LOGIC;
signal fixed2floatsclr_internal : STD_LOGIC;
signal fixed2floatce_internal : STD_LOGIC;
signal fixed2floatr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal fixed2floatrdy_internal : STD_LOGIC;

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;

begin

fixed2floata <= fixed2floata_internal;
fixed2floatond <= fixed2floatond_internal;
fixed2floatsclr <= fixed2floatsclr_internal;
fixed2floatce <= fixed2floatce_internal;
fixed2floatr_internal <= fixed2floatr;
fixed2floatrdy_internal <= fixed2floatrdy;

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

p0 : process (i_clock) is
	type states is (idle,
	s1,s2,s3);
	variable state : states;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
      fixed2floatsclr_internal <= '1';
      divfpsclr_internal <= '1';
      fixed2floata_internal <= (others => '0');
      fixed2floatce_internal <= '0';
      fixed2floatond_internal <= '0';
      divfpa_internal <= (others => '0');
      divfpb_internal <= (others => '0');
      divfpce_internal <= '0';
      divfpond_internal <= '0';
      o_rdy <= '0';
      o_tgc <= (others => '0');
      i2c_mem_ena <= '0';
      i2c_mem_addra <= (others => '0');
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := s1;
						i2c_mem_ena <= '1';
            i2c_mem_addra <= std_logic_vector (to_unsigned (60*2+1, 12)); -- ee243c LSB - tgcee
            report "ExtractTGCParameters set to 0 - 11.1.16 Datasheet, 1 in example p. 34";
            o_rdy <= '0';
					else
						state := idle;
						i2c_mem_ena <= '0';
					end if;
          fixed2floatsclr_internal <= '0';
          divfpsclr_internal <= '0';
        when s1 => state := s2;
          i2c_mem_ena <= '0';
				when s2 =>
          fixed2floatce_internal <= '1';
          fixed2floatond_internal <= '1';
          fixed2floata_internal <=
          i2c_mem_douta (7) & i2c_mem_douta (7) & 
          i2c_mem_douta (7) & i2c_mem_douta (7) & 
          i2c_mem_douta (7) & i2c_mem_douta (7) & 
          i2c_mem_douta (7) & i2c_mem_douta (7) & 
          i2c_mem_douta (7 downto 0);
          if (fixed2floatrdy_internal = '1') then state := s3;
            fixed2floatce_internal <= '0';
            fixed2floatond_internal <= '0';
            fixed2floatsclr_internal <= '1';
            --synthesis translate_off
            report_error("================ TGC fi2fl", fixed2floatr_internal, 0.0);
            --synthesis translate_on
          else state := s2; end if;
        when s3 =>
          fixed2floatsclr_internal <= '0';
          divfpce_internal <= '1';
          divfpa_internal <= fixed2floatr_internal;
          divfpb_internal <= C_2POW5;
          divfpond_internal <= '1';
          if (divfprdy_internal = '1') then state := idle;
            o_tgc <= divfpr_internal;
            --o_tgc <= x"3f800000"; -- 1
            o_rdy <= '1';
            --synthesis translate_off
            report_error("================ TGC o_tgc", divfpr_internal, 0.0);
            --synthesis translate_on
            divfpce_internal <= '0';
            divfpond_internal <= '0';
            divfpsclr_internal <= '1';
          else state := s3; end if;
			end case;
		end if;
	end if;
end process p0;

end architecture rtl;

