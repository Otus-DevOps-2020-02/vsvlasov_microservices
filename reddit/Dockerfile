FROM ruby:2.4.2-alpine

WORKDIR /app
ADD . .

RUN apk --no-cache add build-base
RUN bundle install
RUN apk del build-base

CMD ["puma"]
