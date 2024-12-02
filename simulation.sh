#!/bin/bash

. /home/user/.local/Xilinx/14.7/ISE_DS/settings64.sh

PROJECT="tb_test1"

fuse -intstyle ise -incremental -lib secureip -o ./${PROJECT}_isim_beh.exe -prj ./${PROJECT}_beh.prj work.${PROJECT} 
if [[ $? -ne 0 ]]; then
echo "fuse error";
exit 1;
fi
./${PROJECT}_isim_beh.exe -log isim_output.txt -tclbatch simulation.cmd

