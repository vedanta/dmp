# this is the first file that executes when called from a highstate
#
base:
    '*':
        - 1-common
        - 2-dbstack
        - 3-webstack
        - 4-dbstack-conf
        - 5-webstack-conf

