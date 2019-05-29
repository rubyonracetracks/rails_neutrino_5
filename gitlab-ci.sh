#!/bin/bash
set -e

# NOTE: This script is intended for the continuous integration environment.

docker build . -t container-debian-buster-rvm-rails-general
