#!/bin/sh
IMAGES="$(docker images -q --filter "dangling=true")"
if [ ! -z "${IMAGES}" ]; then
  exec docker rmi ${IMAGES}
fi
