#!/usr/bin/env python3

# https://stackoverflow.com/a/31125282
# https://rgbcolorpicker.com/0-1

width,height,bits,stderr_bits = 512,512,8,8

import sys

import math
from PIL import Image
im = Image.new('RGB', (width, height))
#im = Image.new('YCbCr', (width, height))
ld = im.load()

# A map of rgb points in your distribution
# [distance, (r, g, b)]
# distance is percentage from left edge
heatmap = [
[0.01, (0xff/0x100, 0x00/0x100, 0x00/0x100)],
[0.18, (0xff/0x100, 0xa5/0x100, 0x00/0x100)],
[0.36, (0xff/0x100, 0xff/0x100, 0x00/0x100)],
[0.54, (0x00/0x100, 0xff/0x100, 0x00/0x100)],
[0.72, (0x00/0x100, 0xff/0x100, 0xff/0x100)],
[0.90, (0x00/0x100, 0x00/0x100, 0xff/0x100)],
[1.00, (0x90/0x100, 0x00/0x100, 0xff/0x100)],
]

"""heatmap = [
    [0.0,  (0.0, 0.0, 1.0)],
    [1.00, (1.0, 0.0, 0.0)],
]"""


def gaussian(x, a, b, c, d=0):
    return a * math.exp(-(x - b)**2 / (2 * c**2)) + d

def pixel(x, width=100, map=[], spread=2):
    width = float(width)
    r = sum([gaussian(x, p[1][0], p[0] * width, width/(spread*len(map))) for p in map])
    g = sum([gaussian(x, p[1][1], p[0] * width, width/(spread*len(map))) for p in map])
    b = sum([gaussian(x, p[1][2], p[0] * width, width/(spread*len(map))) for p in map])
    return min(1.0, r), min(1.0, g), min(1.0, b)

for x in range(im.size[0]):
    r, g, b = pixel(x, width=im.size[0], map=heatmap)
    r, g, b = [int((pow(2,bits)-1)*v) for v in (r, g, b)]
    first = True
    for y in range(im.size[1]):
        if (first == True):
          print ("x\"%s%s%s\","%(format(r,'02x'),format(g,'02x'),format(b,'02x'))) # file
          print ("%s%s%s - %s %s %s"%(format(r,'02x'),format(g,'02x'),format(b,'02x'),format(r,f"0{stderr_bits}b"),format(g,f"0{stderr_bits}b"),format(b,f"0{stderr_bits}b")),file=sys.stderr) # standard error
          first = False
        ld[x, y] = r, g, b

#im.save('grad.jpg')
im.save('grad.png')

