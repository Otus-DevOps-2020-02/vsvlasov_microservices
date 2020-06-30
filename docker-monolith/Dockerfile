FROM ubuntu:16.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y mongodb-server ruby-full ruby-dev build-essential git
RUN gem install bundler

# Pull sources
RUN git clone -b monolith https://github.com/express42/reddit.git

# Copy confs and scripts
COPY mongod.conf /etc/mongod.conf
COPY db_config /reddit/db_config
COPY start.sh /start.sh

# Setup requirements and App
RUN cd /reddit && bundle install
RUN chmod 0777 /start.sh

CMD ["/start.sh"]
