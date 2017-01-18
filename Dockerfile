FROM docker-registry-default.nine.ch/ninech/ruby:xenial

# Install some commonly used gems to make builds quicker
RUN gem install --no-ri --no-rdoc nokogiri -v 1.6.8.1
RUN gem install --no-ri --no-rdoc pg -v 0.19.0
RUN gem install --no-ri --no-rdoc spring -v 2.0.0
RUN gem install --no-ri --no-rdoc rails -v 5.0.0.1
RUN gem install --no-ri --no-rdoc ffi -v 1.9.17

RUN apt-get update \
    && apt-get install -y pwgen postgresql-client \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY build.sh /tmp/

CMD ["/tmp/build.sh"]
