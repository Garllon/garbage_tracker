FROM ruby:2.7.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && \
    apt-get install -y apt-transport-https && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && apt-get update && apt-get install -y yarn && \
    apt-get install -y xfonts-75dpi xfonts-base && \
    wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb && dpkg -i wkhtmltox_0.12.6-1.buster_amd64.deb

WORKDIR /app

ADD Gemfile Gemfile.lock .ruby-version ./

RUN bundle config set frozen true && bundle install --jobs 5 && bundle config set frozen false
COPY . /app

EXPOSE 3000

RUN bin/rake assets:precompile
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
