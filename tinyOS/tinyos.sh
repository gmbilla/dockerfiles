#!/bin/sh

if [[ $# < 1 ]]; then
	echo "USAGE $0 /path/to/project_folder"
	exit 1
fi

echo "Mounting $1 to /code"
echo "Run \"make tmote sim\" to build the app for Tossim simulator"
docker run --privileged --rm -it --name tinyos_simple -v $1:/code gmbilla/tinyos /bin/bash
