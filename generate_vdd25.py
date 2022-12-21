#!/home/user/.local/bin/python3

# EE[0x2410]

import struct

# https://stackoverflow.com/a/23624284
#def float_to_hex(f):
#	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

str1 = list()
str2 = ""
str3 = list()

a = 0

for i in range (0, 0xFF+1):
	col1 = i * 0x1
	col2 = (col1 - 256) * pow(2,5) - pow(2,13)
	print ("%d"%i,"%f"%col1,"%f"%col2,"0x{:04x}".format((int(col2) & 0xFFFF), '04x'))
	str1.append("0x{:04x}".format((int(col2) & 0xFFFF), '04x'))

#print (str1)

for i in range (0, 0xFF, 16):
	for j in reversed(range(0,16)):
		c=a+j
		str2 = str2 + str1[c][2:]
	a = a + 16
	str3.append(str2)
	str2 = ""

#print (str2)

idx = 16

for i in str3:
	if (idx <= idx + 15):
		print ("INIT_%1x"%idx+" => X\""+i+"\",")
	else:
		print ("INIT_%2x"%idx+" => X\""+i+"\",")
	idx = idx + 1
