<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="XLXN_44(14:0)" />
        <signal name="XLXN_45(4:0)" />
        <signal name="XLXN_45(14:5)" />
        <signal name="XLXN_44(4:0)" />
        <signal name="XLXN_44(14:5)" />
        <signal name="mux_addr(9:0)" />
        <signal name="XLXN_59" />
        <signal name="mux_addr(9)" />
        <signal name="XLXN_45(14:0)" />
        <signal name="XLXN_78(31:0)" />
        <signal name="XLXN_79(31:0)" />
        <signal name="i_addr(9:0)" />
        <signal name="XLXN_86(9:0)" />
        <signal name="XLXN_88(31:0)" />
        <signal name="XLXN_109" />
        <signal name="i2c_mem_ena" />
        <signal name="XLXN_112" />
        <signal name="XLXN_114(11:0)" />
        <signal name="XLXN_115(11:0)" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="XLXN_117" />
        <signal name="XLXN_118(63:0)" />
        <signal name="XLXN_119(63:0)" />
        <signal name="fixed2floata(63:0)" />
        <signal name="fixed2floatr(31:0)" />
        <signal name="fixed2floatrdy" />
        <signal name="XLXN_113" />
        <signal name="XLXN_132" />
        <signal name="XLXN_133" />
        <signal name="XLXN_134" />
        <signal name="XLXN_135" />
        <signal name="XLXN_136" />
        <signal name="XLXN_137" />
        <signal name="fixed2floatond" />
        <signal name="fixed2floatsclr" />
        <signal name="fixed2floatce" />
        <signal name="XLXN_139(3:0)" />
        <signal name="XLXN_140" />
        <signal name="XLXN_141(31:0)" />
        <signal name="mulfpb(31:0)" />
        <signal name="mulfpa(31:0)" />
        <signal name="mulfpond" />
        <signal name="mulfpsclr" />
        <signal name="mulfpce" />
        <signal name="XLXN_155" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="i_run" />
        <signal name="mulfprdy" />
        <signal name="mulfpr(31:0)" />
        <signal name="divfprdy" />
        <signal name="divfpr(31:0)" />
        <signal name="divfpb(31:0)" />
        <signal name="divfpa(31:0)" />
        <signal name="divfpce" />
        <signal name="divfpsclr" />
        <signal name="divfpond" />
        <signal name="o_rdy" />
        <signal name="XLXN_157(31:0)" />
        <signal name="XLXN_158(31:0)" />
        <signal name="o_do(31:0)" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Input" name="i_addr(9:0)" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="fixed2floata(63:0)" />
        <port polarity="Input" name="fixed2floatr(31:0)" />
        <port polarity="Input" name="fixed2floatrdy" />
        <port polarity="Output" name="fixed2floatond" />
        <port polarity="Output" name="fixed2floatsclr" />
        <port polarity="Output" name="fixed2floatce" />
        <port polarity="Output" name="mulfpb(31:0)" />
        <port polarity="Output" name="mulfpa(31:0)" />
        <port polarity="Output" name="mulfpond" />
        <port polarity="Output" name="mulfpsclr" />
        <port polarity="Output" name="mulfpce" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="mulfprdy" />
        <port polarity="Input" name="mulfpr(31:0)" />
        <port polarity="Input" name="divfprdy" />
        <port polarity="Input" name="divfpr(31:0)" />
        <port polarity="Output" name="divfpb(31:0)" />
        <port polarity="Output" name="divfpa(31:0)" />
        <port polarity="Output" name="divfpce" />
        <port polarity="Output" name="divfpsclr" />
        <port polarity="Output" name="divfpond" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Output" name="o_do(31:0)" />
        <blockdef name="CalculateKGain_process_p0">
            <timestamp>2023-6-15T18:17:26</timestamp>
            <rect width="448" x="64" y="-832" height="832" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-704" y2="-704" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-512" y2="-512" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="576" y1="-800" y2="-800" x1="512" />
            <line x2="576" y1="-736" y2="-736" x1="512" />
            <line x2="576" y1="-672" y2="-672" x1="512" />
            <line x2="576" y1="-608" y2="-608" x1="512" />
            <line x2="576" y1="-544" y2="-544" x1="512" />
            <line x2="576" y1="-480" y2="-480" x1="512" />
            <line x2="576" y1="-416" y2="-416" x1="512" />
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
        <blockdef name="CalculatePixGain_process_p0">
            <timestamp>2023-6-13T13:20:25</timestamp>
            <rect width="528" x="64" y="-1088" height="1088" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <line x2="0" y1="-944" y2="-944" x1="64" />
            <line x2="0" y1="-832" y2="-832" x1="64" />
            <line x2="0" y1="-720" y2="-720" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-496" y2="-496" x1="64" />
            <rect width="64" x="0" y="-396" height="24" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="0" y="-284" height="24" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="656" y1="-1056" y2="-1056" x1="592" />
            <line x2="656" y1="-992" y2="-992" x1="592" />
            <line x2="656" y1="-928" y2="-928" x1="592" />
            <line x2="656" y1="-864" y2="-864" x1="592" />
            <line x2="656" y1="-800" y2="-800" x1="592" />
            <line x2="656" y1="-736" y2="-736" x1="592" />
            <line x2="656" y1="-672" y2="-672" x1="592" />
            <line x2="656" y1="-608" y2="-608" x1="592" />
            <line x2="656" y1="-544" y2="-544" x1="592" />
            <line x2="656" y1="-480" y2="-480" x1="592" />
            <line x2="656" y1="-416" y2="-416" x1="592" />
            <rect width="64" x="592" y="-364" height="24" />
            <line x2="656" y1="-352" y2="-352" x1="592" />
            <rect width="64" x="592" y="-300" height="24" />
            <line x2="656" y1="-288" y2="-288" x1="592" />
            <rect width="64" x="592" y="-236" height="24" />
            <line x2="656" y1="-224" y2="-224" x1="592" />
            <rect width="64" x="592" y="-172" height="24" />
            <line x2="656" y1="-160" y2="-160" x1="592" />
            <rect width="64" x="592" y="-108" height="24" />
            <line x2="656" y1="-96" y2="-96" x1="592" />
            <rect width="64" x="592" y="-44" height="24" />
            <line x2="656" y1="-32" y2="-32" x1="592" />
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
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <block symbolname="CalculateKGain_process_p0" name="inst_CalcKGain_proc0">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_117" name="i_run" />
            <blockpin signalname="fixed2floatrdy" name="fixed2floatrdy" />
            <blockpin signalname="divfprdy" name="divfprdy" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="fixed2floatr(31:0)" name="fixed2floatr(31:0)" />
            <blockpin signalname="divfpr(31:0)" name="divfpr(31:0)" />
            <blockpin signalname="XLXN_112" name="i2c_mem_ena" />
            <blockpin signalname="XLXN_155" name="o_rdy" />
            <blockpin signalname="XLXN_135" name="fixed2floatond" />
            <blockpin signalname="XLXN_136" name="fixed2floatsclr" />
            <blockpin signalname="XLXN_137" name="fixed2floatce" />
            <blockpin signalname="divfpond" name="divfpond" />
            <blockpin signalname="divfpsclr" name="divfpsclr" />
            <blockpin signalname="divfpce" name="divfpce" />
            <blockpin signalname="XLXN_115(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="XLXN_141(31:0)" name="o_KGain(31:0)" />
            <blockpin signalname="XLXN_119(63:0)" name="fixed2floata(63:0)" />
            <blockpin signalname="divfpa(31:0)" name="divfpa(31:0)" />
            <blockpin signalname="divfpb(31:0)" name="divfpb(31:0)" />
        </block>
        <block symbolname="CalculatePixGain_process_p0" name="inst_CalcPixGain_proc0">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="XLXN_155" name="CalculateKGain_rdy" />
            <blockpin signalname="fixed2floatrdy" name="fixed2floatrdy" />
            <blockpin signalname="mulfprdy" name="mulfprdy" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_141(31:0)" name="CalculateKGain_KGain(31:0)" />
            <blockpin signalname="fixed2floatr(31:0)" name="fixed2floatr(31:0)" />
            <blockpin signalname="mulfpr(31:0)" name="mulfpr(31:0)" />
            <blockpin signalname="XLXN_109" name="i2c_mem_ena" />
            <blockpin signalname="XLXN_117" name="CalculateKGain_run" />
            <blockpin signalname="XLXN_113" name="CalculateKGain_mux" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="XLXN_140" name="o_write_enable" />
            <blockpin signalname="XLXN_132" name="fixed2floatond" />
            <blockpin signalname="XLXN_134" name="fixed2floatsclr" />
            <blockpin signalname="XLXN_133" name="fixed2floatce" />
            <blockpin signalname="mulfpond" name="mulfpond" />
            <blockpin signalname="mulfpsclr" name="mulfpsclr" />
            <blockpin signalname="mulfpce" name="mulfpce" />
            <blockpin signalname="XLXN_114(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="XLXN_86(9:0)" name="o_addra(9:0)" />
            <blockpin signalname="XLXN_157(31:0)" name="o_dia(31:0)" />
            <blockpin signalname="XLXN_118(63:0)" name="fixed2floata(63:0)" />
            <blockpin signalname="mulfpa(31:0)" name="mulfpa(31:0)" />
            <blockpin signalname="mulfpb(31:0)" name="mulfpb(31:0)" />
        </block>
        <block symbolname="ramb16" name="mem_KGain_1">
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
        <block symbolname="ramb16" name="mem_KGain_2">
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
            <blockpin signalname="mux_addr(9)" name="ENA" />
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
        <block symbolname="gnd" name="XLXI_7(4:0)">
            <blockpin signalname="XLXN_45(4:0)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_8(9:0)">
            <blockpin signalname="mux_addr(9:0)" name="I" />
            <blockpin signalname="XLXN_45(14:5)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_10(4:0)">
            <blockpin signalname="XLXN_44(4:0)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_11(9:0)">
            <blockpin signalname="mux_addr(9:0)" name="I" />
            <blockpin signalname="XLXN_44(14:5)" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_12">
            <blockpin signalname="mux_addr(9)" name="I" />
            <blockpin signalname="XLXN_59" name="O" />
        </block>
        <block symbolname="m2_1" name="MUX_DO(31:0)">
            <blockpin signalname="XLXN_79(31:0)" name="D0" />
            <blockpin signalname="XLXN_78(31:0)" name="D1" />
            <blockpin signalname="mux_addr(9)" name="S0" />
            <blockpin signalname="o_do(31:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="mux2_addra(9:0)">
            <blockpin signalname="XLXN_86(9:0)" name="D0" />
            <blockpin signalname="i_addr(9:0)" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="mux_addr(9:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="MUX_DIA(31:0)">
            <blockpin signalname="XLXN_157(31:0)" name="D0" />
            <blockpin signalname="XLXN_158(31:0)" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="XLXN_88(31:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_20">
            <attr value="00000000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_158(31:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_21">
            <blockpin signalname="XLXN_109" name="D0" />
            <blockpin signalname="XLXN_112" name="D1" />
            <blockpin signalname="XLXN_113" name="S0" />
            <blockpin signalname="i2c_mem_ena" name="O" />
        </block>
        <block symbolname="m2_1" name="MUX_I2C_ADDR(11:0)">
            <blockpin signalname="XLXN_114(11:0)" name="D0" />
            <blockpin signalname="XLXN_115(11:0)" name="D1" />
            <blockpin signalname="XLXN_113" name="S0" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="MUX_F2FA(63:0)">
            <blockpin signalname="XLXN_118(63:0)" name="D0" />
            <blockpin signalname="XLXN_119(63:0)" name="D1" />
            <blockpin signalname="XLXN_113" name="S0" />
            <blockpin signalname="fixed2floata(63:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_24">
            <blockpin signalname="XLXN_132" name="D0" />
            <blockpin signalname="XLXN_135" name="D1" />
            <blockpin signalname="XLXN_113" name="S0" />
            <blockpin signalname="fixed2floatond" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_26">
            <blockpin signalname="XLXN_134" name="D0" />
            <blockpin signalname="XLXN_136" name="D1" />
            <blockpin signalname="XLXN_113" name="S0" />
            <blockpin signalname="fixed2floatsclr" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_27">
            <blockpin signalname="XLXN_133" name="D0" />
            <blockpin signalname="XLXN_137" name="D1" />
            <blockpin signalname="XLXN_113" name="S0" />
            <blockpin signalname="fixed2floatce" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_29(3:0)">
            <blockpin signalname="XLXN_140" name="I" />
            <blockpin signalname="XLXN_139(3:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="3024" y="1376" name="inst_CalcKGain_proc0" orien="R0">
        </instance>
        <instance x="3008" y="2976" name="inst_CalcPixGain_proc0" orien="R0">
        </instance>
        <bustap x2="3680" y1="3808" y2="3712" x1="3680" />
        <branch name="XLXN_45(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3680" y="3704" type="branch" />
            <wire x2="3680" y1="3696" y2="3712" x1="3680" />
        </branch>
        <bustap x2="3648" y1="3808" y2="3712" x1="3648" />
        <branch name="XLXN_45(14:5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3648" y="3704" type="branch" />
            <wire x2="3728" y1="3616" y2="3616" x1="3648" />
            <wire x2="3728" y1="3616" y2="3664" x1="3728" />
            <wire x2="3648" y1="3664" y2="3712" x1="3648" />
            <wire x2="3728" y1="3664" y2="3664" x1="3648" />
        </branch>
        <instance x="3808" y="3760" name="XLXI_7(4:0)" orien="R270" />
        <instance x="3424" y="3648" name="XLXI_8(9:0)" orien="R0" />
        <bustap x2="2496" y1="3808" y2="3712" x1="2496" />
        <branch name="XLXN_44(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2496" y="3704" type="branch" />
            <wire x2="2496" y1="3696" y2="3712" x1="2496" />
        </branch>
        <bustap x2="2464" y1="3808" y2="3712" x1="2464" />
        <branch name="XLXN_44(14:5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2464" y="3704" type="branch" />
            <wire x2="2544" y1="3616" y2="3616" x1="2464" />
            <wire x2="2544" y1="3616" y2="3664" x1="2544" />
            <wire x2="2464" y1="3664" y2="3712" x1="2464" />
            <wire x2="2544" y1="3664" y2="3664" x1="2464" />
        </branch>
        <instance x="2624" y="3760" name="XLXI_10(4:0)" orien="R270" />
        <instance x="2240" y="3648" name="XLXI_11(9:0)" orien="R0" />
        <branch name="mux_addr(9:0)">
            <wire x2="2192" y1="3616" y2="3616" x1="2080" />
            <wire x2="2224" y1="3616" y2="3616" x1="2192" />
            <wire x2="2240" y1="3616" y2="3616" x1="2224" />
            <wire x2="2224" y1="3504" y2="3616" x1="2224" />
            <wire x2="2560" y1="3504" y2="3504" x1="2224" />
            <wire x2="2560" y1="3504" y2="3616" x1="2560" />
            <wire x2="3424" y1="3616" y2="3616" x1="2560" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="2544" y1="4128" y2="4128" x1="2496" />
        </branch>
        <instance x="2272" y="4160" name="XLXI_12" orien="R0" />
        <bustap x2="2192" y1="3616" y2="3712" x1="2192" />
        <branch name="XLXN_45(14:0)">
            <wire x2="3680" y1="3808" y2="3808" x1="3648" />
            <wire x2="3728" y1="3808" y2="3808" x1="3680" />
        </branch>
        <branch name="XLXN_44(14:0)">
            <wire x2="2496" y1="3808" y2="3808" x1="2464" />
            <wire x2="2544" y1="3808" y2="3808" x1="2496" />
        </branch>
        <instance x="3728" y="4384" name="mem_KGain_2" orien="R0">
        </instance>
        <instance x="2544" y="4384" name="mem_KGain_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <branch name="mux_addr(9)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2192" y="3728" type="branch" />
            <wire x2="2192" y1="3712" y2="3728" x1="2192" />
            <wire x2="2192" y1="3728" y2="4128" x1="2192" />
            <wire x2="2272" y1="4128" y2="4128" x1="2192" />
            <wire x2="2192" y1="4128" y2="4464" x1="2192" />
            <wire x2="2960" y1="4464" y2="4464" x1="2192" />
            <wire x2="2192" y1="4464" y2="4544" x1="2192" />
            <wire x2="4336" y1="4544" y2="4544" x1="2192" />
            <wire x2="3728" y1="4128" y2="4128" x1="2960" />
            <wire x2="2960" y1="4128" y2="4464" x1="2960" />
            <wire x2="4336" y1="4064" y2="4544" x1="4336" />
        </branch>
        <instance x="4336" y="4096" name="MUX_DO(31:0)" orien="R0" />
        <branch name="XLXN_78(31:0)">
            <wire x2="4336" y1="4000" y2="4000" x1="4112" />
        </branch>
        <branch name="XLXN_79(31:0)">
            <wire x2="2992" y1="4000" y2="4000" x1="2928" />
            <wire x2="2992" y1="4000" y2="4464" x1="2992" />
            <wire x2="4176" y1="4464" y2="4464" x1="2992" />
            <wire x2="4176" y1="3936" y2="4464" x1="4176" />
            <wire x2="4336" y1="3936" y2="3936" x1="4176" />
        </branch>
        <instance x="1760" y="3488" name="mux2_addra(9:0)" orien="M180" />
        <branch name="i_addr(9:0)">
            <wire x2="1760" y1="3584" y2="3584" x1="1632" />
        </branch>
        <branch name="XLXN_86(9:0)">
            <wire x2="1760" y1="3648" y2="3648" x1="1680" />
            <wire x2="1680" y1="3648" y2="4448" x1="1680" />
            <wire x2="4160" y1="4448" y2="4448" x1="1680" />
            <wire x2="3760" y1="2688" y2="2688" x1="3664" />
            <wire x2="3760" y1="2688" y2="3616" x1="3760" />
            <wire x2="4160" y1="3616" y2="3616" x1="3760" />
            <wire x2="4160" y1="3616" y2="4448" x1="4160" />
        </branch>
        <branch name="XLXN_88(31:0)">
            <wire x2="2096" y1="4000" y2="4000" x1="2080" />
            <wire x2="2544" y1="4000" y2="4000" x1="2096" />
            <wire x2="2096" y1="4000" y2="4432" x1="2096" />
            <wire x2="3024" y1="4432" y2="4432" x1="2096" />
            <wire x2="3024" y1="4000" y2="4432" x1="3024" />
            <wire x2="3728" y1="4000" y2="4000" x1="3024" />
        </branch>
        <instance x="1760" y="3872" name="MUX_DIA(31:0)" orien="M180" />
        <iomarker fontsize="28" x="1632" y="3584" name="i_addr(9:0)" orien="R180" />
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="2944" y1="2592" y2="2592" x1="2816" />
            <wire x2="3008" y1="2592" y2="2592" x1="2944" />
            <wire x2="2944" y1="1056" y2="2592" x1="2944" />
            <wire x2="3024" y1="1056" y2="1056" x1="2944" />
        </branch>
        <iomarker fontsize="28" x="2816" y="2592" name="i2c_mem_douta(7:0)" orien="R180" />
        <instance x="4320" y="2080" name="XLXI_21" orien="R0" />
        <branch name="XLXN_109">
            <wire x2="4320" y1="1920" y2="1920" x1="3664" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="4672" y1="1952" y2="1952" x1="4640" />
        </branch>
        <iomarker fontsize="28" x="4672" y="1952" name="i2c_mem_ena" orien="R0" />
        <branch name="XLXN_112">
            <wire x2="3888" y1="576" y2="576" x1="3600" />
            <wire x2="3888" y1="576" y2="1984" x1="3888" />
            <wire x2="4320" y1="1984" y2="1984" x1="3888" />
        </branch>
        <branch name="XLXN_114(11:0)">
            <wire x2="3776" y1="2624" y2="2624" x1="3664" />
            <wire x2="3776" y1="2624" y2="2720" x1="3776" />
            <wire x2="4320" y1="2720" y2="2720" x1="3776" />
        </branch>
        <branch name="XLXN_115(11:0)">
            <wire x2="3792" y1="1088" y2="1088" x1="3600" />
            <wire x2="3792" y1="1088" y2="2656" x1="3792" />
            <wire x2="4320" y1="2656" y2="2656" x1="3792" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="4672" y1="2688" y2="2688" x1="4640" />
        </branch>
        <branch name="XLXN_117">
            <wire x2="2912" y1="768" y2="1392" x1="2912" />
            <wire x2="3728" y1="1392" y2="1392" x1="2912" />
            <wire x2="3728" y1="1392" y2="1984" x1="3728" />
            <wire x2="3024" y1="768" y2="768" x1="2912" />
            <wire x2="3728" y1="1984" y2="1984" x1="3664" />
        </branch>
        <branch name="XLXN_118(63:0)">
            <wire x2="3728" y1="2816" y2="2816" x1="3664" />
            <wire x2="3728" y1="2816" y2="2912" x1="3728" />
            <wire x2="4320" y1="2912" y2="2912" x1="3728" />
        </branch>
        <branch name="XLXN_119(63:0)">
            <wire x2="3904" y1="1216" y2="1216" x1="3600" />
            <wire x2="3904" y1="1216" y2="2848" x1="3904" />
            <wire x2="4320" y1="2848" y2="2848" x1="3904" />
        </branch>
        <branch name="fixed2floata(63:0)">
            <wire x2="4672" y1="2880" y2="2880" x1="4640" />
        </branch>
        <branch name="fixed2floatr(31:0)">
            <wire x2="2928" y1="2816" y2="2816" x1="2816" />
            <wire x2="3008" y1="2816" y2="2816" x1="2928" />
            <wire x2="2928" y1="1152" y2="2816" x1="2928" />
            <wire x2="3024" y1="1152" y2="1152" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2816" y="2816" name="fixed2floatr(31:0)" orien="R180" />
        <branch name="fixed2floatrdy">
            <wire x2="2960" y1="2368" y2="2368" x1="2816" />
            <wire x2="3008" y1="2368" y2="2368" x1="2960" />
            <wire x2="2960" y1="864" y2="2368" x1="2960" />
            <wire x2="3024" y1="864" y2="864" x1="2960" />
        </branch>
        <iomarker fontsize="28" x="2816" y="2368" name="fixed2floatrdy" orien="R180" />
        <instance x="4320" y="2032" name="XLXI_24" orien="M180" />
        <instance x="4320" y="2208" name="XLXI_26" orien="M180" />
        <instance x="4320" y="2560" name="MUX_I2C_ADDR(11:0)" orien="M180" />
        <iomarker fontsize="28" x="4672" y="2688" name="i2c_mem_addra(11:0)" orien="R0" />
        <instance x="4320" y="2384" name="XLXI_27" orien="M180" />
        <branch name="XLXN_132">
            <wire x2="3872" y1="2240" y2="2240" x1="3664" />
            <wire x2="4320" y1="2192" y2="2192" x1="3872" />
            <wire x2="3872" y1="2192" y2="2240" x1="3872" />
        </branch>
        <branch name="XLXN_133">
            <wire x2="3808" y1="2368" y2="2368" x1="3664" />
            <wire x2="3808" y1="2368" y2="2544" x1="3808" />
            <wire x2="4320" y1="2544" y2="2544" x1="3808" />
        </branch>
        <branch name="XLXN_134">
            <wire x2="3840" y1="2304" y2="2304" x1="3664" />
            <wire x2="3840" y1="2304" y2="2352" x1="3840" />
            <wire x2="4320" y1="2352" y2="2352" x1="3840" />
            <wire x2="4320" y1="2352" y2="2368" x1="4320" />
        </branch>
        <branch name="XLXN_135">
            <wire x2="3872" y1="704" y2="704" x1="3600" />
            <wire x2="3872" y1="704" y2="2128" x1="3872" />
            <wire x2="4320" y1="2128" y2="2128" x1="3872" />
        </branch>
        <branch name="XLXN_136">
            <wire x2="3856" y1="768" y2="768" x1="3600" />
            <wire x2="3856" y1="768" y2="2304" x1="3856" />
            <wire x2="4320" y1="2304" y2="2304" x1="3856" />
        </branch>
        <branch name="XLXN_137">
            <wire x2="3824" y1="832" y2="832" x1="3600" />
            <wire x2="3824" y1="832" y2="2480" x1="3824" />
            <wire x2="4320" y1="2480" y2="2480" x1="3824" />
        </branch>
        <branch name="fixed2floatond">
            <wire x2="4672" y1="2160" y2="2160" x1="4640" />
        </branch>
        <iomarker fontsize="28" x="4672" y="2160" name="fixed2floatond" orien="R0" />
        <branch name="fixed2floatsclr">
            <wire x2="4672" y1="2336" y2="2336" x1="4640" />
        </branch>
        <iomarker fontsize="28" x="4672" y="2336" name="fixed2floatsclr" orien="R0" />
        <branch name="fixed2floatce">
            <wire x2="4672" y1="2512" y2="2512" x1="4640" />
        </branch>
        <iomarker fontsize="28" x="4672" y="2512" name="fixed2floatce" orien="R0" />
        <branch name="XLXN_139(3:0)">
            <wire x2="2512" y1="4320" y2="4320" x1="2496" />
            <wire x2="2544" y1="4320" y2="4320" x1="2512" />
            <wire x2="2512" y1="4320" y2="4416" x1="2512" />
            <wire x2="3056" y1="4416" y2="4416" x1="2512" />
            <wire x2="3728" y1="4320" y2="4320" x1="3056" />
            <wire x2="3056" y1="4320" y2="4416" x1="3056" />
        </branch>
        <instance x="2272" y="4288" name="XLXI_29(3:0)" orien="M180" />
        <branch name="XLXN_140">
            <wire x2="2272" y1="4320" y2="4320" x1="2208" />
            <wire x2="2208" y1="4320" y2="4480" x1="2208" />
            <wire x2="4144" y1="4480" y2="4480" x1="2208" />
            <wire x2="4144" y1="2176" y2="2176" x1="3664" />
            <wire x2="4144" y1="2176" y2="4480" x1="4144" />
        </branch>
        <branch name="XLXN_141(31:0)">
            <wire x2="2912" y1="1824" y2="2704" x1="2912" />
            <wire x2="3008" y1="2704" y2="2704" x1="2912" />
            <wire x2="3680" y1="1824" y2="1824" x1="2912" />
            <wire x2="3680" y1="1152" y2="1152" x1="3600" />
            <wire x2="3680" y1="1152" y2="1824" x1="3680" />
        </branch>
        <branch name="mulfpb(31:0)">
            <wire x2="3920" y1="2944" y2="2944" x1="3664" />
        </branch>
        <branch name="mulfpa(31:0)">
            <wire x2="3920" y1="2880" y2="2880" x1="3664" />
        </branch>
        <instance x="4320" y="2752" name="MUX_F2FA(63:0)" orien="M180" />
        <branch name="XLXN_113">
            <wire x2="4304" y1="2048" y2="2048" x1="3664" />
            <wire x2="4320" y1="2048" y2="2048" x1="4304" />
            <wire x2="4304" y1="2048" y2="2064" x1="4304" />
            <wire x2="4320" y1="2064" y2="2064" x1="4304" />
            <wire x2="4304" y1="2064" y2="2240" x1="4304" />
            <wire x2="4320" y1="2240" y2="2240" x1="4304" />
            <wire x2="4304" y1="2240" y2="2416" x1="4304" />
            <wire x2="4304" y1="2416" y2="2592" x1="4304" />
            <wire x2="4320" y1="2592" y2="2592" x1="4304" />
            <wire x2="4304" y1="2592" y2="2784" x1="4304" />
            <wire x2="4320" y1="2784" y2="2784" x1="4304" />
            <wire x2="4320" y1="2416" y2="2416" x1="4304" />
        </branch>
        <iomarker fontsize="28" x="4672" y="2880" name="fixed2floata(63:0)" orien="R0" />
        <branch name="mulfpond">
            <wire x2="3680" y1="2432" y2="2432" x1="3664" />
            <wire x2="3680" y1="2432" y2="2448" x1="3680" />
            <wire x2="3920" y1="2448" y2="2448" x1="3680" />
        </branch>
        <iomarker fontsize="28" x="3920" y="2512" name="mulfpsclr" orien="R0" />
        <branch name="mulfpsclr">
            <wire x2="3680" y1="2496" y2="2496" x1="3664" />
            <wire x2="3680" y1="2496" y2="2512" x1="3680" />
            <wire x2="3920" y1="2512" y2="2512" x1="3680" />
        </branch>
        <iomarker fontsize="28" x="3920" y="2576" name="mulfpce" orien="R0" />
        <branch name="mulfpce">
            <wire x2="3680" y1="2560" y2="2560" x1="3664" />
            <wire x2="3680" y1="2560" y2="2576" x1="3680" />
            <wire x2="3920" y1="2576" y2="2576" x1="3680" />
        </branch>
        <iomarker fontsize="28" x="3920" y="2448" name="mulfpond" orien="R0" />
        <iomarker fontsize="28" x="3920" y="2880" name="mulfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3920" y="2944" name="mulfpb(31:0)" orien="R0" />
        <branch name="XLXN_155">
            <wire x2="2896" y1="1808" y2="2256" x1="2896" />
            <wire x2="3008" y1="2256" y2="2256" x1="2896" />
            <wire x2="3696" y1="1808" y2="1808" x1="2896" />
            <wire x2="3696" y1="640" y2="640" x1="3600" />
            <wire x2="3696" y1="640" y2="1808" x1="3696" />
        </branch>
        <branch name="i_clock">
            <wire x2="2528" y1="3728" y2="3936" x1="2528" />
            <wire x2="2544" y1="3936" y2="3936" x1="2528" />
            <wire x2="2848" y1="3728" y2="3728" x1="2528" />
            <wire x2="3280" y1="3728" y2="3728" x1="2848" />
            <wire x2="3280" y1="3728" y2="3936" x1="3280" />
            <wire x2="3728" y1="3936" y2="3936" x1="3280" />
            <wire x2="2848" y1="1920" y2="1920" x1="2816" />
            <wire x2="2880" y1="1920" y2="1920" x1="2848" />
            <wire x2="3008" y1="1920" y2="1920" x1="2880" />
            <wire x2="2848" y1="1920" y2="3728" x1="2848" />
            <wire x2="2880" y1="576" y2="1920" x1="2880" />
            <wire x2="3024" y1="576" y2="576" x1="2880" />
        </branch>
        <branch name="i_reset">
            <wire x2="2832" y1="3424" y2="3424" x1="2112" />
            <wire x2="2112" y1="3424" y2="4256" x1="2112" />
            <wire x2="2544" y1="4256" y2="4256" x1="2112" />
            <wire x2="2112" y1="4256" y2="4400" x1="2112" />
            <wire x2="2976" y1="4400" y2="4400" x1="2112" />
            <wire x2="2832" y1="2032" y2="2032" x1="2816" />
            <wire x2="2864" y1="2032" y2="2032" x1="2832" />
            <wire x2="3008" y1="2032" y2="2032" x1="2864" />
            <wire x2="2832" y1="2032" y2="3424" x1="2832" />
            <wire x2="2864" y1="672" y2="2032" x1="2864" />
            <wire x2="3024" y1="672" y2="672" x1="2864" />
            <wire x2="2976" y1="4256" y2="4400" x1="2976" />
            <wire x2="3728" y1="4256" y2="4256" x1="2976" />
        </branch>
        <branch name="i_run">
            <wire x2="3008" y1="2144" y2="2144" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2816" y="2144" name="i_run" orien="R180" />
        <iomarker fontsize="28" x="2816" y="2032" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="2816" y="1920" name="i_clock" orien="R180" />
        <branch name="mulfprdy">
            <wire x2="3008" y1="2480" y2="2480" x1="2816" />
        </branch>
        <branch name="mulfpr(31:0)">
            <wire x2="3008" y1="2928" y2="2928" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2816" y="2928" name="mulfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2816" y="2480" name="mulfprdy" orien="R180" />
        <branch name="divfprdy">
            <wire x2="3024" y1="960" y2="960" x1="2848" />
        </branch>
        <branch name="divfpr(31:0)">
            <wire x2="3024" y1="1248" y2="1248" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="2848" y="960" name="divfprdy" orien="R180" />
        <iomarker fontsize="28" x="2848" y="1248" name="divfpr(31:0)" orien="R180" />
        <branch name="divfpb(31:0)">
            <wire x2="3920" y1="1344" y2="1344" x1="3600" />
        </branch>
        <branch name="divfpa(31:0)">
            <wire x2="3920" y1="1280" y2="1280" x1="3600" />
        </branch>
        <branch name="divfpce">
            <wire x2="3920" y1="1024" y2="1024" x1="3600" />
        </branch>
        <branch name="divfpsclr">
            <wire x2="3920" y1="960" y2="960" x1="3600" />
        </branch>
        <branch name="divfpond">
            <wire x2="3920" y1="896" y2="896" x1="3600" />
        </branch>
        <iomarker fontsize="28" x="3920" y="1280" name="divfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3920" y="1344" name="divfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3920" y="896" name="divfpond" orien="R0" />
        <iomarker fontsize="28" x="3920" y="960" name="divfpsclr" orien="R0" />
        <iomarker fontsize="28" x="3920" y="1024" name="divfpce" orien="R0" />
        <iomarker fontsize="28" x="3920" y="1888" name="o_rdy" orien="R0" />
        <branch name="XLXN_157(31:0)">
            <wire x2="3744" y1="3440" y2="3440" x1="1744" />
            <wire x2="1744" y1="3440" y2="4032" x1="1744" />
            <wire x2="1760" y1="4032" y2="4032" x1="1744" />
            <wire x2="3744" y1="2752" y2="2752" x1="3664" />
            <wire x2="3744" y1="2752" y2="3440" x1="3744" />
        </branch>
        <instance x="1760" y="4192" name="XLXI_20" orien="M270">
        </instance>
        <branch name="XLXN_158(31:0)">
            <wire x2="1760" y1="3968" y2="3968" x1="1728" />
            <wire x2="1728" y1="3968" y2="4048" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="4688" y="3968" name="o_do(31:0)" orien="R0" />
        <branch name="o_do(31:0)">
            <wire x2="4688" y1="3968" y2="3968" x1="4656" />
        </branch>
        <branch name="o_rdy">
            <wire x2="1728" y1="3456" y2="3904" x1="1728" />
            <wire x2="1760" y1="3904" y2="3904" x1="1728" />
            <wire x2="1760" y1="3456" y2="3456" x1="1728" />
            <wire x2="1760" y1="3456" y2="3520" x1="1760" />
            <wire x2="3712" y1="3456" y2="3456" x1="1760" />
            <wire x2="3712" y1="2112" y2="2112" x1="3664" />
            <wire x2="3712" y1="2112" y2="3456" x1="3712" />
            <wire x2="3920" y1="1888" y2="1888" x1="3712" />
            <wire x2="3712" y1="1888" y2="2112" x1="3712" />
        </branch>
    </sheet>
</drawing>