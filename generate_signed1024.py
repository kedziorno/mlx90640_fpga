#!/home/user/.local/bin/python3

# 

import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

str1 = list()
str2 = ""
str3 = list()
idx = 0
step = list()

for i in range (0, 1024):
	col1 = i
	col2 = (col1 - 1024) if col1 > 511 else col1
	col3 = float_to_hex (col2)
	print ("%d"%col1, "%d"%col2, "%s"%col3)
	if col2 == 0:
		str1.append(hex(0x00000000))
	else:
		str1.append(col3)
print (str1)

for a in range(0,1024,8):
	for j in reversed(range(0,8)):
		c=a+j
		str2 = str2 + str1[c][2:]
	a = a + 8
	str3.append(str2)
	str2 = ""
print (str3)

for i in str3:
	if (idx <= 15):
		print ("INIT_0%1x"%idx+" => X\""+i+"\",")
	else:
		print ("INIT_%2x"%idx+" => X\""+i+"\",")
	idx = idx + 1


