************************************************************************
* auCdl Netlist:
* 
* Library Name:  HW3
* Top Cell Name: Q1
* View Name:     schematic
* Netlisted on:  May  5 22:03:56 2022
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
* Cell Name:    Q1
* View Name:    schematic
************************************************************************

*.SUBCKT Q1 Vbias Vdd Vin1 Vin2 Vout1 Vout2 Vss
*.PININFO Vbias:I Vdd:I Vin1:I Vin2:I Vss:I Vout1:O Vout2:O
****************************Common Mode Gain*****************************
RR1 Vdd Vout 150K $[RP]
RR0 Vdd Vout 150K $[RP]
MM2 net8 Vbias Vss Vss N_18 W=3.5u L=2u m=1
MM1 Vout Vin2 net8 Vss N_18 W=37.5u L=7.5u m=1
MM0 Vout Vin1 net8 Vss N_18 W=37.5u L=7.5u m=1

****************************Differential Mode Gain***********************
RR3 Vdd Vout2 150K $[RP]
RR2 Vdd Vout1 150K $[RP]
MM5 net10 Vbias Vss Vss N_18 W=3.5u L=2u m=1
MM4 Vout2 Vin2 net10 Vss N_18 W=37.5u L=7.5u m=1
MM3 Vout1 Vin1 net10 Vss N_18 W=37.5u L=7.5u m=1

*************************TestBench**************************************
Vdd Vdd gnd! 1.8v
Vss Vss gnd! 0v
Vbias Vbias gnd! 0.453v

Vin+ Vin1 net9 dc 0 ac  0.01
Vin- Vin2 net9 dc 0 ac -0.01
Vcm  net9 gnd! dc 1.8

.op
.ac dec 10 10 100meg

.tf v(Vout) Vcm
.print ac v(Vout1) v(Vout2) v(Vout1,Vout2)
.probe ac v(Vout1) v(Vout2) v(Vout1,Vout2)
.print ac v(Vout)
.probe ac v(Vout)
.END

