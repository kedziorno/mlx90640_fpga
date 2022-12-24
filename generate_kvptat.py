#!/home/user/.local/bin/python3

# EE[0x2432]

import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

str1 = list()
str2 = ""
str3 = list()

a = 0
n = 63

for i in range (0, 64):
	col1 = i
	col2 = col1 - 64 if ( col1 > 31 ) else col1
	col3 = col2 / pow(2,12)
#	if i >= n:
#		for i in range(n,0xFF):
#			str1.append("0x00000000")
#			break
#	else:
	print ("%d"%i,"%d"%col1,"%d"%col2,"%f"%col3,"%s"%float_to_hex(col3))
#	if float_to_hex(col4) == "0x0":
#		str1.append("0x00000000")
#	else:
	str1.append(float_to_hex(col3))

#print (str1)

for i in range (0, 64, 8):
	for j in reversed(range(0,8)):
		c=a+j
		str2 = str2 + str1[c][2:]
	a = a + 8
	str3.append(str2)
	str2 = ""

print (str2)

idx = 0

for i in str3:
	if (idx <= 15):
		print ("INIT_0%1x"%idx+" => X\""+i+"\",")
	else:
		print ("INIT_%2x"%idx+" => X\""+i+"\",")
	idx = idx + 1

