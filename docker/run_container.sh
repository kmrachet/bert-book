docker container run -dit -p 8999:8888 --rm --name bert-book --mount type=bind,source=$(pwd)/../,target=/workspace/bert-book kimura/pytorch:bert-book
