[//]: # (Tab content for build.md)

1. Install Python 3.6.9 or greater by [downloading](https://www.python.org/downloads/) or
installing via your favorite package manager, e.g.

      ```shell
      brew install python
      ```

      {{<info>}}
        If you have older Python versions on your computer, you may need to use `python3` and `pip3` commands.
        You can change the [default behavior](https://osxdaily.com/2022/02/15/make-python-3-default-macos/).
      {{</info>}}

2. Install Python dependencies

    ```shell
    # Install OpenCV
    pip install opencv-python>=4.5.5.64

    # Install the Pillow library
    pip install Pillow>=8.3.2

    # Install the Numpy library
    pip install numpy>=1.22.4

    # Install the Imutils library
    pip install imutils>=0.5.4

    # Install the DarcyAI Engine
    pip install darcyai

    # Install TensorFlow
    pip install tensorflow
    ```
