FROM quay.io/loyalty_nz/service_base_ruby:2.4.2

# Install figlet
RUN apt-get update && apt-get install -y --no-install-recommends figlet

# Install 'entr'
RUN cd /tmp && \
  wget http://entrproject.org/code/entr-4.0.tar.gz && \
  gunzip entr-4.0.tar.gz && \
  tar xf entr-4.0.tar && \
  cd eradman-entr-d5110481f5b9 && \
  ./configure && \
  make test && \
  make install && \
  rm -rf /tmp/*

ADD . /www

CMD bundle exec rackup -s alchemy
# Or for rails:
# CMD bundle exec rails server -b 0.0.0.0