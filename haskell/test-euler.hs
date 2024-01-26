import Test.Framework
import Test.Framework.Providers.HUnit
import Test.HUnit
import Problem1 hiding (main)

test_problem_1 = TestCase $ assertEqual "p1 Internal"
    (Problem1.sumOfPattern 5 100) 950

test2_problem_1 = TestCase $ assertEqual "p1 Example"
    (Problem1.sumOf35multiples 10) 23

tests = hUnitTestToTests $ TestList [TestLabel "test problem 1" test_problem_1,
                                     TestLabel "test2 problem 1" test2_problem_1]

main = defaultMain tests
