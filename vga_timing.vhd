-------------------------------------------------------------------------------
-- Company:       HomeDL
-- Engineer:      ko
-------------------------------------------------------------------------------
-- Create Date:   12:20:07 12/25/2024
-- Design Name:   mlx90640_fpga
-- Module Name:   vga_timing
-- Project Name:  mlx90640_fpga
-- Target Device: xc3s1200e-fg320-4, xc4vsx35-ff668-10
-- Tool versions: Xilinx ISE 14.7, XST and ISIM
-- Description:   Generate VGA Industrial timing IP Core.
--                Based on : http://www.tinyvga.com/vga-timing/640x480@60Hz
--
--                 O-------------------------------------------------------O
--                 * General timing                                        *
--                 * VGA Signal 640 x 480 @ 60 Hz Industry standard timing *
--                 O---------------------+----------------+----------------O
--                 | Screen refresh rate |  60       Hz   |
--                 |    Vertical refresh |  31.46875 kHz  |
--                 |         Pixel freq. |  25.175   MHz  |
--                 +---------------------*----------------+
--
--                 O-------------------------------------------------------O
--                 * Scanline part Pixels Time [us]                        *
--                 * Horizontal timing (line)                              *
--                 * Polarity of horizontal sync pulse is negative.        *
--                 O--------------+-----+-----------------+----------------O
--                 | Visible area | 640 | 25.422045680238 |
--                 |  Front porch |  16 |  0.635551142006 |
--                 |   Sync pulse |  96 |  3.813306852036 |
--                 |   Back porch |  48 |  1.906653426018 |
--                 |   Whole line | 800 | 31.777557100298 |
--                 +--------------+-----+-----------------+
--
--                 O-------------------------------------------------------O
--                 * Frame part Lines Time [ms]                            *
--                 * Vertical timing (frame)                               *
--                 * Polarity of vertical sync pulse is negative.          *
--                 O--------------+-----+-----------------+----------------O
--                 | Visible area | 480 | 15.253227408143 |
--                 |  Front porch |  10 |  0.317775571003 |
--                 |   Sync pulse |   2 |  0.063555114201 |
--                 |   Back porch |  33 |  1.048659384310 |
--                 |  Whole frame | 525 | 16.683217477656 |
--                 +--------------+-----+-----------------+
--                (Rest is in commented code)
--
-- Dependencies:
--  - Files: -
--  - Modules: -
--
-- Revision:
--  - Revision 0.01a - File created
--    - Files: -
--    - Modules: -
--    - Processes (Architecture: industry_standard_640x480_timing):
--      p_hv_counters - 2 counters in one process.
--
-- Important objects:
--  - Entity signals:
--    - i_clock - ~25 MHz.
--    - o_blank - for devices like ADV7125 (and for simulation BMP output).
--    - o_h_blank, o_v_blank - distinguish o_blank signal (for counters).
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_timing is
port (
i_clock   : in  std_logic;
i_reset   : in  std_logic;
o_hsync   : out std_logic;
o_vsync   : out std_logic;
o_blank   : out std_logic;
o_v_blank : out std_logic;
o_h_blank : out std_logic
);
end entity vga_timing;

architecture industry_standard_640x480_timing of vga_timing is

  -- Clock periods (ns) :                      40.000    , 39.720       , 39.722
  --                                          -----------------------------------------
  constant h_visible_area : integer := 640; -- 25.640    , 25.42080     , 25.422080
  constant h_front_porch  : integer :=  16; --  0.640    ,  0.635520    ,  0.6355520
  constant h_sync_pulse   : integer :=  96; --  3.840    ,  3.813120    ,  3.8133120
  constant h_back_porch   : integer :=  48; --  1.880    ,  1.906560    ,  1.9066560
  constant whole_line     : integer := 800; -- 32.0      , 31.77760     , 31.77760
  --                                          -----------------------------------------
  constant v_visible_area : integer := 480; -- 15.385640 , 15.24612480  , 15.246892480
  constant v_front_porch  : integer :=  10; --  0.29440  ,  0.292378920 ,  0.2923936420
  constant v_sync_pulse   : integer :=   2; --  0.0640   ,  0.0635520   ,  0.06355520
  constant v_back_porch   : integer :=  33; --  1.055960 ,  1.080344280 ,  1.0803986780
  constant whole_frame    : integer := 525; -- 16.80     , 16.68240     , 16.683240

  signal h_counter : integer range 0 to whole_line  - 1;
  signal v_counter : integer range 0 to whole_frame - 1;

begin

  o_blank <= '1' when i_reset = '1' else
    '0' when (
      h_counter < h_visible_area
      and
      v_counter < v_visible_area
    ) else '1';

  o_h_blank <=
    '0' when h_counter < h_visible_area
    else '1';

  o_v_blank <=
    '0' when v_counter < v_visible_area
    else '1';

  p_hv_counters : process (i_clock, i_reset) is
  begin
    if (i_reset = '1') then
      h_counter <= 0;
      v_counter <= 0;
    elsif (rising_edge (i_clock)) then
      if (h_counter = whole_line - 1) then
        h_counter <= 0;
        if (v_counter = whole_frame - 1) then
          v_counter <= 0;
        else
          v_counter <= v_counter + 1;
        end if;
      else
        h_counter <= h_counter + 1;
      end if;
      if (
        h_counter > (h_visible_area + h_front_porch               )
        and
        h_counter < (h_visible_area + h_front_porch + h_sync_pulse)
      ) then
        o_hsync <= '0';
      else
        o_hsync <= '1';
      end if;
      if (
        v_counter > (v_visible_area + v_front_porch               )
        and
        v_counter < (v_visible_area + v_front_porch + v_sync_pulse)
      ) then
        o_vsync <= '0';
      else
        o_vsync <= '1';
      end if;
    end if;
  end process p_hv_counters;

end architecture industry_standard_640x480_timing;

-----------------------------------------------------------
---- This entity synchronize hsync and vsync to vga
---- Thanks to Pong P. Chu for creating basic things.
----------------------------------------------------------
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--
--entity VGA_timing_synch is
--    Port ( reset : in std_logic; vgaclk25 : in  STD_LOGIC;
--           Hsync : out  STD_LOGIC;
--           Vsync : out  STD_LOGIC;
--           activeArea1 : out  STD_LOGIC;
--					 activehaaddrgen : out STD_LOGIC;
--					 activeRender1 : out  STD_LOGIC;
--					 blank : out STD_LOGIC);
--end VGA_timing_synch;
--
--architecture Behavioral of VGA_timing_synch is
--
--constant HD : INTEGER := 640;
--constant HFP : INTEGER := 16;
--constant HSP : INTEGER := 96;
--constant HBP : INTEGER := 48;
--
--constant VD : INTEGER := 480;
--constant VFP : INTEGER := 10;
--constant VSP : INTEGER := 2;
--constant VBP : INTEGER := 33;
--
----signal clk_vga : STD_LOGIC;
----signal hcnt,vcnt : INTEGER range 0 to 1023 := 0;
--signal hPos,vPos : integer range 0 to 1023 := 0;
----signal thPos,tvPos : std_logic_vector(9 downto 0);
--signal videoOn : std_logic;
----signal thsync,tvsync : std_logic;
--
--signal h,v : std_logic;
--
----signal ph,pv : std_logic;
--
----signal v120 : std_logic;
--
--signal activeh : std_logic;
--
----signal tactiveArea1 : std_logic;
--
--begin
--
--activehaaddrgen <= activeh;
----activeArea1 <= display_flag;
----count_proc : process(clk_vga,vcnt,hcnt,reset) begin
----if (reset = '1') then
----hcnt <= 0;
----vcnt <= 0;
----		elsif rising_edge(clk_vga) then
----			if (hcnt = (HD+HFP+HSP+HBP)) then
----				hcnt <= 0;
----				if (vcnt = (VD+VFP+VSP+VBP)) then
----					vcnt <= 0;
----				else
----					vcnt <= vcnt + 1;
----				end if;
----			else
----				hcnt <= hcnt +1;
----			end if;
----		end if;
----end process count_proc;
----
----p1 : process (vgaclk25,reset) is
----type states is (idle,p0a,p0b);
----variable state : states := idle;
----constant C1 : integer := 120*640; --(VD-VFP-VSP-VBP)/4;
----constant C2 : integer := 480*640; --VD;
----variable i : integer range 0 to C2-1;
----begin
----if (reset = '1') then
----state := idle;
----v120 <= '0';
----pv <= '0';
----i := 0;
----elsif (rising_edge(vgaclk25)) then
----		pv <= activeh;
----		case (state) is
----			when idle =>
----				v120 <= '0';
----				if (pv = '0' and activeh = '1') then
----					state := p0a;
----				else
----					state := idle;
----				end if;
----				i := 0;
----			when p0a =>
----				v120 <= '1';
----				if (i = C1-1) then
----					state := p0b;
----					i := 0;
----				else
----					state := p0a;
----					i := i + 1;
----				end if;
----			when p0b =>
----				v120 <= '0';
----				if (i = C2-1) then
----					state := idle;
----					i := 0;
----				else
----					state := p0b;
----					i := i + 1;
----				end if;
----		end case;
----	end if;
----end process p1;
--
----p0 : process (vgaclk25,reset) is
----type states is (idle,idle1a,p0a,p0b,p0c,p0d,p0e);
----variable state : states := idle;
----variable count1 : integer range 0 to 1023 := 0;
----variable counter2 : integer range 0 to HBP-1 := 0;
----begin
----if (reset = '1') then
----state := idle;
----count1 := 0;
----counter2 := 0;
----ph <= '0';
----tactiveArea1 <= '0';
----elsif (rising_edge(vgaclk25)) then
----	ph <= h;
----		case (state) is
----			when idle =>
----				if (display_flag = '1') then
----					if (ph = '0' and h = '1') then
----						state := idle1a;
----						counter2 := 0;
----						state := p0a;
----					else
----						state := idle;
----					end if;
----				else
----					state := idle;
----				end if;
----				tactiveArea1 <= '0';
----				count1 := 0;
----			when idle1a =>
----				if (counter2 = HBP-1) then
----					state := p0a;
----					counter2 := 0;
----				else
----					state := idle1a;
----					counter2 := counter2 + 1;
----				end if;
----			when p0a =>
----				if (v120 = '1') then
----					if (count1 = HD-1) then
----						count1 := 0;
----						state := p0b;
----						state := p0e;
----					else
----						count1 := count1 + 1;
----						state := p0a;
----					end if;
----					tactiveArea1 <= '1';
----				end if;
----			when p0b =>
----				if (v120 = '1') then
----					if (count1 = 160-1) then
----						count1 := 0;
----						state := p0c;
----					else
----						count1 := count1 + 1;
----						state := p0b;
----					end if;
----					tactiveArea1 <= '0';
----				end if;
----			when p0c =>
----				if (v120 = '1') then
----					if (count1 = 160-1) then
----						count1 := 0;
----						state := p0d;
----					else
----						count1 := count1 + 1;
----						state := p0c;
----					end if;
----					tactiveArea1 <= '0';
----				end if;
----			when p0d =>
----				if (v120 = '1') then
----					if (count1 = 160-1) then
----						count1 := 0;
----						state := p0e;
----						state := idle;
----					else
----						count1 := count1 + 1;
----						state := p0d;
----					end if;
----					tactiveArea1 <= '0';
----				end if;
----			when p0e =>
----				if (v120 = '1') then
----					if (count1 = HFP-1) then
----						count1 := 0;
----						state := idle;
----					else
----						count1 := count1 + 1;
----						state := p0e;
----					end if;
----					tactiveArea1 <= '0';
----				end if;
----		end case;
----	end if;
----end process p0;
----activeRender1 <= tactiveArea1;
--
----aaproc : process(clk_vga,reset) is
----begin
----if (reset = '1') then
----activeArea1 <= '0';
----activeArea2 <= '0';
----activeArea3 <= '0';
----activeArea4 <= '0';
----elsif (rising_edge(clk_vga)) then
----if ((hcnt >= 0 and hcnt < 160) and (vcnt < 120)) then
----activeArea1 <= '1';
----activeArea2 <= '0';
----activeArea3 <= '0';
----activeArea4 <= '0';
----elsif ((hcnt >= 160 and hcnt < 320) and (vcnt < 120)) then
----activeArea2 <= '1';
----activeArea1 <= '0';
----activeArea3 <= '0';
----activeArea4 <= '0';
----elsif ((hcnt >= 320 and hcnt < 480) and (vcnt < 120)) then
----activeArea3 <= '1';
----activeArea1 <= '0';
----activeArea2 <= '0';
----activeArea4 <= '0';
----elsif ((hcnt >= 480 and hcnt < 640) and (vcnt < 120)) then
----activeArea4 <= '1';
----activeArea1 <= '0';
----activeArea2 <= '0';
----activeArea3 <= '0';
----else
----activeArea4 <= '0';
----activeArea1 <= '0';
----activeArea2 <= '0';
----activeArea3 <= '0';
----end if;
----end if;
----end process;
----
----activeArea1 <= '1' when (hcnt >= 0 and hcnt < 160) and (vcnt >= 0 and vcnt < 120) else '0';
----activeArea2 <= '1' when (hcnt >= 160 and hcnt < 320) and (vcnt >= 0 and vcnt < 120) else '0';
----activeArea3 <= '1' when (hcnt >= 320 and hcnt < 480) and (vcnt >= 0 and vcnt < 120) else '0';
----activeArea4 <= '1' when (hcnt >= 480 and hcnt < 640) and (vcnt >= 0 and vcnt < 120) else '0';
----
------activeArea1 <= '1' when (hcnt >= 0 and hcnt < 160) and (vcnt >= 0 and vcnt < 120) else '0';
------activeArea2 <= '1' when (hcnt >= 0 and hcnt < 160) and (vcnt >= 120 and vcnt < 240) else '0';
------activeArea3 <= '1' when (hcnt >= 0 and hcnt < 160) and (vcnt >= 240 and vcnt < 360) else '0';
------activeArea4 <= '1' when (hcnt >= 0 and hcnt < 160) and (vcnt >= 360 and vcnt < 480) else '0';
----
----activeArea1 <= '1' when (hcnt <= HD) and (vcnt <= VD) else '0';
----activeArea1 <= '1' when (hcnt <= HD) and (vcnt <= VD) else '0';
----activeRender1 <= '1' when (hcnt <= HD) and ((vcnt <= VD) and ((vcnt mod 4 = 0))) else '0';
----activeArea1 <= '1' when (hcnt < 160) and (vcnt < 120) else '0';
----activeArea2 <= '0';
----activeArea3 <= '0';
----activeArea4 <= '0';
--
----p3 : process (vgaclk25,reset,h) is
----	constant C_PW : integer := 95;
------	constant C_FP : integer := 16+320+160;
------	constant C_FP : integer := 16+320;
----	constant C_FP : integer := 16;
----	constant C_BP : integer := 48;
------	constant C_DISP : integer := 640-320-160;
------	constant C_DISP : integer := 640-320;
----	constant C_DISP : integer := 640;
----	variable pwh : integer range 0 to C_PW - 1 := 0;
----	variable fph : integer range 0 to C_FP - 1 := 0;
----	variable bph : integer range 0 to C_BP - 1 := 0;
----	variable disph : integer range 0 to C_DISP - 1 := 0;
----	type statesh is (idleh,state_pwh,state_fph,state_disph,state_bph);
----	variable stateh : statesh;
----begin
----	if (reset = '1') then
----		fph := 0;
----		bph := 0;
----		disph := 0;
----		stateh := idleh;
----		display_flag <= '0';
----		hPos <= 0;
----		vPos <= 0;
----		thPos <= (others => '0');
----		tvPos <= (others => '0');
----	elsif (rising_edge(vgaclk25)) then
----		case (stateh) is
----			when idleh =>
----				hPos <= 0;
----				display_flag <= '0';
----				h <= '0';
----				if (activeh = '1') then
----					vPos <= vPos + 1;
----					stateh := state_pwh;
----				else
----					stateh := idleh;
----				end if;
----			when state_pwh =>
----				hPos <= hPos + 1;
----				display_flag <= '0';
----				h <= '0';
----				if (pwh = C_PW - 1) then
----					stateh := state_bph;
----					pwh := 0;
----				else
----					stateh := state_pwh;
----					pwh := pwh + 1;
----				end if;
----			when state_bph =>
----				hPos <= hPos + 1;
----				display_flag <= '0';
----				h <= '1';
----				if (bph = C_BP - 1) then
----					stateh := state_disph;
----					bph := 0;
----				else
----					stateh := state_bph;
----					bph := bph + 1;
----				end if;
----			when state_disph =>
----				hPos <= hPos + 1;
----				display_flag <= '1';
----				h <= '1';
----				if (disph = C_DISP - 1) then
----					stateh := state_fph;
----					disph := 0;
----				else
----					stateh := state_disph;
----					disph := disph + 1;
----				end if;
----			when state_fph =>
----				hPos <= hPos + 1;
----				display_flag <= '0';
----				h <= '1';
----				if (fph = C_FP - 1) then
----					stateh := idleh;
----					fph := 0;
----				else
----					stateh := state_fph;
----					fph := fph + 1;
----				end if;
----		end case;
----		thPos <= std_logic_vector(to_unsigned(hPos,10));
----		tvPos <= std_logic_vector(to_unsigned(vPos,10));
----	end if;
----end process p3;
----
----p4 : process (vgaclk25,reset,v) is
----	constant C_PW : integer := 2*800;
------	constant C_FP : integer := 8000+192000+96000;
------	constant C_FP : integer := 8000+192000;
----	constant C_FP : integer := 10*800;
----	constant C_BP : integer := 33*800; -- 29,33
------	constant C_BP : integer := 29*800; -- 29,33
------	constant C_BP : integer := 31*800; -- 29,33
------	constant C_DISP : integer := 384000-192000-96000;
------	constant C_DISP : integer := 384000-192000;
----	constant C_DISP : integer := 480*800;
----	variable pwv : integer range 0 to C_PW - 1 := 0;
----	variable fpv : integer range 0 to C_FP - 1 := 0;
----	variable bpv : integer range 0 to C_BP - 1 := 0;
----	variable dispv : integer range 0 to C_DISP - 1 := 0;
----	type statesv is (idle,state_pwv,state_fpv,state_dispv,state_bpv);
----	variable statev : statesv;
----begin
----	if (reset = '1') then
----		pwv := 0;
----		fpv := 0;
----		bpv := 0;
----		dispv := 0;
------		statev := idle;
----		statev := state_pwv;
----		activeh <= '0';
------		vPos <= 0;
------		tvPos <= (others => '0');
----	elsif (rising_edge(vgaclk25)) then
----		case (statev) is
------			when idle => statev := state_pwv;
------				vPos <= 0;
----			when state_pwv =>
------				vPos <= vPos + 1;
----				activeh <= '0';
----				v <= '0';
----				if (pwv = C_PW - 1) then
----					statev := state_bpv;
----					pwv := 0;
----				else
----					statev := state_pwv;
----					pwv := pwv + 1;
----				end if;
----			when state_bpv =>
------				vPos <= vPos + 1;
----				activeh <= '0';
----				v <= '1';
----				if (bpv = C_BP - 1) then
----					statev := state_dispv;
----					bpv := 0;
----				else
----					statev := state_bpv;
----					bpv := bpv + 1;
----				end if;
----			when state_dispv =>
------				vPos <= vPos + 1;
----				activeh <= '1';
----				v <= '1';
----				if (dispv = C_DISP - 1) then
----					statev := state_fpv;
----					dispv := 0;
----				else
----					statev := state_dispv;
----					dispv := dispv + 1;
----				end if;
----			when state_fpv =>
------				vPos <= vPos + 1;
----				activeh <= '0';
----				v <= '1';
----				if (fpv = C_FP - 1) then
------					statev := idle;
----					statev := state_pwv;
----					fpv := 0;
----				else
----					statev := state_fpv;
----					fpv := fpv + 1;
----				end if;
----			when others => null;
----		end case;
------		tvPos <= std_logic_vector(to_unsigned(vPos,10));
----	end if;
----end process p4;
--
--Hsync <= h;
--Vsync <= v;
--
----Hsync <= h;
----Vsync <= v;
--activeh <= '1';
--activeArea1 <= '1' when (hPos <= HD) and (vPos <= VD) else '0';
----
--hsync_gen : process(vgaclk25,reset) begin
--	if rising_edge(vgaclk25) then
--if (reset = '1') then
--h <= '0';
--elsif (hPos >= (HD+HFP) and hPos <= (HD+HFP+HSP)) then 
--			h <= '0';
--		else
--			h <= '1';
--		end if;
--	end if;
--end process hsync_gen;
--
--vsync_gen : process(vgaclk25,reset) begin
--	if rising_edge(vgaclk25) then
--if (reset = '1') then
--v <= '0';
--elsif (vPos >= (VD+VFP) and vPos <= (VD+VFP+VSP)) then
--			v <= '0';
--		else
--			v <= '1';
--		end if;
--	end if;
--end process vsync_gen;
--
--Horizontal_position_counter:process(vgaclk25, reset)
--begin
--	if(rising_edge(vgaclk25))then
--	if(reset = '1')then
--		hpos <= 0;
--elsif (hPos = (HD + HFP + HSP + HBP)-1) then
--				hPos <= 0;
--			else
--				hPos <= hPos + 1;
--			end if;
--	end if;
--end process;
--
--Vertical_position_counter:process(vgaclk25, reset, hPos)
--begin
--	if(rising_edge(vgaclk25))then
--	if(reset = '1')then
--		vPos <= 0;
--elsif(hPos = (HD + HFP + HSP + HBP)-1)then
--				if (vPos = (VD + VFP + VSP + VBP)-1) then
--					vPos <= 0;
--				else
--					vPos <= vPos + 1;
--				end if;
--			end if;
--	end if;
--end process;
----
--
----Hsync <= thsync;
----Vsync <= tvsync;
----
----Horizontal_Synchronisation:process(vgaclk25, reset, hPos)
----begin
----	if(reset = '1')then
----		thsync <= '0';
----	elsif(rising_edge(vgaclk25))then
----		if((hPos <= (HD + HFP)) OR (hPos > HD + HFP + HSP))then
----			thsync <= '1';
----		else
----			thsync <= '0';
----		end if;
----	end if;
----end process;
----
----Vertical_Synchronisation:process(vgaclk25, reset, vPos)
----begin
----	if(reset = '1')then
----		tvsync <= '0';
----	elsif(rising_edge(vgaclk25))then
----		if((vPos <= (VD + VFP)) OR (vPos > VD + VFP + VSP))then
----			tvsync <= '1';
----		else
----			tvsync <= '0';
----		end if;
----	end if;
----end process;
--
--video_on:process(vgaclk25, reset, hPos, vPos)
--begin
--	if(rising_edge(vgaclk25))then
--	if(reset = '1')then
--		videoOn <= '0';
--elsif((hPos <= HD and vPos <= VD) and (
----		if((hPos >= 145 and hPos < 785) and (
--
----(vPos = 1) or
----(vPos = 24) or
----(vPos = 48) or
----(vPos = 72) or
----(vPos = 96) or
----(vPos = 120) or
----(vPos = 144) or
----(vPos = 168) or
----(vPos = 192) or
----(vPos = 216) or
----(vPos = 240) or
----(vPos = 264) or
----(vPos = 288) or
----(vPos = 312) or
----(vPos = 336) or
----(vPos = 360) or
----(vPos = 384) or
----(vPos = 408) or
----(vPos = 432) or
----(vPos = 456)
--
--(vPos = 0) or
--(vPos = 20) or
--(vPos = 40) or
--(vPos = 60) or
--(vPos = 80) or
--(vPos = 100) or
--(vPos = 120) or
--(vPos = 140) or
--(vPos = 160) or
--(vPos = 180) or
--(vPos = 200) or
--(vPos = 220) or
--(vPos = 240) or
--(vPos = 260) or
--(vPos = 280) or
--(vPos = 300) or
--(vPos = 320) or
--(vPos = 340) or
--(vPos = 360) or
--(vPos = 380) or
--(vPos = 400) or
--(vPos = 420) or
--(vPos = 440) or
--(vPos = 460)
--		)) then
----		if(hPos < HD and vPos < VD and vPos mod 24 = 0)then
--			videoOn <= '1';
--		else
--			videoOn <= '0';
--		end if;
--	end if;
--end process;
--activeRender1 <= videoOn;
--blank <= '1' when hPos >= HD or vPos >= VD else '0';
----blank <=
------display_flag when activeh = '1' else
----h when activeh = '1' else
----'1' when v = '1';
----blank <= '1';
--
--end Behavioral;
