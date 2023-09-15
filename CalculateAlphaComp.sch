<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_45(4:0)" />
        <signal name="XLXN_45(14:5)" />
        <signal name="XLXN_44(4:0)" />
        <signal name="XLXN_44(14:5)" />
        <signal name="XLXN_59" />
        <signal name="XLXN_45(14:0)" />
        <signal name="XLXN_44(14:0)" />
        <signal name="mux_addr1(9)" />
        <signal name="XLXN_78(31:0)" />
        <signal name="XLXN_79(31:0)" />
        <signal name="XLXN_139(3:0)" />
        <signal name="i_addr(9:0)" />
        <signal name="mux_addr1(9:0)" />
        <signal name="o_do(31:0)" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="XLXN_236" />
        <signal name="XLXN_239(31:0)" />
        <signal name="XLXN_242" />
        <signal name="XLXN_243(11:0)" />
        <signal name="XLXN_244(31:0)" />
        <signal name="XLXN_245(31:0)" />
        <signal name="XLXN_246" />
        <signal name="XLXN_247" />
        <signal name="XLXN_248" />
        <signal name="XLXN_249" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="XLXN_251(31:0)" />
        <signal name="XLXN_253(31:0)" />
        <signal name="XLXN_256" />
        <signal name="XLXN_257" />
        <signal name="XLXN_258" />
        <signal name="XLXN_259" />
        <signal name="XLXN_260(11:0)" />
        <signal name="XLXN_261(11:0)" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="i2c_mem_ena" />
        <signal name="o_rdy" />
        <signal name="XLXN_241(9:0)" />
        <signal name="i_run" />
        <signal name="mulfprdy" />
        <signal name="addfprdy" />
        <signal name="subfprdy" />
        <signal name="i_Ta(31:0)" />
        <signal name="i_Ta0(31:0)" />
        <signal name="i_acpsubpage0(31:0)" />
        <signal name="i_acpsubpage1(31:0)" />
        <signal name="i_const1(31:0)" />
        <signal name="i_alpha_do(31:0)" />
        <signal name="mulfpr(31:0)" />
        <signal name="addfpr(31:0)" />
        <signal name="subfpr(31:0)" />
        <signal name="subfpb(31:0)" />
        <signal name="subfpa(31:0)" />
        <signal name="addfpb(31:0)" />
        <signal name="addfpa(31:0)" />
        <signal name="mulfpb(31:0)" />
        <signal name="mulfpa(31:0)" />
        <signal name="o_alpha_addr(9:0)" />
        <signal name="subfpce" />
        <signal name="subfpsclr" />
        <signal name="subfpond" />
        <signal name="addfpce" />
        <signal name="addfpsclr" />
        <signal name="addfpond" />
        <signal name="mulfpce" />
        <signal name="mulfpsclr" />
        <signal name="mulfpond" />
        <signal name="XLXN_273" />
        <signal name="XLXN_274(11:0)" />
        <port polarity="Input" name="i_addr(9:0)" />
        <port polarity="Output" name="o_do(31:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="mulfprdy" />
        <port polarity="Input" name="addfprdy" />
        <port polarity="Input" name="subfprdy" />
        <port polarity="Input" name="i_Ta(31:0)" />
        <port polarity="Input" name="i_Ta0(31:0)" />
        <port polarity="Input" name="i_acpsubpage0(31:0)" />
        <port polarity="Input" name="i_acpsubpage1(31:0)" />
        <port polarity="Input" name="i_const1(31:0)" />
        <port polarity="Input" name="i_alpha_do(31:0)" />
        <port polarity="Input" name="mulfpr(31:0)" />
        <port polarity="Input" name="addfpr(31:0)" />
        <port polarity="Input" name="subfpr(31:0)" />
        <port polarity="Output" name="subfpb(31:0)" />
        <port polarity="Output" name="subfpa(31:0)" />
        <port polarity="Output" name="addfpb(31:0)" />
        <port polarity="Output" name="addfpa(31:0)" />
        <port polarity="Output" name="mulfpb(31:0)" />
        <port polarity="Output" name="mulfpa(31:0)" />
        <port polarity="Output" name="o_alpha_addr(9:0)" />
        <port polarity="Output" name="subfpce" />
        <port polarity="Output" name="subfpsclr" />
        <port polarity="Output" name="subfpond" />
        <port polarity="Output" name="addfpce" />
        <port polarity="Output" name="addfpsclr" />
        <port polarity="Output" name="addfpond" />
        <port polarity="Output" name="mulfpce" />
        <port polarity="Output" name="mulfpsclr" />
        <port polarity="Output" name="mulfpond" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="RAMB16">
            <timestamp>2023-9-3T15:37:13</timestamp>
            <rect width="256" x="64" y="-608" height="608" />
            <line x2="0" y1="-576" y2="-576" x1="64" />
            <rect width="64" x="0" y="-588" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-512" y2="-512" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="0" y="-396" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <rect width="64" x="0" y="-76" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="384" y1="-576" y2="-576" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-384" y2="-384" x1="320" />
            <rect width="64" x="320" y="-396" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-192" y2="-192" x1="320" />
            <rect width="64" x="320" y="-204" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
        </blockdef>
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
        </blockdef>
        <blockdef name="mem_switchpattern">
            <timestamp>2023-6-16T9:43:13</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="ExtractKsTaParameters">
            <timestamp>2023-6-16T13:1:14</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="464" y1="96" y2="96" x1="400" />
            <rect width="64" x="400" y="148" height="24" />
            <line x2="464" y1="160" y2="160" x1="400" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="400" y="-172" height="24" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <rect width="336" x="64" y="-192" height="384" />
        </blockdef>
        <blockdef name="ExtractTGCParameter">
            <timestamp>2023-6-16T9:41:25</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="432" y1="32" y2="32" x1="368" />
            <line x2="432" y1="96" y2="96" x1="368" />
            <rect width="64" x="368" y="148" height="24" />
            <line x2="432" y1="160" y2="160" x1="368" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <rect width="304" x="64" y="-192" height="384" />
        </blockdef>
        <blockdef name="rom_switchpattern_neg">
            <timestamp>2023-6-16T10:52:4</timestamp>
            <rect width="304" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="rom_switchpattern_pos">
            <timestamp>2023-6-16T10:52:18</timestamp>
            <rect width="304" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="CalculateAlphaComp_process_p0">
            <timestamp>2023-6-16T13:38:36</timestamp>
            <rect width="672" x="64" y="-1792" height="1792" />
            <line x2="0" y1="-1760" y2="-1760" x1="64" />
            <line x2="0" y1="-1696" y2="-1696" x1="64" />
            <line x2="0" y1="-1632" y2="-1632" x1="64" />
            <line x2="0" y1="-1568" y2="-1568" x1="64" />
            <line x2="0" y1="-1504" y2="-1504" x1="64" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <line x2="0" y1="-1312" y2="-1312" x1="64" />
            <rect width="64" x="0" y="-1196" height="24" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <rect width="64" x="0" y="-1132" height="24" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <rect width="64" x="0" y="-1068" height="24" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <rect width="64" x="0" y="-1004" height="24" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="0" y="-940" height="24" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="800" y1="-1696" y2="-1696" x1="736" />
            <line x2="800" y1="-1632" y2="-1632" x1="736" />
            <line x2="800" y1="-1568" y2="-1568" x1="736" />
            <line x2="800" y1="-1504" y2="-1504" x1="736" />
            <line x2="800" y1="-1440" y2="-1440" x1="736" />
            <line x2="800" y1="-1376" y2="-1376" x1="736" />
            <line x2="800" y1="-1312" y2="-1312" x1="736" />
            <line x2="800" y1="-1248" y2="-1248" x1="736" />
            <line x2="800" y1="-1184" y2="-1184" x1="736" />
            <line x2="800" y1="-1120" y2="-1120" x1="736" />
            <line x2="800" y1="-1056" y2="-1056" x1="736" />
            <line x2="800" y1="-992" y2="-992" x1="736" />
            <line x2="800" y1="-928" y2="-928" x1="736" />
            <line x2="800" y1="-864" y2="-864" x1="736" />
            <line x2="800" y1="-800" y2="-800" x1="736" />
            <rect width="64" x="736" y="-684" height="24" />
            <line x2="800" y1="-672" y2="-672" x1="736" />
            <rect width="64" x="736" y="-556" height="24" />
            <line x2="800" y1="-544" y2="-544" x1="736" />
            <rect width="64" x="736" y="-492" height="24" />
            <line x2="800" y1="-480" y2="-480" x1="736" />
            <rect width="64" x="736" y="-428" height="24" />
            <line x2="800" y1="-416" y2="-416" x1="736" />
            <rect width="64" x="736" y="-364" height="24" />
            <line x2="800" y1="-352" y2="-352" x1="736" />
            <rect width="64" x="736" y="-300" height="24" />
            <line x2="800" y1="-288" y2="-288" x1="736" />
            <rect width="64" x="736" y="-236" height="24" />
            <line x2="800" y1="-224" y2="-224" x1="736" />
            <rect width="64" x="736" y="-172" height="24" />
            <line x2="800" y1="-160" y2="-160" x1="736" />
            <rect width="64" x="736" y="-108" height="24" />
            <line x2="800" y1="-96" y2="-96" x1="736" />
            <rect width="64" x="736" y="-44" height="24" />
            <line x2="800" y1="-32" y2="-32" x1="736" />
        </blockdef>
        <blockdef name="mux3x1a">
            <timestamp>2023-6-15T18:17:26</timestamp>
            <rect width="256" x="64" y="-96" height="96" />
            <line x2="384" y1="-16" y2="-16" x1="320" />
            <line x2="0" y1="-16" y2="-16" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_7(4:0)">
            <blockpin signalname="XLXN_45(4:0)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_8(9:0)">
            <blockpin signalname="mux_addr1(9:0)" name="I" />
            <blockpin signalname="XLXN_45(14:5)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_10(4:0)">
            <blockpin signalname="XLXN_44(4:0)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_11(9:0)">
            <blockpin signalname="mux_addr1(9:0)" name="I" />
            <blockpin signalname="XLXN_44(14:5)" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_5">
            <blockpin signalname="mux_addr1(9)" name="I" />
            <blockpin signalname="XLXN_59" name="O" />
        </block>
        <block symbolname="RAMB16" name="mem_alphacomp_1">
            <attr value="36" name="WRITE_WIDTH_B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18 36" />
            </attr>
            <attr value="36" name="WRITE_WIDTH_A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18 36" />
            </attr>
            <attr value="READ_FIRST" name="WRITE_MODE_B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList WRITE_FIRST READ_FIRST NO_CHANGE" />
            </attr>
            <attr value="READ_FIRST" name="WRITE_MODE_A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList WRITE_FIRST READ_FIRST NO_CHANGE" />
            </attr>
            <attr value="36" name="READ_WIDTH_B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18 36" />
            </attr>
            <attr value="36" name="READ_WIDTH_A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18 36" />
            </attr>
            <blockpin signalname="XLXN_44(14:0)" name="ADDRA(14:0)" />
            <blockpin name="ADDRB(14:0)" />
            <blockpin name="CASCADEINA" />
            <blockpin name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin signalname="XLXN_239(31:0)" name="DIA(31:0)" />
            <blockpin name="DIB(31:0)" />
            <blockpin name="DIPA(3:0)" />
            <blockpin name="DIPB(3:0)" />
            <blockpin signalname="XLXN_59" name="ENA" />
            <blockpin name="REGCEA" />
            <blockpin name="REGCEB" />
            <blockpin name="ENB" />
            <blockpin signalname="i_reset" name="SSRA" />
            <blockpin name="SSRB" />
            <blockpin signalname="XLXN_139(3:0)" name="WEA(3:0)" />
            <blockpin name="WEB(3:0)" />
            <blockpin name="CASCADEOUTA" />
            <blockpin name="CASCADEOUTB" />
            <blockpin signalname="XLXN_79(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="m2_1" name="CalculateAlphaComp_MUX_DO(31:0)">
            <blockpin signalname="XLXN_79(31:0)" name="D0" />
            <blockpin signalname="XLXN_78(31:0)" name="D1" />
            <blockpin signalname="mux_addr1(9)" name="S0" />
            <blockpin signalname="o_do(31:0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_29(3:0)">
            <blockpin signalname="XLXN_236" name="I" />
            <blockpin signalname="XLXN_139(3:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="CalculateAlphaComp_MUX_ADDR(9:0)">
            <blockpin signalname="XLXN_241(9:0)" name="D0" />
            <blockpin signalname="i_addr(9:0)" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="mux_addr1(9:0)" name="O" />
        </block>
        <block symbolname="RAMB16" name="mem_alphacomp_2">
            <attr value="36" name="WRITE_WIDTH_B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18 36" />
            </attr>
            <attr value="36" name="WRITE_WIDTH_A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18 36" />
            </attr>
            <attr value="READ_FIRST" name="WRITE_MODE_B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList WRITE_FIRST READ_FIRST NO_CHANGE" />
            </attr>
            <attr value="READ_FIRST" name="WRITE_MODE_A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList WRITE_FIRST READ_FIRST NO_CHANGE" />
            </attr>
            <attr value="36" name="READ_WIDTH_B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18 36" />
            </attr>
            <attr value="36" name="READ_WIDTH_A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="IntegerList 0 1 2 4 9 18 36" />
            </attr>
            <blockpin signalname="XLXN_45(14:0)" name="ADDRA(14:0)" />
            <blockpin name="ADDRB(14:0)" />
            <blockpin name="CASCADEINA" />
            <blockpin name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin signalname="XLXN_239(31:0)" name="DIA(31:0)" />
            <blockpin name="DIB(31:0)" />
            <blockpin name="DIPA(3:0)" />
            <blockpin name="DIPB(3:0)" />
            <blockpin signalname="mux_addr1(9)" name="ENA" />
            <blockpin name="REGCEA" />
            <blockpin name="REGCEB" />
            <blockpin name="ENB" />
            <blockpin signalname="i_reset" name="SSRA" />
            <blockpin name="SSRB" />
            <blockpin signalname="XLXN_139(3:0)" name="WEA(3:0)" />
            <blockpin name="WEB(3:0)" />
            <blockpin name="CASCADEOUTA" />
            <blockpin name="CASCADEOUTB" />
            <blockpin signalname="XLXN_78(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="mem_switchpattern" name="CalculateAlphaComp_mem_switchpattern">
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="XLXN_243(11:0)" name="i_pixel(11:0)" />
            <blockpin signalname="XLXN_242" name="o_pattern" />
        </block>
        <block symbolname="ExtractKsTaParameters" name="CalculateAlphaComp_extrkstaparam">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_253(31:0)" name="o_ksta(31:0)" />
            <blockpin signalname="XLXN_247" name="i_run" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_257" name="i2c_mem_ena" />
            <blockpin signalname="XLXN_249" name="o_rdy" />
            <blockpin signalname="XLXN_260(11:0)" name="i2c_mem_addra(11:0)" />
        </block>
        <block symbolname="ExtractTGCParameter" name="CalculateAlphaComp_extrtgcparam">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_251(31:0)" name="o_tgc(31:0)" />
            <blockpin signalname="XLXN_246" name="i_run" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_256" name="i2c_mem_ena" />
            <blockpin signalname="XLXN_248" name="o_rdy" />
            <blockpin signalname="XLXN_261(11:0)" name="i2c_mem_addra(11:0)" />
        </block>
        <block symbolname="rom_switchpattern_neg" name="CalculateAlphaComp_rom_switchpattern_neg">
            <blockpin signalname="XLXN_242" name="pattern_in" />
            <blockpin signalname="XLXN_245(31:0)" name="pattern_out(31:0)" />
        </block>
        <block symbolname="rom_switchpattern_pos" name="CalculateAlphaComp_rom_switchpattern_pos">
            <blockpin signalname="XLXN_242" name="pattern_in" />
            <blockpin signalname="XLXN_244(31:0)" name="pattern_out(31:0)" />
        </block>
        <block symbolname="CalculateAlphaComp_process_p0" name="CalculateAlphaComp_process_p0_inst">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="XLXN_248" name="ExtractTGCParameters_rdy" />
            <blockpin signalname="XLXN_249" name="ExtractKsTaParameters_rdy" />
            <blockpin signalname="mulfprdy" name="mulfprdy" />
            <blockpin signalname="addfprdy" name="addfprdy" />
            <blockpin signalname="subfprdy" name="subfprdy" />
            <blockpin signalname="i_Ta(31:0)" name="i_Ta(31:0)" />
            <blockpin signalname="i_Ta0(31:0)" name="i_Ta0(31:0)" />
            <blockpin signalname="i_acpsubpage0(31:0)" name="i_acpsubpage0(31:0)" />
            <blockpin signalname="i_acpsubpage1(31:0)" name="i_acpsubpage1(31:0)" />
            <blockpin signalname="i_const1(31:0)" name="i_const1(31:0)" />
            <blockpin signalname="i_alpha_do(31:0)" name="i_alpha_do(31:0)" />
            <blockpin signalname="XLXN_251(31:0)" name="ExtractTGCParameters_tgc(31:0)" />
            <blockpin signalname="XLXN_253(31:0)" name="ExtractKsTaParameters_ksta(31:0)" />
            <blockpin signalname="XLXN_244(31:0)" name="pattern_ft(31:0)" />
            <blockpin signalname="XLXN_245(31:0)" name="pattern_neg_ft(31:0)" />
            <blockpin signalname="mulfpr(31:0)" name="mulfpr(31:0)" />
            <blockpin signalname="addfpr(31:0)" name="addfpr(31:0)" />
            <blockpin signalname="subfpr(31:0)" name="subfpr(31:0)" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="XLXN_246" name="ExtractTGCParameters_run" />
            <blockpin signalname="XLXN_258" name="ExtractTGCParameters_mux" />
            <blockpin signalname="XLXN_247" name="ExtractKsTaParameters_run" />
            <blockpin signalname="XLXN_259" name="ExtractKsTaParameters_mux" />
            <blockpin signalname="XLXN_236" name="o_write_enable" />
            <blockpin signalname="mulfpond" name="mulfpond" />
            <blockpin signalname="mulfpsclr" name="mulfpsclr" />
            <blockpin signalname="mulfpce" name="mulfpce" />
            <blockpin signalname="addfpond" name="addfpond" />
            <blockpin signalname="addfpsclr" name="addfpsclr" />
            <blockpin signalname="addfpce" name="addfpce" />
            <blockpin signalname="subfpond" name="subfpond" />
            <blockpin signalname="subfpsclr" name="subfpsclr" />
            <blockpin signalname="subfpce" name="subfpce" />
            <blockpin signalname="o_alpha_addr(9:0)" name="o_alpha_addr(9:0)" />
            <blockpin signalname="XLXN_243(11:0)" name="mem_switchpattern_pixel(11:0)" />
            <blockpin signalname="XLXN_241(9:0)" name="o_addra(9:0)" />
            <blockpin signalname="XLXN_239(31:0)" name="o_dia(31:0)" />
            <blockpin signalname="mulfpa(31:0)" name="mulfpa(31:0)" />
            <blockpin signalname="mulfpb(31:0)" name="mulfpb(31:0)" />
            <blockpin signalname="addfpa(31:0)" name="addfpa(31:0)" />
            <blockpin signalname="addfpb(31:0)" name="addfpb(31:0)" />
            <blockpin signalname="subfpa(31:0)" name="subfpa(31:0)" />
            <blockpin signalname="subfpb(31:0)" name="subfpb(31:0)" />
        </block>
        <block symbolname="mux3x1a" name="CalculateAlphaComp_mux3x1a_i2c_mem_ena">
            <blockpin signalname="XLXN_259" name="s1" />
            <blockpin signalname="XLXN_258" name="s0" />
            <blockpin signalname="XLXN_273" name="i2" />
            <blockpin signalname="XLXN_257" name="i1" />
            <blockpin signalname="XLXN_256" name="i0" />
            <blockpin signalname="i2c_mem_ena" name="o" />
        </block>
        <block symbolname="mux3x1a" name="CalculateAlphaComp_mux3x1a_i2c_mem_addra(11:0)">
            <blockpin signalname="XLXN_259" name="s1" />
            <blockpin signalname="XLXN_258" name="s0" />
            <blockpin signalname="XLXN_274(11:0)" name="i2" />
            <blockpin signalname="XLXN_260(11:0)" name="i1" />
            <blockpin signalname="XLXN_261(11:0)" name="i0" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="o" />
        </block>
        <block symbolname="constant" name="XLXI_43">
            <attr value="0" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_273" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_44">
            <attr value="000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_274(11:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="XLXN_45(4:0)">
            <wire x2="3232" y1="2560" y2="2576" x1="3232" />
        </branch>
        <branch name="XLXN_45(14:5)">
            <wire x2="3280" y1="2480" y2="2480" x1="3200" />
            <wire x2="3280" y1="2480" y2="2528" x1="3280" />
            <wire x2="3200" y1="2528" y2="2576" x1="3200" />
            <wire x2="3280" y1="2528" y2="2528" x1="3200" />
        </branch>
        <branch name="XLXN_44(4:0)">
            <wire x2="2048" y1="2560" y2="2576" x1="2048" />
        </branch>
        <branch name="XLXN_44(14:5)">
            <wire x2="2096" y1="2480" y2="2480" x1="2016" />
            <wire x2="2096" y1="2480" y2="2528" x1="2096" />
            <wire x2="2016" y1="2528" y2="2576" x1="2016" />
            <wire x2="2096" y1="2528" y2="2528" x1="2016" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="2096" y1="2992" y2="2992" x1="2048" />
        </branch>
        <branch name="XLXN_45(14:0)">
            <wire x2="3232" y1="2672" y2="2672" x1="3200" />
            <wire x2="3280" y1="2672" y2="2672" x1="3232" />
        </branch>
        <branch name="XLXN_44(14:0)">
            <wire x2="2048" y1="2672" y2="2672" x1="2016" />
            <wire x2="2096" y1="2672" y2="2672" x1="2048" />
        </branch>
        <branch name="mux_addr1(9)">
            <wire x2="1744" y1="2576" y2="2992" x1="1744" />
            <wire x2="1824" y1="2992" y2="2992" x1="1744" />
            <wire x2="1744" y1="2992" y2="3328" x1="1744" />
            <wire x2="2576" y1="3328" y2="3328" x1="1744" />
            <wire x2="1744" y1="3328" y2="3360" x1="1744" />
            <wire x2="3888" y1="3360" y2="3360" x1="1744" />
            <wire x2="3280" y1="2992" y2="2992" x1="2576" />
            <wire x2="2576" y1="2992" y2="3328" x1="2576" />
            <wire x2="3888" y1="2928" y2="3360" x1="3888" />
        </branch>
        <branch name="XLXN_78(31:0)">
            <wire x2="3888" y1="2864" y2="2864" x1="3664" />
        </branch>
        <branch name="XLXN_79(31:0)">
            <wire x2="2624" y1="2864" y2="2864" x1="2480" />
            <wire x2="2624" y1="2864" y2="3328" x1="2624" />
            <wire x2="3728" y1="3328" y2="3328" x1="2624" />
            <wire x2="3728" y1="2800" y2="3328" x1="3728" />
            <wire x2="3888" y1="2800" y2="2800" x1="3728" />
        </branch>
        <branch name="XLXN_139(3:0)">
            <wire x2="2064" y1="3184" y2="3184" x1="2048" />
            <wire x2="2096" y1="3184" y2="3184" x1="2064" />
            <wire x2="2064" y1="3184" y2="3280" x1="2064" />
            <wire x2="2720" y1="3280" y2="3280" x1="2064" />
            <wire x2="3280" y1="3184" y2="3184" x1="2720" />
            <wire x2="2720" y1="3184" y2="3280" x1="2720" />
        </branch>
        <branch name="i_addr(9:0)">
            <wire x2="1392" y1="2448" y2="2448" x1="1216" />
        </branch>
        <branch name="mux_addr1(9:0)">
            <wire x2="1744" y1="2480" y2="2480" x1="1712" />
            <wire x2="1776" y1="2480" y2="2480" x1="1744" />
            <wire x2="1792" y1="2480" y2="2480" x1="1776" />
            <wire x2="1776" y1="2432" y2="2480" x1="1776" />
            <wire x2="2112" y1="2432" y2="2432" x1="1776" />
            <wire x2="2112" y1="2432" y2="2480" x1="2112" />
            <wire x2="2976" y1="2480" y2="2480" x1="2112" />
        </branch>
        <branch name="o_do(31:0)">
            <wire x2="4240" y1="2832" y2="2832" x1="4208" />
        </branch>
        <branch name="XLXN_236">
            <wire x2="2736" y1="2288" y2="2288" x1="1312" />
            <wire x2="1312" y1="2288" y2="3184" x1="1312" />
            <wire x2="1824" y1="3184" y2="3184" x1="1312" />
            <wire x2="2736" y1="512" y2="512" x1="1632" />
            <wire x2="2736" y1="512" y2="2288" x1="2736" />
        </branch>
        <branch name="XLXN_239(31:0)">
            <wire x2="1328" y1="2304" y2="2864" x1="1328" />
            <wire x2="1776" y1="2864" y2="2864" x1="1328" />
            <wire x2="2096" y1="2864" y2="2864" x1="1776" />
            <wire x2="1776" y1="2864" y2="3264" x1="1776" />
            <wire x2="2672" y1="3264" y2="3264" x1="1776" />
            <wire x2="1744" y1="2304" y2="2304" x1="1328" />
            <wire x2="1744" y1="1472" y2="1472" x1="1632" />
            <wire x2="1744" y1="1472" y2="2304" x1="1744" />
            <wire x2="3280" y1="2864" y2="2864" x1="2672" />
            <wire x2="2672" y1="2864" y2="3264" x1="2672" />
        </branch>
        <bustap x2="3232" y1="2672" y2="2576" x1="3232" />
        <bustap x2="3200" y1="2672" y2="2576" x1="3200" />
        <instance x="3360" y="2624" name="XLXI_7(4:0)" orien="R270" />
        <instance x="2976" y="2512" name="XLXI_8(9:0)" orien="R0" />
        <bustap x2="2048" y1="2672" y2="2576" x1="2048" />
        <bustap x2="2016" y1="2672" y2="2576" x1="2016" />
        <instance x="2176" y="2624" name="XLXI_10(4:0)" orien="R270" />
        <instance x="1792" y="2512" name="XLXI_11(9:0)" orien="R0" />
        <instance x="1824" y="3024" name="XLXI_5" orien="R0" />
        <bustap x2="1744" y1="2480" y2="2576" x1="1744" />
        <instance x="2096" y="3248" name="mem_alphacomp_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <instance x="3888" y="2960" name="CalculateAlphaComp_MUX_DO(31:0)" orien="R0" />
        <instance x="1824" y="3152" name="XLXI_29(3:0)" orien="M180" />
        <instance x="1392" y="2352" name="CalculateAlphaComp_MUX_ADDR(9:0)" orien="M180" />
        <instance x="3280" y="3248" name="mem_alphacomp_2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <iomarker fontsize="28" x="1216" y="2448" name="i_addr(9:0)" orien="R180" />
        <iomarker fontsize="28" x="4240" y="2832" name="o_do(31:0)" orien="R0" />
        <instance x="2784" y="1040" name="CalculateAlphaComp_extrkstaparam" orien="R0">
        </instance>
        <instance x="2800" y="576" name="CalculateAlphaComp_extrtgcparam" orien="R0">
        </instance>
        <instance x="3232" y="1536" name="CalculateAlphaComp_rom_switchpattern_pos" orien="R180">
        </instance>
        <instance x="3232" y="1696" name="CalculateAlphaComp_rom_switchpattern_neg" orien="R180">
        </instance>
        <instance x="2848" y="1504" name="CalculateAlphaComp_mem_switchpattern" orien="R0">
        </instance>
        <branch name="XLXN_242">
            <wire x2="3248" y1="1344" y2="1344" x1="3232" />
            <wire x2="3248" y1="1344" y2="1568" x1="3248" />
            <wire x2="3248" y1="1568" y2="1728" x1="3248" />
            <wire x2="3248" y1="1568" y2="1568" x1="3232" />
            <wire x2="3248" y1="1728" y2="1728" x1="3232" />
        </branch>
        <instance x="832" y="1888" name="CalculateAlphaComp_process_p0_inst" orien="R0">
        </instance>
        <branch name="XLXN_243(11:0)">
            <wire x2="2240" y1="1344" y2="1344" x1="1632" />
            <wire x2="2240" y1="1344" y2="1472" x1="2240" />
            <wire x2="2848" y1="1472" y2="1472" x1="2240" />
        </branch>
        <branch name="XLXN_244(31:0)">
            <wire x2="832" y1="1280" y2="1280" x1="768" />
            <wire x2="768" y1="1280" y2="1952" x1="768" />
            <wire x2="2720" y1="1952" y2="1952" x1="768" />
            <wire x2="2800" y1="1568" y2="1568" x1="2720" />
            <wire x2="2720" y1="1568" y2="1952" x1="2720" />
        </branch>
        <branch name="XLXN_245(31:0)">
            <wire x2="832" y1="1344" y2="1344" x1="784" />
            <wire x2="784" y1="1344" y2="1936" x1="784" />
            <wire x2="2704" y1="1936" y2="1936" x1="784" />
            <wire x2="2800" y1="1728" y2="1728" x1="2704" />
            <wire x2="2704" y1="1728" y2="1936" x1="2704" />
        </branch>
        <branch name="XLXN_246">
            <wire x2="2208" y1="256" y2="256" x1="1632" />
            <wire x2="2208" y1="256" y2="608" x1="2208" />
            <wire x2="2800" y1="608" y2="608" x1="2208" />
        </branch>
        <branch name="XLXN_247">
            <wire x2="2192" y1="384" y2="384" x1="1632" />
            <wire x2="2192" y1="384" y2="1072" x1="2192" />
            <wire x2="2784" y1="1072" y2="1072" x1="2192" />
        </branch>
        <branch name="XLXN_248">
            <wire x2="752" y1="320" y2="1968" x1="752" />
            <wire x2="3312" y1="1968" y2="1968" x1="752" />
            <wire x2="832" y1="320" y2="320" x1="752" />
            <wire x2="3312" y1="672" y2="672" x1="3232" />
            <wire x2="3312" y1="672" y2="1968" x1="3312" />
        </branch>
        <branch name="XLXN_249">
            <wire x2="832" y1="384" y2="384" x1="736" />
            <wire x2="736" y1="384" y2="1984" x1="736" />
            <wire x2="3328" y1="1984" y2="1984" x1="736" />
            <wire x2="3328" y1="1136" y2="1136" x1="3248" />
            <wire x2="3328" y1="1136" y2="1984" x1="3328" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="2704" y1="672" y2="672" x1="2672" />
            <wire x2="2704" y1="672" y2="1136" x1="2704" />
            <wire x2="2784" y1="1136" y2="1136" x1="2704" />
            <wire x2="2800" y1="672" y2="672" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2672" y="672" name="i2c_mem_douta(7:0)" orien="R180" />
        <branch name="XLXN_253(31:0)">
            <wire x2="720" y1="1216" y2="2000" x1="720" />
            <wire x2="3344" y1="2000" y2="2000" x1="720" />
            <wire x2="832" y1="1216" y2="1216" x1="720" />
            <wire x2="3344" y1="880" y2="880" x1="3248" />
            <wire x2="3344" y1="880" y2="2000" x1="3344" />
        </branch>
        <branch name="XLXN_251(31:0)">
            <wire x2="704" y1="1152" y2="2016" x1="704" />
            <wire x2="3360" y1="2016" y2="2016" x1="704" />
            <wire x2="832" y1="1152" y2="1152" x1="704" />
            <wire x2="3360" y1="416" y2="416" x1="3232" />
            <wire x2="3360" y1="416" y2="2016" x1="3360" />
        </branch>
        <instance x="3616" y="688" name="CalculateAlphaComp_mux3x1a_i2c_mem_ena" orien="R0">
        </instance>
        <branch name="XLXN_256">
            <wire x2="3616" y1="608" y2="608" x1="3232" />
        </branch>
        <branch name="XLXN_257">
            <wire x2="3424" y1="1072" y2="1072" x1="3248" />
            <wire x2="3424" y1="624" y2="1072" x1="3424" />
            <wire x2="3616" y1="624" y2="624" x1="3424" />
        </branch>
        <branch name="XLXN_258">
            <wire x2="3552" y1="320" y2="320" x1="1632" />
            <wire x2="3552" y1="320" y2="656" x1="3552" />
            <wire x2="3616" y1="656" y2="656" x1="3552" />
            <wire x2="3552" y1="656" y2="1232" x1="3552" />
            <wire x2="3616" y1="1232" y2="1232" x1="3552" />
        </branch>
        <branch name="XLXN_259">
            <wire x2="2224" y1="448" y2="448" x1="1632" />
            <wire x2="3568" y1="336" y2="336" x1="2224" />
            <wire x2="3568" y1="336" y2="672" x1="3568" />
            <wire x2="3616" y1="672" y2="672" x1="3568" />
            <wire x2="3568" y1="672" y2="1248" x1="3568" />
            <wire x2="3616" y1="1248" y2="1248" x1="3568" />
            <wire x2="2224" y1="336" y2="448" x1="2224" />
        </branch>
        <branch name="XLXN_260(11:0)">
            <wire x2="3616" y1="1200" y2="1200" x1="3248" />
        </branch>
        <instance x="3616" y="1264" name="CalculateAlphaComp_mux3x1a_i2c_mem_addra(11:0)" orien="R0">
        </instance>
        <branch name="XLXN_261(11:0)">
            <wire x2="3440" y1="736" y2="736" x1="3232" />
            <wire x2="3440" y1="736" y2="1184" x1="3440" />
            <wire x2="3616" y1="1184" y2="1184" x1="3440" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="4032" y1="1248" y2="1248" x1="4000" />
        </branch>
        <iomarker fontsize="28" x="4032" y="1248" name="i2c_mem_addra(11:0)" orien="R0" />
        <branch name="i2c_mem_ena">
            <wire x2="4032" y1="672" y2="672" x1="4000" />
        </branch>
        <iomarker fontsize="28" x="4032" y="672" name="i2c_mem_ena" orien="R0" />
        <branch name="o_rdy">
            <wire x2="1296" y1="2272" y2="2384" x1="1296" />
            <wire x2="1392" y1="2384" y2="2384" x1="1296" />
            <wire x2="2176" y1="2272" y2="2272" x1="1296" />
            <wire x2="2176" y1="192" y2="192" x1="1632" />
            <wire x2="2176" y1="192" y2="2272" x1="2176" />
            <wire x2="2224" y1="192" y2="192" x1="2176" />
        </branch>
        <branch name="i_clock">
            <wire x2="784" y1="128" y2="128" x1="672" />
            <wire x2="832" y1="128" y2="128" x1="784" />
            <wire x2="2768" y1="80" y2="80" x1="784" />
            <wire x2="2768" y1="80" y2="480" x1="2768" />
            <wire x2="2768" y1="480" y2="944" x1="2768" />
            <wire x2="2784" y1="944" y2="944" x1="2768" />
            <wire x2="2768" y1="944" y2="1408" x1="2768" />
            <wire x2="2848" y1="1408" y2="1408" x1="2768" />
            <wire x2="2768" y1="1408" y2="2304" x1="2768" />
            <wire x2="2800" y1="480" y2="480" x1="2768" />
            <wire x2="784" y1="80" y2="128" x1="784" />
            <wire x2="2080" y1="2400" y2="2800" x1="2080" />
            <wire x2="2096" y1="2800" y2="2800" x1="2080" />
            <wire x2="2528" y1="2400" y2="2400" x1="2080" />
            <wire x2="2928" y1="2400" y2="2400" x1="2528" />
            <wire x2="2928" y1="2400" y2="2800" x1="2928" />
            <wire x2="3280" y1="2800" y2="2800" x1="2928" />
            <wire x2="2528" y1="2304" y2="2400" x1="2528" />
            <wire x2="2768" y1="2304" y2="2304" x1="2528" />
        </branch>
        <branch name="XLXN_241(9:0)">
            <wire x2="1728" y1="2256" y2="2256" x1="1280" />
            <wire x2="1280" y1="2256" y2="2512" x1="1280" />
            <wire x2="1392" y1="2512" y2="2512" x1="1280" />
            <wire x2="1728" y1="1408" y2="1408" x1="1632" />
            <wire x2="1728" y1="1408" y2="2256" x1="1728" />
        </branch>
        <branch name="i_reset">
            <wire x2="768" y1="192" y2="192" x1="672" />
            <wire x2="832" y1="192" y2="192" x1="768" />
            <wire x2="768" y1="48" y2="192" x1="768" />
            <wire x2="2752" y1="48" y2="48" x1="768" />
            <wire x2="2752" y1="48" y2="544" x1="2752" />
            <wire x2="2752" y1="544" y2="1008" x1="2752" />
            <wire x2="2784" y1="1008" y2="1008" x1="2752" />
            <wire x2="2752" y1="1008" y2="1344" x1="2752" />
            <wire x2="2848" y1="1344" y2="1344" x1="2752" />
            <wire x2="2752" y1="1344" y2="3120" x1="2752" />
            <wire x2="3280" y1="3120" y2="3120" x1="2752" />
            <wire x2="2752" y1="3120" y2="3296" x1="2752" />
            <wire x2="2800" y1="544" y2="544" x1="2752" />
            <wire x2="1760" y1="3120" y2="3296" x1="1760" />
            <wire x2="2752" y1="3296" y2="3296" x1="1760" />
            <wire x2="2096" y1="3120" y2="3120" x1="1760" />
        </branch>
        <branch name="i_run">
            <wire x2="832" y1="256" y2="256" x1="672" />
        </branch>
        <iomarker fontsize="28" x="672" y="128" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="672" y="192" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="672" y="256" name="i_run" orien="R180" />
        <branch name="mulfprdy">
            <wire x2="816" y1="448" y2="448" x1="672" />
            <wire x2="832" y1="448" y2="448" x1="816" />
        </branch>
        <branch name="addfprdy">
            <wire x2="816" y1="512" y2="512" x1="672" />
            <wire x2="832" y1="512" y2="512" x1="816" />
        </branch>
        <branch name="subfprdy">
            <wire x2="816" y1="576" y2="576" x1="672" />
            <wire x2="832" y1="576" y2="576" x1="816" />
        </branch>
        <branch name="i_Ta(31:0)">
            <wire x2="816" y1="704" y2="704" x1="672" />
            <wire x2="832" y1="704" y2="704" x1="816" />
        </branch>
        <branch name="i_Ta0(31:0)">
            <wire x2="816" y1="768" y2="768" x1="672" />
            <wire x2="832" y1="768" y2="768" x1="816" />
        </branch>
        <branch name="i_acpsubpage0(31:0)">
            <wire x2="816" y1="832" y2="832" x1="672" />
            <wire x2="832" y1="832" y2="832" x1="816" />
        </branch>
        <branch name="i_acpsubpage1(31:0)">
            <wire x2="816" y1="896" y2="896" x1="672" />
            <wire x2="832" y1="896" y2="896" x1="816" />
        </branch>
        <branch name="i_const1(31:0)">
            <wire x2="816" y1="960" y2="960" x1="672" />
            <wire x2="832" y1="960" y2="960" x1="816" />
        </branch>
        <branch name="i_alpha_do(31:0)">
            <wire x2="816" y1="1024" y2="1024" x1="672" />
            <wire x2="832" y1="1024" y2="1024" x1="816" />
        </branch>
        <branch name="mulfpr(31:0)">
            <wire x2="816" y1="1408" y2="1408" x1="672" />
            <wire x2="832" y1="1408" y2="1408" x1="816" />
        </branch>
        <branch name="addfpr(31:0)">
            <wire x2="816" y1="1472" y2="1472" x1="672" />
            <wire x2="832" y1="1472" y2="1472" x1="816" />
        </branch>
        <branch name="subfpr(31:0)">
            <wire x2="816" y1="1536" y2="1536" x1="672" />
            <wire x2="832" y1="1536" y2="1536" x1="816" />
        </branch>
        <branch name="subfpb(31:0)">
            <wire x2="1648" y1="1856" y2="1856" x1="1632" />
            <wire x2="1808" y1="1856" y2="1856" x1="1648" />
        </branch>
        <branch name="subfpa(31:0)">
            <wire x2="1648" y1="1792" y2="1792" x1="1632" />
            <wire x2="1808" y1="1792" y2="1792" x1="1648" />
        </branch>
        <branch name="addfpb(31:0)">
            <wire x2="1648" y1="1728" y2="1728" x1="1632" />
            <wire x2="1808" y1="1728" y2="1728" x1="1648" />
        </branch>
        <branch name="addfpa(31:0)">
            <wire x2="1648" y1="1664" y2="1664" x1="1632" />
            <wire x2="1808" y1="1664" y2="1664" x1="1648" />
        </branch>
        <branch name="mulfpb(31:0)">
            <wire x2="1648" y1="1600" y2="1600" x1="1632" />
            <wire x2="1808" y1="1600" y2="1600" x1="1648" />
        </branch>
        <branch name="mulfpa(31:0)">
            <wire x2="1648" y1="1536" y2="1536" x1="1632" />
            <wire x2="1808" y1="1536" y2="1536" x1="1648" />
        </branch>
        <branch name="o_alpha_addr(9:0)">
            <wire x2="1648" y1="1216" y2="1216" x1="1632" />
            <wire x2="1808" y1="1216" y2="1216" x1="1648" />
        </branch>
        <branch name="subfpce">
            <wire x2="1648" y1="1088" y2="1088" x1="1632" />
            <wire x2="1808" y1="1088" y2="1088" x1="1648" />
        </branch>
        <branch name="subfpsclr">
            <wire x2="1648" y1="1024" y2="1024" x1="1632" />
            <wire x2="1808" y1="1024" y2="1024" x1="1648" />
        </branch>
        <branch name="subfpond">
            <wire x2="1648" y1="960" y2="960" x1="1632" />
            <wire x2="1808" y1="960" y2="960" x1="1648" />
        </branch>
        <branch name="addfpce">
            <wire x2="1648" y1="896" y2="896" x1="1632" />
            <wire x2="1808" y1="896" y2="896" x1="1648" />
        </branch>
        <branch name="addfpsclr">
            <wire x2="1648" y1="832" y2="832" x1="1632" />
            <wire x2="1808" y1="832" y2="832" x1="1648" />
        </branch>
        <branch name="addfpond">
            <wire x2="1648" y1="768" y2="768" x1="1632" />
            <wire x2="1808" y1="768" y2="768" x1="1648" />
        </branch>
        <branch name="mulfpce">
            <wire x2="1648" y1="704" y2="704" x1="1632" />
            <wire x2="1808" y1="704" y2="704" x1="1648" />
        </branch>
        <branch name="mulfpsclr">
            <wire x2="1648" y1="640" y2="640" x1="1632" />
            <wire x2="1808" y1="640" y2="640" x1="1648" />
        </branch>
        <branch name="mulfpond">
            <wire x2="1648" y1="576" y2="576" x1="1632" />
            <wire x2="1808" y1="576" y2="576" x1="1648" />
        </branch>
        <iomarker fontsize="28" x="2224" y="192" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="1808" y="1856" name="subfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1808" y="1792" name="subfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1808" y="1728" name="addfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1808" y="1664" name="addfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1808" y="1536" name="mulfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1808" y="1216" name="o_alpha_addr(9:0)" orien="R0" />
        <iomarker fontsize="28" x="1808" y="1088" name="subfpce" orien="R0" />
        <iomarker fontsize="28" x="1808" y="1024" name="subfpsclr" orien="R0" />
        <iomarker fontsize="28" x="1808" y="960" name="subfpond" orien="R0" />
        <iomarker fontsize="28" x="1808" y="896" name="addfpce" orien="R0" />
        <iomarker fontsize="28" x="1808" y="832" name="addfpsclr" orien="R0" />
        <iomarker fontsize="28" x="1808" y="768" name="addfpond" orien="R0" />
        <iomarker fontsize="28" x="1808" y="704" name="mulfpce" orien="R0" />
        <iomarker fontsize="28" x="1808" y="640" name="mulfpsclr" orien="R0" />
        <iomarker fontsize="28" x="1808" y="576" name="mulfpond" orien="R0" />
        <iomarker fontsize="28" x="672" y="1408" name="mulfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="1472" name="addfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="1536" name="subfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="1024" name="i_alpha_do(31:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="960" name="i_const1(31:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="896" name="i_acpsubpage1(31:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="832" name="i_acpsubpage0(31:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="768" name="i_Ta0(31:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="704" name="i_Ta(31:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="576" name="subfprdy" orien="R180" />
        <iomarker fontsize="28" x="672" y="512" name="addfprdy" orien="R180" />
        <iomarker fontsize="28" x="672" y="448" name="mulfprdy" orien="R180" />
        <iomarker fontsize="28" x="1808" y="1600" name="mulfpb(31:0)" orien="R0" />
        <branch name="XLXN_273">
            <wire x2="3600" y1="528" y2="640" x1="3600" />
            <wire x2="3616" y1="640" y2="640" x1="3600" />
            <wire x2="3808" y1="528" y2="528" x1="3600" />
            <wire x2="3808" y1="480" y2="480" x1="3728" />
            <wire x2="3808" y1="480" y2="528" x1="3808" />
        </branch>
        <branch name="XLXN_274(11:0)">
            <wire x2="3600" y1="1264" y2="1264" x1="3552" />
            <wire x2="3616" y1="1216" y2="1216" x1="3600" />
            <wire x2="3600" y1="1216" y2="1264" x1="3600" />
        </branch>
        <instance x="3408" y="1296" name="XLXI_44" orien="M180">
        </instance>
        <instance x="3584" y="512" name="XLXI_43" orien="M180">
        </instance>
    </sheet>
</drawing>