---
title: "Extend Darcy AI for your use case"
linkTitle: "Extend Darcy AI"
weight: 300
---

![Darcy CLoud Project Page](/images/guides/extend-hero.jpg)

Darcy AI can be extended to leverage different input data sources, use custom AI models, and output data anywhere you want.

To add new input data sources, you can use Input Stream code files from any existing source or you can create your own. As an example, you can add an Input Stream to your application that adds audio, thermal vision, LiDAR, or something more simple like data from a GPS receiver that is updated every 10 seconds.

To add new AI models, you can use existing Perceptors provided by others or you can create your own. Perceptors are the AI processing units in Darcy AI. You can include any AI model in a Perceptor file and it will become available to use in your Darcy AI pipeline in your application. As an example, you can add a Perceptor that identifies cars and finds their license plates and then another Perceptor that performs optical character recognition on the license plates that have been identified.

To change how Darcy AI outputs data, you can use Output Stream code files from any existing source or you can create your own. As an example, you can add an Output Stream to your application that stores data in an AWS S3 bucket or an Output Stream that turns the fully annotated content into an RTSP network video feed.

## Get an overview of how Darcy AI works

- [Darcy AI Overview](/docs/ai/)

## Explore and customize the example code

- Process other types of data: [Example Input Stream](https://github.com/darcyai/darcyai/blob/main/src/examples/sample_input_stream.py)

- Use your own AI model: [Example Perceptor](https://github.com/darcyai/darcyai/blob/main/src/examples/perceptors/basic_perceptor/perceptor.py)

- Output the data where you want: [Example Output Stream](https://github.com/darcyai/darcyai/blob/main/src/examples/output_streams/s3_output_stream.py)

- See more example code [All Darcy AI Example Code](https://github.com/darcyai/darcyai/tree/main/src/examples)