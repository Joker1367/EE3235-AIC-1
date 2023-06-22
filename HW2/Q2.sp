************************************************************************
* auCdl Netlist:
* 
* Library Name:  HW2
* Top Cell Name: Q2
* View Name:     schematic
* Netlisted on:  Apr  6 21:51:06 2022
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
* Cell Name:    Q2
* View Name:    schematic
************************************************************************

*.SUBCKT Q2 Vb1 Vb2 Vb3 Vdd Vin Vout Vss
*.PININFO Vb1:I Vb2:I Vb3:I Vdd:I Vin:I Vout:I Vss:I
************************************************************************
*To do Question(b) just change m into 2 in every MOS
MM4 Vd34 Vb3 Vdd Vdd P_18 W=20um L=1um m=1
MM3 Vout Vb2 Vd34 Vdd P_18 W=20um L=1um m=1
MM1 Vout Vb1 Vd12 Vss N_18 w=5.8um L=1um m=1
MM0 Vd12 Vin Vss Vss N_18 W=5.8um L=1um m=1

Vb3 Vb3 gnd! 1.2v
Vb2 Vb2 gnd! 0.7v
Vb1 Vb1 gnd! 0.88v
Vin Vin gnd! 0.48v
Vdd Vdd gnd! 1.8v
Vss Vss gnd! 0v

.op
.tf v(vout) vin
.END

