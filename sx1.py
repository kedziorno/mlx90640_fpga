#!/home/user/.local/bin/python3

import math

acomp = 0.00000011876487360496
vir = 679.250909123826
ta = 9516495632.56
ks = -0.00080108642578125

a = acomp
b = a*a*a
c = a*a*a*a
d = b*vir
e = c*ta
f = (d+e)
g = math.sqrt(f)
h = math.sqrt(g)
i = h*ks

a1 = ks*273.15
b1 = 1-a1
c1 = acomp*b1
d1 = c1+i
e1 = vir/d1
f1 = e1+ta
g1 = math.sqrt(f1)
h1 = math.sqrt(g1)
i1 = h1-273.15

print ("acomp**3                 : "+str(b))
print ("acomp**4                 : "+str(c))
print ("acomp**3*vir             : "+str(d))
print ("acomp**4*ta              : "+str(e))
print ("acomp**3*vir+acomp**4*ta : "+str(f))
print ("sqrt1                    : "+str(g))
print ("sqrt2                    : "+str(h))
print ("Sx                       : "+str(i))

print ("ks*273.15                         : "+str(a1))
print ("1-ks*273.15                       : "+str(b1))
print ("acomp*(1-ks*273.15)               : "+str(c1))
print ("acomp*(1-ks*273.15)+Sx            : "+str(d1))
print ("vir/(acomp*(1-ks*273.15)+Sx)      : "+str(e1))
print ("(vir/(acomp*(1-ks*273.15)+Sx))+ta : "+str(f1))
print ("sqrt1                             : "+str(g1))
print ("sqrt2                             : "+str(h1))
print ("To                                : "+str(i1))


