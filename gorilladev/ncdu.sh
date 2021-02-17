#!/bin/bash

# ncdu needs to run as root.
# otherwise it will not show /var stats
# -X excluded paths

 sudo ncdu -x / -X /home

