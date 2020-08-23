FROM ruby.2.4.2-alpine

ENV DATABASE_URL mongo:27017

WORKDIR /app
ADD . .

CMD ["puma"]
