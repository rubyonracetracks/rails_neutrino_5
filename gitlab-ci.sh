#!/bin/bash
set -e

# NOTE: This script is inteded for the continuous integration environment.

docker build . -t container-debian-buster-rbenv-rails-general
