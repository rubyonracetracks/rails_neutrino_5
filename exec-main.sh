#!/bin/bash
set -e

APP_NAME=$1
TOGGLE_OUTLINE=$2

docker run -i -t --rm -v ${PWD}:/home/winner/neutrino rubyonracetracks/rails_neutrino_5 /home/winner/neutrino/build-rails $APP_NAME $TOGGLE_OUTLINE
