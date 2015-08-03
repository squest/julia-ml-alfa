using Morsel
import JSON

app = Morsel.app()

route(app, GET | POST, "/") do req,res
    JSON.json(Dict("wasalam" => "mualaikum","waroh" => ["matu","logi","wabaro","katu"]))
end

@async start(app,3000)
