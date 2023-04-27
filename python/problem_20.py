import os
import math

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    T = int(input().strip())

    for n_itr in range(T):
        N = int(input().rstrip())
        result = sum([int(c) for c in str(math.prod(range(1, N+1)))])
        fptr.write(str(result) + '\n')
    fptr.close()
