-- Vhdl test bench created from schematic /home/user/workspace/melexis_mlx90641/ExtractKtaParameters.sch - Wed Jun 14 14:35:36 2023
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY ExtractKtaParameters_ExtractKtaParameters_sch_tb IS
END ExtractKtaParameters_ExtractKtaParameters_sch_tb;
ARCHITECTURE behavioral OF ExtractKtaParameters_ExtractKtaParameters_sch_tb IS 

   COMPONENT ExtractKtaParameters
   PORT( i_addr	:	IN	STD_LOGIC_VECTOR (9 DOWNTO 0); 
          i_clock	:	IN	STD_LOGIC; 
          i_reset	:	IN	STD_LOGIC; 
          o_rdy	:	OUT	STD_LOGIC; 
          divfpr	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          addfpr	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          mulfpr	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          i2c_mem_douta	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          divfprdy	:	IN	STD_LOGIC; 
          addfprdy	:	IN	STD_LOGIC; 
          mulfprdy	:	IN	STD_LOGIC; 
          i_run	:	IN	STD_LOGIC; 
          i2c_mem_ena	:	OUT	STD_LOGIC; 
          mulfpond	:	OUT	STD_LOGIC; 
          mulfpsclr	:	OUT	STD_LOGIC; 
          mulfpce	:	OUT	STD_LOGIC; 
          addfpond	:	OUT	STD_LOGIC; 
          addfpsclr	:	OUT	STD_LOGIC; 
          addfpce	:	OUT	STD_LOGIC; 
          divfpond	:	OUT	STD_LOGIC; 
          divfpsclr	:	OUT	STD_LOGIC; 
          divfpce	:	OUT	STD_LOGIC; 
          i2c_mem_addra	:	OUT	STD_LOGIC_VECTOR (11 DOWNTO 0); 
          mulfpa	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          mulfpb	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          addfpa	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          addfpb	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          divfpa	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          divfpb	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          o_do	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0));
   END COMPONENT;

   SIGNAL i_addr	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
   SIGNAL i_clock	:	STD_LOGIC;
   SIGNAL i_reset	:	STD_LOGIC;
   SIGNAL o_rdy	:	STD_LOGIC;
   SIGNAL divfpr	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL addfpr	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL mulfpr	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL i2c_mem_douta	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL divfprdy	:	STD_LOGIC;
   SIGNAL addfprdy	:	STD_LOGIC;
   SIGNAL mulfprdy	:	STD_LOGIC;
   SIGNAL i_run	:	STD_LOGIC;
   SIGNAL i2c_mem_ena	:	STD_LOGIC;
   SIGNAL mulfpond	:	STD_LOGIC;
   SIGNAL mulfpsclr	:	STD_LOGIC;
   SIGNAL mulfpce	:	STD_LOGIC;
   SIGNAL addfpond	:	STD_LOGIC;
   SIGNAL addfpsclr	:	STD_LOGIC;
   SIGNAL addfpce	:	STD_LOGIC;
   SIGNAL divfpond	:	STD_LOGIC;
   SIGNAL divfpsclr	:	STD_LOGIC;
   SIGNAL divfpce	:	STD_LOGIC;
   SIGNAL i2c_mem_addra	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
   SIGNAL mulfpa	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL mulfpb	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL addfpa	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL addfpb	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL divfpa	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL divfpb	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL o_do	:	STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN

   UUT: ExtractKtaParameters PORT MAP(
		i_addr => i_addr, 
		i_clock => i_clock, 
		i_reset => i_reset, 
		o_rdy => o_rdy, 
		divfpr => divfpr, 
		addfpr => addfpr, 
		mulfpr => mulfpr, 
		i2c_mem_douta => i2c_mem_douta, 
		divfprdy => divfprdy, 
		addfprdy => addfprdy, 
		mulfprdy => mulfprdy, 
		i_run => i_run, 
		i2c_mem_ena => i2c_mem_ena, 
		mulfpond => mulfpond, 
		mulfpsclr => mulfpsclr, 
		mulfpce => mulfpce, 
		addfpond => addfpond, 
		addfpsclr => addfpsclr, 
		addfpce => addfpce, 
		divfpond => divfpond, 
		divfpsclr => divfpsclr, 
		divfpce => divfpce, 
		i2c_mem_addra => i2c_mem_addra, 
		mulfpa => mulfpa, 
		mulfpb => mulfpb, 
		addfpa => addfpa, 
		addfpb => addfpb, 
		divfpa => divfpa, 
		divfpb => divfpb, 
		o_do => o_do
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
