# define la imagen base para crear la nueva imagen
FROM ubuntu:latest

# referencia del creador
LABEL MAINTAINER="Mario Vizcaino"
LABEL CONCTAC="vzcdeveloper@gmail.com"

#Ejecutar comando en la imagen antes de ser creada
RUN mkdir -p /app
WORKDIR /app

#INSTALAR DEPENDENCIAS
RUN apt-get update && \
    apt-get install -y autoconf \
                       bison \
                       build-essential \
                       curl \
                       git \
                       libffi-dev \
                       libgdbm-dev \
                       libgdbm3 \
                       libncurses5-dev \
                       libpq-dev \
                       libreadline6-dev \
                       libssl-dev \
                       libyaml-dev \
                       nodejs \
                       libsqlite3-dev \
                       zlib1g-dev && \
    apt-get autoremove -y && \
    apt-get clean

#INSTALAR RVM - RUBY
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby

ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH
RUN echo "export PATH=$PATH" >> /root/.bashrc