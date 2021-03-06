FROM ruby:2.6.3-alpine

ENV APP_ROOT=/memach
ENV BUNDLE_PATH=${APP_ROOT}/vendor/bundle

RUN apk add --update --no-cache build-base ruby-dev postgresql-dev

WORKDIR ${APP_ROOT}

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install --path $BUNDLE_PATH --jobs 4

COPY . .

CMD ["bundle", "exec", "bin/bot"]
