* i_v.s_vds.sp

.lib 'cic018.l' tt
.PARAM
.OPTION POST
.GLOBAL gnd! vdd!

Vgs g gnd! 0.6
Vds d gnd! 1.8

M1 d g gnd! gnd! N_18 W=5um L=2um m=1 
M2 d g gnd! gnd! N_18 W=5um L=200nm m=1

Vvdd vdd! 0 1.8v
Vgnd gnd! 0 0v

.OP
.DC Vds 0 1.8 0.05 SWEEP Vgs 0 1.8 0.3

.PROBE DC i(M1) i(M2)

.end
