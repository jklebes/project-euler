from math import sqrt, floor, ceil
from collections import defaultdict

def countTriangles(maxN):
    # counts = defaultdict(lambda : 0)
    abc = defaultdict(lambda: set())
    # go through all p, q, r such that 
    # P = 2(p^2+qp)r<=maxN
    for p in range(1, floor(sqrt(maxN/2))+1):
        # q<p or triangle is degenerate with a <= 0
        for q in range(1, p):
            x = 2*(p**2+q*p)
            for r in range(1,maxN//x+1):
                P = x*r #p,q,r specify a (unique? no)
                # right triangle with perimeter P
                if P%12==0: #only 12s make new records -save memory
                    b = (p**2+q**2)*r
                    c = 2*p*q*r
                    abc[P].add(max(b,c)) # avoid duplicated
                    # with different order
    counts = [(len(v),k) for k,v in abc.items()]
    counts=sorted(counts, key = lambda x: (-x[0],x[1]))
    return counts

def firstUnder(d,n):
    return next(filter(lambda i: i[1] <= n, d))[1]

if __name__=="__main__":
    t=int(input())
    queries=[]
    for i in range(t):
        n=int(input())
        queries.append(n)
    counts = countTriangles( max(queries))
    answers = map(lambda n:str(firstUnder(counts,n)), queries)
    print('\n'.join(answers))
