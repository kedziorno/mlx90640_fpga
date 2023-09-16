<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ADDRA(14:0)" />
        <signal name="ADDRA(10:5)" />
        <signal name="i_ee0x2432(15:0)" />
        <signal name="i_ee0x2432(15:10)" />
        <signal name="ADDRA(4:0)" />
        <signal name="ADDRA(14:11)" />
        <signal name="i_clock" />
        <signal name="XLXN_11" />
        <signal name="i_reset" />
        <signal name="o_kvptat(31:0)" />
        <port polarity="Input" name="i_ee0x2432(15:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Output" name="o_kvptat(31:0)" />
        <blockdef name="RAMB16_S36_S36">
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
        <block symbolname="RAMB16_S36_S36" name="ROM_KVPTAT">
            <attr value="b9800000ba000000ba400000ba800000baa00000bac00000bae00000bb000000" name="INIT_07">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bb100000bb200000bb300000bb400000bb500000bb600000bb700000bb800000" name="INIT_06">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bb880000bb900000bb980000bba00000bba80000bbb00000bbb80000bbc00000" name="INIT_05">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bbc80000bbd00000bbd80000bbe00000bbe80000bbf00000bbf80000bc000000" name="INIT_04">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3bf800003bf000003be800003be000003bd800003bd000003bc800003bc00000" name="INIT_03">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3bb800003bb000003ba800003ba000003b9800003b9000003b8800003b800000" name="INIT_02">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3b7000003b6000003b5000003b4000003b3000003b2000003b1000003b000000" name="INIT_01">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3ae000003ac000003aa000003a8000003a4000003a0000003980000022000000" name="INIT_00">
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
            <blockpin signalname="ADDRA(14:0)" name="ADDRA(14:0)" />
            <blockpin name="ADDRB(14:0)" />
            <blockpin name="CASCADEINA" />
            <blockpin name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin name="DIA(31:0)" />
            <blockpin name="DIB(31:0)" />
            <blockpin name="DIPA(3:0)" />
            <blockpin name="DIPB(3:0)" />
            <blockpin signalname="XLXN_11" name="ENA" />
            <blockpin name="REGCEA" />
            <blockpin name="REGCEB" />
            <blockpin name="ENB" />
            <blockpin signalname="i_reset" name="SSRA" />
            <blockpin name="SSRB" />
            <blockpin name="WEA(3:0)" />
            <blockpin name="WEB(3:0)" />
            <blockpin name="CASCADEOUTA" />
            <blockpin name="CASCADEOUTB" />
            <blockpin signalname="o_kvptat(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="buf" name="BUF(5:0)">
            <blockpin signalname="i_ee0x2432(15:10)" name="I" />
            <blockpin signalname="ADDRA(10:5)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_5(3:0)">
            <blockpin signalname="ADDRA(14:11)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_6(4:0)">
            <blockpin signalname="ADDRA(4:0)" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_7">
            <blockpin signalname="XLXN_11" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="ADDRA(10:5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1536" y="248" type="branch" />
            <wire x2="1536" y1="240" y2="240" x1="1488" />
            <wire x2="1536" y1="240" y2="256" x1="1536" />
        </branch>
        <branch name="ADDRA(14:0)">
            <wire x2="1472" y1="352" y2="352" x1="1456" />
            <wire x2="1504" y1="352" y2="352" x1="1472" />
            <wire x2="1536" y1="352" y2="352" x1="1504" />
            <wire x2="1584" y1="352" y2="352" x1="1536" />
        </branch>
        <instance x="1584" y="928" name="ROM_KVPTAT" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <bustap x2="1536" y1="352" y2="256" x1="1536" />
        <branch name="i_ee0x2432(15:0)">
            <wire x2="1216" y1="128" y2="128" x1="1088" />
            <wire x2="1232" y1="128" y2="128" x1="1216" />
        </branch>
        <branch name="i_ee0x2432(15:10)">
            <wire x2="1216" y1="224" y2="240" x1="1216" />
            <wire x2="1264" y1="240" y2="240" x1="1216" />
        </branch>
        <bustap x2="1216" y1="128" y2="224" x1="1216" />
        <iomarker fontsize="28" x="1088" y="128" name="i_ee0x2432(15:0)" orien="R180" />
        <instance x="1264" y="272" name="BUF(5:0)" orien="R0" />
        <bustap x2="1504" y1="352" y2="448" x1="1504" />
        <branch name="ADDRA(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1504" y="456" type="branch" />
            <wire x2="1504" y1="528" y2="528" x1="1472" />
            <wire x2="1504" y1="448" y2="464" x1="1504" />
            <wire x2="1504" y1="464" y2="528" x1="1504" />
        </branch>
        <bustap x2="1472" y1="352" y2="448" x1="1472" />
        <branch name="ADDRA(14:11)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="456" type="branch" />
            <wire x2="1472" y1="448" y2="464" x1="1472" />
        </branch>
        <instance x="1344" y="400" name="XLXI_5(3:0)" orien="R90" />
        <instance x="1344" y="464" name="XLXI_6(4:0)" orien="R90" />
        <branch name="i_clock">
            <wire x2="1568" y1="576" y2="576" x1="1472" />
            <wire x2="1584" y1="480" y2="480" x1="1568" />
            <wire x2="1568" y1="480" y2="576" x1="1568" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1584" y1="672" y2="672" x1="1472" />
        </branch>
        <branch name="i_reset">
            <wire x2="1584" y1="800" y2="800" x1="1472" />
        </branch>
        <instance x="1472" y="736" name="XLXI_7" orien="R270" />
        <iomarker fontsize="28" x="1472" y="576" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="1472" y="800" name="i_reset" orien="R180" />
        <branch name="o_kvptat(31:0)">
            <wire x2="2000" y1="544" y2="544" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2000" y="544" name="o_kvptat(31:0)" orien="R0" />
    </sheet>
</drawing>
