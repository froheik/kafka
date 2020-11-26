#!/bin/bash
while [ 1 = 1 ]
do
	echo $RANDOM |  bin/kafka-console-producer.sh --broker-list kafka1:9092 --topic mytopic
done
