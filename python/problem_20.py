import os
import math

def factorial_digit_sum(N):
    # Calculate N! and sum its digits
    return sum([int(c) for c in str(math.prod(range(1, N+1)))])

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    T = int(input().strip())

    for n_itr in range(T):
        N = int(input().rstrip())
        fptr.write(str(factorial_digit_sum(N)) + '\n')
    fptr.close()


