using JuliaAPI
using Test
using HTTP

@testset "JuliaAPI.jl" begin
    @async JuliaAPI.run()
    r = HTTP.request("GET", "http://0.0.0.0:8080/data")
    b = String(r.body)
    @test b == "{\"message\":\"hello!\",\"value\":99.3}"

    r = HTTP.request("GET", "http://0.0.0.0:8080/test")
    b = String(r.body)
    @test b == "{\"message\":\"test!\",\"value\":100}"
end
