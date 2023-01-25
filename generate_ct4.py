#!/home/user/.local/bin/python3

# EE[0x243F]

import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

str1 = list()
str2 = ""
str3 = list()
idx = 0
step = list()

for i in range (0, 4):
	col1 = i
	col2 = col1 * 10
#	print ("%d"%i, "%d"%col1, "%d"%col2, "%s"%float_to_hex(col2))
	str1.append(float_to_hex(col2))
	step.append(col2)
#print (str1)

#for j in reversed(range(0,4)):
#	str2 = str2 + str1[j][2:]
#str3.append(str2)
#str2 = ""
#print (str3)
#for i in str3:
#	if (idx <= 15):
#		print ("INIT_0%1x"%idx+" => X\""+i+"\",")
#	else:
#		print ("INIT_%2x"%idx+" => X\""+i+"\",")
#	idx = idx + 1

###

str1 = list()
str2 = ""
str3 = list()
idx = 0

#for i in range (0, 16):
#	for k in step:
#		col1 = i
#		col2 = col1 * k
#		col3 = float_to_hex(col2)
#		print ("%d"%col1, "%d"%k, "%d"%col2, "%s"%col3)
#		if col2 == 0:
#			str1.append(hex(0x22000000))
#		else:
#			str1.append(float_to_hex(col2))
#print (str1)

#for a in range(0,64,8):
#	for j in reversed(range(0,8)):
#		c=a+j
#		str2 = str2 + str1[c][2:]
#	a = a + 8
#	str3.append(str2)
#	str2 = ""
#print (str3)
#for i in str3:
#	if (idx <= 15):
#		print ("INIT_0%1x"%idx+" => X\""+i+"\",")
#	else:
#		print ("INIT_%2x"%idx+" => X\""+i+"\",")
#	idx = idx + 1

###

str1 = list()
str2 = ""
str3 = list()
idx = 0

for k in step:
	for i in range (0, 16):
		for j in range (0, 16):
			col1 = i
			col2 = j
			col3 = k
			col4 = col1 * col3
			col5 = col2 * col3
			col6 = col4 + col5
			print ("%d"%col3, "%d"%col1, "%d"%col2, "%d"%col4, "%d"%col5, "%d"%col6, "%s"%float_to_hex(col6))
			if col6 == 0:
				str1.append(hex(0x22000000))
			else:
				str1.append(float_to_hex(col6))

#print (str1)

for a in range(0,256*4,8):
	for j in reversed(range(0,8)):
		c=a+j
		str2 = str2 + str1[c][2:]
	a = a + 8
	str3.append(str2)
	str2 = ""

for i in str3:
	if (idx <= 15):
		print ("INIT_0%1x"%idx+" => X\""+i+"\",")
	else:
		print ("INIT_%2x"%idx+" => X\""+i+"\",")
	idx = idx + 1

