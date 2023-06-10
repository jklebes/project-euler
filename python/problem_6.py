#!/bin/python3

def squarediff(n):
    """Sum of the squares of 1 to n
    minus
    sum of 1 to n, squared

    solution: equals two times sum of triangle numbers
    derivations: ??
    """
    sum_ = 0
    triangle = 0
    for a in range(1, n+1):
        sum_ += a*triangle
        triangle += a
    return 2*sum_


if __name__ == "__main__":
    t = int(input().strip())
    for a0 in range(t):
        n = int(input().strip())
        print(squarediff(n))
