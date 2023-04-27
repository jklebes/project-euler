import os
import math


def fac(x):
    return math.prod(range(1, x+1))


def digitFacs(x):
    l = str(x)
    return [fac(int(c)) for c in l]


def sumDigitFacs(n):
    ans = 0
    for i in range(10, n+1):
        if sum(digitFacs(i)) % i == 0:
            ans += i
    return ans


if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')
    N = int(input().rstrip())
    result = sumDigitFacs(N)
    fptr.write(str(result) + '\n')
    fptr.close()
