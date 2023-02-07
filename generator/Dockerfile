FROM ubuntu:20.04
WORKDIR /root
RUN apt-get update && apt-get install -y wget curl gcc make flex bison byacc git vim postgresql-client
RUN git clone https://github.com/gregrahn/tpcds-kit.git
RUN cd /root/tpcds-kit/tools && make OS=LINUX
RUN mkdir /root/tpcds-kit/utils
WORKDIR /root/tpcds-kit/utils
RUN echo "/root/tpcds-kit/tools/dsdgen -SCALE ${1:-1} -FORCE -VERBOSE" >> /root/utils/gen.sh
RUN echo "/root/tpcds-kit/tools/dsqgen -SCALE ${1:-1} -DIRECTORY /root/tpcds-kit/query_templates -INPUT /root/tpcds-kit/query_templates/templates.lst -VERBOSE Y -QUALIFY Y -DIALECT netezza" >> /root/utils/gen.sh
RUN bash /root/tpcds-kit/gen.sh

RUN set -x \
&& { \
echo 'cd /root/tpcds-kit/tools'; \
echo 'for i in `ls *.dat`; do'; \
echo '  table=${i/.dat/}'; \
echo '  echo "Loading $table..."'; \
echo '  sed '"'"'s/|$//'"'"' $i > /tmp/$i'; \
echo '  psql "$crd dbname=tpcds" -q -c "TRUNCATE $table"'; \
echo '  psql "$crd dbname=tpcds" -c "\\\\copy $table FROM '"'"'/tmp/$i'"'"' CSV DELIMITER '"'"'|'"'"'"'; \
echo 'done'; \
echo 'cd /root/utils'; \
} > /root/utils/dbgen-data-detail.sh

RUN chmod 744 *.sh



