FROM ruby:2.6.5
WORKDIR /app
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y \
  nodejs \
  npm \
  yarn
RUN gem install bundler
EXPOSE 3000
CMD ["bundle", "install", "--path", "vendor/bundle", "&&", "bundle", "exec", "rails", "server", "-b", "0.0.0.0"]