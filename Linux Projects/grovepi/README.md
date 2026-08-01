# EE 250L Lab 06 – GrovePi Sensor-Based Object Detection System

## Overview

This project demonstrates how to interface a **Raspberry Pi** with the **GrovePi+ Starter Kit** to create an interactive embedded system using multiple sensors. The system continuously measures the distance to nearby objects using an ultrasonic sensor while allowing the user to dynamically adjust the detection threshold with a rotary angle sensor (potentiometer). The current threshold, measured distance, and object detection status are displayed in real time on an RGB LCD. :contentReference[oaicite:0]{index=0}

This lab introduces hardware/software integration, sensor interfacing, and embedded Linux programming using Python.

---

## Learning Objectives

- Interface multiple GrovePi sensors with a Raspberry Pi
- Read analog and digital sensor inputs
- Control an RGB LCD display
- Develop real-time embedded software in Python
- Configure hardware communication buses (I2C)
- Build sensor-driven embedded applications
- Gain experience developing on Linux using Git

---

## Technologies

- Raspberry Pi
- GrovePi+ Base Hat
- Python
- GrovePi Python Libraries
- Linux
- Git
- I2C Communication

---

## Hardware Used

- Raspberry Pi
- GrovePi+ Base Hat
- Grove Ultrasonic Distance Sensor
- Grove Rotary Angle Sensor (Potentiometer)
- Grove 16×2 RGB LCD Display

These components are used throughout the lab to build a real-time object detection system. :contentReference[oaicite:1]{index=1}

---

## Project Structure

```
.
├── grovepi_sensors.py
└── README.md
```

---

# Project Description

The application continuously performs the following tasks:

1. Reads the current threshold value from the rotary angle sensor.
2. Measures the distance to the nearest object using the ultrasonic sensor.
3. Compares the measured distance with the user-defined threshold.
4. Displays the threshold and measured distance on the LCD.
5. Displays **"OBJ PRES"** whenever an object is detected within the threshold distance.

The system updates continuously, providing real-time feedback without refreshing the LCD display to avoid visible flickering. :contentReference[oaicite:2]{index=2}

---

# Features

## Adjustable Detection Threshold

The rotary angle sensor acts as a potentiometer that allows the user to change the object detection threshold between **0 and 1023**.

Example:

```
Threshold: 350
```

---

## Ultrasonic Distance Measurement

The ultrasonic ranger continuously measures the distance to nearby objects in centimeters.

Example:

```
Distance: 72 cm
```

---

## Object Presence Detection

Whenever

```
Distance < Threshold
```

the LCD displays

```
OBJ PRES
```

indicating that an object has entered the detection range.

---

## LCD Status Display

### No Object Detected

```
320
54 cm
```

### Object Detected

```
320 OBJ PRES
28 cm
```

The LCD updates using a non-refreshing display function to eliminate screen blinking during updates. :contentReference[oaicite:3]{index=3}

---

# Program Workflow

```
Initialize GrovePi

        │

        ▼

Read Potentiometer

        │

        ▼

Read Ultrasonic Sensor

        │

        ▼

Compare Distance
with Threshold

        │

        ▼

Update LCD Display

        │

        ▼

Repeat Forever
```

---

# How It Works

The application begins by configuring the GrovePi hardware interface and initializing the LCD display.

Inside the main loop, the program:

- Reads the ultrasonic distance sensor
- Reads the potentiometer value
- Determines whether an object is inside the threshold
- Formats text for the LCD
- Displays both sensor readings
- Prints debugging information to the terminal

The loop repeats approximately every 200 milliseconds to provide smooth real-time updates. :contentReference[oaicite:4]{index=4}

---

# Skills Demonstrated

## Embedded Systems

- Embedded software development
- Sensor integration
- Hardware abstraction
- Real-time polling

## Internet of Things (IoT)

- Sensor-based monitoring
- Edge device programming
- Physical computing

## Linux

- SSH into Raspberry Pi
- Linux command line
- Python execution
- Git workflow
- Package installation

## Python

- Hardware libraries
- Exception handling
- Continuous polling loops
- GPIO abstraction
- String formatting

---

# Running the Project

## Clone Repository

```bash
git clone <repository-url>
cd <repository-name>
```

---

## Install GrovePi Dependencies

Follow the GrovePi installation process and enable the required interfaces (SPI and I2C) before running the application. :contentReference[oaicite:5]{index=5}

---

## Execute

```bash
python grovepi_sensors.py
```

---

# Example Console Output

```
Threshold: 428 | Distance: 79cm
Threshold: 431 | Distance: 76cm
Threshold: 438 | Distance: 35cm
Threshold: 438 | Distance: 27cm
```

---

# Concepts Learned

- Embedded Linux Development
- Raspberry Pi Programming
- GrovePi Hardware Interface
- Ultrasonic Distance Measurement
- Analog-to-Digital Conversion
- I2C Communication
- LCD Display Control
- Real-Time Sensor Polling
- Python Hardware Libraries
- Debugging Embedded Systems

---

# Future Improvements

Potential enhancements include:

- Change the LCD backlight color when an object is detected.
- Add audible alerts using a Grove buzzer.
- Log sensor measurements to a file for analysis.
- Publish sensor data to an MQTT broker for remote monitoring.
- Build a web dashboard to visualize real-time distance measurements.

---

# Course

**EE 250L – Introduction to Embedded Systems**

University of Southern California

---

# Author

**Terrance McDonald**
