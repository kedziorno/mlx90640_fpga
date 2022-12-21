#!/home/user/.local/bin/python3

# EE[0x2410]

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

for i in range (0, 0xFFFF+1):
	col1 = i * 0x1
	col2 = col1 - 65536 if ( col1 > 32767 ) else col1
	col3 = np.int16(col2)
	col3 = col3.view(np.int16)
	print ("%d"%i,"%d"%col1,"%d"%col2,"%d"%col3,"0x{:04x}".format((int(col2) & 0xFFFF), '04x'))
	str1.append("0x{:04x}".format((int(col2) & 0xFFFF), '04x'))

#print (str1)

for i in range (0, 0xFFFF, 16):
	for j in reversed(range(0,16)):
		c=a+j
		str2 = str2 + str1[c][2:]
	a = a + 16
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

