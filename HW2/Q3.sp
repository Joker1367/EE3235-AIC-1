************************************************************************
* auCdl Netlist:
* 
* Library Name:  HW2
* Top Cell Name: Q3
* View Name:     schematic
* Netlisted on:  Apr  8 00:07:02 2022
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
* Cell Name:    Q3
* View Name:    schematic
************************************************************************

*.SUBCKT Q3 Vb Vdd Vin Vout Vss
*.PININFO Vb:I Vdd:I Vin:I Vss:I Vout:O
MM1 Vout Vb Vdd Vdd P_18 W=0.4um L=2um m=1
MM0 Vout Vin Vss Vss N_18 W=0.4um L=2um m=1

Vdd Vdd gnd! 1.8v
Vb Vb gnd! 1.212v
Vin Vin gnd! 0.39v 
Vss Vss gnd! 0v

.op
.tf v(Vout) Vin

.END

