ARG APP_NAME=valofinder
ARG RUBY_IMAGE=ruby:3.1.2
ARG BUNDLER_VERSION=2.3.7

FROM $RUBY_IMAGE
ARG APP_NAME
ARG RUBY_VERSION
ARG NODE_VERSION
ARG BUNDLER_VERSION

ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo
ENV RAILS_ENV production
ENV BUNDLE_DEPLOYMENT true
ENV BUNDLE_WITHOUT development:test
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

RUN mkdir /$APP_NAME
WORKDIR /$APP_NAME

RUN apt-get update -qq && apt-get install -y build-essential

RUN gem install bundler:$BUNDLER_VERSION

COPY Gemfile /$APP_NAME/Gemfile
COPY Gemfile.lock /$APP_NAME/Gemfile.lock

RUN bundle install

COPY . /$APP_NAME/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000