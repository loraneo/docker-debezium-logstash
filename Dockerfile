FROM loraneo/docker-java:8u144a

WORKDIR /opt

ENV LOGSTASH_HOME /opt/logstash

RUN cd /tmp &&\
	wget -L https://artifacts.elastic.co/downloads/logstash/logstash-5.6.3.tar.gz &&\
	tar -xvf logstash-5.6.3.tar.gz &&\
	mv logstash-5.6.3 /opt && \
	ln -s /opt/logstash-5.6.3 $LOGSTASH_HOME


COPY config/logstash.conf $LOGSTASH_HOME/config/logstash.conf

CMD $LOGSTASH_HOME/bin/logstash -f $LOGSTASH_HOME/config/logstash.conf

