# Example Dockerfile for building a Darcy AI Application

FROM edgeworx/darcy-ai-sdk-base:1.0.0

COPY requirements.txt /src/
RUN python3 -m pip install -r /src/requirements.txt

COPY ssd_mobilenet_v2_coco_quant_postprocess_edgetpu.tflite /src/
COPY coco_labels.txt /src/
COPY static/ /src/static/
COPY demo.py /src/

ENTRYPOINT ["/bin/bash", "-c", "cd /src/ && python3 ./demo.py"]

