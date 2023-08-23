<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ADDR(13:0)" />
        <signal name="XLXN_11" />
        <signal name="i_reset" />
        <signal name="i_clock" />
        <signal name="do" />
        <signal name="o_pattern" />
        <signal name="XLXN_44" />
        <signal name="ADDR(13:2)" />
        <signal name="ADDR(1:0)" />
        <signal name="i_pixel(11:0)" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Output" name="o_pattern" />
        <port polarity="Input" name="i_pixel(11:0)" />
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="ramb16_s1">
            <timestamp>2023-6-15T21:57:34</timestamp>
            <rect width="256" x="64" y="-608" height="608" />
            <line x2="0" y1="-576" y2="-576" x1="64" />
            <rect width="64" x="0" y="-588" height="24" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="0" y="-396" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-384" y2="-384" x1="320" />
            <rect width="64" x="320" y="-396" height="24" />
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
        <block symbolname="vcc" name="XLXI_7">
            <blockpin signalname="XLXN_11" name="P" />
        </block>
        <block symbolname="buf" name="XLXI_8">
            <blockpin signalname="do" name="I" />
            <blockpin signalname="o_pattern" name="O" />
        </block>
        <block symbolname="ramb16_s1" name="XLXI_10">
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_0B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_0A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_09">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_08">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_07">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_06">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_05">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_04">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_03">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_02">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_01">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="0101010101010101010101010101010110101010101010101010101010101010" name="INIT_00">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <blockpin signalname="ADDR(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="i_clock" name="CLK" />
            <blockpin name="DI(0:0)" />
            <blockpin signalname="XLXN_11" name="EN" />
            <blockpin signalname="i_reset" name="SSR" />
            <blockpin signalname="XLXN_44" name="WE" />
            <blockpin signalname="do" name="DO(0:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_11">
            <blockpin signalname="XLXN_44" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_12(1:0)">
            <blockpin signalname="ADDR(1:0)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_13(11:0)">
            <blockpin signalname="i_pixel(11:0)" name="I" />
            <blockpin signalname="ADDR(13:2)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1680" y="2448" name="XLXI_7" orien="R270" />
        <branch name="i_clock">
            <wire x2="1712" y1="2288" y2="2288" x1="1616" />
            <wire x2="1712" y1="2192" y2="2288" x1="1712" />
            <wire x2="1792" y1="2192" y2="2192" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="1616" y="2288" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="1616" y="2512" name="i_reset" orien="R180" />
        <branch name="i_reset">
            <wire x2="1792" y1="2512" y2="2512" x1="1616" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1792" y1="2384" y2="2384" x1="1680" />
        </branch>
        <branch name="ADDR(13:0)">
            <wire x2="1712" y1="2064" y2="2064" x1="1696" />
            <wire x2="1760" y1="2064" y2="2064" x1="1712" />
            <wire x2="1792" y1="2064" y2="2064" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="2320" y="2384" name="o_pattern" orien="R90" />
        <instance x="2368" y="2240" name="XLXI_8" orien="R90" />
        <branch name="do">
            <wire x2="2240" y1="2256" y2="2256" x1="2176" />
            <wire x2="2240" y1="2224" y2="2256" x1="2240" />
            <wire x2="2320" y1="2224" y2="2224" x1="2240" />
            <wire x2="2320" y1="2224" y2="2288" x1="2320" />
            <wire x2="2352" y1="2288" y2="2288" x1="2320" />
            <wire x2="2352" y1="2176" y2="2288" x1="2352" />
            <wire x2="2400" y1="2176" y2="2176" x1="2352" />
            <wire x2="2400" y1="2176" y2="2240" x1="2400" />
        </branch>
        <branch name="o_pattern">
            <wire x2="2320" y1="2304" y2="2304" x1="2208" />
            <wire x2="2320" y1="2304" y2="2384" x1="2320" />
            <wire x2="2208" y1="2304" y2="2400" x1="2208" />
            <wire x2="2208" y1="2400" y2="2496" x1="2208" />
            <wire x2="2208" y1="2496" y2="2704" x1="2208" />
            <wire x2="2400" y1="2704" y2="2704" x1="2208" />
            <wire x2="2400" y1="2464" y2="2704" x1="2400" />
        </branch>
        <instance x="1792" y="2640" name="XLXI_10" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT_00" x="0" y="32" type="instance" />
        </instance>
        <branch name="XLXN_44">
            <wire x2="1792" y1="2608" y2="2608" x1="1760" />
        </branch>
        <instance x="1632" y="2544" name="XLXI_11" orien="R90" />
        <bustap x2="1712" y1="2064" y2="1968" x1="1712" />
        <branch name="ADDR(13:2)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1712" y="1952" type="branch" />
            <wire x2="1712" y1="1936" y2="1936" x1="1440" />
            <wire x2="1712" y1="1936" y2="1952" x1="1712" />
            <wire x2="1712" y1="1952" y2="1968" x1="1712" />
        </branch>
        <bustap x2="1760" y1="2064" y2="1968" x1="1760" />
        <branch name="ADDR(1:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1952" type="branch" />
            <wire x2="1760" y1="1936" y2="1952" x1="1760" />
            <wire x2="1760" y1="1952" y2="1968" x1="1760" />
        </branch>
        <instance x="1824" y="1808" name="XLXI_12(1:0)" orien="R180" />
        <branch name="i_pixel(11:0)">
            <wire x2="1216" y1="1936" y2="1936" x1="1136" />
        </branch>
        <iomarker fontsize="28" x="1136" y="1936" name="i_pixel(11:0)" orien="R180" />
        <instance x="1216" y="1968" name="XLXI_13(11:0)" orien="R0" />
    </sheet>
</drawing>