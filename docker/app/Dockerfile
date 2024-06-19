FROM ruby:3.1-slim

# Register Yarn package source.
RUN apt-get update && \
    apt-get install build-essential -y --no-install-recommends \
    nano \
    vim \
    git \
    gnupg2 \
    curl \
    wget \
    nodejs \
    patch \
    ruby-dev \
    zlib1g-dev \
    liblzma-dev \
    libpq-dev

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install additional packages.
RUN apt-get update
RUN apt install -y postgresql-client yarn

# Prepare working directory.
WORKDIR /app

ARG BUNDLER_VERSION=2.1.4
COPY Gemfile Gemfile.lock ./



RUN gem install bundler:${BUNDLER_VERSION}

RUN bundle install

COPY . /app

# Configure endpoint.

COPY ./docker/app/entrypoint.sh /usr/bin/
ENTRYPOINT ["entrypoint.sh"]
RUN chmod +x /usr/bin/entrypoint.sh
COPY ./docker/app/command.sh /scripts/
RUN chmod a+x /scripts/command.sh
RUN chmod a+x bin/render-build.sh