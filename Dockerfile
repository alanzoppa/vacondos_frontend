FROM ruby:2.3
RUN apt-get update -qq && apt-get install -y build-essential patch libpq-dev nodejs npm gcc libxml2 libxml2-dev libxslt libxslt-dev
RUN mkdir /vacondos_frontend
RUN ln -s /usr/bin/nodejs /usr/bin/node
WORKDIR /vacondos_frontend
ADD Gemfile /vacondos_frontend/Gemfile
ADD Gemfile.lock /vacondos_frontend/Gemfile.lock
ADD package.json /vacondos_frontend/package.json
RUN npm install
RUN bundle install --without test development
ADD . /vacondos_frontend
RUN rake assets:precompile --trace
ENV SECRET_KEY_BASE=faafa6e1f2d6c5cd672c4c3657ba68f5e0362cb199e360225b570bb5f554e8a427cbed9c0387b1ffc9735338c18cbd494b58795ec0c4764e805d2e45f325be17
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=1

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

