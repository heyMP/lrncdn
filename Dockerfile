FROM node:10
# Sane defaults for setting up users
# https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md#global-npm-dependencies
RUN apt-get update
RUN apt-get install vim --yes
RUN apt-get install git --yes

RUN npm i -g yarn
WORKDIR /home/node/html
RUN chown node:node /home/node/html
USER node
# Switch to user and clean up
# Copy just the yarn dependency definitions over
COPY package.json package.json
RUN yarn install
# copy the remainder of the files
COPY . .
USER root
RUN chown -R node:node /home/node/html
USER node