transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/sdsubus {C:/Users/user/Desktop/sdsubus/master.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/sdsubus {C:/Users/user/Desktop/sdsubus/slave.v}

