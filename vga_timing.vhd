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

---------------------------------------------------------
-- This entity synchronize video_hsync and video_vsync to vga
-- Thanks to Pong P. Chu for creating basic things.
--------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.numeric_std.all;
--  use work.p_constants.all;

entity video_timing is
port (
reset           : in    std_logic;
video_clock     : in    std_logic;
video_hsync     : out   std_logic;
video_vsync     : out   std_logic;
video_blank     : out   std_logic;
active_area     : out   std_logic;
active_haddrgen : out   std_logic;
active_render   : out   std_logic
);
end video_timing;

architecture industry_standard_640x480_timing of video_timing is

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

  video_blank <= '1' when reset = '1' else
    '0' when (
      h_counter < h_visible_area
      and
      v_counter < v_visible_area
    ) else '1';

--  o_h_blank <=
--    '0' when h_counter < h_visible_area
--    else '1';

--  o_v_blank <=
--    '0' when v_counter < v_visible_area
--    else '1';

  p_hv_counters : process (video_clock, reset) is
  begin
    if (reset = '1') then
      h_counter <= 0;
      v_counter <= 0;
    elsif (rising_edge (video_clock)) then
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
        video_hsync <= '0';
      else
        video_hsync <= '1';
      end if;
      if (
        v_counter > (v_visible_area + v_front_porch               )
        and
        v_counter < (v_visible_area + v_front_porch + v_sync_pulse)
      ) then
        video_vsync <= '0';
      else
        video_vsync <= '1';
      end if;
    end if;
  end process p_hv_counters;

end architecture industry_standard_640x480_timing;

architecture behavioral of video_timing is
-- Mixed-Code used to divide screen for 4 cameras (160x120) and upscale 160x120 to 640x480
--signal clk_vga : std_logic;
--signal hcnt,vcnt : INTEGER range 0 to 1023 := 0;
--signal thpos,tvPos : std_logic_vector(9 downto 0);
--signal tvideo_hsync,tvideo_vsync : std_logic;
--signal ph,pv : std_logic;
--signal v120 : std_logic;
--signal tactive_area : std_logic;
--signal active_haddrgen : std_logic;
begin
--video_hsync <= h;
--video_vsync <= v;
--video_blank <= '1' when (blankh = '1' or blankv = '1') else '0';
--active_area <= display_flag;
--active_render <= tactive_area;
--video_vsync <= v;
--video_hsync <= h;
--video_vsync <= v;
--
--p1 : process (video_clock,reset) is
--type states is (idle,p0a,p0b);
--variable state : states := idle;
--constant C1 : integer := 120*640; --(c_vd-c_vfp-c_vsp-c_vbp)/4;
--constant C2 : integer := 480*640; --c_vd;
--variable i : integer range 0 to C2-1;
--begin
--if (reset = '1') then
--state := idle;
--v120 <= '0';
--pv <= '0';
--i := 0;
--elsif (rising_edge(video_clock)) then
--		pv <= activeh;
--		case (state) is
--			when idle =>
--				v120 <= '0';
--				if (pv = '0' and activeh = '1') then
--					state := p0a;
--				else
--					state := idle;
--				end if;
--				i := 0;
--			when p0a =>
--				v120 <= '1';
--				if (i = C1-1) then
--					state := p0b;
--					i := 0;
--				else
--					state := p0a;
--					i := i + 1;
--				end if;
--			when p0b =>
--				v120 <= '0';
--				if (i = C2-1) then
--					state := idle;
--					i := 0;
--				else
--					state := p0b;
--					i := i + 1;
--				end if;
--		end case;
--	end if;
--end process p1;
--
--p0 : process (video_clock,reset) is
--type states is (idle,idle1a,p0a,p0b,p0c,p0d,p0e);
--variable state : states := idle;
--variable count1 : integer range 0 to 1023 := 0;
--variable counter2 : integer range 0 to v_hbp-1 := 0;
--begin
--if (reset = '1') then
--state := idle;
--count1 := 0;
--counter2 := 0;
--ph <= '0';
--tactive_area <= '0';
--elsif (rising_edge(video_clock)) then
--	ph <= h;
--		case (state) is
--			when idle =>
--				if (display_flag = '1') then
--					if (ph = '0' and h = '1') then
--						state := idle1a;
--						counter2 := 0;
--						state := p0a;
--					else
--						state := idle;
--					end if;
--				else
--					state := idle;
--				end if;
--				tactive_area <= '0';
--				count1 := 0;
--			when idle1a =>
--				if (counter2 = v_hbp-1) then
--					state := p0a;
--					counter2 := 0;
--				else
--					state := idle1a;
--					counter2 := counter2 + 1;
--				end if;
--			when p0a =>
--				if (v120 = '1') then
--					if (count1 = c_hd-1) then
--						count1 := 0;
--						state := p0b;
--						state := p0e;
--					else
--						count1 := count1 + 1;
--						state := p0a;
--					end if;
--					tactive_area <= '1';
--				end if;
--			when p0b =>
--				if (v120 = '1') then
--					if (count1 = 160-1) then
--						count1 := 0;
--						state := p0c;
--					else
--						count1 := count1 + 1;
--						state := p0b;
--					end if;
--					tactive_area <= '0';
--				end if;
--			when p0c =>
--				if (v120 = '1') then
--					if (count1 = 160-1) then
--						count1 := 0;
--						state := p0d;
--					else
--						count1 := count1 + 1;
--						state := p0c;
--					end if;
--					tactive_area <= '0';
--				end if;
--			when p0d =>
--				if (v120 = '1') then
--					if (count1 = 160-1) then
--						count1 := 0;
--						state := p0e;
--						state := idle;
--					else
--						count1 := count1 + 1;
--						state := p0d;
--					end if;
--					tactive_area <= '0';
--				end if;
--			when p0e =>
--				if (v120 = '1') then
--					if (count1 = c_hfp-1) then
--						count1 := 0;
--						state := idle;
--					else
--						count1 := count1 + 1;
--						state := p0e;
--					end if;
--					tactive_area <= '0';
--				end if;
--		end case;
--	end if;
--end process p0;
--
--aaproc : process(clk_vga,reset) is
--begin
--if (reset = '1') then
--active_area <= '0';
--active_area2 <= '0';
--active_area3 <= '0';
--active_area4 <= '0';
--elsif (rising_edge(clk_vga)) then
--if ((hcnt >= 0 and hcnt < 160) and (vcnt < 120)) then
--active_area <= '1';
--active_area2 <= '0';
--active_area3 <= '0';
--active_area4 <= '0';
--elsif ((hcnt >= 160 and hcnt < 320) and (vcnt < 120)) then
--active_area2 <= '1';
--active_area <= '0';
--active_area3 <= '0';
--active_area4 <= '0';
--elsif ((hcnt >= 320 and hcnt < 480) and (vcnt < 120)) then
--active_area3 <= '1';
--active_area <= '0';
--active_area2 <= '0';
--active_area4 <= '0';
--elsif ((hcnt >= 480 and hcnt < 640) and (vcnt < 120)) then
--active_area4 <= '1';
--active_area <= '0';
--active_area2 <= '0';
--active_area3 <= '0';
--else
--active_area4 <= '0';
--active_area <= '0';
--active_area2 <= '0';
--active_area3 <= '0';
--end if;
--end if;
--end process;
--
--active_area <= '1' when (hcnt >= 0 and hcnt < 160) and (vcnt >= 0 and vcnt < 120) else '0';
--active_area2 <= '1' when (hcnt >= 160 and hcnt < 320) and (vcnt >= 0 and vcnt < 120) else '0';
--active_area3 <= '1' when (hcnt >= 320 and hcnt < 480) and (vcnt >= 0 and vcnt < 120) else '0';
--active_area4 <= '1' when (hcnt >= 480 and hcnt < 640) and (vcnt >= 0 and vcnt < 120) else '0';
--
----active_area <= '1' when (hcnt >= 0 and hcnt < 160) and (vcnt >= 0 and vcnt < 120) else '0';
----active_area2 <= '1' when (hcnt >= 0 and hcnt < 160) and (vcnt >= 120 and vcnt < 240) else '0';
----active_area3 <= '1' when (hcnt >= 0 and hcnt < 160) and (vcnt >= 240 and vcnt < 360) else '0';
----active_area4 <= '1' when (hcnt >= 0 and hcnt < 160) and (vcnt >= 360 and vcnt < 480) else '0';
--
--active_area <= '1' when (hcnt <= c_hd) and (vcnt <= c_vd) else '0';
--active_area <= '1' when (hcnt <= c_hd) and (vcnt <= c_vd) else '0';
--active_render <= '1' when (hcnt <= c_hd) and ((vcnt <= c_vd) and ((vcnt mod 4 = 0))) else '0';
--active_area <= '1' when (hcnt < 160) and (vcnt < 120) else '0';
--active_area2 <= '0';
--active_area3 <= '0';
--active_area4 <= '0';
--
--p3 : process (video_clock,reset,h) is
--	constant c_video_hsync_pw : integer := 95;
----	constant c_video_hsync_fp : integer := 16+320+160;
----	constant c_video_hsync_fp : integer := 16+320;
--	constant c_video_hsync_fp : integer := 16;
--	constant c_video_hsync_bp : integer := 48;
----	constant c_video_hsync_disp : integer := 640-320-160;
----	constant c_video_hsync_disp : integer := 640-320;
--	constant c_video_hsync_disp : integer := 640;
--	variable pwh : integer range 0 to c_video_hsync_pw - 1 := 0;
--	variable fph : integer range 0 to c_video_hsync_fp - 1 := 0;
--	variable bph : integer range 0 to c_video_hsync_bp - 1 := 0;
--	variable disph : integer range 0 to c_video_hsync_disp - 1 := 0;
--	type statesh is (idleh,state_pwh,state_fph,state_disph,state_bph);
--	variable stateh : statesh;
--begin
--	if (reset = '1') then
--		fph := 0;
--		bph := 0;
--		disph := 0;
--		stateh <= idleh;
--		display_flag <= '0';
--		hpos <= 0;
--		vpos <= 0;
--		thpos <= (others => '0');
--		tvPos <= (others => '0');
--	elsif (rising_edge(video_clock)) then
--		case (stateh) is
--			when idleh =>
--				hpos <= 0;
--				display_flag <= '0';
--				h <= '0';
--				if (activeh = '1') then
--					vpos <= vpos + 1;
--					stateh <= state_pwh;
--				else
--					stateh <= idleh;
--				end if;
--			when state_pwh =>
--				hpos <= hpos + 1;
--				display_flag <= '0';
--				h <= '0';
--				if (pwh = c_video_hsync_pw - 1) then
--					stateh <= state_bph;
--					pwh := 0;
--				else
--					stateh <= state_pwh;
--					pwh := pwh + 1;
--				end if;
--			when state_bph =>
--				hpos <= hpos + 1;
--				display_flag <= '0';
--				h <= '1';
--				if (bph = c_video_hsync_bp - 1) then
--					stateh <= state_disph;
--					bph := 0;
--				else
--					stateh <= state_bph;
--					bph := bph + 1;
--				end if;
--			when state_disph =>
--				hpos <= hpos + 1;
--				display_flag <= '1';
--				h <= '1';
--				if (disph = c_video_hsync_disp - 1) then
--					stateh <= state_fph;
--					disph := 0;
--				else
--					stateh <= state_disph;
--					disph := disph + 1;
--				end if;
--			when state_fph =>
--				hpos <= hpos + 1;
--				display_flag <= '0';
--				h <= '1';
--				if (fph = c_video_hsync_fp - 1) then
--					stateh <= idleh;
--					fph := 0;
--				else
--					stateh <= state_fph;
--					fph := fph + 1;
--				end if;
--		end case;
--		thpos <= std_logic_vector(to_unsigned(hpos,10));
--		tvPos <= std_logic_vector(to_unsigned(vpos,10));
--	end if;
--end process p3;
--
--p4 : process (video_clock,reset,v) is
--	constant c_video_hsync_pw : integer := 2*800;
----	constant c_video_hsync_fp : integer := 8000+192000+96000;
----	constant c_video_hsync_fp : integer := 8000+192000;
--	constant c_video_hsync_fp : integer := 10*800;
--	constant c_video_hsync_bp : integer := 33*800; -- 29,33
----	constant c_video_hsync_bp : integer := 29*800; -- 29,33
----	constant c_video_hsync_bp : integer := 31*800; -- 29,33
----	constant c_video_hsync_disp : integer := 384000-192000-96000;
----	constant c_video_hsync_disp : integer := 384000-192000;
--	constant c_video_hsync_disp : integer := 480*800;
--	variable pwv : integer range 0 to c_video_hsync_pw - 1 := 0;
--	variable fpv : integer range 0 to c_video_hsync_fp - 1 := 0;
--	variable bpv : integer range 0 to c_video_hsync_bp - 1 := 0;
--	variable dispv : integer range 0 to c_video_hsync_disp - 1 := 0;
--	type statesv is (idle,state_pwv,state_fpv,state_dispv,state_bpv);
--	variable statev : statesv;
--begin
--	if (reset = '1') then
--		pwv := 0;
--		fpv := 0;
--		bpv := 0;
--		dispv := 0;
----		statev <= idle;
--		statev <= state_pwv;
--		activeh <= '0';
----		vpos <= 0;
----		tvPos <= (others => '0');
--	elsif (rising_edge(video_clock)) then
--		case (statev) is
----			when idle => statev <= state_pwv;
----				vpos <= 0;
--			when state_pwv =>
----				vpos <= vpos + 1;
--				activeh <= '0';
--				v <= '0';
--				if (pwv = c_video_hsync_pw - 1) then
--					statev <= state_bpv;
--					pwv := 0;
--				else
--					statev <= state_pwv;
--					pwv := pwv + 1;
--				end if;
--			when state_bpv =>
----				vpos <= vpos + 1;
--				activeh <= '0';
--				v <= '1';
--				if (bpv = c_video_hsync_bp - 1) then
--					statev <= state_dispv;
--					bpv := 0;
--				else
--					statev <= state_bpv;
--					bpv := bpv + 1;
--				end if;
--			when state_dispv =>
----				vpos <= vpos + 1;
--				activeh <= '1';
--				v <= '1';
--				if (dispv = c_video_hsync_disp - 1) then
--					statev <= state_fpv;
--					dispv := 0;
--				else
--					statev <= state_dispv;
--					dispv := dispv + 1;
--				end if;
--			when state_fpv =>
----				vpos <= vpos + 1;
--				activeh <= '0';
--				v <= '1';
--				if (fpv = c_video_hsync_fp - 1) then
----					statev <= idle;
--					statev <= state_pwv;
--					fpv := 0;
--				else
--					statev <= state_fpv;
--					fpv := fpv + 1;
--				end if;
--			when others => null;
--		end case;
----		tvPos <= std_logic_vector(to_unsigned(vpos,10));
--	end if;
--end process p4;
end architecture behavioral;

architecture behavioral_1 of video_timing is

constant c_video_hsync_pw                  : integer := 96;
constant c_video_hsync_fp                  : integer := 16;
constant c_video_hsync_bp                  : integer := 48;
constant c_video_hsync_disp                : integer := 640;
constant c_video_hsync_row                 : integer := (c_video_hsync_pw + c_video_hsync_fp + c_video_hsync_bp + c_video_hsync_disp);
constant c_video_vsync_pw                  : integer := 2*c_video_hsync_row;
constant c_video_vsync_fp                  : integer := 10*c_video_hsync_row;
constant c_video_vsync_bp                  : integer := 33*c_video_hsync_row;
constant c_video_vsync_disp                : integer := 480*c_video_hsync_row;
constant minh : integer := 0;
constant maxh : integer := 175;
constant minv : integer := 383825;
constant maxv : integer := 383999;

signal video_on : std_logic;
signal h,v : std_logic;
signal display_flag,activeh : std_logic;
signal hpos,vpos : integer range 0 to 1023 := 0;
signal blankh,blankv : std_logic;

type statesh is (idleh,state_pwh,state_fph,state_disph,state_bph);
signal stateh : statesh;

type statesv is (state_pwv,state_fpv,state_dispv,state_bpv);
signal statev : statesv;

signal pwh : integer range 0 to c_video_hsync_pw - 1 := 0;
signal fph : integer range 0 to c_video_hsync_fp - 1 := 0;
signal bph : integer range 0 to c_video_hsync_bp - 1 := 0;
signal disph : integer range 0 to c_video_hsync_disp - 1 := 0;

signal pwv : integer range 0 to c_video_vsync_pw - 1 := 0;
signal fpv : integer range 0 to c_video_vsync_fp - 1 := 0;
signal bpv : integer range 0 to c_video_vsync_bp - 1 := 0;
signal dispv : integer range 0 to c_video_vsync_disp - 1 := 0;

begin

video_blank <= blankh or blankv;
video_hsync <= h;
video_vsync <= v;
video_on <= display_flag;

p3 : process (video_clock) is
begin
	if (reset = '1') then
		fph <= 0;
		bph <= 0;
    pwh <= 0;
		disph <= 0;
		stateh <= idleh;
		display_flag <= '0';
	elsif (rising_edge(video_clock)) then
		case (stateh) is
			when idleh =>
				h <= '0';
        blankh <= '1';
				display_flag <= '0';
				if (activeh = '1') then
					stateh <= state_pwh;
				else
					stateh <= idleh;
				end if;
			when state_pwh =>
				h <= '0';
        blankh <= '1';
				display_flag <= '0';
				if (pwh = c_video_hsync_pw - 1) then
					stateh <= state_bph;
					pwh <= 0;
				else
					stateh <= state_pwh;
					pwh <= pwh + 1;
				end if;
			when state_bph =>
				h <= '1';
        blankh <= '1';
				display_flag <= '0';
				if (bph = c_video_hsync_bp - 1) then
					stateh <= state_disph;
					bph <= 0;
				else
					stateh <= state_bph;
					bph <= bph + 1;
				end if;
			when state_disph =>
				h <= '1';
        blankh <= '0';
				display_flag <= '1';
				if (disph = c_video_hsync_disp - 1) then
					stateh <= state_fph;
					disph <= 0;
				else
					stateh <= state_disph;
					disph <= disph + 1;
				end if;
			when state_fph =>
				h <= '1';
        blankh <= '1';
				display_flag <= '0';
				if (fph = c_video_hsync_fp - 1) then
					stateh <= idleh;
					fph <= 0;
				else
					stateh <= state_fph;
					fph <= fph + 1;
				end if;
		end case;
	end if;
end process p3;

p4 : process (video_clock) is
begin
	if (reset = '1') then
		pwv <= 0;
		fpv <= 0;
		bpv <= 0;
		dispv <= 0;
		statev <= state_pwv;
		activeh <= '0';
	elsif (rising_edge(video_clock)) then
		case (statev) is
			when state_pwv =>
				activeh <= '0';
				v <= '1';
        blankv <= '1';
				if (pwv = c_video_vsync_pw - 1) then
					statev <= state_bpv;
					pwv <= 0;
				else
					statev <= state_pwv;
					pwv <= pwv + 1;
				end if;
			when state_bpv =>
				activeh <= '0';
				v <= '0';
        blankv <= '1';
				if (bpv = c_video_vsync_bp - 1) then
					statev <= state_dispv;
					bpv <= 0;
				else
					statev <= state_bpv;
					bpv <= bpv + 1;
				end if;
			when state_dispv =>
				activeh <= '1';
				v <= '0';
        blankv <= '0';
				if (dispv = c_video_vsync_disp - 1) then
					statev <= state_fpv;
					dispv <= 0;
				else
					statev <= state_dispv;
					dispv <= dispv + 1;
				end if;
			when state_fpv =>
				activeh <= '0';
				v <= '0';
        blankv <= '1';
				if (fpv = c_video_vsync_fp - 1) then
					statev <= state_pwv;
					fpv <= 0;
				else
					statev <= state_fpv;
					fpv <= fpv + 1;
				end if;
--    if ((disph >= minh and disph <= maxh) and (dispv >= minv and dispv <= maxv)) then
    if ((fpv >= 0 and fpv <= (482-16)) and stateh = state_disph) then
      blankv <= '0';
    end if;
		end case;
	end if;
end process p4;


end architecture behavioral_1;

architecture behavioral_2 of video_timing is
constant c_hd : INTEGER := 640;
constant c_hfp : INTEGER := 16;
constant c_hsp : INTEGER := 96;
constant v_hbp : INTEGER := 48;

constant c_vd : INTEGER := 480;
constant c_vfp : INTEGER := 10;
constant c_vsp : INTEGER := 2;
constant c_vbp : INTEGER := 33;

signal hpos,vpos : integer range 0 to 1023;
signal active_area_i : std_logic;

begin

p_horizontal_position_counter : process (video_clock, reset) is
begin
  if (reset = '1') then
    hpos <= 0;
  elsif (rising_edge (video_clock)) then
    if (hpos = (c_hd + c_hfp + c_hsp + v_hbp) - 1) then
      hpos <= 0;
    else
      hpos <= hpos + 1;
    end if;
  end if;
end process p_horizontal_position_counter;

p_vertical_position_counter : process (video_clock, reset) is
begin
  if(reset = '1') then
    vpos <= 0;
  elsif (rising_edge (video_clock)) then
    if (hpos = (c_hd + c_hfp + c_hsp + v_hbp) - 1) then
      if (vpos = (c_vd + c_vfp + c_vsp + c_vbp) - 1) then
        vpos <= 0;
      else
        vpos <= vpos + 1;
      end if;
    end if;
  end if;
end process p_vertical_position_counter;

p_horizontal_synchronisation : process (video_clock, reset) is
begin
	if (reset = '1') then
		video_hsync <= '0';
	elsif (rising_edge (video_clock)) then
		if ((hpos <= (c_hd + c_hfp)) or (hpos > c_hd + c_hfp + c_hsp)) then
			video_hsync <= '1';
		else
			video_hsync <= '0';
		end if;
	end if;
end process p_horizontal_synchronisation;

p_vertical_synchronisation : process (video_clock, reset) is
begin
	if (reset = '1') then
		video_vsync <= '0';
	elsif (rising_edge (video_clock)) then
		if ((vpos <= (c_vd + c_vfp)) or (vpos > c_vd + c_vfp + c_vsp)) then
			video_vsync <= '0';
		else
			video_vsync <= '1';
		end if;
	end if;
end process p_vertical_synchronisation;

active_area_i <= '1' when (hpos < c_hd) and (vpos < c_vd) else '0';
active_area <= active_area_i;
video_blank <= not active_area_i;

end architecture behavioral_2;

architecture behavioral_3 of video_timing is
constant c_hd : INTEGER := 640;
constant c_hfp : INTEGER := 16;
constant c_hsp : INTEGER := 96;
constant v_hbp : INTEGER := 48;
constant c_vd : INTEGER := 480;
constant c_vfp : INTEGER := 10;
constant c_vsp : INTEGER := 2;
constant c_vbp : INTEGER := 33;
signal hpos,vpos : integer range 0 to 1023;
signal video_on : std_logic;
signal activeh : std_logic;
signal h,v : std_logic;

begin

active_haddrgen <= activeh;

p_video_counters : process(video_clock, reset) begin
  if (reset = '1') then
    hpos <= 0;
    vpos <= 0;
  elsif (rising_edge (video_clock)) then
    if (hpos = (c_hd + c_hfp + c_hsp + v_hbp)) then
      hpos <= 0;
      if (vpos = (c_vd + c_vfp + c_vsp + c_vbp)) then
        vpos <= 0;
      else
        vpos <= vpos + 1;
      end if;
    else
      hpos <= hpos +1;
    end if;
  end if;
end process p_video_counters;

video_hsync_gen : process(video_clock, reset) begin
if (reset = '1') then
h <= '0';
  elsif rising_edge(video_clock) then
    if (hpos >= (c_hd+c_hfp) and hpos <= (c_hd+c_hfp+c_hsp)) then
			h <= '0';
		else
			h <= '1';
		end if;
	end if;
end process video_hsync_gen;

video_vsync_gen : process(video_clock, reset) begin
  if (reset = '1') then
  v <= '0';
  elsif rising_edge(video_clock) then
  if (vpos >= (c_vd+c_vfp) and vpos <= (c_vd+c_vfp+c_vsp)) then
			v <= '0';
		else
			v <= '1';
		end if;
	end if;
end process video_vsync_gen;

p_video_on : process (video_clock, reset) is
begin
  if(reset = '1')then
    video_on <= '0';
  elsif (rising_edge (video_clock)) then
    if((hpos <= c_hd and vpos <= c_vd)) then
      video_on <= '1';
    else
      video_on <= '0';
    end if;
  end if;
end process p_video_on;

active_render <= video_on;
video_blank <= '1' when hpos >= c_hd or vpos >= c_vd else '0';
active_area <= '1' when (hpos <= c_hd) and (vpos <= c_vd) else '0';
video_vsync <= not v;
video_hsync <= h;

end architecture behavioral_3;
