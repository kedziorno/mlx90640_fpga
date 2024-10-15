----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:28 06/14/2023 
-- Design Name: 
-- Module Name:    ExtractKvParameters_process_p0 - Behavioral 
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

entity ExtractKvParameters_process_p0 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;

i2c_mem_ena : out STD_LOGIC;
i2c_mem_addra : out STD_LOGIC_VECTOR(11 DOWNTO 0);
i2c_mem_douta : in STD_LOGIC_VECTOR(7 DOWNTO 0);

o_write_enable : out std_logic;
o_addra : out std_logic_vector (9 downto 0);
o_dia : out std_logic_vector (31 downto 0);

o_rdy : out std_logic;

nibble_out1,nibble_out2 : out std_logic_vector (3 downto 0);
nibble_in1,nibble_in2 : in std_logic_vector (31 downto 0);

o_row,o_col : out std_logic_vector (0 to 4);

kvijee_oo,kvijee_eo,kvijee_oe,kvijee_ee : out std_logic_vector (3 downto 0);
kvijee : in std_logic_vector (3 downto 0);

signal divfpa : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond : out STD_LOGIC;
signal divfpsclr : out STD_LOGIC;
signal divfpce : out STD_LOGIC;
signal divfpr : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy : in STD_LOGIC

);
end ExtractKvParameters_process_p0;

architecture Behavioral of ExtractKvParameters_process_p0 is

signal divfpa_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpb_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfpond_internal : STD_LOGIC;
signal divfpsclr_internal : STD_LOGIC;
signal divfpce_internal : STD_LOGIC;
signal divfpr_internal : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divfprdy_internal : STD_LOGIC;
 
constant C_COL : integer := 32;
constant C_ROW : integer := 24;
	
signal col : integer range 0 to C_COL-1;
signal row : integer range 0 to C_ROW-1;

begin

divfpa <= divfpa_internal;
divfpb <= divfpb_internal;
divfpond <= divfpond_internal;
divfpsclr <= divfpsclr_internal;
divfpce <= divfpce_internal;
divfpr_internal <= divfpr;
divfprdy_internal <= divfprdy;

p0 : process (i_clock) is
	type states is (idle,
	kv0,kv1,kv2,kv3,kv4,
	kv5,kv6,kv7,kv8,kv9,
	kv10,kv11,kv12,kv13,kv14,
	ending);
	variable state : states;
	variable vkvRemScale : std_logic_vector (31 downto 0);
	variable vkvColumnScale : std_logic_vector (31 downto 0);
	variable vkvRowScale : std_logic_vector (31 downto 0);
	variable vkvRemScale1 : std_logic_vector (3 downto 0);
	variable vkvColumnScale1 : std_logic_vector (3 downto 0);
	variable vkvRowScale1 : std_logic_vector (3 downto 0);
	variable valphaRef1: std_logic_vector (15 downto 0);
	variable valphaRef : std_logic_vector (15 downto 0);
	variable fptmp1,fptmp2 : std_logic_vector (31 downto 0);
	variable vkvcolumnj,kvrowi,vkvrowi,valphaReference_ft,vAlphaPixel_ft,kvijee_ft,kv_ft : std_logic_vector (31 downto 0);
	variable temp1,vAlphaPixel : std_logic_vector (15 downto 0);
  variable i : integer range 0 to (C_ROW*C_COL)-1;
begin
	if (rising_edge (i_clock)) then
		if (i_reset = '1') then
			state := idle;
			nibble_out1 <= (others => '0');
			nibble_out2 <= (others => '0');
			o_write_enable <= '0';
			o_rdy <= '0';
			divfpsclr_internal <= '1';
			divfpa_internal <= (others => '0');
			divfpb_internal <= (others => '0');
			divfpond_internal <= '0';
			divfpce_internal <= '0';
			o_addra <= (others => '0');
			o_dia <= (others => '0');
			i2c_mem_ena <= '0';
			i2c_mem_addra <= (others => '0');
			i := 0;
			o_col <= (others => '0');
			o_row <= (others => '0');
      col <= 0;
      row <= 0;
		else
			case (state) is
				when idle =>
					if (i_run = '1') then
						state := kv0;
						i2c_mem_ena <= '1';
						o_write_enable <= '1';
					else
						state := idle;
						i2c_mem_ena <= '0';
						o_write_enable <= '0';
					end if;

				when kv0 => state := kv1;
					divfpsclr_internal <= '0';
					o_rdy <= '0';
				when kv1 => state := kv2;
					i2c_mem_addra <= std_logic_vector (to_unsigned (112, 12)); -- 2438 MSB - kvscale 56*2+0
				when kv2 => state := kv3;
				when kv3 => state := kv4;
					nibble_out1 <= i2c_mem_douta (3 downto 0);

				when kv4 => state := kv5;
					i2c_mem_addra <= std_logic_vector (to_unsigned (104, 12)); -- 2434 LSB - kvijee 52*2+0
				when kv5 => state := kv6;
					i2c_mem_addra <= std_logic_vector (to_unsigned (105, 12)); -- 2434 MSB - kvijee 52*2+1
				when kv6 => state := kv7;
					kvijee_oo <= i2c_mem_douta (7 downto 4);
					kvijee_eo <= i2c_mem_douta (3 downto 0);
				when kv7 => state := kv8;
					kvijee_oe <= i2c_mem_douta (7 downto 4);
					kvijee_ee <= i2c_mem_douta (3 downto 0);
				when kv8 => state := kv9;
					nibble_out2 <= kvijee;

when kv9 => state := kv10;
	divfpce_internal <= '1';
	divfpa_internal <= nibble_in2; -- kvij 
	divfpb_internal <= nibble_in1; -- 2^kvscale
	divfpond_internal <= '1';
when kv10 => 			--6
	if (divfprdy_internal = '1') then state := kv11;
		kv_ft := divfpr_internal;
		divfpce_internal <= '0';
		divfpond_internal <= '0';
		divfpsclr_internal <= '1';
	else state := kv10; end if;
when kv11 => state := kv12; 	--7
	divfpsclr_internal <= '0';

when kv12 => state := kv13; 	--22
	o_write_enable <= '1';
	o_addra <= std_logic_vector (to_unsigned (i, 10)); -- kv
	o_dia <= kv_ft;
--synthesis translate_off
     report_error ("================kv_ft "&integer'image(i)&" ",kv_ft,0.0);
--synthesis translate_on
          when kv13 =>
	i := i + 1;
	o_write_enable <= '0';
	if (col = C_COL-1) then
		col <= 0;
		state := kv14;
	else
		col <= col + 1;
		state := kv1;
	end if;
  o_col <= std_logic_vector (to_unsigned (col, 5));
when kv14 =>
	o_write_enable <= '0';
	if (row = C_ROW-1) then
		row <= 0;
		state := ending;
	else
		row <= row + 1;
		state := kv1;
	end if;
  o_row <= std_logic_vector (to_unsigned (row, 5));
when ending => state := idle;
  o_rdy <= '1';
				when others => null;
			end case;
		end if;
	end if;
end process p0;

end Behavioral;

