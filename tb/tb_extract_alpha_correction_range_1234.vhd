-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   15:56:05 02/06/2023
-- Design Name:   mlx90640_fpga
-- Module Name:   tb_ExtractAlphaCorrRange1234
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   TestBench
--                *** --- MODULE NOT TESTED, NOT FINISHED, NOT WORK --- ***
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files:
--    (...)
--  - Modules:
--    (...)
--
-- Revision:
--  - Revision 0.01 - File created
--    - Files:
--      (...)
--    - Modules:
--      (...)
--    - Processes (Architecture: (...)):
--      (...)
--
-- Important objects:
--  - (...)
--
-- Information from the software vendor:
--  - Messeges:
--    (...)
--  - Bugs:
--    (...)
--  - Notices:
--    (...)
--  - Infos:
--    (...)
--  - Notes:
--    (...)
--  - Criticals/Failures:
--    (...)
--
-- Concepts/Milestones:
-- (...)
--
-- Additional Comments:
--  - To read more about:
--    - denotes - see documentation/header_denotes.vhd
--    - practices - see documentation/header_practices.vhd
--
-------------------------------------------------------------------------------

--Mon Feb 6 15:56:05 2023

-- TestBench Template 
-- ExtractAlphaCorrRange1234

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.global_package.all;

ENTITY tb_ExtractAlphaCorrRange1234 IS
END tb_ExtractAlphaCorrRange1234;

ARCHITECTURE tb OF tb_ExtractAlphaCorrRange1234 IS 

-- Component Declaration
component ExtractAlphaCorrRange1234 is
port (
i_clock : in std_logic;
i_reset : in std_logic;
i_run : in std_logic;
i_ee0x243d : in slv16; -- ksto1ee,ksto2ee
i_ee0x243e : in slv16; -- ksto3ee,ksto4ee
i_ee0x243f : in slv16; -- kstoscale,ct34param
o_2powx_p8_ena : out std_logic;
o_2powx_p8_adr : out std_logic_vector (3 downto 0);
i_rom_constants_float : in std_logic_vector (31 downto 0);
o_alphacorrrange1 : out std_logic_vector (31 downto 0);
o_alphacorrrange2 : out std_logic_vector (31 downto 0);
o_alphacorrrange3 : out std_logic_vector (31 downto 0);
o_alphacorrrange4 : out std_logic_vector (31 downto 0);
o_rdy : out std_logic
);
end component ExtractAlphaCorrRange1234;

signal ExtractAlphaCorrRange1234_clock : std_logic := '0';
signal ExtractAlphaCorrRange1234_reset : std_logic := '0';
signal ExtractAlphaCorrRange1234_run : std_logic := '0';
signal ExtractAlphaCorrRange1234_ee0x243d : slv16 := (others => '0'); -- ksto1ee,ksto2ee
signal ExtractAlphaCorrRange1234_ee0x243e : slv16 := (others => '0'); -- ksto3ee,ksto4ee
signal ExtractAlphaCorrRange1234_ee0x243f : slv16 := (others => '0'); -- kstoscale,ct34param
signal ExtractAlphaCorrRange1234_2powx_p8_ena : std_logic := '0';
signal ExtractAlphaCorrRange1234_2powx_p8_adr : std_logic_vector (3 downto 0) := (others => '0');
signal ExtractAlphaCorrRange1234_rom_constants_float : std_logic_vector (31 downto 0);
signal ExtractAlphaCorrRange1234_alphacorrrange1 : std_logic_vector (31 downto 0);
signal ExtractAlphaCorrRange1234_alphacorrrange2 : std_logic_vector (31 downto 0);
signal ExtractAlphaCorrRange1234_alphacorrrange3 : std_logic_vector (31 downto 0);
signal ExtractAlphaCorrRange1234_alphacorrrange4 : std_logic_vector (31 downto 0);
signal ExtractAlphaCorrRange1234_rdy : std_logic;

COMPONENT rom_constants                                                                                                                                                     
PORT(                                                                                                                                                                       
i_clock : IN  std_logic;                                                                                                                                                    
i_reset : IN  std_logic;                                                                                                                                                    
i_kvptat_en : IN  std_logic;                                                                                                                                                
i_kvptat_adr : IN  std_logic_vector(5 downto 0);                                                                                                                            
i_alphaptat_en : IN  std_logic;                                                                                                                                             
i_alphaptat_adr : IN  std_logic_vector(3 downto 0);                                                                                                                         
i_signed4bit_en : IN  std_logic;                                                                                                                                            
i_signed4bit_adr : IN  std_logic_vector(3 downto 0);                                                                                                                        
i_signed6bit_en : IN  std_logic;                                                                                                                                            
i_signed6bit_adr : IN  std_logic_vector(5 downto 0);                                                                                                                        
i_alphascale_1_en : IN  std_logic;                                                                                                                                          
i_alphascale_1_adr : IN  std_logic_vector(3 downto 0);                                                                                                                      
i_2powx_4bit_en : IN  std_logic;                                                                                                                                            
i_2powx_4bit_adr : IN  std_logic_vector(3 downto 0);                                                                                                                        
i_cpratio_en : IN  std_logic;                                                                                                                                               
i_cpratio_adr : IN  std_logic_vector(5 downto 0);                                                                                                                           
i_alphascale_2_en : IN  std_logic;                                                                                                                                          
i_alphascale_2_adr : IN  std_logic_vector(3 downto 0);                                                                                                                      
i_2powx_p8_4bit_en : IN  std_logic;                                                                                                                                         
i_2powx_p8_4bit_adr : IN  std_logic_vector(3 downto 0);                                                                                                                     
i_signed3bit_en : IN  std_logic;                                                                                                                                            
i_signed3bit_adr : IN  std_logic_vector(2 downto 0);                                                                                                                        
o_float : OUT  std_logic_vector(31 downto 0)                                                                                                                                
);                                                                                                                                                                          
END COMPONENT rom_constants;
signal i_kvptat_en : std_logic := '0';                                                                                                                                      
signal i_kvptat_adr : std_logic_vector(5 downto 0) := (others => '0');                                                                                                      
signal i_alphaptat_en : std_logic := '0';                                                                                                                                   
signal i_alphaptat_adr : std_logic_vector(3 downto 0) := (others => '0');                                                                                                   
signal i_signed4bit_en : std_logic := '0';                                                                                                                                  
signal i_signed4bit_adr : std_logic_vector(3 downto 0) := (others => '0');                                                                                                  
signal i_signed6bit_en : std_logic := '0';                                                                                                                                  
signal i_signed6bit_adr : std_logic_vector(5 downto 0) := (others => '0');                                                                                                  
signal i_alphascale_1_en : std_logic := '0';                                                                                                                                
signal i_alphascale_1_adr : std_logic_vector(3 downto 0) := (others => '0');                                                                                                
signal i_2powx_4bit_en : std_logic := '0';                                                                                                                                  
signal i_2powx_4bit_adr : std_logic_vector(3 downto 0) := (others => '0');                                                                                                  
signal i_cpratio_en : std_logic := '0';                                                                                                                                     
signal i_cpratio_adr : std_logic_vector(5 downto 0) := (others => '0');                                                                                                     
signal i_alphascale_2_en : std_logic := '0';                                                                                                                                
signal i_alphascale_2_adr : std_logic_vector(3 downto 0) := (others => '0');                                                                                                
signal i_2powx_p8_4bit_en : std_logic := '0';                                                                                                                               
signal i_2powx_p8_4bit_adr : std_logic_vector(3 downto 0) := (others => '0');                                                                                               
signal i_signed3bit_en : std_logic := '0';                                                                                                                                  
signal i_signed3bit_adr : std_logic_vector(2 downto 0) := (others => '0');                                                                                                  
signal o_float : std_logic_vector(31 downto 0);

constant clockperiod : time := 10 ns;

BEGIN

uut : ExtractAlphaCorrRange1234 port map (
i_clock => ExtractAlphaCorrRange1234_clock,
i_reset => ExtractAlphaCorrRange1234_reset,
i_run => ExtractAlphaCorrRange1234_run,
i_ee0x243d => ExtractAlphaCorrRange1234_ee0x243d,
i_ee0x243e => ExtractAlphaCorrRange1234_ee0x243e,
i_ee0x243f => ExtractAlphaCorrRange1234_ee0x243f,
o_2powx_p8_ena => ExtractAlphaCorrRange1234_2powx_p8_ena,
o_2powx_p8_adr => ExtractAlphaCorrRange1234_2powx_p8_adr,
i_rom_constants_float => ExtractAlphaCorrRange1234_rom_constants_float,
o_alphacorrrange1 => ExtractAlphaCorrRange1234_alphacorrrange1,
o_alphacorrrange2 => ExtractAlphaCorrRange1234_alphacorrrange2,
o_alphacorrrange3 => ExtractAlphaCorrRange1234_alphacorrrange3,
o_alphacorrrange4 => ExtractAlphaCorrRange1234_alphacorrrange4,
o_rdy => ExtractAlphaCorrRange1234_rdy
);

clkp0 : process
begin
	ExtractAlphaCorrRange1234_clock <= '0';
	wait for clockperiod/2;
	ExtractAlphaCorrRange1234_clock <= '1';
	wait for clockperiod/2;
end process clkp0;

-- Component Instantiation

--  Test Bench Statements
tbprocess : PROCESS
BEGIN
ExtractAlphaCorrRange1234_reset <= '1';
wait for 100 ns; -- wait until global set/reset completes
ExtractAlphaCorrRange1234_reset <= '0';
-- Add user defined stimulus here
wait for clockperiod;
ExtractAlphaCorrRange1234_ee0x243f <= x"2889";
ExtractAlphaCorrRange1234_ee0x243d <= x"9797";
ExtractAlphaCorrRange1234_ee0x243e <= x"9797";
wait for clockperiod;
ExtractAlphaCorrRange1234_run <= '1'; wait for clockperiod; ExtractAlphaCorrRange1234_run <= '0';
wait for 3 us;

report "done" severity failure;
END PROCESS tbprocess;
--  End Test Bench 

rom_constants_i0 : rom_constants PORT MAP (                                                                                                                                 
i_clock => ExtractAlphaCorrRange1234_clock,                                                                                                                                 
i_reset => ExtractAlphaCorrRange1234_reset,                                                                                                                                 
i_kvptat_en => '0',                                                                                                                                                         
i_kvptat_adr => (others => '0'),                                                                                                                                            
i_alphaptat_en => '0',                                                                                                                                                      
i_alphaptat_adr => (others => '0'),                                                                                                                                         
i_signed4bit_en => '0',                                                                                                                
i_signed4bit_adr => (others => '0'),                                                                                                               
i_signed6bit_en => '0',                                                                                                                
i_signed6bit_adr => (others => '0'),                                                                                                               
i_alphascale_1_en => '0',                                                                                                                                                   
i_alphascale_1_adr => (others => '0'),                                                                                                                                      
i_2powx_4bit_en => '0',                                                                                                                
i_2powx_4bit_adr => (others => '0'),                                                                                                               
i_cpratio_en => '0',                                                                                                                                                        
i_cpratio_adr => (others => '0'),                                                                                                                                           
i_alphascale_2_en => '0',                                                                                                                                                   
i_alphascale_2_adr => (others => '0'),                                                                                                                                      
i_2powx_p8_4bit_en => ExtractAlphaCorrRange1234_2powx_p8_ena,                                                                                                                                                  
i_2powx_p8_4bit_adr => ExtractAlphaCorrRange1234_2powx_p8_adr,                                                                                                                                     
i_signed3bit_en => '0',                                                                                                                                                     
i_signed3bit_adr => (others => '0'),                                                                                                                                        
o_float => ExtractAlphaCorrRange1234_rom_constants_float                                                                                                                    
);

END tb;
