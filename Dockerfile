FROM ruby:3.1

RUN apt-get update -qq \
  && apt-get install -y curl gnupg1 \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn supervisor \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV development

COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /myapp

ENTRYPOINT /myapp/entrypoint.sh
