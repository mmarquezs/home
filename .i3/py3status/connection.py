#-*- coding: utf-8 -*-
import socket
from time import time
REMOTE_SERVER = "www.google.es"
def is_connected():
    try:
        host = socket.gethostbyname(REMOTE_SERVER)
        s = socket.create_connection((host, 80), 2)
        return True
    except:
        pass
    return False

class Py3status:
    def connection(self, i3status_output_json, i3status_config):
        if is_connected():
            text = ""
        else:
            text = ""

        response = {'full_text': '', 'name': 'connection'}
        response['color'] = "#b58900"
        #i3-gap config
        #response['background'] = "#222222"
        #response['border'] = "#9FBC00"
        #response['border_bottom'] = "0"
        
        ####
        response['full_text'] = text;
        response['cached_until'] = time() + 20
        return (0, response)
    def on_click(self, json, i3status_config, event):
        if event['button'] == 1:
            subprocess.Popen(["nm-connection-editor"])
            #subprocess.Popen(["killall", "-USR1", "py3status"])
