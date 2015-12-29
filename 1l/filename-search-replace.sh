#!/bin/bash
PATH=/bin:/usr/bin find . -depth -name '*search*' -execdir bash -c 'mv "$1" "${1//search/replace}"' _ {} \;
