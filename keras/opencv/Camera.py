import cv2
import numpy as np
import sys
from AndroidCamFeed import AndroidCamFeed

face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
# https://github.com/Itseez/opencv/blob/master/data/haarcascades/haarcascade_eye.xml
eye_cascade = cv2.CascadeClassifier('haarcascade_eye.xml')
#this is the cascade we just made. Call what you want
watch_cascade = cv2.CascadeClassifier('data/watch_cascade_10_stages.xml.xml')

def main():
    if not sys.argv[1] or len(sys.argv) > 2:
        print "Usage: \n\tpython Example.py <host>:<port>"
        return

    # Set host
    host = sys.argv[1]

    # Create new AndroidCamFeed instance
    cap = AndroidCamFeed(host)

    # While camera is open
    while cap.isOpened():
        ## Read frame
        ret, img = cap.read()
        if ret:

## ADD YOUR CODE HERE!

            gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
            faces = face_cascade.detectMultiScale(gray, 1.3, 5)

            # image, reject levels level weights.
            watches = watch_cascade.detectMultiScale(gray, 50, 50)

            for (x, y, w, h) in watches:
                cv2.rectangle(img, (x, y), (x + w, y + h), (255, 255, 0), 2)

            for (x, y, w, h) in faces:
                cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0), 2)
                # used for image detection
                roi_gray = gray[y:y + h, x:x + w]
                # used to output the rectangle on the colored image
                roi_color = img[y:y + h, x:x + w]

                eyes = eye_cascade.detectMultiScale(roi_gray)
                for (ex, ey, ew, eh) in eyes:
                    cv2.rectangle(roi_color, (ex, ey), (ex + ew, ey + eh), (0, 255, 0), 2)


## END OF YOUR CODE!

        # delay in 5 milliseconds
        k = cv2.waitKey(5) & 0xFF
        # 27 is the escape character
        if k == 27:
            break

    # Must Release ACF instance
    cv2.destroyAllWindows()
    cap.release()
    return


if __name__ == '__main__':
    main()
