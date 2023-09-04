<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(14:0)" />
        <signal name="i_ee0x2410(15:0)" />
        <signal name="i_ee0x2410(15:12)" />
        <signal name="XLXN_1(8:5)" />
        <signal name="XLXN_1(4:0)" />
        <signal name="XLXN_1(14:9)" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="XLXN_10" />
        <signal name="o_alphaptat(31:0)" />
        <port polarity="Input" name="i_ee0x2410(15:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Output" name="o_alphaptat(31:0)" />
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
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="RAMB16" name="ROM_ALPHAPTAT">
            <attr value="411c0000411800004114000041100000410c0000410800004104000041000000" name="INIT_00">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="413c0000413800004134000041300000412c0000412800004124000041200000" name="INIT_01">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
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
            <blockpin signalname="XLXN_1(14:0)" name="ADDRA(14:0)" />
            <blockpin name="ADDRB(14:0)" />
            <blockpin name="CASCADEINA" />
            <blockpin name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin name="DIA(31:0)" />
            <blockpin name="DIB(31:0)" />
            <blockpin name="DIPA(3:0)" />
            <blockpin name="DIPB(3:0)" />
            <blockpin signalname="XLXN_10" name="ENA" />
            <blockpin name="REGCEA" />
            <blockpin name="REGCEB" />
            <blockpin name="ENB" />
            <blockpin signalname="i_reset" name="SSRA" />
            <blockpin name="SSRB" />
            <blockpin name="WEA(3:0)" />
            <blockpin name="WEB(3:0)" />
            <blockpin name="CASCADEOUTA" />
            <blockpin name="CASCADEOUTB" />
            <blockpin signalname="o_alphaptat(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="buf" name="BUF(3:0)">
            <blockpin signalname="i_ee0x2410(15:12)" name="I" />
            <blockpin signalname="XLXN_1(8:5)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_3(4:0)">
            <blockpin signalname="XLXN_1(4:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_4(5:0)">
            <blockpin signalname="XLXN_1(14:9)" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_5">
            <blockpin signalname="XLXN_10" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1232" y="1248" name="ROM_ALPHAPTAT" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <branch name="XLXN_1(14:0)">
            <wire x2="976" y1="672" y2="672" x1="960" />
            <wire x2="1008" y1="672" y2="672" x1="976" />
            <wire x2="1040" y1="672" y2="672" x1="1008" />
            <wire x2="1232" y1="672" y2="672" x1="1040" />
        </branch>
        <branch name="i_ee0x2410(15:0)">
            <wire x2="1216" y1="400" y2="400" x1="960" />
            <wire x2="1232" y1="400" y2="400" x1="1216" />
        </branch>
        <iomarker fontsize="28" x="960" y="400" name="i_ee0x2410(15:0)" orien="R180" />
        <bustap x2="1216" y1="400" y2="496" x1="1216" />
        <branch name="i_ee0x2410(15:12)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1216" y="504" type="branch" />
            <wire x2="1216" y1="496" y2="512" x1="1216" />
        </branch>
        <instance x="1216" y="480" name="BUF(3:0)" orien="R180" />
        <bustap x2="976" y1="672" y2="576" x1="976" />
        <branch name="XLXN_1(8:5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="976" y="568" type="branch" />
            <wire x2="992" y1="512" y2="512" x1="976" />
            <wire x2="976" y1="512" y2="576" x1="976" />
        </branch>
        <bustap x2="1008" y1="672" y2="768" x1="1008" />
        <branch name="XLXN_1(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1008" y="776" type="branch" />
            <wire x2="1008" y1="768" y2="784" x1="1008" />
        </branch>
        <bustap x2="1040" y1="672" y2="768" x1="1040" />
        <branch name="XLXN_1(14:9)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="776" type="branch" />
            <wire x2="1040" y1="848" y2="848" x1="1008" />
            <wire x2="1040" y1="768" y2="784" x1="1040" />
            <wire x2="1040" y1="784" y2="848" x1="1040" />
        </branch>
        <instance x="880" y="720" name="XLXI_3(4:0)" orien="R90" />
        <instance x="880" y="784" name="XLXI_4(5:0)" orien="R90" />
        <branch name="i_clock">
            <wire x2="1232" y1="800" y2="800" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1200" y="800" name="i_clock" orien="R180" />
        <branch name="i_reset">
            <wire x2="1232" y1="1120" y2="1120" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1200" y="1120" name="i_reset" orien="R180" />
        <branch name="XLXN_10">
            <wire x2="1232" y1="992" y2="992" x1="1200" />
        </branch>
        <instance x="1200" y="1056" name="XLXI_5" orien="R270" />
        <branch name="o_alphaptat(31:0)">
            <wire x2="1648" y1="864" y2="864" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1648" y="864" name="o_alphaptat(31:0)" orien="R0" />
    </sheet>
</drawing>