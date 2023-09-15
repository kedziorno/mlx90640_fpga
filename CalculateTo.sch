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
        <signal name="XLXN_239(31:0)" />
        <signal name="o_rdy" />
        <signal name="i_clock" />
        <signal name="XLXN_241(9:0)" />
        <signal name="i_reset" />
        <signal name="XLXN_269" />
        <signal name="XLXN_270" />
        <signal name="XLXN_275(7:0)" />
        <signal name="XLXN_276(31:0)" />
        <signal name="XLXN_277(31:0)" />
        <signal name="XLXN_278" />
        <signal name="XLXN_279" />
        <signal name="XLXN_280(11:0)" />
        <signal name="XLXN_281(11:0)" />
        <signal name="XLXN_282" />
        <signal name="i2c_mem_ena" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="XLXN_288" />
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
        <signal name="sqrtfp2ond" />
        <signal name="sqrtfp2sclr" />
        <signal name="sqrtfp2ce" />
        <signal name="o_vircompensated_addr(9:0)" />
        <signal name="o_alphacomp_addr(9:0)" />
        <signal name="divfpa(31:0)" />
        <signal name="divfpb(31:0)" />
        <signal name="mulfpa(31:0)" />
        <signal name="mulfpb(31:0)" />
        <signal name="addfpa(31:0)" />
        <signal name="addfpb(31:0)" />
        <signal name="subfpa(31:0)" />
        <signal name="subfpb(31:0)" />
        <signal name="sqrtfp2a(31:0)" />
        <signal name="sqrtfp2r(31:0)" />
        <signal name="subfpr(31:0)" />
        <signal name="addfpr(31:0)" />
        <signal name="mulfpr(31:0)" />
        <signal name="divfpr(31:0)" />
        <signal name="i_alphacomp_do(31:0)" />
        <signal name="i_vircompensated_do(31:0)" />
        <signal name="i_Ta(31:0)" />
        <signal name="sqrtfp2rdy" />
        <signal name="subfprdy" />
        <signal name="addfprdy" />
        <signal name="mulfprdy" />
        <signal name="divfprdy" />
        <signal name="i_run" />
        <port polarity="Input" name="i_addr(9:0)" />
        <port polarity="Output" name="o_do(31:0)" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
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
        <port polarity="Output" name="sqrtfp2ond" />
        <port polarity="Output" name="sqrtfp2sclr" />
        <port polarity="Output" name="sqrtfp2ce" />
        <port polarity="Output" name="o_vircompensated_addr(9:0)" />
        <port polarity="Output" name="o_alphacomp_addr(9:0)" />
        <port polarity="Output" name="divfpa(31:0)" />
        <port polarity="Output" name="divfpb(31:0)" />
        <port polarity="Output" name="mulfpa(31:0)" />
        <port polarity="Output" name="mulfpb(31:0)" />
        <port polarity="Output" name="addfpa(31:0)" />
        <port polarity="Output" name="addfpb(31:0)" />
        <port polarity="Output" name="subfpa(31:0)" />
        <port polarity="Output" name="subfpb(31:0)" />
        <port polarity="Output" name="sqrtfp2a(31:0)" />
        <port polarity="Input" name="sqrtfp2r(31:0)" />
        <port polarity="Input" name="subfpr(31:0)" />
        <port polarity="Input" name="addfpr(31:0)" />
        <port polarity="Input" name="mulfpr(31:0)" />
        <port polarity="Input" name="divfpr(31:0)" />
        <port polarity="Input" name="i_alphacomp_do(31:0)" />
        <port polarity="Input" name="i_vircompensated_do(31:0)" />
        <port polarity="Input" name="i_Ta(31:0)" />
        <port polarity="Input" name="sqrtfp2rdy" />
        <port polarity="Input" name="subfprdy" />
        <port polarity="Input" name="addfprdy" />
        <port polarity="Input" name="mulfprdy" />
        <port polarity="Input" name="divfprdy" />
        <port polarity="Input" name="i_run" />
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
        <blockdef name="ExtractKsToScaleParameter">
            <timestamp>2023-6-16T15:23:57</timestamp>
            <rect width="448" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="576" y1="-224" y2="-224" x1="512" />
            <line x2="576" y1="-160" y2="-160" x1="512" />
            <rect width="64" x="512" y="-108" height="24" />
            <line x2="576" y1="-96" y2="-96" x1="512" />
            <rect width="64" x="512" y="-44" height="24" />
            <line x2="576" y1="-32" y2="-32" x1="512" />
        </blockdef>
        <blockdef name="rom_signed8bit">
            <timestamp>2023-6-15T18:17:26</timestamp>
            <rect width="288" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="352" y="-172" height="24" />
            <line x2="416" y1="-160" y2="-160" x1="352" />
        </blockdef>
        <blockdef name="CalculateTo_process_p0">
            <timestamp>2023-6-16T16:3:24</timestamp>
            <rect width="784" x="64" y="-2304" height="2304" />
            <line x2="0" y1="-2272" y2="-2272" x1="64" />
            <line x2="0" y1="-2160" y2="-2160" x1="64" />
            <line x2="0" y1="-2048" y2="-2048" x1="64" />
            <line x2="0" y1="-1936" y2="-1936" x1="64" />
            <line x2="0" y1="-1824" y2="-1824" x1="64" />
            <line x2="0" y1="-1712" y2="-1712" x1="64" />
            <line x2="0" y1="-1600" y2="-1600" x1="64" />
            <line x2="0" y1="-1488" y2="-1488" x1="64" />
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <rect width="64" x="0" y="-1276" height="24" />
            <line x2="0" y1="-1264" y2="-1264" x1="64" />
            <rect width="64" x="0" y="-1164" height="24" />
            <line x2="0" y1="-1152" y2="-1152" x1="64" />
            <rect width="64" x="0" y="-1052" height="24" />
            <line x2="0" y1="-1040" y2="-1040" x1="64" />
            <rect width="64" x="0" y="-940" height="24" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-716" height="24" />
            <line x2="0" y1="-704" y2="-704" x1="64" />
            <rect width="64" x="0" y="-604" height="24" />
            <line x2="0" y1="-592" y2="-592" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-380" height="24" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <rect width="64" x="0" y="-156" height="24" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="912" y1="-2272" y2="-2272" x1="848" />
            <line x2="912" y1="-2208" y2="-2208" x1="848" />
            <line x2="912" y1="-2144" y2="-2144" x1="848" />
            <line x2="912" y1="-2080" y2="-2080" x1="848" />
            <line x2="912" y1="-2016" y2="-2016" x1="848" />
            <line x2="912" y1="-1952" y2="-1952" x1="848" />
            <line x2="912" y1="-1888" y2="-1888" x1="848" />
            <line x2="912" y1="-1824" y2="-1824" x1="848" />
            <line x2="912" y1="-1760" y2="-1760" x1="848" />
            <line x2="912" y1="-1696" y2="-1696" x1="848" />
            <line x2="912" y1="-1632" y2="-1632" x1="848" />
            <line x2="912" y1="-1568" y2="-1568" x1="848" />
            <line x2="912" y1="-1504" y2="-1504" x1="848" />
            <line x2="912" y1="-1440" y2="-1440" x1="848" />
            <line x2="912" y1="-1376" y2="-1376" x1="848" />
            <line x2="912" y1="-1312" y2="-1312" x1="848" />
            <line x2="912" y1="-1248" y2="-1248" x1="848" />
            <line x2="912" y1="-1184" y2="-1184" x1="848" />
            <line x2="912" y1="-1120" y2="-1120" x1="848" />
            <line x2="912" y1="-1056" y2="-1056" x1="848" />
            <rect width="64" x="848" y="-1004" height="24" />
            <line x2="912" y1="-992" y2="-992" x1="848" />
            <rect width="64" x="848" y="-940" height="24" />
            <line x2="912" y1="-928" y2="-928" x1="848" />
            <rect width="64" x="848" y="-876" height="24" />
            <line x2="912" y1="-864" y2="-864" x1="848" />
            <rect width="64" x="848" y="-748" height="24" />
            <line x2="912" y1="-736" y2="-736" x1="848" />
            <rect width="64" x="848" y="-684" height="24" />
            <line x2="912" y1="-672" y2="-672" x1="848" />
            <rect width="64" x="848" y="-620" height="24" />
            <line x2="912" y1="-608" y2="-608" x1="848" />
            <rect width="64" x="848" y="-556" height="24" />
            <line x2="912" y1="-544" y2="-544" x1="848" />
            <rect width="64" x="848" y="-492" height="24" />
            <line x2="912" y1="-480" y2="-480" x1="848" />
            <rect width="64" x="848" y="-428" height="24" />
            <line x2="912" y1="-416" y2="-416" x1="848" />
            <rect width="64" x="848" y="-364" height="24" />
            <line x2="912" y1="-352" y2="-352" x1="848" />
            <rect width="64" x="848" y="-300" height="24" />
            <line x2="912" y1="-288" y2="-288" x1="848" />
            <rect width="64" x="848" y="-236" height="24" />
            <line x2="912" y1="-224" y2="-224" x1="848" />
            <rect width="64" x="848" y="-172" height="24" />
            <line x2="912" y1="-160" y2="-160" x1="848" />
            <rect width="64" x="848" y="-108" height="24" />
            <line x2="912" y1="-96" y2="-96" x1="848" />
            <rect width="64" x="848" y="-44" height="24" />
            <line x2="912" y1="-32" y2="-32" x1="848" />
        </blockdef>
        <block symbolname="CalculateTo_process_p0" name="CalculateTo_process_p0_inst">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="XLXN_269" name="ExtractKsToScaleParameter_rdy" />
            <blockpin signalname="divfprdy" name="divfprdy" />
            <blockpin signalname="mulfprdy" name="mulfprdy" />
            <blockpin signalname="addfprdy" name="addfprdy" />
            <blockpin signalname="subfprdy" name="subfprdy" />
            <blockpin signalname="sqrtfp2rdy" name="sqrtfp2rdy" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="i_Ta(31:0)" name="i_Ta(31:0)" />
            <blockpin signalname="i_vircompensated_do(31:0)" name="i_vircompensated_do(31:0)" />
            <blockpin signalname="i_alphacomp_do(31:0)" name="i_alphacomp_do(31:0)" />
            <blockpin signalname="XLXN_277(31:0)" name="ExtractKsToScaleParameter_kstoscale(31:0)" />
            <blockpin signalname="XLXN_276(31:0)" name="mem_signed256_ovalue(31:0)" />
            <blockpin signalname="divfpr(31:0)" name="divfpr(31:0)" />
            <blockpin signalname="mulfpr(31:0)" name="mulfpr(31:0)" />
            <blockpin signalname="addfpr(31:0)" name="addfpr(31:0)" />
            <blockpin signalname="subfpr(31:0)" name="subfpr(31:0)" />
            <blockpin signalname="sqrtfp2r(31:0)" name="sqrtfp2r(31:0)" />
            <blockpin signalname="XLXN_279" name="i2c_mem_ena" />
            <blockpin signalname="XLXN_288" name="o_write_enable" />
            <blockpin signalname="XLXN_270" name="ExtractKsToScaleParameter_run" />
            <blockpin signalname="XLXN_282" name="ExtractKsToScaleParameter_mux" />
            <blockpin signalname="o_rdy" name="o_rdy" />
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
            <blockpin signalname="sqrtfp2ond" name="sqrtfp2ond" />
            <blockpin signalname="sqrtfp2sclr" name="sqrtfp2sclr" />
            <blockpin signalname="sqrtfp2ce" name="sqrtfp2ce" />
            <blockpin signalname="XLXN_281(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="o_vircompensated_addr(9:0)" name="o_vircompensated_addr(9:0)" />
            <blockpin signalname="o_alphacomp_addr(9:0)" name="o_alphacomp_addr(9:0)" />
            <blockpin signalname="XLXN_241(9:0)" name="o_addra(9:0)" />
            <blockpin signalname="XLXN_239(31:0)" name="o_dia(31:0)" />
            <blockpin signalname="XLXN_275(7:0)" name="mem_signed256_ivalue(7:0)" />
            <blockpin signalname="divfpa(31:0)" name="divfpa(31:0)" />
            <blockpin signalname="divfpb(31:0)" name="divfpb(31:0)" />
            <blockpin signalname="mulfpa(31:0)" name="mulfpa(31:0)" />
            <blockpin signalname="mulfpb(31:0)" name="mulfpb(31:0)" />
            <blockpin signalname="addfpa(31:0)" name="addfpa(31:0)" />
            <blockpin signalname="addfpb(31:0)" name="addfpb(31:0)" />
            <blockpin signalname="subfpa(31:0)" name="subfpa(31:0)" />
            <blockpin signalname="subfpb(31:0)" name="subfpb(31:0)" />
            <blockpin signalname="sqrtfp2a(31:0)" name="sqrtfp2a(31:0)" />
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
        <block symbolname="RAMB16" name="mem_To_1">
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
        <block symbolname="m2_1" name="CalculateTo_MUX_DO(31:0)">
            <blockpin signalname="XLXN_79(31:0)" name="D0" />
            <blockpin signalname="XLXN_78(31:0)" name="D1" />
            <blockpin signalname="mux_addr1(9)" name="S0" />
            <blockpin signalname="o_do(31:0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_29(3:0)">
            <blockpin signalname="XLXN_288" name="I" />
            <blockpin signalname="XLXN_139(3:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="CalculateTo_MUX_ADDR(9:0)">
            <blockpin signalname="XLXN_241(9:0)" name="D0" />
            <blockpin signalname="i_addr(9:0)" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="mux_addr1(9:0)" name="O" />
        </block>
        <block symbolname="RAMB16" name="mem_To_2">
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
        <block symbolname="ExtractKsToScaleParameter" name="CalculateTo_extractkstoscaleparameter">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_270" name="i_run" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_278" name="i2c_mem_ena" />
            <blockpin signalname="XLXN_269" name="o_rdy" />
            <blockpin signalname="XLXN_280(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="XLXN_277(31:0)" name="o_kstoscale(31:0)" />
        </block>
        <block symbolname="rom_signed8bit" name="CalculateTo_rom_signed8bit">
            <blockpin signalname="XLXN_275(7:0)" name="i_value(7:0)" />
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="XLXN_276(31:0)" name="o_value(31:0)" />
        </block>
        <block symbolname="m2_1" name="CalculateTo_MUX_i2c_mem_ena">
            <blockpin signalname="XLXN_279" name="D0" />
            <blockpin signalname="XLXN_278" name="D1" />
            <blockpin signalname="XLXN_282" name="S0" />
            <blockpin signalname="i2c_mem_ena" name="O" />
        </block>
        <block symbolname="m2_1" name="CalculateTo_MUX_i2c_mem_addra(11:0)">
            <blockpin signalname="XLXN_281(11:0)" name="D0" />
            <blockpin signalname="XLXN_280(11:0)" name="D1" />
            <blockpin signalname="XLXN_282" name="S0" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="XLXN_45(4:0)">
            <wire x2="4112" y1="4512" y2="4528" x1="4112" />
        </branch>
        <branch name="XLXN_45(14:5)">
            <wire x2="4160" y1="4432" y2="4432" x1="4080" />
            <wire x2="4160" y1="4432" y2="4480" x1="4160" />
            <wire x2="4080" y1="4480" y2="4528" x1="4080" />
            <wire x2="4160" y1="4480" y2="4480" x1="4080" />
        </branch>
        <branch name="XLXN_44(4:0)">
            <wire x2="2928" y1="4512" y2="4528" x1="2928" />
        </branch>
        <branch name="XLXN_44(14:5)">
            <wire x2="2976" y1="4432" y2="4432" x1="2896" />
            <wire x2="2976" y1="4432" y2="4480" x1="2976" />
            <wire x2="2896" y1="4480" y2="4528" x1="2896" />
            <wire x2="2976" y1="4480" y2="4480" x1="2896" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="2976" y1="4944" y2="4944" x1="2928" />
        </branch>
        <branch name="XLXN_45(14:0)">
            <wire x2="4112" y1="4624" y2="4624" x1="4080" />
            <wire x2="4160" y1="4624" y2="4624" x1="4112" />
        </branch>
        <branch name="XLXN_44(14:0)">
            <wire x2="2928" y1="4624" y2="4624" x1="2896" />
            <wire x2="2976" y1="4624" y2="4624" x1="2928" />
        </branch>
        <branch name="mux_addr1(9)">
            <wire x2="2624" y1="4528" y2="4944" x1="2624" />
            <wire x2="2704" y1="4944" y2="4944" x1="2624" />
            <wire x2="2624" y1="4944" y2="5280" x1="2624" />
            <wire x2="3456" y1="5280" y2="5280" x1="2624" />
            <wire x2="2624" y1="5280" y2="5312" x1="2624" />
            <wire x2="4768" y1="5312" y2="5312" x1="2624" />
            <wire x2="4160" y1="4944" y2="4944" x1="3456" />
            <wire x2="3456" y1="4944" y2="5280" x1="3456" />
            <wire x2="4768" y1="4880" y2="5312" x1="4768" />
        </branch>
        <branch name="XLXN_78(31:0)">
            <wire x2="4768" y1="4816" y2="4816" x1="4544" />
        </branch>
        <branch name="XLXN_79(31:0)">
            <wire x2="3504" y1="4816" y2="4816" x1="3360" />
            <wire x2="3504" y1="4816" y2="5280" x1="3504" />
            <wire x2="4608" y1="5280" y2="5280" x1="3504" />
            <wire x2="4608" y1="4752" y2="5280" x1="4608" />
            <wire x2="4768" y1="4752" y2="4752" x1="4608" />
        </branch>
        <branch name="XLXN_139(3:0)">
            <wire x2="2944" y1="5136" y2="5136" x1="2928" />
            <wire x2="2976" y1="5136" y2="5136" x1="2944" />
            <wire x2="2944" y1="5136" y2="5232" x1="2944" />
            <wire x2="3600" y1="5232" y2="5232" x1="2944" />
            <wire x2="4160" y1="5136" y2="5136" x1="3600" />
            <wire x2="3600" y1="5136" y2="5232" x1="3600" />
        </branch>
        <branch name="i_addr(9:0)">
            <wire x2="2272" y1="4400" y2="4400" x1="2096" />
        </branch>
        <branch name="mux_addr1(9:0)">
            <wire x2="2624" y1="4432" y2="4432" x1="2592" />
            <wire x2="2656" y1="4432" y2="4432" x1="2624" />
            <wire x2="2672" y1="4432" y2="4432" x1="2656" />
            <wire x2="2656" y1="4384" y2="4432" x1="2656" />
            <wire x2="2992" y1="4384" y2="4384" x1="2656" />
            <wire x2="2992" y1="4384" y2="4432" x1="2992" />
            <wire x2="3856" y1="4432" y2="4432" x1="2992" />
        </branch>
        <branch name="o_do(31:0)">
            <wire x2="5120" y1="4784" y2="4784" x1="5088" />
        </branch>
        <branch name="o_rdy">
            <wire x2="2176" y1="512" y2="512" x1="1616" />
            <wire x2="2176" y1="512" y2="4336" x1="2176" />
            <wire x2="2272" y1="4336" y2="4336" x1="2176" />
            <wire x2="2208" y1="512" y2="512" x1="2176" />
        </branch>
        <branch name="i_reset">
            <wire x2="608" y1="368" y2="368" x1="448" />
            <wire x2="704" y1="368" y2="368" x1="608" />
            <wire x2="2176" y1="144" y2="144" x1="608" />
            <wire x2="2176" y1="144" y2="320" x1="2176" />
            <wire x2="2640" y1="320" y2="320" x1="2176" />
            <wire x2="2640" y1="320" y2="544" x1="2640" />
            <wire x2="2784" y1="544" y2="544" x1="2640" />
            <wire x2="2704" y1="320" y2="320" x1="2640" />
            <wire x2="608" y1="144" y2="368" x1="608" />
            <wire x2="2176" y1="320" y2="320" x1="2144" />
            <wire x2="2144" y1="320" y2="800" x1="2144" />
            <wire x2="3632" y1="800" y2="800" x1="2144" />
            <wire x2="3632" y1="800" y2="5072" x1="3632" />
            <wire x2="4160" y1="5072" y2="5072" x1="3632" />
            <wire x2="3632" y1="5072" y2="5248" x1="3632" />
            <wire x2="2640" y1="5072" y2="5248" x1="2640" />
            <wire x2="3632" y1="5248" y2="5248" x1="2640" />
            <wire x2="2976" y1="5072" y2="5072" x1="2640" />
        </branch>
        <bustap x2="4112" y1="4624" y2="4528" x1="4112" />
        <bustap x2="4080" y1="4624" y2="4528" x1="4080" />
        <instance x="4240" y="4576" name="XLXI_7(4:0)" orien="R270" />
        <instance x="3856" y="4464" name="XLXI_8(9:0)" orien="R0" />
        <bustap x2="2928" y1="4624" y2="4528" x1="2928" />
        <bustap x2="2896" y1="4624" y2="4528" x1="2896" />
        <instance x="3056" y="4576" name="XLXI_10(4:0)" orien="R270" />
        <instance x="2672" y="4464" name="XLXI_11(9:0)" orien="R0" />
        <instance x="2704" y="4976" name="XLXI_5" orien="R0" />
        <bustap x2="2624" y1="4432" y2="4528" x1="2624" />
        <instance x="2976" y="5200" name="mem_To_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <instance x="4768" y="4912" name="CalculateTo_MUX_DO(31:0)" orien="R0" />
        <instance x="2704" y="5104" name="XLXI_29(3:0)" orien="M180" />
        <instance x="2272" y="4304" name="CalculateTo_MUX_ADDR(9:0)" orien="M180" />
        <instance x="4160" y="5200" name="mem_To_2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <iomarker fontsize="28" x="2096" y="4400" name="i_addr(9:0)" orien="R180" />
        <iomarker fontsize="28" x="5120" y="4784" name="o_do(31:0)" orien="R0" />
        <instance x="704" y="2528" name="CalculateTo_process_p0_inst" orien="R0">
        </instance>
        <instance x="2704" y="480" name="CalculateTo_extractkstoscaleparameter" orien="R0">
        </instance>
        <instance x="2784" y="512" name="CalculateTo_rom_signed8bit" orien="M180">
        </instance>
        <branch name="XLXN_269">
            <wire x2="3344" y1="128" y2="128" x1="576" />
            <wire x2="3344" y1="128" y2="320" x1="3344" />
            <wire x2="576" y1="128" y2="592" x1="576" />
            <wire x2="704" y1="592" y2="592" x1="576" />
            <wire x2="3344" y1="320" y2="320" x1="3280" />
        </branch>
        <branch name="XLXN_270">
            <wire x2="2704" y1="384" y2="384" x1="1616" />
        </branch>
        <branch name="XLXN_275(7:0)">
            <wire x2="2192" y1="1920" y2="1920" x1="1616" />
            <wire x2="2192" y1="672" y2="1920" x1="2192" />
            <wire x2="2784" y1="672" y2="672" x1="2192" />
        </branch>
        <branch name="XLXN_276(31:0)">
            <wire x2="544" y1="112" y2="1936" x1="544" />
            <wire x2="704" y1="1936" y2="1936" x1="544" />
            <wire x2="3360" y1="112" y2="112" x1="544" />
            <wire x2="3360" y1="112" y2="672" x1="3360" />
            <wire x2="3360" y1="672" y2="672" x1="3200" />
        </branch>
        <branch name="XLXN_277(31:0)">
            <wire x2="512" y1="96" y2="1824" x1="512" />
            <wire x2="704" y1="1824" y2="1824" x1="512" />
            <wire x2="3376" y1="96" y2="96" x1="512" />
            <wire x2="3376" y1="96" y2="448" x1="3376" />
            <wire x2="3376" y1="448" y2="448" x1="3280" />
        </branch>
        <instance x="3584" y="160" name="CalculateTo_MUX_i2c_mem_ena" orien="M180" />
        <branch name="XLXN_278">
            <wire x2="3584" y1="256" y2="256" x1="3280" />
        </branch>
        <branch name="XLXN_279">
            <wire x2="1680" y1="256" y2="256" x1="1616" />
            <wire x2="3392" y1="80" y2="80" x1="1680" />
            <wire x2="3392" y1="80" y2="320" x1="3392" />
            <wire x2="3584" y1="320" y2="320" x1="3392" />
            <wire x2="1680" y1="80" y2="256" x1="1680" />
        </branch>
        <instance x="3584" y="416" name="CalculateTo_MUX_i2c_mem_addra(11:0)" orien="M180" />
        <branch name="XLXN_280(11:0)">
            <wire x2="3392" y1="384" y2="384" x1="3280" />
            <wire x2="3392" y1="384" y2="512" x1="3392" />
            <wire x2="3584" y1="512" y2="512" x1="3392" />
        </branch>
        <branch name="XLXN_281(11:0)">
            <wire x2="3392" y1="1536" y2="1536" x1="1616" />
            <wire x2="3584" y1="576" y2="576" x1="3392" />
            <wire x2="3392" y1="576" y2="1536" x1="3392" />
        </branch>
        <branch name="XLXN_282">
            <wire x2="1664" y1="448" y2="448" x1="1616" />
            <wire x2="1664" y1="64" y2="448" x1="1664" />
            <wire x2="3568" y1="64" y2="64" x1="1664" />
            <wire x2="3568" y1="64" y2="192" x1="3568" />
            <wire x2="3584" y1="192" y2="192" x1="3568" />
            <wire x2="3568" y1="192" y2="448" x1="3568" />
            <wire x2="3584" y1="448" y2="448" x1="3568" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="3936" y1="288" y2="288" x1="3904" />
        </branch>
        <iomarker fontsize="28" x="3936" y="288" name="i2c_mem_ena" orien="R0" />
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="3936" y1="544" y2="544" x1="3904" />
        </branch>
        <iomarker fontsize="28" x="3936" y="544" name="i2c_mem_addra(11:0)" orien="R0" />
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="480" y1="1264" y2="1264" x1="448" />
            <wire x2="704" y1="1264" y2="1264" x1="480" />
            <wire x2="480" y1="48" y2="1264" x1="480" />
            <wire x2="2192" y1="48" y2="48" x1="480" />
            <wire x2="2192" y1="48" y2="448" x1="2192" />
            <wire x2="2704" y1="448" y2="448" x1="2192" />
        </branch>
        <branch name="XLXN_241(9:0)">
            <wire x2="2160" y1="1792" y2="1792" x1="1616" />
            <wire x2="2160" y1="1792" y2="4464" x1="2160" />
            <wire x2="2272" y1="4464" y2="4464" x1="2160" />
        </branch>
        <branch name="XLXN_239(31:0)">
            <wire x2="2208" y1="1856" y2="1856" x1="1616" />
            <wire x2="2208" y1="1856" y2="4816" x1="2208" />
            <wire x2="2656" y1="4816" y2="4816" x1="2208" />
            <wire x2="2976" y1="4816" y2="4816" x1="2656" />
            <wire x2="2656" y1="4816" y2="5216" x1="2656" />
            <wire x2="3552" y1="5216" y2="5216" x1="2656" />
            <wire x2="4160" y1="4816" y2="4816" x1="3552" />
            <wire x2="3552" y1="4816" y2="5216" x1="3552" />
        </branch>
        <branch name="i_clock">
            <wire x2="640" y1="256" y2="256" x1="448" />
            <wire x2="704" y1="256" y2="256" x1="640" />
            <wire x2="2160" y1="160" y2="160" x1="640" />
            <wire x2="2160" y1="160" y2="240" x1="2160" />
            <wire x2="2160" y1="240" y2="256" x1="2160" />
            <wire x2="2624" y1="256" y2="256" x1="2160" />
            <wire x2="2624" y1="256" y2="608" x1="2624" />
            <wire x2="2784" y1="608" y2="608" x1="2624" />
            <wire x2="2704" y1="256" y2="256" x1="2624" />
            <wire x2="2288" y1="240" y2="240" x1="2160" />
            <wire x2="2288" y1="240" y2="4256" x1="2288" />
            <wire x2="3408" y1="4256" y2="4256" x1="2288" />
            <wire x2="3408" y1="4256" y2="4352" x1="3408" />
            <wire x2="3808" y1="4352" y2="4352" x1="3408" />
            <wire x2="3808" y1="4352" y2="4752" x1="3808" />
            <wire x2="4160" y1="4752" y2="4752" x1="3808" />
            <wire x2="640" y1="160" y2="256" x1="640" />
            <wire x2="2960" y1="4352" y2="4752" x1="2960" />
            <wire x2="2976" y1="4752" y2="4752" x1="2960" />
            <wire x2="3408" y1="4352" y2="4352" x1="2960" />
        </branch>
        <branch name="XLXN_288">
            <wire x2="1680" y1="320" y2="320" x1="1616" />
            <wire x2="1680" y1="320" y2="1936" x1="1680" />
            <wire x2="2192" y1="1936" y2="1936" x1="1680" />
            <wire x2="2192" y1="1936" y2="5136" x1="2192" />
            <wire x2="2704" y1="5136" y2="5136" x1="2192" />
        </branch>
        <iomarker fontsize="28" x="2208" y="512" name="o_rdy" orien="R0" />
        <branch name="divfpond">
            <wire x2="1632" y1="576" y2="576" x1="1616" />
            <wire x2="1712" y1="576" y2="576" x1="1632" />
        </branch>
        <branch name="divfpsclr">
            <wire x2="1632" y1="640" y2="640" x1="1616" />
            <wire x2="1712" y1="640" y2="640" x1="1632" />
        </branch>
        <branch name="divfpce">
            <wire x2="1632" y1="704" y2="704" x1="1616" />
            <wire x2="1712" y1="704" y2="704" x1="1632" />
        </branch>
        <branch name="mulfpond">
            <wire x2="1632" y1="768" y2="768" x1="1616" />
            <wire x2="1712" y1="768" y2="768" x1="1632" />
        </branch>
        <branch name="mulfpsclr">
            <wire x2="1632" y1="832" y2="832" x1="1616" />
            <wire x2="1712" y1="832" y2="832" x1="1632" />
        </branch>
        <branch name="mulfpce">
            <wire x2="1632" y1="896" y2="896" x1="1616" />
            <wire x2="1712" y1="896" y2="896" x1="1632" />
        </branch>
        <branch name="addfpond">
            <wire x2="1632" y1="960" y2="960" x1="1616" />
            <wire x2="1712" y1="960" y2="960" x1="1632" />
        </branch>
        <branch name="addfpsclr">
            <wire x2="1632" y1="1024" y2="1024" x1="1616" />
            <wire x2="1712" y1="1024" y2="1024" x1="1632" />
        </branch>
        <branch name="addfpce">
            <wire x2="1632" y1="1088" y2="1088" x1="1616" />
            <wire x2="1712" y1="1088" y2="1088" x1="1632" />
        </branch>
        <branch name="subfpond">
            <wire x2="1632" y1="1152" y2="1152" x1="1616" />
            <wire x2="1712" y1="1152" y2="1152" x1="1632" />
        </branch>
        <branch name="subfpsclr">
            <wire x2="1632" y1="1216" y2="1216" x1="1616" />
            <wire x2="1712" y1="1216" y2="1216" x1="1632" />
        </branch>
        <branch name="subfpce">
            <wire x2="1632" y1="1280" y2="1280" x1="1616" />
            <wire x2="1712" y1="1280" y2="1280" x1="1632" />
        </branch>
        <branch name="sqrtfp2ond">
            <wire x2="1632" y1="1344" y2="1344" x1="1616" />
            <wire x2="1712" y1="1344" y2="1344" x1="1632" />
        </branch>
        <branch name="sqrtfp2sclr">
            <wire x2="1632" y1="1408" y2="1408" x1="1616" />
            <wire x2="1712" y1="1408" y2="1408" x1="1632" />
        </branch>
        <branch name="sqrtfp2ce">
            <wire x2="1632" y1="1472" y2="1472" x1="1616" />
            <wire x2="1712" y1="1472" y2="1472" x1="1632" />
        </branch>
        <branch name="o_vircompensated_addr(9:0)">
            <wire x2="1632" y1="1600" y2="1600" x1="1616" />
            <wire x2="1712" y1="1600" y2="1600" x1="1632" />
        </branch>
        <branch name="o_alphacomp_addr(9:0)">
            <wire x2="1632" y1="1664" y2="1664" x1="1616" />
            <wire x2="1712" y1="1664" y2="1664" x1="1632" />
        </branch>
        <branch name="divfpa(31:0)">
            <wire x2="1632" y1="1984" y2="1984" x1="1616" />
            <wire x2="1712" y1="1984" y2="1984" x1="1632" />
        </branch>
        <branch name="divfpb(31:0)">
            <wire x2="1632" y1="2048" y2="2048" x1="1616" />
            <wire x2="1712" y1="2048" y2="2048" x1="1632" />
        </branch>
        <branch name="mulfpa(31:0)">
            <wire x2="1632" y1="2112" y2="2112" x1="1616" />
            <wire x2="1712" y1="2112" y2="2112" x1="1632" />
        </branch>
        <branch name="mulfpb(31:0)">
            <wire x2="1632" y1="2176" y2="2176" x1="1616" />
            <wire x2="1712" y1="2176" y2="2176" x1="1632" />
        </branch>
        <branch name="addfpa(31:0)">
            <wire x2="1632" y1="2240" y2="2240" x1="1616" />
            <wire x2="1712" y1="2240" y2="2240" x1="1632" />
        </branch>
        <branch name="addfpb(31:0)">
            <wire x2="1632" y1="2304" y2="2304" x1="1616" />
            <wire x2="1712" y1="2304" y2="2304" x1="1632" />
        </branch>
        <branch name="subfpa(31:0)">
            <wire x2="1632" y1="2368" y2="2368" x1="1616" />
            <wire x2="1712" y1="2368" y2="2368" x1="1632" />
        </branch>
        <branch name="subfpb(31:0)">
            <wire x2="1632" y1="2432" y2="2432" x1="1616" />
            <wire x2="1712" y1="2432" y2="2432" x1="1632" />
        </branch>
        <branch name="sqrtfp2a(31:0)">
            <wire x2="1632" y1="2496" y2="2496" x1="1616" />
            <wire x2="1712" y1="2496" y2="2496" x1="1632" />
        </branch>
        <branch name="sqrtfp2r(31:0)">
            <wire x2="688" y1="2496" y2="2496" x1="448" />
            <wire x2="704" y1="2496" y2="2496" x1="688" />
        </branch>
        <branch name="subfpr(31:0)">
            <wire x2="688" y1="2384" y2="2384" x1="448" />
            <wire x2="704" y1="2384" y2="2384" x1="688" />
        </branch>
        <branch name="addfpr(31:0)">
            <wire x2="688" y1="2272" y2="2272" x1="448" />
            <wire x2="704" y1="2272" y2="2272" x1="688" />
        </branch>
        <branch name="mulfpr(31:0)">
            <wire x2="688" y1="2160" y2="2160" x1="448" />
            <wire x2="704" y1="2160" y2="2160" x1="688" />
        </branch>
        <branch name="divfpr(31:0)">
            <wire x2="688" y1="2048" y2="2048" x1="448" />
            <wire x2="704" y1="2048" y2="2048" x1="688" />
        </branch>
        <branch name="i_alphacomp_do(31:0)">
            <wire x2="688" y1="1600" y2="1600" x1="448" />
            <wire x2="704" y1="1600" y2="1600" x1="688" />
        </branch>
        <branch name="i_vircompensated_do(31:0)">
            <wire x2="688" y1="1488" y2="1488" x1="448" />
            <wire x2="704" y1="1488" y2="1488" x1="688" />
        </branch>
        <branch name="i_Ta(31:0)">
            <wire x2="688" y1="1376" y2="1376" x1="448" />
            <wire x2="704" y1="1376" y2="1376" x1="688" />
        </branch>
        <branch name="sqrtfp2rdy">
            <wire x2="688" y1="1152" y2="1152" x1="448" />
            <wire x2="704" y1="1152" y2="1152" x1="688" />
        </branch>
        <branch name="subfprdy">
            <wire x2="688" y1="1040" y2="1040" x1="448" />
            <wire x2="704" y1="1040" y2="1040" x1="688" />
        </branch>
        <branch name="addfprdy">
            <wire x2="688" y1="928" y2="928" x1="448" />
            <wire x2="704" y1="928" y2="928" x1="688" />
        </branch>
        <branch name="mulfprdy">
            <wire x2="688" y1="816" y2="816" x1="448" />
            <wire x2="704" y1="816" y2="816" x1="688" />
        </branch>
        <branch name="divfprdy">
            <wire x2="688" y1="704" y2="704" x1="448" />
            <wire x2="704" y1="704" y2="704" x1="688" />
        </branch>
        <branch name="i_run">
            <wire x2="688" y1="480" y2="480" x1="448" />
            <wire x2="704" y1="480" y2="480" x1="688" />
        </branch>
        <iomarker fontsize="28" x="448" y="256" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="448" y="368" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="448" y="480" name="i_run" orien="R180" />
        <iomarker fontsize="28" x="448" y="704" name="divfprdy" orien="R180" />
        <iomarker fontsize="28" x="448" y="816" name="mulfprdy" orien="R180" />
        <iomarker fontsize="28" x="448" y="928" name="addfprdy" orien="R180" />
        <iomarker fontsize="28" x="448" y="1040" name="subfprdy" orien="R180" />
        <iomarker fontsize="28" x="448" y="1152" name="sqrtfp2rdy" orien="R180" />
        <iomarker fontsize="28" x="448" y="1376" name="i_Ta(31:0)" orien="R180" />
        <iomarker fontsize="28" x="448" y="1488" name="i_vircompensated_do(31:0)" orien="R180" />
        <iomarker fontsize="28" x="448" y="1600" name="i_alphacomp_do(31:0)" orien="R180" />
        <iomarker fontsize="28" x="448" y="2048" name="divfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="448" y="2160" name="mulfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="448" y="2272" name="addfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="448" y="2384" name="subfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="448" y="2496" name="sqrtfp2r(31:0)" orien="R180" />
        <iomarker fontsize="28" x="1712" y="576" name="divfpond" orien="R0" />
        <iomarker fontsize="28" x="1712" y="640" name="divfpsclr" orien="R0" />
        <iomarker fontsize="28" x="1712" y="704" name="divfpce" orien="R0" />
        <iomarker fontsize="28" x="1712" y="768" name="mulfpond" orien="R0" />
        <iomarker fontsize="28" x="1712" y="832" name="mulfpsclr" orien="R0" />
        <iomarker fontsize="28" x="1712" y="896" name="mulfpce" orien="R0" />
        <iomarker fontsize="28" x="1712" y="960" name="addfpond" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1024" name="addfpsclr" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1088" name="addfpce" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1152" name="subfpond" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1216" name="subfpsclr" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1280" name="subfpce" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1344" name="sqrtfp2ond" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1408" name="sqrtfp2sclr" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1472" name="sqrtfp2ce" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1600" name="o_vircompensated_addr(9:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1664" name="o_alphacomp_addr(9:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1984" name="divfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="2048" name="divfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="2112" name="mulfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="2176" name="mulfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="2240" name="addfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="2304" name="addfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="2368" name="subfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="2432" name="subfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="2496" name="sqrtfp2a(31:0)" orien="R0" />
        <iomarker fontsize="28" x="448" y="1264" name="i2c_mem_douta(7:0)" orien="R180" />
    </sheet>
</drawing>