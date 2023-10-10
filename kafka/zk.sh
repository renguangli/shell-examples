#!/bin/sh
NODES="node01 node02 node03"
SSH_PORT=22
ZK_HOME=/opt/zookeeper

# /bin/bash -l 会自动读取 profile、.bashrc、.bash_profile
function start() {
   for node in $NODES ; do
     echo "starting $node zookeeper server..."
     ssh -p $SSH_PORT $node "/bin/bash -l $ZK_HOME/bin/zkServer.sh start"
   done
}

function stop() {
   for node in $NODES ; do
     echo "stopping $node zookeeper server..."
     ssh -p $SSH_PORT $node "/bin/bash -l $ZK_HOME/bin/zkServer.sh stop"
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
