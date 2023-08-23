<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="addra2(4:0)" />
        <signal name="addra2(14:5)" />
        <signal name="addra1(4:0)" />
        <signal name="addra1(14:5)" />
        <signal name="mux_addr1(9:0)" />
        <signal name="XLXN_59" />
        <signal name="addra2(14:0)" />
        <signal name="addra1(14:0)" />
        <signal name="mux_addr1(9)" />
        <signal name="doa2(31:0)" />
        <signal name="doa1(31:0)" />
        <signal name="o_dia(31:0)" />
        <signal name="XLXN_139(3:0)" />
        <signal name="write_enable" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="o_rdy" />
        <signal name="nibble_out1(3:0)" />
        <signal name="nibble_out2(3:0)" />
        <signal name="nibble_out3(5:0)" />
        <signal name="nibble_out4(3:0)" />
        <signal name="nibble_in1(31:0)" />
        <signal name="nibble_in2(31:0)" />
        <signal name="nibble_in3(31:0)" />
        <signal name="nibble_in4(31:0)" />
        <signal name="i_addr(9:0)" />
        <signal name="o_addra(9:0)" />
        <signal name="i_run" />
        <signal name="fixed2floatrdy" />
        <signal name="mulfprdy" />
        <signal name="addfprdy" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="fixed2floatr(31:0)" />
        <signal name="mulfpr(31:0)" />
        <signal name="addfpr(31:0)" />
        <signal name="i2c_mem_ena" />
        <signal name="fixed2floatond" />
        <signal name="fixed2floatsclr" />
        <signal name="fixed2floatce" />
        <signal name="mulfpond" />
        <signal name="mulfpsclr" />
        <signal name="mulfpce" />
        <signal name="addfpond" />
        <signal name="addfpsclr" />
        <signal name="addfpce" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="fixed2floata(63:0)" />
        <signal name="mulfpa(31:0)" />
        <signal name="mulfpb(31:0)" />
        <signal name="addfpa(31:0)" />
        <signal name="addfpb(31:0)" />
        <signal name="XLXN_169(31:0)" />
        <signal name="XLXN_179(31:0)" />
        <signal name="o_do(31:0)" />
        <signal name="XLXN_180(31:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Input" name="i_addr(9:0)" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="fixed2floatrdy" />
        <port polarity="Input" name="mulfprdy" />
        <port polarity="Input" name="addfprdy" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Input" name="fixed2floatr(31:0)" />
        <port polarity="Input" name="mulfpr(31:0)" />
        <port polarity="Input" name="addfpr(31:0)" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="fixed2floatond" />
        <port polarity="Output" name="fixed2floatsclr" />
        <port polarity="Output" name="fixed2floatce" />
        <port polarity="Output" name="mulfpond" />
        <port polarity="Output" name="mulfpsclr" />
        <port polarity="Output" name="mulfpce" />
        <port polarity="Output" name="addfpond" />
        <port polarity="Output" name="addfpsclr" />
        <port polarity="Output" name="addfpce" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="fixed2floata(63:0)" />
        <port polarity="Output" name="mulfpa(31:0)" />
        <port polarity="Output" name="mulfpb(31:0)" />
        <port polarity="Output" name="addfpa(31:0)" />
        <port polarity="Output" name="addfpb(31:0)" />
        <port polarity="Output" name="o_do(31:0)" />
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
        <blockdef name="ramb16">
            <timestamp>2007-9-26T16:56:25</timestamp>
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
        <blockdef name="ExtractOffsetParameters_process_p0">
            <timestamp>2023-6-13T19:19:45</timestamp>
            <rect width="448" x="64" y="-1536" height="1536" />
            <line x2="0" y1="-1504" y2="-1504" x1="64" />
            <line x2="0" y1="-1408" y2="-1408" x1="64" />
            <line x2="0" y1="-1312" y2="-1312" x1="64" />
            <line x2="0" y1="-1216" y2="-1216" x1="64" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-1024" y2="-1024" x1="64" />
            <rect width="64" x="0" y="-940" height="24" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-844" height="24" />
            <line x2="0" y1="-832" y2="-832" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-652" height="24" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-460" height="24" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="576" y1="-1504" y2="-1504" x1="512" />
            <line x2="576" y1="-1440" y2="-1440" x1="512" />
            <line x2="576" y1="-1376" y2="-1376" x1="512" />
            <line x2="576" y1="-1312" y2="-1312" x1="512" />
            <line x2="576" y1="-1248" y2="-1248" x1="512" />
            <line x2="576" y1="-1184" y2="-1184" x1="512" />
            <line x2="576" y1="-1120" y2="-1120" x1="512" />
            <line x2="576" y1="-1056" y2="-1056" x1="512" />
            <line x2="576" y1="-992" y2="-992" x1="512" />
            <line x2="576" y1="-928" y2="-928" x1="512" />
            <line x2="576" y1="-864" y2="-864" x1="512" />
            <line x2="576" y1="-800" y2="-800" x1="512" />
            <rect width="64" x="512" y="-748" height="24" />
            <line x2="576" y1="-736" y2="-736" x1="512" />
            <rect width="64" x="512" y="-684" height="24" />
            <line x2="576" y1="-672" y2="-672" x1="512" />
            <rect width="64" x="512" y="-620" height="24" />
            <line x2="576" y1="-608" y2="-608" x1="512" />
            <rect width="64" x="512" y="-556" height="24" />
            <line x2="576" y1="-544" y2="-544" x1="512" />
            <rect width="64" x="512" y="-492" height="24" />
            <line x2="576" y1="-480" y2="-480" x1="512" />
            <rect width="64" x="512" y="-428" height="24" />
            <line x2="576" y1="-416" y2="-416" x1="512" />
            <rect width="64" x="512" y="-364" height="24" />
            <line x2="576" y1="-352" y2="-352" x1="512" />
            <rect width="64" x="512" y="-300" height="24" />
            <line x2="576" y1="-288" y2="-288" x1="512" />
            <rect width="64" x="512" y="-236" height="24" />
            <line x2="576" y1="-224" y2="-224" x1="512" />
            <rect width="64" x="512" y="-172" height="24" />
            <line x2="576" y1="-160" y2="-160" x1="512" />
            <rect width="64" x="512" y="-108" height="24" />
            <line x2="576" y1="-96" y2="-96" x1="512" />
            <rect width="64" x="512" y="-44" height="24" />
            <line x2="576" y1="-32" y2="-32" x1="512" />
        </blockdef>
        <blockdef name="rom_unsigned4bit">
            <timestamp>2023-6-12T10:59:52</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="rom_signed4bit">
            <timestamp>2023-6-12T10:59:34</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="rom_signed6bit">
            <timestamp>2023-6-12T10:59:8</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="rom_unsigned4bit_2powx">
            <timestamp>2023-6-12T10:56:49</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="mux_addr">
            <timestamp>2023-6-11T15:57:21</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_7(4:0)">
            <blockpin signalname="addra2(4:0)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_8(9:0)">
            <blockpin signalname="mux_addr1(9:0)" name="I" />
            <blockpin signalname="addra2(14:5)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_10(4:0)">
            <blockpin signalname="addra1(4:0)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_11(9:0)">
            <blockpin signalname="mux_addr1(9:0)" name="I" />
            <blockpin signalname="addra1(14:5)" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_12">
            <blockpin signalname="mux_addr1(9)" name="I" />
            <blockpin signalname="XLXN_59" name="O" />
        </block>
        <block symbolname="ramb16" name="mem_extroffparam_2">
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
            <blockpin signalname="addra2(14:0)" name="ADDRA(14:0)" />
            <blockpin name="ADDRB(14:0)" />
            <blockpin name="CASCADEINA" />
            <blockpin name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin signalname="o_dia(31:0)" name="DIA(31:0)" />
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
            <blockpin signalname="doa2(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="ramb16" name="mem_extroffparam_1">
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
            <blockpin signalname="addra1(14:0)" name="ADDRA(14:0)" />
            <blockpin name="ADDRB(14:0)" />
            <blockpin name="CASCADEINA" />
            <blockpin name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin signalname="o_dia(31:0)" name="DIA(31:0)" />
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
            <blockpin signalname="doa1(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="m2_1" name="MUX_DO(31:0)">
            <blockpin signalname="doa1(31:0)" name="D0" />
            <blockpin signalname="doa2(31:0)" name="D1" />
            <blockpin signalname="mux_addr1(9)" name="S0" />
            <blockpin signalname="XLXN_180(31:0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_29(3:0)">
            <blockpin signalname="write_enable" name="I" />
            <blockpin signalname="XLXN_139(3:0)" name="O" />
        </block>
        <block symbolname="ExtractOffsetParameters_process_p0" name="inst_ExtrOffParam_proc0">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="fixed2floatrdy" name="fixed2floatrdy" />
            <blockpin signalname="mulfprdy" name="mulfprdy" />
            <blockpin signalname="addfprdy" name="addfprdy" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="nibble_in1(31:0)" name="nibble_in1(31:0)" />
            <blockpin signalname="nibble_in2(31:0)" name="nibble_in2(31:0)" />
            <blockpin signalname="nibble_in4(31:0)" name="nibble_in4(31:0)" />
            <blockpin signalname="nibble_in3(31:0)" name="nibble_in3(31:0)" />
            <blockpin signalname="XLXN_169(31:0)" name="i_doa(31:0)" />
            <blockpin signalname="fixed2floatr(31:0)" name="fixed2floatr(31:0)" />
            <blockpin signalname="mulfpr(31:0)" name="mulfpr(31:0)" />
            <blockpin signalname="addfpr(31:0)" name="addfpr(31:0)" />
            <blockpin signalname="write_enable" name="o_write_enable" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="fixed2floatond" name="fixed2floatond" />
            <blockpin signalname="fixed2floatsclr" name="fixed2floatsclr" />
            <blockpin signalname="fixed2floatce" name="fixed2floatce" />
            <blockpin signalname="mulfpond" name="mulfpond" />
            <blockpin signalname="mulfpsclr" name="mulfpsclr" />
            <blockpin signalname="mulfpce" name="mulfpce" />
            <blockpin signalname="addfpond" name="addfpond" />
            <blockpin signalname="addfpsclr" name="addfpsclr" />
            <blockpin signalname="addfpce" name="addfpce" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="nibble_out1(3:0)" name="nibble_out1(3:0)" />
            <blockpin signalname="nibble_out2(3:0)" name="nibble_out2(3:0)" />
            <blockpin signalname="nibble_out4(3:0)" name="nibble_out4(3:0)" />
            <blockpin signalname="nibble_out3(5:0)" name="nibble_out3(5:0)" />
            <blockpin signalname="o_dia(31:0)" name="o_dia(31:0)" />
            <blockpin signalname="o_addra(9:0)" name="o_addra(9:0)" />
            <blockpin signalname="fixed2floata(63:0)" name="fixed2floata(63:0)" />
            <blockpin signalname="mulfpa(31:0)" name="mulfpa(31:0)" />
            <blockpin signalname="mulfpb(31:0)" name="mulfpb(31:0)" />
            <blockpin signalname="addfpa(31:0)" name="addfpa(31:0)" />
            <blockpin signalname="addfpb(31:0)" name="addfpb(31:0)" />
        </block>
        <block symbolname="rom_unsigned4bit" name="XLXI_49">
            <blockpin signalname="nibble_out1(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="nibble_in1(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_signed4bit" name="XLXI_50">
            <blockpin signalname="nibble_out2(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="nibble_in2(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_signed6bit" name="XLXI_53">
            <blockpin signalname="nibble_out3(5:0)" name="nibble_in(5:0)" />
            <blockpin signalname="nibble_in3(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_unsigned4bit_2powx" name="XLXI_54">
            <blockpin signalname="nibble_out4(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="nibble_in4(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="mux_addr" name="extroffparam_mux_addr">
            <blockpin signalname="o_rdy" name="rdy" />
            <blockpin signalname="o_addra(9:0)" name="addra(9:0)" />
            <blockpin signalname="i_addr(9:0)" name="i_addr(9:0)" />
            <blockpin signalname="mux_addr1(9:0)" name="mux_addr(9:0)" />
        </block>
        <block symbolname="m2_1" name="XLXI_56(31:0)">
            <blockpin signalname="XLXN_179(31:0)" name="D0" />
            <blockpin signalname="XLXN_180(31:0)" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="o_do(31:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_57">
            <attr value="00000000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_179(31:0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_58(31:0)">
            <blockpin signalname="doa1(31:0)" name="I" />
            <blockpin signalname="XLXN_169(31:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="addra2(4:0)">
            <wire x2="3360" y1="2576" y2="2592" x1="3360" />
        </branch>
        <branch name="addra2(14:5)">
            <wire x2="3408" y1="2496" y2="2496" x1="3328" />
            <wire x2="3408" y1="2496" y2="2544" x1="3408" />
            <wire x2="3328" y1="2544" y2="2592" x1="3328" />
            <wire x2="3408" y1="2544" y2="2544" x1="3328" />
        </branch>
        <branch name="addra1(4:0)">
            <wire x2="2176" y1="2576" y2="2592" x1="2176" />
        </branch>
        <branch name="addra1(14:5)">
            <wire x2="2224" y1="2496" y2="2496" x1="2144" />
            <wire x2="2224" y1="2496" y2="2544" x1="2224" />
            <wire x2="2144" y1="2544" y2="2592" x1="2144" />
            <wire x2="2224" y1="2544" y2="2544" x1="2144" />
        </branch>
        <branch name="mux_addr1(9:0)">
            <wire x2="1840" y1="2400" y2="2400" x1="1824" />
            <wire x2="1840" y1="2400" y2="2496" x1="1840" />
            <wire x2="1872" y1="2496" y2="2496" x1="1840" />
            <wire x2="1904" y1="2496" y2="2496" x1="1872" />
            <wire x2="1920" y1="2496" y2="2496" x1="1904" />
            <wire x2="1904" y1="2384" y2="2496" x1="1904" />
            <wire x2="2240" y1="2384" y2="2384" x1="1904" />
            <wire x2="2240" y1="2384" y2="2496" x1="2240" />
            <wire x2="3104" y1="2496" y2="2496" x1="2240" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="2224" y1="3008" y2="3008" x1="2176" />
        </branch>
        <branch name="addra2(14:0)">
            <wire x2="3360" y1="2688" y2="2688" x1="3328" />
            <wire x2="3408" y1="2688" y2="2688" x1="3360" />
        </branch>
        <branch name="addra1(14:0)">
            <wire x2="2176" y1="2688" y2="2688" x1="2144" />
            <wire x2="2224" y1="2688" y2="2688" x1="2176" />
        </branch>
        <branch name="mux_addr1(9)">
            <wire x2="1872" y1="2592" y2="3008" x1="1872" />
            <wire x2="1952" y1="3008" y2="3008" x1="1872" />
            <wire x2="1872" y1="3008" y2="3344" x1="1872" />
            <wire x2="2640" y1="3344" y2="3344" x1="1872" />
            <wire x2="1872" y1="3344" y2="3424" x1="1872" />
            <wire x2="4016" y1="3424" y2="3424" x1="1872" />
            <wire x2="3408" y1="3008" y2="3008" x1="2640" />
            <wire x2="2640" y1="3008" y2="3344" x1="2640" />
            <wire x2="4016" y1="2944" y2="3424" x1="4016" />
        </branch>
        <branch name="doa2(31:0)">
            <wire x2="4016" y1="2880" y2="2880" x1="3792" />
        </branch>
        <branch name="doa1(31:0)">
            <wire x2="2672" y1="2880" y2="2880" x1="2608" />
            <wire x2="2672" y1="2880" y2="3344" x1="2672" />
            <wire x2="3856" y1="3344" y2="3344" x1="2672" />
            <wire x2="2688" y1="2880" y2="2880" x1="2672" />
            <wire x2="2688" y1="2880" y2="3280" x1="2688" />
            <wire x2="3936" y1="3280" y2="3280" x1="2688" />
            <wire x2="4016" y1="2816" y2="2816" x1="3856" />
            <wire x2="3856" y1="2816" y2="3344" x1="3856" />
            <wire x2="3936" y1="2480" y2="3280" x1="3936" />
        </branch>
        <branch name="o_dia(31:0)">
            <wire x2="2896" y1="2176" y2="2176" x1="1376" />
            <wire x2="1376" y1="2176" y2="2880" x1="1376" />
            <wire x2="1776" y1="2880" y2="2880" x1="1376" />
            <wire x2="2224" y1="2880" y2="2880" x1="1776" />
            <wire x2="1776" y1="2880" y2="3312" x1="1776" />
            <wire x2="2704" y1="3312" y2="3312" x1="1776" />
            <wire x2="2704" y1="2880" y2="3312" x1="2704" />
            <wire x2="3408" y1="2880" y2="2880" x1="2704" />
            <wire x2="2896" y1="1232" y2="1232" x1="2848" />
            <wire x2="2896" y1="1232" y2="2176" x1="2896" />
        </branch>
        <branch name="XLXN_139(3:0)">
            <wire x2="2192" y1="3200" y2="3200" x1="2176" />
            <wire x2="2224" y1="3200" y2="3200" x1="2192" />
            <wire x2="2192" y1="3200" y2="3296" x1="2192" />
            <wire x2="2736" y1="3296" y2="3296" x1="2192" />
            <wire x2="3408" y1="3200" y2="3200" x1="2736" />
            <wire x2="2736" y1="3200" y2="3296" x1="2736" />
        </branch>
        <bustap x2="3360" y1="2688" y2="2592" x1="3360" />
        <bustap x2="3328" y1="2688" y2="2592" x1="3328" />
        <instance x="3488" y="2640" name="XLXI_7(4:0)" orien="R270" />
        <instance x="3104" y="2528" name="XLXI_8(9:0)" orien="R0" />
        <bustap x2="2176" y1="2688" y2="2592" x1="2176" />
        <bustap x2="2144" y1="2688" y2="2592" x1="2144" />
        <instance x="2304" y="2640" name="XLXI_10(4:0)" orien="R270" />
        <instance x="1920" y="2528" name="XLXI_11(9:0)" orien="R0" />
        <instance x="1952" y="3040" name="XLXI_12" orien="R0" />
        <bustap x2="1872" y1="2496" y2="2592" x1="1872" />
        <instance x="3408" y="3264" name="mem_extroffparam_2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <instance x="2224" y="3264" name="mem_extroffparam_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <instance x="4016" y="2976" name="MUX_DO(31:0)" orien="R0" />
        <instance x="1952" y="3168" name="XLXI_29(3:0)" orien="M180" />
        <branch name="i_reset">
            <wire x2="1312" y1="240" y2="240" x1="1248" />
            <wire x2="2272" y1="240" y2="240" x1="1312" />
            <wire x2="1312" y1="240" y2="3136" x1="1312" />
            <wire x2="1792" y1="3136" y2="3136" x1="1312" />
            <wire x2="2224" y1="3136" y2="3136" x1="1792" />
            <wire x2="1792" y1="3136" y2="3280" x1="1792" />
            <wire x2="2656" y1="3280" y2="3280" x1="1792" />
            <wire x2="3408" y1="3136" y2="3136" x1="2656" />
            <wire x2="2656" y1="3136" y2="3280" x1="2656" />
        </branch>
        <branch name="i_clock">
            <wire x2="1280" y1="144" y2="144" x1="1248" />
            <wire x2="2272" y1="144" y2="144" x1="1280" />
            <wire x2="1280" y1="144" y2="2752" x1="1280" />
            <wire x2="2208" y1="2752" y2="2752" x1="1280" />
            <wire x2="2208" y1="2752" y2="2816" x1="2208" />
            <wire x2="2224" y1="2816" y2="2816" x1="2208" />
            <wire x2="2960" y1="2608" y2="2608" x1="2208" />
            <wire x2="2960" y1="2608" y2="2816" x1="2960" />
            <wire x2="3408" y1="2816" y2="2816" x1="2960" />
            <wire x2="2208" y1="2608" y2="2752" x1="2208" />
        </branch>
        <branch name="write_enable">
            <wire x2="1248" y1="2208" y2="3200" x1="1248" />
            <wire x2="1952" y1="3200" y2="3200" x1="1248" />
            <wire x2="2992" y1="2208" y2="2208" x1="1248" />
            <wire x2="2992" y1="144" y2="144" x1="2848" />
            <wire x2="2992" y1="144" y2="2208" x1="2992" />
        </branch>
        <instance x="2272" y="1648" name="inst_ExtrOffParam_proc0" orien="R0">
        </instance>
        <instance x="2784" y="1680" name="XLXI_49" orien="R180">
        </instance>
        <instance x="2784" y="1792" name="XLXI_50" orien="R180">
        </instance>
        <instance x="2784" y="1904" name="XLXI_53" orien="R180">
        </instance>
        <instance x="2784" y="2016" name="XLXI_54" orien="R180">
        </instance>
        <branch name="nibble_out2(3:0)">
            <wire x2="2928" y1="1824" y2="1824" x1="2784" />
            <wire x2="2928" y1="1040" y2="1040" x1="2848" />
            <wire x2="2928" y1="1040" y2="1824" x1="2928" />
        </branch>
        <branch name="nibble_out1(3:0)">
            <wire x2="2944" y1="1712" y2="1712" x1="2784" />
            <wire x2="2944" y1="976" y2="976" x1="2848" />
            <wire x2="2944" y1="976" y2="1712" x1="2944" />
        </branch>
        <branch name="nibble_out3(5:0)">
            <wire x2="2960" y1="1936" y2="1936" x1="2784" />
            <wire x2="2960" y1="1168" y2="1168" x1="2848" />
            <wire x2="2960" y1="1168" y2="1936" x1="2960" />
        </branch>
        <branch name="nibble_out4(3:0)">
            <wire x2="2912" y1="2048" y2="2048" x1="2784" />
            <wire x2="2912" y1="1104" y2="1104" x1="2848" />
            <wire x2="2912" y1="1104" y2="2048" x1="2912" />
        </branch>
        <branch name="nibble_in1(31:0)">
            <wire x2="2272" y1="816" y2="816" x1="2256" />
            <wire x2="2256" y1="816" y2="1712" x1="2256" />
            <wire x2="2336" y1="1712" y2="1712" x1="2256" />
        </branch>
        <branch name="nibble_in2(31:0)">
            <wire x2="2272" y1="912" y2="912" x1="2240" />
            <wire x2="2240" y1="912" y2="1824" x1="2240" />
            <wire x2="2336" y1="1824" y2="1824" x1="2240" />
        </branch>
        <branch name="nibble_in3(31:0)">
            <wire x2="2272" y1="1104" y2="1104" x1="2224" />
            <wire x2="2224" y1="1104" y2="1936" x1="2224" />
            <wire x2="2336" y1="1936" y2="1936" x1="2224" />
        </branch>
        <branch name="nibble_in4(31:0)">
            <wire x2="2272" y1="1008" y2="1008" x1="2208" />
            <wire x2="2208" y1="1008" y2="2048" x1="2208" />
            <wire x2="2336" y1="2048" y2="2048" x1="2208" />
        </branch>
        <instance x="1440" y="2560" name="extroffparam_mux_addr" orien="R0">
        </instance>
        <branch name="i_addr(9:0)">
            <wire x2="1440" y1="2528" y2="2528" x1="1184" />
        </branch>
        <branch name="o_addra(9:0)">
            <wire x2="2880" y1="2192" y2="2192" x1="1344" />
            <wire x2="1344" y1="2192" y2="2464" x1="1344" />
            <wire x2="1440" y1="2464" y2="2464" x1="1344" />
            <wire x2="2880" y1="1296" y2="1296" x1="2848" />
            <wire x2="2880" y1="1296" y2="2192" x1="2880" />
        </branch>
        <iomarker fontsize="28" x="1184" y="2528" name="i_addr(9:0)" orien="R180" />
        <branch name="i_run">
            <wire x2="2272" y1="336" y2="336" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="2240" y="336" name="i_run" orien="R180" />
        <branch name="fixed2floatrdy">
            <wire x2="2272" y1="432" y2="432" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="2240" y="432" name="fixed2floatrdy" orien="R180" />
        <branch name="mulfprdy">
            <wire x2="2272" y1="528" y2="528" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="2240" y="528" name="mulfprdy" orien="R180" />
        <branch name="addfprdy">
            <wire x2="2272" y1="624" y2="624" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="2240" y="624" name="addfprdy" orien="R180" />
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="2272" y1="720" y2="720" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="2240" y="720" name="i2c_mem_douta(7:0)" orien="R180" />
        <branch name="fixed2floatr(31:0)">
            <wire x2="2272" y1="1296" y2="1296" x1="2160" />
        </branch>
        <branch name="mulfpr(31:0)">
            <wire x2="2272" y1="1392" y2="1392" x1="2160" />
        </branch>
        <branch name="addfpr(31:0)">
            <wire x2="2272" y1="1488" y2="1488" x1="2160" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="3024" y1="272" y2="272" x1="2848" />
        </branch>
        <branch name="fixed2floatond">
            <wire x2="3024" y1="336" y2="336" x1="2848" />
        </branch>
        <branch name="fixed2floatsclr">
            <wire x2="3024" y1="400" y2="400" x1="2848" />
        </branch>
        <branch name="fixed2floatce">
            <wire x2="3024" y1="464" y2="464" x1="2848" />
        </branch>
        <branch name="mulfpond">
            <wire x2="3024" y1="528" y2="528" x1="2848" />
        </branch>
        <branch name="mulfpsclr">
            <wire x2="3024" y1="592" y2="592" x1="2848" />
        </branch>
        <branch name="mulfpce">
            <wire x2="3024" y1="656" y2="656" x1="2848" />
        </branch>
        <branch name="addfpond">
            <wire x2="3024" y1="720" y2="720" x1="2848" />
        </branch>
        <branch name="addfpsclr">
            <wire x2="3024" y1="784" y2="784" x1="2848" />
        </branch>
        <branch name="addfpce">
            <wire x2="3024" y1="848" y2="848" x1="2848" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="3024" y1="912" y2="912" x1="2848" />
        </branch>
        <branch name="fixed2floata(63:0)">
            <wire x2="3024" y1="1360" y2="1360" x1="2848" />
        </branch>
        <branch name="mulfpa(31:0)">
            <wire x2="3024" y1="1424" y2="1424" x1="2848" />
        </branch>
        <branch name="mulfpb(31:0)">
            <wire x2="3024" y1="1488" y2="1488" x1="2848" />
        </branch>
        <branch name="addfpa(31:0)">
            <wire x2="3024" y1="1552" y2="1552" x1="2848" />
        </branch>
        <branch name="addfpb(31:0)">
            <wire x2="3024" y1="1616" y2="1616" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="3024" y="1360" name="fixed2floata(63:0)" orien="R0" />
        <iomarker fontsize="28" x="3024" y="1424" name="mulfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3024" y="1488" name="mulfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3024" y="1552" name="addfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3024" y="1616" name="addfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3024" y="208" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="3024" y="272" name="i2c_mem_ena" orien="R0" />
        <iomarker fontsize="28" x="3024" y="336" name="fixed2floatond" orien="R0" />
        <iomarker fontsize="28" x="3024" y="400" name="fixed2floatsclr" orien="R0" />
        <iomarker fontsize="28" x="3024" y="464" name="fixed2floatce" orien="R0" />
        <iomarker fontsize="28" x="3024" y="528" name="mulfpond" orien="R0" />
        <iomarker fontsize="28" x="3024" y="592" name="mulfpsclr" orien="R0" />
        <iomarker fontsize="28" x="3024" y="656" name="mulfpce" orien="R0" />
        <iomarker fontsize="28" x="3024" y="720" name="addfpond" orien="R0" />
        <iomarker fontsize="28" x="3024" y="784" name="addfpsclr" orien="R0" />
        <iomarker fontsize="28" x="3024" y="848" name="addfpce" orien="R0" />
        <iomarker fontsize="28" x="3024" y="912" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="1248" y="144" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="1248" y="240" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="2160" y="1296" name="fixed2floatr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2160" y="1392" name="mulfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2160" y="1488" name="addfpr(31:0)" orien="R180" />
        <branch name="o_rdy">
            <wire x2="2976" y1="2224" y2="2224" x1="1408" />
            <wire x2="1408" y1="2224" y2="2336" x1="1408" />
            <wire x2="1440" y1="2336" y2="2336" x1="1408" />
            <wire x2="1440" y1="2336" y2="2400" x1="1440" />
            <wire x2="1408" y1="2336" y2="3440" x1="1408" />
            <wire x2="4384" y1="3440" y2="3440" x1="1408" />
            <wire x2="2976" y1="208" y2="208" x1="2848" />
            <wire x2="3024" y1="208" y2="208" x1="2976" />
            <wire x2="2976" y1="208" y2="2224" x1="2976" />
            <wire x2="4448" y1="2976" y2="2976" x1="4384" />
            <wire x2="4384" y1="2976" y2="3440" x1="4384" />
        </branch>
        <instance x="4448" y="3008" name="XLXI_56(31:0)" orien="R0" />
        <instance x="4112" y="3040" name="XLXI_57" orien="R0">
        </instance>
        <iomarker fontsize="28" x="4848" y="2880" name="o_do(31:0)" orien="R0" />
        <instance x="3968" y="2480" name="XLXI_58(31:0)" orien="R270" />
        <branch name="XLXN_169(31:0)">
            <wire x2="2272" y1="1200" y2="1200" x1="2192" />
            <wire x2="2192" y1="1200" y2="1760" x1="2192" />
            <wire x2="3936" y1="1760" y2="1760" x1="2192" />
            <wire x2="3936" y1="1760" y2="2256" x1="3936" />
        </branch>
        <branch name="XLXN_179(31:0)">
            <wire x2="4400" y1="3072" y2="3072" x1="4256" />
            <wire x2="4400" y1="2848" y2="3072" x1="4400" />
            <wire x2="4448" y1="2848" y2="2848" x1="4400" />
        </branch>
        <branch name="o_do(31:0)">
            <wire x2="4848" y1="2880" y2="2880" x1="4768" />
        </branch>
        <branch name="XLXN_180(31:0)">
            <wire x2="4384" y1="2848" y2="2848" x1="4336" />
            <wire x2="4384" y1="2848" y2="2912" x1="4384" />
            <wire x2="4448" y1="2912" y2="2912" x1="4384" />
            <wire x2="4384" y1="2656" y2="2848" x1="4384" />
        </branch>
    </sheet>
</drawing>