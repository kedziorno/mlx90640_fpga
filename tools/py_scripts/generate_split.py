#!/home/user/.local/bin/python3

# MLX90640_API.c 1063 split = 2*(p/32 - (p/64)*2) + p%2; 

import numpy as np
import struct
	
str1 = list()
str2 = ""
str3 = list()

a = 0
b = 0

for i in range (0, 768):
	a = 2*(i/32 - (i/64)*2) + i%2;
	#str1.append (pattern)
	print ("%d"%i,"%d"%a)
	#if i % 64 == 0:
	#	print ("\n");
	#else:
	#	print ("%d"%i,"%d"%pattern);

exit (1)

c = ''
k = 0

for i in range (0, 12):
	for j in reversed(range(0,64)):
		if str1[k+j] == True:
			c = '1'
		if str1[k+j] == False:
			c = '0'
		str2 = str2 + c
	k = k + 64
	str3.append(str2)
	str2 = ""

idx = 0

for i in str3:
	if (idx <= 15):
		print ("INIT_0%1x"%idx+" => X\""+i+"\",")
	else:
		print ("INIT_%2x"%idx+" => X\""+i+"\",")
	idx = idx + 1

