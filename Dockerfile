FROM ruby:2.5.0
MAINTAINER a.knyazev@evotor.ru

RUN apt-get update

RUN apt-get install -y \
    nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists

WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN gem install jekyll bundler && bundle install

WORKDIR /opt/src
ENTRYPOINT ["/usr/local/bin/bundle", "exec", "jekyll", "build"]
