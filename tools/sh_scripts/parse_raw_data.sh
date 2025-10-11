#!/bin/bash

# This simple script extract EEPROM and frames data (each equal 1664 bytes)
# captured by Saleae Logic (CSV file) from Melexis MLX90640 device over I2C.
# (Example, to create COE files for Xilinx IPCore Block Memory Generator).
#
# Usage         : ./script.sh input_file.csv
# Output files  : eeprom      - one file with internal data from device,
#                               used for rest calculations
#                 frame_rawXX - raw frame from device (XX is number index)
#
# Tested with binary Logic-2.4.29-linux-x64.AppImage program under Linux OS.

#set -v # debug
      IFS=$'\n'
input_set=$1

i2c_address_c="0x33"       # just to be sure it's MLX90640 device (manufacturer)
  eeprom_file="eeprom"     # eeprom data for each pixels
   frame_file="frame_raw"  # raw data for each captured frame

declare -A set;     # lines set
declare -A subset;  # fields set in aech line
frame_index=0
      index=0       # count lines in input file
       zero=0       # constant 0 in if tests
        one=1       # constant 1 in if tests

# split all input file based on IFS variable
for line in `cat ${input_set}`
do
  oldifs=$IFS
    IFS=$','
     fi=0;
  # field in reverse order
  for field in $line
  do
    subset[${fi}]=${field}
               fi=$((fi+1))
  done
  set[${index}]=${subset[@]}
          index=$((index+1))
            IFS=$oldifs
done

# debug
#echo "${!set[@]}" # keys
#echo "${set[@]}"  # values
#for key in "${!set[@]}"
#do
#  echo "$key => ${set[$key]}"
#done

# remove old extracted datas
rm -rf $eeprom_file
rm -rf ${frame_file}*

eeprom_first=$zero
 frame_first=$zero
         IFS=" "
           k=0
           a=0

# omit CSV header from Saleae Logic program
for ((i = 1 ; i < index ; i = i + 1))
do
  i2c_address=${data_field[3]}
   data_field=(${fields})
       fields=${set[$i]}
       step_i=$i
         data=${data_field[2]}
           rw=${data_field[1]}
      data_rw="${data},${rw},${i2c_address}"
  case $data_rw in
    "0x24,Write,${i2c_address_c}")
      k=1
      echo "${step_i} found MSB eeprom $data"
    ;;
    "0x04,Write,${i2c_address_c}")
      frame_first=$one;
                k=1;
      echo "${step_i} found MSB frame $frame_index $data";
    ;;
    *)
      if ((k==1))
      then
        case $data_rw in
          "0x00,Write,${i2c_address_c}")
            echo "${step_i} LSB match $data"
            if [ ${eeprom_first} -eq $zero ]
            then
              for ((a = i ; a < 1664 + i ; a++))
              do
                fields_eeprom=${set[$a]}
                  data_eeprom=(${fields_eeprom})
                       eeprom=${data_eeprom[2]}
                echo $eeprom >> ${eeprom_file}
              done
              eeprom_first=$one
                         k=$a
                         a=0
            fi
            if [ ${frame_first} -eq $one ]
            then
              frame_file_nr="${frame_file}${frame_index}"
              for ((a = i ; a < 1664 + i ; a++))
              do
                fields_frame=${set[$a]}
                  data_frame=(${fields_frame})
                       frame=${data_frame[2]}
                echo $frame >> ${frame_file_nr}
              done
              frame_index=$((frame_index+1))
                        k=$a
                        a=0
            fi
          ;;
        esac    
      else
        k=2
      fi
    ;;
  esac
  echo "${step_i} $k $data" # light debug
done

