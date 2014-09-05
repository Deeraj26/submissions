import sys
sys.path.insert(0, './thinkstats_code')
import math
import thinkstats
import survey
import Pmf
from collections import defaultdict

pump_wt=[1,1,1,3,3,591]
hist=Pmf.MakeHistFromList(pump_wt)
print hist
print hist.Freq(1)
print pump_wt

hist_dict = {}
for val in sorted(hist.Values()): 
            hist_dict[val] = hist.Freq(val)
print hist_dict
print type(hist_dict)

print hist_dict.keys
print hist_dict.values
