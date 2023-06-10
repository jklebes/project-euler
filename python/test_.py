def test_problem_2():
    import problem_2 as p2
    assert p2.sumEvenFibonacci(10) == 10
    assert p2.sumEvenFibonacci(100) == 44


def test_problem_3():
    import problem_3 as p3
    assert p3.largest_prime_factor(13195) == 29
    # special case i^m, here 5^4
    x = 5**4
    assert p3.largest_prime_factor(x) == 5
    # special case a prime number
    assert p3.largest_prime_factor(29) == 29


def test_problem_4():
    import problem_4 as p4
    assert (p4.largest_palindromes([101110, 800000]) == [101101, 793397])


def test_problem_5():
    import problem_5 as p5
    assert p5.multi_lcm(10) == 2520


def test_problem_6():
    import problem_6 as p6
    assert p6.squarediff(10) == 2640


def test_problem_11():
    import problem_11 as p11
    import pytest
    assert p11.gridmax([[-1, 5, 1], [0, 1, 1], [1, 1, -5]], 3) == 5
    # expect error
    with pytest.raises(Exception) as e_info:
        m = p11.gridmax([[1, 1], [1, 1]], 3)
    # don't expect error
    assert p11.gridmax([[1, 1, 1], [1, 1, 1]], 3) == 1


def test_problem_17():
    import problem_17 as p17
    assert (p17.name("5") == "Five")
    assert (p17.name("104382426112") ==
            "One Hundred Four Billion Three Hundred Eighty Two Million Four Hundred Twenty Six Thousand One Hundred Twelve")


def test_problem_20():
    import problem_20 as p20
    assert (p20.factorial_digit_sum(6) == 9)
    assert (p20.factorial_digit_sum(10)==27)

if __name__ == "__main__":
    import os
    os.chdir('python')
