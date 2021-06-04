FROM ruby:2.5-slim

LABEL Name=rubydistrict8 Version=0.0.1

EXPOSE 3000

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app
COPY . /app

ENV BUNDLER_VERSION=2.2.19

COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["ruby", "rubydistrict8.rb"]
