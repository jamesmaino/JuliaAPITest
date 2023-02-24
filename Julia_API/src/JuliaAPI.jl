module JuliaAPI

using Oxygen
using HTTP

# start the web server
function run()
    @get "/data" function (req::HTTP.Request)
        return Dict("message" => "hello!", "value" => 99.3)
    end

    @get "/test" function (req::HTTP.Request)
        return Dict("message" => "test!", "value" => 100)
    end

    serve(; host="0.0.0.0", port=8080)
end

precompile(run, ())

end
