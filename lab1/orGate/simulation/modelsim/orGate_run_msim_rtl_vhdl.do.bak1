transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/sahasra/Documents/dld/lab1/orGate/orGate.vhd}

vcom -93 -work work {/home/sahasra/Documents/dld/lab1/orGate/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Testbench.vhd

add wave *
view structure
view signals
run -all
