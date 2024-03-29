transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/iitb/dld-vhdl/3/FourByTwoEncodeTest.vhd}
vcom -93 -work work {C:/iitb/dld-vhdl/3/TwoByOneMux.vhd}
vcom -93 -work work {C:/iitb/dld-vhdl/3/FourByTwoEncode.vhd}
vcom -93 -work work {C:/iitb/dld-vhdl/3/basic_gates.vhd}

vcom -93 -work work {C:/iitb/dld-vhdl/3/FourByTwoEncode/../FourByTwoEncodeTest.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  test

add wave *
view structure
view signals
run -all
