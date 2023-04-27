def test_problem_2():
    import python.problem_2 as p2
    assert p2.sumEvenFibonacci(10) == 10
    assert p2.sumEvenFibonacci(100) == 44


def test_problem_3():
    import python.problem_3 as p3
    assert p3.largest_prime_factor(13195) == 29
    # special case i^m, here 5^4
    x = 5**4
    assert p3.largest_prime_factor(x) == 5
    # special case a prime number
    assert p3.largest_prime_factor(29) == 29


def test_problem_5():
    import python.problem_5 as p5
    assert p5.multi_lcm(10) == 2520


def test_problem_6():
    import python.problem_6 as p6
    assert p6.squarediff(10) == 2640


if __name__ == "__main__":
    import os
    os.chdir('python')
