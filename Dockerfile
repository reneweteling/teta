# Dockerfile
FROM ruby:3.2-alpine as app

WORKDIR /app
# Bundle in seperate layer
RUN bundle config build.nokogiri --use-system-libraries

RUN apk add --update --no-cache \
    bash \
    build-base \
    gcompat \
    imagemagick \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    tzdata \
    nodejs \
    npm \
    ttf-liberation

RUN gem install bundler:2.4.21
# RUN npm install --global yarn

ARG RAILS_ENV=production
ENV RAILS_ENV=$RAILS_ENV
ENV NODE_ENV=production

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs=4 --retry=3

# Install node packages
# COPY package.json yarn.lock ./
# RUN yarn

# Copy all files
COPY . .

# Go!
EXPOSE 5000
