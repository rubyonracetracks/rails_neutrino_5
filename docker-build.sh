#!/bin/bash

# NOTE: This script is used ONLY in the continuous integration environment
# and is NOT intended for the development environment on your local machine.

apt-get update
apt-get install -y nodejs curl tree sudo postgresql graphviz
gem install rake
gem install rails
RUN rm -rf /var/lib/apt/lists/*
