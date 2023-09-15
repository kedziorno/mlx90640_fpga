<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_6(1:0)" />
        <signal name="XLXN_9" />
        <signal name="XLXN_11" />
        <signal name="i2c_mem_ena" />
        <signal name="XLXN_3(1:0)" />
        <signal name="XLXN_15(31:0)" />
        <signal name="XLXN_16(31:0)" />
        <signal name="XLXN_17(7:0)" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="CONST0(7:0)" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23(11:0)" />
        <signal name="XLXN_24(11:0)" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="o_rdy" />
        <signal name="fixed2floatsclr" />
        <signal name="mulfpond" />
        <signal name="mulfpce" />
        <signal name="mulfpsclr" />
        <signal name="addfpond" />
        <signal name="addfpce" />
        <signal name="addfpsclr" />
        <signal name="subfpond" />
        <signal name="subfpce" />
        <signal name="subfpsclr" />
        <signal name="divfpsclr" />
        <signal name="divfpce" />
        <signal name="divfpond" />
        <signal name="fixed2floatce" />
        <signal name="XLXN_27" />
        <signal name="fixed2floatond" />
        <signal name="o_Vdd(31:0)" />
        <signal name="fixed2floata(63:0)" />
        <signal name="divfpa(31:0)" />
        <signal name="divfpb(31:0)" />
        <signal name="mulfpa(31:0)" />
        <signal name="mulfpb(31:0)" />
        <signal name="addfpa(31:0)" />
        <signal name="addfpb(31:0)" />
        <signal name="subfpa(31:0)" />
        <signal name="subfpb(31:0)" />
        <signal name="ExtractVDDParameters_kvdd(31:0)" />
        <signal name="ExtractVDDParameters_vdd25(31:0)" />
        <signal name="i_run" />
        <signal name="fixed2floatrdy" />
        <signal name="divfprdy" />
        <signal name="mulfprdy" />
        <signal name="addfprdy" />
        <signal name="subfprdy" />
        <signal name="divfpr(31:0)" />
        <signal name="mulfpr(31:0)" />
        <signal name="addfpr(31:0)" />
        <signal name="subfpr(31:0)" />
        <signal name="i_reset" />
        <signal name="ExractVDDParameters_rdy" />
        <signal name="i_clock" />
        <signal name="fixed2floatr(31:0)" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Output" name="fixed2floatsclr" />
        <port polarity="Output" name="mulfpond" />
        <port polarity="Output" name="mulfpce" />
        <port polarity="Output" name="mulfpsclr" />
        <port polarity="Output" name="addfpond" />
        <port polarity="Output" name="addfpce" />
        <port polarity="Output" name="addfpsclr" />
        <port polarity="Output" name="subfpond" />
        <port polarity="Output" name="subfpce" />
        <port polarity="Output" name="subfpsclr" />
        <port polarity="Output" name="divfpsclr" />
        <port polarity="Output" name="divfpce" />
        <port polarity="Output" name="divfpond" />
        <port polarity="Output" name="fixed2floatce" />
        <port polarity="Output" name="fixed2floatond" />
        <port polarity="Output" name="o_Vdd(31:0)" />
        <port polarity="Output" name="fixed2floata(63:0)" />
        <port polarity="Output" name="divfpa(31:0)" />
        <port polarity="Output" name="divfpb(31:0)" />
        <port polarity="Output" name="mulfpa(31:0)" />
        <port polarity="Output" name="mulfpb(31:0)" />
        <port polarity="Output" name="addfpa(31:0)" />
        <port polarity="Output" name="addfpb(31:0)" />
        <port polarity="Output" name="subfpa(31:0)" />
        <port polarity="Output" name="subfpb(31:0)" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="fixed2floatrdy" />
        <port polarity="Input" name="divfprdy" />
        <port polarity="Input" name="mulfprdy" />
        <port polarity="Input" name="addfprdy" />
        <port polarity="Input" name="subfprdy" />
        <port polarity="Input" name="divfpr(31:0)" />
        <port polarity="Input" name="mulfpr(31:0)" />
        <port polarity="Input" name="addfpr(31:0)" />
        <port polarity="Input" name="subfpr(31:0)" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="fixed2floatr(31:0)" />
        <blockdef name="CalculateVDD_process_p0">
            <timestamp>2023-6-9T11:0:35</timestamp>
            <rect width="656" x="64" y="-2048" height="2048" />
            <line x2="0" y1="-2016" y2="-2016" x1="64" />
            <line x2="0" y1="-1920" y2="-1920" x1="64" />
            <line x2="0" y1="-1824" y2="-1824" x1="64" />
            <line x2="0" y1="-1728" y2="-1728" x1="64" />
            <line x2="0" y1="-1632" y2="-1632" x1="64" />
            <line x2="0" y1="-1536" y2="-1536" x1="64" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <line x2="0" y1="-1344" y2="-1344" x1="64" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <rect width="64" x="0" y="-1164" height="24" />
            <line x2="0" y1="-1152" y2="-1152" x1="64" />
            <rect width="64" x="0" y="-1068" height="24" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <rect width="64" x="0" y="-972" height="24" />
            <line x2="0" y1="-960" y2="-960" x1="64" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="0" y="-780" height="24" />
            <line x2="0" y1="-768" y2="-768" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-588" height="24" />
            <line x2="0" y1="-576" y2="-576" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-396" height="24" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="784" y1="-2016" y2="-2016" x1="720" />
            <line x2="784" y1="-1952" y2="-1952" x1="720" />
            <line x2="784" y1="-1888" y2="-1888" x1="720" />
            <line x2="784" y1="-1824" y2="-1824" x1="720" />
            <line x2="784" y1="-1760" y2="-1760" x1="720" />
            <line x2="784" y1="-1696" y2="-1696" x1="720" />
            <line x2="784" y1="-1632" y2="-1632" x1="720" />
            <line x2="784" y1="-1568" y2="-1568" x1="720" />
            <line x2="784" y1="-1504" y2="-1504" x1="720" />
            <line x2="784" y1="-1440" y2="-1440" x1="720" />
            <line x2="784" y1="-1376" y2="-1376" x1="720" />
            <line x2="784" y1="-1312" y2="-1312" x1="720" />
            <line x2="784" y1="-1248" y2="-1248" x1="720" />
            <line x2="784" y1="-1184" y2="-1184" x1="720" />
            <line x2="784" y1="-1120" y2="-1120" x1="720" />
            <line x2="784" y1="-1056" y2="-1056" x1="720" />
            <line x2="784" y1="-992" y2="-992" x1="720" />
            <line x2="784" y1="-928" y2="-928" x1="720" />
            <line x2="784" y1="-864" y2="-864" x1="720" />
            <rect width="64" x="720" y="-812" height="24" />
            <line x2="784" y1="-800" y2="-800" x1="720" />
            <rect width="64" x="720" y="-748" height="24" />
            <line x2="784" y1="-736" y2="-736" x1="720" />
            <rect width="64" x="720" y="-684" height="24" />
            <line x2="784" y1="-672" y2="-672" x1="720" />
            <rect width="64" x="720" y="-620" height="24" />
            <line x2="784" y1="-608" y2="-608" x1="720" />
            <rect width="64" x="720" y="-556" height="24" />
            <line x2="784" y1="-544" y2="-544" x1="720" />
            <rect width="64" x="720" y="-492" height="24" />
            <line x2="784" y1="-480" y2="-480" x1="720" />
            <rect width="64" x="720" y="-428" height="24" />
            <line x2="784" y1="-416" y2="-416" x1="720" />
            <rect width="64" x="720" y="-364" height="24" />
            <line x2="784" y1="-352" y2="-352" x1="720" />
            <rect width="64" x="720" y="-300" height="24" />
            <line x2="784" y1="-288" y2="-288" x1="720" />
            <rect width="64" x="720" y="-236" height="24" />
            <line x2="784" y1="-224" y2="-224" x1="720" />
            <rect width="64" x="720" y="-172" height="24" />
            <line x2="784" y1="-160" y2="-160" x1="720" />
            <rect width="64" x="720" y="-108" height="24" />
            <line x2="784" y1="-96" y2="-96" x1="720" />
            <rect width="64" x="720" y="-44" height="24" />
            <line x2="784" y1="-32" y2="-32" x1="720" />
        </blockdef>
        <blockdef name="CalculateVDD_pow2_2bit">
            <timestamp>2023-6-9T12:47:14</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="ExtractVDDParameters">
            <timestamp>2023-6-6T20:25:37</timestamp>
            <rect width="448" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="576" y1="-288" y2="-288" x1="512" />
            <line x2="576" y1="-224" y2="-224" x1="512" />
            <rect width="64" x="512" y="-172" height="24" />
            <line x2="576" y1="-160" y2="-160" x1="512" />
            <rect width="64" x="512" y="-108" height="24" />
            <line x2="576" y1="-96" y2="-96" x1="512" />
            <rect width="64" x="512" y="-44" height="24" />
            <line x2="576" y1="-32" y2="-32" x1="512" />
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
        <block symbolname="CalculateVDD_process_p0" name="CalculateVDD_process_p0_inst">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="ExractVDDParameters_rdy" name="ExtractVDDParameters_rdy" />
            <blockpin signalname="fixed2floatrdy" name="fixed2floatrdy" />
            <blockpin signalname="divfprdy" name="divfprdy" />
            <blockpin signalname="mulfprdy" name="mulfprdy" />
            <blockpin signalname="addfprdy" name="addfprdy" />
            <blockpin signalname="subfprdy" name="subfprdy" />
            <blockpin signalname="ExtractVDDParameters_kvdd(31:0)" name="ExtractVDDParameters_kvdd(31:0)" />
            <blockpin signalname="ExtractVDDParameters_vdd25(31:0)" name="ExtractVDDParameters_vdd25(31:0)" />
            <blockpin signalname="XLXN_15(31:0)" name="in_resolutionee(31:0)" />
            <blockpin signalname="XLXN_16(31:0)" name="in_resolutionreg(31:0)" />
            <blockpin signalname="XLXN_17(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="fixed2floatr(31:0)" name="fixed2floatr(31:0)" />
            <blockpin signalname="divfpr(31:0)" name="divfpr(31:0)" />
            <blockpin signalname="mulfpr(31:0)" name="mulfpr(31:0)" />
            <blockpin signalname="addfpr(31:0)" name="addfpr(31:0)" />
            <blockpin signalname="subfpr(31:0)" name="subfpr(31:0)" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="XLXN_27" name="ExtractVDDParameters_run" />
            <blockpin signalname="XLXN_9" name="ExtractVDDParameters_mux" />
            <blockpin signalname="XLXN_22" name="i2c_mem_ena" />
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
            <blockpin signalname="o_Vdd(31:0)" name="o_Vdd(31:0)" />
            <blockpin signalname="XLXN_3(1:0)" name="out_resolutionee(1:0)" />
            <blockpin signalname="XLXN_6(1:0)" name="out_resolutionreg(1:0)" />
            <blockpin signalname="XLXN_23(11:0)" name="i2c_mem_addra(11:0)" />
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
        <block symbolname="ExtractVDDParameters" name="CalculateVDD_extractvddparameters">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_27" name="i_run" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_11" name="i2c_mem_ena" />
            <blockpin signalname="ExractVDDParameters_rdy" name="o_rdy" />
            <blockpin signalname="XLXN_24(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="ExtractVDDParameters_kvdd(31:0)" name="o_kvdd(31:0)" />
            <blockpin signalname="ExtractVDDParameters_vdd25(31:0)" name="o_vdd25(31:0)" />
        </block>
        <block symbolname="CalculateVDD_pow2_2bit" name="CalculateVDD_pow2_2bit_resreg">
            <blockpin signalname="XLXN_3(1:0)" name="x(1:0)" />
            <blockpin signalname="XLXN_16(31:0)" name="pow2x(31:0)" />
        </block>
        <block symbolname="CalculateVDD_pow2_2bit" name="CalculateVDD_pow2_2bit_resee">
            <blockpin signalname="XLXN_6(1:0)" name="x(1:0)" />
            <blockpin signalname="XLXN_15(31:0)" name="pow2x(31:0)" />
        </block>
        <block symbolname="m2_1" name="CalculateVDD_MUX_i2c_mem_douta(7:0)">
            <blockpin signalname="i2c_mem_douta(7:0)" name="D0" />
            <blockpin signalname="CONST0(7:0)" name="D1" />
            <blockpin signalname="XLXN_9" name="S0" />
            <blockpin signalname="XLXN_17(7:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="CalculateVDD_MUX_i2c_mem_addra(11:0)">
            <blockpin signalname="XLXN_23(11:0)" name="D0" />
            <blockpin signalname="XLXN_24(11:0)" name="D1" />
            <blockpin signalname="XLXN_9" name="S0" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="CalculateVDD_MUX_i2c_ena">
            <blockpin signalname="XLXN_22" name="D0" />
            <blockpin signalname="XLXN_11" name="D1" />
            <blockpin signalname="XLXN_9" name="S0" />
            <blockpin signalname="i2c_mem_ena" name="O" />
        </block>
        <block symbolname="constant" name="CONST0">
            <attr value="00" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="CONST0(7:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="1280" y="2224" name="CalculateVDD_process_p0_inst" orien="R0">
        </instance>
        <branch name="XLXN_6(1:0)">
            <wire x2="848" y1="1264" y2="2288" x1="848" />
            <wire x2="2128" y1="2288" y2="2288" x1="848" />
            <wire x2="880" y1="1264" y2="1264" x1="848" />
            <wire x2="2080" y1="1552" y2="1552" x1="2064" />
            <wire x2="2128" y1="1552" y2="1552" x1="2080" />
            <wire x2="2128" y1="1552" y2="2288" x1="2128" />
        </branch>
        <instance x="1408" y="2704" name="CalculateVDD_extractvddparameters" orien="R0">
        </instance>
        <branch name="XLXN_9">
            <wire x2="480" y1="96" y2="1552" x1="480" />
            <wire x2="512" y1="1552" y2="1552" x1="480" />
            <wire x2="2080" y1="96" y2="96" x1="480" />
            <wire x2="2080" y1="96" y2="336" x1="2080" />
            <wire x2="2320" y1="336" y2="336" x1="2080" />
            <wire x2="2080" y1="336" y2="1472" x1="2080" />
            <wire x2="2336" y1="1472" y2="1472" x1="2080" />
            <wire x2="2336" y1="1472" y2="1552" x1="2336" />
            <wire x2="2080" y1="336" y2="336" x1="2064" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="2304" y1="2416" y2="2416" x1="1984" />
            <wire x2="2320" y1="400" y2="400" x1="2304" />
            <wire x2="2304" y1="400" y2="2416" x1="2304" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="2672" y1="432" y2="432" x1="2640" />
        </branch>
        <branch name="XLXN_3(1:0)">
            <wire x2="864" y1="1360" y2="2272" x1="864" />
            <wire x2="2112" y1="2272" y2="2272" x1="864" />
            <wire x2="880" y1="1360" y2="1360" x1="864" />
            <wire x2="2112" y1="1488" y2="1488" x1="2064" />
            <wire x2="2112" y1="1488" y2="2272" x1="2112" />
        </branch>
        <instance x="880" y="1392" name="CalculateVDD_pow2_2bit_resreg" orien="R0">
        </instance>
        <branch name="XLXN_15(31:0)">
            <wire x2="1280" y1="1264" y2="1264" x1="1264" />
        </branch>
        <branch name="XLXN_16(31:0)">
            <wire x2="1280" y1="1360" y2="1360" x1="1264" />
        </branch>
        <instance x="512" y="1584" name="CalculateVDD_MUX_i2c_mem_douta(7:0)" orien="R0" />
        <branch name="XLXN_17(7:0)">
            <wire x2="1280" y1="1456" y2="1456" x1="832" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="496" y1="1424" y2="1424" x1="368" />
            <wire x2="512" y1="1424" y2="1424" x1="496" />
            <wire x2="496" y1="1424" y2="2656" x1="496" />
            <wire x2="1408" y1="2656" y2="2656" x1="496" />
        </branch>
        <branch name="CONST0(7:0)">
            <wire x2="512" y1="1488" y2="1488" x1="368" />
        </branch>
        <instance x="2336" y="1520" name="CalculateVDD_MUX_i2c_mem_addra(11:0)" orien="M180" />
        <branch name="XLXN_22">
            <wire x2="2288" y1="400" y2="400" x1="2064" />
            <wire x2="2288" y1="400" y2="464" x1="2288" />
            <wire x2="2320" y1="464" y2="464" x1="2288" />
        </branch>
        <branch name="XLXN_23(11:0)">
            <wire x2="2288" y1="1616" y2="1616" x1="2064" />
            <wire x2="2288" y1="1616" y2="1680" x1="2288" />
            <wire x2="2336" y1="1680" y2="1680" x1="2288" />
        </branch>
        <branch name="XLXN_24(11:0)">
            <wire x2="2320" y1="2544" y2="2544" x1="1984" />
            <wire x2="2336" y1="1616" y2="1616" x1="2320" />
            <wire x2="2320" y1="1616" y2="2544" x1="2320" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="2672" y1="1648" y2="1648" x1="2656" />
        </branch>
        <branch name="o_rdy">
            <wire x2="2672" y1="208" y2="208" x1="2064" />
        </branch>
        <branch name="fixed2floatsclr">
            <wire x2="2064" y1="592" y2="624" x1="2064" />
            <wire x2="2672" y1="624" y2="624" x1="2064" />
        </branch>
        <branch name="mulfpond">
            <wire x2="2672" y1="848" y2="848" x1="2064" />
        </branch>
        <branch name="mulfpce">
            <wire x2="2672" y1="912" y2="912" x1="2064" />
        </branch>
        <branch name="mulfpsclr">
            <wire x2="2672" y1="976" y2="976" x1="2064" />
        </branch>
        <branch name="addfpond">
            <wire x2="2672" y1="1040" y2="1040" x1="2064" />
        </branch>
        <branch name="addfpce">
            <wire x2="2672" y1="1104" y2="1104" x1="2064" />
        </branch>
        <branch name="addfpsclr">
            <wire x2="2672" y1="1168" y2="1168" x1="2064" />
        </branch>
        <branch name="subfpond">
            <wire x2="2672" y1="1232" y2="1232" x1="2064" />
        </branch>
        <branch name="subfpce">
            <wire x2="2672" y1="1296" y2="1296" x1="2064" />
        </branch>
        <branch name="subfpsclr">
            <wire x2="2672" y1="1360" y2="1360" x1="2064" />
        </branch>
        <instance x="2320" y="304" name="CalculateVDD_MUX_i2c_ena" orien="M180" />
        <branch name="divfpsclr">
            <wire x2="2672" y1="784" y2="784" x1="2064" />
        </branch>
        <branch name="divfpce">
            <wire x2="2672" y1="720" y2="720" x1="2064" />
        </branch>
        <branch name="divfpond">
            <wire x2="2096" y1="656" y2="656" x1="2064" />
            <wire x2="2096" y1="656" y2="672" x1="2096" />
            <wire x2="2672" y1="672" y2="672" x1="2096" />
        </branch>
        <branch name="fixed2floatce">
            <wire x2="2240" y1="528" y2="528" x1="2064" />
            <wire x2="2240" y1="528" y2="576" x1="2240" />
            <wire x2="2672" y1="576" y2="576" x1="2240" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="1376" y1="2576" y2="2736" x1="1376" />
            <wire x2="2272" y1="2736" y2="2736" x1="1376" />
            <wire x2="1408" y1="2576" y2="2576" x1="1376" />
            <wire x2="2272" y1="272" y2="272" x1="2064" />
            <wire x2="2272" y1="272" y2="2736" x1="2272" />
        </branch>
        <branch name="fixed2floatond">
            <wire x2="2256" y1="464" y2="464" x1="2064" />
            <wire x2="2256" y1="464" y2="528" x1="2256" />
            <wire x2="2672" y1="528" y2="528" x1="2256" />
        </branch>
        <branch name="o_Vdd(31:0)">
            <wire x2="2672" y1="1424" y2="1424" x1="2064" />
        </branch>
        <branch name="fixed2floata(63:0)">
            <wire x2="2144" y1="1680" y2="1680" x1="2064" />
            <wire x2="2144" y1="1680" y2="1744" x1="2144" />
            <wire x2="2672" y1="1744" y2="1744" x1="2144" />
        </branch>
        <branch name="divfpa(31:0)">
            <wire x2="2096" y1="1744" y2="1744" x1="2064" />
            <wire x2="2096" y1="1744" y2="1776" x1="2096" />
            <wire x2="2672" y1="1776" y2="1776" x1="2096" />
        </branch>
        <branch name="divfpb(31:0)">
            <wire x2="2672" y1="1808" y2="1808" x1="2064" />
        </branch>
        <branch name="mulfpa(31:0)">
            <wire x2="2672" y1="1872" y2="1872" x1="2064" />
        </branch>
        <branch name="mulfpb(31:0)">
            <wire x2="2672" y1="1936" y2="1936" x1="2064" />
        </branch>
        <branch name="addfpa(31:0)">
            <wire x2="2672" y1="2000" y2="2000" x1="2064" />
        </branch>
        <branch name="addfpb(31:0)">
            <wire x2="2672" y1="2064" y2="2064" x1="2064" />
        </branch>
        <branch name="subfpa(31:0)">
            <wire x2="2672" y1="2128" y2="2128" x1="2064" />
        </branch>
        <branch name="subfpb(31:0)">
            <wire x2="2672" y1="2192" y2="2192" x1="2064" />
        </branch>
        <branch name="ExtractVDDParameters_kvdd(31:0)">
            <wire x2="1280" y1="1072" y2="1072" x1="448" />
            <wire x2="448" y1="1072" y2="2768" x1="448" />
            <wire x2="2080" y1="2768" y2="2768" x1="448" />
            <wire x2="2080" y1="2608" y2="2608" x1="1984" />
            <wire x2="2080" y1="2608" y2="2768" x1="2080" />
        </branch>
        <branch name="ExtractVDDParameters_vdd25(31:0)">
            <wire x2="1280" y1="1168" y2="1168" x1="432" />
            <wire x2="432" y1="1168" y2="2784" x1="432" />
            <wire x2="2096" y1="2784" y2="2784" x1="432" />
            <wire x2="2096" y1="2672" y2="2672" x1="1984" />
            <wire x2="2096" y1="2672" y2="2784" x1="2096" />
        </branch>
        <branch name="i_run">
            <wire x2="1280" y1="400" y2="400" x1="368" />
        </branch>
        <branch name="fixed2floatrdy">
            <wire x2="1280" y1="592" y2="592" x1="368" />
        </branch>
        <branch name="divfprdy">
            <wire x2="1280" y1="688" y2="688" x1="368" />
        </branch>
        <branch name="mulfprdy">
            <wire x2="1280" y1="784" y2="784" x1="368" />
        </branch>
        <branch name="addfprdy">
            <wire x2="1280" y1="880" y2="880" x1="368" />
        </branch>
        <branch name="subfprdy">
            <wire x2="1280" y1="976" y2="976" x1="368" />
        </branch>
        <branch name="divfpr(31:0)">
            <wire x2="1280" y1="1648" y2="1648" x1="368" />
        </branch>
        <branch name="mulfpr(31:0)">
            <wire x2="1280" y1="1744" y2="1744" x1="368" />
        </branch>
        <branch name="addfpr(31:0)">
            <wire x2="1280" y1="1840" y2="1840" x1="368" />
        </branch>
        <branch name="subfpr(31:0)">
            <wire x2="1280" y1="1936" y2="1936" x1="368" />
        </branch>
        <branch name="i_reset">
            <wire x2="384" y1="304" y2="304" x1="368" />
            <wire x2="384" y1="304" y2="2496" x1="384" />
            <wire x2="1408" y1="2496" y2="2496" x1="384" />
            <wire x2="1280" y1="304" y2="304" x1="384" />
        </branch>
        <branch name="ExractVDDParameters_rdy">
            <wire x2="1280" y1="496" y2="496" x1="464" />
            <wire x2="464" y1="496" y2="2720" x1="464" />
            <wire x2="2032" y1="2720" y2="2720" x1="464" />
            <wire x2="2032" y1="2480" y2="2480" x1="1984" />
            <wire x2="2032" y1="2480" y2="2720" x1="2032" />
        </branch>
        <branch name="i_clock">
            <wire x2="400" y1="208" y2="208" x1="368" />
            <wire x2="400" y1="208" y2="2416" x1="400" />
            <wire x2="1408" y1="2416" y2="2416" x1="400" />
            <wire x2="1280" y1="208" y2="208" x1="400" />
        </branch>
        <instance x="224" y="1456" name="CONST0" orien="R0">
        </instance>
        <branch name="fixed2floatr(31:0)">
            <wire x2="1264" y1="1568" y2="1568" x1="368" />
            <wire x2="1264" y1="1552" y2="1568" x1="1264" />
            <wire x2="1280" y1="1552" y2="1552" x1="1264" />
        </branch>
        <iomarker fontsize="28" x="2672" y="432" name="i2c_mem_ena" orien="R0" />
        <iomarker fontsize="28" x="2672" y="208" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="2672" y="528" name="fixed2floatond" orien="R0" />
        <iomarker fontsize="28" x="2672" y="576" name="fixed2floatce" orien="R0" />
        <iomarker fontsize="28" x="2672" y="624" name="fixed2floatsclr" orien="R0" />
        <iomarker fontsize="28" x="2672" y="672" name="divfpond" orien="R0" />
        <iomarker fontsize="28" x="2672" y="720" name="divfpce" orien="R0" />
        <iomarker fontsize="28" x="2672" y="784" name="divfpsclr" orien="R0" />
        <iomarker fontsize="28" x="2672" y="848" name="mulfpond" orien="R0" />
        <iomarker fontsize="28" x="2672" y="912" name="mulfpce" orien="R0" />
        <iomarker fontsize="28" x="2672" y="976" name="mulfpsclr" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1040" name="addfpond" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1104" name="addfpce" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1168" name="addfpsclr" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1232" name="subfpond" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1360" name="subfpsclr" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1296" name="subfpce" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1424" name="o_Vdd(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1648" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1744" name="fixed2floata(63:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1776" name="divfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1808" name="divfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1872" name="mulfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="1936" name="mulfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="2000" name="addfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="2064" name="addfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="2128" name="subfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="2192" name="subfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="368" y="1424" name="i2c_mem_douta(7:0)" orien="R180" />
        <iomarker fontsize="28" x="368" y="208" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="368" y="304" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="368" y="400" name="i_run" orien="R180" />
        <iomarker fontsize="28" x="368" y="592" name="fixed2floatrdy" orien="R180" />
        <iomarker fontsize="28" x="368" y="688" name="divfprdy" orien="R180" />
        <iomarker fontsize="28" x="368" y="784" name="mulfprdy" orien="R180" />
        <iomarker fontsize="28" x="368" y="880" name="addfprdy" orien="R180" />
        <iomarker fontsize="28" x="368" y="976" name="subfprdy" orien="R180" />
        <iomarker fontsize="28" x="368" y="1568" name="fixed2floatr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="368" y="1648" name="divfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="368" y="1744" name="mulfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="368" y="1840" name="addfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="368" y="1936" name="subfpr(31:0)" orien="R180" />
        <instance x="880" y="1296" name="CalculateVDD_pow2_2bit_resee" orien="R0">
        </instance>
    </sheet>
</drawing>