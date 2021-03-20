transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/sahasra/Documents/dld/5/Testbench_EightbitKogStonAddSub.vhd}
vcom -93 -work work {/home/sahasra/Documents/dld/5/TwoByOneMux.vhd}
vcom -93 -work work {/home/sahasra/Documents/dld/5/generator.vhd}
vcom -93 -work work {/home/sahasra/Documents/dld/5/EightbitKogStonAddSub.vhd}
vcom -93 -work work {/home/sahasra/Documents/dld/5/carryGen.vhd}
vcom -93 -work work {/home/sahasra/Documents/dld/5/basic_gates.vhd}

vcom -93 -work work {/home/sahasra/Documents/dld/5/Testbench_EightbitKogStonAddSub.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Testbench_EightbitKogStonAddSub

add wave *
view structure
view signals
run -all