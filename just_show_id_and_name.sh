#!/bin/bash

docker image ls --format "{{.ID}}: {{.Repository}}"
