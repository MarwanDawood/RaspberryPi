import cv2
import numpy as np
import sys
from AndroidCamFeed import AndroidCamFeed


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
        ret, frame = cap.read()
        if ret:

            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

            laplacian = cv2.Laplacian(gray,cv2.CV_64F)
            sobelx = cv2.Sobel(gray,cv2.CV_64F,1,0,ksize=5)
            sobely = cv2.Sobel(gray,cv2.CV_64F,0,1,ksize=5)

            cv2.imshow('Original',gray)
            cv2.imshow('laplacian',laplacian)
            cv2.imshow('sobelx',sobelx)
            cv2.imshow('sobely',sobely)

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
