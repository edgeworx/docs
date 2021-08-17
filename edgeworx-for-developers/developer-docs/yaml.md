# Example YAML file for deploying a Darcy AI application

more here...

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
