module JuliaAPI

using Oxygen
using HTTP

# start the web server
function run(; host="0.0.0.0", port=8080)
    @get "/data" function (req::HTTP.Request)
        return Dict("message" => "hello!", "value" => 99.3)
    end

    @get "/test" function (req::HTTP.Request)
        return Dict("message" => "test!", "value" => 100)
    end

    serve(; host=host, port=port)
end

precompile(run, ())

end
