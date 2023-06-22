************************************************************************
* auCdl Netlist:
* 
* Library Name:  HW4
* Top Cell Name: Q2
* View Name:     schematic
* Netlisted on:  May 27 15:00:32 2022
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
* Cell Name:    Q2
* View Name:    schematic
************************************************************************

*.SUBCKT Q2
*.PININFO
*************************C Load******************************************
CC0 Vop Vss 1p $[CP]
CC1 Von Vss 1p $[CP]

************************Compensate**************************************
*RR1 Vop net3 60k $[RP]
*RR0 net7 Von 60k $[RP]
*CC3 net15 net3 0.15p $[CP]
*CC2 net41 net7 0.15p $[CP]

***********************First Stage*************************************
MM3 net15 Vb2 Vdd Vdd P_18 W=8.7u L=0.9u m=1
MM4 net41 Vb2 Vdd Vdd P_18 W=8.7u L=0.9u m=1
MM2 net41 Vin net40 Vss N_18 W=8u L=1.16u m=1
MM1 net15 Vip net40 Vss N_18 W=8u L=1.16u m=1

**********************Second Stage*************************************
MM6 Von net41 Vdd Vdd P_18 W=13u L=0.36u m=1
MMb3 Von Vb3 Vss Vss N_18 W=8u L=1u m=1
MM5 Vop net15 Vdd Vdd P_18 W=13u L=0.36u m=1
MMb2 Vop Vb3 Vss Vss N_18 W=8u L=1u m=1

**************************Tail Current*********************************
MMb1 net40 Vb1 Vss Vss N_18 W=5u L=2u m=1


Vdd Vdd gnd! 1.5v
Vss Vss gnd! 0v
Vac in gnd! ac = 1
Vicm Vicm gnd! dc = 1.29
Eacp Vip vicm in 0 0.5
Eacn Vin vicm in 0 -0.5

Vb1 Vb1 gnd! 0.45
Vb2 Vb2 gnd! 0.95
Vb3 Vb3 gnd! 0.48


.ac dec 10 1k 30G
.op
.pz V(Vop, Von) Vac
.tf V(Vop, Von) Vac
.probe ac vdb(Vop, Von)

.print c_tot = par('lx18(MM5)')
.print cgd = par('lx19(MM5)')
.print cgs = par('lx20(MM5)')
.print cgb = par('lx21(MM5)')
.print cdb = par('lx22(MM5)')

.measure ac gaindb max vdb(Vop, Von)
.measure ac unit_gain  when vdb(Vop,Von)=0 $ Unit Gain
.measure ac phase_p find vp(Vop,Von) when vdb(Vop,Von)=0 $ Phase
.pz V(Vop,Von) Vac  
.probe AC VP(Vop)
.END

