#!/usr/bin/env python3

import time, os, pyautogui

token = os.environ.get("CODEIUM_TOKEN")
if token is None:
    print("Missing environment variable. Declare $CODEIUM_TOKEN!")
    exit(1)

time.sleep(2)
pyautogui.typewrite(token)
