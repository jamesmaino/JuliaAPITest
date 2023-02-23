FROM --platform=linux/amd64 julia:1.8.5

# RUN apt-get update && apt-get install -y g++

WORKDIR /home

ENV VERSION 1
ADD . /home

# RUN julia deploy/packagecompile.jl

# ports
EXPOSE 8000
EXPOSE 80

# set up app environment
ENV PORT "8080"
ENV WSPORT "8080"
ENV EARLYBIND "true"


# CMD julia -Jcompiled.so -e 'include("runoxygen.jl"); run()'
CMD julia runoxygen.jl
