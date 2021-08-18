# Example YAML file for deploying a Darcy AI application

When you deploy edge applications using iofogctl, you use a YAML file to tell it what to deploy and where to deploy it. A YAML file is just a text file with the proper formatting. It is similar to a JSON file, a CSV file, or an XML file. A sample YAML file is below for you to copy and edit. A walkthrough of all the sections is available below the code, including notes about what parts you will need to modify to deploy your own application.

```
kind: Application
apiVersion: iofog.org/v2
metadata:
  name: your-application-name
spec:
  microservices:
    - name: your-microservice-name
      agent:
        name: your-darcy-cam-name
      images:
        arm: yourname/darcy-ai-app:1.0.0
        x86: yourname/darcy-ai-app:1.0.0
      container:
        rootHostAccess: true
        ports:
          - external: 3456
            internal: 3456
            protocol: tcp
        volumes:
          - hostDestination: "/dev"
            containerDestination: "/dev"
            accessMode: "rw"
```

## kind

The `kind` specification tells iofogctl what type of thing you want to deploy. In our case it is an application, so we use the keyword `Application` for the value.

## apiVersion

The `apiVersion` specification tells iofogctl which version of the Eclipse ioFog API to use when performing the deployment. Your version of iofogtcl should match the value of `apiVersion`. You should not need to change the value, so go ahead and use `iofog.org/v2` like the example.

## metadata

The `metadata` section allows you to define information about the thing you are deploying. In your case, since you are deploying an application, you can use the key `name` to define a value for the name of your application.

Replace the value `your-application-name` with any name you like. You can only use lowercase letters and dashes.

## spec

The `spec` section contains a lot of information. This is where the specification of the application is defined. Every application is made of one or more microservices. The list of microservices is found here under the `spec` using the `microservices` keyword. The `-` denotes the beginning of a microservice listing.

### name

Each microservice must have a unique name. Replace the value `your-microservice-name` with any name you like.

### agent

The `agent` specifies which Darcy cam to deploy the application into. You will need to replace `your-darcy-cam-name` with the actual name of your Darcy cam as it appears in your ECN information.

### images

The `images` section contains two sub-specifications. One is `x86` and the other is `arm`. Each of these defines which Docker container image you would like to use for this microservice. The `x86` is for Darcy cams or edge nodes that use Intel x86 or compatible CPU processors. The `arm` is for Darcy cams or edge nodes that use ARM CPUs. Unless you are explicitly told otherwise, your Darcy cam uses an ARM CPU processor. You can safely use the same value for both `arm` and `x86` in your YAML file.

Replace the example `yourname/darcy-ai-app:1.0.0` with your actual Docker container image identifier string.

### container

The `container` section allows you to specify details about how to run the Docker container that is found in the `images` section. In the example above, the `rootHostAccess` setting is `true` because your Darcy AI applications need to be able to access resources on the root host. You should leave this value set to `true`.

The `ports` sub-specification allows you to set up network ports that open connections into the microservice and therefore opens ports to your Darcy AI application. In the example above, port `3456` is opened. That's the port you can use to view the video stream web UI. You should leave the port information the way it is shown in the example.

The `volumes` sub-specification allows you to connect folders \(also called directories\) on the root host operating system into the microservice. Usually you should do this to either provide access to a particular system resource, such as a microphone or a camera, or to provide access to a data storage location, such as a folder for saving images. In the example above, the `/dev` directory is connected into the microservice with read and write privileges, designated by `rw`. You should leave the volume information the way it is shown in the example.
