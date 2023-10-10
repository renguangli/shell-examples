#!/bin/sh
NODES="node01 node02 node03"
SSH_PORT=22

for node in $NODES ; do
  echo "scp $1 to $node ..."
  scp -p $SSH_PORT -r $1 $node
done
