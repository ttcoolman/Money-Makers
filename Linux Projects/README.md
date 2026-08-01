# EE250 – Internet of Things & Linux Labs (USC)

Welcome to my **EE250 (Introduction to Embedded Systems)** repository from the **University of Southern California (USC)**. This repository contains the labs, projects, and exercises completed throughout the course, with an emphasis on **Internet of Things (IoT)** development, **real-time embedded programming**, **FreeRTOS**, and building proficiency with **Linux-based development environments**.

---

## Course Overview

EE250 introduces the fundamentals of embedded systems through hands-on projects using the Linux platform. Throughout the course, I developed applications that combine hardware, software, networking, and operating system concepts to build reliable IoT systems.

Topics covered include:

* Embedded C/C++ programming
* ESP32 development
* FreeRTOS multitasking
* Inter-task communication
* Synchronization primitives
* Interrupt Service Routines (ISRs)
* Internet of Things (IoT)
* AI or ML 
* MQTT communication
* Environmental monitoring
* Linux command-line development
* Embedded debugging techniques

---

# Repository Structure

```
EE250/
├── Lab 1 - Linux Fundamentals/
├── Lab 2 - ESP32 Programming/
├── Lab 3 - GPIO & Interrupts/
├── Lab 4 - FreeRTOS Tasks/
├── Lab 5 - Synchronization/
├── Lab 6 - Queues & Semaphores/
├── Lab 7 - Internet of Things/
├── Lab 8 - Environmental Monitor/
├── Lab 9 - Final Project/
└── README.md
```

---

# Featured Projects

## Linux Development Environment

Developed proficiency using Linux as the primary embedded development environment.

Skills practiced include:

* Bash shell navigation
* File system management
* Permissions
* Process management
* Package management
* Git workflow
* Command-line debugging
* Building embedded projects from Linux

Example commands used:

```bash
ls
cd
pwd
chmod
grep
find
ps
kill
git
make
```

---

## Grove Pi with Rasp Pi  Programming

Built multiple embedded applications using the ESP32 microcontroller.

Concepts explored:

* GPIO control
* Digital inputs and outputs
* Timers
* Serial communication
* Hardware abstraction
* Embedded debugging

---

## FreeRTOS Multitasking

Designed applications composed of multiple concurrent tasks running under FreeRTOS.

Topics include:

* Task creation
* Task priorities
* Scheduling
* Cooperative and preemptive multitasking
* Timing and delays

Example:

* Sensor task
* Display task
* Network task
* Monitoring task

---

## Mutexes, Semaphores, and Queues

Implemented synchronization mechanisms to safely coordinate multiple concurrent tasks.

Covered concepts:

* Mutex protection
* Binary semaphores
* Counting semaphores
* Queues
* Critical sections
* Deadlock debugging
* Race condition prevention

Example labs include:

* Mutex debugging exercise
* Queue-based sensor communication
* ISR-to-task synchronization

---

## Internet of Things (IoT)

Developed connected embedded systems capable of communicating with external services.

Features include:

* MQTT messaging
* Sensor data collection
* Real-time publishing
* Environmental monitoring
* Remote device interaction

Example architecture:

```
Sensors
   │
   ▼
Raspyberry Pi 5 
   │
FreeRTOS Tasks
   │
MQTT
   │
Cloud Dashboard
```

---

## Environmental Monitoring System

Designed a multitasking environmental monitoring application featuring:

* Temperature sensing
* Humidity sensing
* Alert thresholds
* LCD/OLED display
* MQTT publishing
* Concurrent task execution
* Interrupt-driven user input

Key FreeRTOS components:

* Tasks
* Mutexes
* Queues
* Binary semaphores

---

## Interrupt-Driven Programming

Implemented responsive embedded software using hardware interrupts.

Examples include:

* Button interrupt handling
* ISR signaling
* Deferred task processing
* Event-driven execution

---

## Embedded Systems Debugging

Practiced debugging techniques including:

* Serial logging
* Timing analysis
* Deadlock detection
* Synchronization debugging
* Race condition analysis
* FreeRTOS task inspection

---

# Skills Developed

### Embedded Systems

* ESP32 Programming
* Embedded C/C++
* GPIO
* Timers
* Interrupts
* Serial Communication

### Real-Time Systems

* FreeRTOS
* Multithreading
* Scheduling
* Task Synchronization
* Queues
* Mutexes
* Semaphores

### Internet of Things

* MQTT
* Sensor Networks
* Embedded Networking
* Environmental Monitoring
* IoT Communication

### Linux

* Bash
* Git
* Shell Commands
* File Management
* Process Management
* Development Toolchains

---

# Technologies

* ESP32
* Arduino Framework
* FreeRTOS
* C/C++
* Linux
* Git
* MQTT
* Wokwi Simulator

---

# Learning Outcomes

By completing these labs and projects, I gained practical experience in:

* Designing multitasking embedded systems
* Developing Internet of Things applications
* Writing thread-safe concurrent software
* Debugging synchronization issues
* Using Linux as an embedded development platform
* Applying real-time operating system concepts to embedded hardware

---

## Acknowledgements

Coursework completed as part of **EE250 – Introduction to Embedded Systems** at the **University of Southern California (USC)**. The projects in this repository demonstrate hands-on experience with embedded software development, Internet of Things technologies, real-time operating systems, and Linux-based development workflows.
