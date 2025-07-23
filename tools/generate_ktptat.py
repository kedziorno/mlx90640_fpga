#!/home/user/.local/bin/python3

# EE[0x2432]

import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

def float_to_hex2(f):
	return hex(struct.unpack('<H', struct.pack('<e', f))[0])

str1 = list()
str2 = ""
str3 = list()

a = 0
n = 1024

for i in range (0, 0x3ff+1):
	col1 = i
	col2 = col1 - 1024 if ( col1 > 511 ) else col1
	col3 = col2 / pow(2,3)
	print ("%d"%i,"\t%d"%col1,"\t%d"%col2,"\t%f"%col3,"\t%s"%float_to_hex(col3),"\t%s"%float_to_hex(col3))
#	if float_to_hex(col3) == "0x0":
#		str1.append("0x00000000")
#	else:
	str1.append(float_to_hex(col3))

#print (str1)

for i in range (0, 0x3ff+1, 8):
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
