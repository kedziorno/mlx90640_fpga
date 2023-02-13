#!/bin/env python3

row = 24
col = 32

mem_row = 0
mem_col = 0

ee_start = 0x2410

ee_occrow_start = 0x2412 - ee_start
ee_occrow_end = 0x2417 - ee_start
ee_occrow_len = (ee_occrow_end - ee_occrow_start + 1) * 4

ee_occcol_start = 0x2418 - ee_start
ee_occcol_end = 0x241f - ee_start
ee_occcol_len = (ee_occcol_end - ee_occcol_start + 1) * 4

ee_offset_start = 0x2440 - ee_start
ee_offset_end = 0x273f - ee_start
ee_offset_len = ee_offset_end - ee_offset_start

state_variable = "state"
state_name = "s"
state_index_start = 0
state_index_length = 22

index = 0

for i in range (0, ee_occrow_len):
	for j in range (0, ee_occcol_len):
		mem_row = 0 + i
		mem_col = ee_occrow_len + j
		#print ("%d,%d"%(i,j))
		print("\
when %s%d => %s := %s%d; 	--1\n\
	write_enable <= '0';\n\
	i2c_mem_addra <= std_logic_vector (to_unsigned (%d, 12)); -- offset LSB %d\n\
	addra <= std_logic_vector (to_unsigned (%d, 10)); -- OCCColumnJ %d\n\
when %s%d => %s := %s%d;	--2\n\
	i2c_mem_addra <= std_logic_vector (to_unsigned (%d, 12)); -- offset MSB %d\n\
	addra <= std_logic_vector (to_unsigned (%d, 10)); -- OCCrowI %d\n\
	vOCCColumnJ := doa;\n\
	vOffset (7 downto 0) := i2c_mem_douta;\n\
when %s%d => %s := %s%d; 	--3\n\
	vOCCRowI := doa;\n\
	vOffset (15 downto 8) := i2c_mem_douta;\n\
	vOffset_sf := resize (to_sfixed (vOffset, eeprom16sf), vOffset_sf);\n\
	fixed2floatce <= '1';\n\
	fixed2floatond <= '1';\n\
	fixed2floata <= \n\
	to_slv (to_sfixed (to_slv (vOffset_sf (fracas'high downto fracas'low)), fracas))&\n\
	to_slv (to_sfixed (to_slv (vOffset_sf (fracbs'high downto fracbs'low)), fracbs));\n\
when %s%d => 			--4\n\
	if (fixed2floatrdy = '1') then %s := %s%d;\n\
		vOffset_ft := fixed2floatr;\n\
		fixed2floatce <= '0';\n\
		fixed2floatond <= '0';\n\
		fixed2floatsclr <= '1';\n\
	else %s := %s%d; end if;\n\
when %s%d => %s := %s%d; 	--5\n\
	fixed2floatsclr <= '0';\n\
	mulfpce <= '1';\n\
	mulfpa <= vOffset_ft;\n\
	mulfpb <= voccRemScale;\n\
	mulfpond <= '1';\n\
when %s%d => 			--6\n\
	if (mulfprdy = '1') then %s := %s%d;\n\
		vOffset_ft := mulfpr;\n\
		mulfpce <= '0';\n\
		mulfpond <= '0';\n\
		mulfpsclr <= '1';\n\
	else %s := %s%d; end if;\n\
when %s%d => %s := %s%d; 	--7\n\
	mulfpsclr <= '0';\n\
	mulfpce <= '1';\n\
	mulfpa <= vOCCColumnJ;\n\
	mulfpb <= voccColScale;\n\
	mulfpond <= '1';\n\
when %s%d => 			--8\n\
	if (mulfprdy = '1') then %s := %s%d;\n\
		vOCCColumnJ := mulfpr;\n\
		mulfpce <= '0';\n\
		mulfpond <= '0';\n\
		mulfpsclr <= '1';\n\
	else %s := %s%d; end if;\n\
when %s%d => %s := %s%d; 	--9\n\
	mulfpsclr <= '0';\n\
when %s%d => %s := %s%d; 	--10\n\
	mulfpsclr <= '0';\n\
	mulfpce <= '1';\n\
	mulfpa <= vOCCRowI;\n\
	mulfpb <= voccRowScale;\n\
	mulfpond <= '1';\n\
when %s%d => 			--11\n\
	if (mulfprdy = '1') then %s := %s%d;\n\
		vOCCRowI := mulfpr;\n\
		mulfpce <= '0';\n\
		mulfpond <= '0';\n\
		mulfpsclr <= '1';\n\
	else %s := %s%d; end if;\n\
when %s%d => %s := %s%d; 	--12\n\
	mulfpsclr <= '0';\n\
when %s%d => %s := %s%d; 	--13\n\
	addfpsclr <= '0';\n\
	addfpce <= '1';\n\
	addfpa <= vOffset_ft;\n\
	addfpb <= vOCCColumnJ;\n\
	addfpond <= '1';\n\
when %s%d => 			--14\n\
	if (addfprdy = '1') then %s := %s%d;\n\
		vOffset_ft := addfpr;\n\
		addfpce <= '0';\n\
		addfpond <= '0';\n\
		addfpsclr <= '1';\n\
	else %s := %s%d; end if;\n\
when %s%d => %s := %s%d; 	--15\n\
	addfpsclr <= '0';\n\
when %s%d => %s := %s%d; 	--16\n\
	addfpsclr <= '0';\n\
	addfpce <= '1';\n\
	addfpa <= vOffset_ft;\n\
	addfpb <= vOCCRowI;\n\
	addfpond <= '1';\n\
when %s%d => 			--17\n\
	if (addfprdy = '1') then %s := %s%d;\n\
		vOffset_ft := addfpr;\n\
		addfpce <= '0';\n\
		addfpond <= '0';\n\
		addfpsclr <= '1';\n\
	else %s := %s%d; end if;\n\
when %s%d => %s := %s%d; 	--18\n\
	addfpsclr <= '0';\n\
when %s%d => %s := %s%d; 	--19\n\
	addfpsclr <= '0';\n\
	addfpce <= '1';\n\
	addfpa <= vOffset_ft;\n\
	addfpb <= vOffsetAverage;\n\
	addfpond <= '1';\n\
when %s%d => 			--20\n\
	if (addfprdy = '1') then %s := %s%d;\n\
		vOffset_ft := addfpr;\n\
		addfpce <= '0';\n\
		addfpond <= '0';\n\
		addfpsclr <= '1';\n\
	else %s := %s%d; end if;\n\
when %s%d => %s := %s%d; 	--21\n\
	addfpsclr <= '0';\n\
when %s%d => %s := %s%d; 	--22\n\
	write_enable <= '1';\n\
	addra <= std_logic_vector (to_unsigned (%d, 10)); -- vOffset_ft\n\
	dia <= vOffset_ft;\n\
"%(
state_name,state_index_start,state_variable,state_name,state_index_start+1,#1
ee_offset_start+(2*index),(2*index),mem_col,j,
state_name,state_index_start+1,state_variable,state_name,state_index_start+2, #2
ee_offset_start+(2*index)+1,(2*index)+1,mem_row,i,
state_name,state_index_start+2,state_variable,state_name,state_index_start+3, #3
state_name,state_index_start+3, #4
state_variable,state_name,state_index_start+4,
state_variable,state_name,state_index_start+3,
state_name,state_index_start+4,state_variable,state_name,state_index_start+5, #5
state_name,state_index_start+5, #6
state_variable,state_name,state_index_start+6,
state_variable,state_name,state_index_start+5,
state_name,state_index_start+6,state_variable,state_name,state_index_start+7, #7
state_name,state_index_start+7, #8
state_variable,state_name,state_index_start+8,
state_variable,state_name,state_index_start+7,
state_name,state_index_start+8,state_variable,state_name,state_index_start+9, #9
state_name,state_index_start+9,state_variable,state_name,state_index_start+10, #10
state_name,state_index_start+10, #11
state_variable,state_name,state_index_start+11,
state_variable,state_name,state_index_start+10,
state_name,state_index_start+11,state_variable,state_name,state_index_start+12, #12
state_name,state_index_start+12,state_variable,state_name,state_index_start+13, #13
state_name,state_index_start+13, #14
state_variable,state_name,state_index_start+14,
state_variable,state_name,state_index_start+13,
state_name,state_index_start+14,state_variable,state_name,state_index_start+15, #15
state_name,state_index_start+15,state_variable,state_name,state_index_start+16, #16
state_name,state_index_start+16, #17
state_variable,state_name,state_index_start+17,
state_variable,state_name,state_index_start+16,
state_name,state_index_start+17,state_variable,state_name,state_index_start+18, #18
state_name,state_index_start+18,state_variable,state_name,state_index_start+19, #19
state_name,state_index_start+19, #20
state_variable,state_name,state_index_start+20,
state_variable,state_name,state_index_start+19,
state_name,state_index_start+20,state_variable,state_name,state_index_start+21, #21
state_name,state_index_start+21,state_variable,state_name,state_index_start+22, #22
row+col+index,
)
);
		state_index_start = state_index_start + state_index_length
		index = index + 1

	

