using Memoize
using Lazy

function sum_sieve(lim::Int)
    primes :: Array{Bool,1} = trues(lim)
    llim :: Int = isqrt(lim)
    hlim :: Int = iseven(llim) ? llim+1 : llim+2
    res :: Int = 2
    for i = 3:2:llim
        if primes[i]
            for j = i*i:2*i:lim
                primes[j] = false
            end
            res += i
        end
    end
    for i = hlim:2:lim
        res += primes[i] ? i : 0
    end
    res
end

# Returns the abundant numbers at most lim
function abuns(lim::Int)
    faks :: Array{Int,1} = ones(Int,lim)
    for i = 2:isqrt(lim)
        faks[(i*i)] += i
        for j = i*i+i:i:lim
            faks[j] += i + div(j,i)
        end
    end
    filter(x -> faks[x] > x, 2:lim)
end

# Returns the sum of all numbers at most lim that cannot be written
# as the sum of two abundant numbers
function sum_abuns(lim::Int)
    faks :: Array{Int,1} = abuns(lim)
    len :: Int = length(faks)
    abun :: Array{Int,1} = 1:lim
    itmp :: Int, jtmp ::Int, tmp::Int = 12,0,0
    for i = 1:len
        itmp = faks[i]
        if 2*itmp > lim
            return sum(abun)
        else
            for j = i:len
                jtmp = faks[j]
                tmp = itmp+jtmp
                if tmp > lim
                    break
                end
                abun[tmp] = 0
            end
        end
    end
end







































# save
