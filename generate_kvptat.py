#!/home/user/.local/bin/python3

# EE[0x2432]

import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

str1 = list()
str2 = ""

a = 0
n = 0xFC

for i in range (0, 0xFF+1):
	col1 = i * 0xFF
	col2 = col1 / pow(2,10)
	col3 = col2 - 64 if ( col2 > 31 ) else col2
	col4 = col3 / pow(2,12)
	if i >= n:
		for i in range(n,0xFF):
			str1.append("0x00000000")
			break
	else:
		print ("%d"%i,"%d"%col1,"%d"%col2,"%d"%col3,"%f"%col4,"%s"%float_to_hex(col4))
		if float_to_hex(col4) == "0x0":
			str1.append("0x00000000")
		else:
			str1.append(float_to_hex(col4))

#print (str1)

for i in range (0, 0xFF, 8):
	for j in reversed(range(0,8)):
		c=a+j
		str2 = str2 + str1[c][2:]
	a = a + 8
	str2 = str2 + "\n"

print (str2)

