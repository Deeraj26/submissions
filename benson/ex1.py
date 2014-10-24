import sys
sys.path.insert(0, './thinkstats_code')
import math
import thinkstats
import survey

pump_wt=[1,1,1,3,3,591]

Var_pumpwt=thinkstats.MeanVar(pump_wt)
std_pumpwt=math.sqrt(Var_pumpwt[1])


print 'Mean the Weight of the pumpkins', Var_pumpwt[0]
print 'Variance the Weight of the pumpkins', Var_pumpwt[1]
print 'Std. of the Weight of the pumpkins', std_pumpwt

