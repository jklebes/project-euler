#!/bin/python3

import math

right = set([])
down = set([])
diagonal = set([])
backdiagonal = set([])

grid = []
for grid_i in range(20):
    grid_t = [int(grid_temp) for grid_temp in input().strip().split(' ')]
    grid.append(grid_t)


for row in grid:
    for (n, x) in enumerate(row[:-3]):
        right.add(math.prod(row[n:n+4]))

for (m, y) in enumerate(grid[0]):
    for n, x in enumerate(grid[:-3]):
        prod = 1
        for i in range(4):
            prod *= grid[n+i][m]
        down.add(prod)

for (m, y) in enumerate(grid[0][:-3]):
    for n, x in enumerate(grid[:-3]):
        prod = 1
        for i in range(4):
            prod *= grid[n+i][m+i]
        diagonal.add(prod)

for (m, y) in enumerate(grid[0][:-3]):
    for n, x in enumerate(grid[3:]):
        prod = 1
        for i in range(4):
            prod *= grid[m+i][n+3-i]
        backdiagonal.add(prod)

print(max(max(right), max(down), max(diagonal), max(backdiagonal)))
