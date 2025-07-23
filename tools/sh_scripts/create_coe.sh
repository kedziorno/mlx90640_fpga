#!/bin/sh

fr="frame_raw${1}"

rm -rf ipcore_dir/tb_data_mlx90640.coe

echo "memory_initialization_radix=16;" > ipcore_dir/tb_data_mlx90640.coe
echo "memory_initialization_vector=" >> ipcore_dir/tb_data_mlx90640.coe

awk -F "x" '{printf("%s,\n",$2);}' eeprom >> ipcore_dir/tb_data_mlx90640.coe
awk -F "x" '{printf("%s,\n",$2);}' ${fr} >> ipcore_dir/tb_data_mlx90640.coe

echo "19,\n01,\n00,\n01,\n" >> ipcore_dir/tb_data_mlx90640.coe

