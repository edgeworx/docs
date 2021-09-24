# AI SDK Docs



The Darcy AI SDK is a Python library that you can use to build your own Darcy AI applications.

The SDK is open source and you can find the code here [https://github.com/Edgeworx/darcyai](https://github.com/Edgeworx/darcyai).

The library is also hosted on PyPI for easy installation [https://pypi.org/project/darcyai/](https://pypi.org/project/darcyai/).

## Importing the SDK library

You can import the Darcy AI SDK into your Python script just like other common libraries as follows.

```text
from darcyai import DarcyAI
```

Now the SDK will be available as an object called `DarcyAI` in your script.

You will also need to import the `threading` library in order to operate your Darcy AI application because you will run Darcy on her own thread.

```text
import threading
```

## Initializing the library

At the bottom of your Python script, add the code to launch Darcy as her own thread from the main thread.

You will create an instance of the DarcyAI object and include initialization parameters. The required parameters are shown in the smallest code snippet immediately below. For your Darcy AI application to operate, the SDK will need to know where to find your video camera device and which functions to use as callbacks for the streaming AI and video operations.

```text
if __name__ == "__main__":
    ai = DarcyAI(
        data_processor=my_data_analyze,
        frame_processor=my_frame_handler,
        video_device="/dev/video0")
    threading.Thread(target=ai.Start).start()
```

In the example above, the `video_device` parameter is set to `/dev/video0` which is the default location of Darcy's visual camera. You should not need to change this unless you are working with a different hardware embodiment of Darcy.

The `data_processor` parameter is set to `my_data_analyze` which is the name of a custom function that is defined in the same Python application. You can name this function anything you like, provided that it complies with Python function naming requirements. Your custom function will be called every time that Darcy has performed processing on a person or object and has some results to convey to you. The details of how to define and work with the `data_processor` callback can be found below.

The `frame_processor` parameter is set to `my_frame_handler`. This is the name of a custom function, similar to the `my_data_analyze` function. This function will be called for every frame of video that Darcy processes. The details of how to define and work with the `frame_processor` callback can be found below.

## List of initialization parameters

### data\_processor

Required. No default.

### frame\_processor

Required. No default.

### do\_perception

Optional. Default is True

### use\_pi\_camera

Optional. Default is True

### video\_device

Required. No Default.

### detect\_perception\_model

Optional. Default is None

### detect\_perception\_threshold

Optional. Default is None

### detect\_perception\_labels\_file

Optional. Default is None

### classify\_perception\_model

Optional. Default is None

### classify\_perception\_mean

Optional. Default is None

### classify\_perception\_std

Optional. Default is None

### classify\_perception\_top\_k

Optional. Default is None

### classify\_perception\_threshold

Optional. Default is None

### classify\_perception\_labels\_file

Optional. Default is None

### flask\_app

Optional. Default is None

### video\_file

Optional. Default is None

### video\_width

Optional. Default is 640

### video\_height

Optional. Default is 480

### config

Optional. Default is DarcyAIConfig\(\)

### arch

Optional. Default is os.uname\(\).machine

## The frame\_processor callback

```text
def frame_processor(frame_number, frame, detected_objects):
    frame_clone = frame.copy()
    for object in detected_objects:
        frame_clone = draw_object_rectangle_on_frame(frame_clone, object)

    return frame_clone
```

## The data\_processor callback

```text
def analyze(frame_number, objects):
    return
    for object in objects:
        if object.body["has_face"]:
            print("{}: {}".format(object.object_id, object.body["face_position"]))
        else:
            print("{}: No face".format(object.object_id))
```

