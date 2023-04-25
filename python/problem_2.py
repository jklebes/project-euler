#!/bin/python3

import sys

def sumEvenFibonacci(n):
    """ What is the sum of all even Fibonnaci numbers less than n?
    >>> 10
    10
    >>> 60
    44
    """
    prev_x=0
    x = 2
    sum_ = 0
    while x < n:
        sum_+=x
        # the next even fibonacci number is generated from two
        # previous even fibonacci numbers as a_{i+1}= 4*a_i + a_{i-1}
        new_x = x*4+prev_x
        prev_x = x
        x = new_x
    return sum_

if __name__=="__main__":
    t = int(input().strip())
    for a0 in range(t):
        n = int(input().strip())
        print(sumEvenFibonnaci(n))
