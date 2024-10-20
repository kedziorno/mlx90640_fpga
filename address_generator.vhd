library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity address_generator is
Generic (
PIXELS : integer := 0;
ADDRESS1 : integer := 0
);
  Port ( 
    reset : in std_logic;
		clk : in STD_LOGIC;
		clk25 : in STD_LOGIC;
    enable : in STD_LOGIC;
    vsync : in STD_LOGIC;
		activeh : in STD_LOGIC;
    address : out STD_LOGIC_VECTOR (ADDRESS1-1 downto 0)
  );  
end address_generator;


architecture Behavioral of address_generator is


signal addr: STD_LOGIC_VECTOR(address'range) := (others => '0');

type states is (idle,
a0,a,a1,b,b1,c,c1,d,d1,e,e1,f,f1,g,g1,h,h1,i,i1,j,j1,k,k1,l,l1,m,m1,n,n1,o,o1,p,p1,r,r1,s,s1,t,t1,u,u1,w,w1,y,y1,z,z1,x,x1
);

signal penable : std_logic;
begin

--address <= addr;

p0 : process (clk) is
begin
	if (rising_edge(clk)) then
		if (reset='1') then
			addr <= (others => '0');
		else
			if (enable = '1') then
				if (addr = PIXELS-1) then
					addr <= (others => '0');
				else
					addr <= addr+1;
				end if;
			else
				addr <= addr;
			end if;
			if (vsync = '0') then
				addr <= (others => '0');
			end if;
		end if;
	end if;
end process p0;

process (clk25)

variable va : std_logic_vector(address'range);
variable addr1 : std_logic_vector(address'range);
constant CCOUNT1 : integer := 32;
variable count1 : integer range 0 to CCOUNT1-1;

variable state : states;
constant C_ROWS : integer := 19;
variable rows : integer range 0 to C_ROWS-1;
constant CW8 : integer := 159; -- must wait on HFP/HBP
variable w8 : integer range 0 to CW8-1;
constant CW81 : integer := 19; -- must wait on HFP/HBP
variable w81 : integer range 0 to CW8-1;

begin
if rising_edge (clk25) then
	if (reset = '1') then
		va := (others => '0');
		state := idle;
		count1 := 0;
		address <= (others => '0');
--		count2 := 0;
		rows := 0;
		w8 := 0;
	else
--  address <= addr;
penable <= enable;
			case (state) is
				when idle =>
					if (penable = '0' and enable = '1' and activeh = '1') then
--					if (enable = '0' and activeh = '1') then
--						state := d;
						state := a;
--						address <= addr;
						count1 := 0;
						rows := 0;
						w8 := 0;
					else
						state := idle;
					end if;
					addr1 := addr;
					va := std_logic_vector(to_unsigned(to_integer(unsigned(addr1)),addr'left+1));
--				when d =>
--					if (w8 = CW8-1) then
--						state := a;
--						va := std_logic_vector(to_unsigned(to_integer(unsigned(addr)),addr'left+1));
--						address <= addr;
--						count1 := 0;
--						rows := 0;
--						w8 := 0;
--					else
--						w8 := w8 + 1;
--						state := d;
--					end if;
				when a =>
					addr1 := std_logic_vector(to_unsigned(to_integer(unsigned(va))+count1,addr'left+1));
					if (w81 = CW81-1) then
						w81 := 0;
						state := e;
					else
						w81 := w81 + 1;
						state := a;
					end if;
				when e =>
					if (count1 = CCOUNT1-1) then
						state := b;
						count1 := 0;
					else
						state := a;
						count1 := count1 + 1;
					end if;					
				when b =>
					if (w8 = CW8-1) then
						w8 := 0;
						state := c;
					else
						w8 := w8 + 1;
						state := b;
					end if;
				when c =>
					if (rows = C_ROWS-1) then
						rows := 0;
						state := idle;
					else
						rows := rows + 1;
						state := a;
					end if;
				when others => null;
			end case;
address <= addr1;

		end if;

		if vsync = '0' then -- this V depend from VGA
			state := idle;
			addr1 := (others => '0');
		end if;

end if;

end process;    
end Behavioral;

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
----use IEEE.STD_LOGIC_ARITH.ALL;
----use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use ieee.numeric_std.all;
--
--entity address_generator is
--Generic (
--PIXELS : integer := 0;
--ADDRESS1 : integer := 0
--);
--  Port ( 
--    reset : in std_logic;
--		clk : in STD_LOGIC;
--    enable : in STD_LOGIC;
--    vsync : in STD_LOGIC;
--    address : out STD_LOGIC_VECTOR (ADDRESS1-1 downto 0)
--  );  
--end address_generator;
--
--
--architecture Behavioral of address_generator is
--
--signal addr: STD_LOGIC_VECTOR(address'range) := (others => '0');
--signal va,a1,a0 : std_logic_vector(address'range);
--  
--begin
--
----address <= addr;
----addr := a1 when enable='1' else a0 when enable = '0' else (others => '0');
--
--process (clk,reset)
--constant CMAX1 : integer := 160;
----constant CMAX2 : integer := 3;
--variable vmax1 : integer range 0 to CMAX1*3-1;
----variable vmax2 : integer range 0 to CMAX2-1;
--variable tva,ta1,ta0 : std_logic_vector(address'range);
--begin
--if (reset = '1') then
--tva := (others => '0');
--ta0 := (others => '0');
--ta1 := (others => '0');
--addr := (others => '0');
--vmax1 := 0;
----vmax2 := 0;
--	elsif rising_edge (clk) then
--		if (enable='1') then
--			if (to_integer(unsigned(addr)) = PIXELS-1) then
--			ta1 := (others => '0');
--			else
--			ta1 := std_logic_vector(to_unsigned(to_integer(unsigned(ta1))+1,address'left+1));
--			end if;
----			report "va : "&integer'image(to_integer(unsigned(va))) severity warning;
--			tva := std_logic_vector(to_unsigned(to_integer(unsigned(ta1))-CMAX1,address'left+1));
--			addr := ta1;
--			vmax1 := 0;
----		else
----			addr := addr;
----			va := (others => '0');
----			a1 <= ta1;
--va := tva;
--address <= ta1;
--end if;
--if (enable='0') then
----a0 <= (others => '0');
----						va := std_logic_vector(to_unsigned(to_integer(unsigned(addr))-CMAX1-1,address'left+1));
----addr := addr;
----			if (vmax2 = CMAX2-1) then
----				vmax2 <= 0;
----			else
----if (vmax2 = CMAX2-1) then
----a0 <= (others => '0');
----vmax2 <= 0;
----vmax1 <= 0;
----va := (others => '0');
----else
----ta0 := (others => '0');
----vmax2 <= 0;
----vmax1 := 0;
----tva := (others => '0');
----vmax1 := 0;
--				if (vmax1 >= 0 and vmax1 < CMAX1*1) then
--				tva := (others => '0');
----					va := std_logic_vector(to_unsigned(to_integer(unsigned(va))+1,address'left+1));
----					vmax1 <= vmax1 + 1;
----vmax1 := vmax1 + 1;				
----				ta0 := std_logic_vector(to_unsigned(to_integer(unsigned(tva))+to_integer(unsigned(addr))-CMAX1,address'left+1));
----				tva := std_logic_vector(to_unsigned(vmax1,address'left+1));
--				end if;
--				if (vmax1 >= CMAX1*1 and vmax1 < CMAX1*2) then
------					tva := std_logic_vector(to_unsigned(to_integer(unsigned(addr))-CMAX1+1,address'left+1));
------					va := (others => '0');
----ta0 := (others => '0');
----vmax2 <= 0;
----vmax1 := 0;
--tva := (others => '0');
----vmax1 := vmax1 + 1;
----				ta0 := std_logic_vector(to_unsigned(to_integer(unsigned(tva))+to_integer(unsigned(addr))-2*CMAX1,address'left+1));
----				tva := std_logic_vector(to_unsigned(vmax1,address'left+1));
--
----				if (vmax1 <= CMAX1*2-1) then
----					va := std_logic_vector(to_unsigned(to_integer(unsigned(va))+1,address'left+1));
----					vmax1 <= vmax1 + 1;
----				va := std_logic_vector(to_unsigned(vmax1-CMAX1,address'left+1));
----				a0 <= std_logic_vector(to_unsigned(to_integer(unsigned(addr))+to_integer(unsigned(va)),address'left+1));
----				end if;
----				vmax2 <= vmax2 + 1;
--					
--				end if;
--				if (vmax1 >= CMAX1*2 and vmax1 < CMAX1*3) then
--				tva := (others => '0');
----				vmax1 := vmax1 + 1;
----				ta0 := std_logic_vector(to_unsigned(to_integer(unsigned(tva))+to_integer(unsigned(addr))-3*CMAX1,address'left+1));
----				tva := std_logic_vector(to_unsigned(vmax1,address'left+1));
--
------					tva := std_logic_vector(to_unsigned(to_integer(unsigned(addr))-CMAX1+1,address'left+1));
------					va := (others => '0');
----ta0 := (others => '0');
----vmax2 <= 0;
----vmax1 := 0;
----tva := addr;
--				end if;
--va := tva;
--address <= ta0;
--
--		end if;
--		if vsync = '0' then -- this V depend from VGA
--			addr := (others => '0');
--		end if;
--	end if;
----	tva := va;
--end process;    
--end Behavioral;

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity address_generator is
--Generic (
--PIXELS : integer := 0;
--ADDRESS1 : integer := 0
--);
--  Port ( 
--    reset : in std_logic;
--		clk : in STD_LOGIC;
--    enable : in STD_LOGIC;
--    vsync : in STD_LOGIC;
--    address : out STD_LOGIC_VECTOR (ADDRESS1-1 downto 0)
--  );  
--end address_generator;
--
--
--architecture Behavioral of address_generator is
--
--  signal addr: STD_LOGIC_VECTOR(address'range) := (others => '0');
--  
--begin
--
--  address <= addr; 
--
--process (clk,reset) begin
--if (reset = '1') then
--addr := (others => '0');
--	elsif rising_edge (clk) then
--		if (enable='1') then
--			if (addr = PIXELS-1) then
--			addr := (others => '0');
--			else
--			addr := addr + 1 ;
--			end if;
--		else
--		addr := addr;
--		end if;
--		
--		if vsync = '0' then -- this V depend from VGA
--			addr := (others => '0');
--		end if;
--	end if;
--end process;    
--end Behavioral;
