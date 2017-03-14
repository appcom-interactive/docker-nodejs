FROM debian:jessie
MAINTAINER Ralph-Gordon Paul <g.paul@appcom-interactive.de>

# install nodejs and yarn
RUN apt-get update \
  && apt-get install -y curl \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \ 
  && echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && curl -sL https://deb.nodesource.com/setup_6.x | /bin/bash - \
  && apt-get update \
  && apt-get install -y nodejs \
  && apt-get install -y yarn \
  # some packages may require the build tools
  && apt-get install -y build-essential \
  && apt-get purge -y --auto-remove curl \
  && rm -rf /var/lib/apt/lists/*

# port 3000 for http and 3001 for https
EXPOSE 3000 3001

# copy and set entrypoint
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
