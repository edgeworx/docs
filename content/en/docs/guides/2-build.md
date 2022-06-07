---
title: "Build an Edge AI App to Detect People"
weight: 200
linkTitle: "2. Build an Edge AI App"
---
## What you will accomplish

In this step-by-step guide you'll learn how to build your first Darcy AI app to detect and count people.

> Insert pipeline and or process diagram here
>
> Insert app screenshot here

## Requirements

- Needs
- Content

-----

## 1. Create your application Python file and import libraries

You only need a single Python file to build a Darcy AI application. Open a new .py file in your
favorite IDE and name it whatever you want. Then add the following statements at the top to include
the Darcy AI libraries and some additional helpful libraries:

```
import cv2
import os
import pathlib

from darcyai.perceptor.people_perceptor import PeoplePerceptor
from darcyai.input.camera_stream import CameraStream
from darcyai.output.live_feed_stream import LiveFeedStream
from darcyai.pipeline import Pipeline
from darcyai.config import RGB
```

If you don’t have the `darcyai` library installed yet, you can install it with PIP package installer
for Python using the following commands:

```
pip install darcyai
```

If you have multiple versions of Python on your system, you may need to install the `darcyai`
library using the Python3 version of PIP as follows:

```
pip3 install darcyai
```

## 2. Add the [Pipeline, Input Stream, and Output Stream objects](./TERMINOLOGY.md)

This part is quite easy. Just follow the comments to learn more about these 3 important lines of
code.

```
# Instantiate an Camera Stream input stream object
camera = CameraStream(video_device=0, fps=20)

# Instantiate the Pipeline object and pass it the Camera Stream object as its input stream source
pipeline = Pipeline(input_stream=camera)

# Create a Live Feed output stream object and specify some URL parameters
live_feed = LiveFeedStream(path="/", port=3456, host="0.0.0.0")
```

## 3. Set up a [callback](./TERMINOLOGY.md#callback) and add the [Output Stream](./TERMINOLOGY.md#output-stream) to the [Pipeline](./TERMINOLOGY.md#pipeline)

Before we add the LiveFeed Output Stream to the Pipeline, we need to set up a callback function that
we are going to use to process the data before displaying the video. Follow the comments to learn
about the steps that are taken. This is the most complex portion of the whole application and it is
where all of the business logic is taking place. After the callback function definition, there is a
line for adding the LiveFeed Output Stream to the Pipeline. That command needs to have the callback
function already defined before it can execute successfully.

```
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
```

## 4. Define an event Output Stream and an input Output Stream and instantiate the People Perceptor

Just like the LiveFeed Output Stream, the People [Perceptor](./TERMINOLOGY.md#perceptor) must have
the callback already defined before it can work with those callbacks. The input callback simply
takes the [Input Stream](./TERMINOLOGY.md#input-stream) data and sends it onward to the
People [Perceptor](./TERMINOLOGY.md#perceptor). The “New Person” event callback simply prints the
unique person identifier string to the console output when a new person has been detected by Darcy
AI.

```
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
```

## 5. Add the People Perceptor to the Pipeline

```
# Add the People Perceptor instance to the Pipeline and use the input callback from above as the input preparation handler
pipeline.add_perceptor("peeps", people_ai, input_callback=people_input_callback)
```

## 6. Change some configuration items in the People Perceptor

```
# Update the configuration of the People Perceptor to show the pose landmark dots on the annotated video frame
pipeline.set_perceptor_config("peeps", "show_pose_landmark_dots", True)
pipeline.set_perceptor_config("peeps", "pose_landmark_dot_size", 2)
pipeline.set_perceptor_config("peeps", "pose_landmark_dot_color", RGB(0, 255, 0))
```

## 7. Start the Pipeline

```
# Start the Pipeline
pipeline.run()
```

## 8. Check your completed code

Your finished Python file should look similar to this. If it doesn’t, take a minute to figure out
what is missing or incorrect. Save your Python file. Next we will run your code!

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

## 9. Run your application

Using your IDE, run your Python code. Don't set any breakpoints at first because that will prevent
you from seeing the video stream. If you get an error initializing the camera, ensure that your IDE
has permissions to access the camera on your device. If you followed the code reference above
directly and you have all  the required Python libraries installed, your Darcy AI application should
run successfully and stay running until you stop the program execution.

## 10. View your real-time Darcy AI application video output

Once your application is running, you can view the live video feed by visiting the following URL in
any browser. The port number 3456 has been specified in the Python code. Feel free to change it and
use the alternate port in the URL below.

```
http://localhost:3456/
```

### What you should see

You should see a live video feed coming from your camera. When a person is detected in the field of
view, some information should be displayed on the video and some dots should be drawn on top of key
face locations. The dots should move with the person's face. This is a demonstration of using Darcy
AI to detect the presence of people, assign an anonymous stable identifier to persons as they move
around the field of view, and annotate the video frames with text and graphics.

# Now package your Darcy AI application for deployment

Now that your Darcy AI application is working, the next step is to learn how to package it for
deployment to a wide range of devices! Follow the [Packaging Guide](./PACKAGE.md) to learn how to
package your Darcy AI apps
