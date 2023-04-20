#!/bin/python3

import sys
import functools

def gcd(a_,b_):
    #euclidean algoritm
    a = max(a_,b_)
    b = min(a_, b_)
    while b!=0:
        new_b = a%b # the remainder
        a = b #now the other one is larger one
        b = new_b # the remainder is the new smaller value
    # if the remainder became 0:
    # return the previous divisor
    #print("gcd ", a_, b_, ": ", a)
    return a

def lcm(a, b):
    return a*b / gcd(a,b)    
    
def multi_lcm(n):
    return int(functools.reduce(lcm, range(1,n+1)))

t = int(input().strip())
for a0 in range(t):
    n = int(input().strip())
    print(multi_lcm(n))
