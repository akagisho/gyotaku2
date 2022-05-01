#!/bin/sh

bundle install --path vendor/bundle \
  && bundle exec rails webpacker:install \
  && bundle exec rake db:migrate \
  && rm -f /myapp/tmp/pids/server.pid \
  && /usr/bin/supervisord
