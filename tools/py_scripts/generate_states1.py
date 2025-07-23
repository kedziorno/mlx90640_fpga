#!/bin/env python3

index = 0
length = 16895;
state_name = "s";
breakline = 80;

for i in range (0,length+1):
	if (i%breakline==0):
		print ("\n");
	print ("%s%d,"%(state_name,i),end='');

