#!/bin/bash

#export XIL_MAP_LOCWARN=1

. /home/user/.local/Xilinx/14.7/ISE_DS/settings64.sh

PROJECT="test1"
#DEVICE="xc4vsx35-ff668-10"
DEVICE="xc3s1200e-fg320-4"

echo "*************************************************"
echo "Synthesis project ${PROJECT} for device ${DEVICE}"
echo "*************************************************"

set -x

mkdir -p xst/projnav.tmp/

xst -intstyle ise -ifn ./${PROJECT}.xst -ofn ./${PROJECT}.syr
#echo xst
if [ $? -ne 0 ];
then
	echo "error on xst";
	exit;
else
	ngdbuild -intstyle ise -dd _ngo -sd ipcore_dir -nt timestamp -uc ${PROJECT}.ucf -p ${DEVICE} ${PROJECT}.ngc ${PROJECT}.ngd
	#echo ngdbuild
	if [ $? -ne 0 ];
	then
		echo "error on ngdbuild";
		exit;
	else
		map -intstyle ise -p ${DEVICE} -timing -logic_opt off -ol std -t 1 -register_duplication off -cm area -ir off -pr off -power off -o ${PROJECT}_map.ncd ${PROJECT}.ngd ${PROJECT}.pcf
		#echo map
		if [ $? -ne 0 ];
		then
			echo "error on map";
			exit;
		else
			par -w -intstyle ise -ol std -rl std -t 1 ${PROJECT}_map.ncd ${PROJECT}.ncd ${PROJECT}.pcf
			if [ $? -ne 0 ];
			then
				echo "error on par";
				exit;
			else
				trce -intstyle ise -v 3 -s 10 -n 3 -fastpaths -xml ${PROJECT}.twx ${PROJECT}.ncd -o ${PROJECT}.twr ${PROJECT}.pcf -ucf ${PROJECT}.ucf
				if [ $? -ne 0 ];
				then
					echo "error on trce";
					exit;
				else
					bitgen -intstyle ise -w ${PROJECT}.ncd
					if [ $? -ne 0 ];
					then
						echo "error on bitgen";
						exit;
					else
						ls -l ${PROJECT}.bit
					fi
				fi
			fi
		fi
	fi
fi


