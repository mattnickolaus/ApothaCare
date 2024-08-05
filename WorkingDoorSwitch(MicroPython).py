from WifiModCloud import WifiModCloud
from machine import Pin
import time

wmc = WifiModCloud(dbg=True)  # Enable debug mode for more information

#Ensure the WiFi credentials are correct and try to connect
try:
    ip_address = wmc.connect_wifi("ssid", "password")
    if ip_address:
        print("Connected to WiFi, IP Address:", ip_address)
    else:
        print("Failed to connect to WiFi")
except Exception as e:
    print("Error connecting to WiFi:", e)

# Check if Firebase configuration is successful
try:
    wmc.setdb_to_firebase(host="https://apotha-care-h5edpz-default-rtdb.firebaseio.com/",
                          auth="H1ffIaVEoqDEIgRecEQ2LuZtj0vFJdHpk5irZE9n", tree="pico")
    print("Firebase configured successfully")
except Exception as e:
    print("Error setting Firebase:", e)

# Function to format datetime
def _format_datetime(datetime):
    return "{:02}/{:02}/{} {:02}:{:02}:{:02}".format(
        datetime[1],  # month
        datetime[2],  # day
        datetime[0],  # year
        datetime[3],  # hour
        datetime[4],  # minute
        datetime[5]   # second
    )

# Function to get current date and time
def _get_date():
    current_time = time.localtime()
    current_date = _format_datetime(current_time)
    print("Timestamp:", current_date)

# Setup for door sensor
door_sensor = Pin(14, Pin.IN, Pin.PULL_UP)

hasOpened = False

while True:
    if door_sensor.value() == 1:  # True when open
        print("Door OPEN!!")
        if not hasOpened:
            _get_date()
            print(time.time())
            # Set value to Firebase
            #try:
            #    wmc.set_value(key="pico_time_taken", value=time.time())
            #    print("Timestamp sent to Firebase")
            #except Exception as e:
            #    print("Failed to set value:", e)
            hasOpened = True
    else:
        print("0")
        hasOpened = False
    time.sleep(0.25)