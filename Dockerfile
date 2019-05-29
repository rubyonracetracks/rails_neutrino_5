# NOTE: This Dockerfile is intended for the continuous integration environment.

FROM registry.gitlab.com/rubyonracetracks/docker-debian-buster-rvm-rails-general
MAINTAINER Ruby on Racetracks

RUN mkdir -p /home/winner/application

# Copy application code
COPY . /home/winner/application

# Change to the application's directory
WORKDIR /home/winner/application

RUN /home/winner/application/gitlab-ci-docker
