#!/usr/bin/env python3
# Importing Image from PIL package 
from PIL import Image
import numpy as np
import math
import sys

line_width = 1100
points = 7
target_width = 512
h = 110
middle_line = (100,50)
step = math.ceil(line_width/points)
bars = 7
f = 100/points+1

im = Image.open(r"./029-r-color-palettes-r-color-scales-1.png")
px = im.load()
pix = []
for b in range(bars):
  print (b)
  x = 0
  y = 0
  for i in range(points):
    print ("%d %d"%(x,y),file=sys.stderr) # standard error
    x = step*i
    y = h*b
    a = px[middle_line[0]+x,middle_line[1]+y]
    print ("[%s, (%s, %s, %s)],"%(format((f*i)/100,'0.2f'),format(a[0]/256.0,'0.3f'),format(a[1]/256.0,'0.3f'),format(a[2]/256.0,'0.3f'))) # file


# creating a image object
#im = Image.open(r"./029-r-color-palettes-r-color-scales-1.png")
#px = im.load()
#resized = im.resize((564, 768), Image.NEAREST)
#resized.save("./aaa.png")
#l1 = resized.load()
#l1 = im.load()

#pix = []
#for b in range(bars):
#  print (b)
#  for i in range(line_width):
#    a = l1[middle_line[0]+i,middle_line[1]+b*step]
#    pix.append(a)
#    print ("x\"%s%s%s\","%(format(a[0],'02x'),format(a[1],'02x'),format(a[2],'02x'))) # file

#  numpy_array = np.array(pix)
#  print(numpy_array)
#  img = Image.fromarray(numpy_array, 'RGB')
#  print(img)
#  resized = img.resize((target_width, 1), Image.NEAREST)
#  l = resized.load()
#  for j in range(target_width):
#    print(l[j,0])

