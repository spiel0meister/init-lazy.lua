import time, os, pyautogui

token = os.environ["CODEIUM_TOKEN"]
if token is None:
    print("Missing environment variable. Declare $CODEIUM_TOKEN!")
    exit(1)

time.sleep(2)
pyautogui.typewrite(token)
