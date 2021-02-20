transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/iitb/dld-vhdl/4/TwoByOneMux.vhd}
vcom -93 -work work {C:/iitb/dld-vhdl/4/FourbitCompTest.vhd}
vcom -93 -work work {C:/iitb/dld-vhdl/4/FourbitComp.vhd}
vcom -93 -work work {C:/iitb/dld-vhdl/4/basic_gates.vhd}

vcom -93 -work work {C:/iitb/dld-vhdl/4/FourbitCompTest.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  TestBench

add wave *
view structure
view signals
run -all
