#!/bin/python3

def largest_palindromes(ns):
    # 'What is the largest palindrome made from the
    # product of two three-digit numbers?'
    # hackerrank version: return largest less than n, for list of ns

    maxN = max(ns)
    # generate all palindromes that could be needed in this query set
    palindromes = sorted(set([(a * b) for a in range(100, 1000) for b in range(
        100, 1000) if (a * b) > 100000 and (a * b) <= maxN
        and palindrome(a * b)]))

    # return largest for each query
    ans=[]
    for n in ns:
        bestP = palindromes[-1]
        for p in palindromes[::-1]:
            bestP = p
            if p < n:
                break  # <, not <=, makes test case 4 right
        ans.append(bestP)

    return ans

def palindrome(x):
    string = str(x)
    if string == string[::-1]:
        return True
    else:
        return False


if __name__ == "__main__":
    # collect, process all queries at once
    ns = []
    t = int(input().strip())
    for a0 in range(t):
        n = int(input().strip())
        ns.append(n)
        results = largest_palindromes(ns)
        print("\n".join([str(x) for x in results]))
