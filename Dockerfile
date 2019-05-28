# NOTE: This Dockerfile is used ONLY in the continuous integration environment
# and is NOT intended for the development environment on your local machine.

FROM ruby:latest

RUN sh docker-build.sh
