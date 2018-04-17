FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y wget pwgen

ARG RPC_USER
ARG RPC_PASSWORD
ENV RPC_USER ${RPC_USER:-decima}
# Create a random password if the user doesn't set one
ENV RANDOM_PASS `pwgen -Bs1 12`
ENV RPC_PASSWORD ${RPC_PASSWORD:-$RANDOM_PASS}

# Build the project
RUN wget https://github.com/decimaproject/Decima/releases/download/v1.2.0.0/decima-1.1.0-x86_64-linux-gnu.tar.gz -O decima-1.1.0.tar.gz
RUN tar -xvf decima-1.1.0.tar.gz
RUN mkdir -p /root/.decima/
RUN echo "rpcuser=$RPC_USER\nrpcpassword=$RPC_PASSWORD" > /root/.decima/decima.conf

EXPOSE 8332 8333 18332 18333

WORKDIR /decima-1.1.0/bin
CMD ["/decima-1.1.0/bin/decimad"]

