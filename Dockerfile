FROM ubuntu:14.04

ENV VERSION 0.16

RUN mkdir /code && \
    cd /code && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://attic-backup.org/downloads/releases/$VERSION/Attic-$VERSION-linux-x86_64.tar.gz && \
    tar xzvf Attic-$VERSION-linux-x86_64.tar.gz && \
    mv Attic-$VERSION-linux-x86_64 attic

# Dunno...
ENV ATTIC_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes

ENTRYPOINT ["/code/attic/attic"]
