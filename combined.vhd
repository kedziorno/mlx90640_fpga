--------------------------------------------------------------------------------
--                RightShifterSticky24_by_max_26_Freq200_uid4
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2008-2011), Florent de Dinechin (2008-2019)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X S
-- Output signals: R Sticky

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifterSticky24_by_max_26_Freq200_uid4 is
    port (clk, ce_1 : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          S : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(25 downto 0);
          Sticky : out  std_logic   );
end entity;

architecture arch of RightShifterSticky24_by_max_26_Freq200_uid4 is
signal ps_c0, ps_c1 :  std_logic_vector(4 downto 0);
signal Xpadded_c0 :  std_logic_vector(25 downto 0);
signal level5_c0 :  std_logic_vector(25 downto 0);
signal stk4_c0, stk4_c1 :  std_logic;
signal level4_c0, level4_c1 :  std_logic_vector(25 downto 0);
signal stk3_c1 :  std_logic;
signal level3_c0, level3_c1 :  std_logic_vector(25 downto 0);
signal stk2_c1 :  std_logic;
signal level2_c0, level2_c1 :  std_logic_vector(25 downto 0);
signal stk1_c1 :  std_logic;
signal level1_c0, level1_c1 :  std_logic_vector(25 downto 0);
signal stk0_c1 :  std_logic;
signal level0_c0 :  std_logic_vector(25 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               ps_c1 <= ps_c0;
               stk4_c1 <= stk4_c0;
               level4_c1 <= level4_c0;
               level3_c1 <= level3_c0;
               level2_c1 <= level2_c0;
               level1_c1 <= level1_c0;
            end if;
         end if;
      end process;
   ps_c0<= S;
   Xpadded_c0 <= X&(1 downto 0 => '0');
   level5_c0<= Xpadded_c0;
   stk4_c0 <= '1' when (level5_c0(15 downto 0)/="0000000000000000" and ps_c0(4)='1')   else '0';
   level4_c0 <=  level5_c0 when  ps_c0(4)='0'    else (15 downto 0 => '0') & level5_c0(25 downto 16);
   stk3_c1 <= '1' when (level4_c1(7 downto 0)/="00000000" and ps_c1(3)='1') or stk4_c1 ='1'   else '0';
   level3_c0 <=  level4_c0 when  ps_c0(3)='0'    else (7 downto 0 => '0') & level4_c0(25 downto 8);
   stk2_c1 <= '1' when (level3_c1(3 downto 0)/="0000" and ps_c1(2)='1') or stk3_c1 ='1'   else '0';
   level2_c0 <=  level3_c0 when  ps_c0(2)='0'    else (3 downto 0 => '0') & level3_c0(25 downto 4);
   stk1_c1 <= '1' when (level2_c1(1 downto 0)/="00" and ps_c1(1)='1') or stk2_c1 ='1'   else '0';
   level1_c0 <=  level2_c0 when  ps_c0(1)='0'    else (1 downto 0 => '0') & level2_c0(25 downto 2);
   stk0_c1 <= '1' when (level1_c1(0 downto 0)/="0" and ps_c1(0)='1') or stk1_c1 ='1'   else '0';
   level0_c0 <=  level1_c0 when  ps_c0(0)='0'    else (0 downto 0 => '0') & level1_c0(25 downto 1);
   R <= level0_c0;
   Sticky <= stk0_c1;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_27_Freq200_uid6
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_27_Freq200_uid6 is
    port (clk, ce_1, ce_2 : in std_logic;
          X : in  std_logic_vector(26 downto 0);
          Y : in  std_logic_vector(26 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(26 downto 0)   );
end entity;

architecture arch of IntAdder_27_Freq200_uid6 is
signal Cin_1_c1, Cin_1_c2 :  std_logic;
signal X_1_c0, X_1_c1, X_1_c2 :  std_logic_vector(27 downto 0);
signal Y_1_c0, Y_1_c1, Y_1_c2 :  std_logic_vector(27 downto 0);
signal S_1_c2 :  std_logic_vector(27 downto 0);
signal R_1_c2 :  std_logic_vector(26 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               X_1_c1 <= X_1_c0;
               Y_1_c1 <= Y_1_c0;
            end if;
            if ce_2 = '1' then
               Cin_1_c2 <= Cin_1_c1;
               X_1_c2 <= X_1_c1;
               Y_1_c2 <= Y_1_c1;
            end if;
         end if;
      end process;
   Cin_1_c1 <= Cin;
   X_1_c0 <= '0' & X(26 downto 0);
   Y_1_c0 <= '0' & Y(26 downto 0);
   S_1_c2 <= X_1_c2 + Y_1_c2 + Cin_1_c2;
   R_1_c2 <= S_1_c2(26 downto 0);
   R <= R_1_c2 ;
end architecture;

--------------------------------------------------------------------------------
--                     Normalizer_Z_28_28_28_Freq200_uid8
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, (2007-2020)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Count R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Normalizer_Z_28_28_28_Freq200_uid8 is
    port (clk, ce_3 : in std_logic;
          X : in  std_logic_vector(27 downto 0);
          Count : out  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(27 downto 0)   );
end entity;

architecture arch of Normalizer_Z_28_28_28_Freq200_uid8 is
signal level5_c2 :  std_logic_vector(27 downto 0);
signal count4_c2, count4_c3 :  std_logic;
signal level4_c2 :  std_logic_vector(27 downto 0);
signal count3_c2, count3_c3 :  std_logic;
signal level3_c2 :  std_logic_vector(27 downto 0);
signal count2_c2, count2_c3 :  std_logic;
signal level2_c2, level2_c3 :  std_logic_vector(27 downto 0);
signal count1_c2, count1_c3 :  std_logic;
signal level1_c3 :  std_logic_vector(27 downto 0);
signal count0_c3 :  std_logic;
signal level0_c3 :  std_logic_vector(27 downto 0);
signal sCount_c3 :  std_logic_vector(4 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_3 = '1' then
               count4_c3 <= count4_c2;
               count3_c3 <= count3_c2;
               count2_c3 <= count2_c2;
               level2_c3 <= level2_c2;
               count1_c3 <= count1_c2;
            end if;
         end if;
      end process;
   level5_c2 <= X ;
   count4_c2<= '1' when level5_c2(27 downto 12) = (27 downto 12=>'0') else '0';
   level4_c2<= level5_c2(27 downto 0) when count4_c2='0' else level5_c2(11 downto 0) & (15 downto 0 => '0');

   count3_c2<= '1' when level4_c2(27 downto 20) = (27 downto 20=>'0') else '0';
   level3_c2<= level4_c2(27 downto 0) when count3_c2='0' else level4_c2(19 downto 0) & (7 downto 0 => '0');

   count2_c2<= '1' when level3_c2(27 downto 24) = (27 downto 24=>'0') else '0';
   level2_c2<= level3_c2(27 downto 0) when count2_c2='0' else level3_c2(23 downto 0) & (3 downto 0 => '0');

   count1_c2<= '1' when level2_c2(27 downto 26) = (27 downto 26=>'0') else '0';
   level1_c3<= level2_c3(27 downto 0) when count1_c3='0' else level2_c3(25 downto 0) & (1 downto 0 => '0');

   count0_c3<= '1' when level1_c3(27 downto 27) = (27 downto 27=>'0') else '0';
   level0_c3<= level1_c3(27 downto 0) when count0_c3='0' else level1_c3(26 downto 0) & (0 downto 0 => '0');

   R <= level0_c3;
   sCount_c3 <= count4_c3 & count3_c3 & count2_c3 & count1_c3 & count0_c3;
   Count <= sCount_c3;
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_34_Freq200_uid11
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_34_Freq200_uid11 is
    port (clk, ce_1, ce_2, ce_3 : in std_logic;
          X : in  std_logic_vector(33 downto 0);
          Y : in  std_logic_vector(33 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(33 downto 0)   );
end entity;

architecture arch of IntAdder_34_Freq200_uid11 is
signal Rtmp_c3 :  std_logic_vector(33 downto 0);
signal Y_c1, Y_c2, Y_c3 :  std_logic_vector(33 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               Y_c1 <= Y;
            end if;
            if ce_2 = '1' then
               Y_c2 <= Y_c1;
            end if;
            if ce_3 = '1' then
               Y_c3 <= Y_c2;
            end if;
         end if;
      end process;
   Rtmp_c3 <= X + Y_c3 + Cin;
   R <= Rtmp_c3;
end architecture;

--------------------------------------------------------------------------------
--                             FloatingPointAdder
--                         (FPAdd_8_23_Freq200_uid2)
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2010-2017)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FloatingPointAdder is
    port (clk, ce_1, ce_2, ce_3 : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          Y : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FloatingPointAdder is
   component RightShifterSticky24_by_max_26_Freq200_uid4 is
      port ( clk, ce_1 : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             S : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(25 downto 0);
             Sticky : out  std_logic   );
   end component;

   component IntAdder_27_Freq200_uid6 is
      port ( clk, ce_1, ce_2 : in std_logic;
             X : in  std_logic_vector(26 downto 0);
             Y : in  std_logic_vector(26 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(26 downto 0)   );
   end component;

   component Normalizer_Z_28_28_28_Freq200_uid8 is
      port ( clk, ce_3 : in std_logic;
             X : in  std_logic_vector(27 downto 0);
             Count : out  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(27 downto 0)   );
   end component;

   component IntAdder_34_Freq200_uid11 is
      port ( clk, ce_1, ce_2, ce_3 : in std_logic;
             X : in  std_logic_vector(33 downto 0);
             Y : in  std_logic_vector(33 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(33 downto 0)   );
   end component;

signal excExpFracX_c0 :  std_logic_vector(32 downto 0);
signal excExpFracY_c0 :  std_logic_vector(32 downto 0);
signal swap_c0 :  std_logic;
signal eXmeY_c0 :  std_logic_vector(7 downto 0);
signal eYmeX_c0 :  std_logic_vector(7 downto 0);
signal expDiff_c0 :  std_logic_vector(7 downto 0);
signal newX_c0 :  std_logic_vector(33 downto 0);
signal newY_c0 :  std_logic_vector(33 downto 0);
signal expX_c0 :  std_logic_vector(7 downto 0);
signal excX_c0 :  std_logic_vector(1 downto 0);
signal excY_c0 :  std_logic_vector(1 downto 0);
signal signX_c0 :  std_logic;
signal signY_c0 :  std_logic;
signal EffSub_c0, EffSub_c1, EffSub_c2, EffSub_c3 :  std_logic;
signal sXsYExnXY_c0 :  std_logic_vector(5 downto 0);
signal sdExnXY_c0 :  std_logic_vector(3 downto 0);
signal fracY_c0 :  std_logic_vector(23 downto 0);
signal excRt_c0, excRt_c1, excRt_c2, excRt_c3 :  std_logic_vector(1 downto 0);
signal signR_c0, signR_c1, signR_c2, signR_c3 :  std_logic;
signal shiftedOut_c0 :  std_logic;
signal shiftVal_c0 :  std_logic_vector(4 downto 0);
signal shiftedFracY_c0 :  std_logic_vector(25 downto 0);
signal sticky_c1, sticky_c2 :  std_logic;
signal fracYpad_c0 :  std_logic_vector(26 downto 0);
signal EffSubVector_c0 :  std_logic_vector(26 downto 0);
signal fracYpadXorOp_c0 :  std_logic_vector(26 downto 0);
signal fracXpad_c0 :  std_logic_vector(26 downto 0);
signal cInSigAdd_c1 :  std_logic;
signal fracAddResult_c2 :  std_logic_vector(26 downto 0);
signal fracSticky_c2 :  std_logic_vector(27 downto 0);
signal nZerosNew_c3 :  std_logic_vector(4 downto 0);
signal shiftedFrac_c3 :  std_logic_vector(27 downto 0);
signal extendedExpInc_c0, extendedExpInc_c1, extendedExpInc_c2, extendedExpInc_c3 :  std_logic_vector(8 downto 0);
signal updatedExp_c3 :  std_logic_vector(9 downto 0);
signal eqdiffsign_c3 :  std_logic;
signal expFrac_c3 :  std_logic_vector(33 downto 0);
signal stk_c3 :  std_logic;
signal rnd_c3 :  std_logic;
signal lsb_c3 :  std_logic;
signal needToRound_c3 :  std_logic;
signal RoundedExpFrac_c3 :  std_logic_vector(33 downto 0);
signal upExc_c3 :  std_logic_vector(1 downto 0);
signal fracR_c3 :  std_logic_vector(22 downto 0);
signal expR_c3 :  std_logic_vector(7 downto 0);
signal exExpExc_c3 :  std_logic_vector(3 downto 0);
signal excRt2_c3 :  std_logic_vector(1 downto 0);
signal excR_c3 :  std_logic_vector(1 downto 0);
signal signR2_c3 :  std_logic;
signal computedR_c3 :  std_logic_vector(33 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               EffSub_c1 <= EffSub_c0;
               excRt_c1 <= excRt_c0;
               signR_c1 <= signR_c0;
               extendedExpInc_c1 <= extendedExpInc_c0;
            end if;
            if ce_2 = '1' then
               EffSub_c2 <= EffSub_c1;
               excRt_c2 <= excRt_c1;
               signR_c2 <= signR_c1;
               sticky_c2 <= sticky_c1;
               extendedExpInc_c2 <= extendedExpInc_c1;
            end if;
            if ce_3 = '1' then
               EffSub_c3 <= EffSub_c2;
               excRt_c3 <= excRt_c2;
               signR_c3 <= signR_c2;
               extendedExpInc_c3 <= extendedExpInc_c2;
            end if;
         end if;
      end process;
   excExpFracX_c0 <= X(33 downto 32) & X(30 downto 0);
   excExpFracY_c0 <= Y(33 downto 32) & Y(30 downto 0);
   swap_c0 <= '1' when excExpFracX_c0 < excExpFracY_c0 else '0';
   -- exponent difference
   eXmeY_c0 <= (X(30 downto 23)) - (Y(30 downto 23));
   eYmeX_c0 <= (Y(30 downto 23)) - (X(30 downto 23));
   expDiff_c0 <= eXmeY_c0 when swap_c0 = '0' else eYmeX_c0;
   -- input swap so that |X|>|Y|
   newX_c0 <= X when swap_c0 = '0' else Y;
   newY_c0 <= Y when swap_c0 = '0' else X;
   -- now we decompose the inputs into their sign, exponent, fraction
   expX_c0<= newX_c0(30 downto 23);
   excX_c0<= newX_c0(33 downto 32);
   excY_c0<= newY_c0(33 downto 32);
   signX_c0<= newX_c0(31);
   signY_c0<= newY_c0(31);
   EffSub_c0 <= signX_c0 xor signY_c0;
   sXsYExnXY_c0 <= signX_c0 & signY_c0 & excX_c0 & excY_c0;
   sdExnXY_c0 <= excX_c0 & excY_c0;
   fracY_c0 <= "000000000000000000000000" when excY_c0="00" else ('1' & newY_c0(22 downto 0));
   -- Exception management logic
   with sXsYExnXY_c0  select  
   excRt_c0 <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   signR_c0<= '0' when (sXsYExnXY_c0="100000" or sXsYExnXY_c0="010000") else signX_c0;
   shiftedOut_c0 <= '1' when (expDiff_c0 > 25) else '0';
   shiftVal_c0 <= expDiff_c0(4 downto 0) when shiftedOut_c0='0' else CONV_STD_LOGIC_VECTOR(26,5);
   RightShifterComponent: RightShifterSticky24_by_max_26_Freq200_uid4
      port map ( clk  => clk,
                 ce_1 => ce_1,
                 S => shiftVal_c0,
                 X => fracY_c0,
                 R => shiftedFracY_c0,
                 Sticky => sticky_c1);
   fracYpad_c0 <= "0" & shiftedFracY_c0;
   EffSubVector_c0 <= (26 downto 0 => EffSub_c0);
   fracYpadXorOp_c0 <= fracYpad_c0 xor EffSubVector_c0;
   fracXpad_c0 <= "01" & (newX_c0(22 downto 0)) & "00";
   cInSigAdd_c1 <= EffSub_c1 and not sticky_c1; -- if we subtract and the sticky was one, some of the negated sticky bits would have absorbed this carry 
   fracAdder: IntAdder_27_Freq200_uid6
      port map ( clk  => clk,
                 ce_1 => ce_1,
                 ce_2=> ce_2,
                 Cin => cInSigAdd_c1,
                 X => fracXpad_c0,
                 Y => fracYpadXorOp_c0,
                 R => fracAddResult_c2);
   fracSticky_c2<= fracAddResult_c2 & sticky_c2; 
   LZCAndShifter: Normalizer_Z_28_28_28_Freq200_uid8
      port map ( clk  => clk,
                 ce_3 => ce_3,
                 X => fracSticky_c2,
                 Count => nZerosNew_c3,
                 R => shiftedFrac_c3);
   extendedExpInc_c0<= ("0" & expX_c0) + '1';
   updatedExp_c3 <= ("0" &extendedExpInc_c3) - ("00000" & nZerosNew_c3);
   eqdiffsign_c3 <= '1' when nZerosNew_c3="11111" else '0';
   expFrac_c3<= updatedExp_c3 & shiftedFrac_c3(26 downto 3);
   stk_c3<= shiftedFrac_c3(2) or shiftedFrac_c3(1) or shiftedFrac_c3(0);
   rnd_c3<= shiftedFrac_c3(3);
   lsb_c3<= shiftedFrac_c3(4);
   needToRound_c3<= '1' when (rnd_c3='1' and stk_c3='1') or (rnd_c3='1' and stk_c3='0' and lsb_c3='1')
  else '0';
   roundingAdder: IntAdder_34_Freq200_uid11
      port map ( clk  => clk,
                 ce_1 => ce_1,
                 ce_2=> ce_2,
                 ce_3=> ce_3,
                 Cin => needToRound_c3,
                 X => expFrac_c3,
                 Y => "0000000000000000000000000000000000",
                 R => RoundedExpFrac_c3);
   -- possible update to exception bits
   upExc_c3 <= RoundedExpFrac_c3(33 downto 32);
   fracR_c3 <= RoundedExpFrac_c3(23 downto 1);
   expR_c3 <= RoundedExpFrac_c3(31 downto 24);
   exExpExc_c3 <= upExc_c3 & excRt_c3;
   with exExpExc_c3  select  
   excRt2_c3<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   excR_c3 <= "00" when (eqdiffsign_c3='1' and EffSub_c3='1'  and not(excRt_c3="11")) else excRt2_c3;
   signR2_c3 <= '0' when (eqdiffsign_c3='1' and EffSub_c3='1') else signR_c3;
   computedR_c3 <= excR_c3 & signR2_c3 & expR_c3 & fracR_c3;
   R <= computedR_c3;
end architecture;



--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid15
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid15 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid15 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid20
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid20 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid20 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid27
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid27 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid27 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid32
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid32 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid32 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid39
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid39 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid39 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid44
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid44 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid44 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid51
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid51 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid51 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid56
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid56 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid56 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid63
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid63 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid63 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid68
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid68 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid68 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid75
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid75 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid75 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid80
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid80 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid80 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid87
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid87 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid87 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid92
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid92 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid92 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid99
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid99 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid99 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid104
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid104 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid104 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid111
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid111 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid111 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid116
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid116 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid116 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid123
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid123 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid123 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid128
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid128 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid128 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid135
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid135 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid135 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid140
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid140 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid140 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid147
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid147 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid147 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          MultTable_Freq200_uid152
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity MultTable_Freq200_uid152 is
    port (X : in  std_logic_vector(4 downto 0);
          Y : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of MultTable_Freq200_uid152 is
signal Y0 :  std_logic_vector(4 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(4 downto 0);
begin
   with X  select  Y0 <= 
      "00000" when "00000",
      "00000" when "00001",
      "00000" when "00010",
      "00000" when "00011",
      "00000" when "00100",
      "00000" when "00101",
      "00000" when "00110",
      "00000" when "00111",
      "00000" when "01000",
      "00001" when "01001",
      "00010" when "01010",
      "00011" when "01011",
      "00100" when "01100",
      "00101" when "01101",
      "00110" when "01110",
      "00111" when "01111",
      "00000" when "10000",
      "00010" when "10001",
      "00100" when "10010",
      "00110" when "10011",
      "01000" when "10100",
      "01010" when "10101",
      "01100" when "10110",
      "01110" when "10111",
      "00000" when "11000",
      "00011" when "11001",
      "00110" when "11010",
      "01001" when "11011",
      "01100" when "11100",
      "01111" when "11101",
      "10010" when "11110",
      "10101" when "11111",
      "-----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                       Compressor_23_3_Freq200_uid156
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X1 X0
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_23_3_Freq200_uid156 is
    port (X1 : in  std_logic_vector(1 downto 0);
          X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_23_3_Freq200_uid156 is
signal X :  std_logic_vector(4 downto 0);
signal R0 :  std_logic_vector(2 downto 0);
begin
   X <= X1 & X0 ;

   with X  select  R0 <= 
      "000" when "00000",
      "001" when "00001" | "00010" | "00100",
      "010" when "00011" | "00101" | "00110" | "01000" | "10000",
      "011" when "00111" | "01001" | "01010" | "01100" | "10001" | "10010" | "10100",
      "100" when "01011" | "01101" | "01110" | "10011" | "10101" | "10110" | "11000",
      "101" when "01111" | "10111" | "11001" | "11010" | "11100",
      "110" when "11011" | "11101" | "11110",
      "111" when "11111",
      "---" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                       Compressor_3_2_Freq200_uid160
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X0
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_3_2_Freq200_uid160 is
    port (X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of Compressor_3_2_Freq200_uid160 is
signal X :  std_logic_vector(2 downto 0);
signal R0 :  std_logic_vector(1 downto 0);
begin
   X <= X0 ;

   with X  select  R0 <= 
      "00" when "000",
      "01" when "001" | "010" | "100",
      "10" when "011" | "101" | "110",
      "11" when "111",
      "--" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                       Compressor_14_3_Freq200_uid164
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X1 X0
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_14_3_Freq200_uid164 is
    port (X1 : in  std_logic_vector(0 downto 0);
          X0 : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_14_3_Freq200_uid164 is
signal X :  std_logic_vector(4 downto 0);
signal R0 :  std_logic_vector(2 downto 0);
begin
   X <= X1 & X0 ;

   with X  select  R0 <= 
      "000" when "00000",
      "001" when "00001" | "00010" | "00100" | "01000",
      "010" when "00011" | "00101" | "00110" | "01001" | "01010" | "01100" | "10000",
      "011" when "00111" | "01011" | "01101" | "01110" | "10001" | "10010" | "10100" | "11000",
      "100" when "01111" | "10011" | "10101" | "10110" | "11001" | "11010" | "11100",
      "101" when "10111" | "11011" | "11101" | "11110",
      "110" when "11111",
      "---" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                       Compressor_6_3_Freq200_uid170
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X0
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_6_3_Freq200_uid170 is
    port (X0 : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_6_3_Freq200_uid170 is
signal X :  std_logic_vector(5 downto 0);
signal R0 :  std_logic_vector(2 downto 0);
begin
   X <= X0 ;

   with X  select  R0 <= 
      "000" when "000000",
      "001" when "000001" | "000010" | "000100" | "001000" | "010000" | "100000",
      "010" when "000011" | "000101" | "000110" | "001001" | "001010" | "001100" | "010001" | "010010" | "010100" | "011000" | "100001" | "100010" | "100100" | "101000" | "110000",
      "011" when "000111" | "001011" | "001101" | "001110" | "010011" | "010101" | "010110" | "011001" | "011010" | "011100" | "100011" | "100101" | "100110" | "101001" | "101010" | "101100" | "110001" | "110010" | "110100" | "111000",
      "100" when "001111" | "010111" | "011011" | "011101" | "011110" | "100111" | "101011" | "101101" | "101110" | "110011" | "110101" | "110110" | "111001" | "111010" | "111100",
      "101" when "011111" | "101111" | "110111" | "111011" | "111101" | "111110",
      "110" when "111111",
      "---" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_17x24_Freq200_uid9
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_17x24_Freq200_uid9 is
    port (clk : in std_logic;
          X : in  std_logic_vector(16 downto 0);
          Y : in  std_logic_vector(23 downto 0);
          R : out  std_logic_vector(40 downto 0)   );
end entity;

architecture arch of DSPBlock_17x24_Freq200_uid9 is
signal Mfull_c0 :  std_logic_vector(40 downto 0);
signal M_c0 :  std_logic_vector(40 downto 0);
begin
   Mfull_c0 <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M_c0 <= Mfull_c0(40 downto 0);
   R <= M_c0;
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_1x2_Freq200_uid11
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid11 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid11 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid13
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid13 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid13 is
   component MultTable_Freq200_uid15 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy16_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid15
      port map ( X => Xtable_c0,
                 Y => Y1_copy16_c0);
   Y1_c0 <= Y1_copy16_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid18
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid18 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid18 is
   component MultTable_Freq200_uid20 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy21_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid20
      port map ( X => Xtable_c0,
                 Y => Y1_copy21_c0);
   Y1_c0 <= Y1_copy21_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_1x2_Freq200_uid23
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid23 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid23 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid25
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid25 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid25 is
   component MultTable_Freq200_uid27 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy28_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid27
      port map ( X => Xtable_c0,
                 Y => Y1_copy28_c0);
   Y1_c0 <= Y1_copy28_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid30
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid30 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid30 is
   component MultTable_Freq200_uid32 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy33_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid32
      port map ( X => Xtable_c0,
                 Y => Y1_copy33_c0);
   Y1_c0 <= Y1_copy33_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_1x2_Freq200_uid35
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid35 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid35 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid37
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid37 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid37 is
   component MultTable_Freq200_uid39 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy40_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid39
      port map ( X => Xtable_c0,
                 Y => Y1_copy40_c0);
   Y1_c0 <= Y1_copy40_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid42
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid42 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid42 is
   component MultTable_Freq200_uid44 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy45_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid44
      port map ( X => Xtable_c0,
                 Y => Y1_copy45_c0);
   Y1_c0 <= Y1_copy45_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_1x2_Freq200_uid47
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid47 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid47 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid49
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid49 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid49 is
   component MultTable_Freq200_uid51 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy52_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid51
      port map ( X => Xtable_c0,
                 Y => Y1_copy52_c0);
   Y1_c0 <= Y1_copy52_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid54
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid54 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid54 is
   component MultTable_Freq200_uid56 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy57_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid56
      port map ( X => Xtable_c0,
                 Y => Y1_copy57_c0);
   Y1_c0 <= Y1_copy57_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_1x2_Freq200_uid59
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid59 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid59 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid61
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid61 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid61 is
   component MultTable_Freq200_uid63 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy64_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid63
      port map ( X => Xtable_c0,
                 Y => Y1_copy64_c0);
   Y1_c0 <= Y1_copy64_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid66
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid66 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid66 is
   component MultTable_Freq200_uid68 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy69_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid68
      port map ( X => Xtable_c0,
                 Y => Y1_copy69_c0);
   Y1_c0 <= Y1_copy69_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_1x2_Freq200_uid71
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid71 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid71 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid73
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid73 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid73 is
   component MultTable_Freq200_uid75 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy76_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid75
      port map ( X => Xtable_c0,
                 Y => Y1_copy76_c0);
   Y1_c0 <= Y1_copy76_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid78
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid78 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid78 is
   component MultTable_Freq200_uid80 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy81_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid80
      port map ( X => Xtable_c0,
                 Y => Y1_copy81_c0);
   Y1_c0 <= Y1_copy81_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_1x2_Freq200_uid83
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid83 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid83 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid85
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid85 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid85 is
   component MultTable_Freq200_uid87 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy88_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid87
      port map ( X => Xtable_c0,
                 Y => Y1_copy88_c0);
   Y1_c0 <= Y1_copy88_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid90
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid90 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid90 is
   component MultTable_Freq200_uid92 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy93_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid92
      port map ( X => Xtable_c0,
                 Y => Y1_copy93_c0);
   Y1_c0 <= Y1_copy93_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_1x2_Freq200_uid95
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid95 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid95 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                     IntMultiplierLUT_3x2_Freq200_uid97
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid97 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid97 is
   component MultTable_Freq200_uid99 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy100_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid99
      port map ( X => Xtable_c0,
                 Y => Y1_copy100_c0);
   Y1_c0 <= Y1_copy100_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_3x2_Freq200_uid102
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid102 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid102 is
   component MultTable_Freq200_uid104 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy105_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid104
      port map ( X => Xtable_c0,
                 Y => Y1_copy105_c0);
   Y1_c0 <= Y1_copy105_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_1x2_Freq200_uid107
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid107 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid107 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_3x2_Freq200_uid109
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid109 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid109 is
   component MultTable_Freq200_uid111 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy112_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid111
      port map ( X => Xtable_c0,
                 Y => Y1_copy112_c0);
   Y1_c0 <= Y1_copy112_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_3x2_Freq200_uid114
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid114 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid114 is
   component MultTable_Freq200_uid116 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy117_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid116
      port map ( X => Xtable_c0,
                 Y => Y1_copy117_c0);
   Y1_c0 <= Y1_copy117_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_1x2_Freq200_uid119
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid119 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid119 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_3x2_Freq200_uid121
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid121 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid121 is
   component MultTable_Freq200_uid123 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy124_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid123
      port map ( X => Xtable_c0,
                 Y => Y1_copy124_c0);
   Y1_c0 <= Y1_copy124_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_3x2_Freq200_uid126
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid126 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid126 is
   component MultTable_Freq200_uid128 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy129_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid128
      port map ( X => Xtable_c0,
                 Y => Y1_copy129_c0);
   Y1_c0 <= Y1_copy129_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_1x2_Freq200_uid131
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid131 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid131 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_3x2_Freq200_uid133
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid133 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid133 is
   component MultTable_Freq200_uid135 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy136_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid135
      port map ( X => Xtable_c0,
                 Y => Y1_copy136_c0);
   Y1_c0 <= Y1_copy136_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_3x2_Freq200_uid138
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid138 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid138 is
   component MultTable_Freq200_uid140 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy141_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid140
      port map ( X => Xtable_c0,
                 Y => Y1_copy141_c0);
   Y1_c0 <= Y1_copy141_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_1x2_Freq200_uid143
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_1x2_Freq200_uid143 is
    port (clk : in std_logic;
          X : in  std_logic_vector(0 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_1x2_Freq200_uid143 is
signal replicated_c0 :  std_logic_vector(1 downto 0);
signal prod_c0 :  std_logic_vector(1 downto 0);
begin
   replicated_c0 <= (1 downto 0 => X(0));
   prod_c0 <= Y and replicated_c0;
   R <= prod_c0;
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_3x2_Freq200_uid145
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid145 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid145 is
   component MultTable_Freq200_uid147 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy148_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid147
      port map ( X => Xtable_c0,
                 Y => Y1_copy148_c0);
   Y1_c0 <= Y1_copy148_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplierLUT_3x2_Freq200_uid150
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplierLUT_3x2_Freq200_uid150 is
    port (clk : in std_logic;
          X : in  std_logic_vector(2 downto 0);
          Y : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplierLUT_3x2_Freq200_uid150 is
   component MultTable_Freq200_uid152 is
      port ( X : in  std_logic_vector(4 downto 0);
             Y : out  std_logic_vector(4 downto 0)   );
   end component;

signal Xtable_c0 :  std_logic_vector(4 downto 0);
signal Y1_c0 :  std_logic_vector(4 downto 0);
signal Y1_copy153_c0 :  std_logic_vector(4 downto 0);
begin
Xtable_c0 <= Y & X;
   R <= Y1_c0;
   TableMult: MultTable_Freq200_uid152
      port map ( X => Xtable_c0,
                 Y => Y1_copy153_c0);
   Y1_c0 <= Y1_copy153_c0; -- output copy to hold a pipeline register if needed
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_30_Freq200_uid352
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_30_Freq200_uid352 is
    port (clk, ce_1 : in std_logic;
          X : in  std_logic_vector(29 downto 0);
          Y : in  std_logic_vector(29 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(29 downto 0)   );
end entity;

architecture arch of IntAdder_30_Freq200_uid352 is
signal Rtmp_c1 :  std_logic_vector(29 downto 0);
signal X_c1 :  std_logic_vector(29 downto 0);
signal Y_c1 :  std_logic_vector(29 downto 0);
signal Cin_c1 :  std_logic;
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               X_c1 <= X;
               Y_c1 <= Y;
               Cin_c1 <= Cin;
            end if;
         end if;
      end process;
   Rtmp_c1 <= X_c1 + Y_c1 + Cin_c1;
   R <= Rtmp_c1;
end architecture;

--------------------------------------------------------------------------------
--                    IntMultiplier_24x24_48_Freq200_uid5
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Martin Kumm, Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012-
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_24x24_48_Freq200_uid5 is
    port (clk, ce_1 : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          Y : in  std_logic_vector(23 downto 0);
          R : out  std_logic_vector(47 downto 0)   );
end entity;

architecture arch of IntMultiplier_24x24_48_Freq200_uid5 is
   component DSPBlock_17x24_Freq200_uid9 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(16 downto 0);
             Y : in  std_logic_vector(23 downto 0);
             R : out  std_logic_vector(40 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid11 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid13 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid18 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid23 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid25 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid30 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid35 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid37 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid42 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid47 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid49 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid54 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid59 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid61 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid66 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid71 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid73 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid78 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid83 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid85 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid90 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid95 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid97 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid102 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid107 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid109 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid114 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid119 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid121 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid126 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid131 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid133 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid138 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_1x2_Freq200_uid143 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(0 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid145 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component IntMultiplierLUT_3x2_Freq200_uid150 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(2 downto 0);
             Y : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component Compressor_23_3_Freq200_uid156 is
      port ( X1 : in  std_logic_vector(1 downto 0);
             X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_3_2_Freq200_uid160 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component Compressor_14_3_Freq200_uid164 is
      port ( X1 : in  std_logic_vector(0 downto 0);
             X0 : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_6_3_Freq200_uid170 is
      port ( X0 : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component IntAdder_30_Freq200_uid352 is
      port ( clk, ce_1 : in std_logic;
             X : in  std_logic_vector(29 downto 0);
             Y : in  std_logic_vector(29 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(29 downto 0)   );
   end component;

signal XX_m6_c0 :  std_logic_vector(23 downto 0);
signal YY_m6_c0 :  std_logic_vector(23 downto 0);
signal tile_0_X_c0 :  std_logic_vector(16 downto 0);
signal tile_0_Y_c0 :  std_logic_vector(23 downto 0);
signal tile_0_output_c0 :  std_logic_vector(40 downto 0);
signal tile_0_filtered_output_c0 :  unsigned(40-0 downto 0);
signal bh7_w0_0_c0 :  std_logic;
signal bh7_w1_0_c0 :  std_logic;
signal bh7_w2_0_c0 :  std_logic;
signal bh7_w3_0_c0 :  std_logic;
signal bh7_w4_0_c0 :  std_logic;
signal bh7_w5_0_c0 :  std_logic;
signal bh7_w6_0_c0 :  std_logic;
signal bh7_w7_0_c0 :  std_logic;
signal bh7_w8_0_c0 :  std_logic;
signal bh7_w9_0_c0 :  std_logic;
signal bh7_w10_0_c0 :  std_logic;
signal bh7_w11_0_c0 :  std_logic;
signal bh7_w12_0_c0 :  std_logic;
signal bh7_w13_0_c0 :  std_logic;
signal bh7_w14_0_c0 :  std_logic;
signal bh7_w15_0_c0 :  std_logic;
signal bh7_w16_0_c0 :  std_logic;
signal bh7_w17_0_c0 :  std_logic;
signal bh7_w18_0_c0 :  std_logic;
signal bh7_w19_0_c0 :  std_logic;
signal bh7_w20_0_c0 :  std_logic;
signal bh7_w21_0_c0 :  std_logic;
signal bh7_w22_0_c0 :  std_logic;
signal bh7_w23_0_c0 :  std_logic;
signal bh7_w24_0_c0 :  std_logic;
signal bh7_w25_0_c0 :  std_logic;
signal bh7_w26_0_c0 :  std_logic;
signal bh7_w27_0_c0 :  std_logic;
signal bh7_w28_0_c0 :  std_logic;
signal bh7_w29_0_c0 :  std_logic;
signal bh7_w30_0_c0 :  std_logic;
signal bh7_w31_0_c0 :  std_logic;
signal bh7_w32_0_c0 :  std_logic;
signal bh7_w33_0_c0 :  std_logic;
signal bh7_w34_0_c0 :  std_logic;
signal bh7_w35_0_c0 :  std_logic;
signal bh7_w36_0_c0 :  std_logic;
signal bh7_w37_0_c0 :  std_logic;
signal bh7_w38_0_c0 :  std_logic;
signal bh7_w39_0_c0 :  std_logic;
signal bh7_w40_0_c0 :  std_logic;
signal tile_1_X_c0 :  std_logic_vector(0 downto 0);
signal tile_1_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_1_output_c0 :  std_logic_vector(1 downto 0);
signal tile_1_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w45_0_c0 :  std_logic;
signal bh7_w46_0_c0 :  std_logic;
signal tile_2_X_c0 :  std_logic_vector(2 downto 0);
signal tile_2_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_2_output_c0 :  std_logic_vector(4 downto 0);
signal tile_2_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w42_0_c0 :  std_logic;
signal bh7_w43_0_c0 :  std_logic;
signal bh7_w44_0_c0 :  std_logic;
signal bh7_w45_1_c0 :  std_logic;
signal bh7_w46_1_c0 :  std_logic;
signal tile_3_X_c0 :  std_logic_vector(2 downto 0);
signal tile_3_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_3_output_c0 :  std_logic_vector(4 downto 0);
signal tile_3_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w39_1_c0 :  std_logic;
signal bh7_w40_1_c0 :  std_logic;
signal bh7_w41_0_c0 :  std_logic;
signal bh7_w42_1_c0 :  std_logic;
signal bh7_w43_1_c0 :  std_logic;
signal tile_4_X_c0 :  std_logic_vector(0 downto 0);
signal tile_4_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_4_output_c0 :  std_logic_vector(1 downto 0);
signal tile_4_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w43_2_c0 :  std_logic;
signal bh7_w44_1_c0 :  std_logic;
signal tile_5_X_c0 :  std_logic_vector(2 downto 0);
signal tile_5_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_5_output_c0 :  std_logic_vector(4 downto 0);
signal tile_5_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w40_2_c0 :  std_logic;
signal bh7_w41_1_c0 :  std_logic;
signal bh7_w42_2_c0 :  std_logic;
signal bh7_w43_3_c0 :  std_logic;
signal bh7_w44_2_c0 :  std_logic;
signal tile_6_X_c0 :  std_logic_vector(2 downto 0);
signal tile_6_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_6_output_c0 :  std_logic_vector(4 downto 0);
signal tile_6_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w37_1_c0 :  std_logic;
signal bh7_w38_1_c0 :  std_logic;
signal bh7_w39_2_c0 :  std_logic;
signal bh7_w40_3_c0 :  std_logic;
signal bh7_w41_2_c0 :  std_logic;
signal tile_7_X_c0 :  std_logic_vector(0 downto 0);
signal tile_7_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_7_output_c0 :  std_logic_vector(1 downto 0);
signal tile_7_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w41_3_c0 :  std_logic;
signal bh7_w42_3_c0 :  std_logic;
signal tile_8_X_c0 :  std_logic_vector(2 downto 0);
signal tile_8_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_8_output_c0 :  std_logic_vector(4 downto 0);
signal tile_8_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w38_2_c0 :  std_logic;
signal bh7_w39_3_c0 :  std_logic;
signal bh7_w40_4_c0 :  std_logic;
signal bh7_w41_4_c0 :  std_logic;
signal bh7_w42_4_c0 :  std_logic;
signal tile_9_X_c0 :  std_logic_vector(2 downto 0);
signal tile_9_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_9_output_c0 :  std_logic_vector(4 downto 0);
signal tile_9_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w35_1_c0 :  std_logic;
signal bh7_w36_1_c0 :  std_logic;
signal bh7_w37_2_c0 :  std_logic;
signal bh7_w38_3_c0 :  std_logic;
signal bh7_w39_4_c0 :  std_logic;
signal tile_10_X_c0 :  std_logic_vector(0 downto 0);
signal tile_10_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_10_output_c0 :  std_logic_vector(1 downto 0);
signal tile_10_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w39_5_c0 :  std_logic;
signal bh7_w40_5_c0 :  std_logic;
signal tile_11_X_c0 :  std_logic_vector(2 downto 0);
signal tile_11_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_11_output_c0 :  std_logic_vector(4 downto 0);
signal tile_11_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w36_2_c0 :  std_logic;
signal bh7_w37_3_c0 :  std_logic;
signal bh7_w38_4_c0 :  std_logic;
signal bh7_w39_6_c0 :  std_logic;
signal bh7_w40_6_c0 :  std_logic;
signal tile_12_X_c0 :  std_logic_vector(2 downto 0);
signal tile_12_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_12_output_c0 :  std_logic_vector(4 downto 0);
signal tile_12_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w33_1_c0 :  std_logic;
signal bh7_w34_1_c0 :  std_logic;
signal bh7_w35_2_c0 :  std_logic;
signal bh7_w36_3_c0 :  std_logic;
signal bh7_w37_4_c0 :  std_logic;
signal tile_13_X_c0 :  std_logic_vector(0 downto 0);
signal tile_13_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_13_output_c0 :  std_logic_vector(1 downto 0);
signal tile_13_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w37_5_c0 :  std_logic;
signal bh7_w38_5_c0 :  std_logic;
signal tile_14_X_c0 :  std_logic_vector(2 downto 0);
signal tile_14_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_14_output_c0 :  std_logic_vector(4 downto 0);
signal tile_14_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w34_2_c0 :  std_logic;
signal bh7_w35_3_c0 :  std_logic;
signal bh7_w36_4_c0 :  std_logic;
signal bh7_w37_6_c0 :  std_logic;
signal bh7_w38_6_c0 :  std_logic;
signal tile_15_X_c0 :  std_logic_vector(2 downto 0);
signal tile_15_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_15_output_c0 :  std_logic_vector(4 downto 0);
signal tile_15_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w31_1_c0 :  std_logic;
signal bh7_w32_1_c0 :  std_logic;
signal bh7_w33_2_c0 :  std_logic;
signal bh7_w34_3_c0 :  std_logic;
signal bh7_w35_4_c0 :  std_logic;
signal tile_16_X_c0 :  std_logic_vector(0 downto 0);
signal tile_16_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_16_output_c0 :  std_logic_vector(1 downto 0);
signal tile_16_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w35_5_c0 :  std_logic;
signal bh7_w36_5_c0 :  std_logic;
signal tile_17_X_c0 :  std_logic_vector(2 downto 0);
signal tile_17_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_17_output_c0 :  std_logic_vector(4 downto 0);
signal tile_17_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w32_2_c0 :  std_logic;
signal bh7_w33_3_c0 :  std_logic;
signal bh7_w34_4_c0 :  std_logic;
signal bh7_w35_6_c0 :  std_logic;
signal bh7_w36_6_c0 :  std_logic;
signal tile_18_X_c0 :  std_logic_vector(2 downto 0);
signal tile_18_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_18_output_c0 :  std_logic_vector(4 downto 0);
signal tile_18_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w29_1_c0 :  std_logic;
signal bh7_w30_1_c0 :  std_logic;
signal bh7_w31_2_c0 :  std_logic;
signal bh7_w32_3_c0 :  std_logic;
signal bh7_w33_4_c0 :  std_logic;
signal tile_19_X_c0 :  std_logic_vector(0 downto 0);
signal tile_19_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_19_output_c0 :  std_logic_vector(1 downto 0);
signal tile_19_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w33_5_c0 :  std_logic;
signal bh7_w34_5_c0 :  std_logic;
signal tile_20_X_c0 :  std_logic_vector(2 downto 0);
signal tile_20_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_20_output_c0 :  std_logic_vector(4 downto 0);
signal tile_20_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w30_2_c0 :  std_logic;
signal bh7_w31_3_c0 :  std_logic;
signal bh7_w32_4_c0 :  std_logic;
signal bh7_w33_6_c0 :  std_logic;
signal bh7_w34_6_c0 :  std_logic;
signal tile_21_X_c0 :  std_logic_vector(2 downto 0);
signal tile_21_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_21_output_c0 :  std_logic_vector(4 downto 0);
signal tile_21_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w27_1_c0 :  std_logic;
signal bh7_w28_1_c0 :  std_logic;
signal bh7_w29_2_c0 :  std_logic;
signal bh7_w30_3_c0 :  std_logic;
signal bh7_w31_4_c0 :  std_logic;
signal tile_22_X_c0 :  std_logic_vector(0 downto 0);
signal tile_22_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_22_output_c0 :  std_logic_vector(1 downto 0);
signal tile_22_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w31_5_c0 :  std_logic;
signal bh7_w32_5_c0 :  std_logic;
signal tile_23_X_c0 :  std_logic_vector(2 downto 0);
signal tile_23_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_23_output_c0 :  std_logic_vector(4 downto 0);
signal tile_23_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w28_2_c0 :  std_logic;
signal bh7_w29_3_c0 :  std_logic;
signal bh7_w30_4_c0 :  std_logic;
signal bh7_w31_6_c0 :  std_logic;
signal bh7_w32_6_c0 :  std_logic;
signal tile_24_X_c0 :  std_logic_vector(2 downto 0);
signal tile_24_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_24_output_c0 :  std_logic_vector(4 downto 0);
signal tile_24_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w25_1_c0 :  std_logic;
signal bh7_w26_1_c0 :  std_logic;
signal bh7_w27_2_c0 :  std_logic;
signal bh7_w28_3_c0 :  std_logic;
signal bh7_w29_4_c0 :  std_logic;
signal tile_25_X_c0 :  std_logic_vector(0 downto 0);
signal tile_25_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_25_output_c0 :  std_logic_vector(1 downto 0);
signal tile_25_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w29_5_c0 :  std_logic;
signal bh7_w30_5_c0 :  std_logic;
signal tile_26_X_c0 :  std_logic_vector(2 downto 0);
signal tile_26_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_26_output_c0 :  std_logic_vector(4 downto 0);
signal tile_26_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w26_2_c0 :  std_logic;
signal bh7_w27_3_c0 :  std_logic;
signal bh7_w28_4_c0 :  std_logic;
signal bh7_w29_6_c0 :  std_logic;
signal bh7_w30_6_c0 :  std_logic;
signal tile_27_X_c0 :  std_logic_vector(2 downto 0);
signal tile_27_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_27_output_c0 :  std_logic_vector(4 downto 0);
signal tile_27_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w23_1_c0 :  std_logic;
signal bh7_w24_1_c0 :  std_logic;
signal bh7_w25_2_c0 :  std_logic;
signal bh7_w26_3_c0 :  std_logic;
signal bh7_w27_4_c0 :  std_logic;
signal tile_28_X_c0 :  std_logic_vector(0 downto 0);
signal tile_28_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_28_output_c0 :  std_logic_vector(1 downto 0);
signal tile_28_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w27_5_c0 :  std_logic;
signal bh7_w28_5_c0 :  std_logic;
signal tile_29_X_c0 :  std_logic_vector(2 downto 0);
signal tile_29_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_29_output_c0 :  std_logic_vector(4 downto 0);
signal tile_29_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w24_2_c0 :  std_logic;
signal bh7_w25_3_c0 :  std_logic;
signal bh7_w26_4_c0 :  std_logic;
signal bh7_w27_6_c0 :  std_logic;
signal bh7_w28_6_c0 :  std_logic;
signal tile_30_X_c0 :  std_logic_vector(2 downto 0);
signal tile_30_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_30_output_c0 :  std_logic_vector(4 downto 0);
signal tile_30_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w21_1_c0 :  std_logic;
signal bh7_w22_1_c0 :  std_logic;
signal bh7_w23_2_c0 :  std_logic;
signal bh7_w24_3_c0 :  std_logic;
signal bh7_w25_4_c0 :  std_logic;
signal tile_31_X_c0 :  std_logic_vector(0 downto 0);
signal tile_31_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_31_output_c0 :  std_logic_vector(1 downto 0);
signal tile_31_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w25_5_c0 :  std_logic;
signal bh7_w26_5_c0 :  std_logic;
signal tile_32_X_c0 :  std_logic_vector(2 downto 0);
signal tile_32_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_32_output_c0 :  std_logic_vector(4 downto 0);
signal tile_32_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w22_2_c0 :  std_logic;
signal bh7_w23_3_c0 :  std_logic;
signal bh7_w24_4_c0 :  std_logic;
signal bh7_w25_6_c0 :  std_logic;
signal bh7_w26_6_c0 :  std_logic;
signal tile_33_X_c0 :  std_logic_vector(2 downto 0);
signal tile_33_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_33_output_c0 :  std_logic_vector(4 downto 0);
signal tile_33_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w19_1_c0 :  std_logic;
signal bh7_w20_1_c0 :  std_logic;
signal bh7_w21_2_c0 :  std_logic;
signal bh7_w22_3_c0 :  std_logic;
signal bh7_w23_4_c0 :  std_logic;
signal tile_34_X_c0 :  std_logic_vector(0 downto 0);
signal tile_34_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_34_output_c0 :  std_logic_vector(1 downto 0);
signal tile_34_filtered_output_c0 :  unsigned(1-0 downto 0);
signal bh7_w23_5_c0 :  std_logic;
signal bh7_w24_5_c0 :  std_logic;
signal tile_35_X_c0 :  std_logic_vector(2 downto 0);
signal tile_35_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_35_output_c0 :  std_logic_vector(4 downto 0);
signal tile_35_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w20_2_c0 :  std_logic;
signal bh7_w21_3_c0 :  std_logic;
signal bh7_w22_4_c0 :  std_logic;
signal bh7_w23_6_c0 :  std_logic;
signal bh7_w24_6_c0 :  std_logic;
signal tile_36_X_c0 :  std_logic_vector(2 downto 0);
signal tile_36_Y_c0 :  std_logic_vector(1 downto 0);
signal tile_36_output_c0 :  std_logic_vector(4 downto 0);
signal tile_36_filtered_output_c0 :  unsigned(4-0 downto 0);
signal bh7_w17_1_c0 :  std_logic;
signal bh7_w18_1_c0 :  std_logic;
signal bh7_w19_2_c0 :  std_logic;
signal bh7_w20_3_c0 :  std_logic;
signal bh7_w21_4_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid157_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid157_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid157_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w18_2_c0 :  std_logic;
signal bh7_w19_3_c0 :  std_logic;
signal bh7_w20_4_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid157_Out0_copy158_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid161_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid161_Out0_c0 :  std_logic_vector(1 downto 0);
signal bh7_w20_5_c0 :  std_logic;
signal bh7_w21_5_c0 :  std_logic;
signal Compressor_3_2_Freq200_uid160_bh7_uid161_Out0_copy162_c0 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid165_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid165_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid165_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w21_6_c0 :  std_logic;
signal bh7_w22_5_c0 :  std_logic;
signal bh7_w23_7_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid165_Out0_copy166_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid167_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid167_Out0_c0 :  std_logic_vector(1 downto 0);
signal bh7_w22_6_c0 :  std_logic;
signal bh7_w23_8_c0 :  std_logic;
signal Compressor_3_2_Freq200_uid160_bh7_uid167_Out0_copy168_c0 :  std_logic_vector(1 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid171_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid171_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w23_9_c0 :  std_logic;
signal bh7_w24_7_c0 :  std_logic;
signal bh7_w25_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid171_Out0_copy172_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid173_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid173_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w24_8_c0 :  std_logic;
signal bh7_w25_8_c0 :  std_logic;
signal bh7_w26_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid173_Out0_copy174_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid175_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid175_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w25_9_c0 :  std_logic;
signal bh7_w26_8_c0 :  std_logic;
signal bh7_w27_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid175_Out0_copy176_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid177_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid177_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w26_9_c0 :  std_logic;
signal bh7_w27_8_c0 :  std_logic;
signal bh7_w28_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid177_Out0_copy178_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid179_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid179_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w27_9_c0 :  std_logic;
signal bh7_w28_8_c0 :  std_logic;
signal bh7_w29_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid179_Out0_copy180_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid181_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid181_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w28_9_c0 :  std_logic;
signal bh7_w29_8_c0 :  std_logic;
signal bh7_w30_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid181_Out0_copy182_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid183_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid183_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w29_9_c0 :  std_logic;
signal bh7_w30_8_c0 :  std_logic;
signal bh7_w31_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid183_Out0_copy184_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid185_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid185_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w30_9_c0 :  std_logic;
signal bh7_w31_8_c0 :  std_logic;
signal bh7_w32_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid185_Out0_copy186_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid187_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid187_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w31_9_c0 :  std_logic;
signal bh7_w32_8_c0 :  std_logic;
signal bh7_w33_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid187_Out0_copy188_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid189_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid189_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w32_9_c0 :  std_logic;
signal bh7_w33_8_c0 :  std_logic;
signal bh7_w34_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid189_Out0_copy190_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid191_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid191_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w33_9_c0 :  std_logic;
signal bh7_w34_8_c0 :  std_logic;
signal bh7_w35_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid191_Out0_copy192_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid193_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid193_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w34_9_c0 :  std_logic;
signal bh7_w35_8_c0 :  std_logic;
signal bh7_w36_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid193_Out0_copy194_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid195_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid195_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w35_9_c0 :  std_logic;
signal bh7_w36_8_c0 :  std_logic;
signal bh7_w37_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid195_Out0_copy196_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid197_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid197_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w36_9_c0 :  std_logic;
signal bh7_w37_8_c0 :  std_logic;
signal bh7_w38_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid197_Out0_copy198_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid199_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid199_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w37_9_c0 :  std_logic;
signal bh7_w38_8_c0 :  std_logic;
signal bh7_w39_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid199_Out0_copy200_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid201_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid201_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w38_9_c0 :  std_logic;
signal bh7_w39_8_c0 :  std_logic;
signal bh7_w40_7_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid201_Out0_copy202_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid203_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid203_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w39_9_c0 :  std_logic;
signal bh7_w40_8_c0 :  std_logic;
signal bh7_w41_5_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid203_Out0_copy204_c0 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid205_In0_c0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq200_uid170_bh7_uid205_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w40_9_c0 :  std_logic;
signal bh7_w41_6_c0 :  std_logic;
signal bh7_w42_5_c0 :  std_logic;
signal Compressor_6_3_Freq200_uid170_bh7_uid205_Out0_copy206_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid207_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid207_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid207_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w41_7_c0 :  std_logic;
signal bh7_w42_6_c0 :  std_logic;
signal bh7_w43_4_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid207_Out0_copy208_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid209_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid209_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid209_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w42_7_c0 :  std_logic;
signal bh7_w43_5_c0 :  std_logic;
signal bh7_w44_3_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid209_Out0_copy210_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid211_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid211_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid211_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w43_6_c0 :  std_logic;
signal bh7_w44_4_c0 :  std_logic;
signal bh7_w45_2_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid211_Out0_copy212_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid213_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid213_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid213_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w45_3_c0 :  std_logic;
signal bh7_w46_2_c0 :  std_logic;
signal bh7_w47_0_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid213_Out0_copy214_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid215_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid215_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid215_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w20_6_c0 :  std_logic;
signal bh7_w21_7_c0 :  std_logic;
signal bh7_w22_7_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid215_Out0_copy216_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid217_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid217_Out0_c0 :  std_logic_vector(1 downto 0);
signal bh7_w22_8_c0 :  std_logic;
signal bh7_w23_10_c0 :  std_logic;
signal Compressor_3_2_Freq200_uid160_bh7_uid217_Out0_copy218_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid219_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid219_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid219_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w23_11_c0 :  std_logic;
signal bh7_w24_9_c0 :  std_logic;
signal bh7_w25_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid219_Out0_copy220_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid221_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid221_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid221_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w25_11_c0 :  std_logic;
signal bh7_w26_10_c0 :  std_logic;
signal bh7_w27_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid221_Out0_copy222_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid223_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid223_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid223_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w27_11_c0 :  std_logic;
signal bh7_w28_10_c0 :  std_logic;
signal bh7_w29_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid223_Out0_copy224_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid225_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid225_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid225_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w29_11_c0 :  std_logic;
signal bh7_w30_10_c0 :  std_logic;
signal bh7_w31_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid225_Out0_copy226_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid227_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid227_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid227_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w31_11_c0 :  std_logic;
signal bh7_w32_10_c0 :  std_logic;
signal bh7_w33_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid227_Out0_copy228_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid229_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid229_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid229_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w33_11_c0 :  std_logic;
signal bh7_w34_10_c0 :  std_logic;
signal bh7_w35_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid229_Out0_copy230_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid231_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid231_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid231_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w35_11_c0 :  std_logic;
signal bh7_w36_10_c0 :  std_logic;
signal bh7_w37_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid231_Out0_copy232_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid233_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid233_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid233_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w37_11_c0 :  std_logic;
signal bh7_w38_10_c0 :  std_logic;
signal bh7_w39_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid233_Out0_copy234_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid235_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid235_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid235_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w39_11_c0 :  std_logic;
signal bh7_w40_10_c0 :  std_logic;
signal bh7_w41_8_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid235_Out0_copy236_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid237_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid237_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid237_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w41_9_c0 :  std_logic;
signal bh7_w42_8_c0 :  std_logic;
signal bh7_w43_7_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid237_Out0_copy238_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid239_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid239_Out0_c0 :  std_logic_vector(1 downto 0);
signal bh7_w42_9_c0 :  std_logic;
signal bh7_w43_8_c0 :  std_logic;
signal Compressor_3_2_Freq200_uid160_bh7_uid239_Out0_copy240_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid241_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid241_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid241_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w43_9_c0 :  std_logic;
signal bh7_w44_5_c0 :  std_logic;
signal bh7_w45_4_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid241_Out0_copy242_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid243_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid243_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid243_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w45_5_c0 :  std_logic;
signal bh7_w46_3_c0 :  std_logic;
signal bh7_w47_1_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid243_Out0_copy244_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid245_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid245_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid245_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w22_9_c0 :  std_logic;
signal bh7_w23_12_c0 :  std_logic;
signal bh7_w24_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid245_Out0_copy246_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid247_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid247_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid247_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w25_12_c0 :  std_logic;
signal bh7_w26_11_c0 :  std_logic;
signal bh7_w27_12_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid247_Out0_copy248_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid249_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid249_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid249_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w27_13_c0 :  std_logic;
signal bh7_w28_11_c0 :  std_logic;
signal bh7_w29_12_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid249_Out0_copy250_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid251_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid251_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid251_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w29_13_c0 :  std_logic;
signal bh7_w30_11_c0 :  std_logic;
signal bh7_w31_12_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid251_Out0_copy252_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid253_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid253_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid253_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w31_13_c0 :  std_logic;
signal bh7_w32_11_c0 :  std_logic;
signal bh7_w33_12_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid253_Out0_copy254_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid255_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid255_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid255_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w33_13_c0 :  std_logic;
signal bh7_w34_11_c0 :  std_logic;
signal bh7_w35_12_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid255_Out0_copy256_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid257_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid257_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid257_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w35_13_c0 :  std_logic;
signal bh7_w36_11_c0 :  std_logic;
signal bh7_w37_12_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid257_Out0_copy258_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid259_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid259_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid259_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w37_13_c0 :  std_logic;
signal bh7_w38_11_c0 :  std_logic;
signal bh7_w39_12_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid259_Out0_copy260_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid261_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid261_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid261_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w39_13_c0 :  std_logic;
signal bh7_w40_11_c0 :  std_logic;
signal bh7_w41_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid261_Out0_copy262_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid263_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid263_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid263_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w41_11_c0 :  std_logic;
signal bh7_w42_10_c0 :  std_logic;
signal bh7_w43_10_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid263_Out0_copy264_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid265_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid265_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid265_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w43_11_c0 :  std_logic;
signal bh7_w44_6_c0 :  std_logic;
signal bh7_w45_6_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid265_Out0_copy266_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid267_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid267_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid267_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w45_7_c0 :  std_logic;
signal bh7_w46_4_c0 :  std_logic;
signal bh7_w47_2_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid267_Out0_copy268_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid269_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid269_Out0_c0 :  std_logic_vector(1 downto 0);
signal bh7_w47_3_c0 :  std_logic;
signal Compressor_3_2_Freq200_uid160_bh7_uid269_Out0_copy270_c0 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid271_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid271_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid271_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w24_11_c0 :  std_logic;
signal bh7_w25_13_c0 :  std_logic;
signal bh7_w26_12_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid271_Out0_copy272_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid273_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid273_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid273_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w27_14_c0 :  std_logic;
signal bh7_w28_12_c0 :  std_logic;
signal bh7_w29_14_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid273_Out0_copy274_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid275_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid275_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid275_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w29_15_c0 :  std_logic;
signal bh7_w30_12_c0 :  std_logic;
signal bh7_w31_14_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid275_Out0_copy276_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid277_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid277_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid277_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w31_15_c0 :  std_logic;
signal bh7_w32_12_c0 :  std_logic;
signal bh7_w33_14_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid277_Out0_copy278_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid279_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid279_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid279_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w33_15_c0 :  std_logic;
signal bh7_w34_12_c0 :  std_logic;
signal bh7_w35_14_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid279_Out0_copy280_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid281_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid281_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid281_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w35_15_c0 :  std_logic;
signal bh7_w36_12_c0 :  std_logic;
signal bh7_w37_14_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid281_Out0_copy282_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid283_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid283_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid283_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w37_15_c0 :  std_logic;
signal bh7_w38_12_c0 :  std_logic;
signal bh7_w39_14_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid283_Out0_copy284_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid285_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid285_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid285_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w39_15_c0 :  std_logic;
signal bh7_w40_12_c0 :  std_logic;
signal bh7_w41_12_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid285_Out0_copy286_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid287_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid287_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid287_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w41_13_c0 :  std_logic;
signal bh7_w42_11_c0 :  std_logic;
signal bh7_w43_12_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid287_Out0_copy288_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid289_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid289_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid289_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w43_13_c0 :  std_logic;
signal bh7_w44_7_c0 :  std_logic;
signal bh7_w45_8_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid289_Out0_copy290_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid291_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid291_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid291_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w45_9_c0 :  std_logic;
signal bh7_w46_5_c0 :  std_logic;
signal bh7_w47_4_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid291_Out0_copy292_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid293_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid293_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid293_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w47_5_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid293_Out0_copy294_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid295_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid295_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid295_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w26_13_c0 :  std_logic;
signal bh7_w27_15_c0 :  std_logic;
signal bh7_w28_13_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid295_Out0_copy296_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid297_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid297_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid297_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w29_16_c0 :  std_logic;
signal bh7_w30_13_c0 :  std_logic;
signal bh7_w31_16_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid297_Out0_copy298_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid299_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid299_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid299_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w31_17_c0 :  std_logic;
signal bh7_w32_13_c0 :  std_logic;
signal bh7_w33_16_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid299_Out0_copy300_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid301_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid301_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid301_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w33_17_c0 :  std_logic;
signal bh7_w34_13_c0 :  std_logic;
signal bh7_w35_16_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid301_Out0_copy302_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid303_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid303_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid303_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w35_17_c0 :  std_logic;
signal bh7_w36_13_c0 :  std_logic;
signal bh7_w37_16_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid303_Out0_copy304_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid305_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid305_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid305_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w37_17_c0 :  std_logic;
signal bh7_w38_13_c0 :  std_logic;
signal bh7_w39_16_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid305_Out0_copy306_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid307_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid307_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid307_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w39_17_c0 :  std_logic;
signal bh7_w40_13_c0 :  std_logic;
signal bh7_w41_14_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid307_Out0_copy308_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid309_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid309_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid309_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w41_15_c0 :  std_logic;
signal bh7_w42_12_c0 :  std_logic;
signal bh7_w43_14_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid309_Out0_copy310_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid311_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid311_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid311_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w43_15_c0 :  std_logic;
signal bh7_w44_8_c0 :  std_logic;
signal bh7_w45_10_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid311_Out0_copy312_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid313_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid313_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid313_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w45_11_c0 :  std_logic;
signal bh7_w46_6_c0 :  std_logic;
signal bh7_w47_6_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid313_Out0_copy314_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid315_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid315_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid315_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w47_7_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid315_Out0_copy316_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid317_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid317_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid317_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w17_2_c0 :  std_logic;
signal bh7_w18_3_c0 :  std_logic;
signal bh7_w19_4_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid317_Out0_copy318_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid319_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid319_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid319_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w19_5_c0 :  std_logic;
signal bh7_w20_7_c0 :  std_logic;
signal bh7_w21_8_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid319_Out0_copy320_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid321_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid321_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid321_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w21_9_c0 :  std_logic;
signal bh7_w22_10_c0 :  std_logic;
signal bh7_w23_13_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid321_Out0_copy322_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid323_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid323_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid323_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w23_14_c0 :  std_logic;
signal bh7_w24_12_c0 :  std_logic;
signal bh7_w25_14_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid323_Out0_copy324_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid325_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid325_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid325_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w25_15_c0 :  std_logic;
signal bh7_w26_14_c0 :  std_logic;
signal bh7_w27_16_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid325_Out0_copy326_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid327_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid327_Out0_c0 :  std_logic_vector(1 downto 0);
signal bh7_w27_17_c0 :  std_logic;
signal bh7_w28_14_c0 :  std_logic;
signal Compressor_3_2_Freq200_uid160_bh7_uid327_Out0_copy328_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid329_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid329_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid329_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w28_15_c0 :  std_logic;
signal bh7_w29_17_c0 :  std_logic;
signal bh7_w30_14_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid329_Out0_copy330_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid331_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq200_uid160_bh7_uid331_Out0_c0 :  std_logic_vector(1 downto 0);
signal bh7_w30_15_c0 :  std_logic;
signal bh7_w31_18_c0 :  std_logic;
signal Compressor_3_2_Freq200_uid160_bh7_uid331_Out0_copy332_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid333_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid333_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid333_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w31_19_c0 :  std_logic;
signal bh7_w32_14_c0 :  std_logic;
signal bh7_w33_18_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid333_Out0_copy334_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid335_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid335_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid335_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w33_19_c0 :  std_logic;
signal bh7_w34_14_c0 :  std_logic;
signal bh7_w35_18_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid335_Out0_copy336_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid337_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid337_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid337_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w35_19_c0 :  std_logic;
signal bh7_w36_14_c0 :  std_logic;
signal bh7_w37_18_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid337_Out0_copy338_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid339_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid339_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid339_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w37_19_c0 :  std_logic;
signal bh7_w38_14_c0 :  std_logic;
signal bh7_w39_18_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid339_Out0_copy340_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid341_In0_c0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid341_In1_c0 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq200_uid156_bh7_uid341_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w39_19_c0 :  std_logic;
signal bh7_w40_14_c0 :  std_logic;
signal bh7_w41_16_c0 :  std_logic;
signal Compressor_23_3_Freq200_uid156_bh7_uid341_Out0_copy342_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid343_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid343_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid343_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w41_17_c0 :  std_logic;
signal bh7_w42_13_c0 :  std_logic;
signal bh7_w43_16_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid343_Out0_copy344_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid345_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid345_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid345_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w43_17_c0 :  std_logic;
signal bh7_w44_9_c0 :  std_logic;
signal bh7_w45_12_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid345_Out0_copy346_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid347_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid347_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid347_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w45_13_c0 :  std_logic;
signal bh7_w46_7_c0 :  std_logic;
signal bh7_w47_8_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid347_Out0_copy348_c0 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid349_In0_c0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid349_In1_c0 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq200_uid164_bh7_uid349_Out0_c0 :  std_logic_vector(2 downto 0);
signal bh7_w47_9_c0 :  std_logic;
signal Compressor_14_3_Freq200_uid164_bh7_uid349_Out0_copy350_c0 :  std_logic_vector(2 downto 0);
signal tmp_bitheapResult_bh7_18_c0, tmp_bitheapResult_bh7_18_c1 :  std_logic_vector(18 downto 0);
signal bitheapFinalAdd_bh7_In0_c0 :  std_logic_vector(29 downto 0);
signal bitheapFinalAdd_bh7_In1_c0 :  std_logic_vector(29 downto 0);
signal bitheapFinalAdd_bh7_Cin_c0 :  std_logic;
signal bitheapFinalAdd_bh7_Out_c1 :  std_logic_vector(29 downto 0);
signal bitheapResult_bh7_c1 :  std_logic_vector(47 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               tmp_bitheapResult_bh7_18_c1 <= tmp_bitheapResult_bh7_18_c0;
            end if;
         end if;
      end process;
   XX_m6_c0 <= X ;
   YY_m6_c0 <= Y ;
   tile_0_X_c0 <= X(16 downto 0);
   tile_0_Y_c0 <= Y(23 downto 0);
   tile_0_mult: DSPBlock_17x24_Freq200_uid9
      port map ( clk  => clk,
                 X => tile_0_X_c0,
                 Y => tile_0_Y_c0,
                 R => tile_0_output_c0);

   tile_0_filtered_output_c0 <= unsigned(tile_0_output_c0(40 downto 0));
   bh7_w0_0_c0 <= tile_0_filtered_output_c0(0);
   bh7_w1_0_c0 <= tile_0_filtered_output_c0(1);
   bh7_w2_0_c0 <= tile_0_filtered_output_c0(2);
   bh7_w3_0_c0 <= tile_0_filtered_output_c0(3);
   bh7_w4_0_c0 <= tile_0_filtered_output_c0(4);
   bh7_w5_0_c0 <= tile_0_filtered_output_c0(5);
   bh7_w6_0_c0 <= tile_0_filtered_output_c0(6);
   bh7_w7_0_c0 <= tile_0_filtered_output_c0(7);
   bh7_w8_0_c0 <= tile_0_filtered_output_c0(8);
   bh7_w9_0_c0 <= tile_0_filtered_output_c0(9);
   bh7_w10_0_c0 <= tile_0_filtered_output_c0(10);
   bh7_w11_0_c0 <= tile_0_filtered_output_c0(11);
   bh7_w12_0_c0 <= tile_0_filtered_output_c0(12);
   bh7_w13_0_c0 <= tile_0_filtered_output_c0(13);
   bh7_w14_0_c0 <= tile_0_filtered_output_c0(14);
   bh7_w15_0_c0 <= tile_0_filtered_output_c0(15);
   bh7_w16_0_c0 <= tile_0_filtered_output_c0(16);
   bh7_w17_0_c0 <= tile_0_filtered_output_c0(17);
   bh7_w18_0_c0 <= tile_0_filtered_output_c0(18);
   bh7_w19_0_c0 <= tile_0_filtered_output_c0(19);
   bh7_w20_0_c0 <= tile_0_filtered_output_c0(20);
   bh7_w21_0_c0 <= tile_0_filtered_output_c0(21);
   bh7_w22_0_c0 <= tile_0_filtered_output_c0(22);
   bh7_w23_0_c0 <= tile_0_filtered_output_c0(23);
   bh7_w24_0_c0 <= tile_0_filtered_output_c0(24);
   bh7_w25_0_c0 <= tile_0_filtered_output_c0(25);
   bh7_w26_0_c0 <= tile_0_filtered_output_c0(26);
   bh7_w27_0_c0 <= tile_0_filtered_output_c0(27);
   bh7_w28_0_c0 <= tile_0_filtered_output_c0(28);
   bh7_w29_0_c0 <= tile_0_filtered_output_c0(29);
   bh7_w30_0_c0 <= tile_0_filtered_output_c0(30);
   bh7_w31_0_c0 <= tile_0_filtered_output_c0(31);
   bh7_w32_0_c0 <= tile_0_filtered_output_c0(32);
   bh7_w33_0_c0 <= tile_0_filtered_output_c0(33);
   bh7_w34_0_c0 <= tile_0_filtered_output_c0(34);
   bh7_w35_0_c0 <= tile_0_filtered_output_c0(35);
   bh7_w36_0_c0 <= tile_0_filtered_output_c0(36);
   bh7_w37_0_c0 <= tile_0_filtered_output_c0(37);
   bh7_w38_0_c0 <= tile_0_filtered_output_c0(38);
   bh7_w39_0_c0 <= tile_0_filtered_output_c0(39);
   bh7_w40_0_c0 <= tile_0_filtered_output_c0(40);
   tile_1_X_c0 <= X(23 downto 23);
   tile_1_Y_c0 <= Y(23 downto 22);
   tile_1_mult: IntMultiplierLUT_1x2_Freq200_uid11
      port map ( clk  => clk,
                 X => tile_1_X_c0,
                 Y => tile_1_Y_c0,
                 R => tile_1_output_c0);

   tile_1_filtered_output_c0 <= unsigned(tile_1_output_c0(1 downto 0));
   bh7_w45_0_c0 <= tile_1_filtered_output_c0(0);
   bh7_w46_0_c0 <= tile_1_filtered_output_c0(1);
   tile_2_X_c0 <= X(22 downto 20);
   tile_2_Y_c0 <= Y(23 downto 22);
   tile_2_mult: IntMultiplierLUT_3x2_Freq200_uid13
      port map ( clk  => clk,
                 X => tile_2_X_c0,
                 Y => tile_2_Y_c0,
                 R => tile_2_output_c0);

   tile_2_filtered_output_c0 <= unsigned(tile_2_output_c0(4 downto 0));
   bh7_w42_0_c0 <= tile_2_filtered_output_c0(0);
   bh7_w43_0_c0 <= tile_2_filtered_output_c0(1);
   bh7_w44_0_c0 <= tile_2_filtered_output_c0(2);
   bh7_w45_1_c0 <= tile_2_filtered_output_c0(3);
   bh7_w46_1_c0 <= tile_2_filtered_output_c0(4);
   tile_3_X_c0 <= X(19 downto 17);
   tile_3_Y_c0 <= Y(23 downto 22);
   tile_3_mult: IntMultiplierLUT_3x2_Freq200_uid18
      port map ( clk  => clk,
                 X => tile_3_X_c0,
                 Y => tile_3_Y_c0,
                 R => tile_3_output_c0);

   tile_3_filtered_output_c0 <= unsigned(tile_3_output_c0(4 downto 0));
   bh7_w39_1_c0 <= tile_3_filtered_output_c0(0);
   bh7_w40_1_c0 <= tile_3_filtered_output_c0(1);
   bh7_w41_0_c0 <= tile_3_filtered_output_c0(2);
   bh7_w42_1_c0 <= tile_3_filtered_output_c0(3);
   bh7_w43_1_c0 <= tile_3_filtered_output_c0(4);
   tile_4_X_c0 <= X(23 downto 23);
   tile_4_Y_c0 <= Y(21 downto 20);
   tile_4_mult: IntMultiplierLUT_1x2_Freq200_uid23
      port map ( clk  => clk,
                 X => tile_4_X_c0,
                 Y => tile_4_Y_c0,
                 R => tile_4_output_c0);

   tile_4_filtered_output_c0 <= unsigned(tile_4_output_c0(1 downto 0));
   bh7_w43_2_c0 <= tile_4_filtered_output_c0(0);
   bh7_w44_1_c0 <= tile_4_filtered_output_c0(1);
   tile_5_X_c0 <= X(22 downto 20);
   tile_5_Y_c0 <= Y(21 downto 20);
   tile_5_mult: IntMultiplierLUT_3x2_Freq200_uid25
      port map ( clk  => clk,
                 X => tile_5_X_c0,
                 Y => tile_5_Y_c0,
                 R => tile_5_output_c0);

   tile_5_filtered_output_c0 <= unsigned(tile_5_output_c0(4 downto 0));
   bh7_w40_2_c0 <= tile_5_filtered_output_c0(0);
   bh7_w41_1_c0 <= tile_5_filtered_output_c0(1);
   bh7_w42_2_c0 <= tile_5_filtered_output_c0(2);
   bh7_w43_3_c0 <= tile_5_filtered_output_c0(3);
   bh7_w44_2_c0 <= tile_5_filtered_output_c0(4);
   tile_6_X_c0 <= X(19 downto 17);
   tile_6_Y_c0 <= Y(21 downto 20);
   tile_6_mult: IntMultiplierLUT_3x2_Freq200_uid30
      port map ( clk  => clk,
                 X => tile_6_X_c0,
                 Y => tile_6_Y_c0,
                 R => tile_6_output_c0);

   tile_6_filtered_output_c0 <= unsigned(tile_6_output_c0(4 downto 0));
   bh7_w37_1_c0 <= tile_6_filtered_output_c0(0);
   bh7_w38_1_c0 <= tile_6_filtered_output_c0(1);
   bh7_w39_2_c0 <= tile_6_filtered_output_c0(2);
   bh7_w40_3_c0 <= tile_6_filtered_output_c0(3);
   bh7_w41_2_c0 <= tile_6_filtered_output_c0(4);
   tile_7_X_c0 <= X(23 downto 23);
   tile_7_Y_c0 <= Y(19 downto 18);
   tile_7_mult: IntMultiplierLUT_1x2_Freq200_uid35
      port map ( clk  => clk,
                 X => tile_7_X_c0,
                 Y => tile_7_Y_c0,
                 R => tile_7_output_c0);

   tile_7_filtered_output_c0 <= unsigned(tile_7_output_c0(1 downto 0));
   bh7_w41_3_c0 <= tile_7_filtered_output_c0(0);
   bh7_w42_3_c0 <= tile_7_filtered_output_c0(1);
   tile_8_X_c0 <= X(22 downto 20);
   tile_8_Y_c0 <= Y(19 downto 18);
   tile_8_mult: IntMultiplierLUT_3x2_Freq200_uid37
      port map ( clk  => clk,
                 X => tile_8_X_c0,
                 Y => tile_8_Y_c0,
                 R => tile_8_output_c0);

   tile_8_filtered_output_c0 <= unsigned(tile_8_output_c0(4 downto 0));
   bh7_w38_2_c0 <= tile_8_filtered_output_c0(0);
   bh7_w39_3_c0 <= tile_8_filtered_output_c0(1);
   bh7_w40_4_c0 <= tile_8_filtered_output_c0(2);
   bh7_w41_4_c0 <= tile_8_filtered_output_c0(3);
   bh7_w42_4_c0 <= tile_8_filtered_output_c0(4);
   tile_9_X_c0 <= X(19 downto 17);
   tile_9_Y_c0 <= Y(19 downto 18);
   tile_9_mult: IntMultiplierLUT_3x2_Freq200_uid42
      port map ( clk  => clk,
                 X => tile_9_X_c0,
                 Y => tile_9_Y_c0,
                 R => tile_9_output_c0);

   tile_9_filtered_output_c0 <= unsigned(tile_9_output_c0(4 downto 0));
   bh7_w35_1_c0 <= tile_9_filtered_output_c0(0);
   bh7_w36_1_c0 <= tile_9_filtered_output_c0(1);
   bh7_w37_2_c0 <= tile_9_filtered_output_c0(2);
   bh7_w38_3_c0 <= tile_9_filtered_output_c0(3);
   bh7_w39_4_c0 <= tile_9_filtered_output_c0(4);
   tile_10_X_c0 <= X(23 downto 23);
   tile_10_Y_c0 <= Y(17 downto 16);
   tile_10_mult: IntMultiplierLUT_1x2_Freq200_uid47
      port map ( clk  => clk,
                 X => tile_10_X_c0,
                 Y => tile_10_Y_c0,
                 R => tile_10_output_c0);

   tile_10_filtered_output_c0 <= unsigned(tile_10_output_c0(1 downto 0));
   bh7_w39_5_c0 <= tile_10_filtered_output_c0(0);
   bh7_w40_5_c0 <= tile_10_filtered_output_c0(1);
   tile_11_X_c0 <= X(22 downto 20);
   tile_11_Y_c0 <= Y(17 downto 16);
   tile_11_mult: IntMultiplierLUT_3x2_Freq200_uid49
      port map ( clk  => clk,
                 X => tile_11_X_c0,
                 Y => tile_11_Y_c0,
                 R => tile_11_output_c0);

   tile_11_filtered_output_c0 <= unsigned(tile_11_output_c0(4 downto 0));
   bh7_w36_2_c0 <= tile_11_filtered_output_c0(0);
   bh7_w37_3_c0 <= tile_11_filtered_output_c0(1);
   bh7_w38_4_c0 <= tile_11_filtered_output_c0(2);
   bh7_w39_6_c0 <= tile_11_filtered_output_c0(3);
   bh7_w40_6_c0 <= tile_11_filtered_output_c0(4);
   tile_12_X_c0 <= X(19 downto 17);
   tile_12_Y_c0 <= Y(17 downto 16);
   tile_12_mult: IntMultiplierLUT_3x2_Freq200_uid54
      port map ( clk  => clk,
                 X => tile_12_X_c0,
                 Y => tile_12_Y_c0,
                 R => tile_12_output_c0);

   tile_12_filtered_output_c0 <= unsigned(tile_12_output_c0(4 downto 0));
   bh7_w33_1_c0 <= tile_12_filtered_output_c0(0);
   bh7_w34_1_c0 <= tile_12_filtered_output_c0(1);
   bh7_w35_2_c0 <= tile_12_filtered_output_c0(2);
   bh7_w36_3_c0 <= tile_12_filtered_output_c0(3);
   bh7_w37_4_c0 <= tile_12_filtered_output_c0(4);
   tile_13_X_c0 <= X(23 downto 23);
   tile_13_Y_c0 <= Y(15 downto 14);
   tile_13_mult: IntMultiplierLUT_1x2_Freq200_uid59
      port map ( clk  => clk,
                 X => tile_13_X_c0,
                 Y => tile_13_Y_c0,
                 R => tile_13_output_c0);

   tile_13_filtered_output_c0 <= unsigned(tile_13_output_c0(1 downto 0));
   bh7_w37_5_c0 <= tile_13_filtered_output_c0(0);
   bh7_w38_5_c0 <= tile_13_filtered_output_c0(1);
   tile_14_X_c0 <= X(22 downto 20);
   tile_14_Y_c0 <= Y(15 downto 14);
   tile_14_mult: IntMultiplierLUT_3x2_Freq200_uid61
      port map ( clk  => clk,
                 X => tile_14_X_c0,
                 Y => tile_14_Y_c0,
                 R => tile_14_output_c0);

   tile_14_filtered_output_c0 <= unsigned(tile_14_output_c0(4 downto 0));
   bh7_w34_2_c0 <= tile_14_filtered_output_c0(0);
   bh7_w35_3_c0 <= tile_14_filtered_output_c0(1);
   bh7_w36_4_c0 <= tile_14_filtered_output_c0(2);
   bh7_w37_6_c0 <= tile_14_filtered_output_c0(3);
   bh7_w38_6_c0 <= tile_14_filtered_output_c0(4);
   tile_15_X_c0 <= X(19 downto 17);
   tile_15_Y_c0 <= Y(15 downto 14);
   tile_15_mult: IntMultiplierLUT_3x2_Freq200_uid66
      port map ( clk  => clk,
                 X => tile_15_X_c0,
                 Y => tile_15_Y_c0,
                 R => tile_15_output_c0);

   tile_15_filtered_output_c0 <= unsigned(tile_15_output_c0(4 downto 0));
   bh7_w31_1_c0 <= tile_15_filtered_output_c0(0);
   bh7_w32_1_c0 <= tile_15_filtered_output_c0(1);
   bh7_w33_2_c0 <= tile_15_filtered_output_c0(2);
   bh7_w34_3_c0 <= tile_15_filtered_output_c0(3);
   bh7_w35_4_c0 <= tile_15_filtered_output_c0(4);
   tile_16_X_c0 <= X(23 downto 23);
   tile_16_Y_c0 <= Y(13 downto 12);
   tile_16_mult: IntMultiplierLUT_1x2_Freq200_uid71
      port map ( clk  => clk,
                 X => tile_16_X_c0,
                 Y => tile_16_Y_c0,
                 R => tile_16_output_c0);

   tile_16_filtered_output_c0 <= unsigned(tile_16_output_c0(1 downto 0));
   bh7_w35_5_c0 <= tile_16_filtered_output_c0(0);
   bh7_w36_5_c0 <= tile_16_filtered_output_c0(1);
   tile_17_X_c0 <= X(22 downto 20);
   tile_17_Y_c0 <= Y(13 downto 12);
   tile_17_mult: IntMultiplierLUT_3x2_Freq200_uid73
      port map ( clk  => clk,
                 X => tile_17_X_c0,
                 Y => tile_17_Y_c0,
                 R => tile_17_output_c0);

   tile_17_filtered_output_c0 <= unsigned(tile_17_output_c0(4 downto 0));
   bh7_w32_2_c0 <= tile_17_filtered_output_c0(0);
   bh7_w33_3_c0 <= tile_17_filtered_output_c0(1);
   bh7_w34_4_c0 <= tile_17_filtered_output_c0(2);
   bh7_w35_6_c0 <= tile_17_filtered_output_c0(3);
   bh7_w36_6_c0 <= tile_17_filtered_output_c0(4);
   tile_18_X_c0 <= X(19 downto 17);
   tile_18_Y_c0 <= Y(13 downto 12);
   tile_18_mult: IntMultiplierLUT_3x2_Freq200_uid78
      port map ( clk  => clk,
                 X => tile_18_X_c0,
                 Y => tile_18_Y_c0,
                 R => tile_18_output_c0);

   tile_18_filtered_output_c0 <= unsigned(tile_18_output_c0(4 downto 0));
   bh7_w29_1_c0 <= tile_18_filtered_output_c0(0);
   bh7_w30_1_c0 <= tile_18_filtered_output_c0(1);
   bh7_w31_2_c0 <= tile_18_filtered_output_c0(2);
   bh7_w32_3_c0 <= tile_18_filtered_output_c0(3);
   bh7_w33_4_c0 <= tile_18_filtered_output_c0(4);
   tile_19_X_c0 <= X(23 downto 23);
   tile_19_Y_c0 <= Y(11 downto 10);
   tile_19_mult: IntMultiplierLUT_1x2_Freq200_uid83
      port map ( clk  => clk,
                 X => tile_19_X_c0,
                 Y => tile_19_Y_c0,
                 R => tile_19_output_c0);

   tile_19_filtered_output_c0 <= unsigned(tile_19_output_c0(1 downto 0));
   bh7_w33_5_c0 <= tile_19_filtered_output_c0(0);
   bh7_w34_5_c0 <= tile_19_filtered_output_c0(1);
   tile_20_X_c0 <= X(22 downto 20);
   tile_20_Y_c0 <= Y(11 downto 10);
   tile_20_mult: IntMultiplierLUT_3x2_Freq200_uid85
      port map ( clk  => clk,
                 X => tile_20_X_c0,
                 Y => tile_20_Y_c0,
                 R => tile_20_output_c0);

   tile_20_filtered_output_c0 <= unsigned(tile_20_output_c0(4 downto 0));
   bh7_w30_2_c0 <= tile_20_filtered_output_c0(0);
   bh7_w31_3_c0 <= tile_20_filtered_output_c0(1);
   bh7_w32_4_c0 <= tile_20_filtered_output_c0(2);
   bh7_w33_6_c0 <= tile_20_filtered_output_c0(3);
   bh7_w34_6_c0 <= tile_20_filtered_output_c0(4);
   tile_21_X_c0 <= X(19 downto 17);
   tile_21_Y_c0 <= Y(11 downto 10);
   tile_21_mult: IntMultiplierLUT_3x2_Freq200_uid90
      port map ( clk  => clk,
                 X => tile_21_X_c0,
                 Y => tile_21_Y_c0,
                 R => tile_21_output_c0);

   tile_21_filtered_output_c0 <= unsigned(tile_21_output_c0(4 downto 0));
   bh7_w27_1_c0 <= tile_21_filtered_output_c0(0);
   bh7_w28_1_c0 <= tile_21_filtered_output_c0(1);
   bh7_w29_2_c0 <= tile_21_filtered_output_c0(2);
   bh7_w30_3_c0 <= tile_21_filtered_output_c0(3);
   bh7_w31_4_c0 <= tile_21_filtered_output_c0(4);
   tile_22_X_c0 <= X(23 downto 23);
   tile_22_Y_c0 <= Y(9 downto 8);
   tile_22_mult: IntMultiplierLUT_1x2_Freq200_uid95
      port map ( clk  => clk,
                 X => tile_22_X_c0,
                 Y => tile_22_Y_c0,
                 R => tile_22_output_c0);

   tile_22_filtered_output_c0 <= unsigned(tile_22_output_c0(1 downto 0));
   bh7_w31_5_c0 <= tile_22_filtered_output_c0(0);
   bh7_w32_5_c0 <= tile_22_filtered_output_c0(1);
   tile_23_X_c0 <= X(22 downto 20);
   tile_23_Y_c0 <= Y(9 downto 8);
   tile_23_mult: IntMultiplierLUT_3x2_Freq200_uid97
      port map ( clk  => clk,
                 X => tile_23_X_c0,
                 Y => tile_23_Y_c0,
                 R => tile_23_output_c0);

   tile_23_filtered_output_c0 <= unsigned(tile_23_output_c0(4 downto 0));
   bh7_w28_2_c0 <= tile_23_filtered_output_c0(0);
   bh7_w29_3_c0 <= tile_23_filtered_output_c0(1);
   bh7_w30_4_c0 <= tile_23_filtered_output_c0(2);
   bh7_w31_6_c0 <= tile_23_filtered_output_c0(3);
   bh7_w32_6_c0 <= tile_23_filtered_output_c0(4);
   tile_24_X_c0 <= X(19 downto 17);
   tile_24_Y_c0 <= Y(9 downto 8);
   tile_24_mult: IntMultiplierLUT_3x2_Freq200_uid102
      port map ( clk  => clk,
                 X => tile_24_X_c0,
                 Y => tile_24_Y_c0,
                 R => tile_24_output_c0);

   tile_24_filtered_output_c0 <= unsigned(tile_24_output_c0(4 downto 0));
   bh7_w25_1_c0 <= tile_24_filtered_output_c0(0);
   bh7_w26_1_c0 <= tile_24_filtered_output_c0(1);
   bh7_w27_2_c0 <= tile_24_filtered_output_c0(2);
   bh7_w28_3_c0 <= tile_24_filtered_output_c0(3);
   bh7_w29_4_c0 <= tile_24_filtered_output_c0(4);
   tile_25_X_c0 <= X(23 downto 23);
   tile_25_Y_c0 <= Y(7 downto 6);
   tile_25_mult: IntMultiplierLUT_1x2_Freq200_uid107
      port map ( clk  => clk,
                 X => tile_25_X_c0,
                 Y => tile_25_Y_c0,
                 R => tile_25_output_c0);

   tile_25_filtered_output_c0 <= unsigned(tile_25_output_c0(1 downto 0));
   bh7_w29_5_c0 <= tile_25_filtered_output_c0(0);
   bh7_w30_5_c0 <= tile_25_filtered_output_c0(1);
   tile_26_X_c0 <= X(22 downto 20);
   tile_26_Y_c0 <= Y(7 downto 6);
   tile_26_mult: IntMultiplierLUT_3x2_Freq200_uid109
      port map ( clk  => clk,
                 X => tile_26_X_c0,
                 Y => tile_26_Y_c0,
                 R => tile_26_output_c0);

   tile_26_filtered_output_c0 <= unsigned(tile_26_output_c0(4 downto 0));
   bh7_w26_2_c0 <= tile_26_filtered_output_c0(0);
   bh7_w27_3_c0 <= tile_26_filtered_output_c0(1);
   bh7_w28_4_c0 <= tile_26_filtered_output_c0(2);
   bh7_w29_6_c0 <= tile_26_filtered_output_c0(3);
   bh7_w30_6_c0 <= tile_26_filtered_output_c0(4);
   tile_27_X_c0 <= X(19 downto 17);
   tile_27_Y_c0 <= Y(7 downto 6);
   tile_27_mult: IntMultiplierLUT_3x2_Freq200_uid114
      port map ( clk  => clk,
                 X => tile_27_X_c0,
                 Y => tile_27_Y_c0,
                 R => tile_27_output_c0);

   tile_27_filtered_output_c0 <= unsigned(tile_27_output_c0(4 downto 0));
   bh7_w23_1_c0 <= tile_27_filtered_output_c0(0);
   bh7_w24_1_c0 <= tile_27_filtered_output_c0(1);
   bh7_w25_2_c0 <= tile_27_filtered_output_c0(2);
   bh7_w26_3_c0 <= tile_27_filtered_output_c0(3);
   bh7_w27_4_c0 <= tile_27_filtered_output_c0(4);
   tile_28_X_c0 <= X(23 downto 23);
   tile_28_Y_c0 <= Y(5 downto 4);
   tile_28_mult: IntMultiplierLUT_1x2_Freq200_uid119
      port map ( clk  => clk,
                 X => tile_28_X_c0,
                 Y => tile_28_Y_c0,
                 R => tile_28_output_c0);

   tile_28_filtered_output_c0 <= unsigned(tile_28_output_c0(1 downto 0));
   bh7_w27_5_c0 <= tile_28_filtered_output_c0(0);
   bh7_w28_5_c0 <= tile_28_filtered_output_c0(1);
   tile_29_X_c0 <= X(22 downto 20);
   tile_29_Y_c0 <= Y(5 downto 4);
   tile_29_mult: IntMultiplierLUT_3x2_Freq200_uid121
      port map ( clk  => clk,
                 X => tile_29_X_c0,
                 Y => tile_29_Y_c0,
                 R => tile_29_output_c0);

   tile_29_filtered_output_c0 <= unsigned(tile_29_output_c0(4 downto 0));
   bh7_w24_2_c0 <= tile_29_filtered_output_c0(0);
   bh7_w25_3_c0 <= tile_29_filtered_output_c0(1);
   bh7_w26_4_c0 <= tile_29_filtered_output_c0(2);
   bh7_w27_6_c0 <= tile_29_filtered_output_c0(3);
   bh7_w28_6_c0 <= tile_29_filtered_output_c0(4);
   tile_30_X_c0 <= X(19 downto 17);
   tile_30_Y_c0 <= Y(5 downto 4);
   tile_30_mult: IntMultiplierLUT_3x2_Freq200_uid126
      port map ( clk  => clk,
                 X => tile_30_X_c0,
                 Y => tile_30_Y_c0,
                 R => tile_30_output_c0);

   tile_30_filtered_output_c0 <= unsigned(tile_30_output_c0(4 downto 0));
   bh7_w21_1_c0 <= tile_30_filtered_output_c0(0);
   bh7_w22_1_c0 <= tile_30_filtered_output_c0(1);
   bh7_w23_2_c0 <= tile_30_filtered_output_c0(2);
   bh7_w24_3_c0 <= tile_30_filtered_output_c0(3);
   bh7_w25_4_c0 <= tile_30_filtered_output_c0(4);
   tile_31_X_c0 <= X(23 downto 23);
   tile_31_Y_c0 <= Y(3 downto 2);
   tile_31_mult: IntMultiplierLUT_1x2_Freq200_uid131
      port map ( clk  => clk,
                 X => tile_31_X_c0,
                 Y => tile_31_Y_c0,
                 R => tile_31_output_c0);

   tile_31_filtered_output_c0 <= unsigned(tile_31_output_c0(1 downto 0));
   bh7_w25_5_c0 <= tile_31_filtered_output_c0(0);
   bh7_w26_5_c0 <= tile_31_filtered_output_c0(1);
   tile_32_X_c0 <= X(22 downto 20);
   tile_32_Y_c0 <= Y(3 downto 2);
   tile_32_mult: IntMultiplierLUT_3x2_Freq200_uid133
      port map ( clk  => clk,
                 X => tile_32_X_c0,
                 Y => tile_32_Y_c0,
                 R => tile_32_output_c0);

   tile_32_filtered_output_c0 <= unsigned(tile_32_output_c0(4 downto 0));
   bh7_w22_2_c0 <= tile_32_filtered_output_c0(0);
   bh7_w23_3_c0 <= tile_32_filtered_output_c0(1);
   bh7_w24_4_c0 <= tile_32_filtered_output_c0(2);
   bh7_w25_6_c0 <= tile_32_filtered_output_c0(3);
   bh7_w26_6_c0 <= tile_32_filtered_output_c0(4);
   tile_33_X_c0 <= X(19 downto 17);
   tile_33_Y_c0 <= Y(3 downto 2);
   tile_33_mult: IntMultiplierLUT_3x2_Freq200_uid138
      port map ( clk  => clk,
                 X => tile_33_X_c0,
                 Y => tile_33_Y_c0,
                 R => tile_33_output_c0);

   tile_33_filtered_output_c0 <= unsigned(tile_33_output_c0(4 downto 0));
   bh7_w19_1_c0 <= tile_33_filtered_output_c0(0);
   bh7_w20_1_c0 <= tile_33_filtered_output_c0(1);
   bh7_w21_2_c0 <= tile_33_filtered_output_c0(2);
   bh7_w22_3_c0 <= tile_33_filtered_output_c0(3);
   bh7_w23_4_c0 <= tile_33_filtered_output_c0(4);
   tile_34_X_c0 <= X(23 downto 23);
   tile_34_Y_c0 <= Y(1 downto 0);
   tile_34_mult: IntMultiplierLUT_1x2_Freq200_uid143
      port map ( clk  => clk,
                 X => tile_34_X_c0,
                 Y => tile_34_Y_c0,
                 R => tile_34_output_c0);

   tile_34_filtered_output_c0 <= unsigned(tile_34_output_c0(1 downto 0));
   bh7_w23_5_c0 <= tile_34_filtered_output_c0(0);
   bh7_w24_5_c0 <= tile_34_filtered_output_c0(1);
   tile_35_X_c0 <= X(22 downto 20);
   tile_35_Y_c0 <= Y(1 downto 0);
   tile_35_mult: IntMultiplierLUT_3x2_Freq200_uid145
      port map ( clk  => clk,
                 X => tile_35_X_c0,
                 Y => tile_35_Y_c0,
                 R => tile_35_output_c0);

   tile_35_filtered_output_c0 <= unsigned(tile_35_output_c0(4 downto 0));
   bh7_w20_2_c0 <= tile_35_filtered_output_c0(0);
   bh7_w21_3_c0 <= tile_35_filtered_output_c0(1);
   bh7_w22_4_c0 <= tile_35_filtered_output_c0(2);
   bh7_w23_6_c0 <= tile_35_filtered_output_c0(3);
   bh7_w24_6_c0 <= tile_35_filtered_output_c0(4);
   tile_36_X_c0 <= X(19 downto 17);
   tile_36_Y_c0 <= Y(1 downto 0);
   tile_36_mult: IntMultiplierLUT_3x2_Freq200_uid150
      port map ( clk  => clk,
                 X => tile_36_X_c0,
                 Y => tile_36_Y_c0,
                 R => tile_36_output_c0);

   tile_36_filtered_output_c0 <= unsigned(tile_36_output_c0(4 downto 0));
   bh7_w17_1_c0 <= tile_36_filtered_output_c0(0);
   bh7_w18_1_c0 <= tile_36_filtered_output_c0(1);
   bh7_w19_2_c0 <= tile_36_filtered_output_c0(2);
   bh7_w20_3_c0 <= tile_36_filtered_output_c0(3);
   bh7_w21_4_c0 <= tile_36_filtered_output_c0(4);

   -- Adding the constant bits 
      -- All the constant bits are zero, nothing to add


   Compressor_23_3_Freq200_uid156_bh7_uid157_In0_c0 <= "" & bh7_w18_1_c0 & "0" & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid157_In1_c0 <= "" & bh7_w19_1_c0 & bh7_w19_2_c0;
   bh7_w18_2_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid157_Out0_c0(0);
   bh7_w19_3_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid157_Out0_c0(1);
   bh7_w20_4_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid157_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid157: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid157_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid157_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid157_Out0_copy158_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid157_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid157_Out0_copy158_c0; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq200_uid160_bh7_uid161_In0_c0 <= "" & bh7_w20_1_c0 & bh7_w20_2_c0 & bh7_w20_3_c0;
   bh7_w20_5_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid161_Out0_c0(0);
   bh7_w21_5_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid161_Out0_c0(1);
   Compressor_3_2_Freq200_uid160_uid161: Compressor_3_2_Freq200_uid160
      port map ( X0 => Compressor_3_2_Freq200_uid160_bh7_uid161_In0_c0,
                 R => Compressor_3_2_Freq200_uid160_bh7_uid161_Out0_copy162_c0);
   Compressor_3_2_Freq200_uid160_bh7_uid161_Out0_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid161_Out0_copy162_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid165_In0_c0 <= "" & bh7_w21_1_c0 & bh7_w21_2_c0 & bh7_w21_3_c0 & bh7_w21_4_c0;
   Compressor_14_3_Freq200_uid164_bh7_uid165_In1_c0 <= "" & bh7_w22_1_c0;
   bh7_w21_6_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid165_Out0_c0(0);
   bh7_w22_5_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid165_Out0_c0(1);
   bh7_w23_7_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid165_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid165: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid165_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid165_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid165_Out0_copy166_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid165_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid165_Out0_copy166_c0; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq200_uid160_bh7_uid167_In0_c0 <= "" & bh7_w22_2_c0 & bh7_w22_3_c0 & bh7_w22_4_c0;
   bh7_w22_6_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid167_Out0_c0(0);
   bh7_w23_8_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid167_Out0_c0(1);
   Compressor_3_2_Freq200_uid160_uid167: Compressor_3_2_Freq200_uid160
      port map ( X0 => Compressor_3_2_Freq200_uid160_bh7_uid167_In0_c0,
                 R => Compressor_3_2_Freq200_uid160_bh7_uid167_Out0_copy168_c0);
   Compressor_3_2_Freq200_uid160_bh7_uid167_Out0_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid167_Out0_copy168_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid171_In0_c0 <= "" & bh7_w23_1_c0 & bh7_w23_2_c0 & bh7_w23_3_c0 & bh7_w23_4_c0 & bh7_w23_5_c0 & bh7_w23_6_c0;
   bh7_w23_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid171_Out0_c0(0);
   bh7_w24_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid171_Out0_c0(1);
   bh7_w25_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid171_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid171: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid171_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid171_Out0_copy172_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid171_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid171_Out0_copy172_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid173_In0_c0 <= "" & bh7_w24_1_c0 & bh7_w24_2_c0 & bh7_w24_3_c0 & bh7_w24_4_c0 & bh7_w24_5_c0 & bh7_w24_6_c0;
   bh7_w24_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid173_Out0_c0(0);
   bh7_w25_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid173_Out0_c0(1);
   bh7_w26_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid173_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid173: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid173_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid173_Out0_copy174_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid173_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid173_Out0_copy174_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid175_In0_c0 <= "" & bh7_w25_1_c0 & bh7_w25_2_c0 & bh7_w25_3_c0 & bh7_w25_4_c0 & bh7_w25_5_c0 & bh7_w25_6_c0;
   bh7_w25_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid175_Out0_c0(0);
   bh7_w26_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid175_Out0_c0(1);
   bh7_w27_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid175_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid175: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid175_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid175_Out0_copy176_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid175_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid175_Out0_copy176_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid177_In0_c0 <= "" & bh7_w26_1_c0 & bh7_w26_2_c0 & bh7_w26_3_c0 & bh7_w26_4_c0 & bh7_w26_5_c0 & bh7_w26_6_c0;
   bh7_w26_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid177_Out0_c0(0);
   bh7_w27_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid177_Out0_c0(1);
   bh7_w28_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid177_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid177: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid177_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid177_Out0_copy178_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid177_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid177_Out0_copy178_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid179_In0_c0 <= "" & bh7_w27_1_c0 & bh7_w27_2_c0 & bh7_w27_3_c0 & bh7_w27_4_c0 & bh7_w27_5_c0 & bh7_w27_6_c0;
   bh7_w27_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid179_Out0_c0(0);
   bh7_w28_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid179_Out0_c0(1);
   bh7_w29_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid179_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid179: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid179_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid179_Out0_copy180_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid179_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid179_Out0_copy180_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid181_In0_c0 <= "" & bh7_w28_1_c0 & bh7_w28_2_c0 & bh7_w28_3_c0 & bh7_w28_4_c0 & bh7_w28_5_c0 & bh7_w28_6_c0;
   bh7_w28_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid181_Out0_c0(0);
   bh7_w29_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid181_Out0_c0(1);
   bh7_w30_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid181_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid181: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid181_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid181_Out0_copy182_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid181_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid181_Out0_copy182_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid183_In0_c0 <= "" & bh7_w29_1_c0 & bh7_w29_2_c0 & bh7_w29_3_c0 & bh7_w29_4_c0 & bh7_w29_5_c0 & bh7_w29_6_c0;
   bh7_w29_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid183_Out0_c0(0);
   bh7_w30_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid183_Out0_c0(1);
   bh7_w31_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid183_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid183: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid183_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid183_Out0_copy184_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid183_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid183_Out0_copy184_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid185_In0_c0 <= "" & bh7_w30_1_c0 & bh7_w30_2_c0 & bh7_w30_3_c0 & bh7_w30_4_c0 & bh7_w30_5_c0 & bh7_w30_6_c0;
   bh7_w30_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid185_Out0_c0(0);
   bh7_w31_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid185_Out0_c0(1);
   bh7_w32_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid185_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid185: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid185_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid185_Out0_copy186_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid185_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid185_Out0_copy186_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid187_In0_c0 <= "" & bh7_w31_1_c0 & bh7_w31_2_c0 & bh7_w31_3_c0 & bh7_w31_4_c0 & bh7_w31_5_c0 & bh7_w31_6_c0;
   bh7_w31_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid187_Out0_c0(0);
   bh7_w32_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid187_Out0_c0(1);
   bh7_w33_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid187_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid187: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid187_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid187_Out0_copy188_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid187_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid187_Out0_copy188_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid189_In0_c0 <= "" & bh7_w32_1_c0 & bh7_w32_2_c0 & bh7_w32_3_c0 & bh7_w32_4_c0 & bh7_w32_5_c0 & bh7_w32_6_c0;
   bh7_w32_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid189_Out0_c0(0);
   bh7_w33_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid189_Out0_c0(1);
   bh7_w34_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid189_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid189: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid189_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid189_Out0_copy190_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid189_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid189_Out0_copy190_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid191_In0_c0 <= "" & bh7_w33_1_c0 & bh7_w33_2_c0 & bh7_w33_3_c0 & bh7_w33_4_c0 & bh7_w33_5_c0 & bh7_w33_6_c0;
   bh7_w33_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid191_Out0_c0(0);
   bh7_w34_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid191_Out0_c0(1);
   bh7_w35_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid191_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid191: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid191_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid191_Out0_copy192_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid191_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid191_Out0_copy192_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid193_In0_c0 <= "" & bh7_w34_1_c0 & bh7_w34_2_c0 & bh7_w34_3_c0 & bh7_w34_4_c0 & bh7_w34_5_c0 & bh7_w34_6_c0;
   bh7_w34_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid193_Out0_c0(0);
   bh7_w35_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid193_Out0_c0(1);
   bh7_w36_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid193_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid193: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid193_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid193_Out0_copy194_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid193_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid193_Out0_copy194_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid195_In0_c0 <= "" & bh7_w35_1_c0 & bh7_w35_2_c0 & bh7_w35_3_c0 & bh7_w35_4_c0 & bh7_w35_5_c0 & bh7_w35_6_c0;
   bh7_w35_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid195_Out0_c0(0);
   bh7_w36_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid195_Out0_c0(1);
   bh7_w37_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid195_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid195: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid195_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid195_Out0_copy196_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid195_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid195_Out0_copy196_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid197_In0_c0 <= "" & bh7_w36_1_c0 & bh7_w36_2_c0 & bh7_w36_3_c0 & bh7_w36_4_c0 & bh7_w36_5_c0 & bh7_w36_6_c0;
   bh7_w36_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid197_Out0_c0(0);
   bh7_w37_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid197_Out0_c0(1);
   bh7_w38_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid197_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid197: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid197_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid197_Out0_copy198_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid197_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid197_Out0_copy198_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid199_In0_c0 <= "" & bh7_w37_1_c0 & bh7_w37_2_c0 & bh7_w37_3_c0 & bh7_w37_4_c0 & bh7_w37_5_c0 & bh7_w37_6_c0;
   bh7_w37_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid199_Out0_c0(0);
   bh7_w38_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid199_Out0_c0(1);
   bh7_w39_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid199_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid199: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid199_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid199_Out0_copy200_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid199_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid199_Out0_copy200_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid201_In0_c0 <= "" & bh7_w38_1_c0 & bh7_w38_2_c0 & bh7_w38_3_c0 & bh7_w38_4_c0 & bh7_w38_5_c0 & bh7_w38_6_c0;
   bh7_w38_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid201_Out0_c0(0);
   bh7_w39_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid201_Out0_c0(1);
   bh7_w40_7_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid201_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid201: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid201_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid201_Out0_copy202_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid201_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid201_Out0_copy202_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid203_In0_c0 <= "" & bh7_w39_1_c0 & bh7_w39_2_c0 & bh7_w39_3_c0 & bh7_w39_4_c0 & bh7_w39_5_c0 & bh7_w39_6_c0;
   bh7_w39_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid203_Out0_c0(0);
   bh7_w40_8_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid203_Out0_c0(1);
   bh7_w41_5_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid203_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid203: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid203_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid203_Out0_copy204_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid203_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid203_Out0_copy204_c0; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq200_uid170_bh7_uid205_In0_c0 <= "" & bh7_w40_1_c0 & bh7_w40_2_c0 & bh7_w40_3_c0 & bh7_w40_4_c0 & bh7_w40_5_c0 & bh7_w40_6_c0;
   bh7_w40_9_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid205_Out0_c0(0);
   bh7_w41_6_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid205_Out0_c0(1);
   bh7_w42_5_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid205_Out0_c0(2);
   Compressor_6_3_Freq200_uid170_uid205: Compressor_6_3_Freq200_uid170
      port map ( X0 => Compressor_6_3_Freq200_uid170_bh7_uid205_In0_c0,
                 R => Compressor_6_3_Freq200_uid170_bh7_uid205_Out0_copy206_c0);
   Compressor_6_3_Freq200_uid170_bh7_uid205_Out0_c0 <= Compressor_6_3_Freq200_uid170_bh7_uid205_Out0_copy206_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid207_In0_c0 <= "" & bh7_w41_0_c0 & bh7_w41_1_c0 & bh7_w41_2_c0 & bh7_w41_3_c0;
   Compressor_14_3_Freq200_uid164_bh7_uid207_In1_c0 <= "" & bh7_w42_0_c0;
   bh7_w41_7_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid207_Out0_c0(0);
   bh7_w42_6_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid207_Out0_c0(1);
   bh7_w43_4_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid207_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid207: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid207_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid207_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid207_Out0_copy208_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid207_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid207_Out0_copy208_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid209_In0_c0 <= "" & bh7_w42_1_c0 & bh7_w42_2_c0 & bh7_w42_3_c0 & bh7_w42_4_c0;
   Compressor_14_3_Freq200_uid164_bh7_uid209_In1_c0 <= "" & bh7_w43_0_c0;
   bh7_w42_7_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid209_Out0_c0(0);
   bh7_w43_5_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid209_Out0_c0(1);
   bh7_w44_3_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid209_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid209: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid209_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid209_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid209_Out0_copy210_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid209_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid209_Out0_copy210_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid211_In0_c0 <= "" & bh7_w43_1_c0 & bh7_w43_2_c0 & bh7_w43_3_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid211_In1_c0 <= "" & bh7_w44_0_c0 & bh7_w44_1_c0;
   bh7_w43_6_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid211_Out0_c0(0);
   bh7_w44_4_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid211_Out0_c0(1);
   bh7_w45_2_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid211_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid211: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid211_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid211_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid211_Out0_copy212_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid211_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid211_Out0_copy212_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid213_In0_c0 <= "" & bh7_w45_0_c0 & bh7_w45_1_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid213_In1_c0 <= "" & bh7_w46_0_c0 & bh7_w46_1_c0;
   bh7_w45_3_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid213_Out0_c0(0);
   bh7_w46_2_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid213_Out0_c0(1);
   bh7_w47_0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid213_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid213: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid213_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid213_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid213_Out0_copy214_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid213_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid213_Out0_copy214_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid215_In0_c0 <= "" & bh7_w20_5_c0 & bh7_w20_4_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid215_In1_c0 <= "" & bh7_w21_6_c0 & bh7_w21_5_c0;
   bh7_w20_6_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid215_Out0_c0(0);
   bh7_w21_7_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid215_Out0_c0(1);
   bh7_w22_7_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid215_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid215: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid215_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid215_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid215_Out0_copy216_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid215_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid215_Out0_copy216_c0; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq200_uid160_bh7_uid217_In0_c0 <= "" & bh7_w22_6_c0 & bh7_w22_5_c0 & "0";
   bh7_w22_8_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid217_Out0_c0(0);
   bh7_w23_10_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid217_Out0_c0(1);
   Compressor_3_2_Freq200_uid160_uid217: Compressor_3_2_Freq200_uid160
      port map ( X0 => Compressor_3_2_Freq200_uid160_bh7_uid217_In0_c0,
                 R => Compressor_3_2_Freq200_uid160_bh7_uid217_Out0_copy218_c0);
   Compressor_3_2_Freq200_uid160_bh7_uid217_Out0_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid217_Out0_copy218_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid219_In0_c0 <= "" & bh7_w23_8_c0 & bh7_w23_7_c0 & bh7_w23_9_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid219_In1_c0 <= "" & bh7_w24_8_c0 & bh7_w24_7_c0;
   bh7_w23_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid219_Out0_c0(0);
   bh7_w24_9_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid219_Out0_c0(1);
   bh7_w25_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid219_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid219: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid219_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid219_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid219_Out0_copy220_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid219_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid219_Out0_copy220_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid221_In0_c0 <= "" & bh7_w25_9_c0 & bh7_w25_8_c0 & bh7_w25_7_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid221_In1_c0 <= "" & bh7_w26_9_c0 & bh7_w26_8_c0;
   bh7_w25_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid221_Out0_c0(0);
   bh7_w26_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid221_Out0_c0(1);
   bh7_w27_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid221_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid221: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid221_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid221_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid221_Out0_copy222_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid221_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid221_Out0_copy222_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid223_In0_c0 <= "" & bh7_w27_9_c0 & bh7_w27_8_c0 & bh7_w27_7_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid223_In1_c0 <= "" & bh7_w28_9_c0 & bh7_w28_8_c0;
   bh7_w27_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid223_Out0_c0(0);
   bh7_w28_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid223_Out0_c0(1);
   bh7_w29_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid223_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid223: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid223_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid223_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid223_Out0_copy224_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid223_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid223_Out0_copy224_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid225_In0_c0 <= "" & bh7_w29_9_c0 & bh7_w29_8_c0 & bh7_w29_7_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid225_In1_c0 <= "" & bh7_w30_9_c0 & bh7_w30_8_c0;
   bh7_w29_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid225_Out0_c0(0);
   bh7_w30_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid225_Out0_c0(1);
   bh7_w31_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid225_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid225: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid225_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid225_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid225_Out0_copy226_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid225_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid225_Out0_copy226_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid227_In0_c0 <= "" & bh7_w31_9_c0 & bh7_w31_8_c0 & bh7_w31_7_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid227_In1_c0 <= "" & bh7_w32_9_c0 & bh7_w32_8_c0;
   bh7_w31_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid227_Out0_c0(0);
   bh7_w32_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid227_Out0_c0(1);
   bh7_w33_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid227_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid227: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid227_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid227_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid227_Out0_copy228_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid227_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid227_Out0_copy228_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid229_In0_c0 <= "" & bh7_w33_9_c0 & bh7_w33_8_c0 & bh7_w33_7_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid229_In1_c0 <= "" & bh7_w34_9_c0 & bh7_w34_8_c0;
   bh7_w33_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid229_Out0_c0(0);
   bh7_w34_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid229_Out0_c0(1);
   bh7_w35_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid229_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid229: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid229_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid229_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid229_Out0_copy230_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid229_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid229_Out0_copy230_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid231_In0_c0 <= "" & bh7_w35_9_c0 & bh7_w35_8_c0 & bh7_w35_7_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid231_In1_c0 <= "" & bh7_w36_9_c0 & bh7_w36_8_c0;
   bh7_w35_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid231_Out0_c0(0);
   bh7_w36_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid231_Out0_c0(1);
   bh7_w37_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid231_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid231: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid231_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid231_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid231_Out0_copy232_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid231_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid231_Out0_copy232_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid233_In0_c0 <= "" & bh7_w37_9_c0 & bh7_w37_8_c0 & bh7_w37_7_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid233_In1_c0 <= "" & bh7_w38_9_c0 & bh7_w38_8_c0;
   bh7_w37_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid233_Out0_c0(0);
   bh7_w38_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid233_Out0_c0(1);
   bh7_w39_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid233_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid233: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid233_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid233_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid233_Out0_copy234_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid233_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid233_Out0_copy234_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid235_In0_c0 <= "" & bh7_w39_9_c0 & bh7_w39_8_c0 & bh7_w39_7_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid235_In1_c0 <= "" & bh7_w40_9_c0 & bh7_w40_8_c0;
   bh7_w39_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid235_Out0_c0(0);
   bh7_w40_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid235_Out0_c0(1);
   bh7_w41_8_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid235_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid235: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid235_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid235_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid235_Out0_copy236_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid235_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid235_Out0_copy236_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid237_In0_c0 <= "" & bh7_w41_4_c0 & bh7_w41_7_c0 & bh7_w41_6_c0 & bh7_w41_5_c0;
   Compressor_14_3_Freq200_uid164_bh7_uid237_In1_c0 <= "" & "0";
   bh7_w41_9_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid237_Out0_c0(0);
   bh7_w42_8_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid237_Out0_c0(1);
   bh7_w43_7_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid237_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid237: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid237_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid237_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid237_Out0_copy238_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid237_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid237_Out0_copy238_c0; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq200_uid160_bh7_uid239_In0_c0 <= "" & bh7_w42_7_c0 & bh7_w42_6_c0 & bh7_w42_5_c0;
   bh7_w42_9_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid239_Out0_c0(0);
   bh7_w43_8_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid239_Out0_c0(1);
   Compressor_3_2_Freq200_uid160_uid239: Compressor_3_2_Freq200_uid160
      port map ( X0 => Compressor_3_2_Freq200_uid160_bh7_uid239_In0_c0,
                 R => Compressor_3_2_Freq200_uid160_bh7_uid239_Out0_copy240_c0);
   Compressor_3_2_Freq200_uid160_bh7_uid239_Out0_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid239_Out0_copy240_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid241_In0_c0 <= "" & bh7_w43_6_c0 & bh7_w43_5_c0 & bh7_w43_4_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid241_In1_c0 <= "" & bh7_w44_2_c0 & bh7_w44_4_c0;
   bh7_w43_9_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid241_Out0_c0(0);
   bh7_w44_5_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid241_Out0_c0(1);
   bh7_w45_4_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid241_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid241: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid241_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid241_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid241_Out0_copy242_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid241_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid241_Out0_copy242_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid243_In0_c0 <= "" & bh7_w45_3_c0 & bh7_w45_2_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid243_In1_c0 <= "" & bh7_w46_2_c0;
   bh7_w45_5_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid243_Out0_c0(0);
   bh7_w46_3_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid243_Out0_c0(1);
   bh7_w47_1_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid243_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid243: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid243_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid243_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid243_Out0_copy244_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid243_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid243_Out0_copy244_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid245_In0_c0 <= "" & bh7_w22_8_c0 & bh7_w22_7_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid245_In1_c0 <= "" & bh7_w23_10_c0 & bh7_w23_11_c0;
   bh7_w22_9_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid245_Out0_c0(0);
   bh7_w23_12_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid245_Out0_c0(1);
   bh7_w24_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid245_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid245: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid245_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid245_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid245_Out0_copy246_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid245_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid245_Out0_copy246_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid247_In0_c0 <= "" & bh7_w25_11_c0 & bh7_w25_10_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid247_In1_c0 <= "" & bh7_w26_7_c0 & bh7_w26_10_c0;
   bh7_w25_12_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid247_Out0_c0(0);
   bh7_w26_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid247_Out0_c0(1);
   bh7_w27_12_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid247_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid247: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid247_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid247_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid247_Out0_copy248_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid247_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid247_Out0_copy248_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid249_In0_c0 <= "" & bh7_w27_11_c0 & bh7_w27_10_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid249_In1_c0 <= "" & bh7_w28_7_c0 & bh7_w28_10_c0;
   bh7_w27_13_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid249_Out0_c0(0);
   bh7_w28_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid249_Out0_c0(1);
   bh7_w29_12_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid249_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid249: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid249_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid249_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid249_Out0_copy250_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid249_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid249_Out0_copy250_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid251_In0_c0 <= "" & bh7_w29_11_c0 & bh7_w29_10_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid251_In1_c0 <= "" & bh7_w30_7_c0 & bh7_w30_10_c0;
   bh7_w29_13_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid251_Out0_c0(0);
   bh7_w30_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid251_Out0_c0(1);
   bh7_w31_12_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid251_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid251: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid251_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid251_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid251_Out0_copy252_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid251_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid251_Out0_copy252_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid253_In0_c0 <= "" & bh7_w31_11_c0 & bh7_w31_10_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid253_In1_c0 <= "" & bh7_w32_7_c0 & bh7_w32_10_c0;
   bh7_w31_13_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid253_Out0_c0(0);
   bh7_w32_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid253_Out0_c0(1);
   bh7_w33_12_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid253_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid253: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid253_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid253_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid253_Out0_copy254_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid253_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid253_Out0_copy254_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid255_In0_c0 <= "" & bh7_w33_11_c0 & bh7_w33_10_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid255_In1_c0 <= "" & bh7_w34_7_c0 & bh7_w34_10_c0;
   bh7_w33_13_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid255_Out0_c0(0);
   bh7_w34_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid255_Out0_c0(1);
   bh7_w35_12_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid255_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid255: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid255_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid255_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid255_Out0_copy256_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid255_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid255_Out0_copy256_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid257_In0_c0 <= "" & bh7_w35_11_c0 & bh7_w35_10_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid257_In1_c0 <= "" & bh7_w36_7_c0 & bh7_w36_10_c0;
   bh7_w35_13_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid257_Out0_c0(0);
   bh7_w36_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid257_Out0_c0(1);
   bh7_w37_12_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid257_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid257: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid257_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid257_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid257_Out0_copy258_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid257_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid257_Out0_copy258_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid259_In0_c0 <= "" & bh7_w37_11_c0 & bh7_w37_10_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid259_In1_c0 <= "" & bh7_w38_7_c0 & bh7_w38_10_c0;
   bh7_w37_13_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid259_Out0_c0(0);
   bh7_w38_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid259_Out0_c0(1);
   bh7_w39_12_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid259_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid259: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid259_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid259_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid259_Out0_copy260_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid259_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid259_Out0_copy260_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid261_In0_c0 <= "" & bh7_w39_11_c0 & bh7_w39_10_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid261_In1_c0 <= "" & bh7_w40_7_c0 & bh7_w40_10_c0;
   bh7_w39_13_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid261_Out0_c0(0);
   bh7_w40_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid261_Out0_c0(1);
   bh7_w41_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid261_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid261: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid261_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid261_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid261_Out0_copy262_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid261_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid261_Out0_copy262_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid263_In0_c0 <= "" & bh7_w41_9_c0 & bh7_w41_8_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid263_In1_c0 <= "" & bh7_w42_8_c0 & bh7_w42_9_c0;
   bh7_w41_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid263_Out0_c0(0);
   bh7_w42_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid263_Out0_c0(1);
   bh7_w43_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid263_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid263: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid263_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid263_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid263_Out0_copy264_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid263_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid263_Out0_copy264_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid265_In0_c0 <= "" & bh7_w43_7_c0 & bh7_w43_9_c0 & bh7_w43_8_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid265_In1_c0 <= "" & bh7_w44_3_c0 & bh7_w44_5_c0;
   bh7_w43_11_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid265_Out0_c0(0);
   bh7_w44_6_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid265_Out0_c0(1);
   bh7_w45_6_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid265_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid265: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid265_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid265_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid265_Out0_copy266_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid265_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid265_Out0_copy266_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid267_In0_c0 <= "" & bh7_w45_5_c0 & bh7_w45_4_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid267_In1_c0 <= "" & bh7_w46_3_c0;
   bh7_w45_7_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid267_Out0_c0(0);
   bh7_w46_4_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid267_Out0_c0(1);
   bh7_w47_2_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid267_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid267: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid267_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid267_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid267_Out0_copy268_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid267_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid267_Out0_copy268_c0; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq200_uid160_bh7_uid269_In0_c0 <= "" & bh7_w47_0_c0 & bh7_w47_1_c0 & "0";
   bh7_w47_3_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid269_Out0_c0(0);
   Compressor_3_2_Freq200_uid160_uid269: Compressor_3_2_Freq200_uid160
      port map ( X0 => Compressor_3_2_Freq200_uid160_bh7_uid269_In0_c0,
                 R => Compressor_3_2_Freq200_uid160_bh7_uid269_Out0_copy270_c0);
   Compressor_3_2_Freq200_uid160_bh7_uid269_Out0_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid269_Out0_copy270_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid271_In0_c0 <= "" & bh7_w24_9_c0 & bh7_w24_10_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid271_In1_c0 <= "" & bh7_w25_12_c0;
   bh7_w24_11_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid271_Out0_c0(0);
   bh7_w25_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid271_Out0_c0(1);
   bh7_w26_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid271_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid271: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid271_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid271_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid271_Out0_copy272_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid271_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid271_Out0_copy272_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid273_In0_c0 <= "" & bh7_w27_13_c0 & bh7_w27_12_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid273_In1_c0 <= "" & bh7_w28_11_c0;
   bh7_w27_14_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid273_Out0_c0(0);
   bh7_w28_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid273_Out0_c0(1);
   bh7_w29_14_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid273_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid273: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid273_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid273_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid273_Out0_copy274_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid273_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid273_Out0_copy274_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid275_In0_c0 <= "" & bh7_w29_13_c0 & bh7_w29_12_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid275_In1_c0 <= "" & bh7_w30_11_c0;
   bh7_w29_15_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid275_Out0_c0(0);
   bh7_w30_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid275_Out0_c0(1);
   bh7_w31_14_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid275_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid275: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid275_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid275_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid275_Out0_copy276_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid275_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid275_Out0_copy276_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid277_In0_c0 <= "" & bh7_w31_13_c0 & bh7_w31_12_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid277_In1_c0 <= "" & bh7_w32_11_c0;
   bh7_w31_15_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid277_Out0_c0(0);
   bh7_w32_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid277_Out0_c0(1);
   bh7_w33_14_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid277_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid277: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid277_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid277_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid277_Out0_copy278_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid277_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid277_Out0_copy278_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid279_In0_c0 <= "" & bh7_w33_13_c0 & bh7_w33_12_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid279_In1_c0 <= "" & bh7_w34_11_c0;
   bh7_w33_15_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid279_Out0_c0(0);
   bh7_w34_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid279_Out0_c0(1);
   bh7_w35_14_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid279_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid279: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid279_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid279_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid279_Out0_copy280_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid279_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid279_Out0_copy280_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid281_In0_c0 <= "" & bh7_w35_13_c0 & bh7_w35_12_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid281_In1_c0 <= "" & bh7_w36_11_c0;
   bh7_w35_15_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid281_Out0_c0(0);
   bh7_w36_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid281_Out0_c0(1);
   bh7_w37_14_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid281_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid281: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid281_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid281_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid281_Out0_copy282_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid281_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid281_Out0_copy282_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid283_In0_c0 <= "" & bh7_w37_13_c0 & bh7_w37_12_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid283_In1_c0 <= "" & bh7_w38_11_c0;
   bh7_w37_15_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid283_Out0_c0(0);
   bh7_w38_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid283_Out0_c0(1);
   bh7_w39_14_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid283_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid283: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid283_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid283_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid283_Out0_copy284_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid283_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid283_Out0_copy284_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid285_In0_c0 <= "" & bh7_w39_13_c0 & bh7_w39_12_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid285_In1_c0 <= "" & bh7_w40_11_c0;
   bh7_w39_15_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid285_Out0_c0(0);
   bh7_w40_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid285_Out0_c0(1);
   bh7_w41_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid285_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid285: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid285_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid285_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid285_Out0_copy286_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid285_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid285_Out0_copy286_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid287_In0_c0 <= "" & bh7_w41_11_c0 & bh7_w41_10_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid287_In1_c0 <= "" & bh7_w42_10_c0;
   bh7_w41_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid287_Out0_c0(0);
   bh7_w42_11_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid287_Out0_c0(1);
   bh7_w43_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid287_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid287: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid287_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid287_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid287_Out0_copy288_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid287_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid287_Out0_copy288_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid289_In0_c0 <= "" & bh7_w43_10_c0 & bh7_w43_11_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid289_In1_c0 <= "" & bh7_w44_6_c0;
   bh7_w43_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid289_Out0_c0(0);
   bh7_w44_7_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid289_Out0_c0(1);
   bh7_w45_8_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid289_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid289: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid289_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid289_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid289_Out0_copy290_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid289_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid289_Out0_copy290_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid291_In0_c0 <= "" & bh7_w45_6_c0 & bh7_w45_7_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid291_In1_c0 <= "" & bh7_w46_4_c0;
   bh7_w45_9_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid291_Out0_c0(0);
   bh7_w46_5_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid291_Out0_c0(1);
   bh7_w47_4_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid291_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid291: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid291_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid291_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid291_Out0_copy292_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid291_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid291_Out0_copy292_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid293_In0_c0 <= "" & bh7_w47_3_c0 & bh7_w47_2_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid293_In1_c0 <= "" & "0";
   bh7_w47_5_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid293_Out0_c0(0);
   Compressor_14_3_Freq200_uid164_uid293: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid293_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid293_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid293_Out0_copy294_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid293_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid293_Out0_copy294_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid295_In0_c0 <= "" & bh7_w26_11_c0 & bh7_w26_12_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid295_In1_c0 <= "" & bh7_w27_14_c0;
   bh7_w26_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid295_Out0_c0(0);
   bh7_w27_15_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid295_Out0_c0(1);
   bh7_w28_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid295_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid295: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid295_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid295_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid295_Out0_copy296_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid295_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid295_Out0_copy296_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid297_In0_c0 <= "" & bh7_w29_15_c0 & bh7_w29_14_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid297_In1_c0 <= "" & bh7_w30_12_c0;
   bh7_w29_16_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid297_Out0_c0(0);
   bh7_w30_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid297_Out0_c0(1);
   bh7_w31_16_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid297_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid297: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid297_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid297_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid297_Out0_copy298_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid297_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid297_Out0_copy298_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid299_In0_c0 <= "" & bh7_w31_15_c0 & bh7_w31_14_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid299_In1_c0 <= "" & bh7_w32_12_c0;
   bh7_w31_17_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid299_Out0_c0(0);
   bh7_w32_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid299_Out0_c0(1);
   bh7_w33_16_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid299_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid299: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid299_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid299_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid299_Out0_copy300_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid299_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid299_Out0_copy300_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid301_In0_c0 <= "" & bh7_w33_15_c0 & bh7_w33_14_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid301_In1_c0 <= "" & bh7_w34_12_c0;
   bh7_w33_17_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid301_Out0_c0(0);
   bh7_w34_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid301_Out0_c0(1);
   bh7_w35_16_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid301_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid301: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid301_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid301_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid301_Out0_copy302_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid301_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid301_Out0_copy302_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid303_In0_c0 <= "" & bh7_w35_15_c0 & bh7_w35_14_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid303_In1_c0 <= "" & bh7_w36_12_c0;
   bh7_w35_17_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid303_Out0_c0(0);
   bh7_w36_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid303_Out0_c0(1);
   bh7_w37_16_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid303_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid303: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid303_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid303_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid303_Out0_copy304_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid303_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid303_Out0_copy304_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid305_In0_c0 <= "" & bh7_w37_15_c0 & bh7_w37_14_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid305_In1_c0 <= "" & bh7_w38_12_c0;
   bh7_w37_17_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid305_Out0_c0(0);
   bh7_w38_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid305_Out0_c0(1);
   bh7_w39_16_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid305_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid305: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid305_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid305_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid305_Out0_copy306_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid305_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid305_Out0_copy306_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid307_In0_c0 <= "" & bh7_w39_15_c0 & bh7_w39_14_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid307_In1_c0 <= "" & bh7_w40_12_c0;
   bh7_w39_17_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid307_Out0_c0(0);
   bh7_w40_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid307_Out0_c0(1);
   bh7_w41_14_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid307_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid307: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid307_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid307_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid307_Out0_copy308_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid307_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid307_Out0_copy308_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid309_In0_c0 <= "" & bh7_w41_13_c0 & bh7_w41_12_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid309_In1_c0 <= "" & bh7_w42_11_c0;
   bh7_w41_15_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid309_Out0_c0(0);
   bh7_w42_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid309_Out0_c0(1);
   bh7_w43_14_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid309_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid309: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid309_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid309_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid309_Out0_copy310_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid309_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid309_Out0_copy310_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid311_In0_c0 <= "" & bh7_w43_12_c0 & bh7_w43_13_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid311_In1_c0 <= "" & bh7_w44_7_c0;
   bh7_w43_15_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid311_Out0_c0(0);
   bh7_w44_8_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid311_Out0_c0(1);
   bh7_w45_10_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid311_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid311: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid311_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid311_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid311_Out0_copy312_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid311_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid311_Out0_copy312_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid313_In0_c0 <= "" & bh7_w45_8_c0 & bh7_w45_9_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid313_In1_c0 <= "" & bh7_w46_5_c0;
   bh7_w45_11_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid313_Out0_c0(0);
   bh7_w46_6_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid313_Out0_c0(1);
   bh7_w47_6_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid313_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid313: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid313_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid313_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid313_Out0_copy314_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid313_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid313_Out0_copy314_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid315_In0_c0 <= "" & bh7_w47_4_c0 & bh7_w47_5_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid315_In1_c0 <= "" & "0";
   bh7_w47_7_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid315_Out0_c0(0);
   Compressor_14_3_Freq200_uid164_uid315: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid315_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid315_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid315_Out0_copy316_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid315_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid315_Out0_copy316_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid317_In0_c0 <= "" & bh7_w17_1_c0 & bh7_w17_0_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid317_In1_c0 <= "" & bh7_w18_2_c0 & bh7_w18_0_c0;
   bh7_w17_2_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid317_Out0_c0(0);
   bh7_w18_3_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid317_Out0_c0(1);
   bh7_w19_4_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid317_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid317: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid317_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid317_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid317_Out0_copy318_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid317_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid317_Out0_copy318_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid319_In0_c0 <= "" & bh7_w19_3_c0 & bh7_w19_0_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid319_In1_c0 <= "" & bh7_w20_6_c0 & bh7_w20_0_c0;
   bh7_w19_5_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid319_Out0_c0(0);
   bh7_w20_7_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid319_Out0_c0(1);
   bh7_w21_8_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid319_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid319: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid319_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid319_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid319_Out0_copy320_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid319_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid319_Out0_copy320_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid321_In0_c0 <= "" & bh7_w21_7_c0 & bh7_w21_0_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid321_In1_c0 <= "" & bh7_w22_9_c0 & bh7_w22_0_c0;
   bh7_w21_9_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid321_Out0_c0(0);
   bh7_w22_10_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid321_Out0_c0(1);
   bh7_w23_13_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid321_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid321: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid321_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid321_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid321_Out0_copy322_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid321_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid321_Out0_copy322_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid323_In0_c0 <= "" & bh7_w23_12_c0 & bh7_w23_0_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid323_In1_c0 <= "" & bh7_w24_11_c0 & bh7_w24_0_c0;
   bh7_w23_14_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid323_Out0_c0(0);
   bh7_w24_12_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid323_Out0_c0(1);
   bh7_w25_14_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid323_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid323: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid323_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid323_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid323_Out0_copy324_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid323_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid323_Out0_copy324_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid325_In0_c0 <= "" & bh7_w25_13_c0 & bh7_w25_0_c0 & "0";
   Compressor_23_3_Freq200_uid156_bh7_uid325_In1_c0 <= "" & bh7_w26_0_c0 & bh7_w26_13_c0;
   bh7_w25_15_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid325_Out0_c0(0);
   bh7_w26_14_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid325_Out0_c0(1);
   bh7_w27_16_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid325_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid325: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid325_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid325_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid325_Out0_copy326_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid325_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid325_Out0_copy326_c0; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq200_uid160_bh7_uid327_In0_c0 <= "" & bh7_w27_0_c0 & bh7_w27_15_c0 & "0";
   bh7_w27_17_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid327_Out0_c0(0);
   bh7_w28_14_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid327_Out0_c0(1);
   Compressor_3_2_Freq200_uid160_uid327: Compressor_3_2_Freq200_uid160
      port map ( X0 => Compressor_3_2_Freq200_uid160_bh7_uid327_In0_c0,
                 R => Compressor_3_2_Freq200_uid160_bh7_uid327_Out0_copy328_c0);
   Compressor_3_2_Freq200_uid160_bh7_uid327_Out0_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid327_Out0_copy328_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid329_In0_c0 <= "" & bh7_w28_12_c0 & bh7_w28_0_c0 & bh7_w28_13_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid329_In1_c0 <= "" & bh7_w29_0_c0 & bh7_w29_16_c0;
   bh7_w28_15_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid329_Out0_c0(0);
   bh7_w29_17_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid329_Out0_c0(1);
   bh7_w30_14_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid329_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid329: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid329_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid329_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid329_Out0_copy330_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid329_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid329_Out0_copy330_c0; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq200_uid160_bh7_uid331_In0_c0 <= "" & bh7_w30_0_c0 & bh7_w30_13_c0 & "0";
   bh7_w30_15_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid331_Out0_c0(0);
   bh7_w31_18_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid331_Out0_c0(1);
   Compressor_3_2_Freq200_uid160_uid331: Compressor_3_2_Freq200_uid160
      port map ( X0 => Compressor_3_2_Freq200_uid160_bh7_uid331_In0_c0,
                 R => Compressor_3_2_Freq200_uid160_bh7_uid331_Out0_copy332_c0);
   Compressor_3_2_Freq200_uid160_bh7_uid331_Out0_c0 <= Compressor_3_2_Freq200_uid160_bh7_uid331_Out0_copy332_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid333_In0_c0 <= "" & bh7_w31_0_c0 & bh7_w31_17_c0 & bh7_w31_16_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid333_In1_c0 <= "" & bh7_w32_0_c0 & bh7_w32_13_c0;
   bh7_w31_19_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid333_Out0_c0(0);
   bh7_w32_14_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid333_Out0_c0(1);
   bh7_w33_18_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid333_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid333: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid333_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid333_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid333_Out0_copy334_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid333_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid333_Out0_copy334_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid335_In0_c0 <= "" & bh7_w33_0_c0 & bh7_w33_17_c0 & bh7_w33_16_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid335_In1_c0 <= "" & bh7_w34_0_c0 & bh7_w34_13_c0;
   bh7_w33_19_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid335_Out0_c0(0);
   bh7_w34_14_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid335_Out0_c0(1);
   bh7_w35_18_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid335_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid335: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid335_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid335_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid335_Out0_copy336_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid335_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid335_Out0_copy336_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid337_In0_c0 <= "" & bh7_w35_0_c0 & bh7_w35_17_c0 & bh7_w35_16_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid337_In1_c0 <= "" & bh7_w36_0_c0 & bh7_w36_13_c0;
   bh7_w35_19_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid337_Out0_c0(0);
   bh7_w36_14_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid337_Out0_c0(1);
   bh7_w37_18_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid337_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid337: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid337_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid337_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid337_Out0_copy338_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid337_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid337_Out0_copy338_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid339_In0_c0 <= "" & bh7_w37_0_c0 & bh7_w37_17_c0 & bh7_w37_16_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid339_In1_c0 <= "" & bh7_w38_0_c0 & bh7_w38_13_c0;
   bh7_w37_19_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid339_Out0_c0(0);
   bh7_w38_14_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid339_Out0_c0(1);
   bh7_w39_18_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid339_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid339: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid339_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid339_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid339_Out0_copy340_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid339_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid339_Out0_copy340_c0; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq200_uid156_bh7_uid341_In0_c0 <= "" & bh7_w39_0_c0 & bh7_w39_17_c0 & bh7_w39_16_c0;
   Compressor_23_3_Freq200_uid156_bh7_uid341_In1_c0 <= "" & bh7_w40_0_c0 & bh7_w40_13_c0;
   bh7_w39_19_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid341_Out0_c0(0);
   bh7_w40_14_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid341_Out0_c0(1);
   bh7_w41_16_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid341_Out0_c0(2);
   Compressor_23_3_Freq200_uid156_uid341: Compressor_23_3_Freq200_uid156
      port map ( X0 => Compressor_23_3_Freq200_uid156_bh7_uid341_In0_c0,
                 X1 => Compressor_23_3_Freq200_uid156_bh7_uid341_In1_c0,
                 R => Compressor_23_3_Freq200_uid156_bh7_uid341_Out0_copy342_c0);
   Compressor_23_3_Freq200_uid156_bh7_uid341_Out0_c0 <= Compressor_23_3_Freq200_uid156_bh7_uid341_Out0_copy342_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid343_In0_c0 <= "" & bh7_w41_15_c0 & bh7_w41_14_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid343_In1_c0 <= "" & bh7_w42_12_c0;
   bh7_w41_17_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid343_Out0_c0(0);
   bh7_w42_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid343_Out0_c0(1);
   bh7_w43_16_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid343_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid343: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid343_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid343_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid343_Out0_copy344_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid343_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid343_Out0_copy344_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid345_In0_c0 <= "" & bh7_w43_14_c0 & bh7_w43_15_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid345_In1_c0 <= "" & bh7_w44_8_c0;
   bh7_w43_17_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid345_Out0_c0(0);
   bh7_w44_9_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid345_Out0_c0(1);
   bh7_w45_12_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid345_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid345: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid345_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid345_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid345_Out0_copy346_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid345_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid345_Out0_copy346_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid347_In0_c0 <= "" & bh7_w45_10_c0 & bh7_w45_11_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid347_In1_c0 <= "" & bh7_w46_6_c0;
   bh7_w45_13_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid347_Out0_c0(0);
   bh7_w46_7_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid347_Out0_c0(1);
   bh7_w47_8_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid347_Out0_c0(2);
   Compressor_14_3_Freq200_uid164_uid347: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid347_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid347_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid347_Out0_copy348_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid347_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid347_Out0_copy348_c0; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq200_uid164_bh7_uid349_In0_c0 <= "" & bh7_w47_6_c0 & bh7_w47_7_c0 & "0" & "0";
   Compressor_14_3_Freq200_uid164_bh7_uid349_In1_c0 <= "" & "0";
   bh7_w47_9_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid349_Out0_c0(0);
   Compressor_14_3_Freq200_uid164_uid349: Compressor_14_3_Freq200_uid164
      port map ( X0 => Compressor_14_3_Freq200_uid164_bh7_uid349_In0_c0,
                 X1 => Compressor_14_3_Freq200_uid164_bh7_uid349_In1_c0,
                 R => Compressor_14_3_Freq200_uid164_bh7_uid349_Out0_copy350_c0);
   Compressor_14_3_Freq200_uid164_bh7_uid349_Out0_c0 <= Compressor_14_3_Freq200_uid164_bh7_uid349_Out0_copy350_c0; -- output copy to hold a pipeline register if needed

   tmp_bitheapResult_bh7_18_c0 <= bh7_w18_3_c0 & bh7_w17_2_c0 & bh7_w16_0_c0 & bh7_w15_0_c0 & bh7_w14_0_c0 & bh7_w13_0_c0 & bh7_w12_0_c0 & bh7_w11_0_c0 & bh7_w10_0_c0 & bh7_w9_0_c0 & bh7_w8_0_c0 & bh7_w7_0_c0 & bh7_w6_0_c0 & bh7_w5_0_c0 & bh7_w4_0_c0 & bh7_w3_0_c0 & bh7_w2_0_c0 & bh7_w1_0_c0 & bh7_w0_0_c0;

   bitheapFinalAdd_bh7_In0_c0 <= "0" & bh7_w47_8_c0 & bh7_w46_7_c0 & bh7_w45_12_c0 & bh7_w44_9_c0 & bh7_w43_16_c0 & bh7_w42_13_c0 & bh7_w41_17_c0 & bh7_w40_14_c0 & bh7_w39_19_c0 & bh7_w38_14_c0 & bh7_w37_19_c0 & bh7_w36_14_c0 & bh7_w35_19_c0 & bh7_w34_14_c0 & bh7_w33_19_c0 & bh7_w32_14_c0 & bh7_w31_19_c0 & bh7_w30_15_c0 & bh7_w29_17_c0 & bh7_w28_15_c0 & bh7_w27_17_c0 & bh7_w26_14_c0 & bh7_w25_14_c0 & bh7_w24_12_c0 & bh7_w23_14_c0 & bh7_w22_10_c0 & bh7_w21_9_c0 & bh7_w20_7_c0 & bh7_w19_5_c0;
   bitheapFinalAdd_bh7_In1_c0 <= "0" & bh7_w47_9_c0 & "0" & bh7_w45_13_c0 & "0" & bh7_w43_17_c0 & "0" & bh7_w41_16_c0 & "0" & bh7_w39_18_c0 & "0" & bh7_w37_18_c0 & "0" & bh7_w35_18_c0 & "0" & bh7_w33_18_c0 & "0" & bh7_w31_18_c0 & bh7_w30_14_c0 & "0" & bh7_w28_14_c0 & bh7_w27_16_c0 & "0" & bh7_w25_15_c0 & "0" & bh7_w23_13_c0 & "0" & bh7_w21_8_c0 & "0" & bh7_w19_4_c0;
   bitheapFinalAdd_bh7_Cin_c0 <= '0';

   bitheapFinalAdd_bh7: IntAdder_30_Freq200_uid352
      port map ( clk  => clk,
                 ce_1 => ce_1,
                 Cin => bitheapFinalAdd_bh7_Cin_c0,
                 X => bitheapFinalAdd_bh7_In0_c0,
                 Y => bitheapFinalAdd_bh7_In1_c0,
                 R => bitheapFinalAdd_bh7_Out_c1);
   bitheapResult_bh7_c1 <= bitheapFinalAdd_bh7_Out_c1(28 downto 0) & tmp_bitheapResult_bh7_18_c1;
   R <= bitheapResult_bh7_c1(47 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_33_Freq200_uid355
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_33_Freq200_uid355 is
    port (clk, ce_1 : in std_logic;
          X : in  std_logic_vector(32 downto 0);
          Y : in  std_logic_vector(32 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(32 downto 0)   );
end entity;

architecture arch of IntAdder_33_Freq200_uid355 is
signal Rtmp_c1 :  std_logic_vector(32 downto 0);
signal Y_c1 :  std_logic_vector(32 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               Y_c1 <= Y;
            end if;
         end if;
      end process;
   Rtmp_c1 <= X + Y_c1 + Cin;
   R <= Rtmp_c1;
end architecture;

--------------------------------------------------------------------------------
--                          FloatingPointMultiplier
--                      (FPMult_8_23_uid2_Freq200_uid3)
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin 2008-2021
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FloatingPointMultiplier is
    port (clk, ce_1 : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          Y : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FloatingPointMultiplier is
   component IntMultiplier_24x24_48_Freq200_uid5 is
      port ( clk, ce_1 : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             Y : in  std_logic_vector(23 downto 0);
             R : out  std_logic_vector(47 downto 0)   );
   end component;

   component IntAdder_33_Freq200_uid355 is
      port ( clk, ce_1 : in std_logic;
             X : in  std_logic_vector(32 downto 0);
             Y : in  std_logic_vector(32 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(32 downto 0)   );
   end component;

signal sign_c0, sign_c1 :  std_logic;
signal expX_c0 :  std_logic_vector(7 downto 0);
signal expY_c0 :  std_logic_vector(7 downto 0);
signal expSumPreSub_c0 :  std_logic_vector(9 downto 0);
signal bias_c0 :  std_logic_vector(9 downto 0);
signal expSum_c0, expSum_c1 :  std_logic_vector(9 downto 0);
signal sigX_c0 :  std_logic_vector(23 downto 0);
signal sigY_c0 :  std_logic_vector(23 downto 0);
signal sigProd_c1 :  std_logic_vector(47 downto 0);
signal excSel_c0 :  std_logic_vector(3 downto 0);
signal exc_c0, exc_c1 :  std_logic_vector(1 downto 0);
signal norm_c1 :  std_logic;
signal expPostNorm_c1 :  std_logic_vector(9 downto 0);
signal sigProdExt_c1 :  std_logic_vector(47 downto 0);
signal expSig_c1 :  std_logic_vector(32 downto 0);
signal sticky_c1 :  std_logic;
signal guard_c1 :  std_logic;
signal round_c1 :  std_logic;
signal expSigPostRound_c1 :  std_logic_vector(32 downto 0);
signal excPostNorm_c1 :  std_logic_vector(1 downto 0);
signal finalExc_c1 :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               sign_c1 <= sign_c0;
               expSum_c1 <= expSum_c0;
               exc_c1 <= exc_c0;
            end if;
         end if;
      end process;
   sign_c0 <= X(31) xor Y(31);
   expX_c0 <= X(30 downto 23);
   expY_c0 <= Y(30 downto 23);
   expSumPreSub_c0 <= ("00" & expX_c0) + ("00" & expY_c0);
   bias_c0 <= CONV_STD_LOGIC_VECTOR(127,10);
   expSum_c0 <= expSumPreSub_c0 - bias_c0;
   sigX_c0 <= "1" & X(22 downto 0);
   sigY_c0 <= "1" & Y(22 downto 0);
   SignificandMultiplication: IntMultiplier_24x24_48_Freq200_uid5
      port map ( clk  => clk,
                 ce_1 => ce_1,
                 X => sigX_c0,
                 Y => sigY_c0,
                 R => sigProd_c1);
   excSel_c0 <= X(33 downto 32) & Y(33 downto 32);
   with excSel_c0  select  
   exc_c0 <= "00" when  "0000" | "0001" | "0100", 
          "01" when "0101",
          "10" when "0110" | "1001" | "1010" ,
          "11" when others;
   norm_c1 <= sigProd_c1(47);
   -- exponent update
   expPostNorm_c1 <= expSum_c1 + ("000000000" & norm_c1);
   -- significand normalization shift
   sigProdExt_c1 <= sigProd_c1(46 downto 0) & "0" when norm_c1='1' else
                         sigProd_c1(45 downto 0) & "00";
   expSig_c1 <= expPostNorm_c1 & sigProdExt_c1(47 downto 25);
   sticky_c1 <= sigProdExt_c1(24);
   guard_c1 <= '0' when sigProdExt_c1(23 downto 0)="000000000000000000000000" else '1';
   round_c1 <= sticky_c1 and ( (guard_c1 and not(sigProdExt_c1(25))) or (sigProdExt_c1(25) ))  ;
   RoundingAdder: IntAdder_33_Freq200_uid355
      port map ( clk  => clk,
                 ce_1 => ce_1,
                 Cin => round_c1,
                 X => expSig_c1,
                 Y => "000000000000000000000000000000000",
                 R => expSigPostRound_c1);
   with expSigPostRound_c1(32 downto 31)  select 
   excPostNorm_c1 <=  "01"  when  "00",
                               "10"             when "01", 
                               "00"             when "11"|"10",
                               "11"             when others;
   with exc_c1  select  
   finalExc_c1 <= exc_c1 when  "11"|"10"|"00",
                       excPostNorm_c1 when others; 
   R <= finalExc_c1 & sign_c1 & expSigPostRound_c1(30 downto 0);
end architecture;



--------------------------------------------------------------------------------
--                          selFunction_Freq200_uid4
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity selFunction_Freq200_uid4 is
    port (X : in  std_logic_vector(8 downto 0);
          Y : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of selFunction_Freq200_uid4 is
signal Y0 :  std_logic_vector(2 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(2 downto 0);
begin
   with X  select  Y0 <= 
      "000" when "000000000",
      "000" when "000000001",
      "000" when "000000010",
      "000" when "000000011",
      "000" when "000000100",
      "000" when "000000101",
      "000" when "000000110",
      "000" when "000000111",
      "000" when "000001000",
      "000" when "000001001",
      "000" when "000001010",
      "000" when "000001011",
      "000" when "000001100",
      "000" when "000001101",
      "000" when "000001110",
      "000" when "000001111",
      "001" when "000010000",
      "000" when "000010001",
      "000" when "000010010",
      "000" when "000010011",
      "000" when "000010100",
      "000" when "000010101",
      "000" when "000010110",
      "000" when "000010111",
      "001" when "000011000",
      "001" when "000011001",
      "001" when "000011010",
      "001" when "000011011",
      "000" when "000011100",
      "000" when "000011101",
      "000" when "000011110",
      "000" when "000011111",
      "001" when "000100000",
      "001" when "000100001",
      "001" when "000100010",
      "001" when "000100011",
      "001" when "000100100",
      "001" when "000100101",
      "001" when "000100110",
      "000" when "000100111",
      "001" when "000101000",
      "001" when "000101001",
      "001" when "000101010",
      "001" when "000101011",
      "001" when "000101100",
      "001" when "000101101",
      "001" when "000101110",
      "001" when "000101111",
      "010" when "000110000",
      "001" when "000110001",
      "001" when "000110010",
      "001" when "000110011",
      "001" when "000110100",
      "001" when "000110101",
      "001" when "000110110",
      "001" when "000110111",
      "010" when "000111000",
      "010" when "000111001",
      "001" when "000111010",
      "001" when "000111011",
      "001" when "000111100",
      "001" when "000111101",
      "001" when "000111110",
      "001" when "000111111",
      "010" when "001000000",
      "010" when "001000001",
      "010" when "001000010",
      "001" when "001000011",
      "001" when "001000100",
      "001" when "001000101",
      "001" when "001000110",
      "001" when "001000111",
      "010" when "001001000",
      "010" when "001001001",
      "010" when "001001010",
      "010" when "001001011",
      "001" when "001001100",
      "001" when "001001101",
      "001" when "001001110",
      "001" when "001001111",
      "010" when "001010000",
      "010" when "001010001",
      "010" when "001010010",
      "010" when "001010011",
      "010" when "001010100",
      "010" when "001010101",
      "001" when "001010110",
      "001" when "001010111",
      "010" when "001011000",
      "010" when "001011001",
      "010" when "001011010",
      "010" when "001011011",
      "010" when "001011100",
      "010" when "001011101",
      "010" when "001011110",
      "001" when "001011111",
      "010" when "001100000",
      "010" when "001100001",
      "010" when "001100010",
      "010" when "001100011",
      "010" when "001100100",
      "010" when "001100101",
      "010" when "001100110",
      "010" when "001100111",
      "010" when "001101000",
      "010" when "001101001",
      "010" when "001101010",
      "010" when "001101011",
      "010" when "001101100",
      "010" when "001101101",
      "010" when "001101110",
      "010" when "001101111",
      "010" when "001110000",
      "010" when "001110001",
      "010" when "001110010",
      "010" when "001110011",
      "010" when "001110100",
      "010" when "001110101",
      "010" when "001110110",
      "010" when "001110111",
      "010" when "001111000",
      "010" when "001111001",
      "010" when "001111010",
      "010" when "001111011",
      "010" when "001111100",
      "010" when "001111101",
      "010" when "001111110",
      "010" when "001111111",
      "010" when "010000000",
      "010" when "010000001",
      "010" when "010000010",
      "010" when "010000011",
      "010" when "010000100",
      "010" when "010000101",
      "010" when "010000110",
      "010" when "010000111",
      "010" when "010001000",
      "010" when "010001001",
      "010" when "010001010",
      "010" when "010001011",
      "010" when "010001100",
      "010" when "010001101",
      "010" when "010001110",
      "010" when "010001111",
      "010" when "010010000",
      "010" when "010010001",
      "010" when "010010010",
      "010" when "010010011",
      "010" when "010010100",
      "010" when "010010101",
      "010" when "010010110",
      "010" when "010010111",
      "010" when "010011000",
      "010" when "010011001",
      "010" when "010011010",
      "010" when "010011011",
      "010" when "010011100",
      "010" when "010011101",
      "010" when "010011110",
      "010" when "010011111",
      "010" when "010100000",
      "010" when "010100001",
      "010" when "010100010",
      "010" when "010100011",
      "010" when "010100100",
      "010" when "010100101",
      "010" when "010100110",
      "010" when "010100111",
      "010" when "010101000",
      "010" when "010101001",
      "010" when "010101010",
      "010" when "010101011",
      "010" when "010101100",
      "010" when "010101101",
      "010" when "010101110",
      "010" when "010101111",
      "010" when "010110000",
      "010" when "010110001",
      "010" when "010110010",
      "010" when "010110011",
      "010" when "010110100",
      "010" when "010110101",
      "010" when "010110110",
      "010" when "010110111",
      "010" when "010111000",
      "010" when "010111001",
      "010" when "010111010",
      "010" when "010111011",
      "010" when "010111100",
      "010" when "010111101",
      "010" when "010111110",
      "010" when "010111111",
      "010" when "011000000",
      "010" when "011000001",
      "010" when "011000010",
      "010" when "011000011",
      "010" when "011000100",
      "010" when "011000101",
      "010" when "011000110",
      "010" when "011000111",
      "010" when "011001000",
      "010" when "011001001",
      "010" when "011001010",
      "010" when "011001011",
      "010" when "011001100",
      "010" when "011001101",
      "010" when "011001110",
      "010" when "011001111",
      "010" when "011010000",
      "010" when "011010001",
      "010" when "011010010",
      "010" when "011010011",
      "010" when "011010100",
      "010" when "011010101",
      "010" when "011010110",
      "010" when "011010111",
      "010" when "011011000",
      "010" when "011011001",
      "010" when "011011010",
      "010" when "011011011",
      "010" when "011011100",
      "010" when "011011101",
      "010" when "011011110",
      "010" when "011011111",
      "010" when "011100000",
      "010" when "011100001",
      "010" when "011100010",
      "010" when "011100011",
      "010" when "011100100",
      "010" when "011100101",
      "010" when "011100110",
      "010" when "011100111",
      "010" when "011101000",
      "010" when "011101001",
      "010" when "011101010",
      "010" when "011101011",
      "010" when "011101100",
      "010" when "011101101",
      "010" when "011101110",
      "010" when "011101111",
      "010" when "011110000",
      "010" when "011110001",
      "010" when "011110010",
      "010" when "011110011",
      "010" when "011110100",
      "010" when "011110101",
      "010" when "011110110",
      "010" when "011110111",
      "010" when "011111000",
      "010" when "011111001",
      "010" when "011111010",
      "010" when "011111011",
      "010" when "011111100",
      "010" when "011111101",
      "010" when "011111110",
      "010" when "011111111",
      "110" when "100000000",
      "110" when "100000001",
      "110" when "100000010",
      "110" when "100000011",
      "110" when "100000100",
      "110" when "100000101",
      "110" when "100000110",
      "110" when "100000111",
      "110" when "100001000",
      "110" when "100001001",
      "110" when "100001010",
      "110" when "100001011",
      "110" when "100001100",
      "110" when "100001101",
      "110" when "100001110",
      "110" when "100001111",
      "110" when "100010000",
      "110" when "100010001",
      "110" when "100010010",
      "110" when "100010011",
      "110" when "100010100",
      "110" when "100010101",
      "110" when "100010110",
      "110" when "100010111",
      "110" when "100011000",
      "110" when "100011001",
      "110" when "100011010",
      "110" when "100011011",
      "110" when "100011100",
      "110" when "100011101",
      "110" when "100011110",
      "110" when "100011111",
      "110" when "100100000",
      "110" when "100100001",
      "110" when "100100010",
      "110" when "100100011",
      "110" when "100100100",
      "110" when "100100101",
      "110" when "100100110",
      "110" when "100100111",
      "110" when "100101000",
      "110" when "100101001",
      "110" when "100101010",
      "110" when "100101011",
      "110" when "100101100",
      "110" when "100101101",
      "110" when "100101110",
      "110" when "100101111",
      "110" when "100110000",
      "110" when "100110001",
      "110" when "100110010",
      "110" when "100110011",
      "110" when "100110100",
      "110" when "100110101",
      "110" when "100110110",
      "110" when "100110111",
      "110" when "100111000",
      "110" when "100111001",
      "110" when "100111010",
      "110" when "100111011",
      "110" when "100111100",
      "110" when "100111101",
      "110" when "100111110",
      "110" when "100111111",
      "110" when "101000000",
      "110" when "101000001",
      "110" when "101000010",
      "110" when "101000011",
      "110" when "101000100",
      "110" when "101000101",
      "110" when "101000110",
      "110" when "101000111",
      "110" when "101001000",
      "110" when "101001001",
      "110" when "101001010",
      "110" when "101001011",
      "110" when "101001100",
      "110" when "101001101",
      "110" when "101001110",
      "110" when "101001111",
      "110" when "101010000",
      "110" when "101010001",
      "110" when "101010010",
      "110" when "101010011",
      "110" when "101010100",
      "110" when "101010101",
      "110" when "101010110",
      "110" when "101010111",
      "110" when "101011000",
      "110" when "101011001",
      "110" when "101011010",
      "110" when "101011011",
      "110" when "101011100",
      "110" when "101011101",
      "110" when "101011110",
      "110" when "101011111",
      "110" when "101100000",
      "110" when "101100001",
      "110" when "101100010",
      "110" when "101100011",
      "110" when "101100100",
      "110" when "101100101",
      "110" when "101100110",
      "110" when "101100111",
      "110" when "101101000",
      "110" when "101101001",
      "110" when "101101010",
      "110" when "101101011",
      "110" when "101101100",
      "110" when "101101101",
      "110" when "101101110",
      "110" when "101101111",
      "110" when "101110000",
      "110" when "101110001",
      "110" when "101110010",
      "110" when "101110011",
      "110" when "101110100",
      "110" when "101110101",
      "110" when "101110110",
      "110" when "101110111",
      "110" when "101111000",
      "110" when "101111001",
      "110" when "101111010",
      "110" when "101111011",
      "110" when "101111100",
      "110" when "101111101",
      "110" when "101111110",
      "110" when "101111111",
      "110" when "110000000",
      "110" when "110000001",
      "110" when "110000010",
      "110" when "110000011",
      "110" when "110000100",
      "110" when "110000101",
      "110" when "110000110",
      "110" when "110000111",
      "110" when "110001000",
      "110" when "110001001",
      "110" when "110001010",
      "110" when "110001011",
      "110" when "110001100",
      "110" when "110001101",
      "110" when "110001110",
      "110" when "110001111",
      "110" when "110010000",
      "110" when "110010001",
      "110" when "110010010",
      "110" when "110010011",
      "110" when "110010100",
      "110" when "110010101",
      "110" when "110010110",
      "110" when "110010111",
      "110" when "110011000",
      "110" when "110011001",
      "110" when "110011010",
      "110" when "110011011",
      "110" when "110011100",
      "110" when "110011101",
      "110" when "110011110",
      "110" when "110011111",
      "110" when "110100000",
      "110" when "110100001",
      "110" when "110100010",
      "110" when "110100011",
      "110" when "110100100",
      "110" when "110100101",
      "110" when "110100110",
      "110" when "110100111",
      "110" when "110101000",
      "110" when "110101001",
      "110" when "110101010",
      "110" when "110101011",
      "110" when "110101100",
      "110" when "110101101",
      "110" when "110101110",
      "111" when "110101111",
      "110" when "110110000",
      "110" when "110110001",
      "110" when "110110010",
      "110" when "110110011",
      "110" when "110110100",
      "111" when "110110101",
      "111" when "110110110",
      "111" when "110110111",
      "110" when "110111000",
      "110" when "110111001",
      "110" when "110111010",
      "110" when "110111011",
      "111" when "110111100",
      "111" when "110111101",
      "111" when "110111110",
      "111" when "110111111",
      "110" when "111000000",
      "110" when "111000001",
      "111" when "111000010",
      "111" when "111000011",
      "111" when "111000100",
      "111" when "111000101",
      "111" when "111000110",
      "111" when "111000111",
      "110" when "111001000",
      "111" when "111001001",
      "111" when "111001010",
      "111" when "111001011",
      "111" when "111001100",
      "111" when "111001101",
      "111" when "111001110",
      "111" when "111001111",
      "111" when "111010000",
      "111" when "111010001",
      "111" when "111010010",
      "111" when "111010011",
      "111" when "111010100",
      "111" when "111010101",
      "111" when "111010110",
      "111" when "111010111",
      "111" when "111011000",
      "111" when "111011001",
      "111" when "111011010",
      "111" when "111011011",
      "111" when "111011100",
      "111" when "111011101",
      "111" when "111011110",
      "111" when "111011111",
      "111" when "111100000",
      "111" when "111100001",
      "111" when "111100010",
      "111" when "111100011",
      "111" when "111100100",
      "111" when "111100101",
      "111" when "111100110",
      "111" when "111100111",
      "111" when "111101000",
      "111" when "111101001",
      "111" when "111101010",
      "111" when "111101011",
      "000" when "111101100",
      "000" when "111101101",
      "000" when "111101110",
      "000" when "111101111",
      "000" when "111110000",
      "000" when "111110001",
      "000" when "111110010",
      "000" when "111110011",
      "000" when "111110100",
      "000" when "111110101",
      "000" when "111110110",
      "000" when "111110111",
      "000" when "111111000",
      "000" when "111111001",
      "000" when "111111010",
      "000" when "111111011",
      "000" when "111111100",
      "000" when "111111101",
      "000" when "111111110",
      "000" when "111111111",
      "---" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                            FloatingPointDivider
--                         (FPDiv_8_23_Freq200_uid2)
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Maxime Christ, Florent de Dinechin (2015)
--------------------------------------------------------------------------------
-- Pipeline depth: 5 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FloatingPointDivider is
    port (clk, ce_1, ce_2, ce_3, ce_4, ce_5 : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          Y : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FloatingPointDivider is
   component selFunction_Freq200_uid4 is
      port ( X : in  std_logic_vector(8 downto 0);
             Y : out  std_logic_vector(2 downto 0)   );
   end component;

signal fX_c0 :  std_logic_vector(23 downto 0);
signal fY_c0 :  std_logic_vector(23 downto 0);
signal expR0_c0, expR0_c1, expR0_c2, expR0_c3, expR0_c4, expR0_c5 :  std_logic_vector(9 downto 0);
signal sR_c0, sR_c1, sR_c2, sR_c3, sR_c4, sR_c5 :  std_logic;
signal exnXY_c0 :  std_logic_vector(3 downto 0);
signal exnR0_c0, exnR0_c1, exnR0_c2, exnR0_c3, exnR0_c4, exnR0_c5 :  std_logic_vector(1 downto 0);
signal D_c0, D_c1, D_c2, D_c3, D_c4, D_c5 :  std_logic_vector(23 downto 0);
signal psX_c0 :  std_logic_vector(24 downto 0);
signal betaw14_c0 :  std_logic_vector(26 downto 0);
signal sel14_c0 :  std_logic_vector(8 downto 0);
signal q14_c0 :  std_logic_vector(2 downto 0);
signal q14_copy5_c0 :  std_logic_vector(2 downto 0);
signal absq14D_c0 :  std_logic_vector(26 downto 0);
signal w13_c0 :  std_logic_vector(26 downto 0);
signal betaw13_c0 :  std_logic_vector(26 downto 0);
signal sel13_c0 :  std_logic_vector(8 downto 0);
signal q13_c0 :  std_logic_vector(2 downto 0);
signal q13_copy6_c0 :  std_logic_vector(2 downto 0);
signal absq13D_c0 :  std_logic_vector(26 downto 0);
signal w12_c0 :  std_logic_vector(26 downto 0);
signal betaw12_c0, betaw12_c1 :  std_logic_vector(26 downto 0);
signal sel12_c0 :  std_logic_vector(8 downto 0);
signal q12_c0, q12_c1 :  std_logic_vector(2 downto 0);
signal q12_copy7_c0 :  std_logic_vector(2 downto 0);
signal absq12D_c0, absq12D_c1 :  std_logic_vector(26 downto 0);
signal w11_c1 :  std_logic_vector(26 downto 0);
signal betaw11_c1 :  std_logic_vector(26 downto 0);
signal sel11_c1 :  std_logic_vector(8 downto 0);
signal q11_c1 :  std_logic_vector(2 downto 0);
signal q11_copy8_c1 :  std_logic_vector(2 downto 0);
signal absq11D_c1 :  std_logic_vector(26 downto 0);
signal w10_c1 :  std_logic_vector(26 downto 0);
signal betaw10_c1 :  std_logic_vector(26 downto 0);
signal sel10_c1 :  std_logic_vector(8 downto 0);
signal q10_c1 :  std_logic_vector(2 downto 0);
signal q10_copy9_c1 :  std_logic_vector(2 downto 0);
signal absq10D_c1 :  std_logic_vector(26 downto 0);
signal w9_c1 :  std_logic_vector(26 downto 0);
signal betaw9_c1, betaw9_c2 :  std_logic_vector(26 downto 0);
signal sel9_c1 :  std_logic_vector(8 downto 0);
signal q9_c2 :  std_logic_vector(2 downto 0);
signal q9_copy10_c1, q9_copy10_c2 :  std_logic_vector(2 downto 0);
signal absq9D_c2 :  std_logic_vector(26 downto 0);
signal w8_c2 :  std_logic_vector(26 downto 0);
signal betaw8_c2 :  std_logic_vector(26 downto 0);
signal sel8_c2 :  std_logic_vector(8 downto 0);
signal q8_c2 :  std_logic_vector(2 downto 0);
signal q8_copy11_c2 :  std_logic_vector(2 downto 0);
signal absq8D_c2 :  std_logic_vector(26 downto 0);
signal w7_c2 :  std_logic_vector(26 downto 0);
signal betaw7_c2, betaw7_c3 :  std_logic_vector(26 downto 0);
signal sel7_c2 :  std_logic_vector(8 downto 0);
signal q7_c2, q7_c3 :  std_logic_vector(2 downto 0);
signal q7_copy12_c2 :  std_logic_vector(2 downto 0);
signal absq7D_c2, absq7D_c3 :  std_logic_vector(26 downto 0);
signal w6_c3 :  std_logic_vector(26 downto 0);
signal betaw6_c3 :  std_logic_vector(26 downto 0);
signal sel6_c3 :  std_logic_vector(8 downto 0);
signal q6_c3 :  std_logic_vector(2 downto 0);
signal q6_copy13_c3 :  std_logic_vector(2 downto 0);
signal absq6D_c3 :  std_logic_vector(26 downto 0);
signal w5_c3 :  std_logic_vector(26 downto 0);
signal betaw5_c3 :  std_logic_vector(26 downto 0);
signal sel5_c3 :  std_logic_vector(8 downto 0);
signal q5_c3 :  std_logic_vector(2 downto 0);
signal q5_copy14_c3 :  std_logic_vector(2 downto 0);
signal absq5D_c3 :  std_logic_vector(26 downto 0);
signal w4_c3 :  std_logic_vector(26 downto 0);
signal betaw4_c3, betaw4_c4 :  std_logic_vector(26 downto 0);
signal sel4_c3 :  std_logic_vector(8 downto 0);
signal q4_c3, q4_c4 :  std_logic_vector(2 downto 0);
signal q4_copy15_c3 :  std_logic_vector(2 downto 0);
signal absq4D_c3, absq4D_c4 :  std_logic_vector(26 downto 0);
signal w3_c4 :  std_logic_vector(26 downto 0);
signal betaw3_c4 :  std_logic_vector(26 downto 0);
signal sel3_c4 :  std_logic_vector(8 downto 0);
signal q3_c4 :  std_logic_vector(2 downto 0);
signal q3_copy16_c4 :  std_logic_vector(2 downto 0);
signal absq3D_c4 :  std_logic_vector(26 downto 0);
signal w2_c4 :  std_logic_vector(26 downto 0);
signal betaw2_c4 :  std_logic_vector(26 downto 0);
signal sel2_c4 :  std_logic_vector(8 downto 0);
signal q2_c4 :  std_logic_vector(2 downto 0);
signal q2_copy17_c4 :  std_logic_vector(2 downto 0);
signal absq2D_c4 :  std_logic_vector(26 downto 0);
signal w1_c4 :  std_logic_vector(26 downto 0);
signal betaw1_c4, betaw1_c5 :  std_logic_vector(26 downto 0);
signal sel1_c4 :  std_logic_vector(8 downto 0);
signal q1_c5 :  std_logic_vector(2 downto 0);
signal q1_copy18_c4, q1_copy18_c5 :  std_logic_vector(2 downto 0);
signal absq1D_c5 :  std_logic_vector(26 downto 0);
signal w0_c5 :  std_logic_vector(26 downto 0);
signal wfinal_c5 :  std_logic_vector(24 downto 0);
signal qM0_c5 :  std_logic;
signal qP14_c0, qP14_c1, qP14_c2, qP14_c3, qP14_c4, qP14_c5 :  std_logic_vector(1 downto 0);
signal qM14_c0, qM14_c1, qM14_c2, qM14_c3, qM14_c4, qM14_c5 :  std_logic_vector(1 downto 0);
signal qP13_c0, qP13_c1, qP13_c2, qP13_c3, qP13_c4, qP13_c5 :  std_logic_vector(1 downto 0);
signal qM13_c0, qM13_c1, qM13_c2, qM13_c3, qM13_c4, qM13_c5 :  std_logic_vector(1 downto 0);
signal qP12_c0, qP12_c1, qP12_c2, qP12_c3, qP12_c4, qP12_c5 :  std_logic_vector(1 downto 0);
signal qM12_c0, qM12_c1, qM12_c2, qM12_c3, qM12_c4, qM12_c5 :  std_logic_vector(1 downto 0);
signal qP11_c1, qP11_c2, qP11_c3, qP11_c4, qP11_c5 :  std_logic_vector(1 downto 0);
signal qM11_c1, qM11_c2, qM11_c3, qM11_c4, qM11_c5 :  std_logic_vector(1 downto 0);
signal qP10_c1, qP10_c2, qP10_c3, qP10_c4, qP10_c5 :  std_logic_vector(1 downto 0);
signal qM10_c1, qM10_c2, qM10_c3, qM10_c4, qM10_c5 :  std_logic_vector(1 downto 0);
signal qP9_c2, qP9_c3, qP9_c4, qP9_c5 :  std_logic_vector(1 downto 0);
signal qM9_c2, qM9_c3, qM9_c4, qM9_c5 :  std_logic_vector(1 downto 0);
signal qP8_c2, qP8_c3, qP8_c4, qP8_c5 :  std_logic_vector(1 downto 0);
signal qM8_c2, qM8_c3, qM8_c4, qM8_c5 :  std_logic_vector(1 downto 0);
signal qP7_c2, qP7_c3, qP7_c4, qP7_c5 :  std_logic_vector(1 downto 0);
signal qM7_c2, qM7_c3, qM7_c4, qM7_c5 :  std_logic_vector(1 downto 0);
signal qP6_c3, qP6_c4, qP6_c5 :  std_logic_vector(1 downto 0);
signal qM6_c3, qM6_c4, qM6_c5 :  std_logic_vector(1 downto 0);
signal qP5_c3, qP5_c4, qP5_c5 :  std_logic_vector(1 downto 0);
signal qM5_c3, qM5_c4, qM5_c5 :  std_logic_vector(1 downto 0);
signal qP4_c3, qP4_c4, qP4_c5 :  std_logic_vector(1 downto 0);
signal qM4_c3, qM4_c4, qM4_c5 :  std_logic_vector(1 downto 0);
signal qP3_c4, qP3_c5 :  std_logic_vector(1 downto 0);
signal qM3_c4, qM3_c5 :  std_logic_vector(1 downto 0);
signal qP2_c4, qP2_c5 :  std_logic_vector(1 downto 0);
signal qM2_c4, qM2_c5 :  std_logic_vector(1 downto 0);
signal qP1_c5 :  std_logic_vector(1 downto 0);
signal qM1_c5 :  std_logic_vector(1 downto 0);
signal qP_c5 :  std_logic_vector(27 downto 0);
signal qM_c5 :  std_logic_vector(27 downto 0);
signal quotient_c5 :  std_logic_vector(27 downto 0);
signal mR_c5 :  std_logic_vector(25 downto 0);
signal fRnorm_c5 :  std_logic_vector(23 downto 0);
signal round_c5 :  std_logic;
signal expR1_c5 :  std_logic_vector(9 downto 0);
signal expfrac_c5 :  std_logic_vector(32 downto 0);
signal expfracR_c5 :  std_logic_vector(32 downto 0);
signal exnR_c5 :  std_logic_vector(1 downto 0);
signal exnRfinal_c5 :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               expR0_c1 <= expR0_c0;
               sR_c1 <= sR_c0;
               exnR0_c1 <= exnR0_c0;
               D_c1 <= D_c0;
               betaw12_c1 <= betaw12_c0;
               q12_c1 <= q12_c0;
               absq12D_c1 <= absq12D_c0;
               qP14_c1 <= qP14_c0;
               qM14_c1 <= qM14_c0;
               qP13_c1 <= qP13_c0;
               qM13_c1 <= qM13_c0;
               qP12_c1 <= qP12_c0;
               qM12_c1 <= qM12_c0;
            end if;
            if ce_2 = '1' then
               expR0_c2 <= expR0_c1;
               sR_c2 <= sR_c1;
               exnR0_c2 <= exnR0_c1;
               D_c2 <= D_c1;
               betaw9_c2 <= betaw9_c1;
               q9_copy10_c2 <= q9_copy10_c1;
               qP14_c2 <= qP14_c1;
               qM14_c2 <= qM14_c1;
               qP13_c2 <= qP13_c1;
               qM13_c2 <= qM13_c1;
               qP12_c2 <= qP12_c1;
               qM12_c2 <= qM12_c1;
               qP11_c2 <= qP11_c1;
               qM11_c2 <= qM11_c1;
               qP10_c2 <= qP10_c1;
               qM10_c2 <= qM10_c1;
            end if;
            if ce_3 = '1' then
               expR0_c3 <= expR0_c2;
               sR_c3 <= sR_c2;
               exnR0_c3 <= exnR0_c2;
               D_c3 <= D_c2;
               betaw7_c3 <= betaw7_c2;
               q7_c3 <= q7_c2;
               absq7D_c3 <= absq7D_c2;
               qP14_c3 <= qP14_c2;
               qM14_c3 <= qM14_c2;
               qP13_c3 <= qP13_c2;
               qM13_c3 <= qM13_c2;
               qP12_c3 <= qP12_c2;
               qM12_c3 <= qM12_c2;
               qP11_c3 <= qP11_c2;
               qM11_c3 <= qM11_c2;
               qP10_c3 <= qP10_c2;
               qM10_c3 <= qM10_c2;
               qP9_c3 <= qP9_c2;
               qM9_c3 <= qM9_c2;
               qP8_c3 <= qP8_c2;
               qM8_c3 <= qM8_c2;
               qP7_c3 <= qP7_c2;
               qM7_c3 <= qM7_c2;
            end if;
            if ce_4 = '1' then
               expR0_c4 <= expR0_c3;
               sR_c4 <= sR_c3;
               exnR0_c4 <= exnR0_c3;
               D_c4 <= D_c3;
               betaw4_c4 <= betaw4_c3;
               q4_c4 <= q4_c3;
               absq4D_c4 <= absq4D_c3;
               qP14_c4 <= qP14_c3;
               qM14_c4 <= qM14_c3;
               qP13_c4 <= qP13_c3;
               qM13_c4 <= qM13_c3;
               qP12_c4 <= qP12_c3;
               qM12_c4 <= qM12_c3;
               qP11_c4 <= qP11_c3;
               qM11_c4 <= qM11_c3;
               qP10_c4 <= qP10_c3;
               qM10_c4 <= qM10_c3;
               qP9_c4 <= qP9_c3;
               qM9_c4 <= qM9_c3;
               qP8_c4 <= qP8_c3;
               qM8_c4 <= qM8_c3;
               qP7_c4 <= qP7_c3;
               qM7_c4 <= qM7_c3;
               qP6_c4 <= qP6_c3;
               qM6_c4 <= qM6_c3;
               qP5_c4 <= qP5_c3;
               qM5_c4 <= qM5_c3;
               qP4_c4 <= qP4_c3;
               qM4_c4 <= qM4_c3;
            end if;
            if ce_5 = '1' then
               expR0_c5 <= expR0_c4;
               sR_c5 <= sR_c4;
               exnR0_c5 <= exnR0_c4;
               D_c5 <= D_c4;
               betaw1_c5 <= betaw1_c4;
               q1_copy18_c5 <= q1_copy18_c4;
               qP14_c5 <= qP14_c4;
               qM14_c5 <= qM14_c4;
               qP13_c5 <= qP13_c4;
               qM13_c5 <= qM13_c4;
               qP12_c5 <= qP12_c4;
               qM12_c5 <= qM12_c4;
               qP11_c5 <= qP11_c4;
               qM11_c5 <= qM11_c4;
               qP10_c5 <= qP10_c4;
               qM10_c5 <= qM10_c4;
               qP9_c5 <= qP9_c4;
               qM9_c5 <= qM9_c4;
               qP8_c5 <= qP8_c4;
               qM8_c5 <= qM8_c4;
               qP7_c5 <= qP7_c4;
               qM7_c5 <= qM7_c4;
               qP6_c5 <= qP6_c4;
               qM6_c5 <= qM6_c4;
               qP5_c5 <= qP5_c4;
               qM5_c5 <= qM5_c4;
               qP4_c5 <= qP4_c4;
               qM4_c5 <= qM4_c4;
               qP3_c5 <= qP3_c4;
               qM3_c5 <= qM3_c4;
               qP2_c5 <= qP2_c4;
               qM2_c5 <= qM2_c4;
            end if;
         end if;
      end process;
   fX_c0 <= "1" & X(22 downto 0);
   fY_c0 <= "1" & Y(22 downto 0);
   -- exponent difference, sign and exception combination computed early, to have fewer bits to pipeline
   expR0_c0 <= ("00" & X(30 downto 23)) - ("00" & Y(30 downto 23));
   sR_c0 <= X(31) xor Y(31);
   -- early exception handling 
   exnXY_c0 <= X(33 downto 32) & Y(33 downto 32);
   with exnXY_c0  select 
      exnR0_c0 <= 
         "01"	 when "0101",										-- normal
         "00"	 when "0001" | "0010" | "0110", -- zero
         "10"	 when "0100" | "1000" | "1001", -- overflow
         "11"	 when others;										-- NaN
   D_c0 <= fY_c0 ;
   psX_c0 <= "0" & fX_c0 ;
   betaw14_c0 <=  "00" & psX_c0;
   sel14_c0 <= betaw14_c0(26 downto 21) & D_c0(22 downto 20);
   SelFunctionTable14: selFunction_Freq200_uid4
      port map ( X => sel14_c0,
                 Y => q14_copy5_c0);
   q14_c0 <= q14_copy5_c0; -- output copy to hold a pipeline register if needed

   with q14_c0  select 
      absq14D_c0 <= 
         "000" & D_c0						 when "001" | "111", -- mult by 1
         "00" & D_c0 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q14_c0(2)  select 
   w13_c0<= betaw14_c0 - absq14D_c0 when '0',
         betaw14_c0 + absq14D_c0 when others;

   betaw13_c0 <= w13_c0(24 downto 0) & "00"; -- multiplication by the radix
   sel13_c0 <= betaw13_c0(26 downto 21) & D_c0(22 downto 20);
   SelFunctionTable13: selFunction_Freq200_uid4
      port map ( X => sel13_c0,
                 Y => q13_copy6_c0);
   q13_c0 <= q13_copy6_c0; -- output copy to hold a pipeline register if needed

   with q13_c0  select 
      absq13D_c0 <= 
         "000" & D_c0						 when "001" | "111", -- mult by 1
         "00" & D_c0 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q13_c0(2)  select 
   w12_c0<= betaw13_c0 - absq13D_c0 when '0',
         betaw13_c0 + absq13D_c0 when others;

   betaw12_c0 <= w12_c0(24 downto 0) & "00"; -- multiplication by the radix
   sel12_c0 <= betaw12_c0(26 downto 21) & D_c0(22 downto 20);
   SelFunctionTable12: selFunction_Freq200_uid4
      port map ( X => sel12_c0,
                 Y => q12_copy7_c0);
   q12_c0 <= q12_copy7_c0; -- output copy to hold a pipeline register if needed

   with q12_c0  select 
      absq12D_c0 <= 
         "000" & D_c0						 when "001" | "111", -- mult by 1
         "00" & D_c0 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q12_c1(2)  select 
   w11_c1<= betaw12_c1 - absq12D_c1 when '0',
         betaw12_c1 + absq12D_c1 when others;

   betaw11_c1 <= w11_c1(24 downto 0) & "00"; -- multiplication by the radix
   sel11_c1 <= betaw11_c1(26 downto 21) & D_c1(22 downto 20);
   SelFunctionTable11: selFunction_Freq200_uid4
      port map ( X => sel11_c1,
                 Y => q11_copy8_c1);
   q11_c1 <= q11_copy8_c1; -- output copy to hold a pipeline register if needed

   with q11_c1  select 
      absq11D_c1 <= 
         "000" & D_c1						 when "001" | "111", -- mult by 1
         "00" & D_c1 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q11_c1(2)  select 
   w10_c1<= betaw11_c1 - absq11D_c1 when '0',
         betaw11_c1 + absq11D_c1 when others;

   betaw10_c1 <= w10_c1(24 downto 0) & "00"; -- multiplication by the radix
   sel10_c1 <= betaw10_c1(26 downto 21) & D_c1(22 downto 20);
   SelFunctionTable10: selFunction_Freq200_uid4
      port map ( X => sel10_c1,
                 Y => q10_copy9_c1);
   q10_c1 <= q10_copy9_c1; -- output copy to hold a pipeline register if needed

   with q10_c1  select 
      absq10D_c1 <= 
         "000" & D_c1						 when "001" | "111", -- mult by 1
         "00" & D_c1 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q10_c1(2)  select 
   w9_c1<= betaw10_c1 - absq10D_c1 when '0',
         betaw10_c1 + absq10D_c1 when others;

   betaw9_c1 <= w9_c1(24 downto 0) & "00"; -- multiplication by the radix
   sel9_c1 <= betaw9_c1(26 downto 21) & D_c1(22 downto 20);
   SelFunctionTable9: selFunction_Freq200_uid4
      port map ( X => sel9_c1,
                 Y => q9_copy10_c1);
   q9_c2 <= q9_copy10_c2; -- output copy to hold a pipeline register if needed

   with q9_c2  select 
      absq9D_c2 <= 
         "000" & D_c2						 when "001" | "111", -- mult by 1
         "00" & D_c2 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q9_c2(2)  select 
   w8_c2<= betaw9_c2 - absq9D_c2 when '0',
         betaw9_c2 + absq9D_c2 when others;

   betaw8_c2 <= w8_c2(24 downto 0) & "00"; -- multiplication by the radix
   sel8_c2 <= betaw8_c2(26 downto 21) & D_c2(22 downto 20);
   SelFunctionTable8: selFunction_Freq200_uid4
      port map ( X => sel8_c2,
                 Y => q8_copy11_c2);
   q8_c2 <= q8_copy11_c2; -- output copy to hold a pipeline register if needed

   with q8_c2  select 
      absq8D_c2 <= 
         "000" & D_c2						 when "001" | "111", -- mult by 1
         "00" & D_c2 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q8_c2(2)  select 
   w7_c2<= betaw8_c2 - absq8D_c2 when '0',
         betaw8_c2 + absq8D_c2 when others;

   betaw7_c2 <= w7_c2(24 downto 0) & "00"; -- multiplication by the radix
   sel7_c2 <= betaw7_c2(26 downto 21) & D_c2(22 downto 20);
   SelFunctionTable7: selFunction_Freq200_uid4
      port map ( X => sel7_c2,
                 Y => q7_copy12_c2);
   q7_c2 <= q7_copy12_c2; -- output copy to hold a pipeline register if needed

   with q7_c2  select 
      absq7D_c2 <= 
         "000" & D_c2						 when "001" | "111", -- mult by 1
         "00" & D_c2 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q7_c3(2)  select 
   w6_c3<= betaw7_c3 - absq7D_c3 when '0',
         betaw7_c3 + absq7D_c3 when others;

   betaw6_c3 <= w6_c3(24 downto 0) & "00"; -- multiplication by the radix
   sel6_c3 <= betaw6_c3(26 downto 21) & D_c3(22 downto 20);
   SelFunctionTable6: selFunction_Freq200_uid4
      port map ( X => sel6_c3,
                 Y => q6_copy13_c3);
   q6_c3 <= q6_copy13_c3; -- output copy to hold a pipeline register if needed

   with q6_c3  select 
      absq6D_c3 <= 
         "000" & D_c3						 when "001" | "111", -- mult by 1
         "00" & D_c3 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q6_c3(2)  select 
   w5_c3<= betaw6_c3 - absq6D_c3 when '0',
         betaw6_c3 + absq6D_c3 when others;

   betaw5_c3 <= w5_c3(24 downto 0) & "00"; -- multiplication by the radix
   sel5_c3 <= betaw5_c3(26 downto 21) & D_c3(22 downto 20);
   SelFunctionTable5: selFunction_Freq200_uid4
      port map ( X => sel5_c3,
                 Y => q5_copy14_c3);
   q5_c3 <= q5_copy14_c3; -- output copy to hold a pipeline register if needed

   with q5_c3  select 
      absq5D_c3 <= 
         "000" & D_c3						 when "001" | "111", -- mult by 1
         "00" & D_c3 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q5_c3(2)  select 
   w4_c3<= betaw5_c3 - absq5D_c3 when '0',
         betaw5_c3 + absq5D_c3 when others;

   betaw4_c3 <= w4_c3(24 downto 0) & "00"; -- multiplication by the radix
   sel4_c3 <= betaw4_c3(26 downto 21) & D_c3(22 downto 20);
   SelFunctionTable4: selFunction_Freq200_uid4
      port map ( X => sel4_c3,
                 Y => q4_copy15_c3);
   q4_c3 <= q4_copy15_c3; -- output copy to hold a pipeline register if needed

   with q4_c3  select 
      absq4D_c3 <= 
         "000" & D_c3						 when "001" | "111", -- mult by 1
         "00" & D_c3 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q4_c4(2)  select 
   w3_c4<= betaw4_c4 - absq4D_c4 when '0',
         betaw4_c4 + absq4D_c4 when others;

   betaw3_c4 <= w3_c4(24 downto 0) & "00"; -- multiplication by the radix
   sel3_c4 <= betaw3_c4(26 downto 21) & D_c4(22 downto 20);
   SelFunctionTable3: selFunction_Freq200_uid4
      port map ( X => sel3_c4,
                 Y => q3_copy16_c4);
   q3_c4 <= q3_copy16_c4; -- output copy to hold a pipeline register if needed

   with q3_c4  select 
      absq3D_c4 <= 
         "000" & D_c4						 when "001" | "111", -- mult by 1
         "00" & D_c4 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q3_c4(2)  select 
   w2_c4<= betaw3_c4 - absq3D_c4 when '0',
         betaw3_c4 + absq3D_c4 when others;

   betaw2_c4 <= w2_c4(24 downto 0) & "00"; -- multiplication by the radix
   sel2_c4 <= betaw2_c4(26 downto 21) & D_c4(22 downto 20);
   SelFunctionTable2: selFunction_Freq200_uid4
      port map ( X => sel2_c4,
                 Y => q2_copy17_c4);
   q2_c4 <= q2_copy17_c4; -- output copy to hold a pipeline register if needed

   with q2_c4  select 
      absq2D_c4 <= 
         "000" & D_c4						 when "001" | "111", -- mult by 1
         "00" & D_c4 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q2_c4(2)  select 
   w1_c4<= betaw2_c4 - absq2D_c4 when '0',
         betaw2_c4 + absq2D_c4 when others;

   betaw1_c4 <= w1_c4(24 downto 0) & "00"; -- multiplication by the radix
   sel1_c4 <= betaw1_c4(26 downto 21) & D_c4(22 downto 20);
   SelFunctionTable1: selFunction_Freq200_uid4
      port map ( X => sel1_c4,
                 Y => q1_copy18_c4);
   q1_c5 <= q1_copy18_c5; -- output copy to hold a pipeline register if needed

   with q1_c5  select 
      absq1D_c5 <= 
         "000" & D_c5						 when "001" | "111", -- mult by 1
         "00" & D_c5 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q1_c5(2)  select 
   w0_c5<= betaw1_c5 - absq1D_c5 when '0',
         betaw1_c5 + absq1D_c5 when others;

   wfinal_c5 <= w0_c5(24 downto 0);
   qM0_c5 <= wfinal_c5(24); -- rounding bit is the sign of the remainder
   qP14_c0 <=      q14_c0(1 downto 0);
   qM14_c0 <=      q14_c0(2) & "0";
   qP13_c0 <=      q13_c0(1 downto 0);
   qM13_c0 <=      q13_c0(2) & "0";
   qP12_c0 <=      q12_c0(1 downto 0);
   qM12_c0 <=      q12_c0(2) & "0";
   qP11_c1 <=      q11_c1(1 downto 0);
   qM11_c1 <=      q11_c1(2) & "0";
   qP10_c1 <=      q10_c1(1 downto 0);
   qM10_c1 <=      q10_c1(2) & "0";
   qP9_c2 <=      q9_c2(1 downto 0);
   qM9_c2 <=      q9_c2(2) & "0";
   qP8_c2 <=      q8_c2(1 downto 0);
   qM8_c2 <=      q8_c2(2) & "0";
   qP7_c2 <=      q7_c2(1 downto 0);
   qM7_c2 <=      q7_c2(2) & "0";
   qP6_c3 <=      q6_c3(1 downto 0);
   qM6_c3 <=      q6_c3(2) & "0";
   qP5_c3 <=      q5_c3(1 downto 0);
   qM5_c3 <=      q5_c3(2) & "0";
   qP4_c3 <=      q4_c3(1 downto 0);
   qM4_c3 <=      q4_c3(2) & "0";
   qP3_c4 <=      q3_c4(1 downto 0);
   qM3_c4 <=      q3_c4(2) & "0";
   qP2_c4 <=      q2_c4(1 downto 0);
   qM2_c4 <=      q2_c4(2) & "0";
   qP1_c5 <=      q1_c5(1 downto 0);
   qM1_c5 <=      q1_c5(2) & "0";
   qP_c5 <= qP14_c5 & qP13_c5 & qP12_c5 & qP11_c5 & qP10_c5 & qP9_c5 & qP8_c5 & qP7_c5 & qP6_c5 & qP5_c5 & qP4_c5 & qP3_c5 & qP2_c5 & qP1_c5;
   qM_c5 <= qM14_c5(0) & qM13_c5 & qM12_c5 & qM11_c5 & qM10_c5 & qM9_c5 & qM8_c5 & qM7_c5 & qM6_c5 & qM5_c5 & qM4_c5 & qM3_c5 & qM2_c5 & qM1_c5 & qM0_c5;
   quotient_c5 <= qP_c5 - qM_c5;
   -- We need a mR in (0, -wf-2) format: 1+wF fraction bits, 1 round bit, and 1 guard bit for the normalisation,
   -- quotient is the truncation of the exact quotient to at least 2^(-wF-2) bits
   -- now discarding its possible known MSB zeroes, and dropping the possible extra LSB bit (due to radix 4) 
   mR_c5 <= quotient_c5(26 downto 1); 
   -- normalisation
   fRnorm_c5 <=    mR_c5(24 downto 1)  when mR_c5(25)= '1'
           else mR_c5(23 downto 0);  -- now fRnorm is a (-1, -wF-1) fraction
   round_c5 <= fRnorm_c5(0); 
   expR1_c5 <= expR0_c5 + ("000" & (6 downto 1 => '1') & mR_c5(25)); -- add back bias
   -- final rounding
   expfrac_c5 <= expR1_c5 & fRnorm_c5(23 downto 1) ;
   expfracR_c5 <= expfrac_c5 + ((32 downto 1 => '0') & round_c5);
   exnR_c5 <=      "00"  when expfracR_c5(32) = '1'   -- underflow
           else "10"  when  expfracR_c5(32 downto 31) =  "01" -- overflow
           else "01";      -- 00, normal case
   with exnR0_c5  select 
      exnRfinal_c5 <= 
         exnR_c5   when "01", -- normal
         exnR0_c5  when others;
   R <= exnRfinal_c5 & sR_c5 & expfracR_c5(30 downto 0);
end architecture;



--------------------------------------------------------------------------------
--                RightShifterSticky24_by_max_26_Freq200_uid4
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2008-2011), Florent de Dinechin (2008-2019)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X S
-- Output signals: R Sticky

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifterSticky24_by_max_26_Freq200_uid4 is
    port (clk, ce_1 : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          S : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(25 downto 0);
          Sticky : out  std_logic   );
end entity;

architecture arch of RightShifterSticky24_by_max_26_Freq200_uid4 is
signal ps_c0, ps_c1 :  std_logic_vector(4 downto 0);
signal Xpadded_c0 :  std_logic_vector(25 downto 0);
signal level5_c0 :  std_logic_vector(25 downto 0);
signal stk4_c0, stk4_c1 :  std_logic;
signal level4_c0, level4_c1 :  std_logic_vector(25 downto 0);
signal stk3_c1 :  std_logic;
signal level3_c0, level3_c1 :  std_logic_vector(25 downto 0);
signal stk2_c1 :  std_logic;
signal level2_c0, level2_c1 :  std_logic_vector(25 downto 0);
signal stk1_c1 :  std_logic;
signal level1_c0, level1_c1 :  std_logic_vector(25 downto 0);
signal stk0_c1 :  std_logic;
signal level0_c0 :  std_logic_vector(25 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               ps_c1 <= ps_c0;
               stk4_c1 <= stk4_c0;
               level4_c1 <= level4_c0;
               level3_c1 <= level3_c0;
               level2_c1 <= level2_c0;
               level1_c1 <= level1_c0;
            end if;
         end if;
      end process;
   ps_c0<= S;
   Xpadded_c0 <= X&(1 downto 0 => '0');
   level5_c0<= Xpadded_c0;
   stk4_c0 <= '1' when (level5_c0(15 downto 0)/="0000000000000000" and ps_c0(4)='1')   else '0';
   level4_c0 <=  level5_c0 when  ps_c0(4)='0'    else (15 downto 0 => '0') & level5_c0(25 downto 16);
   stk3_c1 <= '1' when (level4_c1(7 downto 0)/="00000000" and ps_c1(3)='1') or stk4_c1 ='1'   else '0';
   level3_c0 <=  level4_c0 when  ps_c0(3)='0'    else (7 downto 0 => '0') & level4_c0(25 downto 8);
   stk2_c1 <= '1' when (level3_c1(3 downto 0)/="0000" and ps_c1(2)='1') or stk3_c1 ='1'   else '0';
   level2_c0 <=  level3_c0 when  ps_c0(2)='0'    else (3 downto 0 => '0') & level3_c0(25 downto 4);
   stk1_c1 <= '1' when (level2_c1(1 downto 0)/="00" and ps_c1(1)='1') or stk2_c1 ='1'   else '0';
   level1_c0 <=  level2_c0 when  ps_c0(1)='0'    else (1 downto 0 => '0') & level2_c0(25 downto 2);
   stk0_c1 <= '1' when (level1_c1(0 downto 0)/="0" and ps_c1(0)='1') or stk1_c1 ='1'   else '0';
   level0_c0 <=  level1_c0 when  ps_c0(0)='0'    else (0 downto 0 => '0') & level1_c0(25 downto 1);
   R <= level0_c0;
   Sticky <= stk0_c1;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_27_Freq200_uid6
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_27_Freq200_uid6 is
    port (clk, ce_1, ce_2 : in std_logic;
          X : in  std_logic_vector(26 downto 0);
          Y : in  std_logic_vector(26 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(26 downto 0)   );
end entity;

architecture arch of IntAdder_27_Freq200_uid6 is
signal Cin_1_c1, Cin_1_c2 :  std_logic;
signal X_1_c0, X_1_c1, X_1_c2 :  std_logic_vector(27 downto 0);
signal Y_1_c0, Y_1_c1, Y_1_c2 :  std_logic_vector(27 downto 0);
signal S_1_c2 :  std_logic_vector(27 downto 0);
signal R_1_c2 :  std_logic_vector(26 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               X_1_c1 <= X_1_c0;
               Y_1_c1 <= Y_1_c0;
            end if;
            if ce_2 = '1' then
               Cin_1_c2 <= Cin_1_c1;
               X_1_c2 <= X_1_c1;
               Y_1_c2 <= Y_1_c1;
            end if;
         end if;
      end process;
   Cin_1_c1 <= Cin;
   X_1_c0 <= '0' & X(26 downto 0);
   Y_1_c0 <= '0' & Y(26 downto 0);
   S_1_c2 <= X_1_c2 + Y_1_c2 + Cin_1_c2;
   R_1_c2 <= S_1_c2(26 downto 0);
   R <= R_1_c2 ;
end architecture;

--------------------------------------------------------------------------------
--                     Normalizer_Z_28_28_28_Freq200_uid8
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, (2007-2020)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X
-- Output signals: Count R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Normalizer_Z_28_28_28_Freq200_uid8 is
    port (clk, ce_3 : in std_logic;
          X : in  std_logic_vector(27 downto 0);
          Count : out  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(27 downto 0)   );
end entity;

architecture arch of Normalizer_Z_28_28_28_Freq200_uid8 is
signal level5_c2 :  std_logic_vector(27 downto 0);
signal count4_c2, count4_c3 :  std_logic;
signal level4_c2 :  std_logic_vector(27 downto 0);
signal count3_c2, count3_c3 :  std_logic;
signal level3_c2 :  std_logic_vector(27 downto 0);
signal count2_c2, count2_c3 :  std_logic;
signal level2_c2, level2_c3 :  std_logic_vector(27 downto 0);
signal count1_c2, count1_c3 :  std_logic;
signal level1_c3 :  std_logic_vector(27 downto 0);
signal count0_c3 :  std_logic;
signal level0_c3 :  std_logic_vector(27 downto 0);
signal sCount_c3 :  std_logic_vector(4 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_3 = '1' then
               count4_c3 <= count4_c2;
               count3_c3 <= count3_c2;
               count2_c3 <= count2_c2;
               level2_c3 <= level2_c2;
               count1_c3 <= count1_c2;
            end if;
         end if;
      end process;
   level5_c2 <= X ;
   count4_c2<= '1' when level5_c2(27 downto 12) = (27 downto 12=>'0') else '0';
   level4_c2<= level5_c2(27 downto 0) when count4_c2='0' else level5_c2(11 downto 0) & (15 downto 0 => '0');

   count3_c2<= '1' when level4_c2(27 downto 20) = (27 downto 20=>'0') else '0';
   level3_c2<= level4_c2(27 downto 0) when count3_c2='0' else level4_c2(19 downto 0) & (7 downto 0 => '0');

   count2_c2<= '1' when level3_c2(27 downto 24) = (27 downto 24=>'0') else '0';
   level2_c2<= level3_c2(27 downto 0) when count2_c2='0' else level3_c2(23 downto 0) & (3 downto 0 => '0');

   count1_c2<= '1' when level2_c2(27 downto 26) = (27 downto 26=>'0') else '0';
   level1_c3<= level2_c3(27 downto 0) when count1_c3='0' else level2_c3(25 downto 0) & (1 downto 0 => '0');

   count0_c3<= '1' when level1_c3(27 downto 27) = (27 downto 27=>'0') else '0';
   level0_c3<= level1_c3(27 downto 0) when count0_c3='0' else level1_c3(26 downto 0) & (0 downto 0 => '0');

   R <= level0_c3;
   sCount_c3 <= count4_c3 & count3_c3 & count2_c3 & count1_c3 & count0_c3;
   Count <= sCount_c3;
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_34_Freq200_uid11
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_34_Freq200_uid11 is
    port (clk, ce_1, ce_2, ce_3 : in std_logic;
          X : in  std_logic_vector(33 downto 0);
          Y : in  std_logic_vector(33 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(33 downto 0)   );
end entity;

architecture arch of IntAdder_34_Freq200_uid11 is
signal Rtmp_c3 :  std_logic_vector(33 downto 0);
signal Y_c1, Y_c2, Y_c3 :  std_logic_vector(33 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               Y_c1 <= Y;
            end if;
            if ce_2 = '1' then
               Y_c2 <= Y_c1;
            end if;
            if ce_3 = '1' then
               Y_c3 <= Y_c2;
            end if;
         end if;
      end process;
   Rtmp_c3 <= X + Y_c3 + Cin;
   R <= Rtmp_c3;
end architecture;

--------------------------------------------------------------------------------
--                          FloatingPointSubtractor
--                         (FPSub_8_23_Freq200_uid2)
-- VHDL generated for Kintex7 @ 200MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2010-2017)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles
-- Clock period (ns): 5
-- Target frequency (MHz): 200
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FloatingPointSubtractor is
    port (clk, ce_1, ce_2, ce_3 : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          Y : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FloatingPointSubtractor is
   component RightShifterSticky24_by_max_26_Freq200_uid4 is
      port ( clk, ce_1 : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             S : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(25 downto 0);
             Sticky : out  std_logic   );
   end component;

   component IntAdder_27_Freq200_uid6 is
      port ( clk, ce_1, ce_2 : in std_logic;
             X : in  std_logic_vector(26 downto 0);
             Y : in  std_logic_vector(26 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(26 downto 0)   );
   end component;

   component Normalizer_Z_28_28_28_Freq200_uid8 is
      port ( clk, ce_3 : in std_logic;
             X : in  std_logic_vector(27 downto 0);
             Count : out  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(27 downto 0)   );
   end component;

   component IntAdder_34_Freq200_uid11 is
      port ( clk, ce_1, ce_2, ce_3 : in std_logic;
             X : in  std_logic_vector(33 downto 0);
             Y : in  std_logic_vector(33 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(33 downto 0)   );
   end component;

signal excExpFracX_c0 :  std_logic_vector(32 downto 0);
signal excExpFracY_c0 :  std_logic_vector(32 downto 0);
signal swap_c0 :  std_logic;
signal eXmeY_c0 :  std_logic_vector(7 downto 0);
signal eYmeX_c0 :  std_logic_vector(7 downto 0);
signal expDiff_c0 :  std_logic_vector(7 downto 0);
signal mY_c0 :  std_logic_vector(33 downto 0);
signal newX_c0 :  std_logic_vector(33 downto 0);
signal newY_c0 :  std_logic_vector(33 downto 0);
signal expX_c0 :  std_logic_vector(7 downto 0);
signal excX_c0 :  std_logic_vector(1 downto 0);
signal excY_c0 :  std_logic_vector(1 downto 0);
signal signX_c0 :  std_logic;
signal signY_c0 :  std_logic;
signal EffSub_c0, EffSub_c1, EffSub_c2, EffSub_c3 :  std_logic;
signal sXsYExnXY_c0 :  std_logic_vector(5 downto 0);
signal sdExnXY_c0 :  std_logic_vector(3 downto 0);
signal fracY_c0 :  std_logic_vector(23 downto 0);
signal excRt_c0, excRt_c1, excRt_c2, excRt_c3 :  std_logic_vector(1 downto 0);
signal signR_c0, signR_c1, signR_c2, signR_c3 :  std_logic;
signal shiftedOut_c0 :  std_logic;
signal shiftVal_c0 :  std_logic_vector(4 downto 0);
signal shiftedFracY_c0 :  std_logic_vector(25 downto 0);
signal sticky_c1, sticky_c2 :  std_logic;
signal fracYpad_c0 :  std_logic_vector(26 downto 0);
signal EffSubVector_c0 :  std_logic_vector(26 downto 0);
signal fracYpadXorOp_c0 :  std_logic_vector(26 downto 0);
signal fracXpad_c0 :  std_logic_vector(26 downto 0);
signal cInSigAdd_c1 :  std_logic;
signal fracAddResult_c2 :  std_logic_vector(26 downto 0);
signal fracSticky_c2 :  std_logic_vector(27 downto 0);
signal nZerosNew_c3 :  std_logic_vector(4 downto 0);
signal shiftedFrac_c3 :  std_logic_vector(27 downto 0);
signal extendedExpInc_c0, extendedExpInc_c1, extendedExpInc_c2, extendedExpInc_c3 :  std_logic_vector(8 downto 0);
signal updatedExp_c3 :  std_logic_vector(9 downto 0);
signal eqdiffsign_c3 :  std_logic;
signal expFrac_c3 :  std_logic_vector(33 downto 0);
signal stk_c3 :  std_logic;
signal rnd_c3 :  std_logic;
signal lsb_c3 :  std_logic;
signal needToRound_c3 :  std_logic;
signal RoundedExpFrac_c3 :  std_logic_vector(33 downto 0);
signal upExc_c3 :  std_logic_vector(1 downto 0);
signal fracR_c3 :  std_logic_vector(22 downto 0);
signal expR_c3 :  std_logic_vector(7 downto 0);
signal exExpExc_c3 :  std_logic_vector(3 downto 0);
signal excRt2_c3 :  std_logic_vector(1 downto 0);
signal excR_c3 :  std_logic_vector(1 downto 0);
signal signR2_c3 :  std_logic;
signal computedR_c3 :  std_logic_vector(33 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce_1 = '1' then
               EffSub_c1 <= EffSub_c0;
               excRt_c1 <= excRt_c0;
               signR_c1 <= signR_c0;
               extendedExpInc_c1 <= extendedExpInc_c0;
            end if;
            if ce_2 = '1' then
               EffSub_c2 <= EffSub_c1;
               excRt_c2 <= excRt_c1;
               signR_c2 <= signR_c1;
               sticky_c2 <= sticky_c1;
               extendedExpInc_c2 <= extendedExpInc_c1;
            end if;
            if ce_3 = '1' then
               EffSub_c3 <= EffSub_c2;
               excRt_c3 <= excRt_c2;
               signR_c3 <= signR_c2;
               extendedExpInc_c3 <= extendedExpInc_c2;
            end if;
         end if;
      end process;
   excExpFracX_c0 <= X(33 downto 32) & X(30 downto 0);
   excExpFracY_c0 <= Y(33 downto 32) & Y(30 downto 0);
   swap_c0 <= '1' when excExpFracX_c0 < excExpFracY_c0 else '0';
   -- exponent difference
   eXmeY_c0 <= (X(30 downto 23)) - (Y(30 downto 23));
   eYmeX_c0 <= (Y(30 downto 23)) - (X(30 downto 23));
   expDiff_c0 <= eXmeY_c0 when swap_c0 = '0' else eYmeX_c0;
   mY_c0 <= Y(33 downto 32) & not(Y(31)) & Y(30 downto 0);
   -- input swap so that |X|>|Y|
   newX_c0 <= X when swap_c0 = '0' else mY_c0;
   newY_c0 <= mY_c0 when swap_c0 = '0' else X;
   -- now we decompose the inputs into their sign, exponent, fraction
   expX_c0<= newX_c0(30 downto 23);
   excX_c0<= newX_c0(33 downto 32);
   excY_c0<= newY_c0(33 downto 32);
   signX_c0<= newX_c0(31);
   signY_c0<= newY_c0(31);
   EffSub_c0 <= signX_c0 xor signY_c0;
   sXsYExnXY_c0 <= signX_c0 & signY_c0 & excX_c0 & excY_c0;
   sdExnXY_c0 <= excX_c0 & excY_c0;
   fracY_c0 <= "000000000000000000000000" when excY_c0="00" else ('1' & newY_c0(22 downto 0));
   -- Exception management logic
   with sXsYExnXY_c0  select  
   excRt_c0 <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   signR_c0<= '0' when (sXsYExnXY_c0="100000" or sXsYExnXY_c0="010000") else signX_c0;
   shiftedOut_c0 <= '1' when (expDiff_c0 > 25) else '0';
   shiftVal_c0 <= expDiff_c0(4 downto 0) when shiftedOut_c0='0' else CONV_STD_LOGIC_VECTOR(26,5);
   RightShifterComponent: RightShifterSticky24_by_max_26_Freq200_uid4
      port map ( clk  => clk,
                 ce_1 => ce_1,
                 S => shiftVal_c0,
                 X => fracY_c0,
                 R => shiftedFracY_c0,
                 Sticky => sticky_c1);
   fracYpad_c0 <= "0" & shiftedFracY_c0;
   EffSubVector_c0 <= (26 downto 0 => EffSub_c0);
   fracYpadXorOp_c0 <= fracYpad_c0 xor EffSubVector_c0;
   fracXpad_c0 <= "01" & (newX_c0(22 downto 0)) & "00";
   cInSigAdd_c1 <= EffSub_c1 and not sticky_c1; -- if we subtract and the sticky was one, some of the negated sticky bits would have absorbed this carry 
   fracAdder: IntAdder_27_Freq200_uid6
      port map ( clk  => clk,
                 ce_1 => ce_1,
                 ce_2=> ce_2,
                 Cin => cInSigAdd_c1,
                 X => fracXpad_c0,
                 Y => fracYpadXorOp_c0,
                 R => fracAddResult_c2);
   fracSticky_c2<= fracAddResult_c2 & sticky_c2; 
   LZCAndShifter: Normalizer_Z_28_28_28_Freq200_uid8
      port map ( clk  => clk,
                 ce_3 => ce_3,
                 X => fracSticky_c2,
                 Count => nZerosNew_c3,
                 R => shiftedFrac_c3);
   extendedExpInc_c0<= ("0" & expX_c0) + '1';
   updatedExp_c3 <= ("0" &extendedExpInc_c3) - ("00000" & nZerosNew_c3);
   eqdiffsign_c3 <= '1' when nZerosNew_c3="11111" else '0';
   expFrac_c3<= updatedExp_c3 & shiftedFrac_c3(26 downto 3);
   stk_c3<= shiftedFrac_c3(2) or shiftedFrac_c3(1) or shiftedFrac_c3(0);
   rnd_c3<= shiftedFrac_c3(3);
   lsb_c3<= shiftedFrac_c3(4);
   needToRound_c3<= '1' when (rnd_c3='1' and stk_c3='1') or (rnd_c3='1' and stk_c3='0' and lsb_c3='1')
  else '0';
   roundingAdder: IntAdder_34_Freq200_uid11
      port map ( clk  => clk,
                 ce_1 => ce_1,
                 ce_2=> ce_2,
                 ce_3=> ce_3,
                 Cin => needToRound_c3,
                 X => expFrac_c3,
                 Y => "0000000000000000000000000000000000",
                 R => RoundedExpFrac_c3);
   -- possible update to exception bits
   upExc_c3 <= RoundedExpFrac_c3(33 downto 32);
   fracR_c3 <= RoundedExpFrac_c3(23 downto 1);
   expR_c3 <= RoundedExpFrac_c3(31 downto 24);
   exExpExc_c3 <= upExc_c3 & excRt_c3;
   with exExpExc_c3  select  
   excRt2_c3<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   excR_c3 <= "00" when (eqdiffsign_c3='1' and EffSub_c3='1'  and not(excRt_c3="11")) else excRt2_c3;
   signR2_c3 <= '0' when (eqdiffsign_c3='1' and EffSub_c3='1') else signR_c3;
   computedR_c3 <= excR_c3 & signR2_c3 & expR_c3 & fracR_c3;
   R <= computedR_c3;
end architecture;



