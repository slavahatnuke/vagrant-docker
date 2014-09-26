#!/bin/sh

docker run --rm -it --name project -v $(pwd):/project project /bin/bash