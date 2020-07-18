FROM ruby:2.5.1

COPY . $HOME/app

WORKDIR $HOME/app

RUN apt update \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt install -y nodejs \
  && npm install -g yarn \
  && yarn install \
  && bundle install \
  && bundle exec rails db:create db:migrate

EXPOSE 3000

CMD [ "bundle", "exec", "rails", "s", "-b", "0.0.0.0"]