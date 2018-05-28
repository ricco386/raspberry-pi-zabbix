#!/bin/sh
 
# Script for Monitoring a Raspberry Pi with Zabbix
# 2013 Bernhard Linz
# Bernhard@znil.de / http://znil.net
#
# Simplified by RicCo / @ricco386
 
case "$1" in
        boardversion)
                # Get the Hardware Version
                cat /proc/cpuinfo | grep Hardware | tr -d " " | cut -d ":" -f 2
                ;;
        boardrevision)
                # Get the Hardware Revision
                cat /proc/cpuinfo | grep Revision | tr -d " " | cut -d ":" -f 2
                ;;
        boardserialnumber)
                # Get the Board unique Serial Number
                cat /proc/cpuinfo | grep Serial | tr -d " " | cut -d ":" -f 2
                ;;
        firmwareversion)
                # Just the naked String of the firmware Version
                vcgencmd version | grep version | cut -d " " -f 2
                ;;
        cpuvoltage)
                # CPU Voltage in Volt
                /opt/vc/bin/vcgencmd measure_volts | tr -d "volt=" | tr -d "V"
                ;;
        cpuclock)
                # CPU Clock Speed in Hz
                /opt/vc/bin/vcgencmd measure_clock arm | tr -d "frequency(45)="
                ;;
        cpumem)
                # CPU Memory in MByte
                vcgencmd get_mem arm | tr -d "arm=" | tr -d "M"
                ;;
        cputemp)
                # CPU Temperature in 1/1000 centigrade
                cat /sys/class/thermal/thermal_zone*/temp
                ;;
        gpumem)
                # Graphics memeory in MByte
                vcgencmd get_mem gpu | tr -d "gpu=" | tr -d "M"
                ;;
        *)
                echo "Usage: $N {boardversion|boardrevision|boardserialnumber|firmwareversion|cpuvoltage|cpuclock|cpumem|cputemp|gpumem}" >&2
esac

exit 0
