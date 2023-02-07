FROM ubuntu:20.04
WORKDIR /root
RUN apt-get update && apt-get install -y wget curl gcc make flex bison byacc git vim postgresql-client
RUN git clone https://github.com/gregrahn/tpcds-kit.git
RUN cd /root/tpcds-kit/tools && make OS=LINUX
RUN mkdir /root/utils
COPY utils/gen.sh /root/utils/
RUN bash /root/utils/gen.sh

WORKDIR /root/utils
COPY utils ./
RUN chmod 744 *.sh



