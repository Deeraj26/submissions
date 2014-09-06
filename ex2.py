"""This file contains code used in "Think Stats",
by Allen B. Downey, available from greenteapress.com

Copyright 2010 Allen B. Downey
License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html
"""
import sys
sys.path.insert(0, './thinkstats_code')
import survey
import thinkstats
import math
import first

def Summarize(data_dir):
    """Prints summary statistics for first babies and others.
    
    Returns:
        tuple of Tables
    """
    table, firsts, others = first.MakeTables(data_dir)
    first.ProcessTables(firsts, others)

    print 'Number of first babies', firsts.n
    print 'Number of others', others.n

    mu1, mu2 = firsts.mu, others.mu
    var1,var2 = firsts.var,others.var
    std1=math.sqrt(var1)
    std2=math.sqrt(var2)
    print 'Mean gestation in weeks:' 
    print 'First babies', mu1 
    print 'Others', mu2
    print 'Variance', var1,var2
    print 'standard Deviation', std1,std2 
    
    print 'Difference in days', (mu1 - mu2) * 7.0




if __name__ == '__main__':
    data_dir='./thinkstats_data'
    Summarize(data_dir)
