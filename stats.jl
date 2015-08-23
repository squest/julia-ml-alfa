using Lazy, JSON

function fdir (fname :: String)
    string ("data/",fname,".json")
end

function openJSON (fname::String)
    JSON.parse (open (readall, fdir (fname)))
end

function get2d (data, x,y)
    map (d->[d [x],d [y]], data)
end

function get3d (data,x,y,z)
    map (d->[d [x],d [y],d [z]],data)
end




function imean (xs :: Array)
    map (x -> Int (round (x)), mean (xs))
end



