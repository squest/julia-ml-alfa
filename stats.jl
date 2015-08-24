using Lazy, JSON

function fdir (fname :: String)
    string ("data/",fname,".json")
end

function openJSON (fname::String)
    JSON.parse (open (readall, fdir (fname)))
end

function get2d (data, x,y)
    map (d-> [(d [x]),(d [y])], data)
end

function get3d (data,x,y,z)
    map (d->[(d [x]),(d [y]),(d [z])],data)
end

function sumsieve3(lim::Int)
    primes :: Array{Bool}, llim :: Int, res :: Int = trues(lim), isqrt(lim), 2
    lllim :: Int = iseven(llim) ? llim+1: llim + 2
    # separate the sieve into two parts, first sieve all the numbers using the
    # primess less than sqrt(lim) but already summing the primes into res.
    # The second part is only accumulating the primes larger the sqrt(lim)
    for i = 3:2:llim
        if primes[i]
            for j = i*i:i*2:lim
                primes[j] = false
            end
            res += i
        end
    end
    for i = lllim:2:lim
        res += primes[i] ? i : 0
    end
    res
end


function imean (xs :: Array)
    map (x -> Int (round (x)), mean (xs))
end
