#!/bin/bash

sam local start-lambda \
  --region ap-northeast-1 \
  --docker-volume-basedir "${VOLUME}/lambda" \
  --host 0.0.0.0 \
  --template template.yml
