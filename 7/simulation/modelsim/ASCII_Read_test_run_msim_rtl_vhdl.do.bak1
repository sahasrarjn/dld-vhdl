transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/iitb/dld-vhdl/7/rl_encoder.vhd}

vcom -93 -work work {C:/iitb/dld-vhdl/7/ASCII_Read_test.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  ASCII_Read_test

add wave *
view structure
view signals
run -all
