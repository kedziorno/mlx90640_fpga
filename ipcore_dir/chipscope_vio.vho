-------------------------------------------------------------------------------
-- Copyright (c) 2025 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.7
--  \   \         Application: Xilinx CORE Generator
--  /   /         Filename   : chipscope_vio.vho
-- /___/   /\     Timestamp  : Sat Nov 08 18:09:43 CET 2025
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: ISE Instantiation template
-- Component Identifier: xilinx.com:ip:chipscope_vio:1.05.a
-------------------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component chipscope_vio
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    ASYNC_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    ASYNC_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    SYNC_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    SYNC_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));

end component;

-- Synplicity black box declaration
attribute syn_black_box : boolean;
attribute syn_black_box of chipscope_vio: component is true;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG

your_instance_name : chipscope_vio
  port map (
    CONTROL => CONTROL,
    CLK => CLK,
    ASYNC_IN => ASYNC_IN,
    ASYNC_OUT => ASYNC_OUT,
    SYNC_IN => SYNC_IN,
    SYNC_OUT => SYNC_OUT);

-- INST_TAG_END ------ End INSTANTIATION Template ------------
