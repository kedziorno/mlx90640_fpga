#!/bin/sh

PROJECT="tb_test1"

fuse -intstyle ise -incremental -lib secureip -o ./${PROJECT}_isim_beh.exe -prj ./${PROJECT}_beh.prj work.${PROJECT}
./${PROJECT}_isim_beh.exe -log isim_output.txt -tclbatch isim.cmd

