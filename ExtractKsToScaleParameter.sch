<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(14:0)" />
        <signal name="XLXN_1(4:0)" />
        <signal name="XLXN_1(14:9)" />
        <signal name="XLXN_10" />
        <signal name="XLXN_1(8:5)" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="i_run" />
        <signal name="i2c_mem_ena" />
        <signal name="o_rdy" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="o_kstoscale(31:0)" />
        <signal name="XLXN_20(31:0)" />
        <signal name="i2c_mem_douta(7:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_run" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="o_kstoscale(31:0)" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
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
        <blockdef name="ExtractKsToScaleParameter_process_p0">
            <timestamp>2023-6-16T15:0:29</timestamp>
            <rect width="480" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="608" y1="-288" y2="-288" x1="544" />
            <line x2="608" y1="-224" y2="-224" x1="544" />
            <rect width="64" x="544" y="-172" height="24" />
            <line x2="608" y1="-160" y2="-160" x1="544" />
            <rect width="64" x="544" y="-108" height="24" />
            <line x2="608" y1="-96" y2="-96" x1="544" />
            <rect width="64" x="544" y="-44" height="24" />
            <line x2="608" y1="-32" y2="-32" x1="544" />
        </blockdef>
        <block symbolname="RAMB16_S36_S36" name="ROM_KSTOSCALE">
            <attr value="4700000046800000460000004580000045000000448000004400000043800000" name="INIT_00">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="4b0000004a8000004a0000004980000049000000488000004800000047800000" name="INIT_01">
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
            <blockpin signalname="XLXN_20(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
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
        <block symbolname="ExtractKsToScaleParameter_process_p0" name="Extractkstoscaleparameter_process_p0_inst">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_20(31:0)" name="odata_kstoscale(31:0)" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="XLXN_1(8:5)" name="address_kstoscale(3:0)" />
            <blockpin signalname="o_kstoscale(31:0)" name="o_kstoscale(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1696" y="2576" name="ROM_KSTOSCALE" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <branch name="XLXN_1(14:0)">
            <wire x2="1440" y1="2000" y2="2000" x1="1424" />
            <wire x2="1472" y1="2000" y2="2000" x1="1440" />
            <wire x2="1504" y1="2000" y2="2000" x1="1472" />
            <wire x2="1696" y1="2000" y2="2000" x1="1504" />
        </branch>
        <bustap x2="1472" y1="2000" y2="2096" x1="1472" />
        <branch name="XLXN_1(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="2104" type="branch" />
            <wire x2="1472" y1="2096" y2="2112" x1="1472" />
        </branch>
        <bustap x2="1504" y1="2000" y2="2096" x1="1504" />
        <branch name="XLXN_1(14:9)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1504" y="2104" type="branch" />
            <wire x2="1504" y1="2176" y2="2176" x1="1472" />
            <wire x2="1504" y1="2096" y2="2112" x1="1504" />
            <wire x2="1504" y1="2112" y2="2176" x1="1504" />
        </branch>
        <instance x="1344" y="2048" name="XLXI_3(4:0)" orien="R90" />
        <instance x="1344" y="2112" name="XLXI_4(5:0)" orien="R90" />
        <branch name="XLXN_10">
            <wire x2="1696" y1="2320" y2="2320" x1="1664" />
        </branch>
        <instance x="1664" y="2384" name="XLXI_5" orien="R270" />
        <bustap x2="1440" y1="2000" y2="1904" x1="1440" />
        <branch name="XLXN_1(8:5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1896" type="branch" />
            <wire x2="1440" y1="1840" y2="1904" x1="1440" />
            <wire x2="2224" y1="1840" y2="1840" x1="1440" />
            <wire x2="2224" y1="1600" y2="1600" x1="2176" />
            <wire x2="2224" y1="1600" y2="1840" x1="2224" />
        </branch>
        <instance x="1568" y="1696" name="Extractkstoscaleparameter_process_p0_inst" orien="R0">
        </instance>
        <branch name="i_clock">
            <wire x2="1296" y1="1408" y2="1408" x1="1264" />
            <wire x2="1296" y1="1408" y2="2128" x1="1296" />
            <wire x2="1696" y1="2128" y2="2128" x1="1296" />
            <wire x2="1568" y1="1408" y2="1408" x1="1296" />
        </branch>
        <branch name="i_reset">
            <wire x2="1312" y1="1472" y2="1472" x1="1264" />
            <wire x2="1312" y1="1472" y2="2448" x1="1312" />
            <wire x2="1696" y1="2448" y2="2448" x1="1312" />
            <wire x2="1568" y1="1472" y2="1472" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1264" y="1408" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="1264" y="1472" name="i_reset" orien="R180" />
        <branch name="i_run">
            <wire x2="1552" y1="1536" y2="1536" x1="1264" />
            <wire x2="1568" y1="1536" y2="1536" x1="1552" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="2192" y1="1408" y2="1408" x1="2176" />
            <wire x2="2320" y1="1408" y2="1408" x1="2192" />
        </branch>
        <branch name="o_rdy">
            <wire x2="2192" y1="1472" y2="1472" x1="2176" />
            <wire x2="2320" y1="1472" y2="1472" x1="2192" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="2192" y1="1536" y2="1536" x1="2176" />
            <wire x2="2320" y1="1536" y2="1536" x1="2192" />
        </branch>
        <branch name="o_kstoscale(31:0)">
            <wire x2="2192" y1="1664" y2="1664" x1="2176" />
            <wire x2="2320" y1="1664" y2="1664" x1="2192" />
        </branch>
        <iomarker fontsize="28" x="1264" y="1536" name="i_run" orien="R180" />
        <iomarker fontsize="28" x="2320" y="1664" name="o_kstoscale(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2320" y="1536" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="2320" y="1472" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="2320" y="1408" name="i2c_mem_ena" orien="R0" />
        <branch name="XLXN_20(31:0)">
            <wire x2="1568" y1="1664" y2="1664" x1="1504" />
            <wire x2="1504" y1="1664" y2="1776" x1="1504" />
            <wire x2="2144" y1="1776" y2="1776" x1="1504" />
            <wire x2="2144" y1="1776" y2="2192" x1="2144" />
            <wire x2="2144" y1="2192" y2="2192" x1="2080" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="1568" y1="1600" y2="1600" x1="1264" />
        </branch>
        <iomarker fontsize="28" x="1264" y="1600" name="i2c_mem_douta(7:0)" orien="R180" />
    </sheet>
</drawing>