FROM ubuntu:16.10
RUN apt-get update && apt-get -y install software-properties-common
RUN add-apt-repository ppa:brightbox/ruby-ng && add-apt-repository -y -r ppa:chris-lea/node.js
RUN apt-get update -q && apt-get install -y build-essential patch libpq-dev nodejs libruby2.3 ruby2.3 ruby2.3-dev libyaml-dev bundler npm pkgconf libxslt1-dev libxml2-dev libev-dev libxslt-dev
RUN gem install nokogiri -v '1.6.8.1' -- --use-system-libraries
RUN gem install ffi -v '1.9.14' -- --use-system-libraries
RUN gem install nio4r -v '1.2.1' -- --use-system-libraries
RUN gem install json -v '2.0.2' -- --use-system-libraries
RUN gem install pg -v '0.19.0' -- --use-system-libraries
RUN gem install websocket-driver -v '0.6.4' -- --use-system-libraries
RUN mkdir /vacondos_frontend
RUN ln -s /usr/bin/nodejs /usr/bin/node
WORKDIR /vacondos_frontend
ADD Gemfile /vacondos_frontend/Gemfile
ADD Gemfile.lock /vacondos_frontend/Gemfile.lock
ADD package.json /vacondos_frontend/package.json
RUN npm -d install
RUN bundle install --without test development
ADD . /vacondos_frontend
RUN rake assets:precompile --trace
ENV SECRET_KEY_BASE=faafa6e1f2d6c5cd672c4c3657ba68f5e0362cb199e360225b570bb5f554e8a427cbed9c0387b1ffc9735338c18cbd494b58795ec0c4764e805d2e45f325be17
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=1

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
