from typing import Union
from fastapi import FastAPI
import os, socket

app = FastAPI()

def interact_withfile(file_path):
    with open(file_path, 'r') as f:
        content = int(f.read()) + 1
    with open(file_path, 'w') as f:
        f.write(str(content))
    return content

def log_request(msg):
    hostname = socket.gethostname()
    with open('log', 'a') as f:
        f.write(f"{hostname} - {msg}\n")

@app.get("/")
def read_root():
    content = 'This is just the root file!'
    return_dict = {
        'content': content
    }
    return return_dict

@app.get("/counter")
def read_root():
    content = interact_withfile('counter/counter')
    log_request(f'content: {content}')
    return_dict = {
        'counter': content
    }
    return return_dict
