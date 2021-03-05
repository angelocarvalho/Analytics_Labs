wget https://archive.apache.org/dist/kafka/2.2.1/kafka_2.12-2.2.1.tgz
tar -xzf kafka_2.12-2.2.1.tgz
msk_host="endpoint:port,endpoint:port,endpoint:port"
kafka_2.12-2.2.1/bin/kafka-topics.sh --create --zookeeper $msk_host --replication-factor 2 --partitions 1 --topic AWSKafkaTutorialTopic