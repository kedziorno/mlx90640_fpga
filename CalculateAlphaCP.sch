<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(31:0)" />
        <signal name="XLXN_2(31:0)" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="i_run" />
        <signal name="divfprdy" />
        <signal name="mulfprdy" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="XLXN_6(31:0)" />
        <signal name="XLXN_7(9:0)" />
        <signal name="XLXN_4(5:0)" />
        <signal name="XLXN_3(3:0)" />
        <signal name="divfpr(31:0)" />
        <signal name="mulfpr(31:0)" />
        <signal name="i2c_mem_ena" />
        <signal name="o_rdy" />
        <signal name="divfpond" />
        <signal name="divfpsclr" />
        <signal name="divfpce" />
        <signal name="mulfpond" />
        <signal name="mulfpsclr" />
        <signal name="mulfpce" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="o_acpsubpage0(31:0)" />
        <signal name="o_acpsubpage1(31:0)" />
        <signal name="divfpa(31:0)" />
        <signal name="divfpb(31:0)" />
        <signal name="mulfpa(31:0)" />
        <signal name="mulfpb(31:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="divfprdy" />
        <port polarity="Input" name="mulfprdy" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Input" name="divfpr(31:0)" />
        <port polarity="Input" name="mulfpr(31:0)" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Output" name="divfpond" />
        <port polarity="Output" name="divfpsclr" />
        <port polarity="Output" name="divfpce" />
        <port polarity="Output" name="mulfpond" />
        <port polarity="Output" name="mulfpsclr" />
        <port polarity="Output" name="mulfpce" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="o_acpsubpage0(31:0)" />
        <port polarity="Output" name="o_acpsubpage1(31:0)" />
        <port polarity="Output" name="divfpa(31:0)" />
        <port polarity="Output" name="divfpb(31:0)" />
        <port polarity="Output" name="mulfpa(31:0)" />
        <port polarity="Output" name="mulfpb(31:0)" />
        <blockdef name="CalculateAlphaCP_process_p0">
            <timestamp>2023-6-12T18:17:57</timestamp>
            <rect width="448" x="64" y="-1152" height="1152" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-1024" y2="-1024" x1="64" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="0" y1="-832" y2="-832" x1="64" />
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
            <line x2="576" y1="-1120" y2="-1120" x1="512" />
            <line x2="576" y1="-1056" y2="-1056" x1="512" />
            <line x2="576" y1="-992" y2="-992" x1="512" />
            <line x2="576" y1="-928" y2="-928" x1="512" />
            <line x2="576" y1="-864" y2="-864" x1="512" />
            <line x2="576" y1="-800" y2="-800" x1="512" />
            <line x2="576" y1="-736" y2="-736" x1="512" />
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
        <blockdef name="rom_alphascalepow27">
            <timestamp>2023-6-12T18:24:31</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="rom_cpp12p0_ratio">
            <timestamp>2023-6-12T18:21:46</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="rom_signed10bit">
            <timestamp>2023-6-12T19:30:33</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="CalculateAlphaCP_process_p0" name="CalculateAlphaCP_process_p0_inst">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="divfprdy" name="divfprdy" />
            <blockpin signalname="mulfprdy" name="mulfprdy" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_6(31:0)" name="i_mem_data(31:0)" />
            <blockpin signalname="XLXN_2(31:0)" name="nibble_in1(31:0)" />
            <blockpin signalname="XLXN_1(31:0)" name="nibble_in2(31:0)" />
            <blockpin signalname="divfpr(31:0)" name="divfpr(31:0)" />
            <blockpin signalname="mulfpr(31:0)" name="mulfpr(31:0)" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="divfpond" name="divfpond" />
            <blockpin signalname="divfpsclr" name="divfpsclr" />
            <blockpin signalname="divfpce" name="divfpce" />
            <blockpin signalname="mulfpond" name="mulfpond" />
            <blockpin signalname="mulfpsclr" name="mulfpsclr" />
            <blockpin signalname="mulfpce" name="mulfpce" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="XLXN_7(9:0)" name="o_mem_address(9:0)" />
            <blockpin signalname="XLXN_4(5:0)" name="nibble_out1(5:0)" />
            <blockpin signalname="XLXN_3(3:0)" name="nibble_out2(3:0)" />
            <blockpin signalname="o_acpsubpage0(31:0)" name="o_acpsubpage0(31:0)" />
            <blockpin signalname="o_acpsubpage1(31:0)" name="o_acpsubpage1(31:0)" />
            <blockpin signalname="divfpa(31:0)" name="divfpa(31:0)" />
            <blockpin signalname="divfpb(31:0)" name="divfpb(31:0)" />
            <blockpin signalname="mulfpa(31:0)" name="mulfpa(31:0)" />
            <blockpin signalname="mulfpb(31:0)" name="mulfpb(31:0)" />
        </block>
        <block symbolname="rom_alphascalepow27" name="CalculateAlphaCP_rom_alphascalepow27">
            <blockpin signalname="XLXN_3(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="XLXN_1(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_cpp12p0_ratio" name="CalculateAlphaCP_rom_cpp12p0_ratio">
            <blockpin signalname="XLXN_4(5:0)" name="nibble_in(5:0)" />
            <blockpin signalname="XLXN_2(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_signed10bit" name="CalculateAlphaCP_rom_signed10bit">
            <blockpin signalname="XLXN_7(9:0)" name="address(9:0)" />
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_6(31:0)" name="o_data(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1232" y="1456" name="CalculateAlphaCP_process_p0_inst" orien="R0">
        </instance>
        <instance x="1744" y="1744" name="CalculateAlphaCP_rom_alphascalepow27" orien="R180">
        </instance>
        <instance x="1744" y="1904" name="CalculateAlphaCP_rom_cpp12p0_ratio" orien="R180">
        </instance>
        <branch name="XLXN_1(31:0)">
            <wire x2="1184" y1="1104" y2="1776" x1="1184" />
            <wire x2="1296" y1="1776" y2="1776" x1="1184" />
            <wire x2="1232" y1="1104" y2="1104" x1="1184" />
        </branch>
        <branch name="XLXN_2(31:0)">
            <wire x2="1168" y1="1008" y2="1936" x1="1168" />
            <wire x2="1296" y1="1936" y2="1936" x1="1168" />
            <wire x2="1232" y1="1008" y2="1008" x1="1168" />
        </branch>
        <instance x="1712" y="1472" name="CalculateAlphaCP_rom_signed10bit" orien="R180">
        </instance>
        <branch name="i_clock">
            <wire x2="1168" y1="336" y2="336" x1="1152" />
            <wire x2="1232" y1="336" y2="336" x1="1168" />
            <wire x2="1168" y1="224" y2="336" x1="1168" />
            <wire x2="1920" y1="224" y2="224" x1="1168" />
            <wire x2="1920" y1="224" y2="1568" x1="1920" />
            <wire x2="1920" y1="1568" y2="1568" x1="1712" />
        </branch>
        <branch name="i_reset">
            <wire x2="1216" y1="432" y2="432" x1="1200" />
            <wire x2="1232" y1="432" y2="432" x1="1216" />
            <wire x2="1216" y1="240" y2="432" x1="1216" />
            <wire x2="1904" y1="240" y2="240" x1="1216" />
            <wire x2="1904" y1="240" y2="1504" x1="1904" />
            <wire x2="1904" y1="1504" y2="1504" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="1152" y="336" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="1200" y="432" name="i_reset" orien="R180" />
        <branch name="i_run">
            <wire x2="1232" y1="528" y2="528" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1200" y="528" name="i_run" orien="R180" />
        <branch name="divfprdy">
            <wire x2="1232" y1="624" y2="624" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1200" y="624" name="divfprdy" orien="R180" />
        <branch name="mulfprdy">
            <wire x2="1232" y1="720" y2="720" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1200" y="720" name="mulfprdy" orien="R180" />
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="1232" y1="816" y2="816" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1200" y="816" name="i2c_mem_douta(7:0)" orien="R180" />
        <branch name="XLXN_6(31:0)">
            <wire x2="1152" y1="912" y2="1632" x1="1152" />
            <wire x2="1328" y1="1632" y2="1632" x1="1152" />
            <wire x2="1232" y1="912" y2="912" x1="1152" />
        </branch>
        <branch name="XLXN_7(9:0)">
            <wire x2="1744" y1="1632" y2="1632" x1="1712" />
            <wire x2="1888" y1="1632" y2="1632" x1="1744" />
            <wire x2="1840" y1="912" y2="912" x1="1808" />
            <wire x2="1888" y1="912" y2="912" x1="1840" />
            <wire x2="1888" y1="912" y2="1632" x1="1888" />
        </branch>
        <branch name="XLXN_4(5:0)">
            <wire x2="1776" y1="1936" y2="1936" x1="1744" />
            <wire x2="1872" y1="1936" y2="1936" x1="1776" />
            <wire x2="1840" y1="976" y2="976" x1="1808" />
            <wire x2="1872" y1="976" y2="976" x1="1840" />
            <wire x2="1872" y1="976" y2="1936" x1="1872" />
        </branch>
        <branch name="XLXN_3(3:0)">
            <wire x2="1776" y1="1776" y2="1776" x1="1744" />
            <wire x2="1856" y1="1776" y2="1776" x1="1776" />
            <wire x2="1840" y1="1040" y2="1040" x1="1808" />
            <wire x2="1856" y1="1040" y2="1040" x1="1840" />
            <wire x2="1856" y1="1040" y2="1776" x1="1856" />
        </branch>
        <branch name="divfpr(31:0)">
            <wire x2="1216" y1="1200" y2="1200" x1="1120" />
            <wire x2="1232" y1="1200" y2="1200" x1="1216" />
        </branch>
        <branch name="mulfpr(31:0)">
            <wire x2="1216" y1="1296" y2="1296" x1="1120" />
            <wire x2="1232" y1="1296" y2="1296" x1="1216" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="1824" y1="336" y2="336" x1="1808" />
            <wire x2="1952" y1="336" y2="336" x1="1824" />
        </branch>
        <branch name="o_rdy">
            <wire x2="1824" y1="400" y2="400" x1="1808" />
            <wire x2="1952" y1="400" y2="400" x1="1824" />
        </branch>
        <branch name="divfpond">
            <wire x2="1824" y1="464" y2="464" x1="1808" />
            <wire x2="1952" y1="464" y2="464" x1="1824" />
        </branch>
        <branch name="divfpsclr">
            <wire x2="1824" y1="528" y2="528" x1="1808" />
            <wire x2="1952" y1="528" y2="528" x1="1824" />
        </branch>
        <branch name="divfpce">
            <wire x2="1824" y1="592" y2="592" x1="1808" />
            <wire x2="1952" y1="592" y2="592" x1="1824" />
        </branch>
        <branch name="mulfpond">
            <wire x2="1824" y1="656" y2="656" x1="1808" />
            <wire x2="1952" y1="656" y2="656" x1="1824" />
        </branch>
        <branch name="mulfpsclr">
            <wire x2="1824" y1="720" y2="720" x1="1808" />
            <wire x2="1952" y1="720" y2="720" x1="1824" />
        </branch>
        <branch name="mulfpce">
            <wire x2="1824" y1="784" y2="784" x1="1808" />
            <wire x2="1952" y1="784" y2="784" x1="1824" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="1824" y1="848" y2="848" x1="1808" />
            <wire x2="1952" y1="848" y2="848" x1="1824" />
        </branch>
        <branch name="o_acpsubpage0(31:0)">
            <wire x2="1824" y1="1104" y2="1104" x1="1808" />
            <wire x2="1952" y1="1104" y2="1104" x1="1824" />
        </branch>
        <branch name="o_acpsubpage1(31:0)">
            <wire x2="1824" y1="1168" y2="1168" x1="1808" />
            <wire x2="1952" y1="1168" y2="1168" x1="1824" />
        </branch>
        <branch name="divfpa(31:0)">
            <wire x2="1824" y1="1232" y2="1232" x1="1808" />
            <wire x2="1952" y1="1232" y2="1232" x1="1824" />
        </branch>
        <branch name="divfpb(31:0)">
            <wire x2="1824" y1="1296" y2="1296" x1="1808" />
            <wire x2="1952" y1="1296" y2="1296" x1="1824" />
        </branch>
        <branch name="mulfpa(31:0)">
            <wire x2="1824" y1="1360" y2="1360" x1="1808" />
            <wire x2="1952" y1="1360" y2="1360" x1="1824" />
        </branch>
        <branch name="mulfpb(31:0)">
            <wire x2="1824" y1="1424" y2="1424" x1="1808" />
            <wire x2="1952" y1="1424" y2="1424" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1120" y="1200" name="divfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="1120" y="1296" name="mulfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="1952" y="1424" name="mulfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1952" y="1360" name="mulfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1952" y="1296" name="divfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1952" y="1232" name="divfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1952" y="1168" name="o_acpsubpage1(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1952" y="1104" name="o_acpsubpage0(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1952" y="848" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="1952" y="784" name="mulfpce" orien="R0" />
        <iomarker fontsize="28" x="1952" y="720" name="mulfpsclr" orien="R0" />
        <iomarker fontsize="28" x="1952" y="656" name="mulfpond" orien="R0" />
        <iomarker fontsize="28" x="1952" y="592" name="divfpce" orien="R0" />
        <iomarker fontsize="28" x="1952" y="528" name="divfpsclr" orien="R0" />
        <iomarker fontsize="28" x="1952" y="464" name="divfpond" orien="R0" />
        <iomarker fontsize="28" x="1952" y="400" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="1952" y="336" name="i2c_mem_ena" orien="R0" />
    </sheet>
</drawing>