FROM --platform=linux/amd64 julia:1.8.5


WORKDIR /home

ENV VERSION 1
ADD . /home

# ports
EXPOSE 8000
EXPOSE 80

# set up app environment
ENV PORT "8080"
ENV WSPORT "8080"
ENV EARLYBIND "true"

# instantiate Julia packages
RUN julia -e "using Pkg; Pkg.activate(\".\"); Pkg.instantiate(); Pkg.precompile(); "



CMD julia -e 'using Pkg; Pkg.activate("."); include("run_oxygen.jl"); '
