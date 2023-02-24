FROM --platform=linux/amd64 julia:1.8.5
# RUN apt-get update 
# only works with more RAM (8GB tested)
# RUN apt-get install -y gcc

WORKDIR /home

ENV VERSION 1
ADD . /home

# RUN julia deploy/packagecompile.jl
RUN julia addPackage.jl
RUN julia runtests.jl

# ports
EXPOSE 8000
EXPOSE 80

# set up app environment
ENV PORT "8080"
ENV WSPORT "8080"
ENV EARLYBIND "true"


# CMD julia -Jcompiled.so -e 'include("runoxygen.jl"); run()'
CMD julia runoxygen.jl
