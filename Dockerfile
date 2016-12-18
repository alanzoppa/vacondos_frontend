FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm
RUN mkdir /vacondos_frontend
WORKDIR /vacondos_frontend
ADD Gemfile /vacondos_frontend/Gemfile
ADD Gemfile.lock /vacondos_frontend/Gemfile.lock
ADD package.json /vacondos_frontend/package.json
RUN npm install
RUN bundle install
ADD . /vacondos_frontend

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

