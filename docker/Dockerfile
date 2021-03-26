FROM ruby:3-alpine

WORKDIR /app

ENV RAILS_ENV staging

RUN apk add --update --no-cache \
  postgresql-dev \
  build-base \
  dumb-init \
  tzdata

RUN gem install bundler

COPY ./Gemfile* ./

RUN bundle install

COPY . .

EXPOSE 3000

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["ruby", "docker/entrypoint.rb"]
