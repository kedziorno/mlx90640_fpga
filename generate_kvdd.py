#!/home/user/.local/bin/python3

# EE[0x2433]

import numpy as np
import struct

# https://stackoverflow.com/a/23624284
def float_to_hex(f):
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])

# https://stackoverflow.com/a/72291385
#def float_to_hex(f):
#	a = np.float16(f)
#	b = a.view(np.int16)
	#c = struct.pack('<h', a)
#	d = struct.unpack("H",struct.pack('<h', f))
	#a = struct.pack('<e',f)
	#b = struct.unpack('<I',a)
	#return b
#	return d[0]
#	return ' '.join('{:02x}'.format(c))
	#a = struct.pack('<e',f)
	#return " ".join(f"{a:02x}")
	#a = np.float32(f)
	#return hex(a.view(np.int32))
	
str1 = list()
str2 = ""
str3 = list()

a = 0

for i in range (0, 0xFF+1):
	col1 = i * 0x100
	col2 = col1 / pow(2,8)
	col3 = col2 - 256 if ( col2 > 127 ) else col2
	col4 = col3 * pow(2,5)
	#col4 = np.int16(col4)
	#col4 = col4.view(np.int16)
	#print ("%d"%i,"%f"%col1,"%f"%col2,"%f"%col3,"%d"%col4,"0x{:04x}".format((int(col4) & 0xFFFF), '04x'))
	#str1.append("0x{:04x}".format((int(col4) & 0xFFFF), '04x'))
	print ("%d"%i,"%f"%col1,"%f"%col2,"%f"%col3,"%d"%col4,"%s"%float_to_hex(col4))
	str1.append("%s"%float_to_hex(col4))

print (str1)

for i in range (0, 0xFF, 8):
	for j in reversed(range(0,8)):
		c=a+j
		str2 = str2 + str1[c][2:]
	a = a + 8
	str3.append(str2)
	str2 = ""

#print (str3)

idx = 0

for i in str3:
	if (idx <= 15):
		print ("INIT_0%1x"%idx+" => X\""+i+"\",")
	else:
		print ("INIT_%2x"%idx+" => X\""+i+"\",")
	idx = idx + 1

