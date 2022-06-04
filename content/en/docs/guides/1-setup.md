---
title: "Set Up Your Build Environment"
weight: 100
linkTitle: "1. Set Up Environment"
---
![Environment setup](/Users/brianchristensen/Documents/Edgeworx/Docs/github-docs/docs/images/guides/:Users:brianchristensen:Documents:Edgeworx:Docs:Docs assets:Environment setup.png)

## What you will accomplish

This guide shows how to setup a local environment on macOS to build Darcy AI applications (you can also use [Linux]() and [Windows]()). After you finish setting up your Mac as a development environment, you will be able to write, test, and debug your Darcy AI apps. Then you can package your code and deploy the applications to any edge device!

## Requirements

* Mac, [Linux]() or [WIndows]() computer

* A video camera that you want to use (the built-in webcam works very well for this purpose)

* 5GB or more of free disk space to accommodate code libraries and application container images

* Any IDE software that will allow you to write and debug Python (use your favorite IDE)

-----

## 1. Install Dependencies
### Install Python 3.6.9 or greater

If you do not already have Python version 3.6.9 or greater, you will need to install it now. Darcy AI requires this version of Python or higher. Note that Python 2.x versions are also not compatible with Darcy AI. You need Python 3 and the `darcyai` library will not install with versions below 3.6.9.

Download and install the latest or your preferred version of Python3 from Python.org directly [https://www.python.org/downloads/macos/](https://www.python.org/downloads/macos/).

If you have both Python 2.x versions and Python 3.x versions on your Mac, you may need to use `python3` and `pip3` for all of the commands instead of just `python` and `pip`. You can change this if you want by following this guide [https://osxdaily.com/2022/02/15/make-python-3-default-macos/](https://osxdaily.com/2022/02/15/make-python-3-default-macos/).

### Install OpenCV

Install the OpenCV package for Python with the command `pip install opencv-python`

### Install the Pillow library

Install the Pillow package for Python with the command `pip install Pillow`.

### Install the Numpy library

Install the numpy package for Python with the command `pip install numpy`.

### Install the Imutils library

Install the imutils package for Python with the command `pip install imutils`.

### Install the DarcyAI library

Install the Darcy AI library for Python with the command `pip install darcyai`.

### Install Docker for Mac

If you don't already have Docker on your Mac, install it now by following the official instructions [https://docs.docker.com/desktop/mac/install/](https://docs.docker.com/desktop/mac/install/).

After you have installed Docker, you can use `docker` commands in terminal. You will be using these commands to package your Darcy AI applications for deployment, including deploying to edge devices that are a different CPU architecture than your Mac! To make sure you can use the latest Docker build commands like `buildx` you can add an environment variable to your Mac with the following command `export DOCKER_CLI_EXPERIMENTAL=enabled`. This will tell Docker to allow use of the latest tools which will save you a lot of time when packaging your apps!

> Note that you may need to use `sudo docker` instead of just `docker` depending on how you install and set up Docker for Mac. If that is the case on your development machine, you can just add `sudo` to the beginning of any `docker` commands shown in these guides.

### Install TensorFlow

Install TensorFlow for Python with the command `pip install tensorflow`

## 2. Test your environment
### Run the People Detector Edge AI app

```
import cv2
import os
import pathlib

from darcyai.perceptor.people_perceptor import PeoplePerceptor
from darcyai.input.camera_stream import CameraStream
from darcyai.output.live_feed_stream import LiveFeedStream
from darcyai.pipeline import Pipeline
from darcyai.config import RGB

# Instantiate an Camera Stream input stream object
camera = CameraStream(video_device=0, fps=20)

# Instantiate the Pipeline object and pass it the Camera Stream object as its input stream source
pipeline = Pipeline(input_stream=camera)

# Create a Live Feed output stream object and specify some URL parameters
live_feed = LiveFeedStream(path="/", port=3456, host="0.0.0.0")

# Create a callback function for handling the Live Feed output stream data before it gets presented
def live_feed_callback(pom, input_data):
    # Start wth the annotated video frame available from the People Perceptor
    frame = pom.peeps.annotatedFrame().copy()

    # Add some text telling how many people are in the scene
    label = "{} peeps".format(pom.peeps.peopleCount())
    color = (0, 255, 0)
    cv2.putText(frame, str(label), (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, color, 1, cv2.LINE_AA)

    # If we have anyone, demonstrate looking up that person in the POM by getting their face size
    # And then put it on the frame as some text
    # NOTE: this will just take the face size from the last person in the array
    if pom.peeps.peopleCount() > 0:
        for person_id in pom.peeps.people():
            face_size = pom.peeps.faceSize(person_id)
            face_height = face_size[1]
            label2 = "{} face height".format(face_height)
            color = (0, 255, 255)
            cv2.putText(frame, str(label2), (10, 80), cv2.FONT_HERSHEY_SIMPLEX, 1, color, 1, cv2.LINE_AA)

    # Pass the finished frame out of this callback so the Live Feed output stream can display it
    return frame

# Add the Live Feed output stream to the Pipeline and use the callback from above as the handler
pipeline.add_output_stream("output", live_feed_callback, live_feed)

# Create a callback function for handling the input that is about to pass to the People Perceptor
def people_input_callback(input_data, pom, config):
    # Just take the frame from the incoming Input Stream and send it onward - no need to modify the frame
    frame = input_data.data.copy()
    return frame

# Create a callback function for handling the "New Person" event from the People Perceptor
# Just print the person ID to the console
def new_person_callback(person_id):
    print("New person: {}".format(person_id))

# Instantiate a People Perceptor
people_ai = PeoplePerceptor()

# Subscribe to the "New Person" event from the People Perceptor and use our callback from above as the handler
people_ai.on("new_person_entered_scene", new_person_callback)

# Add the People Perceptor instance to the Pipeline and use the input callback from above as the input preparation handler
pipeline.add_perceptor("peeps", people_ai, input_callback=people_input_callback)

# Update the configuration of the People Perceptor to show the pose landmark dots on the annotated video frame
pipeline.set_perceptor_config("peeps", "show_pose_landmark_dots", True)
pipeline.set_perceptor_config("peeps", "pose_landmark_dot_size", 2)
pipeline.set_perceptor_config("peeps", "pose_landmark_dot_color", RGB(0, 255, 0))

# Start the Pipeline
pipeline.run()
```

## Start building your AI applications with Darcy

Go to the [Build Guide](./BUILD.md) and get started building with Darcy AI!
