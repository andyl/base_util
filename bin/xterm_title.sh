#!/usr/bin/env sh

# Sets the xterm-title

USAGE="Usage: $0 <title> - sets the xterm title\n To test: $0 Hello World; sleep 2" 

if [ $# -eq 0 ]
then
  echo $USAGE
  exit 1
fi

if [ "$TERM" == "xterm" ]
then
  echo "\e]0;$@\a" 
fi
  
