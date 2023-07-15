def recurring(d):
    # by long division
    nex = 1
    seen = set([])
    while True:
        # borrow zeros to n until n > d
        while nex < d:
            nex *= 10
        if nex in seen:
            break
        # note n to check for repeating
        seen.add(nex)
        # divide, would note digit of result
        nex = nex % d
        # if remainder zero, terminates, return -1
        if nex == 0:
            return -1
    # repeat until n recurs
    return len(seen)


def argMaxUnder(l, n):
    return l.index(max(l[:n-1]))+1


def maxRecurring(n):
    # project euler seeks integer <=n, while hackerrank <n
    periods = [recurring(i) for i in range(1, n+1)]
    return periods.index(max(periods))+1


if __name__ == "__main__":
    t = int(input())
    queries = []
    for i in range(t):
        n = int(input())
        queries.append(n)
    periods = [recurring(i) for i in range(1, max(queries))]
    answers = [str(argMaxUnder(periods, n)) for n in queries]
    print('\n'.join(answers))
