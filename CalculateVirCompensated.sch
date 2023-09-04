<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
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
        <signal name="XLXN_139(3:0)" />
        <signal name="i_addr(9:0)" />
        <signal name="mux_addr1(9:0)" />
        <signal name="o_do(31:0)" />
        <signal name="XLXN_212" />
        <signal name="XLXN_213(11:0)" />
        <signal name="XLXN_214(31:0)" />
        <signal name="XLXN_215(31:0)" />
        <signal name="XLXN_216(31:0)" />
        <signal name="XLXN_217" />
        <signal name="XLXN_218" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="i2c_mem_ena" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="o_rdy" />
        <signal name="XLXN_236" />
        <signal name="XLXN_239(31:0)" />
        <signal name="XLXN_241(9:0)" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="i_run" />
        <signal name="divfprdy" />
        <signal name="mulfprdy" />
        <signal name="addfprdy" />
        <signal name="subfprdy" />
        <signal name="i_Emissivity(31:0)" />
        <signal name="i_pixoscpsp0(31:0)" />
        <signal name="i_pixoscpsp1(31:0)" />
        <signal name="i_pixos_do(31:0)" />
        <signal name="divfpr(31:0)" />
        <signal name="mulfpr(31:0)" />
        <signal name="addfpr(31:0)" />
        <signal name="subfpr(31:0)" />
        <signal name="divfpond" />
        <signal name="divfpsclr" />
        <signal name="divfpce" />
        <signal name="mulfpond" />
        <signal name="mulfpsclr" />
        <signal name="mulfpce" />
        <signal name="addfpond" />
        <signal name="addfpsclr" />
        <signal name="addfpce" />
        <signal name="subfpond" />
        <signal name="subfpsclr" />
        <signal name="subfpce" />
        <signal name="o_pixos_addr(9:0)" />
        <signal name="divfpa(31:0)" />
        <signal name="divfpb(31:0)" />
        <signal name="mulfpa(31:0)" />
        <signal name="mulfpb(31:0)" />
        <signal name="addfpa(31:0)" />
        <signal name="addfpb(31:0)" />
        <signal name="subfpa(31:0)" />
        <signal name="subfpb(31:0)" />
        <port polarity="Input" name="i_addr(9:0)" />
        <port polarity="Output" name="o_do(31:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="divfprdy" />
        <port polarity="Input" name="mulfprdy" />
        <port polarity="Input" name="addfprdy" />
        <port polarity="Input" name="subfprdy" />
        <port polarity="Input" name="i_Emissivity(31:0)" />
        <port polarity="Input" name="i_pixoscpsp0(31:0)" />
        <port polarity="Input" name="i_pixoscpsp1(31:0)" />
        <port polarity="Input" name="i_pixos_do(31:0)" />
        <port polarity="Input" name="divfpr(31:0)" />
        <port polarity="Input" name="mulfpr(31:0)" />
        <port polarity="Input" name="addfpr(31:0)" />
        <port polarity="Input" name="subfpr(31:0)" />
        <port polarity="Output" name="divfpond" />
        <port polarity="Output" name="divfpsclr" />
        <port polarity="Output" name="divfpce" />
        <port polarity="Output" name="mulfpond" />
        <port polarity="Output" name="mulfpsclr" />
        <port polarity="Output" name="mulfpce" />
        <port polarity="Output" name="addfpond" />
        <port polarity="Output" name="addfpsclr" />
        <port polarity="Output" name="addfpce" />
        <port polarity="Output" name="subfpond" />
        <port polarity="Output" name="subfpsclr" />
        <port polarity="Output" name="subfpce" />
        <port polarity="Output" name="o_pixos_addr(9:0)" />
        <port polarity="Output" name="divfpa(31:0)" />
        <port polarity="Output" name="divfpb(31:0)" />
        <port polarity="Output" name="mulfpa(31:0)" />
        <port polarity="Output" name="mulfpb(31:0)" />
        <port polarity="Output" name="addfpa(31:0)" />
        <port polarity="Output" name="addfpb(31:0)" />
        <port polarity="Output" name="subfpa(31:0)" />
        <port polarity="Output" name="subfpb(31:0)" />
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
        <blockdef name="ExtractTGCParameter">
            <timestamp>2023-6-16T9:41:25</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="432" y1="32" y2="32" x1="368" />
            <line x2="432" y1="96" y2="96" x1="368" />
            <rect width="64" x="368" y="148" height="24" />
            <line x2="432" y1="160" y2="160" x1="368" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <rect width="304" x="64" y="-192" height="384" />
        </blockdef>
        <blockdef name="mem_switchpattern">
            <timestamp>2023-6-16T9:43:13</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="CalculateVirCompensated_process_p0">
            <timestamp>2023-6-16T11:4:14</timestamp>
            <rect width="656" x="64" y="-1920" height="1920" />
            <line x2="0" y1="-1888" y2="-1888" x1="64" />
            <line x2="0" y1="-1792" y2="-1792" x1="64" />
            <line x2="0" y1="-1696" y2="-1696" x1="64" />
            <line x2="0" y1="-1600" y2="-1600" x1="64" />
            <line x2="0" y1="-1504" y2="-1504" x1="64" />
            <line x2="0" y1="-1408" y2="-1408" x1="64" />
            <line x2="0" y1="-1312" y2="-1312" x1="64" />
            <line x2="0" y1="-1216" y2="-1216" x1="64" />
            <rect width="64" x="0" y="-1132" height="24" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <rect width="64" x="0" y="-1036" height="24" />
            <line x2="0" y1="-1024" y2="-1024" x1="64" />
            <rect width="64" x="0" y="-940" height="24" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
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
            <rect width="64" x="0" y="-76" height="24" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
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
        <blockdef name="rom_switchpattern_neg">
            <timestamp>2023-6-16T10:52:4</timestamp>
            <rect width="304" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="rom_switchpattern_pos">
            <timestamp>2023-6-16T10:52:18</timestamp>
            <rect width="304" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <block symbolname="CalculateVirCompensated_process_p0" name="calculatevircompensated_process_p0_inst">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="XLXN_217" name="ExtractTGCParameters_rdy" />
            <blockpin signalname="divfprdy" name="divfprdy" />
            <blockpin signalname="mulfprdy" name="mulfprdy" />
            <blockpin signalname="addfprdy" name="addfprdy" />
            <blockpin signalname="subfprdy" name="subfprdy" />
            <blockpin signalname="i_Emissivity(31:0)" name="i_Emissivity(31:0)" />
            <blockpin signalname="i_pixoscpsp0(31:0)" name="i_pixoscpsp0(31:0)" />
            <blockpin signalname="i_pixoscpsp1(31:0)" name="i_pixoscpsp1(31:0)" />
            <blockpin signalname="i_pixos_do(31:0)" name="i_pixos_do(31:0)" />
            <blockpin signalname="XLXN_216(31:0)" name="ExtractTGCParameters_tgc(31:0)" />
            <blockpin signalname="XLXN_214(31:0)" name="pattern_neg_ft(31:0)" />
            <blockpin signalname="XLXN_215(31:0)" name="pattern_ft(31:0)" />
            <blockpin signalname="divfpr(31:0)" name="divfpr(31:0)" />
            <blockpin signalname="mulfpr(31:0)" name="mulfpr(31:0)" />
            <blockpin signalname="addfpr(31:0)" name="addfpr(31:0)" />
            <blockpin signalname="subfpr(31:0)" name="subfpr(31:0)" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="XLXN_218" name="ExtractTGCParameters_run" />
            <blockpin name="ExtractTGCParameters_mux" />
            <blockpin signalname="XLXN_236" name="o_write_enable" />
            <blockpin signalname="divfpond" name="divfpond" />
            <blockpin signalname="divfpsclr" name="divfpsclr" />
            <blockpin signalname="divfpce" name="divfpce" />
            <blockpin signalname="mulfpond" name="mulfpond" />
            <blockpin signalname="mulfpsclr" name="mulfpsclr" />
            <blockpin signalname="mulfpce" name="mulfpce" />
            <blockpin signalname="addfpond" name="addfpond" />
            <blockpin signalname="addfpsclr" name="addfpsclr" />
            <blockpin signalname="addfpce" name="addfpce" />
            <blockpin signalname="subfpond" name="subfpond" />
            <blockpin signalname="subfpsclr" name="subfpsclr" />
            <blockpin signalname="subfpce" name="subfpce" />
            <blockpin signalname="o_pixos_addr(9:0)" name="o_pixos_addr(9:0)" />
            <blockpin signalname="XLXN_241(9:0)" name="o_addra(9:0)" />
            <blockpin signalname="XLXN_239(31:0)" name="o_dia(31:0)" />
            <blockpin signalname="XLXN_213(11:0)" name="mem_switchpattern_pixel(11:0)" />
            <blockpin signalname="divfpa(31:0)" name="divfpa(31:0)" />
            <blockpin signalname="divfpb(31:0)" name="divfpb(31:0)" />
            <blockpin signalname="mulfpa(31:0)" name="mulfpa(31:0)" />
            <blockpin signalname="mulfpb(31:0)" name="mulfpb(31:0)" />
            <blockpin signalname="addfpa(31:0)" name="addfpa(31:0)" />
            <blockpin signalname="addfpb(31:0)" name="addfpb(31:0)" />
            <blockpin signalname="subfpa(31:0)" name="subfpa(31:0)" />
            <blockpin signalname="subfpb(31:0)" name="subfpb(31:0)" />
        </block>
        <block symbolname="ExtractTGCParameter" name="calculatevircompensated_extracttgcparameter">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_216(31:0)" name="o_tgc(31:0)" />
            <blockpin signalname="XLXN_218" name="i_run" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="XLXN_217" name="o_rdy" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="i2c_mem_addra(11:0)" />
        </block>
        <block symbolname="mem_switchpattern" name="calculatevircompensated_mem_switchpattern">
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="XLXN_213(11:0)" name="i_pixel(11:0)" />
            <blockpin signalname="XLXN_212" name="o_pattern" />
        </block>
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
        <block symbolname="RAMB16" name="mem_vir_compensated1">
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
            <blockpin signalname="XLXN_239(31:0)" name="DIA(31:0)" />
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
        <block symbolname="m2_1" name="calculatevircompensated_MUX_DO(31:0)">
            <blockpin signalname="XLXN_79(31:0)" name="D0" />
            <blockpin signalname="XLXN_78(31:0)" name="D1" />
            <blockpin signalname="mux_addr1(9)" name="S0" />
            <blockpin signalname="o_do(31:0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_29(3:0)">
            <blockpin signalname="XLXN_236" name="I" />
            <blockpin signalname="XLXN_139(3:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="calculatevircompensated_MUX_ADDR(9:0)">
            <blockpin signalname="XLXN_241(9:0)" name="D0" />
            <blockpin signalname="i_addr(9:0)" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="mux_addr1(9:0)" name="O" />
        </block>
        <block symbolname="RAMB16" name="mem_vir_compensated2">
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
            <blockpin signalname="XLXN_239(31:0)" name="DIA(31:0)" />
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
        <block symbolname="rom_switchpattern_neg" name="calculatevircompensated_rom_switchpattern_neg">
            <blockpin signalname="XLXN_212" name="pattern_in" />
            <blockpin signalname="XLXN_214(31:0)" name="pattern_out(31:0)" />
        </block>
        <block symbolname="rom_switchpattern_pos" name="calculatevircompensated_rom_switchpattern_pos">
            <blockpin signalname="XLXN_212" name="pattern_in" />
            <blockpin signalname="XLXN_215(31:0)" name="pattern_out(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="3456" y="912" name="calculatevircompensated_extracttgcparameter" orien="R0">
        </instance>
        <instance x="3488" y="1376" name="calculatevircompensated_mem_switchpattern" orien="R0">
        </instance>
        <branch name="XLXN_45(4:0)">
            <wire x2="3968" y1="4560" y2="4576" x1="3968" />
        </branch>
        <branch name="XLXN_45(14:5)">
            <wire x2="4016" y1="4480" y2="4480" x1="3936" />
            <wire x2="4016" y1="4480" y2="4528" x1="4016" />
            <wire x2="3936" y1="4528" y2="4576" x1="3936" />
            <wire x2="4016" y1="4528" y2="4528" x1="3936" />
        </branch>
        <branch name="XLXN_44(4:0)">
            <wire x2="2784" y1="4560" y2="4576" x1="2784" />
        </branch>
        <branch name="XLXN_44(14:5)">
            <wire x2="2832" y1="4480" y2="4480" x1="2752" />
            <wire x2="2832" y1="4480" y2="4528" x1="2832" />
            <wire x2="2752" y1="4528" y2="4576" x1="2752" />
            <wire x2="2832" y1="4528" y2="4528" x1="2752" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="2832" y1="4992" y2="4992" x1="2784" />
        </branch>
        <branch name="XLXN_45(14:0)">
            <wire x2="3968" y1="4672" y2="4672" x1="3936" />
            <wire x2="4016" y1="4672" y2="4672" x1="3968" />
        </branch>
        <branch name="XLXN_44(14:0)">
            <wire x2="2784" y1="4672" y2="4672" x1="2752" />
            <wire x2="2832" y1="4672" y2="4672" x1="2784" />
        </branch>
        <branch name="mux_addr1(9)">
            <wire x2="2480" y1="4576" y2="4992" x1="2480" />
            <wire x2="2560" y1="4992" y2="4992" x1="2480" />
            <wire x2="2480" y1="4992" y2="5328" x1="2480" />
            <wire x2="3248" y1="5328" y2="5328" x1="2480" />
            <wire x2="2480" y1="5328" y2="5408" x1="2480" />
            <wire x2="4624" y1="5408" y2="5408" x1="2480" />
            <wire x2="4016" y1="4992" y2="4992" x1="3248" />
            <wire x2="3248" y1="4992" y2="5328" x1="3248" />
            <wire x2="4624" y1="4928" y2="5408" x1="4624" />
        </branch>
        <branch name="XLXN_78(31:0)">
            <wire x2="4624" y1="4864" y2="4864" x1="4400" />
        </branch>
        <branch name="XLXN_79(31:0)">
            <wire x2="3280" y1="4864" y2="4864" x1="3216" />
            <wire x2="3280" y1="4864" y2="5328" x1="3280" />
            <wire x2="4464" y1="5328" y2="5328" x1="3280" />
            <wire x2="4464" y1="4800" y2="5328" x1="4464" />
            <wire x2="4624" y1="4800" y2="4800" x1="4464" />
        </branch>
        <branch name="XLXN_139(3:0)">
            <wire x2="2800" y1="5184" y2="5184" x1="2784" />
            <wire x2="2832" y1="5184" y2="5184" x1="2800" />
            <wire x2="2800" y1="5184" y2="5280" x1="2800" />
            <wire x2="3344" y1="5280" y2="5280" x1="2800" />
            <wire x2="4016" y1="5184" y2="5184" x1="3344" />
            <wire x2="3344" y1="5184" y2="5280" x1="3344" />
        </branch>
        <branch name="i_addr(9:0)">
            <wire x2="2128" y1="4448" y2="4448" x1="1952" />
        </branch>
        <branch name="mux_addr1(9:0)">
            <wire x2="2480" y1="4480" y2="4480" x1="2448" />
            <wire x2="2512" y1="4480" y2="4480" x1="2480" />
            <wire x2="2528" y1="4480" y2="4480" x1="2512" />
            <wire x2="2512" y1="4432" y2="4480" x1="2512" />
            <wire x2="2848" y1="4432" y2="4432" x1="2512" />
            <wire x2="2848" y1="4432" y2="4480" x1="2848" />
            <wire x2="3712" y1="4480" y2="4480" x1="2848" />
        </branch>
        <branch name="o_do(31:0)">
            <wire x2="4976" y1="4832" y2="4832" x1="4944" />
        </branch>
        <bustap x2="3968" y1="4672" y2="4576" x1="3968" />
        <bustap x2="3936" y1="4672" y2="4576" x1="3936" />
        <instance x="4096" y="4624" name="XLXI_7(4:0)" orien="R270" />
        <instance x="3712" y="4512" name="XLXI_8(9:0)" orien="R0" />
        <bustap x2="2784" y1="4672" y2="4576" x1="2784" />
        <bustap x2="2752" y1="4672" y2="4576" x1="2752" />
        <instance x="2912" y="4624" name="XLXI_10(4:0)" orien="R270" />
        <instance x="2528" y="4512" name="XLXI_11(9:0)" orien="R0" />
        <instance x="2560" y="5024" name="XLXI_5" orien="R0" />
        <bustap x2="2480" y1="4480" y2="4576" x1="2480" />
        <instance x="2832" y="5248" name="mem_vir_compensated1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <instance x="4624" y="4960" name="calculatevircompensated_MUX_DO(31:0)" orien="R0" />
        <instance x="2560" y="5152" name="XLXI_29(3:0)" orien="M180" />
        <instance x="2128" y="4352" name="calculatevircompensated_MUX_ADDR(9:0)" orien="M180" />
        <instance x="4016" y="5248" name="mem_vir_compensated2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <iomarker fontsize="28" x="1952" y="4448" name="i_addr(9:0)" orien="R180" />
        <iomarker fontsize="28" x="4976" y="4832" name="o_do(31:0)" orien="R0" />
        <instance x="1072" y="2176" name="calculatevircompensated_process_p0_inst" orien="R0">
        </instance>
        <instance x="3904" y="1408" name="calculatevircompensated_rom_switchpattern_neg" orien="R180">
        </instance>
        <instance x="3904" y="1568" name="calculatevircompensated_rom_switchpattern_pos" orien="R180">
        </instance>
        <branch name="XLXN_212">
            <wire x2="3920" y1="1216" y2="1216" x1="3872" />
            <wire x2="3920" y1="1216" y2="1440" x1="3920" />
            <wire x2="3920" y1="1440" y2="1600" x1="3920" />
            <wire x2="3920" y1="1440" y2="1440" x1="3904" />
            <wire x2="3920" y1="1600" y2="1600" x1="3904" />
        </branch>
        <branch name="XLXN_213(11:0)">
            <wire x2="2672" y1="1632" y2="1632" x1="1856" />
            <wire x2="2672" y1="1344" y2="1632" x1="2672" />
            <wire x2="3488" y1="1344" y2="1344" x1="2672" />
        </branch>
        <branch name="XLXN_214(31:0)">
            <wire x2="1072" y1="1632" y2="1632" x1="992" />
            <wire x2="992" y1="1632" y2="2224" x1="992" />
            <wire x2="1920" y1="2224" y2="2224" x1="992" />
            <wire x2="1920" y1="1472" y2="2224" x1="1920" />
            <wire x2="3472" y1="1472" y2="1472" x1="1920" />
            <wire x2="3472" y1="1440" y2="1472" x1="3472" />
        </branch>
        <branch name="XLXN_215(31:0)">
            <wire x2="1072" y1="1728" y2="1728" x1="1008" />
            <wire x2="1008" y1="1728" y2="2256" x1="1008" />
            <wire x2="1904" y1="2256" y2="2256" x1="1008" />
            <wire x2="1904" y1="1600" y2="2256" x1="1904" />
            <wire x2="3472" y1="1600" y2="1600" x1="1904" />
        </branch>
        <branch name="XLXN_216(31:0)">
            <wire x2="928" y1="176" y2="1536" x1="928" />
            <wire x2="1072" y1="1536" y2="1536" x1="928" />
            <wire x2="3952" y1="176" y2="176" x1="928" />
            <wire x2="3952" y1="176" y2="752" x1="3952" />
            <wire x2="3952" y1="752" y2="752" x1="3888" />
        </branch>
        <branch name="XLXN_217">
            <wire x2="912" y1="192" y2="576" x1="912" />
            <wire x2="1072" y1="576" y2="576" x1="912" />
            <wire x2="3936" y1="192" y2="192" x1="912" />
            <wire x2="3936" y1="192" y2="1008" x1="3936" />
            <wire x2="3936" y1="1008" y2="1008" x1="3888" />
        </branch>
        <branch name="XLXN_218">
            <wire x2="2656" y1="416" y2="416" x1="1856" />
            <wire x2="2656" y1="416" y2="944" x1="2656" />
            <wire x2="3456" y1="944" y2="944" x1="2656" />
        </branch>
        <branch name="i_clock">
            <wire x2="960" y1="288" y2="288" x1="848" />
            <wire x2="960" y1="288" y2="2192" x1="960" />
            <wire x2="1728" y1="2192" y2="2192" x1="960" />
            <wire x2="1728" y1="2192" y2="4288" x1="1728" />
            <wire x2="3264" y1="4288" y2="4288" x1="1728" />
            <wire x2="3264" y1="4288" y2="4400" x1="3264" />
            <wire x2="3664" y1="4400" y2="4400" x1="3264" />
            <wire x2="3664" y1="4400" y2="4800" x1="3664" />
            <wire x2="4016" y1="4800" y2="4800" x1="3664" />
            <wire x2="1072" y1="288" y2="288" x1="960" />
            <wire x2="3376" y1="160" y2="160" x1="960" />
            <wire x2="3376" y1="160" y2="816" x1="3376" />
            <wire x2="3376" y1="816" y2="1280" x1="3376" />
            <wire x2="3488" y1="1280" y2="1280" x1="3376" />
            <wire x2="3456" y1="816" y2="816" x1="3376" />
            <wire x2="960" y1="160" y2="288" x1="960" />
            <wire x2="3264" y1="4400" y2="4400" x1="2816" />
            <wire x2="2816" y1="4400" y2="4800" x1="2816" />
            <wire x2="2832" y1="4800" y2="4800" x1="2816" />
        </branch>
        <branch name="i_reset">
            <wire x2="944" y1="384" y2="384" x1="848" />
            <wire x2="944" y1="384" y2="5120" x1="944" />
            <wire x2="2784" y1="5120" y2="5120" x1="944" />
            <wire x2="2832" y1="5120" y2="5120" x1="2784" />
            <wire x2="1072" y1="384" y2="384" x1="944" />
            <wire x2="3392" y1="144" y2="144" x1="944" />
            <wire x2="3392" y1="144" y2="880" x1="3392" />
            <wire x2="3392" y1="880" y2="1216" x1="3392" />
            <wire x2="3488" y1="1216" y2="1216" x1="3392" />
            <wire x2="3456" y1="880" y2="880" x1="3392" />
            <wire x2="944" y1="144" y2="384" x1="944" />
            <wire x2="2784" y1="5104" y2="5104" x1="2496" />
            <wire x2="2784" y1="5104" y2="5120" x1="2784" />
            <wire x2="2496" y1="5104" y2="5296" x1="2496" />
            <wire x2="3232" y1="5296" y2="5296" x1="2496" />
            <wire x2="3232" y1="5120" y2="5296" x1="3232" />
            <wire x2="4016" y1="5120" y2="5120" x1="3232" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="3904" y1="944" y2="944" x1="3888" />
            <wire x2="3984" y1="944" y2="944" x1="3904" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="3904" y1="1072" y2="1072" x1="3888" />
            <wire x2="3984" y1="1072" y2="1072" x1="3904" />
        </branch>
        <branch name="o_rdy">
            <wire x2="1936" y1="352" y2="352" x1="1856" />
            <wire x2="1936" y1="352" y2="4384" x1="1936" />
            <wire x2="2128" y1="4384" y2="4384" x1="1936" />
            <wire x2="2080" y1="352" y2="352" x1="1936" />
        </branch>
        <branch name="XLXN_236">
            <wire x2="2048" y1="544" y2="544" x1="1856" />
            <wire x2="2048" y1="544" y2="5184" x1="2048" />
            <wire x2="2560" y1="5184" y2="5184" x1="2048" />
        </branch>
        <branch name="XLXN_239(31:0)">
            <wire x2="2112" y1="1568" y2="1568" x1="1856" />
            <wire x2="2112" y1="1568" y2="4864" x1="2112" />
            <wire x2="2512" y1="4864" y2="4864" x1="2112" />
            <wire x2="2832" y1="4864" y2="4864" x1="2512" />
            <wire x2="2512" y1="4864" y2="5264" x1="2512" />
            <wire x2="3408" y1="5264" y2="5264" x1="2512" />
            <wire x2="3408" y1="4864" y2="5264" x1="3408" />
            <wire x2="4016" y1="4864" y2="4864" x1="3408" />
        </branch>
        <branch name="XLXN_241(9:0)">
            <wire x2="1984" y1="1504" y2="1504" x1="1856" />
            <wire x2="1984" y1="1504" y2="4512" x1="1984" />
            <wire x2="2128" y1="4512" y2="4512" x1="1984" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="3456" y1="1008" y2="1008" x1="3312" />
        </branch>
        <iomarker fontsize="28" x="3312" y="1008" name="i2c_mem_douta(7:0)" orien="R180" />
        <branch name="i_run">
            <wire x2="1056" y1="480" y2="480" x1="848" />
            <wire x2="1072" y1="480" y2="480" x1="1056" />
        </branch>
        <branch name="divfprdy">
            <wire x2="1056" y1="672" y2="672" x1="848" />
            <wire x2="1072" y1="672" y2="672" x1="1056" />
        </branch>
        <branch name="mulfprdy">
            <wire x2="1056" y1="768" y2="768" x1="848" />
            <wire x2="1072" y1="768" y2="768" x1="1056" />
        </branch>
        <branch name="addfprdy">
            <wire x2="1056" y1="864" y2="864" x1="848" />
            <wire x2="1072" y1="864" y2="864" x1="1056" />
        </branch>
        <branch name="subfprdy">
            <wire x2="1056" y1="960" y2="960" x1="848" />
            <wire x2="1072" y1="960" y2="960" x1="1056" />
        </branch>
        <branch name="i_Emissivity(31:0)">
            <wire x2="1056" y1="1056" y2="1056" x1="848" />
            <wire x2="1072" y1="1056" y2="1056" x1="1056" />
        </branch>
        <branch name="i_pixoscpsp0(31:0)">
            <wire x2="1056" y1="1152" y2="1152" x1="848" />
            <wire x2="1072" y1="1152" y2="1152" x1="1056" />
        </branch>
        <branch name="i_pixoscpsp1(31:0)">
            <wire x2="1056" y1="1248" y2="1248" x1="848" />
            <wire x2="1072" y1="1248" y2="1248" x1="1056" />
        </branch>
        <branch name="i_pixos_do(31:0)">
            <wire x2="1056" y1="1440" y2="1440" x1="848" />
            <wire x2="1072" y1="1440" y2="1440" x1="1056" />
        </branch>
        <branch name="divfpr(31:0)">
            <wire x2="1056" y1="1824" y2="1824" x1="848" />
            <wire x2="1072" y1="1824" y2="1824" x1="1056" />
        </branch>
        <branch name="mulfpr(31:0)">
            <wire x2="1056" y1="1920" y2="1920" x1="848" />
            <wire x2="1072" y1="1920" y2="1920" x1="1056" />
        </branch>
        <branch name="addfpr(31:0)">
            <wire x2="1056" y1="2016" y2="2016" x1="848" />
            <wire x2="1072" y1="2016" y2="2016" x1="1056" />
        </branch>
        <branch name="subfpr(31:0)">
            <wire x2="1056" y1="2112" y2="2112" x1="848" />
            <wire x2="1072" y1="2112" y2="2112" x1="1056" />
        </branch>
        <branch name="divfpond">
            <wire x2="1872" y1="608" y2="608" x1="1856" />
            <wire x2="2080" y1="608" y2="608" x1="1872" />
        </branch>
        <branch name="divfpsclr">
            <wire x2="1872" y1="672" y2="672" x1="1856" />
            <wire x2="2080" y1="672" y2="672" x1="1872" />
        </branch>
        <branch name="divfpce">
            <wire x2="1872" y1="736" y2="736" x1="1856" />
            <wire x2="2080" y1="736" y2="736" x1="1872" />
        </branch>
        <branch name="mulfpond">
            <wire x2="1872" y1="800" y2="800" x1="1856" />
            <wire x2="2080" y1="800" y2="800" x1="1872" />
        </branch>
        <branch name="mulfpsclr">
            <wire x2="1872" y1="864" y2="864" x1="1856" />
            <wire x2="2080" y1="864" y2="864" x1="1872" />
        </branch>
        <branch name="mulfpce">
            <wire x2="1872" y1="928" y2="928" x1="1856" />
            <wire x2="2080" y1="928" y2="928" x1="1872" />
        </branch>
        <branch name="addfpond">
            <wire x2="1872" y1="992" y2="992" x1="1856" />
            <wire x2="2080" y1="992" y2="992" x1="1872" />
        </branch>
        <branch name="addfpsclr">
            <wire x2="1872" y1="1056" y2="1056" x1="1856" />
            <wire x2="2080" y1="1056" y2="1056" x1="1872" />
        </branch>
        <branch name="addfpce">
            <wire x2="1872" y1="1120" y2="1120" x1="1856" />
            <wire x2="2080" y1="1120" y2="1120" x1="1872" />
        </branch>
        <branch name="subfpond">
            <wire x2="1872" y1="1184" y2="1184" x1="1856" />
            <wire x2="2080" y1="1184" y2="1184" x1="1872" />
        </branch>
        <branch name="subfpsclr">
            <wire x2="1872" y1="1248" y2="1248" x1="1856" />
            <wire x2="2080" y1="1248" y2="1248" x1="1872" />
        </branch>
        <branch name="subfpce">
            <wire x2="1872" y1="1312" y2="1312" x1="1856" />
            <wire x2="2080" y1="1312" y2="1312" x1="1872" />
        </branch>
        <branch name="o_pixos_addr(9:0)">
            <wire x2="1872" y1="1440" y2="1440" x1="1856" />
            <wire x2="2080" y1="1440" y2="1440" x1="1872" />
        </branch>
        <branch name="divfpa(31:0)">
            <wire x2="1872" y1="1696" y2="1696" x1="1856" />
            <wire x2="2144" y1="1696" y2="1696" x1="1872" />
        </branch>
        <branch name="divfpb(31:0)">
            <wire x2="1872" y1="1760" y2="1760" x1="1856" />
            <wire x2="2144" y1="1760" y2="1760" x1="1872" />
        </branch>
        <branch name="mulfpa(31:0)">
            <wire x2="1872" y1="1824" y2="1824" x1="1856" />
            <wire x2="2144" y1="1824" y2="1824" x1="1872" />
        </branch>
        <branch name="mulfpb(31:0)">
            <wire x2="1872" y1="1888" y2="1888" x1="1856" />
            <wire x2="2144" y1="1888" y2="1888" x1="1872" />
        </branch>
        <branch name="addfpa(31:0)">
            <wire x2="1872" y1="1952" y2="1952" x1="1856" />
            <wire x2="2144" y1="1952" y2="1952" x1="1872" />
        </branch>
        <branch name="addfpb(31:0)">
            <wire x2="1872" y1="2016" y2="2016" x1="1856" />
            <wire x2="2144" y1="2016" y2="2016" x1="1872" />
        </branch>
        <branch name="subfpa(31:0)">
            <wire x2="1872" y1="2080" y2="2080" x1="1856" />
            <wire x2="2144" y1="2080" y2="2080" x1="1872" />
        </branch>
        <branch name="subfpb(31:0)">
            <wire x2="1872" y1="2144" y2="2144" x1="1856" />
            <wire x2="2144" y1="2144" y2="2144" x1="1872" />
        </branch>
        <iomarker fontsize="28" x="848" y="384" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="848" y="288" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="848" y="480" name="i_run" orien="R180" />
        <iomarker fontsize="28" x="848" y="672" name="divfprdy" orien="R180" />
        <iomarker fontsize="28" x="848" y="768" name="mulfprdy" orien="R180" />
        <iomarker fontsize="28" x="848" y="864" name="addfprdy" orien="R180" />
        <iomarker fontsize="28" x="848" y="960" name="subfprdy" orien="R180" />
        <iomarker fontsize="28" x="848" y="1056" name="i_Emissivity(31:0)" orien="R180" />
        <iomarker fontsize="28" x="848" y="1152" name="i_pixoscpsp0(31:0)" orien="R180" />
        <iomarker fontsize="28" x="848" y="1248" name="i_pixoscpsp1(31:0)" orien="R180" />
        <iomarker fontsize="28" x="848" y="1440" name="i_pixos_do(31:0)" orien="R180" />
        <iomarker fontsize="28" x="848" y="1824" name="divfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="848" y="1920" name="mulfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="848" y="2016" name="addfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="848" y="2112" name="subfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2080" y="352" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="2080" y="608" name="divfpond" orien="R0" />
        <iomarker fontsize="28" x="2080" y="672" name="divfpsclr" orien="R0" />
        <iomarker fontsize="28" x="2080" y="736" name="divfpce" orien="R0" />
        <iomarker fontsize="28" x="2080" y="800" name="mulfpond" orien="R0" />
        <iomarker fontsize="28" x="2080" y="864" name="mulfpsclr" orien="R0" />
        <iomarker fontsize="28" x="2080" y="928" name="mulfpce" orien="R0" />
        <iomarker fontsize="28" x="2080" y="992" name="addfpond" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1056" name="addfpsclr" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1184" name="subfpond" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1248" name="subfpsclr" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1312" name="subfpce" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1440" name="o_pixos_addr(9:0)" orien="R0" />
        <iomarker fontsize="28" x="2144" y="1696" name="divfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2144" y="1760" name="divfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2144" y="1824" name="mulfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2144" y="1888" name="mulfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2144" y="1952" name="addfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2144" y="2016" name="addfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2144" y="2080" name="subfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2144" y="2144" name="subfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1120" name="addfpce" orien="R0" />
        <iomarker fontsize="28" x="3984" y="1072" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="3984" y="944" name="i2c_mem_ena" orien="R0" />
    </sheet>
</drawing>