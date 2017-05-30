# this is the first file that executes when called from a highstate
#
base:
    '*':
        - 1-common
        - 2-dbstack
        - 3-webstack
        - 4-dbstack-conf
        - 5-webstack-conf
        - 6-application-source-download
        - 7-application-conf
        - 8-dbstack-service-init
        - 9-webstack-service-init

