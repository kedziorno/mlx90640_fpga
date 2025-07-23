#!/home/user/.local/bin/python3

# EE[0x2440] - 

import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

str1 = list()
str2 = ""
str3 = list()
idx = 0
step = list()

for i in range (0, 64):
	col1 = i
	col2 = (col1 - 64) if col1 > 31 else col1
	col3 = float_to_hex(col2)
	#print ("%d"%col1, "%d"%col2, "%s"%col3)
	str1.append ("x\"%s\" when \"%s\","%(col3[2:],'{:06b}'.format(col1)))
#	if col2 == 0:
#		str1.append(hex(0x22000000))
#	else:
#		str1.append(float_to_hex(col2))
#print (str1)

for a in range(0,64,8):
	for j in reversed(range(0,8)):
		c=a+j
		str2 = str2 + str1[c]
	a = a + 8
	str3.append(str2)
	str2 = ""
#print (str3)

for i in str3:
	if (idx <= 15):
		print ("%s"%i)
	else:
		print ("%s\n"%i)
	idx = idx + 1


