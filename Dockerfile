FROM ruby:2.6.5
RUN gem install bundler

RUN apt-get update && \
  apt-get install -y nodejs npm

RUN npm install --global yarn

WORKDIR /app

COPY ./Gemfile ./Gemfile
COPY ./Gemfile.lock ./Gemfile.lock

RUN cd /app \ 
  && bundle install --jobs 10 --retry 5

RUN rails webpacker:install
RUN rails webpacker:compile
RUN rails db:seed

COPY ./start.sh /usr/local/bin/start.sh

CMD ["start.sh"]

