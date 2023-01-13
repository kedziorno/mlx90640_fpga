#!/home/user/.local/bin/python3

import math

# https://stackoverflow.com/a/16444778
#import struct
#def binary(num):
#    return ''.join('{:0>8b}'.format(c) for c in struct.pack('!f', num))

# https://stackoverflow.com/a/68412686
from binary_fractions import Binary
from binary_fractions import TwosComplement

acomp = 0.00000011876487360496
vir = 679.250909123826
ta = 9516495632.56
ks = -0.00080108642578125

original = math.sqrt(math.sqrt((((acomp**3)*vir)+((acomp**4)*ta))))*ks

a = 1/acomp
b = a**3
c = a**4
b1 = 1/b
c1 = 1/c
#d = b1*(1/vir)
d = b*(1/vir)
#e = c1*(1/ta)
e = c*(1/ta)
f = (1/d+1/e)
g = math.sqrt(f)
h = math.sqrt(g)
i = h*ks

print ("1/acomp            : "+str(a))
print ("(1/acomp)**3       : "+str(b))
print ("(1/acomp)**4       : "+str(c))
#print ("1/((1/acomp)**3)   : "+str(b1))
#print ("1/((1/acomp)**4)   : "+str(c1))
print ("b*(1/vir)          : "+str(d))
print ("c*(1/ta)           : "+str(e))
print ("d+e                : "+str(f))
print ("sqrt1              : "+str(g))
print ("sqrt2              : "+str(h))
print ("h*ks               : "+str(i))
print ("**** original **** : "+str(original))

print (f"aaa {Binary(TwosComplement(c1,ndigits=128))}");

