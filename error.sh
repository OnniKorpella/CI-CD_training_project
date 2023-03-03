#!/bin/bash

if [[ -s log ]]
  then
    cat log && rm log
    exit 1
  else
    echo "Passed"
    exit 0
fi
