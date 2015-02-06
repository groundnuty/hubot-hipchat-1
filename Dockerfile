# Example built from a couple of sources
FROM dockerfile/nodejs
MAINTAINER Tim Hartmann <tfhartmann@gmail.com>

RUN apt-get update
RUN apt-get -y install wget python-dev g++ make libexpat1-dev libicu-dev redis-server

RUN npm install --global coffee-script hubot@v2.7.5
RUN hubot --create /opt/hubot
WORKDIR /opt/hubot
RUN npm install
RUN npm install --save hubot-hipchat

env   HUBOT_HIPCHAT_JID [asdfID]@chat.hipchat.com
env   HUBOT_HIPCHAT_PASSWORD [your-password]
env   HUBOT_AUTH_ADMIN [your name]

CMD redis-server /etc/redis/redis.conf && bin/hubot --adapter hipchat
