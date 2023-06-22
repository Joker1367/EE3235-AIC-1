* C_v.s_Vg

.lib 'cic018.l' tt
.PARAM
.OPTION POST
.GLOBAL gnd!

Vgs g gnd! 0

MN1 gnd! g gnd! gnd! N_18 W=2um L=200nm m=10
MN2 gnd! g gnd! gnd! N_18 W=20um L=200nm m=1

Vgnd gnd! 0 0v

.DC Vgs -1.8 1.8 0.05

.PROBE DC C_total_1=par("lx18(MN1)")
.PROBE DC C_gd_1=par("lx19(MN1)")
.PROBE DC C_gs_1=par("lx20(MN1)")
.PROBE DC C_gb_1=par("lx21(MN1)")

.PROBE DC C_total_2=par("lx18(MN2)")
.PROBE DC C_gd_2=par("lx19(MN2)")
.PROBE DC C_gs_2=par("lx20(MN2)")
.PROBE DC C_gb_2=par("lx21(MN2)")



.end
