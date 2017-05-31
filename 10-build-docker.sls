{{ salt['pillar.get']('docker:reponame') }}/dmp:{{ salt['pillar.get']('docker:tag') }}:
    dockerng.build:
        - dockerfile: salt://dmp-single.dockerfile
        - build: {{ slspath }}
        - insecure_registry: true
