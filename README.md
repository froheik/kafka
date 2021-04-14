###Create topic 
kafka-topics --create --zookeeper zookeeper:2181 --replication-factor 3 --partitions 3 --topic mytopic

###Describe topic
kafka-topics --describe --topic mytopic --zookeeper zookeeper:2181

###Look message stream
bin/kafka-console-consumer.sh --bootstrap-server kafka1:9092 --topic mytopic

###Change number of partitions in topic
####You can only scale up number of partitions, scaling down by delete a topic and create with custom partition count 
kafka-topics --zookeeper localhost:2181 --topic mytopic --partitions X

---------------
bin/kafka-console-producer.sh --broker-list kafka1:9092 --topic mytopic

###!/bin/bash
while [ 1 = 1 ]
do
echo $RANDOM |  kafka-console-producer --broker-list kafka1:9092 --topic mytopic
done



apt-get update
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
