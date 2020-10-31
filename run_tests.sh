#!/bin/bash

success=200
test=`curl -sL -w "%{http_code}" "localhost:8081" -o /dev/null`

if [ $test == $success ]
then
  echo "Jenkins is up and running."
else
  echo "Test failed."
fi
