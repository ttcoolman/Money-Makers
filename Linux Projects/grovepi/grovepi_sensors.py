import sys
sys.path.append('~/Dexter/GrovePi/Software/Python')
import time
import grovepi
from grove_rgb_lcd import *

# set I2C to use the hardware bus
grovepi.set_bus("RPI_1")

# Grove Ultrasonic Ranger connected to digital port 2
ultrasonic_ranger = 2
# potentiometer connected to analog port A0 as input
potentiometer = 0
grovepi.pinMode(potentiometer, "INPUT")

# clear lcd screen before starting main loop
setText("")
setRGB(0, 128, 64)

while True:
    try:
        # Read distance value from Ultrasonic Ranger
        distance = grovepi.ultrasonicRead(ultrasonic_ranger)

        # Read threshold from potentiometer
        threshold = grovepi.analogRead(potentiometer)

        # Format LCD text according to threshold
        # Top line: threshold value + "OBJ PRES" if object detected
        if distance < threshold:
            top_line = str(threshold) + " OBJ PRES"
        else:
            top_line = str(threshold) + " "

        # Bottom line: current ultrasonic ranger measurement
        bottom_line = str(distance) + "cm"

        lcd_text = top_line + "\n" + bottom_line
        setText_norefresh(lcd_text)

        # Print to console for debugging
        print("Threshold: {} | Distance: {}cm".format(threshold, distance))

        time.sleep(0.2)

    except IOError:
        print("Error")