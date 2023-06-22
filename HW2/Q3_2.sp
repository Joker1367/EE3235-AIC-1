************************************************************************
* auCdl Netlist:
* 
* Library Name:  HW2
* Top Cell Name: Q3_2
* View Name:     schematic
* Netlisted on:  Apr 15 23:30:17 2022
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
.lib 'cic018.l' ff
.PARAM
.OPTION POST
.GLOBAL gnd!
.temp 25



************************************************************************
* Library Name: HW2
* Cell Name:    Q3_2
* View Name:    schematic
************************************************************************

*.SUBCKT Q3_2 Out Vdd Vss
*.PININFO Vdd:I Vss:I Out:O
************************************************************************
*DC bias voltage generator
MM4 V2 V2 Vss Vss N_18 W=0.4um L=2um m=1
MM3 Vb Vb Vdd Vdd P_18 W=0.4um L=2um m=1
MM2 Vb V2 Vss Vss N_18 W=0.4um L=2um m=1
Iref Vdd V2 91.87n
Vin V1 V2 0v
*************************************************************************
MM1 Out Vb Vdd Vdd P_18 W=0.4um L=2um m=1
MM0 Out V1 Vss Vss N_18 W=0.4um L=2um m=1

Vdd Vdd gnd! 1.8v
Vss Vss gnd! 0v
.op
.tf v(Out) Vin
.END

