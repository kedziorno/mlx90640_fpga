NEWPROJECT "./coregen.cgp"
 
SET addpads=True
SET asysymbol=false
SET busformat=BusFormatAngleBracketNotRipped
SET createndf=false
SET designentry=vhdl 
SET devicefamily=virtex4 
SET device=xc4vsx35
SET flowvendor=Foundation_iSE 
SET foundationsym=false 
SET formalverification=false 
SET implementationfiletype=ngc 
SET package=ff668
SET removerpms=false 
SET simulationfiles=behavioral 
SET speedgrade=-10 
SET verilogsim=false 
SET vhdlsim=false 
SET workingdirectory="./tmp" 
SET projectname="coregen" 

EXECUTE "./addfp.xco"
EXECUTE "./subfp.xco"
EXECUTE "./mulfp.xco"
EXECUTE "./divfp.xco"
EXECUTE "./sqrtfp2.xco"
EXECUTE "./fixed2float.xco"
EXECUTE "./float2fixed.xco"
EXECUTE "./inst_mem_kvdd_vdd25.xco"
EXECUTE "./dualmem.xco"
EXECUTE "./i2c_mem.xco"
EXECUTE "./tb_data_calculateTo.xco"
EXECUTE "./tb_i2c_mem.xco"

END
