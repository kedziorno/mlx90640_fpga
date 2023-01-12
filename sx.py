#!/home/user/.local/bin/python3

import math

acomp = 0.00000011876487360496
vir = 679.250909123826
ta = 9516495632.56
ks = -0.00080108642578125

original = math.sqrt(math.sqrt((((acomp**3)*vir)+((acomp**4)*ta))))*ks
print (original)

a = 1/acomp
print (a)

b = a*a*a
print (b)

c = a*a*a*a
print (c)

b1 = 1/b
print (b1)

c1 = 1/c
print (c1)

#d = b1*(1/vir)
d = b*(1/vir)
print (d)

#e = c1*(1/ta)
e = c*(1/ta)
print (e)

f = (1/d+1/e)
print (f)

g = math.sqrt(f)
print (g)

h = math.sqrt(g)
print (h)

i = h*ks
print (i)

