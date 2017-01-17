FROM docker-registry-default.nine.ch/ninech/ruby:xenial

COPY build.sh /tmp/

CMD ["/tmp/build.sh"]
