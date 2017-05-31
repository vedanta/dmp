# sample docker image deployment
#
proxy:
    dockerng.running:
        - image: jwilder/nginx-proxy
        - detach: true
        - start: true
        - hostname: sampleapp.io
        - ports: 80
        - binds: /var/run/docker.sock:/tmp/docker.sock:ro
        - port_bindings: 80:80

sampleapp-101:
    dockerng.running:
        - image: vedanta/dmp-single:latest
        - detach: true
        - start: true
        - hostname: sampleapp101
        - environment:
            - VIRTUAL_HOST: tss101.sampleapp.io
