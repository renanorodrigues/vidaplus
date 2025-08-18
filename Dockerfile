FROM ruby:3.2.0 AS base

ENV INSTALL_PATH /app

RUN apt-get update -qq && apt-get install -y

COPY Gemfile Gemfile.lock ./

RUN bundle install

FROM base

WORKDIR $INSTALL_PATH

COPY . $INSTALL_PATH

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]