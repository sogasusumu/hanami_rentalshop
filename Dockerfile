FROM ruby:2.6.2-alpine3.9

ARG APP_ROOT=/home/app_root
WORKDIR $APP_ROOT

RUN apk update && \
    apk add \
      build-base \
      curl-dev \
      libxml2-dev \
      libxslt-dev \
      linux-headers \
      mysql-dev \
      nodejs \
      ruby-dev \
      tzdata \
      yaml \
      yaml-dev \
      mysql-client \
      mysql

COPY . $APP_ROOT

RUN gem install bundler && \
    bundle install
