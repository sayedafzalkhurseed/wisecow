FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 4499

CMD sh -c 'while true; do echo -e "HTTP/1.1 200 OK\r\n\r\n$(/usr/games/fortune | /usr/games/cowsay)" | nc -l -p 4499 -q 1; done'
