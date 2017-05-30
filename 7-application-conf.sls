sampleapp wordpress config:
    file.managed:
        - name: {{ salt['pillar.get']('sampleapp:documentroot') }}/{{ salt['pillar.get']('sampleapp:name') }}/wp-config.php
        - source: salt://templates/wp-config.php.tpl
        - user: www-data
        - group: www-data
        - mode: 600
        - template: jinja
