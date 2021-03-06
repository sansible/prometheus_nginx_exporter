#!/bin/bash
#
# Script to enable the creation of log files with the correct ownership.
#
DAEMON=""
DAEMON_ARGS=""
LOG=""

usage() { echo "Usage: $0 -c <command> [ -a \"<command_arguments>\" ] -l <log_file>" 1>&2; exit 1; }


while getopts ":c:a:l:" opt; do
  case $opt in
    c)
       DAEMON=$OPTARG
       ;;
    a)
       DAEMON_ARGS=$OPTARG
       ;;
    l)
       LOG=$OPTARG
       ;;
    \?)
       echo "Invalid option: -$OPTARG" >&2
       exit 1
       ;;
    :)
       echo "Option -$OPTARG requires an argument." >&2
       exit 1
       ;;
    *) 
       usage
       ;;
  esac
done
if [ ! -z "$DAEMON" ] && [ ! -z "$LOG" ]; then
  exec "$DAEMON" "$DAEMON_ARGS" >"$LOG" 2>&1
else
  usage 
fi
exit $?
