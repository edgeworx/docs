# Example Dockerfile for building a Darcy AI application

FROM edgeworx/darcy-ai-sdk-base:1.0.0

COPY requirements.txt /src/ RUN python3 -m pip install -r /src/requirements.txt

COPY ssd\_mobilenet\_v2\_coco\_quant\_postprocess\_edgetpu.tflite /src/ COPY coco\_labels.txt /src/ COPY static/ /src/static/ COPY demo.py /src/

ENTRYPOINT \["/bin/bash", "-c", "cd /src/ && python3 ./demo.py"\]

