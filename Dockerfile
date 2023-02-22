FROM julia:1.8.5-bullseye


WORKDIR /home

ENV VERSION 1
ADD . /home

EXPOSE 8080

ENTRYPOINT ["julia", "run_oxygen.jl"]