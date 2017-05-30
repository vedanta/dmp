# source and untar sample app 
# sampleapp = wordpress

source sampleapp:
    file.managed:
        - name: /tmp/{{ salt['pillar.get']('sampleapp:archivename') }}
        - source: {{ salt['pillar.get']('sampleapp:archivesource') }}
        - skip_verify: true

source unpack:
    archive.extracted:
        - name: {{ salt['pillar.get']('sampleapp:documentroot') }}/{{ salt['pillar.get']('sampleapp:name') }}
        - source:  /tmp/{{ salt['pillar.get']('sampleapp:archivename') }}
        - user: www-data
        - group: www-data
        - archive_format: tar
        - tar_options: --strip=1 --show-transformed-names -v
        - if_missing: {{ salt['pillar.get']('sampleapp:documentroot') }}/{{ salt['pillar.get']('sampleapp:name') }}
        - failhard: true
