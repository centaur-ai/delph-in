FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y curl wget git build-essential python3 python3-pip
RUN apt-get clean

RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
ENV PATH="/root/.elan/bin:$PATH"

WORKDIR /app
RUN leanpkg new hello_world

WORKDIR /app/hello_world
COPY ./HelloWorld.lean ./src/HelloWorld.lean
RUN leanpkg build

CMD ["lean", "./src/HelloWorld.lean"]
