FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y \
    default-jdk \
    wget && \
    rm -rf /var/lib/apt/lists/*

ENV KAFKA_PATH=/usr/local/kafka

RUN wget https://www-us.apache.org/dist/kafka/2.6.0/kafka_2.12-2.6.0.tgz && \
    tar xzf kafka_2.12-2.6.0.tgz && \
    mv kafka_2.12-2.6.0 $KAFKA_PATH && \
    rm -rf kafka_2.12-2.6.0.tgz

COPY scripts $KAFKA_PATH

WORKDIR $KAFKA_PATH

RUN chmod +x *.sh

EXPOSE 2181 9092
