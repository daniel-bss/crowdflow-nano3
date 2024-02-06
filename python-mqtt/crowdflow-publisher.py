import paho.mqtt.client as mqtt
from random import randrange, uniform
import time
import json

mqttBroker = "broker.emqx.io"

client = mqtt.Client("ultrasonic")
client.connect(mqttBroker)

topic1 = "dummy-data/nc3c6s2"
topic2 = "ultrasonic/nc3c6s2"

data = {
    "car1": [45, 15, 10],
    "car3": [45, 15, 10],
    "car4": [45, 15, 10],
    "car5": [45, 15, 10],
    "car6": [45, 15, 10]
}

def publisher1():
    # randNumber1 = round(uniform(0, 1))
    
    for k, v in data.items():
        regSeat = data[k][0] + round(uniform(-5, 5))
        prioritySeat = data[k][1] + round(uniform(-3, 3))
        bicycleArea = data[k][2] + round(uniform(-2, 2))
        
        data[k][0] = min(45, max(0, regSeat))
        data[k][1] = min(15, max(0, prioritySeat))
        data[k][2] = min(10, max(0, bicycleArea))
    
    jsonData: str = json.dumps(data)
    client.publish(topic1, jsonData)

def publisher2():
    randNum = round(uniform(0, 2))
    client.publish(topic2, int(randNum))

while True:
    publisher1()
    publisher2()
    time.sleep(0.8)
    
