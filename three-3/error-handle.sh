#!/bin/bash

create_directory(){
	mkdir demo
}

if ! create_directory; then
	echo "This code is being exited as the directory already exists!"
	exit 1
fi

echo "This should not work!"

