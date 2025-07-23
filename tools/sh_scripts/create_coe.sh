#!/bin/sh

fr="frame_raw${1}"

coe_path=$2

rm -rf ${coe_path}

echo "memory_initialization_radix=16;" > ${coe_path}
echo "memory_initialization_vector=" >> ${coe_path}

awk -F "x" '{printf("%s,\n",$2);}' eeprom >> ${coe_path}
awk -F "x" '{printf("%s,\n",$2);}' ${fr} >> ${coe_path}

echo "19,\n01,\n00,\n01,\n" >> ${coe_path}

