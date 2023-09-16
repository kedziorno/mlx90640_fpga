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
        <signal name="XLXN_3(31:0)" />
        <signal name="XLXN_6(3:0)" />
        <signal name="XLXN_7(3:0)" />
        <signal name="XLXN_8(3:0)" />
        <signal name="XLXN_9(3:0)" />
        <signal name="XLXN_10(5:0)" />
        <signal name="XLXN_21(31:0)" />
        <signal name="o_rdy" />
        <signal name="XLXN_26(9:0)" />
        <signal name="i_addr(9:0)" />
        <signal name="o_write_enable" />
        <signal name="XLXN_35(31:0)" />
        <signal name="XLXN_37" />
        <signal name="XLXN_38(31:0)" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="i_run" />
        <signal name="fixed2floatrdy" />
        <signal name="mulfprdy" />
        <signal name="addfprdy" />
        <signal name="divfprdy" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="fixed2floatr(31:0)" />
        <signal name="mulfpr(31:0)" />
        <signal name="addfpr(31:0)" />
        <signal name="i2c_mem_ena" />
        <signal name="o_done" />
        <signal name="fixed2floatond" />
        <signal name="fixed2floatsclr" />
        <signal name="fixed2floatce" />
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
        <signal name="o_doa(31:0)" />
        <signal name="fixed2floata(63:0)" />
        <signal name="mulfpa(31:0)" />
        <signal name="mulfpb(31:0)" />
        <signal name="addfpa(31:0)" />
        <signal name="addfpb(31:0)" />
        <signal name="divfpa(31:0)" />
        <signal name="divfpb(31:0)" />
        <signal name="divfpr(31:0)" />
        <signal name="XLXN_78(3:0)" />
        <signal name="XLXN_20(31:0)" />
        <signal name="XLXN_94(9:0)" />
        <signal name="XLXN_94(9)" />
        <signal name="XLXN_94(8:0)" />
        <signal name="XLXN_98" />
        <signal name="XLXN_110(14:0)" />
        <signal name="XLXN_110(4:0)" />
        <signal name="XLXN_108(14:0)" />
        <signal name="XLXN_108(4:0)" />
        <signal name="XLXN_108(13:5)" />
        <signal name="XLXN_110(13:5)" />
        <signal name="XLXN_114(31:0)" />
        <signal name="XLXN_116" />
        <signal name="XLXN_117(31:0)" />
        <signal name="XLXN_118(31:0)" />
        <signal name="XLXN_119(31:0)" />
        <signal name="o_do(31:0)" />
        <signal name="XLXN_110(14)" />
        <signal name="XLXN_108(14)" />
        <signal name="XLXN_141(31:0)" />
        <signal name="XLXN_142(31:0)" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Input" name="i_addr(9:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="fixed2floatrdy" />
        <port polarity="Input" name="mulfprdy" />
        <port polarity="Input" name="addfprdy" />
        <port polarity="Input" name="divfprdy" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Input" name="fixed2floatr(31:0)" />
        <port polarity="Input" name="mulfpr(31:0)" />
        <port polarity="Input" name="addfpr(31:0)" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="o_done" />
        <port polarity="Output" name="fixed2floatond" />
        <port polarity="Output" name="fixed2floatsclr" />
        <port polarity="Output" name="fixed2floatce" />
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
        <port polarity="Output" name="o_doa(31:0)" />
        <port polarity="Output" name="fixed2floata(63:0)" />
        <port polarity="Output" name="mulfpa(31:0)" />
        <port polarity="Output" name="mulfpb(31:0)" />
        <port polarity="Output" name="addfpa(31:0)" />
        <port polarity="Output" name="addfpb(31:0)" />
        <port polarity="Output" name="divfpa(31:0)" />
        <port polarity="Output" name="divfpb(31:0)" />
        <port polarity="Input" name="divfpr(31:0)" />
        <port polarity="Output" name="o_do(31:0)" />
        <blockdef name="ExtractAlphaParameters_process_p0">
            <timestamp>2023-6-11T13:15:4</timestamp>
            <rect width="448" x="64" y="-2048" height="2048" />
            <line x2="0" y1="-2016" y2="-2016" x1="64" />
            <line x2="0" y1="-1920" y2="-1920" x1="64" />
            <line x2="0" y1="-1824" y2="-1824" x1="64" />
            <line x2="0" y1="-1728" y2="-1728" x1="64" />
            <line x2="0" y1="-1632" y2="-1632" x1="64" />
            <line x2="0" y1="-1536" y2="-1536" x1="64" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <rect width="64" x="0" y="-1356" height="24" />
            <line x2="0" y1="-1344" y2="-1344" x1="64" />
            <rect width="64" x="0" y="-1260" height="24" />
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
            <line x2="576" y1="-2016" y2="-2016" x1="512" />
            <line x2="576" y1="-1952" y2="-1952" x1="512" />
            <line x2="576" y1="-1888" y2="-1888" x1="512" />
            <line x2="576" y1="-1824" y2="-1824" x1="512" />
            <line x2="576" y1="-1760" y2="-1760" x1="512" />
            <line x2="576" y1="-1696" y2="-1696" x1="512" />
            <line x2="576" y1="-1632" y2="-1632" x1="512" />
            <line x2="576" y1="-1568" y2="-1568" x1="512" />
            <line x2="576" y1="-1504" y2="-1504" x1="512" />
            <line x2="576" y1="-1440" y2="-1440" x1="512" />
            <line x2="576" y1="-1376" y2="-1376" x1="512" />
            <line x2="576" y1="-1312" y2="-1312" x1="512" />
            <line x2="576" y1="-1248" y2="-1248" x1="512" />
            <line x2="576" y1="-1184" y2="-1184" x1="512" />
            <line x2="576" y1="-1120" y2="-1120" x1="512" />
            <line x2="576" y1="-1056" y2="-1056" x1="512" />
            <rect width="64" x="512" y="-1004" height="24" />
            <line x2="576" y1="-992" y2="-992" x1="512" />
            <rect width="64" x="512" y="-940" height="24" />
            <line x2="576" y1="-928" y2="-928" x1="512" />
            <rect width="64" x="512" y="-876" height="24" />
            <line x2="576" y1="-864" y2="-864" x1="512" />
            <rect width="64" x="512" y="-812" height="24" />
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
        <blockdef name="rom_unsigned4bit">
            <timestamp>2023-6-12T10:59:52</timestamp>
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
        <blockdef name="rom_alphascale">
            <timestamp>2023-6-12T10:58:44</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
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
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
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
        <block symbolname="ExtractAlphaParameters_process_p0" name="extractalphaparameters_process_p0_inst">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="fixed2floatrdy" name="fixed2floatrdy" />
            <blockpin signalname="mulfprdy" name="mulfprdy" />
            <blockpin signalname="addfprdy" name="addfprdy" />
            <blockpin signalname="divfprdy" name="divfprdy" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_21(31:0)" name="i_doa(31:0)" />
            <blockpin signalname="i_addr(9:0)" name="i_addr(9:0)" />
            <blockpin signalname="XLXN_1(31:0)" name="nibble1_in(31:0)" />
            <blockpin signalname="XLXN_2(31:0)" name="nibble2_in(31:0)" />
            <blockpin signalname="XLXN_3(31:0)" name="nibble3_in(31:0)" />
            <blockpin signalname="XLXN_141(31:0)" name="nibble4_in(31:0)" />
            <blockpin signalname="XLXN_142(31:0)" name="nibble5_in(31:0)" />
            <blockpin signalname="fixed2floatr(31:0)" name="fixed2floatr(31:0)" />
            <blockpin signalname="mulfpr(31:0)" name="mulfpr(31:0)" />
            <blockpin signalname="addfpr(31:0)" name="addfpr(31:0)" />
            <blockpin signalname="divfpr(31:0)" name="divfpr(31:0)" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="o_done" name="o_done" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="o_write_enable" name="o_write_enable" />
            <blockpin signalname="fixed2floatond" name="fixed2floatond" />
            <blockpin signalname="fixed2floatsclr" name="fixed2floatsclr" />
            <blockpin signalname="fixed2floatce" name="fixed2floatce" />
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
            <blockpin signalname="XLXN_38(31:0)" name="o_dia(31:0)" />
            <blockpin signalname="o_doa(31:0)" name="o_do(31:0)" />
            <blockpin signalname="XLXN_26(9:0)" name="o_addra(9:0)" />
            <blockpin signalname="XLXN_6(3:0)" name="nibble1_out(3:0)" />
            <blockpin signalname="XLXN_7(3:0)" name="nibble2_out(3:0)" />
            <blockpin signalname="XLXN_8(3:0)" name="nibble4_out(3:0)" />
            <blockpin signalname="XLXN_9(3:0)" name="nibble5_out(3:0)" />
            <blockpin signalname="XLXN_10(5:0)" name="nibble3_out(5:0)" />
            <blockpin signalname="fixed2floata(63:0)" name="fixed2floata(63:0)" />
            <blockpin signalname="mulfpa(31:0)" name="mulfpa(31:0)" />
            <blockpin signalname="mulfpb(31:0)" name="mulfpb(31:0)" />
            <blockpin signalname="addfpa(31:0)" name="addfpa(31:0)" />
            <blockpin signalname="addfpb(31:0)" name="addfpb(31:0)" />
            <blockpin signalname="divfpa(31:0)" name="divfpa(31:0)" />
            <blockpin signalname="divfpb(31:0)" name="divfpb(31:0)" />
        </block>
        <block symbolname="rom_unsigned4bit" name="extractalphaparameters_rom_unsigned4bit">
            <blockpin signalname="XLXN_6(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="XLXN_1(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_signed4bit" name="extractalphaparameters_rom_signed4bit">
            <blockpin signalname="XLXN_7(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="XLXN_2(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_signed6bit" name="extractalphaparameters_rom_signed6bit">
            <blockpin signalname="XLXN_10(5:0)" name="nibble_in(5:0)" />
            <blockpin signalname="XLXN_3(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_alphascale" name="extractalphaparameters_rom_alphascale">
            <blockpin signalname="XLXN_9(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="XLXN_142(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_unsigned4bit_2powx" name="extractalphaparameters_rom_unsigned4bit_2powx">
            <blockpin signalname="XLXN_8(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="XLXN_141(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="RAMB16_S36_S36" name="inst_mem_acc1">
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
            <blockpin signalname="XLXN_110(14:0)" name="ADDRA(14:0)" />
            <blockpin name="ADDRB(14:0)" />
            <blockpin name="CASCADEINA" />
            <blockpin name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin signalname="XLXN_35(31:0)" name="DIA(31:0)" />
            <blockpin name="DIB(31:0)" />
            <blockpin name="DIPA(3:0)" />
            <blockpin name="DIPB(3:0)" />
            <blockpin signalname="XLXN_98" name="ENA" />
            <blockpin name="REGCEA" />
            <blockpin name="REGCEB" />
            <blockpin name="ENB" />
            <blockpin signalname="i_reset" name="SSRA" />
            <blockpin name="SSRB" />
            <blockpin signalname="XLXN_78(3:0)" name="WEA(3:0)" />
            <blockpin name="WEB(3:0)" />
            <blockpin name="CASCADEOUTA" />
            <blockpin name="CASCADEOUTB" />
            <blockpin signalname="XLXN_114(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="mux_addr" name="extractalphaparameters_MUX_ADDR">
            <blockpin signalname="o_rdy" name="rdy" />
            <blockpin signalname="XLXN_26(9:0)" name="addra(9:0)" />
            <blockpin signalname="i_addr(9:0)" name="i_addr(9:0)" />
            <blockpin signalname="XLXN_94(9:0)" name="mux_addr(9:0)" />
        </block>
        <block symbolname="m2_1" name="extractalphaparameters_MUX_DIA(31:0)">
            <blockpin signalname="XLXN_38(31:0)" name="D0" />
            <blockpin signalname="XLXN_37" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="XLXN_35(31:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_15">
            <attr value="22000000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_37" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_22(3:0)">
            <blockpin signalname="o_write_enable" name="I" />
            <blockpin signalname="XLXN_78(3:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="extractalphaparameters_MUX_DO_half1(31:0)">
            <blockpin signalname="XLXN_20(31:0)" name="D0" />
            <blockpin signalname="XLXN_114(31:0)" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="XLXN_118(31:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_12">
            <attr value="22000000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_20(31:0)" name="O" />
        </block>
        <block symbolname="RAMB16_S36_S36" name="inst_mem_acc2">
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
            <blockpin signalname="XLXN_108(14:0)" name="ADDRA(14:0)" />
            <blockpin name="ADDRB(14:0)" />
            <blockpin name="CASCADEINA" />
            <blockpin name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin signalname="XLXN_35(31:0)" name="DIA(31:0)" />
            <blockpin name="DIB(31:0)" />
            <blockpin name="DIPA(3:0)" />
            <blockpin name="DIPB(3:0)" />
            <blockpin signalname="XLXN_94(9)" name="ENA" />
            <blockpin name="REGCEA" />
            <blockpin name="REGCEB" />
            <blockpin name="ENB" />
            <blockpin signalname="i_reset" name="SSRA" />
            <blockpin name="SSRB" />
            <blockpin signalname="XLXN_78(3:0)" name="WEA(3:0)" />
            <blockpin name="WEB(3:0)" />
            <blockpin name="CASCADEOUTA" />
            <blockpin name="CASCADEOUTB" />
            <blockpin signalname="XLXN_117(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="buf" name="XLXI_34(8:0)">
            <blockpin signalname="XLXN_94(8:0)" name="I" />
            <blockpin signalname="XLXN_110(13:5)" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_35">
            <blockpin signalname="XLXN_94(9)" name="I" />
            <blockpin signalname="XLXN_98" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_36(4:0)">
            <blockpin signalname="XLXN_110(4:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_37(4:0)">
            <blockpin signalname="XLXN_108(4:0)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_38(8:0)">
            <blockpin signalname="XLXN_94(8:0)" name="I" />
            <blockpin signalname="XLXN_108(13:5)" name="O" />
        </block>
        <block symbolname="m2_1" name="extractalphaparameters_MUX_DOA(31:0)">
            <blockpin signalname="XLXN_114(31:0)" name="D0" />
            <blockpin signalname="XLXN_117(31:0)" name="D1" />
            <blockpin signalname="XLXN_94(9)" name="S0" />
            <blockpin signalname="XLXN_21(31:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="extractalphaparameters_MUX_DO_half2(31:0)">
            <blockpin signalname="XLXN_116" name="D0" />
            <blockpin signalname="XLXN_117(31:0)" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="XLXN_119(31:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_41">
            <attr value="22000000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_116" name="O" />
        </block>
        <block symbolname="m2_1" name="extractalphaparameters_MUX_DO(31:0)">
            <blockpin signalname="XLXN_118(31:0)" name="D0" />
            <blockpin signalname="XLXN_119(31:0)" name="D1" />
            <blockpin signalname="XLXN_94(9)" name="S0" />
            <blockpin signalname="o_do(31:0)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_43">
            <blockpin signalname="XLXN_110(14)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_44">
            <blockpin signalname="XLXN_108(14)" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="2304" y="2160" name="extractalphaparameters_process_p0_inst" orien="R0">
        </instance>
        <instance x="1824" y="1136" name="extractalphaparameters_rom_unsigned4bit" orien="R0">
        </instance>
        <branch name="XLXN_1(31:0)">
            <wire x2="2304" y1="1104" y2="1104" x1="2272" />
        </branch>
        <instance x="1824" y="1232" name="extractalphaparameters_rom_signed4bit" orien="R0">
        </instance>
        <instance x="1824" y="1328" name="extractalphaparameters_rom_signed6bit" orien="R0">
        </instance>
        <branch name="XLXN_2(31:0)">
            <wire x2="2304" y1="1200" y2="1200" x1="2272" />
        </branch>
        <branch name="XLXN_3(31:0)">
            <wire x2="2304" y1="1296" y2="1296" x1="2272" />
        </branch>
        <branch name="XLXN_6(3:0)">
            <wire x2="1632" y1="1104" y2="2240" x1="1632" />
            <wire x2="2976" y1="2240" y2="2240" x1="1632" />
            <wire x2="1824" y1="1104" y2="1104" x1="1632" />
            <wire x2="2976" y1="1424" y2="1424" x1="2880" />
            <wire x2="2976" y1="1424" y2="2240" x1="2976" />
        </branch>
        <branch name="XLXN_7(3:0)">
            <wire x2="1824" y1="1200" y2="1200" x1="1648" />
            <wire x2="1648" y1="1200" y2="1584" x1="1648" />
            <wire x2="1648" y1="1584" y2="1680" x1="1648" />
            <wire x2="1648" y1="1680" y2="1776" x1="1648" />
            <wire x2="1648" y1="1776" y2="1872" x1="1648" />
            <wire x2="1648" y1="1872" y2="2224" x1="1648" />
            <wire x2="2960" y1="2224" y2="2224" x1="1648" />
            <wire x2="2960" y1="1488" y2="1488" x1="2880" />
            <wire x2="2960" y1="1488" y2="2224" x1="2960" />
        </branch>
        <branch name="XLXN_10(5:0)">
            <wire x2="1584" y1="1296" y2="2256" x1="1584" />
            <wire x2="2992" y1="2256" y2="2256" x1="1584" />
            <wire x2="1824" y1="1296" y2="1296" x1="1584" />
            <wire x2="2992" y1="1680" y2="1680" x1="2880" />
            <wire x2="2992" y1="1680" y2="2256" x1="2992" />
        </branch>
        <instance x="1888" y="3088" name="extractalphaparameters_MUX_ADDR" orien="R0">
        </instance>
        <branch name="o_rdy">
            <wire x2="1808" y1="2592" y2="2928" x1="1808" />
            <wire x2="1888" y1="2928" y2="2928" x1="1808" />
            <wire x2="1808" y1="2928" y2="3280" x1="1808" />
            <wire x2="1888" y1="3280" y2="3280" x1="1808" />
            <wire x2="3104" y1="2592" y2="2592" x1="1808" />
            <wire x2="3760" y1="2592" y2="2592" x1="3104" />
            <wire x2="3104" y1="272" y2="272" x1="2880" />
            <wire x2="3104" y1="272" y2="2592" x1="3104" />
            <wire x2="3152" y1="272" y2="272" x1="3104" />
            <wire x2="4464" y1="2000" y2="2000" x1="3760" />
            <wire x2="3760" y1="2000" y2="2400" x1="3760" />
            <wire x2="3760" y1="2400" y2="2592" x1="3760" />
            <wire x2="4464" y1="2400" y2="2400" x1="3760" />
            <wire x2="4464" y1="2400" y2="2432" x1="4464" />
        </branch>
        <branch name="XLXN_26(9:0)">
            <wire x2="1792" y1="2576" y2="2992" x1="1792" />
            <wire x2="1888" y1="2992" y2="2992" x1="1792" />
            <wire x2="3040" y1="2576" y2="2576" x1="1792" />
            <wire x2="3040" y1="1360" y2="1360" x1="2880" />
            <wire x2="3040" y1="1360" y2="2576" x1="3040" />
        </branch>
        <branch name="XLXN_35(31:0)">
            <wire x2="2224" y1="3184" y2="3184" x1="2208" />
            <wire x2="2224" y1="3104" y2="3184" x1="2224" />
            <wire x2="3184" y1="3104" y2="3104" x1="2224" />
            <wire x2="3280" y1="3104" y2="3104" x1="3184" />
            <wire x2="3088" y1="2640" y2="3088" x1="3088" />
            <wire x2="3184" y1="3088" y2="3088" x1="3088" />
            <wire x2="3184" y1="3088" y2="3104" x1="3184" />
            <wire x2="4128" y1="2640" y2="2640" x1="3088" />
            <wire x2="4128" y1="2640" y2="3104" x1="4128" />
            <wire x2="4304" y1="3104" y2="3104" x1="4128" />
        </branch>
        <instance x="1888" y="3312" name="extractalphaparameters_MUX_DIA(31:0)" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="-20" type="instance" />
        </instance>
        <instance x="1648" y="3184" name="XLXI_15" orien="R0">
        </instance>
        <branch name="XLXN_37">
            <wire x2="1888" y1="3216" y2="3216" x1="1792" />
        </branch>
        <branch name="XLXN_38(31:0)">
            <wire x2="1840" y1="2624" y2="3152" x1="1840" />
            <wire x2="1888" y1="3152" y2="3152" x1="1840" />
            <wire x2="3120" y1="2624" y2="2624" x1="1840" />
            <wire x2="3120" y1="1232" y2="1232" x1="2880" />
            <wire x2="3120" y1="1232" y2="2624" x1="3120" />
        </branch>
        <branch name="i_reset">
            <wire x2="1680" y1="240" y2="240" x1="1648" />
            <wire x2="2304" y1="240" y2="240" x1="1680" />
            <wire x2="1680" y1="48" y2="240" x1="1680" />
            <wire x2="2912" y1="48" y2="48" x1="1680" />
            <wire x2="2912" y1="48" y2="3360" x1="2912" />
            <wire x2="3232" y1="3360" y2="3360" x1="2912" />
            <wire x2="3280" y1="3360" y2="3360" x1="3232" />
            <wire x2="3232" y1="2832" y2="3360" x1="3232" />
            <wire x2="3744" y1="2832" y2="2832" x1="3232" />
            <wire x2="3744" y1="2832" y2="3360" x1="3744" />
            <wire x2="4304" y1="3360" y2="3360" x1="3744" />
        </branch>
        <branch name="i_run">
            <wire x2="2304" y1="336" y2="336" x1="1648" />
        </branch>
        <branch name="fixed2floatrdy">
            <wire x2="2304" y1="432" y2="432" x1="1648" />
        </branch>
        <branch name="mulfprdy">
            <wire x2="2304" y1="528" y2="528" x1="1648" />
        </branch>
        <branch name="addfprdy">
            <wire x2="2304" y1="624" y2="624" x1="1648" />
        </branch>
        <branch name="divfprdy">
            <wire x2="2304" y1="720" y2="720" x1="1648" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="2304" y1="816" y2="816" x1="1648" />
        </branch>
        <branch name="fixed2floatr(31:0)">
            <wire x2="2304" y1="1584" y2="1584" x1="1648" />
        </branch>
        <branch name="mulfpr(31:0)">
            <wire x2="2304" y1="1680" y2="1680" x1="1648" />
        </branch>
        <branch name="addfpr(31:0)">
            <wire x2="2304" y1="1776" y2="1776" x1="1648" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="3152" y1="144" y2="144" x1="2880" />
        </branch>
        <branch name="o_done">
            <wire x2="3152" y1="208" y2="208" x1="2880" />
        </branch>
        <branch name="fixed2floatond">
            <wire x2="3152" y1="400" y2="400" x1="2880" />
        </branch>
        <branch name="fixed2floatsclr">
            <wire x2="3152" y1="464" y2="464" x1="2880" />
        </branch>
        <branch name="fixed2floatce">
            <wire x2="3152" y1="528" y2="528" x1="2880" />
        </branch>
        <branch name="mulfpond">
            <wire x2="3152" y1="592" y2="592" x1="2880" />
        </branch>
        <branch name="mulfpsclr">
            <wire x2="3152" y1="656" y2="656" x1="2880" />
        </branch>
        <branch name="mulfpce">
            <wire x2="3152" y1="720" y2="720" x1="2880" />
        </branch>
        <branch name="addfpond">
            <wire x2="3152" y1="784" y2="784" x1="2880" />
        </branch>
        <branch name="addfpsclr">
            <wire x2="3152" y1="848" y2="848" x1="2880" />
        </branch>
        <branch name="divfpond">
            <wire x2="3152" y1="976" y2="976" x1="2880" />
        </branch>
        <branch name="divfpsclr">
            <wire x2="3152" y1="1040" y2="1040" x1="2880" />
        </branch>
        <branch name="divfpce">
            <wire x2="3152" y1="1104" y2="1104" x1="2880" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="3152" y1="1168" y2="1168" x1="2880" />
        </branch>
        <branch name="o_doa(31:0)">
            <wire x2="3152" y1="1296" y2="1296" x1="2880" />
        </branch>
        <branch name="fixed2floata(63:0)">
            <wire x2="3152" y1="1744" y2="1744" x1="2880" />
        </branch>
        <branch name="mulfpa(31:0)">
            <wire x2="3152" y1="1808" y2="1808" x1="2880" />
        </branch>
        <branch name="mulfpb(31:0)">
            <wire x2="3152" y1="1872" y2="1872" x1="2880" />
        </branch>
        <branch name="addfpa(31:0)">
            <wire x2="3152" y1="1936" y2="1936" x1="2880" />
        </branch>
        <branch name="addfpb(31:0)">
            <wire x2="3152" y1="2000" y2="2000" x1="2880" />
        </branch>
        <branch name="divfpa(31:0)">
            <wire x2="3152" y1="2064" y2="2064" x1="2880" />
        </branch>
        <branch name="divfpb(31:0)">
            <wire x2="3152" y1="2128" y2="2128" x1="2880" />
        </branch>
        <iomarker fontsize="28" x="1648" y="144" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="1648" y="240" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="1648" y="336" name="i_run" orien="R180" />
        <iomarker fontsize="28" x="1648" y="528" name="mulfprdy" orien="R180" />
        <iomarker fontsize="28" x="1648" y="624" name="addfprdy" orien="R180" />
        <iomarker fontsize="28" x="1648" y="720" name="divfprdy" orien="R180" />
        <iomarker fontsize="28" x="1648" y="816" name="i2c_mem_douta(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1648" y="1584" name="fixed2floatr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="1648" y="1680" name="mulfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="1648" y="1776" name="addfpr(31:0)" orien="R180" />
        <branch name="divfpr(31:0)">
            <wire x2="2304" y1="1872" y2="1872" x1="1648" />
        </branch>
        <iomarker fontsize="28" x="1648" y="1872" name="divfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="3152" y="2128" name="divfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="2064" name="divfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="2000" name="addfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1936" name="addfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1872" name="mulfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1808" name="mulfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1744" name="fixed2floata(63:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1296" name="o_doa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1168" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1104" name="divfpce" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1040" name="divfpsclr" orien="R0" />
        <iomarker fontsize="28" x="3152" y="976" name="divfpond" orien="R0" />
        <branch name="addfpce">
            <wire x2="3152" y1="912" y2="912" x1="2880" />
        </branch>
        <iomarker fontsize="28" x="3152" y="912" name="addfpce" orien="R0" />
        <iomarker fontsize="28" x="3152" y="848" name="addfpsclr" orien="R0" />
        <iomarker fontsize="28" x="3152" y="784" name="addfpond" orien="R0" />
        <iomarker fontsize="28" x="3152" y="720" name="mulfpce" orien="R0" />
        <iomarker fontsize="28" x="3152" y="656" name="mulfpsclr" orien="R0" />
        <iomarker fontsize="28" x="3152" y="592" name="mulfpond" orien="R0" />
        <iomarker fontsize="28" x="3152" y="528" name="fixed2floatce" orien="R0" />
        <iomarker fontsize="28" x="3152" y="464" name="fixed2floatsclr" orien="R0" />
        <iomarker fontsize="28" x="3152" y="400" name="fixed2floatond" orien="R0" />
        <iomarker fontsize="28" x="3152" y="208" name="o_done" orien="R0" />
        <iomarker fontsize="28" x="3152" y="144" name="i2c_mem_ena" orien="R0" />
        <iomarker fontsize="28" x="1648" y="432" name="fixed2floatrdy" orien="R180" />
        <branch name="i_addr(9:0)">
            <wire x2="1616" y1="1008" y2="1008" x1="1568" />
            <wire x2="1616" y1="1008" y2="3056" x1="1616" />
            <wire x2="1888" y1="3056" y2="3056" x1="1616" />
            <wire x2="2304" y1="1008" y2="1008" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="3152" y="272" name="o_rdy" orien="R0" />
        <instance x="2240" y="3472" name="XLXI_22(3:0)" orien="R0" />
        <branch name="o_write_enable">
            <wire x2="1824" y1="2608" y2="3440" x1="1824" />
            <wire x2="2240" y1="3440" y2="3440" x1="1824" />
            <wire x2="3072" y1="2608" y2="2608" x1="1824" />
            <wire x2="3072" y1="336" y2="336" x1="2880" />
            <wire x2="3072" y1="336" y2="2608" x1="3072" />
        </branch>
        <branch name="XLXN_20(31:0)">
            <wire x2="4464" y1="2128" y2="2128" x1="4432" />
        </branch>
        <instance x="3280" y="3488" name="inst_mem_acc1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <instance x="4304" y="3488" name="inst_mem_acc2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <bustap x2="2336" y1="2928" y2="2832" x1="2336" />
        <bustap x2="2368" y1="2928" y2="2832" x1="2368" />
        <instance x="2368" y="2736" name="XLXI_35" orien="R0" />
        <bustap x2="3184" y1="2912" y2="2816" x1="3184" />
        <branch name="XLXN_110(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="2808" type="branch" />
            <wire x2="3264" y1="2784" y2="2784" x1="3184" />
            <wire x2="3184" y1="2784" y2="2816" x1="3184" />
        </branch>
        <bustap x2="3152" y1="2912" y2="2816" x1="3152" />
        <instance x="3392" y="2848" name="XLXI_36(4:0)" orien="R270" />
        <bustap x2="4192" y1="2912" y2="2816" x1="4192" />
        <branch name="XLXN_108(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="4192" y="2808" type="branch" />
            <wire x2="4240" y1="2784" y2="2784" x1="4192" />
            <wire x2="4192" y1="2784" y2="2816" x1="4192" />
        </branch>
        <bustap x2="4160" y1="2912" y2="2816" x1="4160" />
        <instance x="4368" y="2848" name="XLXI_37(4:0)" orien="R270" />
        <branch name="XLXN_108(13:5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="4160" y="2808" type="branch" />
            <wire x2="4160" y1="2800" y2="2800" x1="4064" />
            <wire x2="4160" y1="2800" y2="2816" x1="4160" />
        </branch>
        <instance x="3840" y="2832" name="XLXI_38(8:0)" orien="R0" />
        <instance x="2400" y="2816" name="XLXI_34(8:0)" orien="R0" />
        <branch name="XLXN_94(8:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3024" y="2720" type="branch" />
            <wire x2="2624" y1="2640" y2="2640" x1="2304" />
            <wire x2="2624" y1="2640" y2="2720" x1="2624" />
            <wire x2="3024" y1="2720" y2="2720" x1="2624" />
            <wire x2="3440" y1="2720" y2="2720" x1="3024" />
            <wire x2="3440" y1="2720" y2="2800" x1="3440" />
            <wire x2="3840" y1="2800" y2="2800" x1="3440" />
            <wire x2="2304" y1="2640" y2="2784" x1="2304" />
            <wire x2="2368" y1="2784" y2="2784" x1="2304" />
            <wire x2="2400" y1="2784" y2="2784" x1="2368" />
            <wire x2="2368" y1="2784" y2="2832" x1="2368" />
        </branch>
        <branch name="XLXN_110(13:5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3152" y="2808" type="branch" />
            <wire x2="3152" y1="2784" y2="2784" x1="2624" />
            <wire x2="3152" y1="2784" y2="2816" x1="3152" />
        </branch>
        <branch name="XLXN_110(14:0)">
            <wire x2="3168" y1="2912" y2="2912" x1="3152" />
            <wire x2="3184" y1="2912" y2="2912" x1="3168" />
            <wire x2="3280" y1="2912" y2="2912" x1="3184" />
        </branch>
        <branch name="XLXN_108(14:0)">
            <wire x2="4176" y1="2912" y2="2912" x1="4160" />
            <wire x2="4192" y1="2912" y2="2912" x1="4176" />
            <wire x2="4304" y1="2912" y2="2912" x1="4192" />
        </branch>
        <branch name="XLXN_94(9:0)">
            <wire x2="2336" y1="2928" y2="2928" x1="2272" />
            <wire x2="2368" y1="2928" y2="2928" x1="2336" />
        </branch>
        <branch name="XLXN_78(3:0)">
            <wire x2="2480" y1="3440" y2="3440" x1="2464" />
            <wire x2="2480" y1="3424" y2="3440" x1="2480" />
            <wire x2="3248" y1="3424" y2="3424" x1="2480" />
            <wire x2="3280" y1="3424" y2="3424" x1="3248" />
            <wire x2="3248" y1="3424" y2="3504" x1="3248" />
            <wire x2="3728" y1="3504" y2="3504" x1="3248" />
            <wire x2="4304" y1="3424" y2="3424" x1="3728" />
            <wire x2="3728" y1="3424" y2="3504" x1="3728" />
        </branch>
        <instance x="4464" y="1968" name="extractalphaparameters_MUX_DO_half1(31:0)" orien="M180">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="-276" type="instance" />
        </instance>
        <instance x="4288" y="2160" name="XLXI_12" orien="M180">
        </instance>
        <branch name="XLXN_21(31:0)">
            <wire x2="2304" y1="912" y2="912" x1="1664" />
            <wire x2="1664" y1="912" y2="2384" x1="1664" />
            <wire x2="2432" y1="2384" y2="2384" x1="1664" />
            <wire x2="2432" y1="2320" y2="2384" x1="2432" />
            <wire x2="3216" y1="2320" y2="2320" x1="2432" />
        </branch>
        <branch name="XLXN_114(31:0)">
            <wire x2="4000" y1="2288" y2="2288" x1="3536" />
            <wire x2="4000" y1="2288" y2="2464" x1="4000" />
            <wire x2="4000" y1="2464" y2="3104" x1="4000" />
            <wire x2="4224" y1="2464" y2="2464" x1="4000" />
            <wire x2="4000" y1="3104" y2="3104" x1="3664" />
            <wire x2="4464" y1="2064" y2="2064" x1="4224" />
            <wire x2="4224" y1="2064" y2="2464" x1="4224" />
        </branch>
        <instance x="3536" y="2448" name="extractalphaparameters_MUX_DOA(31:0)" orien="M0" />
        <instance x="4464" y="2400" name="extractalphaparameters_MUX_DO_half2(31:0)" orien="M180" />
        <instance x="4272" y="2592" name="XLXI_41" orien="M180">
        </instance>
        <branch name="XLXN_116">
            <wire x2="4464" y1="2560" y2="2560" x1="4416" />
        </branch>
        <branch name="XLXN_117(31:0)">
            <wire x2="4448" y1="2352" y2="2352" x1="3536" />
            <wire x2="4448" y1="2352" y2="2496" x1="4448" />
            <wire x2="4464" y1="2496" y2="2496" x1="4448" />
            <wire x2="4448" y1="2496" y2="2656" x1="4448" />
            <wire x2="4752" y1="2656" y2="2656" x1="4448" />
            <wire x2="4752" y1="2656" y2="3104" x1="4752" />
            <wire x2="4752" y1="3104" y2="3104" x1="4688" />
        </branch>
        <instance x="4896" y="2224" name="extractalphaparameters_MUX_DO(31:0)" orien="M180" />
        <branch name="XLXN_118(31:0)">
            <wire x2="4832" y1="2096" y2="2096" x1="4784" />
            <wire x2="4832" y1="2096" y2="2384" x1="4832" />
            <wire x2="4896" y1="2384" y2="2384" x1="4832" />
        </branch>
        <branch name="XLXN_119(31:0)">
            <wire x2="4816" y1="2528" y2="2528" x1="4784" />
            <wire x2="4816" y1="2320" y2="2528" x1="4816" />
            <wire x2="4896" y1="2320" y2="2320" x1="4816" />
        </branch>
        <branch name="o_do(31:0)">
            <wire x2="5248" y1="2352" y2="2352" x1="5216" />
        </branch>
        <iomarker fontsize="28" x="5248" y="2352" name="o_do(31:0)" orien="R0" />
        <bustap x2="3168" y1="2912" y2="3008" x1="3168" />
        <branch name="XLXN_110(14)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3168" y="3016" type="branch" />
            <wire x2="3168" y1="3008" y2="3024" x1="3168" />
        </branch>
        <instance x="3040" y="2960" name="XLXI_43" orien="R90" />
        <bustap x2="4176" y1="2912" y2="3008" x1="4176" />
        <branch name="XLXN_108(14)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="4176" y="3016" type="branch" />
            <wire x2="4176" y1="3008" y2="3024" x1="4176" />
        </branch>
        <instance x="4048" y="2960" name="XLXI_44" orien="R90" />
        <iomarker fontsize="28" x="1568" y="1008" name="i_addr(9:0)" orien="R180" />
        <instance x="1680" y="1424" name="extractalphaparameters_rom_alphascale" orien="R0">
        </instance>
        <branch name="i_clock">
            <wire x2="1440" y1="176" y2="3328" x1="1440" />
            <wire x2="3216" y1="3328" y2="3328" x1="1440" />
            <wire x2="1696" y1="176" y2="176" x1="1440" />
            <wire x2="1696" y1="144" y2="144" x1="1648" />
            <wire x2="2304" y1="144" y2="144" x1="1696" />
            <wire x2="1696" y1="144" y2="176" x1="1696" />
            <wire x2="3216" y1="2816" y2="3040" x1="3216" />
            <wire x2="3280" y1="3040" y2="3040" x1="3216" />
            <wire x2="3216" y1="3040" y2="3328" x1="3216" />
            <wire x2="3728" y1="2816" y2="2816" x1="3216" />
            <wire x2="3728" y1="2816" y2="3040" x1="3728" />
            <wire x2="4304" y1="3040" y2="3040" x1="3728" />
        </branch>
        <instance x="1680" y="1520" name="extractalphaparameters_rom_unsigned4bit_2powx" orien="R0">
        </instance>
        <branch name="XLXN_141(31:0)">
            <wire x2="2192" y1="1488" y2="1488" x1="2128" />
            <wire x2="2192" y1="1424" y2="1488" x1="2192" />
            <wire x2="2288" y1="1424" y2="1424" x1="2192" />
            <wire x2="2288" y1="1392" y2="1424" x1="2288" />
            <wire x2="2304" y1="1392" y2="1392" x1="2288" />
        </branch>
        <branch name="XLXN_142(31:0)">
            <wire x2="2208" y1="1392" y2="1392" x1="2128" />
            <wire x2="2208" y1="1392" y2="1488" x1="2208" />
            <wire x2="2304" y1="1488" y2="1488" x1="2208" />
        </branch>
        <branch name="XLXN_94(9)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2336" y="2824" type="branch" />
            <wire x2="3536" y1="2464" y2="2464" x1="2336" />
            <wire x2="3616" y1="2464" y2="2464" x1="3536" />
            <wire x2="2336" y1="2464" y2="2528" x1="2336" />
            <wire x2="2336" y1="2528" y2="2704" x1="2336" />
            <wire x2="2368" y1="2704" y2="2704" x1="2336" />
            <wire x2="2336" y1="2704" y2="2832" x1="2336" />
            <wire x2="3776" y1="2528" y2="2528" x1="2336" />
            <wire x2="3776" y1="2528" y2="3232" x1="3776" />
            <wire x2="4304" y1="3232" y2="3232" x1="3776" />
            <wire x2="3536" y1="2416" y2="2464" x1="3536" />
            <wire x2="4896" y1="2256" y2="2256" x1="3616" />
            <wire x2="3616" y1="2256" y2="2464" x1="3616" />
        </branch>
        <branch name="XLXN_98">
            <wire x2="2944" y1="2704" y2="2704" x1="2592" />
            <wire x2="2944" y1="2704" y2="3232" x1="2944" />
            <wire x2="3280" y1="3232" y2="3232" x1="2944" />
        </branch>
        <branch name="XLXN_8(3:0)">
            <wire x2="2896" y1="32" y2="32" x1="1280" />
            <wire x2="2896" y1="32" y2="1552" x1="2896" />
            <wire x2="1280" y1="32" y2="1456" x1="1280" />
            <wire x2="1408" y1="1456" y2="1456" x1="1280" />
            <wire x2="1408" y1="1456" y2="1488" x1="1408" />
            <wire x2="1680" y1="1488" y2="1488" x1="1408" />
            <wire x2="2896" y1="1552" y2="1552" x1="2880" />
        </branch>
        <branch name="XLXN_9(3:0)">
            <wire x2="1680" y1="1392" y2="1392" x1="1328" />
            <wire x2="1328" y1="1392" y2="2176" x1="1328" />
            <wire x2="2896" y1="2176" y2="2176" x1="1328" />
            <wire x2="2896" y1="1616" y2="1616" x1="2880" />
            <wire x2="2896" y1="1616" y2="2176" x1="2896" />
        </branch>
    </sheet>
</drawing>
