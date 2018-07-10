FROM debian:jessie

EXPOSE 8337
WORKDIR /root
RUN apt-get update \
    && apt-get install --no-install-recommends -y wget \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*
RUN wget --no-check-certificate https://github.com/Internet-of-People/iop-core/releases/download/v6.2.1/iop-core-6.2.1-x86_64-linux-gnu.tar.gz
RUN tar xzfv iop-core-6.2.1-x86_64-linux-gnu.tar.gz -C .
RUN rm iop-core-6.2.1-x86_64-linux-gnu.tar.gz
RUN mkdir -p /root/iop/chain
VOLUME /root/iop/chain
WORKDIR /root/iop-core-6.2.1/bin/
ENTRYPOINT ["./iopd", "-datadir=/root/iop/chain", "-conf=/root/iop.conf"]