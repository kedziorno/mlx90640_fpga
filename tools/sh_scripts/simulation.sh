#!/bin/bash

. /home/user/.local/Xilinx/14.7/ISE_DS/settings64.sh

PROJECT="tb_test2"
SF="simulation.cmd"

rm -rf ${SF}

cat > ${SF} << EOF
onerror {resume}

wcfg new

set tb [group add tb]
wave add /${PROJECT}/ -into \$tb

set uut [group add uut]
wave add /${PROJECT}/uut -into \$uut

set i2c [group add i2c]
wave add /${PROJECT}/uut/melexis_mlx90640_i2c_i0 -into \$i2c

wcfg save ${PROJECT}

run 1 s
quit
EOF

fuse -intstyle ise -incremental -lib secureip -o ./${PROJECT}_isim_beh.exe -prj ./${PROJECT}_beh.prj work.${PROJECT} 
if [[ $? -ne 0 ]]; then
echo "fuse error";
exit 1;
fi

./${PROJECT}_isim_beh.exe -log isim_output.txt -tclbatch ${SF} -wdb ${PROJECT}.wdb -view ${PROJECT}.wcfg -wdb ${PROJECT}.wdb

sed -i "s/isim.wdb/${PROJECT}.wdb/g" ${PROJECT}.wcfg
#isimgui -tclbatch ./${SF} -view ${PROJECT}.wcfg
isimgui -view ${PROJECT}.wcfg

