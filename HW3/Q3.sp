************************************************************************
* auCdl Netlist:
* 
* Library Name:  HW3
* Top Cell Name: Q3
* View Name:     schematic
* Netlisted on:  May  7 10:16:52 2022
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
* Cell Name:    Q3
* View Name:    schematic
************************************************************************

*.SUBCKT Q3
*.PININFO
***********************************common source************************
MM3 Vout1 Vb1 Vdd Vdd P_18 W=3.5u L=2u m=1
MM0 Vout1 Vin1 Vss Vss N_18 W=1u L=10u m=1

**********************************source follower***********************
MM2 Vdd Vin2 Vout2 Vss N_18 W=1u L=0.18u m=1
MM1 Vout2 Vb2 Vss Vss N_18 W=1u L=0.18u m=1

**********************************Testbench*****************************
Vdd Vdd gnd! 1.8v
Vss Vss gnd! 0v
Vin1 Vin1 gnd! dc 0.7v ac 0.01v
Vin2 Vin2 gnd! dc 1.4v ac 0.01v
Vb1 Vb1 gnd! 1.151v
Vb2 Vb2 gnd! 0.64v


.op
.ac dec 10 10 100G
.tf v(Vout1) Vin1
.noise v(Vout1) Vin1 10000
.print noise onoise inoise
.probe noise onoise inoise
.tf v(Vout2) Vin2
.noise v(Vout2) Vin2 10000
*.print noise onoise inoise
*.probe noise onoise inoise
.END

