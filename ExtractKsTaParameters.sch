<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(14:0)" />
        <signal name="XLXN_1(12:5)" />
        <signal name="XLXN_1(4:0)" />
        <signal name="XLXN_1(14:13)" />
        <signal name="XLXN_10" />
        <signal name="XLXN_84(31:0)" />
        <signal name="i2c_mem_ena" />
        <signal name="o_rdy" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="o_ksta(31:0)" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="i_run" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="XLXN_97" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="o_ksta(31:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="ramb16">
            <timestamp>2007-9-26T16:56:25</timestamp>
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="ExtractKsTaParameter_process_p0">
            <timestamp>2023-6-16T12:39:31</timestamp>
            <rect width="448" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="576" y1="-288" y2="-288" x1="512" />
            <line x2="576" y1="-224" y2="-224" x1="512" />
            <rect width="64" x="512" y="-172" height="24" />
            <line x2="576" y1="-160" y2="-160" x1="512" />
            <rect width="64" x="512" y="-108" height="24" />
            <line x2="576" y1="-96" y2="-96" x1="512" />
            <rect width="64" x="512" y="-44" height="24" />
            <line x2="576" y1="-32" y2="-32" x1="512" />
        </blockdef>
        <block symbolname="ramb16" name="ROM_KSTA">
            <attr value="3a6000003a4000003a2000003a00000039c00000398000003900000000000000" name="INIT_00">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3af000003ae000003ad000003ac000003ab000003aa000003a9000003a800000" name="INIT_01">
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
            <attr value="b9000000b9800000b9c00000ba000000ba200000ba400000ba600000ba800000" name="INIT_1F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="ba900000baa00000bab00000bac00000bad00000bae00000baf00000bb000000" name="INIT_1E">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bb080000bb100000bb180000bb200000bb280000bb300000bb380000bb400000" name="INIT_1D">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bb480000bb500000bb580000bb600000bb680000bb700000bb780000bb800000" name="INIT_1C">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bb840000bb880000bb8c0000bb900000bb940000bb980000bb9c0000bba00000" name="INIT_1B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bba40000bba80000bbac0000bbb00000bbb40000bbb80000bbbc0000bbc00000" name="INIT_1A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bbc40000bbc80000bbcc0000bbd00000bbd40000bbd80000bbdc0000bbe00000" name="INIT_19">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bbe40000bbe80000bbec0000bbf00000bbf40000bbf80000bbfc0000bc000000" name="INIT_18">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bc020000bc040000bc060000bc080000bc0a0000bc0c0000bc0e0000bc100000" name="INIT_17">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bc120000bc140000bc160000bc180000bc1a0000bc1c0000bc1e0000bc200000" name="INIT_16">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bc220000bc240000bc260000bc280000bc2a0000bc2c0000bc2e0000bc300000" name="INIT_15">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bc320000bc340000bc360000bc380000bc3a0000bc3c0000bc3e0000bc400000" name="INIT_14">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bc420000bc440000bc460000bc480000bc4a0000bc4c0000bc4e0000bc500000" name="INIT_13">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bc520000bc540000bc560000bc580000bc5a0000bc5c0000bc5e0000bc600000" name="INIT_12">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bc620000bc640000bc660000bc680000bc6a0000bc6c0000bc6e0000bc700000" name="INIT_11">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bc720000bc740000bc760000bc780000bc7a0000bc7c0000bc7e0000bc800000" name="INIT_10">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3c7e00003c7c00003c7a00003c7800003c7600003c7400003c7200003c700000" name="INIT_0F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3c6e00003c6c00003c6a00003c6800003c6600003c6400003c6200003c600000" name="INIT_0E">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3c5e00003c5c00003c5a00003c5800003c5600003c5400003c5200003c500000" name="INIT_0D">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3c4e00003c4c00003c4a00003c4800003c4600003c4400003c4200003c400000" name="INIT_0C">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3c3e00003c3c00003c3a00003c3800003c3600003c3400003c3200003c300000" name="INIT_0B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3c2e00003c2c00003c2a00003c2800003c2600003c2400003c2200003c200000" name="INIT_0A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3c1e00003c1c00003c1a00003c1800003c1600003c1400003c1200003c100000" name="INIT_09">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3c0e00003c0c00003c0a00003c0800003c0600003c0400003c0200003c000000" name="INIT_08">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3bfc00003bf800003bf400003bf000003bec00003be800003be400003be00000" name="INIT_07">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3bdc00003bd800003bd400003bd000003bcc00003bc800003bc400003bc00000" name="INIT_06">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3bbc00003bb800003bb400003bb000003bac00003ba800003ba400003ba00000" name="INIT_05">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3b9c00003b9800003b9400003b9000003b8c00003b8800003b8400003b800000" name="INIT_04">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3b7800003b7000003b6800003b6000003b5800003b5000003b4800003b400000" name="INIT_03">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3b3800003b3000003b2800003b2000003b1800003b1000003b0800003b000000" name="INIT_02">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
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
            <blockpin signalname="XLXN_84(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_3(4:0)">
            <blockpin signalname="XLXN_1(4:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_4(1:0)">
            <blockpin signalname="XLXN_1(14:13)" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_5">
            <blockpin signalname="XLXN_10" name="P" />
        </block>
        <block symbolname="ExtractKsTaParameter_process_p0" name="XLXI_6">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="XLXN_84(31:0)" name="odata_ksta(31:0)" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="XLXN_1(12:5)" name="address_ksta(7:0)" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="o_ksta(31:0)" name="o_ksta(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <attr value="Inch" name="LengthUnitName" />
        <attr value="10" name="GridsPerUnit" />
        <branch name="XLXN_1(14:0)">
            <wire x2="1504" y1="1156" y2="1156" x1="1488" />
            <wire x2="1536" y1="1156" y2="1156" x1="1504" />
            <wire x2="1568" y1="1156" y2="1156" x1="1536" />
            <wire x2="1760" y1="1156" y2="1156" x1="1568" />
        </branch>
        <branch name="XLXN_1(12:5)">
            <wire x2="1504" y1="996" y2="1060" x1="1504" />
            <wire x2="2368" y1="996" y2="996" x1="1504" />
            <wire x2="2368" y1="580" y2="580" x1="2080" />
            <wire x2="2368" y1="580" y2="996" x1="2368" />
        </branch>
        <branch name="XLXN_1(4:0)">
            <wire x2="1536" y1="1252" y2="1268" x1="1536" />
        </branch>
        <branch name="XLXN_1(14:13)">
            <wire x2="1568" y1="1332" y2="1332" x1="1536" />
            <wire x2="1568" y1="1252" y2="1332" x1="1568" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="1760" y1="1476" y2="1476" x1="1728" />
        </branch>
        <instance x="1760" y="1732" name="ROM_KSTA" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <bustap x2="1504" y1="1156" y2="1060" x1="1504" />
        <bustap x2="1536" y1="1156" y2="1252" x1="1536" />
        <bustap x2="1568" y1="1156" y2="1252" x1="1568" />
        <instance x="1408" y="1204" name="XLXI_3(4:0)" orien="R90" />
        <instance x="1408" y="1268" name="XLXI_4(1:0)" orien="R90" />
        <instance x="1728" y="1540" name="XLXI_5" orien="R270" />
        <instance x="1504" y="740" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_84(31:0)">
            <wire x2="1504" y1="644" y2="644" x1="1424" />
            <wire x2="1424" y1="644" y2="788" x1="1424" />
            <wire x2="2240" y1="788" y2="788" x1="1424" />
            <wire x2="2240" y1="788" y2="1348" x1="2240" />
            <wire x2="2240" y1="1348" y2="1348" x1="2144" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="2096" y1="452" y2="452" x1="2080" />
            <wire x2="2416" y1="452" y2="452" x1="2096" />
        </branch>
        <branch name="o_rdy">
            <wire x2="2096" y1="516" y2="516" x1="2080" />
            <wire x2="2416" y1="516" y2="516" x1="2096" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="2096" y1="644" y2="644" x1="2080" />
            <wire x2="2416" y1="644" y2="644" x1="2096" />
        </branch>
        <branch name="o_ksta(31:0)">
            <wire x2="2096" y1="708" y2="708" x1="2080" />
            <wire x2="2416" y1="708" y2="708" x1="2096" />
        </branch>
        <branch name="i_clock">
            <wire x2="1408" y1="452" y2="452" x1="1312" />
            <wire x2="1488" y1="452" y2="452" x1="1408" />
            <wire x2="1504" y1="452" y2="452" x1="1488" />
            <wire x2="1408" y1="452" y2="820" x1="1408" />
            <wire x2="1648" y1="820" y2="820" x1="1408" />
            <wire x2="1648" y1="820" y2="1284" x1="1648" />
            <wire x2="1760" y1="1284" y2="1284" x1="1648" />
        </branch>
        <branch name="i_reset">
            <wire x2="1376" y1="516" y2="516" x1="1312" />
            <wire x2="1488" y1="516" y2="516" x1="1376" />
            <wire x2="1504" y1="516" y2="516" x1="1488" />
            <wire x2="1376" y1="516" y2="1604" x1="1376" />
            <wire x2="1760" y1="1604" y2="1604" x1="1376" />
        </branch>
        <branch name="i_run">
            <wire x2="1488" y1="580" y2="580" x1="1312" />
            <wire x2="1504" y1="580" y2="580" x1="1488" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="1488" y1="708" y2="708" x1="1312" />
            <wire x2="1504" y1="708" y2="708" x1="1488" />
        </branch>
        <iomarker fontsize="28" x="1312" y="452" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="1312" y="516" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="1312" y="580" name="i_run" orien="R180" />
        <iomarker fontsize="28" x="1312" y="708" name="i2c_mem_douta(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2416" y="452" name="i2c_mem_ena" orien="R0" />
        <iomarker fontsize="28" x="2416" y="516" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="2416" y="644" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="2416" y="708" name="o_ksta(31:0)" orien="R0" />
    </sheet>
</drawing>