#!/bin/sh

PROJECT="test1"
DEVICE="xc4vsx35-ff668-10"

echo "*************************************************"
echo "Synthesis project ${PROJECT} for device ${DEVICE}"
echo "*************************************************"

set -x

mkdir -p xst/projnav.tmp/

xst -intstyle ise -ifn ./${PROJECT}.xst -ofn ./${PROJECT}.syr
if [ $? -ne 0 ];
then
	echo "error on xst";
	exit;
else
	ngdbuild -intstyle ise -dd _ngo -sd ipcore_dir -nt timestamp -uc ${PROJECT}.ucf -p ${DEVICE} ${PROJECT}.ngc ${PROJECT}.ngd
	if [ $? -ne 0 ];
	then
		echo "error on ngdbuild";
		exit;
	else
		map -intstyle ise -p ${DEVICE} -global_opt speed -equivalent_register_removal on -cm area -detail -ir off -pr off -ol std -timing -c 100 -o ${PROJECT}_map.ncd ${PROJECT}.ngd ${PROJECT}.pcf
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
					bitgen -intstyle ise -f ${PROJECT}.ut ${PROJECT}.ncd
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


