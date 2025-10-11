#!/bin/sh

# This simple script create COE file for Xilinx Block Memory Generator IPCore.
# Files used : first - eeprom, and rest frame_raw* generated from parse_raw_data.sh

fr="frame_raw${1}"

coe_path=$1

rm -rf ${coe_path}

echo "memory_initialization_radix=16;" > ${coe_path}
echo "memory_initialization_vector=" >> ${coe_path}

#echo "; -- eeprom" >> ${coe_path}
awk -F "x" '{printf("%s,\n",$2);}' eeprom >> ${coe_path}
for i in `ls frame_raw*`; do
  #echo "; -- $i" >> ${coe_path}
  awk -F "x" '{printf("%s,\n",$2);}' ${i} >> ${coe_path}
  #echo "19,\n01,\n00,\n01,\n" >> ${coe_path}
done


