# Base image with Java and Maven
#
# VERSION       3

FROM ubuntu:14.10

MAINTAINER Frank Lemanschik

# Install Java and maven
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse \n\
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse \n\
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse \n\
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" > /etc/apt/sources.list \
 && apt-get update \
 && apt-get install openjdk-7-jdk maven \
 && ln -s /usr/lib/jvm/java-1.7.0-openjdk-amd64/jre/lib/amd64/server/libjvm.so /usr/lib/libjvm.so \
 && echo "Default DNS cache TTL is -1. DNS records, like, change, man." \
 && grep '^networkaddress.cache.ttl=' /etc/java-7-openjdk/security/java.security || echo 'networkaddress.cache.ttl=6000' >> /etc/java-7-openjdk/security/java.security
 
ENV DOCKER_RUN echo "uuuhh"
ENV DOCKER_BUILD docker build -t dockerimages/java git://github.com/dockerimages/java
