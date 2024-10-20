<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
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
        <signal name="XLXN_88(31:0)" />
        <signal name="XLXN_139(3:0)" />
        <signal name="i_addr(9:0)" />
        <signal name="mux_addr1(9:0)" />
        <signal name="o_write_enable" />
        <signal name="XLXN_173(31:0)" />
        <signal name="XLXN_178(31:0)" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="XLXN_196(7:0)" />
        <signal name="XLXN_197(3:0)" />
        <signal name="XLXN_200(31:0)" />
        <signal name="XLXN_201(3:0)" />
        <signal name="XLXN_235(2:0)" />
        <signal name="XLXN_238(31:0)" />
        <signal name="XLXN_239(0:4)" />
        <signal name="XLXN_240(0:4)" />
        <signal name="XLXN_243" />
        <signal name="XLXN_244" />
        <signal name="XLXN_245(7:0)" />
        <signal name="XLXN_246(7:0)" />
        <signal name="XLXN_247(7:0)" />
        <signal name="XLXN_248(7:0)" />
        <signal name="XLXN_253(7:0)" />
        <signal name="XLXN_254(9:0)" />
        <signal name="o_rdy" />
        <signal name="divfpr(31:0)" />
        <signal name="addfpr(31:0)" />
        <signal name="mulfpr(31:0)" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="divfprdy" />
        <signal name="addfprdy" />
        <signal name="mulfprdy" />
        <signal name="i_run" />
        <signal name="i2c_mem_ena" />
        <signal name="mulfpond" />
        <signal name="mulfpsclr" />
        <signal name="mulfpce" />
        <signal name="addfpond" />
        <signal name="addfpsclr" />
        <signal name="addfpce" />
        <signal name="divfpond" />
        <signal name="divfpsclr" />
        <signal name="divfpce" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="mulfpa(31:0)" />
        <signal name="mulfpb(31:0)" />
        <signal name="addfpa(31:0)" />
        <signal name="addfpb(31:0)" />
        <signal name="divfpa(31:0)" />
        <signal name="divfpb(31:0)" />
        <signal name="o_do(31:0)" />
        <port polarity="Input" name="i_addr(9:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Input" name="divfpr(31:0)" />
        <port polarity="Input" name="addfpr(31:0)" />
        <port polarity="Input" name="mulfpr(31:0)" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Input" name="divfprdy" />
        <port polarity="Input" name="addfprdy" />
        <port polarity="Input" name="mulfprdy" />
        <port polarity="Input" name="i_run" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="mulfpond" />
        <port polarity="Output" name="mulfpsclr" />
        <port polarity="Output" name="mulfpce" />
        <port polarity="Output" name="addfpond" />
        <port polarity="Output" name="addfpsclr" />
        <port polarity="Output" name="addfpce" />
        <port polarity="Output" name="divfpond" />
        <port polarity="Output" name="divfpsclr" />
        <port polarity="Output" name="divfpce" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="mulfpa(31:0)" />
        <port polarity="Output" name="mulfpb(31:0)" />
        <port polarity="Output" name="addfpa(31:0)" />
        <port polarity="Output" name="addfpb(31:0)" />
        <port polarity="Output" name="divfpa(31:0)" />
        <port polarity="Output" name="divfpb(31:0)" />
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
        <blockdef name="ramb16_s36_s36">
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
        <blockdef name="ExtractKtaParameters_process_p0">
            <timestamp>2023-9-16T15:20:38</timestamp>
            <rect width="592" x="64" y="-1984" height="1984" />
            <line x2="0" y1="-1952" y2="-1952" x1="64" />
            <line x2="0" y1="-1840" y2="-1840" x1="64" />
            <line x2="0" y1="-1728" y2="-1728" x1="64" />
            <line x2="0" y1="-1616" y2="-1616" x1="64" />
            <line x2="0" y1="-1504" y2="-1504" x1="64" />
            <line x2="0" y1="-1392" y2="-1392" x1="64" />
            <rect width="64" x="0" y="-1292" height="24" />
            <line x2="0" y1="-1280" y2="-1280" x1="64" />
            <rect width="64" x="0" y="-1180" height="24" />
            <line x2="0" y1="-1168" y2="-1168" x1="64" />
            <rect width="64" x="0" y="-1068" height="24" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <rect width="64" x="0" y="-732" height="24" />
            <line x2="0" y1="-720" y2="-720" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-508" height="24" />
            <line x2="0" y1="-496" y2="-496" x1="64" />
            <rect width="64" x="0" y="-396" height="24" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="0" y="-284" height="24" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="720" y1="-1952" y2="-1952" x1="656" />
            <line x2="720" y1="-1888" y2="-1888" x1="656" />
            <line x2="720" y1="-1824" y2="-1824" x1="656" />
            <line x2="720" y1="-1760" y2="-1760" x1="656" />
            <line x2="720" y1="-1696" y2="-1696" x1="656" />
            <line x2="720" y1="-1632" y2="-1632" x1="656" />
            <line x2="720" y1="-1568" y2="-1568" x1="656" />
            <line x2="720" y1="-1504" y2="-1504" x1="656" />
            <line x2="720" y1="-1440" y2="-1440" x1="656" />
            <line x2="720" y1="-1376" y2="-1376" x1="656" />
            <line x2="720" y1="-1312" y2="-1312" x1="656" />
            <line x2="720" y1="-1248" y2="-1248" x1="656" />
            <rect width="64" x="656" y="-1196" height="24" />
            <line x2="720" y1="-1184" y2="-1184" x1="656" />
            <rect width="64" x="656" y="-1132" height="24" />
            <line x2="720" y1="-1120" y2="-1120" x1="656" />
            <rect width="64" x="656" y="-1068" height="24" />
            <line x2="720" y1="-1056" y2="-1056" x1="656" />
            <rect width="64" x="656" y="-1004" height="24" />
            <line x2="720" y1="-992" y2="-992" x1="656" />
            <rect width="64" x="656" y="-940" height="24" />
            <line x2="720" y1="-928" y2="-928" x1="656" />
            <rect width="64" x="656" y="-876" height="24" />
            <line x2="720" y1="-864" y2="-864" x1="656" />
            <rect width="64" x="656" y="-812" height="24" />
            <line x2="720" y1="-800" y2="-800" x1="656" />
            <rect width="64" x="656" y="-748" height="24" />
            <line x2="720" y1="-736" y2="-736" x1="656" />
            <rect width="64" x="656" y="-684" height="24" />
            <line x2="720" y1="-672" y2="-672" x1="656" />
            <rect width="64" x="656" y="-620" height="24" />
            <line x2="720" y1="-608" y2="-608" x1="656" />
            <rect width="64" x="656" y="-556" height="24" />
            <line x2="720" y1="-544" y2="-544" x1="656" />
            <rect width="64" x="656" y="-492" height="24" />
            <line x2="720" y1="-480" y2="-480" x1="656" />
            <rect width="64" x="656" y="-428" height="24" />
            <line x2="720" y1="-416" y2="-416" x1="656" />
            <rect width="64" x="656" y="-364" height="24" />
            <line x2="720" y1="-352" y2="-352" x1="656" />
            <rect width="64" x="656" y="-300" height="24" />
            <line x2="720" y1="-288" y2="-288" x1="656" />
            <rect width="64" x="656" y="-236" height="24" />
            <line x2="720" y1="-224" y2="-224" x1="656" />
            <rect width="64" x="656" y="-172" height="24" />
            <line x2="720" y1="-160" y2="-160" x1="656" />
            <rect width="64" x="656" y="-108" height="24" />
            <line x2="720" y1="-96" y2="-96" x1="656" />
            <rect width="64" x="656" y="-44" height="24" />
            <line x2="720" y1="-32" y2="-32" x1="656" />
        </blockdef>
        <blockdef name="rom_signed8bit">
            <timestamp>2023-6-14T11:31:35</timestamp>
            <rect width="288" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="352" y="-172" height="24" />
            <line x2="416" y1="-160" y2="-160" x1="352" />
        </blockdef>
        <blockdef name="rom_unsigned4bit_2powx8">
            <timestamp>2023-6-15T18:17:26</timestamp>
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
        <blockdef name="rom_signed3bit">
            <timestamp>2023-6-14T11:55:58</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="colrow_even">
            <timestamp>2023-6-14T12:3:46</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="ExtractKtaParameters_process_p1">
            <timestamp>2023-6-14T12:12:0</timestamp>
            <rect width="304" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-364" height="24" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
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
        <block symbolname="ramb16_s36_s36" name="mem_extrktaparam_1">
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
            <blockpin signalname="XLXN_88(31:0)" name="DIA(31:0)" />
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
        <block symbolname="m2_1" name="extractktaparameters_MUX_DO(31:0)">
            <blockpin signalname="XLXN_79(31:0)" name="D0" />
            <blockpin signalname="XLXN_78(31:0)" name="D1" />
            <blockpin signalname="mux_addr1(9)" name="S0" />
            <blockpin signalname="o_do(31:0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_29(3:0)">
            <blockpin signalname="o_write_enable" name="I" />
            <blockpin signalname="XLXN_139(3:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="extractktaparameters_MUX_ADDR(9:0)">
            <blockpin signalname="XLXN_254(9:0)" name="D0" />
            <blockpin signalname="i_addr(9:0)" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="mux_addr1(9:0)" name="O" />
        </block>
        <block symbolname="ramb16_s36_s36" name="mem_extrktaparam_2">
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
            <blockpin signalname="XLXN_88(31:0)" name="DIA(31:0)" />
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
        <block symbolname="ExtractKtaParameters_process_p0" name="inst_extrktaparam_proc0_inst">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="mulfprdy" name="mulfprdy" />
            <blockpin signalname="addfprdy" name="addfprdy" />
            <blockpin signalname="divfprdy" name="divfprdy" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_178(31:0)" name="nibble_in1(31:0)" />
            <blockpin signalname="XLXN_200(31:0)" name="nibble_in2(31:0)" />
            <blockpin signalname="XLXN_238(31:0)" name="nibble_in3(31:0)" />
            <blockpin signalname="XLXN_253(7:0)" name="ktarcee(7:0)" />
            <blockpin signalname="XLXN_173(31:0)" name="mem_signed256_ovalue(31:0)" />
            <blockpin signalname="mulfpr(31:0)" name="mulfpr(31:0)" />
            <blockpin signalname="addfpr(31:0)" name="addfpr(31:0)" />
            <blockpin signalname="divfpr(31:0)" name="divfpr(31:0)" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="o_write_enable" name="o_write_enable" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="mulfpond" name="mulfpond" />
            <blockpin signalname="mulfpsclr" name="mulfpsclr" />
            <blockpin signalname="mulfpce" name="mulfpce" />
            <blockpin signalname="addfpond" name="addfpond" />
            <blockpin signalname="addfpsclr" name="addfpsclr" />
            <blockpin signalname="addfpce" name="addfpce" />
            <blockpin signalname="divfpond" name="divfpond" />
            <blockpin signalname="divfpsclr" name="divfpsclr" />
            <blockpin signalname="divfpce" name="divfpce" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="XLXN_201(3:0)" name="nibble_out1(3:0)" />
            <blockpin signalname="XLXN_197(3:0)" name="nibble_out2(3:0)" />
            <blockpin signalname="XLXN_235(2:0)" name="nibble_out3(2:0)" />
            <blockpin signalname="XLXN_88(31:0)" name="o_dia(31:0)" />
            <blockpin signalname="XLXN_254(9:0)" name="o_addra(9:0)" />
            <blockpin signalname="XLXN_248(7:0)" name="ktarcee_oo(7:0)" />
            <blockpin signalname="XLXN_247(7:0)" name="ktarcee_eo(7:0)" />
            <blockpin signalname="XLXN_246(7:0)" name="ktarcee_oe(7:0)" />
            <blockpin signalname="XLXN_245(7:0)" name="ktarcee_ee(7:0)" />
            <blockpin signalname="XLXN_196(7:0)" name="mem_signed256_ivalue(7:0)" />
            <blockpin signalname="XLXN_240(0:4)" name="o_col(0:4)" />
            <blockpin signalname="XLXN_239(0:4)" name="o_row(0:4)" />
            <blockpin signalname="mulfpa(31:0)" name="mulfpa(31:0)" />
            <blockpin signalname="mulfpb(31:0)" name="mulfpb(31:0)" />
            <blockpin signalname="addfpa(31:0)" name="addfpa(31:0)" />
            <blockpin signalname="addfpb(31:0)" name="addfpb(31:0)" />
            <blockpin signalname="divfpa(31:0)" name="divfpa(31:0)" />
            <blockpin signalname="divfpb(31:0)" name="divfpb(31:0)" />
        </block>
        <block symbolname="rom_signed8bit" name="extractktaparameters_rom_signed8bit">
            <blockpin signalname="XLXN_196(7:0)" name="i_value(7:0)" />
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_173(31:0)" name="o_value(31:0)" />
        </block>
        <block symbolname="rom_unsigned4bit_2powx8" name="extractktaparameters_rom_unsigned4bit_2powx8">
            <blockpin signalname="XLXN_201(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="XLXN_178(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_unsigned4bit_2powx" name="extractktaparameters_rom_unsigned4bit_2powx">
            <blockpin signalname="XLXN_197(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="XLXN_200(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_signed3bit" name="extractktaparameters_rom_signed3bit">
            <blockpin signalname="XLXN_235(2:0)" name="nibble_in(2:0)" />
            <blockpin signalname="XLXN_238(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="colrow_even" name="extractktaparameters_colrow_even">
            <blockpin signalname="XLXN_240(0:4)" name="col(0:4)" />
            <blockpin signalname="XLXN_239(0:4)" name="row(0:4)" />
            <blockpin signalname="XLXN_243" name="cole" />
            <blockpin signalname="XLXN_244" name="rowe" />
        </block>
        <block symbolname="ExtractKtaParameters_process_p1" name="extractktaparameters_process_p1_inst">
            <blockpin signalname="XLXN_243" name="cole" />
            <blockpin signalname="XLXN_244" name="rowe" />
            <blockpin signalname="XLXN_248(7:0)" name="ktarcee_oo(7:0)" />
            <blockpin signalname="XLXN_247(7:0)" name="ktarcee_eo(7:0)" />
            <blockpin signalname="XLXN_246(7:0)" name="ktarcee_oe(7:0)" />
            <blockpin signalname="XLXN_245(7:0)" name="ktarcee_ee(7:0)" />
            <blockpin signalname="XLXN_253(7:0)" name="ktarcee(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="XLXN_45(4:0)">
            <wire x2="3936" y1="3440" y2="3456" x1="3936" />
        </branch>
        <branch name="XLXN_45(14:5)">
            <wire x2="3984" y1="3360" y2="3360" x1="3904" />
            <wire x2="3984" y1="3360" y2="3408" x1="3984" />
            <wire x2="3904" y1="3408" y2="3456" x1="3904" />
            <wire x2="3984" y1="3408" y2="3408" x1="3904" />
        </branch>
        <branch name="XLXN_44(4:0)">
            <wire x2="2752" y1="3440" y2="3456" x1="2752" />
        </branch>
        <branch name="XLXN_44(14:5)">
            <wire x2="2800" y1="3360" y2="3360" x1="2720" />
            <wire x2="2800" y1="3360" y2="3408" x1="2800" />
            <wire x2="2720" y1="3408" y2="3456" x1="2720" />
            <wire x2="2800" y1="3408" y2="3408" x1="2720" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="2800" y1="3872" y2="3872" x1="2752" />
        </branch>
        <branch name="XLXN_45(14:0)">
            <wire x2="3936" y1="3552" y2="3552" x1="3904" />
            <wire x2="3984" y1="3552" y2="3552" x1="3936" />
        </branch>
        <branch name="XLXN_44(14:0)">
            <wire x2="2752" y1="3552" y2="3552" x1="2720" />
            <wire x2="2800" y1="3552" y2="3552" x1="2752" />
        </branch>
        <branch name="mux_addr1(9)">
            <wire x2="2448" y1="3456" y2="3872" x1="2448" />
            <wire x2="2528" y1="3872" y2="3872" x1="2448" />
            <wire x2="2448" y1="3872" y2="4208" x1="2448" />
            <wire x2="3216" y1="4208" y2="4208" x1="2448" />
            <wire x2="2448" y1="4208" y2="4288" x1="2448" />
            <wire x2="4592" y1="4288" y2="4288" x1="2448" />
            <wire x2="3984" y1="3872" y2="3872" x1="3216" />
            <wire x2="3216" y1="3872" y2="4208" x1="3216" />
            <wire x2="4592" y1="3808" y2="4288" x1="4592" />
        </branch>
        <branch name="XLXN_78(31:0)">
            <wire x2="4592" y1="3744" y2="3744" x1="4368" />
        </branch>
        <branch name="XLXN_79(31:0)">
            <wire x2="3248" y1="3744" y2="3744" x1="3184" />
            <wire x2="3248" y1="3744" y2="4208" x1="3248" />
            <wire x2="4432" y1="4208" y2="4208" x1="3248" />
            <wire x2="4432" y1="3680" y2="4208" x1="4432" />
            <wire x2="4592" y1="3680" y2="3680" x1="4432" />
        </branch>
        <branch name="XLXN_88(31:0)">
            <wire x2="1968" y1="832" y2="3184" x1="1968" />
            <wire x2="1968" y1="3184" y2="3744" x1="1968" />
            <wire x2="2352" y1="3744" y2="3744" x1="1968" />
            <wire x2="2800" y1="3744" y2="3744" x1="2352" />
            <wire x2="2352" y1="3744" y2="4176" x1="2352" />
            <wire x2="3280" y1="4176" y2="4176" x1="2352" />
            <wire x2="3680" y1="832" y2="832" x1="1968" />
            <wire x2="3680" y1="832" y2="1776" x1="3680" />
            <wire x2="3280" y1="3744" y2="4176" x1="3280" />
            <wire x2="3984" y1="3744" y2="3744" x1="3280" />
            <wire x2="3680" y1="1776" y2="1776" x1="3600" />
        </branch>
        <branch name="XLXN_139(3:0)">
            <wire x2="2768" y1="4064" y2="4064" x1="2752" />
            <wire x2="2800" y1="4064" y2="4064" x1="2768" />
            <wire x2="2768" y1="4064" y2="4160" x1="2768" />
            <wire x2="3312" y1="4160" y2="4160" x1="2768" />
            <wire x2="3984" y1="4064" y2="4064" x1="3312" />
            <wire x2="3312" y1="4064" y2="4160" x1="3312" />
        </branch>
        <bustap x2="3936" y1="3552" y2="3456" x1="3936" />
        <bustap x2="3904" y1="3552" y2="3456" x1="3904" />
        <instance x="4064" y="3504" name="XLXI_7(4:0)" orien="R270" />
        <instance x="3680" y="3392" name="XLXI_8(9:0)" orien="R0" />
        <bustap x2="2752" y1="3552" y2="3456" x1="2752" />
        <bustap x2="2720" y1="3552" y2="3456" x1="2720" />
        <instance x="2880" y="3504" name="XLXI_10(4:0)" orien="R270" />
        <instance x="2496" y="3392" name="XLXI_11(9:0)" orien="R0" />
        <instance x="2528" y="3904" name="XLXI_5" orien="R0" />
        <bustap x2="2448" y1="3360" y2="3456" x1="2448" />
        <instance x="2800" y="4128" name="mem_extrktaparam_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <instance x="4592" y="3840" name="extractktaparameters_MUX_DO(31:0)" orien="R0" />
        <instance x="2528" y="4032" name="XLXI_29(3:0)" orien="M180" />
        <branch name="i_addr(9:0)">
            <wire x2="2096" y1="3328" y2="3328" x1="1920" />
        </branch>
        <branch name="mux_addr1(9:0)">
            <wire x2="2448" y1="3360" y2="3360" x1="2416" />
            <wire x2="2480" y1="3360" y2="3360" x1="2448" />
            <wire x2="2496" y1="3360" y2="3360" x1="2480" />
            <wire x2="2480" y1="3312" y2="3360" x1="2480" />
            <wire x2="2816" y1="3312" y2="3312" x1="2480" />
            <wire x2="2816" y1="3312" y2="3360" x1="2816" />
            <wire x2="3680" y1="3360" y2="3360" x1="2816" />
        </branch>
        <instance x="2096" y="3232" name="extractktaparameters_MUX_ADDR(9:0)" orien="M180" />
        <branch name="o_write_enable">
            <wire x2="1936" y1="816" y2="3184" x1="1936" />
            <wire x2="1936" y1="3184" y2="4064" x1="1936" />
            <wire x2="2528" y1="4064" y2="4064" x1="1936" />
            <wire x2="3824" y1="816" y2="816" x1="1936" />
            <wire x2="3824" y1="816" y2="2736" x1="3824" />
            <wire x2="3824" y1="2736" y2="2736" x1="3600" />
        </branch>
        <instance x="3984" y="4128" name="mem_extrktaparam_2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <instance x="2880" y="848" name="inst_extrktaparam_proc0_inst" orien="M180">
        </instance>
        <branch name="XLXN_173(31:0)">
            <wire x2="2816" y1="800" y2="1344" x1="2816" />
            <wire x2="2880" y1="1344" y2="1344" x1="2816" />
            <wire x2="3696" y1="800" y2="800" x1="2816" />
            <wire x2="3696" y1="800" y2="2896" x1="3696" />
            <wire x2="3696" y1="2896" y2="2896" x1="3456" />
        </branch>
        <branch name="XLXN_178(31:0)">
            <wire x2="2816" y1="2016" y2="3104" x1="2816" />
            <wire x2="3024" y1="3104" y2="3104" x1="2816" />
            <wire x2="2880" y1="2016" y2="2016" x1="2816" />
        </branch>
        <instance x="3040" y="3056" name="extractktaparameters_rom_signed8bit" orien="R0">
        </instance>
        <branch name="i_clock">
            <wire x2="2800" y1="2960" y2="2960" x1="2080" />
            <wire x2="3040" y1="2960" y2="2960" x1="2800" />
            <wire x2="2080" y1="2960" y2="3680" x1="2080" />
            <wire x2="2752" y1="3680" y2="3680" x1="2080" />
            <wire x2="2800" y1="3680" y2="3680" x1="2752" />
            <wire x2="2752" y1="3680" y2="3696" x1="2752" />
            <wire x2="2784" y1="3696" y2="3696" x1="2752" />
            <wire x2="2800" y1="2800" y2="2800" x1="2688" />
            <wire x2="2880" y1="2800" y2="2800" x1="2800" />
            <wire x2="2800" y1="2800" y2="2960" x1="2800" />
            <wire x2="2784" y1="3472" y2="3696" x1="2784" />
            <wire x2="3248" y1="3472" y2="3472" x1="2784" />
            <wire x2="3248" y1="3472" y2="3680" x1="3248" />
            <wire x2="3984" y1="3680" y2="3680" x1="3248" />
        </branch>
        <branch name="i_reset">
            <wire x2="2000" y1="3184" y2="4000" x1="2000" />
            <wire x2="2784" y1="4000" y2="4000" x1="2000" />
            <wire x2="2800" y1="4000" y2="4000" x1="2784" />
            <wire x2="2784" y1="4000" y2="4192" x1="2784" />
            <wire x2="3232" y1="4192" y2="4192" x1="2784" />
            <wire x2="2736" y1="3184" y2="3184" x1="2000" />
            <wire x2="2736" y1="2688" y2="2688" x1="2688" />
            <wire x2="2880" y1="2688" y2="2688" x1="2736" />
            <wire x2="2736" y1="2688" y2="3024" x1="2736" />
            <wire x2="3040" y1="3024" y2="3024" x1="2736" />
            <wire x2="2736" y1="3024" y2="3184" x1="2736" />
            <wire x2="3232" y1="4000" y2="4192" x1="3232" />
            <wire x2="3984" y1="4000" y2="4000" x1="3232" />
        </branch>
        <instance x="3472" y="3072" name="extractktaparameters_rom_unsigned4bit_2powx8" orien="R180">
        </instance>
        <branch name="XLXN_197(3:0)">
            <wire x2="3808" y1="3184" y2="3184" x1="3472" />
            <wire x2="3808" y1="1904" y2="1904" x1="3600" />
            <wire x2="3808" y1="1904" y2="3184" x1="3808" />
        </branch>
        <branch name="XLXN_200(31:0)">
            <wire x2="2784" y1="1904" y2="3184" x1="2784" />
            <wire x2="3024" y1="3184" y2="3184" x1="2784" />
            <wire x2="2880" y1="1904" y2="1904" x1="2784" />
        </branch>
        <instance x="3472" y="3216" name="extractktaparameters_rom_unsigned4bit_2powx" orien="M0">
        </instance>
        <branch name="XLXN_201(3:0)">
            <wire x2="3744" y1="3104" y2="3104" x1="3472" />
            <wire x2="3744" y1="1968" y2="1968" x1="3600" />
            <wire x2="3744" y1="1968" y2="3104" x1="3744" />
        </branch>
        <iomarker fontsize="28" x="1920" y="3328" name="i_addr(9:0)" orien="R180" />
        <instance x="3472" y="3296" name="extractktaparameters_rom_signed3bit" orien="M0">
        </instance>
        <branch name="XLXN_235(2:0)">
            <wire x2="3872" y1="3264" y2="3264" x1="3472" />
            <wire x2="3872" y1="1840" y2="1840" x1="3600" />
            <wire x2="3872" y1="1840" y2="3264" x1="3872" />
        </branch>
        <branch name="XLXN_238(31:0)">
            <wire x2="2752" y1="1568" y2="3264" x1="2752" />
            <wire x2="3024" y1="3264" y2="3264" x1="2752" />
            <wire x2="2880" y1="1568" y2="1568" x1="2752" />
        </branch>
        <instance x="3424" y="752" name="extractktaparameters_colrow_even" orien="M0">
        </instance>
        <branch name="XLXN_239(0:4)">
            <wire x2="3728" y1="720" y2="720" x1="3424" />
            <wire x2="3728" y1="720" y2="1264" x1="3728" />
            <wire x2="3728" y1="1264" y2="1264" x1="3600" />
        </branch>
        <branch name="XLXN_240(0:4)">
            <wire x2="3760" y1="656" y2="656" x1="3424" />
            <wire x2="3760" y1="656" y2="1328" x1="3760" />
            <wire x2="3760" y1="1328" y2="1328" x1="3600" />
        </branch>
        <instance x="3424" y="496" name="extractktaparameters_process_p1_inst" orien="M0">
        </instance>
        <branch name="XLXN_243">
            <wire x2="3504" y1="544" y2="544" x1="2976" />
            <wire x2="2976" y1="544" y2="656" x1="2976" />
            <wire x2="3040" y1="656" y2="656" x1="2976" />
            <wire x2="3504" y1="144" y2="144" x1="3424" />
            <wire x2="3504" y1="144" y2="544" x1="3504" />
        </branch>
        <branch name="XLXN_245(7:0)">
            <wire x2="3648" y1="464" y2="464" x1="3424" />
            <wire x2="3648" y1="464" y2="1456" x1="3648" />
            <wire x2="3648" y1="1456" y2="1456" x1="3600" />
        </branch>
        <branch name="XLXN_246(7:0)">
            <wire x2="3632" y1="400" y2="400" x1="3424" />
            <wire x2="3632" y1="400" y2="1200" x1="3632" />
            <wire x2="3632" y1="1200" y2="1520" x1="3632" />
            <wire x2="3632" y1="1520" y2="1520" x1="3600" />
        </branch>
        <branch name="XLXN_247(7:0)">
            <wire x2="3616" y1="336" y2="336" x1="3424" />
            <wire x2="3616" y1="336" y2="1584" x1="3616" />
            <wire x2="3616" y1="1584" y2="1584" x1="3600" />
        </branch>
        <branch name="XLXN_244">
            <wire x2="2992" y1="560" y2="720" x1="2992" />
            <wire x2="3040" y1="720" y2="720" x1="2992" />
            <wire x2="3488" y1="560" y2="560" x1="2992" />
            <wire x2="3488" y1="208" y2="208" x1="3424" />
            <wire x2="3488" y1="208" y2="560" x1="3488" />
        </branch>
        <branch name="XLXN_196(7:0)">
            <wire x2="3664" y1="2848" y2="2848" x1="2944" />
            <wire x2="2944" y1="2848" y2="2896" x1="2944" />
            <wire x2="3040" y1="2896" y2="2896" x1="2944" />
            <wire x2="3664" y1="1392" y2="1392" x1="3600" />
            <wire x2="3664" y1="1392" y2="2848" x1="3664" />
        </branch>
        <branch name="XLXN_248(7:0)">
            <wire x2="3712" y1="272" y2="272" x1="3424" />
            <wire x2="3712" y1="272" y2="1648" x1="3712" />
            <wire x2="3712" y1="1648" y2="1648" x1="3600" />
        </branch>
        <branch name="XLXN_253(7:0)">
            <wire x2="2784" y1="144" y2="1456" x1="2784" />
            <wire x2="2880" y1="1456" y2="1456" x1="2784" />
            <wire x2="2992" y1="144" y2="144" x1="2784" />
        </branch>
        <branch name="XLXN_254(9:0)">
            <wire x2="2016" y1="576" y2="3392" x1="2016" />
            <wire x2="2096" y1="3392" y2="3392" x1="2016" />
            <wire x2="3808" y1="576" y2="576" x1="2016" />
            <wire x2="3808" y1="576" y2="1712" x1="3808" />
            <wire x2="3808" y1="1712" y2="1712" x1="3600" />
        </branch>
        <branch name="o_rdy">
            <wire x2="2096" y1="768" y2="3264" x1="2096" />
            <wire x2="3840" y1="768" y2="768" x1="2096" />
            <wire x2="3840" y1="768" y2="2672" x1="3840" />
            <wire x2="3888" y1="2672" y2="2672" x1="3840" />
            <wire x2="3840" y1="2672" y2="2672" x1="3600" />
        </branch>
        <branch name="divfpr(31:0)">
            <wire x2="2864" y1="1008" y2="1008" x1="2688" />
            <wire x2="2880" y1="1008" y2="1008" x1="2864" />
        </branch>
        <branch name="addfpr(31:0)">
            <wire x2="2864" y1="1120" y2="1120" x1="2688" />
            <wire x2="2880" y1="1120" y2="1120" x1="2864" />
        </branch>
        <branch name="mulfpr(31:0)">
            <wire x2="2864" y1="1232" y2="1232" x1="2688" />
            <wire x2="2880" y1="1232" y2="1232" x1="2864" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="2864" y1="2128" y2="2128" x1="2688" />
            <wire x2="2880" y1="2128" y2="2128" x1="2864" />
        </branch>
        <branch name="divfprdy">
            <wire x2="2864" y1="2240" y2="2240" x1="2688" />
            <wire x2="2880" y1="2240" y2="2240" x1="2864" />
        </branch>
        <branch name="addfprdy">
            <wire x2="2864" y1="2352" y2="2352" x1="2688" />
            <wire x2="2880" y1="2352" y2="2352" x1="2864" />
        </branch>
        <branch name="mulfprdy">
            <wire x2="2864" y1="2464" y2="2464" x1="2688" />
            <wire x2="2880" y1="2464" y2="2464" x1="2864" />
        </branch>
        <branch name="i_run">
            <wire x2="2864" y1="2576" y2="2576" x1="2688" />
            <wire x2="2880" y1="2576" y2="2576" x1="2864" />
        </branch>
        <iomarker fontsize="28" x="2688" y="2688" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="2688" y="2800" name="i_clock" orien="R180" />
        <branch name="i2c_mem_ena">
            <wire x2="3616" y1="2800" y2="2800" x1="3600" />
            <wire x2="3888" y1="2800" y2="2800" x1="3616" />
        </branch>
        <branch name="mulfpond">
            <wire x2="3616" y1="2608" y2="2608" x1="3600" />
            <wire x2="3888" y1="2608" y2="2608" x1="3616" />
        </branch>
        <branch name="mulfpsclr">
            <wire x2="3616" y1="2544" y2="2544" x1="3600" />
            <wire x2="3888" y1="2544" y2="2544" x1="3616" />
        </branch>
        <branch name="mulfpce">
            <wire x2="3616" y1="2480" y2="2480" x1="3600" />
            <wire x2="3888" y1="2480" y2="2480" x1="3616" />
        </branch>
        <branch name="addfpond">
            <wire x2="3616" y1="2416" y2="2416" x1="3600" />
            <wire x2="3888" y1="2416" y2="2416" x1="3616" />
        </branch>
        <branch name="addfpsclr">
            <wire x2="3616" y1="2352" y2="2352" x1="3600" />
            <wire x2="3888" y1="2352" y2="2352" x1="3616" />
        </branch>
        <branch name="addfpce">
            <wire x2="3616" y1="2288" y2="2288" x1="3600" />
            <wire x2="3888" y1="2288" y2="2288" x1="3616" />
        </branch>
        <branch name="divfpond">
            <wire x2="3616" y1="2224" y2="2224" x1="3600" />
            <wire x2="3888" y1="2224" y2="2224" x1="3616" />
        </branch>
        <branch name="divfpsclr">
            <wire x2="3616" y1="2160" y2="2160" x1="3600" />
            <wire x2="3888" y1="2160" y2="2160" x1="3616" />
        </branch>
        <branch name="divfpce">
            <wire x2="3616" y1="2096" y2="2096" x1="3600" />
            <wire x2="3888" y1="2096" y2="2096" x1="3616" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="3616" y1="2032" y2="2032" x1="3600" />
            <wire x2="3888" y1="2032" y2="2032" x1="3616" />
        </branch>
        <branch name="mulfpa(31:0)">
            <wire x2="3888" y1="1200" y2="1200" x1="3600" />
        </branch>
        <branch name="mulfpb(31:0)">
            <wire x2="3888" y1="1136" y2="1136" x1="3600" />
        </branch>
        <branch name="addfpa(31:0)">
            <wire x2="3888" y1="1072" y2="1072" x1="3600" />
        </branch>
        <branch name="addfpb(31:0)">
            <wire x2="3888" y1="1008" y2="1008" x1="3600" />
        </branch>
        <branch name="divfpa(31:0)">
            <wire x2="3888" y1="944" y2="944" x1="3600" />
        </branch>
        <branch name="divfpb(31:0)">
            <wire x2="3888" y1="880" y2="880" x1="3600" />
        </branch>
        <iomarker fontsize="28" x="3888" y="880" name="divfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3888" y="944" name="divfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3888" y="1008" name="addfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3888" y="1072" name="addfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3888" y="1136" name="mulfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3888" y="1200" name="mulfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2032" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2096" name="divfpce" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2160" name="divfpsclr" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2288" name="addfpce" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2352" name="addfpsclr" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2416" name="addfpond" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2480" name="mulfpce" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2544" name="mulfpsclr" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2608" name="mulfpond" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2800" name="i2c_mem_ena" orien="R0" />
        <iomarker fontsize="28" x="3888" y="2224" name="divfpond" orien="R0" />
        <iomarker fontsize="28" x="2688" y="2576" name="i_run" orien="R180" />
        <iomarker fontsize="28" x="2688" y="2464" name="mulfprdy" orien="R180" />
        <iomarker fontsize="28" x="2688" y="2352" name="addfprdy" orien="R180" />
        <iomarker fontsize="28" x="2688" y="2240" name="divfprdy" orien="R180" />
        <iomarker fontsize="28" x="2688" y="2128" name="i2c_mem_douta(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2688" y="1232" name="mulfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2688" y="1120" name="addfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2688" y="1008" name="divfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="3888" y="2672" name="o_rdy" orien="R0" />
        <branch name="o_do(31:0)">
            <wire x2="4944" y1="3712" y2="3712" x1="4912" />
        </branch>
        <iomarker fontsize="28" x="4944" y="3712" name="o_do(31:0)" orien="R0" />
    </sheet>
</drawing>