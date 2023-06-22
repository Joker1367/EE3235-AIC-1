*CS_Amplifier.sp

.lib 'cic018.l' tt
.PARAM
.OPTION POST
.temp 25
.GLOBAL gnd!


MM1 vout1 vin gnd! gnd! N_18 W=15.41um L=1um m=10
MM2 vout2 vin gnd! gnd! N_18 W=15.41um L=1um m=1

R1 vdd vout1 15k
R2 vdd vout2 15k
vin vin gnd! 0.3956v
vdd vdd gnd! 1.8v

.op
.dc vin 0 1.8 0.05
.tf v(vout2) vin
.PROBE dc v(vout1)
.PROBE dc v(vout2)
*.PROBE vdb(vout) vdb(vin)
*.PROBE dc i(MM1)


.end
