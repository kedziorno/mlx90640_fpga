-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   21:50:49 01/24/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_mem_ramb16_s36_x2
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Testbench
--                Memory is incremental initialize with FP32, step by 0.125
--                First half - 0 - 63.875
--                Second half - -64 - -0.125
--                Address put on bus before RE clock
--                  and data output available after 0.1 ns
--                  otherwise (FE clock) we have glitches
--                  and data output is available after half clock period + 0.1ns
--                On c_mode_seq data is available at next RE clock
--                  (address also on RE clock), but no glitches
--                  When address on FE clock, data appear after 1.5 clock period
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
--    - Modules: -
--    - Processes (Architecture: tb):
--      p_clock_process, p_tb
--
-- Imporant objects: -
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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE ieee.numeric_std.ALL;

use work.global_package.all;

ENTITY tb_mem_ramb16_s36_x2 IS
END tb_mem_ramb16_s36_x2;

ARCHITECTURE tb OF tb_mem_ramb16_s36_x2 IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT mem_ramb16_s36_x2
generic (
constant c_mode : integer := c_mode_com;
INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

INIT_40 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_41 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_42 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_43 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_44 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_45 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_46 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_47 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_48 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_49 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_4F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_50 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_51 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_52 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_53 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_54 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_55 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_56 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_57 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_58 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_59 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_5F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_60 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_61 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_62 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_63 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_64 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_65 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_66 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_67 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_68 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_69 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_6F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_70 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_71 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_72 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_73 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_74 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_75 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_76 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_77 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_78 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_79 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INIT_7F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

INITP_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0a : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0b : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0c : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0d : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0e : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
INITP_0f : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
);
PORT(
DO : OUT  std_logic_vector(31 downto 0);
DOP : OUT  std_logic_vector(3 downto 0);
ADDR : IN  std_logic_vector(9 downto 0);
i_clock : IN  std_logic;
DI : IN  std_logic_vector(31 downto 0);
DIP : IN  std_logic_vector(3 downto 0);
EN : IN  std_logic;
i_reset : IN  std_logic;
WE : IN  std_logic
);
END COMPONENT;

--Inputs
signal ADDR : std_logic_vector(9 downto 0) := (others => '0');
signal CLK : std_logic := '0';
signal DI : std_logic_vector(31 downto 0) := (others => '0');
signal DIP : std_logic_vector(3 downto 0) := (others => '0');
signal EN : std_logic := '0';
signal SSR : std_logic := '0';
signal WE : std_logic := '0';

--Outputs
signal DO : std_logic_vector(31 downto 0);
signal DOP : std_logic_vector(3 downto 0);

-- Clock period definitions
constant CLK_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
mem_ramb16_s36_x2_uut : mem_ramb16_s36_x2
GENERIC MAP (
INIT_00 => X"3f6000003f4000003f2000003f0000003ec000003e8000003e00000022000000",       
INIT_01 => X"3ff000003fe000003fd000003fc000003fb000003fa000003f9000003f800000",
INIT_02 => X"4038000040300000402800004020000040180000401000004008000040000000",
INIT_03 => X"4078000040700000406800004060000040580000405000004048000040400000",
INIT_04 => X"409c0000409800004094000040900000408c0000408800004084000040800000",
INIT_05 => X"40bc000040b8000040b4000040b0000040ac000040a8000040a4000040a00000",
INIT_06 => X"40dc000040d8000040d4000040d0000040cc000040c8000040c4000040c00000",
INIT_07 => X"40fc000040f8000040f4000040f0000040ec000040e8000040e4000040e00000",
INIT_08 => X"410e0000410c0000410a00004108000041060000410400004102000041000000",
INIT_09 => X"411e0000411c0000411a00004118000041160000411400004112000041100000",
INIT_0a => X"412e0000412c0000412a00004128000041260000412400004122000041200000",
INIT_0b => X"413e0000413c0000413a00004138000041360000413400004132000041300000",
INIT_0c => X"414e0000414c0000414a00004148000041460000414400004142000041400000",
INIT_0d => X"415e0000415c0000415a00004158000041560000415400004152000041500000",
INIT_0e => X"416e0000416c0000416a00004168000041660000416400004162000041600000",
INIT_0f => X"417e0000417c0000417a00004178000041760000417400004172000041700000",
INIT_10 => X"4187000041860000418500004184000041830000418200004181000041800000",
INIT_11 => X"418f0000418e0000418d0000418c0000418b0000418a00004189000041880000",
INIT_12 => X"4197000041960000419500004194000041930000419200004191000041900000",
INIT_13 => X"419f0000419e0000419d0000419c0000419b0000419a00004199000041980000",
INIT_14 => X"41a7000041a6000041a5000041a4000041a3000041a2000041a1000041a00000",
INIT_15 => X"41af000041ae000041ad000041ac000041ab000041aa000041a9000041a80000",
INIT_16 => X"41b7000041b6000041b5000041b4000041b3000041b2000041b1000041b00000",
INIT_17 => X"41bf000041be000041bd000041bc000041bb000041ba000041b9000041b80000",
INIT_18 => X"41c7000041c6000041c5000041c4000041c3000041c2000041c1000041c00000",
INIT_19 => X"41cf000041ce000041cd000041cc000041cb000041ca000041c9000041c80000",
INIT_1a => X"41d7000041d6000041d5000041d4000041d3000041d2000041d1000041d00000",
INIT_1b => X"41df000041de000041dd000041dc000041db000041da000041d9000041d80000",
INIT_1c => X"41e7000041e6000041e5000041e4000041e3000041e2000041e1000041e00000",
INIT_1d => X"41ef000041ee000041ed000041ec000041eb000041ea000041e9000041e80000",
INIT_1e => X"41f7000041f6000041f5000041f4000041f3000041f2000041f1000041f00000",
INIT_1f => X"41ff000041fe000041fd000041fc000041fb000041fa000041f9000041f80000",
INIT_20 => X"4203800042030000420280004202000042018000420100004200800042000000",
INIT_21 => X"4207800042070000420680004206000042058000420500004204800042040000",
INIT_22 => X"420b8000420b0000420a8000420a000042098000420900004208800042080000",
INIT_23 => X"420f8000420f0000420e8000420e0000420d8000420d0000420c8000420c0000",
INIT_24 => X"4213800042130000421280004212000042118000421100004210800042100000",
INIT_25 => X"4217800042170000421680004216000042158000421500004214800042140000",
INIT_26 => X"421b8000421b0000421a8000421a000042198000421900004218800042180000",
INIT_27 => X"421f8000421f0000421e8000421e0000421d8000421d0000421c8000421c0000",
INIT_28 => X"4223800042230000422280004222000042218000422100004220800042200000",
INIT_29 => X"4227800042270000422680004226000042258000422500004224800042240000",
INIT_2a => X"422b8000422b0000422a8000422a000042298000422900004228800042280000",
INIT_2b => X"422f8000422f0000422e8000422e0000422d8000422d0000422c8000422c0000",
INIT_2c => X"4233800042330000423280004232000042318000423100004230800042300000",
INIT_2d => X"4237800042370000423680004236000042358000423500004234800042340000",
INIT_2e => X"423b8000423b0000423a8000423a000042398000423900004238800042380000",
INIT_2f => X"423f8000423f0000423e8000423e0000423d8000423d0000423c8000423c0000",
INIT_30 => X"4243800042430000424280004242000042418000424100004240800042400000",
INIT_31 => X"4247800042470000424680004246000042458000424500004244800042440000",
INIT_32 => X"424b8000424b0000424a8000424a000042498000424900004248800042480000",
INIT_33 => X"424f8000424f0000424e8000424e0000424d8000424d0000424c8000424c0000",
INIT_34 => X"4253800042530000425280004252000042518000425100004250800042500000",
INIT_35 => X"4257800042570000425680004256000042558000425500004254800042540000",
INIT_36 => X"425b8000425b0000425a8000425a000042598000425900004258800042580000",
INIT_37 => X"425f8000425f0000425e8000425e0000425d8000425d0000425c8000425c0000",
INIT_38 => X"4263800042630000426280004262000042618000426100004260800042600000",
INIT_39 => X"4267800042670000426680004266000042658000426500004264800042640000",
INIT_3a => X"426b8000426b0000426a8000426a000042698000426900004268800042680000",
INIT_3b => X"426f8000426f0000426e8000426e0000426d8000426d0000426c8000426c0000",
INIT_3c => X"4273800042730000427280004272000042718000427100004270800042700000",
INIT_3d => X"4277800042770000427680004276000042758000427500004274800042740000",
INIT_3e => X"427b8000427b0000427a8000427a000042798000427900004278800042780000",
INIT_3f => X"427f8000427f0000427e8000427e0000427d8000427d0000427c8000427c0000",
INIT_40 => X"c27c8000c27d0000c27d8000c27e0000c27e8000c27f0000c27f8000c2800000",
INIT_41 => X"c2788000c2790000c2798000c27a0000c27a8000c27b0000c27b8000c27c0000",
INIT_42 => X"c2748000c2750000c2758000c2760000c2768000c2770000c2778000c2780000",
INIT_43 => X"c2708000c2710000c2718000c2720000c2728000c2730000c2738000c2740000",
INIT_44 => X"c26c8000c26d0000c26d8000c26e0000c26e8000c26f0000c26f8000c2700000",
INIT_45 => X"c2688000c2690000c2698000c26a0000c26a8000c26b0000c26b8000c26c0000",
INIT_46 => X"c2648000c2650000c2658000c2660000c2668000c2670000c2678000c2680000",
INIT_47 => X"c2608000c2610000c2618000c2620000c2628000c2630000c2638000c2640000",
INIT_48 => X"c25c8000c25d0000c25d8000c25e0000c25e8000c25f0000c25f8000c2600000",
INIT_49 => X"c2588000c2590000c2598000c25a0000c25a8000c25b0000c25b8000c25c0000",
INIT_4a => X"c2548000c2550000c2558000c2560000c2568000c2570000c2578000c2580000",
INIT_4b => X"c2508000c2510000c2518000c2520000c2528000c2530000c2538000c2540000",
INIT_4c => X"c24c8000c24d0000c24d8000c24e0000c24e8000c24f0000c24f8000c2500000",
INIT_4d => X"c2488000c2490000c2498000c24a0000c24a8000c24b0000c24b8000c24c0000",
INIT_4e => X"c2448000c2450000c2458000c2460000c2468000c2470000c2478000c2480000",
INIT_4f => X"c2408000c2410000c2418000c2420000c2428000c2430000c2438000c2440000",
INIT_50 => X"c23c8000c23d0000c23d8000c23e0000c23e8000c23f0000c23f8000c2400000",
INIT_51 => X"c2388000c2390000c2398000c23a0000c23a8000c23b0000c23b8000c23c0000",
INIT_52 => X"c2348000c2350000c2358000c2360000c2368000c2370000c2378000c2380000",
INIT_53 => X"c2308000c2310000c2318000c2320000c2328000c2330000c2338000c2340000",
INIT_54 => X"c22c8000c22d0000c22d8000c22e0000c22e8000c22f0000c22f8000c2300000",
INIT_55 => X"c2288000c2290000c2298000c22a0000c22a8000c22b0000c22b8000c22c0000",
INIT_56 => X"c2248000c2250000c2258000c2260000c2268000c2270000c2278000c2280000",
INIT_57 => X"c2208000c2210000c2218000c2220000c2228000c2230000c2238000c2240000",
INIT_58 => X"c21c8000c21d0000c21d8000c21e0000c21e8000c21f0000c21f8000c2200000",
INIT_59 => X"c2188000c2190000c2198000c21a0000c21a8000c21b0000c21b8000c21c0000",
INIT_5a => X"c2148000c2150000c2158000c2160000c2168000c2170000c2178000c2180000",
INIT_5b => X"c2108000c2110000c2118000c2120000c2128000c2130000c2138000c2140000",
INIT_5c => X"c20c8000c20d0000c20d8000c20e0000c20e8000c20f0000c20f8000c2100000",
INIT_5d => X"c2088000c2090000c2098000c20a0000c20a8000c20b0000c20b8000c20c0000",
INIT_5e => X"c2048000c2050000c2058000c2060000c2068000c2070000c2078000c2080000",
INIT_5f => X"c2008000c2010000c2018000c2020000c2028000c2030000c2038000c2040000",
INIT_60 => X"c1f90000c1fa0000c1fb0000c1fc0000c1fd0000c1fe0000c1ff0000c2000000",
INIT_61 => X"c1f10000c1f20000c1f30000c1f40000c1f50000c1f60000c1f70000c1f80000",
INIT_62 => X"c1e90000c1ea0000c1eb0000c1ec0000c1ed0000c1ee0000c1ef0000c1f00000",
INIT_63 => X"c1e10000c1e20000c1e30000c1e40000c1e50000c1e60000c1e70000c1e80000",
INIT_64 => X"c1d90000c1da0000c1db0000c1dc0000c1dd0000c1de0000c1df0000c1e00000",
INIT_65 => X"c1d10000c1d20000c1d30000c1d40000c1d50000c1d60000c1d70000c1d80000",
INIT_66 => X"c1c90000c1ca0000c1cb0000c1cc0000c1cd0000c1ce0000c1cf0000c1d00000",
INIT_67 => X"c1c10000c1c20000c1c30000c1c40000c1c50000c1c60000c1c70000c1c80000",
INIT_68 => X"c1b90000c1ba0000c1bb0000c1bc0000c1bd0000c1be0000c1bf0000c1c00000",
INIT_69 => X"c1b10000c1b20000c1b30000c1b40000c1b50000c1b60000c1b70000c1b80000",
INIT_6a => X"c1a90000c1aa0000c1ab0000c1ac0000c1ad0000c1ae0000c1af0000c1b00000",
INIT_6b => X"c1a10000c1a20000c1a30000c1a40000c1a50000c1a60000c1a70000c1a80000",
INIT_6c => X"c1990000c19a0000c19b0000c19c0000c19d0000c19e0000c19f0000c1a00000",
INIT_6d => X"c1910000c1920000c1930000c1940000c1950000c1960000c1970000c1980000",
INIT_6e => X"c1890000c18a0000c18b0000c18c0000c18d0000c18e0000c18f0000c1900000",
INIT_6f => X"c1810000c1820000c1830000c1840000c1850000c1860000c1870000c1880000",
INIT_70 => X"c1720000c1740000c1760000c1780000c17a0000c17c0000c17e0000c1800000",
INIT_71 => X"c1620000c1640000c1660000c1680000c16a0000c16c0000c16e0000c1700000",
INIT_72 => X"c1520000c1540000c1560000c1580000c15a0000c15c0000c15e0000c1600000",
INIT_73 => X"c1420000c1440000c1460000c1480000c14a0000c14c0000c14e0000c1500000",
INIT_74 => X"c1320000c1340000c1360000c1380000c13a0000c13c0000c13e0000c1400000",
INIT_75 => X"c1220000c1240000c1260000c1280000c12a0000c12c0000c12e0000c1300000",
INIT_76 => X"c1120000c1140000c1160000c1180000c11a0000c11c0000c11e0000c1200000",
INIT_77 => X"c1020000c1040000c1060000c1080000c10a0000c10c0000c10e0000c1100000",
INIT_78 => X"c0e40000c0e80000c0ec0000c0f00000c0f40000c0f80000c0fc0000c1000000",
INIT_79 => X"c0c40000c0c80000c0cc0000c0d00000c0d40000c0d80000c0dc0000c0e00000",
INIT_7a => X"c0a40000c0a80000c0ac0000c0b00000c0b40000c0b80000c0bc0000c0c00000",
INIT_7b => X"c0840000c0880000c08c0000c0900000c0940000c0980000c09c0000c0a00000",
INIT_7c => X"c0480000c0500000c0580000c0600000c0680000c0700000c0780000c0800000",
INIT_7d => X"c0080000c0100000c0180000c0200000c0280000c0300000c0380000c0400000",
INIT_7e => X"bf900000bfa00000bfb00000bfc00000bfd00000bfe00000bff00000c0000000",
INIT_7f => X"be000000be800000bec00000bf000000bf200000bf400000bf600000bf800000"
)
PORT MAP (
DO => DO,
DOP => DOP,
ADDR => ADDR,
i_clock => CLK,
DI => DI,
DIP => DIP,
EN => EN,
i_reset => SSR,
WE => WE
);

-- Clock process definitions
p_clock_process : process
begin
CLK <= '1';
wait for CLK_period/2;
CLK <= '0';
wait for CLK_period/2;
end process p_clock_process;

-- Stimulus process
p_tb : process
begin		
-- hold reset state for 100 ns.
ssr <= '1';
wait for 100 ns;	
ssr <= '0';
wait for CLK_period*10;
-- insert stimulus here
en <= '1';
wait for CLK_period/2;
wait for CLK_period/2;
wait for CLK_period/2;
wait for CLK_period/2;
addr <= std_logic_vector (to_unsigned (111,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (222,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (333,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (444,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (555,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (666,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (777,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (888,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (999,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (1023,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (1024,10));
wait for CLK_period*2;
addr <= std_logic_vector (to_unsigned (1025,10));
wait for CLK_period*2;

report "done" severity failure;
end process p_tb;

end architecture tb;

