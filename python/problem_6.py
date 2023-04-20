#!/bin/python3

import sys

def squarediff(n):
    sum_=0
    triangle = 0
    for a in range(1, n+1):
        sum_+=a*triangle
        triangle +=a
    return 2*sum_

t = int(input().strip())
for a0 in range(t):
    n = int(input().strip())
    print(squarediff(n))