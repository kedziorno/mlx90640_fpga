transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/FloatingPointAdder_32bit.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/FloatingPointMultiplier_32bit.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/FloatingPointDivider_32bit.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/FloatingPointSubtractor_32bit.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/FloatingPointSQRT_32bit.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/RAMB16_S36.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/RAMB16_S36_S36.vhd}
vlib ieee_proposed
vmap ieee_proposed ieee_proposed
vcom -93 -work ieee_proposed {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ieee_proposed_altera/fixed_float_types_c.vhdl}
vcom -93 -work ieee_proposed {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ieee_proposed_altera/std_logic_1164_additions.vhdl}
vcom -93 -work ieee_proposed {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ieee_proposed_altera/numeric_std_additions.vhdl}
vcom -93 -work ieee_proposed {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ieee_proposed_altera/standard_additions_c.vhdl}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculateVirCompensated.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/mem_signed1024.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractKsToScaleParameter.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/mem_switchpattern.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculateTo.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculateAlphaComp.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractKvPTATParameter.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractAlphaPtatParameter.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/mem_signedFF.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractVDDParameters.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractKtPTATParameter.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/mem_ramb16_s36_x2.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/RAMB16_S36_wrapper.vhd}
vcom -93 -work ieee_proposed {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ieee_proposed_altera/standard_textio_additions_c.vhdl}
vcom -93 -work ieee_proposed {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ieee_proposed_altera/fixed_pkg_c.vhdl}
vcom -93 -work ieee_proposed {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ieee_proposed_altera/float_pkg_c.vhdl}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/p_fphdl_package1.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/fixed2float.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/p_fphdl_package3.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculateAlphaCP.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/calculateVdd.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/test_fixed_melexis.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculatePixOS.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractAlphaParameters.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/calculateTa.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculatePixOsCPSP.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractKvParameters.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractKsTaParameters.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractTGCParameters.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractOffsetParameters.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/calculateKGain.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/ExtractKtaParameters.vhd}
vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/CalculatePixGain.vhd}

vcom -93 -work work {/home/user/_WORKSPACE_/kedziorno/mlx90640_fpga/tb_test_fixed_melexis.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -L ieee_proposed -voptargs="+acc"  tb_test_fixed_melexis

add wave *
view structure
view signals
run -all
