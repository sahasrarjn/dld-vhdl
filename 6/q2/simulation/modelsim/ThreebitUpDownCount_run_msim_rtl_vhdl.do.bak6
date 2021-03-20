transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/sahasra/Documents/dld/6/q2/ThreebitUpDownCount.vhd}
vcom -93 -work work {/home/sahasra/Documents/dld/6/q2/DFlipFlop.vhd}
vcom -93 -work work {/home/sahasra/Documents/dld/6/q2/basic_gates.vhd}

vcom -93 -work work {/home/sahasra/Documents/dld/6/q2/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  TestBench

add wave *
view structure
view signals
run -all
