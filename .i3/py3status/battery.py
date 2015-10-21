#-*- coding: utf-8 -*-
# upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep 'percentage' | tr -s ' ' | cut -d' ' -f 3 -
import subprocess
from time import time


class GetData:
    """Get system status

    """
    def execCMD(self, cmd, arg):
        """Take a system command and its argument, then return the result.

        Arguments:
        - `cmd`: system command.
        - `arg`: argument.
        """
        result = subprocess.check_output([cmd, arg])
        return result

    def battery(self):
        """Get the cpu usage data from /proc/stat :
        cpu  2255 34 2290 22625563 6290 127 456 0 0
        - user: normal processes executing in user mode
        - nice: niced processes executing in user mode
        - system: processes executing in kernel mode
        - idle: twiddling thumbs
        - iowait: waiting for I/O to complete
        - irq: servicing interrupts
        - softirq: servicing softirqs
        - steal: involuntary wait
        - guest: running a normal guest
        - guest_nice: running a niced guest
        These numbers identify the amount of time the CPU has spent performing
        different kinds of work.  Time units are in USER_HZ (typically hundredths of a
        second)
        """


        return self.execCMD(".i3/py3status/batterystatus","")
        #return subprocess.call("./batterystatus")
        # return self.execCMD("upower", "-i /org/freedesktop/UPower/devices/battery_BAT1 | grep 'percentage' | tr -s ' ' | cut -d' ' -f 3 -")

class Py3status:
    """
    System status in i3bar
    """
    def __init__(self):
        self.data = GetData()

    def battery(self, json, i3status_config):
        """calculate the CPU status and return it.

        """
        response = {'full_text': '', 'name': 'battery'}
        battery = self.data.battery()
        response['color'] = "#2aa198"            
        response['full_text'] = ''+str(battery)[2:-3]
        response['cached_until'] = time() + 5

        return (0, response)
