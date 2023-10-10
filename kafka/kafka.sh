#!/bin/sh
NODES="node01 node02 node03"
SSH_PORT=22
KAFKA_HOME=/opt/kafka

# /bin/bash -l 会自动读取 profile、.bashrc、.bash_profile
function start() {
   for node in $NODES ; do
     echo "starting $node kafka server..."
     ssh -p $SSH_PORT $node "/bin/bash -l $KAFKA_HOME/bin/kafka-server-start.sh -daemon $KAFKA_HOME/config/server.properties"
   done
}

function stop() {
   for node in $NODES ; do
     echo "stopping $node kafka server..."
     ssh -p $SSH_PORT $node "/bin/bash -l $KAFKA_HOME/bin/kafka-server-stop.sh"
   done
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  *)
    basename=`basename "$0"`
    echo "Usage: $basename {start|stop}"
    exit 1
    ;;
esac
