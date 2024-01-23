# project-euler

![Python](https://github.com/jklebes/project-euler/actions/workflows/python-app.yml/badge.svg)
![Haskell](https://github.com/jklebes/project-euler/actions/workflows/haskell.yml/badge.svg)

Programming languages practice: Haskell, Python, C++

The questions can be seen on https://projecteuler.net/ .

Most solutions uploaded so far are in hackerrank format, taking a file with lines of space-separated test case integers as input.  To run these from command line, try CTRL+D to prompt evaluation after typing the input list of queries.


| | haskell | python | C++ | others |
| --- | --- | --- | --- | --- |
| 1 | x |  |  |  |
| 2 |  | x |  |  |
| 3 |  | x |  |  |
| 4 |  | x |  |  |
| 5 |  | x |  |  |
| 6 |  | x |  |  |
| 7 | x |  |  |  |
| 8 | x|  |  |  |
| 9 | x|  |  |  |
| 10 | x|  |  |  |
| 11 |   | x |  |  |
| 12 | x |  |  |  |
| 13 | x |  |  |  |
| 14 | x |  |  |  |
| 15 |  | x |  |  |
| 16 | x |  |  (x)|  |
| 17 |  | x |  |  |
| 18 | x |  |  |  |
| 19 |  |  |  | matlab |
| 20 |  | x |  |  |
| 21 |  |   |  | (fortran) |
| 22 |  |   |  | javascript |
| 23 |x| |  | |
| 24 | | |  |(clojure) |
| 25 |  |  | x|  |
| 26 |  | x | |  |
| 34 |  | x |  |  |
| 39 |  | x |  |  |
| 67 | x |  |  |  |
| 92 |  |  |  | (clojure) |

### TODO

- Get rid of this hackerrank interactive IO list of queries format, set up each problem to run a single query at a time in a unified way across languages.
- Tests for each problem.  The simple example and further corner cases, but NOT the main Project Euler query, to not publically hard-code answers into my tests.
  - Or test against Project Euler main answers as secrets.
- Check test coverage.
