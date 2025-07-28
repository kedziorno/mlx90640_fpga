#!/bin/bash

#set -x

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 number_frame comment"
  exit 1;
fi

number_frame=${1:-0}
comment=${2}

eeprom_file="eeprom"
frame_raw="frame_raw${number_frame}"

output_eeprom_file="include_eeprom.h"
#output_frame_raw="include_frame_raw${number_frame}.h"
output_frame_raw="include_frame_raw.h"

sed -e "s/0x//g" ${eeprom_file} > ${eeprom_file}.tmp
sed -e "s/0x//g" ${frame_raw} > ${frame_raw}.tmp

unset set
declare -a set
i=0
for line in `cat ${eeprom_file}.tmp`
do
  set[$i]=$line
  i=$((i+1))
done
#for key in "${!set[@]}"
#do
#  echo "$key => ${set[$key]}"
#done
rm -rf ${output_eeprom_file}
touch ${output_eeprom_file}
echo "/* ${comment} */" >> ${output_eeprom_file}
echo "#include <stdint.h>" >> ${output_eeprom_file}
echo "uint16_t image_eeprom_data[] = {" >> ${output_eeprom_file}
for ((k = 0 ; k < i ; k += 2))
do
  msb=${set[$k+0]}
  lsb=${set[$k+1]}
  echo "0x${msb}${lsb}," >> ${output_eeprom_file}
done
echo -n "};" >> ${output_eeprom_file}

unset set
declare -a set
i=0
for line in `cat ${frame_raw}.tmp`
do
  set[$i]=$line
  i=$((i+1))
done
#for key in "${!set[@]}"
#do
#  echo "$key => ${set[$key]}"
#done
rm -rf ${output_frame_raw}
touch ${output_frame_raw}
echo "/* ${comment} */" >> ${output_frame_raw}
echo "#include <stdint.h>" >> ${output_frame_raw}
echo "uint16_t image_frame_raw_data[] = {" >> ${output_frame_raw}
for ((k = 0 ; k < i ; k += 2))
do
  msb=${set[$k+0]}
  lsb=${set[$k+1]}
  echo "0x${msb}${lsb}," >> ${output_frame_raw}
done
echo -n "};" >> ${output_frame_raw}
rm -rf ${eeprom_file}.tmp
rm -rf ${frame_raw}.tmp

