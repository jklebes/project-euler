#!/bin/python3

import sys
import math

def largest_prime_factor(n):
    """
    What is the largest prime factor of n?
    >>> 13195
    29
    """
    i=1
    #list all (prime and composite) factors of n
    # only goes up to sqrt(n) - there is at most one prime factor, p2, greater than sqrtn
    # this is needed to shorten processing time from listsof length 10^12 to 10^6
    s= list(filter(lambda x: n%x==0, range(2,math.floor(math.sqrt(n))+1)))
    if not s: #empty list of factors generated - n is prime
        return n
    # find p2 if any
    p1 = s[-1]
    if n%p1==0:
        p2 = n//p1
        s.append(p2)
    # now filter out factors which are not prime (relative to other factors)
    # all factors are either prime or composite, filter wrt other integers not needed
    # last number left will be greatest prime in the list
    while len(s)>1:
        i = s[0]
        s=list(filter(lambda x: x%i!=0, s))
        if not s: #for numbers of the form i^m, all factors can be filterred away at once
            return i
    return s[0]

if __name__=="__main__":
    t = int(input().strip())
    for a0 in range(t):
        n = int(input().strip())
        print(largest_prime_factor(n))
