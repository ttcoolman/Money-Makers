
# Import the MQTT client library
import paho.mqtt.client as mqtt
# Used to slow down publishing so numbers don't update too fast
import time

# IP address of your Raspberry Pi (this is your broker)
BROKER_IP = "172.20.10.3"
# Default MQTT port
PORT = 1883
# Your unique username (used to create unique topics)
USERNAME = "trmcdona"


# Create topic names using your username
# Example: trmcdona/ping and trmcdona/pong
PING_TOPIC = f"{USERNAME}/ping"
PONG_TOPIC = f"{USERNAME}/pong"

# ---------- Custom Callback ----------

# This function runs whenever a message is received on the PING_TOPIC
def on_message_from_ping(client, userdata, msg):

     # Convert received message (bytes) → string → integer
    number = int(msg.payload.decode())

     # Print what we received
    print("Received from ping:", number)

 # Add 1 to the number
    number += 1
 # Wait 1 second so it doesn't update too fast
    time.sleep(1)

# Print what we are about to send
    print("Publishing to pong:", number)
# Publish the incremented number to the pong topic
    client.publish(PONG_TOPIC, number)

# This runs once the client successfully connects to the broker
def on_connect(client, userdata, flags, rc):
    # Subscribe to the ping topic
    # This means: "I want to receive messages from this topic"
    client.subscribe(PING_TOPIC)
    print("Connected with result code", rc)

    client.subscribe(PING_TOPIC)
    # Register a custom callback for that topic
    # So when we receive ping → call on_message_from_ping()
    client.message_callback_add(PING_TOPIC, on_message_from_ping)

# ---------------- MAIN PROGRAM ----------------
if __name__ == "__main__":
    # Create MQTT client object
    client = mqtt.Client()
 # Attach the connection callback function
    client.on_connect = on_connect
     # Connect to Raspberry Pi broker

    client.connect(BROKER_IP, PORT, 60)
     # Start MQTT network loop in background thread
    # This allows the program to send/receive messages continuously without blocking
    client.loop_start()
# Keep the program running forever
    # (Otherwise it would exit immediately)
    while True:
        time.sleep(1)
