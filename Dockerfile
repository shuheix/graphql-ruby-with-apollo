FROM ruby:3.2.2

ENV LANG C.UTF-8
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libpq-dev

ENV APP_ROOT /app
WORKDIR ${APP_ROOT}

COPY Gemfile ${APP_ROOT}/
COPY Gemfile.lock ${APP_ROOT}/

RUN bundle install --jobs 4 --retry 5

COPY . .

EXPOSE 3000

WORKDIR ${APP_ROOT}

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]