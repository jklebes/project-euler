#!/bin/python3

ns =[]

t = int(input().strip())
for a0 in range(t):
    n = int(input().strip())
    ns.append(n)
    
maxN = max(ns)
    
def palindrome(x):
    string = str(x)
    if string == string[::-1]:
        return True
    else: return False
    
palindromes = list(set([(a*b) for a in range(100,1000) for b in range(100,1000) if (a*b) > 100000 and (a*b) <= maxN and palindrome(a*b)]))
palindromes.sort()

#print(len(palindromes))

for n in ns:
    bestP = palindromes[-1]
    for p in palindromes[::-1]:
        bestP = p
        if p < n: break; #<, not <=, makes test case 4 right
    print(bestP)