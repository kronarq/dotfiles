#!/bin/python
# -*- coding: utf-8 -*-

import requests
import json

import sys

def icons_to_unicode(icon):
    switcher = {
        # Day icon	Night icon	Description
        # 01d.png  	01n.png  	clear sky 🌣
        "01d": "🌣",
        "01n": "🌣",
        # 02d.png  	02n.png  	few clouds 🌤
        "02d": "🌤",
        "02n": "🌤",
        # 03d.png  	03n.png  	scattered clouds 🌥
        "03d": "🌤",
        "03n": "🌤",
        # 04d.png  	04n.png  	broken clouds 🌥
        "04d": "🌥",
        "04n": "🌥",
        # 09d.png  	09n.png  	shower rain 🌦
        "09d": "🌦",
        "09n": "🌦",
        # 10d.png  	10n.png  	rain 🌦
        "10d": "🌦",
        "10n": "🌦",
        # 11d.png  	11n.png  	thunderstorm 🌩
        "11d": "🌩",
        "11n": "🌩",
        # 13d.png  	13n.png  	snow 🌨
        "13d": "🌨",
        "13n": "🌨",
        # 50d.png  	50n.png  	mist 🌫
        "50d": "🌫",
        "50n": "🌫",
    }
    return str(switcher.get(icon, "nothing"))


city = "Phoenix"
api_key = "8ae78c366c786712d4ba87b48016361b"
units = "imperial"
unit_key = "F"

# Request weather data from openweathermap.org. Returns request object with JSON string in r.text.
r=requests.get("http://api.openweathermap.org/data/2.5/weather?q=" + city + "&APPID=" + api_key + "&units=" + units)

# Parse JSON
weather = json.loads(r.text)

info = weather["weather"][0]["description"].title()
temp = int(weather["main"]["temp"])
icon = icons_to_unicode(weather["weather"][0]["icon"])

print(icon + " " + info + "  🌡 " + str(temp) + "°" + unit_key)
