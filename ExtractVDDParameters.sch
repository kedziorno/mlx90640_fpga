<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_605(31:0)" />
        <signal name="XLXN_606(31:0)" />
        <signal name="i2c_mem_ena" />
        <signal name="i2c_mem_douta(7:0)" />
        <signal name="i2c_mem_addra(11:0)" />
        <signal name="o_rdy" />
        <signal name="o_kvdd(31:0)" />
        <signal name="o_vdd25(31:0)" />
        <signal name="XLXN_614(14:0)" />
        <signal name="XLXN_615(14:0)" />
        <signal name="i_run" />
        <signal name="i_reset" />
        <signal name="i_clock" />
        <signal name="XLXN_630(3:0)" />
        <signal name="XLXN_631" />
        <signal name="XLXN_632" />
        <signal name="XLXN_633(3:0)" />
        <signal name="XLXN_634(3:0)" />
        <signal name="XLXN_635(3:0)" />
        <signal name="XLXN_636(31:0)" />
        <signal name="XLXN_637(31:0)" />
        <signal name="XLXN_638" />
        <signal name="XLXN_639" />
        <signal name="ADDRA(14:0)" />
        <signal name="ADDRB(14:0)" />
        <port polarity="Output" name="i2c_mem_ena" />
        <port polarity="Input" name="i2c_mem_douta(7:0)" />
        <port polarity="Output" name="i2c_mem_addra(11:0)" />
        <port polarity="Output" name="o_rdy" />
        <port polarity="Output" name="o_kvdd(31:0)" />
        <port polarity="Output" name="o_vdd25(31:0)" />
        <port polarity="Input" name="i_run" />
        <port polarity="Input" name="i_reset" />
        <port polarity="Input" name="i_clock" />
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
        <blockdef name="ExtractVDDParameters_process_p0">
            <timestamp>2023-6-9T10:2:40</timestamp>
            <rect width="448" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="576" y1="-416" y2="-416" x1="512" />
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
        <block symbolname="RAMB16" name="MEM_KVDD_VDD25">
            <attr value="c5720000c5740000c5760000c5780000c57a0000c57c0000c57e0000c5800000" name="INIT_10">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="457e0000457c0000457a00004578000045760000457400004572000045700000" name="INIT_0F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="456e0000456c0000456a00004568000045660000456400004562000045600000" name="INIT_0E">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="455e0000455c0000455a00004558000045560000455400004552000045500000" name="INIT_0D">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="454e0000454c0000454a00004548000045460000454400004542000045400000" name="INIT_0C">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="453e0000453c0000453a00004538000045360000453400004532000045300000" name="INIT_0B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="452e0000452c0000452a00004528000045260000452400004522000045200000" name="INIT_0A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="451e0000451c0000451a00004518000045160000451400004512000045100000" name="INIT_09">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="450e0000450c0000450a00004508000045060000450400004502000045000000" name="INIT_08">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="44fc000044f8000044f4000044f0000044ec000044e8000044e4000044e00000" name="INIT_07">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="44dc000044d8000044d4000044d0000044cc000044c8000044c4000044c00000" name="INIT_06">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="44bc000044b8000044b4000044b0000044ac000044a8000044a4000044a00000" name="INIT_05">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="449c0000449800004494000044900000448c0000448800004484000044800000" name="INIT_04">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="4478000044700000446800004460000044580000445000004448000044400000" name="INIT_03">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="4438000044300000442800004420000044180000441000004408000044000000" name="INIT_02">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="43f0000043e0000043d0000043c0000043b0000043a000004390000043800000" name="INIT_01">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="4360000043400000432000004300000042c00000428000004200000000000000" name="INIT_00">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c2000000c2800000c2c00000c3000000c3200000c3400000c3600000c3800000" name="INIT_1F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c3900000c3a00000c3b00000c3c00000c3d00000c3e00000c3f00000c4000000" name="INIT_1E">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c4080000c4100000c4180000c4200000c4280000c4300000c4380000c4400000" name="INIT_1D">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c4480000c4500000c4580000c4600000c4680000c4700000c4780000c4800000" name="INIT_1C">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c4840000c4880000c48c0000c4900000c4940000c4980000c49c0000c4a00000" name="INIT_1B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c4a40000c4a80000c4ac0000c4b00000c4b40000c4b80000c4bc0000c4c00000" name="INIT_1A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c4c40000c4c80000c4cc0000c4d00000c4d40000c4d80000c4dc0000c4e00000" name="INIT_19">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c4e40000c4e80000c4ec0000c4f00000c4f40000c4f80000c4fc0000c5000000" name="INIT_18">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c5020000c5040000c5060000c5080000c50a0000c50c0000c50e0000c5100000" name="INIT_17">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c5120000c5140000c5160000c5180000c51a0000c51c0000c51e0000c5200000" name="INIT_16">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c5220000c5240000c5260000c5280000c52a0000c52c0000c52e0000c5300000" name="INIT_15">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c5320000c5340000c5360000c5380000c53a0000c53c0000c53e0000c5400000" name="INIT_14">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c5420000c5440000c5460000c5480000c54a0000c54c0000c54e0000c5500000" name="INIT_13">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c5520000c5540000c5560000c5580000c55a0000c55c0000c55e0000c5600000" name="INIT_12">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c5620000c5640000c5660000c5680000c56a0000c56c0000c56e0000c5700000" name="INIT_11">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6008000c6010000c6018000c6020000c6028000c6030000c6038000c6040000" name="INIT_3F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6048000c6050000c6058000c6060000c6068000c6070000c6078000c6080000" name="INIT_3E">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6088000c6090000c6098000c60a0000c60a8000c60b0000c60b8000c60c0000" name="INIT_3D">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c60c8000c60d0000c60d8000c60e0000c60e8000c60f0000c60f8000c6100000" name="INIT_3C">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6108000c6110000c6118000c6120000c6128000c6130000c6138000c6140000" name="INIT_3B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6148000c6150000c6158000c6160000c6168000c6170000c6178000c6180000" name="INIT_3A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6188000c6190000c6198000c61a0000c61a8000c61b0000c61b8000c61c0000" name="INIT_39">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c61c8000c61d0000c61d8000c61e0000c61e8000c61f0000c61f8000c6200000" name="INIT_38">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6208000c6210000c6218000c6220000c6228000c6230000c6238000c6240000" name="INIT_37">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6248000c6250000c6258000c6260000c6268000c6270000c6278000c6280000" name="INIT_36">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6288000c6290000c6298000c62a0000c62a8000c62b0000c62b8000c62c0000" name="INIT_35">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c62c8000c62d0000c62d8000c62e0000c62e8000c62f0000c62f8000c6300000" name="INIT_34">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6308000c6310000c6318000c6320000c6328000c6330000c6338000c6340000" name="INIT_33">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6348000c6350000c6358000c6360000c6368000c6370000c6378000c6380000" name="INIT_32">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6388000c6390000c6398000c63a0000c63a8000c63b0000c63b8000c63c0000" name="INIT_31">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c63c8000c63d0000c63d8000c63e0000c63e8000c63f0000c63f8000c6400000" name="INIT_30">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6408000c6410000c6418000c6420000c6428000c6430000c6438000c6440000" name="INIT_2F">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6448000c6450000c6458000c6460000c6468000c6470000c6478000c6480000" name="INIT_2E">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6488000c6490000c6498000c64a0000c64a8000c64b0000c64b8000c64c0000" name="INIT_2D">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c64c8000c64d0000c64d8000c64e0000c64e8000c64f0000c64f8000c6500000" name="INIT_2C">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6508000c6510000c6518000c6520000c6528000c6530000c6538000c6540000" name="INIT_2B">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6548000c6550000c6558000c6560000c6568000c6570000c6578000c6580000" name="INIT_2A">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6588000c6590000c6598000c65a0000c65a8000c65b0000c65b8000c65c0000" name="INIT_29">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c65c8000c65d0000c65d8000c65e0000c65e8000c65f0000c65f8000c6600000" name="INIT_28">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6608000c6610000c6618000c6620000c6628000c6630000c6638000c6640000" name="INIT_27">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6648000c6650000c6658000c6660000c6668000c6670000c6678000c6680000" name="INIT_26">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6688000c6690000c6698000c66a0000c66a8000c66b0000c66b8000c66c0000" name="INIT_25">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c66c8000c66d0000c66d8000c66e0000c66e8000c66f0000c66f8000c6700000" name="INIT_24">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6708000c6710000c6718000c6720000c6728000c6730000c6738000c6740000" name="INIT_23">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6748000c6750000c6758000c6760000c6768000c6770000c6778000c6780000" name="INIT_22">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c6788000c6790000c6798000c67a0000c67a8000c67b0000c67b8000c67c0000" name="INIT_21">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="c67c8000c67d0000c67d8000c67e0000c67e8000c67f0000c67f8000c6800000" name="INIT_20">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 256 hexadecimal" />
            </attr>
            <attr value="NONE" name="SIM_COLLISION_CHECK">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="StringValList ALL NONE WARNING_ONLY GENERATE_X_ONLY" />
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
            <blockpin signalname="ADDRA(14:0)" name="ADDRA(14:0)" />
            <blockpin signalname="ADDRB(14:0)" name="ADDRB(14:0)" />
            <blockpin signalname="XLXN_638" name="CASCADEINA" />
            <blockpin signalname="XLXN_639" name="CASCADEINB" />
            <blockpin signalname="i_clock" name="CLKA" />
            <blockpin signalname="i_clock" name="CLKB" />
            <blockpin signalname="XLXN_637(31:0)" name="DIA(31:0)" />
            <blockpin signalname="XLXN_636(31:0)" name="DIB(31:0)" />
            <blockpin signalname="XLXN_635(3:0)" name="DIPA(3:0)" />
            <blockpin signalname="XLXN_634(3:0)" name="DIPB(3:0)" />
            <blockpin signalname="i_clock" name="ENA" />
            <blockpin signalname="XLXN_631" name="REGCEA" />
            <blockpin signalname="XLXN_632" name="REGCEB" />
            <blockpin signalname="i_clock" name="ENB" />
            <blockpin signalname="i_reset" name="SSRA" />
            <blockpin signalname="i_reset" name="SSRB" />
            <blockpin signalname="XLXN_633(3:0)" name="WEA(3:0)" />
            <blockpin signalname="XLXN_630(3:0)" name="WEB(3:0)" />
            <blockpin name="CASCADEOUTA" />
            <blockpin name="CASCADEOUTB" />
            <blockpin signalname="XLXN_605(31:0)" name="DOA(31:0)" />
            <blockpin signalname="XLXN_606(31:0)" name="DOB(31:0)" />
            <blockpin name="DOPA(3:0)" />
            <blockpin name="DOPB(3:0)" />
        </block>
        <block symbolname="buf" name="BUF_kvdd(14:0)">
            <blockpin signalname="XLXN_614(14:0)" name="I" />
            <blockpin signalname="ADDRA(14:0)" name="O" />
        </block>
        <block symbolname="buf" name="BUF_vdd25(14:0)">
            <blockpin signalname="XLXN_615(14:0)" name="I" />
            <blockpin signalname="ADDRB(14:0)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_186">
            <blockpin signalname="XLXN_632" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_187">
            <blockpin signalname="XLXN_631" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_188(3:0)">
            <blockpin signalname="XLXN_630(3:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_189(3:0)">
            <blockpin signalname="XLXN_633(3:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_190(3:0)">
            <blockpin signalname="XLXN_634(3:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_191(3:0)">
            <blockpin signalname="XLXN_635(3:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_192(31:0)">
            <blockpin signalname="XLXN_636(31:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_193(31:0)">
            <blockpin signalname="XLXN_637(31:0)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_194">
            <blockpin signalname="XLXN_639" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_195">
            <blockpin signalname="XLXN_638" name="G" />
        </block>
        <block symbolname="ExtractVDDParameters_process_p0" name="ExtractVDDParameters_process_p0_inst">
            <blockpin signalname="i_clock" name="i_clock" />
            <blockpin signalname="i_reset" name="i_reset" />
            <blockpin signalname="i_run" name="i_run" />
            <blockpin signalname="i2c_mem_douta(7:0)" name="i2c_mem_douta(7:0)" />
            <blockpin signalname="XLXN_605(31:0)" name="data_kvdd(31:0)" />
            <blockpin signalname="XLXN_606(31:0)" name="data_vdd25(31:0)" />
            <blockpin signalname="i2c_mem_ena" name="i2c_mem_ena" />
            <blockpin signalname="o_rdy" name="o_rdy" />
            <blockpin signalname="i2c_mem_addra(11:0)" name="i2c_mem_addra(11:0)" />
            <blockpin signalname="XLXN_614(14:0)" name="address_kvdd(14:0)" />
            <blockpin signalname="XLXN_615(14:0)" name="address_vdd25(14:0)" />
            <blockpin signalname="o_kvdd(31:0)" name="o_kvdd(31:0)" />
            <blockpin signalname="o_vdd25(31:0)" name="o_vdd25(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="2" width="2720" height="1760">
        <branch name="XLXN_605(31:0)">
            <wire x2="1712" y1="432" y2="432" x1="1376" />
            <wire x2="1712" y1="432" y2="448" x1="1712" />
            <wire x2="1728" y1="448" y2="448" x1="1712" />
        </branch>
        <branch name="XLXN_606(31:0)">
            <wire x2="1712" y1="528" y2="528" x1="1376" />
            <wire x2="1712" y1="512" y2="528" x1="1712" />
            <wire x2="1728" y1="512" y2="512" x1="1712" />
        </branch>
        <branch name="i2c_mem_ena">
            <wire x2="2320" y1="192" y2="192" x1="2304" />
        </branch>
        <branch name="i2c_mem_douta(7:0)">
            <wire x2="1728" y1="384" y2="384" x1="1712" />
        </branch>
        <branch name="i2c_mem_addra(11:0)">
            <wire x2="2320" y1="320" y2="320" x1="2304" />
        </branch>
        <branch name="o_rdy">
            <wire x2="2320" y1="256" y2="256" x1="2304" />
        </branch>
        <branch name="o_kvdd(31:0)">
            <wire x2="2320" y1="512" y2="512" x1="2304" />
        </branch>
        <branch name="o_vdd25(31:0)">
            <wire x2="2320" y1="576" y2="576" x1="2304" />
        </branch>
        <branch name="XLXN_614(14:0)">
            <wire x2="2400" y1="384" y2="384" x1="2304" />
        </branch>
        <branch name="XLXN_615(14:0)">
            <wire x2="2400" y1="448" y2="448" x1="2304" />
        </branch>
        <instance x="992" y="816" name="MEM_KVDD_VDD25" orien="R0">
            <attrtext style="alignment:RIGHT;fontsize:64;fontname:Arial;textcolor:rgb(0,0,128)" attrname="InstName" x="0" y="0" type="instance" />
        </instance>
        <instance x="2400" y="416" name="BUF_kvdd(14:0)" orien="R0" />
        <instance x="2400" y="480" name="BUF_vdd25(14:0)" orien="R0" />
        <branch name="i_run">
            <wire x2="1728" y1="320" y2="320" x1="1696" />
        </branch>
        <branch name="i_reset">
            <wire x2="1728" y1="256" y2="256" x1="1696" />
        </branch>
        <branch name="i_clock">
            <wire x2="1728" y1="192" y2="192" x1="1696" />
        </branch>
        <branch name="i_clock">
            <wire x2="992" y1="368" y2="368" x1="976" />
        </branch>
        <branch name="i_clock">
            <wire x2="992" y1="400" y2="400" x1="976" />
        </branch>
        <branch name="i_clock">
            <wire x2="976" y1="560" y2="560" x1="960" />
            <wire x2="992" y1="560" y2="560" x1="976" />
        </branch>
        <branch name="i_clock">
            <wire x2="976" y1="656" y2="656" x1="960" />
            <wire x2="992" y1="656" y2="656" x1="976" />
        </branch>
        <branch name="i_reset">
            <wire x2="976" y1="688" y2="688" x1="960" />
            <wire x2="992" y1="688" y2="688" x1="976" />
        </branch>
        <branch name="i_reset">
            <wire x2="976" y1="720" y2="720" x1="960" />
            <wire x2="992" y1="720" y2="720" x1="976" />
        </branch>
        <branch name="XLXN_630(3:0)">
            <wire x2="976" y1="784" y2="784" x1="960" />
            <wire x2="992" y1="784" y2="784" x1="976" />
        </branch>
        <branch name="XLXN_631">
            <wire x2="992" y1="592" y2="592" x1="752" />
            <wire x2="752" y1="592" y2="608" x1="752" />
            <wire x2="752" y1="608" y2="624" x1="752" />
        </branch>
        <branch name="XLXN_632">
            <wire x2="832" y1="624" y2="624" x1="816" />
            <wire x2="992" y1="624" y2="624" x1="832" />
        </branch>
        <instance x="752" y="752" name="XLXI_186" orien="R0" />
        <instance x="688" y="752" name="XLXI_187" orien="R0" />
        <instance x="896" y="912" name="XLXI_188(3:0)" orien="R0" />
        <branch name="XLXN_633(3:0)">
            <wire x2="992" y1="752" y2="752" x1="896" />
            <wire x2="896" y1="752" y2="768" x1="896" />
            <wire x2="896" y1="768" y2="784" x1="896" />
        </branch>
        <instance x="832" y="912" name="XLXI_189(3:0)" orien="R0" />
        <branch name="XLXN_634(3:0)">
            <wire x2="736" y1="528" y2="528" x1="720" />
            <wire x2="992" y1="528" y2="528" x1="736" />
        </branch>
        <branch name="XLXN_635(3:0)">
            <wire x2="992" y1="496" y2="496" x1="656" />
            <wire x2="656" y1="496" y2="512" x1="656" />
            <wire x2="656" y1="512" y2="528" x1="656" />
        </branch>
        <instance x="656" y="656" name="XLXI_190(3:0)" orien="R0" />
        <instance x="592" y="656" name="XLXI_191(3:0)" orien="R0" />
        <branch name="XLXN_636(31:0)">
            <wire x2="624" y1="464" y2="464" x1="608" />
            <wire x2="992" y1="464" y2="464" x1="624" />
        </branch>
        <branch name="XLXN_637(31:0)">
            <wire x2="992" y1="432" y2="432" x1="544" />
            <wire x2="544" y1="432" y2="448" x1="544" />
            <wire x2="544" y1="448" y2="464" x1="544" />
        </branch>
        <instance x="544" y="592" name="XLXI_192(31:0)" orien="R0" />
        <instance x="480" y="592" name="XLXI_193(31:0)" orien="R0" />
        <branch name="XLXN_638">
            <wire x2="992" y1="304" y2="304" x1="768" />
            <wire x2="768" y1="304" y2="320" x1="768" />
            <wire x2="768" y1="320" y2="336" x1="768" />
        </branch>
        <branch name="XLXN_639">
            <wire x2="848" y1="336" y2="336" x1="832" />
            <wire x2="992" y1="336" y2="336" x1="848" />
        </branch>
        <instance x="768" y="464" name="XLXI_194" orien="R0" />
        <instance x="704" y="464" name="XLXI_195" orien="R0" />
        <iomarker fontsize="28" x="1712" y="384" name="i2c_mem_douta(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2320" y="192" name="i2c_mem_ena" orien="R0" />
        <iomarker fontsize="28" x="2320" y="256" name="o_rdy" orien="R0" />
        <iomarker fontsize="28" x="2320" y="512" name="o_kvdd(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2320" y="576" name="o_vdd25(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2320" y="320" name="i2c_mem_addra(11:0)" orien="R0" />
        <iomarker fontsize="28" x="1696" y="320" name="i_run" orien="R180" />
        <iomarker fontsize="28" x="1696" y="256" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="1696" y="192" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="976" y="400" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="960" y="688" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="960" y="656" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="960" y="560" name="i_clock" orien="R180" />
        <iomarker fontsize="28" x="960" y="720" name="i_reset" orien="R180" />
        <iomarker fontsize="28" x="976" y="368" name="i_clock" orien="R180" />
        <instance x="1728" y="608" name="ExtractVDDParameters_process_p0_inst" orien="R0">
        </instance>
        <branch name="ADDRA(14:0)">
            <wire x2="944" y1="80" y2="240" x1="944" />
            <wire x2="992" y1="240" y2="240" x1="944" />
            <wire x2="2640" y1="80" y2="80" x1="944" />
            <wire x2="2640" y1="80" y2="384" x1="2640" />
            <wire x2="2640" y1="384" y2="384" x1="2624" />
        </branch>
        <branch name="ADDRB(14:0)">
            <wire x2="928" y1="64" y2="272" x1="928" />
            <wire x2="992" y1="272" y2="272" x1="928" />
            <wire x2="2656" y1="64" y2="64" x1="928" />
            <wire x2="2656" y1="64" y2="448" x1="2656" />
            <wire x2="2640" y1="448" y2="448" x1="2624" />
            <wire x2="2656" y1="448" y2="448" x1="2640" />
        </branch>
    </sheet>
</drawing>