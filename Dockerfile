FROM julia:1.8.5


WORKDIR /home

ENV VERSION 1
ADD . /home

ENV PORT 8080
ENV HOST 0.0.0.0

EXPOSE 8080

ENTRYPOINT ["julia", "run_oxygen.jl"]