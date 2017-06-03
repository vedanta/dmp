# sample docker image deployment
#
sampleapp-101:
    dockerng.running:
        - image: vedanta/dmp-single:latest
        - detach: true
        - start: true
        - hostname: sampleapp101
        - port_bindings: 80:80
        - environment:
            - VIRTUAL_HOST: sampleapp01.auraengine.io
