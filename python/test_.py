import doctest
import glob

def test_doctestall(): 
    files = glob.glob("python/*.py")

    for f in files:
        assert doctest.testfile(f, verbose=True)[0]==0
