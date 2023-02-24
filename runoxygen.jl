# Write your package code here.
using Pkg
Pkg.activate(".")
# Pkg.instantiate()

using JuliaAPI

JuliaAPI.run(; port=8080)