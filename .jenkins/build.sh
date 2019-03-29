#!/bin/bash

cd freefem-docker-compilation \
	&& chmod +x ./build.sh \
	&& ./build.sh \
	&& cd ../freefem-docker \
	&& chmod +x ./build.sh \
	&& ./build.sh