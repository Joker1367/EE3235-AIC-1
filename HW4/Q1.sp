************************************************************************
* auCdl Netlist:
* 
* Library Name:  HW4
* Top Cell Name: Q1
* View Name:     schematic
* Netlisted on:  May 24 22:27:37 2022
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
.option
+ captable
+ post



************************************************************************
* Library Name: HW4
* Cell Name:    Q1
* View Name:    schematic
************************************************************************

*.SUBCKT Q1
*.PININFO
CC0 Vout Vss 500f $[CP]
**************************Differential Pair*****************************
MM3 net19 net19 Vdd Vdd P_18  W=2u L=0.18u m=1
MM2 Vout net19 Vdd Vdd P_18   W=2u L=0.18u m=1
MM1 Vout Vin1 net22 Vss N_18  W=1u L=0.18u m=1
MM0 net19 Vin0 net22 Vss N_18 W=1u L=0.18u m=1

***************************Current Source*******************************
MM4 net22 Vb Vss Vss N_18 W=5u L=0.18u m=1

Vdd Vdd gnd! 1.5v
Vss Vss gnd! 0v
Vac in gnd! ac = 1
Vicm Vicm gnd! dc = 1
Eacp Vin0 vicm in 0 0.5
Eacn Vin1 vicm in 0 -0.5

Vb Vb gnd! 0.55v

.ac dec 10 500k 10G
.op
.pz V(Vout) Vac
.tf V(Vout) Vac
.probe ac vdb(Vout)
.measure ac gaindb max vdb(Vout)
.measure ac band when vdb(Vout)='gaindB-3.0'
.END

