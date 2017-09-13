#!/bin/bash

docker rm `docker ps -a |awk '{print $1}' | grep [0-9a-z]`
