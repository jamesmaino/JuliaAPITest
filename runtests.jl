using Pkg
Pkg.activate(".");
Pkg.instantiate();
# Pkg.test("JuliaAPI");

using JuliaAPI
include("./JuliaAPI/test/runtests.jl")


