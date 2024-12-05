-------------------------------------------------------------------------------
-- Company        : HomeDL
-- Engineer       : ko
--
-- Create Date    : 12:44:57 08/29/2024
-- Design Name    : Test for fast inverse square root on FPGA
-- Module Name    : fast_inverse_sqrt - Behavioral
-- Project Name   : fast_inverse_
-- Target Devices : xc3s1200-fg320-4
-- Tool versions  : Xilinx ISE 14.7
-- Description    : Question, test about if we can calulate 1/sqrt(x) on FPGA
--                  Based on some assembly code on:
--               https://onestepcode.com/benchmarking-fast-inverse-square-root/
--
-- Dependencies   : IP cores for MUL, SUB, FIXED TO FLOAT, FLOAT TO FIXED with
--                  enabled signals operation_nd (new data), sclr (synchronous
--                  reset/clear), ce (chip/component enable). Rest is default.
--
-- Revision:
-- Revision 0.01 - File Created, FP Cores in Verilog
-- Revision 0.02 - 32bit FP Cores in VHDL, convert in 590ns (100MHz)
-- Additional Comments: -
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--synthesis translate_off
USE IEEE.MATH_REAL.ALL;
--synthesis translate_on

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fast_inverse_sqrt is
port (
signal i_clock         : in  std_logic;
signal i_reset         : in  std_logic;
signal i_run           : in  std_logic;
signal i_sqrt_original : in  std_logic_vector (31 downto 0);
signal o_sqrt_inverse  : out std_logic_vector (31 downto 0);
signal o_done          : out std_logic;
signal subfpa          : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpb          : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfpond        : out STD_LOGIC;
signal subfpce         : out STD_LOGIC;
signal subfpsclr       : out STD_LOGIC;
signal subfpr          : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal subfprdy        : in STD_LOGIC;
signal mulfpa          : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpb          : out STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfpond        : out STD_LOGIC;
signal mulfpce         : out STD_LOGIC;
signal mulfpsclr       : out STD_LOGIC;
signal mulfpr          : in STD_LOGIC_VECTOR(31 DOWNTO 0);
signal mulfprdy        : in STD_LOGIC
);
end entity fast_inverse_sqrt;

architecture Behavioral of fast_inverse_sqrt is

type states is (idle,
s2,s3,s6,s7,s9,s10,
s12,s13,s15);
signal state : states := idle;

constant c_0dot5f : std_logic_vector (31 downto 0) := x"3f000000"; -- 1056964608
constant c_1dot5f : std_logic_vector (31 downto 0) := x"3fc00000"; -- 1069547520
signal result01 : std_logic_vector (31 downto 0) := (others => '0');
signal result02 : std_logic_vector (31 downto 0) := (others => '0');
signal result07 : std_logic_vector (31 downto 0) := (others => '0');
signal result08 : std_logic_vector (31 downto 0) := (others => '0');
signal result09 : std_logic_vector (31 downto 0) := (others => '0');
constant const1 : integer := 1597431007;

--synthesis translate_off
signal real_output : real := 0.0;
--synthesis translate_on

begin

result01 <= std_logic_vector(to_unsigned(const1 - to_integer(unsigned("0" & i_sqrt_original (31 downto 1))), 32));

p0 : process (i_clock) is

--synthesis translate_off
	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2Fraytrac%2Fbranches%2Ffp%2Farithpack.vhd&rev=131
	function ap_slv2int (sl:std_logic_vector) return integer is
		alias s : std_logic_vector (sl'high downto sl'low) is sl;
		variable i : integer := 0;
	begin
		i:=0;
		for index in s'high downto s'low loop
			if s(index)='1' then
				i:=i*2+1;
			else
				i:=i*2;
			end if;
		end loop;
		return i;
	end function;

	-- https://opencores.org/websvn/filedetails?repname=raytrac&path=%2Fraytrac%2Fbranches%2Ffp%2Farithpack.vhd&rev=131
  function ap_slv2fp(sl:std_logic_vector) return real is
	 variable frc:integer;
	 alias s: std_logic_vector(31 downto 0) is sl;
	 variable f,expo: real;
  begin
	 expo:=real(ap_slv2int(s(30 downto 23)) - 127);
	 expo:=2.0**expo;
	 frc:=ap_slv2int('1'&s(22 downto 0));
	 f:=real(frc)*(2.0**real(-23.0));
	 f:=f*real(expo);
	 if s(31)='1' then
		return -f;
	 else
		return f;
	 end if;
	return 0.0;
  end function;
--synthesis translate_on

begin

  if (rising_edge (i_clock)) then
    if (i_reset = '1') then
      mulfpsclr <= '1';
      subfpsclr <= '1';
      mulfpa <= (others => '0');
      mulfpb <= (others => '0');
      subfpa <= (others => '0');
      subfpb <= (others => '0');
      mulfpond <= '0';
      subfpond <= '0';
      mulfpce <= '0';
      subfpce <= '0';
      o_done <= '0';
      o_sqrt_inverse <= (others => '0');
      state <= idle;
    else
      case (state) is
        when idle =>
          mulfpsclr <= '0';
          subfpsclr <= '0';
          o_done <= '0';
          if (i_run = '1') then
            state <= s2;
            mulfpce <= '1';
            mulfpond <= '1';
            mulfpa <= c_0dot5f;
            mulfpb <= i_sqrt_original;
            --synthesis translate_off
            real_output <= ap_slv2fp (i_sqrt_original);
            --synthesis translate_on
          else
            state <= idle;
          end if;
				when s2 =>
          if (mulfprdy = '1') then
            state <= s3;
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
            result02 <= mulfpr;
          else
            state <= s2;
          end if;
        when s3 =>
          state <= s6;
          mulfpsclr <= '0';
          --synthesis translate_off
          real_output <= ap_slv2fp (result02);
          --synthesis translate_on
					mulfpce <= '1';
					mulfpond <= '1';
					mulfpa <= result01;
					mulfpb <= result02;
				when s6 =>
          if (mulfprdy = '1') then
            state <= s7;
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
            result07 <= mulfpr;
          else
            state <= s6;
          end if;
        when s7 =>
          state <= s9;
          mulfpsclr <= '0';
          --synthesis translate_off
          real_output <= ap_slv2fp (result07);
          --synthesis translate_on
					mulfpce <= '1';
					mulfpond <= '1';
					mulfpa <= result07;
					mulfpb <= result01;
				when s9 =>
          if (mulfprdy = '1') then
            state <= s10;
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
            result08 <= mulfpr;
          else
            state <= s9;
          end if;
        when s10 =>
          state <= s12;
          mulfpsclr <= '0';
          --synthesis translate_off
          real_output <= ap_slv2fp (result08);
          --synthesis translate_on
					subfpce <= '1';
					subfpond <= '1';
					subfpa <= c_1dot5f;
					subfpb <= result08;
				when s12 =>
          if (subfprdy = '1') then
            state <= s13;
            subfpce <= '0';
            subfpond <= '0';
            subfpsclr <= '1';
            result09 <= subfpr;
          else
            state <= s12;
          end if;
        when s13 =>
          state <= s15;
          subfpsclr <= '0';
          --synthesis translate_off
          real_output <= ap_slv2fp (result09);
          --synthesis translate_on
					mulfpce <= '1';
					mulfpond <= '1';
					mulfpa <= result09;
					mulfpb <= result01;
				when s15 =>
          if (mulfprdy = '1') then
            state <= idle;
            mulfpce <= '0';
            mulfpond <= '0';
            mulfpsclr <= '1';
            --synthesis translate_off
            real_output <= ap_slv2fp (mulfpr);
            --synthesis translate_on
            o_sqrt_inverse <= mulfpr;
            o_done <= '1';
          else
            state <= s15;
          end if;
      end case;
    end if;
  end if;
end process p0;

end architecture Behavioral;
