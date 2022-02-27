FROM jruby

RUN mkdir /app
WORKDIR /app
ADD . /app
RUN gem install bundler && bundle install --jobs 20
