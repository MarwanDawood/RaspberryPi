# Running phone camera through WiFi network on laptop as a webcam
1. `Add the file AndroidCamFeed.py` to the working directory
2. Modify the code in file `Camera.py` to include your code after line 22 (the condition check)
3. Download the android application [IP Webcam](https://play.google.com/store/apps/details?id=com.pas.webcam&hl=en) and start it as a server
4. Get the URL address and the port number and make a command like this
```
python Camera.py.py 192.168.1.2:8080
```
