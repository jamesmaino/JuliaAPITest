# Write your package code here.
using Pkg
Pkg.activate(".")
Pkg.develop(path="./JuliaAPI")
Pkg.instantiate()
