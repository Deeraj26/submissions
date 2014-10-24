import sys
sys.path.insert(0, './thinkstats_code')
import math
import thinkstats
import survey                                                                                                                
import Pmf
from collections import defaultdict

def PmfMean(myList):
    #myList.Prob(is freq. at each of the values in myList.Values()
    return sum([val * myList.Prob(val) for val in myList.Values()])
    print val

def PmfVar(myList):
     mean = PmfMean(myList)
     return sum([myList.Prob(val) * ((val - mean)**2) for val in myList.Values()])
     print mean


if __name__ == '__main__':
      myList = Pmf.MakePmfFromList([75,79,71,72,72,73,65,30,100,100,79])
      print myList.Values() #displays unique values
      print "Mean (with my PmfMean func.): ", PmfMean(myList)
      print "Var(with my PmFVar func.)", PmfVar(myList)
      print "Using methods Mean and Var in Pmf.py"
      print "Mean: ", myList.Mean()
      print "Var: ", myList.Var()
