#!/bin/bash

docker container run \
  -dit \
  --rm \
  --gpus all \
  --name bert-book \
  --mount type=bind,source=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/../,target=/workspace/bert-book \
  kimura/pytorch:bert-book
