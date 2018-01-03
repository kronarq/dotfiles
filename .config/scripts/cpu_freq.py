#!/bin/python
import cpuinfo

info = cpuinfo.get_cpu_info()

hz_actual = round(float(info["hz_actual"].strip(" GHz")), 2)
hz_advertised = round(float(info["hz_advertised"].strip(" GHz")), 2)

print(str(hz_actual) + "/" + str(hz_advertised) + " GHz")
