<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="i_value(7:0)" />
        <signal name="XLXN_2(14:0)" />
        <signal name="XLXN_2(4:0)" />
        <signal name="XLXN_2(12:5)" />
        <signal name="XLXN_2(14:13)" />
        <signal name="o_value(31:0)" />
        <signal name="i_clock" />
        <signal name="i_reset" />
        <signal name="XLXN_13" />
        <port polarity="Input" name="i_value(7:0)" />
        <port polarity="Output" name="o_value(31:0)" />
        <port polarity="Input" name="i_clock" />
        <port polarity="Input" name="i_reset" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="RAMB16_S36_S36" name="ROM_mem_signed8bit">
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
            <attr value="bf800000c0000000c0400000c0800000c0a00000c0c00000c0e00000c1000000" name="INIT_1F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c1100000c1200000c1300000c1400000c1500000c1600000c1700000c1800000" name="INIT_1E">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c1880000c1900000c1980000c1a00000c1a80000c1b00000c1b80000c1c00000" name="INIT_1D">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c1c80000c1d00000c1d80000c1e00000c1e80000c1f00000c1f80000c2000000" name="INIT_1C">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2040000c2080000c20c0000c2100000c2140000c2180000c21c0000c2200000" name="INIT_1B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2240000c2280000c22c0000c2300000c2340000c2380000c23c0000c2400000" name="INIT_1A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2440000c2480000c24c0000c2500000c2540000c2580000c25c0000c2600000" name="INIT_19">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2640000c2680000c26c0000c2700000c2740000c2780000c27c0000c2800000" name="INIT_18">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2820000c2840000c2860000c2880000c28a0000c28c0000c28e0000c2900000" name="INIT_17">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2920000c2940000c2960000c2980000c29a0000c29c0000c29e0000c2a00000" name="INIT_16">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2a20000c2a40000c2a60000c2a80000c2aa0000c2ac0000c2ae0000c2b00000" name="INIT_15">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2b20000c2b40000c2b60000c2b80000c2ba0000c2bc0000c2be0000c2c00000" name="INIT_14">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2c20000c2c40000c2c60000c2c80000c2ca0000c2cc0000c2ce0000c2d00000" name="INIT_13">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2d20000c2d40000c2d60000c2d80000c2da0000c2dc0000c2de0000c2e00000" name="INIT_12">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2e20000c2e40000c2e60000c2e80000c2ea0000c2ec0000c2ee0000c2f00000" name="INIT_11">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2f20000c2f40000c2f60000c2f80000c2fa0000c2fc0000c2fe0000c3000000" name="INIT_10">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="42fe000042fc000042fa000042f8000042f6000042f4000042f2000042f00000" name="INIT_0F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="42ee000042ec000042ea000042e8000042e6000042e4000042e2000042e00000" name="INIT_0E">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="42de000042dc000042da000042d8000042d6000042d4000042d2000042d00000" name="INIT_0D">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="42ce000042cc000042ca000042c8000042c6000042c4000042c2000042c00000" name="INIT_0C">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="42be000042bc000042ba000042b8000042b6000042b4000042b2000042b00000" name="INIT_0B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="42ae000042ac000042aa000042a8000042a6000042a4000042a2000042a00000" name="INIT_0A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="429e0000429c0000429a00004298000042960000429400004292000042900000" name="INIT_09">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="428e0000428c0000428a00004288000042860000428400004282000042800000" name="INIT_08">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="427c0000427800004274000042700000426c0000426800004264000042600000" name="INIT_07">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="425c0000425800004254000042500000424c0000424800004244000042400000" name="INIT_06">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="423c0000423800004234000042300000422c0000422800004224000042200000" name="INIT_05">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="421c0000421800004214000042100000420c0000420800004204000042000000" name="INIT_04">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="41f8000041f0000041e8000041e0000041d8000041d0000041c8000041c00000" name="INIT_03">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="41b8000041b0000041a8000041a0000041980000419000004188000041800000" name="INIT_02">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="4170000041600000415000004140000041300000412000004110000041000000" name="INIT_01">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="40e0000040c0000040a000004080000040400000400000003f80000022000000" name="INIT_00">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_2(14:0)" name="ADDRA(14:0)" />
            <blockpin name="ADDRB(14:0)" />
            <blockpin name="CASCADEINA" />
            <blockpin name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin name="CLKB" />
            <blockpin name="DIA(31:0)" />
            <blockpin name="DIB(31:0)" />
            <blockpin name="DIPA(3:0)" />
            <blockpin name="DIPB(3:0)" />
            <blockpin signalname="XLXN_13" name="ENA" />
            <blockpin name="REGCEA" />
            <blockpin name="REGCEB" />
            <blockpin name="ENB" />
            <blockpin signalname="i_reset" name="SSRA" />
            <blockpin name="SSRB" />
            <blockpin name="WEA(3:0)" />
            <blockpin name="WEB(3:0)" />
            <blockpin name="CASCADEOUTA" />
            <blockpin name="CASCADEOUTB" />
            <blockpin signalname="o_value(31:0)" name="DOA(31:0)" />
            <blockpin name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_3(1:0)">
            <blockpin signalname="XLXN_2(14:13)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_4(4:0)">
            <blockpin signalname="XLXN_2(4:0)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_5(7:0)">
            <blockpin signalname="i_value(7:0)" name="I" />
            <blockpin signalname="XLXN_2(12:5)" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_6">
            <blockpin signalname="XLXN_13" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1504" y="1392" name="ROM_mem_signed8bit" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="0" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT_1F" x="0" y="28" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT_1E" x="0" y="60" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT_01" x="0" y="92" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT_00" x="0" y="124" type="instance" />
        </instance>
        <branch name="i_value(7:0)">
            <wire x2="1232" y1="816" y2="816" x1="1072" />
        </branch>
        <iomarker fontsize="28" x="1072" y="816" name="i_value(7:0)" orien="R180" />
        <bustap x2="1472" y1="816" y2="720" x1="1472" />
        <branch name="XLXN_2(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="712" type="branch" />
            <wire x2="1472" y1="704" y2="720" x1="1472" />
        </branch>
        <bustap x2="1440" y1="816" y2="720" x1="1440" />
        <branch name="XLXN_2(12:5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="712" type="branch" />
            <wire x2="1232" y1="576" y2="592" x1="1232" />
            <wire x2="1440" y1="576" y2="576" x1="1232" />
            <wire x2="1440" y1="576" y2="704" x1="1440" />
            <wire x2="1440" y1="704" y2="720" x1="1440" />
        </branch>
        <bustap x2="1408" y1="816" y2="720" x1="1408" />
        <branch name="XLXN_2(14:13)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1408" y="712" type="branch" />
            <wire x2="1408" y1="704" y2="720" x1="1408" />
        </branch>
        <instance x="1280" y="640" name="XLXI_3(1:0)" orien="R90" />
        <instance x="1600" y="768" name="XLXI_4(4:0)" orien="R270" />
        <instance x="1264" y="816" name="XLXI_5(7:0)" orien="R270" />
        <branch name="o_value(31:0)">
            <wire x2="1920" y1="1008" y2="1008" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1920" y="1008" name="o_value(31:0)" orien="R0" />
        <branch name="i_clock">
            <wire x2="1504" y1="944" y2="944" x1="1472" />
        </branch>
        <iomarker fontsize="28" x="1472" y="944" name="i_clock" orien="R180" />
        <branch name="i_reset">
            <wire x2="1504" y1="1264" y2="1264" x1="1472" />
        </branch>
        <iomarker fontsize="28" x="1472" y="1264" name="i_reset" orien="R180" />
        <branch name="XLXN_13">
            <wire x2="1504" y1="1136" y2="1136" x1="1472" />
        </branch>
        <instance x="1472" y="1200" name="XLXI_6" orien="R270" />
        <branch name="XLXN_2(14:0)">
            <wire x2="1440" y1="816" y2="816" x1="1408" />
            <wire x2="1472" y1="816" y2="816" x1="1440" />
            <wire x2="1504" y1="816" y2="816" x1="1472" />
        </branch>
    </sheet>
</drawing>
