************************************************************************
* auCdl Netlist:
* 
* Library Name:  HW2
* Top Cell Name: Q1
* View Name:     schematic
* Netlisted on:  Apr  6 14:46:49 2022
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
.PARAM
.OPTION POST
.GLOBAL gnd!
.temp 25


************************************************************************
* Library Name: HW2
* Cell Name:    Q1
* View Name:    schematic
************************************************************************

*.SUBCKT Q1 Vb Vdd Vin Vout Vss
*.PININFO Vb:I Vdd:I Vin:I Vss:I Vout:O

*************Question(b)***************************
MM3 Vout2 Vbb Vss Vss N_18 W=4um L=1um m=1
MM2 Vdd Vin2 Vout2 Vout2 N_18 W=4um L=1um m=1
*************Question(a)***************************
MM1 Vout1 Vb Vss Vss N_18 W=4um L=0.18um m=1
MM0 Vdd Vin Vout1 Vss N_18 W=4um L=0.18um m=1


Vdd Vdd gnd! 1.8v
Vbb Vbb gnd! 0.495v
Vb Vb gnd! 0.7v
Vin Vin gnd! 1v
Vin2 Vin2 gnd! 1.33v
Vss Vss gnd! 0v

.op
.tf v(Vout1) Vin
*.tf v(Vout2) Vin2
.dc Vin 0.5 1.8 0.05

.END

