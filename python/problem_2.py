#!/bin/python3

import sys

def solution(n):
    prev_x=0
    x = 2
    sum_ = 0
    while x < n:
        sum_+=x
        # the next even fibonacci number is generated from 2 
        # previous even fibonacci numbers as a_{i+1}= 4*a_i + a_{i-1}
        new_x = x*4+prev_x
        prev_x = x
        x = new_x
    return sum_

t = int(input().strip())
for a0 in range(t):
    n = int(input().strip())
    print(solution(n))
