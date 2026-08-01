# EE 250L Lab 04 – MQTT Publish/Subscribe Communication

## Overview

This project introduces the fundamentals of **Message Queuing Telemetry Transport (MQTT)**, a lightweight messaging protocol widely used in **Internet of Things (IoT)** systems. The lab demonstrates how multiple applications can communicate asynchronously through an MQTT broker using the publish/subscribe model.

The project consists of two independent exercises:

- **Publisher/Subscriber System**
- **Ping-Pong Message Chain**

These exercises provide hands-on experience with MQTT topics, callbacks, asynchronous networking, and event-driven programming.

---

## Learning Objectives

- Understand the MQTT publish/subscribe architecture.
- Learn how MQTT brokers route messages between clients.
- Implement MQTT publishers and subscribers using Python.
- Use topic-specific callback functions.
- Build asynchronous network applications using background threads.
- Explore message passing between independent processes.

---

## Technologies

- Python 3
- Eclipse Paho MQTT Client
- HiveMQ Public Broker
- Raspberry Pi MQTT Broker (optional)
- Linux Virtual Machine

---

## Project Structure

```
.
├── vm_pub.py
├── vm_sub.py
├── vm_start_chain.py
└── vm_cont_chain.py
```

---

# Part 1 – Publisher & Subscriber

## Publisher (`vm_pub.py`)

The publisher periodically collects system information and publishes it to MQTT topics.

### Published Data

- IP Address
- Current Date
- Current Time

### Example Topics

```
username/ip
username/date
username/time
```

The publisher continuously updates these values every few seconds.

---

## Subscriber (`vm_sub.py`)

The subscriber listens for messages published by the publisher.

It demonstrates:

- Topic subscriptions
- Custom callback functions
- Default callbacks
- Event-driven message handling

Each topic has its own callback function, allowing different message types to be processed independently.

Example output:

```
IP CALLBACK -> 192.168.1.50
DATE CALLBACK -> 2026-08-01
TIME CALLBACK -> 14:35:27
```

---

# Part 2 – Ping-Pong Message Chain

This exercise demonstrates communication between two independent MQTT clients.

## Start Chain (`vm_start_chain.py`)

Responsibilities:

- Publishes the initial number (0)
- Waits for responses
- Increments received values
- Publishes them back

Topic used:

```
username/ping
```

and receives from

```
username/pong
```

---

## Continue Chain (`vm_cont_chain.py`)

Responsibilities:

- Waits for values on the ping topic
- Receives a number
- Increments it
- Publishes it back on the pong topic

This creates an endless message exchange between both applications.

Example:

```
Start Chain
    |
    | publish 0
    V

Continue Chain
    |
    | receive 0
    | publish 1
    V

Start Chain
    |
    | receive 1
    | publish 2
    V

Continue Chain
    |
    | receive 2
    | publish 3
    .
    .
    .
```

---

# MQTT Concepts Demonstrated

- MQTT Broker
- Publish/Subscribe Architecture
- Topics
- Message Routing
- Callback Functions
- Asynchronous Networking
- Event-Driven Programming
- Background Threads (`loop_start()` / `loop_forever()`)

---

# Skills Developed

- IoT Networking
- Python Networking
- Linux Development
- MQTT Protocol
- Distributed Communication
- Asynchronous Programming
- Software Debugging
- Process Communication

---

# Running the Programs

## Install Dependencies

```bash
pip install paho-mqtt
```

---

## Publisher / Subscriber

Open two terminals.

### Terminal 1

```bash
python vm_sub.py
```

### Terminal 2

```bash
python vm_pub.py
```

The subscriber will receive IP address, date, and time updates from the publisher.

---

## Ping-Pong Demo

Open two terminals.

### Terminal 1

```bash
python vm_cont_chain.py
```

### Terminal 2

```bash
python vm_start_chain.py
```

The number will continuously increment as both programs exchange MQTT messages.

---

# What I Learned

Through this lab, I gained experience with:

- Building distributed applications using MQTT
- Implementing publish/subscribe communication
- Writing asynchronous Python applications
- Using callback-driven programming
- Creating topic-specific message handlers
- Understanding how IoT devices communicate over a broker
- Developing networking applications on Linux

---

## Course

**EE 250L – Introduction to Embedded Systems**

University of Southern California

---

## Author

**Terrance McDonald**
