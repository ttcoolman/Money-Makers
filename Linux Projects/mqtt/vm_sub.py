"""EE 250L Lab 04 Starter Code
Run vm_pub.py in a separate terminal on your VM."""

import paho.mqtt.client as mqtt

"""This function (or "callback") will be executed when this client receives 
a connection acknowledgement packet response from the server. """

def on_connect(client, userdata, flags, rc):
    print("Connected with result code", rc)

    client.subscribe("trmcdona/ip")
    client.subscribe("trmcdona/date")
    client.subscribe("trmcdona/time")

    client.message_callback_add("trmcdona/ip", on_message_ip)
    client.message_callback_add("trmcdona/date", on_message_date)
   


"""This object (functions are objects!) serves as the default callback for 
messages received when another node publishes a message this client is 
subscribed to. By "default,"" we mean that this callback is called if a custom 
callback has not been registered using paho-mqtt's message_callback_add()."""
def on_message(client, userdata, msg):
    print("Default callback - topic: " + msg.topic + "   msg: " + str(msg.payload, "utf-8"))

#Custom message callback.
def on_message_from_ipinfo(client, userdata, message):
   print("Custom callback  - IP Message: "+message.payload.decode())


def on_message(client, userdata, msg):
    print("Default callback - Topic:", msg.topic, "Message:", msg.payload.decode())

def on_message_ip(client, userdata, msg):
    print("IP CALLBACK ->", msg.payload.decode())

def on_message_date(client, userdata, msg):
    print("DATE CALLBACK ->", msg.payload.decode())





if __name__ == '__main__':
    
    #create a client object
    client = mqtt.Client()
    #attach a default callback which we defined above for incoming mqtt messages
    client.on_message = on_message
    #attach the on_connect() callback function defined above to the mqtt client
    client.on_connect = on_connect


  


    """Connect using the following hostname, port, and keepalive interval (in 
    seconds). We added "host=", "port=", and "keepalive=" for illustrative 
    purposes. You can omit this in python.
        
    The keepalive interval indicates when to send keepalive packets to the 
    server in the event no messages have been published from or sent to this 
    client. If the connection request is successful, the callback attached to
    `client.on_connect` will be called."""    
    client.connect(host="broker.hivemq.com", port=1883, keepalive=60)

    """In our prior labs, we did not use multiple threads per se. Instead, we
    wrote clients and servers all in separate *processes*. However, every 
    program with networking involved generally requires multiple threads to
    make coding simpler. Using MQTT is no different. If you are doing nothing 
    in this thread, you can run 
    
    `client.loop_forever()`
    
    which will block forever. This function processes network traffic (socket 
    programming is used under the hood), dispatches callbacks, and handles 
    reconnecting."""
    client.loop_forever()