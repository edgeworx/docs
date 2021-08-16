# Darcy AI SDK documentation

The Darcy AI SDK is a Python library that you can use to build your own Darcy AI applications.

The SDK is open source and you can find the code here [https://github.com/Edgeworx/darcyai](https://github.com/Edgeworx/darcyai).

The library is also hosted on PyPI for easy installation [https://pypi.org/project/darcyai/](https://pypi.org/project/darcyai/).

## Importing the SDK library

You can import the Darcy AI SDK into your Python script just like other common libraries as follows.

```
from darcyai import DarcyAI
```

Now the SDK will be available as an object called `DarcyAI` in your script.

You will also need to import the `threading` library in order to operate your Darcy AI application because you will run Darcy on her own thread.

```
import threading
```

## Initializing the library

At the bottom of your Python script, add the code to launch Darcy as her own thread from the main thread.

You will create an instance of the DarcyAI object and include initialization parameters. The required parameters are shown in the smallest code snippet immediately below. For your Darcy AI application to operate, the SDK will need to know where to find your video camera device and which functions to use as callbacks for the streaming AI and video operations.

```
if __name__ == "__main__":
    ai = DarcyAI(
        data_processor=analyze,
        frame_processor=frame_processor,
        video_device="/dev/video0")
    threading.Thread(target=ai.Start).start()
```



## The frame_processor callback

```
def frame_processor(frame_number, frame, detected_objects):
    frame_clone = frame.copy()
    for object in detected_objects:
        frame_clone = draw_object_rectangle_on_frame(frame_clone, object)

    return frame_clone
```

## The data_processor callback

```
def analyze(frame_number, objects):
    return
    for object in objects:
        if object.body["has_face"]:
            print("{}: {}".format(object.object_id, object.body["face_position"]))
        else:
            print("{}: No face".format(object.object_id))
```
