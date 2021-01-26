transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/sahasra/Documents/dld/lab1/main/andGate.vhd}
vcom -93 -work work {/home/sahasra/Documents/dld/lab1/main/notGate.vhd}
vcom -93 -work work {/home/sahasra/Documents/dld/lab1/main/orGate.vhd}
vcom -93 -work work {/home/sahasra/Documents/dld/lab1/main/main.vhd}

vcom -93 -work work {/home/sahasra/Documents/dld/lab1/main/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
