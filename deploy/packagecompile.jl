using Pkg
Pkg.activate(".")
Pkg.instantiate()

include("packages.jl")

using PackageCompiler

create_sysimage(PACKAGES;
    sysimage_path="compiled.so",
    precompile_execution_file="runoxygen.jl")