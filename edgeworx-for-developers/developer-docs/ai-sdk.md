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

```
if __name__ == "__main__":
    ai = DarcyAI(
        data_processor=analyze,
        frame_processor=frame_processor,
        video_device="/dev/video0")
    threading.Thread(target=ai.Start).start()
```

## The frame_processor callback

## The data_processor callback
