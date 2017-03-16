FROM debian:jessie
MAINTAINER Ralph-Gordon Paul <g.paul@appcom-interactive.de>

# install nodejs and yarn
RUN apt-get update \
  && apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_7.x | /bin/bash - \
  && apt-get update \
  && apt-get install -y nodejs \
  # some packages may require the developer build tools
  && apt-get install -y build-essential \
  && apt-get purge -y --auto-remove curl \
  && rm -rf /var/lib/apt/lists/*

# port 3000 for http and 3001 for https
EXPOSE 3000 3001

# copy and set entrypoint
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# 'npm start' is the default command
CMD ["npm", "start"]
