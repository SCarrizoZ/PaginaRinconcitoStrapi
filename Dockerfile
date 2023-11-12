FROM node:12.18.3-alpine3.12

ENV PORT 1337
ENV HOST 0.0.0.0
ENV NODE_ENV production

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package*.json /usr/src/app
COPY yarn.lock /usr/src/app/
RUN yarn install

COPY . /usr/src/app/

RUN yarn build
EXPOSE 1377

CMD ["yarn", "start"]