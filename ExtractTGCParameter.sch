<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ADDRA(12:5)" />
        <signal name="ADDRA(14:0)" />
        <signal name="ADDRA(4:0)" />
        <signal name="ADDRA(14:13)" />
        <signal name="i_clock" />
        <signal name="XLXN_11" />
        <signal name="i_reset" />
        <signal name="XLXN_12(7:0)" />
        <signal name="XLXN_13(31:0)" />
        <signal name="i_run" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="i2c_mem_ena" />
        <signal name="o_rdy" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="o_tgc(31:0)" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="o_tgc(31:0)" />
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
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
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
        <blockdef name="ExtractTGCParameter_process_p0">
            <timestamp>2023-6-15T18:50:12</timestamp>
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
        <block symbolname="ramb16" name="ROM_TGC">
            <attr value="3ffc00003ff800003ff400003ff000003fec00003fe800003fe400003fe00000" name="INIT_07">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3fdc00003fd800003fd400003fd000003fcc00003fc800003fc400003fc00000" name="INIT_06">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3fbc00003fb800003fb400003fb000003fac00003fa800003fa400003fa00000" name="INIT_05">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3f9c00003f9800003f9400003f9000003f8c00003f8800003f8400003f800000" name="INIT_04">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3f7800003f7000003f6800003f6000003f5800003f5000003f4800003f400000" name="INIT_03">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3f3800003f3000003f2800003f2000003f1800003f1000003f0800003f000000" name="INIT_02">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3ef000003ee000003ed000003ec000003eb000003ea000003e9000003e800000" name="INIT_01">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="3e6000003e4000003e2000003e0000003dc000003d8000003d00000000000000" name="INIT_00">
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
            <attr value="bd000000bd800000bdc00000be000000be200000be400000be600000be800000" name="INIT_1F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="be900000bea00000beb00000bec00000bed00000bee00000bef00000bf000000" name="INIT_1E">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bf080000bf100000bf180000bf200000bf280000bf300000bf380000bf400000" name="INIT_1D">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bf480000bf500000bf580000bf600000bf680000bf700000bf780000bf800000" name="INIT_1C">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bf840000bf880000bf8c0000bf900000bf940000bf980000bf9c0000bfa00000" name="INIT_1B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bfa40000bfa80000bfac0000bfb00000bfb40000bfb80000bfbc0000bfc00000" name="INIT_1A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bfc40000bfc80000bfcc0000bfd00000bfd40000bfd80000bfdc0000bfe00000" name="INIT_19">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="bfe40000bfe80000bfec0000bff00000bff40000bff80000bffc0000c0000000" name="INIT_18">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c0020000c0040000c0060000c0080000c00a0000c00c0000c00e0000c0100000" name="INIT_17">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c0120000c0140000c0160000c0180000c01a0000c01c0000c01e0000c0200000" name="INIT_16">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c0220000c0240000c0260000c0280000c02a0000c02c0000c02e0000c0300000" name="INIT_15">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c0320000c0340000c0360000c0380000c03a0000c03c0000c03e0000c0400000" name="INIT_14">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c0420000c0440000c0460000c0480000c04a0000c04c0000c04e0000c0500000" name="INIT_13">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c0520000c0540000c0560000c0580000c05a0000c05c0000c05e0000c0600000" name="INIT_12">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c0620000c0640000c0660000c0680000c06a0000c06c0000c06e0000c0700000" name="INIT_11">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c0720000c0740000c0760000c0780000c07a0000c07c0000c07e0000c0800000" name="INIT_10">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="407e0000407c0000407a00004078000040760000407400004072000040700000" name="INIT_0F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="406e0000406c0000406a00004068000040660000406400004062000040600000" name="INIT_0E">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="405e0000405c0000405a00004058000040560000405400004052000040500000" name="INIT_0D">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="404e0000404c0000404a00004048000040460000404400004042000040400000" name="INIT_0C">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="403e0000403c0000403a00004038000040360000403400004032000040300000" name="INIT_0B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="402e0000402c0000402a00004028000040260000402400004022000040200000" name="INIT_0A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="401e0000401c0000401a00004018000040160000401400004012000040100000" name="INIT_09">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="400e0000400c0000400a00004008000040060000400400004002000040000000" name="INIT_08">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <blockpin signalname="ADDRA(14:0)" name="ADDRA(14:0)" />
            <blockpin name="ADDRB(14:0)" />
            <blockpin name="CASCADEINA" />
            <blockpin name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin name="DIA(31:0)" />
            <blockpin name="DIB(31:0)" />
            <blockpin name="DIPA(3:0)" />
            <blockpin name="DIPB(3:0)" />
            <blockpin signalname="XLXN_11" name="ENA" />
            <blockpin name="REGCEA" />
            <blockpin name="REGCEB" />
            <blockpin name="ENB" />
            <blockpin signalname="i_reset" name="SSRA" />
            <blockpin name="SSRB" />
            <blockpin name="WEA(3:0)" />
            <blockpin name="WEB(3:0)" />
            <blockpin name="CASCADEOUTA" />
            <blockpin name="CASCADEOUTB" />
            <blockpin signalname="XLXN_13(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="buf" name="BUF(7:0)">
            <blockpin signalname="XLXN_12(7:0)" name="I" />
            <blockpin signalname="ADDRA(12:5)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_5(1:0)">
            <blockpin signalname="ADDRA(14:13)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_6(4:0)">
            <blockpin signalname="ADDRA(4:0)" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_7">
            <blockpin signalname="XLXN_11" name="P" />
        </block>
        <block symbolname="ExtractTGCParameter_process_p0" name="XLXI_8">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_13(31:0)" name="i_data(31:0)" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="XLXN_12(7:0)" name="o_address(7:0)" />
            <blockpin signalname="o_tgc(31:0)" name="o_tgc(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="ADDRA(12:5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1728" y="1768" type="branch" />
            <wire x2="1728" y1="1760" y2="1760" x1="1680" />
            <wire x2="1728" y1="1760" y2="1776" x1="1728" />
        </branch>
        <branch name="ADDRA(14:0)">
            <wire x2="1664" y1="1872" y2="1872" x1="1648" />
            <wire x2="1696" y1="1872" y2="1872" x1="1664" />
            <wire x2="1728" y1="1872" y2="1872" x1="1696" />
            <wire x2="1776" y1="1872" y2="1872" x1="1728" />
        </branch>
        <instance x="1776" y="2448" name="ROM_TGC" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <bustap x2="1728" y1="1872" y2="1776" x1="1728" />
        <instance x="1456" y="1792" name="BUF(7:0)" orien="R0" />
        <bustap x2="1696" y1="1872" y2="1968" x1="1696" />
        <branch name="ADDRA(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1696" y="1976" type="branch" />
            <wire x2="1696" y1="2048" y2="2048" x1="1664" />
            <wire x2="1696" y1="1968" y2="2048" x1="1696" />
        </branch>
        <bustap x2="1664" y1="1872" y2="1968" x1="1664" />
        <branch name="ADDRA(14:13)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="1976" type="branch" />
            <wire x2="1664" y1="1968" y2="1984" x1="1664" />
        </branch>
        <instance x="1536" y="1920" name="XLXI_5(1:0)" orien="R90" />
        <instance x="1536" y="1984" name="XLXI_6(4:0)" orien="R90" />
        <branch name="i_clock">
            <wire x2="1360" y1="1232" y2="1232" x1="1328" />
            <wire x2="1408" y1="1232" y2="1232" x1="1360" />
            <wire x2="1360" y1="1232" y2="2096" x1="1360" />
            <wire x2="1760" y1="2096" y2="2096" x1="1360" />
            <wire x2="1776" y1="2000" y2="2000" x1="1760" />
            <wire x2="1760" y1="2000" y2="2096" x1="1760" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1776" y1="2192" y2="2192" x1="1664" />
        </branch>
        <branch name="i_reset">
            <wire x2="1376" y1="1296" y2="1296" x1="1328" />
            <wire x2="1408" y1="1296" y2="1296" x1="1376" />
            <wire x2="1376" y1="1296" y2="2320" x1="1376" />
            <wire x2="1776" y1="2320" y2="2320" x1="1376" />
        </branch>
        <instance x="1664" y="2256" name="XLXI_7" orien="R270" />
        <instance x="1408" y="1520" name="XLXI_8" orien="R0">
        </instance>
        <branch name="XLXN_12(7:0)">
            <wire x2="1424" y1="1712" y2="1760" x1="1424" />
            <wire x2="1456" y1="1760" y2="1760" x1="1424" />
            <wire x2="2000" y1="1712" y2="1712" x1="1424" />
            <wire x2="2000" y1="1424" y2="1424" x1="1984" />
            <wire x2="2000" y1="1424" y2="1712" x1="2000" />
        </branch>
        <branch name="XLXN_13(31:0)">
            <wire x2="1408" y1="1488" y2="1488" x1="1392" />
            <wire x2="1392" y1="1488" y2="2480" x1="1392" />
            <wire x2="2256" y1="2480" y2="2480" x1="1392" />
            <wire x2="2256" y1="2064" y2="2064" x1="2160" />
            <wire x2="2256" y1="2064" y2="2480" x1="2256" />
        </branch>
        <branch name="i_run">
            <wire x2="1392" y1="1360" y2="1360" x1="1328" />
            <wire x2="1408" y1="1360" y2="1360" x1="1392" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="1392" y1="1424" y2="1424" x1="1328" />
            <wire x2="1408" y1="1424" y2="1424" x1="1392" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="2000" y1="1232" y2="1232" x1="1984" />
            <wire x2="2048" y1="1232" y2="1232" x1="2000" />
        </branch>
        <branch name="o_rdy">
            <wire x2="2000" y1="1296" y2="1296" x1="1984" />
            <wire x2="2048" y1="1296" y2="1296" x1="2000" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="2000" y1="1360" y2="1360" x1="1984" />
            <wire x2="2048" y1="1360" y2="1360" x1="2000" />
        </branch>
        <branch name="o_tgc(31:0)">
            <wire x2="2000" y1="1488" y2="1488" x1="1984" />
            <wire x2="2048" y1="1488" y2="1488" x1="2000" />
        </branch>
        <iomarker fontsize="28" x="2048" y="1488" name="o_tgc(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1328" y="1360" name="i_run" orien="R180" />
        <iomarker fontsize="28" x="1328" y="1424" name="i2c_mem_douta(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1328" y="1232" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="1328" y="1296" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="2048" y="1360" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="2048" y="1296" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="2048" y="1232" name="i2c_mem_ena" orien="R0" />
    </sheet>
</drawing>