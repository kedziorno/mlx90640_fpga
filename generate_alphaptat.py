#!/home/user/.local/bin/python3

# EE[0x2410]

import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

str1 = list()
str2 = ""
str3 = list()

a = 0

for i in range (0, 0xF+1):
	col1 = i * 0x1000
	col2 = col1 / pow(2,12)
	col3 = col2 / pow(2,2) + 8
	print ("%d"%i,"%f"%col1,"%f"%col2,"%f"%col3,"%s"%float_to_hex(col3))
	str1.append(float_to_hex(col3))

#print (str1)

for i in range (0, 0xF, 8):
	for j in reversed(range(0,8)):
		c=a+j
		str2 = str2 + str1[c][2:]
	a = a + 8
	str3.append(str2)
	str2 = ""

#print (str2)

idx = 0
for i in str3:
	if (idx <= 15):
		print ("INIT_0%1x"%idx+" => X\""+i+"\",")
	else:
		print ("INIT_%2x"%idx+" => X\""+i+"\",")
	idx = idx + 1
