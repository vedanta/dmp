# init for dbstack
#

dbstack init:
    service.running:
        - name: mysql
        - enable: true
