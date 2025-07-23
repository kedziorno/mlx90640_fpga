#!/home/user/.local/bin/python3

# EE[0x2414] row12

import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

str1 = list()
str2 = ""

a = 0
n = 0xFC

for i in range (0, 0xF+1):
	col1 = i * 0x1000
	col2 = col1 / pow(2,12)
	col3 = col2 - 16 if col2 > 7 else col2
	print ("%d"%i,"%f"%col1,"%f"%col2,"%f"%col3,"%s"%float_to_hex(col3))
	str1.append(float_to_hex(col3))

#print (str1)

for i in range (0, 0xF, 8):
	for j in reversed(range(0,8)):
		c=a+j
		str2 = str2 + str1[c][2:]
	a = a + 8
	str2 = str2 + "\n"

print (str2)
