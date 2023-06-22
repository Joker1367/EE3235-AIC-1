************************************************************************
* auCdl Netlist:
* 
* Library Name:  HW3
* Top Cell Name: Q2
* View Name:     schematic
* Netlisted on:  May  7 10:17:08 2022
************************************************************************

*.BIPOLAR
*.RESI = 2000 
*.RESVAL
*.CAPVAL
*.DIOPERI
*.DIOAREA
*.EQUATION
*.SCALE METER
*.MEGA
.lib 'cic018.l' tt
.OPTION POST
.OPTION PROBE
.GLOBAL gnd!
.temp 25



************************************************************************
* Library Name: HW3
* Cell Name:    Q2
* View Name:    schematic
************************************************************************

*.SUBCKT Q2
*.PININFO
***************************LEFT*****************************************
MM3 net3 net7 Vss Vss N_18 W=15u L=2.5u m=9
MM2 net7 Vbias net3 Vss N_18 W=15u L=2.5u m=9
***************************Right****************************************
MM1 net11 net7 Vss Vss N_18 W=73u L=2.5u m=9
MM0 Out Vbias net11 Vss N_18 W=73u L=2.5u m=9

Vdd Vdd gnd! 1.8v
Vbias Vbias gnd! 0.54v
Vout Out gnd! 0.25v
Iref Vdd net7 20uA
Vss Vss gnd! 0v

.op
.tf v(Vout) Vout 


.END



