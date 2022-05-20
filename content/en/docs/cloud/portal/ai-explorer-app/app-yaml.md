---
title: "App YAML: Darcy AI Explorer"
---

```yaml
kind: Application
apiVersion: iofog.org/v3
metadata:
  name: darcy-ai-explorer
spec:
  microservices:
    - name: darcy-ai-explorer
      agent:
        name: ''
      images:
        arm: 'darcyai/darcy-ai-explorer:1.0.0'
        x86: 'darcyai/darcy-ai-explorer:1.0.0'
      container:
        rootHostAccess: true
        env:
          - key: PORT
            value: '5555'
        ports:
          - external: '{{self.microservices[0].env[0].value | toNumber}}'
            internal: '{{self.microservices[0].env[0].value | toNumber}}'
        volumes:
          - containerDestination: /dev
            hostDestination: /dev
            type: bind
            accessMode: rw
```
