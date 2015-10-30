#!/bin/sh
CONTAINERS="$(docker ps -a -q -f 'status=exited' | grep -v data)"
if [ ! -z "${CONTAINERS}" ]; then
  exec docer rm ${CONTAINERS}
fi
