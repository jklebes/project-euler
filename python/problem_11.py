#!/bin/python3

import math


def gridmax(grid, p=4):
    """
    maximum product of p adjacent numbers from a 2Darray
    """
    right = set([])
    down = set([])
    diagonal = set([])
    backdiagonal = set([])
    try:
        for row in grid:
            for (n, x) in enumerate(row[:-p + 1]):
                right.add(math.prod(row[n:n + p]))
    except IndexError:
        right = set([])
    try:
        for (m, y) in enumerate(grid[0]):
            for n, x in enumerate(grid[:-p + 1]):
                prod = 1
                for i in range(p):
                    prod *= grid[n + i][m]
                down.add(prod)
    except IndexError:
        down = ([])
    try:
        for (m, y) in enumerate(grid[0][:-p + 1]):
            for n, x in enumerate(grid[:-p + 1]):
                prod = 1
                for i in range(p):
                    prod *= grid[m + i][n + i]
                diagonal.add(prod)
    except IndexError:
        diagonal = set([])
    try:
        for (m, y) in enumerate(grid[0][:-p + 1]):
            for n, x in enumerate(grid[p - 1:]):
                prod = 1
                for i in range(p):
                    prod *= grid[m + i][n + p - 1 - i]
                backdiagonal.add(prod)
    except IndexError:
        backdiagonal = set([])
    # check if all directions came up empty due to array being too small for p
    if all([len(prods) == 0 for prods in [right, down, diagonal, backdiagonal]]):
        raise IndexError("Array too small in all directions.")
    return (max([max(x)
            for x in [right, down, diagonal, backdiagonal] if len(x) > 0]))


if __name__ == "__main__":
    grid = []
    for grid_i in range(20):
        grid_t = [int(grid_temp) for grid_temp in input().strip().split(' ')]
        grid.append(grid_t)
    print(gridmax(grid))
