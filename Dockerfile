FROM --platform=linux/amd64 julia:latest
# RUN apt-get update 
# only works with more RAM (8GB tested)
# RUN apt-get install -y gcc

# create dedicated user
RUN useradd --create-home --shell /bin/bash genie

# set up the app
ADD . /home
WORKDIR /home

# configure permissions
RUN chown -R genie:genie /home/

# switch user
USER genie


# RUN julia deploy/packagecompile.jl
RUN julia addPackage.jl
RUN julia runtests.jl

# ports
EXPOSE 8000
EXPOSE 80

# set up app environment
ENV VERSION 1
ENV PORT "8080"
ENV WSPORT "8080"
ENV EARLYBIND "true"


# CMD julia -Jcompiled.so -e 'include("runoxygen.jl"); run()'
CMD julia runoxygen.jl
