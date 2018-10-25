# ONLY FOR DEVELOPMENT PURPOSES
# dockerfile is not suitable to produce a production-grade docker image
FROM ruby:2.5.1

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential libpq-dev curl

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && apt-get install -qq -y --no-install-recommends nodejs

ENV BUNDLE_PATH /bundle_box
ENV GEM_HOME /bundle_box
ENV PATH /bundle_box/bin:$PATH

COPY . /welevel_ruby_test
WORKDIR /welevel_ruby_test

# RUN bundle install
# ENV RAILS_ENV=development
# ENV PORT=8666
# EXPOSE 8666

