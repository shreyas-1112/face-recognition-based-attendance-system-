import os
import cv2

def ensure_dir(path):
    """Create directory if it does not exist."""
    if not os.path.exists(path):
        os.makedirs(path)

def ensure_haarcascade(cascade_path="haarcascade_frontalface_default.xml"):
    """Ensure Haar Cascade exists, download if missing."""
    if not os.path.exists(cascade_path):
        import urllib.request
        url = "https://raw.githubusercontent.com/opencv/opencv/master/data/haarcascades/haarcascade_frontalface_default.xml"
        urllib.request.urlretrieve(url, cascade_path)
    return cascade_path
