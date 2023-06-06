<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_4(31:0)" />
        <signal name="XLXN_5(31:0)" />
        <signal name="XLXN_6(31:0)" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="ee0x2432(15:0)" />
        <signal name="i_run" />
        <signal name="fixed2floatrdy" />
        <signal name="divfprdy" />
        <signal name="mulfprdy" />
        <signal name="addfprdy" />
        <signal name="subfprdy" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="i_Vdd(31:0)" />
        <signal name="fixed2floatr(31:0)" />
        <signal name="divfpr(31:0)" />
        <signal name="mulfpr(31:0)" />
        <signal name="addfpr(31:0)" />
        <signal name="subfpr(31:0)" />
        <signal name="i2c_mem_ena" />
        <signal name="o_rdy" />
        <signal name="fixed2floatond" />
        <signal name="fixed2floatce" />
        <signal name="fixed2floatsclr" />
        <signal name="divfpond" />
        <signal name="divfpce" />
        <signal name="divfpsclr" />
        <signal name="mulfpond" />
        <signal name="mulfpce" />
        <signal name="mulfpsclr" />
        <signal name="addfpond" />
        <signal name="addfpce" />
        <signal name="addfpsclr" />
        <signal name="subfpond" />
        <signal name="subfpce" />
        <signal name="subfpsclr" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="o_Ta(31:0)" />
        <signal name="fixed2floata(63:0)" />
        <signal name="divfpa(31:0)" />
        <signal name="divfpb(31:0)" />
        <signal name="mulfpa(31:0)" />
        <signal name="mulfpb(31:0)" />
        <signal name="addfpa(31:0)" />
        <signal name="addfpb(31:0)" />
        <signal name="subfpa(31:0)" />
        <signal name="subfpb(31:0)" />
        <signal name="ee0x2410(15:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="fixed2floatrdy" />
        <port polarity="Input" name="divfprdy" />
        <port polarity="Input" name="mulfprdy" />
        <port polarity="Input" name="addfprdy" />
        <port polarity="Input" name="subfprdy" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Input" name="i_Vdd(31:0)" />
        <port polarity="Input" name="fixed2floatr(31:0)" />
        <port polarity="Input" name="divfpr(31:0)" />
        <port polarity="Input" name="mulfpr(31:0)" />
        <port polarity="Input" name="addfpr(31:0)" />
        <port polarity="Input" name="subfpr(31:0)" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Output" name="fixed2floatond" />
        <port polarity="Output" name="fixed2floatce" />
        <port polarity="Output" name="fixed2floatsclr" />
        <port polarity="Output" name="divfpond" />
        <port polarity="Output" name="divfpce" />
        <port polarity="Output" name="divfpsclr" />
        <port polarity="Output" name="mulfpond" />
        <port polarity="Output" name="mulfpce" />
        <port polarity="Output" name="mulfpsclr" />
        <port polarity="Output" name="addfpond" />
        <port polarity="Output" name="addfpce" />
        <port polarity="Output" name="addfpsclr" />
        <port polarity="Output" name="subfpond" />
        <port polarity="Output" name="subfpce" />
        <port polarity="Output" name="subfpsclr" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="o_Ta(31:0)" />
        <port polarity="Output" name="fixed2floata(63:0)" />
        <port polarity="Output" name="divfpa(31:0)" />
        <port polarity="Output" name="divfpb(31:0)" />
        <port polarity="Output" name="mulfpa(31:0)" />
        <port polarity="Output" name="mulfpb(31:0)" />
        <port polarity="Output" name="addfpa(31:0)" />
        <port polarity="Output" name="addfpb(31:0)" />
        <port polarity="Output" name="subfpa(31:0)" />
        <port polarity="Output" name="subfpb(31:0)" />
        <blockdef name="calculateTa_process_p0">
            <timestamp>2023-6-10T20:32:26</timestamp>
            <rect width="64" x="736" y="20" height="24" />
            <line x2="800" y1="32" y2="32" x1="736" />
            <rect width="64" x="736" y="84" height="24" />
            <line x2="800" y1="96" y2="96" x1="736" />
            <line x2="0" y1="-1760" y2="-1760" x1="64" />
            <line x2="0" y1="-1664" y2="-1664" x1="64" />
            <line x2="0" y1="-1568" y2="-1568" x1="64" />
            <line x2="0" y1="-1472" y2="-1472" x1="64" />
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <line x2="0" y1="-1280" y2="-1280" x1="64" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <line x2="0" y1="-1088" y2="-1088" x1="64" />
            <rect width="64" x="0" y="-1004" height="24" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="0" y="-908" height="24" />
            <line x2="0" y1="-896" y2="-896" x1="64" />
            <rect width="64" x="0" y="-812" height="24" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <rect width="64" x="0" y="-716" height="24" />
            <line x2="0" y1="-704" y2="-704" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-524" height="24" />
            <line x2="0" y1="-512" y2="-512" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="800" y1="-1760" y2="-1760" x1="736" />
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
            <line x2="800" y1="-736" y2="-736" x1="736" />
            <rect width="64" x="736" y="-684" height="24" />
            <line x2="800" y1="-672" y2="-672" x1="736" />
            <rect width="64" x="736" y="-620" height="24" />
            <line x2="800" y1="-608" y2="-608" x1="736" />
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
            <rect width="672" x="64" y="-1792" height="1920" />
        </blockdef>
        <blockdef name="ExtractAlphaPTATParameter">
            <timestamp>2023-6-10T20:32:11</timestamp>
            <rect width="384" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="448" y="-172" height="24" />
            <line x2="512" y1="-160" y2="-160" x1="448" />
        </blockdef>
        <blockdef name="ExtractKtPTATParameter">
            <timestamp>2023-6-10T20:32:1</timestamp>
            <rect width="352" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="416" y="-172" height="24" />
            <line x2="480" y1="-160" y2="-160" x1="416" />
        </blockdef>
        <blockdef name="ExtractKvPTATParameter">
            <timestamp>2023-6-10T20:31:52</timestamp>
            <rect width="352" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="416" y="-172" height="24" />
            <line x2="480" y1="-160" y2="-160" x1="416" />
        </blockdef>
        <block symbolname="calculateTa_process_p0" name="XLXI_1">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="fixed2floatrdy" name="fixed2floatrdy" />
            <blockpin signalname="divfprdy" name="divfprdy" />
            <blockpin signalname="mulfprdy" name="mulfprdy" />
            <blockpin signalname="addfprdy" name="addfprdy" />
            <blockpin signalname="subfprdy" name="subfprdy" />
            <blockpin signalname="XLXN_6(31:0)" name="ExtractAlphaPTATParameter_alphaptat(31:0)" />
            <blockpin signalname="XLXN_5(31:0)" name="ExtractKvPTATParameter_kvptat(31:0)" />
            <blockpin signalname="XLXN_4(31:0)" name="ExtractKtPTATParameter_ktptat(31:0)" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="i_Vdd(31:0)" name="i_Vdd(31:0)" />
            <blockpin signalname="fixed2floatr(31:0)" name="fixed2floatr(31:0)" />
            <blockpin signalname="divfpr(31:0)" name="divfpr(31:0)" />
            <blockpin signalname="mulfpr(31:0)" name="mulfpr(31:0)" />
            <blockpin signalname="addfpr(31:0)" name="addfpr(31:0)" />
            <blockpin signalname="subfpr(31:0)" name="subfpr(31:0)" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="fixed2floatond" name="fixed2floatond" />
            <blockpin signalname="fixed2floatce" name="fixed2floatce" />
            <blockpin signalname="fixed2floatsclr" name="fixed2floatsclr" />
            <blockpin signalname="divfpond" name="divfpond" />
            <blockpin signalname="divfpce" name="divfpce" />
            <blockpin signalname="divfpsclr" name="divfpsclr" />
            <blockpin signalname="mulfpond" name="mulfpond" />
            <blockpin signalname="mulfpce" name="mulfpce" />
            <blockpin signalname="mulfpsclr" name="mulfpsclr" />
            <blockpin signalname="addfpond" name="addfpond" />
            <blockpin signalname="addfpce" name="addfpce" />
            <blockpin signalname="addfpsclr" name="addfpsclr" />
            <blockpin signalname="subfpond" name="subfpond" />
            <blockpin signalname="subfpce" name="subfpce" />
            <blockpin signalname="subfpsclr" name="subfpsclr" />
            <blockpin signalname="ee0x2410(15:0)" name="o_ee2410(15:0)" />
            <blockpin signalname="ee0x2432(15:0)" name="o_ee2432(15:0)" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="o_Ta(31:0)" name="o_Ta(31:0)" />
            <blockpin signalname="fixed2floata(63:0)" name="fixed2floata(63:0)" />
            <blockpin signalname="divfpa(31:0)" name="divfpa(31:0)" />
            <blockpin signalname="divfpb(31:0)" name="divfpb(31:0)" />
            <blockpin signalname="mulfpa(31:0)" name="mulfpa(31:0)" />
            <blockpin signalname="mulfpb(31:0)" name="mulfpb(31:0)" />
            <blockpin signalname="addfpa(31:0)" name="addfpa(31:0)" />
            <blockpin signalname="addfpb(31:0)" name="addfpb(31:0)" />
            <blockpin signalname="subfpa(31:0)" name="subfpa(31:0)" />
            <blockpin signalname="subfpb(31:0)" name="subfpb(31:0)" />
        </block>
        <block symbolname="ExtractKtPTATParameter" name="XLXI_3">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="ee0x2432(15:0)" name="i_ee0x2432(15:0)" />
            <blockpin signalname="XLXN_4(31:0)" name="o_ktptat(31:0)" />
        </block>
        <block symbolname="ExtractKvPTATParameter" name="XLXI_4">
            <blockpin signalname="ee0x2432(15:0)" name="i_ee0x2432(15:0)" />
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_5(31:0)" name="o_kvptat(31:0)" />
        </block>
        <block symbolname="ExtractAlphaPTATParameter" name="XLXI_2">
            <blockpin signalname="ee0x2410(15:0)" name="i_ee0x2410(15:0)" />
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_6(31:0)" name="o_alphaptat(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="2288" y="1904" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_4(31:0)">
            <wire x2="1904" y1="1104" y2="2208" x1="1904" />
            <wire x2="2448" y1="2208" y2="2208" x1="1904" />
            <wire x2="2288" y1="1104" y2="1104" x1="1904" />
        </branch>
        <branch name="XLXN_5(31:0)">
            <wire x2="1888" y1="1008" y2="2480" x1="1888" />
            <wire x2="2448" y1="2480" y2="2480" x1="1888" />
            <wire x2="2288" y1="1008" y2="1008" x1="1888" />
        </branch>
        <branch name="XLXN_6(31:0)">
            <wire x2="1872" y1="912" y2="2752" x1="1872" />
            <wire x2="2416" y1="2752" y2="2752" x1="1872" />
            <wire x2="2288" y1="912" y2="912" x1="1872" />
        </branch>
        <branch name="i_clock">
            <wire x2="2256" y1="144" y2="144" x1="2224" />
            <wire x2="2288" y1="144" y2="144" x1="2256" />
            <wire x2="3456" y1="16" y2="16" x1="2256" />
            <wire x2="3456" y1="16" y2="2096" x1="3456" />
            <wire x2="2256" y1="16" y2="144" x1="2256" />
            <wire x2="3136" y1="2208" y2="2208" x1="2928" />
            <wire x2="3136" y1="2208" y2="2416" x1="3136" />
            <wire x2="3136" y1="2416" y2="2688" x1="3136" />
            <wire x2="3136" y1="2416" y2="2416" x1="2928" />
            <wire x2="3136" y1="2688" y2="2688" x1="2928" />
            <wire x2="3456" y1="2096" y2="2096" x1="3136" />
            <wire x2="3136" y1="2096" y2="2208" x1="3136" />
        </branch>
        <branch name="i_reset">
            <wire x2="2272" y1="240" y2="240" x1="2224" />
            <wire x2="2288" y1="240" y2="240" x1="2272" />
            <wire x2="3440" y1="32" y2="32" x1="2272" />
            <wire x2="3440" y1="32" y2="2032" x1="3440" />
            <wire x2="2272" y1="32" y2="240" x1="2272" />
            <wire x2="3152" y1="2144" y2="2144" x1="2928" />
            <wire x2="3152" y1="2144" y2="2352" x1="3152" />
            <wire x2="3152" y1="2352" y2="2624" x1="3152" />
            <wire x2="3152" y1="2352" y2="2352" x1="2928" />
            <wire x2="3152" y1="2624" y2="2624" x1="2928" />
            <wire x2="3440" y1="2032" y2="2032" x1="3152" />
            <wire x2="3152" y1="2032" y2="2144" x1="3152" />
        </branch>
        <branch name="i_run">
            <wire x2="2288" y1="336" y2="336" x1="2224" />
        </branch>
        <branch name="fixed2floatrdy">
            <wire x2="2288" y1="432" y2="432" x1="2224" />
        </branch>
        <branch name="divfprdy">
            <wire x2="2288" y1="528" y2="528" x1="2224" />
        </branch>
        <branch name="mulfprdy">
            <wire x2="2288" y1="624" y2="624" x1="2224" />
        </branch>
        <branch name="addfprdy">
            <wire x2="2288" y1="720" y2="720" x1="2224" />
        </branch>
        <branch name="subfprdy">
            <wire x2="2288" y1="816" y2="816" x1="2224" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="2288" y1="1200" y2="1200" x1="2224" />
        </branch>
        <branch name="i_Vdd(31:0)">
            <wire x2="2288" y1="1296" y2="1296" x1="2224" />
        </branch>
        <branch name="fixed2floatr(31:0)">
            <wire x2="2288" y1="1392" y2="1392" x1="2224" />
        </branch>
        <branch name="divfpr(31:0)">
            <wire x2="2288" y1="1488" y2="1488" x1="2224" />
        </branch>
        <branch name="mulfpr(31:0)">
            <wire x2="2288" y1="1584" y2="1584" x1="2224" />
        </branch>
        <branch name="addfpr(31:0)">
            <wire x2="2288" y1="1680" y2="1680" x1="2224" />
        </branch>
        <branch name="subfpr(31:0)">
            <wire x2="2288" y1="1776" y2="1776" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="2224" y="1200" name="i2c_mem_douta(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2224" y="1296" name="i_Vdd(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2224" y="1392" name="fixed2floatr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2224" y="1488" name="divfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2224" y="1584" name="mulfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2224" y="1680" name="addfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2224" y="1776" name="subfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2224" y="816" name="subfprdy" orien="R180" />
        <iomarker fontsize="28" x="2224" y="720" name="addfprdy" orien="R180" />
        <iomarker fontsize="28" x="2224" y="624" name="mulfprdy" orien="R180" />
        <iomarker fontsize="28" x="2224" y="528" name="divfprdy" orien="R180" />
        <iomarker fontsize="28" x="2224" y="432" name="fixed2floatrdy" orien="R180" />
        <iomarker fontsize="28" x="2224" y="336" name="i_run" orien="R180" />
        <branch name="i2c_mem_ena">
            <wire x2="3120" y1="144" y2="144" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="144" name="i2c_mem_ena" orien="R0" />
        <branch name="o_rdy">
            <wire x2="3120" y1="208" y2="208" x1="3088" />
        </branch>
        <branch name="fixed2floatond">
            <wire x2="3120" y1="272" y2="272" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="272" name="fixed2floatond" orien="R0" />
        <branch name="fixed2floatce">
            <wire x2="3120" y1="336" y2="336" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="336" name="fixed2floatce" orien="R0" />
        <branch name="fixed2floatsclr">
            <wire x2="3120" y1="400" y2="400" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="400" name="fixed2floatsclr" orien="R0" />
        <branch name="divfpond">
            <wire x2="3120" y1="464" y2="464" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="464" name="divfpond" orien="R0" />
        <branch name="divfpce">
            <wire x2="3120" y1="528" y2="528" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="528" name="divfpce" orien="R0" />
        <branch name="divfpsclr">
            <wire x2="3120" y1="592" y2="592" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="592" name="divfpsclr" orien="R0" />
        <branch name="mulfpond">
            <wire x2="3120" y1="656" y2="656" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="656" name="mulfpond" orien="R0" />
        <branch name="mulfpce">
            <wire x2="3120" y1="720" y2="720" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="720" name="mulfpce" orien="R0" />
        <branch name="mulfpsclr">
            <wire x2="3120" y1="784" y2="784" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="784" name="mulfpsclr" orien="R0" />
        <branch name="addfpond">
            <wire x2="3120" y1="848" y2="848" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="848" name="addfpond" orien="R0" />
        <branch name="addfpce">
            <wire x2="3120" y1="912" y2="912" x1="3088" />
        </branch>
        <branch name="addfpsclr">
            <wire x2="3120" y1="976" y2="976" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="976" name="addfpsclr" orien="R0" />
        <branch name="subfpond">
            <wire x2="3120" y1="1040" y2="1040" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1040" name="subfpond" orien="R0" />
        <branch name="subfpce">
            <wire x2="3120" y1="1104" y2="1104" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1104" name="subfpce" orien="R0" />
        <branch name="subfpsclr">
            <wire x2="3120" y1="1168" y2="1168" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1168" name="subfpsclr" orien="R0" />
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="3120" y1="1232" y2="1232" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1232" name="i2c_mem_addra(11:0)" orien="R0" />
        <branch name="o_Ta(31:0)">
            <wire x2="3120" y1="1296" y2="1296" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1296" name="o_Ta(31:0)" orien="R0" />
        <branch name="fixed2floata(63:0)">
            <wire x2="3120" y1="1360" y2="1360" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1360" name="fixed2floata(63:0)" orien="R0" />
        <branch name="divfpa(31:0)">
            <wire x2="3120" y1="1424" y2="1424" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1424" name="divfpa(31:0)" orien="R0" />
        <branch name="divfpb(31:0)">
            <wire x2="3120" y1="1488" y2="1488" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1488" name="divfpb(31:0)" orien="R0" />
        <branch name="mulfpa(31:0)">
            <wire x2="3120" y1="1552" y2="1552" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1552" name="mulfpa(31:0)" orien="R0" />
        <branch name="mulfpb(31:0)">
            <wire x2="3120" y1="1616" y2="1616" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1616" name="mulfpb(31:0)" orien="R0" />
        <branch name="addfpa(31:0)">
            <wire x2="3120" y1="1680" y2="1680" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1680" name="addfpa(31:0)" orien="R0" />
        <branch name="addfpb(31:0)">
            <wire x2="3120" y1="1744" y2="1744" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1744" name="addfpb(31:0)" orien="R0" />
        <branch name="subfpa(31:0)">
            <wire x2="3120" y1="1808" y2="1808" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1808" name="subfpa(31:0)" orien="R0" />
        <branch name="subfpb(31:0)">
            <wire x2="3120" y1="1872" y2="1872" x1="3088" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1872" name="subfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2224" y="144" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="2224" y="240" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="3120" y="208" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="3120" y="912" name="addfpce" orien="R0" />
        <instance x="2928" y="2592" name="XLXI_2" orien="R180">
        </instance>
        <instance x="2928" y="2320" name="XLXI_4" orien="R180">
        </instance>
        <instance x="2928" y="2048" name="XLXI_3" orien="R180">
        </instance>
        <branch name="ee0x2432(15:0)">
            <wire x2="3056" y1="2080" y2="2080" x1="2928" />
            <wire x2="3056" y1="2080" y2="2480" x1="3056" />
            <wire x2="3168" y1="2480" y2="2480" x1="3056" />
            <wire x2="3056" y1="2480" y2="2480" x1="2928" />
            <wire x2="3168" y1="2000" y2="2000" x1="3088" />
            <wire x2="3168" y1="2000" y2="2480" x1="3168" />
        </branch>
        <branch name="ee0x2410(15:0)">
            <wire x2="3184" y1="2752" y2="2752" x1="2928" />
            <wire x2="3184" y1="1936" y2="1936" x1="3088" />
            <wire x2="3184" y1="1936" y2="2752" x1="3184" />
        </branch>
    </sheet>
</drawing>