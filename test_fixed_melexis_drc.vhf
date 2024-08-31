--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : test_fixed_melexis_drc.vhf
-- /___/   /\     Timestamp : 06/06/2023 22:33:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: /home/user/.local/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -sympath /home/user/workspace/melexis_mlx90641/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl test_fixed_melexis_drc.vhf -w /home/user/workspace/melexis_mlx90641/test_fixed_melexis.sch
--Design Name: test_fixed_melexis
--Device: virtex4
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity test_fixed_melexis is
   port ( );
end test_fixed_melexis;

architecture BEHAVIORAL of test_fixed_melexis is
   signal XLXI_1_a_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_1_b_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_1_ce_openSignal           : std_logic;
   signal XLXI_1_clk_openSignal          : std_logic;
   signal XLXI_1_operation_nd_openSignal : std_logic;
   signal XLXI_1_sclr_openSignal         : std_logic;
   signal XLXI_2_a_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_2_b_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_2_ce_openSignal           : std_logic;
   signal XLXI_2_clk_openSignal          : std_logic;
   signal XLXI_2_operation_nd_openSignal : std_logic;
   signal XLXI_2_sclr_openSignal         : std_logic;
   signal XLXI_3_a_openSignal            : std_logic_vector (63 downto 0);
   signal XLXI_3_ce_openSignal           : std_logic;
   signal XLXI_3_clk_openSignal          : std_logic;
   signal XLXI_3_operation_nd_openSignal : std_logic;
   signal XLXI_3_sclr_openSignal         : std_logic;
   signal XLXI_4_a_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_4_b_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_4_ce_openSignal           : std_logic;
   signal XLXI_4_clk_openSignal          : std_logic;
   signal XLXI_4_operation_nd_openSignal : std_logic;
   signal XLXI_4_sclr_openSignal         : std_logic;
   signal XLXI_5_a_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_5_b_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_5_ce_openSignal           : std_logic;
   signal XLXI_5_clk_openSignal          : std_logic;
   signal XLXI_5_operation_nd_openSignal : std_logic;
   signal XLXI_5_sclr_openSignal         : std_logic;
   signal XLXI_6_a_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_6_ce_openSignal           : std_logic;
   signal XLXI_6_clk_openSignal          : std_logic;
   signal XLXI_6_operation_nd_openSignal : std_logic;
   signal XLXI_6_sclr_openSignal         : std_logic;
   signal XLXI_7_a_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_7_b_openSignal            : std_logic_vector (31 downto 0);
   signal XLXI_7_ce_openSignal           : std_logic;
   signal XLXI_7_clk_openSignal          : std_logic;
   signal XLXI_7_operation_nd_openSignal : std_logic;
   signal XLXI_7_sclr_openSignal         : std_logic;
   component addfp
      port ( a            : in    std_logic_vector (31 downto 0); 
             b            : in    std_logic_vector (31 downto 0); 
             operation_nd : in    std_logic; 
             sclr         : in    std_logic; 
             ce           : in    std_logic; 
             clk          : in    std_logic; 
             result       : out   std_logic_vector (31 downto 0); 
             rdy          : out   std_logic);
   end component;
   
   component divfp
      port ( a            : in    std_logic_vector (31 downto 0); 
             b            : in    std_logic_vector (31 downto 0); 
             operation_nd : in    std_logic; 
             sclr         : in    std_logic; 
             ce           : in    std_logic; 
             clk          : in    std_logic; 
             result       : out   std_logic_vector (31 downto 0); 
             rdy          : out   std_logic);
   end component;
   
   component fixed2float
      port ( a            : in    std_logic_vector (63 downto 0); 
             operation_nd : in    std_logic; 
             sclr         : in    std_logic; 
             ce           : in    std_logic; 
             clk          : in    std_logic; 
             result       : out   std_logic_vector (31 downto 0); 
             rdy          : out   std_logic);
   end component;
   
   component mulfp
      port ( a            : in    std_logic_vector (31 downto 0); 
             b            : in    std_logic_vector (31 downto 0); 
             operation_nd : in    std_logic; 
             sclr         : in    std_logic; 
             ce           : in    std_logic; 
             clk          : in    std_logic; 
             result       : out   std_logic_vector (31 downto 0); 
             rdy          : out   std_logic);
   end component;
   
   component sqrtfp2
      port ( a            : in    std_logic_vector (31 downto 0); 
             operation_nd : in    std_logic; 
             sclr         : in    std_logic; 
             ce           : in    std_logic; 
             clk          : in    std_logic; 
             result       : out   std_logic_vector (31 downto 0); 
             rdy          : out   std_logic);
   end component;
   
   component subfp
      port ( a            : in    std_logic_vector (31 downto 0); 
             b            : in    std_logic_vector (31 downto 0); 
             operation_nd : in    std_logic; 
             sclr         : in    std_logic; 
             ce           : in    std_logic; 
             clk          : in    std_logic; 
             result       : out   std_logic_vector (31 downto 0); 
             rdy          : out   std_logic);
   end component;
   
begin
   XLXI_1 : addfp
      port map (a(31 downto 0)=>XLXI_1_a_openSignal(31 downto 0),
                b(31 downto 0)=>XLXI_1_b_openSignal(31 downto 0),
                ce=>XLXI_1_ce_openSignal,
                clk=>XLXI_1_clk_openSignal,
                operation_nd=>XLXI_1_operation_nd_openSignal,
                sclr=>XLXI_1_sclr_openSignal,
                rdy=>open,
                result=>open);
   
   XLXI_2 : divfp
      port map (a(31 downto 0)=>XLXI_2_a_openSignal(31 downto 0),
                b(31 downto 0)=>XLXI_2_b_openSignal(31 downto 0),
                ce=>XLXI_2_ce_openSignal,
                clk=>XLXI_2_clk_openSignal,
                operation_nd=>XLXI_2_operation_nd_openSignal,
                sclr=>XLXI_2_sclr_openSignal,
                rdy=>open,
                result=>open);
   
   XLXI_3 : fixed2float
      port map (a(63 downto 0)=>XLXI_3_a_openSignal(63 downto 0),
                ce=>XLXI_3_ce_openSignal,
                clk=>XLXI_3_clk_openSignal,
                operation_nd=>XLXI_3_operation_nd_openSignal,
                sclr=>XLXI_3_sclr_openSignal,
                rdy=>open,
                result=>open);
   
   XLXI_4 : divfp
      port map (a(31 downto 0)=>XLXI_4_a_openSignal(31 downto 0),
                b(31 downto 0)=>XLXI_4_b_openSignal(31 downto 0),
                ce=>XLXI_4_ce_openSignal,
                clk=>XLXI_4_clk_openSignal,
                operation_nd=>XLXI_4_operation_nd_openSignal,
                sclr=>XLXI_4_sclr_openSignal,
                rdy=>open,
                result=>open);
   
   XLXI_5 : mulfp
      port map (a(31 downto 0)=>XLXI_5_a_openSignal(31 downto 0),
                b(31 downto 0)=>XLXI_5_b_openSignal(31 downto 0),
                ce=>XLXI_5_ce_openSignal,
                clk=>XLXI_5_clk_openSignal,
                operation_nd=>XLXI_5_operation_nd_openSignal,
                sclr=>XLXI_5_sclr_openSignal,
                rdy=>open,
                result=>open);
   
   XLXI_6 : sqrtfp2
      port map (a(31 downto 0)=>XLXI_6_a_openSignal(31 downto 0),
                ce=>XLXI_6_ce_openSignal,
                clk=>XLXI_6_clk_openSignal,
                operation_nd=>XLXI_6_operation_nd_openSignal,
                sclr=>XLXI_6_sclr_openSignal,
                rdy=>open,
                result=>open);
   
   XLXI_7 : subfp
      port map (a(31 downto 0)=>XLXI_7_a_openSignal(31 downto 0),
                b(31 downto 0)=>XLXI_7_b_openSignal(31 downto 0),
                ce=>XLXI_7_ce_openSignal,
                clk=>XLXI_7_clk_openSignal,
                operation_nd=>XLXI_7_operation_nd_openSignal,
                sclr=>XLXI_7_sclr_openSignal,
                rdy=>open,
                result=>open);
   
end BEHAVIORAL;


