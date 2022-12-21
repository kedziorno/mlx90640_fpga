#!/home/user/.local/bin/python3

# EE[0x2432]

import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

str1 = list()
str2 = ""

a = 0
n = 0x3FF

for i in range (0, n+1):
	col1 = i * 0xFF
	col2 = col1 - 1024 if ( col1 > 511 ) else col1
	col3 = col2 / pow(2,3)
	print ("%d"%i,"%d"%col1,"%d"%col2,"%f"%col3,"%s"%float_to_hex(col3))
	if float_to_hex(col3) == "0x0":
		str1.append("0x00000000")
	else:
		str1.append(float_to_hex(col3))

#print (str1)

for i in range (0, 0x3FF, 8):
	for j in reversed(range(0,8)):
		c=a+j
		str2 = str2 + str1[c][2:]
	a = a + 8
	str2 = str2 + "\n"

print (str2)

