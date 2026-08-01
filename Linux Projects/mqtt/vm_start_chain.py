import paho.mqtt.client as mqtt
import time

BROKER_IP = "172.20.10.3"
PORT = 1883
USERNAME = "trmcdona"

PING_TOPIC = f"{USERNAME}/ping"
PONG_TOPIC = f"{USERNAME}/pong"


# ---------- Custom Callback ----------
def on_message_from_pong(client, userdata, msg):
    try:
        number = int(msg.payload.decode())
        print("Received from pong:", number)

        number += 1
        time.sleep(1)

        print("Publishing to ping:", number)
        client.publish(PING_TOPIC, str(number))  # send as string
    except Exception as e:
        print("Error processing message:", e)


def on_connect(client, userdata, flags, rc):
    print("Connected with result code", rc)
    client.subscribe(PONG_TOPIC)
    client.message_callback_add(PONG_TOPIC, on_message_from_pong)


if __name__ == "__main__":
    client = mqtt.Client()
    client.on_connect = on_connect

    client.connect(BROKER_IP, PORT, 60)

    client.loop_start()
    time.sleep(1)

    # Start the chain with an initial number
    start_number = 0
    print("Starting chain with:", start_number)
    client.publish(PING_TOPIC, str(start_number))  # send as string

    while True:
        time.sleep(1)
