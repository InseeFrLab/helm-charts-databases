from confluent_kafka import Producer, Consumer
import socket
import sys

print("Setting up producer...")
pconf = {
    'bootstrap.servers': sys.argv[1],
    'client.id': socket.gethostname()
}
producer = Producer(pconf)

print("Sending message to topic `helm-test-kafka-db`...")
producer.produce("helm-test-kafka-db", key="Test result", value="Success!")
producer.flush()

print("Setting up consumer...")
cconf = {'bootstrap.servers': sys.argv[1],
         'group.id': 'foo',
         'auto.offset.reset': 'smallest'}
consumer = Consumer(cconf)
consumer.subscribe(["helm-test-kafka-db"])

print("Waiting message from topic `helm-test-kafka-db`...")
while True:
    try:
        msg = consumer.poll(1.0)
        if msg is None:
            continue
        else:
            print(msg.value())
            exit(0)
    except KeyboardInterrupt:
        exit(1)
