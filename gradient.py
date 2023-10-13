#!/usr/bin/env python3

# https://stackoverflow.com/a/31125282

width,height,bits,stderr_bits = 256,1,5,8

import sys

import math
from PIL import Image
im = Image.new('RGB', (width, height))
#im = Image.new('YCbCr', (width, height))
ld = im.load()

# A map of rgb points in your distribution
# [distance, (r, g, b)]
# distance is percentage from left edge
"""heatmap = [
    [0.0, (0, 0, 0)],
    [0.20, (0, 0, .5)],
    [0.40, (0, .5, 0)],
    [0.60, (.5, 0, 0)],
    [0.80, (.75, .75, 0)],
    [0.90, (1.0, .75, 0)],
    [1.00, (1.0, 1.0, 1.0)],
]"""

heatmap = [
    [0.0,  (0.0, 0.0, 1.0)],
    [1.00, (1.0, 0.0, 0.0)],
]


def gaussian(x, a, b, c, d=0):
    return a * math.exp(-(x - b)**2 / (2 * c**2)) + d

def pixel(x, width=100, map=[], spread=1):
    width = float(width)
    r = sum([gaussian(x, p[1][0], p[0] * width, width/(spread*len(map))) for p in map])
    g = sum([gaussian(x, p[1][1], p[0] * width, width/(spread*len(map))) for p in map])
    b = sum([gaussian(x, p[1][2], p[0] * width, width/(spread*len(map))) for p in map])
    return min(1.0, r), min(1.0, g), min(1.0, b)

for x in range(im.size[0]):
    r, g, b = pixel(x, width=im.size[0], map=heatmap)
    r, g, b = [int((pow(2,bits)-1)*v) for v in (r, g, b)]
    for y in range(im.size[1]):
        print ("x\"%s%s%s\","%(format(r,'02x'),format(g,'02x'),format(b,'02x'))) # file
        print ("%s%s%s - %s %s %s"%
        (format(r,'02x'),format(g,'02x'),format(b,'02x'),format(r,f"0{stderr_bits}b"),format(g,f"0{stderr_bits}b"),format(b,f"0{stderr_bits}b")),
        file=sys.stderr) # standard error
        ld[x, y] = r, g, b

#im.save('grad.jpg')
im.save('grad.png')

