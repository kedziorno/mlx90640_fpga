#!/usr/bin/env python3

import struct
import numpy as np
from sys import argv

def float_to_hex(f):
  return hex(struct.unpack('<I', struct.pack('<f', f))[0])

a=struct.unpack('!f', bytes.fromhex(argv[1]))[0]
b=struct.unpack('!f', bytes.fromhex(argv[2]))[0]
c=a/b
d=np.float32(struct.unpack('<f', struct.pack('<f', np.float32(c)))[0])
print(float_to_hex(d))

