def sumsieve (lim):
    primes = [True]*(lim+1)
    llim = isqrt (lim)
    res = 0
    for i in xrange (3,lim,2):
        if i <= llim:
            if primes [i]:
                for j in xrange (i*i,lim,2*i):
                    primes [j] = False
                    res += i
                    
                    