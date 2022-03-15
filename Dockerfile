FROM ruby:2.5.8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /star-wars-api
WORKDIR /star-wars-api
ADD Gemfile /star-wars-api/Gemfile
ADD Gemfile.lock /star-wars-api/Gemfile.lock
RUN bundle install
ADD . /star-wars-api