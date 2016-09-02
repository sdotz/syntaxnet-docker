FROM ubuntu:15.10
MAINTAINER Stephen Dotz <scdotz@gmail.com>
VOLUME ./
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y python python-setuptools python-dev build-essential
RUN easy_install pip
RUN apt-get install -y pkg-config zip g++ zlib1g-dev unzip

RUN apt-get install -y git wget

RUN apt-get install -y swig
RUN pip install asciitree numpy
RUN pip install -U protobuf==3.0.0b2

RUN wget https://github.com/bazelbuild/bazel/releases/download/0.2.2/bazel-0.2.2-installer-linux-x86_64.sh
RUN chmod +x bazel-0.2.2-installer-linux-x86_64.sh
RUN ./bazel-0.2.2-installer-linux-x86_64.sh

RUN update-ca-certificates -f
RUN git clone --recursive https://github.com/tensorflow/models.git
RUN cd /models/syntaxnet/tensorflow && ./configure && cd .. && bazel test syntaxnet/... util/utf8/...


