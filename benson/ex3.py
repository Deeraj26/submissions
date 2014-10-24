import sys
sys.path.insert(0, './thinkstats_code')
import math
import thinkstats
import survey
import Pmf
from collections import defaultdict
import collections

#hist=Pmf.MakeHistFromList(pump_wt)
#print hist
#print hist.Freq(1)
#print pump_wt

#hist_dict = {}
#for val in sorted(hist.Values()): 
#            hist_dict[val] = hist.Freq(val)
#print hist_dict
#print type(hist_dict)


def _mode(myList):
    table = collections.Counter(iter(myList)).most_common()
    print table
    print 'The mode is', table[0][0]
    print 'Frequency of the Mode', table[0][1]



if __name__ == '__main__':
      myList =[1,1,1,3,3,591]
      print "Mode (with my PmfMean func.): ", _mode(myList)
    


