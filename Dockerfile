FROM drydock/u14all:master

ADD . /u14cppall

RUN /u14cppall/install.sh
