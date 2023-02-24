using Pkg
Pkg.activate(".")
Pkg.instantiate()

using Oxygen
using HTTP

# start the web server
function run(; host="0.0.0.0", port=8080)
    @get "/data" function (req::HTTP.Request)
        return Dict("message" => "hello!", "value" => 99.3)
    end
    serve(; host=host, port=port)
end