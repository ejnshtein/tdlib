# ubuntu 20.10
FROM ubuntu:groovy as builder

# fix tzdata package
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
  make \
  git \
  zlib1g-dev \
  libssl-dev \
  gperf \
  php \
  cmake \
  g++

WORKDIR /tmp/_build_tdlib/

RUN git clone https://github.com/tdlib/td.git /tmp/_build_tdlib/ && git checkout -b 1.6.0

RUN mkdir build

WORKDIR /tmp/_build_tdlib/build/

RUN export CXXFLAGS=""
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install -j $(nproc)