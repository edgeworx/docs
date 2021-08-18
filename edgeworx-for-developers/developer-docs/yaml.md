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

## apiVersion

## metadata

## spec
