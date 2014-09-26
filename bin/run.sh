#!/bin/sh

sudo docker run --rm -it --name project -v $(pwd):/project project /bin/bash