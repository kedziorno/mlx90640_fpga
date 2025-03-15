#!/bin/bash

#export XIL_MAP_LOCWARN=1

. /home/user/.local/Xilinx/14.7/ISE_DS/settings64.sh

MODE=$1 # step x n m p t b
shift # omit first arg $@
PROJECT=$1 # module name
shift # omit first arg $@

DEVICE="xc4vsx35-ff668-10"
#DEVICE="xc3s1200e-fg320-4"

PROJECT_DEVICE="${PROJECT}_${DEVICE}"

echo "*************************************************"
echo "Synthesis project ${PROJECT} for device ${DEVICE}"
echo "*************************************************"

set -x

rm -rf synthesis/${PROJECT_DEVICE} # cleanup previous
mkdir -p synthesis/${PROJECT_DEVICE}
cd synthesis/${PROJECT_DEVICE}

mkdir -p xst/projnav.tmp

rm -rf ${PROJECT}.prj
for i in $@; do
  echo "vhdl work ../../${i}" >> ${PROJECT}.prj
done;

cat << EOF_UCF > ${PROJECT}.ucf
NET "i_clock" TNM_NET = "i_clock";
NET "i_clock" PERIOD = 20 ns;  
EOF_UCF

cat << EOF_XST > ${PROJECT}.xst
set -tmpdir "xst/projnav.tmp"
set -xsthdpdir "xst"
run
-ifn ${PROJECT}.prj
-ifmt mixed
-ofn ${PROJECT}
-ofmt NGC
-p ${DEVICE}
-top ${PROJECT}
-opt_mode Speed
-opt_level 1
-iuc NO
-keep_hierarchy No
-netlist_hierarchy As_Optimized
-rtlview Yes
-glob_opt AllClockNets
-read_cores YES
-sd {"../../ipcore_dir"  }
-write_timing_constraints NO
-cross_clock_analysis NO
-hierarchy_separator /
-bus_delimiter <>
-case Maintain
-slice_utilization_ratio 100
-bram_utilization_ratio 100
-verilog2001 YES
-fsm_extract YES -fsm_encoding Auto
-safe_implementation No
-fsm_style LUT
-ram_extract Yes
-ram_style Auto
-rom_extract Yes
-mux_style Auto
-decoder_extract YES
-priority_extract Yes
-shreg_extract YES
-shift_extract YES
-xor_collapse YES
-rom_style Auto
-auto_bram_packing NO
-mux_extract Yes
-resource_sharing YES
-async_to_sync NO
-mult_style Auto
-iobuf YES
-max_fanout 500
-bufg 24
-register_duplication YES
-register_balancing No
-slice_packing YES
-optimize_primitives NO
-use_clock_enable Yes
-use_sync_set Yes
-use_sync_reset Yes
-iob Auto
-equivalent_register_removal YES
-slice_utilization_ratio_maxmargin 5
EOF_XST

xst="xst -intstyle xflow -ifn ./${PROJECT}.xst -ofn ./${PROJECT}.syr"
ngdbuild="ngdbuild -intstyle xflow -dd _ngo -sd ipcore_dir -nt timestamp -uc ${PROJECT}.ucf -p ${DEVICE} ${PROJECT}.ngc ${PROJECT}.ngd"
map="map -intstyle xflow -p ${DEVICE} -timing -logic_opt off -ol std -t 1 -register_duplication off -cm area -ir off -pr off -power off -o ${PROJECT}_map.ncd ${PROJECT}.ngd ${PROJECT}.pcf"
par="par -w -intstyle xflow -ol std -rl std -t 1 ${PROJECT}_map.ncd ${PROJECT}.ncd ${PROJECT}.pcf"
trce="trce -intstyle xflow -v 3 -s 10 -n 3 -fastpaths -xml ${PROJECT}.twx ${PROJECT}.ncd -o ${PROJECT}.twr ${PROJECT}.pcf -ucf ${PROJECT}.ucf"
bitgen="bitgen -intstyle xflow -w ${PROJECT}.ncd"

#step x n m p t b
case ${MODE} in
"x")
type="xst"
echo ${type}
${xst}
if [ $? -ne 0 ];
then
	echo "${type} : error on xst";
	exit;
fi
;;
"n")
type="ngdbuild"
echo ${type}
${xst}
if [ $? -ne 0 ];
then
	echo "${type} : error on xst";
	exit;
fi
${ngdbuild}
if [ $? -ne 0 ];
then
	echo "${type} : error on ngdbuild";
	exit;
fi
;;
"m")
type="map"
echo ${type}
${xst}
if [ $? -ne 0 ];
then
	echo "${type} : error on xst";
	exit;
fi
${ngdbuild}
if [ $? -ne 0 ];
then
	echo "${type} : error on ngdbuild";
	exit;
fi
${map}
if [ $? -ne 0 ];
then
	echo "${type} : error on map";
	exit;
fi
;;
"p")
type="par"
echo ${type}
${xst}
if [ $? -ne 0 ];
then
	echo "${type} : error on xst";
	exit;
fi
${ngdbuild}
if [ $? -ne 0 ];
then
	echo "${type} : error on ngdbuild";
	exit;
fi
${map}
if [ $? -ne 0 ];
then
	echo "${type} : error on map";
	exit;
fi
${par}
if [ $? -ne 0 ];
then
	echo "${type} : error on par";
	exit;
fi
;;
"t")
type="trce"
echo ${type}
${xst}
if [ $? -ne 0 ];
then
	echo "${type} : error on xst";
	exit;
fi
${ngdbuild}
if [ $? -ne 0 ];
then
	echo "${type} : error on ngdbuild";
	exit;
fi
${map}
if [ $? -ne 0 ];
then
	echo "${type} : error on map";
	exit;
fi
${par}
if [ $? -ne 0 ];
then
	echo "${type} : error on par";
	exit;
fi
${trce}
if [ $? -ne 0 ];
then
	echo "${type} : error on trce";
	exit;
fi
;;
"b")
type="bitgen"
echo ${type}
${xst}
if [ $? -ne 0 ];
then
	echo "${type} : error on xst";
	exit;
fi
${ngdbuild}
if [ $? -ne 0 ];
then
	echo "${type} : error on ngdbuild";
	exit;
fi
${map}
if [ $? -ne 0 ];
then
	echo "${type} : error on map";
	exit;
fi
${par}
if [ $? -ne 0 ];
then
	echo "${type} : error on par";
	exit;
fi
${trce}
if [ $? -ne 0 ];
then
	echo "${type} : error on trce";
	exit;
fi
${bitgen}
if [ $? -ne 0 ];
then
echo "${type} : error on bitgen";
exit;
fi
;;
esac;

echo "*** DONE ***"
ls -l ${PROJECT}.bit

