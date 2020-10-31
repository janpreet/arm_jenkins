#!/bin/bash

ps -p 1 -o command | grep jenkins > /dev/null

if [ $? -eq 0 ]
then
  echo "Jenkins is up and running."
else
  echo "Test has failed."
fi
