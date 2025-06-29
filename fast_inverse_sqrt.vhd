-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   12:44:57 08/29/2024
-- Design Name:   mlx90640_fpga
-- Module Name:   fast_inverse_sqrt
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s700e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Test for fast inverse square root on FPGA.
--                Question, test about if we can calulate 1/sqrt(x) on FPGA.
--                Based on some assembly code on:
--                  https://web.archive.org/web/20241208010954/https://onestepcode.com/benchmarking-fast-inverse-square-root/
--                  fastInvSqrt:
--                    movaps  %xmm0, %xmm1        # %xmm1 = x
--                    mulss   .LC0(%rip), %xmm1   # %xmm1 = 0.5f * x
--                    movd    %xmm0, %eax         # %eax = x (same bytes, but as integer)
--                    sarl    %eax                # %eax = i >> 1
--                    movl    $1597463007, %edx   # %edx = 0x5f3759df
--                    subl    %eax, %edx          # %edx = 0x5f3759df - (i >> 1)
--                    movd    %edx, %xmm0         # %xmm0 = %edx bytes as float
--                    mulss   %xmm0, %xmm1        # %xmm1 = xhalf * x
--                    mulss   %xmm0, %xmm1        # %xmm1 = xhalf * x * x
--                    movss   .LC1(%rip), %xmm2   # %xmm2 = 1.5f
--                    subss   %xmm1, %xmm2        # %xmm2 = 1.5f - (xhalf*x*x)
--                    mulss   %xmm2, %xmm0        # %xmm0 = x*(1.5f-(xhalf*x*x))
--                    ret                         # return %xmm0
--                .LC0:
--                    .long   1056964608          # 0x3f000000 (0.5f)
--                    .align 4
--                .LC1:
--                    .long   1069547520          # 0x3fc00000 (1.5f)
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files: -
--  - Modules:
--    Xilinx FP IP cores for MUL, SUB with enabled signals operation_nd
--    (new data), sclr (synchronous reset/clear), ce (chip/component enable).
--    Rest is default.
--
-- Revision:
--  - Revision 0.01 - File Created, FP Cores in Verilog
--    - Files: -
--    - Modules: -
--    - Processes (Architecture: rtl):
--      p0
--  - Revision 0.02 - 32bit FP Cores in VHDL, convert in 590ns (at 100MHz CLK)
--    - Files: -
--    - Modules: -
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
--  - Signal i_reset is synchronous
--  - After used in CalculateTo VHDL module (Temperature outputs calculations):
--    - differ in fraction < e-03
--    - temperatures up ~ +/- 0.[23]
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.global_package.all;

entity fast_inverse_sqrt is
port (
  signal i_clock         : in  std_logic;
  signal i_reset         : in  std_logic;
  signal i_run           : in  std_logic;
  signal i_sqrt_original : in  std_logic_vector (31 downto 0);
  signal o_sqrt_inverse  : out std_logic_vector (31 downto 0);
  signal o_done          : out std_logic;
  signal subfpa          : out std_logic_vector (31 downto 0);
  signal subfpb          : out std_logic_vector (31 downto 0);
  signal subfpond        : out std_logic;
  signal subfpce         : out std_logic;
  signal subfpsclr       : out std_logic;
  signal subfpr          : in  std_logic_vector (31 downto 0);
  signal subfprdy        : in  std_logic;
  signal mulfpa          : out std_logic_vector (31 downto 0);
  signal mulfpb          : out std_logic_vector (31 downto 0);
  signal mulfpond        : out std_logic;
  signal mulfpce         : out std_logic;
  signal mulfpsclr       : out std_logic;
  signal mulfpr          : in  std_logic_vector (31 downto 0);
  signal mulfprdy        : in  std_logic
);
end entity fast_inverse_sqrt;

architecture rtl of fast_inverse_sqrt is

  type states is (idle, s1, s2, s3, s4, s5, s6, s7, s8, ending);
  signal state : states := idle;

  constant c_0dot5f      : std_logic_vector (31 downto 0) := x"3f000000"; -- 1056964608
  constant c_1dot5f      : std_logic_vector (31 downto 0) := x"3fc00000"; -- 1069547520
  signal coefficient_1   : std_logic_vector (31 downto 0) := (others => '0');
  signal input_mul_0dot5 : std_logic_vector (31 downto 0) := (others => '0');
  signal result07        : std_logic_vector (31 downto 0) := (others => '0');
  signal result08        : std_logic_vector (31 downto 0) := (others => '0');
  signal result09        : std_logic_vector (31 downto 0) := (others => '0');
  constant const1        : integer                        := 1597431007;

  --synthesis translate_off
  signal real_output : real := 0.0;
  --synthesis translate_on

  begin

  -- Divide by 2 and minus - COEFF_1
  coefficient_1 <= std_logic_vector (
    to_unsigned (
      const1 - to_integer (unsigned ('0' & i_sqrt_original (31 downto 1))),
      32
    )
  );

  p0 : process (i_clock) is
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
              state <= s1;
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
          when s1 =>
            if (mulfprdy = '1') then
              state <= s2;
              mulfpce <= '0';
              mulfpond <= '0';
              mulfpsclr <= '1';
              input_mul_0dot5 <= mulfpr; -- input * 0.5
            else
              state <= s1;
            end if;
          when s2 =>
            state <= s3;
            mulfpsclr <= '0';
            mulfpce <= '1';
            mulfpond <= '1';
            mulfpa <= coefficient_1;
            mulfpb <= input_mul_0dot5;
            --synthesis translate_off
            real_output <= ap_slv2fp (input_mul_0dot5);
            --synthesis translate_on
          when s3 =>
            if (mulfprdy = '1') then
              state <= s4;
              mulfpce <= '0';
              mulfpond <= '0';
              mulfpsclr <= '1';
              result07 <= mulfpr; -- coefficient_1 * (input * 0.5)
            else
              state <= s3;
            end if;
          when s4 =>
            state <= s5;
            mulfpsclr <= '0';
            mulfpce <= '1';
            mulfpond <= '1';
            mulfpa <= result07;
            mulfpb <= coefficient_1;
            --synthesis translate_off
            real_output <= ap_slv2fp (result07);
            --synthesis translate_on
          when s5 =>
            if (mulfprdy = '1') then
              state <= s6;
              mulfpce <= '0';
              mulfpond <= '0';
              mulfpsclr <= '1';
              result08 <= mulfpr; -- coefficient_1 * coefficient_1 * (input * 0.5)
            else
              state <= s5;
            end if;
          when s6 =>
            state <= s7;
            mulfpsclr <= '0';
            subfpce <= '1';
            subfpond <= '1';
            subfpa <= c_1dot5f;
            subfpb <= result08;
            --synthesis translate_off
            real_output <= ap_slv2fp (result08);
            --synthesis translate_on
          when s7 =>
            if (subfprdy = '1') then
              state <= s8;
              subfpce <= '0';
              subfpond <= '0';
              subfpsclr <= '1';
              result09 <= subfpr; -- 1.5 - (coefficient_1 * coefficient_1 * (input * 0.5))
            else
              state <= s7;
            end if;
          when s8 =>
            state <= ending;
            subfpsclr <= '0';
            mulfpce <= '1';
            mulfpond <= '1';
            mulfpa <= result09;
            mulfpb <= coefficient_1;
            --synthesis translate_off
            real_output <= ap_slv2fp (result09);
            --synthesis translate_on
          when ending =>
            if (mulfprdy = '1') then
              state <= idle;
              mulfpce <= '0';
              mulfpond <= '0';
              mulfpsclr <= '1';
              o_sqrt_inverse <= mulfpr; -- coefficient_1 * (1.5 - (coefficient_1 * coefficient_1 * (input * 0.5)))
              o_done <= '1';
              --synthesis translate_off
              real_output <= ap_slv2fp (mulfpr);
              --synthesis translate_on
            else
              state <= ending;
            end if;
        end case;
      end if;
    end if;
  end process p0;

end architecture rtl;
