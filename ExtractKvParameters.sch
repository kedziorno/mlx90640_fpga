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
        <signal name="XLXN_186" />
        <signal name="XLXN_187" />
        <signal name="XLXN_189(0:4)" />
        <signal name="XLXN_188(0:4)" />
        <signal name="XLXN_194(3:0)" />
        <signal name="XLXN_195(3:0)" />
        <signal name="XLXN_200(31:0)" />
        <signal name="XLXN_201(31:0)" />
        <signal name="XLXN_202(3:0)" />
        <signal name="XLXN_203(3:0)" />
        <signal name="XLXN_205(3:0)" />
        <signal name="XLXN_204(3:0)" />
        <signal name="XLXN_209(3:0)" />
        <signal name="XLXN_210(9:0)" />
        <signal name="XLXN_211(31:0)" />
        <signal name="i_reset" />
        <signal name="i_clock" />
        <signal name="o_rdy" />
        <signal name="XLXN_216" />
        <signal name="i2c_mem_ena" />
        <signal name="divfpond" />
        <signal name="divfpsclr" />
        <signal name="divfpce" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="divfpa(31:0)" />
        <signal name="divfpb(31:0)" />
        <signal name="i_run" />
        <signal name="divfprdy" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="divfpr(31:0)" />
        <port polarity="Input" name="i_addr(9:0)" />
        <port polarity="Output" name="o_do(31:0)" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="divfpond" />
        <port polarity="Output" name="divfpsclr" />
        <port polarity="Output" name="divfpce" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="divfpa(31:0)" />
        <port polarity="Output" name="divfpb(31:0)" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="divfprdy" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Input" name="divfpr(31:0)" />
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
        <blockdef name="ExtractKvParameters_process_p0">
            <timestamp>2023-6-14T13:35:0</timestamp>
            <rect width="448" x="64" y="-1216" height="1216" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <line x2="0" y1="-1040" y2="-1040" x1="64" />
            <line x2="0" y1="-896" y2="-896" x1="64" />
            <line x2="0" y1="-752" y2="-752" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-476" height="24" />
            <line x2="0" y1="-464" y2="-464" x1="64" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <rect width="64" x="0" y="-188" height="24" />
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="576" y1="-1184" y2="-1184" x1="512" />
            <line x2="576" y1="-1120" y2="-1120" x1="512" />
            <line x2="576" y1="-1056" y2="-1056" x1="512" />
            <line x2="576" y1="-992" y2="-992" x1="512" />
            <line x2="576" y1="-928" y2="-928" x1="512" />
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
        <blockdef name="rom_unsigned4bit_2powx">
            <timestamp>2023-6-12T10:56:49</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="rom_signed4bit">
            <timestamp>2023-6-12T10:59:34</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="colrow_even">
            <timestamp>2023-6-14T12:3:46</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="ExtractKvParameters_process_p1">
            <timestamp>2023-6-14T13:46:33</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
        </blockdef>
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
        <block symbolname="RAMB16" name="mem_extrkvparam_1">
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
            <blockpin signalname="XLXN_211(31:0)" name="DIA(31:0)" />
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
        <block symbolname="m2_1" name="extractkvparameters_MUX_DO(31:0)">
            <blockpin signalname="XLXN_79(31:0)" name="D0" />
            <blockpin signalname="XLXN_78(31:0)" name="D1" />
            <blockpin signalname="mux_addr1(9)" name="S0" />
            <blockpin signalname="o_do(31:0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_29(3:0)">
            <blockpin signalname="XLXN_216" name="I" />
            <blockpin signalname="XLXN_139(3:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="extractkvparameters_MUX_ADDR(9:0)">
            <blockpin signalname="XLXN_210(9:0)" name="D0" />
            <blockpin signalname="i_addr(9:0)" name="D1" />
            <blockpin signalname="o_rdy" name="S0" />
            <blockpin signalname="mux_addr1(9:0)" name="O" />
        </block>
        <block symbolname="RAMB16" name="mem_extrkvparam_2">
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
            <blockpin signalname="XLXN_211(31:0)" name="DIA(31:0)" />
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
        <block symbolname="ExtractKvParameters_process_p0" name="inst_extrkvparam_proc0_inst">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="divfprdy" name="divfprdy" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_200(31:0)" name="nibble_in1(31:0)" />
            <blockpin signalname="XLXN_201(31:0)" name="nibble_in2(31:0)" />
            <blockpin signalname="XLXN_209(3:0)" name="kvijee(3:0)" />
            <blockpin signalname="divfpr(31:0)" name="divfpr(31:0)" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="XLXN_216" name="o_write_enable" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="divfpond" name="divfpond" />
            <blockpin signalname="divfpsclr" name="divfpsclr" />
            <blockpin signalname="divfpce" name="divfpce" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="XLXN_210(9:0)" name="o_addra(9:0)" />
            <blockpin signalname="XLXN_211(31:0)" name="o_dia(31:0)" />
            <blockpin signalname="XLXN_194(3:0)" name="nibble_out1(3:0)" />
            <blockpin signalname="XLXN_195(3:0)" name="nibble_out2(3:0)" />
            <blockpin signalname="XLXN_188(0:4)" name="o_row(0:4)" />
            <blockpin signalname="XLXN_189(0:4)" name="o_col(0:4)" />
            <blockpin signalname="XLXN_205(3:0)" name="kvijee_oo(3:0)" />
            <blockpin signalname="XLXN_204(3:0)" name="kvijee_eo(3:0)" />
            <blockpin signalname="XLXN_203(3:0)" name="kvijee_oe(3:0)" />
            <blockpin signalname="XLXN_202(3:0)" name="kvijee_ee(3:0)" />
            <blockpin signalname="divfpa(31:0)" name="divfpa(31:0)" />
            <blockpin signalname="divfpb(31:0)" name="divfpb(31:0)" />
        </block>
        <block symbolname="rom_unsigned4bit_2powx" name="extractkvparameters_rom_unsigned4bit_2powx">
            <blockpin signalname="XLXN_194(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="XLXN_200(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="rom_signed4bit" name="extractkvparameters_rom_signed4bit">
            <blockpin signalname="XLXN_195(3:0)" name="nibble_in(3:0)" />
            <blockpin signalname="XLXN_201(31:0)" name="nibble_out(31:0)" />
        </block>
        <block symbolname="colrow_even" name="extractkvparameters_colrow_even">
            <blockpin signalname="XLXN_189(0:4)" name="col(0:4)" />
            <blockpin signalname="XLXN_188(0:4)" name="row(0:4)" />
            <blockpin signalname="XLXN_187" name="cole" />
            <blockpin signalname="XLXN_186" name="rowe" />
        </block>
        <block symbolname="ExtractKvParameters_process_p1" name="extractkvparameters_process_p1_inst">
            <blockpin signalname="XLXN_187" name="cole" />
            <blockpin signalname="XLXN_186" name="rowe" />
            <blockpin signalname="XLXN_205(3:0)" name="kvijee_oo(3:0)" />
            <blockpin signalname="XLXN_204(3:0)" name="kvijee_eo(3:0)" />
            <blockpin signalname="XLXN_203(3:0)" name="kvijee_oe(3:0)" />
            <blockpin signalname="XLXN_202(3:0)" name="kvijee_ee(3:0)" />
            <blockpin signalname="XLXN_209(3:0)" name="kvijee(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="XLXN_45(4:0)">
            <wire x2="3040" y1="2640" y2="2656" x1="3040" />
        </branch>
        <branch name="XLXN_45(14:5)">
            <wire x2="3088" y1="2560" y2="2560" x1="3008" />
            <wire x2="3088" y1="2560" y2="2608" x1="3088" />
            <wire x2="3008" y1="2608" y2="2656" x1="3008" />
            <wire x2="3088" y1="2608" y2="2608" x1="3008" />
        </branch>
        <branch name="XLXN_44(4:0)">
            <wire x2="1856" y1="2640" y2="2656" x1="1856" />
        </branch>
        <branch name="XLXN_44(14:5)">
            <wire x2="1904" y1="2560" y2="2560" x1="1824" />
            <wire x2="1904" y1="2560" y2="2608" x1="1904" />
            <wire x2="1824" y1="2608" y2="2656" x1="1824" />
            <wire x2="1904" y1="2608" y2="2608" x1="1824" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="1904" y1="3072" y2="3072" x1="1856" />
        </branch>
        <branch name="XLXN_45(14:0)">
            <wire x2="3040" y1="2752" y2="2752" x1="3008" />
            <wire x2="3088" y1="2752" y2="2752" x1="3040" />
        </branch>
        <branch name="XLXN_44(14:0)">
            <wire x2="1856" y1="2752" y2="2752" x1="1824" />
            <wire x2="1904" y1="2752" y2="2752" x1="1856" />
        </branch>
        <branch name="mux_addr1(9)">
            <wire x2="1552" y1="2656" y2="3072" x1="1552" />
            <wire x2="1632" y1="3072" y2="3072" x1="1552" />
            <wire x2="1552" y1="3072" y2="3408" x1="1552" />
            <wire x2="2320" y1="3408" y2="3408" x1="1552" />
            <wire x2="1552" y1="3408" y2="3488" x1="1552" />
            <wire x2="3696" y1="3488" y2="3488" x1="1552" />
            <wire x2="3088" y1="3072" y2="3072" x1="2320" />
            <wire x2="2320" y1="3072" y2="3408" x1="2320" />
            <wire x2="3696" y1="3008" y2="3488" x1="3696" />
        </branch>
        <branch name="XLXN_78(31:0)">
            <wire x2="3696" y1="2944" y2="2944" x1="3472" />
        </branch>
        <branch name="XLXN_79(31:0)">
            <wire x2="2352" y1="2944" y2="2944" x1="2288" />
            <wire x2="2352" y1="2944" y2="3408" x1="2352" />
            <wire x2="3536" y1="3408" y2="3408" x1="2352" />
            <wire x2="3536" y1="2880" y2="3408" x1="3536" />
            <wire x2="3696" y1="2880" y2="2880" x1="3536" />
        </branch>
        <branch name="XLXN_139(3:0)">
            <wire x2="1872" y1="3264" y2="3264" x1="1856" />
            <wire x2="1904" y1="3264" y2="3264" x1="1872" />
            <wire x2="1872" y1="3264" y2="3360" x1="1872" />
            <wire x2="2416" y1="3360" y2="3360" x1="1872" />
            <wire x2="3088" y1="3264" y2="3264" x1="2416" />
            <wire x2="2416" y1="3264" y2="3360" x1="2416" />
        </branch>
        <bustap x2="3040" y1="2752" y2="2656" x1="3040" />
        <bustap x2="3008" y1="2752" y2="2656" x1="3008" />
        <instance x="3168" y="2704" name="XLXI_7(4:0)" orien="R270" />
        <instance x="2784" y="2592" name="XLXI_8(9:0)" orien="R0" />
        <bustap x2="1856" y1="2752" y2="2656" x1="1856" />
        <bustap x2="1824" y1="2752" y2="2656" x1="1824" />
        <instance x="1984" y="2704" name="XLXI_10(4:0)" orien="R270" />
        <instance x="1600" y="2592" name="XLXI_11(9:0)" orien="R0" />
        <instance x="1632" y="3104" name="XLXI_5" orien="R0" />
        <bustap x2="1552" y1="2560" y2="2656" x1="1552" />
        <instance x="1904" y="3328" name="mem_extrkvparam_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <instance x="3696" y="3040" name="extractkvparameters_MUX_DO(31:0)" orien="R0" />
        <instance x="1632" y="3232" name="XLXI_29(3:0)" orien="M180" />
        <branch name="i_addr(9:0)">
            <wire x2="1200" y1="2528" y2="2528" x1="1024" />
        </branch>
        <branch name="mux_addr1(9:0)">
            <wire x2="1552" y1="2560" y2="2560" x1="1520" />
            <wire x2="1584" y1="2560" y2="2560" x1="1552" />
            <wire x2="1600" y1="2560" y2="2560" x1="1584" />
            <wire x2="1584" y1="2512" y2="2560" x1="1584" />
            <wire x2="1920" y1="2512" y2="2512" x1="1584" />
            <wire x2="1920" y1="2512" y2="2560" x1="1920" />
            <wire x2="2784" y1="2560" y2="2560" x1="1920" />
        </branch>
        <instance x="1200" y="2432" name="extractkvparameters_MUX_ADDR(9:0)" orien="M180" />
        <instance x="3088" y="3328" name="mem_extrkvparam_2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <branch name="o_do(31:0)">
            <wire x2="4048" y1="2912" y2="2912" x1="4016" />
        </branch>
        <iomarker fontsize="28" x="1024" y="2528" name="i_addr(9:0)" orien="R180" />
        <iomarker fontsize="28" x="4048" y="2912" name="o_do(31:0)" orien="R0" />
        <instance x="2320" y="1424" name="inst_extrkvparam_proc0_inst" orien="R0">
        </instance>
        <instance x="2832" y="1440" name="extractkvparameters_rom_unsigned4bit_2powx" orien="R180">
        </instance>
        <instance x="2832" y="1536" name="extractkvparameters_rom_signed4bit" orien="R180">
        </instance>
        <instance x="2816" y="1648" name="extractkvparameters_colrow_even" orien="R180">
        </instance>
        <instance x="2816" y="1904" name="extractkvparameters_process_p1_inst" orien="R180">
        </instance>
        <branch name="XLXN_186">
            <wire x2="2432" y1="1680" y2="1680" x1="2400" />
            <wire x2="2400" y1="1680" y2="1888" x1="2400" />
            <wire x2="2864" y1="1888" y2="1888" x1="2400" />
            <wire x2="2864" y1="1888" y2="2192" x1="2864" />
            <wire x2="2864" y1="2192" y2="2192" x1="2816" />
        </branch>
        <branch name="XLXN_187">
            <wire x2="2432" y1="1744" y2="1744" x1="2416" />
            <wire x2="2416" y1="1744" y2="1872" x1="2416" />
            <wire x2="2880" y1="1872" y2="1872" x1="2416" />
            <wire x2="2880" y1="1872" y2="2256" x1="2880" />
            <wire x2="2880" y1="2256" y2="2256" x1="2816" />
        </branch>
        <branch name="XLXN_189(0:4)">
            <wire x2="2960" y1="1744" y2="1744" x1="2816" />
            <wire x2="2960" y1="1008" y2="1008" x1="2896" />
            <wire x2="2960" y1="1008" y2="1744" x1="2960" />
        </branch>
        <branch name="XLXN_188(0:4)">
            <wire x2="2976" y1="1680" y2="1680" x1="2816" />
            <wire x2="2976" y1="944" y2="944" x1="2896" />
            <wire x2="2976" y1="944" y2="1680" x1="2976" />
        </branch>
        <branch name="XLXN_194(3:0)">
            <wire x2="2992" y1="1472" y2="1472" x1="2832" />
            <wire x2="2992" y1="816" y2="816" x1="2896" />
            <wire x2="2992" y1="816" y2="1472" x1="2992" />
        </branch>
        <branch name="XLXN_200(31:0)">
            <wire x2="2272" y1="960" y2="1472" x1="2272" />
            <wire x2="2384" y1="1472" y2="1472" x1="2272" />
            <wire x2="2320" y1="960" y2="960" x1="2272" />
        </branch>
        <branch name="XLXN_201(31:0)">
            <wire x2="2320" y1="1104" y2="1104" x1="2288" />
            <wire x2="2288" y1="1104" y2="1568" x1="2288" />
            <wire x2="2384" y1="1568" y2="1568" x1="2288" />
        </branch>
        <branch name="XLXN_202(3:0)">
            <wire x2="2912" y1="1936" y2="1936" x1="2816" />
            <wire x2="2912" y1="1264" y2="1264" x1="2896" />
            <wire x2="2912" y1="1264" y2="1936" x1="2912" />
        </branch>
        <branch name="XLXN_203(3:0)">
            <wire x2="2928" y1="2000" y2="2000" x1="2816" />
            <wire x2="2928" y1="1200" y2="1200" x1="2896" />
            <wire x2="2928" y1="1200" y2="2000" x1="2928" />
        </branch>
        <branch name="XLXN_195(3:0)">
            <wire x2="3008" y1="1568" y2="1568" x1="2832" />
            <wire x2="3008" y1="880" y2="880" x1="2896" />
            <wire x2="3008" y1="880" y2="1136" x1="3008" />
            <wire x2="3008" y1="1136" y2="1568" x1="3008" />
        </branch>
        <branch name="XLXN_205(3:0)">
            <wire x2="3072" y1="2128" y2="2128" x1="2816" />
            <wire x2="3072" y1="1072" y2="1072" x1="2896" />
            <wire x2="3072" y1="1072" y2="2064" x1="3072" />
            <wire x2="3072" y1="2064" y2="2128" x1="3072" />
        </branch>
        <branch name="XLXN_204(3:0)">
            <wire x2="2944" y1="2064" y2="2064" x1="2816" />
            <wire x2="2944" y1="1136" y2="1136" x1="2896" />
            <wire x2="2944" y1="1136" y2="2064" x1="2944" />
        </branch>
        <branch name="XLXN_209(3:0)">
            <wire x2="2320" y1="1248" y2="1248" x1="2304" />
            <wire x2="2304" y1="1248" y2="2256" x1="2304" />
            <wire x2="2432" y1="2256" y2="2256" x1="2304" />
        </branch>
        <branch name="XLXN_210(9:0)">
            <wire x2="1200" y1="2592" y2="2592" x1="1120" />
            <wire x2="1120" y1="2592" y2="3440" x1="1120" />
            <wire x2="3552" y1="3440" y2="3440" x1="1120" />
            <wire x2="3552" y1="688" y2="688" x1="2896" />
            <wire x2="3552" y1="688" y2="3440" x1="3552" />
        </branch>
        <branch name="XLXN_211(31:0)">
            <wire x2="1888" y1="2672" y2="2944" x1="1888" />
            <wire x2="1904" y1="2944" y2="2944" x1="1888" />
            <wire x2="1888" y1="2944" y2="3392" x1="1888" />
            <wire x2="3520" y1="3392" y2="3392" x1="1888" />
            <wire x2="2432" y1="2672" y2="2672" x1="1888" />
            <wire x2="2432" y1="2672" y2="2944" x1="2432" />
            <wire x2="3088" y1="2944" y2="2944" x1="2432" />
            <wire x2="3520" y1="752" y2="752" x1="2896" />
            <wire x2="3520" y1="752" y2="3392" x1="3520" />
        </branch>
        <branch name="i_reset">
            <wire x2="1152" y1="384" y2="384" x1="1104" />
            <wire x2="1152" y1="384" y2="3200" x1="1152" />
            <wire x2="1568" y1="3200" y2="3200" x1="1152" />
            <wire x2="1904" y1="3200" y2="3200" x1="1568" />
            <wire x2="1568" y1="3200" y2="3376" x1="1568" />
            <wire x2="2336" y1="3376" y2="3376" x1="1568" />
            <wire x2="2320" y1="384" y2="384" x1="1152" />
            <wire x2="2336" y1="3200" y2="3376" x1="2336" />
            <wire x2="3088" y1="3200" y2="3200" x1="2336" />
        </branch>
        <branch name="i_clock">
            <wire x2="1168" y1="240" y2="240" x1="1104" />
            <wire x2="1168" y1="240" y2="2880" x1="1168" />
            <wire x2="1584" y1="2880" y2="2880" x1="1168" />
            <wire x2="1904" y1="2880" y2="2880" x1="1584" />
            <wire x2="1584" y1="2880" y2="3344" x1="1584" />
            <wire x2="2304" y1="3344" y2="3344" x1="1584" />
            <wire x2="2320" y1="240" y2="240" x1="1168" />
            <wire x2="2304" y1="2880" y2="3344" x1="2304" />
            <wire x2="3088" y1="2880" y2="2880" x1="2304" />
        </branch>
        <branch name="o_rdy">
            <wire x2="1200" y1="2416" y2="2464" x1="1200" />
            <wire x2="3056" y1="2416" y2="2416" x1="1200" />
            <wire x2="3056" y1="368" y2="368" x1="2896" />
            <wire x2="3056" y1="368" y2="2416" x1="3056" />
            <wire x2="3104" y1="368" y2="368" x1="3056" />
        </branch>
        <branch name="XLXN_216">
            <wire x2="1632" y1="3264" y2="3264" x1="1616" />
            <wire x2="1616" y1="3264" y2="3472" x1="1616" />
            <wire x2="3504" y1="3472" y2="3472" x1="1616" />
            <wire x2="3504" y1="304" y2="304" x1="2896" />
            <wire x2="3504" y1="304" y2="3472" x1="3504" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="2912" y1="240" y2="240" x1="2896" />
            <wire x2="3104" y1="240" y2="240" x1="2912" />
        </branch>
        <branch name="divfpond">
            <wire x2="2912" y1="432" y2="432" x1="2896" />
            <wire x2="3104" y1="432" y2="432" x1="2912" />
        </branch>
        <branch name="divfpsclr">
            <wire x2="2912" y1="496" y2="496" x1="2896" />
            <wire x2="3104" y1="496" y2="496" x1="2912" />
        </branch>
        <branch name="divfpce">
            <wire x2="2912" y1="560" y2="560" x1="2896" />
            <wire x2="3104" y1="560" y2="560" x1="2912" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="2912" y1="624" y2="624" x1="2896" />
            <wire x2="3104" y1="624" y2="624" x1="2912" />
        </branch>
        <branch name="divfpa(31:0)">
            <wire x2="3104" y1="1328" y2="1328" x1="2896" />
        </branch>
        <branch name="divfpb(31:0)">
            <wire x2="3104" y1="1392" y2="1392" x1="2896" />
        </branch>
        <iomarker fontsize="28" x="3104" y="1328" name="divfpa(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3104" y="1392" name="divfpb(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3104" y="624" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="3104" y="560" name="divfpce" orien="R0" />
        <iomarker fontsize="28" x="3104" y="496" name="divfpsclr" orien="R0" />
        <iomarker fontsize="28" x="3104" y="432" name="divfpond" orien="R0" />
        <iomarker fontsize="28" x="3104" y="240" name="i2c_mem_ena" orien="R0" />
        <iomarker fontsize="28" x="3104" y="368" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="1104" y="240" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="1104" y="384" name="i_reset" orien="R180" />
        <branch name="i_run">
            <wire x2="2304" y1="528" y2="528" x1="2224" />
            <wire x2="2320" y1="528" y2="528" x1="2304" />
        </branch>
        <branch name="divfprdy">
            <wire x2="2304" y1="672" y2="672" x1="2224" />
            <wire x2="2320" y1="672" y2="672" x1="2304" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="2304" y1="816" y2="816" x1="2224" />
            <wire x2="2320" y1="816" y2="816" x1="2304" />
        </branch>
        <branch name="divfpr(31:0)">
            <wire x2="2320" y1="1392" y2="1392" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="2224" y="1392" name="divfpr(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2224" y="816" name="i2c_mem_douta(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2224" y="672" name="divfprdy" orien="R180" />
        <iomarker fontsize="28" x="2224" y="528" name="i_run" orien="R180" />
    </sheet>
</drawing>