---
title: "Extend Darcy AI for your use case"
linkTitle: "Extend Darcy AI"
weight: 300
---

![Darcy CLoud Project Page](/images/guides/extend-hero.jpg)

Darcy AI can be extended to leverage different input data sources, use custom [AI models](../more/terminology.md#ai-model), and output data anywhere you want.

## To add new input data sources

You can use [input stream](../more/terminology.md/#input-stream) code files from any existing source or you can create your own. As an example, you can add an input stream to your [application](../more/terminology.md#application) that adds audio, thermal vision, LiDAR, or something more simple like data from a GPS receiver that is updated every 10 seconds.

[Example input stream](https://github.com/darcyai/darcyai/blob/main/src/examples/sample_input_stream.py)

## To add new AI models

You can use existing [Perceptors](docs/more/terminology.md/#Perceptor)  provided by others or you can create your own. Perceptors are the AI processing units in Darcy AI. You can include any [AI model](../more/terminology.md/#ai-model) in a Perceptor file and it will become available to use in your Darcy AI [pipeline](../more/terminology.md/#pipeline) in your [application](docs/more/terminology.md/#app) . As an example, you can add a Perceptor that identifies cars and finds their license plates and then another Perceptor that performs optical character recognition on the license plates that have been identified.

[Example Perceptor](https://github.com/darcyai/darcyai/blob/main/src/examples/Perceptors/basic_Perceptor/Perceptor.py)

## To change how Darcy AI outputs data

You can use [output stream](../more/terminology.md/#output-stream) code files from any existing source or you can create your own. As an example, you can add an output stream to your application that stores data in an AWS S3 bucket or an output stream that turns the fully annotated content into an RTSP network video feed.

[Example output stream](https://github.com/darcyai/darcyai/blob/main/src/examples/output_streams/s3_output_stream.py)

## More Information and example code

- [Darcy AI Overview](/docs/ai/)
- [All Darcy AI Example Code](https://github.com/darcyai/darcyai/tree/main/src/examples)
