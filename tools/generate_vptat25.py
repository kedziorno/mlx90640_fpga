#!/home/user/.local/bin/python3

# EE[0x2431]

import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

str1 = list()
str2 = ""

a = 0

for i in range (0, 0xFFFF+1):
	col1 = i
	col2 = col1 - 65536 if ( col1 > 32767 ) else col1
	#print ("%d"%i,"%d"%col1,"%d"%col2,"%s"%float_to_hex(col2))
	str1.append(float_to_hex(col2))

#print (str1)

for i in range (0, 0xFFFF, 8):
	for j in reversed(range(0,8)):
		c=a+j
		#print (c)
		str2 = str2 + str1[c][2:]
		str2 = str2
	a = a + 8
	str2 = str2 + "\n"

print (str2)

