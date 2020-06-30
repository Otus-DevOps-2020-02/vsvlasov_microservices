# Build bundle
FROM alpine:3.12.0 as buildstage

RUN apk --no-cache add ruby=2.7.1-r3 ruby-dev=2.7.1-r3 g++=9.3.0-r2 make=4.3-r0 bash\
 && gem install bundler:1.17.2 --no-document

ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
ENV APP_HOME /app

RUN mkdir $APP_HOME

WORKDIR $APP_HOME
COPY Gemfile* ./
RUN bundle install
COPY . .


# Make run image
FROM ruby:2.7.1-alpine

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY --from=buildstage $APP_HOME $APP_HOME
COPY --from=buildstage /usr/local/bundle/ /usr/local/bundle/

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
