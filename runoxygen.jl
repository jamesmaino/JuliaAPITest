using Pkg
Pkg.activate(".")

using Oxygen
using HTTP

@get "/data" function (req::HTTP.Request)
    return Dict("message" => "hello!", "value" => 99.3)
end

# start the web server
function run()
    serve(; host="0.0.0.0", port=8080)
end